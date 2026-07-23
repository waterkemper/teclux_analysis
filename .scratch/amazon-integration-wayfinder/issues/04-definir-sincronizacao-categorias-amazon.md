# Definir a evolução da sincronização de categorias Amazon

Type: grilling
Status: resolved
Blocked by: 01, 02

## Question

O stub existente (`AmazonCategoryDriver`, tabela legada `categorias_amazon`) cobre hoje só uma classificação estática. Como evoluir para sincronização real de categorias/browse nodes da SP-API — reaproveitando o mesmo padrão de vínculo classificação→categoria já usado por `codigo_categoria_mercadolivre`/Magalu (campo dedicado por classificação), ou algo estruturalmente diferente dado que categorias Amazon têm atributos obrigatórios variáveis por tipo de produto? Como tratar categorias que exigem aprovação prévia da Amazon antes de permitir publicação?

## Answer

### Decisão: o vínculo de classificação aponta para o product type, não para um "código de categoria"

**DECISÃO DO USUÁRIO**: diferente de `codigo_categoria_mercadolivre`/Magalu (onde o vínculo é literalmente um código de categoria), o campo de vínculo por classificação para Amazon (`codigo_product_type_amazon` ou nome equivalente) guarda o **product type** — a chave real de schema/publicação confirmada no ticket 01 (Product Type Definitions API). Browse node vira metadado secundário/derivado (usado só para a recomendação de descoberta — `getRecommendedBrowseNodesOrItemTypeKeywords` — e não como chave de vínculo). Isso é uma divergência deliberada do padrão visual "código de categoria" usado por ML/Magalu, escolhida por fidelidade ao modelo real da Amazon em vez de consistência superficial de UI.

Evolução do stub: `AmazonCategoryDriver` (hoje só lê `categorias_amazon` legado) precisa de uma nova fonte de dados — sincronização via `searchProductTypes` (por palavra-chave) + `getDefinitionsProductType` (schema completo por product type + marketplace) — substituindo/complementando a tabela legada estática. A tabela `categorias_amazon` legada pode continuar como referência/contexto de migração, mas não é a fonte de verdade do schema de publicação.

### Decisão: checagem proativa de restrição antes de publicar

**DECISÃO DO USUÁRIO**: antes de qualquer tentativa de publicação, o sistema chama `getListingsRestrictions` (ASIN, quando já descoberto via Catalog Items, + brand + product type) e bloqueia a publicação com mensagem clara em português — incluindo, quando a API retornar, o `reasonCode` e o link/próximo passo de aprovação — em vez de deixar o operador tentar publicar e só então descobrir o bloqueio pela resposta de erro da Amazon. Isso também cobre a checagem de elegibilidade de isenção de GTIN (mesma chamada, ver ticket 01 seção 3.2/4.1).

### DÚVIDA carregada do ticket 01

Exemplos concretos de categorias/marcas gated e o processo exato de solicitação de isenção de GTIN ficaram atrás de login no Seller Central — a spec final deve registrar isso como validação pendente com acesso real à conta do tecLUX antes da implementação, não bloqueando a especificação em si (a checagem via `getListingsRestrictions` é programática e não depende de conhecer a lista antecipadamente).
