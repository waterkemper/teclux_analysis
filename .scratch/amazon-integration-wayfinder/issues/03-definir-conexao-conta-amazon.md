# Definir o modelo de conexão de conta Amazon

Type: grilling
Status: resolved
Blocked by: 01, 02

## Question

Seguindo o modelo já estabelecido para Mercado Livre (uma conexão por Filial, seller único ativo por Filial/site), como deve funcionar a conexão de conta Amazon — mesma granularidade por Filial, ou a SP-API exige um modelo diferente (ex.: uma conta Amazon Seller Central pode cobrir múltiplos marketplaces/países)? Quais roles da SP-API são necessários no mínimo, e como o fluxo de autorização (só LWA OAuth2 — refresh token/access token Bearer; **sem** AWS IAM/SigV4, removido pela Amazon em outubro/2023, ver ticket 01) se encaixa na tela de conexões já existente?

## Answer

### Decisão: mesma granularidade do Mercado Livre — uma conexão por Filial

**DECISÃO DO USUÁRIO**: replicar o modelo já validado para ML (spec 188, Q1) — uma conexão Amazon por Filial, com `filial_estoque` própria por conexão, mesma tabela/modelo de conta já usado por ML/Magalu (`erp_marketplace_accounts` ou equivalente). Nenhuma exceção de modelo de dados para Amazon nesta dimensão.

### Roles mínimos (CONFIRMADO, ticket 01)

**Product Listing** e **Pricing** — cobrem Catalog Items, Listings Items, Product Type Definitions e Product Pricing API. Solicitados no registro do app no Solution Provider Portal.

### Fluxo de autorização se encaixa sem mudança estrutural na tela de conexões

CONFIRMADO (ticket 01): o fluxo é `authorization_code`→`refresh_token`→`access_token` Bearer, estruturalmente idêntico ao já usado por `MercadoLivreOAuthProvider`/`MagaluOAuthProvider` (`MarketplaceOAuthProviderRegistry`) — só o endpoint de troca de token é o genérico LWA (`api.amazon.com/auth/o2/token`), não um endpoint proprietário do canal. Nenhuma mudança na tela de conexões existente é necessária além de registrar `AmazonOAuthProvider` no registry (ver ticket 02) — sem nenhum campo/fluxo de IAM Role/ARN a adicionar à UI, confirmando a remoção do requisito AWS.
