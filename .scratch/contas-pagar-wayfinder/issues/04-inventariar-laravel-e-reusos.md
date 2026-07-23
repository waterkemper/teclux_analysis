# Inventariar o Laravel atual e os ativos reutilizáveis para Contas a Pagar

Type: task
Status: resolved
Blocked by:

## Question

O que já está implementado no Laravel para Contas a Pagar e capacidades adjacentes, incluindo rotas, menu, páginas, componentes, filtros, grids, lookups, Filiais, `parametros_valor('...')`, Policies/abilities, Autorizações sensíveis, requests, services, repositories, consultas, gravações, auditoria, integrações e testes, e qual é o contrato real de cada ativo reutilizável?

## Answer revisada após atualização do Laravel (2026-07-20)

Esta resposta substitui integralmente a resposta histórica abaixo, produzida sobre uma árvore Laravel desatualizada.

### Resultado executivo corrigido

`CONFIRMADO` — O Laravel atual já possui uma primeira implementação funcional de **Documentos a Pagar**. Ela inclui menu/rotas, ficha Inertia/React, Documento mestre, Duplicatas, cálculo de parcelas, edição de pagamento, Adiantamento, impostos retidos, Documento original, lookups, parâmetros de datas, readonly contextual, Policies básicas, persistência legada e testes. A afirmação anterior de que existiam apenas o hub e Tipos de Pagamento está invalidada.

`DECISÃO` — A matriz deve tratar a implementação atual como baseline a ser corrigido e completado, não propor um módulo do zero. Os ajustes devem aprofundar os services/repositories/componentes existentes e preservar seus contratos compatíveis.

### Superfície implementada

| Capacidade atual | Evidência e contrato | Classificação preliminar |
|---|---|---|
| Menu e rotas | O hub expõe `documentos_pagar`; há rotas de cadastro, lookup de Documento/Fornecedor/Evento/Conta/Banco e store/update/destroy sob `contas_pagar.documentos_pagar.module` | `IMPLEMENTADO` (`app/Http/Controllers/ContasPagar/ContasPagarHubController.php:24-27`; `routes/web.php:2674-2704`) |
| Controller e página | `DocumentosPagarController` monta props/capacidades; `Cadastro.tsx` usa shell ERP, command bar, atalhos, lookup, cabeçalho e abas | `IMPLEMENTADO/PARCIAL` (`app/Http/Controllers/ContasPagar/DocumentosPagarController.php:32-335`; `resources/js/Pages/Cadastros/ContasPagar/DocumentosPagar/Cadastro.tsx:189-1284`) |
| Documento | Cabeçalho com fornecedor/tipo, Emissão, Lançamento, Filial, referência, valor, retenções, previsão, administrador, Evento e regime de caixa | `IMPLEMENTADO` para cadastro básico |
| Duplicatas | Grid, inclusão/edição/exclusão local, cálculo de parcelas, juros/multa/desconto, DDA, Banco, observação e modal de pagamento | `IMPLEMENTADO/PARCIAL` (`DocumentosPagar/components/DuplicatasGrid.tsx`; `DuplicataDialog.tsx`; `gerarDuplicatasParcelas.ts`) |
| Adiantamento | F7/modo dedicado, Tipo de Pagamento, Conta e cheque; grava Documento sem Duplicatas | `IMPLEMENTADO/PARCIAL` (`Cadastro.tsx:530-541,946-1039`; `DocumentoPagCadastroPageService.php:299-340`; testes 818-877) |
| Documento original/impostos gerados | Exibe vínculo e permite abrir origem; lista documentos tributários gerados | `IMPLEMENTADO` para consulta (`Cadastro.tsx:1071-1152`; `DocumentoPagCadastroPageService.php:669-716`) |
| PIS/COFINS | Aba existe, mas contém “Conteúdo reservado para fase futura” | `LACUNA EXPLÍCITA` (`Cadastro.tsx:1154-1162`) |
| Contabilidade, impressão e logs | Não há aba/rotas/services do contexto para lançamentos contábeis, impressão de autorização nem `documentospag_log`/`duplicatas_log` | `NÃO LOCALIZADO` |
| Lote, retorno bancário e cancelamento dedicado | Não foram localizados comandos/endpoints próprios | `NÃO LOCALIZADO` |

### Persistência e regras já implementadas

