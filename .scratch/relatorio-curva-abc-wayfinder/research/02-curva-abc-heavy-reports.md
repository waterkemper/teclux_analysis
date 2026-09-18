# Pesquisa — Curva ABC contra o padrão recente de heavy-reports

- Ticket: [02-auditar-curva-abc-contra-heavy-reports](../issues/02-auditar-curva-abc-contra-heavy-reports.md)
- Data da leitura: 2026-09-09
- Escopo: somente auditoria e evidência; nenhum código Laravel/Delphi foi alterado.
- Fontes: checkout local, priorizando código, migrations e testes que são as autoridades primárias do próprio projeto.
- Classificações usadas: `CONFIRMADO`, `INFERIDO`, `DÚVIDA`, `NÃO LOCALIZADO`, `DIVERGENTE`, `POSSÍVEL BUG LEGADO` e `DECISÃO NOVA`.

## Resumo executivo

A rota da Curva ABC já está no caminho moderno de geração assíncrona: passa pelo `ManagedHeavyReportDispatcher`, cria uma `OperationalExecution`, despacha `GerarCurvaAbcJob` na fila `heavy-reports`, registra tentativa/progresso no middleware operacional e mantém compatibilidade HTTP com `GerarJobStore`. Isso deve ser preservado.

A geração, entretanto, ainda não é uma fotografia durável nem um fluxo completo do lifecycle recente:

1. `OperationalExecution` guarda identidade, estado e telemetria, mas o resultado da Curva ABC permanece em cache/arquivo transitório; a resposta da Curva inlinea as linhas no polling.
2. O cancelamento da tela marca o `GerarJobStore` como terminal e tenta `pg_cancel_backend`, enquanto o lifecycle administrativo recente usa comando durável, revisão, checkpoint, auditoria e reconciliação.
3. A consulta SQL da Curva não emite heartbeat durante a fase longa. O polling considera stale a maioria dos heavy reports após 300 s, embora o statement timeout da Curva seja 480 s. Isso abre uma janela de falso `failed` enquanto o worker ainda executa.
4. Retry administrativo existe para `curva_abc`, mas retry de transporte do worker é deliberadamente 1 tentativa; nova tentativa depende da execução operacional e de reconciliação.
5. A retenção operacional apaga execuções/attempts após 30/90 dias, mas não está ligada ao `GerarJobResultBlobStore`; o cache tem TTL de 24 h e o arquivo de resultado não apresenta expiração própria.
6. O contrato Delphi de F5/“Gravar” não existe na Curva ABC Laravel: não foi localizado endpoint/serviço que atualize `produtos.resultadocurvaabc` e `veiodatriggercaracteristicas`.

## 1. Fluxo atual e seams corretos

### 1.1 Rota, autenticação e autorização

**Classificação: CONFIRMADO — capacidade correta a preservar.**

- O grupo superior de rotas usa `auth` e `auth.context`: [laravel/backend/routes/web.php:341](../../../laravel/backend/routes/web.php:341).
- A Curva ABC fica atrás do middleware de módulo e expõe index, enqueue, polling, cancelamento por job, cancelamento PostgreSQL legado e lookups: [laravel/backend/routes/web.php:2538-2553](../../../laravel/backend/routes/web.php:2538).
- O index autoriza `viewAny`; o enqueue é autorizado pelo `FormRequest`; status e cancelamento verificam o operador autenticado: [CurvaAbcController.php:43-95](../../../laravel/backend/app/Http/Controllers/Estoque/CurvaAbcController.php:43), [CurvaAbcController.php:97-138](../../../laravel/backend/app/Http/Controllers/Estoque/CurvaAbcController.php:97), [GerarCurvaAbcRequest.php:32-35](../../../laravel/backend/app/Http/Requests/Estoque/GerarCurvaAbcRequest.php:32).
- O polling e o cancelamento por `jobId` recusam um job pertencente a outro `user_codigo`: [ResolvesHeavyGerarJobHttp.php:23-26](../../../laravel/backend/app/Http/Controllers/Concerns/ResolvesHeavyGerarJobHttp.php:23), [ResolvesHeavyGerarJobHttp.php:84-101](../../../laravel/backend/app/Http/Controllers/Concerns/ResolvesHeavyGerarJobHttp.php:84).

A autorização de filial também é revalidada na execução: o serviço resolve filiais/grupos contra as filiais autorizadas do usuário e compila os filtros: [CurvaAbcService.php:64-87](../../../laravel/backend/app/Services/Estoque/CurvaAbcService.php:64), [EstoqueCurvaAbcModuleAccessService.php:49-86](../../../laravel/backend/app/Services/Estoque/EstoqueCurvaAbcModuleAccessService.php:49).

**Classificação: CONFIRMADO.** Os testes cobrem acesso negado, isolamento do polling entre usuários e autorização de módulo: [CurvaAbcGerarTest.php:62-75](../../../laravel/backend/tests/Feature/Estoque/CurvaAbcGerarTest.php:62), [CurvaAbcGerarAsyncTest.php:177-190](../../../laravel/backend/tests/Feature/Estoque/CurvaAbcGerarAsyncTest.php:177).

