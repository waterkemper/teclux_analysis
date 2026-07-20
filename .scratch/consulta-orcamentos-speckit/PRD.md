# Consulta de Orçamentos completa

Status: ready-for-agent
Label: ready-for-agent

## Problem Statement

O Laravel possui uma Consulta de Orçamentos inicial, mas ela funciona como uma prévia: expõe poucos filtros, uma grade resumida e cancelamento em lote simplificado. O Delphi oferece uma consulta operacional completa com filtros comerciais, de Produto e Atendimento, seleção, totalizadores, detalhe dos Produtos e ações integradas sobre Orçamento, Contrato, Atendimento, Vendas do Cliente e Ficha Financeira.

A implementação Laravel não deve copiar a interface Delphi nem criar novos componentes específicos para recursos que já existem na Consulta de Contratos. Ela precisa aproveitar os filtros, grids, barra de operações, geração cancelável, autenticação sensível e composição SQL já consolidados, preservando as regras próprias do Orçamento e integrando os specs existentes de Cancelamento/Exclusão e Impressão.

## Solution

Transformar a prévia em uma Consulta de Orçamentos completa, organizada em abas de Filtros e Resultados. Filtros são editados livremente e aplicados apenas ao acionar Gerar. A tela reutiliza os painéis Laravel de Filiais, Produto, Cliente, Fornecedor, vendedor, Plano de Pagamento, períodos e último Atendimento, acrescentando os critérios específicos comprovados no Delphi.

Os resultados usam uma grade mestre com linha ativa, seleção múltipla e totalizadores, seguida de detalhe sob demanda. A aba Produtos do detalhe substitui a mesclagem de grids do Delphi e permite filtrar situações Atendido, Parcialmente atendido e Não atendido. Ações contextuais usam somente a linha ativa; seleção múltipla é restrita a Cancelar/Excluir e Imprimir.

## User Stories

1. As a Usuário, I want to configure filters before querying, so that database work only happens when I choose Gerar.
2. As a Usuário, I want changed filters not to refresh automatically, so that complex criteria can be composed safely.
3. As a Usuário, I want to cancel a long-running generation, so that I am not trapped by an expensive query.
4. As a Usuário, I want authorized Filiais selectable, so that results remain within my access.
5. As a Usuário, I want to filter by one or more Products and Product dimensions, so that I can find relevant proposals.
6. As a Usuário, I want Product filters for item, group, class, brand and promotion, so that legacy commercial segmentation remains available.
7. As a Usuário, I want to filter by Product supplier, so that proposals containing products from selected Fornecedores can be found.
8. As a Usuário, I want the Supplier filter to reuse Consulta de Contratos behavior, so that rules and SQL stay consistent.
9. As a Usuário, I want to filter by Cliente rules, so that customer subsets are reusable and expressive.
10. As a Usuário, I want to filter by Cliente name text when no exact Cliente is selected, so that partial lookup remains possible.
11. As a Usuário, I want to filter Clientes marked or not marked as “não ligar”, so that contact policy is respected.
12. As a Usuário, I want to filter by vendedor, so that commercial ownership can be analyzed.
13. As a Usuário, I want to filter by payment Plan, so that payment proposals can be isolated.
14. As a Usuário, I want to filter by issue date range, so that creation periods can be analyzed.
15. As a Usuário, I want to filter by validity range, so that expiring or expired proposals can be located.
16. As a Usuário, I want to filter by Orçamento Situação, so that active and canceled records are distinguished.
17. As a Usuário, I want to filter by total value range, so that commercial magnitude can be constrained.
18. As a Usuário, I want to filter by Atendimento count and operator, so that follow-up activity can be measured.
19. As a Usuário, I want to filter by last contact date, so that stale negotiations can be identified.
20. As a Usuário, I want to filter by “lembrar em” date, so that scheduled follow-ups can be found.
21. As a Usuário, I want selectable ordering, so that the most relevant records appear first.
22. As a Usuário, I want active-filter summaries, so that I can understand complex criteria before generating.
23. As a Usuário, I want validation near invalid ranges, so that contradictory filters are corrected before querying.
24. As a Usuário, I want generated filters preserved when navigating results, so that context is not lost.
25. As a Usuário, I want results paginated and server-ordered, so that large result sets remain usable.
26. As a Usuário, I want the first row active after generation, so that details are immediately available.
27. As a Usuário, I want to select an active row independently from checkbox selection, so that detail and batch actions do not conflict.
28. As a Usuário, I want columns for code, vendedor, Cliente, Filial, issue, validity, totals, Situação and Contract, so that each proposal is recognizable.
29. As a Usuário, I want cancellation reason and description visible when applicable, so that canceled proposals are understandable.
30. As a Usuário, I want Contract Situação and Atendimento summary visible, so that downstream progress is clear.
31. As a Usuário, I want total record count and value for the complete filtered set, so that pagination does not distort aggregates.
32. As a Usuário, I want selected record count and value, so that batch scope is clear.
33. As a Usuário, I want keyboard navigation and shortcuts, so that frequent consultation remains efficient.
34. As a Usuário, I want a master–detail layout, so that detail can be inspected without losing the list.
35. As a Usuário, I want Product detail loaded only for the active Orçamento, so that the initial query stays efficient.
36. As a Usuário, I want Product lines ordered as in the Orçamento, so that the proposal structure is preserved.
37. As a Usuário, I want to see Product quantities, prices, discounts, totals, forecast and stock/reservation data, so that fulfillment can be evaluated.
38. As a Usuário, I want Product situation shown according to the system parameter, so that company policy is respected.
39. As a Usuário, I want to filter detail Products by Attended, Partially attended and Not attended, so that fulfillment gaps are visible.
40. As a Usuário, I want to open the active Orçamento Cadastro, so that I can inspect or edit it under its own rules.
41. As a Usuário, I want double click to open the active Orçamento, so that the common shortcut remains available.
42. As a Usuário, I want to open the linked Contract only when one exists, so that the action remains contextual.
43. As an authorized Usuário, I want to create/open Atendimento for the active Orçamento, so that follow-up is recorded.
44. As a Usuário, I want to consult Sales for the active Cliente, so that prior commercial history is accessible.
45. As a Usuário, I want to open the active Cliente's Financial Record, so that credit context can be reviewed.
46. As a Usuário, I want context actions disabled with clear reasons when inapplicable, so that failures are predictable.
47. As a Usuário, I want batch selection limited to Cancel/Exclude and Print, so that context actions cannot accidentally affect many records.
48. As an authorized Usuário, I want selected Orçamentos canceled or excluded using the complete existing workflow, so that Motivo, description, Atendimento and Authorization are respected.
49. As an authorized Usuário, I want selected Orçamentos printed using the complete PDF workflow, so that Credit Analyst authorization and photo options are respected.
50. As a batch user, I want per-record outcomes, so that partial success is transparent.
51. As a Usuário, I want selection reconciled after batch changes, so that stale records are not silently retained.
52. As an auditor, I want every mutating action authorized and audited, so that the consultation is not a policy bypass.
53. As a maintainer, I want existing Consulta de Contratos components reused, so that filters and behavior do not fork.
54. As a maintainer, I want a versioned filter payload, so that saved navigation and future evolution are controlled.
55. As a maintainer, I want SQL composition to avoid row multiplication, so that totals and pagination remain correct.
56. As a tester, I want one end-to-end consultation seam, so that filters, results, detail and operations are proven together.

