# 05 — Isolar toda a retenção por ambiente

**What to build:** fazer com que prévia, expurgo automático, limpeza de metadados, Exclusão Imediata Operacional, preservação, liberação e restauração atuem exclusivamente no ambiente selecionado. O Administrador pode operar produção ou homologação sem qualquer efeito ou vazamento cruzado.

**Blocked by:** 03 — Migrar comandos para controladores por recurso.

**Status:** ready-for-agent

- [ ] Toda entrada pública de retenção exige um ambiente válido e o propaga até as consultas no banco.
- [ ] Registros filhos e restrições de identidade mantêm coerência com o ambiente do agregado pai.
- [ ] Prévia e execução usam exatamente a mesma fronteira ambiental e critérios de elegibilidade.
- [ ] Expurgo automático processa ambientes explicitamente, sem consulta global implícita.
- [ ] Identificador pertencente a outro ambiente é recusado sem revelar sua existência.
- [ ] Testes Feature usam dados equivalentes em dois ambientes e provam isolamento para prévia, expurgo, scrub, preservação, liberação e restauração.
- [ ] A fachada pública de retenção delega elegibilidade, preservação, expurgo, restauração e auditoria a responsabilidades internas coesas.

