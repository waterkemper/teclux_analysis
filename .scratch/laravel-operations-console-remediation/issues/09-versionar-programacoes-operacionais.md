# 09 — Versionar Programações Operacionais

**What to build:** preservar uma versão imutável sempre que uma Programação Operacional for editada ou restaurada. Administradores e auditores conseguem reconstruir a configuração efetiva e seu motivo durante treze meses.

**Blocked by:** 03 — Migrar comandos para controladores por recurso; 05 — Isolar toda a retenção por ambiente.

**Status:** ready-for-agent

- [ ] Edição e restauração registram configuração anterior e posterior, vigência, ator, motivo, ambiente e revisão.
- [ ] A Programação Operacional atual continua sendo a projeção efetiva e versões históricas permanecem imutáveis.
- [ ] O histórico distingue edição, suspensão, retomada e restauração com termos em português brasileiro.
- [ ] Versões são mantidas por treze meses e não são expurgadas sob Preservação Operacional aplicável.
- [ ] Concorrência por revisão otimista não produz versões falsas ou duplicadas.
- [ ] Testes Feature cobrem edição, restauração, conflito, isolamento ambiental, retenção e preservação.

