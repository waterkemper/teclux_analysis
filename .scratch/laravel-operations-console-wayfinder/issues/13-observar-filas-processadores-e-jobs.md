# 13 — Observar Filas, Processadores e Jobs

**What to build:** permitir que o Administrador do Sistema navegue da Console para uma visão sanitizada e atual de todas as Filas, Grupos de Processadores e Jobs Observados do ambiente. A experiência mostra topologia, backlog, idade, consumo, falhas e limitações reais sem revelar payload ou oferecer controles individuais não garantidos.

**Blocked by:** 11 — Estabelecer a Console segura e sua fachada operacional; 12 — Migrar os envelopes de workers para Horizon.

**Status:** ready-for-agent

- [ ] A Console lista `default`, `marketplace-sync` e `heavy-reports` com profundidade, idade do pendente mais antigo, throughput, crescimento e falhas disponíveis.
- [ ] Grupos de Processadores exibem master/supervisor, estado, capacidade configurada, consumidores, heartbeat e release observada.
- [ ] Jobs não gerenciados aparecem somente como Jobs Observados, com projeção sanitizada e aviso claro das garantias ausentes.
- [ ] Nenhuma resposta HTML/JSON, busca, log da Console ou export contém payload serializado, credencial, token, header, model arbitrário, path ou stack trace bruto.
- [ ] Estado desatualizado ou telemetria ausente é apresentado como Desconhecido, nunca como saudável.
- [ ] A topologia é uma visão secundária acessível a partir da landing e mantém ambiente e instante da leitura visíveis.
- [ ] Filtros, paginação e detalhes são autorizados no servidor e não aceitam recurso de outro ambiente.
- [ ] Testes de contrato com Horizon/Redis e testes Feature validam projeções, sanitização, falhas dos adaptadores e limitações de Job Observado.

