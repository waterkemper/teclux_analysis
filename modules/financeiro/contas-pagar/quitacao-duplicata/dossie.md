# Dossiê — Quitação e Estorno do Pagamento de Duplicata

## 1. Autoridade e objetivo

Este documento é a fonte canônica focada na Quitação da Duplicata dentro do Documento a Pagar. Consolida o Delphi alcançável, o Laravel revalidado em 2026-07-21 e as decisões do Wayfinder de imutabilidade pós-pagamento.

Vocabulário obrigatório:

- **Autorização de Pagamento**: evidência contextual de que uma Duplicata pode ser submetida à Quitação;
- **Quitação**: fato financeiro confirmado somente após commit e reconciliação de todos os efeitos;
- **Estorno do Pagamento**: transição que desfaz integral e atomicamente a Quitação e retorna a Duplicata a autorizada e não paga;
- **Exclusão**: remoção cadastral, nunca sinônimo de Estorno.

“Cancelamento da Quitação” é nome legado. Não existe operação de domínio para refazer/reconstruir pagamento. Reparação histórica é fluxo operacional de reconciliação, não ação sobre a Duplicata paga.

## 2. Baseline Laravel a preservar

O Laravel já contém commands de autorização, pagamento e cancelamento, FormRequests/rotas/controller, `ContasPagarFinancialRevision`, `ContasPagarIdempotencyGuard`, locks, repositories, Writer bancário origem `P`, adapter contábil, sincronização tributária, reconciliador, parâmetros, proof, Filiais, UI React, lote/retorno e testes.

O trabalho é aprofundar os componentes atuais, não criar módulo paralelo. Preservar especialmente:

- `Cadastro.tsx`, `DuplicatasGrid`, `DuplicataDialog`, lookups e calculadora;
- `DocumentosPagarController`, `DocumentoPagCadastroPageService` e `DocumentoPagPolicy`;
- `LegacyDocumentoPagRepository`, `LegacyDuplicataRepository` e repositories tributários/bancários;
- `ContasPagarMovimentoBancarioWriter`, `ContasPagarAccountingAdapter` e reconciliador;
- infraestrutura de Sensitive Operation, `ParameterService` e `UserBranchAccessService`.

Lacunas atuais relevantes:

- a UI ainda oferece alteração parcial de Duplicata paga e o backend a rejeita tardiamente;
- Cancel limpa campos incompletos e grava `autorizado=false`;
- Pay não persiste o vínculo completo `sequencia/evento/sequenciaevento` retornado pelo banco;
- a exclusão de evento usa heurística de “mais recente” e ausência de vínculo pode ser ignorada;
- a recomposição do cabeçalho agregado é incompleta;
- a Contabilidade permanece adapter de bloqueio quando habilitada;
- Auditoria financeira ainda se apoia em log técnico;
- testes PostgreSQL de cancelamento/agregação estão ignorados;
- rota, Request, command, ability e prova de reconstrução privilegiada ainda existem e devem ser removidos.

## 3. Situações e invariantes

Situações observáveis: `OPEN`, `AUTHORIZED` e `PAID`.

- `PAID` somente existe depois da Quitação atômica e reconciliada.
- A única transição permitida a partir de `PAID` é `Estorno do Pagamento -> AUTHORIZED`.
- Duplicata paga não pode ser alterada, excluída, autorizada, paga novamente, substituída por geração de parcelas ou reconstruída, mesmo por administrador/suporte.
- Alterações do Documento que mudem identidade ou significado econômico da Duplicata paga também são bloqueadas.
- Outras Duplicatas abertas do Documento podem ser mantidas quando independentes e o agregado continuar reconciliado.

## 4. Quitação prospectiva necessária ao Estorno

Toda nova Quitação deve persistir, na mesma transação:

- `payment_id`/manifesto ou fotografia equivalente dos efeitos;
- conta, data, `sequencia`, Evento e `sequenciaevento` exatos;
- fotografia reversível de alterações de pagamento parcial/residual;
- Operador, Autorizador, Filiais, revisão, idempotência e Auditoria;
- efeitos bancários, contábeis e tributários aplicáveis.

`movtosbancos.documento` recebe `duplicatas.chequepagto`; sem cheque fica vazio. Nunca recebe `documentopag`.

Histórico individual: `[NF|DOC][ complemento] DUP {documentopag}/{numero} - {Parte Fornecedora}`. Exemplo: `DOC DUP 209120/1 - ANDRA UNIFORMES`. Cabeçalho/evento individual usam esse texto; agregado usa `PAGTO DIVERSAS DUPLICATAS` e Evento nulo no cabeçalho.

Após `parametros_valor('Início Integração Bancos')`, Quitação na data ou depois do início exige Evento e vínculo bancário, exceto modalidade legitimamente sem novo movimento, como Adiantamento. Desconto integral zero não cria Movimento.

## 5. Contrato do Estorno do Pagamento

Entrada:

```text
documentopag, datavencto, numero,
expected_revision, idempotency_key,
prova_autorizacao, origem opcional
```

Pré-condições:

- ability de Estorno, perfil de pagamento e acesso às Filiais envolvidas;
- prova sensível `estornar_pagamento_duplicata` válida;
- Duplicata existente em `PAID` e revisão atual;
- ausência de imposto derivado já quitado e de bloqueio contábil;
- vínculo/manifesto de efeitos completo ou ausência bancária comprovadamente legítima.

Executar em uma única `DB::transaction`, com locks do Documento, Duplicata, cabeçalho/eventos bancários, lote, impostos e Contabilidade envolvidos. Validar tudo antes da primeira mutação destrutiva.

Campos a limpar:

