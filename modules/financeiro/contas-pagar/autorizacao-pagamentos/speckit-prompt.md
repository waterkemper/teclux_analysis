# Prompt `/speckit.specify` — Autorização de Pagamentos

```text
/speckit.specify

Crie uma especificação implementável e verificável para concluir o módulo **Financeiro → Contas a Pagar → Autorização de Pagamentos** no tecLUX Laravel.

Não implemente. Não releia o Delphi e não faça nova entrevista: este briefing é autoritativo sobre o legado. Antes de especificar, inspecione integralmente o Laravel atual para confirmar nomes, rotas, modules, componentes, Policies, Sensitive Operation, repositories, schema esperado e testes. Preserve e aprofunde o que já existe; não crie implementação paralela.

OBJETIVO

Criar a página dedicada de Autorização de Pagamentos e completar o backend atual com consulta transversal, seleção segura, autorização, desautorização, lote atômico, Auditoria e impressão, integrando-se ao contrato de Quitação sem confundir os dois fatos.

LINGUAGEM OBRIGATÓRIA

- Duplicata: parcela identificada por documentopag + datavencto + numero.
- Autorização de Pagamento: evidência contextual/revogável que permite tentar a Quitação; não movimenta banco, Contabilidade ou impostos e não significa pago.
- Quitação: fato financeiro confirmado somente após commit e reconciliação.
- Operador: Usuário da sessão que inicia a ação.
- Autorizador: outro Usuário com Permissão Pagamento que concede a Autorização.
- proof: credencial opaca/consumível que evidencia aprovação; não é o estado persistido.

Respeite ADR-0002, ADR-0005, ADR-0007 e ADR-0246. Use como contexto `modules/financeiro/contas-pagar/quitacao-duplicata/`, sem reespecificar toda a Quitação.

BASELINE LARAVEL REVALIDADO EM 2026-07-20

Já existem: AuthorizeDuplicataPaymentCommand, AuthorizeDuplicataPaymentRequest, rota/método do DocumentosPagarController, DocumentoPagPolicy, ContasPagarDocumentosPagarAuthorizationService, ContasPagarFinancialRevision, ContasPagarIdempotencyGuard, locks nos repositories, UserBranchAccessService, ParameterReadBundle, ContasPagarParameterManifest, SensitiveOperationAuthService/ProofService/validator/hook/dialog, PrintPaymentAuthorizationQuery, PayDuplicataCommand, logs, props can/parâmetros e testes de Contas a Pagar.

Preserve esses ativos e seus contratos compatíveis. O command atual já possui identidade canônica, transação, locks, revisão, idempotência, Filial e logging.

Lacunas confirmadas:

- autorizar grava apenas autorizado=true, sem dataautorizacaopagto;
- proof usa quitar_duplicata, misturando Autorização e Quitação;
- Request/command exigem perfil Pagamento do Operador antes do proof, bloqueando delegação;
- regra sobre Autorizador igual/diferente é inconsistente;
- AUTORIZACAO PAGTO AUTOMATICA não é aplicado na criação/recriação;
- não há página dedicada, read model, desautorização, lote ou chamada frontend ao endpoint;
- impressão é JSON, de um Documento, sem preview/PDF/UI;
- autoria está em Log::info, não em Auditoria financeira durável;
- cobertura de autorização é basicamente um happy path.

LEGADO A PRESERVAR

A tela Delphi possui modos Autorizar e Cancelar/Imprimir; filtros por Filial ou Grupo, Parte Fornecedora, vencimento, lançamento e autorização; grade com Documento/Duplicata/fornecedor/nota/vencimento/valor/previsão/data/observação; seleção individual e todos; totais; F5/F6/F7/Esc. Lista apenas Duplicatas abertas, exclui previsões e persiste autorizado + dataautorizacaopagto.

Não copie: SQL concatenado, Filial apenas visual, data provisória como seleção, ausência de concorrência/auditoria, impressão que autoriza e bug em que F7 chama Autorizar/Cancelar.

ESTADOS E INVARIANTES

- OPEN_UNAUTHORIZED: datapagto vazia, autorizado=false, dataautorizacaopagto=null.
- OPEN_AUTHORIZED: datapagto vazia, autorizado=true, data preenchida e evidência compatível com o snapshot vigente.
- PAID: datapagto preenchida; fora do módulo de Autorização.

Autorizar faz OPEN_UNAUTHORIZED -> OPEN_AUTHORIZED. Desautorizar faz o inverso com motivo. PAID nunca pode ser autorizado/desautorizado. Previsão, Filial inacessível, revisão stale ou estado divergente são inelegíveis. Alteração material de Documento, Duplicata, Parte Fornecedora, Filial ou valores invalida a evidência.

Durante coexistência, autorizado=true legado sem Auditoria é LEGACY_UNATTRIBUTED: continua consumível; não invente Autorizador e registre snapshot/origem no primeiro consumo Cloud.

READ MODEL

Especifique consulta dedicada, separada do cadastro de um Documento:

- ability e Filiais autorizadas antes da paginação;
- operação AUTHORIZE ou DEAUTHORIZE_OR_PRINT;
- filtros por Filial ou Grupo, Parte Fornecedora (tipo,codigo), vencimento, lançamento e autorização;
- datas ISO, intervalos válidos, query parametrizada;
- paginação por páginas, 25 default, ordem determinística;
- excluir previsões e pagas;
- retornar identidade, Documento, fornecedor, nota/série, vencimento, valor, previsão server-side, estado, data/origem, observação, Filial, revisão, elegibilidade/razão;
- total_count e total_previsao para o filtro já autorizado.

SELEÇÃO E LOTE

Seleção da UI nunca persiste estado. Marcar página usa identidades explícitas. Selecionar todos cria selection_token opaco, curto, expirável e vinculado a Usuário, ação, filtros, Filiais, chaves e revisões. Proíba todos=true confiado ao cliente.

Command aceita itens explícitos OU token, nunca ambos. Imponha limite. Lote é all-or-nothing: locks em ordem canônica, revalidação de todos, proof/fingerprint do conjunto, estado e Auditoria numa transação. Conflito retorna itens recusados seguros e zero mutações.

INTERFACE DE APLICAÇÃO

Aprofunde o command unitário atual e introduza uma fachada profunda equivalente a:

- search(AuthorizationSearch): AuthorizationPage
- createSelection(SelectionIntent): SelectionToken
- authorize(AuthorizePaymentIntent): AuthorizationCommandResult
- deauthorize(DeauthorizePaymentIntent): AuthorizationCommandResult
- print(PrintPaymentAuthorizationQuery): AuthorizationReport

Não exponha SQL, flags internas ou repositories. Controllers/UI/lote/retorno são adapters.

CONTRATO DE MUTAÇÃO

Exija Idempotency-Key, revisions por Documento/item ou embutidas no token, proof/fingerprint; derive origin no adapter. Reserve/finalize idempotência dentro da mesma transação do negócio. Lock Documentos/Duplicatas em ordem determinística; revalide Policy, Filiais, estado, revisão, parâmetro e proof sob lock; use server/database now.

Resposta: command_id, replayed, novas revisions, contagens, totais, itens alterados, audit_id e warnings. Autorizar grava true/data; desautorizar exige reason e grava false/null, sem tocar em dados de Quitação. Estado já atingido é 409, salvo replay da mesma chave/fingerprint.

SEGURANÇA

Abilities distintas: viewPaymentAuthorizations, authorizePayment, deauthorizePayment e printPaymentAuthorization. A ability do Operador permite iniciar o fluxo; não substitui proof.

Autorização manual sempre exige Sensitive Operation ContasPagar/autorizar_pagamento_duplicata. Desautorização exige ContasPagar/desautorizar_pagamento_duplicata + motivo. Autorizador possui Permissão Pagamento e é diferente do Operador. Administrador/Suporte não substitui Pagamento.

Proof cobre ação, Operador, Autorizador, Filiais, chaves, fornecedor, valores, revisions e hash do conjunto. Mudança invalida; consumo é único/transacional. Nunca persista/logue senha ou proof bruto.

Impressão exige ability/Filiais, mas não proof sensível, porque é leitura.

PARÂMETRO

Use ContasPagarParameterManifest como equivalente a parametros_valor('AUTORIZACAO PAGTO AUTOMATICA'), precedência Filial -> global -> ausente, fallback false, ADR-0005.

Aplicar em todos os pontos canônicos de criação/recriação de Duplicata aberta, inclusive Documento a Pagar, entrada de nota e residual quando definido pela Quitação. Ativo grava estado/data + Auditoria SYSTEM_PARAMETER; inativo cria OPEN_UNAUTHORIZED. Não fabricar Autorizador. Proíba introspecção de schema em runtime conforme ADR-0007.

AUDITORIA

Auditoria durável/transacional por command e item: ação, origin ui|batch|supplier_return|system_parameter|legacy, Operador, Autorizador, chaves, Filiais, fornecedor, revision, snapshot/fingerprint antes/depois, data, reason, idempotency hash, correlação, referência segura ao evento sensível e resultado. Log::info é somente observabilidade.

IMPRESSÃO

Preserve PrintPaymentAuthorizationQuery como leitura. Estenda para itens/token multi-documento, ability/Filiais/estado, preview e PDF. Inclua fornecedor, Filial, valores, data/origem e Autorizador quando conhecido; identifique LEGACY_UNATTRIBUTED. Falhe atomicamente se a seleção ficar stale, salvo remoção explícita de recusados antes da confirmação. Imprimir nunca autoriza, renova, consome ou revoga.

UX

Crie página completa no diretório de modules usado pelo projeto, com toolbar superior conforme ADR-0002:

- modos Autorizar e Desautorizar/Imprimir;
- filtros primários + avançados colapsáveis sem perder estado;
- lookups acessíveis de Filial, Grupo e Parte Fornecedora;
- grid densa paginada, checkbox separado do estado, observação e inelegibilidade;
- totais do resultado e da seleção;
- confirmar quantidade/valor/efeito antes do proof;
- F5 muta, F6 consulta, F7 preview, Esc volta/fecha; não disparar atalhos em inputs/modais;
- loading, empty, error, forbidden, conflict, success, replay, timeout/retry;
- timeout reutiliza a mesma chave; 409 recarrega preservando filtros e limpa seleção stale;
- alterar filtro invalida token; seleção entre páginas só persiste com contexto/revisions compatíveis.

ERROS

Envelope code/message/field_errors/item_errors/correlation_id/retryable. 401 sessão; 403 ability/Filial/proof; 404 item dentro do escopo; 409 revision/estado/token/fingerprint/idempotência; 410 token expirado; 413 limite; 422 filtros/motivo/payload; 503 Auditoria/dependência com rollback. Códigos estáveis: DUPLICATA_PAID, ALREADY_AUTHORIZED, ALREADY_UNAUTHORIZED, REVISION_CONFLICT, SELECTION_EXPIRED, PROOF_CONTEXT_MISMATCH.

INTEGRAÇÃO

PayDuplicataCommand usa o mesmo validador; não replica flag/proof. Para Duplicata não autorizada, Pay pode compor a mesma interface internamente e vincular proof ao fingerprint da Quitação. Autorização nunca chama writers bancário/contábil/tributário.

PayDuplicatasBatch e retorno de fornecedor consomem a interface, sem gravar autorizado diretamente. Cancel/Rebuild decidem estado resultante pela mesma política e não reutilizam proof. Não reespecifique outros efeitos de Pay/Cancel/Rebuild.

ARQUIVOS A INSPECIONAR/PRESERVAR

- app/Application/ContasPagar/AuthorizeDuplicataPaymentCommand.php
- app/Http/Requests/ContasPagar/AuthorizeDuplicataPaymentRequest.php
- app/Http/Controllers/ContasPagar/DocumentosPagarController.php
- app/Policies/ContasPagar/DocumentoPagPolicy.php
- app/Services/Authorization/ContasPagarDocumentosPagarAuthorizationService.php
- app/Application/ContasPagar/PrintPaymentAuthorizationQuery.php
- app/Application/ContasPagar/PayDuplicataCommand.php
- app/Infrastructure/Persistence/Legacy/ContasPagar/LegacyDuplicataRepository.php
- app/Support/ContasPagar/ContasPagarParameterManifest.php
- config/sensitive-operation-auth.php
- resources/js/hooks/useSensitiveOperationAuth.ts, auth dialog e componentes ERP/modules
- tests/Feature/ContasPagar, tests/Unit/ContasPagar e testes frontend

Antes de criar arquivo, procure abstrações equivalentes atuais. Novos seams prováveis: read query/repository, requests/controller de consulta/seleção, desautorização, fachada/orquestrador, DTOs/results, token storage, Auditoria financeira, report/PDF e página/components. Crie somente os necessários.

FASES

P0 caracterizar baseline, rotas/menu/modules, schema e testes; P1 corrigir estado/data, abilities, Sensitive Operations, proof/fingerprint, Auditoria e parâmetro; P2 read model/UI/filtros/paginação/totais; P3 desautorização, token, lote atômico e idempotência crash-safe; P4 preview/PDF, integração e observabilidade. Cada fase preserva regressão e exige PostgreSQL real onde houver lock/rollback/concorrência.

TESTES

Exija Unit, Feature, frontend e PostgreSQL real para filtros/totais/paginação; Filiais/Grupos; abilities; Operador/Autorizador; proof válido, expirado, usado e divergente; autorizar/desautorizar item/lote; estado/data/motivo; parâmetro ativo/inativo/ausente/conflitante; pago/previsão/stale/estado repetido; token expirado/adulterado; atomicidade; concorrência; locks ordenados; replay/mismatch/timeout/crash; Auditoria/legado/segredos; preview/PDF sem mutação; UX/teclado/acessibilidade/estados; regressão cadastral e integração sem efeitos indevidos.

ACEITE

Nenhum estado vem confiado do browser; nenhum pago/previsão/Filial externa é mutado; lote nunca produz sucesso parcial; retry não duplica; estado/data/Auditoria são coerentes; Operador e Autorizador são distintos; proof não vaza; impressão é leitura; UI só confirma pós-commit; implementações atuais são reutilizadas; Autorização e Quitação permanecem separadas.

FORA DO ESCOPO/PROIBIDO

Não alterar Delphi; não reespecificar Pay/Cancel/Rebuild além do consumo; não migrar telas completas de lote/remessa/retorno; não criar implementações paralelas; não copiar login mágico, proteção visual, Filiais globais, SQL concatenado, MAX+1, transação aguardando Usuário, estado do cliente ou correção silenciosa de legado.

SAÍDA

Gere uma spec pronta para /speckit.plan com: requisitos numerados; jornadas e falhas; estados/entidades; contratos HTTP e de aplicação; abilities/proof; parâmetros; Filiais; transação/locks/revision/idempotência/Auditoria; UX; arquivos atuais a preservar/corrigir e apenas novos necessários; fases/dependências/gates; testes; critérios mensuráveis; matriz já implementado/incompleto/faltante/preservar. Não deixe investigação Delphi nem decisão financeira em aberto.
```
