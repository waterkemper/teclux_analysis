# Busca Assistida Operacional v2

## Finalidade

Criar uma Busca Assistida somente leitura para vendedores, reutilizavel em Consulta de Estoques e Orcamentos. A v2 deve interpretar linguagem natural, localizar Produtos Ativos relevantes, aplicar filtros explicitos de Preco, Estoque Fisico Disponivel, Filial e Atributos Comerciais Evidenciados, explicar o resultado e manter fallback para a busca tradicional.

Este documento e a base funcional pronta para virar prompt SpecKit. Ele nao autoriza a implementacao de mutacoes.

## Escopo

Incluido:

- Consulta operacional de produtos.
- Uma tool publica chamada buscar_produtos.
- Interpretacao deterministica de identificadores e filtros objetivos.
- Interpretacao semantica estruturada de necessidades abertas.
- Busca exata, lexical e vetorial.
- Fusao RRF e reranking controlado.
- Preco, estoque e autorizacao resolvidos no servidor.
- Resposta com cards leves e evidencia.
- Reuso do detalhe comercial rico existente.
- Consulta de Estoques e Orcamentos com adapters de contexto.
- Cache, observabilidade, avaliacao offline e liberacao unica apos gates.

Fora do escopo:

- Alterar estoque, reservar produto, gerar pedido ou executar mutacao.
- Inclusao automatica em Orcamentos.
- Invocar a tool para alterar precos, clientes, cargos ou Filiais.
- Retornar Produto inativo.
- Inventar atributos, sinonimos ou equivalencias sem evidencia.
- Reabrir voz, detalhe comercial, embeddings basicos ou Restricao de Preco ja existentes.

## Termos e regras de dominio

Produto Ativo e o Produto elegivel para aparecer na Busca Assistida. Produto inativo nunca entra em candidatos, ranking, resultado, alternativa ou detalhe retornado pela busca.

Estoque Fisico Disponivel e a quantidade da coluna emestoque. Reserva, reservado, pre-reserva, transito, embalagem e conversao de unidade nao participam do significado de com estoque.

Atributo Comercial Evidenciado e marca, modelo, cor, material, medida, acabamento ou caracteristica que existe em valor estruturado ou evidencia textual clara do cadastro. A busca nao completa atributo ausente.

## Contrato de interpretacao

O fluxo separa consulta_original, texto_busca residual e filtros validados.

Interpretacao deterministica:

- codigo, referencia, codigo visual e codigo de barras;
- Preco e operadores monetarios;
- emestoque e quantidade minima;
- Filial;
- ordenacao fechada.

Interpretacao semantica estruturada:

- necessidade do vendedor;
- produto ou familia desejada;
- atributos comerciais;
- exclusoes;
- confianca por campo.

Consultas simples nao chamam LLM. Necessidades abertas usam uma chamada estruturada. Conflito, baixa confianca ou atributo ambiguo gera uma unica clarificacao. O modelo nunca escolhe SQL, tabela, coluna, credencial, permissao ou regra de negocio.

## Tool publica

Nome: buscar_produtos.

Entrada allowlistada:

- texto_busca residual;
- identificadores detectados;
- filtros de Preco;
- filtro de emestoque e quantidade minima;
- contexto de Filial;
- Atributos Comerciais Evidenciados;
- ordenacao: relevancia, menor_preco ou maior_emestoque;
- paginacao e limite dentro dos limites do servidor.

consulta_original pode ser preservada para auditoria, mas nao controla consulta ao banco.

Saida estruturada:

- status: results, pedir_clarificacao, abstention, unavailable ou recoverable_failure;
- filtros realmente aplicados;
- confianca da interpretacao;
- itens de Produtos Ativos;
- codigo visual, descricao, imagem leve, evidencia, Preco Efetivo e emestoque;
- avisos de cobertura, dado ausente, limite ou fallback;
- identificador de requisicao e metadados de observabilidade sem PII.

A tool nunca inclui Produto no Orcamento, reserva estoque, altera estoque ou modifica qualquer registro.

## Pipeline server-side

