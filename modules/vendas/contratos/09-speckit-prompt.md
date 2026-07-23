# Prompt para /speckit.specify

```text
/speckit.specify

Crie uma especificação funcional e técnica detalhada para faturar o Contrato (`R → F`) — Etapa 5 (Faturamento até `F`), primeiro dos dois specs dessa etapa, construído sobre a Fundação (`01-speckit-prompt.md`), o motor comercial (`03-speckit-prompt.md`), a proposta financeira (`04-speckit-prompt.md`), a reserva (`05-speckit-prompt.md`) e os lotes/conferência (`06-speckit-prompt.md`), cujo gate de séries este spec aciona.

**Faturar o Contrato e emitir documento fiscal são operações diferentes.** Este spec entrega apenas `R → F`: consolidação comercial/financeira, sem criar `dadosfiscais`, sem escolher CFOP/Natureza e sem transmitir documento algum. A emissão fiscal (`SolicitarDocumentoFiscalContrato`, `FiscalDocumentPlanner`, transições `P/N`) é esforço posterior, fora desta série de specs até a Etapa 9. Não implemente nada disso aqui, nem crie um atalho que produza `P/N` diretamente.

O checkout Laravel já reconhece `R → F` como transição **válida mas explicitamente não implementada** (`ContratoTransitionGraph::isImplemented('R','F') === false`, enquanto `isRecognized('R','F') === true`) — este spec fecha exatamente esse gap. Não reabra nem reimplemente o que já existe: a checagem de proposta obsoleta, a preparação de reserva e o mapeamento de parcelas já têm implementação real e testada (ver Investigação Laravel obrigatória); construa `FaturarContrato` compondo essas peças, não duplicando-as.

Não implemente nesta etapa além do previsto. Você não possui acesso ao código Delphi. Considere a seção `Evidência Delphi confirmada` deste prompt como o pacote funcional legado autoritativo — trate-a como contrato de aceitação. Inspecione o checkout Laravel para confirmar o estado real; corrija hipóteses contrariadas por evidência concreta e cite arquivo/trecho. Classifique descobertas Laravel como CONFIRMADO, INFERIDO, DÚVIDA, NÃO LOCALIZADO ou DIVERGENTE; preserve as classificações POSSÍVEL BUG LEGADO e DECISÃO NOVA já fornecidas.

## Limite desta entrega

Inclua:

- o comando `FaturarContrato` (`R → F`) com pré-condições **todas revalidadas no servidor**: contrato persistido em `R`, `revision` atual e sem outro comando em andamento; cliente e fotografia fiscal mínimos válidos; ao menos um produto ou serviço comercial válido; proposta financeira coerente com a assinatura comercial (reaproveitando o stale-check já existente) e parcelas fechadas (`assertFechamento`); reserva coerente com a mesma revisão (reaproveitando `ready_for_billing`/`reservation_fingerprint` já calculados); séries capturadas quando a política parametrizada exigir; conferência atendida quando parametrizada; limites de crédito, cashback/crédito de troca e autorização de analista resolvidos por prova sensível quando aplicáveis;
- uma **transação idempotente única**: `R → F`, consolidação das parcelas/razão financeiro (materializando o resultado já calculado da proposta), data de faturamento, consumo lógico da proposta (a reserva passa a ser elegível para consumo fiscal/logístico posterior — sem baixa física) e registro da autorização sensível quando exigida; falha em qualquer etapa deixa o contrato integralmente em `R`;
- a **captura e validação de completude de séries** no momento do faturamento quando exigida por característica/grupo (slots preenchidos, sem vazio/duplicado, unicidade **apenas dentro do contrato**) — sem alocar essas séries a um documento fiscal específico, que é responsabilidade da Etapa 9;
- o **wiring completo**: implementar o comando, plugá-lo no `match` de `DescribeContratoTransitionsCommand::invoke` (hoje lança `not_implemented` para `R → F`), decidir e implementar a idempotência (reaproveitando `ContratoEstoqueIdempotencyGuard` ou mecanismo equivalente) e só então virar `ContratoTransitionGraph::isImplemented('R','F')` para `true`, sustentado pelos testes.

Não inclua: criação de `dadosfiscais`, escolha de Natureza Padrão/CFOP, transmissão de documento fiscal e transições `P/N` (Etapa 9); alocação de séries a um documento fiscal específico (apenas a captura/completude pertence aqui); consumo físico de estoque, transferência entre filiais e movimentos vinculados a documento (Etapa 9); reagendamento logístico ou execução quantitativa de entrega/retirada (specs 7/8, já definidos — este spec, no máximo, consulta guardas já existentes, sem reimplementá-las); a integração somente leitura de razão financeiro/Ficha Financeira/documentos fiscais no shell (spec 10).

## Fronteira de acesso às fontes

- Não tente localizar, abrir ou solicitar arquivos PAS, DFM ou data modules Delphi.
- As evidências abaixo já foram extraídas no workspace de análise a partir de `fmcadastrocontratos.pas/.dfm` e `dmcadastrocontratos.pas/.dfm`.
- Use-as como requisitos legados de entrada, preservando classificações, sem exigir reconfirmação no código Delphi.
- Inspecione o checkout Laravel para confirmar o estado atual e construir a matriz de lacunas.

## Investigação Laravel obrigatória

- `App\Domain\Vendas\Contratos\ContratoTransitionGraph` — `isRecognized('R','F') === true`, `isImplemented('R','F') === false`. Este é o interruptor final: o spec só está completo quando ele vira `true` sustentado por testes reais, sem alterar o reconhecimento nem o comportamento das demais arestas.
- `App\Application\Vendas\Contratos\Cadastro\DescribeContratoTransitionsCommand::invoke` (~linhas 76-176) — já autoriza (`canUpdate`), já valida `expected_revision`, já bloqueia `R`/`F` quando a proposta está obsoleta (`proposal_stale`, ~138-148, reaproveitando `ContratoPropostaFinanceiraService::deriveStaleState`), e já lança `not_implemented` quando o `match` (~150-162) não resolve a transição — hoje sem caso para `R → F`. Adicione o caso ao `match` chamando o novo comando; não duplique autorização, validação de revisão ou checagem de stale já feitas aqui.
- `App\Application\Vendas\Contratos\Cadastro\Commands\ExecuteContratoEstoqueReservaCommand::prepareFaturamento` (~490-519) e `PrepareContratoFaturamentoReservaCommand` — **já calculam** `ready_for_billing` (saldo reservado por chave bate com as linhas comerciais atuais) e `reservation_fingerprint` (hash determinístico de contrato+reservas+revision). `FaturarContrato` consome esse resultado como precondição de reserva coerente; não recalcula a coerência de reserva por conta própria.
- `App\Services\Vendas\Contratos\ContratoPropostaFinanceiraService` — já expõe `deriveStaleState` (assinatura comercial/financeira), `assertFechamento` (fechamento do motor de financiamento) e, principalmente, `mapInstallmentsToLegacyParcelas`/`installmentLineToPersistRow` — mapeamento **já construído** do resultado do motor de financiamento para linhas `parcelas` legadas. Reaproveite esse mapeamento para materializar o razão financeiro em `F`; não recrie a lógica de conversão de parcelas.
- `App\Application\Vendas\Contratos\Cadastro\Ports\ContratoFaturamentoFiscalGuardPort` / `DenyByDefaultContratoFaturamentoFiscalGuard` — porta já existente, hoje usada apenas para o guard de `F → R` (spec 5). Decida e documente se `FaturarContrato` precisa de uma porta irmã (guard de pré-condições externas de crédito/analista) ou se reaproveita esta mesma abstração — não invente um terceiro mecanismo de guard paralelo.
- `App\Services\Vendas\Contratos\Estoque\ContratoEstoqueIdempotencyGuard` e a lista `replayCandidates` em `DescribeContratoTransitionsCommand::invoke` (hoje só cobre `R` e `C`) — não incluem `R → F`. Decida se a idempotência de `FaturarContrato` se registra nesse mesmo guard (adicionando a transição à lista de replay) ou usa um mecanismo equivalente próprio, documentando a escolha; não deixe `R → F` sem idempotência real.
- `App\Support\Vendas\ContratoSituacaoDocumentalMapper` — apenas rotula `F/P/N` para exibição; nenhuma lógica de transição vive lá. Não confundir com o comando desta fatia.
- `ExecuteContratoEstoqueReservaCommand::TRANSITION_PREPARE_R_TO_F` — já existe como transição de leitura (preparação); confirme se `FaturarContrato` reaproveita esse mesmo identificador de transição para a gravação real ou define um novo (`TRANSITION_R_TO_F`), documentando a relação entre os dois.

## Evidência Delphi confirmada

### Vocabulário e fronteira

- `CONFIRMADO` — faturar o contrato e emitir documento fiscal são operações diferentes no legado. `R → F` altera o compromisso comercial/financeiro; a emissão posterior parte do contrato faturado e pode produzir `P` ou `N`. Evidências: despacho da ação em `fmcadastrocontratos.pas:3089-3095`, faturamento em `:3448-3542,3873-3888`, emissão em `dmcadastrocontratos.pas:2641-2761`.
- `CONFIRMADO` — `F` significa **Faturado**, não "NF emitida". O Delphi chama `AtualizarDataParcela` ao faturar e só no fluxo documental cria `dadosfiscais`, nota/cupom, itens, vencimentos, movimentos e vínculos. Evidências: `dmcadastrocontratos.pas:6142-6145,7718-7738,10218-11238,11303-12170`.
- `DECISÃO NOVA` — `FaturarContrato` (este spec) e `SolicitarDocumentoFiscalContrato` (Etapa 9) são dois contratos de aplicação independentes. O Cadastro apresenta e comanda ambos quando prontos, mas este spec não implementa cálculo tributário, numeração, transmissão ou cancelamento fiscal.

### Pré-condições, todas recalculadas no servidor

- contrato persistido em `R`, `revision` atual e sem outro comando em andamento;
- cliente e fotografia fiscal mínimos válidos;
- pelo menos um produto ou serviço comercial válido;
- proposta financeira coerente com a assinatura comercial e parcelas válidas;
- reserva coerente com a mesma revisão, inclusive lotes quando exigidos;
- séries e conferência atendidas quando a política parametrizada as exigir;
- limites de crédito, cashback/crédito de troca e autorização de analista resolvidos por prova sensível, quando aplicáveis.

- `CONFIRMADO` — antes de faturar, a tela Delphi encadeia observações de produto, séries, cashback, crédito de troca e autorização. Evidência: `fmcadastrocontratos.pas:3873-3884`.
- `CONFIRMADO` — a autorização distingue analista de crédito e admite exceção para contrato integralmente à vista no fluxo em lote. Evidências: `fmcadastrocontratos.pas:3448-3527`, `dmoperacoescontratos.pas:551-683`.
- `CONFIRMADO` — limite/pontuação é revalidado na gravação de `F`. Evidência: `dmcadastrocontratos.pas:7718-7737,18349-18361`.
- `DECISÃO NOVA` — `R → F`, consolidação das parcelas/razão financeiro, data de faturamento, consumo lógico da proposta e registro da autorização formam uma transação idempotente. Falha deixa o contrato integralmente em `R`.
- `DECISÃO NOVA` — `FaturarContrato` não cria `dadosfiscais`, não escolhe CFOP e não transmite documento; também não consome fisicamente estoque — apenas torna a reserva elegível para consumo pelo fluxo fiscal/logístico posterior.

### Séries: captura no faturamento, não alocação a documento

- `CONFIRMADO` — a exigência de série nasce da característica ou grupo; a rotina cria/remove slots até igualar a quantidade e valida vazio/duplicidade antes de prosseguir. Evidências: `dmcadastrocontratos.pas:3104-3175,18090-18103,18611-18617`.
- `CONFIRMADO` — o momento efetivo é `Faturar`, antes de `InternoGravar` (`fmcadastrocontratos.pas:3873-3884`); série não é movimento de `O → R`, é gate do faturamento.
- `NÃO LOCALIZADO` — não há prova de unicidade global da série entre contratos; o filtro Delphi restringe a busca ao contrato atual. Este spec exige apenas unicidade dentro do contrato; unicidade global e vínculo com lote/documento ficam para a Etapa 9.
- `DECISÃO NOVA` — a captura de série (slots preenchidos, sem vazio/duplicidade) é gate de `FaturarContrato`; a alocação de uma série específica a um documento fiscal (`produtosdadosfiscaisseries`) é responsabilidade exclusiva da preparação fiscal da Etapa 9.

### Financeiro: nascimento do compromisso em `F`

- `DECISÃO NOVA` — o compromisso do cliente e o razão financeiro nascem em `F`; documentos parciais futuros não recriam parcelas nem alteram o total contratado.
- `CONFIRMADO` — o Delphi inclui vencimentos e rateia valores no documento fiscal, separando produto e serviço. Evidência: `dmcadastrocontratos.pas:11147-11227` — isso pertence à Etapa 9 (vencimentos do documento são fotografia/rateio do compromisso já existente); este spec apenas materializa o compromisso original em `F`.

## Estado Laravel confirmado

- `R → F` já está no grafo de transições como **reconhecida e explicitamente não implementada** — o próprio código já documenta o gap que este spec fecha.
- A checagem de proposta obsoleta (`proposal_stale`) e a preparação de reserva (`ready_for_billing`/`reservation_fingerprint`) **já existem e são reais**, não protótipos — este spec as consome, não as reconstrói.
- O mapeamento de parcelas do motor de financiamento para linhas legadas (`mapInstallmentsToLegacyParcelas`/`installmentLineToPersistRow`) já existe, mas nenhum comando hoje o invoca no momento de `F` — é usado apenas na edição da proposta em `O/R`.
- Não existe nenhum comando `FaturarContrato`, nenhuma consolidação de razão financeiro em `F`, nenhum gate de séries integrado ao faturamento e nenhuma idempotência registrada para `R → F` (`NÃO LOCALIZADO` em todos os casos).
- A porta de guard fiscal/financeiro (`ContratoFaturamentoFiscalGuardPort`) existe apenas para `F → R`; nenhuma porta equivalente para pré-condições de `R → F` foi localizada.

## Decisões obrigatórias

1. `FaturarContrato` e a futura emissão fiscal são comandos de aplicação independentes; este spec entrega somente o primeiro.
2. Todas as pré-condições listadas são revalidadas no servidor a cada invocação — nunca confiar em flags/estado enviados pelo navegador.
3. `R → F`, consolidação de parcelas/razão financeiro, data de faturamento, consumo lógico da proposta e registro de autorização formam uma única transação idempotente; falha em qualquer parte mantém o contrato integralmente em `R`, sem estado intermediário visível.
4. A consolidação financeira reaproveita o mapeamento já existente do motor de financiamento (`ContratoPropostaFinanceiraService`); não recalcula parcelas com uma lógica paralela.
5. A coerência de reserva é a já calculada por `prepareFaturamento`/`PrepareContratoFaturamentoReservaCommand`; `FaturarContrato` não reimplementa essa checagem, apenas a consome como precondição bloqueante.
6. Séries exigidas por característica/grupo são capturadas e validadas (completude, sem vazio/duplicidade, unicidade dentro do contrato) como gate deste comando; a alocação a documento fiscal específico não pertence a este spec.
7. `FaturarContrato` nunca cria `dadosfiscais`, nunca escolhe CFOP/Natureza, nunca transmite documento e nunca consome fisicamente estoque — apenas torna a reserva elegível para consumo posterior.
8. Autorização de crédito/cashback/crédito de troca/analista reaproveita a infraestrutura de prova sensível já fixada na Fundação; nenhum mecanismo de senha paralelo.
9. Decida explicitamente e documente: (a) se `FaturarContrato` reaproveita `ContratoFaturamentoFiscalGuardPort` ou usa uma porta irmã para pré-condições externas; (b) se a idempotência reaproveita `ContratoEstoqueIdempotencyGuard` (adicionando `R → F` à lista de replay) ou um mecanismo equivalente próprio.
10. `ContratoTransitionGraph::isImplemented('R','F')` só vira `true` quando `FaturarContrato` estiver implementado, plugado em `DescribeContratoTransitionsCommand::invoke` e coberto pelos testes obrigatórios abaixo — nunca antes.
11. Este spec não toca agenda, execução logística (specs 7/8) nem razão financeiro/Ficha Financeira/documentos fiscais no shell (spec 10); no máximo consulta guardas logísticas já definidas quando a política parametrizada exigir, sem reimplementá-las.

## Contrato do comando `FaturarContrato`

- Entrada: identidade/`revision` do Contrato, contexto do ator, prova sensível quando a precedência de autorização exigir, idempotency key.
- Processo: validar `revision`/situação `R` → revalidar todas as pré-condições no servidor (cliente/fotografia fiscal, produtos/serviços, proposta financeira não obsoleta e fechada, reserva coerente via `prepareFaturamento`, séries completas quando exigidas, conferência atendida quando parametrizada, limites/autorização sensível) → consolidar parcelas/razão financeiro a partir do resultado já calculado da proposta → gravar situação `F`, data de faturamento e `revision` → registrar autorização e envelope de auditoria/domínio → agendar outbox para efeitos externos, se houver.
- Saída: fotografia autoritativa do Contrato em `F`, razão financeiro consolidado, nova `revision`.
- Falha em qualquer pré-condição ou etapa não deixa o contrato parcialmente faturado; a transação inteira reverte e o contrato permanece em `R`.

## Autorizações e parâmetros

- Reaproveite integralmente a matriz de autorizações/parâmetros já fixada na Fundação e a infraestrutura de prova sensível (`SensitiveOperationProofService`) para crédito/cashback/crédito de troca/autorização de analista.
- Não introduza um segundo mecanismo de senha ou aprovação; qualquer parâmetro próprio desta fatia segue o mesmo `ContratoCadastroParameterManifest` já usado pela reserva.

## Testes obrigatórios

1. Caminho feliz: contrato `R` com todas as pré-condições válidas fatura para `F`, consolida parcelas/razão financeiro corretamente e nenhum documento fiscal é criado (`Faturamento comercial`, único caso dourado deste spec — os demais casos da matriz fiscal pertencem à Etapa 9).
2. Cada pré-condição rejeitando isoladamente: proposta obsoleta, reserva incoerente, série incompleta/vazia/duplicada, conferência pendente quando exigida, limite de crédito/autorização negada — cada falha mantém o contrato integralmente em `R`, sem persistência parcial.
3. Atomicidade: falha em qualquer etapa da consolidação financeira não deixa parcelas parcialmente materializadas nem situação alterada.
4. Idempotência: retry com a mesma chave (`contrato + transição + revision` ou equivalente) devolve o mesmo resultado sem duplicar consolidação financeira nem reprocessar autorização.
5. `ContratoTransitionGraph::isImplemented('R','F')` passa a `true` apenas após esses testes passarem; teste de regressão garante que as demais arestas do grafo permanecem inalteradas.
6. `DescribeContratoTransitionsCommand::invoke` para `to=F`: autorização, validação de `expected_revision`, bloqueio por proposta obsoleta e chamada ao novo comando — sem duplicar essas checagens dentro do próprio `FaturarContrato`.
7. Regressão: nenhuma linha é criada em `dadosfiscais` nem em qualquer tabela fiscal; nenhum movimento físico de estoque é gerado por este comando.
8. Payload manipulado no frontend não concede a transição sem capability/prova sensível válidas no servidor.

Prefira Feature tests no comando/endpoint real (`vendas.contratos.transitions.invoke` com `to=F`); reutilize os testes existentes de reserva (`ContratoEstoqueReservaTestHelpers`) e de proposta financeira como base de regressão para as pré-condições que este spec apenas consome.

## Entregáveis

- Contrato do comando `FaturarContrato` (entrada/processo/saída).
- Decisão documentada sobre a porta de guard (própria ou reaproveitada) e sobre o mecanismo de idempotência de `R → F`.
- Matriz de evidência Delphi × Laravel, deixando explícito o que já existe (stale-check, preparação de reserva, mapeamento de parcelas) e o que esta fatia adiciona.
- Critérios de aceitação e testes, incluindo o caso dourado "Faturamento comercial" como suíte obrigatória.
- Riscos, dúvidas (relação exata entre `TRANSITION_PREPARE_R_TO_F` e a nova transição de gravação) e bloqueios que exijam nova investigação Delphi no workspace de análise.

## Fora de escopo

- implementar durante `/speckit.specify`;
- criação de `dadosfiscais`, escolha de Natureza Padrão/CFOP, transmissão e transições `P/N` (Etapa 9);
- alocação de séries a documento fiscal específico (apenas captura/completude pertence aqui);
- consumo físico de estoque, transferência entre filiais e movimentos vinculados a documento;
- reagendamento logístico ou execução quantitativa de entrega/retirada (specs 7/8);
- integração somente leitura de razão financeiro/Ficha Financeira/documentos fiscais no shell (spec 10);
- cancelamento, reversão (`F → R`, já spec 5) e devolução pós-faturamento;
- alterar o schema Delphi além de migrations aditivas eventualmente exigidas.
```