### 1.2 Dispatcher oficial e identidade operacional

**Classificação: CONFIRMADO — alinhado ao heavy-reports recente.**

- O controller não instancia o job; delega ao dispatcher oficial: [DispatchesHeavyGerarJob.php:18-29](../../../laravel/backend/app/Http/Controllers/Concerns/DispatchesHeavyGerarJob.php:18), [DispatchesHeavyGerarJob.php:65-77](../../../laravel/backend/app/Http/Controllers/Concerns/DispatchesHeavyGerarJob.php:65).
- `curva_abc` é tarefa permitida pelo dispatcher: [ManagedHeavyReportDispatcher.php:21-35](../../../laravel/backend/app/Application/Operations/ManagedHeavyReportDispatcher.php:21).
- O dispatcher cria `OperationalExecution` e o registro compatível do `GerarJobStore` na mesma transação; a publicação ocorre em `afterCommit`: [ManagedHeavyReportDispatcher.php:48-66](../../../laravel/backend/app/Application/Operations/ManagedHeavyReportDispatcher.php:48).
- A publicação faz claim `aguardando_despacho -> despachando`, cria o job tipado, publica na fila e marca `despachada`; falha de publicação retorna para `aguardando_despacho`: [ManagedHeavyReportDispatcher.php:82-129](../../../laravel/backend/app/Application/Operations/ManagedHeavyReportDispatcher.php:82).
- O job bloqueia `dispatch()` direto e exige o dispatcher oficial, usa `ShouldBeUnique`, middleware `TrackOperationalExecution`, conexão `redis-heavy` e fila `heavy-reports`: [IsManagedHeavyReport.php:12-29](../../../laravel/backend/app/Jobs/Concerns/IsManagedHeavyReport.php:12), [GerarCurvaAbcJob.php:23-43](../../../laravel/backend/app/Jobs/Erp/GerarCurvaAbcJob.php:23).

Os testes confirmam persistência antes da publicação, idempotência e ausência do payload sensível no resumo operacional: [ManagedHeavyReportsTest.php:31-47](../../../laravel/backend/tests/Feature/Operations/ManagedHeavyReportsTest.php:31).

**Classificação: DIVERGENTE — escopo de idempotência a verificar.**

A migration torna a chave única por `environment + family + idempotency_key`: [2026_07_30_150000_scope_operational_history_by_environment.php:32-41](../../../laravel/backend/database/migrations/2026_07_30_150000_scope_operational_history_by_environment.php:32). Porém o dispatcher consulta um existente somente por `family + idempotency_key`, sem filtrar `environment`: [ManagedHeavyReportDispatcher.php:37-45](../../../laravel/backend/app/Application/Operations/ManagedHeavyReportDispatcher.php:37). Em ambientes realmente compartilhando a mesma base, isso pode transformar uma chave válida em outro ambiente em replay/conflito indevido. É uma divergência concreta entre o índice de autoridade e a consulta; precisa virar teste/decisão no SpecKit, sem assumir que ambientes são sempre bancos separados.

### 1.3 Execução, progressão e projeção

**Classificação: CONFIRMADO — seam correto, mas incompleto para Curva.**

- O middleware cria `OperationalExecutionAttempt`, atualiza a execução para `executando`, instala lock distribuído e, ao retornar, deriva o estado durável do estado transitório: [TrackOperationalExecution.php:21-45](../../../laravel/backend/app/Jobs/Middleware/TrackOperationalExecution.php:21), [TrackOperationalExecution.php:47-81](../../../laravel/backend/app/Jobs/Middleware/TrackOperationalExecution.php:47).
- Progresso operacional é monotônico, sanitiza estágio/nota e atualiza heartbeat do attempt: [OperationalExecutionProgress.php:12-36](../../../laravel/backend/app/Application/Operations/OperationalExecutionProgress.php:12).
- A Curva publica pontos `10/25/90/100` de forma indireta, incluindo cursor de fase de resultado: [GerarCurvaAbcJob.php:56-75](../../../laravel/backend/app/Jobs/Erp/GerarCurvaAbcJob.php:56).
- `curva_abc` está declarada como resumível e com retry permitido para falha, falha inesperada e timeout: [HeavyReportLifecyclePolicy.php:7-31](../../../laravel/backend/app/Application/Operations/HeavyReportLifecyclePolicy.php:7).
- O cursor/result checkpoint é uma capacidade compartilhada de `IsManagedHeavyReport`; o resultado pode ser persistido antes da publicação e retomado sem repetir a consulta: [IsManagedHeavyReport.php:31-64](../../../laravel/backend/app/Jobs/Concerns/IsManagedHeavyReport.php:31), [HeavyReportLifecycleTest.php:198-230](../../../laravel/backend/tests/Feature/Operations/HeavyReportLifecycleTest.php:198).

**Classificação: POSSÍVEL BUG LEGADO — heartbeat insuficiente da Curva ABC.**

