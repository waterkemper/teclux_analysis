# Definir o motor de Impostos — rateio de frete/desconto/despesas acessórias e produtos compostos

Type: grilling
Status: resolved
Blocked by: 05

## Question

Dentro de `TdtmBasico.CalcularImpostos_` (`repositorio/dmbasico.pas:20573-26694`), documentar duas questões relacionadas:

1. **Rateio proporcional**: `rateardesconto`/`descontodigitado`/`numeroregistrodescontoalterado` e `ratearfrete`/`fretedigitado`/`numeroregistrofretealterado` (`dmbasico.pas:22432-22481`), mais as variáveis de totais rateados (`FreteRateado`, `DescontoRateado`, `SeguroRateado`, `AcrescimoRateado`, e os acumuladores `TotalDescontoItem*`/`TotalLiquidoProdutos*`/`TotalProdutos*` declarados no cabeçalho da função). Esta é a lógica **real** de distribuição proporcional de frete/desconto/despesas acessórias entre os itens de um pedido/nota — **distinta** de `TdtmCadastroPedidos.RatearFrete`/`RatearDesconto` (`dmcadastropedidos.pas:5060-5083`, já lidos no ticket 06: aqueles só zeram o campo do item atual e desmarcam a flag "digitado", devolvendo o controle para este rateio automático). Confirmar essa relação (o `dmcadastropedidos` só "solta" o campo; quem efetivamente recalcula e distribui é `CalcularImpostos_` aqui).
2. **Produtos compostos**: `ProdutosCompostos: TTecQuery`, `FiltrarComponentedoComposto: Boolean` (parâmetros da função), `PrecoComponente`/`HeComponente` (`:21055-21068`). Como o cálculo de imposto trata um produto composto (kit) versus seus componentes — o imposto é calculado no produto pai, nos componentes, ou em ambos?

## Question (contexto adicional)

Cruzar com os botões "Ratear Valor Total Produtos"/"Ratear Valor Total Frete" já identificados em `fmcadastroprodutospedidos_.pas:535-548` (ticket 01).

## Answer

### Rateio proporcional (CONFIRMADO, `CalcularRateioDespesasAcessorias`, `dmbasico.pas:22514-22692`, e `CalcularRateios`, `:22694-...`, estrutura idêntica para Desconto e, mais adiante no mesmo procedimento, Frete)

Padrão idêntico para os 3 tipos (desconto, frete, despesas acessórias) — confirmado lendo `CalcularRateioDespesasAcessorias` por completo e o início de `CalcularRateios` (estrutura idêntica, só troca o campo):

1. **Limpa** o campo (desconto/frete/despesasacessorias) de todos os itens que **não** foram digitados manualmente (`not descontodigitado`/`not fretedigitado`/`not DespesasAcessoriasDigitada`) e que a nota não está "relacionada com outra" (ou a alteração específica é exatamente sobre esse campo) — conta quantos itens (`t`) entram no rateio.
2. **Valor a ratear** = total do documento **menos** a soma do que já foi digitado manualmente item a item (`vTotalDescontoDigitado`/`vTotalFreteDigitado`/`vTotalDespesasAcessoriasDigitada`) — nunca negativo (trava em 0).
3. Para cada item elegível, na ordem: se é o **último** item do lote (`i = t`), recebe o **saldo restante inteiro** (absorve o resto de arredondamento — mesmo padrão de "última linha absorve o resto" já visto em Previsões, ticket 04, e no motor de Custo, ticket 06); senão, recebe uma fração **proporcional ao seu peso no total líquido de produtos** (`preço unitário × quantidade × valor_a_ratear / total_líquido_não_digitado`), indo para o próximo item.
4. **Produtos compostos (kits)**: "o composto não entra, só os componentes e os não-compostos" (comentário explícito no código, `:22579-22582`, repetido em `CalcularRateios`) — o produto-pai (kit) nunca recebe rateio diretamente, para não duplicar valor entre pai e componentes; em vez disso, quando o item é um componente (`HeComponente`), sua fração é calculada com uma fórmula própria baseada no preço do componente dentro do kit-pai (`precocomponente × qtd do composto × qtd do item × valor do campo no composto / (qtd do composto × precovenda do composto)`) — ou seja, o valor a ratear entre os componentes vem do **próprio composto pai** (`ProdutosCompostos.despesasacessorias`/`.desconto`/etc.), não do total geral do documento.

### Botões manuais "Ratear Valor Total Produtos"/"Ratear Valor Total Frete" (INFERIDO)

Não localizados nos arquivos-núcleo (handlers de UI em `fmcadastroprodutospedidos_.pas:535-548`, fora do escopo lido) — pela nomenclatura e pelo padrão do resto do motor, a inferência mais provável é que disparem manualmente este mesmo rateio (`CalcularRateios`) sob demanda, para o caso em que o usuário quer redistribuir depois de já ter digitado valores manualmente em algumas linhas. Não confirmado — mesma ressalva de DÚVIDA já aplicada aos botões "Gerar Total" nos tickets 15-16.

### Decisão

Especificar o rateio como um algoritmo único reaproveitado para desconto/frete/despesas acessórias: (1) valor a ratear = total do documento menos soma dos valores digitados manualmente; (2) distribuição proporcional ao peso de cada item no total líquido não-digitado; (3) o último item do lote absorve o resto de arredondamento; (4) produtos compostos nunca recebem rateio diretamente — só seus componentes, com base proporcional ao preço do componente dentro do kit-pai, usando o valor já rateado para o composto (não o total geral). Direção exata dos botões manuais de rateio fica como DÚVIDA a confirmar na implementação.
