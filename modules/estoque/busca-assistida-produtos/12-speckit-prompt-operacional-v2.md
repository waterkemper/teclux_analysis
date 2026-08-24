# Prompt SpecKit - Busca Assistida Operacional v2 (nucleo reutilizavel)

Crie uma especificacao executavel e um plano de implementacao completos para evoluir a Busca Assistida de Produtos no Laravel existente. O nucleo deve ser reutilizavel por Consulta de Estoques e Orcamentos, com uma unica tool publica de leitura chamada buscar_produtos.

## Regra de investigacao

Inspecione o Laravel atual e use os seams ja existentes. Preserve os prompts anteriores deste modulo:
- 09-speckit-prompt.md: recuperacao hibrida, embeddings, pgvector, privacidade e infraestrutura.
- 10-speckit-prompt.md: painel, voz, multisselecao, detalhe comercial, sanitizacao e contrato visual.
- 11-speckit-prompt.md: Restricao de Preco.

Nao reabra decisoes ja fixadas nesses prompts. Nao investigue nem dependa de Delphi.

Confirme os contratos reais de BuscaAssistidaPanel, BuscaAssistidaTrigger, BuscaAssistidaSearchService, BuscaAssistidaSearchController, QueryNormalizer, HybridProductRetrievalService, revalidacao, autorizacao de fotos/detalhe, configuracao de IA e os dois hospedeiros.

## Objetivo

A Busca Assistida deve interpretar consultas de vendedores em linguagem natural e retornar apenas Produtos Ativos relevantes, com filtros explicitos de preco, estoque, filial e atributos comerciais evidenciados.

A funcionalidade e somente leitura. Ela nao altera estoque, reserva produto, altera preco, cria pedido ou inclui item em Orcamento. A busca tradicional continua disponivel como fallback.

## Contrato de interpretacao

Separe a consulta em:
- consulta_original, preservada apenas para correlacao minimizada;
- texto_busca, residual usado na recuperacao;
- filtros, sempre validados no servidor;
- confianca por campo;
- ordenacao fechada: relevancia, menor_preco, maior_emestoque.

Interpretacao deterministica, sem chamada de LLM: codigo, referencia, codigo visual, codigo de barras, preco, estoque, quantidade minima, filial e ordenacao.

Suporte minimo:
- abaixo de X: menor que X;
- ate X: menor ou igual a X;
- acima de X: maior que X;
- a partir de X: maior ou igual a X;
- entre X e Y: intervalo inclusivo;
- com estoque: emestoque > 0;
- pelo menos N: emestoque >= N.

Consultas abertas podem usar uma chamada estruturada para interpretar necessidade, familia, atributos e exclusoes. O modelo nao escolhe SQL, tabelas, colunas, credenciais, permissoes ou regras de negocio. Conflito, baixa confianca ou atributo ambiguo deve produzir no maximo uma clarificacao.

Consultas simples nao chamam LLM nem reranker.

## Tool publica

Apenas a tool buscar_produtos pode ser exposta ao modelo. A entrada deve ser allowlistada e limitada pelo servidor: texto residual, identificadores, filtros de preco, filtro de emestoque, filial ou escopo autorizado, atributos evidenciados, ordenacao, paginacao e limite.

O servidor deve ignorar ou rejeitar campos fora da allowlist. A tool retorna envelope estruturado com status results, pedir_clarificacao, abstention, unavailable ou recoverable_failure; filtros aplicados; confianca; itens; codigo visual; descricao; imagem leve; evidencia; preco autorizado; emestoque; avisos; identificador de requisicao e metadados sem PII.

A tool nunca inclui Produto no Orcamento, reserva estoque, altera estoque ou modifica qualquer registro.

## Elegibilidade e pipeline

Produto Ativo e hard filter absoluto. A verificacao ocorre antes das trilhas de busca, do ranking e do candidate cap. Produto inativo nunca aparece em candidatos, alternativas, resultado ou detalhe.

Use o pipeline: autenticar e autorizar; normalizar e separar filtros; resolver Produto Ativo; aplicar filtros; buscar por identificador exato, lexical/BM25 e vetor; fundir por RRF; reranquear somente 30-50 candidatos ja filtrados; ordenar e desempatar; revalidar preco e estoque; anexar evidencia; retornar resposta ou fallback.

