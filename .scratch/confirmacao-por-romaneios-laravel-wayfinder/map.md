# Wayfinder — Confirmação por Romaneios no Laravel

Label: wayfinder:map

## Destination

Produzir em `modules/interlojas/confirmacao-por-romaneios/` um conjunto autoritativo de prompts `/speckit.specify` para orientar a implementação Laravel da tela Delphi **Confirmação de Romaneios de Transferência**, com paridade das regras comprovadas, UX Laravel e integração segura com o Cadastro de Romaneios já especificado/implementado.

O destino inclui a extração documentada de filtros, SQLs, parâmetros, autorizações, operações, schema e riscos legados; não inclui implementar o módulo nesta jornada.

## Notes

- Fontes primárias Delphi: `C:\projetos.vcl\apps\interlojas\dmconfirmarromaneiostransferencia.pas/.dfm` e `fmconfirmarromaneiostransferencia.pas/.dfm`.
- Fonte de parâmetros: `C:\projetos.vcl\biblio\clparametrossistema.pas`; seguir chamadas efetivas de `parametros_valor('', '')` e o padrão Laravel de leitura em lote.
- Usar os termos canônicos de `laravel/CONTEXT.md`; distinguir esta tela de **Confirmação por Notas** e de **Cadastro de Romaneios**. O nome final da folha/menu fica sujeito à evidência Delphi e decisão de domínio.
- Consultar os mapas concluídos de `cadastro-romaneios-laravel-wayfinder` e `confirmacao-por-notas-laravel-wayfinder` para reutilizar decisões e seams, sem copiar seus escopos.
- Wayfinding produz documentação e prompts; não alterar PAS/DFM, não implementar Laravel, não executar migrations e não executar `/speckit.specify` nesta jornada.
- Classificar evidências como `CONFIRMADO`, `INFERIDO`, `DÚVIDA`, `NÃO LOCALIZADO`, `DIVERGENTE`, `POSSÍVEL BUG LEGADO`, `POSSÍVEL BUG ATUAL` ou `DECISÃO NOVA`, sempre com arquivo/linha, componente, campo, SQL ou evidência equivalente.
- Grids Laravel devem usar os seams atuais de exportação, ordenação, personalização, paginação/virtualização e acessibilidade. Botões devem seguir ícones, atalhos e command bar do Laravel, incorporando atalhos Delphi apenas quando comprovados e não conflitantes.
- F6 deve mostrar Cancelar imediatamente ao iniciar a consulta e cancelar o backend PostgreSQL de fato; não aceitar aborto apenas visual no navegador.
- Proibir N+1: carregar conjuntos com uma consulta set-based usando `IN`, `= ANY(array)`, `unnest`/`VALUES` quando aplicável, binds e semântica explícita para arrays vazios.
- Decidir `INNER JOIN` versus `LEFT JOIN` a partir da nulabilidade/cardinalidade do schema autoritativo; campo de junção obrigatório não deve ser tratado como relação opcional.
- Pesquisas F9 devem usar o modal padrão do sistema. Preferir radio buttons a selects quando o domínio for escolha mutuamente exclusiva. Breadcrumb deve seguir o padrão Laravel.
- A máscara da chave NF-e deve consumir a autoridade compartilhada do sistema, não criar componente privado deste módulo.
- Sempre que o escopo revelar uma tela de cadastro, aplicar o padrão de campo de chave primária e de situação usado no Cadastro de Requisições; confirmar primeiro se esta tela é consulta/operação ou cadastro.
- Testes não devem testar driver nem `hashtablefs`; devem testar contratos, repositórios, PostgreSQL autoritativo e comportamento observável do módulo.

## Decisions so far

- [Consolidar prompts SpecKit da Confirmação por Romaneios](issues/10-consolidar-prompts-speckit-confirmacao-romaneios.md) — entregou README e cinco prompts coordenados, com rastreabilidade completa das evidências e decisões para especificação.

- [Definir aceite, testes e observabilidade da Confirmação por Romaneios](issues/09-definir-aceite-testes-e-observabilidade.md) — fechou critérios de paridade, testes PostgreSQL reais, cancelamento, concorrência, idempotência, rollback e observabilidade sem dados sensíveis.

- [Definir interface Laravel, grids, modais e operações](issues/08-definir-interface-grids-modais-e-operacoes.md) — fechou consulta/operação, filtros, radio buttons, F9, grids sem paginação, atalhos Delphi, estados, acessibilidade, exportação e máscara NF-e compartilhada.

- [Definir F6, SQL set-based, desempenho e cancelamento](issues/07-definir-f6-sql-batching-e-cancelamento.md) — fechou F6 direta completa sem paginação/fila, SQL parametrizado set-based, joins pelo schema, exportação server-side e cancelamento real via `pg_cancel_backend()`.

- [Definir domínio, coexistência e comandos da Confirmação por Romaneios](issues/06-definir-dominio-coexistencia-e-comandos.md) — fechou paridade funcional Delphi, unidade atômica por Romaneio, concorrência, idempotência, autorização, rollback, fonte PostgreSQL compartilhada, elegibilidade e transição de situação.

- [Auditar padrões Laravel reutilizáveis para a Confirmação por Romaneios](issues/05-auditar-padroes-laravel-reutilizaveis.md) — confirmou os seams compartilhados de shell, F9, grids, NF-e, parâmetros, Filial, autorização e cancelamento PostgreSQL, além das lacunas que exigem contratos próprios.

- [Inventariar parâmetros, autorizações e menu da Confirmação por Romaneios](issues/04-inventariar-parametros-autorizacoes-e-menu.md) — confirmou os cinco parâmetros efetivos, escopo de Filial, autorização sensível e necessidade de folha Cloud/grants próprios sem código presumido.

- [Coletar snapshot autoritativo do schema da Confirmação por Romaneios](issues/03-coletar-snapshot-schema-confirmacao-romaneios.md) — confirmou a estrutura PostgreSQL usada pelo Laravel e adicionou o snapshot versionado para sustentar SQL, joins, cardinalidade e estratégia set-based.

<!-- Uma linha por ticket resolvido. Tickets abertos são encontrados em issues/. -->

- [Inventariar interface, filtros e operações da Confirmação por Romaneios Delphi](issues/01-inventariar-interface-filtros-e-operacoes-delphi.md) — confirmou filtros, grids, seleção, atalhos, conferência, Romaneio de Passagem e divergências de UX que o Laravel deve corrigir.
- [Inventariar SQL, domínio e efeitos da Confirmação por Romaneios Delphi](issues/02-inventariar-sql-dominio-e-efeitos-delphi.md) — mapeou F6, passagem, confirmação, efeitos fiscais/financeiros/estoque/pedidos e os riscos de N+1, concatenação e atomicidade.

## Not yet specified

- Nenhuma decisão de escopo permanece aberta antes da execução das especificações; o pacote final está em modules/interlojas/confirmacao-por-romaneios/.

## Out of scope

- Implementar o módulo Laravel nesta jornada.
- Alterar Delphi, banco legado, migrations aplicadas ou componentes compartilhados sem uma necessidade transversal comprovada.
- Reimplementar Cadastro de Romaneios ou Confirmação por Notas; somente consumir contratos e seams necessários.
- Copiar bugs, limitações visuais, commits parciais ou consultas por linha do Delphi.
- Testar driver ou `hashtablefs`.
