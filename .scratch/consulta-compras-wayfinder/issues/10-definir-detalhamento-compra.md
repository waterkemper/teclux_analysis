# Definir o Detalhamento de Compra (preço/custo)

Type: grilling
Status: resolved
Blocked by: 01

## Question

Como replicar o Detalhamento de Compra (`qryDetalhesCompra`, `qryDetalhesPrecos`) — a ordem de precedência de valor do produto já evidenciada em `DefinirValorProduto` (preço com ICMS → valor da última compra → custo médio, usada para pré-popular o pedido gerado), e como esses detalhes de preço/custo aparecem na tela de Consulta antes de gerar qualquer pedido?

## Answer

### `qryDetalhesCompra` — lado do custo/compra (CONFIRMADO, `dmconsultacompras.dfm:2081-2282`)

Por produto+filial, seleciona exatamente **uma** linha de `estoques` (a mais recente com dado de compra válido: `datacompra IS NOT NULL`, `precocomicms IS NOT NULL`, escolhida por `datacompra DESC` com desempate pela maior quantidade combinada em estoque) e expõe: `precocomicms`, `precosemicms`, `qtdecompra`, `aliquotaipi`, `valorultimacompra`, `datacompra`, `datacadastro`.

Além disso calcula:
- **`customedio`** = média ponderada de custo entre **todas** as filiais do produto: `SUM(estoques.financeiro) / SUM(emestoque+reservado+reservaprevia+transito+demonstracao+conserto+danificada)`, só considerando linhas com estoque e `financeiro` não-zero, opcionalmente restrita por `%CondicaoListaFiliais`.
- **`markup`** (CalcField) = percentual do preço normal de venda (`colunasprecos`, coluna `filiais.preconormal`) acima do custo unitário calculado para aquela linha específica de `estoques`.
- **`descricaopreco`** = descrição da tabela de preço do produto.

Esta é exatamente a fonte que `DefinirValorProduto` (já confirmado em `fmconsultacompras.pas:1301-1313`) consulta na ordem **`precocomicms` → `valorultimacompra` → `customedio`** para pré-popular o valor unitário ao gerar o Pedido de Compra (ticket 12) — os três campos já vêm calculados aqui, prontos para essa precedência.

### `qryDetalhesPrecos` — lado da venda (CONFIRMADO, `dmconsultacompras.dfm:12941-13000+`)

Complementar, do lado do preço de **venda ao consumidor**: `valornormal` e `valorpromocao` (ambos ajustados por um fator por filial, `fpf.fator`, quando existir) e `validade` (a maior entre a validade do preço normal e da promoção). Não participa da precedência de `DefinirValorProduto` — é só informativo, dando ao usuário visibilidade do preço de venda atual ao lado do custo, antes de decidir gerar o pedido.

### Decisão

Ambas as queries são replicadas como estão — não há ambiguidade nem decisão de negócio pendente aqui além da fidelidade já estabelecida nos tickets anteriores.
