# Modelar a transação de confirmação, concorrência e idempotência

Type: research
Status: resolved
Blocked by:

## Question

Qual é a sequência transacional completa de `ConfirmaTransferencia`: pré-condições, seleção total/parcial, locks de estoque, inclusão de dados fiscais/nota/produtos/movimentos/documentos/duplicatas, atualização de pedidos e romaneio, commit/rollback/desbloqueio, autoria e efeitos externos; e quais invariantes, locks, idempotência e recuperação o Laravel precisa explicitar?

## Comments

## Answer

Pesquisa concluída em [pesquisa-transacao-delphi.md](../../../modules/interlojas/confirmacao-por-notas/pesquisa-transacao-delphi.md).

Decisão: a implementação Laravel deve tratar cada nota como unidade transacional independente, revalidar elegibilidade sob locks determinísticos da origem, pedidos, estoques e romaneio, e tornar atômicos todos os lançamentos que residam no mesmo PostgreSQL. A identidade de confirmação deve ser protegida por unicidade de domínio baseada no dado fiscal referenciado/destino e complementada por idempotency key da requisição. Pedidos e estoques devem ser carregados e bloqueados em lote (`IN`, `ANY(array)` ou `unnest`/`VALUES`), sem N+1. Se os efeitos de romaneio não puderem participar da transação, devem usar outbox e reconciliação idempotente. Autoria deve distinguir solicitante de autorizador.

O legado não oferece confirmação parcial de itens; “CONFIRMADA PARCIAL” é estado derivado do romaneio. Também foram registrados riscos que não devem ser copiados: lock apenas de estoque, commits separados de ROS/ROE/situação, ausência de guarda idempotente/rollback explícito, item sem estoque ignorado silenciosamente, acumulador ambíguo de pedidos e resultado do lote sobrescrito por nota.
