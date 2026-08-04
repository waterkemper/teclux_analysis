# Inventariar consultas, projeções e estratégia de batching

Type: research
Status: resolved
Blocked by:

## Question

Quais datasets, SQLs, joins, subconsultas, macros, binds, filtros, ordenações e relações mestre–detalhe alimentam notas e produtos; onde o legado executa consultas por linha/item; e como especificar repositórios Laravel set-based sem N+1, usando `whereIn`/`IN` ou `ANY(array)` parametrizado conforme cardinalidade e limites do PostgreSQL?

## Comments

## Answer

Inventário concluído em `modules/interlojas/confirmacao-por-notas/pesquisa-sql-batching-delphi.md`.

Decisão: a implementação Laravel opera por página/lote, nunca por linha navegada. Cabeçalhos, itens, vencimentos, pedidos, filiais e estoques são carregados uma vez por conjunto com binds; `whereIn` atende listas limitadas usuais e `ANY(array)`/`unnest ... WITH ORDINALITY` atende alta cardinalidade, preservação de ordem e pares `(produto, filial)`. O relatório identifica datasets, projeções, filtros, subconsultas, funções, pontos N+1 e testes de query count.