1. Autenticar usuario e autorizar contexto.
2. Normalizar consulta e separar filtros deterministas.
3. Resolver e validar Produto Ativo antes de candidatos e corte.
4. Aplicar filtros explicitos antes do ranking.
5. Buscar em tres trilhas: identificador exato, lexical/BM25 e vetorial.
6. Fundir listas por Reciprocal Rank Fusion.
7. Aplicar reranker somente aos 30 a 50 melhores candidatos ja filtrados.
8. Aplicar ordenacao final, desempate estavel e limite.
9. Revalidar Preco e Estoque dinamicos.
10. Anexar evidencia e dados leves de apresentacao.
11. Retornar envelope estruturado ou fallback.

## Elegibilidade e filtros

Produto Ativo e hard filter absoluto e deve ser aplicado antes de qualquer candidate cap.

Preco:

- abaixo de BRL X: menor que X;
- ate BRL X: menor ou igual a X;
- acima de BRL X: maior que X;
- a partir de BRL X: maior ou igual a X;
- entre X e Y: intervalo inclusivo;
- Consulta de Estoques usa Preco Efetivo autorizado, incluindo promocao valida;
- Orcamento usa preco resolvido para cliente, cargo, markup e Filial Base.

Estoque:

- com estoque: emestoque maior que zero;
- pelo menos N: emestoque maior ou igual a N;
- sem estoque: emestoque igual a zero, incluindo ausencia de linha;
- Consulta com Filial explicita usa o emestoque da Filial;
- Orcamento mostra o total de emestoque de todas as Filiais, sem composicao;
- maior estoque so ordena quando solicitado;
- nenhuma embalagem, reserva ou conversao e usada.

Atributos:

- atributos diferentes combinam com E;
- valores alternativos do mesmo atributo combinam com OU;
- valor estruturado tem prioridade;
- sinonimo so e aceito quando mapeado no catalogo;
- ambiguidade pede clarificacao ou vira sinal de ranking, nunca filtro inventado.

## Ranking

Ordem deterministica:

1. identificador exato;
2. coincidencia textual forte em codigo, referencia, marca, modelo e descricao;
3. atendimento de atributos e filtros;
4. relevancia semantica;
5. ordenacao explicitamente solicitada: relevancia, menor Preco ou maior emestoque;
6. codigo do Produto como desempate estavel.

Margem, popularidade, giro e historico comercial nao entram na v2.

O reranker usa consulta, descricao, marca, modelo e caracteristicas evidenciadas. Nao recebe margem, dados sensiveis, Preco ou Estoque. Se falhar ou estourar limite, RRF e o fallback. Nenhum reranking pode reintroduzir Produto inativo ou violar hard filter.

## Adaptacao por contexto

Consulta de Estoques usa autorizacao do modulo, Filiais autorizadas, Preco Efetivo de consulta e emestoque conforme escopo.

Orcamentos usa contexto do cliente e cargo, Preco da Filial Base, total de estoque de todas as Filiais e inclusao sempre na Filial Base. A funcao existente de inclusao revalida Produto Ativo, preco, estoque e Filial Base no momento da operacao.

## Apresentacao

A Variacao A do prototipo foi escolhida como base:

- cards compactos;
- imagem ou miniatura;
- codigo visual e descricao;
- evidencia proxima do Produto;
- Preco e estoque visiveis;
- bloco Como entendi com intencao, filtros e confianca;
- acesso ao detalhe comercial rico existente.

O detalhe rico continua separado e autorizado: galeria, descricao complementar HTML sanitizado, caracteristicas HTML sanitizado e demais informacoes comerciais.

Estados obrigatorios:

- resultados;
- clarificacao unica;
- nenhum resultado;
- indisponibilidade ou abstention com fallback para busca tradicional.

## Custo e cache

Manter cache de embedding por HMAC, normalizador, provider, modelo e dimensoes.

Adicionar cache de plano semantico, candidatos e reranking por versao, contexto e TTL adequado. Locks ou single-flight evitam chamadas duplicadas.

Consultas simples nao chamam LLM nem reranker. Preco e Estoque nao podem depender de cache longo: devem ser revalidados ao vivo ou com TTL muito curto e contexto correto.

Respeitar limites de tempo, tokens, linhas, candidatos, filtros, chamadas e orcamento diario. Circuit breaker e fallback devem preservar a busca tradicional.

## Laravel AI SDK

