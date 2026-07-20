# F6 — Exclusão e Cancelamento do Orçamento

Status: ready-for-agent
Label: ready-for-agent

## Problem Statement

O comando F6 do Cadastro de Orçamentos Laravel não representa corretamente as operações distintas do Delphi. O legado permite configurar Exclusão física, Cancelamento, pergunta entre ambas ou nenhuma ação; o Laravel lê esse Parâmetro do Sistema como booleano e a tela sempre solicita Cancelamento com uma descrição fixa. Assim, não expõe os modos configurados, não coleta Motivo/descrição corretamente e não explica as consequências ao Usuário.

O Cancelamento Laravel atual altera poucos campos do cabeçalho, sem comprovar a criação do Atendimento de Cancelamento, a invalidação de e-mails pendentes ou o registro explícito do Usuário. A Exclusão física remove apenas Planos/Parcelas, Produtos e cabeçalho, embora existam Serviços e outros vínculos. Também não verifica de forma comprovada Contrato, Documento Fiscal, Atendimento, envio registrado ou outro uso que deva impedir a destruição do histórico.

## Solution

Transformar F6 em um comando contextual que distingue descarte de rascunho, Cancelamento e Exclusão definitiva. Resolver o modo `E`, `C`, `P` ou `N` do Parâmetro do Sistema por Filial e combinar essa configuração com Situação, Permissão e elegibilidade real do Orçamento.

O Cancelamento preservará o Orçamento e seus componentes, exigirá Motivo, coletará descrição conforme parâmetro, registrará data/hora e Usuário, criará Atendimento quando houver Cliente e a descrição obrigatória, invalidará somente e-mails pendentes e persistirá tudo atomicamente. A Exclusão física será uma operação excepcional, disponível somente para Orçamento aberto sem qualquer vínculo ou uso relevante, removendo todos os dados exclusivamente pertencentes ao Orçamento em uma transação. Um rascunho ainda não persistido será apenas descartado.

## User Stories

