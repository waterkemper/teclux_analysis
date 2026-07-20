# Estoques — Lançamentos Avulsos

Label: ready-for-agent

## Problem Statement

O usuário do ERP precisa registrar ajustes manuais de Estoque com a mesma riqueza informacional do sistema legado, mas o Laravel ainda não possui o módulo Lançamentos Avulsos. Os cadastros e consultas já convertidos oferecem partes reutilizáveis — Filiais autorizadas, Produto, Lote, Tipo de Movimento, histórico, grids, autorização sensível e Auditoria — porém não existe uma orquestração segura que una esses elementos.

Uma implementação incompleta criaria riscos graves: apresentar opções sem autorização, confundir saldo agregado com saldo de Lote, expor dados financeiros, duplicar cálculos das triggers, produzir dupla contagem, reservar números de forma concorrente ou gravar diretamente nas projeções. Também impediria o usuário de conferir as mesmas Quantidades, Valores e Movimentos usados para tomar a decisão.

O módulo precisa ser um comando síncrono de inclusão, e não CRUD de Movimentos. O usuário declara um Movimento-raiz; o PostgreSQL continua responsável por numeração, encadeamento cronológico, locks, saldos, Financeiro, Estoques, Lotes, transferências, componentes e compensações.

## Solution

Criar **Estoques → Lançamentos Avulsos** como página inclusion-only. A página oferece lookups locais e elegíveis de Filial, Produto, Tipo e Lote, carrega um contexto coordenado, apresenta cinco visões informacionais e prepara a intenção antes de solicitar autorização e gravar.

Lookups e resolução digitada compartilham os mesmos predicados. Filiais são limitadas ao usuário; Produto respeita a Filial, composição e Estoque Automático; Tipo precisa estar ativo, não interno e com Operação válida; Lote pertence ao Produto e apresenta situação e Quantidades na Filial. O lookup de Produto preserva as mesmas colunas da Ficha de Produtos.

O endpoint de contexto devolve snapshots atuais, Valores permitidos e os dez Movimentos mais recentes. A preparação não escreve: valida, produz resumo humano e vincula o payload a um fingerprint. O POST final relê tudo em transação curta, valida prova sensível e idempotência, insere exatamente um Movimento-raiz e deixa as triggers concluírem os efeitos. Se o contexto mudou, nenhuma gravação ocorre até nova confirmação.

Depois do commit, a resposta identifica raiz e derivados e a interface relê todo o contexto. Usuários sem permissão financeira não recebem campos financeiros do backend.

## User Stories

1. As an Estoque operator, I want to access Lançamentos Avulsos from the Estoque area, so that I can register a manual Stock intention.
2. As an unauthorized user, I want the module to remain inaccessible, so that I cannot discover or change Stock data.
3. As an authorized operator, I want to see only my authorized Branches, so that I cannot operate outside my scope.
4. As an administrator, I want all existing Branches available, so that I can operate across the company.
5. As an operator with one authorized Branch, I want it preselected, so that routine entry is faster.
6. As an operator, I want to search a Product using the same columns as Product Statement, so that lookup behavior is familiar.
7. As an operator, I want to search Products by visual/internal Code, Barcode, Description, Row, Column and advanced text, so that I can find the intended item efficiently.
8. As an operator, I want direct Product code entry and the magnifier to use the same eligibility rules, so that neither path bypasses validation.
9. As an operator, I want Product rows to show status and commissions as in Product Statement, so that the catalog remains consistent.
10. As an operator, I want a Product without a Branch Stock row to be identified when automatic Stock creation is allowed, so that I understand the effect before recording.
11. As an operator, I want an ineligible Product to return a clear reason, so that I know whether it is inactive, composite-restricted or unavailable in the Branch.
12. As an operator, I want to search only eligible Movement Types, so that internal, inactive or sentinel Types cannot be chosen.
13. As an operator, I want the selected Movement Type to configure the form, so that only applicable Quantity, Value, Price, Last Purchase and destination fields are available.
14. As an operator, I want the Type effects summarized in plain language, so that I understand which Stock dimensions will be affected.
15. As an operator recording a transfer, I want only authorized destination Branches different from the origin, so that the transfer is valid.
16. As an operator recording a transfer, I want to know when the destination Stock row will be trigger-created, so that the effect is explicit.
17. As an operator, I want Lote to become mandatory only for a Product that manages Lote/validity, so that the form follows Product rules.
18. As an operator, I want to search Lotes by Number and see Product, Barcode, Description, manufacturing, validity and status, so that I select the correct Lote.
19. As an operator, I want a zero-balance Lote selectable for an entry, so that I can replenish an existing Lote.
20. As an operator, I want expired, inactive and discontinued Lotes identified but blocked, so that I cannot create an invalid movement.
21. As an operator, I want current Product Quantities displayed in all nine dimensions, so that I understand the current projection.
22. As an operator, I want current Lote Quantities displayed separately, so that aggregate Product Stock does not hide Lote constraints.
23. As an operator, I want the last ten Movements shown in the Movements view, so that I can review recent operational context.
24. As an operator, I want the same ten Movements shown through the Quantities view, so that I can review the historical snapshots.
25. As a financially authorized user, I want the Values view and current Value cards, so that I can evaluate financial effects.
26. As a user without financial permission, I want financial fields omitted by the server, so that sensitive data cannot be recovered from the browser.
27. As a user without financial permission, I want a clear message when a Type requires financial entry, so that I can request an authorized user.
28. As an operator, I want historical rows fixed in canonical descending Movement order, so that the screen always represents chronology.
29. As an operator, I want changing Branch, Product, Type or Lote to invalidate dependent state, so that stale context cannot be recorded.
30. As an operator, I want old asynchronous responses discarded, so that a late response cannot overwrite my current selection.
31. As an operator, I want to prepare the intention without writing, so that I can review effects before committing.
32. As an operator, I want risk confirmation for reductions, replacements, financial effects, Last Purchase, transfers and composites, so that consequential operations are deliberate.
33. As a non-manager operator, I want an authorized Stock Manager to approve the operation, so that sensitive Stock adjustments remain controlled.
34. As a Stock Manager, I want the configured password rule honored, so that the same sensitive-operation policy applies to me.
35. As an operator, I want changed context to return a conflict with fresh data, so that I do not record against stale Stock.
36. As an operator, I want a double click or retry with the same key to create only one Movement, so that network uncertainty cannot duplicate Stock.
37. As an operator, I want the recording to complete synchronously, so that success means the database transaction and all triggers committed.
38. As an operator, I want the result to identify the root and derived Movements, so that I can understand transfers, components or negative compensation.
39. As an operator, I want all context reloaded after commit, so that displayed Stock comes from the database rather than client arithmetic.
40. As an auditor, I want operator, authorizer, Branch, request and root Movement recorded, so that every adjustment is traceable.
41. As a support analyst, I want structured error codes and request IDs without SQL or secrets, so that failures can be investigated safely.
42. As a business owner, I want no edit, delete or generic reversal routes, so that confirmed Stock history remains append-only from this module.

