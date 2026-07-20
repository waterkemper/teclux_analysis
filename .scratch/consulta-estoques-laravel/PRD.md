# Consulta de Estoques no Laravel

Label: ready-for-agent
Status: ready-for-agent

## Problem Statement

Usuários do ERP dependem da Consulta de Estoques do Delphi para localizar Produtos por múltiplos critérios e compreender, em uma única atividade, os Saldos de Estoque, preços, situação comercial, Lotes, Produtos Similares, Grade, Componentes, Atributos, Movimentos acumulados, Pedidos, Fornecedores e Licitações de cada Produto e Filial.

O Laravel ainda não possui uma Consulta de Estoques operacional equivalente. A página existente de Análise de Estoques é um Relatório temporal com finalidade diferente: embora ofereça infraestrutura madura de filtros, geração, Filiais autorizadas, grids e exportação, não entrega o fluxo master-detail nem as perspectivas operacionais do Delphi.

Essa ausência obriga o Usuário a retornar ao Delphi e também preserva problemas legados: informações gerenciais são protegidas principalmente por abas ocultas, o escopo de Filial não é aplicado de forma consistente e algumas Alterações aparentam atingir a Filial errada ou não persistir. A migração precisa manter a semântica funcional útil sem reproduzir defeitos de segurança e persistência.

## Solution

Criar uma nova Consulta de Estoques no Laravel, separada da Análise de Estoques, com filtros estruturados, geração por F6, resultado mestre paginado e detalhes carregados sob demanda para o Produto ativo.

A página permitirá consultar Itens, Lotes, Produtos Similares, Grade, Modelos, Componentes e Atributos. Para cada Produto ativo, apresentará Estoques, Financeiro, Acumuladores, Preços, Preços por Cargo, Preço por Cliente, Pedidos, Fornecedores e Licitações conforme Permissões e Parâmetros do Sistema.

A solução reutilizará o shell de consultas, os filtros de Produto, os lookups, o acesso a Filiais, os compiladores SQL, o grid ERP, os serviços readonly dos Cadastros de Produto e as integrações existentes de Fotos e Venda Perdida. Toda autorização e todo escopo de Filial serão aplicados no servidor. Os fragments SQL serão compilados a partir de regras validadas, nunca recebidos do navegador.

## User Stories

