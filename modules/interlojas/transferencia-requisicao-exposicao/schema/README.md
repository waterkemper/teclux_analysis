# Snapshot autoritativo — Transferência/Requisição para Exposição

## Resultado

O snapshot focado nos objetos candidatos do inventário Delphi foi coletado com sucesso em **2026-08-06 12:59:32 -03** e está em [postgresql-authoritative-2026-08-06.json](postgresql-authoritative-2026-08-06.json).

- SHA-256: `02F944BFEB2D97F47D3F124803E28F99989AE55040E01E56B6BA9073455A86DB`.
- Banco: `tecsoft`; usuário: `tecsoft`; schema: `public`.
- Servidor: PostgreSQL **9.5.25**; encoding do servidor/cliente: `SQL_ASCII`; timezone: `America/Sao_Paulo`.
- Método: `BEGIN; SET TRANSACTION READ ONLY;` consultas somente a catálogos PostgreSQL; `ROLLBACK`.
- O JSON contém 12 relações, 530 colunas, 121 constraints, 82 índices, 53 triggers, 35 funções alcançadas e duas sequences. Nenhuma relação ou função solicitada ficou ausente.
- A coleta estende o snapshot de [Confirmação por Romaneios](../../../interlojas/confirmacao-por-romaneios/schema/postgresql-authoritative-2026-08-03.json), sem sobrescrevê-lo.

Não foram executados DDL, DML de negócio, migrations, `Perpetrar`, `pg_dump` ou introspecção no caminho normal da aplicação. A transação de coleta foi descartada.

## Conexão e autoridade

O contêiner saudável `teclux_cloud-php-1` possui configuração Laravel para a conexão `pgsql` legada (`DB_CONNECTION`, `DB_HOST`, `DB_PORT`, `DB_DATABASE` e `DB_USERNAME` no `.env`). A conexão efetivamente alcançada confirmou `tecsoft`/`public` e PostgreSQL 9.5.25.

Não há uma conexão Laravel separada identificada como `readonly`/`read_only`. A segurança desta coleta veio do `SET TRANSACTION READ ONLY`; a conexão comum da aplicação continua podendo escrever quando usada por comandos autorizados. O `.env.example` e `config/database.php` também mantêm `PREVENT_DB_DESTRUCTIVE_COMMANDS=true` para impedir comandos Artisan destrutivos no PostgreSQL legado.

O ADR de arquitetura [0001](../../../../docs/adr/0001-separate-postgresql-pgvector-for-ai.md) estabelece o PostgreSQL legado como fonte de verdade e separa o PostgreSQL moderno de IA/pgvector. Portanto, a conexão `ai` na porta 5433 não é fonte deste snapshot.

## Relações candidatas do inventário Delphi

As cardinalidades abaixo são `reltuples` do catálogo, portanto são estimativas estruturais e não contagens atuais.

| Relação | Estimativa | Confirmação estrutural relevante |
|---|---:|---|
| `pedidosfiliais` | 2.445.128 | PK `codigo`; situação limitada a `A/F/C/D`; FKs para Produto, Filiais, `lotestransferencia` e origem; índices por Produto, situação e lote; triggers de atualização/log/timestamps. |
| `estoques` | 872.935 | PK `(produto, filial)`; FKs para Produto e Filial; `emestoque`, `futuro` e `reservaprevia` obrigatórios; triggers legadas e de auditoria/timestamps. |
| `movimentos` | 22.448.504 | PK `numero`; FK para `(produto, filial)` em `estoques` e para transferência `(trfproduto, trffilial)`; índices por Produto/Filial/data e transferência; triggers de saldo antes/depois. |
| `lotestransferencia` | 323.801 | Relação física encontrada; PK e trigger de geração/log confirmados. |
| `produtosconferencia` | 8.946.642 | Relação física encontrada; PK/FKs, índices e triggers confirmados para a fronteira de lote/conferência. |
| `pedidosfiliais_log` | 21.032.880 | Relação física encontrada; PK, índices e triggers confirmados para verificação de alteração. |
| `filiais` | 24 | PK `codigo`; `tipofilial` aceita `L/D/V`; `filial_estoque` referencia outra Filial. |
| `produtos` | 47.965 | PK `codigo`; FK para `caracteristicas`; campos de grade/promoção e índices de identificação confirmados. |
| `caracteristicas` | 28.896 | PK `codigo`; FKs `grade1`/`grade2` para `grades`, marca e demais catálogos; índices de grade e identificação. |
| `grades` | 31 | Relação física encontrada; PK, índice e triggers confirmados. |
| `promocoes` | 2.160 | Relação física encontrada; PK, índice e triggers confirmados; `produtos.promocao` referencia-a. |
| `produtoscodigobarras` | 135.838 | Relação física encontrada; PK/FKs e índices confirmados para a consulta por código de barras. |

