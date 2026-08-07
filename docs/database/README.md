# Catálogo do banco legado

Este diretório é o ponto de consulta para nomes de tabelas, colunas e regras
semânticas do PostgreSQL legado compartilhado pelo Delphi e pelo Laravel.

## Fonte de autoridade

O PostgreSQL legado é a fonte de verdade. Os snapshots JSON versionados são
coletas somente leitura dessa estrutura e devem ser consultados antes de
escrever SQL. Migrations do Laravel descrevem principalmente os stubs SQLite
usados nos testes; elas não substituem o schema legado de produção.

| Escopo | Snapshot | Estado |
|---|---|---|
| Transferência/Requisição para Exposição | [`postgresql-authoritative-2026-08-06.json`](../../modules/interlojas/transferencia-requisicao-exposicao/schema/postgresql-authoritative-2026-08-06.json) | Autoritativo para `produtos`, `caracteristicas`, `filiais`, `estoques`, `pedidosfiliais` e objetos relacionados |
| Confirmação por Romaneios | [`postgresql-authoritative-2026-08-03.json`](../../modules/interlojas/confirmacao-por-romaneios/schema/postgresql-authoritative-2026-08-03.json) | Snapshot específico do módulo |
| Cadastro de Romaneios | [`postgresql-authoritative-2026-08-01.json`](../../modules/entregas/cadastro-romaneios/schema/postgresql-authoritative-2026-08-01.json) | Snapshot específico do módulo |

O snapshot tem checksum validado pelo schema gate do backend. Uma nova coleta
deve atualizar o JSON e o teste correspondente no mesmo change set.

## Catálogo semântico

Para a consulta rápida de nomes e significados mais usados, consulte
[`legacy-catalogo-produtos.md`](legacy-catalogo-produtos.md). O JSON continua
sendo a referência completa para tipos, nulabilidade, constraints, índices,
triggers e funções.

## Fluxo obrigatório antes de criar SQL

1. Localizar a tabela dona da coluna no snapshot.
2. Confirmar o significado no catálogo semântico e na pesquisa Delphi do
   módulo.
3. Usar aliases explícitos e consistentes (`p` para `produtos`, `c` para
   `caracteristicas`, `e` para `estoques`, `f` para `filiais`).
4. Executar a consulta contra PostgreSQL real nos testes de schema/integração.
5. Não adicionar `Schema::has*`, `information_schema` ou `pg_catalog` ao
   caminho de requisição. Divergência estrutural deve falhar explicitamente;
   introspecção fica restrita a testes e ferramentas de coleta.

## Atualização

Snapshots devem ser coletados em transação somente leitura, documentando
banco, versão do PostgreSQL, schema, data, método e checksum. Nunca editar
manualmente as colunas do JSON para fazer uma consulta passar.
