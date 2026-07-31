# 01 — Expandir o contrato de requisições operacionais

**What to build:** introduzir, ao lado dos fluxos atuais, um contrato único para normalizar Administrador, ambiente, alvo, revisão, motivo, reautenticação, confirmação e idempotência. As rotas continuam funcionando sem alteração visível, enquanto os próximos slices ganham validação e autorização consistentes.

**Blocked by:** None — can start immediately.

**Status:** done

- [x] O contrato representa explicitamente ambiente, ator, ação e alvo e falha de forma fechada quando o contexto é ausente ou inválido.
- [x] Form Requests dedicados cobrem os formatos compartilhados de consultas e mutações sem remover ainda os consumidores legados.
- [x] Policies continuam decidindo permissão, enquanto o novo contrato aplica as garantias adicionais da operação.
- [x] Dependências do novo fluxo são injetadas e não resolvidas dinamicamente pelo contêiner.
- [x] Testes Feature demonstram que respostas, autorização, mensagens em português brasileiro e nomes de rotas permanecem compatíveis.
- [x] Testes arquiteturais impedem novas validações inline, consultas diretas a modelos e resolução dinâmica de serviços nos controladores da Console.
