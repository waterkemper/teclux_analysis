# Pesquisa — baseline Laravel para Estorno de Pagamento em Lote

## Síntese

O Laravel já contém os mecanismos financeiros de baixo nível necessários, mas não o caso de uso de Estorno em Lote. O caminho é orquestrar, em uma única transação, os seams existentes de lock, desfazimento por manifesto, remoção exata de evento bancário, recomposição do cabeçalho, Contabilidade, tributos, auditoria e reconciliação. Não se deve criar outro writer bancário nem chamar commands individuais em loop.

A reconstrução parcial de `SINGLE_CHECK` já existe: remove o evento identificado por `{conta,data,sequencia,evento,sequenciaevento}`; sem eventos restantes, exclui o cabeçalho; caso contrário, recalcula-o pela soma dos eventos restantes. O teste PostgreSQL destinado a provar isso está incompleto.

## Estorno individual

- `CancelDuplicataPaymentCommand::execute()` abre uma `DB::transaction`, reserva idempotência, chama `applyInsideTransaction()` e conclui a idempotência na mesma transação (`laravel/backend/app/Application/ContasPagar/CancelDuplicataPaymentCommand.php:58-103`).
- A intenção inclui identidade, revisão esperada, `payment_id` opcional, motivo, escopo e chave de idempotência; motivo e escopo entram no hash (`CancelDuplicataPaymentCommand.php:65-85`).
- O motivo é obrigatório, com 3–500 caracteres. O Request ainda usa “cancelamento” e exige `CURRENT_PAYMENT|SHARED_BANK_GROUP` (`laravel/backend/app/Http/Requests/ContasPagar/CancelDuplicataPaymentRequest.php:30-47`).
- O command bloqueia Documento/Duplicata, verifica Filial e estado pago, localiza manifesto aplicado ou adota pagamento órfão, valida identidade e OCC (`CancelDuplicataPaymentCommand.php:254-332`). Pagamento órfão adotado recebe manifesto com `reason=adopt_orphan_for_estorno` (`CancelDuplicataPaymentCommand.php:465-576`).
- A prova atual usa `ContasPagar/cancelar_pagamento_duplicata`; Operador e Autorizador são auditados separadamente (`CancelDuplicataPaymentCommand.php:335-390`). Isso precisa ser reconciliado com a decisão de que quem quita também desquita, sem inventar uma permissão funcional adicional.
- O undo preserva `autorizado`, limpa fatos de pagamento/vínculo, reverte Contabilidade e sincroniza impostos (`CancelDuplicataPaymentCommand.php:140-225`). Bloqueios por período/tributo já existem (`CancelDuplicataPaymentCommand.php:425-463`).
- O retorno fixa `effects.accounting=false` mesmo depois de chamar o adapter (`CancelDuplicataPaymentCommand.php:402-417`), resultado insuficientemente expressivo para um manifesto batch.

## Manifestos e Quitação em Lote

- `ContasPagarPaymentManifestRepository` persiste `payment_id`, `batch_payment_id`, identidade, idempotência, `effects_json`, auditoria, motivo e escopo (`laravel/backend/app/Application/ContasPagar/ContasPagarPaymentManifestRepository.php:25-61`) e busca por pagamento/parcela (`:64-92`).
- O Estorno usa `markCancelled()` (`:94-103`), divergindo do termo canônico `reversed`; ainda existe `markRebuilt()` (`:106-118`) e `RebuildDuplicataPaymentRequest.php`, resíduos que não devem ser propagados.
- `ConfirmBatchPaymentCommand` valida preview/hash/idempotência/proof, executa uma transação única, ordena e bloqueia itens, aplica N planos pelo `ContasPagarPaymentEngine`, reconcilia e só despacha impressão após commit (`laravel/backend/app/Application/ContasPagar/ConfirmBatchPaymentCommand.php:59-267,293-435,665-738`).
- Em `SINGLE_CHECK`, cria um cabeçalho comum e N eventos e grava em cada efeito o link exato (`ConfirmBatchPaymentCommand.php:448-600`). Depois grava envelope batch e manifesto por item correlacionados pelo mesmo `batch_payment_id` (`:686-771`). Isso permite estornar uma seleção parcial por manifestos individuais, preservando a correlação original.
- O adapter legado já proíbe loop unitário: `execute()` falha e `confirm()` delega ao command atômico (`laravel/backend/app/Application/ContasPagar/PayDuplicatasBatchAdapter.php:10-50`).
- O motor de pagamento separa `preflight()` e `apply()` (`laravel/backend/app/Application/ContasPagar/ContasPagarPaymentEngine.php:50-307`). Não há equivalente de reversão: `undoFromManifest()`/`applyInsideTransaction()` misturam validação, prova, efeitos, status e auditoria e são seams a aprofundar, não copiar.

