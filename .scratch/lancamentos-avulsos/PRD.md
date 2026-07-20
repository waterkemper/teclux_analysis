# Estoques — Lançamentos Avulsos

Label: ready-for-agent
Status: ready-for-agent

## Problem Statement

Usuários do ERP ainda dependem do módulo legado para registrar ajustes manuais de Estoque. O Laravel não possui uma atividade equivalente com Produto, Filial, Tipo de Movimento, Lote, transferência, valores financeiros, contexto de saldos e autorização por Gerente de Estoque.

Essa ausência impede a migração operacional e torna especialmente arriscada uma implementação superficial: `movimentos` não é uma tabela CRUD comum. Ele é o livro cronológico que alimenta, por triggers PostgreSQL, os Saldos de Estoque por Produto e Filial, o estoque por Lote e Movimentos relacionados de transferência, componentes e compensação negativa. Um INSERT duplicado ou uma atualização paralela de projeções pode alterar o estoque duas vezes.

O fluxo legado também contém comportamentos que não devem ser preservados, como Filiais sem escopo de Usuário, validação de negativo apenas na interface, atualização de última compra sem limitar Filial e transação aberta aguardando confirmação. A migração precisa preservar a semântica do negócio e usar o banco como autoridade, ao mesmo tempo em que acrescenta autorização server-side, idempotência, Auditoria e tratamento seguro de concorrência.

## Solution

Criar **Estoques → Lançamentos Avulsos** como página de comando síncrono e somente inclusão. O Usuário selecionará Filial, Produto, Tipo de Movimento e os campos condicionais; visualizará saldos, valores, Lote e últimos Movimentos; preparará a intenção para receber um resumo dos efeitos; confirmará operações de risco; e fornecerá Autorização de Gerente de Estoque quando exigida.

O comando final será idempotente e transacional. O Laravel inserirá exatamente um Movimento-raiz e aguardará as triggers criarem todos os efeitos e projeções antes de informar sucesso. Nenhuma projeção ou Movimento derivado será calculado ou gravado pela aplicação.

A funcionalidade reutilizará o acesso existente a Filiais, a Autorização de operações sensíveis, o contexto de Auditoria PostgreSQL, o interpretador dos Tipos de Movimento, os componentes de lookup e as consultas de histórico. Lookups e limites de escrita específicos serão criados onde permissões ou semânticas existentes forem incompatíveis.

## User Stories

