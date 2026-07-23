# Consolidar o prompt SpecKit — Motor de Sugestão de Compras

Type: task
Status: resolved
Blocked by: 15, 04, 05, 06, 07, 08, 09, 10, 14

## Question

Como consolidar as decisões de velocidade de vendas (04), estoque disponível (05), curva ABC/tabela redutora (06), fórmula final da sugestão (07), Produtos Similares (08), Produtos Grades (09), Detalhamento de Compra (10) e os critérios de aceite/testes relevantes (14) num prompt autocontido para `/speckit.specify`, publicado em `modules/estoque/consulta-compras/02-speckit-prompt.md`, construído sobre a Fundação/Parâmetros já especificada em `01-speckit-prompt.md` (ticket 15)?

## Answer

Consolidado em [`modules/estoque/consulta-compras/02-speckit-prompt.md`](../../../modules/estoque/consulta-compras/02-speckit-prompt.md), construído sobre a Fundação/Parâmetros. Cobre a fórmula completa de velocidade de vendas (3 fontes), Curva ABC/Tabela Redutora, a matriz dourada da fórmula final (com a divergência do "% acima do mínimo" documentada), Produtos Similares/Grades (cálculo independente + rollup) e o Detalhamento de Compra (fonte da precedência de valor). Declara fora de escopo a Requisição entre Filiais, a integração com Pedido e o Cadastro de Pedidos de Compra.
