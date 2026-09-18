# Prototipar Query Builder vetorial no adapter da Busca Assistida

Type: prototype
Status: resolved
Blocked by:

## Question

Um prototipo isolado do `VectorSearchRepository` usando as primitives nativas do Laravel 13.x (`whereVectorSimilarTo`, `selectVectorDistance` e `orderByVectorDistance`) consegue preservar a projecao `ba_embeddings` na conexao `ai`, joins para evidencia/Produto, geracao ativa, limite por lane, score usado pelo RRF e fallback sem pgvector? Comparar SQL/resultados e riscos com a implementacao atual sem alterar producao. O prototipo deve deixar explicito o limiar semantico, a dimensao do vetor, a ordem deterministica e a compatibilidade com os hard filters/revalidacao no Executor.

## Answer

O prototipo descartavel [VectorSearchRepositoryPrototype.php](../prototype/VectorSearchRepositoryPrototype.php) gerou lado a lado o SQL atual e a forma equivalente com Query Builder nativo.

- Os joins `ba_embeddings` -> `ba_document_parts` -> `ba_product_documents`, geracao ativa, `replaced_at`, elegibilidade e bloqueio administrativo foram preservados.
- `score = 1 - distance` e `order by distance asc` mantem a mesma ordenacao; `limit` continua por lane antes do RRF.
- `minSimilarity` foi tratado como limiar vetorial explicito (`0.35` no prototipo, `maxDistance = 0.65`), separado de confianca, evidencia e autorizacao.
- Preco, estoque, Filial e permissao continuam no Executor/revalidacao do legado; nada foi movido para o vetor.
- O fallback sem pgvector precisa testar o driver antes de chamar `whereVectorSimilarTo`, pois a primitive exige suporte vetorial; o comportamento atual de retornar lista vazia pode ser preservado pelo adapter.
- O prototipo nao prova SQL executado, plano de indice, dimensao real nem recall. Tambem nao autoriza trocar o RRF pelo `hybrid()` do Scout.

Decisao: o Query Builder nativo e tecnicamente compativel como implementacao interna do adapter vetorial, condicionado a validacao PostgreSQL/pgvector no container PHP 8.5. Nao adotar Scout como substituto do Executor, do contrato ou do ranking.
