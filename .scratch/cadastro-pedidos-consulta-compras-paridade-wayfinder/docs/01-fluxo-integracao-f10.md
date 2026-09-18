# Evidence - F10 Consulta de Compras to Cadastro de Pedido

## Delphi

The requested dmconsultapras.pas was not found. The matching source is delphi/apps/estoque/dmconsultacompras.pas/.dfm; the handler is fmconsultacompras.pas and the order module is dmcadastropedidos.pas/.dfm.

In fmconsultacompras.pas:1164-1290, sbngerarPedidoClick validates selected rows, reads the Parte Fornecedora from fraConsultaFornecedor, opens/reuses frmCadastroPedidos and calls IncluirPedido. It sets Filial de Faturamento to dtmConsultaCompras.Filial when exactly one Filial is marked, otherwise FilialBase; it transfers qryPedidosfornecedor from the lookup.

The handler then loops over qryComprasTotal, accepting only selecionado=True and sugestao<>0. It calls IncluirProdutoPedido(False), resolves the Produto by produtovisual, calls DefinirValorProduto, writes the selected field (sugestao, sugestaominimo or sugestaomaximo) through AsInteger, and calls GravarProdutoPedidoCompra. It finishes with CalcularImpostos(True,True). dmconsultacompras.pas:2117-2155 confirms the single-Filial/FilialBase state; dmconsultacompras.dfm:2081+ confirms qryDetalhesCompra is master-linked by Produto.

dmcadastropedidos.pas:2213-2228 creates the header, :2263-2305 creates product lines, and :4686-4752 saves lines. IncluirPedido does not choose supplier or invoice Filial itself; F10 assigns them before saving.

## Laravel

Index.tsx:281-283 declares fornecedorPedido as useState<number|null>(null), with no setter or mounted supplier field. GerarPedidoFornecedorField.tsx exists but is not imported by Index.tsx. The current UI therefore sends fornecedor=null.

buildGerarPedidoPayload.ts collects produtos_total, similar products and grade members from all tabs. buildGerarPedidoSelecionados indexes by produto and keeps the first duplicate. Index.tsx:1357-1408 posts to route estoque.consulta-compras.gerar_pedido_contrato (routes/web.php:1839), whose controller calls ConsultaComprasGerarPedidoContratoService::montar.

The request allows three quantity fields. The service normalizes rows and Filiais, resolves invoice Filial, and when values are absent makes one batch loadDetalhes call for Produto+Filial pairs. GerarPedidoCompraContractBuilder chooses the selected quantity, still filters sugestao==0, and resolves value as preco com ICMS, latest purchase, then average cost.

The contract is stored by PedidoCompraHandoffService in session key pedido_compra_contrato_v1. PedidoCompraController.php:139-205 consumes it once when Cadastro opens; the draft has no persisted number and is saved later by gravar. PedidoCompraIncluirService defaults all Filiais to the session/base Filial and supplier to null; the handoff replaces supplier from the contract and calculates taxes once.

## Findings for following tickets

- DIVERGENTE, ticket 02: Delphi transfers the selected Parte Fornecedora; current Laravel UI always sends null. Normative/default behavior remains open.
- DUVIDA, ticket 03: Delphi loops only qryComprasTotal; Laravel collects all tabs and globally deduplicates by Produto. Delphi uses AsInteger while Laravel transports decimal strings.
- CONFIRMADO, ticket 04: omitted values use one batch detail load, but all Cadastro queries and lazy loading remain to audit.
- OPORTUNIDADE, ticket 05: Laravel is a one-time session bridge; Delphi opens/reuses Cadastro and inserts in the same dataset context.
- CONFIRMADO: Consulta POST and Cadastro GET use separate module authorizations; the existing handoff test grants both.

The end-to-end chain is now located: Delphi Consulta -> selection -> qryComprasTotal -> Cadastro datasets; Laravel Consulta -> payload -> route/service -> contract -> session -> Cadastro -> later save. No correction was implemented.
