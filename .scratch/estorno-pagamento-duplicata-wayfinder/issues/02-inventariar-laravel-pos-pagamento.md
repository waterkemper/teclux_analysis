# Inventariar o pós-pagamento no Laravel atual

Type: task
Status: resolved
Blocked by:

## Answer

### Superfície HTTP, autorização e prova

- `CONFIRMADO` — Existem rotas POST para `cancelar-pagamento` e `refazer-pagamento`, ligadas a `CancelDuplicataPaymentCommand` e `RebuildDuplicataPaymentCommand` (`routes/web.php:2712-2715`; `DocumentosPagarController.php:458-480`).
- `CONFIRMADO` — Cancelar exige `cancelPayment` (módulo + perfil legado de pagamento). Refazer exige `forceRebuildPayment`, concedida a `administrador`. Ambos exigem revisão, idempotência e prova sensível própria.
- `DIVERGENTE` — Rota, Request, ability, prova, Command e documentação de Refazer continuam ativos. A nova regra exige retirar essa operação inclusive de administrador/suporte.

### Cancelamento atual

- `CONFIRMADO` — Usa `DB::transaction`, locks de Documento/Duplicata, Filial, estado pago, revisão otimista, idempotência com replay e log estruturado.
- `CONFIRMADO` — Limpa `datapagto`, `valorpagto`, `tipopagamento`, `contapagto`, `chequepagto`, `filialpagto`, `sequencia` e `evento`; define `autorizado = false`.
- `DIVERGENTE` — Não limpa explicitamente `contacredito`, `sequenciaevento`, `nrlotecontabil`, `dataautorizacaopagto`, `datapagtoaux`, `contapagtoaux` e `chequepagtoaux`. Retorna a Duplicata a não autorizada, enquanto o Delphi retorna a autorizada e não paga.
- `CONFIRMADO` — Banco só é reduzido com conta, sequência e valor positivo; o Writer pula se a integração estiver inativa. Depois tenta Contabilidade, sincroniza impostos e recalcula a revisão.
- `POSSÍVEL BUG` — Se o cabeçalho bancário não existir, o Writer retorna silenciosamente; a Duplicata pode ser desquitada sem comprovar a eliminação dos movimentos.
- `POSSÍVEL BUG` — O evento é escolhido por `(conta,data,sequencia,evento)` usando o maior `sequenciaevento`; a sequência de evento da Duplicata não é fornecida. Em agregado pode atingir o evento errado.
- `DIVERGENTE` — Ao restar saldo agregado, reduz o valor, mas não recompõe observação/evento do cabeçalho quando deixa de ser múltiplo.
- `CONFIRMADO` — A Contabilidade é um adapter de bloqueio: pula quando desativada e falha quando `GERARCONTABILIDADE` está ativo. Não há reversão contábil efetiva implementada.
- `DÚVIDA` — Impostos são sincronizados, mas não foi localizada no Command a guarda explícita equivalente a `PagamentosVinculados` do Delphi.

### Refazer Pagamento

- `CONFIRMADO` — Mantém a Duplicata paga e recria banco/Contabilidade com transação, lock, revisão, idempotência, Filial e prova. Usa observação `Refazer pagto doc ... parc ...`.
- `DIVERGENTE` — Pode criar/agregar movimento sem provar antes que o anterior está ausente. A cobertura PostgreSQL de Cancel/Rebuild está toda marcada como `skipped`.
- `CONFIRMADO` — Não há ação visual de Refazer localizada no React, mas a rota backend permanece invocável por administrador.

### Cadastro e UI após pagamento

- `CONFIRMADO` — Parcela paga bloqueia **Excluir** e **Pagar**, mas não **Alterar**, duplo clique, complemento ou observação (`DuplicatasGrid.tsx:103,127-166,244-266`).
- `DIVERGENTE` — O diálogo bloqueia vencimento, valores, encargos, banco e pagamento, porém deixa `complemento`, `datareferencia` e `observacao` editáveis (`DuplicataDialog.tsx:272-275` e campos seguintes).
- `CONFIRMADO` — Cancelar não tem botão visível: `Ctrl+P` sobre a parcela paga abre a prova sensível. A UI não usa diretamente `permissions.cancelPayment`; o backend é a barreira autoritativa (`Cadastro.tsx:623-682,789-824`).
- `CONFIRMADO` — O repositório considera paga/autorizada uma linha protegida e recusa colisão no update genérico. Assim, a edição oferecida pela UI tende a falhar ao salvar; é inconsistência de UX, não permissão real (`LegacyDuplicataRepository.php:147-216`).
- `CONFIRMADO` — Excluir o Documento com parcela quitada é recusado, mas o readonly do cabeçalho não usa pagamento comum como bloqueio geral. A regra de operação única não está uniforme entre UI, Request e serviço.

### Cobertura e direção extraída

- `CONFIRMADO` — Há teste de 403 sem perfil e de ability administrativa para Refazer. Não há cobertura efetiva localizada para limpeza completa, evento exato, vínculo ausente/ambíguo, autorização resultante, impostos, Contabilidade, efeitos agrupados ou imutabilidade pós-pagamento.
- `OPORTUNIDADE` — Preservar locks, Filiais, proof, revisão, idempotência, transação, Writer/repositories e reconciliação; transformar Cancelar em **Estorno do Pagamento**, remover Refazer ponta a ponta, impor imutabilidade em UI/backend e falhar antes de limpar a Duplicata quando um efeito obrigatório não puder ser identificado/revertido.

## Question

Quais edições, ações, rotas, commands, abilities e efeitos o Laravel atual oferece para Duplicata paga, como Cancel e Rebuild funcionam hoje e onde o cadastro/UI ainda permite alterações incompatíveis com a regra de única operação de Estorno do Pagamento?
