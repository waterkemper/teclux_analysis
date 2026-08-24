# Mapear padrões Laravel para Relatório, grid, consulta cancelável e schema

Type: research
Status: resolved
Blocked by:

## Answer

Pesquisa concluida e registrada em [pesquisa-padroes-laravel-schema.md](../../../modules/entregas/relatorio-entregas/pesquisa-padroes-laravel-schema.md).

O levantamento mapeia os seams Laravel de acesso/menu, Filial e parametros, breadcrumb/AppLayout, ErpConsultaOperationBar, F9 com useRegistryCadastroShortcuts e ErpTwoColumnCatalogLookupModal, ErpPreferenceDataGrid/catalogo/ordenacao/exportacao, relatorio institucional e fotografia persistente, PgsqlGerarQueryRunner/pg_cancel_backend, NfeAccessKey* e schema versionado em modules/*/schema.

Tambem registra as lacunas de fotografia do Relatorio de Entregas e da escolha sincrona versus heavy report, com os guardrails obrigatorios: SQL set-based com IN/ANY(array) quando aplicavel, nenhum N+1, INNER JOIN para vinculo obrigatorio/NOT NULL, Cancelar antes do primeiro await, cancelamento server-side real e proibicao de teste de driver, hasTable/Schema::has* e AbortController como unico cancelamento. Migrations/testes existentes com introspeccao ou selecao por driver foram classificados como divergentes e nao devem ser copiados.

## Question

Consultar o checkout Laravel e os módulos já gerados para localizar seams concretos e reutilizáveis para: acesso/menu/capability, parâmetros por Filial, breadcrumb, command bar e atalhos, modal F9, `ErpPreferenceDataGrid`/catálogo/preferências/ordenação/exportação, relatório e fotografia, F6 com botão Cancelar desde o primeiro await, cancelamento PostgreSQL real, máscara `NfeAccessKey*`, testes PostgreSQL e armazenamento/versionamento do schema das tabelas. Registrar arquivos concretos, limites e lacunas; nunca recomendar teste de driver, `hasTable`/`Schema::has*` em request de negócio ou apenas `AbortController` como cancelamento.
