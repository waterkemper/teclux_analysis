# Inventariar SQL, projeções e semântica do Relatório de Entregas Delphi

Type: research
Status: resolved

## Answer

Pesquisa concluida em [pesquisa-sql-delphi.md](../../../modules/entregas/relatorio-entregas/pesquisa-sql-delphi.md).

O documento registra o SQL textual do `qryRelatorioEntrega`, sua projecao,
macros de datas/clientes/transportadores/regioes, os modos `EM ABERTO` e
`ENTREGUE`, calculo de `QuantidadeEntregue`/`aEntregar`, ordenacao, FastReport,
cardinalidade e riscos de duplicacao. Classifica as evidencias e separa regras
seguras para Laravel: binds, `IN`/`ANY(array)`, `EXISTS`/pre-agregacao para
evitar N+1, joins definidos pela nulabilidade confirmada e nenhum SQL textual
aceito do usuario.

Tambem ficou registrado que nao ha `parametros_valor(...)` nem chave de
parametro especifica nas fontes desta tela; que a subconsulta de quantidade e
correlacionada apenas por produto/data; que o `LEFT JOIN` fiscal pode
multiplicar linhas; e que schema/cardinalidades e a intencao da variavel
FastReport `emAberto` permanecem lacunas para os proximos tickets. Nenhuma
fonte Delphi foi alterada e nenhuma implementacao foi feita.
Blocked by:

## Question

Quais SQLs, joins, subconsultas, macros, filtros condicionais, projeções, cálculos de `QuantidadeEntregue`/`aEntregar`, situações, ordenação, regiões, endereço de entrega, transportador e campos do FastReport são usados por `dmrelatorioentrega.pas/.dfm`? Determinar a semântica de cada filtro e modo (`EM ABERTO`/`ENTREGUE`), cardinalidades e riscos de duplicação, SQL textual/injeção e N+1, propondo a tradução segura para uma leitura set-based Laravel com binds, `IN`/`ANY(array)` e joins coerentes com nulabilidade.