1. As a Usuário autorizado, I want to open Lançamentos Avulsos from Estoques, so that I can adjust stock without returning to the legacy application.
2. As a Usuário without module access, I want every page and endpoint denied by the server, so that menu visibility is not treated as Permissão.
3. As an administrator, I want module access to follow the ERP convention, so that grants remain consistent.
4. As a Usuário, I want to see only authorized Filiais, so that I cannot inspect or affect another operational scope.
5. As a Usuário, I want the authorized FilialBase and server date suggested initially, so that common entry is efficient.
6. As a Usuário, I want to select a Produto by code or lookup using the same validation, so that direct entry cannot bypass eligibility.
7. As a Usuário, I want Products scoped to the selected Filial, so that I launch against a valid Estoque relation.
8. As a Usuário, I want composed Products available only when the corresponding Parâmetro permits them, so that configured business policy is preserved.
9. As a Usuário, I want to choose only active, non-internal and effective Tipos de Movimento, so that administrative or no-op Types cannot be launched.
10. As a Usuário, I want the form to adapt to the selected Tipo de Movimento, so that I enter only fields relevant to its configured effects.
11. As a Usuário, I want the operation summary to explain which balances will add, subtract or be replaced, so that I understand the intention before confirming.
12. As a Usuário, I want Quantidade validated with three decimal places and non-negative semantics, so that the Tipo controls direction rather than a hidden sign.
13. As a Usuário, I want value and price fields shown only when Financeiro or última compra uses them, so that the form is unambiguous.
14. As a Usuário, I want Financeiro `C` identified as bank-calculated average cost, so that I do not provide an arbitrary financial value.
15. As a Usuário, I want substitutions represented by `=` highlighted, so that replacing a balance or base requires conscious confirmation.
16. As a Usuário, I want Referência to accept up to 60 characters, so that the reason or document can be traced.
17. As a Usuário, I want a destination Filial required for transfers, so that the counterparty is explicit.
18. As a Usuário, I want origin and destination to be distinct and authorized, so that invalid or unauthorized transfer cannot be submitted.
19. As a Usuário, I want destination Estoque existence validated, so that transfer does not depend on an implicit auto-create configuration.
20. As a Usuário, I want a Lote required when the Product manages Lote and expiration, so that batch stock remains consistent.
21. As a Usuário, I want Lote lookup scoped to Produto and Filial, so that an unrelated batch cannot be selected.
22. As a Usuário, I want current values and Product quantities displayed, so that I have operational context before launching.
23. As a Usuário, I want current Lote quantities displayed when applicable, so that batch context is visible separately from aggregate stock.
24. As a Usuário, I want the last ten Movements displayed in quantity, value and general perspectives, so that recent history supports my decision.
25. As a Usuário, I want Data validated against accounting closure and allowed retroactivity, so that a closed period cannot be changed through the web form.
26. As a Usuário, I want future dates rejected unless an explicit system rule permits them, so that chronology is controlled server-side.
27. As a Usuário, I want preparation to validate and summarize without changing stock, so that I can review the intention safely.
28. As a Usuário, I want reduction, substitution, Financeiro, última compra, transfer and composition to require explicit confirmation, so that high-impact effects are visible.
29. As a Usuário, I want changing any input to invalidate the prior preparation, so that I never confirm a stale payload.
30. As a non-manager Operador, I want a Gerente de Estoque to authorize the launch, so that sensitive activity follows business control.
31. As a Gerente de Estoque, I want the system parameter to determine whether I must confirm my own password, so that local security configuration is respected.
32. As an Auditor, I want the Operador and authorizing Usuário stored separately, so that execution and approval remain distinguishable.
33. As a Usuário, I want the final save to be synchronous, so that success means all stock effects were committed.
34. As a Usuário, I want controls blocked during save, so that accidental double-click is discouraged.
35. As a Usuário, I want repeated submission of the same intention to return the original Movement, so that timeout or retry cannot double stock.
36. As a Usuário, I want reuse of an idempotency key with a different payload rejected, so that one intention cannot silently mutate into another.
37. As a Usuário, I want a failed trigger to leave no root, related Movement, Lote movement or projection change, so that partial stock updates are impossible.
38. As a Usuário, I want trigger validation errors translated into safe domain messages, so that I can correct the input without seeing SQL internals.
39. As a support analyst, I want request IDs and structured failure classification, so that timeout, deadlock and structural failure can be diagnosed.
40. As an Auditor, I want the application actor, Filial, request and sensitive authorization correlated with database audit records, so that the complete event is traceable.
41. As a Usuário, I want successful save to reload balances and recent Movements from the database, so that I see authoritative results rather than browser arithmetic.
42. As a Usuário, I want transfer, component and negative-compensation Movements identified in the result when created, so that derived effects are traceable.
43. As a Usuário, I want Filial, Tipo, Data and Referência preserved after success while Product-specific values are cleared, so that consecutive launches are efficient and independent.
44. As a Usuário, I want no edit or delete action for confirmed Movements, so that historical chain recalculation is not exposed as ordinary CRUD.
45. As a maintainer, I want architectural protection against writes to stock projections and derived Movements, so that future changes cannot duplicate trigger behavior.
46. As a maintainer, I want the trigger-dependent scenarios tested on PostgreSQL, so that passing SQLite tests cannot falsely certify stock correctness.

## Implementation Decisions