1. As a Usuário autorizado, I want to open the Consulta de Estoques from the Estoques menu, so that I can perform the activity without returning to Delphi.
2. As an administrator, I want module access to follow the existing ERP authorization convention, so that access grants remain consistent.
3. As a Usuário without module access, I want the server to deny the page and every endpoint, so that hiding the menu is not treated as authorization.
4. As a Usuário, I want the page to start on Item de Produto, Itens do Produto and Estoques, so that the initial workflow matches the familiar consultation.
5. As a Usuário, I want to generate results with the Gerar command or F6, so that the main keyboard workflow is preserved.
6. As a Usuário, I want a clear validation message when no qualifying selection is provided, so that an unrestricted query is not started accidentally.
7. As a Usuário, I want to filter by Item de Produto, so that I can locate a specific commercial item.
8. As a Usuário, I want to filter by Produto or Característica de Produto, so that I can consult a family or exact Produto.
9. As a Usuário, I want to filter by Grupo, Classe and Marca, so that I can analyze related Products.
10. As a Usuário, I want to filter by Promoção, so that I can identify Products participating in a promotion.
11. As a Usuário, I want to filter by Modelo and Especificação de Modelo, so that I can find Products by model structure.
12. As a Usuário, I want to filter by Localização de Estoque, so that I can find Products stored in a known location.
13. As a Usuário, I want to filter by Lote, so that I can locate Products associated with a specific batch.
14. As a Usuário, I want to filter by Atributos, so that I can use maintained Product metadata.
15. As a Usuário, I want rules within a filter to support E and OU and a tab-level exclusion, so that I can express complex selections using the ERP standard.
16. As a Usuário, I want to select only Filiais I am authorized to access, so that the consultation respects my operational scope.
17. As a Usuário, I want an empty Filial selection to mean all my authorized Filiais, so that convenience never creates global access.
18. As a Usuário in an environment with independent Filiais, I want the selection hidden and restricted to my authorized FilialBase, so that the system follows the configured business rule.
19. As a Usuário, I want to combine Em linha/Fora de linha, Ativo/Inativo, Com/Sem montagem, Brinde/Não brinde and Disponível/Não disponível no site states, so that I can reproduce the legacy selections.
20. As a Usuário, I want selecting both or neither option in a state pair to leave that dimension unrestricted, so that the Delphi semantics are preserved.
21. As a Usuário, I want to exclude Products with zero total Saldo de Estoque, so that the result focuses on stocked Products.
22. As a Usuário, I want generation to show progress and allow cancellation, so that long-running queries do not leave me without control.
23. As a Usuário, I want changed filters to mark existing results as stale, so that I know when Gerar must be executed again.
24. As a Usuário, I want Limpar or Esc to cancel current work, clear results and restore focus to the first filter, so that I can restart efficiently.
25. As a Usuário, I want an explicit empty state when no Product matches, so that an empty result is distinguishable from an error.
26. As a Usuário, I want the result ordered by normalized Product description with FilialBase first, so that related rows are easy to scan.
27. As a Usuário, I want the result paginated without losing selection or filter context, so that large datasets remain usable.
28. As a Usuário, I want to see Item, Produto, description, Filial, Grade values, Grupo, Marca, weight when enabled, situation, promotion, price, commission and relevant stock figures, so that I can choose the correct Product row.
29. As a Usuário, I want inactive or out-of-line Products, promotional Products and commissions to have accessible visual distinctions, so that important states are immediately recognizable.
30. As a Usuário, I want a legend that explains visual states without relying only on color, so that the grid is accessible.
31. As a Usuário, I want to switch to Lotes do Item, so that I can see Lote, expiration and stock/commercial information for the active Product and effective Filiais.
32. As a Usuário, I want to switch to Produtos Similares, so that I can compare bidirectional and explicitly related substitutes without including the original Product.
33. As a Usuário, I want similar grouping rules by Grade to be respected, so that only compatible variants appear when configured.
34. As a Usuário, I want a Grade matrix where each cell shows Produto, Em estoque/Estoque total and price, so that I can compare variants spatially.
35. As a Usuário, I want selecting a Grade cell to make that Product active and load its details, so that navigation remains continuous.
36. As a Usuário, I want to view Models and their observations when the relevant Parâmetro do Sistema is enabled, so that I can understand the active Característica de Produto.
37. As a Usuário, I want Componentes to appear only for a composed Product, so that irrelevant navigation is hidden.
38. As a Usuário, I want Componentes to show component Product, quantity, unit, Grade, price, total, situation and stock, so that I can understand the composition.
39. As a Usuário, I want Atributos to show typed and localized values, including Sim/Não for booleans, so that maintained metadata is understandable.
40. As a Usuário, I want detail requests to load only when their perspective or tab is opened, so that navigating the master result stays responsive.
41. As a Usuário, I want obsolete detail responses discarded when I select another Product, so that I never see details belonging to the previous row.
42. As a Usuário, I want the Estoques detail to show all legacy stock positions, so that I can distinguish Em estoque, Reservado, Reserva prévia, Trânsito, Demonstração, Conserto, Danificada, Futuro and Físico.
43. As a Usuário, I want Estoque venda and Estoque total to follow the documented legacy formulas, so that totals remain comparable with Delphi.
44. As a Usuário, I want to see current price, promotion, validity, change information, location, minimum and maximum, so that stock and commercial context are available together.
45. As a Usuário with the gerential capability, I want to see Financeiro, so that I can inspect cost, Financeiro, IPI, margin, recent Movements, last purchase, tax and supplier information.
46. As a Usuário without the gerential capability, I want gerential data omitted or denied by the server, so that direct endpoint access cannot expose it.
47. As a Usuário with the gerential capability, I want to see monthly Compra and Venda accumulators, so that I can assess recent Movement history.
48. As a Usuário, I want the price tab to switch between conventional prices and prices by Cargo according to the Parâmetro do Sistema, so that the configured pricing model is honored.
49. As a Usuário, I want Preço por Cliente to appear only when enabled, so that conditional pricing data matches system configuration.
50. As a Usuário, I want expired promotions removed from presentation using server time, so that client clock differences cannot show invalid prices.
51. As a Usuário, I want to see open or pending Pedidos with positive pending quantity, so that I can understand expected stock commitments.
52. As a Usuário, I want to see Notas Fiscais de Entrada still pending and exclude canceled or received documents, so that inbound expectations are trustworthy.
53. As a Usuário, I want to open the correct Pedido by its number, so that I can continue investigation in the existing Cadastro.
54. As a gerential Usuário, I want to see Product–Fornecedor relationships and last-entry information, so that I can evaluate supply context.
55. As a Usuário, I want to see open Licitações with positive pending balance and their calculated totals, so that pending commercial commitments are visible.
56. As a Usuário, I want Licitações totals for quantity, balance and monetary total, so that I can assess aggregate exposure.
57. As a Usuário, I want quantity formatting to follow the configured mask and locale, so that decimals are consistent with the ERP.
58. As a Usuário, I want weight visibility to follow the Parâmetro do Sistema, so that sensitive or irrelevant columns are not exposed.
59. As a Usuário, I want CST and CSOSN information to appear according to the existing CRT regimes, so that fiscal context is relevant.
60. As a Usuário, I want detailed Grade stock to include only deposit Filiais when configured, so that the Saldo de Estoque follows the business rule.
61. As a Usuário, I want price calculations to respect the configured ECF rounding behavior, so that values match operational pricing.
62. As an authorized Usuário, I want to alter minimum and maximum by Produto and Filial, so that replenishment limits can be maintained safely.
63. As an authorized Usuário, I want to alter stock location by Produto and Filial with real persistence, so that the Laravel operation does not reproduce the silent Delphi failure.
64. As an authorized Usuário, I want every Alteração of minimum, maximum or location recorded in Auditoria, so that responsibility and timing are traceable.
65. As an authorized Usuário, I want to alter last-purchase value only for the effective Filial, so that other Filiais are not changed accidentally.
66. As an authorized Usuário, I want last-purchase Alteration recorded in Auditoria, so that a financially relevant change is traceable.
67. As a Usuário, I want to open the existing Product photo gallery for the active Product or Grade cell, so that media is reused rather than duplicated.
68. As a Usuário, I want a clear empty-photo state while still seeing available Product details, so that missing media is handled consistently.
69. As a Usuário, I want to open Venda Perdida in inclusion mode without implicit Product prefill, so that strict Delphi behavior is preserved.
70. As a Usuário, I want to open the historical fiscal consultation for the active Product and Nota, so that previous inbound documents can be inspected.
71. As a Usuário, I want grid sorting, resizing, reordering, field selection and saved layout, so that the Consulta follows the ERP grid standard.
72. As a Usuário, I want global grid search through Ctrl+F and field selection through Alt+G, so that standard keyboard tools remain available.
73. As a Usuário, I want to export the complete result through Ctrl+X, so that the Consulta complies with the ERP grid standard rather than exporting only the visible page.
74. As a support analyst, I want the generated result to retain a filter snapshot and server timestamp, so that reported discrepancies can be reproduced.
75. As the business, I want each successful generated consultation recorded in the existing stock statistics with Usuário, FilialBase and server time, so that legacy usage statistics remain available.
76. As a Usuário, I want the Produto magnifier to show one contextual row per Produto and authorized Filial, so that I can distinguish stock availability before choosing a Produto.
77. As a Usuário, I want selecting a lookup row to return only the Produto identity, so that the row Filial does not silently replace my separate Filial filter.
78. As a Usuário, I want the lookup to show Em estoque, Reservado, Futuro and Pedidos, so that I can compare operational availability.
79. As a Usuário with price capability, I want to see Normal and Promotion prices for the row Filial, so that I can compare the correct commercial values.
80. As a Usuário without price capability, I want price properties omitted from the lookup response, so that hidden UI cannot expose restricted data.
81. As a Usuário with commission capability, I want Product and Group commissions displayed with value/percentage semantics, so that their meaning is unambiguous.
82. As a Usuário without commission capability, I want commission properties unavailable for display, search and ordering, so that restricted data cannot be inferred.
83. As a Usuário, I want Grade, Models, Specifications and weight columns to follow their Parâmetros do Sistema, so that the lookup matches the configured Product vocabulary.
84. As a Usuário, I want to search the lookup by Description, code, barcode, Reference, Grade and other authorized fields, so that I can locate a Produto using the information available to me.
85. As a Usuário, I want an explicit advanced full-text search option, so that I can locate Products by indexed descriptive terms without an empty artificial column.
86. As a Usuário, I want to choose Active, Inactive or Both before pagination, so that totals and pages describe the requested situation correctly.
87. As a Usuário, I want the lookup ordered by normalized Description with stable Grade/Product/Filial tie-breakers, so that paging does not reorder records unpredictably.
88. As a Usuário with non-independent Filiais, I want an empty Filial intent to mean all my authorized Filiais, so that convenience never broadens access beyond my grants.
89. As a Usuário in consolidated lookup mode, I want total Em estoque clearly labeled as the sum of authorized Filiais while other values remain identified as FilialBase values, so that mixed scopes are not misleading.
90. As a Usuário, I want the specialized lookup to leave sales and other Product magnifiers unchanged, so that this Consulta-specific parity does not create regressions elsewhere.