## Movimento bancário compartilhado

- `ContasPagarMovimentoBancarioWriter::estornar()` exige link completo e delega a remoção exata (`laravel/backend/app/Application/ContasPagar/ContasPagarMovimentoBancarioWriter.php:350-397`).
- `LegacyContasPagarMovtosBancosRepository::estornarEventoExato()` serializa Conta/Data, remove o evento exato, exclui cabeçalho vazio ou o recompõe pela soma persistida dos eventos restantes (`laravel/backend/app/Infrastructure/Persistence/Legacy/ContasPagar/LegacyContasPagarMovtosBancosRepository.php:277-333`). Esta é exatamente a reconstrução parcial decidida.
- O undo limpa primeiro a FK na Duplicata e depois exclui o evento, dentro da transação (`CancelDuplicataPaymentCommand.php:186-213`).
- Ambos os scopes aceitos executam o undo de somente uma Duplicata/evento (`CancelDuplicataPaymentCommand.php:201-212`); `SHARED_BANK_GROUP` sugere uma abrangência que a implementação não tem.
- `valorMagnitude` é recebido por `estornarEventoExato()` mas não usado (`LegacyContasPagarMovtosBancosRepository.php:282-289`); a recomposição corretamente usa os eventos restantes (`:312-331`).

## Lacunas e divergências

1. Não há command, preview, endpoint, read model, página, idempotência ou envelope de Estorno em Lote. A única rota é individual e se chama `duplicatas/cancelar-pagamento` (`laravel/backend/routes/web.php:2984`).
2. Não há preflight de N itens antes do primeiro write, nem reconciliador que prove N transições `PAID -> AUTHORIZED`, N manifestos reversed, banco, Contabilidade, tributos e ausência de efeitos fora da seleção.
3. Não há prova PostgreSQL executável: `QuitacaoEmLoteEstornoPostgresTest` termina em `markTestIncomplete()` (`laravel/backend/tests/Feature/ContasPagar/QuitacaoEmLoteEstornoPostgresTest.php:13-36`). O unitário de manifesto só caracteriza shape/erro (`laravel/backend/tests/Unit/ContasPagar/CancelDuplicataPaymentManifestTest.php:12-48`).
4. Faltam casos de estorno parcial/último evento de `SINGLE_CHECK`, vários itens do mesmo cabeçalho, mistura `NONE`/`SINGLE_CHECK`, rollback no enésimo item e concorrência.
5. Persistem Cancel/Cancelled/Rebuild, divergindo de Estorno/Reversed e ADR-0255 (`laravel/docs/adr/0255-duplicata-paga-imutavel-estorno-unico.md:12-20`).
6. A ação sensível atual é distinta; a nova spec deve explicitar a mesma autorização funcional de Quitação, como decidido.

## Seams recomendados

- Preservar o manifesto individual e `batch_payment_id` como correlação; selecionar itens não implica estornar todo o lote original.
- Extrair um núcleo reversível interno `preflight(manifest, lockedContext)` + `apply(reversePlan, sharedTransactionContext)`, usado pelo command individual e pelo novo batch.
- Preservar `ContasPagarMovimentoBancarioWriter::estornar()`/`estornarEventoExato()` como mecanismo único de reconstrução.
- Espelhar `ConfirmBatchPaymentCommand`: preview/hash, locks canônicos, preflight completo, uma transação, idempotência batch, N applies, reconciliação, envelope/itens e auditoria.
- Para cabeçalhos compartilhados, ordenar/serializar por `{conta,data,sequencia}` e remover eventos exatos; a recomposição existente resolve estados intermediários e o último evento.
- Persistir motivo comum obrigatório no envelope e em cada manifesto/auditoria; preservar autorização e identidade.

## Conclusão

A arquitetura necessária é uma nova orquestração batch sobre manifestos por item e undo bancário exato existentes. A dívida principal é aprofundar o Estorno individual em núcleo compartilhável e adicionar preflight, reconciliação, idempotência e testes reais de conjunto. A reconstrução parcial do movimento compartilhado já é baseline a preservar.