- The feature is a synchronous command page, not a report, background job or CRUD registry.
- The first delivery supports viewing, preparing and creating only. Update, delete, reverse and generic compensating Movement capabilities are explicitly unavailable.
- A dedicated module access boundary and Policy protect the page, all contextual lookups, preparation and create command. Origin and destination Filiais are authorized independently on every request.
- Product, Movement Type and Lote use module-local lookup and resolve contracts. Shared lookup UI may be reused, but maintenance endpoints with different permissions or filters must not be called directly.
- Direct code entry and lookup selection share the same resolver and server validation.
- Product eligibility requires a coherent Estoque relation in the origin. Transfer also requires one in the destination for this delivery.
- Composed Product availability is mediated by the existing system parameter. Component explosion and availability recalculation remain database responsibilities.
- Lote is required when the Product characteristic manages Lote and expiration. It is always resolved in the Product + Filial context.
- The eligible Movement Type catalog excludes missing, inactive, internal, no-op and structurally invalid Types. The Type is re-read during final save.
- The 20-position operation vector is server-owned. Positions 1–9 affect the named stock balances; 10 controls last entry; 11 controls last purchase; 12 controls Financeiro; 13 and 14 control sales and purchases; 16 and 17 control finished and semi-finished balances. Reserved positions cannot enable arbitrary input.
- For quantitative positions, `+` adds, `-` subtracts, `=` replaces and `*` does not act. Quantity is supplied as a non-negative magnitude. Financeiro also supports `C`, whose value is calculated by the database using average cost.
- The client sends only the business intention and never sends operation, calculated balances, derived relations, arbitrary actor identities, negative-exception flags or trigger bypass flags.
- The public intention contains origin Filial, Product, Movement Type, Data, conditional Quantity and financial values, optional Reference, conditional destination Filial and Lote, idempotency key, preparation token and conditional authorization proof.
- Decimal quantities and money are normalized without browser floating-point arithmetic. Reference is limited to 60 characters.
- The accounting date boundary is calculated server-side from the official accounting date and retroactivity parameters. Dates on or before closing are invalid. Future Data is invalid unless an existing explicit rule permits it.
- A preparation operation performs all anticipatable validation and reads current context without writing business tables. It returns field requirements, a human-readable operation summary, warnings and a short-lived token bound to Operador, normalized payload, Filiais and relevant configuration.
- The preparation token does not reserve balance or promise the final cost. Payload or configuration changes invalidate it and require preparation again.
- Reduction, replacement, Financeiro including `C`, last purchase, transfer and composition require explicit confirmation before final save. No INSERT-and-rollback preview is allowed.
- The sensitive-operation framework is extended with a dedicated create action, the legacy `gerenteestoque` profile and the “Exigir Senha em Lançamentos Avulsos” parameter. Contextual authorization is not reused automatically.
- A non-manager Operador requires a Gerente de Estoque. When the parameter is active, a manager is also challenged and may confirm with their own credential according to the shared framework.
- The final command validates and consumes the authorization proof. `usuariologado` comes from the authenticated session; `usuarioautorizacao` comes from the validated proof.
- Financial and last-purchase effects do not receive separate role capabilities in this delivery. They remain protected by module create Permission, preparation confirmation and the same manager authorization domain.
- Durable idempotency is keyed by Operador and UUID and stores a normalized payload hash, state, resulting root Movement and minimal response metadata.
- A completed same-key/same-payload request returns the original result without another INSERT or proof. Same key with a different payload returns conflict. Concurrent equal requests converge on one result.
- Idempotency reservation, audit context, final revalidation, proof validation, root INSERT, trigger chain, result capture and idempotency completion execute in one short database transaction.
- A proof consumed before a later database failure may require fresh authorization on retry; security is preferred to proof reuse. The same business idempotency key is retained.
- The application inserts exactly one root Movement through a dedicated write boundary with an explicit column whitelist. It does not call a Marketplace-specific repository.
- Movement number and chronological order are assigned by the canonical PostgreSQL mechanism. Production never uses `MAX()+1`.
- Database triggers are the sole authority for balances, Financeiro, last purchase, transfer counterpart, component Movements, negative compensation, Lote books and projections.
- The application does not acquire manual Estoque locks outside the trigger ordering. Trigger `FOR UPDATE` behavior serializes the affected projections; duplicate lock orchestration would increase deadlock risk.
- Any exception rolls back the root Movement, all related Movements, Lote changes, projections and idempotency reservation. There is no acceptable partial success.
- Complete context is re-read after commit. The browser never applies local balance arithmetic.
- The command response contains the root Movement, optional related Movement summaries, replay status, request ID and a user-facing message. Related cardinality is variable and informational.
- Database audit context includes actor, source, request ID and Filial. Root actor fields, database audit triggers and sensitive authorization events together form the audit trail.
- Structured logs include request correlation, masked or hashed idempotency identity, Product, Movement Type, Filiais, resulting root, duration and failure class. Credentials and proofs are never logged.
- Error responses use a stable contract with code, safe message, field errors, request ID and retryability. SQLSTATE and an explicit trigger-message catalog classify errors; SQL and stack traces remain internal.
- Validation errors use 422, unauthorized scope uses 403, stale preparation/proof/idempotency and concurrent context changes use 409, retryable infrastructure failures use 503, and unknown structural failures use 500.
- Timeout or uncertain failure must be retried with the same idempotency key. Automatic deadlock or serialization retry is bounded and only occurs under the idempotent command.
- The interface state machine is: initial context, editing, preparing, confirmation, conditional authorization, locked saving, committed success, correctable validation/conflict, or uncertain failure retaining the key.
- Changing Filial clears Product and all dependent state; changing Product clears Lote and dependent context; changing any business input invalidates preparation and proof.
- After success, Filial, Movement Type, Data and Reference may remain as page-session conveniences. Product, Lote, quantities, values, preparation, proof and idempotency key are renewed.
- The existing trigger-aware legacy-write ADR is binding: no runtime schema introspection, no application updates to Estoque projections and PostgreSQL integration coverage for trigger behavior.

