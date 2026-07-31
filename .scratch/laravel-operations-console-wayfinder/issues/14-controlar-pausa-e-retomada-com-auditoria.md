# 14 — Controlar pausa e retomada com auditoria e reconciliação

**What to build:** oferecer pausa e retomada de uma Fila ou Grupo permitido como primeiro fluxo completo de Comando Administrativo Operacional. O Administrador confirma o alvo e impacto, e a Console registra intenção, aplica o efeito idempotente no Horizon, mostra convergência ou Reconciliação necessária e preserva Ação Administrativa imutável.

**Blocked by:** 11 — Estabelecer a Console segura e sua fachada operacional; 12 — Migrar os envelopes de workers para Horizon; 13 — Observar Filas, Processadores e Jobs.

**Status:** done

- [ ] Apenas alvos allowlisted e ações compatíveis com seu estado atual são oferecidos e aceitos pelo servidor.
- [ ] A ação exige senha validada no servidor, frase pt-BR contendo verbo e alvo e motivo entre 10 e 500 caracteres.
- [ ] O Desafio de Confirmação Operacional é de uso único, expira em cinco minutos e é vinculado a ator, ambiente, ação, alvo, revisão e hash do conteúdo.
- [ ] Chave idempotente repetida com conteúdo idêntico devolve o resultado anterior; mesma chave com conteúdo diferente retorna conflito.
- [ ] Revisão ou estado divergente termina como Recusada ou Sem efeito, sem forçar transição.
- [ ] Ação Administrativa é gravada antes do efeito e falha de auditoria impede a mutação.
- [ ] Falha entre banco e Horizon resulta em Reconciliação necessária; reconciliador repete com a mesma identidade até resultado conhecido.
- [ ] Pausa impede novas reservas e deixa Tentativas ativas terminarem; retomada é idempotente.
- [ ] UI distingue estado pretendido, observado, pendente, parcial e reconciliado, com resultado pesquisável na auditoria.
- [ ] Testes cobrem duplo clique, retry HTTP, corrida, Redis indisponível, banco indisponível, crash intermediário, rate limit e exclusão mútua por alvo.
