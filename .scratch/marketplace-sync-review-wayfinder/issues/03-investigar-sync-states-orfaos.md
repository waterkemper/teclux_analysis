# Investigar frequência e causas dos sync states órfãos

Type: task
Status: open
Blocked by:

## Question

`MarketplaceSyncRecoveryService`/`MarketplaceSyncRecoveryPolicy`/`MarketplaceSyncRecoveryAdvisorRegistry` já implementam uma arquitetura estruturada de recuperação (por conta, com política e "advisors" por motivo de falha) — o comando `marketplace:recover-sync` avisa que essa recuperação não é totalmente automática. Isso é executado automaticamente em agendamento (cron/scheduler), ou depende de execução manual do comando? Com que frequência sync states ficam órfãos (jobs travados em `processing`, erro/retry sem resolução) em produção, e quais motivos de falha (via `advisorRegistry`) são mais comuns? Isso indica um problema de confiabilidade da fila/timeout, ou é um comportamento esperado e já bem tratado?
