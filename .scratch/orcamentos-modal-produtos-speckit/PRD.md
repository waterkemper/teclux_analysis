# Inclusão e edição de Produtos no Orçamento

Status: ready-for-agent
Label: ready-for-agent

## Problem Statement

O modal Laravel de Produtos do Orçamento não oferece hoje um fluxo confiável de quantidade. A edição explícita pode impedir ou não preservar corretamente o valor informado, enquanto manter `F5` pressionado dispara confirmações repetidas e soma indefinidamente a quantidade da linha. Inclusão, edição, soma por novo bipe e hidratação assíncrona compartilham caminhos e estados, tornando ambíguo se uma quantidade deve substituir, iniciar ou incrementar uma linha.

Além dos bugs conhecidos, a migração precisa comprovar se todas as informações, parâmetros, permissões, validações e efeitos da tela Delphi existem no Laravel. O componente Laravel é compartilhado por Produtos de Venda, portanto a correção para Orçamentos não pode introduzir regressões ou espalhar regras específicas para outros documentos.

## Solution

Modelar explicitamente o fluxo como comandos e estados distintos: nova inclusão, quantidade preparada, Produto carregado para inclusão, edição explícita, confirmação em andamento e pós-gravação. Cada entrada do Usuário terá uma única consequência observável.

Na edição explícita, a quantidade informada substituirá o valor da linha. Um novo bipe do mesmo Produto e Filial incrementará uma unidade, ou a quantidade deliberadamente preparada. Um novo Produto nunca herdará a quantidade exibida do Produto anterior. O `F5` ignorará repetição automática, será protegido por trava síncrona e só poderá confirmar novamente depois de nova interação funcional.

A solução também fechará a análise Delphi–Laravel de todos os campos e tabs do modal, preservando regras comprovadas, parâmetros, permissões, validações, cálculos e efeitos no Orçamento. Regras comuns permanecerão no núcleo compartilhado; diferenças de Orçamento serão fornecidas pelo contexto/adaptador.

## User Stories

