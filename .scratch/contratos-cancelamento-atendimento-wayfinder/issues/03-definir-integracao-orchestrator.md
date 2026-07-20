# Definir a integração no CancelamentoContratosLoteOrchestrator

Type: grilling
Status: resolved
Blocked by: 01-consolidar-mecanica-atendimento-cancelamento, 02-definir-contrato-atendimento-cancelamento-lote

## Question

Como a criação/atualização do Atendimento se encaixa na transação e no resultado por item já decididos no mapa `contratos-cancelamento-lote-wayfinder`: mesma transação do Cancelamento ou compensação separada; idempotência por item e por Cliente; o que acontece se a criação/atualização do Atendimento falhar depois do Cancelamento já persistido; como isso aparece no resultado tipado por item?

## Answer

### Correção de escopo/localização (achado nesta sessão)

- `CORREÇÃO` — o título do ticket presumia a integração em `CancelamentoContratosLoteOrchestrator`, mas a criação de Atendimento **já existe hoje** dentro de `App\Application\Vendas\Contratos\CancelarContratoCommand::insertAtendimentoCancelamento` (`laravel/backend/app/Application/Vendas/Contratos/CancelarContratoCommand.php:344-384`), chamada de dentro do próprio `execute()` de `CancelarContratoCommand`, **dentro** do `DB::transaction` que também grava `markCancelado`, movimentos de estoque e estorno de crédito (linhas 196-251). O Orchestrator (`CancelamentoContratosLoteOrchestrator::cancelarLote`) só itera os itens e delega a `CancelarContratoPort::execute()` — não é o lugar certo para esta integração, que já está uma camada abaixo.
- `CONFIRMADO` — `CancelarContratoCommand` já implementa as guardas financeira/fiscal que faltavam no Delphi legado (`hasParcelaComPagamentoReal`, `hasDevolucaoOuTroca`, linhas 147-166) — é de fato o comando `CancelarContrato` do ticket 21, já ativo, não um stub (`CancelarContratoPrerequisiteMissing` existe como binding alternativo para ambientes sem essa dependência pronta, mas não é o que está em uso aqui).

### Transação

- `DECISÃO NOVA` — manter a criação/atualização do Atendimento na **mesma transação** do Cancelamento (comportamento atual), divergindo conscientemente da decisão do ticket 21 do `cadastro-contratos-wayfinder` ("Atendimento é projeção idempotente pós-commit por outbox/retry"). Justificativa: aquela decisão foi pensada para o F6 inline do Cadastro completo; aqui a operação de Atendimento é um `insert`/`update` local simples, sem chamada externa — o risco de falha isolada é baixo e construir outbox/retry só para esta fatia é desproporcional. Um Cancelamento nunca deve existir sem o Atendimento correspondente quando `ObrigarDigitacaoaoExcluir` exige — e isso só é garantido com a mesma transação.

### Idempotência

- `CONFIRMADO` — a idempotência por item já é coberta pela checagem de Situação existente: um Contrato já `Cancelado` retorna `status: 'ja_cancelado'` **antes** de entrar na transação (linhas 74-83), então `insertAtendimentoCancelamento` nunca roda duas vezes para o mesmo Contrato por chamadas repetidas — não precisa de mecanismo de idempotência adicional específico para o Atendimento.

### Backfill

- `DECISÃO NOVA` — nenhuma correção retroativa dos Atendimentos já criados com o comportamento antigo (`tipo='C'`, sempre novos, sem Motivo) — só corrigir o comportamento daqui para frente. Registros antigos continuam válidos como histórico, só com classificação diferente da que passa a ser usada.

### Resultado por item

- `DECISÃO NOVA` — `ContratoLoteItemResult` não precisa expor se o Atendimento foi criado, reaproveitado ou não se aplicava — fica como efeito interno da transação, sem novo campo na resposta.
