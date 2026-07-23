# Pesquisar o modelo de autenticação e catálogo da Amazon Selling Partner API

Type: research
Status: resolved
Blocked by:

## Question

Qual é o modelo de autenticação da Amazon Selling Partner API (SP-API) atual (LWA OAuth2 + assinatura AWS IAM/SigV4, escopos/roles necessários), a estrutura do catálogo de produtos (relação ASIN vs. SKU do vendedor, "Listings Items API", atributos obrigatórios por tipo de produto/categoria), o processo de categorização (browse nodes, categorias restritas que exigem aprovação prévia), e os requisitos de compliance mais relevantes (GTIN/EAN, exigências de marca/brand registry) que um novo conector precisa respeitar? Documentar com fontes oficiais (Amazon Developer Docs).

## Research notes

Ver [research-sp-api.md](../research-sp-api.md) para achados detalhados com fontes.

A descoberta mais relevante: a Amazon **removeu completamente** a exigência de assinatura AWS SigV4/IAM da SP-API a partir de 2 de outubro de 2023 — hoje a autenticação é só LWA OAuth2 (Bearer token), bem mais simples do que o `map.md` original supõe. Confirmou-se também que a Listings Items API é o caminho síncrono recomendado (Feeds API/XML legado perde suporte em 31/jul/2025, restando só para bulk via `JSON_LISTINGS_FEED`), que atributos obrigatórios são modelados por "product type" via Product Type Definitions API, e que rate limits seguem um modelo de token bucket por operação (rate + burst), com exemplos documentados variando de 2-5 req/s para Listings/Catalog Items até um burst alto e rate baixíssimo para `createFeed`. Alguns detalhes (exemplos concretos de categorias gated, processo exato de solicitação de isenção de GTIN, papel formal de Brand Registry) ficaram atrás de login no Seller Central e precisam de validação com acesso real à conta do tecLUX antes de decisões finais de design.

## Answer

CONFIRMADO (fontes primárias `developer-docs.amazon`, changelog oficial, pesquisa completa em `research-sp-api.md`):

1. **Autenticação**: só LWA OAuth2 — `refresh_token` trocado por `access_token` Bearer (expira em 1h) contra `api.amazon.com/auth/o2/token`, enviado no header `x-amz-access-token`. **AWS SigV4/IAM foi removido como requisito em 2/out/2023** — não modelar nenhuma dependência de IAM Role/ARN/AWS SDK no conector Amazon. Duas exceções não relevantes ao catálogo: Restricted Data Token (PII, só entra se pedidos forem escopo futuro) e operações "grantless" (não usadas por catálogo/listings). Roles mínimos a solicitar no registro do app: **Product Listing** e **Pricing**.
2. **Catálogo/listing**: ASIN = identificador global Amazon; seller SKU = identificador próprio do vendedor (chave de correlação a armazenar em `erp_marketplace_product_links`, análogo a `external_listing_id` de ML/Magalu). **Listings Items API** (`putListingsItem`/`patchListingsItem`/`getListingsItem`) é o caminho síncrono recomendado hoje; feeds XML/flat-file legados perdem suporte em 31/jul/2025; `JSON_LISTINGS_FEED` é só a via bulk (mesmo schema), não necessária para o volume esperado do MVP. Atributos obrigatórios são modelados por **"product type"** (não por categoria diretamente), via Product Type Definitions API — schema JSON por product type + marketplace, com suporte a variações via `parentageLevel`.
3. **Categorização**: "browse node" = posição na árvore de navegação do site (metadado de descoberta/exibição), distinto de "product type" (chave de schema de atributos) — a API recomenda browse nodes a partir de um product type, não o contrário. Categorias/marcas restritas ("gated") são verificáveis programaticamente via `getListingsRestrictions` (ASIN + brand + productType), que também avalia elegibilidade de isenção de GTIN. Exemplos concretos de categorias gated ficaram atrás de login — DÚVIDA a validar com a conta real do tecLUX.
4. **Compliance**: GTIN/EAN têm mecanismo de isenção verificável via API (`getListingsRestrictions`), mas o processo de solicitação em si (documentação exigida, limites de combinações) ficou atrás de login — DÚVIDA a validar depois. Brand Registry é majoritariamente um programa de Seller Central (não uma API SP-API dedicada) — tratar como pré-condição de negócio a confirmar com o time comercial, não como algo a modelar tecnicamente além de checar `getListingsRestrictions`.
5. **Rate limits**: token bucket por operação individual (rate + burst), não um limite único por canal — ex.: Listings Items ~5 req/s, Catalog Items 2 req/s, `createFeed` ~0,0083 req/s com burst 15. Header `x-amzn-RateLimit-Limit` informa o limite real aplicado (pode divergir do documentado). Implicação para o ticket 07: o orquestrador de rate-limit da Amazon precisa granularidade por endpoint, não só por canal/conta como ML/Magalu, e idealmente deve ler o header de resposta em vez de confiar só em configuração estática.

**Correção ao restante do mapa**: a suposição de "AWS IAM role" nas Notes do `map.md` e no ticket 03 (conexão de conta) está desatualizada — corrigida abaixo.
