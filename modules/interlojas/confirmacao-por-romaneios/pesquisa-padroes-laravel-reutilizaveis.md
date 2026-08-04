# Auditoria — padrões Laravel reutilizáveis para Confirmação por Romaneios

## Escopo e fontes

Esta pesquisa cobre somente seams Laravel reutilizáveis para a futura folha **Interlojas → Confirmação por Romaneios**: shell, trilha, F9, command bar, grids/exportação/preferências, chave NF-e, Parâmetros do Sistema, Filial/Permissão/Autorização, Relatórios, schema e cancelamento real de F6. Não implementa o módulo, não altera o ticket e não executa `/speckit.specify`.

Fontes primárias usadas:

- Laravel atual em `laravel/backend`, incluindo a implementação de **Cadastro de Romaneios**, **Confirmação por Notas**, **Consulta de Transferências** e **Consulta de Requisições**.
- Artefatos existentes em `modules/entregas/cadastro-romaneios/` e `modules/interlojas/confirmacao-por-notas/`.
- Delphi pelo junction `delphi/`, que resolve para `C:\projetos.vcl` (o caminho digitado `C:\prjetos.vcl` não existe): `delphi/apps/interlojas/dmconfirmarromaneiostransferencia.pas/.dfm`, `fmconfirmarromaneiostransferencia.pas/.dfm`, `delphi/biblio/clparametrossistema.pas` e o menu em `delphi/apps/tecsoft/fmtecsoft.dfm`.

As classificações abaixo são do mapa Wayfinder: `CONFIRMADO`, `INFERIDO`, `DIVERGENTE`, `POSSÍVEL BUG ATUAL`, `NÃO LOCALIZADO` e `DECISÃO NOVA`.

## Resultado executivo

**CONFIRMADO:** o Laravel já oferece a plataforma necessária. A nova tela deve compor adapters de domínio sobre `AppLayout`/`ErpCadastroShell` ou `ErpConsultaOperationBar`, `ErpCadastroLookupModal`, `ErpPreferenceDataGrid`, `GridExportOrchestrator`, `ParameterService`, `BranchContextService`, `UserBranchAccessService`, `NfeAccessKey` e o runner PostgreSQL cancelável. Não criar um shell, grid, máscara ou modal paralelo.

**DIVERGENTE:** a pesquisa anterior de Confirmação por Notas dizia que não havia componente NF-e. Isso ficou obsoleto: o checkout atual já contém `NfeAccessKey`, `NfeAccessKeyValid`, `NfeAccessKeyInput` e `NfeAccessKeyText` (`laravel/backend/app/Domain/Fiscal/NfeAccessKey.php:7-38`, `laravel/backend/app/Rules/NfeAccessKeyValid.php:13-40`, `laravel/backend/resources/js/Components/erp/fiscal/NfeAccessKeyInput.tsx:40-145`). O prompt deve tratar esses componentes como autoridade compartilhada.

**POSSÍVEL BUG ATUAL no precedente:** Confirmação por Notas exibe Cancelar quando `busy` (`laravel/backend/resources/js/Pages/Interlojas/ConfirmacaoPorNotas/Index.tsx:288-332`), mas `useConfirmacaoPorNotasConsulta` instancia `useErpGerarRequest()` sem URL de cancelamento (`laravel/backend/resources/js/Pages/Interlojas/ConfirmacaoPorNotas/useConfirmacaoPorNotasConsulta.ts:15-22`) e `routes()` não retorna `cancelar-gerar` (`laravel/backend/app/Http/Controllers/Interlojas/ConfirmacaoPorNotasController.php:268-279`). Portanto, `cancelGerar()` só aborta localmente nessa tela; não é evidência de `pg_cancel_backend()`.

## 1. Shell, breadcrumb, F9 e command bar

### Shell e trilha

**CONFIRMADO:** `AppLayout` recebe `breadcrumbs` como itens `{label, href?, preserveScroll?, preserveState?}` e renderiza a trilha responsiva com `aria-label="Trilha"` (`laravel/backend/resources/js/Layouts/AppLayout.tsx:24-73`, `:984-1030`). O Cadastro de Romaneios usa `[Entregas, Cadastro de Romaneios]` (`laravel/backend/resources/js/Pages/Entregas/Romaneios/Cadastro.tsx:421-431`); Confirmação por Notas usa `[Interlojas, Confirmação por Notas]` (`laravel/backend/resources/js/Pages/Interlojas/ConfirmacaoPorNotas/Index.tsx:278-285`). A nova tela deve usar `[Interlojas, Confirmação por Romaneios]`, com rota no segundo item somente se houver destino de volta comprovado.

