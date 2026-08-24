# Produzir e validar os prompts SpecKit do Relatório de Entregas

Type: task
Status: resolved
Blocked by: 06

## Question

Consolidar os inventários e decisões em arquivos de pesquisa, artefato de schema e prompts `/speckit.specify` autocontidos na pasta `modules/entregas/relatorio-entregas/`. Validar rastreabilidade para as fontes consolidadas, consulta dos prompts já gerados, cobertura integral dos requisitos do mapa, ausência de pedidos para verificar Delphi diretamente, proibições de N+1/driver/hasTable e consistência entre F6, grid, exportação, relatório, cancelamento real, acesso/menu, parâmetros, F9, máscara NF-e e breadcrumb.

## Answer

Produzidos e validados os prompts SpecKit autocontidos em `modules/entregas/relatorio-entregas/`:

- `README.md` com ordem de execução, fontes consolidadas e regras comuns.
- Quatro prompts sequenciais: fundação/acesso/filtros; consulta F6/grid/schema/cancelamento; fotografia/relatório/exportação; aceite/desempenho/observabilidade.
- `schema/README.md` e manifesto preliminar para impedir SQL contra tabelas ou colunas não comprovadas.
- Quatro notas de pesquisa com a evidência Delphi e os padrões Laravel já consultados.

A validação confirmou quatro prompts, rastreabilidade para as notas de pesquisa, cobertura dos requisitos do mapa e as proibições de inspeção Delphi direta, N+1, testes de driver e `hasTable`. Também foi executado `git diff --check` no escopo trabalhado, sem erros.

A captura PostgreSQL autoritativa permanece uma dependência explícita: o snapshot vizinho não comprova `ProdutosContratos` nem a função `diadasemana`. Por isso foi aberto o ticket 08 para capturar o schema somente leitura e atualizar o manifesto antes de considerar o SQL final fechado. Nenhum código Laravel ou Delphi foi alterado nesta etapa.
