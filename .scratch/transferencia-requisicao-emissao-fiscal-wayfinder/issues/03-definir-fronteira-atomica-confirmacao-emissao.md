# Definir a fronteira entre confirmação operacional e Emissão Fiscal

Type: grilling
Status: resolved
Blocked by: 01, 02

## Question

Como coordenar confirmação, estoque, reserva, movimentos, pedidos, lote/conferência e criação/alocação da Emissão Fiscal sem contradizer a persistência por grupo já observada no Delphi? Decidir transações, idempotência, falha antes/depois da numeração, Emissão Fiscal Pendente, retry, reconciliação e efeitos quando grupos anteriores já foram persistidos.

## Answer

Cada grupo possui transação curta própria: validar, selar fotografia, verificar idempotência, bloquear seriesfiliais, criar Emissão Pendente, outbox e número, e confirmar. Geração, assinatura, rede e artefatos ocorrem depois do commit. Falha antes do commit desfaz o grupo e o avanço; falha posterior mantém Pendente/Falha Operacional ou Reconciliação sem nova emissão. Grupos anteriores não são desfeitos, mas o grupo atual não é confirmado silenciosamente. Decisão consolidada em [especificacao.md](../../../modules/interlojas/transferencia-requisicao-emissao-fiscal/especificacao.md), DECISÃO-TRF-FISCAL-004.
