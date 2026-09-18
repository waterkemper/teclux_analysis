# Consolidar dossiê e prompts SpecKit do Cadastro de Inventário

Type: task
Status: resolved
Blocked by: 06

## Question

Consolidar as pesquisas e a decisão de domínio em `modules/estoque/cadastro-inventario/README.md`, dossiê final e o menor conjunto de prompts `/speckit.specify`, com rastreabilidade para evidências, schema, padrões Laravel, dependências, critérios de aceite e guardrails obrigatórios.

Os prompts devem orientar a consulta dos artefatos gerados e do Laravel atual, cobrir grids/relatórios/operações/autorização/parâmetros/schema e manter fora do escopo qualquer implementação nesta etapa. Não executar `/speckit.specify`.

## Answer

Consolidação concluída sem implementação e sem executar `/speckit.specify`.

Artefatos gerados:

- `modules/estoque/cadastro-inventario/README.md`: índice do dossiê, contrato funcional confirmado, matriz de situações/operações, guardrails Laravel, limitações de schema, menu/acessos e instruções de handoff.
- `modules/estoque/cadastro-inventario/01-speckit-prompt-cadastro-inventario.md`: prompt único e autocontido para `/speckit.specify`, cobrindo identidade, A/P/T, itens/lotes, F6/F8/F9, relatório, grid, exportação, parâmetros, autorização, auditoria, concorrência, schema, SQL set-based, cancelamento e testes.

O prompt proíbe reabrir fontes Delphi, exige consulta ao Laravel vigente somente para localizar seams concretos e preserva o gate do schema parcial.

Validação realizada: arquivos em UTF-8, links relativos revisados, nenhum código de aplicação alterado e nenhuma implementação executada.
