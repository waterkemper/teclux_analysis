# Núcleo, ciclo de vida e shell do Cadastro de Contratos

Label: ready-for-agent
Status: ready-for-agent

## Problem Statement

O Laravel possui Consulta de Contratos e já gera Contratos a partir de Orçamentos, mas ainda não dispõe de um Cadastro de Contratos canônico. A geração atual grava diretamente nas tabelas legadas, a Consulta não cobre inclusão e edição, e não existe um único limite de aplicação que coordene gravação, situação, permissões, parâmetros, concorrência com o Delphi, auditoria e futuras seções comerciais.

O novo Cadastro coexistirá com o Delphi sobre o mesmo banco. Qualquer Contrato poderá ser aberto e alterado nos dois sistemas, portanto uma tela Laravel que confie apenas no estado do navegador poderá sobrescrever mudanças externas. Também seria perigoso criar gravadores independentes para inclusão manual, conversão de Orçamento e futuras seções: regras, numeração, Auditoria e idempotência divergiriam.

O primeiro recorte precisa estabelecer o núcleo sobre o qual Cliente, produtos, serviços, pagamentos, estoque, logística e faturamento serão implementados. Ele deve reconhecer a máquina documental `O/R/F/C/P/N`, mas não pode simular os efeitos ainda não especificados de reserva, faturamento, cancelamento ou emissão fiscal.

## Solution

Criar o shell do Cadastro de Contratos e um único comando autoritativo de criação/gravação. Inclusão manual e Contrato originado de Orçamento usarão a mesma fábrica e o mesmo limite transacional; a operação pública do Orçamento continuará responsável por seus gates, preparação e idempotência, mas deixará de ser um segundo gravador do agregado.

O shell adotará barra persistente de comandos, resumo do Contrato e abas horizontais de largura total. O carregamento será progressivo por seção, com cache vinculado à identidade e à `revision`. Novo abrirá um rascunho local sem número; o primeiro F8 válido alocará o número e persistirá atomicamente em `O`. F9 reutilizará a Consulta de Contratos em modo de seleção.

O servidor calculará a situação, mutabilidade e capabilities efetivas a cada carga e comando, considerando invariantes, Permissões do Usuário, Parâmetros da Filial e eventual prova de autorização sensível. A resposta exporá somente capacidades, nunca credenciais nem regras confiadas ao frontend.

Cada gravação receberá `revision`, idempotency key e contexto do Usuário. O comando validará as seções alteradas, persistirá tudo ou nada, renovará a `revision`, gravará o envelope de Auditoria e rejeitará alterações concorrentes do Delphi, de integrações ou de outra sessão sem merge ou sobrescrita silenciosa.

## User Stories

