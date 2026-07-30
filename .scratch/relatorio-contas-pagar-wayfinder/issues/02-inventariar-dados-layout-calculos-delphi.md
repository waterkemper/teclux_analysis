# Inventariar dados, layouts e cálculos do Relatório de Contas a Pagar no Delphi

Type: research
Status: resolved

## Question

Quais consultas, filtros efetivos, campos, fórmulas, parâmetros, agrupamentos, quebras, subtotais, totais e templates de relatório `dmrelatorioduplicatas.pas/.dfm` produzem para cada modalidade, incluindo previsões, autorizações, adiantamentos, juros e descontos?

## Answer

O inventário completo foi registrado em [Dados, layouts e cálculos do Relatório de Contas a Pagar no Delphi](../../../modules/financeiro/contas-pagar/relatorio/pesquisa-dados-layout-calculos-delphi.md). A consulta única une Duplicatas e Adiantamentos, aplica filtros/macros próprios por modalidade e alimenta templates detalhados/resumidos com agrupamentos e cinco medidas financeiras. A pesquisa também identifica regras de regime de caixa, diferenças entre desconto persistido e inferido, overrides `.fr3` e fragilidades legadas que não devem ser reproduzidas.
