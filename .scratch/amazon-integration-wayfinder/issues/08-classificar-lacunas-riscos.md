# Classificar lacunas e riscos da integração Amazon

Type: task
Status: resolved
Blocked by: 03, 04, 05, 06, 07, 11

## Question

Consolidando as decisões de 03 a 07 e 11, quais lacunas exatas existem entre a infraestrutura já implementada (ML/Magalu) e o que a Amazon exige, e quais riscos (aprovação de categoria, compliance de marca/GTIN, complexidade da SP-API frente à API do ML, escopo ampliado de família pai/filho coordenado com a spec 202) merecem destaque explícito na especificação final?

## Answer

### CONFIRMADO — infraestrutura reaproveitável sem mudança

`MarketplaceConnector` (contrato), `MarketplaceConnectorRegistry`, outbox por recurso da spec 187, `MarketplaceOAuthProviderRegistry`/fluxo OAuth2, `MarketplaceProductCommercialService` (estoque), `FamilyPayloadContract`/`FamilyProductLoader` (spec 202) — todos reaproveitados sem alteração de contrato, só nova implementação Amazon.

### NÃO LOCALIZADO — lacunas reais a implementar

- `AmazonConnector`, `AmazonOAuthProvider`, `AmazonProductMapper` (incluindo `FamilyPayloadContract`), `AmazonSyncPayloadBuilder`, `AmazonSyncValidationException`, `AmazonApiClient`/`HttpAmazonApiClient`/`FakeAmazonApiClient` — nenhum existe hoje (canal mapeia para `FakeMarketplaceConnector`).
- Evolução de `AmazonCategoryDriver`/`AmazonCategorySyncProvider` de stub estático para sincronização real via Product Type Definitions API.
- Tabela de referência de taxas de referral por categoria/product type (ticket 06) — não existe hoje em nenhuma forma.
- Checagem proativa de restrição de listagem (`getListingsRestrictions`) — mecanismo novo, sem equivalente em ML/Magalu.
- Rate limiter com granularidade por operação (não por canal) — extensão do limiter central existente.

### DECISÕES NOVAS / ampliações de escopo (a destacar explicitamente na spec final)

1. Vínculo de classificação aponta para **product type**, não "código de categoria" (ticket 04) — divergência deliberada de UI/modelo frente a ML/Magalu.
2. Checagem proativa de restrição antes de publicar (ticket 04) — UX mais cautelosa que ML/Magalu.
3. **Agrupamento pai/filho nativo de grades implementado no MVP** (ticket 05/11) — amplia o que a spec 202 tinha decidido (só stub para Amazon); é a maior ampliação de escopo deste mapa, com dependência direta da spec 202.
4. **Dedução de taxa de referral na precificação** (ticket 06) — funcionalidade nova, sem equivalente em ML/Magalu, via tabela de referência estática (não chamada de API).
5. Rate limiter por operação (ticket 07) — granularidade nova frente ao limiter por canal existente.

### Riscos a destacar

- **Complexidade da SP-API frente ao ML**: autenticação mais simples (só LWA) compensa parcialmente a complexidade maior do modelo de catálogo (product type vs. categoria) e das restrições de listagem.
- **Categorias/marcas gated e processo de isenção de GTIN**: exemplos concretos e o processo de solicitação ficaram atrás de login no Seller Central (DÚVIDA do ticket 01) — validar com acesso real à conta do tecLUX antes da implementação, não bloqueia a especificação (o mecanismo de checagem via API é programático e independe de conhecer a lista antecipadamente).
- **Brand Registry**: tratado como pré-condição de negócio externa ao software (ticket 01), não uma dependência técnica a modelar além de checar `getListingsRestrictions`.
- **Coordenação com a spec 202**: a implementação de família pai/filho para Amazon precisa ser acordada com quem é dono dessa spec, não tratada como trabalho isolado deste mapa (ver "Not yet specified" no `map.md`).
- **Relação browse node ↔ product type** (ticket 01, DÚVIDA) e **burst exato de `putListingsItem`** (5 vs. 10 entre fontes) — pontos de baixo risco, a confirmar durante implementação, não bloqueiam a especificação.