- `DocumentoPagCadastroPageService` carrega a ficha e coordena store/update/destroy em `DB::transaction`; grava `documentospag`, substitui Duplicatas e sincroniza impostos (`app/Services/ContasPagar/DocumentoPagCadastroPageService.php:122-409`).
- `LegacyDocumentoPagRepository` implementa leitura/gravação, catálogos e lookup paginado; `LegacyDuplicataRepository` implementa CRUD, `hasQuitada` e `replaceAll` (`app/Infrastructure/Persistence/Legacy/ContasPagar/LegacyDocumentoPagRepository.php:23-564`; `LegacyDuplicataRepository.php:24-207`).
- `DocumentoPagEmissaoRetroativaService` usa corretamente `ParameterService` com os textos canônicos `DIASNOTARETROATIVA` e `DATA CONTABIL`, calculando e validando limites de Emissão, Lançamento e Pagamento (`app/Services/ContasPagar/DocumentoPagEmissaoRetroativaService.php:18-358`).
- `DocumentoPagReadonlyService` reproduz parte dos gates de Nota, quitação de impostos, Data Contábil, `AlterarDadosContabeis`, `Pagamento` e Documento originado (`app/Services/ContasPagar/DocumentoPagReadonlyService.php:19-199`).
- `DocumentoPagImpostosRetidosGenerationService` gera/sincroniza documentos de IR/INSS/ISS/PIS/COFINS/CSLL conforme configuração, rateia por Duplicatas e bloqueia alteração/exclusão de imposto quitado (`app/Services/ContasPagar/DocumentoPagImpostosRetidosGenerationService.php:23-373`).
- O parâmetro usado nessa geração é `Gerar pagamentos dos impostos retidos`, além de `FornecedorParaISS`. Isso é adicional aos parâmetros ativos inventariados no Delphi e deverá ser conciliado na matriz, sem confundi-lo com `Geração automática do imposto retido`.

### Autorizações e segurança: achados críticos

`CONFIRMADO` — Há Policy e serviço de autorização para listar/criar/alterar/excluir, mas todos os métodos delegam apenas ao acesso geral do módulo (`app/Policies/ContasPagar/DocumentoPagPolicy.php:17-40`; `app/Services/Authorization/ContasPagarDocumentosPagarAuthorizationService.php:18-36`). Ainda não existem abilities financeiras granulares.

`CRÍTICO` — `StoreDocumentoPagRequest::authorize()` retorna sempre `true`, e `UpdateDocumentoPagRequest` apenas herda esse comportamento (`app/Http/Requests/ContasPagar/StoreDocumentoPagRequest.php:15-18`; `UpdateDocumentoPagRequest.php:7`). Store/update não chamam `authorize()` no controller. Assim, o middleware de módulo é hoje a única barreira dessas mutações.

`CRÍTICO` — Existe operação sensível `ContasPagar/quitar_duplicata` com perfil legado `pagamento` (`config/sensitive-operation-auth.php:285-298`), porém a prova é solicitada apenas no React e o callback abre o modal local (`Cadastro.tsx:577-599`). A prova não integra o comando de gravação. O request aceita diretamente `duplicatas.*.autorizado`, `datapagto`, `valorpagto`, Tipo e Conta; o service persiste esses valores enviados pelo cliente (`StoreDocumentoPagRequest.php:337-351`; `DocumentoPagCadastroPageService.php:592-613`). Portanto a quitação/autorização não está protegida server-side.

`CRÍTICO` — A UI controla o checkbox Administrador, mas o request aceita `administrador` e o service o persiste sem revalidar Administrador/Suporte (`StoreDocumentoPagRequest.php:312`; `DocumentoPagCadastroPageService.php:545`).

`CRÍTICO` — O lookup de Documentos filtra Filiais autorizadas, mas leitura direta por código, criação e alteração não chamam `assertFilialAuthorized`; o request apenas exige que `filialemissao` seja inteiro (`DocumentoPagCadastroPageService.php:122-251,414-424`; `StoreDocumentoPagRequest.php:301`). Também não foi localizado filtro de `administrador` na leitura direta/lookup equivalente ao legado.

`DECISÃO` — Antes de ampliar funcionalidades, o prompt deve exigir: Policies/abilities por ação; autorização nos FormRequests; escopo server-side em lookup, leitura direta e mutações; proteção do flag Administrador; e comando de pagamento dedicado que valide a prova sensível e derive valores/estado no servidor.

