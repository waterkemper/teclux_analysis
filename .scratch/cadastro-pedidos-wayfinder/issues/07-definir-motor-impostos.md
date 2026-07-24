# Definir o motor de Impostos — visão geral e orquestração principal

Type: grilling
Status: resolved
Blocked by: 05, 06

## Question

`TdtmCadastroPedidos.CalcularImpostos` (`dmcadastropedidos.pas:5085-5137`) é uma casca fina que delega para uma função **global**, `TdtmBasico.CalcularImpostos_` (`repositorio/dmbasico.pas:20573-26694`, ~6.122 linhas) — o motor fiscal usado pelo sistema inteiro (parametrizado por `OrigemCalculo`, cobrindo entrada e saída, com/sem nota fiscal, consumidor final, etc.), não uma rotina exclusiva de Pedidos. Dado que o usuário optou por mergulho completo (não só o contrato consumido por Pedidos), este ticket cobre a **visão geral**: a assinatura completa da função (todos os parâmetros: `CalcularIPI`, `CalcularTodos`, `Saida`, `Calculos`, `ProdutosCompostos`, `FiltrarComponentedoComposto`, `OrigemCalculo`, `VendaConsumidorFinal`, `ContribICMS`, `Servicos`, `NotaFiscalVinculada`, `msgDifAliquotaICMS`, `ReverAliquota`, `AlteracaoEspecifica`, `VerificarAcertoCentavos`, `qrynfe`, `Produtos`), o **corpo executável principal** (a partir de ~linha 23295, depois dos ~150 helpers locais — o laço item a item, a ordem em que cada família de imposto é calculada, tratamento de mensagens/avisos, o papel do `ClientDataSet Produtos`/`cdsProdutosPedidos` como snapshot de recálculo), e como especificamente a chamada feita por Cadastro de Pedidos (`dmcadastropedidos.pas:5116-5118`) se encaixa nesse universo maior (quais parâmetros o Pedido passa, quais ficam de fora/irrelevantes para compra).

As famílias de imposto individuais (ICMS normal, ICMS-ST, IPI, PIS/COFINS, Simples Nacional/CSOSN, DIFAL, rateio de frete/desconto/despesas acessórias + produtos compostos) são tickets próprios (13-19) — não duplicar aqui, só apontar a lista de helpers locais relevantes a cada um.

## Answer

### Assinatura completa (CONFIRMADO, `dmbasico.pas:20573-20581`)

```
function CalcularImpostos_(var ProdutosItens, Notas: TtecQuery;
  CalcularIPI, CalcularTodos, Saida: Boolean;
  Calculos, ProdutosCompostos: TTecQuery;
  FiltrarComponentedoComposto: Boolean;
  OrigemCalculo: TtecOrigemCalculo;
  VendaConsumidorFinal, ContribICMS: Boolean;
  Servicos: TtecQuery;
  NotaFiscalVinculada, msgDifAliquotaICMS, ReverAliquota: boolean;
  AlteracaoEspecifica: tpAlteracaoEspecifica;
  VerificarAcertoCentavos: boolean;
  qrynfe: TtecQuery;
  Produtos: TClientDataSet): boolean;
```

`OrigemCalculo: TtecOrigemCalculo` tem pelo menos os valores `NotaEntrada`, `CadastroPedidos`, `NotaAvulsa`, `TransferenciaEntrada` (vistos em uso ao longo da função) — o mesmo enum já referenciado nos tickets 02 e 06. `Calculos`/`Servicos`/`ProdutosCompostos`/`qrynfe` podem ser `nil` — vários trechos do corpo fazem `if calculos <> nil then ...`, ou seja, são **saídas opcionais** (usadas só quando o chamador quer o detalhamento por alíquota, ex.: para imprimir o quadro de impostos de uma nota — Pedido de Compra não precisa passar isso).

