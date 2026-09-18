# Extrair SQLs, parâmetros e dados do Cadastro de Inventário

Type: research
Status: resolved
Blocked by:

## Question

Quais SQLs, macros, binds, funções e datasets são realmente usados pelo módulo, incluindo consulta do inventário, Produtos, estoques, movimentos, lotes, geração, importação, exclusão, próximo número e relatórios? Consultar `clparamtrossistema.pas` e identificar chamadas, defaults, escopo por Filial e conversões de parâmetros, inclusive quando a abstração equivalente do Laravel for `parametros_valor('', '')`.

Classificar cada SQL por finalidade, tabelas/campos, joins, filtros, ordenação, agregações e cardinalidade; registrar SQL morto, concatenação, `MAX()+1`, subconsultas repetidas e riscos de duplicação/N+1. Propor apenas a tradução segura para Laravel com DTOs tipados, binds e consultas set-based. Produzir `modules/estoque/cadastro-inventario/pesquisa-sqls-parametros-delphi.md` e a lista candidata de objetos para o snapshot do schema.

## Answer

Pesquisa consolidada em [pesquisa-sqls-parametros-delphi.md](../../../modules/estoque/cadastro-inventario/pesquisa-sqls-parametros-delphi.md).

O dossiê cataloga os datasets e SQLs de cabeçalho, grid de Produtos, geração por filtros, lotes, processamento, movimentos, exclusões e relatórios; identifica as macros textuais, os binds, os parâmetros efetivamente usados e a lista candidata de objetos do schema.

Conclusões principais: não há chamada literal a `parametros_valor('', '')`; os parâmetros são lidos por `ParSistema`; o legado usa `MAX()+1`, `setval/nextval('chave')`, subconsultas correlacionadas e listas SQL injetadas por macros. O handoff Laravel exige serviço de parâmetros tipado, binds, `IN`/`ANY(array)`/`unnest`, consultas set-based, `INNER JOIN` para relações obrigatórias e confirmação no snapshot antes de escrever SQL.

Nenhuma fonte Delphi ou código Laravel foi alterado. O ticket seguinte de snapshot do schema está liberado.
