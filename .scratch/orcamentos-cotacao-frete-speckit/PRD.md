# Cotação de Frete do Orçamento

Status: ready-for-agent
Label: ready-for-agent

## Problem Statement

O Cadastro de Orçamentos Laravel já mantém valor e dados descritivos de frete, mas não implementa a Cotação de Frete disponível no Delphi. Hoje o Usuário precisa informar esses dados sem consultar, comparar e aplicar as opções retornadas pela API de Cotação de Frete mantida no site de cada cliente.

No Delphi, a integração foi construída sobre o contrato Frenet, mas a URL configurada pode apontar para uma API do próprio cliente, capaz de consultar Frenet, transportadoras diretamente e regras próprias. O Laravel não deve reproduzir essas estratégias: deve enviar os dados autoritativos e consumir o mesmo formato de resposta esperado pelo Delphi.

A migração também precisa evitar cotações aplicadas a um Orçamento que mudou, proteger URL e credencial, validar o vínculo local com `tabela_frete` e registrar evidência da opção escolhida. A solução deve nascer reutilizável para futura integração no Cadastro de Contratos.

## Solution

Adicionar ao Orçamento uma modal compartilhada de Cotação de Frete. O backend resolve os Parâmetros do Sistema `URL FRENET` e `chave frenet`, determina CEPs, total e Produtos atuais, chama a API configurada e normaliza sua resposta no contrato Frenet.

A modal apresenta opções válidas na ordem da API e, separadamente, serviços indisponíveis com suas mensagens. O Usuário pode ordenar e comparar, sem seleção automática. Uma opção somente pode ser aplicada quando `CodigoServico + Transportador` encontra exatamente uma configuração local de frete.

A seleção atualiza o rascunho do Orçamento, recalcula seus efeitos financeiros e persiste com a gravação do documento. Uma fotografia auditável e uma assinatura dos dados cotados permitem detectar alterações, recusar respostas antigas e orientar Prosseguir, Refazer cotação ou Cancelar.

## User Stories