1. As a Usuário de Orçamentos, I want to edit an existing Product quantity, so that the saved quantity replaces the old value.
2. As a Usuário, I want changing quantity from 2 to 5 in edit mode to result in 5, so that editing never behaves like an increment.
3. As a scanner operator, I want scanning the same Product and Filial again to add one, so that repeated physical units are recorded efficiently.
4. As a scanner operator, I want the same Product in another Filial to create or address another line, so that Filial identity is preserved.
5. As a Usuário, I want to prepare quantity before scanning a new Product, so that the Product is included with that quantity.
6. As a Usuário, I want a prepared quantity applied as an increment when scanning an existing Product and Filial, so that bulk inclusion is intentional.
7. As a Usuário, I want prepared quantity consumed once, so that it does not contaminate the next Product.
8. As a Usuário, I want a new Product scanned after viewing quantity 5 to start with 1, so that displayed residue is not reused.
9. As a Usuário, I want the configured default quantity respected for a genuinely new line when applicable, so that the System Parameter remains effective.
10. As a Usuário, I want repeat scanning an existing line without prepared quantity to add exactly 1 regardless of the configured new-line default, so that a bipe represents one physical unit.
11. As a Usuário editing a line, I want scanning another Product to preserve the original line, so that unsaved edit state is not applied to another identity.
12. As a Usuário editing a line, I want another Product scan to start inclusion with quantity 1, so that old quantity does not migrate.
13. As a Usuário, I want one physical F5 press to produce at most one confirmation, so that keyboard behavior is safe.
14. As a Usuário, I want holding F5 not to add quantities repeatedly, so that browser key repeat cannot alter business data.
15. As a Usuário, I want another F5 without a new action to do nothing, so that a saved command is not replayed.
16. As a Usuário, I want F5 enabled again after a new scan, quantity edit, Product selection or explicit edit action, so that valid work can continue.
17. As a Usuário, I want clicks and shortcuts disabled atomically while confirming, so that concurrent confirmations cannot start before rendering updates.
18. As a scanner operator, I want one next scan buffered during an active operation, so that a rapid scan is not silently lost.
19. As a scanner operator, I want the buffered scan processed once after completion, so that it is neither lost nor duplicated.
20. As a Usuário, I want stale lookup responses ignored, so that they cannot overwrite the current Product or quantity.
21. As a Usuário, I want the saved Product remain visible, so that I can verify the result.
22. As a scanner operator, I want focus and selection returned to the Product code after saving, so that the next scan replaces the visible code.
23. As a Usuário, I want the visible post-save quantity treated as informational, so that it is not implicitly prepared.
24. As a Usuário, I want F3 to start a clean inclusion, so that no edit or prepared state survives.
25. As a Usuário, I want F6 to delete the selected Product once, so that deletion is unambiguous.
26. As a Usuário, I want F9 and automatic search to preserve their intended scope, so that Product lookup remains productive.
27. As a Usuário, I want Escape/close to preserve modal changes, so that completed item work is not discarded.
28. As a Usuário, I want closing the modal to attempt the applicable Orçamento save and recalculation, so that totals remain consistent.
29. As a Usuário, I want changes retained as pending when the Orçamento cannot yet be saved, so that missing prerequisites do not destroy work.
30. As a Usuário, I want a clear message when changes remain pending, so that I know a later Orçamento save is required.
31. As a seller, I want correct price, promotion and discount information, so that the item commercial conditions match Delphi rules.
32. As an authorized manager, I want sensitive price/discount changes to require the proper Permission or contextual Authorization, so that controls are not merely visual.
33. As a seller, I want current stock by the applicable Filial or deposit, so that availability information is trustworthy.
34. As a seller, I want similar Products and grades represented consistently, so that substitutions retain the correct quantity and identity.
35. As a stock manager, I want supplier and order information exposed only under the same conditions as the legacy behavior, so that sensitive operational data is controlled.
36. As a seller, I want montage and delivery fields validated, so that incomplete delivery data cannot be confirmed.
37. As a seller, I want applying delivery data to all eligible items to have predictable scope, so that unrelated lines are not changed.
38. As a seller, I want Product observations and photos available when applicable, so that relevant sales information is not lost in migration.
39. As a seller, I want seller assignment rules respected, so that a non-authorized user cannot change the responsible seller.
40. As a Usuário, I want quantity formatting to follow the configured mask, so that decimals are parsed and displayed consistently.
41. As a Usuário, I want invalid, zero or negative quantity rejected before mutation, so that every line remains valid.
42. As a Usuário, I want item totals and discounts recalculated from the effective quantity, so that commercial totals are correct.
43. As a Usuário, I want Product mutations to update Orçamento totals and plans once, so that duplicate recalculation requests do not race.
44. As a maintainer, I want a complete Delphi–Laravel information matrix, so that missing and divergent fields are intentional.
45. As a maintainer, I want shared Product rules isolated from Orçamento consequences, so that other document consumers do not regress.
46. As a maintainer, I want possible Delphi bugs classified rather than copied, so that legacy limitations do not become requirements.

## Implementation Decisions

