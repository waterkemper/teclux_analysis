Type: task
Status: resolved
Blocked by: 02, 06, 09, 10, 11, 12, 18

## Question

Qual matriz de comandos, guardas, autorizações e compensações rege cancelar `O/R/F`, reverter `F → R`, liberar reservas/agenda, tratar parcelas/recebimentos e impedir ou encaminhar devoluções, trocas e documentos fiscais existentes?

Separar cancelamento do Contrato de devolução pós-faturamento e definir quando Atendimento automático é consequência, sem apagar histórico.

## Resolution

### Fronteira do domínio

- `DECISÃO NOVA` — são comandos diferentes: `CancelarContrato`, `ReverterFaturamentoContrato` e `IniciarDevolucaoContrato`. Não são variantes técnicas do mesmo F6.
- `DECISÃO NOVA` — somente rascunho sem número e efeitos pode ser descartado. Contrato persistido nunca é apagado: passa a `C` ou recebe compensações, preservando histórico.
- `CONFIRMADO` — o F6 Delphi pergunta, em `F`, entre voltar a Reservado e cancelar; em `O`, `ExclusaoContrato` escolhe cancelar, excluir ou perguntar: `delphi/apps/vendas/fmcadastrocontratos.pas:2111-2218`.
- `DIVERGENTE` — a exclusão física legada (`delphi/apps/vendas/dmcadastrocontratos.pas:5932-5938`) não será migrada, pois apaga cabeçalho, itens e parcelas.

### Matriz de comandos

| Estado | Comando | Resultado | Guardas e consequências |
|---|---|---|---|
| rascunho sem identidade | `DescartarRascunhoContrato` | descarta localmente | somente sem número, reserva, parcela consolidada, agenda ou integração |
| `O` | `CancelarContrato` | `O → C` | `revision`, capability e motivo/descrição conforme política; preserva fotografia |
| `R` | `CancelarContrato` | `R → C` | libera reserva, lotes/séries e agenda não executada; invalida proposta financeira |
| `F` | `ReverterFaturamentoContrato` | `F → R` | sem efeito financeiro realizado, devolução/troca, fiscal autorizado ou logística irreversível; desfaz compromisso e revalida reserva |
| `F` | `CancelarContrato` | `F → C` | mesmas guardas; compensa financeiro/crédito e libera reserva/agenda elegível |
| `C` | cancelar/reverter | sem alteração | resposta idempotente; não reabre implicitamente |
| `P/N` | ação direta | proibida neste recorte | encaminha ao fluxo fiscal/devolução; fica para spec posterior |

- `CONFIRMADO` — o legado admite `O/R/F` e grava `C`, motivo, data, operador e autorizador: `delphi/apps/vendas/dmcadastrocontratos.pas:5899-5960`, `:4373-4383`.
- `CONFIRMADO` — a reversão Delphi muda `F → R`, limpa faturamento e estorna crédito de troca: `delphi/apps/vendas/dmcadastrocontratos.pas:18619-18645`.
- `DECISÃO NOVA` — o servidor bloqueia o agregado, compara `expected_revision` e recalcula guardas na transação. `C` só é gravado após todas as compensações síncronas obrigatórias.

### Financeiro, fiscal e devoluções

- `CONFIRMADO` — o Delphi bloqueia cancelar/reverter `F` quando há quantidade devolvida/trocada, parcela paga/estornada ou simples faturamento: `delphi/apps/vendas/fmcadastrocontratos.pas:2141-2187`, `delphi/apps/vendas/dmcadastrocontratos.pas:4060-4063`, `:14342-14369`, `:18043-18063`.
- `DECISÃO NOVA` — a guarda consulta o razão: recebimento total/parcial, estorno, baixa, conciliação, crédito ou operação pendente impede ação direta e encaminha à Ficha Financeira. Depois da compensação financeira própria, recalcula-se a elegibilidade.
- `CONFIRMADO` — ao cancelar um Contrato `F`, o Delphi encerra intencionalmente todas as parcelas registrando `valorpagto = valorvencto`, `datapagto = data atual`, filial da operação e `tipopagto = 'E'`/`Estornado`: `delphi/apps/vendas/dmcadastrocontratos.pas:4043-4057`, `:4367-4372`. Esse é o estado final esperado no ERP, inclusive para parcelas que ainda não haviam sido recebidas, e deve ser preservado na migração.
- `DECISÃO NOVA` — o Laravel deve reproduzir essa semântica de encerramento das parcelas com operação idempotente e autoria/correlação do cancelamento. Consultas, saldos e relatórios devem interpretar `E/Estornado` como parcela encerrada por estorno, e não como recebimento comum, ainda que `valorpagto` e `datapagto` estejam preenchidos.
- `DECISÃO NOVA` — fiscal autorizado vigente bloqueia. Rejeitado, denegado ou cancelado só libera após concluir compensações; simples faturamento deve ser cancelado no domínio fiscal.
- `CONFIRMADO` — a Ficha Laravel já lê notas/cupons e devoluções em `laravel/backend/app/Infrastructure/Persistence/Legacy/Vendas/LegacyFichaFinanceiraContratoTabsRepository.php:580-648`; serve para explicação/navegação, não para executar compensações.
- `DECISÃO NOVA` — devolução/troca existente bloqueia `F → R` e `F → C` e nunca tem seu histórico apagado.

