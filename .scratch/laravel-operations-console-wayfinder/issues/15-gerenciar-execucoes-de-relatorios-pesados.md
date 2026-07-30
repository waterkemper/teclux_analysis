# 15 — Gerenciar Execuções Operacionais de relatórios pesados

**What to build:** transformar a família `heavy-reports` no primeiro fluxo Gerenciado da Console. Cada intenção nasce como Execução Operacional durável, é publicada after-commit, cria Tentativas rastreáveis e fornece Resumo Operacional, progresso e heartbeat sanitizados até um resultado terminal ou necessidade de reconciliação.

**Blocked by:** 11 — Estabelecer a Console segura e sua fachada operacional; 12 — Migrar os envelopes de workers para Horizon.

**Status:** done

- [x] Dispatcher oficial cria Execução Operacional com identidade e chave de idempotência antes de publicar o job after-commit.
- [x] Falha de publicação mantém Aguardando despacho e pode ser reconciliada sem duplicar a intenção.
- [x] Cada processamento cria Tentativa de Execução vinculada ao job, Processador, início, heartbeat, fim e resultado.
- [x] Middleware captura eventos e falhas inesperadas, persiste projeção sanitizada e relança a exceção ao Laravel.
- [x] Resumo Operacional aceita somente schema versionado e allowlisted, sem payload, model serializado, segredo, path ou trace bruto.
- [x] Progresso suporta etapa pt-BR, percentual opcional monotônico por Tentativa, contagens e nota limitada; quando incalculável, exibe Indeterminado.
- [x] Entrega duplicada, reinício e retry não criam outra Execução Operacional nem corrompem progresso.
- [x] Despacho gerenciado fora do serviço oficial falha em desenvolvimento e testes.
- [x] Lista e detalhe da Console correlacionam Execução, Tentativas e Job Horizon sem tratar a identidade transitória como canônica.
- [x] Testes de contrato cobrem identidade, after-commit, duplicidade, timeout, heartbeat, sanitização, resultado esperado e falha inesperada.
