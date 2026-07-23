# Prompt para /speckit.specify

```text
/speckit.specify

Crie uma especificação funcional e técnica detalhada para construir, no Laravel (tecLUX Cloud), o MVP da integração com a Amazon como novo canal de marketplace — conexão de conta, sincronização de categorias/product types, publicação e manutenção de produtos (catálogo, estoque, preço), incluindo agrupamento nativo pai/filho de grades/variações. Pedidos ficam fora do MVP.

Este esforço é **100% Laravel-nativo — não envolve legado Delphi**. A arquitetura de marketplace já está madura e em produção para Mercado Livre (spec `188-mercado-livre-integration`) e Magalu (spec `208-magalu-integration`, explicitamente "paridade Mercado Livre"), incluindo a arquitetura genérica de família/variações (spec `202-grade-variations-marketplace`). Você não possui acesso a nenhuma conta Amazon Seller Central autenticada real. Considere a seção `Evidência Laravel/API Amazon confirmada` deste prompt como o pacote de requisitos autoritativo (pesquisa de fontes primárias da Amazon Developer Docs + inspeção do checkout Laravel já realizadas). Inspecione o checkout Laravel para confirmar nomes de arquivos/classes atuais e identificar qualquer divergência com o que este prompt descreve, citando evidência concreta. Não invente detalhes de categorias restritas, processo de isenção de GTIN ou papel de Brand Registry além do que este prompt já classifica como DÚVIDA — registre essas DÚVIDAs como pendências de validação com uma conta Amazon real do tecLUX antes da implementação, sem bloquear a especificação.

## Limite desta entrega

A entrega termina quando existir:

- conexão de conta Amazon por Filial (mesma granularidade do Mercado Livre), com fluxo OAuth2/LWA reaproveitando `MarketplaceOAuthProviderRegistry`;
- sincronização de categorias evoluída do stub estático atual (`AmazonCategoryDriver`) para uso real da Product Type Definitions API, com o vínculo de classificação do produto apontando para o **product type** (não um código de categoria);
- checagem proativa de restrição de listagem (`getListingsRestrictions`) antes de qualquer publicação, incluindo avaliação de isenção de GTIN;
- publicação e manutenção de produtos (catálogo/estoque/preço) via Listings Items API, com estoque em paridade total com a spec 190 e preço deduzindo a taxa de referral (tabela de referência por categoria/product type) antes de aplicar a margem-alvo;
- agrupamento nativo pai/filho (`parentageLevel`) para produtos com grade/variação, implementando `FamilyPayloadContract` (spec 202) em `AmazonProductMapper`, sem alterar o contrato genérico nem o comportamento já entregue para ML/Magalu;
- rate limiting com granularidade por operação (não por canal), reaproveitando o outbox/orquestração da spec 187 sem infraestrutura paralela.

Não inclua nesta entrega: importação/status de pedidos Amazon; Amazon Ads/campanhas publicitárias; Amazon Fulfillment (FBA); qualquer outro canal de marketplace (Nuvemshop, Shopee, Via Varejo); adaptação dinâmica do rate limiter ao header de resposta da Amazon (fica como otimização futura).

## Investigação Laravel obrigatória

Analise o estado existente antes de desenhar qualquer arquivo novo:

- `Domain/Marketplace/Contracts/MarketplaceConnector.php`, `MarketplaceOAuthProvider.php`, `FamilyPayloadContract.php` (contratos genéricos já existentes, sem mudança necessária);
- `Services/Marketplace/Connectors/Magalu/*` (`MagaluConnector`, `MagaluOAuthProvider`, `MagaluProductMapper`, `MagaluSyncPayloadBuilder`, `MagaluSyncValidationException`) e `Infrastructure/Marketplace/Magalu/*` (`MagaluApiClientInterface`, `HttpMagaluApiClient`, `FakeMagaluApiClient`) — o padrão de 5-6 arquivos por canal a replicar para `Amazon/*`;
- `Services/Marketplace/Connectors/MercadoLivre/MercadoLivreProductMapper.php` — única implementação atual de `FamilyPayloadContract`, referência direta para `AmazonProductMapper`;
- `Services/Marketplace/Connectors/MarketplaceConnectorRegistry.php` (mapeia Amazon para `FakeMarketplaceConnector` hoje — precisa apontar para `AmazonConnector`);
- `Services/Marketplace/CategoryDrivers/AmazonCategoryDriver.php` e `Services/Marketplace/CategorySync/Stubs/AmazonCategorySyncProvider.php` (stubs atuais, ligados à tabela legada `categorias_amazon`);
- `Domain/Marketplace/Enums/MarketplaceChannel.php` (já tem `Amazon`) e `Domain/Marketplace/Enums/VariationMode.php`;
- `Services/Marketplace/Family/FamilyProductLoader.php` (reaproveitado sem mudança);
- `Services/Marketplace/MarketplaceProductCommercialService.php` e a spec `190-marketplace-products` (regras de estoque percentual/margem);
- `specs/187-marketplace-sync-modernization` (outbox `erp_marketplace_sync_jobs`, orquestração, rate limiter central por canal) e `specs/202-grade-variations-marketplace` (arquitetura de família — **dependência direta**, esta entrega estende o que a 202 deixou como stub para Amazon).

## Evidência Laravel/API Amazon confirmada

### Estado atual da Amazon no checkout (CONFIRMADO)

`MarketplaceChannel::Amazon` já existe no enum. `AmazonCategoryDriver`/`AmazonCategorySyncProvider` são *stubs* (nomeados literalmente como tal no código) ligados só à tabela legada `categorias_amazon` — sem sincronização real via API. `MarketplaceConnectorRegistry` mapeia Amazon para `FakeMarketplaceConnector` — **nenhum conector real existe**: sem OAuth, sem publicação de produto, sem pedidos.

### Autenticação SP-API (CONFIRMADO por pesquisa em fontes primárias — `developer-docs.amazon`)

SP-API usa **só LWA OAuth2** — refresh token trocado por access token Bearer (expira em 1h) contra `api.amazon.com/auth/o2/token`, enviado no header `x-amz-access-token`. **AWS IAM/SigV4 foi removido como requisito em 2 de outubro de 2023** (changelog oficial: "SP-API no longer requires AWS IAM or AWS Signature Version 4") — não modelar nenhuma dependência de IAM Role/ARN/AWS SDK. O fluxo é estruturalmente idêntico ao `authorization_code`/`refresh_token` já usado por `MercadoLivreOAuthProvider`/`MagaluOAuthProvider`. Roles mínimos a solicitar no registro do app: **Product Listing** e **Pricing**.

### Catálogo e listagem (CONFIRMADO)

ASIN = identificador global Amazon do produto; **seller SKU** = identificador do vendedor, usado para criar/consultar/atualizar listagens — a chave de correlação a armazenar em `erp_marketplace_product_links` (análogo a `external_listing_id`/`external_sku` de ML/Magalu). **Listings Items API** (`putListingsItem`/`patchListingsItem`/`getListingsItem`) é o caminho síncrono recomendado hoje; feeds XML/flat-file legados perdem suporte em 31/jul/2025; `JSON_LISTINGS_FEED` é só a via bulk (mesmo schema), não necessária para o volume esperado deste MVP. Atributos obrigatórios são modelados por **"product type"** (não por categoria diretamente) via Product Type Definitions API (`searchProductTypes`, `getDefinitionsProductType` — schema JSON por product type + marketplace, com suporte a variações via parâmetro `parentageLevel: PARENT/CHILD/NONE`).

### Categorização e restrições (CONFIRMADO + DÚVIDA)

"Browse node" = posição na árvore de navegação/exibição do site — distinto de "product type" (chave de schema). A Product Type Definitions API recomenda browse nodes a partir de um product type, não o contrário (INFERIDO — relação formal não encontrada como declaração explícita numa única página). Categorias/marcas restritas ("gated") são verificáveis programaticamente via **`getListingsRestrictions`** (ASIN + brand + productType), que também avalia elegibilidade de isenção de GTIN, com suporte a auto-aprovação para combinações elegíveis. **DÚVIDA**: exemplos concretos de categorias gated e o processo detalhado de solicitação de isenção de GTIN ficaram atrás de login no Seller Central — validar com acesso real à conta do tecLUX antes da implementação; não bloqueia esta especificação, já que a checagem via API é programática.

### Rate limits (CONFIRMADO)

Token bucket **por operação individual**, não por canal: Listings Items ~5 req/s (burst 5), Catalog Items 2 req/s, `createFeed` ~0,0083 req/s (burst 15, com guarda adicional de 5 submissões/conta a cada 5 min para `JSON_LISTINGS_FEED`). Header `x-amzn-RateLimit-Limit` informa o limite real aplicado (pode divergir do documentado para vendedores com usage plan elevado) — não usado neste MVP (ver Decisões obrigatórias).

## Decisões obrigatórias

1. **Conexão de conta**: uma conexão Amazon por Filial, mesma granularidade do Mercado Livre (spec 188 Q1) — sem exceção de modelo de dados.
2. **Vínculo de classificação → product type**: o campo de vínculo por classificação para Amazon guarda o **product type** (não um "código de categoria" como ML/Magalu) — divergência deliberada por fidelidade ao modelo real da Amazon. Browse node fica como metadado secundário/derivado.
3. **Checagem proativa de restrição**: toda publicação passa por `getListingsRestrictions` antes de qualquer tentativa de `putListingsItem`; bloqueio exibe `reasonCode`/próximo passo quando disponível na resposta da API, em vez de deixar o operador descobrir por tentativa e erro.
4. **Ativação imediata**: quando a checagem de restrição passa, a publicação é ativa imediatamente após confirmação no ERP — mesmo padrão do Mercado Livre (spec 188 Q3), sem estado de rascunho/revisão manual adicional.
5. **Estoque em paridade total** com a regra já existente da spec 190 (percentual sobre `estoques.emestoque` da filial de estoque da conta, arredondado para baixo) — sem ajuste.
6. **Preço deduz a taxa de referral da Amazon** (variável por categoria/product type) antes de aplicar a margem final desejada — via uma **tabela de referência de percentuais cadastrada/atualizada manualmente** por categoria/product type, **não** uma chamada síncrona a `getMyFeesEstimateForSKU` por cálculo de preço (evita a dependência circular preço↔taxa que essa API introduziria, já que ela exige um preço de venda como entrada).
7. **Família pai/filho nativa da Amazon para grades/variações** — amplia o que a spec 202 havia deixado como stub para Amazon: `AmazonProductMapper` implementa `FamilyPayloadContract` (mesma interface já implementada por `MercadoLivreProductMapper`), montando payload com `parentageLevel: PARENT` (item pai) e `CHILD` (itens filhos) conforme o schema do product type resolvido; `AmazonConnector` substitui `FakeMarketplaceConnector` no registry para `VariationMode::family_under_parent`; `FamilyProductLoader` é reaproveitado sem nenhuma mudança. Esta é uma extensão aditiva da spec 202 — coordenar com quem é dono dessa spec antes de implementar, não tratar como reinvenção isolada.
8. **Orquestração em paridade total** com a spec 187 (outbox `erp_marketplace_sync_jobs` por recurso, workers existentes) — sem infraestrutura paralela.
9. **Rate limiter estático por operação individual** (não por canal) — configuração manual em `config/marketplace.php` com uma entrada por operação Amazon relevante (Listings Items, Catalog Items, Feeds); **sem** adaptação dinâmica ao header `x-amzn-RateLimit-Limit` neste MVP.
10. **Pedidos, Amazon Ads e FBA ficam fora desta entrega** — arquitetura deve permitir extensão futura sem retrabalho (mesmo princípio já seguido pelo MVP do Mercado Livre).

## Critérios de aceite

- [ ] Conexão de conta Amazon segue a granularidade por Filial, com fluxo OAuth2/LWA reaproveitando `MarketplaceOAuthProviderRegistry` sem nenhum campo de IAM/ARN na UI.
- [ ] Vínculo de classificação por produto guarda o product type Amazon, não um código de categoria.
- [ ] Nenhuma publicação é tentada sem checagem prévia de `getListingsRestrictions`; bloqueio exibe motivo e próximo passo quando disponível.
- [ ] Estoque enviado usa a mesma regra de percentual da spec 190, sem ajuste.
- [ ] Preço deduz a taxa de referral da tabela de referência antes de aplicar a margem-alvo.
- [ ] Produtos com grade publicam como família pai/filho nativa da Amazon, reaproveitando `FamilyPayloadContract`/`FamilyProductLoader` sem alterar o contrato genérico da spec 202.
- [ ] Rate limiter aplica limites distintos por operação, não um limite único por canal.
- [ ] Sincronização usa o outbox/orquestração da spec 187 sem infraestrutura paralela.
- [ ] Pedidos não aparecem em nenhum fluxo desta entrega.

## Matriz mínima de testes

- Conectar uma Filial via OAuth2/LWA; token expira em 1h e é renovado via refresh token sem intervenção manual.
- Produto vinculado a um product type sem os atributos obrigatórios do schema → bloqueado com erro claro antes de tentar publicar.
- Produto de categoria/marca gated → bloqueado por `getListingsRestrictions` antes de qualquer tentativa de `putListingsItem`; produto elegível para isenção de GTIN → fluxo de isenção sinalizado.
- Produto de categoria com taxa de referência alta vs. baixa → preço final reflete a dedução corretamente antes da margem-alvo.
- Variação do percentual de estoque site → quantidade enviada bate com a mesma fórmula de ML/Magalu.
- Produto com 3 variantes de grade → publica 1 item PARENT + 3 itens CHILD; alteração de uma variante reconcilia automaticamente via `FamilyProductLoader`; produto sem grade publica como item único.
- Rajada de chamadas a `putListingsItem` respeita o limite configurado (5 req/s) sem estourar; `createFeed` respeita seu limite (bem mais restritivo) separadamente.
- Regressão: nenhuma mudança na orquestração/outbox/regras comerciais afeta o comportamento já validado de ML/Magalu.

## Saída esperada do SpecKit

Produza uma especificação executável e um plano que:

- listem os requisitos funcionais deste MVP (conexão, categorias/product type, publicação/manutenção de produto, família pai/filho, preço/estoque, orquestração/rate limit);
- identifiquem os arquivos Laravel atuais a estender (padrão de 5-6 arquivos por canal já usado por Magalu) e os pontos de extensão da spec 202 (família);
- detalhem o mecanismo da tabela de referência de taxas de referral e onde ela é cadastrada;
- incluam os critérios de aceite e a matriz de testes acima;
- declarem explicitamente as DÚVIDAs herdadas da pesquisa (categorias gated, processo de isenção de GTIN, papel de Brand Registry) como pendências de validação com conta real, não como bloqueios;
- declarem explicitamente que pedidos, Amazon Ads e FBA **não fazem parte** desta entrega;
- referenciem a spec 202 como dependência direta para a implementação de família pai/filho, recomendando coordenação antes de implementar;
- não invente exemplos de categorias restritas ou detalhes do processo de GTIN além do que está documentado aqui como confirmado.

## Fora de escopo

- implementar durante `/speckit.specify`;
- importação/status de pedidos Amazon;
- Amazon Ads, campanhas publicitárias, Amazon Fulfillment (FBA);
- qualquer outro canal de marketplace (Nuvemshop, Shopee, Via Varejo);
- adaptação dinâmica do rate limiter ao header `x-amzn-RateLimit-Limit`;
- alterar o contrato genérico de família (`FamilyPayloadContract`) ou o comportamento já entregue para Mercado Livre/Magalu.
```