- Introduce one explicit state machine/reducer for modal intent instead of deriving business meaning from displayed field residue and scattered refs.
- Distinguish at least clean inclusion, prepared quantity, loaded inclusion, explicit edit, submitting and post-save states.
- Treat quantity in explicit edit as the final absolute value.
- Treat a scan of an existing Product+Filial in inclusion flow as an increment: prepared quantity if armed, otherwise exactly 1.
- Treat a new Product as prepared quantity if armed; otherwise use the validated new-line default, normally 1 and respecting the existing default-quantity parameter where confirmed.
- Consume prepared quantity on the first Product resolution attempt that successfully identifies a Product. Clear it on new inclusion, close and mode-changing actions.
- Never derive a new Product quantity from the quantity displayed for the previously loaded Product.
- When another Product is scanned during explicit edit, abandon unconfirmed edit changes, leave the original line unchanged and start a clean inclusion for the scanned Product.
- Use Product+Filial as the equality key for automatic summation.
- Ignore keyboard auto-repeat for command shortcuts and establish a synchronous command latch before any asynchronous work begins.
- A successful command becomes consumed and cannot replay until a meaningful new input advances the state revision.
- Apply the same command gate to button clicks and keyboard shortcuts.
- Maintain at most one buffered scan during lookup/submission; define deterministic replacement/rejection behavior if more scans arrive and communicate it without silent data loss.
- Associate every asynchronous response with an operation/revision id and ignore stale results.
- After success, keep the saved line visible, clear armed quantity, focus/select Product code and wait for new input.
- Keep quantity parsing and formatting centralized under the system mask.
- Preserve the existing lookup and page contracts where possible, but make command intent explicit: edit/replace versus include/increment.
- Recompute the authoritative effective quantity on the server or shared application boundary; do not trust a client-provided operation mode without validation against Product+Filial and current lines.
- Keep common lookup, quantity, keyboard and presentation logic in the shared Sales Product modal; inject Orçamento-specific consequences, authorization and auxiliary capabilities through context.
- Build a Delphi–Laravel capability matrix for every field/tab and resolve each divergence before removing or adding behavior.
- Keep price/discount authorization server-authoritative and preserve contextual Authorization proof where required.
- Serialize Product mutations and downstream totals/plan recalculation; coalesce redundant recalculation requests.
- Closing with changes retains them and attempts the valid Orçamento persistence flow. If prerequisites prevent it, keep the main form dirty and explain the required next action.
- Do not copy layout limitations or suspected legacy bugs.

## Testing Decisions

- Use the Orçamento modal as the highest functional seam for the state machine: simulate user inputs and assert the resulting Product lines and visible state.
- Extend the existing quantity helper tests only for pure formatting/calculation rules; do not use helper tests as a substitute for modal behavior.
- Reuse Orçamento feature tests for server lookup, parameter, authorization and validation contracts.
- Cover one physical command producing at most one mutation, including repeated keydown events and rapid button/keyboard combinations.
- Cover the agreed transition matrix: edit replacement, same Product+Filial +1, prepared increment, prepared new line, different Product reset, different Filial line and post-save residue.
- Cover asynchronous sequencing with controllable delayed responses, stale responses, one buffered scan, error and retry.
- Cover closure with successful persistence and with pending changes due to missing prerequisites.
- Add thin regression tests for every other consumer of the shared modal, proving their context and legitimate behavior remain intact.
- Test fields and tabs through externally visible permissions, parameters and returned information, not component implementation details.
- Verify totals and plan recalculation by their resulting values and request count/order.

## Out of Scope

- Redesigning the entire Cadastro de Orçamentos.
- Migrating document-specific behavior for Contracts or other Sales documents.
- Reproducing Delphi layout or suspected bugs.
- Changing Product/Filial identity rules outside the modal.
- Implementing code in this analysis workspace.

## Further Notes

- CONFIRMADO: Delphi opens the same Product form for inclusion and editing, but prepares the dataset explicitly for the requested operation.
- CONFIRMADO: Delphi quantity is data-bound and `ConfirmarQuantidade` records deliberate quantity input before Product lookup.
- CONFIRMADO: Delphi uses default quantity and focus parameters, automatic lookup/save parameters, Filial independence, price/discount permissions and multiple auxiliary tabs.
- CONFIRMADO: Laravel already has a pure quantity helper with tests for +1, prepared quantity and default quantity.
- POSSÍVEL BUG ATUAL: Laravel F5 handler does not reject `event.repeat`; multiple keydown events can enter confirmation before React publishes `loading`.
- DIVERGENTE: Laravel merges edit, inclusion and automatic summation through one confirmation path, increasing the chance that stale mode/field state changes the operation meaning.
- DECISÃO NOVA: after a successful save, require a new functional input before another confirmation.
- DECISÃO NOVA: buffer at most one next scan during an active asynchronous operation.
