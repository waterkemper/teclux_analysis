# Pesquisa — padrões Laravel reutilizáveis para Cadastro de Romaneios

## Resultado executivo

O projeto já contém as fundações necessárias para shell de cadastro, barra de operações, grids, exportação, chave NF-e, parâmetros, acesso, Filiais, autorização sensível e cancelamento PostgreSQL. Elas são aplicáveis ao Romaneio, mas não existe um módulo agregado pronto: repositories, catálogo de colunas, lookups fiscais, estados/capacidades, relatórios e fronteira transacional continuam específicos.

O paralelo de interface mais próximo é **Requisição para Exposição** para ficha/estado/revisão e **Consulta de Requisições** para F6 cancelável, barra operacional, grids e relatório. Nenhuma tela isolada deve ser copiada inteira.

## Matriz de reuso

| Necessidade | Autoridade existente | Aplicação ao Romaneio | Lacuna |
|---|---|---|---|
| Shell mestre–detalhe | `ErpCadastroShell`, `ErpCadastroCommandBar`, `useRegistryCadastroShortcuts` | Reusar shell sticky/rail, ícones, estados disabled, acessibilidade e F3/F8/F6/F9 | Romaneio possui operações extras, F10 e mais de uma superfície; criar command bar/hook fino do módulo sem duplicar o shell |
| Consulta F6 | `ErpConsultaOperationBar`, `ErpConsultaGerandoBanner`, `useErpGerarRequest` | Reusar Gerar, estado busy e botão Cancelar visível imediatamente | Definir SQL, endpoint e `screenKey`; decidir síncrono versus job no ticket de performance |
| Query PostgreSQL cancelável | `PgsqlGerarQueryRunner`, `CancelsPgsqlGerarQuery`, `PgsqlGerarQueryCancelService` | Trace UUID por usuário, timeout e `pg_cancel_backend()` para request síncrono | Todo caminho da consulta deve executar dentro do runner; abort HTTP isolado não basta |
| Consulta muito pesada | `useErpHeavyGerarRequest` + fila `heavy-reports` | Aplicável somente se medição justificar job/poll/result/cancel | Precisa job específico e cancelamento do job **e** da conexão PostgreSQL do worker; não usar preventivamente |
| Grids ERP | `ErpPreferenceDataGrid`, `ErpGridShell`, catálogos `Support/ErpGrid` | Reusar ordenação, visibilidade, reordenação, resize, preferências, atalhos e exportação | Criar catálogos próprios por grade e mapear colunas sensíveis/derivadas; edição continua sob comandos do agregado |
| Edição de linhas | variante `editable`/`EditableDataGrid` | Pode editar rascunhos de itens e seleção múltipla | Não persiste regras por si; validação, dirty state, conflito e batch command são específicos |
| Exportação | `GridExportOrchestrator`, `ExportContextStore`, `useErpGridExcelExport` | Reusar token preso ao usuário, layout escolhido e sync/async | Contexto deve congelar filtros/Filiais/sort e ser reautorizado; consultas de exportação específicas |
| Chave NF-e | `NfeAccessKeyInput`, `NfeAccessKeyText`, `NfeAccessKey`, `NfeAccessKeyValid` | Reuso direto e obrigatório para entrada, exibição e validação backend | Endpoint de localização por chave e tratamento “documento fora da lista” são do Romaneio |
| Lookups | `ErpCadastroLookupModal`, `ErpTwoColumnCatalogLookupModal`, services `*LookupService` | Reusar contrato/modal/paginação e guards de Filial | Criar queries próprias para romaneio, transportador, filial, série, frete, NF/cupom e motivo |
| Parâmetros | `ParameterService::getMany`, manifests tipados | Reuso direto com manifest do Romaneio e duas descrições literais | Manifest específico ainda não existe |
| Menu/módulo/Filial | `*ModuleAccessService`, middleware, Policies, `UserBranchAccessService` | Reusar fail-closed, administrador ou grant explícito, guards de Filial | Folha/menu, service, middleware, Policy e capabilities do Romaneio não existem |
| Autorização contextual | `SensitiveOperationAuthService`, `SensitiveOperationProofService`, hook/dialog | Reusar credenciais, rate limit, prova curta de uso único, auditoria e ator/autorizador | Registrar quatro ações e persistência contextual próprias |
| Relatórios | `ErpReportLayoutService`, `FilialInstitutionalReportService`, `ReportLogoService`, `ImpressaoAuditService` e services `*RelatorioService` | Reusar layout institucional, logo, sanitização, auditoria e resposta/download | Não há relatório de Romaneio/produtos equivalente; datasets e templates precisam ser especificados |

## Shell, operações e atalhos

**CONFIRMADO** — `ErpCadastroShell` alterna a barra sticky por trilho lateral sem mudar o contrato da command bar. `ErpCadastroCommandBar` oferece ícones, tooltips, `aria-label`, estados disabled/busy e atalhos visíveis. `useRegistryCadastroShortcuts` captura F3 Novo, F8 Gravar, F6 Excluir e F9 Localizar inclusive com foco em campos (`resources/js/Components/erp/cadastro/`).

**Aplicação** — usar essas autoridades para Novo, Gravar, Excluir e Localizar. Acrescentar ações do domínio por composição: imprimir, incluir múltiplos, conferência, histórico, liberar/reter e recebimento. Botão e teclado devem chamar o mesmo handler e compartilhar o mesmo cálculo backend de capacidade.

**Lacuna/conflito** — não há resolvedor global de atalhos. No cadastro, F6 já significa Excluir; em superfícies de consulta, F6 significa Gerar. Criar um hook do Romaneio sensível à superfície/modal/foco, ignorando `repeat`, modificadores, evento já prevenido e estado busy. F10 só dispara liberar/reter conforme a capacidade corrente. Não registrar dois listeners ativos para a mesma tecla.