### Riscos de integridade do agregado atual

- O update executa `replaceAll` das Duplicatas. Como o payload contém campos de pagamento e autorização, uma alteração comum pode sobrescrever/excluir estado financeiro; não há lock/revisão otimista nem proteção contra duas sessões (`DocumentoPagCadastroPageService.php:348-386`; `LegacyDuplicataRepository.php:95-106`).
- O pagamento atual é uma edição de linha no frontend seguida de update integral do Documento, não um comando transacional dedicado. Não foram localizados movimento bancário, usuário pagador, evidência do autorizador, log ou idempotency key.
- O `nextCodigo()` do Documento e a gravação aparecem separados; a matriz deve verificar a estratégia PostgreSQL e exigir segurança concorrente para Documento e documentos tributários.
- Readonly é calculado no backend e replicado no frontend, mas store/update não reaplicam integralmente os gates contextuais contra o registro persistido. Props e disabled não constituem autorização.
- A geração “No pagto da duplicata” é chamada durante qualquer save do Documento. Embora o service filtre pela ocasião, ela não está acoplada a um comando de quitação autenticado (`DocumentoPagCadastroPageService.php:322-338,370-386`).

### Parâmetros: estado real corrigido

| Texto canônico inventariado | Estado Laravel atual |
|---|---|
| `DIASNOTARETROATIVA` | `IMPLEMENTADO` via `ParameterService` |
| `DATA CONTABIL` | `IMPLEMENTADO` via `ParameterService` |
| `GERARCONTABILIDADE` | `NÃO LOCALIZADO` no contexto |
| `EXERCICIOCONTABILIDADE` | `NÃO LOCALIZADO` |
| `AUTORIZACAO PAGTO AUTOMATICA` | `NÃO LOCALIZADO`; `autorizado` vem do cliente |
| `Início Integração Bancos` | `NÃO LOCALIZADO` |
| `Geração automática do imposto retido` | `DIVERGENTE/NÃO LOCALIZADO`; implementação usa `Gerar pagamentos dos impostos retidos` |
| `Histórico padrão pagto duplicata` | `NÃO LOCALIZADO` |
| `Selecionar somente fornecedores nas contas a pagar` | `NÃO LOCALIZADO`; lookup aceita tipos F/C/L explicitamente |
| `Evento para pagamento de romaneio` | `NÃO LOCALIZADO` no fluxo Documento |

`DECISÃO` — Manter `ParameterService` e introduzir catálogo/manifest tipado de Contas a Pagar. A matriz deverá conciliar as duas chaves de impostos com evidência do banco/legado antes de decidir alias, precedência ou substituição.

### UI e testes reutilizáveis

- A implementação já usa os componentes ERP existentes: shell, command bar, tab bar, feedback, lookup modal, catálogo por código, grids e células. O prompt deve estender essa tela, não recriá-la.
- `DocumentosPagarTest` cobre acesso básico, renderização, CRUD, datas, readonly por Nota, lookups, Duplicatas, Adiantamento e geração de imposto (`tests/Feature/ContasPagar/DocumentosPagarTest.php:14-1160`).
- Há testes frontend para cálculo de parcelas, calendário, valores e datas de pagamento, além de unitários PHP para readonly, retroatividade e vencimento tributário.
- `LACUNA DE TESTE` — Não foram localizados testes de Filial não autorizada, Documento administrador, granularidade de abilities, prova sensível no comando, adulteração de pagamento/autorização, concorrência/idempotência, movimento bancário, Contabilidade, logs, impressão, lote ou retorno.

### Contrato corrigido para a próxima matriz

1. **Preservar e aprofundar:** `DocumentosPagarController`, `DocumentoPagCadastroPageService`, repositories legados, tela `Cadastro.tsx`, grid/modal de Duplicatas, lookups, cálculos, readonly, impostos e testes existentes.
2. **Corrigir prioritariamente:** autorização server-side, Filiais, Documento administrador, comando de pagamento, proteção de Duplicatas pagas/autorizadas, locks/idempotência e auditoria.
3. **Completar:** Contabilidade, PIS/COFINS, movimento bancário, cancelamento/refazer, impressão, logs, lote, retorno, parâmetros restantes e regras tributárias faltantes.
4. **Não duplicar:** hub, cadastro base, catálogo de Tipos de Pagamento, componentes ERP, `ParameterService`, `UserBranchAccessService` e framework de autorização sensível.

