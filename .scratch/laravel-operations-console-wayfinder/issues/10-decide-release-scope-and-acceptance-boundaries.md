# Decide release scope and acceptance boundaries

Type: grilling
Status: resolved
Blocked by: 03, 06, 07, 08, 09

## Question

What is the smallest coherent first release, which existing job families and tasks must be fully manageable at launch, and what observable acceptance and rollout criteria make the specification ready for implementation handoff?

## Comments

## Answer

The smallest coherent first release is an environment-local, system-Administrator-only Operations Console that observes every registered queue, Horizon processor group, job, task, schedule, execution, alert, and administrative action through sanitized Portuguese projections. It provides safe queue-wide controls for every allowlisted queue, predefined schedule management for every migrated task, and full individual lifecycle management only for the `heavy-reports` family.

All other legacy job families launch as **Observados**. The UI must state that limitation and omit individual suspend, cancel, delete, retry, progress, or reconcile actions whose declared management level cannot guarantee them. Marketplace promotion and Busca Assistida remain later managed-job adoption work, not hidden commitments of this release.

### Included release capability

- Health-first landing page, decision inbox, resource detail/timeline, secondary topology, history, retention, alert, and immutable audit views, entirely in Brazilian Portuguese.
- Horizon-backed observation of `marketplace-sync`, `default`, and `heavy-reports`, with environment identity visible on every page and action.
- Fixed-capacity `horizon-default` and `horizon-heavy-reports` services, application readiness, release heartbeats, graceful deploy, and per-envelope rollback.
- Pause/resume and other previously approved queue-wide actions for allowlisted targets, with actual-vs-intended reconciliation.
- Registry coverage for every current scheduled task; enable/disable, restore default, allowed preset/fuso changes, permitted manual execution, previews, locks, and occurrence history.
- Managed dispatch, sanitized progress, retry eligibility, cooperative suspend/cancel, pending deletion, and reconciliation for the heavy-report cohort.
- Health budgets, durable alerts, acknowledgement/recovery, email, signed generic webhook, maintenance windows, and independent delivery tracking.
- Automatic retention, immediate deletion, preservation holds, purge reconciliation, aggregated metrics, and the agreed audit lifecycle.
- Server-side authorization, recent password reauthentication, typed confirmation, mandatory reason, single-use challenge, idempotent commands, optimistic concurrency, rate limits, and append-only audit for every mutation.

Arbitrary commands or arguments, raw payload inspection, custom cron, UI capacity/scaling changes, cross-environment control, individual worker termination, generic running-job kill, unregistered task execution, SMS/vendor integrations, and management guarantees for other legacy jobs are explicitly absent. Their absence is visible in product copy and API authorization, not merely hidden navigation.

### Release-blocking acceptance

Acceptance uses production-like Redis, database, Horizon, scheduler, email sink, and webhook receiver. Every requirement has an automated or runbook test linked to its originating decision.