Esses objetos cobrem a consulta mestre (`pedidosfiliais`, Produto, Característica, Filiais e Estoque), seleção por código de barras, lotes/conferência, verificação de log e efeitos de estoque/movimentos descritos em [pesquisa-sql-dominio-efeitos-delphi.md](../pesquisa-sql-dominio-efeitos-delphi.md). A fronteira fiscal explicitamente excluída pelo inventário continua fora deste snapshot.

## Funções e sequences

Foram confirmadas as duas funções solicitadas:

- `movimentos_proximonumero()` → `NEXTVAL('movimentos_proximonumero')::INTEGER`.
- `lotestransferencia_proximocodigo()` → `NEXTVAL('lotestransferencia_proximocodigo')::INTEGER`.

As duas sequences foram encontradas com cache 1, incremento 1 e sem ciclo. O snapshot também preserva as definições das funções usadas pelos triggers das relações candidatas, totalizando 35 funções alcançadas.

Consequência: o contrato não deve substituir essas funções por `MAX()+1`; a autoridade de alocação permanece no PostgreSQL. O significado final dos saldos de `movimentos`/`estoques` ainda deve ser tratado conforme as triggers observadas, não inferido apenas dos comentários Delphi.

## Formato reutilizável e próximos gates

O formato reutiliza os precedentes de [Cadastro de Romaneios](../../../entregas/cadastro-romaneios/schema/README.md) e [Confirmação por Romaneios](../../../interlojas/confirmacao-por-romaneios/schema/README.md): JSON bruto datado, metadados de origem, relações aninhadas com colunas/constraints/índices/triggers, listas achatadas para inspeção, definições de funções, sequences e listas explícitas de ausências.

Não foi encontrado um coletor versionado específico de snapshots no Laravel. Os artefatos reutilizáveis são:

- [config/database.php](../../../../laravel/backend/config/database.php), para a definição da conexão `pgsql` e separação da conexão `ai`;
- [LegacyPgsqlReadOnlyTestCase.php](../../../../laravel/backend/tests/Support/LegacyPgsqlReadOnlyTestCase.php), como helper de teste contra o legado sem `migrate:fresh`;
- [CadastroRomaneiosSchemaGatePostgresTest.php](../../../../laravel/backend/tests/Feature/Entregas/Romaneios/CadastroRomaneiosSchemaGatePostgresTest.php) e [ConfirmacaoPorRomaneiosSchemaGatePostgresTest.php](../../../../laravel/backend/tests/Feature/Interlojas/ConfirmacaoPorRomaneios/ConfirmacaoPorRomaneiosSchemaGatePostgresTest.php), como precedentes de checksum e verificação de objetos/funções;
- [ADR Laravel 0007](../../../../laravel/docs/adr/0007-legacy-runtime-schema-fail-fast.md) e a regra [no-runtime-schema-checks](../../../../laravel/.cursor/rules/no-runtime-schema-checks.mdc), que proíbem introspecção estrutural em requests de negócio;
- [Segurança do banco legado](../../../../laravel/docs/operations/legacy-database-safety.md), que proíbe `migrate:fresh`, `db:wipe`, `migrate:refresh` e `migrate:reset` em banco compartilhado.

Antes de escrever SQL Laravel, o código deve conferir este JSON e o checkout atual. O schema gate deve validar checksum e objetos no teste/CI; o caminho de negócio não deve consultar `information_schema`, `pg_catalog` ou `Schema::has*`.

## Limites e divergências

- O snapshot descreve estrutura, triggers e definições no momento da coleta; não prova locks, distribuição, duração de consultas ou atomicidade de `Perpetrar`.
- `reltuples` é estimativa. Planos devem ser medidos no ambiente alvo, com consultas parametrizadas e sem mutação.
- A documentação Laravel ainda menciona PostgreSQL 9.6 em alguns pontos de encoding/legado; o ambiente efetivamente consultado e os snapshots recentes confirmam PostgreSQL 9.5.25. SQL incompatível com 9.5 deve ser bloqueado ou precedido de nova coleta no ambiente de implantação.
- O inventário Delphi exclui dados fiscais, notas, séries, vencimentos, contratos fiscais, XML/NF-e, duplicatas e crédito entre filiais; esses objetos não são contrato desta coleta.

