# Venda Perdida reutilizável

Status: ready-for-agent
Label: ready-for-agent

## Problem Statement

O ERP Delphi registra Venda Perdida por meio de um cadastro compartilhado aberto por Orçamentos, Contratos, Consulta de Estoque e menu próprio. Cada registro representa uma demanda individual não atendida e aceita tanto Produto cadastrado quanto descrição livre de item e grupo. Entretanto, as chamadas legadas abrem um formulário vazio e descartam o contexto já disponível na tela de origem.

O Laravel ainda não possui implementação localizada dessa funcionalidade. A migração precisa criar um fluxo reutilizável, rastreável e contextual, sem confundir Venda Perdida com cancelamento de Orçamento, Contrato ou Venda, sem produzir efeitos em Estoque e sem transformar limitações ou código desativado do Delphi em requisitos.

## Solution

Criar no Laravel um núcleo reutilizável de Venda Perdida e uma interface compartilhada de captura. O consumidor fornece contexto opcional da origem — módulo, registro, Filial, Cliente, Produto, quantidade e valor — e a captura registra uma ocorrência por item/demanda. Produto e contexto podem ser aproveitados quando disponíveis, mas vendedor deve começar vazio e ser escolhido explicitamente.

A captura deve permitir Produto cadastrado ou demanda livre, exigir vendedor e observação livre, registrar Filial e data/hora autoritativas e não alterar o documento nem o Estoque de origem. Não criar Cadastro de Motivos nem concorrente. A implementação deve respeitar Permissões, Autorizações e Auditoria existentes após confirmar sua evidência, além de suportar consulta e integrações sem duplicar regras.

## User Stories

1. As a Usuário, I want to register one lost item or demand, so that unmet commercial interest is traceable.
2. As a Usuário, I want multiple lost occurrences for one negotiation, so that each unmet item remains independently analyzable.
3. As a Usuário, I want to select a registered Produto, so that the occurrence uses existing product identity.
4. As a Usuário, I want the Produto group derived when available, so that classification remains consistent.
5. As a Usuário, I want to describe an item not present in the Cadastro, so that missing assortment can be recorded.
6. As a Usuário, I want to describe the free item's group, so that uncatalogued demand can still be classified.
7. As a Usuário, I want invalid mixtures of registered and free product data prevented, so that records remain unambiguous.
8. As a Usuário, I want observations required, so that the reason and relevant circumstances are recorded in free text.
9. As a Usuário, I want no mandatory structured loss reason, so that the workflow matches the confirmed business decision.
10. As a Usuário, I want no competitor field introduced, so that unsupported data is not invented.
11. As a Usuário, I want vendedor initially blank, so that I explicitly identify the responsible seller.
12. As a Usuário, I want vendedor required before save, so that every occurrence has commercial ownership.
13. As a Usuário, I want Filial derived from the effective context, so that the occurrence belongs to the correct fiscal establishment.
14. As a Usuário, I want server date and time recorded, so that the occurrence has an authoritative timestamp.
15. As an Orçamento user, I want to open the shared capture from the current Orçamento, so that its context need not be re-entered.
16. As a Contrato user, I want to use the same capture, so that behavior is consistent across Sales modules.
17. As an Estoque query user, I want to register unmet demand for the selected Produto, so that stock consultation can feed lost-demand analysis.
18. As a Usuário, I want the selected Produto prefilled when supplied by the origin, so that repetitive typing is avoided.
19. As a Usuário, I want Cliente, quantity and value displayed/prefilled when supplied, so that useful commercial context is retained.
20. As a Usuário, I want absent optional context accepted, so that the feature also works from a standalone menu.
21. As a Usuário, I want canceling the modal to leave the source unchanged, so that capture is non-destructive.
22. As a Usuário, I want saving a Venda Perdida not to alter Orçamento, Contrato or Estoque, so that it remains an analytical occurrence.
23. As a Usuário, I want duplicate submission protected, so that one action does not create repeated records.
24. As a Usuário, I want clear validation near invalid fields, so that I can correct the record.
25. As a keyboard user, I want accessible focus and keyboard operation, so that the shared capture is efficient.
26. As an authorized Usuário, I want to consult Vendas Perdidas, so that recorded demand can be reviewed.
27. As an authorized Usuário, I want to alter a record only under the defined policy, so that historical integrity is protected.
28. As an authorized Usuário, I want deletion confirmed and governed by the defined Permission/Authorization, so that historical records are not removed casually.
29. As an auditor, I want inclusions, changes and deletions in Audit, so that actors and timestamps are traceable.
30. As a manager, I want filters supported by evidence from the legacy consultation, so that lost demand can be analyzed without invented dimensions.
31. As a maintainer, I want one application contract for all consumers, so that rules and UI are not copied.
32. As a maintainer, I want origin-specific mapping isolated in adapters, so that the core does not depend on Orçamento or Contrato internals.
33. As a maintainer, I want legacy findings classified with evidence, so that possible bugs are not silently migrated.
34. As a maintainer, I want compatibility with the effective legacy schema evaluated, so that persistence decisions are deliberate.
35. As a maintainer, I want the full Delphi consumer inventory checked, so that no active use is omitted.

