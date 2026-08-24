# Capturar snapshot PostgreSQL da Consulta de Entrega de Produtos

Type: task
Status: resolved
Blocked by: 05

## Answer

Snapshot capturado e validado em procedimento somente leitura no container Laravel teclux_cloud-php-1.

- Banco tecsoft, schema public, usuario tecsoft, PostgreSQL 9.5.25, SQL_ASCII, timezone America/Sao_Paulo.
- Metodo: BEGIN; SET TRANSACTION READ ONLY; consultas aos catalogos pg_catalog; ROLLBACK. Nenhuma migration, DDL ou DML foi executada.
- Artefato: modules/entregas/consulta-entrega-produtos/schema/postgresql-authoritative-2026-08-23.json.
- Manifesto: modules/entregas/consulta-entrega-produtos/schema/consulta-entrega-produtos-schema-manifest.json.
- SHA-256 do snapshot: 491BEC3B920E1BF257CCB28A42DBF9BB81161F0135901A5914D19313C505B8F2.
- Cobertura: 15 relacoes e 1 funcao, contratos_atual(character), sem relacoes ou funcoes requeridas ausentes.
- O snapshot registra colunas, tipos, nulabilidade, defaults, constraints, indices, triggers, estimativas de linhas e definicoes de funcao. Bytes invalidos do SQL_ASCII foram substituidos apenas na serializacao JSON.

A validacao confirmou JSON e manifesto validos e correspondencia do hash. O SQL final ainda deve usar EXPLAIN e testes PostgreSQL para desempenho/cardinalidade, mas nao deve sondar schema ou driver em runtime.

## Question

Capturar em procedimento somente leitura o schema autoritativo das tabelas, funcoes, chaves, nulabilidade, indices e cardinalidades necessarias para as duas branches da Consulta de Entrega de Produtos. Versionar JSON datado, SHA, manifest e README em modules/entregas/consulta-entrega-produtos/schema/. Confirmar especialmente produtosdadosfiscais.numero, produtoscontratos.numero, notas.dadofiscal, periodosentrega, limites_entregas_regioes, romaneios/romaneiosnotas, fornecedores, cidades, bairros e contratos_atual. Nao substituir a captura por hasTable, Schema::has*, information_schema, pg_catalog em request ou teste condicional de driver.
