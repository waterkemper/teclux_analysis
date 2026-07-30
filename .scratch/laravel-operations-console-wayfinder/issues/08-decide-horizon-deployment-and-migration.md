# Decide Horizon deployment and migration

Type: grilling
Status: resolved
Blocked by: 01

## Question

How should the existing Docker queue workers and scheduler migrate to Horizon across environments while preserving queue priorities, timeouts, graceful deploy behavior, health checks, and rollback safety?

## Comments

## Answer

Adopt Horizon through an envelope-by-envelope replacement, keeping Docker as the process supervisor and retaining the scheduler as a separate service. The first production topology has two Horizon masters rather than one shared master:

- `horizon-default` serves `marketplace-sync,default` with fixed capacity, three attempts, and a 120-second worker timeout. Queue order remains strict (`balance=false`); automatic balancing is not introduced during migration.
- `horizon-heavy-reports` serves only `heavy-reports`, with fixed capacity, one attempt, a 600-second worker timeout, and the existing 1 GiB PHP/container resource envelope.
- Each service activates only its own named supervisor. Master, supervisor, Redis-prefix, and metrics identities include the application and deployment environment, so environments cannot discover or control one another.
- `scheduler` continues to run `schedule:work`. After the task-registry migration it owns the single durable operational tick plus Horizon's five-minute metrics snapshot; it never runs in parallel with legacy definitions for the same task.

Install and lock the official Horizon package compatible with Laravel 13, but expose the Operations Console through application-owned adapters rather than Horizon's HTTP dashboard or undocumented endpoints. Disable the native dashboard in production; it may remain development/support-only behind an explicit authorization gate. Production and staging run the two Horizon services, local development enables them through an opt-in Compose profile, and automated tests do not require a Horizon daemon.

### Runtime invariants

Preserve the current queue names and initial process counts. Introduce two Laravel Redis queue connections, even when both point to the same Redis server: the normal connection uses `retry_after=150` for the 120-second timeout, and the heavy connection uses `retry_after=660` for the 600-second timeout. Every worker timeout must remain safely below its connection's `retry_after`; deployment preflight rejects an invalid combination. Existing production's global `REDIS_QUEUE_RETRY_AFTER=720` is safe but becomes a compatibility fallback, not the final per-envelope configuration.

Use a dedicated Horizon metadata Redis connection or namespace with a unique application/environment prefix. Queue payload connections remain distinct from Horizon metadata configuration. Redis used for queues must use a non-evicting policy and monitored capacity. Job routing and serialization have contract tests proving that both current and immediately previous release images can deserialize payloads during the rollback window.

Container liveness checks prove that the Horizon master is running. Application readiness additionally proves that the expected master and supervisor are active, Redis is reachable, telemetry/heartbeat is fresh, the configured queues match the envelope, and the worker release identifier matches the deployed image. A healthy PID or Redis `PING` alone is insufficient. The existing web `/up` remains a web-process check rather than pretending to represent queue health.

### Cutover

Perform the migration first in staging, then in production one envelope at a time. Migrate `heavy-reports` first because it is isolated and is the initial managed-job cohort; migrate `marketplace-sync/default` together afterward so their priority relationship is never split between supervisors.

For each envelope: deploy backward-compatible code and configuration; stop new dispatch briefly; let the legacy worker finish its reserved job; stop that worker; verify there is no legacy consumer; start the corresponding Horizon service; verify supervisor identity, release, queue set, failures, pending age, and throughput; then resume dispatch. Pending Redis jobs are not moved or rewritten. Never allow legacy and Horizon consumers for the same envelope during the gate. Advance only after an observation window passes the health budgets defined by the console.

During normal deploys, publish backward-compatible migrations and code, then issue `php artisan horizon:terminate` inside each Horizon service. Docker restarts the master and Horizon lets active work finish. Configure stop grace periods above the longest envelope timeout (at least 180 seconds for normal work and 660 seconds for heavy reports), restart the scheduler separately, and declare the deploy healthy only after the new release heartbeat appears. Do not use `queue:restart` for Horizon.

### Rollback

Keep the legacy worker service definitions available but disabled for one full release. To roll back an envelope, stop dispatch, terminate Horizon gracefully, verify no active or reserved job remains, stop its Horizon service, start the legacy worker with the identical queue order, attempts, timeout, and connection, verify its release heartbeat, and resume dispatch. Do not uninstall Horizon, delete Horizon data, revert queue migrations, or rewrite pending payloads during incident rollback.

Code and payload changes follow an expand/contract window: the previous release must understand all pending payloads emitted by the current release until its queues are drained. If that compatibility check fails, rollback is blocked and recovery proceeds forward. Scheduler rollback is independent and uses one mutually exclusive feature switch between the task-registry tick and legacy schedules; occurrence idempotency prevents a due task from running twice.

The deployment runbook must contain explicit go/no-go checks and rollback commands for each envelope. Removal of legacy workers, compatibility switches, and fallback configuration happens only in a later release after production evidence shows stable backlog age, throughput, failures, timeouts, and scheduler occurrences.
