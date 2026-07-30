# Decide destructive-operation semantics

Type: grilling
Status: resolved
Blocked by: 04, 05

## Question

What exact concurrency, authorization, re-authentication, confirmation, reason capture, idempotency, and audit rules govern retry, cancellation, single and bulk deletion, queue pause/resume, task disabling, and history purge?

## Comments

## Answer

Todas as mutações da Console são comandos administrativos duráveis. Exigem Administrador do sistema, autorização server-side por ação, reautenticação por senha, confirmação digitada, motivo obrigatório e auditoria criada antes do efeito.

- A senha é verificada no servidor e nunca persistida. Gera desafio de uso único, válido por 5 minutos e vinculado ao ator, ambiente, ação, alvo, revisão e hash do payload; qualquer mudança invalida o desafio.
- A frase inclui verbo e alvo em pt-BR. Motivo tem 10–500 caracteres. Nenhuma confirmação genérica ou token reutilizável é aceito.
- Cada comando recebe chave de idempotência e hash. Repetição idêntica devolve o resultado gravado; mesma chave com payload diferente é conflito. Duplo clique e retry HTTP não repetem o efeito.
- Estado e revisão esperados são revalidados sob lock/CAS. Divergência encerra como **Recusada** ou **Sem efeito**, mostra o estado atual e nunca força a transição.
- Como banco e Redis não têm transação comum, o banco grava comando/Ação Administrativa como **Pendente**, depois aplica o efeito idempotente e finaliza. Falha intermediária vira **Reconciliação necessária**, nunca sucesso presumido.
- Reconciliador retoma comandos pendentes com a mesma chave; a UI mostra progresso e resultado real. Se a auditoria inicial falhar, a mutação falha fechada.
- **Tentar novamente** só aparece para resultado elegível e cria nova Tentativa na mesma Execução. Resultado indeterminado bloqueia retry até reconciliação. Job Observado usa apenas a primitiva nativa claramente identificada.
- **Excluir pendente** usa remoção atômica por ID+estado+revisão; se já reservado, é recusada. **Cancelar/Suspender** registra pedido e só conclui quando um Checkpoint confirma.
- **Pausar fila/grupo** impede novas reservas e deixa tentativas atuais terminarem; não remove pendentes. **Retomar** é idempotente. O estado pretendido e o observado no Horizon ficam separados até convergir.
- **Desativar tarefa** impede apenas ocorrências futuras; não cancela Execução ativa e não gera backfill ao reativar. Restaurar padrão remove somente o override.
- Lote exige preview imutável com filtro, IDs, revisões, contagem e impacto. Confirmação vale exatamente para esse snapshot. Execução registra resultado por item e pode terminar parcial; não tenta rollback impossível em Redis.
- Purga de histórico é assíncrona em duas fases: marcação/tombstone e remoção após revalidação da política. Ações Administrativas e totais de evidência nunca entram na purga.
- Auditoria append-only guarda ator, IP, agente, sessão, ambiente, correlação, motivo, frase, instante da reautenticação, antes/pretendido/depois sanitizados e resultados por alvo; nunca senha ou payload bruto.
- Rate limits por ator/ação e exclusão mútua por alvo reduzem abuso. Não há modo break-glass, bypass por suporte ou endpoint alternativo sem as mesmas garantias.
