# Cadastro de Romaneios no Laravel

Label: wayfinder:map

## Destination

Produzir, em `modules/entregas/cadastro-romaneios/`, uma sequência coordenada de prompts prontos para `/speckit.specify` que permita implementar no Laravel o Cadastro de Romaneios com paridade funcional comprovada no Delphi, adaptado aos padrões atuais do projeto e sem implementar o módulo neste workspace.

## Notes

- Usar `/grilling` e `/domain-modeling` nas decisões de produto e domínio; usar os termos do `laravel/CONTEXT.md` e registrar novos termos somente quando sua semântica estiver comprovada e acordada.
- Raízes Delphi: `delphi/apps/entrega/dmcadastroromaneios.pas/.dfm` e `delphi/apps/entrega/fmcadastroromaneios.pas/.dfm`. Seguir formulários auxiliares, classes-base, relatórios, funções PostgreSQL e units compartilhadas somente quando alcançados por um caminho comprovado dessas raízes.
- Consultar os prompts já existentes em `modules/`, especialmente os padrões de grids ERP, consultas canceláveis, parâmetros, autorização/menu e chave NF-e compartilhada.
- Classificar descobertas como `CONFIRMADO`, `INFERIDO`, `DÚVIDA`, `NÃO LOCALIZADO`, `DIVERGENTE`, `POSSÍVEL BUG LEGADO`, `POSSÍVEL BUG ATUAL` ou `DECISÃO NOVA`, sempre com arquivo/linha, componente, campo, SQL ou evidência equivalente.
- O destino é documentação para `/speckit.specify`, não implementação. Não alterar Delphi ou Laravel, não executar migrations e não modificar o banco.
- Buscar paridade de regras, estados, filtros, relatórios e operações comprovados, usando a UX Laravel. Não copiar layout, limitações ou bugs Delphi.
- Laravel e Delphi devem coexistir sobre os mesmos registros legados, preservando sequences, triggers, funções, auditoria e efeitos transacionais confirmados; não criar segunda fonte canônica.
- Inventariar toda chamada `parametros_valor('', '')`; no Laravel, preferir manifest próprio e leitura em lote por `ParameterService::getMany`, nunca N+1 de parâmetros.
- Criar `Entregas → Cadastro de Romaneios` em `acessosmodulos`; administrador tem acesso automático e usuário comum depende de concessão explícita em `usuariosacessosmodulos`. Não conceder acesso em massa na migration. Revalidar no backend acesso ao módulo e autorizações específicas de cada operação.
- Usar `ErpPreferenceDataGrid` e demais padrões comprovados para ordenação, exportação, personalização, paginação/virtualização e acessibilidade. Botões seguem o padrão Laravel de operações, com ícones e atalhos Delphi comprovados quando não conflitarem com atalhos globais.
- Reusar a autoridade compartilhada `NfeAccessKey`/`NfeAccessKeyInput`; não criar máscara de chave NF-e exclusiva de Romaneios. Extensão só se for necessidade transversal comprovada.
- A consulta F6 deve oferecer Cancelar desde o início. Investigar e, se aplicável, reusar `CancelsPgsqlGerarQuery`, `PgsqlGerarQueryRunner`, `useErpGerarRequest`/`useErpHeavyGerarRequest` e rotas `cancelar-gerar`, comprovando interrupção da query PostgreSQL e não apenas aborto visual no navegador.
- Proibir N+1. Para relações em lote, especificar uma consulta/set-based query com `IN`, `= ANY(array)` ou outra forma adequada ao PostgreSQL 9.6, usando parâmetros vinculados e estratégia explícita para arrays vazios e limites.
- `LEFT JOIN` não é padrão automático: validar nulabilidade e cardinalidade no schema. Quando a relação e as colunas de junção forem obrigatórias e a ausência de correspondência não fizer parte do contrato, usar `INNER JOIN`; documentar exceções sem simplificar indevidamente semântica de dados órfãos.
- Gerar snapshot versionado em `modules/entregas/cadastro-romaneios/schema/` por introspecção somente leitura do PostgreSQL autoritativo, cobrindo todas as tabelas, views, sequences, constraints, índices, triggers e funções alcançadas. Registrar origem e data. Os prompts devem mandar o Cursor conferir esse snapshot e o checkout Laravel antes de escrever SQL.
- Conforme ADR Laravel 0007, não usar `Schema::hasTable`, `Schema::hasColumn`, `information_schema` ou ramificação por introspecção em caminhos de negócio. Estrutura não confirmada fica `INFERIDO` e bloqueia o SQL dependente até confirmação no banco autoritativo.

## Decisions so far

<!-- Cada decisão será registrada somente quando o respectivo ticket for resolvido. -->