## Implementation Decisions

- The Cursor/SpecKit execution environment must treat the consolidated Delphi evidence in the handoff as authoritative input and inspect only Laravel. Missing or ambiguous Delphi evidence becomes an explicit blocker returned to the analysis workspace; it must not be inferred from images, UI behavior or inaccessible source paths.

- Replace the preview with a full Consulta de Orçamentos page following Consulta de Contratos structure.
- Use explicit `Gerar`; do not query reactively on filter changes.
- Reuse existing operation bar, generating banner/cancel mechanism, filter sections, active-count badges, authorized Filiais, Product, Client, Supplier, Seller, Payment Plan and Atendimento components.
- Include Supplier through Product relationships using the existing Consulta de Contratos component and SQL composition.
- Add legacy-specific filters: Situação, issue/validity ranges, total range, Atendimento count, last contact, remember date, do-not-call state, name contains and ordering.
- Use a versioned, normalized filter payload and a dedicated payload builder.
- Enforce authorized Filiais server-side regardless of submitted filters.
- Use server-side pagination, ordering and aggregates over the full filtered set.
- Distinguish active row from checkbox selection.
- Restrict batch selection to Cancel/Exclude and Print.
- Use master–detail; do not reproduce Delphi merged grids.
- Load active Orçamento detail and Products on demand, with stale-request protection.
- Apply Product situation parameter and expose A/P/N detail filters only when meaningful.
- Context actions operate on active row and use their target module's own Permission/eligibility checks.
- Integrate, rather than redefine, the existing Cancelamento/Exclusão and Impressão specs.
- Preserve filters, active row and reasonable selection state when returning from context operations.
- Avoid multiplicative joins using EXISTS/subqueries or proven shared query composition.
- Return structured batch outcomes and refresh affected rows/aggregates authoritatively.

## Testing Decisions

- Primary seam: configure filters, click Gerar, inspect results/detail, select rows and execute a contextual or batch operation while verifying state preservation.
- Test external behavior at request/application/page boundaries, not private SQL helper structure.
- Reuse Consulta de Contratos filter payload, component, generation-cancellation, grid and sensitive-auth tests as prior art.
- Cover every filter independently and important combinations, especially Product+Supplier+Atendimento.
- Cover validation, normalization, payload version and authorized Filiais.
- Cover count/sum correctness with pagination and joins that would otherwise duplicate rows.
- Cover active row versus selected rows, select page/all policy and reconciliation after refresh.
- Cover detail loading, race between row changes and Product situation filters.
- Cover each contextual operation, missing context, Permission denial and return-state preservation.
- Cover batch Cancel/Exclude and Print through their full existing seams, including partial results and concurrency.
- Cover keyboard, focus, responsive master–detail and accessible labels.

## Out of Scope

- Copying the Delphi visual layout or merged grid.
- Creating duplicate filter components or Supplier SQL.
- Redefining the business rules of Cancelamento/Exclusão or Impressão.
- Allowing contextual actions over multiple selected rows.
- Automatically querying whenever a filter changes.
- Implementing in this analysis workspace or altering Delphi.

## Further Notes

- CONFIRMADO: Delphi operations are Gerar, Cancelar/Excluir, Imprimir, Orçamento, Contrato, Atendimento, Consultar Vendas and Ficha Financeira.
- CONFIRMADO: cancellation of multiple Orçamentos uses contextual Gerente de Vendas Authorization.
- CONFIRMADO: current Laravel already has page/request/service/repository, basic filters, grade, selection and simplified batch cancellation.
- DIVERGENTE: current UI exposes fewer filters than its request and far fewer than Delphi/Consulta de Contratos components support.
- DIVERGENTE: current batch cancellation prompt must be replaced by integration with the complete cancellation spec.
- NÃO LOCALIZADO: current Laravel batch printing, master–detail and context operations.
