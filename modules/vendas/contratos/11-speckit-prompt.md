# Prompt para /speckit.specify

```text
/speckit.specify

Crie uma especificação funcional e técnica detalhada para cancelar (`O/R/F → C`) e reverter faturamento (`F → R`) do Contrato dentro do Cadastro — Etapa 6 (Operações sensíveis), primeiro dos dois specs dessa etapa, construído sobre a Fundação (`01-speckit-prompt.md`), a reserva (`05-speckit-prompt.md`), `FaturarContrato` (`09-speckit-prompt.md`) e o razão financeiro (`04-speckit-prompt.md`/`10-speckit-prompt.md`).

**Este spec não parte do zero.** Existe hoje um comando canônico `App\Application\Vendas\Contratos\CancelarContratoCommand` (implementa `CancelarContratoPort`), com o próprio docblock declarando "Consumido pelo lote e **futuro Cadastro**" — mas ele só está conectado à tela separada de Cancelamento em Lote (`/cadastros/vendas/cancelamento-contratos`), nunca ao Cadastro de Contratos. Em paralelo, o Cadastro de Contratos já tem um caminho **parcial e divergente** para `O/R → C` (`ExecuteContratoEstoqueReservaCommand::releaseAll`, via `TRANSITION_O_OR_R_TO_C`), que só libera reserva e grava `situacao='C'` — sem motivo, sem Atendimento, sem prova sensível, sem guarda financeira/fiscal, e sem cobrir `F → C` de forma alguma. A tarefa central desta fatia é **reconciliar essas duas implementações**, não inventar uma terceira. Decida explicitamente, com evidência, qual vira a autoridade única.

Não implemente nesta etapa: `IniciarDevolucaoContrato`, troca, cancelamento de documento fiscal e qualquer transição envolvendo `P/N` — reconheça-os apenas como guardas tipadas com encaminhamento, sem implementar o fluxo. Não implemente Desmembrar Contrato (`12-speckit-prompt.md`, spec seguinte desta etapa). Você não possui acesso ao código Delphi. Considere a seção `Evidência Delphi confirmada` deste prompt como o pacote funcional legado autoritativo — trate-a como contrato de aceitação. Inspecione o checkout Laravel para confirmar o estado real, especialmente as duas implementações de cancelamento já existentes; corrija hipóteses contrariadas por evidência concreta e cite arquivo/trecho. Classifique descobertas Laravel como CONFIRMADO, INFERIDO, DÚVIDA, NÃO LOCALIZADO ou DIVERGENTE; preserve as classificações POSSÍVEL BUG LEGADO e DECISÃO NOVA já fornecidas.

## Limite desta entrega

Inclua:

- **reconciliação documentada** das duas implementações de cancelamento: decida se o Cadastro passa a usar `CancelarContratoCommand` como autoridade única (substituindo `releaseAll`/`TRANSITION_O_OR_R_TO_C` no caminho do Cadastro), mantendo o Cancelamento em Lote como consumidor do mesmo comando — ou, se inviável nesta fatia, documente por que dois caminhos persistem e o plano para convergir. Reconcilie também os dois mecanismos de movimento de estoque em jogo (`LegacyCancelamentoContratosRepository::planMovimentosLinha`, próprio do comando canônico, versus `StockKey`/`LegacyContratoEstoqueRepository`, próprio da reserva do spec 5) — decida qual é a autoridade para o movimento de liberação;
- **completar `CancelarContrato` para `F → C`** no caminho do Cadastro: guarda fiscal (documento fiscal autorizado vigente bloqueia — hoje ausente em `LegacyContratoCancelamentoRepository`, que só verifica parcela paga e devolução/troca) e guarda de agenda/logística (agenda futura não executada é liberada, execução em andamento bloqueia — hoje inexistente, specs 7/8 ainda não implementados);
- **implementar `ReverterFaturamentoContrato` (`F → R`) de fato**: hoje `ContratoTransitionGraph::isImplemented('F','R')` é `true`, mas a guarda real (`ContratoFaturamentoFiscalGuardPort`) está fixada em `DenyByDefaultContratoFaturamentoFiscalGuard`, que **sempre nega**. Substitua por uma guarda real (reaproveitando os mesmos predicados de `LegacyContratoCancelamentoRepository` mais a guarda fiscal nova) e adicione a **reversão financeira** que falta — hoje `compensateFaturadoToReservado` só cobre estoque; parcelas e crédito de troca aplicados em `F` precisam ser desfeitos, não apenas "estornados" como no cancelamento;
- **capabilities finas por transição** (`contrato.cancelar_orcado`, `contrato.cancelar_reservado`, `contrato.cancelar_faturado`, `contrato.reverter_faturado`), substituindo a checagem genérica `canUpdate` hoje usada por `DescribeContratoTransitionsCommand::invoke` para todas as transições;
- o comando **F6** do Cadastro (`ContratoCadastroCapabilityResolver::commands.f6`, hoje `available: false, reason: 'not_implemented'`): em `F`, oferece "Voltar para Reservado" e "Cancelar Contrato" — nunca "Excluir"; em `O/R`, oferece cancelar (e excluir, quando o parâmetro permitir, delegando a `ExcluirContratoOrcadoCommand` já existente) — sempre com resumo de efeitos antes de motivo/autorização;
- **reconhecimento tipado** (sem implementar o fluxo) de devolução/troca existente, documento fiscal autorizado, financeiro pendente e logística em execução como bloqueios com destino de navegação — reaproveitando a forma já modelada em `ContratoLoteItemResult` (`status`/`blockers`), decidindo se o padrão de "um status por falha" atual é suficiente ou se `blockers` precisa acumular múltiplos bloqueios simultâneos;
- confirmação de que a criação de Atendimento (já implementada em `CancelarContratoCommand`) continua idempotente e pós-commit ao ser integrada ao Cadastro — sem duplicar Atendimento quando a mesma operação for reexecutada.

Não inclua: `IniciarDevolucaoContrato`, troca e cancelamento de documento fiscal — apenas reconhecidos como bloqueios tipados; qualquer transição envolvendo `P/N`; Desmembrar Contrato (spec 12); reabrir ou redesenhar `ExcluirContratoOrcadoCommand`/a tela de Cancelamento em Lote além do necessário para reconciliar a autoridade de cancelamento; execução real de agenda/logística (specs 7/8, ainda não implementados — este spec apenas reconhece o bloqueio quando existir execução).

## Fronteira de acesso às fontes

- Não tente localizar, abrir ou solicitar arquivos PAS, DFM ou data modules Delphi.
- As evidências abaixo já foram extraídas no workspace de análise a partir de `fmcadastrocontratos.pas/.dfm` e `dmcadastrocontratos.pas/.dfm`.
- Use-as como requisitos legados de entrada, preservando classificações, sem exigir reconfirmação no código Delphi.
- Inspecione o checkout Laravel para confirmar o estado atual — especialmente as duas implementações de cancelamento já existentes — e construa a matriz de lacunas.

## Investigação Laravel obrigatória

- `App\Application\Vendas\Contratos\CancelarContratoCommand` (implementa `CancelarContratoPort`) — comando canônico **já pronto** para `O/R/F → C`: valida situação/`revision`/motivo/descrição, bloqueia `F` com `hasParcelaComPagamentoReal`/`hasDevolucaoOuTroca` (`LegacyContratoCancelamentoRepository`), exige prova sensível (`CancelamentoContratosSensitiveOperationGate`), gera movimentos de estoque via `LegacyCancelamentoContratosRepository::planMovimentosLinha`/`insertMovimentosCancelamento`, estorna crédito de troca (`LegacySaldoCreditoClienteRepository`), encerra parcelas em `F` (`estornarParcelas`), grava `C` (`markCancelado`) e cria Atendimento idempotente (`insertAtendimentoCancelamento`, reaproveitando atendimento existente quando aplicável). Hoje só é chamado por `CancelamentoContratosLoteOrchestrator`, nunca pelo Cadastro.
- `App\Application\Vendas\Contratos\Cadastro\Commands\ExecuteContratoEstoqueReservaCommand::releaseAll` (transição `TRANSITION_O_OR_R_TO_C`, chamada por `DescribeContratoTransitionsCommand::invoke` para `(O|R)→C`) — caminho **hoje ligado ao Cadastro**, mas parcial: libera reserva e grava `situacao='C'` sem motivo, sem Atendimento, sem prova sensível, sem guarda financeira/fiscal, e não cobre `F → C`. Use os movimentos que ele já gera (`insertMovimento`/`StockKey`) como candidato à autoridade de estoque na reconciliação, comparando com `planMovimentosLinha` do comando canônico.
- `App\Domain\Vendas\Contratos\ContratoTransitionGraph` — confirme o estado exato ao investigar: `isRecognized` já cobre `O→C`, `R→C`, `F→C`, `F→R`; `isImplemented` hoje é `true` só para `O→C`, `R→C`, `F→R` (via `releaseAll`/`compensateFaturadoToReservado`) — `F→C` está reconhecida mas **não implementada**. `F→R` está marcada implementada, mas sua guarda real sempre nega (ver abaixo) — trate isso como uma implementação incompleta, não como pronta.
- `App\Application\Vendas\Contratos\Cadastro\Ports\ContratoFaturamentoFiscalGuardPort` / `App\Infrastructure\Persistence\Legacy\Vendas\DenyByDefaultContratoFaturamentoFiscalGuard` — a guarda de `F → R` está **hard-coded para negar sempre** (`return false` incondicional). `ReverterFaturamentoContrato` só se torna operacional de fato quando este spec substituir essa implementação por uma real.
- `App\Application\Vendas\Contratos\Cadastro\Commands\ExecuteContratoEstoqueReservaCommand::compensateFaturadoToReservado` — cobre **somente** a reconstituição de reserva/estoque em `F → R`; não toca parcelas nem crédito de troca. A reversão financeira que ticket 21 exige (desfazer o compromisso criado em `F`, não apenas "estornar" como no cancelamento) está `NÃO LOCALIZADO`.
- `App\Infrastructure\Persistence\Legacy\Vendas\LegacyContratoCancelamentoRepository` — `hasParcelaComPagamentoReal`, `hasDevolucaoOuTroca`, `estornarParcelas`, `markCancelado`, `planMovimentosLinha`. **Nenhuma guarda fiscal** (documento autorizado vigente) existe aqui — é preciso adicionar, reaproveitando a mesma projeção de documentos fiscais já usada pelo spec 10 (`LegacyFichaFinanceiraContratoTabsRepository`), não uma nova consulta.
- `App\Domain\Vendas\Contratos\ExclusaoContratoMode` e `App\Support\Vendas\CancelamentoContratosParameterManifest::exclusaoContratoMode`/`obrigarDigitacaoAoExcluir` — já implementam a paridade do parâmetro `ExclusaoContrato` (Cancelar/Excluir/Perguntar) para `O`; reaproveite, não recrie.
- `App\Application\Vendas\Contratos\ExcluirContratoOrcadoCommand` — já implementa a exclusão física de Contrato `O` quando o parâmetro permite; decida se o F6 do Cadastro também expõe esse comando (mesma regra do lote) ou se fica fora desta primeira integração, documentando a escolha.
- `App\Application\Vendas\Contratos\DTOs\ContratoLoteItemResult` — já modela `status` (ex.: `bloqueio_financeiro`, `bloqueio_devolucao_troca`, `bloqueio_estoque`, `conflito_revisao`, `prova_sensivel_ausente`) e `blockers: list<{code, message}>`, mas o comando atual só preenche um `status` por falha (retorno antecipado), nunca acumula múltiplos `blockers`. Decida se isso é suficiente para o Cadastro ou se a resposta precisa acumular vários bloqueios simultâneos com destino de navegação, como o ticket de decisão pede.
- `App\Application\Vendas\Contratos\Cadastro\ContratoCadastroCapabilityResolver` — hoje não tem nenhuma capability granular de cancelamento/reversão (`cancelar_orcado` etc. são `NÃO LOCALIZADO`); `commands.f6` é `available: false, reason: 'not_implemented'` — este é o interruptor que o spec liga ao final.
- `App\Services\Vendas\Contratos\CancelamentoContratosSensitiveOperationGate` — já implementa prova sensível vinculada a ação/Contrato/filial/revision para o fluxo em lote (`assertCancelarItem`, `assertExcluirOrcado`, `claimToken`); reaproveite a mesma infraestrutura para o F6 do Cadastro, não crie um mecanismo paralelo.
- `App\Support\Vendas\ContratoMotivoCancelamentoValidator` — validação de motivo já existente e reaproveitável.
- A Ficha Financeira/documentos fiscais do spec 10 (`FichaFinanceiraService::listDoctosFiscais`) — fonte a reaproveitar para a nova guarda fiscal, não uma consulta paralela.
- Specs 7/8 (logística/agenda) ainda não têm implementação real — a guarda de "logística irreversível" desta fatia deve ser um ponto de extensão reconhecido (bloqueio tipado quando existir execução detectável), não uma integração completa com um motor que ainda não existe.

## Evidência Delphi confirmada

### Fronteira do domínio

- `DECISÃO NOVA` — são comandos diferentes: `CancelarContrato`, `ReverterFaturamentoContrato` e `IniciarDevolucaoContrato`. Não são variantes técnicas do mesmo F6.
- `DECISÃO NOVA` — somente rascunho sem número e sem efeitos pode ser descartado. Contrato persistido nunca é apagado: passa a `C` ou recebe compensações, preservando histórico.
- `CONFIRMADO` — o F6 Delphi pergunta, em `F`, entre voltar a Reservado e cancelar; em `O`, `ExclusaoContrato` escolhe cancelar, excluir ou perguntar. Evidência: `fmcadastrocontratos.pas:2111-2218`.
- `DIVERGENTE` — a exclusão física legada (`dmcadastrocontratos.pas:5932-5938`) não será migrada como cancelamento; apaga cabeçalho, itens e parcelas. `ExcluirContratoOrcadoCommand` já existente é o único caminho de exclusão física, restrito a `O`.

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

- `CONFIRMADO` — o legado admite `O/R/F` e grava `C`, motivo, data, operador e autorizador. Evidência: `dmcadastrocontratos.pas:5899-5960,4373-4383`.
- `CONFIRMADO` — a reversão Delphi muda `F → R`, limpa faturamento e estorna crédito de troca. Evidência: `dmcadastrocontratos.pas:18619-18645`.
- `DECISÃO NOVA` — o servidor bloqueia o agregado, compara `expected_revision` e recalcula guardas na transação; `C` só é gravado após todas as compensações síncronas obrigatórias.

### Financeiro, fiscal e devoluções

- `CONFIRMADO` — o Delphi bloqueia cancelar/reverter `F` quando há quantidade devolvida/trocada, parcela paga/estornada ou simples faturamento. Evidências: `fmcadastrocontratos.pas:2141-2187`; `dmcadastrocontratos.pas:4060-4063,14342-14369,18043-18063`.
- `CONFIRMADO` — ao cancelar um Contrato `F`, o Delphi encerra intencionalmente todas as parcelas registrando `valorpagto = valorvencto`, `datapagto = data atual`, filial da operação e `tipopagto = 'E'`/`Estornado` — esse é o estado final esperado no ERP, inclusive para parcelas nunca recebidas. Evidência: `dmcadastrocontratos.pas:4043-4057,4367-4372`. **Já reproduzido** por `LegacyContratoCancelamentoRepository::estornarParcelas`.
- `DECISÃO NOVA` — consultas, saldos e relatórios devem interpretar `E/Estornado` como parcela encerrada por estorno, não como recebimento comum, mesmo com `valorpagto`/`datapagto` preenchidos.
- `DECISÃO NOVA` — fiscal autorizado vigente bloqueia; rejeitado, denegado ou cancelado só libera após concluir compensações; simples faturamento deve ser cancelado no domínio fiscal.
- `DECISÃO NOVA` — devolução/troca existente bloqueia `F → R` e `F → C` e nunca tem seu histórico apagado.

### Estoque e logística

- `CONFIRMADO` — o Delphi bloqueia estoque e cria movimentos `TPE`, `SQU`, `TRE` por item/filial/lote. Evidência: `dmcadastrocontratos.pas:4065-4360`; queries em `dmcadastrocontratos.dfm:13220-13286`. Códigos legados não viram regra de UI.
- `DECISÃO NOVA` — `R → C` libera toda reserva; `F → C`, somente saldo não consumido; `F → R` mantém e revalida reserva. A divergência entre os dois mecanismos de movimento hoje existentes (comando canônico vs. reserva do spec 5) exige reconciliação explícita nesta fatia.
- `DECISÃO NOVA` — agenda futura não executada é liberada em `→ C` e mantida em `F → R`; execução de entrega/retirada/montagem bloqueia e encaminha ao retorno operacional — reconhecida como bloqueio tipado, já que specs 7/8 ainda não implementam o motor real.

### Autorização, motivo e Atendimento

- `CONFIRMADO` — o Delphi usa senha/login, permissão `DevolucaoProduto`, `AutorizacaoCancelarContratoFaturado`, cadastro de motivos e `ObrigarDigitacaoaoExcluir`. Evidência: `fmcadastrocontratos.pas:2223-2281`.
- `DIVERGENTE` — devolução não autoriza implicitamente tudo. Capabilities: `contrato.cancelar_orcado`, `contrato.cancelar_reservado`, `contrato.cancelar_faturado`, `contrato.reverter_faturado`.
- `DECISÃO NOVA` — quando exigido, usar prova sensível de uso único, vinculada a ação/Contrato/filial/`revision`, registrando operador e autorizador separadamente — **já reaproveitável** de `CancelamentoContratosSensitiveOperationGate`.
- `CONFIRMADO` — o Delphi coleta motivo/descrição e cria Atendimento quando existe texto. Evidência: `fmcadastrocontratos.pas:2267-2274`; `dmcadastrocontratos.pas:5907-5908`. **Já reproduzido** por `CancelarContratoCommand::insertAtendimentoCancelamento`.
- `DECISÃO NOVA` — motivo, autoria e snapshot das guardas pertencem ao evento transacional; Atendimento é projeção idempotente pós-commit, não desfaz cancelamento nem solicita nova senha.

### Contrato de interface e aceitação

- `DECISÃO NOVA` — resposta contém estado/revision, compensações e bloqueios tipados (`financeiro`, `fiscal`, `devolucao_troca`, `estoque`, `logistica`, `autorizacao`) com destino de navegação.
- `DECISÃO NOVA` — em `F`, o modal oferece "Voltar para Reservado" e "Cancelar Contrato", nunca "Excluir", resumindo efeitos antes de motivo/autorização.
- `DECISÃO NOVA` — idempotency key impede duplicar movimentos, Atendimento e compensações; conflito de `revision` força atualização.

Casos mínimos: cancelar `O` preserva histórico; cancelar `R` libera exatamente reserva/agenda; reverter `F → R` mantém e revalida reserva; cancelar `F` registra suas parcelas integralmente como `E/Estornado`, compensa os demais efeitos e somente então grava `C`; recebimento parcial, fiscal, devolução/troca e logística executada bloqueiam com encaminhamento; Atendimento ocorre uma vez; revision/idempotência possuem testes.

## Estado Laravel confirmado

- `CancelarContratoCommand` já implementa a maior parte da matriz para `O/R/F → C` (motivo, descrição, prova sensível, guarda de parcela paga e de devolução/troca, movimentos de estoque, estorno de parcelas e crédito, `markCancelado`, Atendimento idempotente) — mas está isolado na tela de Cancelamento em Lote.
- O Cadastro de Contratos hoje só cobre `O/R → C` por um caminho diferente e mais pobre (`releaseAll`), sem nenhuma das guardas/efeitos acima; `F → C` não existe no Cadastro de forma alguma.
- `F → R` está marcada como implementada no grafo, mas sua guarda real está fixada para negar sempre; a reversão financeira que a acompanharia não existe.
- Nenhuma guarda fiscal (documento autorizado vigente) existe em nenhum dos dois caminhos.
- Nenhuma capability granular por transição de cancelamento/reversão existe; a checagem hoje é só `canUpdate` genérico.
- F6 do Cadastro está explicitamente desabilitado (`not_implemented`) na resolução de capabilities.

## Decisões obrigatórias

1. Reconcilie as duas implementações de cancelamento em uma única autoridade — preferencialmente `CancelarContratoCommand`, generalizado para ser chamado tanto pelo lote quanto pelo Cadastro — documentando a escolha e o plano de convergência dos mecanismos de movimento de estoque.
2. `CancelarContrato`, `ReverterFaturamentoContrato` e `IniciarDevolucaoContrato` são comandos distintos; este spec só entrega os dois primeiros, reconhecendo o terceiro apenas como guarda tipada.
3. Contrato persistido nunca é apagado por este spec; só rascunho sem número e sem efeitos pode ser descartado localmente (`DescartarRascunhoContrato`, já coberto pela Fundação).
4. `F → C` ganha a guarda fiscal (documento autorizado vigente bloqueia) e a guarda de agenda/logística (execução em andamento bloqueia, agenda futura não executada libera) que hoje faltam, reaproveitando a projeção de documentos fiscais do spec 10 — sem criar uma segunda consulta.
5. `F → R` só é aceita quando a guarda real (substituindo o deny-by-default) confirmar ausência de efeito financeiro realizado, devolução/troca, fiscal autorizado vigente ou logística irreversível; a reversão inclui desfazer o compromisso financeiro criado em `F` (parcelas e crédito de troca), não apenas revalidar reserva.
6. Parcelas encerradas por cancelamento (`E`/`Estornado`) continuam sendo interpretadas como estorno, nunca como recebimento comum, em qualquer consulta/relatório que este spec toque.
7. Capabilities finas por transição (`contrato.cancelar_orcado`, `contrato.cancelar_reservado`, `contrato.cancelar_faturado`, `contrato.reverter_faturado`) substituem a checagem genérica `canUpdate` para essas transições especificamente; as demais transições não são afetadas por este spec.
8. F6 no Cadastro oferece exatamente as opções da matriz por situação (nunca "Excluir" em `F`), resumindo efeitos e bloqueios antes de coletar motivo/autorização.
9. Toda operação usa `expected_revision`, é idempotente por `contrato + transição + revision` (ou chave equivalente) e nunca deixa efeito parcial: falha em qualquer guarda ou etapa reverte a transação inteira.
10. Atendimento é projeção idempotente pós-commit, nunca condição para o cancelamento nem gatilho de nova prova sensível; reaproveita a implementação já existente sem duplicar.
11. Bloqueios são tipados (`financeiro`, `fiscal`, `devolucao_troca`, `estoque`, `logistica`, `autorizacao`) com destino de navegação; decida e documente se a resposta acumula múltiplos bloqueios simultâneos ou mantém um por falha, como hoje.
12. Este spec não implementa devolução, troca, cancelamento fiscal nem qualquer transição `P/N` — apenas os reconhece como bloqueios tipados com encaminhamento.

## Contrato do comando unificado

- Entrada: identidade/`revision` do Contrato, motivo/descrição (conforme política de parâmetro), contexto do ator, prova sensível quando a capability exigir, idempotency key.
- Processo: validar `revision`/situação → resolver a transição (`O→C`, `R→C`, `F→C`, `F→R`) → avaliar guardas em camadas (financeiro, fiscal, devolução/troca, logística) retornando bloqueio tipado na primeira violação relevante (ou acumulando, conforme decisão 11) → para `→C`: liberar/compensar reserva e agenda elegível, estornar parcelas/crédito quando `F`, gravar `C`, motivo e autoria → para `F→R`: revalidar/reconstituir reserva, desfazer compromisso financeiro, gravar `R` → registrar envelope de auditoria/domínio e Atendimento idempotente pós-commit.
- Saída: fotografia autoritativa do Contrato, nova `revision`, bloqueios tipados quando aplicável.
- Falha em qualquer etapa não deixa efeito parcial; a transação inteira reverte.

## Autorizações e parâmetros

- Reaproveite integralmente `CancelamentoContratosSensitiveOperationGate`, `ContratoMotivoCancelamentoValidator`, `ExclusaoContratoMode` e `CancelamentoContratosParameterManifest` já existentes; não crie mecanismos paralelos de prova sensível, motivo ou parâmetro.
- Capabilities finas por transição seguem a mesma precedência já fixada na Fundação (regra de estado → Permissão → Parâmetro → prova sensível).

## Testes obrigatórios

1. Toda a matriz de comandos como Feature tests do comando unificado real, cobrindo `O→C`, `R→C`, `F→C` e `F→R`.
2. Reconciliação: os mesmos casos hoje cobertos pelos testes do Cancelamento em Lote continuam passando após o Cadastro passar a usar a mesma autoridade.
3. `F → C`: bloqueio fiscal (documento autorizado vigente) e bloqueio de logística em execução, hoje ausentes, cada um rejeitando isoladamente.
4. `F → R`: guarda real substituindo o deny-by-default — aceita quando nenhum efeito financeiro/devolução/fiscal/logística bloqueia, rejeita cada guarda isoladamente; reversão financeira desfaz parcelas/crédito corretamente, distinto do estorno permanente do cancelamento.
5. Parcelas `E/Estornado` são interpretadas como encerradas por estorno em qualquer leitura tocada por este spec.
6. Capabilities finas: cada uma controla exatamente sua transição; payload manipulado no frontend não concede cancelamento/reversão sem a capability e a prova sensível corretas.
7. Idempotência: retry com a mesma chave não duplica movimento, estorno, Atendimento nem compensação.
8. Atendimento é criado uma única vez por operação, mesmo sob retry ou reexecução.
9. `C`: cancelar/reverter um Contrato já cancelado é idempotente, nunca reabre implicitamente.
10. Regressão: `ExcluirContratoOrcadoCommand` e a tela de Cancelamento em Lote continuam funcionando sem alteração de contrato externo.

Prefira Feature tests no comando/endpoint real; reutilize os testes existentes do Cancelamento em Lote e da reserva (`ContratoEstoqueReservaTestHelpers`) como base de regressão.

## Entregáveis

- Decisão documentada de reconciliação das duas implementações de cancelamento, incluindo o plano de convergência dos mecanismos de movimento de estoque.
- Contrato do comando unificado (entrada/processo/saída) para `O/R/F → C` e `F → R`.
- Matriz de evidência Delphi × Laravel, deixando explícito o que já existe (comando canônico, prova sensível, Atendimento) e o que esta fatia completa (guarda fiscal, guarda de logística, reversão financeira de `F→R`, capabilities finas, F6).
- Critérios de aceitação e testes, incluindo a matriz de comandos como suíte obrigatória.
- Riscos, dúvidas e bloqueios que exijam nova investigação Delphi no workspace de análise.

## Fora de escopo

- implementar durante `/speckit.specify`;
- `IniciarDevolucaoContrato`, troca e cancelamento de documento fiscal — apenas bloqueios tipados;
- qualquer transição envolvendo `P/N`;
- Desmembrar Contrato (spec 12);
- motor real de agenda/execução logística (specs 7/8, ainda não implementados) — apenas o ponto de extensão do bloqueio;
- redesenhar a tela de Cancelamento em Lote além do necessário para compartilhar a autoridade única;
- alterar o schema Delphi além de migrations aditivas eventualmente exigidas.
```
