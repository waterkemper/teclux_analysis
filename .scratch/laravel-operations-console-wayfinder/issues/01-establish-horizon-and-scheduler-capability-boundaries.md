# Establish Horizon and scheduler capability boundaries

Type: research
Status: resolved
Blocked by:

## Question

Which required Operations Console capabilities are provided safely by Laravel 13, Horizon, queue events, and the scheduler, and which require application-owned persistence or control services—especially worker health, pause/resume, pending-job deletion, cancellation, retries, schedule discovery, run history, and metrics?

## Comments

## Answer

Horizon owns Redis observation, metrics, failed-job primitives, and coarse controls; lifecycle events are inputs. The application owns stable identities, sanitized projections, authorization/audit, individual pending-job suppression, cooperative cancellation, schedule presets/disablement, safe manual runs, durable history, retention, and alerts. Preserve `default`/`marketplace-sync` and `heavy-reports` as separate supervisor envelopes. Evidence: [Laravel 13 / Horizon capability boundary](../research/horizon-and-scheduler-capabilities.md).