## Testing Decisions

- The primary seam is authenticated Feature testing of the page and HTTP/Inertia contracts. These tests observe authorization, validation, returned capabilities, state contracts and command outcomes without coupling to controller or service internals.
- PostgreSQL integration tests are a required second seam for behavior that only real triggers can prove. SQLite tests are useful for request and orchestration behavior but cannot certify stock correctness.
- Unit tests are limited to pure or isolated policies such as operation-vector interpretation, normalized payload hashing, preparation-token validation and SQL exception classification.
- Reuse the project's existing authorization, Filial access, sensitive-operation, audit-context and trigger-aware write test patterns as prior art.
- Feature tests cover administrator, explicitly granted and denied users; all endpoints deny consistently when access is missing.
- Feature tests cover authorized and unauthorized origin/destination Filiais, equal transfer Filiais and disclosure-safe errors.
- Lookup tests prove that direct resolution and search enforce the same Product, Movement Type and Lote eligibility.
- Form tests cover conditional requirements and rejection of client-owned derived fields or bypass flags.
- Preparation tests prove that no business write occurs, summaries reflect the operation vector, high-risk effects request confirmation and changed payload/configuration invalidates the token.
- Sensitive authorization tests cover manager, non-manager, active/inactive parameter, own-password mode, third-party Gerente, invalid/expired/spent proof and correct Operador/authorizer persistence.
- Idempotency tests cover first execution, replay, different-payload conflict, concurrent equal requests, rollback of an incomplete reservation and retry after uncertain response.
- PostgreSQL tests cover `+`, `-`, `=`, `C`, last purchase, accepted/rejected negative, transfer, composed Product, Lote, chronological projection and related Movement identities.
- Rollback tests force a trigger failure and prove absence of root, related, Lote and projection changes.
- Concurrency tests prove no double application under simultaneous Product/Filial launches and convergence under the same idempotency key.
- Audit tests prove database context, Operador, authorizer and request correlation while ensuring secrets are absent from logs.
- Error-contract tests cover known trigger validation, foreign key/context change, idempotency conflict, deadlock/serialization, timeout and unknown structural failure.
- UI tests cover dependent-field clearing, stale preparation invalidation, double-submit blocking, correctable errors, uncertain retry retaining the same key, successful context reload and absence of edit/delete/reverse actions.
- An architectural regression test or equivalent enforced check proves that the feature does not write directly to Estoque projections, Lote projections/books or related Movements.
- A good test asserts externally visible business behavior and persisted outcomes, not private class calls, query construction details or framework implementation.

## Out of Scope

- Altering, disabling or replacing PostgreSQL triggers and functions.
- Altering the legacy application.
- Correcting existing stock data or historical chains.
- Migrating every other workflow that writes `movimentos`.
- Generic edit, delete, reverse or compensating Movement functionality.
- Background or asynchronous processing of the create command.
- Application-side calculation or maintenance of `estoques`, `estoqueslotes`, `movimentoslotes` or derived Movements.
- Allowing trigger bypass, unrestricted negative exception or client-provided operation vectors.
- Adding separate Financeiro or last-purchase roles without a new business decision.
- Depending on runtime schema introspection or PostgreSQL `MAX()+1` numbering.

## Further Notes

- Use the ERP domain terms Produto, Filial, Movimento, Tipo de Movimento, Saldo de Estoque, Lote, Operador, Usuário, Permissão, Autorização, Auditoria and Parâmetro do Sistema consistently.
- Permissão grants access/capability; Autorização is the contextual Gerente approval; Auditoria records both the action and its actors. They are not synonyms.
- The operation-vector interpreter is useful for presentation and validation, but the PostgreSQL trigger chain remains the executable authority.
- Existing read repositories for daily Movement history can support the last-ten context but must not become a write boundary.
- The implementation agent may inspect the Laravel codebase for concrete reusable names and conventions, but this specification contains the complete business contract and requires no legacy-code or external-database investigation.
