# Wayfinder — Consulta de Entrega de Produtos no Laravel

Label: wayfinder:map

## Destination

Produzir em `modules/entregas/consulta-entrega-produtos/` um pacote autoritativo e rastreável de prompts `/speckit.specify` para migrar `dmConsultaEntregaProdutos`/`fmConsultaEntregaProdutos` do Delphi para o Laravel, cobrindo filtros, SQL, edição em grid, relatório, acesso/menu, parâmetros, F6/F9, atalhos, cancelamento real da consulta e schema versionado, sem implementar o módulo nesta etapa.

## Notes

- Contexto: Plataforma Laravel em convivência com o legado Delphi; consultar `CONTEXT-MAP.md`, `laravel/CONTEXT.md` e ADRs relevantes antes de fechar termos.
- Fonte acessível normalizada: `C:\projetos.vcl\apps\entrega\dmConsultaEntregaProdutos.pas/.dfm`, `fmConsultaEntregaProdutos.pas/.dfm` e `C:\projetos.vcl\biblio\clparametrossistema.pas`; os prompts finais não devem pedir nova inspeção direta dessas fontes.
- Consultar os artefatos já gerados em `modules/entregas/relatorio-entregas/`, `modules/entregas/cadastro-romaneios/` e demais módulos Laravel relacionados, sem duplicar decisões.
- Requisitos permanentes: menu **Entregas e Montagens → Entregas → Relatório de Entregas**; grid com catálogo, ordenação, personalização e exportação; F6 gera a saída no mesmo layout do grid; Cancelar aparece no início e cancela a consulta PostgreSQL; F9 usa o modal padrão de pesquisa; breadcrumb e command bar seguem o padrão Laravel.
- Consultas devem ser set-based, com `IN`/`ANY(array)` quando aplicável, sem N+1, sem SQL concatenado, e com `INNER JOIN` sempre que o vínculo obrigatório e a nulabilidade confirmarem isso; `LEFT JOIN` só quando a ausência tiver significado funcional comprovado.
- A edição deve detalhar campos alteráveis, validações, persistência e atualização em lote; não transformar um grid de consulta em cadastro sem evidência.
- A máscara de chave NF-e deve reutilizar a autoridade compartilhada `NfeAccessKey*` se a tela ou evolução exigir essa referência; não criar regex/DV local.
- Nunca recomendar teste de driver, `hasTable`/`Schema::has*` em runtime, nem pedir ao implementador que reabra as fontes Delphi diretamente.
- Classificar achados como `CONFIRMADO`, `INFERIDO`, `DÚVIDA`, `NÃO LOCALIZADO`, `DIVERGENTE`, `POSSÍVEL BUG LEGADO` ou `OPORTUNIDADE`.

## Decisions so far

- [Produzir e validar prompts SpecKit da Consulta de Entrega de Produtos](issues/08-produzir-e-validar-prompts-speckit.md) — pacote final criado em modules/entregas/consulta-entrega-produtos com README, cinco prompts, notas de pesquisa e schema/manifesto; validacao estrutural concluida.

- [Definir fatiamento e contrato dos prompts SpecKit da Consulta de Entrega de Produtos](issues/07-definir-fatiamento-e-contrato-dos-prompts-speckit.md) — cinco prompts sequenciais: fundacao/acesso/filtros; consulta F6/grid/schema/cancelamento; edicao F5/conflitos; relatorio/fotografia/exportacao; aceite/desempenho/observabilidade.

- [Capturar snapshot PostgreSQL da Consulta de Entrega de Produtos](issues/06-capturar-snapshot-postgresql-consulta-entrega-produtos.md) — snapshot tecsoft/public de 2026-08-23 com 15 relacoes, contratos_atual(character), zero lacunas, JSON/manifesto e SHA-256 491BEC3B920E1BF257CCB28A42DBF9BB81161F0135901A5914D19313C505B8F2.

- [Definir contrato canonico da Consulta e Agendamento de Entregas no Laravel](issues/05-definir-contrato-canonico-consulta-agendamento.md) — consulta operacional com edicao limitada de data/hora/periodo; F5 atomico; F6 canonico e cancelavel; grid/relatorio/exportacao compartilhados; acesso fail-closed; schema proprio.

<!-- Uma linha por ticket resolvido: título completo, link e síntese. -->

## Not yet specified

- [Mapear padroes Laravel para grid, relatorio, cancelamento e schema da Consulta de Entrega de Produtos](issues/04-mapear-padroes-laravel-grid-relatorio-cancelamento-e-schema.md) — reutilizar catalogo/preferencias/exportacao, read model em lote, runner F6 cancelavel, modal F9 e commands com revisao; falta snapshot PostgreSQL proprio.

- [Identificar parametros, autorizacoes, menu e padroes fiscais da Consulta de Entrega de Produtos](issues/03-identificar-parametros-autorizacoes-menu-e-padroes-fiscais.md) — nao ha parametro especifico nem grant concreto localizado; folha e rota Laravel devem ser decididas separadamente, com acesso fail-closed e filial validada no servidor; F9/NfeAccessKey sao padroes disponiveis, nao evidencias Delphi.

- [Inventariar SQL, projecao, cardinalidade e atualizacao da Consulta de Entrega de Produtos](issues/02-inventariar-sql-projecao-e-atualizacao-set-based.md) — duas branches UNION ALL; macros legadas devem virar binds/arrays; saldos pre-agregados; origem e chave real da linha obrigatorias; atualizacao set-based com concorrencia.

- [Inventariar interface, filtros, grid e operacoes da Consulta de Entrega de Produtos](issues/01-inventariar-interface-filtros-grid-e-operacoes.md) — contrato legado consolidado: agenda com filtros de datas/filiais/periodos/fornecedor/romaneio; F5/F6/F10; edicao intencional de data, hora e periodo; atualizacoes em produtosdadosfiscais ou produtoscontratos; F9/Ctrl+F9 nao comprovados.

- Se o destino deve ser uma consulta somente leitura com edição operacional limitada ou um fluxo de atualização explícito dentro do grid.
- A separação final dos prompts SpecKit e os gates de schema, desempenho, cancelamento e paridade de saída.
- A fotografia/read model compartilhada entre grid, relatório, preview, impressão e exportação.

## Out of scope

- Implementar o módulo Laravel ou executar `/speckit.specify` durante este mapa.
- Alterar fontes Delphi.
- Reproduzir pixel a pixel qualquer relatório legado; preservar conteúdo, regras, agrupamentos e equivalência de saída.
- Inventar permissões operacionais, parâmetros específicos ou campos de NF-e sem evidência/decisão explícita.
