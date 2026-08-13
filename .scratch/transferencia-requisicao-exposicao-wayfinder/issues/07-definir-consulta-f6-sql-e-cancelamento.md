# Definir consulta F6, SQL set-based, desempenho e cancelamento real

Type: grilling
Status: resolved
Blocked by: 02, 04, 05

## Conversation

O usuario confirmou que a consulta deve ser sincrona e cancelavel, preservando a jornada Delphi. Gerar F7 inicia a query, Cancelar F6 aparece antes do primeiro await, o backend usa PgsqlGerarQueryRunner e o cancelamento deve atingir PostgreSQL por traceId e screenKey, alem do abort local. Fila pesada fica fora da primeira versao.

Decisao adicional do usuario: ignorar por completo as grades/painels de filtro de compras, grupos e filiais existentes no Delphi. Elas nao fazem parte da consulta principal, nao devem gerar endpoints, projection, SQL, filtros ou testes Laravel. O inventario Delphi permanece como evidencia historica, mas essa superficie esta fora do escopo.

Decisao adicional do usuario: a grade principal nao tera paginacao. O Laravel deve carregar todo o resultado filtrado, preservando ordenacao, exportacao e personalizacao do grid ERP; a consulta continua set-based, parametrizada e cancelavel no PostgreSQL para evitar N+1 e aborto apenas visual.

O usuario confirmou a ordenacao inicial do Delphi: requisitante, produto. Ordenacao interativa sera server-side e limitada ao catalogo/allowlist do grid.

## Answer

O protocolo da consulta foi fechado com paridade Delphi e padroes Laravel confirmados:

- Gerar F7 executa a consulta de forma sincrona; Cancelar F6 aparece antes do primeiro await.
- O backend usa PgsqlGerarQueryRunner, traceId e screenKey; o endpoint de cancelamento atinge a query PostgreSQL e o abort local e apenas complemento visual.
- Nao ha paginacao. A grade principal recebe todo o resultado filtrado, com ordenacao inicial requisitante/produto, ordenacao server-side por allowlist, exportacao integral e preferencias do grid ERP.
- A consulta principal e set-based e parametrizada. Relacoes em lote usam IN ou = ANY(array), com tratamento explicito de listas vazias; nao ha N+1, Locate por linha, lista SQL textual ou macro concatenada.
- INNER JOIN sera usado quando FK/NOT NULL e contrato tornarem a relacao obrigatoria; LEFT JOIN somente para relacionamento opcional comprovado pelo snapshot.
- O SQL fica restrito a pedidosfiliais, produtos/caracteristicas, filiais, estoques, lotes/conferencia, log e demais relacoes confirmadas no snapshot. As grades de compras/grupos/filiais do Delphi nao geram SQL, endpoints ou testes.
- O teste de cancelamento deve provar que a query PostgreSQL terminou; testes de driver e hashtablefs/hastablefs continuam proibidos.

O snapshot autoritativo esta em modules/interlojas/transferencia-requisicao-exposicao/schema/postgresql-authoritative-2026-08-06.json. As evidencias estao em pesquisa-sql-dominio-efeitos-delphi.md e pesquisa-padroes-laravel-reuso.md.

## Question

Como a consulta F7 da tela será implementada com filtros server-side, SQL parametrizado, joins comprovados pelo snapshot, projeção de grid, ordenação, paginação/exportação e carregamento em lote sem N+1? Decidir quando usar `IN` ou `= ANY(array)`, como tratar arrays vazios, se a execução será síncrona cancelável ou pesada em fila, e como o botão Cancelar aparecerá antes do primeiro await e chamará cancelamento PostgreSQL real por trace/screen. Definir testes que provem término da query, não apenas aborto visual.