A Curva reporta progresso antes da consulta e antes da publicação, mas não chama `OperationalExecutionProgress` nem `GerarJobStore::touchUnlessTerminal()` durante o SQL: [GerarCurvaAbcJob.php:69-75](../../../laravel/backend/app/Jobs/Erp/GerarCurvaAbcJob.php:69), [CurvaAbcService.php:123-147](../../../laravel/backend/app/Services/Estoque/CurvaAbcService.php:123). O polling considera `running` stale pelo padrão de 300 s para qualquer report key diferente de `consulta_compras_sugestao`: [GerarJobStore.php:249-310](../../../laravel/backend/app/Support/Database/GerarJobStore.php:249), [ResolvesHeavyGerarJobHttp.php:40-51](../../../laravel/backend/app/Http/Controllers/Concerns/ResolvesHeavyGerarJobHttp.php:40). A consulta da Curva pode durar até o statement timeout configurado de 480 s: [HeavyReportsTimeout.php:10-15](../../../laravel/backend/app/Support/Database/HeavyReportsTimeout.php:10). Portanto, uma consulta ainda viva pode ser marcada `failed` pelo polling antes de atingir o timeout do banco; o `markReady()` posterior será recusado por estado terminal: [GerarJobStore.php:161-197](../../../laravel/backend/app/Support/Database/GerarJobStore.php:161). O SpecKit deve cobrir heartbeat durante fases longas e o teste de falso stale.

### 1.4 Resultado transitório e tamanho

**Classificação: CONFIRMADO — seam transitório existente.**

`GerarJobStore` usa cache com TTL fixo de 86.400 s, estados terminais `cancelled/failed/ready`, checkpoint de resultado e heartbeat por `updated_at`: [GerarJobStore.php:11-25](../../../laravel/backend/app/Support/Database/GerarJobStore.php:11), [GerarJobStore.php:101-143](../../../laravel/backend/app/Support/Database/GerarJobStore.php:101). Para resultados grandes existe `GerarJobResultBlobStore` fora do Redis: [GerarJobResultBlobStore.php:9-31](../../../laravel/backend/app/Support/Database/GerarJobResultBlobStore.php:9).

**Classificação: DIVERGENTE — Curva não usa o offload disponível.**

`GerarCurvaAbcJob` chama `markReady($jobId, $result)` sem `offloadResult`: [GerarCurvaAbcJob.php:75-85](../../../laravel/backend/app/Jobs/Erp/GerarCurvaAbcJob.php:75). O endpoint de status da Curva também não fornece `resultRouteName`, portanto retorna o resultado inline no polling: [CurvaAbcController.php:109-118](../../../laravel/backend/app/Http/Controllers/Estoque/CurvaAbcController.php:109), [ResolvesHeavyGerarJobHttp.php:61-69](../../../laravel/backend/app/Http/Controllers/Concerns/ResolvesHeavyGerarJobHttp.php:61). O request limita `quantidade` apenas por mínimo, sem teto máximo: [GerarCurvaAbcRequest.php:68-76](../../../laravel/backend/app/Http/Requests/Estoque/GerarCurvaAbcRequest.php:68). A combinação deixa o tamanho do resultado dependente do cliente e conserva risco de payload grande em cache/polling. O limite de Top N e o uso de offload são decisões específicas da Curva, não uma reescrita geral do heavy-reports.

### 1.5 Fila, timeout e retry

**Classificação: CONFIRMADO — Curva usa a fila isolada e retry de transporte conservador.**

- O job define `redis-heavy`, `heavy-reports`, `tries=1) e timeout do job como timeout SQL pesado + 60 s: [GerarCurvaAbcJob.php:27-43](../../../laravel/backend/app/Jobs/Erp/GerarCurvaAbcJob.php:27), [HeavyReportsQueue.php:14-27](../../../laravel/backend/app/Support/Database/HeavyReportsQueue.php:14).
- O Horizon tem supervisor isolado, 1 processo, 1 tentativa, memória de 1 GiB e timeout de 600 s; `redis-heavy.retry_after` é 660 s: [config/horizon.php:220-233](../../../laravel/backend/config/horizon.php:220), [config/queue.php:76-83](../../../laravel/backend/config/queue.php:76).
- O preflight verifica que timeout do supervisor é menor que `retry_after`: [HorizonDeploymentPreflight.php:7-24](../../../laravel/backend/app/Application/Operations/HorizonDeploymentPreflight.php:7).
- Timeout SQL e cancelamento PostgreSQL são aplicados no repositório via `PgsqlCancellableStatement`/statement timeout: [LegacyCurvaAbcRepository.php:50-67](../../../laravel/backend/app/Infrastructure/Persistence/Legacy/Estoque/LegacyCurvaAbcRepository.php:50), [PgsqlGerarQueryRunner.php:40-57](../../../laravel/backend/app/Support/Database/PgsqlGerarQueryRunner.php:40).

**Classificação: DIVERGENTE — configuração de worker manual não usa a conexão heavy dedicada.**

O supervisor Horizon usa `redis-heavy`, mas o comando de worker manual chama `queue:work` com conexão `redis`, apesar de consumir `heavy-reports`: [RunHeavyReportsQueueWorkerCommand.php:16-30](../../../laravel/backend/app/Console/Commands/RunHeavyReportsQueueWorkerCommand.php:16), [HeavyReportsQueue.php:64-76](../../../laravel/backend/app/Support/Database/HeavyReportsQueue.php:64). A conexão `redis` tem `retry_after=150), enquanto `redis-heavy` tem 660 s: [config/queue.php:67-83](../../../laravel/backend/config/queue.php:67). Se esse comando for usado para produção, o retry window pode ser menor que o timeout do heavy worker; o preflight não cobre esse caminho. Os testes atualmente codificam a escolha de `redis` no argumento do worker: [HeavyReportsQueueTest.php:45-52](../../../laravel/backend/tests/Unit/Database/HeavyReportsQueueTest.php:45). Isso deve ser tratado como divergência do baseline vigente, não corrigido incidentalmente no ticket da Curva sem decidir o contrato operacional.

