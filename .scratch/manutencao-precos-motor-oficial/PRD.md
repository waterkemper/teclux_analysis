# Motor oficial e casos dourados da Manutenção de Preços interna

Label: ready-for-agent
Status: ready-for-agent

## Problem Statement

Usuários do ERP precisam que a futura Manutenção de Preços interna no Laravel calcule exatamente os mesmos preços comerciais válidos que o Delphi e as funções oficiais do PostgreSQL. Hoje o Laravel possui um repositório capaz de resolver preços normais, promocionais e por percentual, mas sua interface expõe detalhes legados, possui comportamento alternativo para testes e ainda não representa, em um único contrato estável, toda a precedência entre Produto, Característica de Produto, Faixa de Preço, Coluna de Preço, Filial, data, Cliente e Cargo.

Sem essa fundação, a consulta, a simulação e a gravação da Manutenção de Preços podem apresentar valores diferentes dos usados por Orçamentos, Contratos e futuro frente de caixa. Uma divergência de R$ 0,01 pode alterar totais, descontos, autorizações e decisões comerciais. Também existe o risco de tratar ausência de Valor de Preço como zero, confundir Faixa de Preço com Coluna de Preço ou transformar aproximações específicas de Marketplace e SQLite em regras oficiais.

É necessário estabilizar primeiro um motor oficial reutilizável e uma matriz de casos dourados comparada aos oráculos PostgreSQL/Delphi. Este recorte deve provar cálculo e explicação, sem construir a tela de manutenção, executar operações em lote ou persistir alterações.

## Solution

Criar um módulo profundo chamado Resolvedor de Preço Corrente, com uma interface principal em lote. O módulo receberá contextos comerciais normalizados contendo Produto, Filial, data de referência e, quando aplicável, Cliente, Cargo ou percentual comercial explicitamente resolvido. Ele devolverá para cada Produto o Preço Efetivo na Filial, os valores normal e promocional considerados, validade e Situação da promoção, origem do resultado, percentual aplicado e explicações suficientes para auditoria funcional e suporte.

O PostgreSQL continuará sendo a autoridade de produção. As funções estoques_preco, estoques_produtoempromocao e, quando necessário, formacaoprecovenda serão tratadas como oráculos, preservando suas fórmulas, precedências, múltiplos e arredondamentos comprovados. A implementação existente de resolução de preços será aprofundada atrás da nova interface, evitando que consumidores conheçam tabelas, funções ou fallbacks legados.

A matriz de casos dourados usará dados controlados e resultados capturados dos oráculos para exigir igualdade no centavo, mesma escolha entre normal e promocional, mesma validade, mesmo resultado por Cliente/Cargo e mesmo arredondamento. Ausência de preço será representada explicitamente como não configurado, nunca convertida silenciosamente em R$ 0,00.

## User Stories

