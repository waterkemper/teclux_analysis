# Impressão de Orçamentos em PDF

Status: ready-for-agent
Label: ready-for-agent

## Problem Statement

O Laravel já possui uma impressão individual simplificada do Orçamento em PDF, mas ela não reproduz todo o conteúdo e o comportamento do Delphi. A impressão atual abre diretamente em nova aba, não oferece opção de fotos, não imprime múltiplos Orçamentos, não aplica a validação de Qualidade da Venda e não solicita credenciais de Analista de Crédito quando exigido.

O Delphi também contém particularidades funcionais que não podem ser deduzidas apenas por imagens: observação padrão por Filial, situação dos Produtos condicionada por Parâmetro do Sistema, dados comerciais completos, autorização antes da impressão e impressão em lote dos Orçamentos marcados. O layout final será orientado por imagens no Cursor, mas conteúdo, segurança e cálculo precisam de especificação baseada em código.

## Solution

Evoluir a impressão Laravel para um fluxo único de preparação e geração de PDF, reutilizado pelo Cadastro e pela Consulta de Orçamentos. Ao imprimir, abrir um modal mínimo com a opção “Incluir fotos dos Produtos”, desmarcada por padrão. Quando marcada, incluir somente a foto principal de cada Produto.

Antes de gerar, recalcular a Qualidade da Venda e exigir credenciais de Analista de Crédito quando a configuração da qualidade e a divergência frente ao valor gravado determinarem isso. Aplicar a mesma regra na impressão individual e em lote. No lote, validar cada Orçamento, gerar um único PDF com os autorizados e apresentar resultado individual dos impedidos.

Gerar PDF por HTML/Browsershot usando um layout oficial, sem FastReport e sem arquivo FRF externo. Manter conteúdo, identidade visual, parâmetros, cálculos e dados autoritativos separados do template visual para que as imagens fornecidas no Cursor possam orientar o desenho sem duplicar regras.

## User Stories

1. As a Usuário do Cadastro de Orçamentos, I want to print a saved Orçamento, so that I can present the proposal to the Cliente.
2. As a Usuário, I want printing disabled while the Orçamento has unsaved changes, so that the PDF represents persisted data.
3. As a Usuário da Consulta, I want to mark multiple Orçamentos, so that I can print them together.
4. As a Usuário da Consulta, I want one PDF containing all authorized selected Orçamentos, so that batch handling is simple.
5. As a Usuário, I want a modal before generation, so that I can choose whether product photos are included.
6. As a Usuário, I want photos disabled by default, so that PDFs remain fast and compact unless requested.
7. As a Usuário, I want only the primary Product photo printed, so that each item has one predictable image.
8. As a Usuário, I want missing photos not to block printing, so that incomplete media does not prevent a proposal.
9. As a Usuário, I want image failures handled gracefully, so that one inaccessible image does not invalidate the PDF.
10. As a Usuário, I want the calculated Sales Quality checked before printing, so that commercial controls are respected.
11. As a Usuário, I want credentials requested only when the effective Sales Quality requires a Credit Analyst, so that unnecessary authentication is avoided.
12. As a Credit Analyst, I want my authorization validated, so that only an eligible user releases the print.
13. As an auditor, I want authorized Sales Quality and analyst persisted, so that the release remains traceable.
14. As a Usuário, I want invalid or canceled authorization to block that Orçamento, so that printing cannot bypass policy.
15. As a batch user, I want every selected Orçamento validated under the same rule, so that Consulta does not bypass Cadastro controls.
16. As a batch user, I want impediments listed per Orçamento, so that I know which proposals were omitted and why.
17. As a batch user, I want authorized Orçamentos still generated when others are impeded, so that one failure does not discard useful output.
18. As a Usuário, I want the selected count confirmed, so that accidental large batches are avoided.
19. As a Usuário, I want Products printed in their configured Orçamento order, so that the PDF matches the proposal.
20. As a Usuário, I want quantity, unit price, discounts and line totals printed, so that commercial values are understandable.
21. As a Usuário, I want Product visual code, description and grades printed, so that items are identifiable.
22. As a Usuário, I want Anvisa information included when applicable, so that regulated Products remain identified.
23. As a Usuário, I want Product complement printed according to its Cadastro rule, so that relevant specification is preserved.
24. As a Usuário, I want Product situation shown only when the system parameter enables it, so that company policy is respected.
25. As a Usuário, I want Services printed when present, so that the full proposal is represented.
26. As a Usuário, I want the selected payment Plan and installments printed, so that payment conditions are clear.
27. As a Usuário, I want freight, insurance, Product totals, Service totals and discounts printed, so that the final composition is transparent.
28. As a Usuário, I want issue date and validity printed, so that the proposal's temporal terms are clear.
29. As a Usuário, I want Cliente name, phones and address printed, so that the document identifies its recipient.
30. As a Usuário, I want vendedor printed, so that the commercial contact is identifiable.
31. As a Usuário, I want the effective Filial identity printed, so that the issuing establishment is clear.
32. As a Usuário, I want the Filial logo and contact data included, so that the PDF carries company identity.
33. As a Usuário, I want the Filial standard observation concatenated with the Orçamento observation, so that configured terms appear automatically.
34. As a Usuário, I want system parameters applied automatically, so that the modal does not expose technical configuration.
35. As a Usuário, I want a clear progress state while the PDF is generated, so that I do not submit repeatedly.
36. As a Usuário, I want generation errors explained without losing my selection, so that I can retry.
37. As a Usuário, I want the PDF opened inline in a new tab, so that I can review before printing or saving.
38. As a maintainer, I want one authoritative print payload, so that PDF, batch and email do not calculate values differently.
39. As a maintainer, I want business calculations outside the visual template, so that layout changes do not alter rules.
40. As a maintainer, I want the current PDF infrastructure reused, so that another report engine is not introduced.
41. As a maintainer, I want the official layout guided by supplied images, so that visual parity can be reviewed independently.
42. As a tester, I want PDF text and payload assertions, so that tests remain stable despite harmless visual adjustments.

