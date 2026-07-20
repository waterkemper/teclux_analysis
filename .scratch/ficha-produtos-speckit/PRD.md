# Ficha de Produtos no Laravel

Label: ready-for-agent
Status: ready-for-agent

## Problem Statement

Usuários do ERP dependem da Ficha de Produtos para investigar historicamente como um Produto chegou à sua posição de estoque: quais Movimentos ocorreram, qual foi o delta de cada evento, quais snapshots acumulados ficaram gravados, como os Lotes foram afetados, quem executou ou autorizou o lançamento e quais Contratos estavam relacionados.

O Laravel possui Cadastro de Produtos, Análise de Estoques, Movimentação Diária, lookups, Filiais autorizadas e infraestrutura de grids, mas ainda não oferece a Ficha de Produtos. As telas existentes têm finalidades diferentes e não entregam opening balance, snapshots históricos por Filial e Lote nem o detalhe contratual contextual.

A migração não pode reconstruir saldo somando ingenuamente os deltas nem reproduzir defeitos anteriores, como saldo por Lote contraditório, Filial sem restrição, resultado obsoleto tratado como atual, Lote de outro Produto, definição de avulso pelo Autorizador ou exposição financeira baseada somente no acesso ao módulo.

## Solution

Criar uma nova consulta **Estoques → Ficha de Produtos**, independente e estritamente somente leitura, usando o shell e o grid ERP atuais.

O Usuário selecionará um Produto, Lote quando aplicável, Filiais autorizadas, Tipo de Movimento, Período e a opção de lançamentos avulsos. A consulta apresentará as perspectivas Movimentos e Lotes, com eventos paginados e snapshots históricos, opening balance tipado por Filial ou Filial+Lote, grupos configuráveis de colunas e histórico completo do Contrato carregado sob demanda.

A solução reutilizará os contratos Laravel de Produto, Lote, Tipo de Movimento, acesso a Filiais, consulta pesada, grade, preferências, exportação, auditoria e Contratos. O read model histórico será próprio da Ficha. Dados financeiros terão capacidade server-side independente e não existirão endpoints de escrita.

## User Stories

