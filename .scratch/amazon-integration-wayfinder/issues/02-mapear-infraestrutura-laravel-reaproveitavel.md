# Mapear a infraestrutura Laravel já existente reaproveitável para a Amazon

Type: task
Status: resolved
Blocked by:

## Question

Quais componentes da arquitetura de marketplace já implementada (contrato `MarketplaceConnector`, `MarketplaceConnectorRegistry`, outbox de sincronização da spec 187, `MarketplaceSyncOrchestrator`, `MarketplaceProductCommercialService`/regras de estoque percentual e margem da spec 190, `AmazonCategoryDriver`/`AmazonCategorySyncProvider` já existentes como stub) já cobrem o que a Amazon precisa, e o que exige extensão/nova implementação? Como o padrão de "paridade Mercado Livre" usado pela Magalu (spec 208) se aplica à Amazon, dado que a SP-API é estruturalmente mais diferente da API do ML do que a Magalu foi?

## Answer

### Contrato de conector é genérico e já cobre as operações de catálogo (CONFIRMADO, `Domain/Marketplace/Contracts/MarketplaceConnector.php`)

A interface `MarketplaceConnector` já expõe exatamente as operações que o MVP Amazon precisa, sem nenhuma mudança de contrato: `testCredentials`, `createListing`, `updateCatalog`, `updatePrice`, `updateStock`, `updateImages`, `updateVariations`, `deactivateListing`, `activateListing`, `fetchRemoteSnapshot`, `resolveError`. Um `AmazonConnector implements MarketplaceConnector` é um encaixe direto — nenhuma extensão de contrato é necessária para o MVP (sem pedidos/FBA).

### Padrão de arquivos por canal a replicar (CONFIRMADO, `Services/Marketplace/Connectors/Magalu/*`)

A Magalu (o precedente mais recente, explicitamente "paridade ML") estrutura seu conector em 5 arquivos: `MagaluConnector` (implementa `MarketplaceConnector`), `MagaluOAuthProvider` (implementa `Domain/Marketplace/Contracts/MarketplaceOAuthProvider.php`, registrado em `MarketplaceOAuthProviderRegistry`), `MagaluProductMapper` (produto ERP → payload Magalu), `MagaluSyncPayloadBuilder`, `MagaluSyncValidationException`. **DECISÃO**: a Amazon replica essa mesma estrutura — `AmazonConnector`, `AmazonOAuthProvider`, `AmazonProductMapper`, `AmazonSyncPayloadBuilder`, `AmazonSyncValidationException`, mais um `AmazonApiClient`/`HttpAmazonApiClient` (+ `FakeAmazonApiClient` para testes) espelhando `MagaluApiClientInterface`/`HttpMagaluApiClient`/`FakeMagaluApiClient`.

### O que já existe vs. o que falta

**Reaproveitável sem mudança**: `MarketplaceConnectorRegistry` (só precisa adicionar o case Amazon apontando pro novo conector, em vez de `FakeMarketplaceConnector`), outbox de sync por recurso da spec 187 (`erp_marketplace_sync_jobs`, `MarketplaceSyncOrchestrator`, workers), `MarketplaceProductCommercialService` (regras de estoque percentual/margem da spec 190 — mesma lógica, só o conector muda), `MarketplaceOAuthProviderRegistry` (o fluxo LWA OAuth2 confirmado no ticket 01 é estruturalmente idêntico ao `authorization_code`/`refresh_token` já usado por ML/Magalu — só o endpoint de token é o genérico `api.amazon.com/auth/o2/token`, não um endpoint proprietário do canal).

**Precisa de extensão/nova implementação**: `AmazonCategoryDriver`/`AmazonCategorySyncProvider` — hoje são *stubs* ligados só à tabela legada `categorias_amazon` (classificação estática); precisam evoluir para sincronização real via Product Type Definitions API (ticket 04) — schema de atributos por "product type", não por categoria diretamente (achado do ticket 01). O rate limiter precisa granularidade por operação/endpoint (ticket 07), diferente do limiter "por canal" que basta para ML/Magalu.

### "Paridade Mercado Livre" se aplica parcialmente

A infraestrutura de orquestração, contas, outbox e regras comerciais (estoque/margem) tem paridade total — reaproveitar sem questionar. A diferença real está na **camada de mapeamento de produto/categoria** (tickets 04 e 05): a SP-API não tem um equivalente direto ao par simples "categoria ML + atributos da categoria" — usa "product type" como unidade central de schema, descoberto por busca/recomendação, não por vínculo direto de classificação como `codigo_categoria_mercadolivre`. Essa é a decisão arquitetural que difere de verdade da paridade ML/Magalu, e cai nos tickets 04/05, não neste.