1. As a Usuário autorizado, I want to open Cadastro de Contratos, so that I can work with Contratos in Laravel.
2. As a Usuário without Cadastro access, I want every Cadastro endpoint denied by the server, so that menu visibility is not treated as authorization.
3. As an administrator, I want the existing explicit authorization bypass preserved, so that ERP administration remains consistent.
4. As a Usuário authorized for Cadastro, I want to see every Contrato regardless of Filial or system of origin, so that access does not partition shared data.
5. As a Usuário, I want Novo to create a local draft without consuming a number, so that abandoned drafts leave no persisted Contract.
6. As a Usuário, I want the first valid F8 to allocate the number and create the Contract atomically in `O — Orçado`, so that identity and persistence cannot diverge.
7. As a Usuário, I want F8 to save all loaded and changed sections in one transaction, so that a partial Contract is never committed.
8. As a Usuário, I want switching tabs not to save automatically, so that navigation does not have hidden side effects.
9. As a Usuário, I want changed tabs clearly marked, so that I know what the next F8 will persist.
10. As a Usuário, I want validation errors associated with section, field and line, so that the shell can open the first invalid location and preserve my draft.
11. As a Usuário, I want failed validation to preserve every unsaved input, so that correction does not require re-entry.
12. As a Usuário, I want F9 to open the existing Consulta de Contratos in selection mode, so that localization behavior is shared.
13. As a Usuário, I want F9 to search by number or Cliente name using existing Consulta filters, so that familiar lookup remains available.
14. As a Usuário with unsaved changes, I want confirmation before F9 replaces the draft, so that my work is not discarded silently.
15. As a Usuário following a direct route, I want the Contract loaded by number, so that links and browser refresh remain useful.
16. As a Usuário opening an existing Contract, I want the header, situation, revision, origin, Cliente summary, Filial, seller, dates, totals and capabilities loaded first, so that the shell becomes useful before every detail is fetched.
17. As a Usuário, I want detail tabs loaded only when opened, so that a large Contract does not block initial rendering.
18. As a Usuário, I want a successfully loaded unchanged tab cached for the current revision, so that revisiting it avoids unnecessary reads.
19. As a Usuário, I want a late tab failure isolated to that tab, so that the loaded Contract and other tabs remain usable.
20. As a Usuário, I want an inapplicable tab hidden and a temporarily unavailable tab explained, so that absence and failure are not confused.
21. As a Usuário, I want the initial tab to be Geral for a new Contract without Cliente, so that required header data is entered first.
22. As a Usuário opening an existing or Budget-originated Contract, I want Produtos as the initial tab, so that the principal commercial content is immediately visible.
23. As a Usuário, I want a persistent command bar with Novo, Gravar F8, contextual F6, Localizar F9 and contextual transition F11, so that primary operations remain reachable from every tab.
24. As a Usuário, I want F6 and F11 labels and availability derived from server capabilities, so that the same shortcut can safely represent contextual operations.
25. As a Usuário, I want clear shell states for saving, read-only, unsaved changes, revision conflict and section failure, so that operational state is never implicit.
26. As a Usuário, I want `O` and `R` recognized as editable situations, so that later commercial sections can participate in the same save seam.
27. As a Usuário, I want `F`, `P`, `N` and `C` opened read-only except for explicit permitted commands, so that direct editing cannot bypass business operations.
28. As a Usuário, I want `P` and `N` recognized without new fiscal transitions, so that existing Contracts remain safely consultable before fiscal migration.
29. As a Usuário, I want `C` treated as terminal, so that a canceled Contract cannot be reopened by direct field editing.
30. As a Usuário, I want the lifecycle to expose only sequential `O → R → F`, so that the Cadastro never offers a manual `O → F` shortcut.
31. As a Usuário working with `F`, I want the Cancel command contract to distinguish Voltar to `R` from Cancelar to `C`, so that future compensations are modeled as separate operations.
32. As a Usuário, I want situation changes impossible through ordinary F8, so that transitions always pass through their dedicated commands.
33. As a Usuário, I want documentary situation kept separate from financial status, so that `O/R/F/P/N/C` is not confused with aberto, em atraso or quitado.
34. As a Usuário blocked from manual inclusion by `InclusaodeContratosSomenteViaOrcamento`, I want Novo denied by the server while Budget conversion remains allowed, so that the parameter controls origin rather than screen appearance.
35. As a Usuário, I want field and command capabilities recalculated from the current situation, Filial parameters and my Permissions, so that stale UI cannot authorize a write.
36. As a Usuário performing a sensitive operation in a later slice, I want operator and authorizer identities kept separate, so that authorization never replaces authorship.
37. As a Usuário, I want a short-lived one-use proof bound to module, action, Contract, situation and revision when sensitive authorization is required, so that a proof cannot be replayed elsewhere.
38. As a Usuário, I want a Contract generated from a Budget to be created in `O` through the same canonical creator, so that manual and converted Contracts obey one core.
39. As a Usuário, I want repeated Budget conversion to return the same Contract, so that retries do not duplicate Contracts.
40. As a Usuário, I want Budget conversion to persist the origin link and Budget transformation in the same transaction, so that the two records cannot disagree.
41. As a Usuário, I want a generated Contract to preserve the prepared Budget snapshot without reserving stock, so that `O` remains non-reserving.
42. As a Usuário, I want the generated Contract number shown in the Budget flow, so that I can confirm the conversion result.
43. As a Usuário editing a Contract also available in Delphi, I want every save to include the revision I loaded, so that external changes are detected.
44. As a Usuário facing a Delphi or external change, I want my save rejected with the affected sections identified, so that I can reload and reapply intentionally.
45. As a Usuário, I want no automatic merge or last-write-wins behavior after a conflict, so that external changes are never silently lost.
46. As a Usuário, I want reloading after an external Cliente synchronization to refresh the Contract snapshot and capabilities, so that trigger effects are visible.
47. As a Usuário, I want Cliente master synchronization in `O/R/F` to use an explicit versioned whitelist, so that legacy trigger breadth does not redefine the domain accidentally.
48. As a Usuário opening `P/N/C`, I want the historical Cliente snapshot preserved, so that concluded documents are not rewritten by ordinary cadastro changes.
49. As a support analyst, I want each command correlated by request, correlation and causation identifiers, so that a write and its consequences can be traced.
50. As an auditor, I want command intent, actor, authorizer, Filial, revision and safe changes recorded separately from technical database diffs, so that the reason and physical effect are both visible.
51. As an auditor, I want Delphi changes classified as external when application context is absent, so that authorship is not fabricated.
52. As a security reviewer, I want passwords, proof tokens, API keys and sensitive payloads excluded from audit and logs, so that observability does not leak secrets.
53. As a developer, I want all creation and ordinary save paths to pass through one application seam, so that sections cannot invent parallel persistence.
54. As a developer, I want future section contracts to declare loaded revision and dirty payload independently, so that progressive loading and atomic F8 can coexist.
55. As a developer, I want external side effects represented by outbox records after the database commit boundary, so that network work never extends the Contract transaction.
56. As an operator, I want Contract database locks held only during commands, so that coexistence does not create long-lived locks between Delphi and Laravel.
57. As a release manager, I want Cadastro access granted to specific Users and revocable through the same permission, so that rollout can be controlled without partitioning Contracts.
58. As a release manager, I want the foundation compatible with a later complete `O → R → F` release gate, so that this internal slice does not pretend to be production-complete by itself.

