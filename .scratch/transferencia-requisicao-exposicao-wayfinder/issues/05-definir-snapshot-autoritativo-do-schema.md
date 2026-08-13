# Definir coleta e armazenamento do snapshot autoritativo do schema

Type: research
Status: resolved
Blocked by: 02

## Answer

O metodo autoritativo foi definido a partir dos precedentes em modules/entregas/cadastro-romaneios/schema/README.md e modules/interlojas/confirmacao-por-romaneios/schema/README.md:

- executar a coleta dentro do container PHP que possui o .env efetivo, em conexao PostgreSQL somente leitura;
- iniciar BEGIN, executar SET TRANSACTION READ ONLY, consultar pg_catalog/pg_get_functiondef para relacoes, colunas, nulabilidade, PK/FK, indices, triggers, sequences e funcoes, e finalizar com ROLLBACK;
- armazenar um JSON bruto datado em modules/interlojas/transferencia-requisicao-exposicao/schema/postgresql-authoritative-YYYY-MM-DD.json, com origem, banco, schema, versao do PostgreSQL, modo de coleta, objetos alcancados e checksum;
- armazenar funcoes destacadas em arquivo SQL datado quando necessario e nunca sobrescrever snapshots anteriores;
- usar o snapshot como gate de especificacao/CI, nunca Schema::hasTable, information_schema ou pg_catalog no caminho de negocio.

A lista candidata inicial veio do inventario SQL: pedidosfiliais, estoques, movimentos, lotestransferencia, produtosconferencia, pedidosfiliais_log, filiais, produtos, caracteristicas, grades, promocoes e produtoscodigobarras, alem das funcoes/triggers de numeracao e saldos. A lista final deve ser fechada pela coleta.

Correcao posterior: a pesquisa AFK coletou com sucesso o snapshot em 2026-08-06 na conexao pgsql efetivamente usada pelo container teclux_cloud-php-1, aplicando SET TRANSACTION READ ONLY e ROLLBACK. O artefato e modules/interlojas/transferencia-requisicao-exposicao/schema/postgresql-authoritative-2026-08-06.json, com SHA-256 02F944BFEB2D97F47D3F124803E28F99989AE55040E01E56B6BA9073455A86DB. Foram confirmados 12 relacoes, 530 colunas, 121 constraints, 82 indices, 53 triggers, 35 funcoes e duas sequences; nenhuma relacao ou funcao solicitada ficou ausente.

A conexao nao e separada como readonly no Laravel; a garantia desta coleta veio da transacao read-only. O snapshot agora e o gate estrutural para os prompts, e continua proibido consultar schema em runtime.

## Question

Qual é a forma somente leitura disponível no ambiente para coletar e versionar o schema PostgreSQL autoritativo de todas as tabelas, views, sequences, constraints, índices, triggers e funções alcançados pela Transferência de Requisição? Definir o formato e a pasta `modules/interlojas/transferencia-requisicao-exposicao/schema/`, metadados de origem/data/versão e como os prompts obrigarão o implementador a conferir esse snapshot antes do SQL. Respeitar o ADR que proíbe introspecção de schema em caminhos de negócio e registrar claramente qualquer objeto não confirmado.
