# Mapear padrões Laravel para grid, relatório, cancelamento e schema da Consulta de Entrega de Produtos

Type: research
Status: resolved
Blocked by:

## Answer

Pesquisa consolidada em modules/entregas/consulta-entrega-produtos/pesquisa-padroes-laravel-grid-relatorio-cancelamento-schema.md.

- O grid deve usar GridColumnCatalog, ErpPreferenceDataGrid, preferencias por usuario, schemaVersion, allowlist de colunas/ordenacao e exportacao server-side. Preferencias sao layout, nao persistencia de negocio.
- O read model deve seguir o padrao paginado/set-based de Consulta Transferencias, com enriquecimentos em lote e sem consulta dentro do mapeamento de cada linha. O relatorio deve compartilhar IDs/dados canonicos com o grid; fotografia, se adotada, precisa de envelope, criterios, data_as_of, hash, autorizacao e expiracao.
- F6 deve criar trace e busy antes do primeiro await, executar toda a consulta/enriquecimento no PgsqlGerarQueryRunner e cancelar primeiro no servidor por pg_cancel_backend; AbortController apenas encerra a espera local.
- F9, se necessario, deve adaptar useRegistryCadastroShortcuts e ErpTwoColumnCatalogLookupModal com endpoint, allowlist, filial e autorizacao proprios. Command bar e breadcrumb devem reutilizar componentes existentes.
- A edicao deve ser command explicito com change set, revisao esperada, idempotencia, transacao, auditoria e conflito 409; grid editavel ou preferencias nao substituem comando de dominio.
- O schema proprio do modulo ainda precisa ser capturado como snapshot PostgreSQL read-only, com JSON, SHA, manifest, banco, versao, relacoes, funcoes e regras de fail-fast. Nao usar hasTable, Schema::has*, information_schema, pg_catalog ou teste condicional de driver no caminho de negocio.

## Question

Consultar o checkout Laravel e os módulos já gerados para localizar seams reutilizáveis de grid com catálogo/preferências/ordenação/exportação, relatório e fotografia/read model, F6 com Cancelar desde o primeiro await, cancelamento PostgreSQL real, F9 com modal padrão, command bar/breadcrumb, persistência da edição e captura/versionamento do schema. Registrar arquivos concretos, limites e lacunas; proibir N+1, teste de driver, `hasTable`/`Schema::has*` e `AbortController` como único cancelamento.