Filtros de atributos diferentes usam AND. Valores alternativos do mesmo atributo usam OR. Valor estruturado tem prioridade. Sinonimo so pode ser aceito se mapeado no catalogo. Atributo ausente nao pode ser inventado.

Estoque significa exclusivamente a coluna emestoque. Nao usar reserva, reservado, pre-reserva, transito, embalagem ou conversao de unidade. Produto sem linha de estoque conta como zero somente quando houver filtro de estoque.

O preco e resolvido pelo adapter autorizado do hospedeiro. Nao colocar preco, estoque, margem ou dados sensiveis no embedding.

## Ranking e reranking

Ordem deterministica: identificador exato; coincidencia textual forte; atendimento de atributos e filtros; relevancia semantica; ordenacao solicitada; codigo do produto como desempate.

Nao usar margem, popularidade, giro ou historico comercial na v2.

O reranker recebe apenas consulta, descricao, marca, modelo e caracteristicas evidenciadas. Se falhar, RRF e o fallback. O reranker jamais reintroduz Produto inativo ou viola hard filter.

## Laravel AI SDK

Atualize o Laravel AI SDK para a versao estavel verificada no momento da implementacao antes de criar novas tools.

Faca em duas etapas: atualizar dependencias e lockfile, validar PHP/Laravel/Prism/Laravel AI SDK e executar regressao dos fluxos atuais; somente depois implementar tool, schema, planejador semantico e reranking.

Registre matriz de compatibilidade para Tool, saida estruturada, loop, retry/failover, limites, eventos, autorizacao e agentes existentes.

## Custo, cache e resiliencia

Implemente cache de embedding por HMAC, normalizador, provider, modelo e dimensoes. Avalie cache de plano semantico, candidatos e reranking por versao, contexto e TTL.

Use lock ou single-flight para chamadas duplicadas. Preco e estoque devem ser ao vivo ou ter TTL muito curto e contexto correto. Respeite limites de tempo, tokens, linhas, candidatos, filtros, chamadas e orcamento diario. Circuit breaker e fallback preservam a busca tradicional.

## Apresentacao

Preserve a Variacao A escolhida: cards compactos; imagem; codigo e descricao; evidencia; preco e estoque; bloco Como entendi com intencao, filtros e confianca; acesso ao detalhe comercial rico existente.

O detalhe continua separado e autorizado, incluindo galeria, descricao HTML sanitizada e caracteristicas HTML sanitizadas.

Estados obrigatorios: resultados, clarificacao unica, nenhum resultado, indisponibilidade/abstention e fallback.

## Seguranca e observabilidade

Repita autorizacao no servidor da tool e dos adapters. O modelo nunca recebe SQL ou acesso direto ao banco.

Registre somente HMAC da consulta, versao do plano/modelo, filtros, IDs de resultado, detalhe, selecao, fallback, latencia, tokens, custo, erros e cache hit. Nunca registrar texto bruto, cliente, usuario ou PII.

## Avaliacao e liberacao

Use dataset offline de consultas reais anonimizadas, cobrindo identificadores, linguagem natural, filtros, atributos, ambiguidade, erros e ausencia de resultado.

Gates: zero Produto inativo; zero violacao de hard filter; zero bypass de autorizacao; 100% de identificadores exatos; 100% de preco e estoque deterministico; NDCG@5 pelo menos 10% acima do baseline em consultas abertas; Recall@10 nao inferior; 90% de clarificacoes corretas; P95, custo, erros e fallback dentro do orcamento.

A liberacao sera unica depois dos gates. Deve existir desligamento operacional e rollback para a busca tradicional.

## Saida esperada do SpecKit

Produza requisitos funcionais e nao funcionais, contratos de entrada e saida, componentes e endpoints reais a alterar apos inspeccao, migracao do SDK, fases tracer-bullet, riscos, testes unitarios/feature/integracao/frontend/seguranca/custo, criterios de aceite e plano de rollout.

Critérios de aceite: a unica tool publica e buscar_produtos; Produto inativo nunca e retornado; filtros entram antes do ranking e candidate cap; preco e estoque usam adapter do contexto; busca combina exato, lexical, vetorial, RRF e reranker limitado; reranker tem fallback; cards preservam imagem, preco, estoque e evidencia; detalhe rico continua autorizado; cache reduz custo sem envelhecer preco/estoque; SDK e fluxos existentes passam por regressao; busca tradicional segue funcionando.
