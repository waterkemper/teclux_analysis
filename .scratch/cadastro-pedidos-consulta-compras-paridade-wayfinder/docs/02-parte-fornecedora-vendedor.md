# Evidence - Parte Fornecedora and vendedor

## Delphi

- CONFIRMADO: fmconsultacompras.pas:519-522 configures fraConsultaFornecedor as a supplier search: TipoPesquisa=pesFORNECEDORES, TipoCliente='F' and Tipovfornecedor='F'.
- CONFIRMADO: fmconsultacompras.pas:1164-1175 derives ComFornecedor from whether the supplier code input is empty.
- CONFIRMADO: fmconsultacompras.pas:1225-1234 assigns the lookup code to qryPedidosfornecedor before the product loop and refreshes qryProcuraFornecedores by codigo. No second supplier is selected per product in this handoff.
- CONFIRMADO: dmcadastropedidos.pas:5012-5015 reports TipoFornecedor='F'; :2615-2628 loads supplier state/CRT and sets the product lookup UF from the selected supplier.
- CONFIRMADO: dmcadastropedidos.pas:3246-3248 filters product-supplier links by produto, fornecedor and tipofornecedor='F'. This establishes the legacy identity as code plus type F in supplier-product contexts.
- NAO LOCALIZADO: no separate sales vendedor is read by sbngerarPedidoClick. dmconsultacompras.pas declares vendedor/nomevendedor for a daily-sales detail query, but the F10 handler never transfers it to qryPedidosfornecedor.
- CONFIRMADO: when the input is empty, the handler still assigns qryPedidosfornecedor from the lookup dataset. The expected empty/null behavior of that dataset is not proven by these files and remains a legacy edge case.

## Laravel

- CONFIRMADO: Index.tsx:282-283 declares fornecedorPedido as useState<number|null>(null), without setter. Index.tsx:1370 passes it to buildGerarPedidoPayload; the current Consulta UI therefore sends null.
- CONFIRMADO: components/GerarPedidoFornecedorField.tsx implements an optional supplier lookup, but Index.tsx does not import or mount it. The intended UI seam exists but is disconnected.
- CONFIRMADO: ConsultaComprasGerarPedidoContratoService.php:36 and :91 pass the nullable integer fornecedor into GerarPedidoCompraContractBuilder; the contract retains only fornecedor, with no tipofornecedor field.
- CONFIRMADO: PedidoCompraHandoffService.php:40-68 pulls the contract once, starts a draft with supplier null, then assigns the contract fornecedor. PedidoCompraController.php:183-185 uses that value for supplier summary/contact payloads.
- CONFIRMADO: PedidoCompraGravarRequest.php:28 accepts nullable integer fornecedor. GravarPedidoCompraService.php:107, :194 and :289-291 carries the header value to persistence; LegacyPedidoCompraRepository.php:26 writes pedidos.fornecedor and :101-111 supports later updates.
- CONFIRMADO: PedidoCompraController.php:1068-1069 exposes a general fornecedores lookup for the Cadastro, intentionally without tipofornecimento=P; the same controller adds T only for transportadoras. Fornecedor lookup validation supports P/T/M/O, not the Delphi F marker.
- DIVERGENTE: the Delphi Consulta explicitly scopes its lookup to TipoCliente F and Tipovfornecedor F, while the Laravel handoff has no type field and the Consulta UI sends no code at all. Whether the backend general lookup is the intended equivalent or a broader population must be decided.
- OPORTUNIDADE: the Laravel contract can preserve the selected supplier code through the existing session bridge and the later gravar request, but it cannot preserve a supplier type or prove the Delphi F identity if codes are polymorphic.

## Decision boundary

The only supplier value proven authoritative in Delphi F10 is the Consulta supplier lookup code, copied to the Pedido header before line inclusion. In Laravel, the final persisted value is exactly the header value supplied by Cadastro; through the current Consulta UI it is null. There is no evidence that Laravel applies a fallback supplier or selects a vendor per item. The corrective prompt must decide whether to wire the existing optional lookup and whether to enforce/represent type F, while keeping absent supplier behavior explicit. No production code was changed.
