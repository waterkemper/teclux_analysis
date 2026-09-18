# Avaliar filas, integrações assíncronas, observabilidade e resiliência

Type: research
Status: resolved
Blocked by:

## Answer

### Escopo e confiança

Foi feita auditoria estática do código, configurações, migrations, Compose, documentação operacional e testes locais. Não foram executados Redis/PostgreSQL/Horizon/SEFAZ em ambiente de produção; os achados de configuração e fluxo têm confiança alta, enquanto capacidade real e volume operacional dependem do deploy.

### Sumário executivo

A maturidade é intermediária: há uma intenção arquitetural consistente de processamento assíncrono observável e reconciliável, mas a topologia executável, os contratos de timeout e os outboxes fiscais não estão alinhados. Os riscos prioritários são:

- **Alto — indisponibilidade fiscal:** config/horizon.php:235-353 declara oito envelopes fiscais, mas docker-compose.prod.yml:101-226 provisiona somente fiscal-nfe e fiscal-artefatos, além de default/heavy. Não há consumidores Compose para NFCE prioritária, reconciliação, eventos, espelhamento, distribuição e observador. O monitor documentado cobre somente cinco filas (docker-compose.prod.yml:40-47).
- **Alto — timeout efetivo incorreto:** o job F6 usa timeout de 1.200 s por padrão (config/teclux.php:119-124, app/Support/Estoque/ConsultaComprasGerarTimeout.php:12-16, app/Jobs/Erp/GerarConsultaComprasSugestaoJob.php:27-46), mas o supervisor heavy mata jobs em 600 s e o retry_after é 660 s (config/horizon.php:220-233, config/queue.php:76-82). Isso viola o invariante explicitado em app/Support/Database/HeavyReportsQueue.php:9-13.
- **Alto — duplicidade no outbox fiscal:** FOR UPDATE SKIP LOCKED é executado sem transação que cubra a entrega (app/Infrastructure/Fiscal/Persistence/CloudFiscalComandoOutboxRepository.php:513-533); o lock pode ser liberado antes de dispatch(). A janela dispatch-antes-de-marcar-entregue (app/Infrastructure/Fiscal/Queue/FiscalNfeOutboxDispatcher.php:48-64) é naturalmente at-least-once.
- **Alto — perda lógica/reprocessamento manual:** falha de entrega vira FALHA_ENTREGA, mas o claim só seleciona PENDENTE e não foi localizado caminho automático de retry/requeue/DLQ (CloudFiscalComandoOutboxRepository.php:85-89,513-547; não há consumidor de OUTBOX_FALHA_ENTREGA na superfície auditada).
- **Médio/alto — recuperação incompleta:** existem comandos para fiscal:artefatos-sweep, fiscal:distribuicao-sweep e transferencia-fiscal:projecao-sweep, porém somente fiscal:reconciliacao-sweep está agendado em routes/console.php:85-108.

### Achados

1. **Horizon/Redis e disponibilidade dos consumidores — alto, confiança alta.** A configuração separa filas e limita cada supervisor a um processo (config/horizon.php:204-353), mas a declaração de oito envelopes não corresponde ao Compose versionado (docker-compose.prod.yml:101-226). Um job pode ser persistido no Redis e permanecer com attempts=0, sem consumidor. A documentação confirma essa semântica para fiscal-nfe (docs/operations/fiscal-nfe-homologacao-transferencia.md:86-94). O preflight só valida default e heavy (app/Application/Operations/HorizonDeploymentPreflight.php:9-29), não os seis envelopes fiscais restantes.

   A prontidão dos quatro serviços presentes é relativamente boa: verifica Redis, master, supervisor, filas, heartbeat e release (app/Application/Operations/HorizonReadiness.php:13-37; app/Infrastructure/Operations/LaravelHorizonRuntimeProbe.php:25-83).

2. **Timeouts, retries e lock de execução — alto, confiança alta.** O F6 pode durar 20 minutos, mas o supervisor heavy tem timeout 600 s, inferior ao timeout do job de 1.200 s e ao worker calculado por HeavyReportsQueue. O efeito provável é interrupção prematura, job reaparecendo após 660 s e estado dependente da reconciliação. O lock de TrackOperationalExecution dura 720 s (app/Jobs/Middleware/TrackOperationalExecution.php:35-44), também menor que o timeout de 1.200 s; uma segunda entrega após expiração pode iniciar processamento duplicado.

   RunRegisteredOperationalTask declara tries=1 e converte exceções em falha persistida sem relançá-las (app/Jobs/Operations/RunRegisteredOperationalTask.php:24-40,82-107), eliminando retry automático para indisponibilidade transitória. Nos jobs fiscais auditados há tries=3, mas não foram encontrados backoff()/retryUntil() específicos. A conexão Redis tem after_commit=false (config/queue.php:67-83), enquanto parte do código usa DB::afterCommit manualmente; a segurança contra publicação de dados não confirmados depende de disciplina local.

