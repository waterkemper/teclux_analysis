# Pesquisa: padrões Laravel e seam compartilhado de chave NF-e

## Escopo

Pesquisa no código-fonte primário de `laravel/backend`. **Comprovado** descreve contratos existentes; **Recomendação** propõe sua aplicação a **Interlojas → Confirmação por Notas**. Não foi localizado componente, validador PHP, value object ou utilitário TypeScript dedicado à chave de acesso NF-e.

## Acesso, filial e parâmetros

**Comprovado.** A migration vizinha cria folha Cloud sob `cloud.modulo.interlojas`, atualiza por rota ou calcula `ordem`/`codigo`, sem replicar grants (`laravel/backend/database/migrations/2026_07_30_295000_acessosmodulos_consulta_requisicoes.php:10-20`, `:22-70`). Não administrador exige `usuariosacessosmodulos(usuario, acesso)`; administrador passa diretamente (`laravel/backend/app/Services/Authorization/InterlojasConsultaRequisicoesModuleAccessService.php:15-39`). A filial vem exclusivamente da sessão (`laravel/backend/app/Services/Branch/BranchContextService.php:15-35`); o escopo deriva de `usuariosfiliais`, carrega opções com `whereIn` e memoiza/cacheia (`laravel/backend/app/Services/Branch/UserBranchAccessService.php:29-34`, `:42-75`, `:85-128`). `ParameterService::getMany` executa no PostgreSQL um único `SELECT ... FROM (VALUES ...)` com `parametros_valor` e memória por request (`laravel/backend/app/Services/Parameter/ParameterService.php:13-28`, `:113-174`).

**Recomendação.** Criar folha própria **Confirmação por Notas** sob `cloud.modulo.interlojas`, rota canônica idêntica à nomeada, sem grant automático; middleware no grupo inteiro e revalidação por comando. Nunca aceitar filial/capability do browser. Declarar manifest com os literais legados e obter todos por `getMany($nomes, $filialAtiva)`, normalizando tipos/defaults no backend.

## Inertia, grid, exportação e atalhos

**Comprovado.** O paralelo usa GET Inertia para composição e JSON separado para consultas/operações (`laravel/backend/app/Http/Controllers/Interlojas/ConsultaRequisicoesController.php:57-94`). `ErpPreferenceDataGrid` agrega grid, catálogo, preferências, exportação e atalhos (`laravel/backend/resources/js/Components/erp/data-grid/ErpPreferenceDataGrid.tsx:9-31`, `:74-127`). `ErpGridShell` oferece campos, importação/exportação de configuração, aplicação global e Excel; reserva Alt+G/Ctrl+X (`laravel/backend/resources/js/Components/erp/data-grid/ErpGridShell.tsx:74-88`, `:141-173`, `:250-318`). `ErpConsultaOperationBar` recebe label, shortcut, variant, ícone, `disabled` e `processing` (`laravel/backend/resources/js/Pages/Interlojas/ConsultaRequisicoes/Index.tsx:271-310`).

**Recomendação.** GET Inertia leve; endpoints intencionais e Form Requests allowlist. Catálogo versionado e `ErpPreferenceDataGrid`, preservando ordenação, personalização e exportação. Operation bar com ícones e somente atalhos comprovados no Delphi, bloqueados em loading/modal/edição e sem colisão com Alt+G/Ctrl+X.

## Transação, locks, idempotência e outbox

**Comprovado.** Serviços Interlojas executam comandos em `DB::transaction` e aplicam `DatabaseAuditContext` nela (`laravel/backend/app/Services/Interlojas/RequisicaoExposicao/RequisicaoExposicaoGravarService.php:201-213`; `laravel/backend/app/Services/Interlojas/ConsultaRequisicoes/ConsultaRequisicoesAlterarPedidaService.php:106-118`). Pedidos mutáveis usam `lockForUpdate` (`laravel/backend/app/Infrastructure/Persistence/Legacy/Estoque/LegacyPedidosFiliaisRepository.php:242`). Há guard crash-safe de idempotência com begin/commit na mesma transação, hash de payload e lock (`laravel/backend/app/Application/ContasPagar/ContasPagarIdempotencyGuard.php:14-23`, `:56-91`, `:198-233`). Há outbox e publicação após commit (`laravel/backend/app/Application/Vendas/Contratos/Cadastro/Commands/ExecuteContratoEstoqueReservaCommand.php:50-52`, `:701-724`; `laravel/backend/app/Console/Commands/OperationalSchedulerTickCommand.php:103-113`).

