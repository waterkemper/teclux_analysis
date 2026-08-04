# Coletar snapshot autoritativo do schema de Romaneios

Type: task
Status: resolved
Blocked by: 02

## Question

Qual é a estrutura confirmada no PostgreSQL autoritativo de todas as tabelas, views, sequences, constraints, índices, triggers e funções alcançadas pelo módulo, e como registrá-la com origem e data em `modules/entregas/cadastro-romaneios/schema/` para verificação prévia pelo Cursor sem introspecção em runtime?

## Answer

O snapshot foi coletado em transação PostgreSQL `READ ONLY` e está indexado em [schema/README.md](../../../modules/entregas/cadastro-romaneios/schema/README.md), com o catálogo bruto datado e as definições das funções. Foram confirmadas 26 tabelas, 1.431 colunas, 314 constraints, 118 índices, 115 triggers, oito funções e duas sequences, sem objetos solicitados ausentes.

A coleta revelou uma divergência relevante: o servidor consultado é PostgreSQL 9.5.25, não 9.6; `vfornecedores` é tabela física; as sequences homônimas são chamadas pelas funções de próximo número e não são owned por colunas. O índice documenta nulabilidade para decidir INNER/LEFT JOIN, cardinalidades que obrigam consulta server-side/set-based, triggers habilitadas/desabilitadas e a regra de repetir a coleta se o ambiente de implantação não for esta mesma origem.
