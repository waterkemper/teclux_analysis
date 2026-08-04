# Reavaliar a geração de movimentos de entrada por `AtribuirDadosProdutos`

Type: task
Status: resolved
Blocked by: 03, 05, 06, 07

## Question

Qual é o comportamento exato da rotina Delphi `AtribuirDadosProdutos` na confirmação de uma nota — incluindo chamadas, SQLs, cálculos, gravações e efeitos na geração da nota/movimentos de entrada —, o que é responsabilidade explícita da aplicação versus trigger/procedure do banco, e quais lacunas ou divergências isso revela na etapa 4 e no código Laravel atual?

## Answer

Reavaliação concluída em [pesquisa-atribuir-dados-produtos-e-movimentos.md](../../../modules/interlojas/confirmacao-por-notas/pesquisa-atribuir-dados-produtos-e-movimentos.md), e o prompt da etapa 4 foi corrigido.

Decisão: `AtribuirDadosProdutos(..., TransferenciaEntrada, ...)` é uma etapa explícita e obrigatória de materialização fiscal/cadastral por item, baseada em `SQLDadosProdutosNotasSaidas`, seguida por cálculo fiscal agregado; não é efeito implícito de trigger. As triggers de `movimentos` são autoridade apenas para completar as intenções `STC`/`FTR` em operação, saldos, financeiro, projeções e derivados. O Laravel atual tem paridade parcial: não executa o oráculo enriquecido/cálculo, fixa defaults fiscais, confunde ou omite `filial`/`filial_estoque`, força `origem`, diverge na ausência de estoque e não possui golden master PostgreSQL Delphi × Laravel.
