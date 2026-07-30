# 07 — Separar Alertas Operacionais de entregas externas

**What to build:** manter avaliação de Saúde Operacional e sincronização de Alertas Operacionais ativas quando e-mail e webhook estiverem desligados. Configuração externa, falha de canal e Janela de Manutenção Operacional passam a afetar somente Entregas de Alerta.

**Blocked by:** 02 — Migrar consultas para controladores por recurso; 03 — Migrar comandos para controladores por recurso.

**Status:** ready-for-agent

- [ ] O agendamento executa avaliação e sincronização interna sempre que a observação operacional estiver habilitada.
- [ ] A flag externa controla somente criação e processamento de Entregas de Alerta.
- [ ] Condições anormais criam/atualizam alertas e normalização os resolve mesmo com canais externos desligados.
- [ ] Janela de manutenção suspende entregas esperadas sem ocultar condição, alerta ou histórico.
- [ ] Falha de e-mail ou webhook não interrompe a sincronização interna.
- [ ] Testes públicos cobrem configuração externa desligada, janela de manutenção, falha de canal, deduplicação e resolução.