Antes de implementar as novas tools, atualizar o Laravel AI SDK para a versao estavel mais recente verificada na execucao. A pesquisa deste mapa encontrou laravel/ai v0.3.2 e Prism v0.99.22 instalados e consultou v0.10.3 como referencia oficial.

Migracao em duas etapas:

1. atualizar dependencias e lockfile, validar Laravel AI SDK, Prism, PHP e Laravel e executar regressao dos fluxos atuais;
2. somente depois implementar tool, schemas, planejador semantico e reranking.

A matriz de compatibilidade deve cobrir Tool, saida estruturada, loop, limites, retry/failover, eventos, autorizacao e agentes existentes.

## Seguranca e observabilidade

Toda autorizacao deve ser repetida no servidor da tool e dos adapters. O modelo nao recebe SQL ou acesso direto ao banco.

Registrar somente telemetria minimizada: HMAC da consulta, versao do plano/modelo, filtros aplicados, IDs dos resultados, detalhe, selecao, fallback, latencia, tokens, custo, erros e cache hit. Nunca registrar texto bruto, cliente ou PII.

## Avaliacao e liberacao

Criar dataset offline de consultas reais anonimizadas, cobrindo identificadores, linguagem natural, erros, filtros, atributos, ambiguidade e ausencia de resultado.

Gates rigidos:

- zero Produto inativo;
- zero violacao de hard filter;
- zero bypass de autorizacao;
- 100 por cento em identificadores exatos;
- 100 por cento em Preco e Estoque deterministico.

Gates de qualidade:

- NDCG@5 pelo menos 10 por cento superior ao baseline em consultas abertas;
- Recall@10 nao inferior ao baseline;
- nenhuma regressao nas consultas que ja funcionam;
- pelo menos 90 por cento de clarificacoes corretas;
- P95, custo por consulta, taxa de erro e fallback dentro do orcamento.

Nao havera rollout gradual. A liberacao sera unica depois de todos os gates. Deve existir desligamento operacional e rollback para a busca tradicional.

## Criterios de aceite SpecKit

- A tool publica e somente buscar_produtos.
- Produto inativo nunca e retornado.
- Filtros explicitos entram antes de ranking e candidate cap.
- Preco usa adapter correto de Consulta ou Orcamento.
- Estoque usa somente emestoque e respeita escopo definido.
- Orcamento exibe total de Filiais e inclui sempre na Filial Base.
- Atributos exigem evidencia.
- Busca combina exato, lexical, vetorial, RRF e reranker limitado.
- Reranker tem fallback e nao altera hard filters.
- Cards preservam imagem, preco, estoque e evidencia.
- Detalhe HTML continua no endpoint autorizado.
- Cache reduz custo sem envelhecer Preco e Estoque.
- SDK atualizado e validado antes das novas tools.
- Gates de seguranca, relevancia, custo e latencia passam antes da liberacao.
- Telemetria nao contem texto bruto ou PII.
- Busca tradicional continua disponivel como fallback.

## Artefatos e fontes locais

- Mapa: .scratch/busca-assistida-operacional-v2-wayfinder/map.md
- Contrato de interpretacao: issues/01-definir-contrato-de-interpretacao-operacional.md
- Inventario de fontes: issues/02-inventariar-fontes-elegibilidade-do-produto.md
- Pesquisa do SDK: issues/03-pesquisar-tools-e-saida-estruturada-do-laravel-ai-sdk.md
- Catalogo de tools: issues/04-definir-catalogo-de-tools-somente-leitura.md
- Filtros e ranking: issues/05-definir-filtros-e-ranking-operacional.md
- Prototipo escolhido: issues/06-prototipar-resposta-e-explicabilidade.md
- Avaliacao e rollout: issues/07-definir-avaliacao-e-criterios-de-rollout.md
- Prototipo visual: laravel/backend/resources/js/Pages/Prototype/BuscaAssistidaRespostaPrototype.tsx

## Evolucoes futuras fora da v2

Equivalentes, substitutos e alternativas exigem um contrato proprio de evidencia e nao devem ser inferidos nesta v2.

Sinais de margem, popularidade, giro e historico comercial exigem fonte confiavel, governanca e avaliacao de vies antes de entrarem no ranking.
