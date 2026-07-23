# Definir a orquestração de sincronização e o rate limit da Amazon

Type: grilling
Status: resolved
Blocked by: 01, 02

## Question

A sincronização Amazon deve reaproveitar integralmente o outbox de sincronização por recurso (`erp_marketplace_sync_jobs`, catalog/stock/price) e os workers já existentes da spec 187, como a Magalu fez ("paridade 187")? Qual é a política de rate limit apropriada para a SP-API (limites por endpoint, exigem token bucket mais granular que o limiter central por canal já usado)?

## Answer

### Orquestração: paridade 187, sem decisão nova

A sincronização Amazon reaproveita integralmente o outbox por recurso (`erp_marketplace_sync_jobs`, catalog/stock/price) e os workers já existentes da spec 187 — mesmo padrão adotado pela Magalu ("paridade 187"). Nenhuma mudança estrutural na orquestração é necessária.

### Rate limit: limiter estático por operação — DECISÃO DO USUÁRIO

Diferente do limiter central único por canal usado por ML/Magalu, o rate limiter da Amazon precisa granularidade por **operação individual** (confirmado no ticket 01: Listings Items ~5 req/s, Catalog Items 2 req/s, `createFeed` ~0,0083 req/s — perfis muito diferentes entre si). **DECISÃO**: manter uma configuração estática por operação (mesma abordagem de `config/marketplace.php` já usada por ML/Magalu, só com uma entrada por operação Amazon em vez de uma única entrada por canal) — **sem** implementar adaptação dinâmica ao header `x-amzn-RateLimit-Limit` no MVP. Throttling (HTTP 429) segue tratado pelo mecanismo de retry/backoff já existente no outbox (paridade 187), sem `sleep()` hardcoded.

**Nota para especificação futura**: se o volume de produção revelar divergência sistemática entre os limites estáticos configurados e o header de resposta real da Amazon, a leitura dinâmica do header fica como otimização futura — não bloqueia o MVP.
