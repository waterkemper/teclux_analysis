# Auditar padrões Laravel e prompts já gerados

Type: research
Status: resolved
Blocked by:

## Question

Consultar o checkout Laravel e os artefatos já gerados, especialmente `modules/interlojas/confirmacao-por-notas`, `modules/financeiro/contas-pagar`, `modules/caixa/fechamentos` e módulos com relatórios, para localizar seams concretos reutilizáveis: shell/breadcrumb, command bar, modal F9, catálogo de colunas, preferências/ordenação/exportação de grids, grid editável, F6 com Cancelar antes do primeiro await e cancelamento PostgreSQL real, F6 de relatório com o mesmo leiaute do grid, máscara de chave NF-e, parâmetros, autorização e `acessosmodulos`.

Registrar arquivos concretos, contratos, limites e divergências do Laravel atual. Consultar prompts já gerados antes de propor novos nomes ou duplicar componentes. Incluir os guardrails contra N+1, SQL textual, teste de driver, `hasTable`/`Schema::has*` e consulta direta aos fontes Delphi em prompts finais.

## Answer

Auditoria concluída em [pesquisa-padroes-laravel-prompts.md](../../modules/caixa/controle-recebimentos/pesquisa-padroes-laravel-prompts.md).

- Confirmado reuso de `GridColumnCatalog`, `ErpPreferenceDataGrid`, `ErpGridShell`, catálogos próprios, preferências, ordenação e exportação via `GridExportOrchestrator`.
- Confirmado protocolo de F6 cancelável com `useErpGerarRequest`, `PgsqlGerarQueryRunner`, registro de trace/PID e `pg_cancel_backend`, com Cancelar antes do primeiro `await`.
- Confirmado padrão F9 com `CatalogCodeLookup`, `ErpTwoColumnCatalogLookupModal` e `useRegistryCadastroShortcuts`.
- Confirmada a autoridade compartilhada `NfeAccessKey*`; a aplicação fica condicional porque a chave NF-e não foi localizada no Delphi.
- Confirmados padrões de menu/grants por rota, `usuariosacessosmodulos`, autorização sensível por prova contextual, `ParameterService::getMany` e relatórios baseados em contrato/fotografia comum ao grid.
- Registradas divergências históricas de `Schema::has*`/teste de driver, que não devem ser reproduzidas neste esforço.

Nenhum componente, rota, migration ou código de produção foi implementado.