**Classificação: DIVERGENTE — Horizon estático não acompanha o pior timeout compartilhado.**

`HeavyReportsQueue::workerTimeoutSeconds()` inclui o timeout da Consulta de Compras, que por padrão é 900 s, além da margem: [ConsultaComprasGerarTimeout.php:10-26](../../../laravel/backend/app/Support/Estoque/ConsultaComprasGerarTimeout.php:10), [HeavyReportsQueue.php:29-42](../../../laravel/backend/app/Support/Database/HeavyReportsQueue.php:29). O teste exige worker calculado >= 1320 s: [HeavyReportsQueueTest.php:21-30](../../../laravel/backend/tests/Unit/Database/HeavyReportsQueueTest.php:21), enquanto o supervisor Horizon está fixado em 600 s: [config/horizon.php:220-233](../../../laravel/backend/config/horizon.php:220). Para a Curva isoladamente, o timeout de 600/660 cobre 480/540; a divergência pertence ao envelope compartilhado e precisa ser explicitamente preservada ou corrigida em ticket próprio.

**Classificação: CONFIRMADO — retry funcional é administrativo, não retry automático.**

A Curva tem `tries=1`; falhas tratadas pelo job viram `GerarJobStore=failed`, e o middleware converte o resultado em `OperationalExecution=falhou`: [GerarCurvaAbcJob.php:93-129](../../../laravel/backend/app/Jobs/Erp/GerarCurvaAbcJob.php:93), [TrackOperationalExecution.php:64-79](../../../laravel/backend/app/Jobs/Middleware/TrackOperationalExecution.php:64). A política libera `tentar_novamente` para os resultados permitidos, usando a mesma execução e novo attempt, após estado reconciliado: [HeavyReportLifecycleService.php:36-45](../../../laravel/backend/app/Application/Operations/HeavyReportLifecycleService.php:36), [HeavyReportLifecycleService.php:219-247](../../../laravel/backend/app/Application/Operations/HeavyReportLifecycleService.php:219). Isso é coerente com idempotência e evita retry automático de uma consulta potencialmente cara.

### 1.6 Cancelamento e reconciliação

**Classificação: CONFIRMADO — cancelamento PostgreSQL real existe.**

- O job carrega `traceId` e o repositório registra a conexão ativa para permitir `pg_cancel_backend`: [GerarCurvaAbcJob.php:34-42](../../../laravel/backend/app/Jobs/Erp/GerarCurvaAbcJob.php:34), [LegacyCurvaAbcRepository.php:59-67](../../../laravel/backend/app/Infrastructure/Persistence/Legacy/Estoque/LegacyCurvaAbcRepository.php:59).
- O cancel service consulta o PID registrado e executa `pg_cancel_backend` (ou terminate explícito): [PgsqlGerarQueryCancelService.php:16-66](../../../laravel/backend/app/Support/Database/PgsqlGerarQueryCancelService.php:16).
- O job trata cancelamento como cancelado e não deixa um job cancelado voltar a `ready`: [GerarCurvaAbcJob.php:51-59](../../../laravel/backend/app/Jobs/Erp/GerarCurvaAbcJob.php:51), [GerarCurvaAbcJob.php:105-112](../../../laravel/backend/app/Jobs/Erp/GerarCurvaAbcJob.php:105), [CurvaAbcGerarAsyncTest.php:159-175](../../../laravel/backend/tests/Feature/Estoque/CurvaAbcGerarAsyncTest.php:159).

**Classificação: DIVERGENTE — cancelamento da tela não é o lifecycle administrativo completo.**

