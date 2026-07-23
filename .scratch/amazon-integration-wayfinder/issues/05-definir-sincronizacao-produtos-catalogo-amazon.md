# Definir a sincronização de produtos/catálogo Amazon

Type: grilling
Status: resolved
Blocked by: 01, 02, 04

## Question

Como mapear produto ERP → listing Amazon (`produtos` + `caracteristicas`, fotos, código de barras/EAN, dados fiscais, grades/variações — mesmas fontes legadas já usadas por ML/Magalu), respeitando o modelo ASIN-vs-SKU e os atributos obrigatórios por tipo de produto/categoria da SP-API (ticket 01)? Publicação inicial deve ser ativa imediatamente (paridade ML) ou a Amazon exige revisão prévia por categoria/compliance antes de ativar?

## Answer

### Mapeamento produto ERP → listing (base: mesmas fontes legadas de ML/Magalu)

`produto_codigo` (ERP) é a chave de correlação enviada como seller SKU à Amazon (`erp_marketplace_product_links.external_sku`/`external_listing_id`, mesmo padrão de ML/Magalu — ver ticket 02). ASIN retornado pela Amazon é armazenado como metadado de catálogo, não como chave de idempotência (o SKU já existe antes do ASIN ser atribuído). Fotos, EAN/GTIN, dados fiscais (NCM) seguem as mesmas fontes (`produtos`, `caracteristicas`, `estoques`) já usadas por ML/Magalu. O payload exato por item varia conforme o **product type** resolvido (ticket 04) — a Product Type Definitions API fornece o schema JSON a validar antes de montar o `putListingsItem`.

### Ativação imediata, condicionada à checagem proativa do ticket 04

Decorre diretamente da decisão do ticket 04: como a restrição de categoria/marca/GTIN é checada **antes** de qualquer tentativa de publicação (`getListingsRestrictions`), quando a checagem passa, a publicação segue o mesmo padrão do Mercado Livre — **ativa imediatamente** após confirmação no ERP, sem estado de rascunho/revisão manual adicional. Quando a checagem bloqueia, a publicação nem é tentada (ver ticket 04) — não existe um terceiro estado de "pendente de revisão Amazon" a modelar.

### DECISÃO DE ESCOPO (ampliação sobre a spec 202): grades/variações usam o modelo nativo pai/filho da Amazon

**DECISÃO DO USUÁRIO**: ao contrário da proposta inicial (tratar cada variante de grade como item independente, replicando o comportamento atual da Magalu), o usuário optou por implementar de fato o **agrupamento nativo pai/filho da Amazon** (`parentageLevel: PARENT`/`CHILD`, confirmado no ticket 01) — a forma que a própria Amazon recomenda para variações, e não um workaround de achatamento. Isso **amplia o escopo** além do que a spec `202-grade-variations-marketplace` havia decidido originalmente para Amazon (hoje só um "contrato preparatório ou stub que recusa modo agrupado até implementação futura", igual ao tratamento dado a NuvemShop).

Implicação arquitetural: a integração Amazon estende a arquitetura genérica de família já construída na spec 202 (carregamento/validação de família por característica, modo de variação configurável por canal) para implementar o modo `family_under_parent` no `AmazonConnector` — mesmo padrão já entregue para o Mercado Livre nessa spec, não um mecanismo novo do zero. Isso deve ser explicitado na especificação final (ticket 10) como uma extensão consciente da 202, coordenada com quem é dono dessa spec, não uma reinvenção paralela.