**CONFIRMADO:** para superfície de consulta, o precedente é conteúdo dentro de `AppLayout` + `ErpConsultaOperationBar`; para superfície de cadastro, `ErpCadastroShell` mantém a command bar e o conteúdo em regiões próprias (`laravel/backend/resources/js/Components/erp/cadastro/ErpCadastroShell.tsx:7-53`). A tela Delphi é uma consulta/operação de seleção, não um Cadastro: o DFM tem duas grades e filtros, sem padrão de edição de chave primária/situação (`delphi/apps/interlojas/fmconfirmarromaneiostransferencia.dfm:143-149`, `:727-748`). O padrão de campo de chave primária/situação do Cadastro de Requisições só deve ser aplicado se uma decisão posterior transformar a folha em Cadastro; não aplicar por inferência.

### F9 e modal de pesquisa

**CONFIRMADO:** `ErpCadastroCommandBar` reserva `Localizar (F9)` e `useRegistryCadastroShortcuts` implementa F3/F8/F6/F9, com captura, `preventDefault`, guarda contra modificadores e estados disabled (`laravel/backend/resources/js/Components/erp/cadastro/ErpCadastroCommandBar.tsx:84-118`, `:230-237`; `laravel/backend/resources/js/Components/erp/cadastro/useRegistryCadastroShortcuts.ts:3-27`, `:38-70`).

**CONFIRMADO:** `ErpCadastroLookupModal` é o contrato visual/ajudável existente: dialog modal acessível, foco inicial, Escape, busca paginada, ordenação por cabeçalho, navegação de coluna/linha e seleção por Enter (`laravel/backend/resources/js/Components/erp/cadastro/ErpCadastroLookupModal.tsx:120-202`, `:204-210`, `:319-337`, `:471-490`). Ele é implementado para Usuários; não é um lookup genérico para Romaneio.

**DIVERGENTE / DECISÃO NOVA:** no Delphi não há tecla F9 comprovada. A tela oferece Enter na chave NF-e e no número/filial para localizar (`delphi/apps/interlojas/fmconfirmarromaneiostransferencia.pas:210-224`, `:308-350`), enquanto o DFM chama os painéis de `Localizar CHAVE NFE/VOLUME` e `Localizar NÚMERO NF` (`delphi/apps/interlojas/fmconfirmarromaneiostransferencia.dfm:1067-1146`). A nova especificação deve manter os campos de busca locais quando úteis, mas qualquer pesquisa F9 deve abrir o modal padrão do sistema, com endpoint de lookup próprio, paginação, ordenação allowlist e revalidação de Filial/Permissão no servidor. Não inventar F9 como se fosse um atalho Delphi.

## 2. Operações, ícones e atalhos

**CONFIRMADO:** `ErpConsultaOperationBar` aceita label, ícone, variant, disabled, processing, processingLabel e shortcut; o texto e `aria-label` são derivados do mesmo contrato (`laravel/backend/resources/js/Components/erp/consulta/ErpConsultaOperationBar.tsx:5-18`, `:37-67`, `:125-164`). O padrão de Confirmação por Notas mostra Gerar/F6, Confirmar/F8 e Cancelar danger (`laravel/backend/resources/js/Pages/Interlojas/ConfirmacaoPorNotas/Index.tsx:288-323`).

**CONFIRMADO na fonte Delphi:** Gerar é F6 e Confirmar é F5, não F8 (`delphi/apps/interlojas/fmconfirmarromaneiostransferencia.pas:210-215`; `delphi/apps/interlojas/fmconfirmarromaneiostransferencia.dfm:28-74`). A confirmação só habilita quando há selecionados e exige autorização conforme `User.TransferenciaPorItem` (`delphi/apps/interlojas/fmconfirmarromaneiostransferencia.pas:99-106`, `:232-248`). Conferir Volumes, Conferir Produtos e Visualizar Conferência também são ações distintas (`delphi/apps/interlojas/fmconfirmarromaneiostransferencia.dfm:442-522`, `:869-938`).