O endpoint por job chama `markCancelled()` imediatamente e depois tenta cancelar a query: [ResolvesHeavyGerarJobHttp.php:84-107](../../../laravel/backend/app/Http/Controllers/Concerns/ResolvesHeavyGerarJobHttp.php:84). Já o padrão recente de lifecycle grava `control_request=cancelar`, incrementa revisão, espera checkpoint seguro, fecha attempt, audita o comando e só então projeta `cancelada`: [HeavyReportLifecycleService.php:142-150](../../../laravel/backend/app/Application/Operations/HeavyReportLifecycleService.php:142), [OperationalExecutionCheckpoint.php:18-60](../../../laravel/backend/app/Application/Operations/OperationalExecutionCheckpoint.php:18), [HeavyReportLifecycleTest.php:48-64](../../../laravel/backend/tests/Feature/Operations/HeavyReportLifecycleTest.php:48). O fluxo da tela é adequado como cancelamento voluntário do próprio usuário e preserva o seam PostgreSQL, mas não entrega a mesma auditoria, revisão, confirmação ou reconciliação do console operacional. O SpecKit deve decidir se são duas capacidades deliberadamente distintas ou se o cancelamento da tela deve publicar o mesmo pedido durável.

**Classificação: CONFIRMADO — reconciliação existe para estados ambíguos.**

O reconciliador reconstitui a projeção transitória a partir do estado durável, usa lease/revisão e registra ação convergente; falhas de cache ficam em `reconciliacao_necessaria`: [HeavyReportProjectionReconciler.php:18-86](../../../laravel/backend/app/Application/Operations/HeavyReportProjectionReconciler.php:18), [OperationalExecutionCheckpoint.php:65-98](../../../laravel/backend/app/Application/Operations/OperationalExecutionCheckpoint.php:65). O comando periódico fecha heartbeat expirado, deadlines de checkpoint, claims de despacho e republica execuções pendentes: [ReconcileOperationalExecutions.php:25-115](../../../laravel/backend/app/Console/Commands/ReconcileOperationalExecutions.php:25). A Curva está incluída nessa infraestrutura porque usa `family=heavy-reports` e `task=curva_abc`.

### 1.7 GerarJobStore e concorrência

**Classificação: POSSÍVEL BUG LEGADO — atualização transitória não é compare-and-swap.**

`mergeUnlessTerminal`, `markReady`, `markCancelled` e `markFailed` executam leitura do cache seguida de `put`, sem lock, versão ou operação atômica: [GerarJobStore.php:101-117](../../../laravel/backend/app/Support/Database/GerarJobStore.php:101), [GerarJobStore.php:161-195](../../../laravel/backend/app/Support/Database/GerarJobStore.php:161), [GerarJobStore.php:200-243](../../../laravel/backend/app/Support/Database/GerarJobStore.php:200). O lifecycle recente protege a autoridade durável com `lockForUpdate`, `revision` e reconciliação: [HeavyReportLifecycleService.php:111-130](../../../laravel/backend/app/Application/Operations/HeavyReportLifecycleService.php:111). Há risco de lost update entre polling stale, cancelamento, worker e reconciliador. A solução não deve ser uma reescrita genérica do store sem antes decidir qual estado é autoridade; o resultado persistente futuro deve reduzir a dependência do cache como máquina de estados.

## 2. Resultado da Curva ABC e paridade Delphi

### 2.1 Geração atual só retorna a grade

**Classificação: CONFIRMADO.**

O serviço retorna `rows` e `meta`, incluindo tipo, indicador de estoque por filial, contagem, data e snapshot de filtros: [CurvaAbcService.php:43-57](../../../laravel/backend/app/Services/Estoque/CurvaAbcService.php:43), [CurvaAbcService.php:145-175](../../../laravel/backend/app/Services/Estoque/CurvaAbcService.php:145). A tela guarda esse resultado somente em estado React e o grid usa as linhas retornadas: [Index.tsx:104-116](../../../laravel/backend/resources/js/Pages/Cadastros/Estoque/Relatorios/CurvaAbc/Index.tsx:104), [Index.tsx:548-560](../../../laravel/backend/resources/js/Pages/Cadastros/Estoque/Relatorios/CurvaAbc/Index.tsx:548), [CurvaAbcDadosGrid.tsx:18-50](../../../laravel/backend/resources/js/Pages/Cadastros/Estoque/Relatorios/CurvaAbc/CurvaAbcDadosGrid.tsx:18).

### 2.2 Gravar F5 do Delphi não foi localizado no Laravel

**Classificação: NÃO LOCALIZADO — lacuna de escopo, não decisão de implementação.**