1. As a Usuário de Orçamentos, I want to request freight quotes, so that I can compare transport services before completing the proposal.
2. As a Usuário, I want the ERP to use the configured client API, so that each installation can orchestrate its own freight providers.
3. As an administrator, I want the API URL read from `URL FRENET`, so that it is configurable without code changes.
4. As an administrator, I want the API credential read from `chave frenet`, so that authentication remains centrally managed.
5. As a security administrator, I want URL and credential used only by the backend, so that secrets never reach the browser.
6. As a Usuário, I want the quote to use the Filial de origem, so that the shipment starts from the correct establishment.
7. As a Usuário, I want to see the effective origin and destination CEPs, so that I can verify the quoted route.
8. As a Usuário, I want delivery CEP preferred over the principal CEP, so that freight is quoted to the real destination.
9. As a Usuário, I want the principal CEP used when no delivery CEP exists, so that quoting remains possible.
10. As a Usuário, I want missing origin CEP explained before the call, so that I can correct the Filial data.
11. As a Usuário, I want missing destination CEP explained before the call, so that I can correct the Orçamento.
12. As a Usuário, I want quoting blocked when there are no Products, so that an invalid request is not sent.
13. As a Usuário, I want missing URL or credential reported safely, so that configuration can be corrected without exposing secrets.
14. As a logistics operator, I want every Product sent with SKU, quantity, weight and dimensions, so that the API can calculate accurately.
15. As a logistics operator, I want zero dimensions sent rather than guessed, so that provider-specific validation remains authoritative.
16. As a Usuário, I want the declared value based on the current Product total, so that insurance and service rules use the current proposal.
17. As a Usuário, I want valid services displayed in the API order, so that the provider's intended presentation is preserved.
18. As a Usuário, I want no service automatically selected, so that freight choice remains deliberate.
19. As a Usuário, I want to sort by value, term, transporter or service, so that I can compare according to the customer's priority.
20. As a Usuário, I want service value, term, transporter, description and message visible, so that selection is informed.
21. As a Usuário, I want unavailable services shown separately, so that I know why a provider did not quote.
22. As a Usuário, I want unavailable services non-selectable, so that an error cannot become document freight.
23. As a Usuário, I want one provider failure not to hide valid alternatives, so that partial API success remains useful.
24. As a Usuário, I want the selected service mapped to local freight configuration, so that the ERP obtains its Fornecedor and internal codes.
25. As a Usuário, I want selection blocked when no local match exists, so that unconfigured transporters are not persisted.
26. As a Usuário, I want selection blocked when multiple local matches exist, so that ambiguous configuration is corrected.
27. As a Usuário, I want `frete_transportadora` use the local Fornecedor name, so that document fields follow existing ERP semantics.
28. As a Usuário, I want applying a quote update the draft immediately, so that the chosen freight is visible before save.
29. As a Usuário, I want choosing another option replace the previous one, so that freight is never accumulated.
30. As a Usuário, I want totals and payment plans recalculated once, so that the Orçamento reflects the selected freight.
31. As a Usuário, I want the quote persisted with the Orçamento save, so that closing the modal alone does not create an isolated partial write.
32. As an auditor, I want the selected quote's snapshot recorded, so that its origin and applied values can be proven.
33. As an auditor, I want User and timestamp recorded, so that responsibility is traceable.
34. As an auditor, I want original and applied value/term recorded, so that local additions such as dispatch time remain explainable.
35. As a security administrator, I want the snapshot exclude URL and credentials, so that evidence does not leak secrets.
36. As a Usuário, I want a quote marked stale when origin, destination, total or Products change, so that old prices are not mistaken for current ones.
37. As a Usuário, I want an API response rejected when the Orçamento changed during the request, so that outdated data cannot be applied.
38. As a Usuário, I want to refazer a cotação with current data, so that its validity can be renewed.
39. As a Usuário, I want the save flow offer Prosseguir, Refazer cotação or Cancelar for stale freight, so that I control the exception.
40. As an auditor, I want Prosseguir preserve the stale indication, so that the system does not falsely certify validity.
41. As a read-only Usuário, I want to compare quotes, so that I can advise without changing the Orçamento.
42. As a read-only Usuário, I want selection disabled with explanation, so that I do not expect a write that cannot occur.
43. As an authorized Usuário, I want to apply a quote only while the Orçamento Situation is editable, so that workflow restrictions are respected.
44. As a Usuário, I want a timeout or invalid response explained and retryable, so that transient failures are recoverable.
45. As a Usuário, I want retry to be explicit, so that the system does not make invisible repeated external calls.
46. As a Usuário, I want the previous selected quote preserved after failure, so that a failed refresh does not erase work.
47. As a Usuário, I want duplicate requests blocked and late responses ignored, so that the modal remains consistent.
48. As a maintainer, I want one freight client and one modal, so that Contracts can reuse the capability later.
49. As a maintainer, I want document-specific financial effects supplied by an adapter, so that the shared core stays independent.
50. As a maintainer, I want all external behavior tested with fake HTTP, so that tests never depend on a client website.

## Implementation Decisions

