# Pesquisa: padrões Laravel para Consulta de Transferências

## Escopo e método

Pesquisa feita exclusivamente contra fontes primárias do checkout `laravel/backend`. As marcações **Comprovado** descrevem contratos já implementados; **Recomendação** indica como aplicá-los ao novo módulo, sem afirmar que a Consulta de Transferências já existe.

## Acesso de módulo e menu

**Comprovado.** O paralelo mais próximo é Consulta de Requisições. Sua migration cria uma folha Cloud sob `cloud.modulo.interlojas`, localiza/atualiza por rota, calcula `ordem` e `codigo`, e não replica grants automaticamente (`database/migrations/2026_07_30_295000_acessosmodulos_consulta_requisicoes.php:10-13`, `:16-20`, `:28-69`). A autorização permite administrador ou exige a relação `usuariosacessosmodulos(usuario, acesso)` para o `acessosmodulos.codigo` localizado por rota e `teclux_cloud=true` (`app/Services/Authorization/InterlojasConsultaRequisicoesModuleAccessService.php:15-39`). O middleware redireciona anônimo e responde 403 sem acesso (`app/Http/Middleware/EnsureInterlojasConsultaRequisicoesModuleAccess.php:21-32`). O alias é registrado no bootstrap (`bootstrap/app.php:89-90`, `:119-120`) e envolve todas as rotas do módulo (`routes/web.php:1842-1862`).

**Recomendação.** Criar migration idempotente equivalente com folha `Consulta de Transferências`, pai `cloud.modulo.interlojas` e rota canônica `interlojas.consulta-transferencias.index`; não conceder acesso automaticamente. Criar service, middleware e alias próprios e proteger o grupo inteiro, não apenas o GET Inertia. O menu será descoberto pelo contrato `acessosmodulos`, portanto rota da migration e rota nomeada devem ser idênticas.

## Capability e filial ativa

**Comprovado.** A página Inertia recebe `capabilities`, URLs, filial ativa/estado/mensagem, defaults e parâmetros de UI (`app/Http/Controllers/Interlojas/ConsultaRequisicoesController.php:57-79`). O snapshot de capability atual separa `can_access` e `is_admin` (`app/Services/Interlojas/ConsultaRequisicoes/InterlojasConsultaRequisicoesModuleAccessService.php:24-32`). `BranchContextService` lê exclusivamente `filial_ativa_codigo`/`filial_ativa_nome` da sessão e completa o nome em `filiais` (`app/Services/Branch/BranchContextService.php:10-35`). O escopo não administrador deriva de `usuariosfiliais`; administradores recebem todas as filiais, com memoização por request/cache (`app/Services/Branch/UserBranchAccessService.php:12-16`, `:29-34`, `:42-75`, `:79-128`). A Consulta de Requisições distingue filial ausente, inválida, não autorizada e ok, abortando 403 para não autorizada (`app/Services/Interlojas/ConsultaRequisicoes/ConsultaRequisicoesPageService.php:85-129`) e revalida a filial no servidor para operações (`app/Services/Interlojas/ConsultaRequisicoes/ConsultaRequisicoesAuthorizationService.php:30-50`).

**Recomendação.** Nunca aceitar filial efetiva nem capability vindas do cliente. Resolver filial da sessão em todos os endpoints, validar existência e `usuariosfiliais`, e expor snapshots somente para controlar UX. Criar capabilities granulares para cada operação Delphi que altera dados; cada endpoint deve reafirmar a autorização, mesmo se o botão estiver oculto/desabilitado.

## Parâmetros legados

**Comprovado.** `ParameterService` é a fachada do projeto: no PostgreSQL usa `parametros_valor(nome, filial)` e `getMany` faz lote; não cai diretamente em `parametrosfiliais` após a função legada (`app/Services/Parameter/ParameterService.php:13-25`). Seus contratos são `get(string, ?int)` e `getMany(list<string>, ?int)`, com memória por request e cache configurável (`app/Services/Parameter/ParameterService.php:42-103`, `:113-174`). O manifest vizinho declara descrições literais, chama `getMany` para a filial e converte tipos/defaults (`app/Services/Estoque/RequisicaoFiliais/RequisicaoFiliaisParameterManifest.php:11-24`, `:33-42`, `:55-77`). A PageService resolve o manifest com a filial ativa e entrega nomes semânticos à UI (`app/Services/Interlojas/ConsultaRequisicoes/ConsultaRequisicoesPageService.php:35-56`).

**Recomendação.** Criar um manifest específico da Consulta de Transferências com todas as descrições literais extraídas de `parametros_valor('', '')`; ler em lote via `ParameterService::getMany(..., $filialAtiva)`, normalizar booleanos/números no backend e enviar apenas efeitos de UI necessários. Não reproduzir SQL direto nem confiar em parâmetros enviados pelo browser.

## Inertia, filtros e endpoints

**Comprovado.** O GET renderiza uma página React por `Inertia::render` e os comandos/consultas usam endpoints JSON separados (`app/Http/Controllers/Interlojas/ConsultaRequisicoesController.php:57-94`; `routes/web.php:1844-1861`). Form Requests normalizam e validam entrada; no paralelo, datas usam `Y-m-d`, situação é allowlist e campos sensíveis como filial/parâmetros são recusados (`app/Http/Requests/Interlojas/ConsultaRequisicoes/ConsultaRequisicoesConsultarRequest.php:17-26`, `:33-53`, `:63-88`). A página usa breadcrumbs e `AppLayout` (`resources/js/Pages/Interlojas/ConsultaRequisicoes/Index.tsx:261-270`).

