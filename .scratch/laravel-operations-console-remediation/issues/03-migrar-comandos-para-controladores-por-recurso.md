# 03 — Migrar comandos para controladores por recurso

**What to build:** mover as ações administrativas mutáveis para controladores por recurso e Form Requests dedicados, preservando idempotência, revisão otimista, auditoria e respostas atuais. O Administrador continua operando Filas, Execuções, Tarefas, Programações, alertas e retenção pelos mesmos contratos públicos.

**Blocked by:** 01 — Expandir o contrato de requisições operacionais.

**Status:** ready-for-agent

- [ ] Todas as mutações usam Form Requests e o contrato operacional comum para validação e autorização.
- [ ] Controladores apenas coordenam entrada, serviço e resposta, sem acessar modelos diretamente.
- [ ] Serviços são recebidos por injeção e não resolvidos dinamicamente.
- [ ] Motivo, revisão, reautenticação, confirmação e idempotência preservam a semântica já publicada para cada ação.
- [ ] Ações permitidas e recusadas continuam produzindo evidência sanitizada de Ação Administrativa.
- [ ] Testes Feature cobrem ao menos um sucesso, uma recusa de autorização, um conflito de revisão e uma repetição idempotente por família de comandos.