**DECISÃO NOVA para o prompt:** preservar as teclas apenas quando não colidirem com o shell atual: Gerar/F6, Confirmar/F5, seleção por Ctrl+Espaço e Enter para localizar podem ser mapeados; não renomear Confirmar para F8 sem decisão explícita de UX. Cada botão e tecla deve chamar o mesmo handler, bloquear durante modal/loading, renderizar ícone/tooltip/`aria-label` e revalidar a autoridade no backend. O Cancelar deve ser `danger`, aparecer antes do primeiro `await` e não depender do aborto visual do navegador.

## 3. Grids, ordenação, personalização e exportação

**CONFIRMADO:** `ErpPreferenceDataGrid` compõe `DataGrid`/`EditableDataGrid`, catálogo, layout persistido e exportação Excel por contexto ou local (`laravel/backend/resources/js/Components/erp/data-grid/ErpPreferenceDataGrid.tsx:9-31`, `:76-114`). `ErpGridShell` fornece seleção de Campos da Grade, preferências, importar/exportar configuração, aplicação global para Administrador e Exportar para Excel; Ctrl+X é reservado para exportação (`laravel/backend/resources/js/Components/erp/data-grid/ErpGridShell.tsx:55-113`, `:151-173`, `:251-318`).

**CONFIRMADO:** os catálogos de Confirmação por Notas são exemplos diretos de catálogo PHP com `screenKey`, `gridId` e colunas exportáveis (`laravel/backend/app/Support/ErpGrid/Catalogs/ConfirmacaoPorNotasNotasGridCatalog.php:10-66`, `laravel/backend/app/Support/ErpGrid/Catalogs/ConfirmacaoPorNotasProdutosGridCatalog.php:10-79`). O catálogo é identidade/autorização das colunas; a Preferência de Grid é somente escolha de apresentação do Usuário.

**CONFIRMADO:** `GridExportOrchestrator` gera token de contexto, vincula-o ao Usuário e escolhe sync até 5.000 registros ou async acima disso (`laravel/backend/app/Services/Erp/GridExportOrchestrator.php:9-47`). O export deve reexecutar leitura autorizada a partir do contexto congelado; nunca aceitar `rows`, SQL, colunas arbitrárias, filtros alterados ou IDs de Filial vindos da UI.

**DECISÃO NOVA:** criar catálogos próprios para, no mínimo, resultados de romaneios, produtos/documentos, romaneios de passagem e eventual histórico/conferência. Resultados grandes devem usar paginação/ordenação server-side, allowlist de coluna e desempate determinístico. A confirmação em lote deve enviar IDs canônicos, carregar todos com uma consulta set-based e indexar os resultados em memória; nenhum `find()`/query por linha.

## 4. Chave NF-e e filtros

**CONFIRMADO:** `NfeAccessKey` é value object readonly; a validação exige 44 dígitos e DV módulo 11 (`laravel/backend/app/Domain/Fiscal/NfeAccessKey.php:7-38`, `laravel/backend/app/Rules/NfeAccessKeyValid.php:13-40`). `NfeAccessKeyInput` normaliza, formata só para apresentação, preserva cursor/colar, usa `inputMode="numeric"` e fornece ajuda/erro acessível (`laravel/backend/resources/js/Components/erp/fiscal/NfeAccessKeyInput.tsx:60-122`, `:129-145`); `NfeAccessKeyText` é a apresentação readonly (`laravel/backend/resources/js/Components/erp/fiscal/NfeAccessKeyText.tsx:1-29`). Reusar isso no restante do sistema; não criar regex, máscara ou regra privada.

**CONFIRMADO na tela Delphi:** a máscara antiga é 44 dígitos em grupos (`delphi/apps/interlojas/fmconfirmarromaneiostransferencia.dfm:1075-1085`, `delphi/apps/interlojas/dmconfirmarromaneiostransferencia.dfm:1628-1635`). A busca usa `somentenumero()` e `Locate('chv_nfe', ...)`, além de busca por série/número (`delphi/apps/interlojas/fmconfirmarromaneiostransferencia.pas:308-350`). No Laravel, o valor canônico deve ser igual ao value object e a busca deve reaplicar elegibilidade, Filial e snapshot de filtros no servidor.