1. **End-to-end operator journey:** a system Administrator can identify a simulated incident, inspect only sanitized context, perform an allowed action with reauthentication/phrase/reason, follow it through terminal state or reconciliation, and find immutable audit evidence afterward. All text, errors, dates, time zones, confirmations, and accessibility labels are pt-BR.
2. **Authorization and isolation:** non-system Administrators receive server-side denial for every page, query, export, and command. Forged identifiers cannot cross the current deployment environment. Tests prove there is no endpoint, Horizon dashboard route, cache key, Redis prefix, alert link, or export that crosses environments.
3. **Sensitive-data boundary:** fixture payloads containing credentials, tokens, personal data, headers, model attributes, stack traces, and paths never appear in HTML, JSON, search, logs produced by the console, metrics, alerts, webhook bodies, exports, or audit projections. Only allowlisted Resumos Operacionais pass contract tests.
4. **Mutation safety:** concurrency, double-click, HTTP retry, stale revision, target-state race, Redis outage, database outage, worker crash, and reconciliation retry tests produce at most one intended effect and one durable command identity. Audit failure closes the action. Every partial outcome remains visible and reconcilable.
5. **Managed-job contract:** the heavy-report cohort passes identity, after-commit dispatch, duplicate delivery, retry, timeout, heartbeat, monotonic progress, checkpoint response, cancellation, suspension/resumption, pending-deletion race, sanitized failure, and ambiguous-result tests. No unsupported action is returned for an Observed job.
6. **Scheduling:** registry inventory equals all current production task definitions; parity tests cover presets, fuso, locks, availability, and next occurrences. Multiple ticks/restarts create one occurrence, DST scenarios run a civil window at most once, override changes affect only the future, and legacy definitions cannot run concurrently with the registry tick.
7. **Health and alerts:** deterministic clock-driven tests cover degradation, criticality, unknown telemetry, hysteresis, deduplication, acknowledgement, escalation, sustained recovery, maintenance expiry, outbox retry, webhook signature/replay rejection, and channel failure without recursion. External backlog alerts remain disabled until the agreed 14-day baseline is reviewed.
8. **Retention:** boundary-time tests cover every record class, aggregation before pruning, immediate deletion, active preservation/refusal, release grace, partial purge reconciliation, expiry of exports, and restored-backup purge-ledger replay. Raw failed payloads disappear after the technical retry window while sanitized history and audit retain their independent clocks.
9. **Deployment and rollback:** staging and production-like drills prove one consumer envelope at a time, strict normal-queue priority, timeout below `retry_after`, no duplicate legacy/Horizon consumers, graceful `horizon:terminate`, new-release readiness, scheduler exclusivity, payload backward compatibility, and successful restoration of each legacy worker without rewriting pending Redis jobs.
10. **Usability and accessibility:** the supported browsers pass keyboard-only operation, focus management, semantic names, contrast, non-color status cues, destructive-dialog comprehension, empty/loading/stale/error states, and responsive layouts at WCAG 2.1 AA. Five representative Administrator scenarios complete without consulting Horizon or database tooling.
11. **Operational quality:** at representative retained-data and queue volumes, the health landing and primary lists meet an agreed test-plan budget of p95 at or below 2 seconds; command acknowledgement is p95 at or below 1 second while execution remains asynchronous. No correctness gate depends on these latency targets being hidden by stale data.

No production enablement occurs with a critical security defect, data-loss defect, unbounded retry/duplicate-execution defect, missing audit evidence, unresolved accessibility blocker, failed rollback drill, or unexplained mismatch between Console and Horizon/scheduler state.

### Rollout gates

Capabilities ship behind server-side, environment-local flags with independent kill switches for observation, queue controls, managed-job controls, schedule mutations, external alert delivery, and immediate deletion. Flags can remove mutation authority but cannot bypass audit or safety rules.

1. Run the complete suite and a continuous seven-day staging soak, including fault injection and one rollback drill per Horizon envelope.
2. Deploy production infrastructure and read-only observation first. Compare Console projections with Horizon, Redis, scheduler, and database evidence for 48 hours; resolve unexplained divergence before proceeding.
3. Enable heavy-report managed controls for a named Administrator cohort for 72 hours. Stop on duplicate effects, missing audit, stale health, unsafe checkpoint latency, or reconciliation backlog outside its budget.
4. Enable schedule mutations, then queue-wide controls, each with a 72-hour observation gate and tested kill switch. Existing work is never dual-scheduled or dual-consumed.
5. Collect 14 days of production telemetry, approve per-queue baselines, then enable external backlog alert delivery. Email and webhook test deliveries must already pass independently.
6. Declare the first release complete only after seven additional days without a release-blocking condition, all runbooks and ownership/escalation contacts are approved, and support Administrators have completed the representative scenarios.

Rollback or flag disablement is mandatory when a stop condition fires; it is not deferred to a later retrospective. Rollout evidence records timestamps, release identifiers, approver, observed metrics, divergences, stop/go decision, and rollback result.

### Implementation handoff boundary

The specification is ready for implementation handoff when these ten Wayfinder decisions, the pt-BR prototype, glossary, framework research, current task/job inventory, state transitions, sanitization schemas, authorization matrix, API/command contracts, migration/rollback runbook, retention matrix, alert rules, and acceptance traceability are available to implementation tickets. Implementation must preserve decision names as traceability links and may split delivery vertically, but cannot silently weaken a release-blocking criterion.

No additional decision ticket is exposed by this answer. With every child decision resolved and no remaining fog, the Wayfinder destination is reached; subsequent work belongs in an implementation specification/ticket effort rather than this planning map.
