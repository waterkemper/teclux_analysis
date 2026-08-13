# Pesquisa — padrões Laravel e reuso para Transferência de Requisição/Exposição

## Escopo e conclusão

Pesquisa feita no checkout atual pelo junction `laravel` → `C:\teclux_cloud` e nos prompts existentes em `modules`. O relatório não implementa código e não altera issues.

**Conclusão:** a base reutilizável já existe. O núcleo de Requisição entre Filiais está separado em comandos compartilhados; Requisição para Exposição já compõe esses comandos com cadastro, F9 e cancelamento; Consulta de Requisições já compõe leitura paginada, grid, F6 cancelável, mutações e relatório. Romaneios é o precedente para cadastro mestre–detalhe, grids configuráveis, exportação, modais e operações por capability. A lacuna para uma futura Transferência é o domínio/contrato próprio (seleção, estado, elegibilidade, efeitos de romaneio/NF-e e autorização), não uma nova infraestrutura de shell, grid, parâmetros ou cancelamento.

## Matriz resumida

| Necessidade | Reuso confirmado | Lacuna / limite |
|---|---|---|
| Requisição entre Filiais | `RequisicaoFiliaisParameterManifest`, `RequisicaoFiliaisCommandService` e comandos de criar/alterar/cancelar | Definir a intenção de Transferência sem acoplar Consulta e Cadastro; os prompts proíbem controller/DTO/tela universais (`modules/interlojas/requisicao-para-exposicao/01-speckit-prompt-nucleo-compartilhado.md:105-121`). |
| Cadastro de Requisição/Exposição | `Cadastro.tsx`, `RequisicaoExposicaoController`, Form Requests, F9 e dialogs já implementados | Não transformar o F9 de abertas em consulta histórica; a própria spec separa as responsabilidades (`modules/interlojas/consulta-requisicoes-exposicao/02-speckit-prompt-leitura-grid.md:6-12,77-99`). |
| Consulta F6 | `ErpConsultaOperationBar`, `useErpGerarRequest`, `PgsqlGerarQueryRunner`, rota `cancelar-gerar` | Cada consulta/transferência precisa de `screenKey`, filtros, ordenação e query próprios; AbortController sozinho não é cancelamento PostgreSQL. |
| Grids | `ErpPreferenceDataGrid` + `ErpGridShell` + catálogo PHP/TS | Catálogo, projeção, allowlist de sort, paginação e export context são específicos por grade. Preferência não autoriza coluna ou SQL. |
| Modal F9 | `ErpTwoColumnCatalogLookupModal` na Requisição e `ErpCadastroLookupModal` como contrato genérico | A query e os campos do lookup de Transferência ainda não existem. Reusar a casca, não o DTO/estado de outro fluxo. |
| NF-e | `NfeAccessKey`, `NfeAccessKeyValid`, `NfeAccessKeyInput` e `NfeAccessKeyText` | Definir apenas elegibilidade/localização de documentos da Transferência; não criar máscara, regex ou DV local. |
| Parâmetros | `ParameterService::getMany` e manifests tipados | Manifest específico da Transferência e sua matriz de efeitos ainda não existem. |
| Menu/acesso | migration `acessosmodulos`, service de módulo, middleware, `UserBranchAccessService` | Decidir a folha e se a migration herdará grants do pai; o padrão atual de Requisição replica acessos do pai. |
| Modal/atalhos | Shells ERP, F3/F8/F6/F9 de cadastro, operation bar de consulta, hooks de superfície | Atalhos variam por superfície: F6 é Excluir em cadastro e Gerar/Cancelar em consulta. Transferência precisa resolver colisões por foco/modal/estado. |

## 1. Requisição entre Filiais e Requisição para Exposição

### Núcleo compartilhado

