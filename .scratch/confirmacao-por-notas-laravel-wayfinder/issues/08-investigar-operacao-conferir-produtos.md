# Investigar a operação Conferir Produtos

Type: research
Status: resolved
Blocked by:

## Question

Qual é o contrato funcional e técnico da chamada `ConferirProdutos` feita por Confirmação por Notas — entradas, tipo `NST`, interação, persistência, autorização, atalhos e efeitos sobre a confirmação — e qual seam Laravel existente ou futuro deve ser reutilizado sem reimplementar toda a Conferência de Produtos dentro desta página?

## Comments

## Answer

`NST` é conferência da nota de saída de transferência por `dadofiscal`. Persiste separadamente e não bloqueia `ConfirmaTransferencia`; `ROS`/`ROE` são outro mecanismo. Reutilizar `ConferenceEngine` com adapter `NST`. Evidências: [pesquisa-conferir-produtos.md](../../../modules/interlojas/confirmacao-por-notas/pesquisa-conferir-produtos.md).
