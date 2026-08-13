# Definir os efeitos de destino, financeiro e crédito da nota de transferência

Type: grilling
Status: resolved
Blocked by: 01, 02, 03, 04

## Question

Após a NF-e de saída autorizada, quais efeitos devem ocorrer na Filial Requisitada e na Filial Requisitante: entrada fiscal, estoque, financeiro, vencimentos, contratos, crédito entre filiais, duplicatas, custo, preço e vínculo com o Romaneio? Decidir o que é efeito fiscal, projeção legada, compensação ou fora do escopo, sem duplicar efeitos quando a emissão for reconciliada.

## Answer

Após autorização aplica-se somente uma projeção de recebimento idempotente vinculada à Emissão e ao grupo. Ela não cria NF-e de entrada, manifestação, notaspag ou duplicata. Reserva, movimento e confirmação operacional seguem o mapa original, com estado fiscal separado. VendaTransferencia pode manter contrato, crédito e venctosdadosfiscais quando a regra legada exigir; repetição nunca duplica efeitos. Decisão consolidada em [especificacao.md](../../../modules/interlojas/transferencia-requisicao-emissao-fiscal/especificacao.md), DECISÃO-TRF-FISCAL-005 e REQ-TRF-FISCAL-017 a 020.
