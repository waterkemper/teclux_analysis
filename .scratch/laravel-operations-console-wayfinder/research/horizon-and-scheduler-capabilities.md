# Laravel 13 / Horizon capability boundary

## Decision

Use Horizon for Redis worker supervision, current queue/job observation, failed-job primitives, and operational metric snapshots. Put all Administrator actions behind an application-owned Operations layer providing stable identity, sanitized projections, authorization, immutable audit, destructive-action safeguards, and durable state.

| Need | Safe framework boundary | Application-owned requirement |
| --- | --- | --- |
| Worker health | Horizon reports master and named-supervisor status. | Define missing/stale health and persist alert state; coarse status cannot prove every worker healthy. |
| Pause/resume | Horizon pauses the master/supervisor. Laravel 13 pauses a `connection:queue`; running work finishes. | Allowlist targets, audit and reconcile intent; pause is not cancellation and core pause requires interruption polling. |
| Pending deletion | Horizon clears a whole queue. | No documented safe atomic single-pending-job delete exists. Managed executions need stable IDs and cooperative tombstone/skip; legacy jobs stay view-only. |
| Cancellation | Laravel supports cooperative batch cancellation. | No generic running-job kill exists. Managed jobs require checkpoints; deleting metadata never stops work. |
| Failed jobs | Laravel retries failed IDs/queues/batches; Horizon forgets one/all failed jobs. | Enforce eligibility/idempotency and retain audit after framework payload removal. |
| Schedules | `schedule:list` discovers code-defined tasks; Laravel can pause all schedules. | Stable registry keys, per-task predefined overrides/disablement, defaults, and allowlisted manual-run services. `schedule:test` is interactive, not an admin API. |
| History | Queue/scheduler lifecycle events expose starts, finishes, skips, failures, retries, timeouts, and idle state. | Events are ingestion hooks, not storage. Persist sanitized, duplicate-tolerant execution records and correlations. |
| Metrics/alerts | Horizon snapshots throughput/wait; `queue:monitor` emits count-threshold `QueueBusy`. | Persist oldest-pending, failure-rate, missed-run, dedup/recovery, retention, and audit state. |

## Local evidence

- `laravel/backend/composer.json` uses Laravel 13 but does not install Horizon. Redis is configured, so Horizon is compatible but requires package/runtime migration.
- Compose separates `default`, `marketplace-sync`, and `heavy-reports` behavior. Default/marketplace uses three tries and 120-second timeout; heavy reports uses one try, 600 seconds, and 1 GiB memory. Preserve these as separate Horizon supervisors.
- Schedules are split across `bootstrap/app.php` and `routes/console.php`, with commands, jobs, config-dependent frequencies, `withoutOverlapping`, and `onOneServer`. Registry/reconciliation must cover both and preserve locks.
- One current filter schedule accepts raw cron, so the console's preset-only rule must live in its registry rather than be inferred from existing config.

## Primary sources

- [Laravel 13 Horizon](https://laravel.com/docs/13.x/horizon)
- [Laravel 13 queues](https://laravel.com/docs/13.x/queues)
- [Laravel 13 scheduling](https://laravel.com/docs/13.x/scheduling)
- [Laravel 13 queue event API](https://api.laravel.com/docs/13.x/Illuminate/Queue/Events.html)
- [Laravel 13 ScheduleTestCommand](https://github.com/laravel/framework/blob/13.x/src/Illuminate/Console/Scheduling/ScheduleTestCommand.php)

