# Inventariar a interface e os filtros do Relatório de Situação dos Fornecedores no Delphi

Type: research
Status: resolved

## Answer

Inventário concluído em [Interface e filtros do Relatório de Situação dos Fornecedores no Delphi](../../../modules/financeiro/contas-pagar/relatorio-situacao-fornecedores/pesquisa-interface-filtros-delphi.md). A Data inicial limita a entrada/lançamento dos documentos, enquanto Data de situação é o limite superior desse período e a data de corte da posição financeira. O documento registra filtros, padrões, validações, título, parâmetros impressos, preview, aceleradores e comportamentos condicionais com referências exatas, incluindo o aparente defeito legado de “Somente documentos com notas”, que injeta `and FALSE`.

## Question

Quais filtros, valores padrão, validações, atalhos, jornadas, títulos, parâmetros impressos e comportamentos condicionais são definidos por `fmrelatoriosituacaofornecedores.pas/.dfm`, e qual dimensão temporal corresponde à data inicial e à data de situação?