1. As a Usuário de Estoque, I want the Laravel price engine to return the same commercial price as Delphi, so that migrated maintenance does not alter business outcomes.
2. As a Usuário de Vendas, I want the same Product and Filial context to produce the same price across maintenance and sales flows, so that prices are trustworthy.
3. As a support analyst, I want each resolved price to explain its origin, so that discrepancies can be diagnosed without reading SQL.
4. As a developer, I want one batch interface for resolving prices, so that callers do not duplicate precedence rules.
5. As a developer, I want callers to provide Produto, Filial and reference date explicitly, so that results are deterministic.
6. As a developer, I want optional Cliente and Cargo context represented distinctly, so that their precedence is not inferred ambiguously.
7. As a Usuário, I want a Produto to use the Faixa de Preço selected within its Característica de Produto, so that shared pricing remains consistent.
8. As a Usuário, I want Produtos sharing Característica de Produto and Faixa de Preço to resolve the same underlying Valores de Preço, so that shared configuration is honored.
9. As a Usuário, I want each Filial to use its configured normal and promotional Colunas de Preço, so that fiscal establishments can have different effective prices.
10. As a Usuário, I want a valid promotional value to take precedence over the normal value, so that active promotions are applied.
11. As a Usuário, I want an expired promotion to fall back to the normal value, so that obsolete promotional prices are not used.
12. As a Usuário, I want a promotion without a configured value to fall back to normal, so that incomplete configuration does not invent a price.
13. As a Usuário, I want a promotional value without required validity to follow the proven legacy rule, so that behavior remains compatible.
14. As a Usuário, I want promotion validity evaluated against server/reference date, so that workstation clocks do not change results.
15. As a Usuário, I want an expired promotional value to remain identifiable in the explanation, so that stored history is not mistaken for an active price.
16. As a Usuário, I want a missing normal and promotional value reported as preço não configurado, so that absence is not represented as zero.
17. As a Usuário, I want a persisted zero Value to follow the legacy absence/removal semantics, so that the engine does not sell at R$ 0,00.
18. As a Usuário, I want a Produto assigned to another Faixa de Preço to resolve from that new shared range, so that reassignment affects only the Produto selection.
19. As a Usuário, I want markup specific to a Cliente to be considered when enabled, so that customer-specific commercial conditions are honored.
20. As a Usuário, I want Desconto por Cargo to be applied for the applicable Produto and Cargo, so that role-based pricing matches Delphi.
21. As a Usuário, I want a Cliente Cargo without a Produto–Cargo record to follow the proven fallback, so that missing configuration is handled consistently.
22. As a Usuário, I want the configured default Cargo used when there is no Cliente, so that anonymous commercial contexts follow the Parâmetro do Sistema.
23. As a Usuário, I want Cliente conditions to take precedence over Cargo conditions where proven, so that only one unambiguous commercial rule is applied.
24. As a Usuário, I want normal/promotional selection to occur consistently with Cliente or Cargo adjustments, so that the final price matches the official function.
25. As a Usuário, I want exact configured multiples honored, so that price formation follows company policy.
26. As a Usuário, I want upward and downward rounding boundaries reproduced exactly, so that cent-level values match production.
27. As a Usuário, I want values near half-cent boundaries covered, so that floating-point behavior does not create intermittent differences.
28. As a developer, I want batch resolution to avoid one database query per Product, so that future integral grids remain viable.
29. As a developer, I want the result order and identity to map deterministically to requested Products, so that callers can reconcile results safely.
30. As a developer, I want duplicate Product contexts normalized without losing distinct Filial/Cliente/Cargo contexts, so that batching does not merge different prices.
31. As a developer, I want invalid Produto, Filial or date contexts rejected clearly, so that configuration errors are not disguised as missing prices.
32. As a developer, I want database failures distinguished from preço não configurado, so that operational incidents are not presented as business absence.
33. As a tester, I want golden cases captured from PostgreSQL/Delphi, so that paridade can be checked automatically.
34. As a tester, I want a difference of R$ 0,01 to fail a golden case, so that no monetary tolerance masks a regression.
35. As a tester, I want the chosen price origin and promotion status asserted in addition to the amount, so that equal totals cannot hide a wrong path.
36. As a tester, I want Cliente, Cargo, Filial, range, validity and rounding scenarios isolated and combined, so that precedence is fully exercised.
37. As a maintainer, I want the SQLite/local adapter treated only as a structural test adapter, so that its approximation never defines production truth.
38. As a maintainer, I want Marketplace calculation modules excluded, so that internal pricing does not inherit freight, commission, margin or publication rules.
39. As a developer of Orçamentos, I want to consume the same resolver for new searches, inclusions and server validation, so that current prices are consistent.
40. As a developer of Contratos, I want to consume the resolver for future new lines, so that the module does not recreate pricing rules.
41. As a developer of frente de caixa, I want a reusable batch resolver, so that future barcode lookups use the same official price.
42. As a business user, I want already persisted Orçamento and Contrato prices left unchanged, so that catalog changes do not rewrite commercial history.
43. As a support analyst, I want a stable diagnostic representation of inputs and output origin without sensitive credentials, so that a reported price can be reproduced.
44. As the business, I want this motor approved before the remaining maintenance specs start, so that UI and persistence are built over a verified foundation.

## Implementation Decisions

- Build one deep Resolvedor de Preço Corrente module as the primary seam for this spec.
- Its public interface resolves a list of normalized pricing contexts and returns one typed result per context. Single-item convenience calls may delegate to the batch interface but must not form a second behavioral seam.
- A pricing context includes stable request identity, Produto, Filial, reference date and optional commercial context. Cliente, Cargo and explicit percentage are distinct inputs; callers must not overload one field.
- The result includes configured normal value, configured promotional value, promotional validity, promotion status, Preço Efetivo na Filial before and after commercial adjustment, applied commercial source, applied percentage, rounding/multiple information, origin summary, explanatory messages and a configured/not-configured outcome.
- Use the domain terms Característica de Produto, Faixa de Preço, Coluna de Preço, Valor de Preço, Preço Efetivo na Filial and Desconto por Cargo. Physical legacy names remain encapsulated in adapters.
- Produto selects one Faixa de Preço within its Característica de Produto. The monetary Value is shared by Característica de Produto + Faixa de Preço + Coluna de Preço.
- Filial configures the normal and promotional roles of existing Colunas de Preço; it does not own independent Values.
- Resolve an eligible promotional Value before the normal Value. Promotion expiry does not delete or hide the stored promotional Value; it only prevents its use as the effective price.
- Preserve the proven rule for promotional values without validity. Do not invent a new perpetual-promotion rule if the PostgreSQL oracle does not apply it.
- Return preço não configurado when no eligible Value exists. Do not coerce absence, query failure or invalid context to numeric zero.
- Keep optional promotion campaign linkage separate from price validity. Campaign identity may be reported, but promotional eligibility derives from the official price resolution.
- Resolve Cliente and Desconto por Cargo according to the proven precedence. The persisted Produto + Cargo percentage is an input to calculation, not an independently stored price.
- Resolve default Cargo only through the applicable Parâmetro do Sistema when no Cliente context exists.
- Treat server/reference date as authoritative for validity.
- Preserve official calculation ordering, numeric precision, multiples and rounding. Monetary output must match the oracle at cent precision; internal intermediate precision must be sufficient to prevent early-rounding drift.
- PostgreSQL production functions remain the oracles. The module may call them in batches or replace internal mechanics only when contract-equivalence is proven by the golden suite.
- Reuse and deepen the existing legacy product price engine implementation behind the new module instead of layering a pass-through module over all of its public methods.
- Provide a PostgreSQL adapter for production and a local test adapter. The local adapter supports structural tests and controlled pure rules but is not evidence of parity.
- Distinguish business outcomes from technical failures. Invalid context is validation failure; missing configuration is a successful not-configured result; database/oracle failure is an operational error.
- Batch requests must avoid N+1 access for Product metadata, Filial columns, Values and official function evaluation.
- Preserve caller correlation and deterministic results when multiple contexts reference the same Produto with different Filiais, dates, Clientes or Cargos.
- Do not cache prices in this spec. Every resolution uses current authoritative data for the provided reference context.
- Do not publish events, enqueue jobs or invoke Marketplace.
- Consumers obtain current catalog prices on demand. The resolver never re-prices persisted Orçamento, Contrato, Venda or Documento Fiscal items.
- No schema change is required by this spec unless implementation proves a missing constraint essential to correctness. Any such discovery must return for specification rather than be inferred.
- This spec establishes the input/output contract and golden fixtures required by the subsequent specs; it does not expose the complete maintenance page.