## Implementation Decisions

- Build a dedicated Consulta de Estoques module and preserve Análise de Estoques as a separate Relatório.
- Use the existing ERP consultation shell, operation bar, progress/cancellation behavior, filter components, authorized-Filial selector and grid stack.
- Implement the Product magnifier as a Consulta-specific enriched lookup. Reuse `ErpTwoColumnCatalogLookupModal` through a local wrapper, but use a dedicated endpoint/service/query; do not reuse the sales Product-search endpoint or expand the global Product entity resolver.
- The enriched lookup displays Product+Filial context, but selection returns only Product identity (`produto`, visual code and description). Filial, stock, orders, prices and commissions never mutate the separate Filial filter.
- Its required catalog includes Description, Grade values when enabled, Filial when non-independent, mnemonic, Em estoque, Reservado, Futuro, Pedidos, Normal/Promotion prices when authorized, Reference, visual code, barcode, inactive state, conditional weight, conditional Models/Specifications and authorized Product/Group commissions.
- Resolve lookup Filiais server-side with the same effective-Filial rules as Gerar. In consolidated lookup mode, return the authorized FilialBase row and sum only `emestoque` across authorized Filiais, explicitly labeling its scope; other metrics remain from FilialBase.
- Use a master-detail interaction model. The master endpoint returns paginated Product/Filial rows; each external perspective and internal detail is loaded on demand using a stable Product identity and effective Filial context.
- Use one primary high-level contract seam: authenticated HTTP/Inertia behavior for page load, Gerar, detail reads, mutations and integrations. Unit seams are reserved for pure filter compilation and domain calculations.
- Publish a versioned structured search payload. The browser sends Filiais, Product-state options and filter rules; it never sends SQL fragments.
- Validate filter tab, field, operator, value and boolean connectors on the server. Compile rules using controlled registries and bound parameters.
- Reuse the existing Product filter tabs for Item, Product, Group, Class, Brand, Promotion, fiscal fields, Lotes and Atributos. Extend the shared filter vocabulary with Modelo, Especificação de Modelo and Localização de Estoque.
- Require at least one qualifying Product/entity rule before Gerar. Filial selection and state flags alone do not authorize a global Product scan.
- Preserve the Delphi state-pair semantics: exactly one selected side filters; both or neither do not constrain that dimension.
- Resolve effective Filiais exclusively on the server. With independent Filiais, use the authorized FilialBase. Otherwise, an empty selection means all authorized Filiais. Explicit unauthorized Filiais produce a validation error.
- Never copy the existing Análise de Estoques behavior where an empty Filial list removes the SQL Filial restriction.
- Apply module access, data capabilities and mutation capabilities as three distinct authorization layers. UI capability props derive from the same server authorization services used by Policies.
- Define named capabilities for viewing gerential data, updating stock limits/location and updating last-purchase value. Menu visibility and module access are insufficient for sensitive data or mutations.
- Define separate named capabilities for viewing Normal/Promotion prices and Product/Group commissions in the enriched lookup. Omit unauthorized properties from its JSON and whitelist rather than hiding received data.
- Omit gerential fields from responses when capability is absent and deny direct access to gerential endpoints.
- Reuse read services from the Product/Característica de Produto Cadastro where their contract fits, but expose Consulta-specific readonly endpoints rather than coupling the page to Cadastro mutation endpoints.
- Implement a Consulta-specific repository/SQL assembler for the master result and enrich or compose existing repositories for Lotes, Similar Products, Grade, Models, Components, Atributos, prices, Cliente prices and Fornecedores.
- Replace Delphi macros with server-owned SQL compilation and bound parameters.
- Preserve documented Saldo de Estoque and cost formulas. Do not substitute similar metrics from Análise de Estoques without a contract-equivalence test.
- Use server/database time for promotion validity, statistics and Auditoria.
- Preserve the existing `estoques_estatistica` effect after a successful Gerar. Record distinct matching Products with Usuário, FilialBase and server time; do not record canceled or validation-failed requests.
- Load expensive internal datasets only when the respective tab is active. Cancel or ignore stale detail responses after a Product/perspective change.
- Persist stock location correctly by Produto and Filial. This intentionally fixes the Delphi behavior where the UI accepted an Alteração that the UPDATE ignored.
- Scope minimum, maximum, location and last-purchase mutations by Produto and effective Filial. The legacy last-purchase update across all Filiais must not be reproduced.
- Record all Consulta-originated mutations in the standard Auditoria with operation, affected identity, before/after values, Usuário and server time.
- Reuse the existing Product photo gallery and Venda Perdida capture contracts. Venda Perdida opens without prefilled Product in this scope.
- Navigate to the existing Pedido Cadastro using its canonical route and Pedido number. Resolve the precise route during implementation without duplicating the Cadastro.
- Provide a readonly historical-fiscal integration using Product and Nota identity. Reuse a canonical existing route if available; otherwise build only the boundary required by this Consulta.
- Use accessible ERP visual tokens for promotion, inactive/out-of-line and commission semantics. Do not require literal VCL colors or color-only meaning.
- Follow the mandatory ERP grid catalog model with matching frontend/backend catalogs, unique screen/grid identifiers and schema versioning.
- Include sorting, column resize/reorder, field picker, global search, persisted layout and full-dataset Excel export. Export uses the server-side context/job mechanism for large results.
- Treat the following legacy behaviors as corrected divergences: Lotes losing Filial scope, Similar inactivity reading the wrong flag, non-persisted location, cross-Filial last-purchase update, Nota double-click opening from the wrong Pedido dataset, invalid NULL comparison and incomplete detail reset.
- Do not add contextual reauthorization proof because none exists in the legacy requirement. It may be introduced only by a later security decision.
- Do not require literal persistence of filter values between sessions; only grid layout persistence is required.
- Parâmetros do Sistema are mediated by the backend and exposed as capabilities/configuration needed by the UI, including pricing mode, Cliente prices, independent Filiais, Grade, Models, weight, deposit-only Grade stock, quantity formatting, CRT availability and ECF rounding.

