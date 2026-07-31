# 22 — Consultar Histórico e Auditoria da Console

**What to build:** oferecer pesquisa e detalhe integrados de Execuções Operacionais, Tentativas, Ocorrências Programadas, Alertas e Ações Administrativas. O Administrador ou auditor autorizado consegue reconstruir uma decisão operacional por correlação e linha do tempo, sem acessar payloads ou prolongar retenção.

**Blocked by:** 14 — Controlar pausa e retomada com auditoria e reconciliação; 15 — Gerenciar Execuções Operacionais de relatórios pesados; 17 — Registrar todas as Tarefas Operacionais; 19 — Calcular Saúde Operacional e apresentar Pendências Acionáveis; 21 — Aplicar a Política de Retenção Operacional.

**Status:** done

- [ ] Histórico permite filtrar por período, tipo, estado, severidade, recurso, tarefa, correlação e ator dentro do ambiente atual.
- [ ] Detalhe correlaciona Execução, Tentativas, job transitório quando disponível, tarefa/ocorrência, alerta e comandos sem confundir suas identidades.
- [ ] Linha do tempo mostra antes, pretendido, observado, depois e resultado sanitizados para cada Ação Administrativa.
- [ ] Auditoria apresenta ator, IP, agente, sessão, ambiente, correlação, motivo, frase, reautenticação e resultados por alvo, nunca senha ou payload bruto.
- [ ] Registros expirados mostram apenas tombstone/evidência mínima quando aplicável e não são reconstruídos de Horizon ou backup.
- [ ] Busca, paginação, ordenação e export são autorizados no servidor e isolados por ambiente.
- [ ] Export registra finalidade e ator, contém somente campos allowlisted e expira automaticamente em até 24 horas.
- [ ] Retenção, purge-now e preservação não alteram nem ocultam retroativamente evidência de auditoria obrigatória.
- [ ] Testes Feature cobrem correlação, autorização, sanitização, tombstones, limites temporais, export e tentativas de enumeração cruzada.
