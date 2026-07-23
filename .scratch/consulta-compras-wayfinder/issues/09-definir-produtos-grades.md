# Definir Produtos Grades

Type: grilling
Status: resolved
Blocked by: 07

## Question

Como replicar a aba Produtos Grades (`qryProdutosGrades`, `qryTotalProdutosGrades`) — a sugestão de compra quando o produto tem variantes de grade (linha/coluna, evidenciadas por `GetLinhadaGrade`/`GetColunadaGrade` e os títulos dinâmicos "valorgrade1"/"valorgrade2" no grid), e como isso se relaciona com Produtos Similares (ticket 08) quando um produto tem simultaneamente grade e similares?

## Answer

### Mesmo padrão do ticket 08, confirmado por comparação estrutural (`dmconsultacompras.dfm:19251-19370`)

`qryTotalProdutosGrades` tem exatamente a mesma estrutura de `qryTotalProdutosSimilares` (ticket 08) — soma (`SUM`) os campos já calculados individualmente por `qryProdutosGrades` (mesma fórmula de sugestão do ticket 07, aplicada a cada variante de grade) numa linha `'TOTAL'`, com `diasestoque`/`diasestoquecompedidosdecompra` recalculados a partir das somas agregadas. A diferença é o agrupamento: `qryTotalProdutosGrades` agrupa por `produto` (variantes de grade do **mesmo** produto — ex.: mesma peça em cores/tamanhos diferentes, via `valorgrade1`/`valorgrade2`), enquanto Similares agrupa por `produtosml` (família de produtos **diferentes** substitutos entre si).

### Independência de Grades e Similares — CONFIRMADO por ausência de controle cruzado

Diferente da aba Similares (`tstProdutosSimilares.TabVisible` controlado por `ExisteSimilar`), não existe nenhum toggle `tstProdutosGrades.TabVisible` no código — a aba Grades não é condicionalmente ocultada; fica sempre disponível, mostrando o que houver (vazio se o produto não tiver grade). As duas abas são **independentes e paralelas**: nenhuma lógica de código cruza ou prioriza uma sobre a outra quando um produto tem simultaneamente grade e similares — cada uma calcula e exibe seu próprio agrupamento sem interferência mútua.

### Decisão

Mesmo padrão do ticket 08 (cálculo independente por variante + rollup agregado), sem necessidade de nova interação — a única diferença relevante (agrupamento por `produto`+grade em vez de por família de similares, e a aba sempre visível) já está documentada acima com evidência direta.