**Recomendação.** Uma confirmação = um application command e uma transação: revalidar acesso/filial/parâmetros; reservar idempotência com hash; bloquear em ordem determinística pedidos/estoque/documentos; persistir nota, itens, movimentos, financeiro e situações; auditar e concluir. Mesma chave+payload devolve o resultado; chave igual/payload diferente conflita. Efeitos externos usam outbox transacional e despacho após commit; não criar outbox se tudo ficar no mesmo banco.

## N+1 e batching

**Comprovado.** O projeto usa `whereIn` para coleções autorizadas (`laravel/backend/app/Services/Branch/UserBranchAccessService.php:49-68`) e múltiplas filiais de pedidos (`laravel/backend/app/Infrastructure/Persistence/Legacy/Estoque/LegacyPedidosFiliaisRepository.php:142`). `getMany` evita consulta por parâmetro.

**Recomendação.** Proibir queries em loops. Normalizar/deduplicar IDs e carregar cada conjunto uma vez com `whereIn`; no PostgreSQL usar `= ANY(?::<tipo>[])` quando adequado. Indexar em memória por chave simples/composta; usar insert/upsert em lote quando regras/triggers permitirem e locks em ordem estável.

## Chave NF-e: estado atual e seam compartilhado

**Comprovado.** A ocorrência fiscal mais próxima trata `n.chnfe` como texto, apenas verifica comprimento 44 para extrair série/número e devolve a chave sem normalização/DV (`laravel/backend/app/Infrastructure/Persistence/Legacy/Estoque/LegacyConsultaEstoquesDetalheRepository.php:306-330`, `:405-460`). O catálogo só expõe `chave` como texto (`laravel/backend/app/Support/ErpGrid/Catalogs/ConsultaComprasNfePendentesGridCatalog.php:10-39`). Busca em `app`, `resources/js` e `tests` não encontrou contrato específico. O `Input` compartilhado já associa ajuda/erro por `aria-describedby` e marca `aria-invalid` (`laravel/backend/resources/js/Components/Input.tsx:8-24`, `:60-69`). Há precedente local de normalização/máscara de dígitos para CEP, mas específico de tela (`laravel/backend/resources/js/Pages/Cadastros/Users/UsersEnderecoSection.tsx:37-51`, `:129-131`).

**Recomendação.**

- Backend: value object imutável `NfeAccessKey`; normaliza texto para dígitos, exige exatamente 44 e valida DV módulo 11. Expõe valor canônico; Rule/Form Request converte falhas em 422. Persistência/queries recebem só os 44 dígitos.
- Frontend: utilitários puros `normalizeNfeAccessKey`/`formatNfeAccessKey` e `NfeAccessKeyInput` sobre `Input`. Estado semântico = 44 dígitos; máscara só visual. Aceitar colagem formatada, remover não dígitos e limitar a 44. Não usar `type=number`.
- Máscara sugerida: 11 grupos de quatro dígitos. Usar `inputMode=numeric`, `autoComplete=off`, label visível, ajuda “44 dígitos”, `aria-invalid`/`aria-describedby` e erro textual. Não anunciar comprimento inválido a cada tecla antes de blur/submit; preservar cursor e colagem.
- Frontend dá feedback; backend/value object é autoridade. Testar normalização, zeros iniciais, colagem, 43/45 dígitos, DV válido/inválido, cursor e ARIA.
- Adotar primeiro nesta tela e migrar consumidores gradualmente; não alterar automaticamente grids somente leitura.

## Contrato para os prompts

- acesso próprio sob Interlojas, filial/capabilities revalidadas e parâmetros por manifest+`getMany`;
- GET Inertia leve, JSON intencional, `ErpPreferenceDataGrid` e operation bar padrão;
- command auditado/transacional, locks determinísticos, idempotência e outbox apenas para efeitos externos;
- zero queries em loops: `whereIn`/`ANY(array)` e indexação em memória;
- `NfeAccessKey` + `NfeAccessKeyInput` compartilhados, 44 dígitos, DV módulo 11 e acessibilidade testada.
