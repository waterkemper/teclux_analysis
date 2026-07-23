# Research: Amazon Selling Partner API (SP-API) — grounding para integração Amazon

**Data da pesquisa**: 2026-07-21
**Escopo**: Input factual para os tickets de arquitetura da integração Amazon (conexão de conta, sync de categorias, sync de catálogo, preço/estoque, orquestração/rate-limit). Fontes primárias: `developer-docs.amazon.com` (redireciona para `developer-docs.amazon` — mesmo domínio Amazon, apenas sem `.com`; tratado como a mesma fonte oficial), `sellercentral.amazon.com/help`, discussões oficiais do repositório `amzn/selling-partner-api-models` no GitHub (mantido pela Amazon).

**Nota técnica sobre navegação**: toda URL `developer-docs.amazon.com/...` retornou HTTP 301 para `developer-docs.amazon/...` (mesmo path, domínio sem `.com`). As citações abaixo usam a URL final (pós-redirect) que foi de fato buscada.

---

## 1. Modelo de autenticação

### 1.1 Fluxo OAuth2 / LWA (Login with Amazon)

**CONFIRMADO**. SP-API usa LWA para todo o ciclo de autenticação:

- Aplicações **públicas**: o vendedor inicia a autorização "either from your website or from the Selling Partner Appstore", passa por um workflow OAuth com redirecionamento, e ao final a aplicação recebe um **refresh token**. Renovação da autorização é **anual**, ou quando se quer solicitar novos "roles" para vendedores já autorizados, feita em "Manage Your Apps" no Seller Central.
  Fonte: [Authorize Applications](https://developer-docs.amazon/sp-api/docs/authorizing-selling-partner-api-applications)
- Aplicações **privadas**: **self-authorization** — o próprio desenvolvedor autoriza via Seller Central, Vendor Central ou Solution Provider Portal, sem workflow OAuth de terceiro a implementar.
  Fonte: mesma página acima; também [Register as a Private SP-API Developer](https://developer-docs.amazon/sp-api/docs/register-as-a-private-developer)
- Em runtime, a troca de **refresh token → access token** é feita com `POST https://api.amazon.com/auth/o2/token`, `grant_type=refresh_token` (+ `refresh_token`, `client_id`, `client_secret`). O access token expira em **1 hora** ("The LWA access token expires one hour after it is issued.").
  Fonte: [Connecting to the Selling Partner API](https://developer-docs.amazon/sp-api/docs/connecting-to-the-selling-partner-api)
- Cada chamada à SP-API carrega o access token no header **`x-amz-access-token`** (mais `x-amz-date`, `user-agent`, `host`).
  Fonte: mesma página acima.

Isso é o mesmo padrão de "authorization_code + refresh_token" já usado nos providers `MercadoLivreOAuthProvider`/`MagaluOAuthProvider` do repo (ver `specs/188-mercado-livre-integration/research.md`, D2) — plausivelmente reaproveitável no `MarketplaceOAuthProviderRegistry`, exceto que o **grant type de runtime** do Amazon é `refresh_token` contra o endpoint LWA genérico (`api.amazon.com/auth/o2/token`), não um endpoint proprietário do marketplace como ML/Magalu.

### 1.2 SigV4 / IAM — status atual (ponto crítico do ticket)

**CONFIRMADO — SigV4/IAM foi REMOVIDO como requisito de assinatura de requisição, a partir de 2 de outubro de 2023.**

Fonte primária, changelog oficial: [SP-API no longer requires AWS IAM or AWS Signature Version 4](https://developer-docs.amazon/sp-api/changelog/sp-api-will-no-longer-require-aws-iam-or-aws-signature-version-4)

Citações-chave:
- "Starting **October 2, 2023**, SP-API no longer requires the use of AWS Identity and Access Management (IAM) or AWS Signature Version 4" — ou seja, **não é preciso registrar recursos IAM nem assinar requisições SP-API com AWS SigV4**.
- Autenticação passa a depender **exclusivamente** de tokens LWA: "SP-API will continue to use Login with Amazon (LWA) access tokens for each SP-API request."
- Compatibilidade retroativa: requisições que ainda enviarem assinatura SigV4 simplesmente têm a assinatura **ignorada** ("we'll disregard the signature and proceed with LWA authorization") — ou seja, não quebra clients legados, mas o SigV4 não tem mais efeito algum.
- SDKs Java/C# v2.0 (sem SigV4) disponíveis a partir dessa data; SDKs v1.0 (com assinatura AWS opcional) foram depreciados até o fim de 2023.
- Aplica-se **a todas as regiões** e a todos os desenvolvedores já registrados antes de 2/out/2023.

**Confirmação cruzada — página de registro de app não menciona mais IAM**: [Register your Application](https://developer-docs.amazon/sp-api/docs/registering-your-application) (atualizada há poucos dias no momento da pesquisa) descreve o fluxo de registro apenas como "Solution Provider Portal → Develop Apps → Add new app client → completar formulário", **sem** nenhuma menção a IAM Role, IAM User ou ARN. Da mesma forma, [SP-API Registration Overview](https://developer-docs.amazon/sp-api/docs/sp-api-registration-overview) não cita IAM/ARN — apenas remete à página de "roles" (ver 1.3) para decidir quais permissões solicitar.

**DÚVIDA (ruído descartado)**: buscas na web trazem várias páginas de terceiros (blogs de agências, `ecomsellertool.com`, `jesseevers.com`) que ainda descrevem "criar um IAM Role, salvar o ARN, informar no registro do app" como se fosse etapa atual obrigatória. Essas são conteúdo desatualizado (pré-outubro/2023) ou nunca revisado — **não refletem** as páginas oficiais atuais, que foram checadas diretamente e não mencionam IAM/ARN em nenhum lugar do fluxo de registro/conexão hoje. Conclusão para o ticket: **não modelar nenhuma dependência de IAM/AWS SDK/SigV4 no design do conector Amazon** — é HTTP + Bearer token puro, mais simples que o inicialmente suposto no `map.md` deste esforço (que ainda cita "AWS IAM role" como parte do modelo, item a corrigir/atualizar quando o mapa for revisado por um humano).

### 1.3 Exceções ao "token Bearer simples": operações restritas e grantless

**CONFIRMADO** — dois casos especiais dentro do modelo LWA (nenhum envolve SigV4/IAM):

1. **Restricted Data Token (RDT)** — para operações que retornam PII ("restricted operations"). Em vez do access token normal, usa-se um RDT no mesmo header `x-amz-access-token`. O RDT é obtido chamando `createRestrictedDataToken` da **Tokens API**, autenticado com um access token LWA comum.
   Fonte: busca cruzada confirmando `createRestrictedDataToken` — [Tokens API](https://developer-docs.amazon.com/sp-api/docs/tokens-api) / [createRestrictedDataToken](https://developer-docs.amazon/sp-api/reference/createrestricteddatatoken)
   Relevância para este projeto: dados de catálogo/listagem (ASIN, SKU, preço, estoque) **não são PII** — RDT não deve ser necessário no fluxo principal de catálogo, só entraria em cena se o MVP algum dia tocar dados de comprador/pedido (fora de escopo, ver `map.md`).
2. **Grantless operations** — chamadas que não exigem autorização prévia do vendedor (ex.: parte da Notifications API, como `deleteSubscriptionById`). Usam `grant_type=client_credentials` em vez de `refresh_token`, com um parâmetro `scope` (ex.: `sellingpartnerapi::notifications`) no lugar do refresh token.
   Fonte: [Grantless Operations](https://developer-docs.amazon.com/sp-api/docs/grantless-operations)
   **INFERIDO**: operações de catálogo/listings usadas neste projeto (Listings Items, Catalog Items, Product Type Definitions) são todas autorizadas via refresh token do vendedor — não são grantless nem restritas. Não há indicação em nenhuma página consultada de que catalog/listings sejam grantless ou PII-restricted.

### 1.4 Roles (escopos de permissão) para catálogo/listings

**CONFIRMADO (parcial)** — o registro de app pede "roles" que determinam quais operações a app pode chamar: "Developer profile registration requires you to select an initial set of roles, which determine which API operations and data that your application can access." A página dedicada é [Selling Partner API Roles](https://developer-docs.amazon/sp-api/docs/roles-in-the-selling-partner-api).

Roles relevantes identificados nessa página:
- **Product Listing** — cobre operações de catálogo/listagem, incluindo `getCatalogItem` (Catalog Items API), `getMyFeesEstimateForSKU` (Product Fees API), e relatórios de listagem/catálogo via Reports API. **Este é o role que cobre Listings Items API e Product Type Definitions API** — a página não identifica um role separado e dedicado só para essas duas APIs; elas caem sob "Product Listing".
- **Pricing** — `getPricing` (Product Pricing API) e feeds/relatórios de preço.
- **Inventory and Order Tracking** — `getOrderMetrics` (Sales API), relatórios de listagem de vendedor.
- **Amazon Fulfillment** — relatórios de inventário FBA e feeds de fulfillment (fora do escopo deste MVP, que exclui FBA — ver `map.md`).
- **Direct-to-Consumer Shipping (Restricted)** — operações de pedido/envio com PII (também fora do escopo do MVP, que exclui pedidos).

Fonte: [Selling Partner API Roles](https://developer-docs.amazon/sp-api/docs/roles-in-the-selling-partner-api)

**INFERIDO**: para o MVP deste projeto (conexão + categorias + catálogo/produto + preço/estoque, sem pedidos/FBA), o app Amazon precisará solicitar no mínimo os roles **Product Listing** e **Pricing** no registro do Solution Provider Portal.

---

## 2. Estrutura de catálogo/listing

### 2.1 ASIN vs. SKU do vendedor

**CONFIRMADO**: ASIN é o identificador único do Amazon **do produto no catálogo global** ("Products that exist in the Amazon catalog have an ASIN"); o **seller SKU** é o identificador **próprio do vendedor**, escopado à conta dele, usado para criar/consultar/atualizar/apagar listagens. Um mesmo ASIN pode ter múltiplos sellers cada um com seu próprio SKU apontando para ele (listagem em catálogo compartilhado); a Catalog Items API permite buscar por ambos os identificadores (ASIN ou SKU) e por outros identificadores de produto suportados (ex.: EAN/UPC).
Fontes: [Catalog Items API v2022-04-01 Reference](https://developer-docs.amazon/sp-api/docs/catalog-items-api-v2022-04-01-reference), [Manage Product Listings with the Selling Partner API](https://developer-docs.amazon/sp-api/docs/manage-product-listings-guide)

**INFERIDO**: o modelo é análogo ao ML (`item_id` ML) e Magalu já registrados como `external_listing_id` em `erp_marketplace_product_links` (ver spec 188 D7) — para Amazon, o SKU (definido pelo próprio ERP) seria a chave primária de correlação usada nas chamadas Listings Items, e o ASIN retornado/associado seria armazenado como metadado de catálogo (não como chave de idempotência de criação, já que o SKU é definido antes da existência do ASIN quando se cria um "produto novo" na Amazon).

### 2.2 Listings Items API é a API atual recomendada — o que ela substitui

**CONFIRMADO**: a Listings Items API é a via síncrona recomendada hoje para criar/consultar/atualizar/remover listagens por SKU: `putListingsItem` (criar/substituir), `patchListingsItem` (atualizar parcial), `getListingsItem`, `deleteListingsItem`, `searchListingsItems`.
Fonte: [Manage Product Listings with the Selling Partner API](https://developer-docs.amazon/sp-api/docs/manage-product-listings-guide) — fluxo recomendado: (1) Catalog Items API para descobrir onde o item se encaixa no catálogo; (2) Product Type Definitions API para obter o schema/requisitos; (3) montar payload e `putListingsItem`; (4) manutenção via `getListingsItem`/`patchListingsItem`.

**CONFIRMADO — deprecação dos feeds XML/flat-file legados, com data exata**: a partir de **31 de julho de 2025**, a Feeds API **deixa de suportar** os tipos de feed XML e flat-file legados usados para listagem (`POST_PRODUCT_DATA`, `POST_INVENTORY_AVAILABILITY_DATA`, `POST_PRODUCT_PRICING_DATA`, `POST_PRODUCT_IMAGE_DATA`). Chamadas com esses tipos após a data retornam erro fatal de processamento.
Fonte: [Listing workflow migration tutorial](https://developer-docs.amazon/sp-api/docs/listing-workflow-migration-tutorial)

**O que ainda usa a Feeds API hoje**: o **`JSON_LISTINGS_FEED`** — a "versão em lote" (bulk) da Listings Items API. Usa o **mesmo schema/validação** da Product Type Definitions API e do Listings Items API, mas processado assincronamente via Feeds API, para operações em volume. Não é um mecanismo concorrente/legado — é o caminho oficial para **bulk**, enquanto Listings Items API é o caminho para operações unitárias/síncronas.
Fonte: [Listing workflow migration tutorial](https://developer-docs.amazon/sp-api/docs/listing-workflow-migration-tutorial); confirmação cruzada via busca — "The JSON_LISTINGS_FEED is the bulk equivalent of the Listings Items API, offering the same features and schemas provided by the Selling Partner API for Product Type Definitions."

**INFERIDO**: dado que o MVP deste projeto é modesto em volume (produtos de um ERP, não um catálogo massivo, seguindo o precedente ML/Magalu que fazem chamadas unitárias por outbox job), **a Listings Items API síncrona (`putListingsItem`/`patchListingsItem`) é provavelmente suficiente** para o MVP, análoga ao padrão `createItem`/`updateItem` unitário do `MercadoLivreApiClient` (spec 188 D4) e do padrão Magalu. `JSON_LISTINGS_FEED`/Feeds API ficaria como otimização futura só se volume justificar (mesma lógica de "webhooks fora do MVP" adotada em ML).

### 2.3 Atributos obrigatórios variam por "product type" — Product Type Definitions API

**CONFIRMADO**: a **Product Type Definitions API** é a fonte de verdade dos atributos/requisitos obrigatórios por "product type" (não por categoria diretamente): "Amazon Product Type Definitions describe the attribute and data requirements for items in the Amazon catalog using JSON schemas." A API permite: buscar product types disponíveis (`searchProductTypes`, incluindo por palavra-chave/nome de item + marketplace), obter o **schema JSON** completo de requisitos/condicionalidade para um product type + marketplace (`getDefinitionsProductType`), e obter browse nodes/keywords recomendados para um product type (ver seção 3).
Fonte: [Product Type Definitions API](https://developer-docs.amazon/sp-api/docs/product-type-definitions-api)

**CONFIRMADO**: o schema retornado é consumido tanto pela Listings Items API quanto pelo `JSON_LISTINGS_FEED` — "Use this API to return the JSON Schema for a product type that you can then use with other Selling Partner APIs, such as ... Listings Items, ... Catalog Items, and ... Feeds."
Fonte: mesma página acima.

**CONFIRMADO**: variações (produto pai/filho, ex. tamanho/cor) usam o parâmetro `parentageLevel` (`CHILD`, `PARENT`, `NONE`) em `getDefinitionsProductType` para obter o schema certo por papel na variação.
Fonte: mesma página.

**INFERIDO — como categoria mapeia para product type**: a API não expõe uma relação 1:1 direta "categoria → product type" documentada nas páginas consultadas; em vez disso, o fluxo documentado é heurístico/orientado por busca: o vendedor usa `searchProductTypes` (por palavra-chave do item) e/ou recomendação de browse node (seção 3) para **descobrir** o product type adequado, e então usa esse product type como chave para tudo mais (schema, publicação). Ou seja: **product type é a unidade central de modelagem de atributos**; categoria/browse node é mais uma dimensão de navegação/descoberta do que uma chave direta de schema. Isso é uma inferência a partir de conteúdo parcial das páginas — vale confirmar com mais profundidade no ticket de design de sync de categorias (`04-definir-sincronizacao-categorias-amazon.md`), pois pode haver detalhe adicional em páginas não visitadas (ex. use-case guide completo do Product Type Definitions API).

---

## 3. Categorização

### 3.1 Browse nodes — árvore de categorias

**CONFIRMADO**: um "browse node" é "a location in a browse tree that is used for navigation, product classification, and website content on the Amazon retail website" — a árvore de navegação/categoria do site de varejo Amazon. A SP-API expõe `getItemBrowseNode` (retorna o browse node associado a um ASIN) e, via Product Type Definitions API, uma operação de **recomendação de browse nodes** dado um product type + marketplace ("Get recommended browse nodes or item type keywords").
Fontes: [getItemBrowseNode](https://developer-docs.amazon/sp-api/reference/getitembrowsenode), [Get recommended browse nodes or item type keywords](https://developer-docs.amazon.com/sp-api/docs/get-recommended-browse-nodes-or-item-type-keywords)

**INFERIDO**: browse nodes e product types são conceitos relacionados mas distintos — browse node = posição na árvore de navegação do catálogo (para fins de exibição/busca no site); product type = chave de schema de atributos (para fins de listagem/validação). A API de recomendação de browse nodes por product type sugere que a Amazon trata "product type" como o conceito primário de engenharia, com "browse node" como metadado de exibição derivado/sugerido — não confirmado explicitamente como relação formal em nenhuma página lida integralmente; marcado como inferência a validar no ticket de categorias.

**DÚVIDA**: não foi possível ler o conteúdo completo de `getItemBrowseNode` além da descrição básica (o fetch retornou de uma seção incorreta — "Customer Feedback v2024-06-01" — sugerindo possível erro de navegação/anchor na página consultada, não necessariamente um problema da doc em si). Recomenda-se ao ticket de sync de categorias buscar diretamente a "Product Type Definitions API Use Case Guide" completa para fechar esse ponto.

### 3.2 Categorias/marcas "gated" (aprovação prévia)

**CONFIRMADO (existência do mecanismo, via API)**: a **Listings Restrictions API** (`getListingsRestrictions`) é o mecanismo programático para descobrir, dado um ASIN (+ opcionalmente `conditionType`, `brand`, `productType`), se existem restrições de listagem — "Amazon requires that selling partners obtain approval before listing certain items for sale." A resposta inclui um array `reasons` com `reasonCode` explicando o motivo e (quando aplicável) links/próximos passos para solicitar aprovação. Quando os parâmetros `brand` + `productType` são fornecidos juntos, a API também avalia **restrições de isenção de GTIN** além do gating de marca padrão — inclusive suporte a "auto-approval of GTIN exemptions for eligible brand and product type combinations".
Fonte: [Get listings restrictions for an item in the catalog](https://developer-docs.amazon/sp-api/docs/get-listings-restrictions)

**DÚVIDA (exemplos concretos de categorias gated não confirmados em fonte primária)**: a página oficial e específica de "Categories and products that require approval" (`sellercentral.amazon.com/help/hub/reference/external/G200333160`) está **atrás de login** — o fetch só retornou o shell de navegação (menu, login, footer), sem o conteúdo da tabela de categorias. Não foi possível confirmar exemplos concretos oficiais de categorias gated (ex. joias, automotivo, produtos médicos, bebidas alcoólicas, colecionáveis) diretamente na fonte primária nesta sessão — os exemplos citados amplamente em fontes secundárias (agências de venda, blogs) são consistentes entre si (joias/relógios, eletrônicos automotivos, dispositivos médicos, produtos CPAP/a laser, suplementos/produtos de saúde, bebidas) mas **não foram verificados contra a página oficial**. Recomendação: qualquer decisão de design que dependa de uma lista específica de categorias gated deve reconfirmar contra o Seller Central autenticado (a conta de vendedor real do tecLUX), não contra esta pesquisa.

---

## 4. Requisitos de compliance

### 4.1 GTIN/EAN e isenção (exemption)

**CONFIRMADO (mecanismo via API)**: ver 3.2 — `getListingsRestrictions` com `brand`+`productType` avalia elegibilidade de isenção de GTIN programaticamente, com possibilidade de auto-aprovação para combinações elegíveis de marca+product type.
Fonte: [Get listings restrictions for an item in the catalog](https://developer-docs.amazon/sp-api/docs/get-listings-restrictions)

**DÚVIDA (processo de solicitação de isenção via Seller Central)**: as páginas oficiais dedicadas — "Before you request a GTIN exemption" (`sellercentral.amazon.com/help/hub/reference/external/GZAY2L8NRY53DXD9`) e "Product ID (GTIN) requirements by category" (`.../G200317520`) — estão **atrás de login**; os fetches só retornaram o shell de navegação. Não confirmado em fonte primária nesta sessão: (a) documentação exigida do fabricante/fornecedor atestando ausência de GTIN, (b) limite de "até 10 combinações marca+categoria por formulário", (c) tempo de espera de ~30min pós-isenção antes de listar. Esses pontos apareceram de forma consistente em resultados de busca (inclusive citando texto que parece vir do Seller Central), mas sem confirmação direta via fetch do conteúdo autenticado. Recomendação: revalidar com acesso autenticado real ao Seller Central do tecLUX antes de desenhar o fluxo de isenção de GTIN.

### 4.2 Brand Registry

**DÚVIDA**: Brand Registry é primariamente um **programa do Seller Central** (não uma API de SP-API por si só) para proteção de marca — cadastro de marca com trademark registrada, ferramentas de proteção, e (opcionalmente, mediante processo separado) "brand gating" que bloqueia terceiros de listar sob a marca sem autorização. Não encontrei uma página de `developer-docs.amazon.com` que trate Brand Registry como parte formal do modelo de auth/roles da SP-API (ao contrário de GTIN, que tem um endpoint dedicado — Listings Restrictions API). A relação mais concreta com a SP-API observada: quando o vendedor é o **brand owner** registrado, isso influencia as restrições retornadas por `getListingsRestrictions` (menos gating para marca própria) — mas isso é **inferência**, não uma citação direta de página oficial da SP-API. Fontes consultadas foram majoritariamente secundárias (agências, wikis de SOP) — nenhuma qualificada como primária o suficiente para uma citação direta aqui.
**Recomendação para o ticket de design**: tratar "o vendedor tem Brand Registry para a(s) marca(s) que vende" como uma pré-condição operacional/de negócio a ser confirmada com o time comercial do tecLUX, não como algo a modelar tecnicamente via SP-API além de checar `getListingsRestrictions` antes de tentar publicar.

---

## 5. Rate limits

### 5.1 Formato do modelo — token bucket (confirmado)

**CONFIRMADO**: SP-API usa um modelo de **token bucket por operação**, não um limite global único:

> "The SP-API automatically adds tokens to your bucket at a set rate per second until the maximum limit of the bucket is reached, which is also called the burst rate. Each request that you make to the SP-API subtracts a token from the bucket. Throttling occurs when you make a request for which no token is available because your bucket is empty."

Dois parâmetros por operação:
- **Rate**: requisições/segundo repostas no bucket.
- **Burst**: tamanho máximo do bucket (quantas requisições podem ser "acumuladas" e disparadas de uma vez quando o bucket está cheio).

Existem dois tipos de usage plan:
- **Standard** (a maioria das operações): limites **estáticos** para todos os chamadores, publicados na referência de cada operação.
- **Dynamic**: ajustado automaticamente por vendedor com base em métricas de negócio do próprio vendedor (não no histórico de chamadas de API) — usado para algumas operações de alto volume.

Throttling retorna **HTTP 429** (retryable). O header **`x-amzn-RateLimit-Limit`**, quando presente na resposta, informa o rate limit real aplicado àquela chamada (pode divergir do documentado, para cima, se o vendedor tiver um usage plan elevado).

Fonte: [Usage Plans and Rate Limits](https://developer-docs.amazon/sp-api/docs/usage-plans-and-rate-limits)

### 5.2 Exemplos concretos documentados

| API / Operação | Rate | Burst | Observação |
|---|---|---|---|
| Listings Items API — `putListingsItem`, `getListingsItem`, `patchListingsItem`, `deleteListingsItem`, `searchListingsItems` | 5 req/s (por par conta-aplicação) | 5 | `patchListingsItem` tem limite adicional por-aplicação de 500 req/s para atualizações de atributos de relacionamento/produto; preview de validação limitado a 20 req/s por aplicação |
| Catalog Items API — `searchCatalogItems` | 2 req/s | 2 | Buscas por palavra-chave têm limite adicional de 50 req/s por aplicação; não se aplica a buscas por identificador. Historicamente era 5/5 até 31/ago/2022, quando baixou para 2/2 |
| Catalog Items API — `getCatalogItem` | 2 req/s | 2 | Amazon recomenda usar `searchCatalogItems` para retrieval em lote por ASIN em vez de `getCatalogItem` |
| Feeds API — `createFeed` | 0,0083 req/s (~1 a cada 2 min) | 15 | Rate muito baixo mas burst alto — modelo pensado para poucas submissões, não polling frequente. `JSON_LISTINGS_FEED` especificamente tem guarda adicional: máx. 5 submissões/conta a cada 5 minutos, e máx. 25.000 registros por submissão |

Fontes: [Listings Items API Rate Limits](https://developer-docs.amazon/sp-api/docs/listings-items-api-rate-limits), [Catalog Items API Rate Limits](https://developer-docs.amazon/sp-api/docs/catalog-items-api-rate-limits), [Feeds API Rate Limits](https://developer-docs.amazon/sp-api/docs/feeds-api-rate-limits)

**DÚVIDA (pequena divergência entre fontes)**: uma busca inicial (resumo de terceiro, não fetch direto) indicou `putListingsItem` com burst 10; o fetch direto e repetido da página oficial de rate limits mostrou burst 5 consistentemente em duas tentativas independentes. Tratando o fetch direto como mais confiável — mas o valor real deve ser confirmado contra o header `x-amzn-RateLimit-Limit` em produção, já que a doc mesma avisa que vendedores com alto volume podem ter valores diferentes dos publicados.

**INFERIDO — implicação para orquestração**: o formato (rate/burst por operação, possivelmente dinâmico por conta, com header autoritativo na resposta) é **estruturalmente igual** ao que precisa ser modelado no orquestrador de outbox já existente para ML/Magalu (rate limit "por canal" citado no `map.md` como padrão já estabelecido) — a diferença prática é que a Amazon publica limites **por operação individual**, não um limite único por canal/conta, e ainda expõe o limite real via header de resposta. Isso sugere que o orquestrador de rate-limit da Amazon precisa granularidade por endpoint (ex.: bucket separado para `putListingsItem` vs `searchCatalogItems`), e idealmente deveria **ler e adaptar-se ao `x-amzn-RateLimit-Limit`** em vez de confiar apenas em uma constante de configuração — ponto a levar ao ticket `07-definir-orquestracao-rate-limit-amazon.md`.

---

## Resumo dos pontos que precisam de validação adicional antes de decisões de arquitetura definitivas

1. **GTIN exemption / categorias gated com exemplos concretos** — páginas oficiais do Seller Central estão atrás de login; validar com acesso real à conta do tecLUX.
2. **Relação formal browse node ↔ product type** — inferida, não encontrada como declaração explícita numa única página lida integralmente; aprofundar no ticket de sync de categorias com o Use Case Guide completo do Product Type Definitions API.
3. **Brand Registry como pré-condição de negócio** — não é uma API SP-API dedicada; tratar como decisão operacional externa ao software, verificada por `getListingsRestrictions`.
4. **Burst exato de `putListingsItem`** (5 vs. 10) — pequena divergência entre fontes; confiar no header de resposta em runtime.
