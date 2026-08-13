# Definir o mapeamento da transferência para a Fotografia Fiscal

Type: research
Status: resolved
Blocked by: 01, 02

## Question

Quais dados da Requisição, Transferência, Produto, Filial, lote, estoque, preço, impostos, transporte, cobrança, pagamentos, vencimentos, contratos e referências devem formar a Fotografia Fiscal da emissão, quais são resolvidos antes da selagem e quais dados atuais não podem ser consultados depois? Mapear origem, transformação, ausência e conflito para cada campo.

## Answer

Pesquisa concluída em [04-mapeamento-fotografia-fiscal-transferencia.md](../research/04-mapeamento-fotografia-fiscal-transferencia.md). A fotografia deve carregar IDs de origem, participantes, linhas, produto, unidade, quantidade, FilialEstoque, lote, estoque/reserva, preço, tributos, transporte, volumes, contrato, crédito, vencimentos e referências, todos resolvidos antes da selagem. Ausência ou conflito bloqueia; retry, DANFE e reconciliação não consultam cadastros atuais. A decisão foi incorporada em [especificacao.md](../../../modules/interlojas/transferencia-requisicao-emissao-fiscal/especificacao.md), DECISÃO-TRF-FISCAL-006 e REQ-TRF-FISCAL-006 a 010.
