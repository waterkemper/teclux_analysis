# 12 — Migrar os envelopes de workers para Horizon

**What to build:** substituir os workers Docker legados por dois envelopes Horizon verificáveis e reversíveis, preservando filas, prioridade, tentativas, timeout, memória e scheduler. Operadores de implantação conseguem confirmar readiness e versão ativa, executar deploy gracioso e restaurar cada worker legado sem reescrever jobs pendentes.

**Blocked by:** None — can start immediately.

**Status:** ready-for-agent

- [ ] Horizon oficial compatível com Laravel 13 está instalado e configurado sem expor seu dashboard em produção.
- [ ] `horizon-default` consome `marketplace-sync,default` com prioridade estrita, capacidade fixa, três tentativas e timeout de 120 segundos.
- [ ] `horizon-heavy-reports` consome somente `heavy-reports`, com capacidade fixa, uma tentativa, timeout de 600 segundos e envelope de 1 GiB.
- [ ] Conexões de fila normais e pesadas usam `retry_after` de 150 e 660 segundos; preflight falha quando timeout não é menor que `retry_after`.
- [ ] Namespaces, masters, supervisores, métricas e heartbeats incluem aplicação e ambiente, sem colisão entre implantações.
- [ ] Readiness valida processo, supervisor esperado, Redis, Filas, telemetria fresca e identificador da release; PID ou `PING` isolado não basta.
- [ ] Deploy usa término gracioso e stop grace superior ao timeout de cada envelope; scheduler reinicia separadamente.
- [ ] Teste production-like prova corte e rollback por envelope sem consumidores duplicados, perda ou reescrita de payload.
- [ ] Contrato de compatibilidade prova que a imagem anterior desserializa payloads pendentes emitidos durante a janela expand/contract.

