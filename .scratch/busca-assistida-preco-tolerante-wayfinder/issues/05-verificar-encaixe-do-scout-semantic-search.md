# Verificar encaixe do Laravel Scout Semantic Search no pipeline existente

Type: research
Status: resolved
Blocked by:

## Question

A atualizacao do Laravel Scout 13.x (`semantic()`/`hybrid()`, `minSimilarity` e suporte do engine `database` com PostgreSQL + `pgvector`) melhora a Busca Assistida existente ou cria conflito com a arquitetura ja decidida? Comparar as APIs oficiais com o pipeline atual de projecao `ai`, busca exata + lexical + vetorial, RRF, Produto Ativo, hard filters, preco/estoque dinamicos no PostgreSQL legado, evidencia, cache/custo e os dois hospedeiros. Decidir se o Scout deve ser adotado, usado apenas como adapter experimental, ou explicitamente descartado nesta evolucao; identificar mudancas necessarias no contrato, no rollout e nos testes sem implementar producao.

## Answer

### Resultado

O Scout semantic/hybrid e uma opcao de recuperacao, nao substituto do Executor ou da autoridade de dominio. A documentacao oficial do Laravel 13.x lista `database`, Meilisearch e Turbopuffer para busca semantica; `semantic(minSimilarity: ...)` aplica um limiar de similaridade e `hybrid(textWeight, semanticWeight)` combina texto e semantica, mas nao define equivalencia com o RRF ja adotado localmente. O pacote `laravel/scout` tambem nao esta presente no `composer.json`/`composer.lock` atual; hoje o projeto usa `laravel/ai` 0.10.3 e um repositorio vetorial proprio.

### Compatibilidade com o desenho local

- O engine `database` consulta diretamente a tabela/conexao do model e espera a coluna vetorial nessa projecao; ele nao oferece uma operacao distribuida que faca vetor na conexao `ai` e resolva preco/estoque/autorizacao na base legada antes do mesmo corte.
- `where` e comparadores podem filtrar colunas simples na mesma conexao, mas nao representam preco efetivo por Filial/Cargo/Cliente, estoque vivo, Filiais autorizadas ou capabilities. Esses valores continuam fora do embedding e devem ser aplicados/revalidados pelo Executor no legado.
- O retorno Scout e uma colecao de models, nao o envelope rico com evidencia por parte, preco autorizado, fotos, capabilities e regras distintas de Consulta/Orcamentos.
- O observer/index import do Scout nao detecta sozinho mudancas indiretas em Marca, Modelo, Grupo, Classe ou Caracteristica; a reconciliacao por hash/cursor continua necessaria.
- `minSimilarity` e gate vetorial, nao confianca do Interpreter, evidencia comercial nem autorizacao. Deve ser calibrado por engine/geracao e nao pode substituir Produto Ativo, hard filters ou revalidacao.

### Decisao recomendada

Manter o pipeline atual: Interpreter -> PlanValidator -> Executor, recuperacao exata + lexical + vetorial, RRF, pre-filtros, envelope compartilhado e revalidacao dinamica nos dois hospedeiros. Nao mover Restricao de Preco, estoque, Filial, permissoes ou preco para `toSearchableArray`/indice Scout.

E aceitavel avaliar em separado um adapter experimental que use as primitives do Laravel 13.x (`whereVectorSimilarTo`/`orderByVectorDistance`) dentro da conexao `ai` e devolva apenas candidatos ao Executor. A adocao so pode avancar apos comparar com o RRF atual, preservar candidate cap e evidencia, provar filtros antes do corte e testar `baixo de 200` com preco efetivo da Consulta e preco Cargo-aware de Orcamentos. O Query Builder nativo e uma melhoria de implementacao possivel, mas nao uma autorizacao para trocar o ranking ou o contrato.

### Riscos e criterios para proxima decisao

Antes de qualquer mudanca, medir recall/ranking/limiar contra o RRF, confirmar que o adapter nao faz cache incompativel com HMAC/privacidade, cobrir mudancas indiretas e backfill idempotente, e provar que alteracoes de preco/estoque entre recuperacao e resposta removem candidatos fora do filtro. Provider indisponivel deve continuar desabilitando apenas a Busca Assistida e oferecendo a lupa tradicional.

Pesquisa detalhada: [laravel-scout-semantic-hybrid-2026-08-31.md](../research/laravel-scout-semantic-hybrid-2026-08-31.md).