1. As a Usuário de Orçamentos, I want F6 to follow the configured operation mode, so that system policy is respected.
2. As a Usuário, I want Cancelamento and Exclusão named separately, so that I understand whether history will remain.
3. As a Usuário, I want mode `C` to offer only Cancelamento, so that destructive deletion is not exposed.
4. As a Usuário, I want mode `E` to offer Exclusão only when the Orçamento is eligible, so that configured cleanup remains safe.
5. As a Usuário, I want mode `P` to present both eligible actions and consequences, so that I can choose intentionally.
6. As a Usuário, I want mode `N` to disable F6, so that no operation is inferred from an unknown value.
7. As a Usuário, I want the button and F6 shortcut to execute the same command, so that behavior is consistent.
8. As a Usuário, I want a new unsaved Orçamento discarded after confirmation, so that no domain Cancelamento is fabricated.
9. As a Usuário, I want unsaved changes on a persisted Orçamento handled explicitly before F6, so that the operation does not act on an ambiguous version.
10. As a Usuário, I want only an open Orçamento to be cancellable, so that finalized history is protected.
11. As a Usuário, I want a Motivo required for Cancelamento, so that the business reason is structured.
12. As a Usuário, I want only active Motivos for Sales shown, so that obsolete reasons cannot be selected.
13. As a Usuário, I want description required when `Obrigar digitação ao excluir` is active, so that configured detail is captured.
14. As a Usuário, I want optional description accepted when the parameter is inactive, so that useful context can still be recorded.
15. As a Usuário, I want to review Situação, Motivo and description before confirming, so that accidental cancellation is avoided.
16. As a Usuário, I want Cancelamento to preserve Products, Services, Plans and Installments, so that the proposal history remains complete.
17. As a Usuário, I want Cancelamento to record date/time and responsible Usuário, so that responsibility is traceable.
18. As a Usuário, I want a Cliente-linked mandatory description recorded as a Cancellation Atendimento, so that customer history explains the event.
19. As a Usuário, I want an Orçamento without Cliente cancelled without creating a fake Cliente, so that master data remains truthful.
20. As a Usuário, I want an Orçamento without Cliente to keep Motivo and description in the Orçamento, so that the reason is not lost.
21. As a Usuário, I want pending Orçamento emails invalidated on Cancelamento, so that a cancelled proposal is not sent later.
22. As a Usuário, I want sent, processed or failed email records preserved, so that communication history remains auditable.
23. As a Usuário, I want Exclusão to require a stronger explicit confirmation, so that irreversible action is unmistakable.
24. As a Usuário, I want Exclusão blocked when a Contract exists, so that derived commercial history is preserved.
25. As a Usuário, I want Exclusão blocked when a Fiscal Document or Sale references the Orçamento, so that fiscal traceability is preserved.
26. As a Usuário, I want Exclusão blocked when Atendimento or communication history exists, so that customer history is not orphaned.
27. As a Usuário, I want Exclusão blocked for any other relevant external link, so that database integrity does not depend only on UI checks.
28. As a Usuário, I want ineligible Exclusão converted into an offer to Cancel, so that I can still close the Orçamento safely.
29. As a Usuário, I want eligible Exclusão to remove every owned child record, so that no orphan remains.
30. As a Usuário, I want a failure during Cancelamento or Exclusão to persist nothing, so that state is never partial.
31. As a Usuário, I want a useful explanation when an operation is blocked, so that I know which link prevents it.
32. As a Usuário without Permission, I want F6 disabled and the backend protected, so that direct requests cannot bypass security.
33. As an administrator, I want Cancelamento and Exclusão permissions distinguishable if policy requires, so that destructive access can be narrower.
34. As a Usuário, I want repeated F6 or double-click to produce one operation, so that commands are idempotent.
35. As a Usuário in another session, I want a stale Orçamento revision rejected, so that newer changes are not overwritten.
36. As a Usuário, I want the screen redirected or refreshed from authoritative state after success, so that cancelled/deleted data is not still editable.
37. As a Usuário, I want focus and controls restored after cancellation of the dialog or failure, so that work can continue.
38. As a Usuário of the Orçamento consultation, I want batch cancellation to use the same business contract, so that outcomes do not differ by entry point.
39. As a Usuário of batch cancellation, I want per-Orçamento results and reasons, so that failures are not merely reported as ignored.
40. As a Usuário of batch cancellation, I want the batch policy for atomic versus partial success explicit, so that results are predictable.
41. As an auditor, I want database-trigger Audit preserved for Cancelamento and Exclusão, so that mutations remain traceable.
42. As an auditor, I want application behavior not to duplicate trigger Audit, so that history remains unambiguous.
43. As a maintainer, I want a complete dependency inventory before enabling physical deletion, so that hidden links are not lost.
44. As a maintainer, I want Delphi and Laravel differences classified, so that legacy limitations are not copied accidentally.
45. As a maintainer, I want F6 tested through the real UI and backend boundary, so that shortcut, mode, validation and persistence are proven together.

## Implementation Decisions

- Use the domain terms `Cancelamento`, `Exclusão` and `descarte de rascunho` as distinct outcomes.
- Resolve `ExclusaoOrcamento` as an enum: `E` = Excluir, `C` = Cancelar, `P` = Perguntar, `N`/unknown = Nenhuma. Do not parse it as boolean.
- Resolve System Parameters using the active Filial according to existing parameter precedence.
- Combine parameter mode with current eligibility; configuration never overrides integrity restrictions.
- For an unsaved new Orçamento, F6 only confirms and discards local state.
- For a persisted Orçamento, require Situação open, current revision and the appropriate Permission.
- Always require an active Sales Motivo for Cancelamento. Require description only under `Obrigar digitação ao excluir`, but accept it otherwise.
- Cancelamento updates Situação, timestamp, Usuário, Motivo and description atomically while preserving all commercial lines and financing.
- Create a `CancelamentoOrcamento` Atendimento only when a Cliente exists and the mandatory description was supplied. Do not create a Cliente as a side effect.
- Invalidate pending email dispatches; retain processed, sent and failed records.
- Physical Exclusão is allowed only with no Contract, Fiscal Document, Atendimento, registered email or other relevant external link.
- Perform the eligibility check again inside the transaction, locking/revalidating the Orçamento before deletion.
- Delete all records exclusively owned by the Orçamento in dependency-safe order, including at least Installments, Plans, Products, Services and disposable pending-email records. The final list must come from schema/code evidence.
- Preserve external history; its existence blocks deletion rather than being cascaded away.
- If configured mode is Excluir but the Orçamento is ineligible, explain the blocker and offer Cancelamento when allowed.
- Consider separating Cancelamento Permission from physical Exclusão Permission; the final specification must inventory current authorization and choose the least destructive compatible policy.
- Use one backend application service/contract for the Cadastro command and batch cancellation.
- Return structured authoritative results, blockers and revision data rather than relying only on redirects or swallowed exceptions.
- Protect commands against duplication and stale revisions.
- Preserve trigger-based Audit without a duplicate application audit trail.

