# Seleção de Cliente e gravação do Orçamento

Status: ready-for-agent
Label: ready-for-agent

## Problem Statement

O Cadastro de Orçamentos Laravel ainda não reproduz de forma segura e completa os efeitos funcionais do Delphi ao selecionar, trocar ou remover o Cliente. O fluxo envolve fotografia cadastral, reprecificação, descontos, cashback, Crédito de troca, Planos, alertas de risco, Ficha Financeira, orçamentos em aberto, atualização cadastral e autorização de crédito. Hoje parte desses efeitos ocorre de forma assíncrona e silenciosa no navegador; uma falha de reprecificação pode conservar preços antigos depois de o Cliente já ter mudado.

A gravação também precisa consolidar em uma operação autoritativa as validações e os vínculos do Orçamento. A migração não deve copiar limitações legadas nem atualizar silenciosamente o Cadastro de Clientes a partir de campos editados no Orçamento.

## Solution

Tratar seleção, troca e remoção do Cliente como uma transição explícita e confirmável. O backend prepara o impacto da mudança, incluindo fotografia cadastral, preços, totais, descontos, cashback, Crédito de troca, Planos, Parcelas, alertas e autorizações. A interface só confirma o novo estado quando a transição for válida; cancelamento ou falha preserva integralmente o estado anterior.

Preservar o comportamento parametrizado da Ficha Financeira e dos alertas, distinguindo informação de bloqueio. A gravação deve revalidar todo o estado no backend e persistir atomicamente cabeçalho, Produtos, Serviços, Planos, Parcelas, contatos e demais vínculos. No Laravel, alterações feitas na fotografia cadastral do Orçamento permanecem no Orçamento e não atualizam automaticamente o Cadastro de Clientes, divergência deliberada em relação ao Delphi.

## User Stories

