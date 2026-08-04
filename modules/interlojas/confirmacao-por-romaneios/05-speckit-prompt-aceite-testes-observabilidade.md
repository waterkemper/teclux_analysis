# Prompt para /speckit.specify — aceite, testes e observabilidade

~~~text
/speckit.specify

Crie a especificação transversal de aceite, testes e observabilidade de Confirmação por Romaneios, fechando as specs 01–04. Não implemente nem execute testes.

Leia todos os prompts anteriores e:

- modules/interlojas/confirmacao-por-romaneios/README.md
- modules/interlojas/confirmacao-por-romaneios/schema/README.md
- modules/interlojas/confirmacao-por-romaneios/schema/postgresql-authoritative-2026-08-03.json
- modules/interlojas/confirmacao-por-romaneios/pesquisa-padroes-laravel-reutilizaveis.md
- modules/interlojas/confirmacao-por-romaneios/pesquisa-sql-dominio-efeitos-delphi.md
- laravel/CONTEXT.md

## Matriz de aceite

Cubra menu/capability/Filial, cinco parâmetros, filtros e elegibilidade Delphi, estados vazio/erro/cancelado/conflito, F6 direta sem paginação, SQL parametrizado, arrays vazios, ausência de N+1, INNER/LEFT JOIN pelo snapshot, exportação server-side, F9, máscara NF-e, radio buttons, grids, ordenação/personalização, F6/F5/atalhos, conferências, autorização, unidade atômica, locks, rollback, concorrência Delphi–Laravel e retry idempotente.

## Testes obrigatórios

- Feature tests de menu, middleware, Filial, parâmetros, F9, máscara, atalhos, grids e exportação.
- PostgreSQL autoritativo em schema gate/integração para funções, triggers, constraints, bindings, arrays vazios, joins e query count sem N+1.
- Cancelamento real com runner cancelável e consulta bloqueável, comprovando pg_cancel_backend().
- Transações para sucesso, falhas por etapa, rollback por Romaneio, revisão obsoleta, concorrência e retry.
- Exportação reexecutada no servidor, rejeitando rows, SQL, filtros, colunas ou Filial arbitrários da UI.
- Não usar Schema::hasTable, information_schema ou pg_catalog em runtime; não testar driver, hashtablefs ou limiar de performance não decidido.

## Observabilidade

Defina logs/métricas com X-Trace-Id, usuário, Filial, operação, quantidade, sucessos, conflitos, falhas, cancelamento, rollback, idempotência reaproveitada, query count e duração. Redija regras para nunca registrar senha, credencial, chave NF-e completa, SQL com dados ou payload fiscal sensível.

Entregue matriz requisito → teste → evidência, critérios bloqueadores de aceite, eventos, métricas, alertas e classificação de falhas. Não criar funcionalidade nem reabrir os escopos de Cadastro de Romaneios ou Confirmação por Notas.
~~~

