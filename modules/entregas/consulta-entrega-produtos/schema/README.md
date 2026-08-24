# Schema da Consulta de Entrega de Produtos

Snapshot autoritativo capturado em **2026-08-23 18:37:54 -03:00** pela conexao PostgreSQL efetiva do container Laravel teclux_cloud-php-1.

- Banco: tecsoft
- Schema: public
- Usuario: tecsoft
- PostgreSQL: 9.5.25
- Encoding do servidor/cliente: SQL_ASCII
- Timezone: America/Sao_Paulo
- Modo: BEGIN; SET TRANSACTION READ ONLY; pg_catalog; ROLLBACK
- Snapshot: postgresql-authoritative-2026-08-23.json
- SHA-256: 491BEC3B920E1BF257CCB28A42DBF9BB81161F0135901A5914D19313C505B8F2

O snapshot cobre as 15 relacoes usadas pelas duas branches do SQL: periodosentrega, limites_entregas_regioes, contratosdevolvidos, cidades, bairros, romaneios, romaneiosnotas, dadosfiscais, produtosdadosfiscais, produtos, notas, produtoscontratos, contratos, vfornecedores e regioes. Tambem captura a funcao public.contratos_atual(character).

O banco usa SQL_ASCII; bytes invalidos para UTF-8 nas descricoes/definicoes foram substituidos somente na serializacao JSON por JSON_INVALID_UTF8_SUBSTITUTE. Tipos, nulabilidade, constraints, indices, triggers e definicoes SQL foram consultados dentro da transacao read-only.

Este arquivo e o contrato estrutural para os prompts e futuros gates de schema. O caminho de negocio nao deve consultar information_schema, pg_catalog, hasTable, Schema::has* ou detectar driver para decidir SQL. Se o ambiente autoritativo mudar, uma nova captura datada deve ser criada sem sobrescrever esta.

Use INNER JOIN quando o vinculo obrigatorio estiver confirmado por NOT NULL/FK e pelo contrato da consulta. Use LEFT JOIN somente quando a ausencia for semanticamente valida e comprovada no snapshot e no dominio.
