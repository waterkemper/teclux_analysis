# Especificação da Integração com a Amazon (Marketplace)

Label: wayfinder:map

## Destination

Produzir um prompt `/speckit.specify` autocontido para o Cursor, publicado em `modules/marketplace/amazon-integration/01-speckit-prompt.md`, especificando o MVP da integração com a Amazon como novo canal de marketplace — conexão de conta, sincronização de categorias, publicação/manutenção de produtos (catálogo, estoque, preço), **incluindo o agrupamento nativo pai/filho de grades/variações** (`parentageLevel`, decisão do usuário — amplia o que a spec 202 havia deixado só como stub para Amazon) — reaproveitando ao máximo a infraestrutura já existente para Mercado Livre e Magalu (contas, outbox de sincronização, orquestração, regras de estoque percentual/margem, arquitetura genérica de família da spec 202). Pedidos ficam fora do MVP, seguindo o precedente do Mercado Livre.

Este esforço **não envolve legado Delphi** — é 100% Laravel-nativo, evoluindo uma integração já parcialmente iniciada (stub de categoria) sobre uma arquitetura de marketplace madura e testada (specs `187` a `212`, já implementadas para Mercado Livre e Magalu).

## Notes

- Domínio: Marketplace — canal Amazon. Precedentes diretos: `specs/188-mercado-livre-integration` (primeira integração real, define o padrão arquitetural) e `specs/208-magalu-integration` (segunda integração, explicitamente "paridade Mercado Livre" — o modelo a seguir para Amazon).
- Estado já existente para Amazon: `MarketplaceChannel::Amazon` no enum; `AmazonCategoryDriver`/`AmazonCategorySyncProvider` (stubs de classificação, ligados à tabela legada `categorias_amazon`); `AmazonSyncCategoriesCommand`. **Sem** conector real — `MarketplaceConnectorRegistry` mapeia Amazon para `FakeMarketplaceConnector`.
- A Amazon Selling Partner API (SP-API) usa só LWA OAuth2 (Bearer token) — **sem** AWS IAM/SigV4 desde outubro/2023 (pesquisa confirmada no ticket 01) —, mas o modelo de catálogo/listings próprio (product type ≠ categoria), aprovação de categoria restrita e exigências de compliance (GTIN/marca) seguem mais complexos que ML/Magalu.
- Ao resolver tickets, consultar `research` (para a SP-API) e `/grilling`/`domain-modeling` (para as decisões de arquitetura); reaproveitar sempre que possível os padrões já validados por Magalu (208) em vez de reinventar.
- Este mapa é independente do mapa de revisão de sincronização ML/Magalu (efforts separados, por decisão do usuário).
- Nenhuma implementação será feita neste workspace — só o prompt SpecKit final.

## Decisions so far

