# Produzir e validar prompts SpecKit da Consulta de Entrega de Produtos

Type: task
Status: resolved
Blocked by: 07

## Answer

Pacote SpecKit produzido e validado em modules/entregas/consulta-entrega-produtos/.

- README.md com ordem, autoridades, dependencias e gates comuns.
- Cinco prompts sequenciais: fundacao/acesso/filtros; consulta F6/grid/schema/cancelamento; edicao/agendamento/F5/conflitos; relatorio/fotografia/exportacao; aceite/desempenho/observabilidade.
- Snapshot PostgreSQL e manifesto referenciados como contrato estrutural.
- As regras de grid, exportacao, ordenacao, personalizacao, F9/modal, breadcrumb, command bar, F5 atomico, F6 com cancelamento PostgreSQL, ausencia de N+1, IN/ANY(array), joins guiados por schema e mascaras NfeAccessKey foram cobertas.
- Os prompts instruem consultar somente o checkout Laravel para seams e nao pedir reabertura direta das fontes Delphi.
- Validacao confirmou cinco prompts, README, manifesto existente, referencias ao /speckit.specify e git diff --check sem erros no escopo.

Nenhum codigo Laravel ou fonte Delphi foi implementado ou alterado.

## Question

Produzir os prompts SpecKit, README, notas de pesquisa referenciadas e artefatos de schema na pasta modules/entregas/consulta-entrega-produtos/. Validar rastreabilidade, cobertura do contrato, ausencia de N+1/SQL textual/teste de driver/hasTable, paridade grid-relatorio-exportacao, F6 cancelavel, F9, autorizacao, parametros, edicao atomica, breadcrumb e proibicao de reabrir fontes Delphi.
