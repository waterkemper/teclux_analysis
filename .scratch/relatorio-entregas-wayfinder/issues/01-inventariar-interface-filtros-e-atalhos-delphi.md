# Inventariar interface, filtros e atalhos do Relatório de Entregas Delphi

Type: research
Status: resolved
Blocked by:

## Question

Qual é o contrato funcional comprovável da tela `fmrelatorioentrega.pas/.dfm`: controles, estado inicial, períodos de venda e entrega, seleção de clientes/fornecedores/regiões, situação, agrupamento, validações, F6, F9/CTRL+F9, exclusão, botões, breadcrumb implícito, colunas/ordem visual e qualquer operação de relatório? Registrar evidências por arquivo/linha, incluindo campos desabilitados, defaults e possíveis bugs, sem pedir uma nova inspeção Delphi ao futuro implementador.

## Answer

Pesquisa concluída. A evidência está consolidada em [pesquisa-interface-delphi.md](../../../modules/entregas/relatorio-entregas/pesquisa-interface-delphi.md).

O artefato registra referências arquivo:linha para layout, defaults de datas, filtros de venda/entrega/situação/clientes/fornecedores/regiões, validação, grids de seleção, dataset/projeção/ordem/preview do relatório, inclusão/exclusão, F7/F9/Ctrl+F9/Ctrl+Del, e a ausência de F6 e de cancelamento real do `qryRelatorioEntrega.Open`.

Também classifica fatos que não devem ser inventados: agrupamento oculto/ignorado, macro de situação potencialmente divergente, `TfrxReport` vazio, SQL textual com subconsulta correlacionada, nulabilidade desconhecida para LEFT versus INNER JOIN, ausência de `parametros_valor`, máscara NF-e, snapshot de schema, menu/acessos e grid de saída. O handoff orienta consultar somente o checkout Laravel e nunca reabrir fontes Delphi.
