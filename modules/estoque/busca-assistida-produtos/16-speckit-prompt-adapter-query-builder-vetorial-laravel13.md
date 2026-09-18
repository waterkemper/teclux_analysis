# Prompt SpecKit - Avaliacao do adapter vetorial com Laravel 13.x

Produza uma especificacao executavel e um plano de implementacao para avaliar, e somente se os gates forem satisfeitos adotar, as primitives vetoriais nativas do Laravel 13.x no adapter da Busca Assistida. Esta entrega e um prompt para `speckit.specify`; nao implemente producao nesta etapa.

## Regra de investigacao

Inspecione o Laravel atual antes de propor alteracoes. Use como pontos de partida reais:

- `app/Infrastructure/Persistence/Ai/BuscaAssistida/VectorSearchRepository.php`;
- `app/Services/BuscaAssistida/HybridProductRetrievalService.php`;
- `app/Services/BuscaAssistida/BuscaAssistidaProductSearchEngine.php`;
- `app/Services/BuscaAssistida/BuscaAssistidaSearchExecutor.php`;
- `database/migrations_ai/*ba_embeddings*`;
- `config/database.php` e `config/busca_assistida.php`;
- ADRs 0001, 235, 390 e 393 e os prompts 09, 11, 12, 14 e 15 deste modulo.

Confirme os contratos reais e liste o que ja esta implementado. Nao invente classes, tabelas, conexoes, comandos ou resultados de banco. Se o container PHP 8.5 ou o PostgreSQL `ai` nao estiver disponivel, produza um gate bloqueado com o comando e a dependencia ausente; nao use a CLI local PHP 8.2 como evidencia de compatibilidade.

## Contexto e decisao ja tomada

O Laravel 13.x documenta `whereVectorSimilarTo`, `whereVectorDistanceLessThan`, `selectVectorDistance` e `orderByVectorDistance`, alem de semantic/hybrid no Scout. A Busca Assistida ja possui uma projecao `ai` separada, embeddings em `ba_embeddings`, joins para evidencia, recuperacao exata + lexical + vetorial, RRF, `candidate_cap`, hard filters e revalidacao no PostgreSQL legado.

O Query Builder nativo pode ser avaliado como implementacao interna do adapter vetorial. O Scout nao deve substituir o Executor, o RRF, o envelope, o PlanValidator ou a autoridade do legado. Nao adicionar `laravel/scout` sem demonstrar beneficio e compatibilidade; o pacote nao esta no `composer.json`/`composer.lock` atual.

## Objetivo

Definir um caminho seguro para comparar a consulta vetorial atual com uma implementacao baseada nas primitives nativas, preservando:

1. conexao `ai` e PostgreSQL moderno com `pgvector`;
2. dimensao configurada (atualmente 1536) e indice HNSW;
3. geracao ativa, `replaced_at`, `eligibility` e `blocked_admin`;
4. joins `ba_embeddings` -> `ba_document_parts` -> `ba_product_documents`;
5. evidencia literal, `product_codigo`, score e limite por lane;
6. score equivalente a `1 - distancia` e ordenacao deterministica;
7. fallback seguro quando pgvector/AI estiver indisponivel;
8. RRF, candidate cap e reranking existentes;
9. Produto Ativo, autorizacao, Filiais efetivas, preco contextual e estoque dinamico no Executor/revalidacao do legado;
10. diferencas de Consulta e Orcamentos, incluindo preco Cargo-aware na Base e estoque total exibido em Orcamentos.

## Escopo obrigatorio

### 1. Adapter vetorial

Defina a interface e o seam real para que `VectorSearchRepository` possa usar o Query Builder nativo sem expor SQL livre ao modelo. O adapter deve:

- receber apenas embedding validado, limite, geracao e limiar configurados pelo servidor;
- aplicar o limiar explicitamente, documentando `minSimilarity` e a conversao para distancia;
- evitar dimensao implicita, binding incorreto ou interpolacao de vetor;
- preservar score, evidencia, source kind e identificador do Produto;
- nunca consultar a base legada durante a recuperacao vetorial;
- manter o guard de driver antes de chamar APIs vetoriais;
- retornar lista vazia/resultado indisponivel conforme o contrato atual, sem mascarar falha operacional como ausencia de resultado.

### 2. Limites de dominio

Nao colocar no vetor, em `toSearchableArray` ou em filtros Scout:

- preco de Consulta ou preco Cargo/Cliente;
- `emestoque`, reserva, transito ou embalagem;
- Filial escolhida pelo modelo;
- permissao, Cliente, Cargo ou regra comercial.

Esses dados continuam sendo aplicados e revalidados pelo Executor. `baixo de 200` deve continuar vindo do plano estruturado e ser avaliado contra o preco efetivo do hospedeiro, sem alias adicional no parser.

### 3. Comparacao e rollout

Defina uma comparacao controlada entre o repository atual e o adapter nativo, sem trocar o ranking em producao. Cobrir:

- SQL gerado, bindings e distancia/score;
- dimensao 1536, HNSW e limite por lane;
- mesmo conjunto de IDs sob os mesmos fixtures;
- limiares calibrados e caso sem sobreposicao lexical;
- recall, ordem, empates e candidate cap contra RRF;
- Produto Ativo/elegibilidade, evidencia e joins;
- indisponibilidade de pgvector, provider, Redis e conexao `ai`;
- alteracao de preco/estoque entre recuperacao e resposta;
- Consulta e Orcamentos;
- custo, cache HMAC, privacidade e reconciliacao de mudancas indiretas.

O rollout deve ser por feature flag/geracao, reversivel para o repository atual, sem migration destrutiva, sem alterar o PostgreSQL legado e sem mudar o contrato HTTP/tool.

## Testes obrigatorios

Produza uma matriz de testes unitarios, integracao PostgreSQL/pgvector e contrato:

1. SQL e bindings do adapter nativo, sem SQL livre do usuario.
2. Score `1 - distance`, `minSimilarity`, ordem e limite.
3. Dimensao invalida e vetor vazio falham de modo seguro.
4. Joins e evidencia literal permanecem identicos.
5. Geracao inativa, parte substituida, Produto inelegivel e bloqueio administrativo nao aparecem.
6. Fallback sem pgvector nao chama a primitive nem altera a lupa tradicional.
7. RRF preserva a ordem quando o adapter e ativado; `hybrid()` do Scout nao e assumido como RRF.
8. Preco `lt 200`, estoque, Filial, autorizacao e Produto Ativo continuam hard filters/revalidacao fora do vetor.
9. Consulta usa preco/Filiais efetivos; Orcamentos usa preco Cargo-aware na Base e estoque total exibido.
10. Tool e HTTP continuam uma execucao, um envelope e o mesmo Executor.
11. Mudanca dinamica de preco/estoque entre retrieve e resposta remove o candidato inadequado.
12. Testes executam no container PHP 8.5 e PostgreSQL `ai` real; testes locais PHP 8.2 nao podem ser apresentados como verdes.

## Saida esperada do SpecKit

Entregue requisitos funcionais e nao funcionais, seam real, contrato de entrada/saida do adapter, SQL/indices esperados, estrategia de limiar, matriz de comparacao, fases tracer-bullet, feature flag/rollback, riscos, observabilidade, custo, privacidade e plano de rollout.

Nao implemente codigo nesta etapa. Nao adote Scout como substituto do pipeline. Nao altere ranking, embeddings, fotos, detalhe, estoque, preco, Filiais, permissoes, RRF, PlanValidator, Executor, tool ou contrato sem decisao posterior baseada nos gates.
