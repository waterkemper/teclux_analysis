# 02 — Migrar consultas para controladores por recurso

**What to build:** mover as jornadas de leitura da Console para controladores pequenos por recurso, usando serviços injetados e o contrato operacional comum. Landing, topologia, Execuções Operacionais, Tarefas, saúde, alertas, retenção e histórico continuam entregando as mesmas páginas e props em português brasileiro.

**Blocked by:** 01 — Expandir o contrato de requisições operacionais.

**Status:** ready-for-agent

- [ ] Cada jornada de leitura é atendida pelo controlador do recurso correspondente, sem consulta direta a modelos nem projeção extensa no controlador.
- [ ] Ambiente e autorização são aplicados antes de qualquer leitura e não revelam a existência de registros de outro ambiente.
- [ ] Nomes de rotas, URLs e contratos Inertia existentes permanecem compatíveis.
- [ ] Estados vazio, parcial, desatualizado e erro continuam expressos em português brasileiro.
- [ ] Testes Feature percorrem todas as páginas e filtros públicos migrados.
- [ ] O controlador legado deixa de responder pelas jornadas de leitura migradas.

