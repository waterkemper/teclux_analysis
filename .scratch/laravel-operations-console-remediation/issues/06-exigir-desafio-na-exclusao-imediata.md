# 06 — Exigir Desafio de Confirmação na Exclusão Imediata

**What to build:** exigir e consumir um Desafio de Confirmação Operacional de uso único em toda Exclusão Imediata Operacional. O Administrador revisa a intenção exata, confirma em português brasileiro e pode repetir com segurança apenas a mesma requisição idempotente.

**Blocked by:** 03 — Migrar comandos para controladores por recurso; 05 — Isolar toda a retenção por ambiente.

**Status:** ready-for-agent

- [ ] O desafio fica vinculado a ator, ambiente, ação, alvo, revisão e conteúdo confirmado, com expiração curta.
- [ ] Desafio expirado, consumido, divergente ou pertencente a outro ator/ambiente é recusado e auditado sem dados sensíveis.
- [ ] Consumo do desafio, chave de idempotência, Comando Administrativo Operacional e efeito destrutivo são coordenados atomicamente.
- [ ] Duas requisições concorrentes não consomem o mesmo desafio duas vezes.
- [ ] Repetição com a mesma chave e intenção retorna o resultado persistido; outra intenção é recusada.
- [ ] Reautenticação recente, frase predefinida, motivo e revisão otimista continuam obrigatórios.
- [ ] O diálogo acessível apresenta alvo, ambiente, efeito, expiração e erros em português brasileiro e funciona por teclado.
- [ ] Testes Feature e de interface cobrem sucesso e todas as divergências do desafio.

