# Capturar snapshot autoritativo do schema do Cadastro de Inventário

Type: task
Status: resolved
Blocked by: 02

## Question

Com base na lista de objetos extraída dos SQLs, como capturar e versionar em `modules/estoque/cadastro-inventario/schema/` um snapshot somente leitura das tabelas, colunas, tipos, nulabilidade, chaves, FKs, índices, triggers, funções e sequences realmente envolvidos?

Definir JSON/catalogo bruto datado, banco/versão, hash SHA, manifesto de cobertura, README e procedimento de repetição. O snapshot deve impedir SQL inventado, sustentar a decisão `INNER JOIN` versus `LEFT JOIN` e não permitir introspecção de schema em runtime, `hasTable`/`Schema::has*`, `information_schema` ou `pg_catalog` no caminho de negócio.
## Answer

Foi criado o snapshot em modules/estoque/cadastro-inventario/schema/postgresql-authoritative-2026-09-09.json, com manifesto, README e ferramenta repetível capture-schema.php. A captura ocorreu em transação READ ONLY usando a conexão PostgreSQL configurada no checkout, com SHA-256 2B4A2184059D69A34BC974967244EFFFB5AB2B60419775CA4AC00312EFFC1ABE.

A base capturada é santaapolonia, PostgreSQL 17.4. Ela contém somente produtos, caracteristicas, marcas e grades entre as 20 relações candidatas; 16 relações do SQL do Inventário estão ausentes. Também foram capturadas a sequence chave, as sobrecargas de QuantidadeTotalDoEstoque e parametros_valor. A ausência foi registrada como gate: o snapshot não autoriza inventar ou remover tabelas e uma nova captura da base legada autoritativa é obrigatória antes de fechar SQL Laravel.

O README documenta repetição, hash, cobertura, limitações e a proibição de introspecção de schema no caminho de negócio, incluindo hasTable/Schema::has*, information_schema, pg_catalog e testes de driver.