**CONFIRMADO — reusar.** O prompt do núcleo define explicitamente `pedidosfiliais` como persistência canônica, geração de código por função legada, situação aberta `A`, parâmetros literais, locks de duplicidade/estoque, movimentos TEP/TPE/TFR, revisão e auditoria (`modules/interlojas/requisicao-para-exposicao/01-speckit-prompt-nucleo-compartilhado.md:24-43,45-73,91-114`). Isso está materializado no checkout: `RequisicaoFiliaisParameterManifest` mantém as cinco descrições literais e chama um único `ParameterService::getMany` por filial (`laravel/backend/app/Services/Estoque/RequisicaoFiliais/RequisicaoFiliaisParameterManifest.php:14-24,33-42,55-77`); `RequisicaoFiliaisCommandService` executa alterar/cancelar com `DB::transaction`, `findByCodigoForUpdate`, revalidação de situação/revisão e movimentos (`laravel/backend/app/Services/Estoque/RequisicaoFiliais/RequisicaoFiliaisCommandService.php:158-170,271-325`).

**CONFIRMADO — reusar por composição.** O cadastro chama `CriarRequisicaoFiliaisCommand`/`AlterarRequisicaoFiliaisCommand`, injeta filial ativa e `DatabaseAuditContext`, e envolve o comando em transação auditada (`laravel/backend/app/Services/Interlojas/RequisicaoExposicao/RequisicaoExposicaoGravarService.php:7-26,33-56,89-133,206-212`). Portanto, uma Transferência deve chamar o núcleo/application service adequado, sem copiar SQL, locks ou movimentação para um controller novo.

### Cadastro, carga, mutação e F9

**CONFIRMADO — implementação existente.** O controller separa cadastro/carga direta, criar, alterar, cancelar e lookup de abertas (`laravel/backend/app/Http/Controllers/Interlojas/RequisicaoExposicaoController.php:52-74,105-167`), e expõe URLs próprias para cada lookup (`:257-274`). A tela usa `AppLayout` + `ErpCadastroShell`, command bar própria, dirty state, confirmação antes de descartar, F9 e dialogs de duplicidade/revisão/cancelamento (`laravel/backend/resources/js/Pages/Interlojas/RequisicaoParaExposicao/Cadastro.tsx:34-86,121-214,216-276,278-414`).

**CONFIRMADO — modal F9 reutilizável com adapter.** `RequisicaoExposicaoAbertasLookupModal` compõe `ErpTwoColumnCatalogLookupModal`, passa URL, requisitante, colunas extras e seleção (`laravel/backend/resources/js/Pages/Interlojas/RequisicaoParaExposicao/components/RequisicaoExposicaoAbertasLookupModal.tsx:6-24,26-58`). O teste prova escopo por filiais autorizadas, somente situação aberta e ordenação/paginação do contrato (`laravel/backend/tests/Feature/Interlojas/RequisicaoExposicao/RequisicaoExposicaoF9Test.php:15-51,53-102`). Para Transferência, reusar a casca e criar somente a projeção/consulta de candidatos correta.

**LACUNA:** o prompt de interface manda preservar F3/F5/F6/F9/Esc, dirty state e cancelamento com motivo conforme parâmetro (`modules/interlojas/requisicao-para-exposicao/03-speckit-prompt-interface-integracao.md:8-19,35-45,89-99,127-139`). A implementação atual usa F3/F8/F6/F9 via hook próprio (`Cadastro.tsx:260-275`); logo, qualquer decisão de F5/F8 para Transferência deve ser explícita, sem assumir que a tecla do legado é compatível com `ErpCadastroCommandBar`.

## 2. Consulta de Requisições, grids e F6 cancelável

**CONFIRMADO — consulta real implementada.** `ConsultaRequisicoesController` separa Inertia, validação, consulta JSON, cancelamento PostgreSQL, confirmados, mutações, lookup de motivos e PDF (`laravel/backend/app/Http/Controllers/Interlojas/ConsultaRequisicoesController.php:63-129,132-176,178-232,235-288`). A página passa `cancelar_gerar`, mantém estado `busy`, bloqueia operações concorrentes, usa resize persistido e registra hooks de atalhos (`laravel/backend/resources/js/Pages/Interlojas/ConsultaRequisicoes/Index.tsx:40-103,169-205,275-287`).

**CONFIRMADO — barra/atalhos/estados.** A operation bar aceita label, shortcut, ícone, disabled, danger, processing e `aria-label`/tooltip coerentes (`laravel/backend/resources/js/Components/erp/consulta/ErpConsultaOperationBar.tsx:5-18,37-68,125-169`). A Consulta exibe Gerar F6, torna-o “Gerando…”, insere Cancelar danger enquanto `busy`, além de Gravar F8, cancelar requisição e Imprimir F7 (`laravel/backend/resources/js/Pages/Interlojas/ConsultaRequisicoes/Index.tsx:309-370`). Isso é o modelo de composição para uma consulta de Transferência.