## Implementation Decisions

- Build a dedicated Lançamentos Avulsos application boundary with page, module access, Policy, requests, lookup providers, context service, preparation service, command service, read repository and trigger-aware write repository.
- Preserve inclusion-only semantics. Expose view/create capabilities and fix update/delete/reverse capabilities as false.
- Use authorized Branches from the shared Branch access service in lookup and every server-side revalidation.
- Use module-local endpoints even when their implementation extracts shared code from Product Statement or Stock Query. Do not call another screen's endpoints as dependencies.
- Product lookup preserves Product Statement columns: Code, Description, Barcode, Row, Column, status, Group commission, Product commission and advanced search. It adds canonical ID, composition, Lote control, reference/unit metadata and Branch eligibility.
- Product lookup defaults to 25 rows and caps at 100. It supports the same search modes as Product Statement. Exact resolve supports visual Code and Barcode.
- Respect the composite-products parameter. An inactive or composite-forbidden Product is visible only as an ineligible result with a reason.
- Respect automatic Stock creation. A missing Product/Branch projection is eligible only when the canonical parameter allows trigger creation and is marked as such. The application never creates the projection.
- Branch destination is available only for transfer Types, differs from origin, is authorized and satisfies Product projection/automatic-creation rules.
- Type lookup defaults to 25 rows and caps at 100. It filters inactive, internal and sentinel Operation rows. Exact resolve returns Operation, transfer Type, negative policy and a display summary, but the browser never controls Operation.
- Reuse the positional Operation mapper for structural validation and presentation. PostgreSQL triggers remain the execution authority.
- Lote lookup defaults to 25 rows and caps at 100, searches Lote Number and orders by Validity then stable ID. It returns Product details, manufacturing, validity, inactive/discontinued state and Branch quantities.
- Lote must belong to Product. Zero balance permits entry/replacement; expired, inactive and discontinued Lotes are blocked. Outgoing operations compare affected dimensions during preparation and are revalidated by triggers.
- Do not allow Lote creation from Lançamentos Avulsos.
- Provide one context endpoint that coordinates narrow parametrized queries for Product snapshot, optional Lote snapshot, allowed Values and last ten Movements. It returns a context fingerprint/version.
- Distinguish unselected context, missing projection, projection to be trigger-created, missing Lote projection and an existing zero row.
- Preserve five read-only views: Movements, historical Quantities, historical Values, current Product Quantities and current Lote Quantities.
- The Movements view columns are Date, Type, Lote Number, Reference, Quantity, Stock, Value and Financial. Movement Number is the stable hidden row key.
- The historical Quantities view columns are Date, Type, Lote Number, Stock, Reserved, Transit, Demonstration, Repair, Future and Damaged.
- The historical Values view columns are Date, Type, Lote Number, Value, Financial, Price with ICMS and Price without ICMS.
- Current Product and Lote views each show Stock, Reserved, Transit, Demonstration, Repair, Future, Damaged, Previous Reservation and Physical Stock.
- Current Values are cards for Average Cost, Financial, Price with ICMS, Price without ICMS and Last Purchase.
- Historical queries are fixed to Product + Branch, Movement Number descending, limit ten. No pagination, user sorting, editing or deletion.
- Apply financial authorization in the backend. Unauthorized responses omit all financial fields and commissions according to the existing Product lookup policy. A financially requiring Type cannot be completed by an unauthorized user.
- State invalidation is cascading: Branch clears Product/Lote/destination/context/preparation; Product clears Lote/destination/context/preparation; Type clears incompatible fields/destination/preparation; Lote clears its context/preparation; scalar edits invalidate preparation.
- Preparation performs no write and keeps no transaction open. It returns a human summary, sensitive-authorization requirement and short-lived token bound to operator, entities, parameters, payload and fingerprint.
- The final POST rereads entities, parameters, authorization and context inside a short transaction. A changed fingerprint returns HTTP 409 with fresh context and performs no INSERT.
- Add a dedicated sensitive-operation definition for Stock/Lançamentos Avulsos using the Stock Manager profile and the existing password parameter behavior. Operator and authorizer are stored separately.
- Use durable idempotency keyed by operator and UUID with normalized payload hash, status, root Movement and minimal result. Same key/hash replays; a different hash conflicts.
- Within one transaction: reserve/replay idempotency, apply database Audit Context, revalidate, validate/consume proof, insert one root Movement, allow triggers to finish, capture minimal result and complete idempotency.
- The maximum root allowlist consists of Product, Branch, Date, Movement Type, Quantity, conditional Value/Prices/IPI/Last Purchase, Reference, destination Branch, Lote, operator and authorizer.
- Never accept or persist browser-supplied Movement Number, chronological sequence, Operation, calculated balances, calculated Financial, derived relationships, Group, bypass flags or timestamps.
- Never use application `MAX()+1` in PostgreSQL, manual projection locks in conflicting order, direct projection writes or PHP copies of trigger calculations.
- PostgreSQL triggers own numbering, sequence, Operation, projection locks, negative validation, balances, Financial, Last Purchase, Stock/Lote projections and transfer/component/negative derived Movements.
- After commit, reread context outside the transaction. The response identifies root and classifies derived Movements. A derived Movement in another Branch appears in the result summary, not the origin history.
- Return uniform errors with code, message, field errors, request ID and retryable flag. Do not expose SQL, stack traces, passwords or proof tokens.
- This decision aligns with the accepted trigger-aware legacy write architecture: no runtime schema introspection, no projection update in the application and PostgreSQL integration coverage.

