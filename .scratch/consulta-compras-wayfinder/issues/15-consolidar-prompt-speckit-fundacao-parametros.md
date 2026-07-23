# Consolidar o prompt SpecKit — Fundação/Parâmetros da Consulta de Compras

Type: task
Status: resolved
Blocked by: 03, 14

## Question

Como consolidar a decisão de parâmetros de Filial/Grupo Filial e filtro de produtos (03) e os critérios de aceite/testes relevantes (14) num prompt autocontido para `/speckit.specify`, publicado em `modules/estoque/consulta-compras/01-speckit-prompt.md`, no mesmo formato dos demais prompts SpecKit do repositório?

## Answer

Consolidado em [`modules/estoque/consulta-compras/01-speckit-prompt.md`](../../../modules/estoque/consulta-compras/01-speckit-prompt.md). Cobre Filial/Grupo Filial (com a ambiguidade replicada fielmente), o filtro de produtos seguindo o padrão da Consulta de Estoques, período de vendas com recálculo bidirecional, os 7 checkboxes de estoque, e a confirmação de que quase não há Parâmetros do Sistema embutidos nesta tela. Declara fora de escopo o cálculo da sugestão, a Requisição entre Filiais e o Cadastro de Pedidos de Compra.
