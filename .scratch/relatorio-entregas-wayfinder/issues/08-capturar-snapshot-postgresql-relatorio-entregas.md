# Capturar e validar snapshot PostgreSQL do Relatório de Entregas

Type: task
Status: resolved
Blocked by: 07

## Question

Obter, por procedimento somente leitura, o schema autoritativo do banco-alvo do Relatório de Entregas e versioná-lo em `modules/entregas/relatorio-entregas/schema/`. Confirmar relações, colunas, tipos, nulabilidade, PK/FK, índices, cardinalidades e assinatura de `diadasemana`, especialmente `produtoscontratos`, que não está comprovada no snapshot vizinho de Romaneios. Criar JSON datado, funções SQL quando necessárias, README com origem/commit/hash/limitações e atualizar o manifesto preliminar. Se o banco autorizado não estiver acessível, registrar a checklist exata de acesso/ambiente necessária; não substituir a captura por `hasTable`, `Schema::has*`, `information_schema`, `pg_catalog` em request ou teste condicional de driver.

## Answer

Capturado e validado o schema PostgreSQL autoritativo no contêiner Laravel `teclux_cloud-php-1`, usando transação somente leitura:

- Banco `andra`, schema `public`, usuário `tecsoft`, PostgreSQL 9.5.25, `SQL_ASCII`, timezone `America/Araguaina`.
- Método: `BEGIN; SET TRANSACTION READ ONLY; pg_catalog; ROLLBACK`.
- Snapshot: [postgresql-authoritative-2026-08-19.json](../../../modules/entregas/relatorio-entregas/schema/postgresql-authoritative-2026-08-19.json), SHA-256 `4A87BD3DFAF52E869505E4B13A7C3DFB2A3AC126B82F2E2284B708780B5751B7`.
- Funções: [functions-2026-08-19.sql](../../../modules/entregas/relatorio-entregas/schema/functions-2026-08-19.sql), SHA-256 `010AC72A22FCD69D952E7C4BE2A1636A1D8E5225DFB6DCA2A2808849AB688B57`.
- Escopo: 11 relações, 878 colunas, 174 constraints, 74 índices, 32 triggers e 1 função; nenhuma relação ou função requerida ficou ausente.
- `produtoscontratos` é tabela física com PK `(contrato, produto, filial)`; os três campos são `NOT NULL`, e `dataentrega` é anulável.
- `diadasemana(date)` foi confirmada como função PL/pgSQL que retorna `character varying`.

O manifesto foi atualizado para `authoritative`, o README registra origem, limitações e hashes, e o prompt de consulta deixou de tratar o manifesto como preliminar. A validação confirmou JSON válido, zero lacunas e correspondência dos dois hashes.

O snapshot histórico de `tecsoft` não foi misturado: o banco efetivo atual é `andra`. Permanecem apenas validações de implementação, como `EXPLAIN`/desempenho no ambiente de destino e a decisão semântica final de cada `INNER JOIN`/ `LEFT JOIN`; não são lacunas estruturais do snapshot.