**CONFIRMADO / POSSÍVEL BUG LEGADO:** a query principal usa `df.chv_nfe`, `serie`, `numero`, `filialemissao`, `romaneio`, volumes, lidos e situações; filtra cliente/filial, tipo de cliente `L`, CFOPs/transferência, situação fiscal `N`, situações de romaneio e `not exists` de nota já referenciada (`delphi/apps/interlojas/dmconfirmarromaneiostransferencia.dfm:75-179`). Há comentário explícito de regra faltante para impedir notas já casadas saída/entrada (`:107-109`); não copiar o comentário como regra resolvida: o prompt deve decidir e testar essa elegibilidade no domínio Laravel.

## 5. Parâmetros do Sistema, Filial, Permissão e Autorização

### Parâmetros

**CONFIRMADO:** `ParameterService::getMany` é o seam atual para `parametros_valor`: no PostgreSQL faz um lote baseado em `VALUES`, com memória por request, e não deve ser substituído por chamadas em loop (`laravel/backend/app/Services/Parameter/ParameterService.php:13-25`, `:117-170`).

**CONFIRMADO na fonte Delphi:** a tela usa `USAR GRADES PRODUTOS`, `Máscara Quantidade`, `DATA CONTABIL` e `Evento Pagto Duplicata Transferência entre empresa` através de `ParSistema` (`delphi/apps/interlojas/fmconfirmarromaneiostransferencia.pas:127-137`, `:189-205`; `delphi/apps/interlojas/dmconfirmarromaneiostransferencia.pas:965-1000`). Os literais estão em `clparametrossistema.pas:2075`, `:2128-2132`, `:2230`; `DataContabil` e `DiasNotaRetroativa` aparecem nas propriedades e constantes (`clparametrossistema.pas:1212-1213`, `:1265`, `:2128`). `NDiasLimiteEmissao`/`NDiasLimiteData` é herdado ou calculado fora da unidade: tratar seu vínculo exato com `DIASNOTARETROATIVA` como `INFERIDO` até confirmar a implementação de `TdtmBasico`.

**DECISÃO NOVA:** criar manifest tipado específico, preservar os literais legados e resolver todos os parâmetros necessários com uma única chamada `getMany(..., $filialEfetiva)`. Converter booleanos, datas, inteiros e ausência/defaults no backend; não enviar autoridade de parâmetro como verdade do browser.

### Filial e Permissão

**CONFIRMADO:** `BranchContextService` lê a Filial ativa exclusivamente da sessão (`laravel/backend/app/Services/Branch/BranchContextService.php:11-23`); `UserBranchAccessService` resolve o escopo de `usuariosfiliais`, usa `whereIn`, memoiza por request/cache e valida uma ou todas as Filiais (`laravel/backend/app/Services/Branch/UserBranchAccessService.php:27-70`, `:85-155`). Toda leitura de romaneios, NF, lookup, exportação, conferência e comando deve reaplicar esse escopo.

**CONFIRMADO:** o padrão de menu cria folha sob `cloud.modulo.interlojas`, por rota, sem replicar grants automaticamente (`laravel/backend/database/migrations/2026_07_30_295000_acessosmodulos_consulta_requisicoes.php:10-20`, `:40-69`). O serviço de módulo do paralelo exige Administrador ou relação explícita em `usuariosacessosmodulos` (`laravel/backend/app/Services/Authorization/InterlojasConfirmacaoPorNotasModuleAccessService.php:13-40`) e o middleware retorna login/403 (`laravel/backend/app/Http/Middleware/EnsureInterlojasConfirmacaoPorNotasModuleAccess.php:21-32`). A fonte Delphi confirma o menu `InterLojas → Confirmação por Romaneios` (`delphi/apps/tecsoft/fmtecsoft.dfm:828-860`). Criar rota/capability/middleware próprios; não inventar código numérico e não conceder acesso por herança.

### Autoridade contextual

**CONFIRMADO:** Confirmação por Notas já compõe `ConfirmacaoPorNotasOperacaoAuthorizationService`, perfil `confirmartransfitem`, challenge de uso curto e auditoria (`laravel/backend/app/Services/Interlojas/ConfirmacaoPorNotas/ConfirmacaoPorNotasOperacaoAuthorizationService.php:17-24`, `:40-142`). O Laravel também possui `SensitiveOperationAuthService`/`SensitiveOperationProofService`. A nova tela deve reutilizar o protocolo, mas definir operação, payload/IDs, Filial, revisão e auditoria próprios. `User.TransferenciaPorItem` é autoridade de Permissão, não Parâmetro do Sistema (`delphi/apps/interlojas/fmconfirmarromaneiostransferencia.pas:241-247`).