1. As a Usuário autorizado, I want to open Ficha de Produtos from Estoques, so that I can investigate stock history without returning to another system.
2. As an administrator, I want module access to follow the ERP authorization model, so that existing grants remain consistent.
3. As a Usuário without access, I want every endpoint denied by the server, so that hiding the menu is not treated as authorization.
4. As a Usuário granted through a group, I want the same access as a direct grant, so that group administration remains effective.
5. As a Usuário, I want Produto to be mandatory, so that an unrestricted historical scan cannot start.
6. As a Usuário, I want the Produto lookup to show visual code and description, so that I can select the correct item.
7. As a Usuário arriving through a deep-link, I want Produto preselected without automatic generation, so that I can review the remaining filters.
8. As a Usuário, I want Lote unavailable until Produto is valid, so that invalid combinations cannot be selected.
9. As a Usuário, I want the Lote lookup restricted to the selected Produto, so that I cannot query an unrelated Lote.
10. As a Usuário consulting a Produto that controls Lote or validity, I want Lote required, so that its history is unambiguous.
11. As a Usuário, I want changing Produto to clear Lote, so that stale dependent input cannot survive.
12. As a Usuário, I want to select only authorized Filiais, so that the query respects my operational scope.
13. As a Usuário, I want no Filial selection to mean all my authorized Filiais, so that convenience never removes the SQL restriction.
14. As a Usuário, I want an explicit error for an unauthorized Filial, so that manipulated requests cannot leak data.
15. As a Usuário, I want to filter by an optional Tipo de Movimento, so that I can focus the event timeline.
16. As a Usuário, I want the Tipo lookup to expose code and description, so that codes remain understandable.
17. As a Usuário, I want the default Período from the first day of the month through today, so that common investigations are quick.
18. As a Usuário, I want invalid dates and reversed periods rejected by field, so that I can correct the request.
19. As a Usuário, I want the complete final day included, so that late events are not omitted.
20. As a Usuário, I want to filter only avulsos using the Tipo de Movimento classification, so that authorization presence is not mistaken for event nature.
21. As a Usuário, I want Gerar to validate and replace the result, so that the data always corresponds to one filter snapshot.
22. As a Usuário, I want changed filters to mark the result as stale, so that old data is never presented as current.
23. As a Usuário, I want a clear loading state and duplicate generation prevention, so that long reads remain understandable.
24. As a Usuário, I want timeout and retry behavior that preserves filters, so that a transient failure does not force re-entry.
25. As a Usuário, I want an explicit empty state, so that no Movements is distinct from a failure.
26. As a Usuário, I want Movimentos as the initial result perspective, so that I see the main event timeline first.
27. As a Usuário, I want each Movement to distinguish event quantity from accumulated snapshots, so that I do not interpret delta as balance.
28. As a Usuário, I want Movements without Lote retained, so that the historical timeline is complete.
29. As a Usuário, I want to see Em estoque, Reservado, Trânsito, Demonstração, Conserto, Futuro, Danificada, Estoque físico and Reserva prévia snapshots, so that every relevant stock position is traceable.
30. As a Usuário, I want a typed opening balance before the period for each Filial, so that I know the starting position without fabricating a Movement.
31. As a Usuário, I want absence of prior snapshot shown explicitly, so that missing history is not represented as confirmed zero.
32. As a Usuário, I want the Lotes perspective to use historical Movimento por Lote data, so that batch effects remain separate from master Movements.
33. As a Usuário, I want Lotes to show all Lotes in scope or only the filtered Lote, so that navigation in Movimentos cannot silently change the dataset.
34. As a Usuário, I want opening balance per Filial and Lote, so that batch starting positions are correct.
35. As a Usuário, I want deterministic ordering and pagination, so that rows do not duplicate or disappear between pages.
36. As a Usuário, I want the 14 Operação positions and their labels, so that I can understand which dimensions an event affected.
37. As a Usuário, I want unknown Operação symbols preserved, so that historical information is not guessed or discarded.
38. As a Usuário with financial capability, I want Financeiro, cost, average cost, prices, IPI and currency, so that I can investigate value history.
39. As a Usuário without financial capability, I want financial values omitted from UI, responses and exports, so that server-side confidentiality is preserved.
40. As a Usuário, I want average cost calculated from the documented seven dimensions with zero-safe behavior, so that values are comparable.
41. As a Usuário, I want to see Cliente/Fornecedor resolved from the Movement or linked note, so that the counterparty is clear.
42. As a Usuário, I want Executor and Autorizador shown as separate roles, so that execution and approval remain auditable.
43. As a Usuário, I want an absent Autorizador supported, so that ordinary Movements remain valid.
44. As a Usuário, I want explicit column groups for Referência, Operação and Cliente/Fornecedor, so that information is discoverable without hidden shortcuts.
45. As a Usuário, I want to configure and persist grid columns, so that recurring analysis matches my workflow.
46. As a Usuário, I want to open the Contract context for a Movement, so that I can inspect its commercial origin.
47. As a Usuário, I want the Contract detail to include documentary status, dates, Product, quantity, returned and exchanged amounts, so that its history is complete.
48. As a Usuário, I want composed Products recognized in Contract detail, so that component Movements can be traced to the contracted item.
49. As a Usuário, I want the panel labeled Histórico completo do contrato, so that I understand it is not limited by the master period and type.
50. As a Usuário, I want Contract detail failure isolated from the master result, so that an auxiliary error does not erase Movements.
51. As a Usuário, I want server-side export to use the generated filters and authorization, so that the file matches the consultation without leaking data.
52. As a support analyst, I want correlation, duration, non-sensitive filter snapshot and row counts logged, so that failures can be diagnosed.
53. As a security reviewer, I want all queries parameterized and read-only, so that client input cannot mutate or inject SQL.
54. As the business, I want no creation, update, deletion or trigger-suppression endpoint, so that this delivery remains consultation-only.
55. As a developer, I want the historical read model isolated from Movimentação Diária, so that each module keeps one coherent purpose.
56. As a developer, I want existing Produto, Lote, Filial, Tipo, grid and Contract boundaries reused, so that the ERP does not duplicate maintained capabilities.
57. As a developer, I want generation to execute synchronously with server-side pagination and a bounded timeout, so that the response contract stays simple and does not depend on polling or background jobs.
58. As a tester, I want the feature verified at the authenticated HTTP/Inertia seam, so that tests cover real authorization, validation and response behavior.
59. As a tester, I want pure historical selection and calculation rules covered at focused seams, so that failures in opening balance and average cost are diagnosable.
60. As a Usuário, I want accessible visible controls with keyboard support, so that hidden shortcuts are not required.

## Implementation Decisions