No Delphi, F5 chama `AtualizarResultadoCurvaABC`: [fmrelatoriocurvaabc.pas:297-313](../../../delphi/apps/estoque/fmrelatoriocurvaabc.pas:297). O método limpa as classificações existentes, grava a classe retornada para cada produto, marca `veiodatriggercaracteristicas=true), executa o SQL e confirma a transação: [dmrelatoriocurvaabc.pas:690-707](../../../delphi/apps/estoque/dmrelatoriocurvaabc.pas:690).

Na superfície Curva ABC Laravel não foi localizado controller, request, service, job, rota ou componente de botão que chame essa semântica; os achados Laravel de `resultadocurvaabc` estão em consumidores de Consulta de Compras/Interlojas e migrations de suporte, não em uma operação de gravação da Curva ABC: [CurvaAbcInclusionFilter.php:1](../../../laravel/backend/app/Domain/Estoque/ConsultaCompras/CurvaAbcInclusionFilter.php:1), [migration de coluna:26](../../../laravel/backend/database/migrations/2026_07_21_211000_sqlite_produtos_consulta_compras_motor_columns.php:26). A ausência precisa ser confirmada por uma busca final durante o SpecKit, mas o baseline atual não apresenta o seam.

**Classificação: DIVERGENTE — geração/fotografia versus efeito persistente.**

O Delphi mistura a leitura do resultado e a mutação global de `produtos` no F5. O Laravel atual separa geração assíncrona e grade, mas ainda não define se “gravar” deve substituir globalmente as classes, atualizar apenas os produtos fotografados ou criar uma operação de gravação separada. Essa é uma decisão de negócio/concorrência, não uma conclusão técnica desta auditoria; permanece bloqueada pelos tickets de semântica persistente.

### 2.3 Exportação e impressão

**Classificação: DIVERGENTE / NÃO LOCALIZADO.**

O Delphi tem impressão/preview e exportação Excel em `InternoImpressao`/ `GravarExcel`: [fmrelatoriocurvaabc.pas:275-295](../../../delphi/apps/estoque/fmrelatoriocurvaabc.pas:275), [dmrelatoriocurvaabc.pas:506-688](../../../delphi/apps/estoque/dmrelatoriocurvaabc.pas:506). Na tela Laravel auditada, o resultado exposto é apenas a grade e não foi localizado endpoint específico de PDF/impressão/Excel para a Curva ABC; o catálogo do grid pode ter affordances genéricas, mas não deve ser tratado como paridade de relatório sem contrato explícito: [CurvaAbcDadosGrid.tsx:33-50](../../../laravel/backend/resources/js/Pages/Cadastros/Estoque/Relatorios/CurvaAbc/CurvaAbcDadosGrid.tsx:33).

## 3. UI, polling e observabilidade

### 3.1 Polling e cancelamento no browser

**Classificação: CONFIRMADO — padrão compartilhado reaproveitado.**

O hook envia enqueue, faz polling a cada 1,5 s por até 800 tentativas, interpreta `queued/running/ready/failed/cancelled), busca `result_url` quando presente e aborta o request local: [useErpHeavyGerarRequest.ts:36-45](../../../laravel/backend/resources/js/hooks/useErpHeavyGerarRequest.ts:36), [useErpHeavyGerarRequest.ts:107-133](../../../laravel/backend/resources/js/hooks/useErpHeavyGerarRequest.ts:107), [useErpHeavyGerarRequest.ts:135-247](../../../laravel/backend/resources/js/hooks/useErpHeavyGerarRequest.ts:135). A Curva o reutiliza e mantém F6, botão Gerar e botão Cancelar: [useCurvaAbcGerarRequest.ts:1-12](../../../laravel/backend/resources/js/hooks/useCurvaAbcGerarRequest.ts:1), [Index.tsx:207-241](../../../laravel/backend/resources/js/Pages/Cadastros/Estoque/Relatorios/CurvaAbc/Index.tsx:207).

**Classificação: DIVERGENTE — progresso operacional não chega à tela.**

O hook aceita `onProgress`, mas a Curva chama `useCurvaAbcGerarRequest(endpoints.cancelar_gerar)` sem callback: [useErpHeavyGerarRequest.ts:92-105](../../../laravel/backend/resources/js/hooks/useErpHeavyGerarRequest.ts:92), [Index.tsx:104-110](../../../laravel/backend/resources/js/Pages/Cadastros/Estoque/Relatorios/CurvaAbc/Index.tsx:104). A barra/ação só mostra `processingLabel='Gerando…'`; não há exposição do estágio/percentual operacional na página: [Index.tsx:266-289](../../../laravel/backend/resources/js/Pages/Cadastros/Estoque/Relatorios/CurvaAbc/Index.tsx:266). O backend tem telemetria mais rica que o contrato visual atual.

### 3.2 Logs, Horizon e console operacional

**Classificação: CONFIRMADO — observabilidade de plataforma existe.**

- A Curva registra sucesso/falha com usuário, job, duração, contagem, motivo e tela: [CurvaAbcService.php:125-163](../../../laravel/backend/app/Services/Estoque/CurvaAbcService.php:125), [GerarCurvaAbcJob.php:87-129](../../../laravel/backend/app/Jobs/Erp/GerarCurvaAbcJob.php:87).
- Horizon expõe fila, idade do pending, throughput, falhas, supervisor, consumidores e heartbeat: [HorizonOperationalTopology.php:38-80](../../../laravel/backend/app/Infrastructure/Operations/HorizonOperationalTopology.php:38), [HorizonOperationalTopology.php:100-137](../../../laravel/backend/app/Infrastructure/Operations/HorizonOperationalTopology.php:100).
- O heartbeat tem expiração de 60 s e a leitura declara `fresh/stale/error`: [RecordHorizonSupervisorHeartbeat.php:14-32](../../../laravel/backend/app/Infrastructure/Operations/RecordHorizonSupervisorHeartbeat.php:14), [HorizonOperationalTopology.php:45-58](../../../laravel/backend/app/Infrastructure/Operations/HorizonOperationalTopology.php:45).
- O console de operações lê execuções gerenciadas e attempts sanitizados, sem expor payload/request hash: [ManagedExecutionReadService.php:29-53](../../../laravel/backend/app/Application/Operations/ManagedExecutionReadService.php:29), [ManagedHeavyReportsTest.php:264-283](../../../laravel/backend/tests/Feature/Operations/ManagedHeavyReportsTest.php:264).