## 6. SQL, N+1 e joins

**CONFIRMADO no Delphi:** a tela faz consulta de romaneios com subconsultas correlacionadas para volumes/conferência, funções de situação, joins obrigatórios entre `romaneios`, `romaneiosnotas`, `dadosfiscais`, `notas` e `filiais`, e agregações de `produtosdadosfiscais`/`pedidosfiliais` (`delphi/apps/interlojas/dmconfirmarromaneiostransferencia.dfm:26-179`). O detalhe de produtos é outra query por `dadofiscal`, com subconsultas de grades (`:289-321`). `AfterScroll` refaz essa query por linha (`delphi/apps/interlojas/dmconfirmarromaneiostransferencia.pas:897-902`), e confirmação percorre selecionados fazendo `ReFazConsulta` de dados fiscais, produtos, vencimentos e pedidos (`:460-534`).

**DECISÃO NOVA / regra obrigatória:** no Laravel, coletar todos os `dadofiscal`/romaneios selecionados, deduplicar, carregar cada conjunto uma única vez com `whereIn`, `= ANY(?::integer[])`, `unnest` ou `VALUES` conforme a cardinalidade e indexar por chave simples/composta. Arrays vazios devem ter semântica explícita. Proibir query dentro de `foreach`, eager loading que esconda N+1 e subconsulta repetida por linha.

**CONFIRMADO pelo snapshot:** `modules/entregas/cadastro-romaneios/schema/postgresql-authoritative-2026-08-01.json` e seu README registram PK/FK, nulabilidade, índices e funções de 26 relações; `romaneiosnotas` tem FKs obrigatórias para `romaneios`/`dadosfiscais` e esses caminhos são `INNER JOIN`, enquanto relações anuláveis como frete/motivo podem ser `LEFT JOIN` (`modules/entregas/cadastro-romaneios/schema/README.md:20-45`). Portanto, todo prompt deve escolher join pela nulabilidade/cardinalidade do schema, nunca pela conveniência do Query Builder: campo envolvido NOT NULL e relação necessária = `INNER JOIN`; `LEFT JOIN` só para relação opcional deliberada.

**LACUNA DE SCHEMA:** o snapshot do Cadastro cobre a leitura principal, mas o fluxo de confirmação também alcança `notaspag`, `produtosnotaspag`, `estoques`, `movimentos`, vencimentos/naturezas e funções financeiras. Antes do SQL final, ampliar o snapshot datado com todas as relações/funções efetivamente lidas/escritas por esta tela; não sobrescrever o snapshot existente. O schema gate deve ficar em testes/CI, não em `Schema::hasTable`, `information_schema` ou `pg_catalog` no caminho de negócio (`laravel/backend/tests/Feature/Entregas/Romaneios/CadastroRomaneiosSchemaGatePostgresTest.php:15-72`; `laravel/specs/305-cadastro-romaneios-foundation/spec.md:287`).

## 7. F6 e cancelamento real PostgreSQL

**CONFIRMADO:** o seam completo é `useErpGerarRequest` → `X-Trace-Id`/AbortController → endpoint `cancelar-gerar` → `CancelsPgsqlGerarQuery` → `PgsqlGerarQueryCancelService`. O frontend envia o POST de cancelamento antes do abort local (`laravel/backend/resources/js/hooks/useErpGerarRequest.ts:25-53`); o runner envolve todo o SQL, aplica `statement_timeout`, registra `pg_backend_pid()` no Redis e remove o registro ao terminar (`laravel/backend/app/Support/Database/PgsqlGerarQueryRunner.php:10-37`; `laravel/backend/app/Support/Database/PgsqlCancellableStatement.php:20-51`; `laravel/backend/app/Support/Database/PgsqlQueryCancelRegistry.php:15-50`). O serviço executa `SELECT pg_cancel_backend(?)` com ownership por Usuário + trace (`laravel/backend/app/Support/Database/PgsqlGerarQueryCancelService.php:10-67`).