**CONFIRMADO — cancelamento real.** `useErpGerarRequest` cria trace, envia POST para a URL de cancelamento antes do abort local e limpa o controller (`laravel/backend/resources/js/hooks/useErpGerarRequest.ts:25-53,55-80`). O controller envolve a consulta no `PgsqlGerarQueryRunner` e chama `cancelarPgsqlGerarQuery` com `screenKey` próprio (`laravel/backend/app/Http/Controllers/Interlojas/ConsultaRequisicoesController.php:88-129`). O runner aplica timeout e usa `PgsqlCancellableStatement`; o serviço cancela por `pg_backend_pid()` registrado por usuário+trace em Redis (`laravel/backend/app/Support/Database/PgsqlGerarQueryRunner.php:9-38`, `laravel/backend/app/Support/Database/PgsqlGerarQueryCancelService.php:16-66`, `laravel/backend/app/Support/Database/PgsqlQueryCancelRegistry.php:9-50`). Há teste de contrato da rota e validação do UUID (`laravel/backend/tests/Feature/Interlojas/ConsultaRequisicoes/ConsultaRequisicoesGerarCancelTest.php:15-35`).

**LACUNA:** para Transferência ainda faltam endpoint, `screenKey`, query completa dentro do runner, payload canônico, semântica de cancelado e teste PostgreSQL observável. Não chamar isso de cancelamento só porque o navegador abortou; a regra dos prompts vizinhos é manter a proibição de testes de driver e de `hashtablefs` (`modules/interlojas/confirmacao-por-romaneios/pesquisa-padroes-laravel-reutilizaveis.md:95-103`).

## 3. Grids, ordenação, paginação/virtualização e exportação

**CONFIRMADO — reusar infraestrutura.** `ErpPreferenceDataGrid` escolhe `DataGrid` ou `EditableDataGrid`, recebe catálogo, layout e contexto de exportação, e delega persistência ao `ErpGridShell` (`laravel/backend/resources/js/Components/erp/data-grid/ErpPreferenceDataGrid.tsx:9-18,21-31,74-127`). O shell registra preferências, permite colunas/configuração e reserva Alt+G para picker e Ctrl+X para exportação (`laravel/backend/resources/js/Components/erp/data-grid/ErpGridShell.tsx:17-38,77-128,141-173`). A Consulta de Transferências demonstra paginação, ordenação server-side, export endpoints e Cancelar na operação F6 (`laravel/backend/resources/js/Pages/Interlojas/ConsultaTransferencias/Index.tsx:52-103,122-151,215-223`).

**CONFIRMADO — exportação segura.** `GridExportOrchestrator` grava contexto, decide sync até 5.000 registros/async acima disso e só resolve o token para o mesmo usuário (`laravel/backend/app/Services/Erp/GridExportOrchestrator.php:9-47`). O contexto da Transferência deve congelar filtros, filial, sort e colunas autorizadas; nunca aceitar linhas, SQL ou campo arbitrário vindo da UI.

**LACUNA:** não há catálogo de grid específico para Transferência, nem sua allowlist de ordenação, desempate determinístico, paginação, virtualização de detalhe ou datasets de exportação. A edição do grid não substitui comando, lock, revisão, rollback ou atomicidade. Os prompts de Consulta explicitamente mantêm a Consulta paginada independente do F9/Cadastro (`modules/interlojas/consulta-requisicoes-exposicao/02-speckit-prompt-leitura-grid.md:12-16,31-63,71-99`).

## 4. Shell, Breadcrumb, modal F9 e atalhos