## Answer histórica — obsoleta após atualização do Laravel

### Resultado executivo

`CONFIRMADO` — O módulo Laravel de Contas a Pagar ainda não implementa Documentos, Duplicatas, pagamentos, impostos ou Contabilidade. O que existe especificamente no contexto é o hub e o CRUD de Tipos de Pagamento. Há, porém, infraestrutura transversal madura para acesso ao módulo, Filiais autorizadas, parâmetros legados, autenticação de operações sensíveis, grids ERP, lookups, movimentos bancários e auditoria. Ela deve ser composta no novo agregado, não copiada.

`DECISÃO` — O futuro módulo deve ficar em `modules/financeiro/contas-pagar/` na documentação e seguir no código Laravel um limite próprio de Contas a Pagar. O agregado Documento+Duplicatas terá serviço/repository transacional próprio. Ativos adjacentes serão reutilizados pelos contratos descritos abaixo; o CRUD manual de movimentos bancários não será usado como motor de pagamento.

### Implementação específica já existente

| Ativo | Contrato real | Classificação |
|---|---|---|
| Hub `ContasPagarHubController` + `ContasPagarHub.tsx` | Renderiza o hub e oferece somente o item `tipos_pagamento` | `REUSO COM EXTENSÃO`: adicionar Documentos e demais entradas conforme abilities (`app/Http/Controllers/ContasPagar/ContasPagarHubController.php:11-24`; `resources/js/Pages/Cadastros/ContasPagar/ContasPagarHub.tsx:16-47`) |
| Rotas | `/cloud/modulos/contas-a-pagar` usa `contas_pagar.module`; rotas 2672-2690 cobrem apenas listar/cadastrar/localizar/gravar/alterar/excluir Tipo de Pagamento | `LACUNA` para Documento/Duplicata/pagamento (`routes/web.php:597-598,2672-2690`) |
| `TiposPagamentoController`, requests, service e repository | CRUD fino sobre `tipospagamentos`; lookup paginado; normalização de `saidadocaixa`; sequência PostgreSQL `tipospagamentos_proximocodigo` com fallback para testes | `REUSO DIRETO` como catálogo de Tipo de Pagamento, não como modelo do Documento (`app/Services/ContasPagar/TipoPagamentoService.php:13-204`; `app/Infrastructure/Persistence/Legacy/ContasPagar/LegacyTipoPagamentoRepository.php:14-141`) |
| Página `TiposPagamento/Cadastro.tsx` | Shell cadastral, command bar, feedback, localizar por código, lookup em duas colunas, atalhos, foco, dirty guard e capacidades de CRUD | `REUSO DE PADRÃO/COMPONENTES`; a tela mestre-detalhe de Contas a Pagar não cabe nesse formulário simples (`resources/js/Pages/Cadastros/ContasPagar/TiposPagamento/Cadastro.tsx:1-291`) |
| Teste `TiposPagamentoTest` | Cobre acesso, renderização, criação, atualização, lookup e exclusão | `REUSO DE FIXTURES/PADRÃO`; não cobre o domínio financeiro (`tests/Feature/ContasPagar/TiposPagamentoTest.php:26-239`) |

`NÃO LOCALIZADO` — Não foram encontradas rotas, controllers, páginas, requests, services, repositories ou testes Laravel para `documentospag`, `duplicatas`, `documentospag_log` ou `duplicatas_log`.

### Acesso, abilities e escopo de Filial

- `ContasPagarModuleAccessService` autoriza Administrador ou Usuário associado a uma rota habilitada em `acessosmodulos`/`usuariosacessosmodulos`; os middlewares do hub e de Tipos de Pagamento aplicam esse contrato (`app/Services/Authorization/ContasPagarModuleAccessService.php:15-63`). `REUSO DIRETO` para abrir o módulo.
- `ContasPagarTiposPagamentoAuthorizationService` reduz listar/criar/alterar/excluir ao mesmo acesso do módulo (`app/Services/Authorization/ContasPagarTiposPagamentoAuthorizationService.php:12-36`). `DIVERGENTE` para o núcleo financeiro: não representa as abilities independentes identificadas no Delphi.
- `UserBranchAccessService` oferece `hasAccess`, opções/códigos autorizados e `assertFilialAuthorized`, usando `usuariosfiliais`; Administrador recebe todas as Filiais (`app/Services/Branch/UserBranchAccessService.php:17-118`). `REUSO DIRETO` em toda leitura e comando, aplicado separadamente a Filial de Emissão, Contábil e de Pagamento.
- `AuthorizedFiliaisCheckList.tsx` é adequado para filtros multisseleção (`resources/js/Components/erp/consulta/AuthorizedFiliaisCheckList.tsx`). `REUSO COM EXTENSÃO`: campos unitários da ficha precisam de selector/lookup que consuma as mesmas opções autorizadas.