3. **Outbox fiscal e semântica de entrega — alto, confiança alta.** O cloud_fiscal_outbox contém estado, tipo, emissão, comando e criação, sem tentativas, lease, próximo retry, erro ou timestamp de processamento (database/migrations/2026_08_10_334001_cloud_fiscal_emissoes.php:90-100). Os dispatchers publicam e depois marcam entregue; crash entre as duas operações duplica a mensagem (FiscalNfeOutboxDispatcher.php:33-65). IDs no payload e guardas de domínio ajudam a idempotência dos handlers, mas não substituem claim atômico nem contrato de deduplicação.

   O outbox de projeção de transferência é um contraste positivo: tem chave de idempotência, tentativas, next_attempt_at, erro, estado morto e claim condicional (database/migrations/2026_08_12_360001_cloud_trf_projecao_outbox.php:20-35; app/Infrastructure/Persistence/Cloud/Interlojas/CloudTransferenciaFiscalProjecaoOutboxRepository.php:79-160). Contudo seu sweep não está em routes/console.php.

4. **Outbox não persistente e sweeps — médio/alto, confiança alta.** FiscalEspelhamentoOutboxDispatcher e FiscalObservadorOutboxDispatcher apenas criam e despacham jobs, gerando correlação aleatória (app/Infrastructure/Fiscal/Queue/FiscalEspelhamentoOutboxDispatcher.php:17-46; FiscalObservadorOutboxDispatcher.php:13-27). Não há intenção persistida para replay se Redis ou o callback afterCommit falhar. Os polls e varreduras reduzem o risco, mas não fornecem a mesma garantia do outbox persistente.

   Há comandos para fiscal:artefatos-sweep, fiscal:distribuicao-sweep e transferencia-fiscal:projecao-sweep, mas routes/console.php:85-108 agenda apenas fiscal:reconciliacao-sweep. A recuperação dessas intenções fica dependente de operação manual ou de chamada não visível nesta superfície.

5. **Scheduler e reconciliação — médio, confiança alta.** operations:tick usa everyMinute, withoutOverlapping e onOneServer (routes/console.php:17-20), e persiste janelas/ocorrências, evita sobreposição, classifica ocorrências perdidas/bloqueadas e recupera publicações (app/Console/Commands/OperationalSchedulerTickCommand.php:29-171). O reconciliador recupera despachando, heartbeats expirados e estados aguardando despacho (app/Console/Commands/ReconcileOperationalExecutions.php:27-46,94-113).

   A exceção do JobRepository do Horizon é capturada e ignorada (ReconcileOperationalExecutions.php:30-34). A healthcheck do scheduler só testa a existência do processo schedule:work (docker-compose.prod.yml:226-247), não o último tick, sucesso dos comandos ou atraso de cada sweep.

6. **Estado/progresso de jobs pesados — médio, confiança alta.** GerarJobStore::mergeUnlessTerminal e touchUnlessTerminal fazem read-modify-write sem lock/CAS (app/Support/Database/GerarJobStore.php:101-143), enquanto heartbeat, progresso, poll e conclusão podem concorrer. O próprio código reconhece falso positivo e tenta recuperar failed -> ready (GerarJobStore.php:146-179), mas ainda permite perder campos/estado em atualizações concorrentes.

7. **Observabilidade operacional — médio/alto, confiança alta.** A topologia operacional calcula somente default, marketplace-sync e heavy-reports (app/Infrastructure/Operations/HorizonOperationalTopology.php:21-24,63-81); as oito filas fiscais aparecem no FiscalPulseRecorder, mas o snapshot é coletado quando o painel fiscal é acessado (app/Infrastructure/Fiscal/Observability/FiscalPulseRecorder.php:29-58). Não há visão contínua nem integrada do backlog fiscal. O fallback de HorizonOperationalTopology captura qualquer exceção e retorna error sem registrar a causa (HorizonOperationalTopology.php:38-60).

   Há bons fundamentos: heartbeat com release e TTL de 60 s (RecordHorizonSupervisorHeartbeat.php:14-38), health temporal fresh/stale (OperationalHealthService.php:24-38,158-167), logs em stderr no Compose (docker-compose.prod.yml:111-149) e correlação de request. Porém config/observability.php:13-20 deixa log_full_sql=true por padrão; o provider registra SQL e bindings de queries lentas (app/Providers/ObservabilityServiceProvider.php:17-42). O redator só mascara strings maiores que 2.000 bytes (app/Support/Observability/SensitiveDataRedactor.php:30-38,90-96), não sendo garantia contra segredos curtos em parâmetros posicionais.

