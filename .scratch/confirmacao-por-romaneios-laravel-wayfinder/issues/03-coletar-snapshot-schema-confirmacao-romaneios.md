# Coletar snapshot autoritativo do schema da Confirmação por Romaneios

Type: task
Status: resolved
Blocked by: 02

## Answer

Foi coletado o snapshot autoritativo em [schema/README.md](../../../modules/interlojas/confirmacao-por-romaneios/schema/README.md), com o JSON bruto em [postgresql-authoritative-2026-08-03.json](../../../modules/interlojas/confirmacao-por-romaneios/schema/postgresql-authoritative-2026-08-03.json).

- Origem confirmada no container Laravel: banco `tecsoft`, schema `public`, PostgreSQL `9.5.25`, `SQL_ASCII`, timezone `America/Sao_Paulo`.
- Método: `BEGIN; SET TRANSACTION READ ONLY; pg_catalog; ROLLBACK`; nenhum DDL, DML de negócio, migration ou introspecção runtime foi executado.
- Resultado: 34 relações solicitadas encontradas, 1.431 colunas, 314 constraints, 118 índices, 115 triggers, 13 funções e duas sequences; nenhuma relação ou função solicitada ficou ausente.
- O artefato estende o snapshot do Cadastro de Romaneios de 2026-08-01 e preserva o snapshot histórico. SHA-256 do novo JSON: `D8C1B847D83E5FB3A1368D82AD2C2FC46438509D1761BAD63660CBD0528B572D`.
- O README registra as regras de join guiadas por nulabilidade/FK e consultas set-based com `IN`/`ANY(array)`, além dos limites da evidência.

## Question

Com base na matriz de SQL e objetos alcançados, qual snapshot versionado deve ser coletado em `modules/interlojas/confirmacao-por-romaneios/schema/` para evitar SQL incorreto? Incluir tabelas, views, colunas, nulabilidade, PK/FK/unique, índices, sequences, triggers e funções/procedures relevantes, com origem, versão e data da coleta.

A coleta deve ser somente leitura no PostgreSQL autoritativo e alimentar os prompts. Conforme ADR Laravel 0007, não propor `Schema::hasTable`, `Schema::hasColumn`, `information_schema` ou ramificação de negócio em runtime. O snapshot deve sustentar decisões de `INNER JOIN`/`LEFT JOIN`, `IN`/`ANY(array)`, cardinalidade e cancelamento de consulta.