`DECISÃO` — Criar abilities server-side distintas para consultar, manter Documento, manter Duplicata, manter Contabilidade, autorizar, pagar, cancelar, imprimir autorização, consultar Documento administrativo e refazer pagamento. Middleware de módulo não substitui essas regras, e props da UI apenas espelham o resultado.

### Parâmetros do sistema

`ParameterService` é o ponto obrigatório de reuso. `get()` e `getMany()` resolvem o texto canônico por Filial; em PostgreSQL chamam a função legada `parametros_valor`, enquanto o fallback SQLite existe para testes (`app/Services/Parameter/ParameterService.php:13-29,42-103,117-174,188-216,255-285`).

`CONFIRMADO` — Nenhuma utilização atual das chaves canônicas de Contas a Pagar inventariadas no ticket 03 foi localizada no Laravel. Portanto todas são lacunas de integração, não novos parâmetros. Devem ser lidas pelos textos exatos de `clparametrossistema.pas`: `GERARCONTABILIDADE`, `DATA CONTABIL`, `EXERCICIOCONTABILIDADE`, `DIASNOTARETROATIVA`, `AUTORIZACAO PAGTO AUTOMATICA`, `Início Integração Bancos`, `Geração automática do imposto retido`, `Histórico padrão pagto duplicata`, `Selecionar somente fornecedores nas contas a pagar` e `Evento para pagamento de romaneio`.

`DECISÃO` — Criar um manifest/catálogo tipado de parâmetros de Contas a Pagar, seguindo os manifests já existentes em Vendas/Estoque. Ele chama `ParameterService::getMany`, define tipo e fallback seguro e entrega configuração derivada ao frontend. Não chamar a função SQL em controllers/repositories nem persistir o identificador Pascal.

### Autorização sensível reutilizável

- `SensitiveOperationCatalog` valida definições configuradas por módulo/ação e coluna de perfil legado (`app/Services/Authorization/SensitiveOperationCatalog.php:10-53`).
- `SensitiveOperationAuthService` verifica o parâmetro habilitador, operador, Filial, credenciais, perfil, rate limit e auditoria; emite prova contendo operador, autorizador, Filial, módulo, ação e contexto e depois permite validá-la (`app/Services/Authorization/SensitiveOperationAuthService.php:44-242,257-304,388-501,587-605`).
- `ValidatesSensitiveOperationProof`, requests/controller de Authorization, `SensitiveOperationAuthDialog.tsx` e `useSensitiveOperationAuth.ts` fornecem o fluxo backend/frontend. A suíte `tests/Unit/Authorization/SensitiveOperation*Test.php` e `tests/Feature/Authorization/SensitiveOperationAuth*Test.php` cobre esse mecanismo.

`REUSO COM EXTENSÃO` — O catálogo atual não contém operações de Contas a Pagar (`config/sensitive-operation-auth.php:1-283`). Devem ser adicionadas definições para autorizar, efetivar, cancelar, imprimir e refazer pagamento. A prova deve ser vinculada ao identificador e à revisão/assinatura financeira da Duplicata; reuso de contexto entre Duplicatas só pode ocorrer se explicitamente permitido. O evento de autenticação complementa, mas não substitui, o registro durável de autorização/pagamento no domínio.

### UI, grids e lookups