8. **Sentry/Pulse/Telescope — médio, confiança alta.** Sentry está preparado, com send_default_pii=false, tracing de jobs/SQL/HTTP configurável e breadcrumbs (config/sentry.php:10-12,29-51,62-142), mas DSN e traces_sample_rate dependem do ambiente; sem SENTRY_TRACES_SAMPLE_RATE, tracing de performance não fica garantido. Alertas fiscais no Sentry também são feature-gated (app/Infrastructure/Fiscal/Observability/FiscalCriticalAlertBridge.php:22-43).

   Pulse usa banco por padrão, retenção de sete dias e middleware autenticado (config/pulse.php:46-69,83-97,123-126). Telescope tem gate administrativo e filtro de entradas não locais (app/Providers/TelescopeServiceProvider.php:43-59,65-89), e fica desativado no worker heavy. Em ambiente local, a ocultação retorna cedo (TelescopeServiceProvider.php:65-69), permitindo captura ampla de parâmetros. Não há evidência de exportação/centralização de logs, métricas ou traces além desses produtos e das tabelas operacionais; Horizon retém jobs recentes por uma hora e falhas por sete dias (config/horizon.php:117-124).

9. **Alertas externos e duplicidade — médio, confiança alta.** A entrega de alertas é at-least-once: o provider externo é chamado antes do status entregue; uma interrupção deixa processando, que o scheduler reabre após dez minutos (routes/console.php:41-50; app/Application/Operations/OperationalAlertDeliveryService.php:19-81). O delivery_id é enviado e assinado, permitindo deduplicação no receptor, mas não foi localizado contrato que a exija. Duplicidade de notificações é possível.

### Recomendações para o roadmap

- Tornar a topologia de produção uma matriz verificável: cada fila/envelope declarado deve ter consumidor, healthcheck, monitor e alerta; o deploy deve falhar quando houver configuração sem consumidor.
- Validar por job o contrato job timeout < worker timeout < retry_after, incluindo o maior timeout dinâmico e o TTL do lock.
- Remodelar o outbox fiscal com claim/lease transacional ou atualização condicional, tentativas, backoff, dead-letter, requeue explícito e reconciliação periódica; manter handlers idempotentes.
- Persistir a intenção de espelhamento/observador ou provar que poll/varredura recompõe toda perda; agendar todos os sweeps existentes.
- Incorporar todas as filas fiscais à topologia operacional e coletar métricas continuamente; registrar a causa original nos fallbacks e falhas de reconciliação.
- Exigir idempotência do receptor de alertas por delivery_id.
- Ajustar defaults de produção para não registrar SQL completo/bindings sensíveis; definir DSN, release, sampling, retenção e destino centralizado de logs/traces como contrato de deploy.
- Adicionar smoke tests reais com Redis, Horizon, scheduler e um consumidor por fila. Os testes atuais usam Queue::fake em fluxos de ciclo de vida (tests/Feature/Operations/HeavyReportLifecycleTest.php:68-168), mas não demonstram o caminho completo publicação-consumo-retry-reconciliação.

### Conclusão

O projeto tem padrões modernos e valiosos — filas isoladas, outboxes idempotentes em partes críticas, estados operacionais, heartbeat, reconciliação e controles de acesso às ferramentas — porém a confiabilidade efetiva é limitada por drift de deploy, timeouts contraditórios, claim fiscal não atômico, sweeps não agendados e telemetria fiscal incompleta. Até esses contratos serem alinhados, o comportamento real é majoritariamente at-least-once, com caminhos que podem ficar indefinidamente pendentes ou exigir intervenção manual.

## Question

Qual é a maturidade da execução assíncrona e operacional da Plataforma Laravel — Horizon, Redis, scheduler, jobs, retries, timeouts, idempotência, outbox, dead letters, health checks, logs, métricas, tracing, Sentry/Pulse/Telescope e reconciliação — e onde há riscos de duplicidade, perda, indisponibilidade ou diagnóstico insuficiente?
