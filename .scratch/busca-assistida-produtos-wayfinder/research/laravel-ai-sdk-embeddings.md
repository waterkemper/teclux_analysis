# Laravel AI SDK e embeddings para a Busca Assistida de Produtos

Pesquisa realizada em 2026-07-16 contra fontes oficiais e o estado versionado do projeto. O pacote instalado é `laravel/ai v0.3.2`, commit `dfdf853427eb9fb8d763f8d9e2ed62cfcc03fb9c`, conforme `composer.lock`. A documentação oficial corrente acompanha uma versão mais nova; o código do commit instalado prevalece quando houver diferença.

## Resposta executiva

O SDK instalado atende a embeddings, transcrição, provider/modelo/dimensões, timeout, fila e fakes. Não oferece índice persistente por Produto, chunking automático, controle de custos, retry/backoff próprio nem reaproveitamento individual entre lotes diferentes.

O SDK deve ser gateway de geração, não índice. A aplicação deve persistir cada vetor por empresa, Produto, hash do Documento Semântico sanitizado, versão do normalizador, provider, modelo e dimensões. Só itens ausentes ou desatualizados serão enfileirados.

## Capacidades comprovadas no v0.3.2

- `Embeddings::for([...])->generate(provider, model)` aceita vários textos e `dimensions(n)` fixa a dimensão. O SDK envia o conjunto ao provider sem dividi-lo ou limitá-lo automaticamente. [Código oficial](https://github.com/laravel/ai/blob/dfdf853427eb9fb8d763f8d9e2ed62cfcc03fb9c/src/PendingResponses/PendingEmbeddingsGeneration.php)
- O projeto configura OpenAI e `text-embedding-3-small` como defaults. Os defaults de dimensão variam por provider; coluna vetorial é fixa, então trocar modelo/dimensão exige nova versão e backfill. [Service provider oficial](https://github.com/laravel/ai/blob/dfdf853427eb9fb8d763f8d9e2ed62cfcc03fb9c/src/AiServiceProvider.php)
- O cache global ou `.cache()` usa TTL padrão de 30 dias e chave com driver, modelo, dimensões e inputs agregados. No projeto está desabilitado e, no v0.3.2, sua granularidade é o lote completo. Não reaproveita isoladamente um Produto entre lotes diferentes. [Documentação oficial](https://laravel.com/docs/12.x/ai-sdk#caching-embeddings)
- `.queue()` despacha um job, mas não cria Laravel Batch, não fragmenta inputs e não define retry/backoff próprio. [Job oficial](https://github.com/laravel/ai/blob/dfdf853427eb9fb8d763f8d9e2ed62cfcc03fb9c/src/Jobs/GenerateEmbeddings.php)
- Embeddings e transcrição usam timeout padrão de 30 segundos e aceitam valor explícito. Timeout não é retry.
- Failover aceita providers/modelos alternativos, mas só avança com `FailoverableException`, como rate limit, sobrecarga e créditos insuficientes. Validação não aciona failover; timeout genérico não está comprovado como failoverable no v0.3.2. [Documentação](https://laravel.com/docs/12.x/ai-sdk#failover) e [contrato](https://github.com/laravel/ai/blob/dfdf853427eb9fb8d763f8d9e2ed62cfcc03fb9c/src/Exceptions/FailoverableException.php)
- `Transcription` aceita upload, caminho/storage, idioma, provider/modelo, timeout, fila, diarização e failover. O projeto já possui adapter e testes; o MVP deve reutilizá-los e descartar o áudio após STT. [Documentação](https://laravel.com/docs/12.x/ai-sdk#transcription-stt)
- `Embeddings::fake()` suporta respostas customizadas, assertions síncronas/enfileiradas e `preventStrayEmbeddings()`. [Testes de embeddings](https://laravel.com/docs/12.x/ai-sdk#embeddings-1) e [transcrição](https://laravel.com/docs/12.x/ai-sdk#transcriptions-1)

## O que o SDK não resolve

Não foi encontrado: chunking ou limite automático de lote/tokens; persistência; hash; isolamento por empresa; cota financeira; retry/backoff; recuperação parcial; ou fallback automático para SQL.

A documentação atual mostra `vector`, HNSW e `whereVectorSimilarTo`, mas isso depende também do Framework e PostgreSQL/pgvector. A extensão deve ser verificada antes da especificação. [Consulta vetorial oficial](https://laravel.com/docs/12.x/ai-sdk#querying-embeddings)

## Consequências

1. Manter `produtos.busca` e a lupa independentes de IA.
2. Índice semântico persistente por Produto/empresa e identidade `content_hash + normalizer_version + provider + model + dimensions`.
3. Provider/modelo/dimensão fixos por versão; mudança gera backfill versionado.
4. Catálogo em jobs pequenos e idempotentes, só com ausentes/alterados.
5. No máximo um embedding por consulta normalizada, reutilizado por hash e combinado à busca lexical e filtros.
6. Falha semântica nunca afeta a lupa tradicional.

## Fontes primárias

- [Laravel AI SDK, commit instalado](https://github.com/laravel/ai/tree/dfdf853427eb9fb8d763f8d9e2ed62cfcc03fb9c)
- [Documentação oficial](https://laravel.com/docs/12.x/ai-sdk)
- [`composer.lock` local](../../../laravel/backend/composer.lock)
- [`config/ai.php` local](../../../laravel/backend/config/ai.php)
