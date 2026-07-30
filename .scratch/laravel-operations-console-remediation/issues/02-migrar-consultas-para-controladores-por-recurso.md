# 02 — Migrar consultas para controladores por recurso

**What to build:** mover as jornadas de leitura da Console para controladores pequenos por recurso, usando serviços injetados e o contrato operacional comum. Landing, topologia, Execuções Operacionais, Tarefas, saúde, alertas, retenção e histórico continuam entregando as mesmas páginas e props em português brasileiro.

**Blocked by:** 01 — Expandir o contrato de requisições operacionais.

**Status:** done

- [x] Cada jornada de leitura é atendida pelo controlador do recurso correspondente, sem consulta direta a modelos nem projeção extensa no controlador.
- [x] Ambiente e autorização são aplicados antes de qualquer leitura e não revelam a existência de registros de outro ambiente.
- [x] Nomes de rotas, URLs e contratos Inertia existentes permanecem compatíveis.
- [x] Estados vazio, parcial, desatualizado e erro continuam expressos em português brasileiro.
- [x] Testes Feature percorrem todas as páginas e filtros públicos migrados.
- [x] O controlador legado deixa de responder pelas jornadas de leitura migradas.
