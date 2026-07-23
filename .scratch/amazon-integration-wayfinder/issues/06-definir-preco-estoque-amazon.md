# Definir as regras de preço e estoque para a Amazon

Type: grilling
Status: resolved
Blocked by: 02, 05

## Question

As regras já estabelecidas na spec 190 (percentual de estoque site sobre `estoques.emestoque` da filial de estoque da conta; precificação por margem final desejada com fallback para margem mínima marketplace) se aplicam à Amazon com paridade total (como a Magalu adotou), ou a Amazon exige alguma regra própria (ex.: preço mínimo por categoria, taxas de referral variáveis por categoria que afetam a margem líquida)?

## Answer

### Estoque: paridade total com ML/Magalu

Sem decisão nova necessária — a regra de percentual de estoque site sobre `estoques.emestoque` (filial de estoque da conta) já é canal-agnóstica na spec 190; a Amazon reaproveita sem ajuste, mesma regra de arredondamento (parte inteira) já usada por ML/Magalu.

### Preço: DECISÃO DO USUÁRIO — incorporar a taxa de referral da Amazon no cálculo de margem

Diferente da paridade total adotada pela Magalu, a precificação Amazon **deduz a taxa de referral** (comissão percentual sobre o preço de venda, variável por categoria/product type) antes de aplicar a margem final desejada — preservando a intenção real de margem líquida do lojista, que a fórmula "crua" de ML/Magalu não capturaria dado o peso da taxa Amazon.

**Mecanismo escolhido**: tabela de referência de percentuais de taxa por categoria/product type, cadastrada/atualizada manualmente (não uma chamada síncrona a `getMyFeesEstimateForSKU` por cálculo de preço). Motivo: `getMyFeesEstimateForSKU` (Product Fees API) exige um preço de venda como entrada — a taxa pode variar por faixa de preço —, criando uma dependência circular com o cálculo de margem-alvo (preço depende da taxa, taxa depende do preço). Resolver isso com chamada iterativa (estimar → recalcular → reestimar até convergir) foi descartado para o MVP por complexidade/latência; a tabela de referência aceita alguma imprecisão em faixas de preço incomuns em troca de um cálculo síncrono e simples, consistente com o resto do motor de precificação.

**Implicação de escopo**: a especificação final precisa definir onde essa tabela de percentuais por categoria/product type é cadastrada (Configuration Center? uma tela própria de "Taxas Amazon"?) e como ela se referencia ao vínculo de classificação → product type já decidido no ticket 04 — ponto a detalhar na consolidação final (ticket 10), não uma nova decisão de arquitetura em aberto.
