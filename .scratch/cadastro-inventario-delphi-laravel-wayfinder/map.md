# Cadastro de Inventário — Delphi para Laravel

Label: wayfinder:map

## Destination

Produzir um dossiê de evidências e os prompts `/speckit.specify` necessários em `modules/estoque/cadastro-inventario/` para especificar a migração funcional do **Cadastro de Inventário** do Delphi para o Laravel, sem implementar o módulo neste esforço.

Os prompts devem ser autocontidos, consultar o Laravel atual e os prompts já gerados, preservar a paridade funcional confirmada e transformar riscos legados em contratos seguros de Laravel. O handoff também deve especificar uma Sessão de Coleta Mobile para celular e tablet, vinculada ao Inventário.

## Notes

- Fontes Delphi autorizadas para a pesquisa: `delphi/apps/estoque/dmcadastroinventario.pas`, `.dfm`, `fmcadastroinventario.pas` e `.dfm`; consultar `delphi/biblio/clparametrossistema.pas` quando houver parâmetros ou defaults relacionados.
- Consultar as units ancestrais/referenciadas necessárias para explicar filtros, datasets, operações, autorização, relatórios e efeitos, sem pedir ao agente futuro para reabrir diretamente os fontes Delphi.
- Classificar evidências como `CONFIRMADO`, `INFERIDO`, `DÚVIDA`, `NÃO LOCALIZADO`, `DIVERGENTE` ou `POSSÍVEL BUG LEGADO`, sempre com arquivo, linha, controle, campo, SQL ou outro vestígio.
- Os prompts devem cobrir filtros, SQLs, parâmetros via `parametros_valor('', '')` quando aplicável, autorizações, menu e `acessosmodulos`, cadastro/identidade/situação, grids, ordenação, personalização, exportação, edição de colunas, operações, ícones, atalhos, F6 cancelável, F9 pelo modal padrão, relatórios com F6 e leiaute equivalente ao grid, schema versionado, breadcrumb e radio buttons.
- Regras obrigatórias: evitar N+1 com consultas set-based e `IN`/`= ANY(array)`/`unnest` quando aplicável; usar `INNER JOIN` quando as colunas/relações obrigatórias forem `NOT NULL`; deixar `LEFT JOIN` apenas para relações opcionais comprovadas; não testar driver; não testar `hasTable`/`Schema::has*`; não reproduzir concatenação SQL; não pedir verificação direta dos fontes Delphi nos prompts finais.
- Consultar os padrões existentes em `modules/estoque/`, `laravel/backend` e `laravel/specs/`, reaproveitando contratos de grid, modal F9, cancelamento de consulta, relatório, autorização e cadastro em vez de inventar variações.
- Wayfinder permanece planejamento: gerar pesquisa, dossiê e prompts de handoff; não implementar código, migration, endpoint ou componente React.

## Decisions so far

<!-- Preenchido somente quando tickets forem resolvidos. -->

- [Inventariar interface e fluxo Delphi do Cadastro de Inventario](issues/01-inventariar-interface-e-fluxo-delphi.md) — pesquisa concluida; usar modules/estoque/cadastro-inventario/pesquisa-interface-fluxo-delphi.md como dossie de evidencias para os proximos prompts de especificacao.

- [Extrair SQLs, parâmetros e dados do Cadastro de Inventário](issues/02-extrair-sqls-parametros-e-dados-delphi.md) — catalogou datasets, SQLs, macros, parâmetros, riscos de N+1/`MAX()+1`/`setval`, objetos candidatos ao schema e guardrails de tradução para Laravel.

- [Inventariar autorizações, senha e menu do Cadastro de Inventário](issues/03-inventariar-autorizacoes-e-menu.md) — autorização de processamento, padrões de menu/grants e lacunas registrados em modules/estoque/cadastro-inventario/pesquisa-autorizacoes-menu.md.
- [Auditar padrões Laravel e prompts existentes para Inventário](issues/04-auditar-padroes-laravel-e-prompts-existentes.md) — padrões de F6/cancelamento, F9, grids, relatórios, cadastro e guardrails registrados em modules/estoque/cadastro-inventario/pesquisa-padroes-laravel-prompts.md.
- [Capturar snapshot autoritativo do schema do Cadastro de Inventário](issues/05-capturar-schema-autoritativo.md) — snapshot, manifesto, hash e gate de divergência/ausência registrados em modules/estoque/cadastro-inventario/schema/.
- [Definir domínio e contrato Laravel do Cadastro de Inventário](issues/06-definir-dominio-e-contrato-laravel.md) — contrato confirmado: agregado com itens/lotes, situações A/P/T, F8 transacional, F6 para relatórios canceláveis, grid padrão Laravel, autorização contextual de gerente, proteção contra concorrência, fronteira com estoque e bloqueio para schema parcial.
- [Consolidar dossiê e prompts SpecKit do Cadastro de Inventário](issues/07-consolidar-dossie-e-prompts-speckit.md) — README e prompt único autocontido gerados em `modules/estoque/cadastro-inventario/`, com rastreabilidade, guardrails, gate de schema e sem execução ou implementação.
- [Definir contrato da Sessão de Coleta Mobile do Inventário](issues/08-definir-contrato-da-coleta-mobile.md) — coleta por câmera e TXT unificada, offline-tolerante, parametrizada, responsiva, auditável, multi-dispositivo, com correção manual e junção administrativa separada.

## Not yet specified

<!-- Nenhuma decisão pendente; o destino está pronto para handoff. -->

## Out of scope

- Implementar o módulo, migrations, componentes React, endpoints, policies, SQL de produção ou alterações no Delphi.
- Executar `/speckit.specify` neste esforço; produzir apenas prompts e dossiês para posterior execução.
- Reproduzir N+1, concatenação SQL, teste condicional de driver, `hasTable`/`Schema::has*` ou introspecção de schema em runtime.
- Pedir que o agente futuro reabra os arquivos Delphi; as evidências devem ser capturadas nos artefatos de pesquisa dentro de `modules/estoque/cadastro-inventario/`.