## Testing Decisions

- Prefer the highest external seam: Feature tests through the module's public endpoints. Assert authorization, response contracts and visible outcomes rather than controller/repository internals.
- Use PostgreSQL integration tests through the final command seam to prove trigger behavior. SQLite cannot prove triggers, locks, numbering or transactional projection updates.
- Keep frontend tests narrow: cascading invalidation, stale-response rejection and Register-button gating. Do not snapshot broad presentation markup.
- Add one architectural seam that fails if the new module writes directly to Stock projections, Lote projections, Lote Movements or derived Movements.
- Unit-test pure policies/mappers only where external Feature tests would be cumbersome: lookup eligibility, Operation presentation, payload normalization/hash, grid catalogs, financial redaction and SQLSTATE classification.
- Feature tests cover module access, capabilities, each lookup and exact resolver, pagination, ineligibility reasons, Product Statement column parity, context states, five views, financial omission, preparation, stale context, sensitive proof, idempotent replay/conflict and absence of CRUD routes.
- PostgreSQL tests cover plus, minus, replacement and average-cost Operation modes; rejected and compensated negatives; transfer; composite Product; Lote chain; automatic projection creation; derived Movements; full rollback; concurrency; operator/authorizer and audit context.
- Good tests assert business-observable rows and responses after commit, not private method calls or literal SQL text.
- Reuse test patterns from Product Statement Product lookup, Product Lote perspective, Stock Query Branch/Product lookup, positional Operation mapper, module access, audit-trigger and Marketplace idempotency tests.

## Out of Scope

- Altering, disabling or rewriting PostgreSQL triggers or functions.
- Changing the Delphi application.
- Correcting existing Stock or Movement data.
- Migrating other producers of `movimentos`.
- Editing, deleting or generically reversing confirmed Movements.
- Creating Lotes from this module.
- Writing directly to `estoques`, `estoqueslotes`, `movimentoslotes` or derived Movements.
- Replacing the Stock accounting mechanism.
- Asynchronous processing of the recording command.
- Reusing Marketplace order write payloads as the Lançamentos Avulsos command.

## Further Notes

- The detailed lookup columns, five-view matrices and parametrized SQL reference contracts are already authoritative supporting material. Planning must not create tasks to inspect Delphi or rediscover database behavior.
- Success is displayed only after the root Movement, every trigger and commit complete.
- Automatic Stock creation is conditional on the canonical system parameter and is performed only by the trigger.
- Financial authorization is separate from module create permission and must be enforced in serialized responses.
- The module should retain Branch, Type, Date and Reference after success as operator convenience, while clearing the completed intention and generating a new idempotency UUID.
