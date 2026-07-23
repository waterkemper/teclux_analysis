# Prompt para /speckit.specify

```text
/speckit.specify

Crie uma especificação funcional e técnica detalhada para a alocação/sugestão/redistribuição de lotes e para a conferência `CTR` do Cadastro de Contratos — Etapa 3 (Estoque e reserva), segundo e último dos dois specs dessa etapa, construído sobre a Fundação (`01-speckit-prompt.md`), o motor comercial (`03-speckit-prompt.md`) e, principalmente, sobre a reserva e os movimentos já especificados E JÁ IMPLEMENTADOS (`05-speckit-prompt.md`).

Não implemente do zero o que já existe: o comando transacional de reserva do spec 5 já está construído em `App\Application\Vendas\Contratos\Cadastro\Commands\ExecuteContratoEstoqueReservaCommand` e já aceita, por linha que exija lote, uma decomposição `lote → quantidade` fornecida externamente (`lotDecomposition`); sem ela, a reserva bloqueia com `lote_decomposicao_nao_suportada`. Este spec constrói o que falta em cima desse ponto de extensão — a sugestão/redistribuição que produz essa decomposição — e a conferência `CTR`. Não reabra nem reescreva a mecânica de delta, lock, concorrência, idempotência ou autorização de falta/venda futura do comando de reserva; estenda-a apenas onde a evidência abaixo exigir.

Não implemente nesta etapa além do previsto. Você não possui acesso ao código Delphi. Considere a seção `Evidência Delphi confirmada` deste prompt, incluindo as matrizes douradas, como o pacote funcional legado autoritativo — trate-as como contrato de aceitação. Inspecione o checkout Laravel para confirmar o estado real (incluindo o que o spec 5 já entregou); corrija hipóteses contrariadas por evidência concreta e cite arquivo/trecho. Classifique descobertas Laravel como CONFIRMADO, INFERIDO, DÚVIDA, NÃO LOCALIZADO ou DIVERGENTE; preserve as classificações POSSÍVEL BUG LEGADO e DECISÃO NOVA já fornecidas.

## Limite desta entrega

Inclua:

- um serviço de **sugestão de lotes**: dado produto + filial (+ quantidade necessária), propõe uma decomposição `lote → quantidade` a partir do saldo disponível por lote, em ordem determinística e documentada — conveniência, nunca autoridade;
- um serviço/UI de **redistribuição**: o usuário ajusta a sugestão (move quantidade entre lotes) antes de confirmar; o servidor sempre revalida a soma e o saldo de cada lote no momento do comando de reserva já existente;
- a grade de lotes na aba Produtos do Cadastro (shell da Fundação), habilitada apenas para linhas com `gerenciar_lote=true`, sem duplicar a validação já feita pelo comando de reserva;
- a decisão e, se aplicável, a extensão aditiva necessária para popular `produtoscontratoslotes` (tabela legada, auditada por `trg_produtoscontratoslotes_audit_log_new`) a partir da decomposição confirmada — ver gap abaixo;
- um `ConferenceTypeAdapterInterface` para `CTR`, reaproveitando o `ConferenceEngine` genérico (open/scan/save) já usado por `ORC`/`LPA`, com identidade `CTR + numero atual do contrato`.

Não inclua: a mecânica de delta/lock/concorrência/idempotência/falta-venda-futura da reserva (spec 5, já pronta — apenas consuma seu ponto de extensão), séries (gate de faturamento, fora desta e da fatia anterior), consumo definitivo/transferência física/documentos fiscais (Etapa 5), devolução/troca pós-`F`, e a "conferência de cadastro" genérica de Cadastros (`/cadastros/conferencia-cadastro/*`) — ver desambiguação abaixo, é outro domínio com o mesmo nome.

## Fronteira de acesso às fontes

- Não tente localizar, abrir ou solicitar arquivos PAS, DFM ou data modules Delphi.
- As evidências abaixo, incluindo as matrizes douradas, já foram extraídas no workspace de análise a partir de `fmcadastrocontratos.pas/.dfm`, `dmcadastrocontratos.pas/.dfm` e `fmcadastroprodutoscontrato.pas/.dfm`.
- Use-as como requisitos legados de entrada, preservando classificações, sem exigir reconfirmação no código Delphi.
- Inspecione o checkout Laravel para confirmar o estado atual, especialmente o que o spec 5 já entrega, e construa a matriz de lacunas.

## Investigação Laravel obrigatória

- `App\Application\Vendas\Contratos\Cadastro\Commands\ExecuteContratoEstoqueReservaCommand` — ponto de extensão `lotDecomposition` por linha (bloqueio `lote_decomposicao_nao_suportada` quando ausente; `lote_quantidade_incompleta` quando a soma não bate exatamente com a quantidade da linha, sempre, em qualquer situação); normalização de linhas decompostas em chaves `(produto, filial, lote)` independentes.
- `App\Services\Vendas\Contratos\Estoque\FaltaVendaFuturaGate` — já impede produto com `gerenciar_lote` de cair em venda futura (bloqueio `lote_quantidade_incompleta` quando falta saldo na chave), confirmando a regra dourada sem necessidade de replicá-la aqui.
- `App\Infrastructure\Persistence\Legacy\Vendas\LegacyContratoEstoqueRepository::productFlags` — `gerenciar_lote` vem de `caracteristicas.gerenciarloteevalidade`; reaproveite esta mesma leitura, não crie uma segunda fonte de verdade para "produto controla lote".
- `App\Domain\Vendas\Contratos\Estoque\StockKey` — chave `(produto, filial, lote)` e ordem determinística de lock `filial → produto → lote` (`compareTo`/`sortKeys`); a sugestão/redistribuição deve gerar decomposições compatíveis com essa mesma ordem, nunca uma ordem própria divergente.
- Tabela `estoqueslotes` (saldo `emestoque`/`reservado`/`futuro` por produto+filial+lote) e tabela `lotes` (`lote`, `nrlote`, `fabricacao`, `validade`) — fontes de saldo e de metadados por lote já usadas por `App\Services\Vendas\ConsultaContratosLoteLookupService` (lookup de busca, não de saldo) e por `LegacyContratoEstoqueRepository`.
- `App\Application\Cadastros\Conferencia\ConferenceEngine`, `ConferenceTypeAdapterResolver`, `ConferenceVersionToken` e a interface `App\Domain\Cadastros\Conferencia\ConferenceTypeAdapterInterface` — motor genérico completo (open sem escrita, scan, save sob token, componentes/kits). `App\Infrastructure\Persistence\Legacy\Cadastros\Conferencia\Adapters\OrcConferenceAdapter` e `LpaConferenceAdapter` são os dois adapters existentes — use-os como precedente estrutural direto para `CtrConferenceAdapter`, incluindo os métodos obrigatórios da interface (`loadExpectedItems`, `assertSourceExists`, `authorizeView`/`authorizeUpdate`, `assertMutableSource`, `navigation`, `versionTokenMeta`, `availability`, `beforePersist`, `afterSave`).
- Registro dos adapters em `App\Providers\AppServiceProvider.php:358-362` (`ConferenceTypeAdapterResolver` recebe a lista de adapters no boot) — `CtrConferenceAdapter` deve ser adicionado à mesma lista, não a um resolver paralelo.
- **Desambiguação obrigatória**: `useCadastroConferenciaGate` (`resources/js/hooks/useCadastroConferenciaGate.ts`), `CadastroConferenciaDialog` e as rotas `/cadastros/conferencia-cadastro/check|resolve`, já referenciadas em `ProdutosTab.tsx` do Cadastro de Contratos, são um domínio **diferente** — um gate genérico de "conferência de cadastro" de parceiro (cliente/fornecedor), não a conferência de produtos por tipo `CTR`. Mesmo nome, mesma tela de Contratos, domínios distintos; não misture os dois na especificação.
- **Gap a resolver, não presumir**: nenhuma classe, repositório ou migration no checkout referencia `produtoscontratoslotes` (`NÃO LOCALIZADO`). O spec 5 já reserva e grava `movimentos`/`produtosreservas`/`estoqueslotes`, mas não a tabela legada que o Delphi audita fisicamente para o núcleo do Contrato (`trg_produtoscontratoslotes_audit_log_new`, `contrato`+`produto`+`filial`+`lote` — ver [Confirmar cobertura física das triggers de auditoria do Contrato](../../../.scratch/cadastro-contratos-wayfinder/issues/25-confirmar-cobertura-fisica-das-triggers-de-auditoria-do-contrato.md)). Decida e documente se este spec grava `produtoscontratoslotes` como projeção aditiva da decomposição confirmada (para paridade com Consulta/relatórios/auditoria física do Delphi) e, se sim, especifique exatamente onde esse insert entra na mesma transação do comando de reserva já existente, sem duplicar sua autoridade.
- `resources/js/Pages/Vendas/Contratos/Cadastro/tabs/ProdutosTab.tsx` — hoje sem nenhuma grade de lote; a UI desta fatia é inteiramente nova, integrada ao shell e às capabilities já calculadas no servidor pela Fundação.
- Rotas `vendas.contratos.transitions.invoke` e `vendas.contratos.estoque.prepare-faturamento` (`routes/web.php:2378-2386`) — precedente de nomenclatura para qualquer rota de leitura nova (ex.: sugestão de lotes) sob `vendas.contratos.estoque.*`.

## Evidência Delphi confirmada

### Sugestão e redistribuição de lotes

- O editor Delphi possui grade e botão de sugestão (`fmcadastroprodutoscontrato.dfm:3023-3089,3195,3533-3864`). A rotina apaga a sugestão anterior e percorre o estoque, consumindo cada saldo até completar a quantidade (`fmcadastroprodutoscontrato.pas:1634-1703`).
- Em `R`, a soma deve ser exatamente a quantidade da linha; lote excedente bloqueia. Em `O`, soma inferior pode ficar incompleta (ainda não reserva), mas soma superior sempre bloqueia (`dmcadastrocontratos.pas:19990-20108`).
- `DÚVIDA` preservada do ticket de casos dourados — a rotina não prova se a ordem de consulta do estoque por lote é FEFO, FIFO ou outra; não presuma FEFO como fato Delphi. Se este spec adotar uma ordem determinística (ex.: validade ascendente via `lotes.validade`), registre-a como `DECISÃO NOVA` própria do Laravel, não como paridade confirmada.
- Sugestão é sempre conveniência de preenchimento; o servidor sempre revalida e recalcula por `filial + produto + lote` no momento do comando — isso já é o comportamento do comando de reserva existente, este spec só precisa produzir uma decomposição plausível, nunca contornar essa revalidação.

### Matriz dourada de lotes

| Caso | Entrada | Resultado esperado |
|---|---|---|
| Sugestão | produto 5; L1=3, L2=4 | sugerir L1=3 e L2=2 na ordem da consulta |
| Soma inválida em `R` | produto 5; lotes somam 4 ou 6 | bloquear |
| Lote sem saldo | produto 5; lotes totalizam 4 | bloquear; venda futura não se aplica |
| Redistribuição | L1=3/L2=2 → L1=1/L2=4 | liberar 2 de L1 e reservar 2 em L2 atomicamente |
| Reexecução | mesma revisão/alocação | nenhum movimento adicional |

O bloqueio de soma inválida e o bloqueio de "lote sem saldo sem fallback de venda futura" já são responsabilidade do comando de reserva existente (`lote_quantidade_incompleta`, `FaltaVendaFuturaGate`); este spec deve garantir que a sugestão jamais proponha uma decomposição que dispare esses bloqueios em uso normal, e que a UI explique o erro quando o usuário editar manualmente para um estado inválido.

### Séries (fora de escopo — apenas fronteira)

- A exigência de série nasce da característica ou grupo; o Delphi cria/remove slots até igualar a quantidade e valida vazio/duplicidade (`dmcadastrocontratos.pas:3104-3175,18090-18103,18611-18617`; grade em `dmcadastrocontratos.dfm:12369-12520`).
- O momento efetivo é `Faturar`, antes de `InternoGravar` (`fmcadastrocontratos.pas:3873-3884`) — série não é movimento de `O→R` nem de alocação de lote; não pertence a este spec. Unicidade global e vínculo série–lote ficam para a fatia de faturamento/fiscal.

### Conferência `CTR`: identidade e comportamento

- O Delphi passa tipo `CTR` e usa `primogenito` quando preenchido, senão `numero` (`fmcadastrocontratos.pas:4102-4115`) — isso compartilhava a conferência entre contratos da mesma linhagem.
- `DIVERGENTE` — compartilhar leituras por `primogenito` pode dar como conferido um derivado com fotografia diferente da atual; não será reproduzido.
- `DECISÃO NOVA` — a identidade operacional é `CTR + numero atual do contrato`. `primogenito` fica só como linhagem/auditoria histórica, nunca como chave de leitura/gravação da conferência ativa.
- `DECISÃO NOVA` — alterar produto, quantidade, grade ou composição das linhas comerciais do Contrato invalida o token de versão da conferência `CTR` vigente (mesmo mecanismo de `ConferenceVersionToken`/`versionTokenMeta` já usado por `ORC`).
- A gravação fiscal Delphi pode alertar/bloquear produtos não conferidos (`MensagemProdutosNaoConferidosnaNF`, `dmcadastrocontratos.pas:7764-7779`) — este spec só entrega a conferência em si; o gate de bloqueio na emissão fiscal pertence à Etapa 9.
- Conferência comprova contagem; não reserva, não muda saldo de estoque e não substitui a autorização de falta/venda futura.

### Casos dourados `CTR`

Abrir sem cabeçalho é leitura pura; bipe repetido soma 1 e quantidade manual substitui; item estranho é rejeitado (mesmo comportamento restritivo de `ORC`: `allowsUnexpectedItems() = false`); save persiste só `CTR + numero atual`; fotografia alterada (produto/quantidade/grade/composição) causa conflito de token; contratos com mesmo primogênito ficam independentes na leitura/gravação; retry não duplica.

## Estado Laravel confirmado

- O comando de reserva (spec 5) já está implementado e testado (`ExecuteContratoEstoqueReservaCommand`, `FaltaVendaFuturaGate`, `StockKey`, testes em `tests/Feature/Vendas/Contratos/Cadastro/Estoque/ContratoReservaLoteBloqueioTest.php`), incluindo o bloqueio explícito de produto com lote sem decomposição e a validação de soma exata quando a decomposição é fornecida.
- Não existe hoje nenhuma sugestão automática, redistribuição ou UI de alocação de lotes para o Cadastro de Contratos — a mensagem de bloqueio do próprio comando já declara isso ("a sugestão automática de lotes ainda não está disponível nesta versão").
- Não existe gravação Laravel em `produtoscontratoslotes` (`NÃO LOCALIZADO`) — gap de paridade Delphi a resolver nesta fatia, não presumir que "escrever em `produtosreservas`/`estoqueslotes`/`movimentos`" já cobre a mesma superfície auditada fisicamente pelo Delphi.
- `ConferenceEngine` genérico, `ConferenceVersionToken`, `LegacyConferenceRepository` e dois adapters (`OrcConferenceAdapter`, `LpaConferenceAdapter`) já existem, registrados em `AppServiceProvider`; nenhum adapter `CTR` existe ainda.
- `ConsultaContratosLoteLookupService` já expõe busca/autocomplete de lote por código/nome para filtros — não é serviço de saldo nem de alocação; não confundir com o serviço de sugestão desta fatia.
- Existe um segundo mecanismo, não relacionado, também chamado "conferência" (`/cadastros/conferencia-cadastro/*`, gate de dados de parceiro) já integrado à aba Produtos do Contrato — risco real de colisão de nome que a especificação deve desambiguar explicitamente.

## Decisões obrigatórias

1. Sugestão de lotes é conveniência de preenchimento; nunca autoridade. A decomposição final sempre passa pela revalidação já existente no comando de reserva (soma exata, saldo por chave, ordem de lock `filial → produto → lote`) — este spec não introduz uma segunda validação divergente.
2. Adote e documente uma ordem determinística para a sugestão (ex.: `lotes.validade` ascendente); registre explicitamente que a paridade exata com a ordem de consulta Delphi permanece `DÚVIDA` e não foi provada como FEFO.
3. Em `O`, a grade de lotes pode ficar com soma incompleta (rascunho); o comando de `O → R` (spec 5) já exige soma exata — este spec não relaxa nem substitui essa exigência, apenas orienta a UI a permitir edição incompleta antes de enviar a transição.
4. Redistribuição entre lotes já reservados usa a mesma mecânica de troca de chave (liberar + reservar atômico) que o comando de reserva já aplica a troca de origem/produto — não é uma primitiva nova, é uma composição de deltas por `(produto, filial, lote)` enviada ao mesmo comando.
5. Reexecução com a mesma revisão/alocação não duplica movimento — herda a idempotência por `contrato + transição + revision` já implementada; este spec não cria uma chave idempotente paralela.
6. Resolva explicitamente o gap de `produtoscontratoslotes`: decida se e como esta fatia grava a tabela legada auditada fisicamente, e especifique o ponto exato de extensão sobre a transação do comando de reserva existente (aditivo, nunca um segundo gravador concorrente).
7. Identidade operacional da conferência `CTR` é `CTR + numero atual do contrato`; `primogenito` nunca é usado como chave de leitura ou gravação ativa, apenas como referência de linhagem histórica quando exibida.
8. Alterar produto, quantidade, grade ou composição das linhas comerciais invalida o token de versão da conferência `CTR` vigente; a conferência nunca movimenta estoque, reserva ou autoriza falta.
9. `CtrConferenceAdapter` implementa a interface existente e é registrado no mesmo `ConferenceTypeAdapterResolver` que já resolve `ORC`/`LPA`; não cria motor, tela, token ou repositório paralelo.
10. A especificação desambigua explicitamente `CTR` (conferência de produtos, `ConferenceEngine`) do gate não relacionado de "conferência de cadastro" (`/cadastros/conferencia-cadastro/*`) já presente na aba Produtos; nomeia os dois sem ambiguidade em toda a UI e documentação entregue.
11. Séries continuam inteiramente fora desta fatia — a grade de lotes não cria, sugere nem reserva espaço para série; isso é gate de faturamento (Etapa 5).
12. Autorização, capabilities e prova sensível desta fatia reaproveitam integralmente a matriz e a infraestrutura já fixadas na Fundação e usadas pelo comando de reserva — nenhum mecanismo de permissão ou senha paralelo.

## Contrato do serviço de sugestão/redistribuição

- Entrada: identidade/`revision` do Contrato, linha comercial (`produto`, `filial de origem`, `quantidade`) já estabilizada pelo motor comercial; decomposição atual (se houver, para redistribuição).
- Processo: ler saldo por lote da chave `(produto, filial)` na ordem determinística documentada; propor `lote → quantidade` até cobrir a quantidade da linha ou esgotar saldo; ao redistribuir, calcular apenas o delta entre a decomposição anterior e a nova.
- Saída: lista `lote → quantidade` (sugestão ou redistribuição), saldo restante por lote, avisos quando a sugestão não cobre a quantidade total.
- Este serviço nunca persiste nem reserva; sua saída alimenta o campo `lotDecomposition` do comando de reserva já existente, que permanece a única autoridade de gravação.

## Contrato do adapter `CtrConferenceAdapter`

- `loadExpectedItems`: projeta as linhas comerciais atuais do Contrato (produto, quantidade esperada agregada) na mesma forma usada por `OrcConferenceAdapter::loadExpectedItems`, incluindo expansão de compostos quando aplicável.
- `allowsUnexpectedItems`: `false` (mesmo comportamento restritivo de `ORC`).
- `assertSourceExists`/`assertMutableSource`: contrato existe e está em situação que permite conferência (`O`/`R`, a confirmar com a Fundação — `F/P/N/C` são somente leitura).
- `authorizeView`/`authorizeUpdate`: reaproveita a policy/capabilities do Cadastro de Contratos já definidas na Fundação, não uma policy nova.
- `navigation`: breadcrumb de volta ao Cadastro de Contratos (padrão de `OrcConferenceAdapter::navigation`).
- `versionTokenMeta`: inclui `numero atual` e fotografia relevante (produto/quantidade/grade/composição) das linhas comerciais — qualquer mudança nessas linhas muda o token.
- `beforePersist`/`afterSave`: sem efeitos colaterais de estoque/reserva; apenas persistência do resultado da conferência via `LegacyConferenceRepository` já existente.

## Testes obrigatórios

1. Toda a matriz dourada de lotes (5 casos) e todos os casos dourados de `CTR` (7 casos) como Feature tests.
2. Sugestão nunca propõe decomposição que exceda o saldo disponível por lote; redistribuição calcula delta correto e nunca "regrava o total".
3. Envio da decomposição sugerida ao comando de reserva existente (`ExecuteContratoEstoqueReservaCommand`) resulta exatamente no mesmo comportamento já coberto pelos testes do spec 5 — sem regressão e sem contorno da validação de soma exata.
4. Se este spec decidir gravar `produtoscontratoslotes`: teste de que a gravação ocorre na mesma transação do comando de reserva, é atômica com reserva/movimentos, e é compatível com leitura Delphi simulada (schema aditivo, sem quebrar a trigger de auditoria física).
5. `CtrConferenceAdapter`: identidade por número atual (não por primogênito), invalidação de token por mudança de produto/quantidade/grade/composição, rejeição de item inesperado, idempotência de save/retry.
6. Teste de regressão de nomenclatura: a UI/rota de `CTR` não reutiliza nem colide com `/cadastros/conferencia-cadastro/*` nem com os componentes `useCadastroConferenciaGate`/`CadastroConferenciaDialog`.
7. Autorização server-side: acesso à grade de lotes e à conferência `CTR` segue exatamente a matriz de capabilities/permissões já fixada na Fundação; payload manipulado no frontend não concede lote nem confirma conferência sem token válido.

Prefira Feature tests nos serviços/endpoints reais; reutilize os helpers de teste já existentes (`ContratoCadastroTestHelpers`, `ContratoEstoqueReservaTestHelpers`) e a suíte de testes de `ORC`/`LPA` como padrão de teste para o adapter `CTR`.

## Entregáveis

- Contrato do serviço de sugestão/redistribuição de lotes (entrada/processo/saída).
- Decisão documentada e desenhada para o gap de `produtoscontratoslotes`, incluindo o ponto exato de extensão sobre o comando de reserva existente.
- Contrato do `CtrConferenceAdapter` e seu registro no resolver existente.
- Matriz de evidência Delphi × Laravel, deixando explícito o que o spec 5 já cobre e o que esta fatia adiciona.
- Desambiguação clara e nomeada entre `CTR` (conferência de produtos) e a "conferência de cadastro" de parceiro já presente na tela.
- Critérios de aceitação e testes, incluindo as duas matrizes douradas (lotes e `CTR`) como suítes obrigatórias.
- Riscos, dúvidas (ordem de sugestão não comprovada como FEFO, unicidade/vínculo série–lote ainda pendente da fatia fiscal) e bloqueios que exijam nova investigação Delphi no workspace de análise.

## Fora de escopo

- implementar durante `/speckit.specify`;
- reabrir ou reescrever a mecânica de delta/lock/concorrência/idempotência/falta-venda-futura da reserva (spec 5, já implementada);
- séries, unicidade global e vínculo série–lote (gate de faturamento/fiscal);
- consumo definitivo de estoque, transferência física e documentos fiscais no faturamento (Etapa 5);
- devolução, troca e regularização de `P/N` pós-faturamento;
- o gate genérico de "conferência de cadastro" de parceiro (`/cadastros/conferencia-cadastro/*`) — domínio já existente e não relacionado;
- cálculo comercial (spec 3) e financeiro (spec 4) — este spec só consome linhas já estabilizadas;
- alterar o schema Delphi além de migrations aditivas para a decisão de `produtoscontratoslotes`.
```
