# 12 — Validar a release remediada

**What to build:** executar o gate final da Console de Operações a partir do fixed point da release revisada, demonstrando que todos os achados foram corrigidos sem mudanças colaterais. A equipe recebe evidência objetiva para uma nova revisão de padrões e de aderência ao PRD.

**Blocked by:** 04 — Contrair o controlador operacional legado; 06 — Exigir Desafio de Confirmação na Exclusão Imediata; 07 — Separar Alertas Operacionais de entregas externas; 08 — Agregar dados operacionais antes de expurgar; 09 — Versionar Programações Operacionais; 11 — Exportar o Histórico Operacional completo.

**Status:** ready-for-agent

- [ ] Cada achado crítico, alto e médio do review original possui um teste de regressão que falha sem a correção.
- [ ] Suíte relevante da Console, análise estática, formatador e build frontend passam.
- [ ] Jornadas HTTP/Inertia preservam nomes de rota, contratos, autorização, acessibilidade e português brasileiro.
- [ ] Fixtures hostis confirmam sanitização em tela, exportação, auditoria e entregas externas.
- [ ] O escopo dos commits desde `90511c54` contém somente a Console de Operações e contratos diretamente relacionados.
- [ ] Falhas preexistentes fora do escopo são registradas separadamente e não são ocultadas nem corrigidas neste esforço.
- [ ] Uma nova revisão cobre, separadamente, padrões do repositório e aderência ao PRD de remediação.
- [ ] A release permanece bloqueada se qualquer garantia de ambiente, confirmação destrutiva, alertas, retenção ou histórico falhar.
