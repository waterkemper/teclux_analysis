# Capturar snapshot autoritativo do schema envolvido

Type: task
Status: resolved
Blocked by: 02

## Answer

Snapshot autoritativo capturado e validado em procedimento somente leitura dentro do container Laravel `teclux_cloud-php-1`.

- Banco `tecsoft`, schema `public`, usuário `tecsoft`, PostgreSQL `9.5.25`, `SQL_ASCII`, timezone `America/Sao_Paulo`.
- Método: `BEGIN; SET TRANSACTION READ ONLY;` consultas explícitas a `pg_catalog`; `ROLLBACK`. Nenhum DDL, DML, migration ou introspecção runtime foi executado.
- Artefato: [`postgresql-authoritative-2026-09-01.json`](../../../modules/caixa/controle-recebimentos/schema/postgresql-authoritative-2026-09-01.json).
- Manifesto: [`controle-recebimentos-schema-manifest.json`](../../../modules/caixa/controle-recebimentos/schema/controle-recebimentos-schema-manifest.json).
- SHA-256: `AC9136556EAE72DF6D33A312C3FF58B3A66FC957BEE39AEAA2B6B532758A70AC`.
- Cobertura: 16 relações, 798 colunas, 189 constraints, 93 índices, 66 triggers, 29 sequences e 44 funções; as relações e funções requeridas não tiveram ausências.
- O README documenta a lista coberta, nulabilidade relevante para `INNER` versus `LEFT JOIN`, limitações de `reltuples`, regra de nova captura datada e validação do hash.

O snapshot passa a ser o gate estrutural da especificação. SQL Laravel deve usar somente objetos comprovados, projeção explícita, binds e consultas set-based (`IN`/`= ANY(array)`/`unnest` quando aplicável), sem N+1, `select *`, `MAX()+1` ou `Locate`. `hasTable`, `Schema::has*`, `information_schema`, `pg_catalog` e teste condicional de driver permanecem proibidos no caminho de negócio.
## Question

Com base na lista de objetos extraída dos SQLs, como capturar e versionar em `modules/caixa/controle-recebimentos/schema/` um snapshot somente leitura das tabelas, colunas, tipos, nulabilidade, chaves, FKs, índices, triggers, funções e sequences realmente envolvidos? Definir JSON/catalogo bruto datado, banco/versão, hash SHA, manifest de cobertura, README e regra para repetir a captura em outro ambiente.

O snapshot serve como gate para evitar SQL inventado e para decidir `INNER JOIN` versus `LEFT JOIN`; não deve ser buscado por introspecção no caminho de negócio. Não usar teste de driver, `hasTable`, `Schema::has*`, `information_schema` ou `pg_catalog` em request/teste condicional; qualquer consulta de catálogo fica restrita ao procedimento explícito de captura e deve ser documentada.