**CONFIRMADO — shell/trilha.** `AppLayout` aceita itens de breadcrumb com `label`, `href`, `preserveScroll` e `preserveState`, renderizando `aria-label="Trilha"` em desktop e mobile (`laravel/backend/resources/js/Layouts/AppLayout.tsx:24-73,644-652,988-1020`). Cadastro de Requisição usa `ErpCadastroShell`; Romaneios usa o mesmo shell e injeta `RomaneioCommandBar` (`laravel/backend/resources/js/Pages/Interlojas/RequisicaoParaExposicao/Cadastro.tsx:278-294`, `laravel/backend/resources/js/Pages/Entregas/Romaneios/Cadastro.tsx:585-614`). Consulta usa `AppLayout` + `ErpConsultaOperationBar` (`laravel/backend/resources/js/Pages/Interlojas/ConsultaRequisicoes/Index.tsx:309-319`).

**CONFIRMADO — atalhos de cadastro.** O hook compartilhado captura F3/F8/F6/F9 em fase de captura, ignora modificadores e evento já prevenido, chama somente handlers habilitados e funciona com foco em campos (`laravel/backend/resources/js/Components/erp/cadastro/useRegistryCadastroShortcuts.ts:3-27,38-70`). Romaneios mostra o padrão mais rico: resolver superfície ativa para página/modal e desabilitar por capability/busy (`laravel/backend/resources/js/Pages/Entregas/Romaneios/Cadastro.tsx:208-213,476-497`).

**LACUNA/conflito:** não existe um mapa universal de teclas. F6 significa Excluir em cadastro, Gerar em consulta, e F6 pode ser Cancelar em uma jornada de Requisição segundo prompt (`modules/interlojas/requisicao-para-exposicao/03-speckit-prompt-interface-integracao.md:35-41,127-139`). Transferência precisa de hook de superfície que ignore `repeat`, modal aberto, loading, foco incompatível e listeners duplicados; botões devem chamar os mesmos handlers.

**CONFIRMADO — modal genérico, com limite.** `ErpCadastroLookupModal` define `onSelect`, URL, foco/Escape, dialog acessível, paginação e seleção por teclado (`laravel/backend/resources/js/Components/erp/cadastro/ErpCadastroLookupModal.tsx:26-31,120-125,204-210,322-356,489-516`). A lacuna é semântica: nenhum modal genérico sabe quais filiais, estados, documentos ou capacidades são elegíveis para Transferência.

## 5. NF-e, parâmetros e acesso

### Chave NF-e

**CONFIRMADO — reuso obrigatório.** `NfeAccessKey` é value object readonly que só expõe o valor canônico após validação (`laravel/backend/app/Domain/Fiscal/NfeAccessKey.php:7-40`); `NfeAccessKeyValid` documenta 44 dígitos e DV módulo 11 (`laravel/backend/app/Rules/NfeAccessKeyValid.php:12-41`). `NfeAccessKeyInput` mantém estado canônico separado da máscara, normaliza colagem, preserva cursor, valida blur e dispara Enter com valor canônico (`laravel/backend/resources/js/Components/erp/fiscal/NfeAccessKeyInput.tsx:22-40,66-112,114-151,154-177`).

**LACUNA:** a Transferência ainda precisa de endpoint/lookup que aplique filial, documento já usado, situação fiscal, romaneio e demais elegibilidades. A chave deve ser somente 44 dígitos canônicos no backend; não criar regex/DV/máscara local.

### Parâmetros

**CONFIRMADO — reuso direto.** `ParameterService::getMany` faz leitura agrupada e usa memória por request/cache (`laravel/backend/app/Services/Parameter/ParameterService.php:13-28,113-173`). O manifest de Requisição já resolve cinco literais e máscara pela filial, convertendo os valores no backend (`laravel/backend/app/Services/Estoque/RequisicaoFiliais/RequisicaoFiliaisParameterManifest.php:33-77`).

**LACUNA:** não aceitar flags do browser como autoridade. Para Transferência, definir novo manifest apenas se houver parâmetros realmente comprovados; resolver em lote por filial e documentar default/tipo/efeito. Não copiar o manifest de Romaneios ou Consulta sem verificar que o efeito é o mesmo.

### Menu, capability e Filial

**CONFIRMADO — reusar padrão.** O serviço de acesso concede bypass a administrador e, para usuário comum, exige folha `acessosmodulos` + grant em `usuariosacessosmodulos`; o middleware falha com login/403 (`laravel/backend/app/Services/Authorization/InterlojasRequisicaoExposicaoModuleAccessService.php:13-40`, `laravel/backend/app/Http/Middleware/EnsureInterlojasRequisicaoExposicaoModuleAccess.php:12-32`). A migration cria/realinha a folha sob `cloud.modulo.interlojas` (`laravel/backend/database/migrations/2026_07_29_293000_acessosmodulos_requisicao_exposicao.php:14-18,26-70`).