## Implementation Decisions

- The authoritative application seam accepts intent, expected `revision`, idempotency key and authenticated context. It reloads current state, evaluates policy/capabilities, validates, locks briefly, persists atomically, records the domain/audit envelope and returns the new representation.
- New manual Contracts are local drafts until the first successful F8. Number allocation and creation occur in the same transaction, always with initial situation `O`.
- Ordinary F8 creates or updates only mutable `O/R` data. It cannot change `situacao` and cannot implement reservation, billing, cancelation, reversal or physical deletion.
- The lifecycle vocabulary is `O — Orçado`, `R — Reservado`, `F — Faturado`, `C — Cancelado`, `P — Nota Parcial` and `N — Nota Fiscal`. The initial transition graph recognizes `O → R → F`, `O/R/F → C` under dedicated rules, and compensating `F → R`; `C` is terminal. This spec delivers their command/capability contracts, not the domain effects assigned to later specs.
- `R` means stock reservation without customer commercial commitment. Commitment begins only in `F/P/N`. `contratos.situacao` remains distinct from derived financial status.
- `F/P/N/C` are read-only to ordinary save. `P/N` are recognized and displayed but receive no entry, exit or fiscal derivation in this slice.
- The shell uses horizontal tabs, a persistent summary and command bar, and full-width content. It has no permanent side panel. Planned areas are Geral, Cliente, Produtos, optional Serviços, Pagamentos, Entrega, Relacionamento and Documentos fiscais.
- Initial load returns core identity, documentary situation, revision, origin, Cliente summary, Filial, seller, dates, totals, applicability, mutability, capabilities and section endpoints. Sections load lazily and are cached by Contract identity plus revision.
- Dirty loaded sections participate in one F8. Unloaded or loaded-but-unchanged sections are not resent. Each section has a stable validation namespace and a concurrency signature covered by the Contract revision.
- F9 reuses Consulta de Contratos in selection mode rather than introducing a second query surface. Direct routes and selection results load the same shell contract.
- Authorization precedence is invariant/state rule, Usuário Permission, effective Filial Parameter, then sensitive authorization when required. UI preferences never relax those layers, and the server recalculates capabilities on every command.
- Cadastro access is a dedicated module permission granted to specific Users, with the existing explicit administrator bypass. It does not filter Contracts by Filial or origin. Removing access permission is the operational way to withdraw the new Cadastro.
- The foundation parameter manifest includes only parameters necessary for core creation, header mutability, protected Cliente information and capability contracts through `F`. Parameters belonging to products, services, finance, stock and fiscal stay in their corresponding specs.
- Sensitive authorization uses the existing proof infrastructure: one-use, short-lived, action-bound and revision-bound. Audit preserves session actor and separate authorizer; credentials and proof material are never persisted in Contract history.
- Budget conversion remains a public Budget command with its existing gates and idempotent behavior. It prepares a creation snapshot and delegates to the same canonical Contract creator. Contract, bidirectional origin identity, Budget state `A → T`, sold quantities and conversion effects commit atomically.
- A Budget-originated Contract starts in `O`, already numbered, without reservation. It preserves equivalent header, Cliente snapshot/link and prepared section data; detailed parity of products, services, installments, delivery, series, service records and questionnaires remains owned by their respective specs.
- Revision must detect database writes made by Laravel, Delphi and triggers. Use a PostgreSQL-authoritative token such as `xmin` or an equivalent aggregate envelope; do not assume `cloud_row_version` changes. After trigger-based Cliente synchronization, reload state and revision.
- Conflicts reject the complete command and report changed section signatures. The product offers reload and deliberate reapplication, never silent merge, overwrite or persistent cross-application locking.
- Cliente master synchronization uses a versioned whitelist for the Contract snapshot. Existing physical trigger behavior for type `C` remains a compatibility fact, including its audit/revision effect; Laravel must not blindly copy the trigger field list or rewrite authorized fiscal documents.
- Database `_log_new` triggers remain the technical source for writes to Contract core tables. The application also records explicit domain command events with `event_id`, request/correlation/causation identifiers, Contract, revision, actor, optional authorizer, source, Filial, safe changes and typed links.
- Technical audit and domain events are complementary. Existing legacy logs remain readable; no trigger is disabled, and external Delphi changes are represented without invented application identity.
- Events and audit records required for command integrity fail closed in the same transaction. Recoverable external consequences use a generic idempotent outbox with minimal safe snapshots and run outside the Contract transaction.
- Schema changes, if required by implementation, are additive and Delphi-compatible. There is no bulk Contract migration, ownership marker, dual-write application layer, destructive rollback, global emergency key or Delphi deactivation requirement.
- This PRD is the Foundation spec. Its public DTOs and section protocol are extension contracts for later vertical specs; it must not add placeholder business calculations that could conflict with them.