## Testing Decisions

- Test external behavior at the authenticated HTTP/Inertia seam whenever possible. Assert authorization, validation, response shape, effective Filiais, observable calculations, persistence, Auditoria and integration URLs rather than controller/service internals.
- Use feature tests modeled after the existing Análise de Estoques access, Gerar, asynchronous cancellation, timeout and export tests.
- Test page access for an administrator, a granted Usuário and a Usuário without module access.
- Test every endpoint independently against missing module access, missing named capability and unauthorized Filial access.
- Test that Filiais returned by lookup are restricted and ordered, independent Filiais resolve to authorized FilialBase, empty non-independent selection resolves to all authorized Filiais and an explicit unauthorized Filial returns validation failure.
- Test the enriched Product lookup contract independently: Product+Filial rows, Product-only selection, parameters controlling Grades/Models/weight, active-state SQL filtering, field whitelists, stable pagination/ordering, full-text advanced search and barcode deduplication.
- Test lookup price and commission capabilities by asserting forbidden properties are absent from JSON and cannot be used for search/sort without capability.
- Test consolidated lookup mode: only `emestoque` is summed, only across authorized Filiais, the scope is labeled, and remaining values come from authorized FilialBase.
- Test that no SQL fragment supplied by a client can bypass the structured filter contract.
- Unit-test filter registries/normalizers/compilers for every supported tab, field/operator combination, E/OU grouping, exclusion and binding order.
- Test the mandatory-selection rule and every state pair with only the left side, only the right side, both and neither.
- Test `Sem estoque zero` for normal Products and Lotes.
- Test master response ordering, pagination, stable identity, filter snapshot, server timestamp and statistics side effect.
- Test that failed validation and canceled generation do not write stock statistics.
- Test each external perspective through its readonly endpoint, including effective Filial propagation.
- Test Similar Products for both relationship directions, explicit relationships, Grade grouping and original-Product exclusion.
- Test Grade matrix cell content and the frontend transition from a selected cell to active Product details.
- Test Components visibility for simple/compound Products and enriched component fields.
- Test typed Atributos conversion and localized boolean/numeric presentation.
- Test all documented Saldo de Estoque formulas and zero-safe cost average at the domain/calculation seam.
- Test CSOSN 101/102 last-purchase-with-ICMS calculation and other CSOSN/CST cases.
- Test promotion expiry and ECF rounding using controlled server time/configuration.
- Test that gerential tabs and fields are available only with the named capability and cannot be fetched directly without it.
- Test Acumuladores signs and period ordering, pending Pedido positivity, excluded canceled/received Notas and Licitação positive balances/totals.
- Test minimum, maximum, location and last-purchase mutations for correct Produto+Filial scope, validation, authorization and Auditoria before/after values.
- Add regression tests proving that location persists, last purchase does not affect another Filial, Lotes retain Filial scope and Similar inactivity uses the correct field.
- Test stale-response protection at the React interaction seam by switching Product/perspective before a delayed detail response completes.
- Test keyboard behaviors F6, Esc/Limpar, Ctrl+F, Alt+G and Ctrl+X through component tests where browser-level behavior is material.
- Reuse existing grid preference and complete-dataset export tests as prior art; verify schema catalog parity and that export is not limited to the current page.
- Test Product photo, Venda Perdida, Pedido and historical-fiscal boundaries by their public contracts; do not test the internals of those external Cadastros from this module.

