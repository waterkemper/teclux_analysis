# Auditar padrões Laravel e prompts existentes para Inventário

Type: research
Status: resolved
Blocked by:

## Question

Consultar o Laravel atual e prompts já gerados em `modules/estoque/`, especialmente cadastros, grids, consultas de estoque, relatórios e telas com F6/F9, para localizar seams reutilizáveis: shell/breadcrumb, command bar, primary key e Situação, radio buttons, modal padrão F9, catálogo de colunas, preferências/ordenação/exportação, grid editável, F6 com Cancelar antes do primeiro `await` e cancelamento PostgreSQL real, relatório com o mesmo leiaute do grid, parâmetros e `acessosmodulos`.

Registrar arquivos, contratos, limites e divergências concretas. Incluir nos futuros prompts os guardrails contra N+1, SQL textual, teste de driver, `hasTable`/`Schema::has*` e reabertura direta dos fontes Delphi. Produzir `modules/estoque/cadastro-inventario/pesquisa-padroes-laravel-prompts.md`.
## Answer

Pesquisa concluída em modules/estoque/cadastro-inventario/pesquisa-padroes-laravel-prompts.md.

O Laravel já possui padrões reutilizáveis para shell/breadcrumb, F6, cancelamento server-side, heavy reports, grids com catálogo/preferências/exportação, modal F9, chave primária, radio buttons e relatórios no mesmo grid. O prompt final deve ser autocontido, não pedir reabertura do Delphi, exigir queries set-based e transportar os guardrails contra N+1, SQL concatenado, driver e hasTable/Schema::has*.
