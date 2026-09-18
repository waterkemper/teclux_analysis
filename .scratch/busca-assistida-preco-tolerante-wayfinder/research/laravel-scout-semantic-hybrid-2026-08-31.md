# Laravel Scout semantic/hybrid search e a Busca Assistida

Data: 2026-08-31  
Escopo: extensão de investigação do mapa `busca-assistida-preco-tolerante-wayfinder`.

## Conclusão curta

1. O Scout atual (documentação do Laravel 13.x; pacote `laravel/scout` 11.x, cuja compatibilidade inclui Illuminate 13) adicionou uma API unificada para `semantic()` e `hybrid()`. Os engines documentados para semantic search são `database`, `meilisearch` e `turbopuffer`; `Algolia` e `Typesense` continuam engines Scout, mas não estão incluídos nessa promessa da API semantic/hybrid. A mudança foi registrada no changelog oficial do Scout 11.6.0.
2. A API é adequada para recuperar documentos por significado e aplicar filtros simples que já existam como campos indexados/colunas. Ela não transforma preço contextual, estoque vivo, autorização de Filial ou capabilities em filtros seguros automaticamente.
3. O ADR local mantém PostgreSQL legado 9.5 como autoridade e PostgreSQL moderno separado para projeções AI. O engine `database` do Scout consulta diretamente a tabela/conexão do model e espera a coluna vetorial nessa tabela; portanto, não é um encaixe direto para uma projeção vetorial em outro banco com joins/revalidação no legado.
4. Recomendação: manter o `Executor` e o contrato de domínio atuais. Se desejado, avaliar Scout como primitiva de recuperação semântica dentro de um adapter próprio, preservando pré-filtro/revalidação no legado, escopo efetivo de Filiais e a projeção rica do host. Não substituir o pipeline híbrido/RRF nem mover `Restrição de Preço` para `toSearchableArray`.