## Testing Decisions

- The principal seam is Feature testing through the real Cadastro endpoints and authoritative application command. Tests assert public response, persisted database state, revision and audit/domain event together.
- Prove that Novo consumes no Contract number, the first successful F8 allocates exactly one number, persists `O`, and a retry with the same idempotency key returns the same outcome.
- Prove atomicity by making one loaded section invalid or persistence fail and asserting that no header, section, origin link, event or outbox fragment commits.
- Prove ordinary F8 cannot alter `situacao`, cannot write read-only `F/P/N/C`, and cannot invoke reservation, billing, cancellation or fiscal effects.
- Use table-driven lifecycle capability tests for every source state and operation: allowed contracts for `O → R`, `R → F`, `O/R/F → C` and `F → R`; prohibited direct `O → F`, `R → O`, reopening `C`, direct situation edit and new `P/N` transitions.
- Test that lifecycle command contracts return unavailable/not-yet-implemented safely until their vertical handlers exist; do not fake successful transitions in the Foundation.
- Test authorization server-side for direct and group module grants, administrator bypass, denial without access, manual inclusion blocked by `InclusaodeContratosSomenteViaOrcamento`, and Budget conversion remaining permitted.
- Test capability precedence with representative situation, Permission, Filial Parameter and sensitive-proof combinations. Manipulated frontend payloads must not grant fields or commands.
- Test sensitive-proof binding, expiration, single consumption, wrong Contract/action/revision rejection, separate actor/authorizer audit and absence of credentials in storage/logs.
- Test F9 selection integration with Consulta de Contratos and direct routing. Search behavior itself remains covered by Consulta tests; Cadastro tests cover selection, dirty confirmation contract and load.
- Test progressive section loading, cache invalidation on revision change, unchanged-section omission, multi-section atomic save, isolated late-tab errors and structured validation routing.
- Add frontend interaction tests only for shell behavior: shortcuts, initial tab, dirty indicators, read-only states, capability-driven commands, progressive loading, error isolation and conflict presentation. Do not duplicate domain rules in frontend tests.
- Create concurrency Feature tests in which the Contract changes after load through a second Laravel command, a direct database update representing Delphi, and a Cliente synchronization trigger. Each stale save must fail without overwriting data and identify affected sections.
- Test Budget conversion through its public endpoint for canonical creator delegation, initial `O`, atomic `A → T`, origin identity, displayed Contract number and idempotent repeated submission. Retain existing Budget conversion cases as regression tests.
- Test that a manually created Contract and a Budget-originated Contract load through the same shell representation and accept the same ordinary save rules.
- Test audit context for Laravel writes, safe fallback for external writes, request/correlation/causation linkage, revision, actor/authorizer separation and secret redaction. Verify technical `_log_new` entries coexist with one explanatory domain event without being mistaken for duplicate commands.
- Add contract tests for the confirmed audit sources used by this slice, especially `contratos_log_new`; broader product, lot, series, service, installment and tax timeline aggregation remains for the audit vertical spec.
- Test outbox transactionality and idempotency without calling real external services. A rolled-back command produces no publishable record; a retry does not duplicate consequences.
- Test compatibility with legacy Contracts missing new additive metadata: they remain locatable and loadable, and metadata can be materialized safely without changing business meaning.
- The Foundation is accepted as an internal dependency only when its seam tests pass. Granting real Users access remains blocked until later vertical specs complete and pass the end-to-end golden cases for `O → R → F`.

