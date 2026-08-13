# Inventariar a interface e os parâmetros do Relatório de Contas a Pagar no Delphi

Type: research
Status: resolved

## Answer

Inventário concluído em [Interface e parâmetros do Relatório de Contas a Pagar no Delphi](../../../modules/financeiro/contas-pagar/relatorio/pesquisa-interface-parametros-delphi.md). A unit mantém três modalidades em uma tela e muda dimensão do período e controles habilitados conforme a modalidade. O documento registra filtros, defaults, validações, agrupamentos, ordenação, detalhe/resumo e jornada até o preview FastReport com referências exatas. Não existe atalho concreto de impressão declarado nessas units; ele é herdado.

## Question

Quais modalidades, filtros, validações, valores padrão, controles condicionais, agrupamentos, opções de resumo, atalhos e jornadas de preview/impressão são definidos por `fmrelatorioduplicatas.pas/.dfm`, e como variam entre Duplicatas em aberto, todas as Duplicatas e pagamentos efetuados?