- Reutilizar `ErpCadastroShell`, `ErpCadastroCommandBar`, `ErpCadastroTabBar`, `ErpRegistryOperationFeedback`, validation summary, atalhos e dirty guard para a moldura e estados da ficha.
- Reutilizar `ErpPreferenceDataGrid`, `EditableDataGrid`, células tipadas, toolbar, picker, exportação e preferências para Duplicatas, pagamentos, Contabilidade e logs. O contrato inclui layout/preferências e interação de grid, não regras financeiras (`resources/js/Components/erp/data-grid/`).
- Reutilizar `ErpTwoColumnCatalogLookupModal`/`ErpCadastroLookupModal` em catálogos simples e os padrões de lookup modal de Vendas para pesquisas ricas. `LegacyCatalogReadRepository` existe em `Infrastructure/Persistence/Legacy/User`, logo não deve virar depósito genérico de consultas de Contas a Pagar.
- `ConsultaContratosSupplierFilterLookupService` é evidência de lookup de fornecedor reutilizável como padrão, mas seu contrato é filtro de Contratos. `REUSO COM EXTENSÃO`: criar consulta de fornecedor no contexto financeiro, aplicando o parâmetro “Selecionar somente fornecedores...” e retornando apenas os campos necessários.

`DECISÃO` — Preservar as capacidades e estados do DFM com os componentes ERP atuais, sem copiar seu layout. Grids recebem dados/capacidades do backend; validação e cálculo críticos permanecem no servidor.

### Bancos, persistência, transações e auditoria

- `LegacyMovtosBancosRepository` já fornece lookup/detalhe de conta, saldo, lookup de Eventos, consultas e mutações transacionais de `movtosbancos`/eventos (`app/Infrastructure/Persistence/Legacy/Financeiro/LegacyMovtosBancosRepository.php:29-217,243-316,413-563,563-716,841-966`). É útil para leitura de contas/Eventos e como referência de mapeamento.
- O repository grava movimentos manuais com `origemlancto='B'` (`LegacyMovtosBancosRepository.php:563-597,664-690`). Pagamentos de Contas a Pagar exigem origem e vínculo próprios; chamar esse CRUD produziria semântica errada.
- `MovimentacaoBancariaService` expõe lookup, consulta, gravação, alteração, exclusão, regras de período/transferência e logs; `resolveEditability`/`assertMutavel` protegem movimentos conforme origem (`app/Services/Financeiro/MovimentacaoBancariaService.php:98-174,285-366,443-607,613-655,672-936`). `REUSO DIRETO` somente para capacidades de leitura claramente compatíveis; `NÃO REUTILIZAR` store/update/delete no comando de pagamento.
- Há auditoria de movimentos bancários via `LegacyMovtosBancosAuditLogRepository` e endpoints do service (`MovimentacaoBancariaService.php:613-636`) e auditoria própria da autorização sensível. `LACUNA`: repositories/presenters/endpoints para logs de Documento e Duplicata não foram localizados.

`RISCO` — As mutações bancárias usam `DB::transaction`, mas a próxima sequência é calculada separadamente (`LegacyMovtosBancosRepository.php:386-405,563-565`). Isso não prova segurança concorrente para pagamentos. O repository do agregado deve coordenar Documento, Duplicata, impostos, Contabilidade, movimento bancário e logs na mesma transação e adotar lock/identificador idempotente apropriado, inclusive em lote e retorno bancário.

### Contrato de implementação resultante

1. **Reuso direto:** acesso ao módulo, `UserBranchAccessService`, `ParameterService`, catálogo de Tipo de Pagamento, componentes ERP e partes estritamente de leitura dos catálogos financeiros.
2. **Reuso com extensão:** hub/menu, abilities, manifest de parâmetros, operações sensíveis, selectors de Filial/Fornecedor, grids mestre-detalhe e visualização de auditoria.
3. **Novo no contexto:** agregado Documento+Duplicatas, requests/DTOs, serviço de aplicação, repository transacional, policies contextuais, pagamentos/cancelamentos/lote/retorno, impostos, Contabilidade, impressão e logs.
4. **Proibido por incompatibilidade:** usar apenas middleware/visibilidade como autorização; chamar CRUD manual de movimento bancário como pagamento; confiar em Filial, valores, autorização ou estado enviados pelo cliente; consultar `parametros_valor` fora de `ParameterService`; duplicar componentes já existentes.
5. **Testes mínimos:** feature tests por ability e Filial; contratos de parâmetros e fallbacks; integração transacional/idempotente de cada fluxo; concorrência; invalidação da autorização após mudança financeira; regressão dos ativos compartilhados; componentes para estados/atalhos/grids; auditoria com operador e autorizador distintos.