## Out of Scope

- Product and Service editors, quantities, prices, discounts, totals and commercial calculation engine.
- Payment plans, installments, financing calculation and Ficha Financeira behavior.
- Stock availability, reservation movements, lots, serial numbers and product conference.
- The actual `O → R` reservation and `R → F` billing handlers and their compensating effects.
- Detailed cancelation, `F → R` reversal, physical deletion under `ExclusaoContrato`, returns and lost sale.
- Fiscal preparation, document issue, simple billing, future sale and transitions that create or regularize `P/N`.
- Delivery, pickup, freight, carrier, assembly and logistical agenda.
- Cliente master editor and the complete Cliente snapshot-change workflow; this spec only establishes its shell/whitelist/revision boundary.
- Atendimentos, Contatos, Questionários, product photos, attachments and relationship engines.
- Printing, reports, PDF generation and Contract e-mail adapters.
- Copying or splitting Contracts and importing products from another Contract.
- A unified end-user audit timeline over all core tables; this spec records the envelope required for that later projection.
- Production rollout before all vertical capabilities necessary for `O → R → F` are complete.
- Disabling Delphi, partitioning Contracts by origin, migrating them to another database or assigning exclusive edit ownership to one interface.

## Further Notes

- Evidence confirms that the Delphi advances manually in sequence and treats ordinary editing differently from guarded transitions. `P/N` are known documentary states, but their behavior depends on future-sale, Filial, item and simple-billing rules; they are deliberately read-only here.
- Evidence confirms the current Laravel Budget conversion already validates revision and idempotency and writes Contract/Budget atomically, but it currently inserts through its own legacy repository. Refactoring it into the canonical creator is required to avoid two persistence seams.
- Evidence confirms the shared PostgreSQL has `_log_new` coverage for Contract header and later aggregate tables, with application context when supplied and database-user fallback otherwise. These triggers do not contain domain intent, authorizer, correlation or causation.
- Evidence confirms Cliente type `C` has broad trigger synchronization into Contracts `O/R/F`, while `F/L` do not have equivalent physical coverage. This divergence is a compatibility constraint, not permission to copy fields blindly or to alter Delphi/schema from this workspace.
- Existing Laravel patterns to reuse include route/module authorization, parameter manifests, sensitive-operation proofs, Consulta de Contratos selection/filter components, ERP command bars/tabs, audit context and idempotent outbox concepts.
- All implementation and tests occur in the separate Laravel checkout. This workspace contains only the migration specification; Delphi and Laravel junctions remain read-only.
