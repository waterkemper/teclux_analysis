# 24 — Ensaiar rollout e rollback da primeira release

**What to build:** executar e registrar o rollout completo da Console por gates reversíveis, desde staging até a conclusão da primeira release. Operadores dispõem de runbooks, kill switches e evidências objetivas para avançar, interromper ou restaurar os workers legados.

**Blocked by:** 12 — Migrar os envelopes de workers para Horizon; 23 — Endurecer experiência, segurança e desempenho.

**Status:** done

- [ ] Flags server-side independentes controlam observação, Filas, jobs gerenciados, Programações, alertas externos e exclusão imediata sem contornar autorização/auditoria.
- [ ] Staging completa sete dias de soak, fault injection e um drill de rollback por envelope.
- [ ] Produção inicia em modo somente leitura por 48 horas e compara Console com Horizon, Redis, scheduler e banco; divergência inexplicada bloqueia avanço.
- [ ] Controles de `heavy-reports` passam por coorte nomeada durante 72 horas sem duplicidade, auditoria ausente, checkpoint fora do limite ou reconciliação acima do orçamento.
- [ ] Programações e controles coletivos de Filas são habilitados em gates separados de 72 horas, cada um com kill switch ensaiado.
- [ ] Alertas externos de backlog permanecem desligados até revisão de 14 dias de telemetria; e-mail e webhook já passaram por testes independentes.
- [ ] A release só é declarada concluída após sete dias adicionais sem condição bloqueante.
- [ ] Runbooks documentam go/no-go, deploy, rollback, reconciliação, retenção, canais, escalonamento e responsáveis.
- [ ] Administradores de suporte concluem as jornadas representativas e sabem reconhecer limites de Job Observado.
- [ ] Evidência de cada gate registra timestamp, release, aprovador, métricas, divergências, decisão e resultado do rollback.
- [ ] Defeito crítico dispara rollback ou desativação de flag imediatamente, sem adiamento para retrospectiva.
