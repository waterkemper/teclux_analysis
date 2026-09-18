# Decidir o fatiamento dos prompts /speckit.specify da Curva ABC

Type: grilling
Status: resolved
Blocked by: 01, 02, 03, 04, 05

## Question

Qual é a menor sequência de prompts autocontidos para `modules/estoque/relatorio-curva-abc/` que cobre sem duplicação: evidência funcional Delphi, fundação/geração `heavy-reports`, fotografia/grade/saídas, gravação persistente do Resultado da Curva ABC, autorização/concorrência/auditoria e aceite/rollout? Definir fronteiras, pré-requisitos, artefatos de pesquisa/schema, ordem de execução e gates comuns.
## Answer

Fatiamento confirmado pelo usuario: dois prompts sequenciais em modules/estoque/relatorio-curva-abc, apoiados por um README e um dossie de evidencias compartilhados.

1. 01-speckit-prompt-geracao-curva-abc.md: F6 na tela, filtros, grade, cancelamento, reaproveitamento minimo do heavy-reports e resultado efemero. Nao inclui historico, PDF, impressao ou Excel.
2. 02-speckit-prompt-gravacao-classificacao-abc.md: comando Gravar, modos por Produto 0/1/2, autorizacao global, substituicao transacional, concorrencia, auditoria e testes.

Os prompts devem ser executados em ordem; o segundo consome o contrato da geracao e o resultado corrente definido pelo primeiro. Nenhum prompt implementa durante speckit.specify, e ambos devem exigir revalidacao do checkout Laravel sem reabrir diretamente o Delphi.
