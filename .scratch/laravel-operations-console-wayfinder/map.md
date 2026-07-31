# Laravel Operations Console

Label: wayfinder:map
Status: resolved

## Destination

Reach an implementation-ready product and architecture specification for an environment-isolated Laravel Operations Console through which system Administrators can safely observe and manage queues, workers, jobs, scheduled tasks, retention, and operational alerts.

## Notes

- Context: Laravel platform (`laravel/`), Laravel 13, Redis queues, Docker worker services, and scheduler process.
- Use `/grilling` and `/domain-modeling` for product and domain decisions, `/research` for external framework facts, and `/prototype` for the Administrator UI.
- Planning only: this map resolves decisions and hands off a specification; it does not implement the console.
- Settled destination constraints: Horizon foundation; environment isolation; system Administrators only; sanitized metadata; incremental managed-job adoption; predefined schedule overrides; no arbitrary commands, raw payloads, custom cron, worker scaling, or cross-environment control.
- Every destructive action requires recent password re-authentication, typed confirmation, a mandatory reason, and immutable audit logging.
- External alerting in the first release is email plus generic signed webhook.

## Decisions so far

<!-- Closed ticket decisions are indexed here; detail remains in the ticket. -->

- [Establish Horizon and scheduler capability boundaries](issues/01-establish-horizon-and-scheduler-capability-boundaries.md) — Horizon owns Redis observability and coarse controls; the application owns safe job/task controls, auditing, and durable history.
- [Define the operational domain model](issues/02-define-the-operational-domain-model.md) — Durable operational executions and attempts are separate from Horizon jobs, with explicit Portuguese lifecycle, task, alert, and audit concepts.
- [Design the Operations Console experience](issues/03-design-the-operations-console-experience.md) — Use a health-first landing page with a prominent decision inbox and a secondary topology view for technical diagnosis.
- [Decide the managed-job contract and adoption boundary](issues/04-decide-the-managed-job-contract-and-adoption-boundary.md) — Use durable dispatch plus middleware and cumulative Observed, Managed, Controllable, and Reconcilable capability levels, migrating heavy ERP reports first.
- [Decide scheduled-task registration and overrides](issues/05-decide-scheduled-task-registration-and-overrides.md) — Use a code registry plus one durable scheduler tick, with constrained presets, audited overrides, shared locks, and occurrence history.
- [Decide destructive-operation semantics](issues/06-decide-destructive-operation-semantics.md) — Execute every mutation as a reauthenticated, single-use, idempotent audited command with CAS, cross-store reconciliation, and explicit per-operation outcomes.
- [Define health and alert semantics](issues/07-define-health-and-alert-semantics.md) — Calculate per-resource health from operational budgets with hysteresis, and deliver durable deduplicated alerts through independent email and signed-webhook channels.

- [Decide Horizon deployment and migration](issues/08-decide-horizon-deployment-and-migration.md) - Replace legacy workers one isolated envelope at a time with two fixed-capacity Horizon services, compatibility-gated deploys, application-level readiness, and reversible per-envelope cutovers.
- [Set retention and operational-data boundaries](issues/09-set-retention-and-operational-data-boundaries.md) - Separate short-lived runtime payloads from sanitized operational history, aggregated metrics, 13-month alerts, and five-year immutable audit, with guarded immediate deletion and scoped preservation.
- [Decide release scope and acceptance boundaries](issues/10-decide-release-scope-and-acceptance-boundaries.md) - Launch observation and safe collective controls across the platform, full management for heavy reports, complete task-registry control, and staged evidence-based gates before production completion.

## Not yet specified

No remaining fog. Every child decision is resolved and the implementation-ready planning destination has been reached.

## Out of scope

- Implementing the Operations Console as part of this Wayfinder effort.
- Arbitrary Artisan command or argument execution.
- Raw serialized job-payload access in the browser.
- Custom cron expressions.
- Worker autoscaling or capacity changes from the application UI.
- One console controlling multiple deployment environments.
- SMS and vendor-specific alert integrations in the first release.
