# Schema do Cadastro de Inventário

Snapshot capturado em **2026-09-09 17:06:59 -03:00** pela ferramenta explícita
[capture-schema.php](capture-schema.php), usando a conexão PostgreSQL configurada no
checkout Laravel e uma transação BEGIN; SET TRANSACTION READ ONLY; pg_catalog; ROLLBACK.

- Banco: santaapolonia
- Schema: public
- Usuário: tecsoft
- PostgreSQL: 17.4
- Encoding servidor/cliente: WIN1252
- Timezone: America/Sao_Paulo
- Snapshot: [postgresql-authoritative-2026-09-09.json](postgresql-authoritative-2026-09-09.json)
- Manifesto: [cadastro-inventario-schema-manifest.json](cadastro-inventario-schema-manifest.json)
- SHA-256: 2B4A2184059D69A34BC974967244EFFFB5AB2B60419775CA4AC00312EFFC1ABE

## Resultado da cobertura

A evidência SQL do Delphi indicou 20 relações candidatas. Nesta base foram encontradas somente:

- produtos
- caracteristicas
- marcas
- grades

Também foram encontrados:

- sequence chave;
- 4 sobrecargas de QuantidadeTotalDoEstoque;
- 2 sobrecargas de parametros_valor;
- 17 colunas, 9 constraints, 6 índices e nenhum trigger nas relações encontradas.

As seguintes relações candidatas não existem nesta base e foram registradas em missing_relations no JSON:

inventario, inventarioprodutos, inventarioprodutoslotes, classes, grupos, promocoes,
filiais, fornecedoresprodutos, estoques, estoqueslotes, movimentos, movimentoslotes,
lotes, parametros e parametrosfiliais.

Isso é um **gate de bloqueio**, não autorização para remover tabelas do domínio. O banco atual não é suficiente para validar os SQLs do Cadastro de Inventário. Antes de fechar o contrato Laravel, deve ser capturada a base legada autoritativa que contenha as relações ausentes, ou deve ser registrada formalmente uma decisão de divergência/mapeamento.

## Como repetir

1. Garantir que a conexão aponta para a base PostgreSQL legada autoritativa; não usar SQLite.
2. Executar, fora do caminho de negócio:

   php capture-schema.php postgresql-authoritative-YYYY-MM-DD.json

3. A ferramenta abre transação READ ONLY, consulta somente catálogos PostgreSQL, coleta relações, colunas, nulabilidade, defaults, constraints, PK/FK, índices, triggers, sequences e funções, e executa ROLLBACK.
4. Calcular SHA-256 do JSON e atualizar o manifesto no mesmo change set.
5. Comparar requested_relations, missing_relations e requested_functions com o dossiê SQL. Qualquer ausência ou divergência bloqueia a especificação da consulta afetada.
6. Nunca sobrescrever um snapshot anterior; criar novo arquivo datado.

A ferramenta aceita SCHEMA_CAPTURE_HOST para capturas em host diferente. Ela nunca deve ser chamada por controller, service, policy, request ou teste de aplicação.

## Regras de uso

O JSON é um contrato versionado de especificação/CI. O caminho de negócio não pode consultar information_schema, pg_catalog, testar driver, usar hasTable/Schema::has* ou decidir joins por disponibilidade de tabela.

Use INNER JOIN quando nulabilidade, FK, cardinalidade e semântica obrigatória estiverem comprovadas. Use LEFT JOIN somente para relação opcional comprovada. Use projeção explícita, binds e consultas set-based; para listas, prefira IN, ANY(array) ou unnest conforme a chave. Não reproduza N+1, MAX()+1 ou concatenação SQL.

A captura atual comprova uma divergência de ambiente. Portanto, os prompts finais devem apontar este snapshot e exigir uma nova captura autoritativa antes de escrever SQL para inventario e suas tabelas filhas.

