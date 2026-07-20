Type: research
Status: resolved
Blocked by:

## Answer

O projeto usa `laravel/ai v0.3.2`. O SDK suporta embeddings multi-input, provider/modelo/dimensões, timeout, fila, cache e fakes, além da transcrição já integrada. Porém, não fragmenta lotes, não persiste índice, não controla custos/retries e seu cache é por lote completo, não por Produto.

Decisão: usar o SDK como gateway. Persistir índice separado por empresa/Produto, identificado por hash do documento sanitizado, versão do normalizador, provider, modelo e dimensões; reprocessar apenas ausentes/alterados em jobs idempotentes. A lupa permanece independente.

Relatório: [Laravel AI SDK e embeddings](../research/laravel-ai-sdk-embeddings.md).

## Question

Quais capacidades e restrições atuais, comprovadas por documentação oficial e pelo pacote instalado, o Laravel AI SDK oferece para embeddings, transcrição, fakes/testes, escolha de provider/modelo, dimensões, lotes, timeouts e tratamento de falhas, e quais consequências isso traz para uma busca híbrida econômica?