**Classificação: POSSÍVEL BUG LEGADO — correlação de erro pode vazar mensagem técnica.**

O log de falha do job inclui `$exception->getMessage()` bruto: [GerarCurvaAbcJob.php:123-129](../../../laravel/backend/app/Jobs/Erp/GerarCurvaAbcJob.php:123). O console sanitiza attempts, mas essa linha de log não usa o mesmo safe-failure. Deve ser avaliada com os padrões de logging do projeto; não há evidência nesta auditoria de exploração, apenas uma diferença observável entre os dois canais.

## 4. Retenção, recuperação e durabilidade

**Classificação: CONFIRMADO — retenção operacional do histórico existe.**

A política operacional mantém execuções bem-sucedidas por 30 dias, falhas/cancelamentos por 90 dias, expurga metadata técnica após 7 dias e preserva tombstone/rollup/auditoria: [OperationalRetentionService.php:23-30](../../../laravel/backend/app/Application/Operations/OperationalRetentionService.php:23), [OperationalRetentionService.php:53-72](../../../laravel/backend/app/Application/Operations/OperationalRetentionService.php:53), [OperationalRetentionService.php:209-239](../../../laravel/backend/app/Application/Operations/OperationalRetentionService.php:209). A purga de execução apaga attempts e execução, mas mantém ledger/tombstone: [OperationalRetentionService.php:258-275](../../../laravel/backend/app/Application/Operations/OperationalRetentionService.php:258).

**Classificação: DIVERGENTE — retenção não cobre a entrega da Curva ABC.**

O `GerarJobStore` expira em 24 h: [GerarJobStore.php:13-25](../../../laravel/backend/app/Support/Database/GerarJobStore.php:13). O `GerarJobResultBlobStore` escreve arquivo privado sem TTL/metadata de expiração e, no checkout, só há `put/get` pelo store e nenhum consumidor de `delete()` identificado para a Curva: [GerarJobResultBlobStore.php:19-64](../../../laravel/backend/app/Support/Database/GerarJobResultBlobStore.php:19). A retenção operacional não chama esse store ao purgar a execução: [OperationalRetentionService.php:258-275](../../../laravel/backend/app/Application/Operations/OperationalRetentionService.php:258). Para a Curva atual, que não usa blob, o efeito imediato é a perda do resultado após o TTL do cache; para futura fotografia/offload, há risco de arquivo órfão. Uma fotografia persistente deve ter sua própria política de retenção, autorização e hold, separada do cache de polling.

**Classificação: DÚVIDA — recuperação após expiração do cache.**

O estado durável permite ver a execução histórica no console, mas não contém `rows`, `meta` ou ponteiro de fotografia: [OperationalExecution.php:24-30](../../../laravel/backend/app/Models/OperationalExecution.php:24), [ManagedExecutionReadService.php:56-72](../../../laravel/backend/app/Application/Operations/ManagedExecutionReadService.php:56). Não foi localizado contrato de re-download da Curva após o TTL; resta decidir se isso é aceitável para “relatório de consulta” ou se o resultado deve ser materializado.

## 5. Matriz de achados e implicações para o SpecKit

