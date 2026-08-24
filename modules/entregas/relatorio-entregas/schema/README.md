# Schema autoritativo — Relatório de Entregas

## Origem e integridade

Coleta somente leitura realizada em **2026-08-19 10:19:15 -03:00** pelo contêiner Laravel `teclux_cloud-php-1`, usando a conexão PostgreSQL efetiva do backend. O procedimento executou `BEGIN`, `SET TRANSACTION READ ONLY`, consultas aos catálogos `pg_catalog` e `ROLLBACK`; não executou DDL, DML, migrations nem consultas de negócio.

- Banco lógico: `andra`; schema: `public`; usuário: `tecsoft`.
- PostgreSQL: **9.5.25**; encoding do servidor/cliente: `SQL_ASCII`; timezone: `America/Araguaina`.
- Snapshot: [postgresql-authoritative-2026-08-19.json](postgresql-authoritative-2026-08-19.json), SHA-256 `4A87BD3DFAF52E869505E4B13A7C3DFB2A3AC126B82F2E2284B708780B5751B7`.
- Função destacada: [functions-2026-08-19.sql](functions-2026-08-19.sql), SHA-256 `010AC72A22FCD69D952E7C4BE2A1636A1D8E5225DFB6DCA2A2808849AB688B57`.
- Escopo coletado: 11 relações, 878 colunas, 174 constraints, 74 índices, 32 triggers e 1 função; nenhuma relação ou função requerida ficou ausente.

O banco corrente é `andra`, diferente dos snapshots históricos coletados em outros ambientes. Não combinar estes artefatos com snapshots de outro banco; repetir a coleta se o ambiente de implantação autoritativo for diferente.

## Fatos estruturais relevantes

- `produtoscontratos` é uma tabela física e tem PK composta `(contrato, produto, filial)`; não inventar um ID sintético persistido.
- `contrato`, `produto` e `filial` são `NOT NULL`; `dataentrega` é anulável.
- `diadasemana(date)` existe em `public`, é PL/pgSQL e retorna `character varying`.
- `reltuples` representa estimativa do catálogo, não cardinalidade exata nem prova de duração/lock. A SQL final ainda exige `EXPLAIN` no ambiente de destino.

## Uso obrigatório

O snapshot e o manifesto [relatorio-entregas-schema-manifest.json](relatorio-entregas-schema-manifest.json) são contratos estáticos para especificação, schema gate e testes PostgreSQL. O caminho de negócio não deve consultar existência de tabelas ou colunas.

Não usar `hasTable`, `Schema::has*`, `information_schema`, `pg_catalog` ou teste condicional de driver em request, serviço, repositório ou teste de comportamento. Se um objeto necessário não estiver no snapshot, bloquear a SQL e produzir uma nova captura datada. Usar `INNER JOIN` em caminhos obrigatórios por `NOT NULL`/FK e `LEFT JOIN` somente quando a ausência for semanticamente permitida.
