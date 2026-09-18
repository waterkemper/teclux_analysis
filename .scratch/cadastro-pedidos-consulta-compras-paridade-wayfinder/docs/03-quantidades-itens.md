# Evidence - quantidades e conjunto de itens

## Delphi

- CONFIRMADO: fmconsultacompras.pas:1176-1185 opens the quantity modal; :1292-1298 maps indexes 0/1/2 to sugestao/sugestaominimo/sugestaomaximo.
- CONFIRMADO: fmconsultacompras.pas:1240-1271 loops only dtmConsultaCompras.qryComprasTotal. A line enters the order only when selecionado=True and sugestao<>0; the selected field is read dynamically and assigned with AsInteger.
- CONFIRMADO: dmconsultacompras.dfm declares suggestion fields as TFloatField and display format 0. dmcadastropedidos.pas:370 declares order quantity as TFloatField, but the F10 assignment uses AsInteger, so fractional values are truncated at this handoff.
- CONFIRMADO: dmcadastropedidos.pas:4762-4786 initializes a new line quantity to 0; the F10 handler assigns the chosen value before GravarProdutoPedidoCompra.
- CONFIRMADO: fmconsultacompras.pas:1301-1312 resolves value from detail price with ICMS, latest purchase, then average cost. This matches the already closed Laravel cost precedence at the contract level.
- NAO LOCALIZADO: the F10 loop does not iterate similar or grade member datasets; their products may be visible in other Delphi tabs but are not independently transferred by this handler.

## Laravel

- CONFIRMADO: buildGerarPedidoPayload.ts:22-33 concatenates produtos_total, similar members and grade members. :35-64 builds a Set<number>-based selection payload, indexes by Produto and keeps the first occurrence.
- CONFIRMADO: Index.tsx:642-653 selects rows per current subtab; :655-674 toggle-all stores only product codes. The same product across Filiais or tabs cannot have independent selection state.
- POSSIVEL BUG: buildGerarPedidoPayload.ts:39-45 and Index.tsx:748-759 can send the first row for a Produto even when another tab/Filial row was the one selected or has different suggestion quantities. The code does not aggregate or reject conflicting rows.
- POSSIVEL BUG: Index.tsx:680-714 patches a product with filial=null across every matching result row, while the selection identity remains only Produto. A product repeated by Filial can receive the same edited suggestion and then be reduced to the first row.
- CONFIRMADO: ConsultaComprasGerarPedidoContratoService.php:55-67 normalizes all three quantity strings. GerarPedidoCompraContractBuilder.php:81-94 excludes every item with sugestao zero before choosing the requested field; :88-93 chooses sugestao/minimo/maximo. This means selecting max/min does not admit a row whose base sugestao is zero.
- CONFIRMADO: the builder preserves QuantityDecimal text, and the handoff/controller preserve the string into Cadastro (PedidoCompraController.php:1078-1125). Cadastro/types.ts:646 and :708-715 carry the string again into gravar; no integer cast was found in this path.
- CONFIRMADO: current feature coverage asserts max quantity, filtering of base suggestion zero and single Filial routing, but does not cover fractional quantities, duplicated Produto across Filiais/tabs, similar/grade collisions or all-zero selected rows.

## Comparison and decision boundary

- DIVERGENTE: Delphi F10 source set is only qryComprasTotal and integer assignment; Laravel source set is all result tabs and decimal-string preservation. The base zero filter is aligned with the existing closed contract decision.
- DIVERGENTE: for a fractional suggestion, Delphi sends the integer conversion while Laravel sends the decimal value. This is a behavior difference, not only a transport-format difference.
- D?VIDA/POSSIVEL BUG: whether Laravel should intentionally include similar/grade members is not proven by the Delphi F10 handler. If it should, product-only identity is insufficient for repeated Produto+Filial or conflicting rows; if parity is the goal, the contract should be based on the same total-grid scope.
- SEM PROVA: no runtime fixture was found proving an actual duplicate/conflicting Produto across the three Laravel collections.

No production code was changed. The next classification ticket must choose the authoritative row key/scope and the desired fractional-quantity behavior before a corrective prompt is written.
