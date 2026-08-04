# Snapshot autoritativo — Confirmação por Romaneios

## Origem e integridade

Coleta somente leitura realizada em **2026-08-03 01:16:41 -03**, pela conexão PostgreSQL efetivamente usada pelo contêiner Laravel `teclux_cloud-php-1`. A coleta executou `BEGIN`, `SET TRANSACTION READ ONLY`, consultas em `pg_catalog` e `ROLLBACK`; não executou DDL, DML de negócio, migrations nem introspecção no caminho de execução da aplicação.

- Banco lógico: `tecsoft`; schema: `public`; usuário observado: `tecsoft`.
- Servidor: **PostgreSQL 9.5.25**, `SQL_ASCII`, timezone `America/Sao_Paulo`.
- Snapshot bruto: [postgresql-authoritative-2026-08-03.json](postgresql-authoritative-2026-08-03.json).
- SHA-256: `D8C1B847D83E5FB3A1368D82AD2C2FC46438509D1761BAD63660CBD0528B572D`.
- O snapshot estende a evidência histórica do [Cadastro de Romaneios](../../../entregas/cadastro-romaneios/schema/postgresql-authoritative-2026-08-01.json), sem sobrescrevê-la.

O JSON contém 34 relações solicitadas e encontradas, 1.431 colunas, 314 constraints, 118 índices, 115 triggers, 13 funções e duas sequences. Entre as relações acrescentadas para este módulo estão `pedidosfiliais`, `notaspag`, `produtosnotaspag`, `venctosdadosfiscais`, `estoques`, `movimentos`, `naturezaspadrao` e `naturezas`. As funções solicitadas também foram encontradas, incluindo `situacao_romaneio_entrada`, `notaspag_proximocodigo`, `movimentos_proximonumero` e `ehnotafiscalsaidadevolucao`.

## Regras para os prompts e implementação Laravel

- Tratar este arquivo JSON como contrato estrutural da geração dos SQL: consultar nomes, tipos, nulabilidade, PKs, FKs, constraints, índices, triggers e definições de funções antes de escrever queries.
- Não fazer `Schema::hasTable`, consultas a `information_schema`/`pg_catalog` ou testes de schema durante o caminho normal da aplicação. Nova coleta deve ser um artefato datado e somente leitura quando o ambiente mudar.
- Usar `INNER JOIN` quando a relação obrigatória estiver confirmada por coluna `NOT NULL` e FK; reservar `LEFT JOIN` para relações realmente opcionais ou para preservar deliberadamente linhas órfãs. Não usar `LEFT JOIN` por hábito.
- Consultas de lote devem ser set-based, com uma única query e bindings usando `IN` ou `= ANY(array)`/`unnest` quando apropriado; nunca buscar dados relacionados uma linha por vez (N+1).
- A grade deve permanecer server-side e apoiar-se nos índices confirmados; qualquer plano de execução deve ser validado no ambiente alvo, sem carregar tabelas inteiras ou impor limite silencioso.

## Limites da evidência

O snapshot registra a estrutura encontrada no momento da coleta; não prova volume atual, distribuição dos dados, locks, duração das queries ou comportamento concorrente. Se banco, schema, versão ou ambiente de implantação divergirem, gerar novo snapshot datado e preservar este arquivo histórico.

