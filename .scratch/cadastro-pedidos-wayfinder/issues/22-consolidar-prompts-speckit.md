# Consolidar o(s) prompt(s) SpecKit

Type: task
Status: open
Blocked by: 21

## Question

Decidir e produzir o(s) prompt(s) `/speckit.specify` finais, publicados em `modules/estoque/cadastro-pedidos/`. Decisão de fatiamento a tomar aqui (não antecipar): dado que o motor de custo/formação de preço/impostos (tickets 06-08, 13-19 — 11 tickets, a fatia individualmente maior que todo o resto do mapa somado) foi decidido como peça própria e reaproveitável (Notes do mapa), é provável que saia como prompt(s) dedicado(s), separado(s) do prompt do Cadastro de Pedidos propriamente dito (cabeçalho, previsões, itens, grade, cópia, documentos a pagar, acessórios — tickets 01-05, 09-12). Considerar também se o motor de impostos, dado seu tamanho (~6.122 linhas documentadas em 8 tickets), justifica mais de um prompt por si só (ex.: um prompt "núcleo do motor" + referência às famílias fiscais como anexo, ou um prompt por família). Cada prompt deve seguir o mesmo formato já usado em `modules/estoque/consulta-compras/`.
