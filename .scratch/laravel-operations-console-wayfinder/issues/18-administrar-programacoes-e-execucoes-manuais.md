# 18 — Administrar Programações e Execuções Manuais

**What to build:** permitir que o Administrador habilite, desabilite, restaure padrão, aplique preset/fuso permitido e inicie manualmente uma Tarefa Operacional elegível. O fluxo mostra preview de impacto, respeita concorrência e locks e produz Execução Operacional e auditoria iguais às ocorrências agendadas.

**Blocked by:** 14 — Controlar pausa e retomada com auditoria e reconciliação; 15 — Gerenciar Execuções Operacionais de relatórios pesados; 17 — Registrar todas as Tarefas Operacionais.

**Status:** done

- [ ] O servidor aceita somente ativação, preset e parâmetros tipados e fuso declarados no Registro de Tarefas Operacionais.
- [ ] Comando, argumentos, executor e cron livre não aparecem na UI nem são aceitos por endpoint.
- [ ] Preview mostra programação atual, proposta, próximas ocorrências, fuso, sobreposição e impacto antes da confirmação.
- [ ] Desativar afeta somente ocorrências futuras; não cancela Execução ativa nem cria backfill ao reativar.
- [ ] Restaurar padrão remove o override, mantendo histórico e auditoria da alteração.
- [ ] Alteração usa revisão otimista; concorrência retorna estado atual sem sobrescrita silenciosa.
- [ ] Execução Manual usa o mesmo dispatcher, permissões, locks, Execução Operacional e histórico da execução agendada.
- [ ] Sobreposição é recusada por padrão; fila adicional ou paralelismo só ocorre quando a tarefa declara segurança.
- [ ] Feature flags e bloqueios de segurança em código prevalecem sobre qualquer override.
- [ ] Testes com relógio controlado cobrem futuras ocorrências, corrida, manual vs agendada, locks, DST, tarefa órfã e auditoria.
