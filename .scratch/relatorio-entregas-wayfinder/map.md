# Wayfinder — Relatório de Entregas no Laravel

Label: wayfinder:map

## Destination

Produzir em `modules/entregas/relatorio-entregas/` um conjunto autoritativo, rastreável e fatiado de prompts `/speckit.specify` para migrar **Entregas e Montagens → Entregas → Relatório de Entregas** do Delphi para o Laravel, cobrindo filtros, SQL, grid, relatório, acesso/menu, parâmetros, atalhos, cancelamento real da consulta e os contratos de schema necessários, sem implementar o módulo nesta etapa.

## Notes

- Contexto de domínio: Plataforma Laravel e convivência com o legado Delphi; usar o vocabulário de `CONTEXT.md` e consultar `CONTEXT-MAP.md` antes de propor novos termos.
- Skills a consultar ao resolver tickets: `/research`, `/grilling` e `/domain-modeling`; usar `/prototype` somente se uma decisão de UX não puder ser fechada por evidência.
- Fontes Delphi primárias disponíveis no workspace: `delphi/apps/entrega/dmrelatorioentrega.pas/.dfm`, `delphi/apps/entrega/fmrelatorioentrega.pas/.dfm` e `delphi/biblio/clparametrossistema.pas`.
- Artefatos já gerados que devem ser consultados e referenciados, sem duplicar decisões: `modules/entregas/cadastro-romaneios/`, `modules/interlojas/consulta-transferencias/`, `modules/interlojas/transferencia-requisicao-exposicao/` e os relatórios existentes em `modules/`.
- Os prompts finais devem mandar o SpecKit inspecionar somente o checkout Laravel atual para confirmar seams e lacunas. Não pedir que a implementação verifique fontes Delphi diretamente: as evidências Delphi deverão ser consolidadas em arquivos de pesquisa desta pasta e tratadas como contrato legado.
- Requisitos permanentes do pedido: F6 gera o Relatório e mostra o mesmo resultado em grid; Cancelar aparece no início da geração e cancela a consulta no PostgreSQL; F9 usa o modal padrão de pesquisa; grids usam catálogo, ordenação, personalização e exportação do Laravel; consultas são set-based, com `IN`/`ANY(array)` quando aplicável e sem N+1; `LEFT JOIN` só permanece quando a nulabilidade justificar; nunca testar driver nem `hasTable`/`Schema::has*` em runtime; breadcrumb e command bar seguem o padrão do sistema.
- A máscara de Chave de Acesso NF-e, quando houver referência fiscal, deve reutilizar a autoridade compartilhada `NfeAccessKey*`; não criar regex, DV ou máscara local. Isso deve ser registrado como padrão transversal para o restante do sistema.
- O menu/capability alvo deve ser validado como folha sob o caminho **Entregas e Montagens → Entregas → Relatório de Entregas**, sem copiar grants legados nem confiar em estado de acesso enviado pelo browser.
- Classificar cada achado como `CONFIRMADO`, `INFERIDO`, `DÚVIDA`, `NÃO LOCALIZADO`, `DIVERGENTE`, `POSSÍVEL BUG LEGADO` ou `OPORTUNIDADE`.

## Decisions so far

- [Inventariar SQL, projecoes e semantica do Relatorio de Entregas Delphi](issues/02-inventariar-sql-projecoes-e-semantica-delphi.md) — SQL/projecao/macro, quantidade, ordenacao, FastReport e riscos de cardinalidade consolidados em [pesquisa-sql-delphi.md](../../modules/entregas/relatorio-entregas/pesquisa-sql-delphi.md); traducao Laravel exige binds, `IN`/`ANY(array)`, pre-agregacao e joins guiados por schema.

- [Identificar parametros, autorizacoes e acesso do Relatorio de Entregas legado](issues/03-identificar-parametros-autorizacoes-e-acesso-legado.md) - nao foram confirmados parametros especificos nem grants/menu do relatorio; a nota consolida fallbacks de `clparametrossistema.pas`, o mecanismo generico de acesso e o contrato Laravel fail-closed sem copiar grants.

<!-- Uma linha por ticket resolvido: título completo, link e síntese. -->

- [Inventariar interface, filtros e atalhos do Relatório de Entregas Delphi](issues/01-inventariar-interface-filtros-e-atalhos-delphi.md) — evidência consolidada da tela, filtros, SQL, dataset, operações e atalhos; F6/cancelamento real, menu/acessos, parâmetros específicos, schema e grid de saída ficaram explicitamente não localizados ou são requisitos do destino.

- [Mapear padroes Laravel para Relatorio, grid, consulta cancelavel e schema](issues/04-mapear-padroes-laravel-relatorio-grid-e-infraestrutura.md) - seams reutilizaveis e guardrails consolidados em [pesquisa-padroes-laravel-schema.md](../../modules/entregas/relatorio-entregas/pesquisa-padroes-laravel-schema.md), incluindo grid/exportacao, fotografia, cancelamento PostgreSQL, NfeAccessKey* e schema versionado.



- [Definir contrato de dados, UX e regras de consulta do Relatório de Entregas](issues/05-definir-contrato-do-relatorio-e-regras-de-consulta.md) — contrato fechado: F6 síncrono cancelável com fallback heavy mensurado, Fotografia canônica compartilhada, filtros tipados, SQL set-based sem N+1, joins guiados por schema, grid padronizado, F9/modal, acesso por Filial, schema versionado e proibições de driver/hasTable.

- [Definir fatiamento e contrato dos prompts SpecKit do Relatório de Entregas](issues/06-definir-fatiamento-e-contrato-dos-prompts-speckit.md) — quatro prompts sequenciais: fundação/acesso/filtros; consulta F6/grid/schema/cancelamento; fotografia/relatório/exportação; aceite/desempenho/observabilidade, com README, schema versionado e regras comuns sem reabrir Delphi.

- [Produzir e validar os prompts SpecKit do Relatório de Entregas](issues/07-produzir-e-validar-prompts-speckit.md) — quatro prompts, README e contrato/manifesto de schema produzidos; a validação passou no escopo trabalhado, e a captura PostgreSQL autoritativa foi aberta como ticket separado porque ProdutosContratos/diadasemana ainda não estão comprovados.

- [Capturar e validar snapshot PostgreSQL do Relatório de Entregas](issues/08-capturar-snapshot-postgresql-relatorio-entregas.md) — snapshot autoritativo do banco `andra` capturado em READ ONLY, com 11 relações, `produtoscontratos`/PK composta confirmados, `diadasemana(date)` confirmada, hashes registrados e zero objetos requeridos ausentes.

## Not yet specified

<!-- Nenhuma decisão restante bloqueia a entrega dos prompts. -->

## Out of scope

- Fixar neste mapa os limites operacionais exatos de tempo/cardinalidade para escolher o modo síncrono ou heavy e a retenção concreta da Fotografia; esses valores dependem de `EXPLAIN`, carga e convenções do Laravel durante a implementação.
- Implementar o módulo Laravel ou executar `/speckit.specify` durante este mapa.
- Alterar fontes Delphi ou pedir ao agente de implementação que reabra a investigação Delphi.
- Reproduzir o FastReport pixel a pixel; preservar conteúdo, regras, agrupamentos e equivalência entre grid, visualização e saída do Relatório.
- Criar permissões operacionais não comprovadas pela tela; qualquer nova capacidade deve ser uma decisão explícita.