## Out of Scope

- Changing or renaming the existing Análise de Estoques Relatório.
- Reimplementing the internal Cadastros of Produto, Característica de Produto, Pedido, Venda Perdida, Fornecedor or Product photos.
- Migrating unrelated reports or adding a print-specific layout.
- Modifying or correcting Delphi source code.
- Reproducing the literal VCL layout, colors, component hierarchy or dataset lifecycle.
- Adding contextual reauthorization proof for mutations.
- Prefilling Venda Perdida with the active Product.
- Persisting Consulta filter values between sessions.
- Expanding the historical fiscal module beyond the navigation/read boundary required by this Consulta.

## Further Notes

- The modal lookup and page-size-25 default align with ADR-0002; no ERP UI exception is required. Escape/focus/accessibility behavior follows the shared lookup modal contract.
- The self-contained Spec Kit input is published in the repository's module-analysis catalogue. Agents consuming it must not investigate or depend on Delphi sources; the requirements in the prompt are the authoritative legacy synthesis.
- The source dossier and detailed evidence remain under the completed Consulta de Estoques wayfinding effort. They are the authority for field-level Delphi behavior and identified divergences.
- The standard ERP grid makes layout persistence and complete-result Excel export mandatory even though export was not proven as a Delphi action.
- The specification intentionally corrects security and persistence defects while preserving non-defective visible semantics.
- If a legacy PostgreSQL function cannot satisfy a documented contract, implementation may investigate or replace that function behind the repository seam without changing this user-facing specification.
- Terms such as Filial, Usuário, Permissão, Autorização, Produto, Movimento, Saldo de Estoque, Cadastro, Alteração and Auditoria follow the project domain glossary.
