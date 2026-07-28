# Inventariar o Estorno e os manifestos financeiros atuais no Laravel

Type: research
Status: resolved

## Question

O que o Laravel atual já implementa para Estorno individual, Quitação em Lote, manifestos reversíveis e reconstrução de movimentos bancários compartilhados, e quais lacunas, divergências ou seams reutilizáveis existem para suportar o Estorno de Pagamento em Lote sem criar arquitetura paralela?

## Answer

O Laravel já possui Estorno individual transacional/idempotente por manifesto, manifestos por item correlacionados ao `batch_payment_id`, Quitação em Lote atômica com motor compartilhado e remoção bancária por evento exato. A reconstrução parcial de `SINGLE_CHECK` já remove o evento selecionado, recompõe o cabeçalho pela soma dos restantes e exclui o cabeçalho no último evento.

Faltam a orquestração de Estorno em Lote (preview, command, idempotência, envelope, UI e reconciliação), um núcleo reversível compartilhado entre individual/lote e testes PostgreSQL executáveis — o teste destinado a `NONE`/`SINGLE_CHECK` está apenas `markTestIncomplete`. Persistem divergências Cancel/Cancelled/Rebuild e uma ação sensível distinta da permissão funcional confirmada para quem quita também desquitar.

Pesquisa detalhada: [Baseline Laravel para Estorno de Pagamento em Lote](../../../modules/financeiro/contas-pagar/estorno-pagamento-em-lote/pesquisa-laravel-atual.md).
