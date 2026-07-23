# Definir Produtos Similares

Type: grilling
Status: resolved
Blocked by: 07

## Question

Como replicar a aba Produtos Similares (`qryProdutosSimilares`, `qryTotalProdutosSimilares`, e as variantes `_Similares` de todas as queries de totalização) — quando um produto tem substitutos considerados na sugestão de compra, como a quantidade sugerida se distribui ou se agrupa entre o produto principal e seus similares, e como a UI sinaliza (`ExisteSimilar`, destaque em negrito/azul no grid) que existe substituto disponível?

## Answer

### Cálculo independente por similar + rollup agregado — CONFIRMADO (`dmconsultacompras.dfm:11367-11600+`)

`qryProdutosSimilares` usa a **fórmula idêntica** da sugestão principal (ticket 07) — mesma cadeia `sugestao1`/`sugestao2`/`diasestoque_geral`/lookup na Tabela Redutora/`sugestao` final — aplicada a cada produto do grupo de similares (identificado por `produtosml`) de forma **independente**, não distribuída/rateada entre eles.

`qryTotalProdutosSimilares` monta uma linha `'TOTAL'` por grupo de similares (`GROUP BY produtosml`), somando (`SUM`) os campos já calculados de cada similar individualmente: `total_estoque`, `emestoque`, `total_transito`, `reservado`, `reservaprevia`, `futuro`, `total_pedido`, `total_pedidos_fornecedores`, `total_pedidos_filiais`, `total_vendido`, `sugestao`, `minimo`/`sugestaominimo`, `maximo`/`sugestaomaximo`. `diasestoque`/`diasestoquecompedidosdecompra` no nível TOTAL são **recalculados a partir das somas agregadas** (estoque total combinado / velocidade de venda combinada), não somados diretamente dos valores individuais de cada similar.

### Definição de "quem é similar de quem" (CONFIRMADO, `dmconsultacompras.dfm:140-210`, dentro da query principal)

`produtos_similares` (tabela `ps`, campo `similar`) define pares produto↔substituto. Quando o campo `agrupamentosimilares` da característica do produto é `'L'` (linha/grade1), o agrupamento amplia para **todos os produtos que compartilham o mesmo `valorgrade1`+`grade1`** (ex.: todas as cores de um mesmo modelo); quando é `'C'` (coluna/grade2), amplia por `valorgrade2`+`grade2`; caso contrário, usa o mapeamento direto e explícito de `produtos_similares`. `ExisteSimilar` (boolean na query principal) é verdadeiro quando essa busca encontra pelo menos um produto substituto — controla a visibilidade da aba (`ComprasTotalAfterScroll`: `tstProdutosSimilares.TabVisible := ExisteSimilar`) e o destaque em negrito/azul no grid principal.

### Decisão

Fecha conforme investigado — cálculo independente por similar usando a fórmula do ticket 07, com rollup agregado para a linha TOTAL, sem lógica de distribuição ou rateio adicional a especificar.