- [Inventariar interface e fluxos do Cadastro de Romaneios Delphi](issues/01-inventariar-interface-fluxos-delphi.md) — confirmou cadastro mestre–detalhe, quatro superfícies operacionais, conferência/histórico, relatórios, atalhos e guards; registrou divergências e bugs a não reproduzir.
- [Inventariar SQL, domínio e efeitos do Cadastro de Romaneios Delphi](issues/02-inventariar-sql-dominio-efeitos-delphi.md) — mapeou consultas, objetos e efeitos sobre agenda, situação, financeiro e conferência; delimitou funções e estruturas que o snapshot autoritativo deve confirmar antes de qualquer SQL Laravel.
- [Coletar snapshot autoritativo do schema de Romaneios](issues/03-coletar-snapshot-schema-romaneios.md) — confirmou estrutura, nulabilidade, índices, triggers, funções e sequences em evidência versionada; encontrou PostgreSQL 9.5.25 e `vfornecedores` como tabela física.
- [Inventariar parâmetros, autorizações e acesso ao módulo](issues/04-inventariar-parametros-autorizacoes-menu.md) — confirmou dois parâmetros por Filial, quatro desafios contextuais, o acesso Delphi e a lacuna da folha Cloud; mapeou os mecanismos Laravel a reutilizar.
- [Auditar padrões Laravel reutilizáveis para Romaneios](issues/05-auditar-padroes-laravel-reutilizaveis.md) — confirmou os seams compartilhados aplicáveis a shell, grid/exportação, NF-e, segurança, relatórios e cancelamento; delimitou apenas as lacunas próprias do domínio.
- [Definir modelo de domínio, coexistência e transações de Romaneios](issues/06-definir-modelo-coexistencia-transacoes.md) — definiu o agregado canônico compartilhado, transação atômica por Romaneio, revisão otimista, locks determinísticos, idempotência, auditoria e autoridade das funções/triggers legados.
- [Definir consulta F6, SQL, performance e cancelamento](issues/07-definir-consulta-f6-sql-performance-cancelamento.md) — definiu F6 síncrona e cancelável no PostgreSQL, filtros e paginação server-side, SQL set-based, joins conforme schema, exportação compartilhada e gatilho mensurado para fila pesada.
- [Definir interface, operações e componentes compartilhados](issues/08-definir-interface-operacoes-componentes.md) — definiu página mestre–detalhe com auxiliares em modais, botões/atalhos Laravel com F8 para gravar, grids sem persistência inline, NF-e compartilhada, relatórios e acessibilidade.
- [Definir segurança, menu e parâmetros do Cadastro de Romaneios](issues/09-definir-seguranca-menu-parametros.md) — definiu árvore e grants, capabilities/Filiais, provas sensíveis, parâmetros batched e integração transacional com o núcleo Contas a Pagar Laravel sem duplicar o motor financeiro.
- [Definir critérios de aceite, testes e observabilidade](issues/10-definir-aceite-testes-observabilidade.md) — definiu suíte PostgreSQL bloqueante, matriz de paridade e segurança, gates de SQL/N+1, cancelamento real, concorrência e falhas atômicas, além de logs, métricas, alertas e evidências; implantação gradual ficou fora do escopo.
- [Consolidar prompts coordenados para speckit.specify](issues/11-consolidar-prompts-speckit-romaneios.md) — publicou seis prompts autocontidos e ordenados, com dependências, schema, fronteiras, requisitos e aceite, cobrindo da fundação à verificação transversal.
- [Reconciliar tela de inclusão de Item de Romaneio com o fluxo Delphi](issues/12-reconciliar-tela-inclusao-item-notas-cupons-fretes.md) — publicou o sétimo prompt corretivo: superfície única Nota/Cupom, Auto Incluir marcado, lookups encadeados e separação entre Tabela de Fretes, Valor de Tabela, Valor do Frete e total financeiro.

## Decisions added after prompt consolidation

- Ticket 13 auditou os filtros da inclusao multipla e publicou o prompt separado 08: modules/entregas/cadastro-romaneios/08-speckit-prompt-correcao-filtros-inclusao-multipla.md.
- [Auditar conferencia por chave e por chave + volume](issues/14-auditar-conferencia-chave-volume.md) — confirmou que N usa chave NF-e, T usa chave composta com volume, encontrou leitura simulada, gravacao por Documento, subcontagem/N+1 e rejeicao indevida de parcial, e publicou o prompt corretivo 09.
- [Auditar fluxo Normal/Transferência, conferências e estados](issues/15-auditar-fluxo-normal-transferencia-status-conferencias.md) — comparou o fluxo completo N/T, confirmou defaults de frete, elegibilidade, âncoras de Transferência, estados canônicos por tipo e efeitos ROS/RPS/ROE/ROP, encontrou divergências de defaults, inclusão unitária/criação, situação, capabilities e contrato de conferência, e publicou o prompt pós-implementação 10.

## Not yet specified

Nenhuma névoa restante: o pacote de prompts coordenados atingiu o destino deste mapa.

## Out of scope

- Implementar ou testar código do módulo Laravel nesta jornada.
- Alterar PAS, DFM, banco legado, migrations aplicadas ou artefatos gerados por `/speckit.specify`.
- Redesenhar componentes compartilhados de grid, consulta ou autorização sem necessidade transversal comprovada.
- Conceder automaticamente o novo acesso a todos os usuários existentes.
- Reproduzir bugs, limitações visuais ou SQL incorreto do Delphi.