| Área | Estado da Curva ABC | Classificação | Evidência principal | Implicação específica |
|---|---|---|---|---|
| Rota/auth/módulo | Completo no request e polling | CONFIRMADO | routes, controller, request | Preservar middleware, policy e escopo de filial |
| Dispatcher | Dispatcher oficial + after-commit | CONFIRMADO | ManagedHeavyReportDispatcher | Não criar dispatch paralelo |
| Idempotência | Suporta header, mas header é opcional; query não filtra environment | DIVERGENTE | dispatcher + migration | Fixar contrato da chave e escopo ambiental |
| Job/fila | Job managed, unique, `redis-heavy/heavy-reports`, tries 1 | CONFIRMADO | GerarCurvaAbcJob | Preservar seam |
| Timeout | SQL 480 s; Curva cabe em Horizon 600/660 | CONFIRMADO | HeavyReportsTimeout, Horizon | Validar envelope compartilhado antes de rollout |
| Worker manual | Usa `redis` com retry_after 150 | DIVERGENTE | RunHeavyReportsQueueWorkerCommand, queue.php | Não declarar operação segura sem resolver ou excluir esse caminho |
| Heartbeat | Pontos antes/depois; nenhum durante SQL | POSSÍVEL BUG LEGADO | GerarCurvaAbcJob, CurvaAbcService, stale logic | Cobrir query longa e falso stale |
| Progresso UI | Backend tem progresso; tela só mostra busy | DIVERGENTE | hook + Index | Decidir contrato de estágio/percentual |
| Cancelamento de usuário | Marca cache e tenta pg_cancel | CONFIRMADO | ResolvesHeavyGerarJobHttp, Pgsql cancel | Preservar cancelamento real; definir relação com lifecycle |
| Cancelamento administrativo | Checkpoint, revisão, auditoria, reconciliação | CONFIRMADO | LifecycleService, Checkpoint | Reusar para controles operacionais |
| Resultado | Inline no poll/cache 24 h | CONFIRMADO | Controller, GerarJobStore | Não tratar como fonte canônica |
| Offload | Disponível, não usado pela Curva | DIVERGENTE | GerarCurvaAbcJob, BlobStore | Escolher limite/offload/endpoint de resultado |
| Fotografia durável | Não existe no fluxo Curva | NÃO LOCALIZADO | superfície Curva auditada | Especificar antes de exportação/reconsulta |
| F5/Gravar | Delphi atualiza produtos globalmente; Laravel não | NÃO LOCALIZADO / DIVERGENTE | Delphi + ausência Laravel | Decisão separada de semântica, concorrência e auditoria |
| Retenção | Histórico DB 30/90 dias; cache 24 h; blob sem expiração | DIVERGENTE | OperationalRetentionService, stores | Definir retenção da fotografia e limpeza técnica |
| Observabilidade | Logs + Horizon + attempts | CONFIRMADO | Curva service/job + topology | Acrescentar correlação segura e heartbeat |
| Segurança de logs | exception message bruto no log do job | POSSÍVEL BUG LEGADO | GerarCurvaAbcJob | Verificar sanitização de mensagens técnicas |

## 6. Contratos que ainda precisam de decisão

Estas não são implementações desta pesquisa; são perguntas já suficientemente nítidas para os próximos tickets/SpecKit:

1. **Autoridade do resultado:** a execução operacional registra apenas lifecycle ou também aponta para uma fotografia imutável de linhas/meta/filtros?
2. **Semântica de Gravar:** substituir globalmente `resultadocurvaabc`, atualizar apenas produtos da fotografia, ou separar explicitamente geração e mutação?
3. **Concorrência da gravação:** como impedir que duas fotografias/operadores sobrescrevam classificação sem revisão, lock, versão ou confirmação?
4. **Idempotência HTTP:** exigir `Idempotency-Key` para enqueue ou manter chave efêmera quando ausente? O escopo deve incluir `environment` e ator?
5. **Heartbeat da Curva:** qual intervalo e quais fronteiras podem atualizar progress/heartbeat sem abrir uma nova consulta concorrente?
6. **Cancelamento:** cancelamento voluntário da própria consulta fica como atalho transitório ou cria `control_request`/auditoria compatível com o console?
7. **Tamanho/resultado:** qual teto de Top N e quando usar resultado offloaded/URL em vez de inline?
8. **Retenção:** fotografia, payload técnico, cache, blob e histórico operacional devem ter prazos e mecanismos de expurgo diferentes?
9. **Saídas:** grade, Excel, PDF e impressão devem consumir a mesma fotografia, sem reconsultar a base?
10. **Rollout:** qual gate mede timeout, fila, falso stale, cancelamento PostgreSQL, recuperação, gravação e paridade Delphi?

## 7. Ordem sugerida para os prompts futuros `/speckit.specify`

A pesquisa não executa `/speckit.specify`, mas deixa o seguinte fatiamento mínimo para os tickets posteriores, sem duplicar seams:

1. **Fundação operacional Curva ABC:** idempotência ambiental, heartbeat durante SQL, timeout/envelope, dispatcher/reconciliador e testes de falha de publicação.
2. **Fotografia e entrega:** contrato canônico de resultado, offload/URL, polling, progresso UI, grade e saídas que consumam a mesma fotografia.
3. **Gravação persistente Delphi-parity:** comando F5 separado, autoridade de `produtos.resultadocurvaabc`, trigger flag, transação, autorização, concorrência, idempotência e auditoria.
4. **Retenção/observabilidade/aceite:** TTL de transitórios, retenção da fotografia, correlação segura, métricas, cancelamento/timeout/retry e rollout/rollback.

Cada prompt deve referenciar este artefato, a pesquisa Delphi do ticket 01 e a autoridade persistente do ticket 03; deve exigir inspeção do checkout Laravel vigente e proibir reabrir Delphi/implementar durante a especificação.

## Conclusão

A geração da Curva ABC não precisa de uma reescrita genérica: o dispatcher, job managed, fila dedicada, cancelamento PostgreSQL, autorização de filial e console operacional já são seams reais. O ajuste deve concentrar-se em quatro fronteiras: heartbeat/estado transitório durante SQL, materialização durável do resultado, separação explícita entre fotografia e gravação Delphi-parity e política de retenção/observabilidade correspondente.

O maior risco operacional imediato é o falso stale de uma consulta longa da Curva. O maior risco funcional é considerar o resultado inline/cache equivalente ao “resultado gravado” do Delphi; as fontes mostram que o Delphi muta Produtos e o Laravel atual ainda não oferece essa operação.