- Build a dedicated Ficha de Produtos module. Do not rename or extend Análise de Estoques, Movimentação Diária or Cadastro de Produtos into this feature.
- Keep the feature strictly read-only. No Movement mutations, financial corrections or trigger-suppression behavior are included.
- Use the existing ERP consultation shell with Parâmetros and Dados. Dados contains Movimentos and Lotes; Contract history loads on demand.
- Use one primary high-level contract seam: authenticated HTTP/Inertia behavior for page load, Gerar, lookups, result pagination, Contract detail and export.
- Publish a structured, validated filter payload containing Produto, optional Lote, authorized Filiais, optional Tipo, Período and avulso flag. Never accept SQL fragments.
- Resolve empty Filiais to the explicit complete list of authorized Filiais before query compilation.
- Use a dedicated historical consultation service and readonly repository. Reuse infrastructure and join conventions, but not the Movimentação Diária result contract.
- Read accumulated snapshots directly from historical Movement sources. Do not reconstruct them by summing event quantity or using current stock.
- Model opening balance separately from persisted Movement rows.
- Select opening balance per Filial for Movimentos and per Filial+Lote for Lotes, using deterministic descending event identity.
- Do not apply Tipo or avulso filters to opening balance because it represents the real prior position; do apply Produto, Filial and structural Lote scope.
- Use a half-open date interval ending at midnight after the final date.
- Define avulso through the Tipo de Movimento internal/external classification, not the presence of Autorizador.
- Preserve Movements without Lote in Movimentos. Lotes remains independent from the active master row.
- Use stable server-side ordering and pagination.
- Map all 14 Operação characters and preserve unknown markers literally.
- Calculate average cost from Financeiro divided by Em estoque, Reservado, Reserva prévia, Trânsito, Demonstração, Conserto and Danificada; exclude Futuro and Estoque físico; return zero for zero denominator.
- Resolve Executor and Autorizador independently and permit null Autorizador.
- Protect all financial fields through a named server-side capability separate from module access and branch scope.
- Load Contract history through a dedicated readonly projection supporting direct and composed Products, returns and exchanges.
- Label Contract detail as complete history and do not silently imply the master Period/Tipo/avulso filters apply.
- Reuse the current ERP grid catalog, preferences, field picker, search and export patterns with module-specific catalogs.
- Execute the main Gerar operation synchronously and return its paginated result in the same HTTP request. Do not create generation jobs, polling/status endpoints or background processing for the consultation. Apply a bounded database/request timeout and optimize the readonly queries and indexes while preserving this synchronous contract.
- Client-side cancellation may abort an in-flight HTTP request, but it must not introduce a persisted generation job. Large exports may remain asynchronous because they are a separate operation.
- Export is an allowed Laravel adaptation and must reproduce generated filters, branch scope and field-level authorization.
- No database schema change is expected; read the legacy PostgreSQL schema through parameterized readonly queries.
- Treat contradictory batch balance SQL, synthetic empty rows, stale results, unrestricted empty branch filters, batch/master coupling and monolithic manager permission as rejected legacy behavior.

## Testing Decisions

- Prefer authenticated feature tests at the HTTP/Inertia seam. Assert observable authorization, validation, filter resolution, response shape, ordering, pagination, confidentiality and error states rather than controller/service internals.
- Model feature tests after existing Análise de Estoques and Movimentação Diária tests for module access, generation, timeout and export, adapting generation tests to assert a synchronous response without job/status polling.
- Test that Gerar returns the requested page in the same request and that no generation job or status endpoint is required.
- Add focused tests for pure filter compilation, opening-balance partition/selection, Operação mapping and average-cost calculation.
- Test direct, group and administrator access plus denial on every endpoint.
- Test one/multiple authorized Filiais, empty selection and explicit unauthorized Filial.
- Test Produto/Lote dependency, required Lote and mismatched Lote rejection.
- Test half-open period limits, optional Tipo and avulso classification.
- Test deterministic pagination with tied timestamps/launch identifiers.
- Test Movement snapshots, Movement without Lote and Lote projection independently.
- Test opening balance for multiple Filiais and Filial+Lote groups, including absent prior snapshot.
- Test financial response and export with and without capability.
- Test Executor/Autorizador and counterparty resolution.
- Test direct/composed Contract item, return/exchange totals and isolated detail failure.
- Test stale, loading, empty, timeout and retry UI behavior at the appropriate interaction seam.
- Test that the public route set contains no create, update or delete operation and that all data queries are readonly/parameterized.
- Use representative database fixtures instead of mocking the repository for historical SQL behavior.

## Out of Scope

- Changing Análise de Estoques or Movimentação Diária into the Ficha.
- Reimplementing Cadastro de Produtos, Lotes, Contratos, Pessoas, Notas or Usuários.
- Creating, editing or deleting Movements.
- Financial correction and inline editing.
- Trigger suppression.
- PDF or print layout.
- Recalculating persisted snapshots from deltas.
- Adding Acabados or Semiacabados without an authoritative historical source.
- Persisting consultation filters or result data between sessions.
- Reproducing literal desktop layout, hidden column indices or legacy keyboard-only interaction.
- Investigating or changing Delphi code.

## Further Notes

- The authoritative, self-contained Spec Kit prompt is published in the module-analysis catalogue. It must not ask an agent to inspect Delphi.
- Terms Produto, Lote, Filial, Movimento, Tipo de Movimento, Executor, Autorizador, Contrato, Permissão and Autorização retain the ERP meanings described in this spec.
- Existing Laravel names and paths should be verified during implementation because they may evolve; functional decisions in this spec remain authoritative.
- The primary test seam follows the user''s accepted recommendation to maximize reuse and validate the full request path.