## Implementation Decisions

- Model Venda Perdida as one occurrence per item or unmet demand, not as an entire lost Orçamento or canceled transaction.
- Allow either a registered Produto or a free item description. Support registered or free group consistently with the selected item mode.
- Keep observations as mandatory free text. Do not introduce structured reasons or competitors.
- Keep vendedor mandatory and initially blank; do not default it from the logged-in Usuário, authorizer or source context.
- Receive optional source context through one reusable contract: source type/identity, Filial, Cliente, Produto, quantity and value.
- Treat source context as traceability/prefill only. Creating a Venda Perdida has no side effects on Orçamento, Contrato, Venda or Estoque.
- Use source-specific adapters and one shared capture/application service instead of copied module logic.
- Resolve the effective Filial and timestamp authoritatively on the server.
- Confirm the physical legacy table, constraints, sequence, relationships and trigger Audit before choosing compatible persistence or an intentional schema extension.
- Confirm actual Permission and Authorization behavior. Delphi evidence currently proves contextual login authorization on deletion, not on save.
- Preserve a standalone consultation/maintenance capability only to the extent supported by evidence and agreed authorization policy.
- Protect create/update/delete with transactions, idempotency and concurrency controls appropriate to existing Laravel patterns.
- Integrate existing Laravel consumers only after inventorying their current routes, actions and shared UI conventions.

## Testing Decisions

- Primary seam: invoke the public reusable capture from a real consumer, submit it and observe the persisted Venda Perdida plus unchanged source document.
- Contract seam: run the same behavioral contract against Orçamento, Contrato, Consulta de Estoque and standalone adapters that exist in scope.
- Prefer Feature tests at HTTP/application boundaries and component tests for externally visible capture behavior; do not test private helpers.
- Cover registered Produto, free item/group, required observation, blank/required vendedor and invalid mixed states.
- Cover context present, partially present and absent; ensure vendedor remains blank regardless of context.
- Cover correct Filial, server timestamp, Audit actor and source traceability.
- Cover cancel, validation failure, repeated submit, concurrent change and authorization denial.
- Prove that source Orçamento/Contrato and Estoque are unchanged after success or failure.
- Reuse prior art from existing Laravel modal, lookup, Permission, Audit and repository Feature tests discovered during inspection.

## Out of Scope

- Changing Delphi or implementing in this analysis workspace.
- Treating a whole negotiation, canceled Orçamento or canceled Contrato as Venda Perdida.
- Automatically generating Venda Perdida from cancellation or stock unavailability.
- Creating structured loss reasons or a competitor Cadastro/field.
- Defaulting vendedor from context or logged-in Usuário.
- Modifying source documents or stock balances.
- Copying the Delphi visual layout or its limitations.
- Implementing unproven reports, parameters or authorization rules.

## Further Notes

- CONFIRMADO: Delphi fields include code, Filial, vendedor, group, date/time, observations, Produto and free item/group descriptions.
- CONFIRMADO: vendedor and observations are required; Filial and date/time are initialized on inclusion.
- CONFIRMADO: Orçamento, Contrato and Consulta de Estoque open the same form with only the `Incluir` operation and pass no business context.
- CONFIRMADO: deleting asks confirmation and contextual login authorization.
- CONFIRMADO: code that would assign the authorizing Usuário as vendedor is commented out.
- NÃO LOCALIZADO: Laravel Venda Perdida implementation, structured reason, competitor or specific Venda Perdida system parameter.
- The `/speckit.specify` stage must inspect PAS and DFM together and replace any contradicted hypothesis with concrete evidence.