**Recomendação.** Seguir GET Inertia leve + endpoints JSON por intenção (`consultar`, detalhes e cada operação). Form Requests devem allowlistar filtros, limites, sort/direction e rejeitar contexto de segurança. Padronizar erros 422/403/404 e não concatenar SQL com valores ou nomes de coluna não allowlisted.

## Grid, ordenação, paginação, exportação e personalização

**Comprovado.** `ErpPreferenceDataGrid` encapsula `DataGrid`/`EditableDataGrid`, preferências, exportação por token ou local e atalhos (`resources/js/Components/erp/data-grid/ErpPreferenceDataGrid.tsx:9-31`, `:74-127`). O catálogo define `screenKey`, `gridId`, versão e, por coluna, visibilidade, ordem, largura, ocultação, resize, reorder, exportabilidade, formato e pin (`resources/js/Pages/Interlojas/ConsultaRequisicoes/consultaRequisicoesGridCatalog.ts:4-30`, `:33-49`, `:90-106`). A implementação vizinha instancia a grade readonly, catálogo e tipo de exportação, seleção, indicador de posição e estado vazio/loading (`resources/js/Pages/Interlojas/ConsultaRequisicoes/components/ConsultaRequisicoesPedidosGrid.tsx:144-168`). `DataGrid` mantém sorting e paginação client-side e mostra o paginador (`resources/js/Components/erp/data-grid/DataGrid.tsx:238-260`, `:338-341`, `:1050`). O shell persiste layout e oferece Campos da Grade, exportar Excel, importar/exportar configuração e aplicação global para admin (`resources/js/Components/erp/data-grid/ErpGridShell.tsx:74-88`, `:250-318`). Atalhos padrão do shell são Alt+G e Ctrl+X, ignorando exportação em campos editáveis (`resources/js/Components/erp/data-grid/ErpGridShell.tsx:141-173`).

**Comprovado, ressalva.** A Consulta de Requisições carrega todas as linhas até limite configurado e ordena fixamente no servidor (`app/Services/Interlojas/ConsultaRequisicoes/ConsultaRequisicoesConsultarService.php:31-48`; `app/Infrastructure/Persistence/Legacy/Interlojas/LegacyConsultaRequisicoesReadRepository.php:25-60`). Seu Request atualmente proíbe `page`, `per_page`, `sort` e `direction` (`app/Http/Requests/Interlojas/ConsultaRequisicoes/ConsultaRequisicoesConsultarRequest.php:17-26`). Existe paginação server-side depreciada nesse repositório (`app/Infrastructure/Persistence/Legacy/Interlojas/LegacyConsultaRequisicoesReadRepository.php:63-111`), portanto ela não é o contrato vigente desse módulo.

**Recomendação.** Usar `ErpPreferenceDataGrid` e catálogo próprio para cada grid. Para conjuntos pequenos/limitados, sorting e paginação client-side do `DataGrid` bastam. Para volume potencialmente alto, especificar paginação e ordenação server-side explicitamente, com `page/per_page`, allowlist de colunas e desempate determinístico; não copiar a paginação depreciada implicitamente. Exportação deve respeitar catálogo/colunas autorizadas e, quando server-side, usar contexto/token para reproduzir filtros e ordenação sem confiar em linhas do cliente.

## Botões, ícones e teclas

**Comprovado.** O padrão de consulta é `ErpConsultaOperationBar`; no módulo vizinho aparecem ações declarativas com label, shortcut, variant, ícone, handlers, disabled e processing (`resources/js/Pages/Interlojas/ConsultaRequisicoes/Index.tsx:271-310`). Ele usa Gerar/F6, Gravar/F8 e Imprimir/F7, enquanto cancelar é danger. Há hook próprio de atalhos registrado pela página (`resources/js/Pages/Interlojas/ConsultaRequisicoes/Index.tsx:31`, `:227`) e ícones locais específicos são importados (`resources/js/Pages/Interlojas/ConsultaRequisicoes/Index.tsx:23-26`, `:276-304`). O grid já reserva Alt+G e Ctrl+X (`resources/js/Components/erp/data-grid/ErpGridShell.tsx:34-35`, `:151-165`).

**Recomendação.** Reusar `ErpConsultaOperationBar`, criar ícones no padrão visual existente e um hook de shortcuts testável. Preservar somente as teclas comprovadas no Delphi; bloquear atalhos durante loading/modal/edição e evitar colisões com Alt+G/Ctrl+X. Ação destrutiva deve usar `danger`, confirmação e autorização no backend; disabled no React é apenas feedback de UX.

## Checklist para os prompts futuros

- Migration `acessosmodulos` idempotente sob Interlojas, sem grants automáticos.
- Service + middleware + alias + grupo de rotas com rota canônica única.
- Filial sempre da sessão, existência e `usuariosfiliais` validadas no backend.
- Capability por operação e revalidação em cada endpoint.
- Manifest por descrições literais + `ParameterService::getMany` por filial.
- GET Inertia para composição; JSON/Form Requests para consulta e comandos.
- Catálogos próprios + `ErpPreferenceDataGrid`, exportação, preferências e atalhos padrão.
- Decisão explícita entre paginação client-side limitada e server-side allowlisted.
- `ErpConsultaOperationBar`, ícones, processing/disabled e atalhos compatíveis com o Delphi.
