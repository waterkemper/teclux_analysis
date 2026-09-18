# Extrair SQLs, parâmetros e dados do Delphi

Type: research
Status: resolved
Blocked by:

## Question

Quais SQLs, macros, parâmetros bindados, funções e datasets são realmente usados pelo módulo, incluindo consultas de filtros, lookup, grid, detalhe, edição, gravação, exclusão, operações e relatórios? Consultar também `clparamtrossistema.pas` para identificar cada chamada a `parametros_valor('', '')`, defaults, escopo e conversão.

Classificar SQL por finalidade e registrar tabelas, campos, joins, filtros, ordenação, agregações, cardinalidade esperada e riscos de duplicação/N+1. Propor apenas a tradução segura para Laravel com binds e `IN`/`= ANY(array)`/`unnest` quando houver listas; nunca transportar macros textuais ou concatenação. O resultado deve deixar explícita a lista candidata de objetos para o snapshot do schema e registrar divergências/SQLs mortos.

## Answer

Pesquisa concluída em [pesquisa-sqls-parametros-delphi.md](../../modules/caixa/controle-recebimentos/pesquisa-sqls-parametros-delphi.md).

- A consulta principal `qryRecebimentos` foi reconstruída a partir do DFM, incluindo projeção, subconsultas, funções, joins, ordenação e macros.
- Foram catalogados os datasets auxiliares de tipos, situação, recebimentos, documentos a pagar, duplicatas, movimentos bancários, eventos, autenticações e funções de próxima sequência.
- As macros de datas, Filial, tipo, Cliente, operação, forma de recebimento e TEF/POS foram classificadas; o legado concatena valores e listas em SQL, mas o Laravel deve usar DTOs tipados, binds, `IN`/`ANY(array)`/`unnest` e consultas set-based.
- O fluxo de gravação foi mapeado: confirmação/estorno/alteração de tipo, documentos a pagar, duplicatas, integração bancária e aplicação conjunta por `Perpetrar`.
- O parâmetro efetivamente usado é `Recebimentos Integrado com Bancos`, exposto por `TtecParametrosSistema`/`FList`; não há chamada literal a `parametros_valor('', '')` na fonte Delphi. O catálogo vem de `parametros`/`parametrosfiliais` por `ParametrosSistemasSQL`.
- Foi definida a lista candidata para o snapshot de schema e registradas lacunas sobre nulabilidade/cardinalidade, funções, triggers e autoridade de `MAX()+1`.

Nenhum código Laravel ou SQL de produção foi implementado.