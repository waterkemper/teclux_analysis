# Revisão da Sincronização de Produtos — Mercado Livre e Magalu

Label: wayfinder:map

## Destination

Determinar a causa raiz de três problemas conhecidos e recorrentes na sincronização de produtos com Mercado Livre e Magalu, e decidir — para cada um — se deve ser corrigido na origem (impedindo a ocorrência) em vez de depender permanentemente de comandos de reparo manual já existentes:

1. **SKU duplicado na Magalu** (`marketplace:fix-magalu-duplicate-skus`, erro "Produto já cadastrado com este SKU").
2. **SKU/listing ID truncado na Magalu** (`marketplace:repair-magalu-link-skus`, bug legado — o sistema já reconstrói heurísticamente um sufixo `"00"` perdido).
3. **Sync states órfãos de erro/retry** em qualquer marketplace (`marketplace:recover-sync`).

O destino é um dossiê de achados com causa raiz classificada e uma recomendação por problema (corrigir na origem / manter mitigação atual / aceitar como está) — não uma implementação. Este mapa é diagnóstico, não gera specs novas.

## Notes

- Domínio: Laravel-nativo, sem legado Delphi envolvido — a integração de marketplace (Mercado Livre, Magalu) já está implementada e em produção (~18 specs em `specs/187-*` a `specs/212-*`).
- Consultar `diagnosing-bugs` ao investigar cada causa raiz; usar `/grilling` para as decisões de correção.
- Evidência de código já reunida: `MagaluSellerSkuResolver` (`app/Support/Marketplace/`), `MagaluLinkSkuRepairService`, `MagaluDuplicateSkuRecoveryService`, `MarketplaceSyncRecoveryService`/`MarketplaceSyncRecoveryPolicy`/`MarketplaceSyncRecoveryAdvisorRegistry` (`app/Services/Marketplace/`).
- Não implementar correções neste mapa — só diagnosticar e decidir a direção; a correção em si (se decidida) vira trabalho de implementação separado, fora deste mapa.
- Este mapa é independente do mapa de especificação da integração Amazon (efforts separados, por decisão do usuário).

## Decisions so far

<!-- Uma linha por ticket resolvido, com link e síntese. -->

## Not yet specified

_(vazio por ora — a investigação de cada causa raiz pode revelar problemas adjacentes ainda não nomeáveis; graduar conforme os tickets 01-03 forem resolvidos)_

## Out of scope

- Implementar qualquer correção identificada — fica para um esforço de implementação separado, após este mapa decidir a direção.
- Revisar a integração de pedidos, preços ou categorias dos marketplaces — só sincronização de produtos/catálogo.
- Especificar a integração com a Amazon — ver o mapa separado de especificação Amazon.