**DIVERGÊNCIA a considerar:** essa migration replica os usuários que tinham acesso ao pai para a folha (`:79-104`). Não registrar como “sem concessão automática” sem decidir o comportamento desejado para Transferência. A Filial ativa, por sua vez, vem da sessão e o escopo autorizado usa `usuariosfiliais`/`whereIn` (`laravel/backend/app/Services/Branch/BranchContextService.php:13-35`, `laravel/backend/app/Services/Branch/UserBranchAccessService.php:18-35,42-75,85-161`). Toda leitura, lookup, exportação e comando deve revalidar esse escopo no servidor.

## 6. Romaneios como precedente, não como cópia

**CONFIRMADO — reuso por composição.** Romaneios já entrega Inertia com filial efetiva, parâmetros, capabilities, rotas de CRUD, lookups e relatórios (`laravel/backend/app/Http/Controllers/Entregas/RomaneiosController.php:34-60`). A página compõe command bar, shortcuts com superfície ativa, modais unitário/múltiplo e lookups fiscais (`laravel/backend/resources/js/Pages/Entregas/Romaneios/Cadastro.tsx:476-497,585-614,716-770`). As rotas mostram a separação de localizar, inclusão múltipla cancelável, CRUD, operações, lookups e relatório (`laravel/backend/routes/web.php:1966-2056`).

**LACUNA:** Transferência não deve herdar entidades, capabilities, estados ou SQL de Romaneios. Devem ser especificados: agregado e identidade, relação com Requisição/NF-e/Romaneio, seleção em lote, locks, idempotência, revisão, cancelamento/estorno, relatório e autorização sensível. O componente comum fornece ergonomia; não fornece a semântica transacional.

## 7. Regra de testes e fronteiras

- Testar contratos HTTP, Form Requests, services/commands, filtros, sort allowlist, grid/catalog, acessibilidade, F9, atalhos e cancelamento observável.
- Para SQL, locks, rollback, concorrência e `pg_cancel_backend()`, usar PostgreSQL autoritativo real e testes de integração/Feature correspondentes; o padrão de cancelamento é o teste `ConsultaRequisicoesGerarCancelTest` citado acima.
- **Não adicionar testes de driver PDO nem de `hashtablefs`/`hastablefs`.** Não transformar a exigência de PostgreSQL real em matriz de drivers; não testar a implementação do driver. Essa restrição já está explícita nos prompts e pesquisa de Confirmação por Romaneios (`modules/interlojas/confirmacao-por-romaneios/01-speckit-prompt-fundacao-dominio-seguranca.md:36`, `02-speckit-prompt-consulta-f6-cancelavel.md:32`, `05-speckit-prompt-aceite-testes-observabilidade.md:28`, `pesquisa-padroes-laravel-reutilizaveis.md:101-103`).
- Não usar introspecção de schema no caminho de negócio; schema gate pertence a migration/CI/teste, não ao request operacional.

## Fontes de prompts consultadas

- `modules/interlojas/requisicao-para-exposicao/01-speckit-prompt-nucleo-compartilhado.md` — núcleo, parâmetros, locks, movimentos e limite de compartilhamento.
- `modules/interlojas/requisicao-para-exposicao/02-speckit-prompt-backend-cadastro.md` — endpoints, F9, acesso, filial e mutações.
- `modules/interlojas/requisicao-para-exposicao/03-speckit-prompt-interface-integracao.md` — shell, modal, dirty state e atalhos.
- `modules/interlojas/consulta-requisicoes-exposicao/01-speckit-prompt-fundacao-autorizacao.md`, `02-speckit-prompt-leitura-grid.md`, `03-speckit-prompt-acoes-compartilhadas.md` e `04-speckit-prompt-relatorio-f12.md` — consulta, grid, mutações e PDF.
- `modules/entregas/cadastro-romaneios/pesquisa-padroes-laravel-reutilizaveis.md` — precedente consolidado de shell, grid, exportação, F6, NF-e, parâmetros e relatórios.

