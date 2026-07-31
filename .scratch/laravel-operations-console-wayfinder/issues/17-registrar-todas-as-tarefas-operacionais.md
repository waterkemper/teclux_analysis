# 17 — Registrar todas as Tarefas Operacionais

**What to build:** substituir as definições agendadas dispersas por um Registro de Tarefas Operacionais em código e um tick durável. O Administrador vê todas as tarefas, sua programação padrão/efetiva, próximas ocorrências e histórico; múltiplos ticks, reinícios e réplicas não duplicam uma Ocorrência Programada.

**Blocked by:** 11 — Estabelecer a Console segura e sua fachada operacional.

**Status:** done

- [x] O registro cobre todas as tarefas atuais e declara chave estável, nome/descrição pt-BR, executor imutável, risco, timeout, ambientes, programação padrão, presets, fusos, sobreposição e execução manual.
- [x] Teste de inventário/paridade falha se uma definição atual estiver ausente, duplicada ou divergente.
- [x] Um único tick calcula vencimentos, adquire lease atômico e cria uma Ocorrência Programada por tarefa, janela civil e fuso.
- [x] Reinício, retry e múltiplas réplicas não criam ocorrência ou execução duplicada.
- [x] Transições de horário de verão executam cada janela civil no máximo uma vez e preservam horário local pretendido.
- [x] A Console lista programação padrão e efetiva, próximas ocorrências, disponibilidade, locks e histórico sanitizado em modo leitura.
- [x] Ocorrência perdida fica visível e não gera backfill automático.
- [x] Tarefa removida do código torna seu override órfão, ignorado e alertável, sem executar executor desconhecido.
- [x] Após o corte, somente o tick operacional permanece no scheduler para essas tarefas; definições legadas equivalentes não executam em paralelo.