## Testing Decisions

- Primary seam: open a persisted Orçamento in the real Cadastro, press F6, pass through mode resolution and confirmation, then assert the persisted authoritative outcome.
- Complementary seam: submit multiple Orçamentos through the consultation batch action and assert per-item outcomes under the same Cancelamento rules.
- Test external behavior, rows and visible messages rather than private helper methods.
- Reuse existing Orçamento cancellation Feature tests, expanding them from a Situação assertion to all affected and preserved records.
- Cover `E`, `C`, `P`, `N` and unknown values by Filial.
- Cover button/shortcut parity, keyboard repeat, double-click and request replay.
- Cover rascunho discard, persisted open Orçamento and non-editable Situações.
- Cover Motivo lookup/filter, mandatory/optional description and dialog cancellation.
- Cover Atendimento with Cliente and absence of artificial Cliente/Atendimento without Cliente.
- Cover pending versus processed email records.
- Cover every known deletion blocker and a fully eligible physical deletion.
- Assert Services and every owned child are removed during eligible Exclusão.
- Inject failures at each mutation stage to prove rollback.
- Cover Permission denial, stale revision, concurrent link creation and operation idempotency.
- Prove trigger Audit receives the intended mutations without duplicate application records.
- Cover batch partial failures with detailed results and the chosen transaction policy.

## Out of Scope

- Altering Delphi or Laravel in this analysis workspace.
- Cancelling or deleting Contract, Fiscal Document or Sale derived from an Orçamento.
- Reactivating a cancelled Orçamento unless later evidence proves it inseparable from F6.
- Redesigning the Motivo, Atendimento, email or Audit modules beyond their integration with this command.
- Deleting external history to make an Orçamento eligible.
- Introducing database migrations without a requirement proven by the specification.

## Further Notes

- CONFIRMADO: Delphi defines `exoEXCLUIR`, `exoCANCELAR`, `exoPERGUNTAR` and `exoNENHUMA`, persisted as `E`, `C`, `P` and fallback none.
- CONFIRMADO: Delphi F6 delegates to inherited exclusion and then chooses Cancelamento/Exclusão by the parameter.
- CONFIRMADO: the Delphi button is enabled only for Situação `A` in the inspected timer.
- CONFIRMADO: Delphi Cancelamento always opens active Motivos of type `V` and stores Situação `C`, timestamp, Motivo and description.
- CONFIRMADO: under mandatory description, Delphi may create a Cliente for an anonymous Orçamento and creates a `CancelamentoOrcamento` Atendimento; automatic Cliente creation is rejected as a new Laravel requirement.
- CONFIRMADO: Delphi Cancelamento clears its email dataset; the new rule distinguishes pending delivery from historical records.
- CONFIRMADO: Delphi physical deletion explicitly removes Products, Installments, Plans, email rows and the Orçamento; Services are not explicitly deleted in the inspected method.
- DÚVIDA: inherited checks, constraints or triggers may add physical-deletion protections not yet localized.
- CONFIRMADO: Laravel F6 currently always sends `acao = cancelar` and a fixed description.
- DIVERGENTE: Laravel reads `EXCLUSAO ORCAMENTO` as boolean despite the legacy enum.
- CONFIRMADO: Laravel cancellation validates open Situação and optional description rule, then updates the header.
- NÃO LOCALIZADO: mandatory Motivo, Atendimento, email invalidation and explicit responsible Usuário in the current Laravel cancellation service.
- CONFIRMADO: Laravel physical deletion is transactional but explicitly deletes only Plans/Installments, Products and the Orçamento.
- DIVERGENTE: a Service repository deletion operation exists but is not invoked by physical deletion.
- NÃO LOCALIZADO: frontend use of the implemented batch-cancel endpoint in the inspected resources.
- POSSÍVEL BUG ATUAL: batch cancellation catches every exception and reports only ignored codes, losing the failure reason.
