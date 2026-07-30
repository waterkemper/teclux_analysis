# Set retention and operational-data boundaries

Type: grilling
Status: resolved
Blocked by: 01, 02, 04, 05

## Question

Which successful, failed, cancelled, deleted, scheduled, metric, alert, and audit records are retained in each store; how do the agreed 30-day success and 90-day failure defaults interact with purge-now, legal/audit preservation, and sensitive-data minimization?

## Comments

## Answer

Use purpose-limited stores with independent retention clocks. Retention starts when a record reaches a terminal state; an active, pending, running, suspended, or reconciling execution is never aged out. All user-facing labels and explanations are in Brazilian Portuguese. Durations are deployment policy, not editable from the Operations Console.

### Store boundaries and defaults

| Store / record | Retention | Boundary |
| --- | --- | --- |
| Redis pending/reserved payload | Until consumed, explicitly removed, or dead-lettered | Runtime transport only; never a history source. |
| Framework failed-job payload | 7 days | Short technical retry window. Purging it makes the attempt ineligible for framework retry but does not remove operational history. Payload is never exposed in the console. |
| Horizon recent/pending/completed metadata | 60 minutes for recent/pending and 24 hours for completed | Ephemeral diagnosis only; Horizon pruning is enabled and Horizon is not the durable record. |
| Horizon failed metadata | 7 days | Aligned with the technical retry window; the application keeps the longer sanitized projection. |
| Successful operational executions and attempts | 30 days after terminal completion | Includes sanitized summary and timing; payloads and business objects are excluded. |
| Failed, cancelled, definitively suspended, deleted, skipped, or missed executions and attempts | 90 days after terminal outcome | Preserves exception diagnosis. Deletion leaves only its allowed sanitized history and audit evidence. |
| Current task definition, presets, and effective schedule | While the task exists | Canonical definition remains code-owned; the database stores only stable identity and effective administrative state. |
| Superseded schedule/override versions | 13 months | Occurrences use 30 days for success and 90 days for failure, cancellation, skip, or missed run. |
| Alert lifecycle and delivery attempts | 13 months after resolution | Stores condition, resource, acknowledgement/recovery, actor, channel outcome, and a sanitized snapshot; never secrets or full webhook/email bodies. |
| Administrative audit | 5 years | Immutable minimum evidence: actor, environment, action, sanitized target, reason, timestamps, confirmation evidence, intended transition, and result. No credential, payload, token, or secret. |

Metrics are deliberately aggregated: five-minute resolution for 30 days, hourly aggregates for 90 days, and daily aggregates for 13 months. Metrics contain no job identifier, payload, free-form business value, or personal data. Rollups are produced before source buckets expire; aggregation never resets a record's retention clock.

### Minimization and inspection

The durable application database stores allowlisted, versioned Resumos Operacionais. Error data is limited to exception class, stable fingerprint, sanitized message/category, selected stack locations where approved, and correlation identifiers. Raw stack traces, serialized jobs, command arguments, credentials, headers, webhook secrets, and arbitrary model attributes are excluded. The console reads only these projections and never reconstructs history from Redis or Horizon.

Generated exports are encrypted, access-controlled, and automatically destroyed within 24 hours; creating an export is audited and does not extend source retention. External alert deliveries persist endpoint identity, status, timing, attempt count, and content digest, not secret headers or full transmitted bodies.

### Immediate deletion and preservation

Exclusão Imediata Operacional is allowed only for terminal, retention-eligible operational detail. It requires the destructive-action safeguards already decided, marks the target with an idempotent purge command, removes eligible application detail plus corresponding Horizon/failed-payload material, and preserves a sanitized tombstone and the five-year administrative audit. It cannot erase or shorten audit evidence.

Preservação Operacional is a scoped, reasoned, time-bounded hold applied to identified records by an authorized backend process or compliance role, not an ordinary console toggle. A hold freezes otherwise eligible deletion without collecting additional data or revealing restricted fields. It always records authority, reason, scope, start, review/expiry, release, and actor. Immediate deletion is refused while a matching hold is active. On release, records already beyond policy receive a seven-day review grace period and are then purged automatically.

Automatic and immediate purge use the same idempotent service and emit counts, failures, policy version, and completion evidence. Partial cross-store deletion remains reconcilable and visible until every store confirms the outcome. Purge order removes retryable/raw material first, then detailed projections, while committing the minimal tombstone and audit evidence transactionally where possible.

### Backups and enforcement

Backups are encrypted and inaccessible to the console. Operational backups have a documented maximum lifecycle of 35 days and are not selectively rewritten; restore procedures must replay the durable purge ledger before restored data becomes available. Audit backups may follow the five-year audit lifecycle but remain segregated. A deletion is therefore immediate in live systems and bounded by the declared backup lifecycle for disaster-recovery copies, which the confirmation UI states explicitly.

A daily retention task evaluates terminal timestamps using database time, acquires a singleton lock, processes bounded batches, and is safe to retry. Monitoring alerts on overdue eligible records, pruning failures, unreconciled cross-store purges, expired holds, missing rollups, and policy/configuration drift. Acceptance tests seed every record class at each boundary, verify preservation and release, prove raw payloads are unavailable to administrators, and exercise restore-plus-purge-ledger replay.
