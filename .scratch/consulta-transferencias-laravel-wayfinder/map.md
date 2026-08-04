# Wayfinder — Consulta de Transferências no Laravel

Label: wayfinder:map

## Destination

Produzir em `modules/interlojas/consulta-transferencias/` um conjunto autoritativo e fatiado de prompts `/speckit.specify`, pronto para orientar a implementação via Cursor de **Interlojas → Consulta de Transferências** no Laravel, cobrindo fundação/acesso/menu, filtros e SQL, grid padronizada e todas as operações e atalhos descobertos no Delphi, sem implementar o módulo nesta etapa.

## Notes

- Contexto de domínio: Plataforma Laravel e convivência com o legado Delphi.
- Consultar `/research`, `/grilling` e `/domain-modeling` ao resolver tickets.
- Fontes Delphi primárias: `C:\projetos.vcl\apps\interlojas\dmconsultatransferencias.pas/.dfm` e `fmconsultatransferencias.pas/.dfm`.
- Fonte primária de parâmetros: `C:\projetos.vcl\biblio\clparametrossistema.pas` e usos concretos localizados no legado.
- Os prompts devem mandar o SpecKit inspecionar o checkout Laravel atual, adotar os padrões existentes de acesso/menu, parâmetros, Inertia/React e grid, e não reabrir evidências Delphi já consolidadas.
- A grafia canônica do destino é **Consulta de Transferências**; nomes físicos legados permanecem como evidência técnica.

## Decisions so far

<!-- Uma linha por ticket resolvido. -->

- [Inventariar interface, filtros e atalhos da Consulta de Transferências Delphi](issues/01-inventariar-interface-filtros-e-atalhos-delphi.md) — interface, defaults, filtros, F6, grid e ambiguidades foram registrados com evidência por linha.
- [Inventariar SQL, projeções e semântica da Consulta de Transferências Delphi](issues/02-inventariar-sql-projecoes-e-semantica-delphi.md) — consulta, projeções, macros, filtros e riscos de tradução foram inventariados.
- [Identificar parâmetros, autorizações e acesso do módulo legado](issues/03-identificar-parametros-autorizacoes-e-acesso-legado.md) — literais, fallback por filial, escopos e mecanismo de acesso geral foram esclarecidos.
- [Mapear padrões Laravel para acesso, menu, parâmetros, grid e operações](issues/04-mapear-padroes-laravel-para-consulta-transferencias.md) — seams concretos de capability, menu, parâmetros, Inertia, grid, exportação e atalhos foram identificados.
- [Decidir o fatiamento e o contrato dos prompts SpecKit](issues/05-decidir-fatiamento-e-contrato-dos-prompts-speckit.md) — dois prompts foram definidos, com contratos fechados de segurança, filtros, paginação de 200, exportação integral e UX somente leitura.
- [Produzir e validar os prompts SpecKit da Consulta de Transferências](issues/06-produzir-e-validar-prompts-speckit.md) — os dois prompts autoritativos foram criados e tiveram filtros, parâmetros, 32 colunas, acesso, grid, paginação, exportação, operações e testes rastreados e validados.

## Not yet specified

- Nenhuma; o destino do mapa foi alcançado.

## Out of scope

- Implementar o módulo Laravel ou alterar o Delphi durante este mapa.
- Executar os prompts `/speckit.specify` no Cursor.
- Migrar telas de transferência distintas da Consulta de Transferências, salvo dependências compartilhadas necessárias para especificá-la.
