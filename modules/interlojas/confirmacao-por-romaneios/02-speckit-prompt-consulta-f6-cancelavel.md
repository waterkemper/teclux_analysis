# Prompt para /speckit.specify — consulta F6 direta e cancelável

~~~text
/speckit.specify

Crie a especificação funcional e técnica da consulta F6 de Confirmação por Romaneios, consumindo a spec 01. Defina filtros, SQL direto, resultado completo, seleção, ordenação, enriquecimentos, exportação e cancelamento real. Não implemente.

Leia:

- modules/interlojas/confirmacao-por-romaneios/01-speckit-prompt-fundacao-dominio-seguranca.md
- modules/interlojas/confirmacao-por-romaneios/pesquisa-interface-delphi.md
- modules/interlojas/confirmacao-por-romaneios/pesquisa-sql-dominio-efeitos-delphi.md
- modules/interlojas/confirmacao-por-romaneios/pesquisa-parametros-autorizacoes-menu.md
- modules/interlojas/confirmacao-por-romaneios/pesquisa-padroes-laravel-reutilizaveis.md
- modules/interlojas/confirmacao-por-romaneios/schema/README.md
- modules/interlojas/confirmacao-por-romaneios/schema/postgresql-authoritative-2026-08-03.json

## F6 obrigatório

- F6 executa uma query direta completa, sem paginação, cursor, fila pesada ou limite silencioso.
- A consulta inteira roda em uma sessão PgsqlGerarQueryRunner cancelável. Cancelar aparece antes do primeiro await, chama cancelar-gerar, usa X-Trace-Id/ownership e executa pg_cancel_backend() antes do aborto local.
- A query é SQL direto parametrizado. Filtros e ordenação usam allowlists; valores usam bindings. Nunca concatenar SQL, nomes de Filial, filtros, IDs ou arrays recebidos da UI.
- Use uma query set-based para a grade principal. Agregações e enriquecimentos ficam na query/CTE ou em consultas de lote dentro do mesmo runner. É proibida query em foreach, AfterScroll, eager loading que esconda N+1 ou uma consulta por linha.
- Use IN, = ANY(array), unnest ou VALUES quando o conjunto for variável. Arrays vazios devem ter semântica explícita.
- Escolha INNER JOIN para FK/NOT NULL obrigatório e LEFT JOIN somente para relacionamento opcional deliberado, conforme o snapshot autoritativo.
- Revalide no backend Filial, elegibilidade, situação e filtros; o resultado da consulta não reserva nem garante elegibilidade futura.
- A exportação reexecuta a mesma leitura no servidor com filtros, ordenação e Filial congelados. Nunca aceite rows, SQL, colunas, filtros alterados ou IDs de Filial da UI.
- Preservar o último resultado completo em cancelamento/erro e nunca substituir a grade por resultado parcial.

## Saída da spec

Entregue contrato de filtros, campos projetados, relações e joins, allowlist de ordenação, seleção por IDs canônicos, catálogo de grid, exportação, estados de loading/vazio/erro/cancelado, rota de cancelamento, ownership e critérios de ausência de N+1. Não proponha medição de limiar ou EXPLAIN obrigatório. Não teste driver nem hashtablefs.
~~~