- [Pesquisar o modelo de autenticação e catálogo da Amazon Selling Partner API](issues/01-pesquisar-sp-api-amazon.md) — SP-API usa só LWA OAuth2 (AWS IAM/SigV4 removido em out/2023); Listings Items API é o caminho síncrono recomendado (schema por "product type", não por categoria); categorias restritas e isenção de GTIN são verificáveis via `getListingsRestrictions`; rate limit é token bucket por operação individual, não por canal. Ver `research-sp-api.md` para o detalhe completo com fontes.
- [Mapear a infraestrutura Laravel já existente reaproveitável para a Amazon](issues/02-mapear-infraestrutura-laravel-reaproveitavel.md) — Contrato `MarketplaceConnector` e o padrão de 5 arquivos por canal (Magalu) são um encaixe direto, sem mudança de contrato. Outbox/orquestração/regras comerciais têm paridade total. A diferença real está no mapeamento de categoria/atributo ("product type" da Amazon ≠ vínculo direto de categoria do ML/Magalu) — cai nos tickets 04/05.
- [Definir o modelo de conexão de conta Amazon](issues/03-definir-conexao-conta-amazon.md) — Mesma granularidade do ML: uma conexão por Filial. Roles mínimos: Product Listing + Pricing. Fluxo de autorização se encaixa sem mudança estrutural na tela de conexões existente (só LWA, sem IAM/ARN na UI).
- [Definir a evolução da sincronização de categorias Amazon](issues/04-definir-sincronizacao-categorias-amazon.md) — Vínculo de classificação aponta para o product type (não um "código de categoria" como ML/Magalu) — divergência deliberada por fidelidade ao modelo real da Amazon. Checagem proativa de restrição (`getListingsRestrictions`) antes de qualquer publicação, incluindo isenção de GTIN.
- [Definir a sincronização de produtos/catálogo Amazon](issues/05-definir-sincronizacao-produtos-catalogo-amazon.md) — Mapeamento de produto segue as mesmas fontes de ML/Magalu; ativação imediata condicionada à checagem do ticket 04. **Ampliação de escopo**: grades/variações usam o agrupamento nativo pai/filho da Amazon (`parentageLevel`), estendendo a arquitetura de família da spec 202 (que só tinha um stub para Amazon) — não o achatamento em itens independentes usado pela Magalu.
- [Definir as regras de preço e estoque para a Amazon](issues/06-definir-preco-estoque-amazon.md) — Estoque em paridade total com ML/Magalu. **Ampliação de escopo**: preço deduz a taxa de referral da Amazon (variável por categoria) antes de aplicar a margem-alvo, via tabela de referência cadastrada manualmente (não chamada síncrona à API de taxas, pra evitar dependência circular preço↔taxa).
- [Definir a orquestração de sincronização e o rate limit da Amazon](issues/07-definir-orquestracao-rate-limit-amazon.md) — Orquestração em paridade total com a spec 187. Rate limit usa configuração estática por operação individual (não por canal como ML/Magalu), sem adaptação dinâmica ao header de resposta no MVP.
- [Definir a implementação de família pai/filho (grades) no conector Amazon](issues/11-definir-implementacao-familia-pai-filho-amazon.md) — Encaixe confirmado sem contrato novo: `AmazonProductMapper` implementa `FamilyPayloadContract` (já existente, hoje só implementado por ML); `FamilyProductLoader` reaproveitado sem mudança. Extensão aditiva da spec 202, a referenciar explicitamente na especificação final.
- [Classificar lacunas e riscos da integração Amazon](issues/08-classificar-lacunas-riscos.md) — Consolidação completa: infraestrutura reaproveitável sem mudança (contratos), 5 lacunas reais de implementação, 5 decisões novas/ampliações de escopo (destaque: família pai/filho e taxa de referral), riscos classificados (2 DÚVIDAs de baixo risco herdadas da pesquisa, coordenação com a spec 202 como o principal ponto de atenção).
- [Definir critérios de aceite e testes](issues/09-definir-criterios-aceite-testes.md) — Critérios de aceite e matriz mínima de testes consolidados, cobrindo conexão de conta, restrição de listagem, taxa de referral, família pai/filho, rate limit por operação, e regressão de ML/Magalu.
- [Consolidar o prompt SpecKit da integração Amazon](issues/10-consolidar-prompt-speckit-amazon.md) — Publicado em [`modules/marketplace/amazon-integration/01-speckit-prompt.md`](../../modules/marketplace/amazon-integration/01-speckit-prompt.md): conexão de conta, categorias/product type, checagem de restrição, preço/estoque, família pai/filho, orquestração/rate limit.

## Not yet specified

Nenhuma névoa restante — o mapa está concluído. O prompt SpecKit (`01-speckit-prompt.md`) está publicado em `modules/marketplace/amazon-integration/` e pronto para `/speckit.specify` no Cursor. A coordenação formal com quem é dono da spec `202-grade-variations-marketplace` (para a extensão do modo `family_under_parent` ao `AmazonConnector`) fica registrada no próprio prompt como recomendação, não bloqueia o mapa.

## Out of scope

- Importação/status de pedidos Amazon — fica para uma spec futura, seguindo o precedente do Mercado Livre.
- Amazon Ads, campanhas publicitárias, Amazon Fulfillment (FBA).
- Qualquer canal de marketplace além da Amazon (Nuvemshop, Shopee, Via Varejo já estão no enum mas não fazem parte deste esforço).
- Revisar a sincronização já implementada de ML/Magalu — ver o mapa separado de revisão.
