# Inventariar o fluxo F10 da Consulta de Compras até a Inclusão do Pedido de Compra

Type: research
Status: resolved

## Answer

Inventory completed in docs/01-fluxo-integracao-f10.md. The matching Delphi source is dmconsultacompras.pas/.dfm; the visual handler is fmconsultacompras.pas and the Cadastro module is dmcadastropedidos.pas/.dfm.

Delphi transfers Parte Fornecedora and Filial de Faturamento before iterating qryComprasTotal; it includes selected rows with sugestao<>0, chooses one of three quantity fields, resolves Produto/value and saves each line. Laravel posts to gerar-pedido-contrato, builds a contract, stores pedido_compra_contrato_v1 in session, consumes it once when Cadastro opens and saves later.

The inventory confirms fornecedorPedido remains null and the supplier component is not mounted in the Laravel Consulta. It also delimits the all-tabs/Produto-deduplication difference, Delphi AsInteger versus Laravel decimal quantities and the complete query/N+1 audit for later tickets. No correction was implemented.

## Question

Qual é o fluxo completo, no Delphi e no Laravel, desde a seleção de linhas na Consulta de Compras até a abertura e a Inclusão do Pedido de Compra? Mapear handlers, payloads, defaults, transformação de campos, endpoints/serviços, repositórios, componentes e testes; confirmar o arquivo correto da consulta (`dmconsultacompras.pas`, pois `dmconsultapras.pas` não foi localizado). Identificar o ponto exato onde cada discrepância de vendedor, filial, valor ou quantidade poderia ser introduzida, sem ainda decidir a correção.