1. As a Usuário de Orçamentos, I want to select an eligible Cliente, so that the Orçamento receives the correct commercial and cadastral context.
2. As a Usuário, I want the lookup to respect `SelecionarSomenteClientesnasVendas`, so that only allowed legacy types can be selected.
3. As a Usuário, I want every selected `C`, `F` or `L` to be called Cliente inside the Orçamento, so that the workflow uses one domain term.
4. As a Usuário, I want the Orçamento to receive a snapshot of the selected Cliente's current data, so that the proposal records the data used at that moment.
5. As a Usuário, I want to change the Cliente only after seeing the commercial impact, so that prices and financing do not change unexpectedly.
6. As a Usuário, I want to cancel a Cliente change, so that the old Cliente and every dependent value remain untouched.
7. As a Usuário, I want a failed Cliente change to roll back completely, so that the Orçamento never contains mixed contexts.
8. As a Usuário, I want Products repriced when the applicable Cliente, cargo or price context changes, so that prices follow current rules.
9. As a Usuário, I want `Considerar Markup Clientes`, `Preços por Cargo` and `Cargo Tabela Preço Padrão` respected, so that the same configured commercial policy is applied.
10. As a Usuário, I want manual Plans preserved by default, so that changing Cliente does not discard deliberate financing work.
11. As a Usuário, I want confirmation before recalculating incompatible manual Plans, so that replacement is intentional.
12. As a Usuário, I want the Cliente default Plan suggested when enabled and available, so that standard terms are easy to use.
13. As a Usuário, I want `PlanoOrcamentoPadrao` used only when no manual or Cliente Plan applies, so that defaults have deterministic precedence.
14. As a Usuário, I want cashback and Crédito de troca revalidated after Cliente changes, so that benefits cannot remain attached to the wrong Cliente.
15. As a Usuário, I want financial alerts shown according to System Parameters, so that relevant risk is visible without indiscriminate blocking.
16. As a Usuário, I want `MostrarFichaSomenteAtraso`, `PerguntarAntesExibirFicha` and `naoexibirfichafinanceira` respected, so that Ficha Financeira behavior remains configurable.
17. As a Usuário, I want the manual Ficha Financeira action retained, so that I can inspect the Cliente when needed.
18. As a credit analyst, I want restricted cases to require contextual Authorization, so that credit policy is enforced server-side.
19. As a Usuário, I want debts, returned checks and open amounts to inform me without blocking by themselves, so that information is not confused with Authorization policy.
20. As a Usuário, I want an alert when the Cliente has open Orçamentos, so that I can consult them without losing my current work.
21. As a Usuário, I want that alert not to block selection, so that duplicate-proposal review remains optional.
22. As a Usuário, I want an outdated Cliente registration identified through `DiasAvisoAtualizarCliente`, so that stale data is reviewed.
23. As a Usuário, I want to mark the registration as checked or open it for review, so that the pending condition can be resolved.
24. As a Usuário, I want save blocked while mandatory registration review remains pending, so that the check is not silently bypassed.
25. As a Usuário, I want edits to Cliente snapshot fields to remain local to the Orçamento, so that a sales proposal cannot silently alter master data.
26. As a Cliente maintainer, I want Cadastro de Clientes changes performed through its own authorized workflow, so that validation and Audit remain coherent.
27. As a Usuário, I want confirmation before removing a Cliente, so that dependent commercial data is not reset accidentally.
28. As a Usuário, I want Products and Services retained when removing the Cliente, so that the proposal content is not lost.
29. As a Usuário, I want prices recalculated under the no-Cliente/default cargo context, so that retained Products remain valid.
30. As a Usuário, I want dependent snapshot fields, cashback and Crédito de troca cleared or revalidated, so that no data from the removed Cliente leaks into the Orçamento.
31. As a Usuário, I want valid manual Plans retained after removing the Cliente, so that deliberate financing is preserved where possible.
32. As a Usuário, I want save to require at least one Product or Service, so that an empty Orçamento is not persisted.
33. As a Usuário, I want exactly one applicable Plan selected and its Parcelas valid, so that financing is complete.
34. As a Usuário, I want mounting and delivery requirements validated, so that operational data is complete.
35. As a Usuário, I want inactive or ineligible Products rejected, so that invalid commercial lines cannot be saved.
36. As a Usuário, I want price, discount, coupon, cashback and Crédito de troca validated by the backend, so that browser payloads are not authoritative.
37. As a Usuário, I want inclusion and alteration to follow the same business invariants, so that behavior is predictable.
38. As a Usuário, I want an Orçamento in a non-editable Situação rejected, so that finalized state cannot be overwritten.
39. As a Usuário, I want a save failure to persist nothing, so that related datasets never diverge.
40. As a Usuário, I want a successful save to return the authoritative snapshot, so that the screen matches persisted data.
41. As a Usuário, I want useful errors for reprice, Authorization, validation and concurrency failures, so that corrective action is clear.
42. As a Usuário, I want conflicting actions disabled during Cliente transition or save, so that duplicate requests do not race.
43. As a Usuário in another session, I want stale revisions detected, so that newer work is not silently overwritten.
44. As a maintainer, I want Delphi evidence and Laravel behavior classified separately, so that legacy bugs are not converted into requirements.
45. As a maintainer, I want one high-level Cliente transition seam and one transactional save seam, so that tests cover behavior without coupling to helpers.

## Implementation Decisions

- Use `Cliente` as the Orçamento domain term for selected types `C`, `F` and `L`.
- Respect `SelecionarSomenteClientesnasVendas` when determining selectable types.
- Model Cliente change/removal as an explicit transition with old snapshot, proposed snapshot, impact summary and confirmation.
- Compute the proposed transition authoritatively on the backend; do not mutate the committed form incrementally before success.
- Include Products, prices, totals, discounts, cashback, Crédito de troca, Planos, Parcelas and derived Cliente fields in the rollback boundary.
- Ask for confirmation when Products exist and the pricing context can change.
- Preserve manual Plans unless the Usuário explicitly authorizes recalculation/replacement.
- Apply Plan precedence: manual Orçamento Plans; Cliente default Plan when enabled and present; `PlanoOrcamentoPadrao` only while still without a Plan.
- Preserve parameter-controlled Ficha Financeira behavior and manual access.
- Treat financial warnings as informational unless a configured credit policy requires contextual Authorization.
- Show open Orçamentos as a non-blocking alert with a consultation action.
- Block save for unresolved registration review identified by `DiasAvisoAtualizarCliente`.
- Keep the Orçamento's Cliente data as a snapshot. Do not propagate snapshot edits automatically to Cadastro de Clientes in Laravel.
- Record that last rule as `DECISÃO NOVA` and deliberate divergence: Delphi synchronizes selected fields to `clientes` for `C` and `fornecedores` for `F` during save.
- Do not reproduce the Delphi fallback that can overwrite an incomplete Cliente address with the Filial address.
- Treat type `L` master-data synchronization as `NÃO LOCALIZADO` in the Delphi evidence, not as an implicit requirement.
- Revalidate the full payload in the backend on save, including permission, editable Situação, required lines, Plan selection, Parcelas, mounting, delivery, Product eligibility, prices and discounts.
- Persist all Orçamento aggregates and relationships within one database transaction.
- Reuse the current transactional Orçamento save service and existing Ficha Financeira, pricing, financing, sensitive-Authorization and parameter seams where suitable.
- Return an authoritative post-transition/post-save representation and structured warnings.
- Add revision/concurrency protection and idempotency for repeated transition/save commands where the current contract lacks it.
- Preserve database-trigger Audit; do not add duplicate application Audit for the same row mutations.