A chamada feita por Cadastro de Pedidos (`dmcadastropedidos.pas:5116-5118`) passa `CadastroPedidos` como origem, `cdsProdutosPedidos` como o parâmetro `Produtos` (snapshot ClientDataSet), e `nil` para `Calculos`/`ProdutosCompostos`/`Servicos`/`qrynfe` — confirma que Pedidos só precisa da fatia central de cálculo por item, não do detalhamento por alíquota nem do bloco de serviços.

### Estrutura do corpo executável (CONFIRMADO por amostragem estrutural, `dmbasico.pas:23296-26694`, ~3.400 linhas)

Não foi lida linha a linha (impraticável numa sessão) — mapeada por estrutura, localizando os 5 pontos onde a função reinicia a varredura de `produtos` (`produtos.First`) e o bloco final:

1. **Preparação** (`:23296-23481`): zera ~35 variáveis totalizadoras (uma por família de imposto/base — ICMS, ICMS-ST, ICMS-ST-custo, IPI, PIS, COFINS, DIFAL/FCP-UF-Dest, etc.), detecta se é importação (`HeImportacao`), lê totais pré-agregados do documento via **campos de agregação do dataset** (`AggFields`/`Aggregates.Find`, não recalculados aqui — vêm de agregações declaradas no dataset) quando disponíveis.
2. **Decisão de rateio + laço principal por item** (a partir de `:23785`): decide entre `CalcularRateios` (rateio completo de frete/desconto/ICMS/despesas acessórias entre itens, ticket 19) ou `CalcularRateioDespesasAcessorias` (só despesas acessórias, quando `AlteracaoEspecifica = tpAltEsp_DespesasAcessoriasNota` — uma edição pontual não exige rateio completo); depois entra no laço `produtos.first / while not produtos.eof` que calcula, item a item, ICMS/ICMS-ST/IPI/PIS/COFINS (chamando os helpers dos tickets 13-16) e credita/debita nos totalizadores.
3. **Ajuste de centavos do ICMS-ST** (`:25640-25670`): se a nota informa um `valoricmssubstituicao` que difere do somado por até R$0,10, ajusta a diferença no último item — **explicitamente reconhece `CadastroPedidos` como origem válida** (`OrigemCalculo in [NotaEntrada, CadastroPedidos, TransferenciaEntrada]`), confirmando que Pedidos exercita este ajuste.
4. **Rateio fino de base ICMS-ST-custo** (`:25671-25743`): segundo laço por item, também reconhecendo `CadastroPedidos`, redistribuindo a base de cálculo ST de custo quando a soma por item não bate com o total informado no documento.
5. **Sincronização + montagem do quadro `Calculos`** (`:25744-26608`): `AtualizarClientDataSet_to_TTecQuery` grava os valores calculados de volta no dataset real de itens; se `Calculos <> nil`, dois laços adicionais (um para ICMS, um para IPI) montam um resumo agregado por alíquota/CFOP — **não exercitado por Pedidos** (que passa `Calculos = nil`).
6. **Bloco de Serviços/ISS** (`:26608-26685`): calcula ISS sobre itens de serviço (`Servicos: TtecQuery`) — **não aplicável a Cadastro de Pedidos**, que só lida com produtos, nunca serviços; este bloco só é exercitado por Notas Fiscais que incluem serviços.

### Decisão

Para o Cadastro de Pedidos, a execução relevante é: preparação → rateio (se aplicável) → laço principal por item (ICMS/ICMS-ST/IPI/PIS/COFINS) → os dois ajustes finos de ICMS-ST (fases 3-4) → sincronização de volta ao dataset. As fases 5 (quadro `Calculos`) e 6 (serviços/ISS) existem na função mas não são exercitadas pela chamada de Pedidos — documentar sua existência (é parte do motor compartilhado) mas não é preciso especificá-las com profundidade neste mapa; ficam mais relevantes para um futuro mapa de Notas Fiscais/NF-e.