## Implementation Decisions

- The Cursor/SpecKit execution environment must treat the consolidated Delphi evidence in the handoff as authoritative input and inspect only Laravel. Missing or ambiguous Delphi evidence becomes an explicit blocker returned to the analysis workspace; it must not be inferred from images, UI behavior or inaccessible source paths.

- Generate PDF with the existing HTML/Browsershot infrastructure; do not use FastReport or support external FRF templates.
- Provide one official layout. Images supplied in Cursor are visual references, not evidence for business rules.
- Open a print-options modal in both individual and batch flows.
- The only user-facing content option is `include Product photos`, default false.
- Use at most the first Product photo ordered by configured position.
- Keep `Visualizar Situação Produtos` and `Observação Padrão Orçamento` governed by system parameters, without modal overrides.
- Always include existing Products, Services, discounts, freight, insurance, selected Plan and installments when present.
- Build an authoritative print payload through an application service independent of Blade and email presentation.
- Reuse repositories and composition logic where correct, but do not force print and email to share the same visual template.
- Apply Sales Quality calculation and Credit Analyst authorization before individual and batch generation.
- Persist the effective Sales Quality and authorizing analyst when the Delphi rule requires a new authorization.
- Treat the authenticated operator, authorizing Credit Analyst and Orçamento vendedor as distinct roles.
- For batch print, validate each Orçamento and merge authorized PDFs into one document using existing PDF merge infrastructure.
- Return structured per-Orçamento outcomes for blocked, unauthorized, stale or failed records.
- Do not silently print blocked records or treat the Consulta route as an authorization bypass.
- Resolve standard observation by the Orçamento's effective Filial and verify whether all other identity data must follow that same Filial rather than session base.
- Treat missing/failed photos as non-fatal and apply bounded fetching, validation and size controls.
- Keep generation idempotent with respect to the Orçamento except for the intentional Sales Quality authorization persistence.

## Testing Decisions

- Primary seam: execute the real print command from Cadastro or Consulta, complete any required authorization, choose photo mode and receive the PDF plus per-Orçamento outcomes.
- Test external behavior rather than private query builders or Blade implementation details.
- Assert the authoritative payload and extracted PDF text for content/calculate parity; use a small number of visual/snapshot checks only for stable layout contracts.
- Cover individual printing with and without Credit Analyst requirement.
- Cover successful, denied, canceled and non-analyst credential validation.
- Cover persistence of Sales Quality/analyst and absence of unintended Orçamento mutations.
- Cover batch all-authorized, partially authorized, all-blocked and stale/concurrent records.
- Cover modal defaults, confirmation, cancel, loading, retry and duplicate click prevention.
- Cover photos disabled, primary photo selected, no photo, invalid URL, timeout and oversized/unsupported image.
- Cover system parameters for Product situation and standard observation by Filial.
- Cover Products, Services, selected Plan, installments, all discount forms, freight, insurance and totals.
- Cover empty optional sections, canceled/expired Orçamento and Orçamento without Products according to the final eligibility policy.
- Reuse existing Browsershot/PDF merger, sensitive-operation credential and Orçamento repository tests as prior art.

## Out of Scope

- Supporting FastReport or `frpOrcamento.frf`.
- Allowing arbitrary report templates per customer or Filial.
- Exposing system parameters as per-print modal choices.
- Adding modal options to hide Products, Services, values, Plans or other standard sections.
- Printing more than the primary photo for each Product.
- Editing Orçamento data from the print modal.
- Defining pixel-perfect layout without the images supplied in Cursor.
- Changing Delphi or implementing in this analysis workspace.

## Further Notes

- CONFIRMADO: Delphi Cadastro calls Sales Quality authorization before printing; Delphi Consulta batch does not, which is a divergence deliberately corrected.
- CONFIRMADO: Laravel already has individual PDF generation using a simplified Blade and Browsershot.
- DIVERGENTE: current Laravel PDF endpoint only checks view authorization and does not run Sales Quality/Credit Analyst validation.
- NÃO LOCALIZADO: Laravel batch Orçamento printing and dedicated printing tests.
- CONFIRMADO: Delphi Product query selects the first photo ordered by position using `SITE EMPRESA`.
- CONFIRMADO: Delphi concatenates Filial standard observation with the Orçamento observation.
- DECISÃO NOVA: batch printing applies the same authorization as individual printing and produces one PDF for authorized records with detailed impediments.