## Testing Decisions

- Primary transition seam: open an editable persisted Orçamento with Cliente, Products, discounts and Plans; request another Cliente; inspect impact; confirm; observe one coherent new snapshot.
- Primary save seam: submit that snapshot through the real save boundary and reopen the Orçamento to prove atomic persistence.
- Test external behavior rather than internal helper calls.
- Reuse existing Orçamento Feature tests for save, pricing, discounts, financing and conference effects, and existing Ficha Financeira Feature tests for access and financial data.
- Cover cancellation, pricing failure, financing failure and Authorization failure with complete restoration of the prior state.
- Cover `C`, `F` and `L` eligibility under both values of `SelecionarSomenteClientesnasVendas`.
- Cover Cliente markup, cargo pricing, default cargo/table and no-Cliente pricing contexts.
- Cover manual Plan, Cliente default Plan, system default Plan and conflicts.
- Cover Ficha Financeira parameter combinations, informational alerts and analyst Authorization.
- Cover open Orçamentos and outdated registration warning/block behavior.
- Prove snapshot edits do not update `clientes` or `fornecedores` in Laravel.
- Cover removal with retained Products/Services and cleared/revalidated dependent state.
- Cover inclusion and alteration, non-editable Situação, missing Product/Service, invalid Parcelas, mounting/delivery validation and ineligible Products.
- Cover duplicate clicks, delayed responses, stale revisions and transaction rollback at each persistence stage.

## Out of Scope

- Altering Delphi or Laravel in this analysis workspace.
- Redesigning the entire Cadastro de Clientes or Ficha Financeira.
- Automatically writing Orçamento snapshot edits back to Cliente/Fornecedor master data.
- Reproducing the Delphi fallback that writes the Filial address into an incomplete Cliente/Fornecedor registration.
- Migrating unrelated Orçamento tabs or implementing new pricing, credit or financing policies.
- Generating database migrations unless later implementation proves a minimal concurrency contract requires one.

## Further Notes

- CONFIRMADO: Delphi stores the former Cliente code/type on entry and detects changes on exit.
- CONFIRMADO: Delphi executes registration warning, Ficha Financeira, analyst checks and open-Orçamento warning around Cliente selection.
- CONFIRMADO: Delphi reprices existing Product lines after resolving Cliente/cargo context.
- CONFIRMADO: Delphi save validates at least one Product or Service and Filial de montagem when applicable.
- CONFIRMADO: Delphi calls `AtribuirDadosClienteOrcamentonoCliente` before persistence and may update master data for `C` and `F`.
- CONFIRMADO: Laravel already has transactional Orçamento persistence and backend validation for lines, selected Plan, Parcelas, mounting, delivery, Product eligibility, prices and discounts.
- CONFIRMADO: Laravel already has Ficha Financeira services, policies and tests, and a Product repricing endpoint.
- DIVERGENTE: current Laravel Cliente resolution forces `tipocliente = C` in the inspected header flow.
- DIVERGENTE: current Laravel repricing is triggered by a frontend effect after Cliente mutation; errors are swallowed and current lines are retained.
- NÃO LOCALIZADO: automatic Orçamento-level integration of all Delphi financial alerts and outdated-registration enforcement in the current Laravel flow.
- DECISÃO NOVA: snapshot edits remain local to the Orçamento in Laravel.
- DECISÃO NOVA: Cliente transitions and save failures have an explicit all-or-nothing UI and persistence contract.
