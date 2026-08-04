# Prompt para /speckit.specify — confirmação transacional e conferências

~~~text
/speckit.specify

Crie a especificação funcional e técnica dos comandos F5 e das conferências de Confirmação por Romaneios, consumindo as specs 01 e 02. Preserve exatamente o comportamento funcional do Delphi, corrigindo apenas defeitos técnicos de carregamento, SQL e transação. Não implemente.

Leia:

- modules/interlojas/confirmacao-por-romaneios/01-speckit-prompt-fundacao-dominio-seguranca.md
- modules/interlojas/confirmacao-por-romaneios/02-speckit-prompt-consulta-f6-cancelavel.md
- modules/interlojas/confirmacao-por-romaneios/pesquisa-sql-dominio-efeitos-delphi.md
- modules/interlojas/confirmacao-por-romaneios/pesquisa-interface-delphi.md
- modules/interlojas/confirmacao-por-romaneios/schema/README.md
- modules/interlojas/confirmacao-por-romaneios/schema/postgresql-authoritative-2026-08-03.json
- laravel/CONTEXT.md

## Confirmação

- Confirmar só aceita Romaneio não passagem, entrada CONFIRMADA, Filial autorizada, documento elegível, não casado e filtros/vínculos fiscais revalidados dentro da transação.
- Cada Romaneio selecionado é uma unidade atômica independente. Todos os efeitos fiscais, estoque, pedidos, financeiro, movimentos, situação e auditoria confirmam juntos ou sofrem rollback juntos.
- Bloquear em ordem determinística, reler situação/revisão/elegibilidade após os locks e retornar conflito explícito para alteração Delphi ou Laravel concorrente.
- Reservar idempotência por operação/Romaneio/Operador/Filial/hash canônico. Retry igual retorna o resultado anterior; conteúdo ou revisão divergente conflita.
- Separar Operador e Autorizador, aplicar a prova sensível compartilhada, não guardar senha e auditar ambos.
- Reutilizar funções PostgreSQL autoritativas confirmadas. Não duplicar em PHP funções de situação/numeração nem usar MAX()+1.
- Publicar sucesso somente após commit; não criar confirmação parcialmente persistida nem usar “última gravação vence”.

## Conferências

Especificar Conferir Produtos, Conferir Volumes e Visualizar Conferência como operações distintas, com capability, revalidação, idempotência, efeitos e resultado por Romaneio. Carregar detalhes em lote e preservar os códigos/efeitos Delphi. Se uma função/triggers for caixa-preta, classifique como lacuna e não invente sua semântica.

Entregue comandos, guards, locks, transições, tabelas/funções, erros, auditoria, idempotência, rollback e contratos de resposta por unidade. Fora de escopo: implementação, migration, estado paralelo e teste de driver/hashtablefs.
~~~