- `datapagto`, `valorpagto` para o vazio canônico do schema;
- `filialpagto`, `tipopagamento`, `contapagto`, `chequepagto`, `contacredito`;
- `evento`, `sequencia`, `sequenciaevento`, `nrlotecontabil`;
- `datapagtoaux`, `contapagtoaux`, `chequepagtoaux`;
- Usuário de pagamento quando `usuario` representar quem quitou.

Preservar identidade e dados originais da obrigação não transformados pela Quitação, complemento, observação e banco de cobrança. Restaurar alterações de parcial/residual por fotografia confiável. Sem fotografia inequívoca, bloquear para reconciliação manual.

Resultado: `autorizado=true`, preservando Autorizador e evidência/data da Autorização de Pagamento original. A prova do Estorno é registrada separadamente na Auditoria.

## 6. Bancos e agregados

- Localizar cabeçalho por `(conta, datapagto, sequencia)` e evento por `(conta, datapagto, sequencia, evento, sequenciaevento)`, com origem `P`.
- Movimento exclusivo: excluir eventos e cabeçalho.
- Agregado: excluir somente o evento exato e recalcular pelo conjunto restante.
- Sem eventos restantes: excluir cabeçalho.
- Um evento restante: restaurar documento, observação e Evento individuais.
- Vários eventos: manter cabeçalho agregado e soma reconciliada.
- Nunca escolher primeiro/último evento, procurar apenas por valor ou confiar somente em subtração aritmética.

Vínculo obrigatório ausente, ambíguo, divergente, de origem diferente ou reivindicado por outro pagamento retorna `409` e rollback integral.

## 7. Contabilidade, impostos, lote e reconciliação

- Contabilidade desativada no contexto da Quitação não gera reversão.
- Contabilidade ativa exige adapter capaz de excluir/recompor exatamente os lançamentos; adapter indisponível bloqueia.
- Imposto derivado já quitado impede o Estorno; demais efeitos tributários são revertidos/sincronizados na mesma transação.
- Remover associações de lote e chaves auxiliares da Duplicata, recompondo o agregado.
- Antes do commit, reconciliar situação/campos da Duplicata, soma de eventos/cabeçalho, Contabilidade, impostos, lote e ausência de chaves órfãs.

## 8. Interface Laravel alvo

Renomear/aprofundar a superfície existente:

```text
ReverseDuplicataPaymentCommand
ReverseDuplicataPaymentRequest
DocumentoPagPolicy::reversePayment
ContasPagarDocumentosPagarAuthorizationService::canReversePayment
DocumentosPagarController::estornarPagamentoDuplicata
POST .../duplicatas/estornar-pagamento
route: contas_pagar.documentos_pagar.duplicatas.estornar_pagamento
proof: estornar_pagamento_duplicata
```

Remover integralmente command, Request, rota, controller, ability, configuração sensível, props UI, documentação e testes que ofereçam reconstrução privilegiada do pagamento. Não manter alias, flag ou endpoint administrativo.

## 9. UI

Na Duplicata `PAID`:

- desabilitar Alterar, duplo clique, Excluir, Pagar, edição inline e geração que substitua a linha;
- exibir somente **Estornar pagamento** quando `can.reversePayment`;
- sem ability, exibir somente consulta;
- `Ctrl+P` pode pagar uma aberta e estornar uma paga, respeitando a ability;
- em `409`, não alterar a tela e orientar recarga ou reconciliação manual;
- histórico bloqueado mostra “Estorno indisponível: vínculo do pagamento requer reconciliação”.

## 10. Concorrência, idempotência e Auditoria

- `expected_revision` protege o agregado; locks impedem corrida.
- Mesma ação/origem/chave/hash retorna replay; chave igual com payload diferente retorna `409`.
- Nova chave após Estorno retorna `409` “Duplicata não está paga”.
- Falha em qualquer writer, Auditoria ou reconciliação provoca rollback.
- Auditoria persistente registra before/after, efeitos, Operador, Autorizador, Filiais, request id, idempotência, revisão e instante; nunca segredo/proof bruto.

## 11. Histórico e implantação

Executar preflight somente leitura, classificando pagas em: vínculo exato; ausência legítima; ausente; ambíguo/divergente; parcial sem fotografia; bloqueio tributário/contábil.

- Novas Quitações passam primeiro a persistir vínculo/fotografia completos.
- Históricos exatos ou legitimamente sem banco podem ser estornados.
- Demais registros permanecem pagos, legíveis e bloqueados para reconciliação manual.
- Não executar backfill heurístico, não apagar Movimento durante deploy e não transformar reparo em ação da Duplicata.

## 12. Testes e aceite

Exigir Unit, Feature, React e PostgreSQL real para:

- imutabilidade de `PAID` em todas as mutações;
- ability, Filiais e proof;
- limpeza completa e resultado `AUTHORIZED`;
- exclusivo, agregado múltiplo, transições para um/zero evento e `sequenciaevento` exata;
- Adiantamento, integração inativa e desconto integral;
- vínculo ausente/ambíguo/divergente com rollback;
- Contabilidade, impostos, lote e parcial/residual;
- revisão, concorrência, idempotência e replay;
- Auditoria persistente sem duplicação;
- ausência total da superfície de reconstrução privilegiada.

O placeholder PostgreSQL ignorado deve virar fixture executável. Aceite exige nenhum efeito parcial, nenhum sucesso antes do commit/reload, nenhum fato financeiro vindo do browser, nenhuma correção silenciosa e nenhuma operação pós-pagamento além do Estorno.

## 13. Fora do escopo

- alterar Delphi;
- migrar integralmente telas de lote/retorno;
- corrigir silenciosamente histórico;
- usar CRUD bancário origem `B`, `MAX+1` desprotegido, Filial global ou transação aguardando Usuário;
- criar implementação paralela aos componentes Laravel existentes.