`ErpConsultaOperationBar` já renderiza ícones, shortcut, processing e versões full/rail. Consulta de Requisições comprova o padrão correto: ao iniciar, Gerar vira “Gerando…” e um botão **Cancelar** danger é inserido enquanto `busy` está ativo (`resources/js/Pages/Interlojas/ConsultaRequisicoes/Index.tsx:260-335`).

## Grids, preferências e exportação

**CONFIRMADO** — `ErpPreferenceDataGrid` engloba grid readonly/editable, catálogo, persistência de layout e exportação. O projeto usa o componente em consultas, cadastros mestre–detalhe e seleção de lotes. `GridExportOrchestrator::SYNC_LIMIT` é 5.000 e o contexto só resolve para o mesmo usuário.

**Decisão de reuso**:

- Uma chave de catálogo estável por grade: pesquisa de romaneios, itens/documentos, inclusão múltipla, duplicatas e histórico/conferência.
- Resultados grandes usam paginação/ordenação server-side; preferências de colunas não autorizam o cliente a inventar sort/field SQL.
- Exportar exatamente o filtro, sort, Filiais e snapshot lógico da consulta, revalidando acesso no download/job. Colunas ocultas por autorização nunca entram apenas porque estavam salvas na preferência.
- Operações em lote enviam IDs canônicos; backend relê tudo com uma consulta set-based e executa batch, nunca um request/query por linha.

**Lacuna** — o grid compartilhado não oferece por si só locking, revisão, rollback de rascunho ou atomicidade mestre–itens. Esses contratos devem morar em Form Requests/application commands/repositories.

## Cancelamento real de F6

`useErpGerarRequest` cria `X-Trace-Id`, envia `POST cancelar-gerar` e depois aborta localmente. `PgsqlGerarQueryRunner` registra usuário/trace, aplica timeout e permite `pg_cancel_backend()`; `CancelsPgsqlGerarQuery` valida UUID e cancela apenas a query do usuário/screen corretos.

Para Romaneios, o fluxo síncrono é aplicável se a medição couber no gateway:

1. Definir `busy=true` antes do primeiro await, fazendo Cancelar aparecer desde o início.
2. Executar **toda** a montagem/consulta SQL dentro de `PgsqlGerarQueryRunner::run`.
3. Expor `cancelar-gerar` sob o mesmo middleware/policy, com `screenKey` exclusivo.
4. Cancelar no servidor antes/independentemente do aborto visual; tratar cancelamento como estado neutro, preservando o resultado anterior.
5. Cobrir teste PostgreSQL real que observe a query terminar, não apenas Axios `ERR_CANCELED`.

`useErpHeavyGerarRequest` é alternativa comprovada para geração em fila, com enqueue 202, poll, progress, result e cancel URL. O ticket de consulta deve escolher com base em `EXPLAIN`/tempo/cardinalidade; uma página não deve misturar os dois protocolos sem necessidade.

## Chave NF-e e lookups

**CONFIRMADO** — `NfeAccessKeyInput` normaliza para 44 dígitos, mascara, mantém cursor/colar, valida no blur e aceita handler Enter. O domínio `NfeAccessKey` e a rule `NfeAccessKeyValid` são a autoridade backend, com vetores de paridade.

Reusar diretamente. Não criar regex, máscara ou DV específicos do Romaneio. O componente pode acionar localização no Enter, mas a resposta deve vir de endpoint próprio que aplique Filial, duplicidade, tipo Normal/Transferência e estado fiscal. `ErpCadastroLookupModal` serve como casca; nenhum lookup genérico existente reúne essas regras.

## Parâmetros, segurança e menu

Aplicam-se integralmente as conclusões de [pesquisa-parametros-autorizacoes-menu.md](pesquisa-parametros-autorizacoes-menu.md):

- manifest próprio + um `getMany` por Filial;
- folha sob o pai Cloud existente, sem grants em massa;
- service/middleware/Policy fail-closed;
- `UserBranchAccessService` em filtros, lookup, export e comando;
- quatro ações no catálogo sensível, prova vinculada a contexto e consumida atomicamente.

Não há implementação Romaneio desses seams no checkout atual.

## Relatórios e impressão

O Laravel possui serviços reutilizáveis para layout institucional, filial/logo, sanitização e auditoria, além de exemplos de services de relatório. Eles são infraestrutura, não templates equivalentes ao FastReport Delphi.

Especificar dois relatórios: Romaneio mestre–itens e itens/produtos. Ambos devem reler dados server-side por IDs vinculados, obedecer cancelados conforme opção comprovada, evitar lista SQL textual e carregar produtos em uma operação `ANY(array)`/set-based. Downloads precisam de Policy/Filial, auditoria e encoding seguro. Pré-visualização/impressão do browser não substitui artefato reproduzível quando o projeto exigir PDF.

## O que não deve ser reutilizado

- SQL concatenada, subconsultas correlacionadas repetidas ou loops Delphi.
- `Schema::has*`/introspecção em request de negócio.
- Componentes ad hoc de senha, chave NF-e, grid ou exportação.
- Estado de autorização/capacidade enviado pelo cliente como verdade.
- `EditableDataGrid` como substituto de command/transação.
- Apenas `AbortController` como “cancelamento da consulta”.

## Resposta

Os padrões existentes são aplicáveis e suficientes como plataforma. A implementação futura deve compô-los, criando somente adapters e contratos do domínio Romaneio. As lacunas reais são: agregado/repositories transacionais, catálogos das grades, lookups fiscais, capabilities/estados, quatro ações sensíveis, manifest/menu/Policy, datasets/templates de relatório e escolha mensurada entre F6 síncrono cancelável ou job pesado.