## Testing Decisions

- The highest and primary test seam is the public batch interface of the Resolvedor de Preço Corrente. Tests assert observable inputs, outcomes, origin and errors rather than repository methods or SQL shape.
- Build a versioned golden-case fixture set with controlled legacy records and expected results obtained from the production-equivalent PostgreSQL functions and confirmed Delphi behavior.
- Require exact equality after official monetary rounding. A difference of R$ 0,01 fails; no percentage tolerance is allowed.
- Assert both amount and path: normal/promotional source, promotion status, validity, Cliente/Cargo source, applied percentage, multiple and rounding explanation.
- Cover normal valid price, active promotion, expired promotion, promotion without validity, promotional column without value, missing column, zero value, alternate Faixa de Preço, different Filial column mappings and unpriceable Product.
- Cover Cliente markup, Desconto por Cargo, missing Produto–Cargo record, configured default Cargo without Cliente and Cliente → Cargo → normal/promotional precedence.
- Cover exact multiple, upward/downward rounding and monetary boundary cases.
- Add combination cases where promotion, Cliente/Cargo and rounding interact; isolated tests alone are insufficient.
- Test same Produto across different Filiais, dates, Clientes and Cargos in one batch.
- Test duplicate and invalid contexts, deterministic correlation, missing configuration and database failure as distinct results.
- Add query-count or equivalent integration assertions proving batch behavior does not degrade into N+1 access.
- Run golden integration tests against PostgreSQL with the official functions. Local/SQLite tests verify interface shape and pure normalization only and must not be labeled parity tests.
- Use existing product price engine and Orçamento price-resolution feature tests as prior art, but move new behavioral confidence to the deep module interface.
- Add consumer contract tests proving Orçamento lookup/inclusion can use the resolver without changing existing persisted lines.
- Add contract fixtures reserved for future Contrato and frente de caixa consumers; their full module behavior remains outside this spec.
- Assert that resolving current price performs no writes, emits no jobs and invokes no Marketplace module.
- Freeze reference date/time in validity tests.
- Keep golden fixtures readable: each case names the business scenario, context, relevant persisted configuration, oracle result and expected explanation.
- All cases in the pricing subset of the approved golden matrix must pass before this spec is considered complete.

## Out of Scope

- Building the F6 filters, integral result, three synchronized grids, photos or export.
- Building local selection, direct editing, copying, percentage adjustment, clearing, recalculation, history, undo/redo or the F8 preview modal.
- Persisting Valores de Preço, Faixa de Preço assignments, Promotion links or Desconto por Cargo.
- Implementing the atomic F8 commit, sensitive authorization, optimistic concurrency, idempotency or audit header.
- Repricing existing Orçamentos, Contratos, Vendas, installments, reserves, commissions, cashback, freight or fiscal documents.
- Implementing the complete Cadastro de Contratos or frente de caixa.
- Changing the Cadastro of Colunas de Preço or creating/renaming/deleting columns.
- Reproducing Marketplace margin, freight, commission, rounding, account/link, export, recalculation or publication behavior.
- Treating SQLite approximation as the production pricing rule.
- Modifying Delphi or executing migrations, Composer, npm, builds, formatters or generators in the read-only sources.

## Further Notes

- This is the first of four incremental specs from the completed Manutenção de Preços wayfinding map and blocks the other three.
- After this contract stabilizes, the F6/query spec and the transactional foundation may proceed in parallel.
- The authoritative terminology comes from the ERP domain glossary. In particular, Faixa de Preço, Coluna de Preço and Valor de Preço are different concepts.
- Production parity is defined by PostgreSQL/Delphi behavior, not by code similarity. A replacement implementation is acceptable only when the same external contract and golden results are preserved.
- The 100% release criterion applies later to the complete 44-case rollout matrix. This spec owns the calculation subset and the consumer contract foundations.
- Marketplace remains a separate context and must not be imported by the internal resolver.