### Estoque e logística

- `CONFIRMADO` — o Delphi bloqueia estoque e cria movimentos `TPE`, `SQU`, `TRE` por item/filial/lote: `delphi/apps/vendas/dmcadastrocontratos.pas:4065-4360`; queries em `delphi/apps/vendas/dmcadastrocontratos.dfm:13220-13286`.
- `DECISÃO NOVA` — o seam de reserva Laravel cria compensação idempotente ligada ao movimento original e correlation id; códigos legados não viram regra de UI.
- `DECISÃO NOVA` — `R → C` libera toda reserva; `F → C`, somente saldo não consumido; `F → R` mantém e revalida reserva. Divergência exige reconciliação.
- `DECISÃO NOVA` — agenda futura não executada é liberada em `→ C` e mantida em `F → R`. Execução de entrega/retirada/montagem bloqueia e encaminha ao retorno operacional.

### Devolução pós-faturamento

- `DECISÃO NOVA` — `IniciarDevolucaoContrato` não muda a situação: abre componente reutilizável com Contrato, Cliente, documento autorizado e saldo devolvível por item.
- `DECISÃO NOVA` — devolução produz documentos, movimentos e efeitos financeiros próprios, inclusive `notaspag` quando aplicável; troca mantém entrada e nova saída rastreáveis.
- `DECISÃO NOVA` — cancelar fiscal, devolver, trocar e cancelar Contrato são comandos independentes; não há compensação escondida no F6.
- `NÃO LOCALIZADO` — não há no Laravel comando geral de cancelamento/reversão/devolução de Contrato; há somente leitura na Ficha e cancelamento de Orçamento.

### Autorização, motivo e Atendimento

- `CONFIRMADO` — o Delphi usa senha/login, permissão `DevolucaoProduto`, `AutorizacaoCancelarContratoFaturado`, cadastro de motivos e `ObrigarDigitacaoaoExcluir`: `delphi/apps/vendas/fmcadastrocontratos.pas:2223-2281`.
- `DIVERGENTE` — devolução não autoriza implicitamente tudo. Capabilities: `contrato.cancelar_orcado`, `contrato.cancelar_reservado`, `contrato.cancelar_faturado`, `contrato.reverter_faturado`.
- `DECISÃO NOVA` — quando exigido, usar `SensitiveOperationProof` de uso único, vinculado a ação, Contrato, filial e `revision`, registrando operador e autorizador separadamente.
- `CONFIRMADO` — o Delphi coleta motivo/descrição e cria Atendimento quando existe texto: `delphi/apps/vendas/fmcadastrocontratos.pas:2267-2274`, `delphi/apps/vendas/dmcadastrocontratos.pas:5907-5908`.
- `DECISÃO NOVA` — motivo, autoria e snapshot das guardas pertencem ao evento transacional. Atendimento é projeção idempotente pós-commit por outbox/retry; não desfaz cancelamento nem solicita nova senha.

### Contrato de interface e aceitação

- `DECISÃO NOVA` — resposta contém estado/revision, compensações e bloqueios tipados (`financeiro`, `fiscal`, `devolucao_troca`, `estoque`, `logistica`, `autorizacao`) com destino de navegação.
- `DECISÃO NOVA` — em `F`, o modal oferece “Voltar para Reservado” e “Cancelar Contrato”, nunca “Excluir”, resumindo efeitos antes de motivo/autorização.
- `DECISÃO NOVA` — idempotency key impede duplicar movimentos, Atendimento e compensações; conflito de `revision` força atualização.
- `CONFIRMADO` — `CancelarOrcamentoCommand.php:29-83` é precedente estrutural Laravel para transação, motivo, idempotência de estado e `expectedRevision`, não domínio reutilizável diretamente.

Casos mínimos: cancelar `O` preserva histórico; cancelar `R` libera exatamente reserva/agenda; reverter `F → R` mantém e revalida reserva; cancelar `F` registra suas parcelas integralmente como `E/Estornado`, compensa os demais efeitos e somente então grava `C`; recebimento parcial, fiscal, devolução/troca e logística executada bloqueiam com encaminhamento; Atendimento ocorre uma vez; revision/idempotência possuem testes.

## Spec boundary

Esta fatia **deve receber `$to-spec` próprio**, inicialmente limitada a `O/R/F/C`, `CancelarContrato` e `ReverterFaturamentoContrato`, com adapters de estoque, financeiro, agenda, autorização, auditoria e Atendimento.

`IniciarDevolucaoContrato`, troca, cancelamento fiscal e `P/N` recebem specs posteriores. O primeiro spec apenas reconhece essas ocorrências como guardas tipadas e oferece encaminhamento.