- Build a shared Freight Quote application capability with Orçamento as its first context adapter.
- Resolve external URL and credential on the backend through current System Parameter infrastructure and the Filial de origem context.
- Treat `URL FRENET` as a legacy parameter name for the client's freight-quote API, not as proof that Frenet is the underlying provider.
- Keep the browser restricted to internal ERP endpoints; never return external URL or credential.
- Preserve the Frenet-compatible wire contract. Before implementation, document exact request property names, token transport and response envelope from the Delphi/library or a sanitized real fixture; do not invent a near-compatible contract.
- Use one authoritative origin CEP from the Filial de origem.
- Resolve destination CEP by delivery address first, then principal address.
- Rebuild the payload on the server from current Orçamento data rather than trusting Product dimensions or totals posted by the browser.
- Send SKU/Product, quantity, weight, height, width, length and diameter for each item and current Product total as declared value.
- Do not merge legacy local exemption/fixed-freight calculations into the result list; the client API now returns every option.
- Normalize valid and invalid services separately while preserving API order and all diagnostic fields.
- Resolve selection by exact `CodigoServico + Transportador` against active/applicable local freight configuration and require exactly one result.
- Obtain Fornecedor, local table code and dispatch-term adjustment from the matched configuration where the existing rule requires them.
- Store the local Fornecedor name in `frete_transportadora`; keep API transporter data in quote evidence.
- Apply selection to the draft and let Orçamento save persist it; no isolated modal persistence.
- Coalesce downstream totals/financing/plan recalculation so a selection produces one consistent result.
- Persist a quote snapshot and canonical fingerprint atomically with the Orçamento.
- Canonical fingerprint covers origin Filial/CEP, destination CEP, declared value and ordered normalized items including identity, relevant Filial, quantity, weight and dimensions.
- Return the fingerprint with quote results and verify it against current authoritative state before applying.
- Distinguish current, stale and stale-accepted quote states. Refazer is the only action that returns to current.
- Prosseguir on stale data records that the stale quote was consciously accepted; it does not overwrite the fingerprint with current data.
- Query permission follows Orçamento view access; apply permission follows update access and editable Situation.
- Use explicit timeout, safe response-size limit, strict JSON/schema validation, no invisible retries and manual retry.
- Protect configurable URL against unsafe destinations according to deployment policy, while supporting approved per-client hosts.
- Redact credentials, authorization headers, full sensitive payloads and external URLs where appropriate in logs.
- Use request/revision ids to discard late responses and prevent duplicate in-flight requests.
- Define a context contract for future Contracts integration: identity, authorization, Situation, origin/destination, declared value, items, field application, persistence and financial consequences.
- Do not modify the Contracts UI in this feature.

## Testing Decisions

- Use the internal freight-quote HTTP endpoint with fake external HTTP as the principal seam.
- Assert the outbound request contract, resolved parameters, headers, timeout and normalized response without testing private client methods.
- Use existing Orçamento feature tests as prior art for fields, persistence and totals.
- Use sanitized Frenet-compatible fixtures for success, partial failure, full error and invalid schema.
- Test parameter resolution by Filial and prove secrets do not appear in JSON or logs.
- Test server-authoritative payload against manipulated client input.
- Test zero dimensions are transmitted while missing required CEPs/Products block locally.
- Test zero, one and multiple local matches and the resulting selection behavior.
- Test fingerprint stability, every invalidating field, response staleness and the three save decisions.
- Test query versus apply authorization and non-editable Situations.
- Test timeout, retry, duplicate request and late-response behavior.
- Keep frontend tests focused on modal-only behavior: order, sorting, no auto-selection, valid/errors sections, read-only mode, selection, stale dialog and retry.
- Add a context contract test with a simulated second document rather than implementing Contracts.

## Out of Scope

- Integrating the Laravel Contracts screen in this delivery.
- Implementing freight calculation rules in Laravel or reading legacy exemptions to generate options.
- Modifying the client-hosted freight API or its internal provider integrations.
- Freight booking, collection, labels, tracking or cancellation.
- Replacing the legacy freight tables beyond what is required for quote evidence.
- Implementing changes in this analysis workspace.

## Further Notes

- CONFIRMADO: Delphi uses the same freight screen for Orçamentos and Contratos.
- CONFIRMADO: Delphi obtains URL and credential from `URL FRENET` and `chave frenet` and sends origin/destination CEPs, declared value and Product logistics data.
- CONFIRMADO: Delphi resolves API service/transporter to local `tabela_frete` before applying a Frenet-origin option.
- CONFIRMADO: Delphi writes freight value, Fornecedor, service, message, term and local codes and then copies the local Fornecedor name into the transporter field.
- CONFIRMADO: Delphi fingerprints total/destination and Product quantities/logistics fields to warn when freight inputs changed.
- CONFIRMADO: Laravel already loads and saves the legacy descriptive freight fields and Product logistics fields, but no quote integration was located.
- DIVERGENTE: Delphi also merges locally calculated freight options; the target API now returns all strategies, so Laravel must not repeat that merge.
- DECISÃO NOVA: persist a detailed quote snapshot and distinguish stale acceptance from a current quote.
