# Definir a implementação de família pai/filho (grades) no conector Amazon

Type: grilling
Status: resolved
Blocked by: 05

## Question

Com a decisão do ticket 05 de implementar o agrupamento nativo pai/filho da Amazon (`parentageLevel: PARENT`/`CHILD`) para grades/variações — estendendo a arquitetura genérica de família já construída na spec `202-grade-variations-marketplace` (hoje só com um stub para Amazon) —, como o `AmazonConnector` deve implementar o modo `family_under_parent`: qual product type/schema rege o item pai vs. os itens filhos, como a reconciliação automática já existente (quando grades/características/produtos da família mudam) se estende ao conector Amazon, e o que muda no contrato de montagem de payload de família já definido pela 202 para acomodar os requisitos específicos da Amazon (schema por product type, `parentageLevel` explícito no payload)? Esta decisão deve ser coordenada com quem é dono da spec 202, não tratada como reinvenção isolada.

## Answer

### Encaixe arquitetural confirmado — sem contrato novo

CONFIRMADO (`Domain/Marketplace/Contracts/FamilyPayloadContract.php`, implementado hoje só por `MercadoLivreProductMapper`): a interface `FamilyPayloadContract` (`buildFamilyPayload`/`assertFamilyRequirements`) já é o seam genérico que a spec 202 construiu exatamente para isso — cada canal implementa sua própria montagem de payload de família.

**DECISÃO**: `AmazonProductMapper` implementa `FamilyPayloadContract`, montando o payload com `parentageLevel: PARENT` para o item pai e `CHILD` para os itens filhos, usando o schema do product type já resolvido no ticket 04 (Product Type Definitions API, `parentageLevel` como parâmetro de `getDefinitionsProductType`, confirmado no ticket 01). `AmazonConnector` substitui `FakeMarketplaceConnector` no `MarketplaceConnectorRegistry` para o canal Amazon quando o modo de variação configurado for `VariationMode::family_under_parent` (enum já existente, `Domain/Marketplace/Enums/VariationMode.php`).

`FamilyProductLoader` (carregamento/validação da família completa por característica) é reaproveitado **sem nenhuma mudança** — ele é agnóstico de canal; só quem monta o payload final é o mapper específico do canal. Nenhuma alteração na camada genérica da spec 202 é necessária além de: (a) a nova implementação `AmazonProductMapper`, (b) o registro do `AmazonConnector`, (c) remover a recusa/stub hoje aplicada pelo `FakeMarketplaceConnector` para o canal Amazon.

### Coordenação com a spec 202

Esta é uma extensão aditiva do trabalho já entregue pela 202 (implementação de um canal que antes só tinha stub), não uma alteração do contrato genérico nem do comportamento já entregue para ML/Magalu. A especificação final (ticket 10) deve referenciar explicitamente a spec 202 como dependência e deixar claro que só a peça Amazon está sendo adicionada.