Fontes principais: [Scout 13.x — Semantic Search](https://laravel.com/framework/docs/13.x/scout#semantic-search), [Scout 13.x — Database / Collection Engines](https://laravel.com/framework/docs/13.x/scout#database-collection-engines), [Scout 13.x — Where Clauses](https://laravel.com/framework/docs/13.x/scout#where-clauses), [Scout source `Builder`](https://github.com/laravel/scout/blob/11.x/src/Builder.php), [Scout source `DatabaseEngine`](https://github.com/laravel/scout/blob/11.x/src/Engines/DatabaseEngine.php), [Scout source `MeilisearchEngine`](https://github.com/laravel/scout/blob/11.x/src/Engines/MeilisearchEngine.php), [Laravel AI SDK 13.x — Embeddings](https://laravel.com/framework/docs/13.x/ai-sdk#embeddings), [Laravel AI SDK 13.x — Querying Embeddings](https://laravel.com/framework/docs/13.x/ai-sdk#querying-embeddings).

## 1. Engines e requisitos

| Engine/API | O que a documentação oficial garante | Requisitos e ressalvas para este projeto |
|---|---|---|
| `database` | Semantic e hybrid quando o database engine usa PostgreSQL com `pgvector`; a busca textual continua usando a tabela do banco. | Coluna `vector` nullable, dimensão compatível, índice vetorial e índice full-text. O model e sua tabela precisam estar na conexão consultada pelo engine. A documentação Scout não apresenta o PostgreSQL legado 9.5 como compatível com esse caminho. |
| `meilisearch` | Semantic e hybrid via embedders e `model-settings`. | SDK Meilisearch, embedder configurado, dimensão, campos filterable e sincronização de settings. Valores numéricos precisam ser indexados com o tipo correto. O índice é remoto/eventualmente consistente. |
| `turbopuffer` | Full-text, semantic e hybrid; requer `model-settings`, schema e atributos pesquisáveis. | API key/região. Pode usar vetor gerado pelo Laravel AI SDK, vetor pré-computado ou embeddings nativos Turbopuffer. No modo nativo, o atributo-fonte precisa fazer parte de `toSearchableArray`, o que pode contrariar a política local de não enviar/persistir texto fora da projeção controlada. |
| `algolia`, `typesense`, `collection` | São engines Scout documentados; não aparecem na lista oficial de engines que suportam `semantic()`/`hybrid()`. | Não tratar semantic/hybrid como portável para eles sem uma verificação específica do driver. `collection` filtra em PHP e é indicado apenas para protótipo/dataset muito pequeno. |

O Scout documenta que, quando ele gera embeddings, semantic/hybrid dependem do pacote `laravel/ai`; a exceção documentada é Turbopuffer com embeddings nativos ou vetor de consulta pré-computado. O AI SDK lista OpenAI entre os providers de embeddings e mostra `text-embedding-3-small` com 1.536 dimensões, compatível com a decisão local inicial. [Scout 13.x — Semantic Search](https://laravel.com/framework/docs/13.x/scout#semantic-search), [Scout 13.x — driver prerequisites](https://laravel.com/framework/docs/13.x/scout#driver-prerequisites), [Laravel AI SDK 13.x — provider support](https://laravel.com/framework/docs/13.x/ai-sdk#provider-support), [Laravel AI SDK 13.x — embeddings](https://laravel.com/framework/docs/13.x/ai-sdk#embeddings), [Scout changelog 11.6.0](https://github.com/laravel/scout/blob/11.x/CHANGELOG.md).

Há uma nuance de versão/capability: o Laravel AI SDK 13.x diz que as APIs vetoriais do framework suportam PostgreSQL com `pgvector` e MariaDB 11.7+, e o código do framework aceita essas grammars. Porém, a seção semantic do Scout especifica PostgreSQL com `pgvector` para o database engine. Para o projeto, considerar PostgreSQL+pgvector como o caminho suportado pelo Scout até existir teste de integração explícito para MariaDB; isso também preserva o ADR existente.

## 2. Ciclo de vida do embedding

O `Searchable` registra um observer no model. Depois de `save`/`create`, o registro é sincronizado automaticamente; com `scout.queue=true`, a operação vai para o worker. `scout:import` e `scout:queue-import` servem para importar registros existentes. O model ainda pode controlar `shouldBeSearchable`, `searchIndexShouldBeUpdated`, `makeAllSearchableUsing` e o nome da coluna vetorial via `searchableEmbeddingColumn`. [Scout source `Searchable.php`](https://github.com/laravel/scout/blob/11.x/src/Searchable.php#L17-L35), [Scout source `Searchable.php` — sync/import hooks](https://github.com/laravel/scout/blob/11.x/src/Searchable.php#L61-L93), [Scout source `Searchable.php` — embedding column](https://github.com/laravel/scout/blob/11.x/src/Searchable.php#L354-L400), [Scout 13.x — indexing](https://laravel.com/framework/docs/13.x/scout#third-party-engine-indexing).

Para o `database` engine, o Scout exige que a coluna vetorial seja nullable porque armazena o embedding depois que o model foi persistido; o engine atualiza embeddings no `update()` e usa a tabela do model diretamente. Para Meilisearch, o engine chama `toSearchableEmbedding()` em lotes de até 100 registros. O método deve existir quando embeddings gerados estiverem configurados e pode retornar:

- texto-fonte não vazio, para o Scout chamar o Laravel AI SDK; ou
- array de floats pré-computado.

O método `searchableEmbeddingColumn()` permite trocar o nome padrão `embedding`. [Scout 13.x — database semantic setup](https://laravel.com/framework/docs/13.x/scout#database-collection-engines), [Scout source `DatabaseEngine`](https://github.com/laravel/scout/blob/11.x/src/Engines/DatabaseEngine.php#L29-L37), [Scout source `MeilisearchEngine` — lifecycle](https://github.com/laravel/scout/blob/11.x/src/Engines/MeilisearchEngine.php#L53-L145).

O observer não percebe, por si só, uma mudança indireta em Marca, Modelo, Grupo, Classe ou Característica quando o Produto não é salvo. Isso deixa intacta a decisão local de cursor/reconciliação periódica e invalidação por hash; Scout pode ser o mecanismo de sincronização de uma projeção, mas não elimina a necessidade de detectar mudanças relacionais.

O AI SDK permite embeddings em lote, dimensões e provider configuráveis, além de cache de embeddings. O cache oficial é baseado em provider, model, dimensões e conteúdo de entrada e tem duração padrão de 30 dias quando habilitado. Isso é útil para custo, mas não deve ser adotado sem adaptação: a política local exige chave HMAC e não persistir texto bruto da consulta. [Laravel AI SDK 13.x — embeddings](https://laravel.com/framework/docs/13.x/ai-sdk#embeddings), [Laravel AI SDK 13.x — caching embeddings](https://laravel.com/framework/docs/13.x/ai-sdk#caching-embeddings).

## 3. `semantic()`, `hybrid()` e `minSimilarity`

O builder Scout mantém três peças separadas:

- `semantic($minSimilarity = null)` ativa busca semântica;
- `hybrid($textWeight = 1, $semanticWeight = 1, $minSimilarity = null)` ativa a combinação e exige pesos positivos;
- o builder rejeita consulta vazia para semantic/hybrid.

O código e a documentação tratam os dois pesos como pesos relativos das listas textual e semântica. A documentação não define que a combinação seja Reciprocal Rank Fusion. Portanto, o `hybrid()` do Scout não deve ser considerado semanticamente equivalente ao RRF já decidido localmente sem medir ranking, empates, candidate cap e recall. [Scout source `Builder.php` — semantic/hybrid](https://github.com/laravel/scout/blob/11.x/src/Builder.php#L301-L345), [Scout 13.x — semantic/hybrid](https://laravel.com/framework/docs/13.x/scout#semantic-search).

`minSimilarity` é engine-dependent. Na API de Query Builder vetorial do Laravel, a semelhança é cosine similarity entre `0.0` e `1.0`; a implementação converte o limiar em distância máxima `1 - minSimilarity`, aplica `<=` e ordena por distância. A API direta `whereVectorSimilarTo` tem default documentado de `0.6`. Isso é um limiar vetorial real, não uma confiança do Interpreter nem um critério de evidência comercial. [Laravel AI SDK 13.x — Querying Embeddings](https://laravel.com/framework/docs/13.x/ai-sdk#querying-embeddings), [framework source `whereVectorSimilarTo`](https://github.com/laravel/framework/blob/13.x/src/Illuminate/Database/Query/Builder.php#L1125-L1176).

No Meilisearch, o source do driver traduz o valor para `rankingScoreThreshold`. O mesmo driver calcula `semanticRatio` no hybrid como `semanticWeight / (textWeight + semanticWeight)`. Assim, um número com o mesmo nome não necessariamente tem a mesma semântica entre database e Meilisearch; deve haver calibração por engine e geração. [MeilisearchEngine source — search parameters](https://github.com/laravel/scout/blob/11.x/src/Engines/MeilisearchEngine.php#L172-L235).

Implicação para a Busca Assistida: usar `minSimilarity` como gate de recuperação/abstenção, nunca como substituto de Produto Ativo, autorização, evidência literal, preço ou estoque. A geração deve registrar engine, model, dimensão, normalizer e limiar para que a avaliação seja reproduzível.

## 4. `where`, comparações e hard filters

O builder Scout aceita `where(field, value)` e `where(field, operator, value)`, com `=`, `!=`, `<`, `>`, `>=`, `<=`, além de `whereIn` e `whereNotIn`. A documentação chama esses filtros de simples. [Scout 13.x — Where Clauses](https://laravel.com/framework/docs/13.x/scout#where-clauses).

No database engine, os `wheres` são convertidos em `where`/`whereIn` do Eloquent e entram na consulta que recebe as restrições textuais/vetoriais; o `take(limit)` é aplicado depois das restrições adicionais. Portanto, para uma coluna física simples na mesma conexão, o filtro é server-side e pode ocorrer antes do limite. O source também oferece `newScoutQuery` para customizar a query-base. [DatabaseEngine source — query construction](https://github.com/laravel/scout/blob/11.x/src/Engines/DatabaseEngine.php#L195-L237), [DatabaseEngine source — additional constraints](https://github.com/laravel/scout/blob/11.x/src/Engines/DatabaseEngine.php#L329-L356).

No Meilisearch, os filtros são serializados para a linguagem de filtros do serviço. Os campos precisam ser declarados como `filterableAttributes`, e comparações numéricas exigem valor indexado como número. O driver não executa SQL, join, resolver de preço ou closure de domínio no filtro remoto. [Scout 13.x — Meilisearch filterable attributes](https://laravel.com/framework/docs/13.x/scout#configuring-filterable-data-for-meilisearch), [Scout 13.x — Meilisearch searchable data types](https://laravel.com/framework/docs/13.x/scout#searchable-data-types), [MeilisearchEngine source — filters](https://github.com/laravel/scout/blob/11.x/src/Engines/MeilisearchEngine.php#L274-L316).

Há duas fronteiras que não devem ser confundidas:

1. `where()` do Scout é uma restrição do engine e pode participar da recuperação quando o engine a suporta.
2. `query()`/`queryScoutModelsByIds()` customiza a consulta Eloquent usada depois que IDs foram obtidos. Usá-la para excluir resultados após o engine/candidate cap não garante recall nem hard filter antes do corte. No database engine, um callback de busca também toma precedência sobre a aplicação automática dos `wheres` do builder; isso precisa ser coberto por teste se o adapter usar callbacks. [Scout source `Searchable.php` — query by IDs](https://github.com/laravel/scout/blob/11.x/src/Searchable.php#L284-L317), [DatabaseEngine source — callback precedence](https://github.com/laravel/scout/blob/11.x/src/Engines/DatabaseEngine.php#L329-L356).

## 5. Preço dinâmico, estoque e os dois hosts

### Pode preservar hard filters server-side?

Parcialmente. Pode preservar filtros estáticos que sejam colunas autorizadas na mesma query/projeção — por exemplo, um status de elegibilidade materializado — desde que o adapter construa os campos e valores no servidor e o engine seja compatível. Não pode, sozinho, preservar o contrato inteiro da Busca Assistida:

- `Produto Ativo` e bloqueio são autoridade do legado e precisam ser rechecados, mesmo se uma flag for indexada;
- Filiais autorizadas dependem do contexto da requisição e não podem ser escolhidas pelo model nem inferidas do índice;
- preço em Consulta depende da Filial efetiva e, em Orçamentos, de Filial Base + Cliente/Cargo + markup;
- `emestoque` muda no legado e tem semântica diferente por host: Consulta usa o escopo efetivo; Orçamentos apresenta soma de todas as Filiais e inclui somente pela Base.

Indexar preço/estoque para usar `where('price', '<', 200)` ou `where('emestoque', '>', 0)` introduziria valores possivelmente obsoletos e não representaria todas as combinações de Filial/Cargo/Cliente. No Meilisearch ainda seria necessário tornar os campos filterable e tipá-los numericamente, mas isso resolveria somente o tipo do dado, não sua atualidade nem seu contexto.

No database engine há uma incompatibilidade arquitetural adicional: a busca vetorial e os `where` são montados na conexão/tabela do model. O ADR local deliberadamente separa o PostgreSQL 9.5 legado da base moderna com pgvector; o Scout não oferece uma operação distribuída que faça vetor na base AI e resolva preço/estoque em outra base antes do mesmo `LIMIT`. [ADR 0001](../../../docs/adr/0001-separate-postgresql-pgvector-for-ai.md), [Scout 13.x — database engine searches tables directly](https://laravel.com/framework/docs/13.x/scout#database-collection-engines), [Scout source `DatabaseEngine` — model query](https://github.com/laravel/scout/blob/11.x/src/Engines/DatabaseEngine.php#L221-L237).

### Fit com o desenho local

Os documentos locais já exigem exatamente a proteção que o Scout não fornece de forma contextual:

- [Busca Assistida base](../../../modules/estoque/busca-assistida-produtos/09-speckit-prompt.md): legado como autoridade, preço/estoque fora do embedding, recuperação exata + lexical + semântica, revalidação dinâmica e conexão AI isolada;
- [Restrição de Preço](../../../modules/estoque/busca-assistida-produtos/11-speckit-prompt.md): pré-check de preço antes da fusão/corte, sem colocar preço no embedding;
- [Executor operacional](../../../modules/estoque/busca-assistida-produtos/12-speckit-prompt-operacional-v2.md): hard filters antes do candidate cap e preço resolvido pelo adapter;
- [Hardening pós-implementação](../../../modules/estoque/busca-assistida-produtos/14-speckit-prompt-hardening-pos-implementacao.md): revalidação imediatamente antes da resposta, envelope rico e paridade Tool/HTTP;
- [Filial efetiva](../../../modules/estoque/busca-assistida-produtos/15-speckit-prompt-filial-efetiva-e-atributo-fail-closed.md): o mesmo escopo efetivo deve governar pré-filtro, preço, ordenação, revalidação e projeção;
- [Adapter de Orçamentos](../../../modules/vendas/orcamentos-busca-assistida/03-speckit-prompt-adapter-interpreter-ia.md): preço Cargo-aware na Base, estoque total exibido e inclusão somente na Base.

O Scout pode reduzir código de uma trilha semântica se a projeção AI for desenhada para isso, mas o resultado ainda deve passar pelo mapper/Executor local. Em especial, o retorno Scout é uma coleção de models; não é o envelope do host com evidência, preço autorizado, fotos, capabilities, disponibilidade e regras de inclusão.

## 6. Schema, índices e comandos

### Database + PostgreSQL/pgvector

O schema oficial usa `Schema::ensureVectorExtensionExists()`, coluna `vector` com a dimensão correta, índice vetorial/HNSW e full-text index nas colunas textuais. O guia Scout mostra a coluna vetorial nullable; o guia AI SDK mostra `AsVector` no model. No projeto, a migration teria de usar explicitamente a conexão AI do ADR; não deve ser aplicada ao legado 9.5. [Scout 13.x — database semantic setup](https://laravel.com/framework/docs/13.x/scout#database-collection-engines), [Laravel AI SDK 13.x — vector storage/indexing](https://laravel.com/framework/docs/13.x/ai-sdk#querying-embeddings), [framework source `vectorIndex`](https://github.com/laravel/framework/blob/13.x/src/Illuminate/Database/Schema/Blueprint.php#L657-L668).

Não há `scout:sync-index-settings` para criar o HNSW do database engine: isso é migration/schema normal. A documentação diz que o database engine consulta as tabelas diretamente e não requer gerenciamento manual de índice Scout. Para preencher embeddings de registros existentes, `scout:import Model` ou `scout:queue-import Model --chunk=...` pode ser usado como mecanismo de backfill do model, mas a política local ainda exige dry-run, hashes, locks, orçamento e reconciliação próprios.

### Meilisearch

O fluxo oficial é:

1. configurar `filterableAttributes`/`sortableAttributes` e o embedder `source=userProvided` com dimensão;
2. configurar `model-settings[Model].embedding` com embedder e dimensão;
3. executar `php artisan scout:sync-index-settings`;
4. importar ou reimportar registros com `scout:import`/`scout:queue-import` para materializar os vetores.

Alteração do `toSearchableEmbedding`, dimensão ou schema deve ser tratada como mudança de geração e rollout; não como alteração transparente em produção. [Scout 13.x — Meilisearch settings and semantic/hybrid](https://laravel.com/framework/docs/13.x/scout#meilisearch), [Scout 13.x — batch import](https://laravel.com/framework/docs/13.x/scout#batch-import), [Scout source `MeilisearchEngine` — embedding generation](https://github.com/laravel/scout/blob/11.x/src/Engines/MeilisearchEngine.php#L98-L145).

### Turbopuffer

O schema e os `searchable-attributes` ficam em `config/scout.php` dentro de `turbopuffer.model-settings`, com o vetor e dimensão quando embeddings são fornecidos. Embeddings nativos usam `embedding.driver=turbopuffer` e uma configuração `embed` no atributo-fonte; esse atributo precisa aparecer em `toSearchableArray`. A documentação Scout consultada não especifica, nessa seção, um comando separado de sync de schema equivalente ao `scout:sync-index-settings` do Meilisearch. `scout:import`/`scout:queue-import` continuam sendo os comandos de carga de registros. [Scout 13.x — Turbopuffer configuration](https://laravel.com/framework/docs/13.x/scout#turbopuffer), [Scout 13.x — Turbopuffer embeddings](https://laravel.com/framework/docs/13.x/scout#turbopuffer), [Scout 13.x — indexing commands](https://laravel.com/framework/docs/13.x/scout#third-party-engine-indexing).

## 7. Decisão sugerida para a próxima etapa

Sem alterar o mapa ou issues, o resultado desta investigação sugere registrar a seguinte decisão quando o Wayfinder reabrir a fronteira:

> Scout semantic/hybrid é uma opção de infraestrutura de recuperação, não a autoridade da Busca Assistida. Avaliar somente um adapter que produza candidatos semânticos na projeção AI; manter exato/lexical, RRF, pré-filtros, preço contextual, estoque, autorização, evidência, revalidação e fallback no Executor compartilhado.

Critérios mínimos antes de qualquer adoção:

- provar que a projeção vetorial está na mesma conexão usada pela operação ou definir explicitamente a passagem segura de IDs autorizados entre AI e legado;
- medir `semantic()`/`hybrid()` contra o RRF local, incluindo `minSimilarity`, candidate cap e consulta semântica sem sobreposição lexical;
- provar que Produto Ativo e Filiais são filtrados antes do corte e novamente antes da resposta;
- provar `baixo de 200` no preço efetivo da Consulta e no preço Cargo-aware de Orçamentos, sem indexar preço;
- provar atualização de estoque/preço entre recuperação e resposta;
- substituir o cache padrão baseado em conteúdo por política compatível com HMAC/privacidade, ou desabilitar esse caminho;
- cobrir mudanças indiretas de dados comerciais, backfill idempotente, rollback de geração e indisponibilidade do provider.

