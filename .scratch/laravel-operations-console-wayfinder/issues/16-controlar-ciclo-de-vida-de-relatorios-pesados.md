# 16 — Controlar o ciclo de vida dos relatórios pesados

**What to build:** permitir que o Administrador do Sistema tente novamente, exclua antes da reserva, cancele, suspenda, retome e reconcilie uma Execução Operacional de `heavy-reports` somente quando suas garantias e estado tornam a ação segura. Cada comando reutiliza o fluxo destrutivo auditado e apresenta o resultado real.

**Blocked by:** 14 — Controlar pausa e retomada com auditoria e reconciliação; 15 — Gerenciar Execuções Operacionais de relatórios pesados.

**Status:** done

- [x] A API deriva ações do Nível de Gestão Operacional, estado, revisão e elegibilidade declarada; a UI não inventa capacidades.
- [x] Tentar novamente cria nova Tentativa na mesma Execução e é bloqueado quando resultado é indeterminado ou não idempotente.
- [x] Excluir pendente remove atomicamente por identidade, estado e revisão; se já reservado, retorna recusa auditada.
- [x] Cancelamento registra pedido terminal e só conclui quando um Checkpoint Operacional confirma a interrupção segura.
- [x] Suspensão persiste cursor idempotente, encerra a Tentativa atual e retomada cria nova Tentativa a partir do cursor.
- [x] A família declara checkpoints e tempo máximo de resposta, apresentados ao Administrador antes da confirmação.
- [x] Corrida entre confirmação, reserva, conclusão e outro comando nunca produz sucesso falso ou efeito duplicado.
- [x] Resultado ambíguo permanece em Reconciliação necessária e bloqueia comandos incompatíveis.
- [x] Testes cobrem todas as transições, retries, duplicidade, crash em checkpoint, cursor inválido e ausência de capability.