**CONFIRMADO:** Cadastro de Romaneios já tem teste PostgreSQL que executa `pg_sleep`, registra trace em processo separado e comprova que a query termina após o cancelamento (`laravel/backend/tests/Feature/Entregas/Romaneios/InclusaoMultipla/InclusaoMultiplaCancelamentoPostgresTest.php:73-106`, `:137-157`; `laravel/backend/tests/Support/Scripts/pgsql_cancellable_sleep.php:19-30`). Esse é o precedente para a nova tela. A consulta inteira — count, base, enriquecimento e exportação síncrona quando aplicável — deve estar dentro de um único `PgsqlGerarQueryRunner::run` ou, se medição exigir fila, no protocolo heavy-report com cancelamento do worker e da conexão.

**POSSÍVEL BUG ATUAL já identificado:** não copiar o padrão incompleto de Confirmação por Notas; adicionar `cancelar-gerar` às rotas/props, passar URL ao hook, usar `screenKey` exclusivo e manter resultado anterior ao cancelar. O botão deve ficar visível imediatamente após `setBusy(true)`, antes do primeiro `await`.

**TESTES — restrição explícita:** preservar testes de contrato, repositório, PostgreSQL autoritativo, `EXPLAIN`, query budget e cancelamento observável. Não adicionar testes de driver e não adicionar testes de `hashtablefs`; não transformar o requisito de PostgreSQL real em matriz de drivers. Os testes de aceitação do novo módulo devem seguir o contrato de ambiente PostgreSQL real já usado pelos artefatos de Romaneios, sem testar a implementação do driver.

## 8. Relatórios e lacunas finais

**CONFIRMADO:** a infraestrutura de Relatório já oferece shell institucional, Filial, logo, CSS padrão, sanitização e auditoria (`laravel/backend/app/Services/Reports/ErpReportLayoutService.php:12-121`; `FilialInstitutionalReportService.php:14-72`; `ReportLogoService.php:13-48`; `ImpressaoAuditService.php:11-64`). Consulta de Requisições comprova o padrão de endpoint que relê filtros/IDs no servidor e gera PDF via template/gerador, sem aceitar HTML/linhas do cliente (`laravel/docs/architecture/interlojas-consulta-requisicoes.md`, seção “Fatía 04 — Relatório PDF F12”).

**NÃO LOCALIZADO:** não foi encontrado template/serviço de Relatório específico da Confirmação por Romaneios nem equivalente Delphi de FastReport nessa unidade. A especificação deve decidir se haverá Relatório mestre–documentos, produtos/volumes e/ou conferência; datasets devem ser reconsultados server-side, autorizados pela Filial, agrupados em memória sem N+1 e auditados. Não usar impressão do browser como substituto automático de Documento Lógico de Impressão.

## Gaps que o próximo conjunto de prompts deve fechar

1. Confirmar semântica de elegibilidade, romaneio de passagem, situação de volumes e nota já casada; o SQL Delphi contém comentário de regra faltante.
2. Definir filtros canônicos, limites de período (`DATA CONTABIL`/`DIASNOTARETROATIVA`), estados mutuamente exclusivos e radio buttons onde a escolha for exclusiva.
3. Criar manifest de Parâmetros, catálogo(s) de Grid, endpoint/modal F9, `screenKey`, export dataset e rota de `cancelar-gerar` próprios.
4. Ampliar e versionar snapshot/schema para todas as tabelas/funções do caminho de confirmação e resolver todos os joins com nulabilidade autoritativa.
5. Definir o comando transacional de confirmação, locks em ordem determinística, idempotência, auditoria do Autorizador e efeitos financeiros/outbox; a consulta não deve misturar leitura com persistência por linha.
6. Especificar Relatórios, acessibilidade, teclas não conflitantes e os testes PostgreSQL reais, mantendo a proibição de testes de driver e `hashtablefs`.

**Conclusão:** os seams Laravel são reutilizáveis, mas a Confirmação por Romaneios não deve copiar a tela de Confirmação por Notas literalmente. O principal cuidado é corrigir a fronteira de cancelamento real, transformar as queries Delphi por linha em leitura set-based, usar o snapshot autoritativo para INNER/LEFT JOIN e fechar as lacunas de schema, elegibilidade e comando transacional antes de gerar os prompts finais.
