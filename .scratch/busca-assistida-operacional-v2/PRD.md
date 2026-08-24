# Busca Assistida Operacional v2

Label: ready-for-agent
Status: ready-for-agent

## Problem Statement

Vendedores precisam localizar Produtos rapidamente em Consulta de Estoques e em Orcamentos, mesmo quando nao sabem o codigo exato e descrevem necessidade, acabamento, medida, faixa de Preco ou disponibilidade em linguagem natural.

A Busca Assistida atual possui boas bases de busca hibrida, restricao de Preco, evidencia, imagens e detalhe comercial, mas ainda precisa de um contrato operacional unico. Produtos inativos podem ocupar candidatos antes da revalidacao, estoque pode ser agregado ou interpretado fora do significado de emestoque, o Preco depende do contexto do host, filtros estruturados ainda sao limitados e a resposta precisa explicar melhor como a consulta foi entendida.

O resultado esperado e uma Busca Assistida operacional v2 que aumente a relevancia para vendedores sem criar autoridade de negocio no modelo, sem modificar estoque ou Orcamentos e sem degradar a busca tradicional.

## Solution

Implementar uma camada server-side de Busca Assistida com uma unica tool publica, buscar_produtos, reutilizavel pelos hosts de Consulta de Estoques e Orcamentos.

A tool recebe entrada tipada e allowlistada. O sistema interpreta deterministicamente identificadores, Preco, Estoque, Filial e ordenacao; usa saida estruturada de IA somente para necessidades abertas e Atributos Comerciais Evidenciados; valida todos os campos no servidor; aplica Produto Ativo e hard filters antes do ranking e do corte; executa busca exata, lexical e vetorial; funde resultados por RRF; usa reranking limitado como melhoria opcional; revalida Preco e Estoque dinamicos; e retorna resposta estruturada explicavel.

O painel reutilizavel usa cards compactos com imagem, Produto, codigo visual, descricao, evidencia, Preco e Estoque. Um bloco Como entendi apresenta intencao, filtros e confianca. O detalhe comercial rico continua no endpoint autorizado existente, e a inclusao em Orcamento continua na funcao existente, com revalidacao na Filial Base.

A liberacao sera unica depois dos gates de seguranca, relevancia, custo e latencia. A busca tradicional permanece como fallback e existe mecanismo operacional de desligamento ou rollback.

## User Stories

1. Como vendedor, quero pesquisar por codigo, referencia, codigo visual ou codigo de barras, para localizar imediatamente o Produto correto.
2. Como vendedor, quero descrever uma necessidade em linguagem natural, para encontrar Produtos mesmo sem conhecer o nome cadastrado.
3. Como vendedor, quero que consultas simples sejam resolvidas sem chamada desnecessaria de LLM, para obter resposta rapida e reduzir custo.
4. Como vendedor, quero filtrar por abaixo de, ate, acima de, a partir de e entre, para trabalhar com limites de Preco previsiveis.
5. Como vendedor, quero que o Preco promocional valido seja considerado na Consulta de Estoques, para nao receber produtos fora da faixa efetivamente exibida.
6. Como vendedor de Orcamentos, quero que o Preco considere cliente, cargo, markup e Filial Base, para que a sugestao corresponda ao valor que podera ser usado no Orcamento.
7. Como vendedor, quero pesquisar com estoque, para encontrar Produtos com emestoque maior que zero.
8. Como vendedor, quero informar uma quantidade minima, para encontrar Produtos cujo emestoque seja suficiente.
9. Como vendedor, quero que estoque sem linha seja tratado como zero somente quando houver filtro de disponibilidade, para nao perder Produto Ativo por ausencia de registro quando estoque nao foi pedido.
10. Como vendedor, quero indicar uma Filial na Consulta, para que o filtro use o emestoque daquela Filial.
11. Como vendedor de Orcamentos, quero ver o total de emestoque de todas as Filiais, sem composicao por Filial, para avaliar disponibilidade geral.
12. Como vendedor de Orcamentos, quero que o Preco exibido e a inclusao usem sempre a Filial Base, independentemente do total de estoque.
13. Como vendedor, quero filtrar por marca, modelo, cor, material, medida e acabamento, para encontrar variantes comerciais relevantes.
14. Como vendedor, quero que atributos diferentes sejam combinados com E e alternativas do mesmo atributo com OU, para expressar corretamente a necessidade.
15. Como vendedor, quero que um atributo so filtre quando houver evidencia no cadastro, para nao receber Produtos por uma caracteristica inventada.
16. Como vendedor, quero que Produtos inativos nunca aparecam, mesmo quando tenham codigo exato, texto semelhante ou estoque.
17. Como vendedor, quero que identificadores e filtros explicitos tenham prioridade sobre similaridade semantica, para que relevancia nao esconda uma restricao objetiva.
18. Como vendedor, quero que a busca combine correspondencia exata, texto e significado, para equilibrar precisao de codigo com entendimento de sinonimos e parafrases.
19. Como vendedor, quero que a ordenacao por relevancia, menor Preco ou maior estoque seja explicita, para entender por que um Produto ficou em primeiro.
20. Como vendedor, quero que o sistema desempate de forma estavel, para que consultas iguais produzam ordem previsivel.
21. Como vendedor, quero ver como a consulta foi entendida, quais filtros foram aplicados e qual a confianca, para corrigir rapidamente uma interpretacao errada.
22. Como vendedor, quero ver evidencia proxima de cada resultado, para conferir a caracteristica no cadastro antes de selecionar.
23. Como vendedor, quero manter imagem, Preco, estoque e acesso ao detalhe comercial, para nao perder informacoes da tela atual.
24. Como vendedor, quero consultar galeria, descricao complementar HTML sanitizada e caracteristicas HTML sanitizadas no detalhe autorizado, para confirmar a escolha sem sobrecarregar o card.
25. Como vendedor, quero receber uma pergunta curta quando a medida ou atributo estiver ambiguo, para esclarecer sem precisar reiniciar a busca.
26. Como vendedor, quero receber uma mensagem objetiva quando nenhum Produto Ativo atende aos filtros, para ajustar a consulta conscientemente.
27. Como vendedor, quero abrir a busca tradicional quando a Busca Assistida estiver indisponivel ou se abstiver, para nunca ficar sem caminho operacional.
28. Como vendedor, quero selecionar um Produto encontrado sem que a IA altere o Orcamento, para manter a inclusao sob o fluxo existente e autorizado.
29. Como vendedor, quero que a inclusao revalide Produto Ativo, Preco, estoque e Filial Base, para evitar selecionar dados que mudaram depois da busca.
30. Como administrador, quero limitar tools, filtros, linhas, candidatos, tokens, tempo e chamadas, para controlar custo e superficie de risco.
31. Como administrador, quero que o modelo nao receba SQL, tabela, coluna ou credencial, para preservar a fronteira de dados.
32. Como suporte, quero distinguir resultado, clarificacao, abstention, indisponibilidade e falha recuperavel, para orientar o vendedor e investigar problemas.
33. Como suporte, quero que Preco e Estoque tenham origem e instante de consulta, para explicar dados dinamicos.
34. Como responsavel por produto, quero avaliar consultas anonimizadas com metricas de relevancia, para liberar a v2 com evidencia.
35. Como responsavel por produto, quero garantir zero Produto inativo e zero violacao de hard filter, para impedir regressao funcional.
36. Como responsavel por produto, quero observar custo, latencia, cache hit, erro e fallback sem PII, para operar a v2 com seguranca.

## Implementation Decisions

- A Busca Assistida v2 e somente leitura. Nenhuma tool pode alterar estoque, reservar Produto, gerar pedido, incluir automaticamente em Orcamento ou modificar cadastros.
- O seam principal e a tool publica buscar_produtos. Consulta de Estoques e Orcamentos usam adapters de host para autorizacao, Filiais, Preco e contexto de inclusao.
- A entrada da tool e uma estrutura allowlistada com texto residual, identificadores, filtros de Preco, emestoque, quantidade minima, Filial, atributos evidenciados, ordenacao, pagina e limite. SQL, operadores livres, tabelas, colunas e credenciais nunca fazem parte do contrato.
- consulta_original pode ser preservada para auditoria e explicacao, mas nao controla diretamente a consulta.
- Produto Ativo e aplicado antes da formacao de candidatos, ranking e candidate cap. O predicate de Produto Ativo tambem e repetido no detalhe e nos adapters.
- Interpretacao deterministica cobre identificadores, Preco, Estoque, Filial e ordenacao. Necessidades abertas usam plano estruturado com intencao, atributos, exclusoes e confianca por campo.
- Consultas simples nao chamam LLM. Baixa confianca, conflito ou atributo ambiguo gera uma unica clarificacao. O modelo nao pode relaxar regras de servidor.
- Preco usa Preco Efetivo autorizado na Consulta de Estoques e resolver de cliente, cargo, markup e Filial Base em Orcamentos.
- Estoque usa somente emestoque. Consulta com Filial explicita usa aquela Filial. Orcamentos exibem o total de todas as Filiais, sem composicao, e incluem sempre na Filial Base.
- Filtros explicitos de Produto Ativo, identificador, Preco, Estoque, Filial e atributos evidenciados sao hard filters antes do ranking e do corte.
- Preco suporta abaixo, ate, acima, a partir de e entre. Ate, a partir de e entre sao inclusivos nos limites definidos; abaixo e acima sao exclusivos.
- Atributos diferentes combinam com E; valores alternativos do mesmo atributo combinam com OU. Sinonimos somente podem ser usados quando mapeados no catalogo.
- A busca executa tres trilhas: identificador exato, lexical/BM25 e vetorial. O resultado das trilhas e fundido por Reciprocal Rank Fusion.
- O reranker atua apenas sobre aproximadamente 30 a 50 candidatos ja filtrados. Usa consulta, descricao, marca, modelo e caracteristicas evidenciadas. Nao recebe Preco, Estoque, margem ou dados sensiveis. Falha ou timeout usa RRF como fallback.
- O ranking final prioriza identificador exato, texto forte, atendimento de atributos/filtros, relevancia semantica, ordenacao explicita e codigo estavel. Margem, popularidade, giro e historico comercial ficam fora da v2.
- O envelope de resposta informa status, filtros aplicados, confianca, itens, evidencia, Preco, Estoque, avisos e fallback. A apresentacao escolhida e a Variacao A do prototipo: cards compactos e bloco Como entendi.
- Imagem leve, Preco, Estoque, codigo e evidencia pertencem ao resultado. Galeria, descricao complementar HTML sanitizada, caracteristicas HTML sanitizadas e demais dados pertencem ao detalhe comercial autorizado existente.
- A inclusao em Orcamento permanece separada. A interface fornece identificadores ao fluxo existente, que revalida Produto Ativo, Preco, estoque e Filial Base no momento da inclusao.
- Embeddings sao reutilizados por cache HMAC considerando normalizador, provider, modelo e dimensoes. Plano semantico, candidatos e reranking podem usar cache por versao, contexto e TTL adequado.
- Preco e Estoque nao dependem de cache longo. Devem ser revalidados ao vivo ou com TTL muito curto e contexto correto. Locks ou single-flight evitam chamadas duplicadas.
- O Laravel AI SDK deve ser atualizado para a versao estavel mais recente verificada antes das novas tools. A migracao valida dependencias, APIs de Tool, saida estruturada, loop, limites, retry/failover, eventos, autorizacao e agentes atuais antes da implementacao da v2.
- Autorizacao, limites e validacao de dominio pertencem ao servidor, repetidos na tool e nos adapters. O schema do provedor nao substitui validacao de negocio.
- Telemetria registra somente HMAC da consulta, versao do plano/modelo, filtros, IDs, detalhe, selecao, fallback, latencia, tokens, custo, erros e cache hit. Texto bruto, cliente e PII nao entram nos logs.
- A liberacao e unica, sem rollout gradual, depois de todos os gates. A busca tradicional continua como fallback e deve existir desligamento operacional ou rollback.
- O dataset de avaliacao e offline, real e anonimizado, cobrindo identificadores, linguagem natural, erros, Preco, Estoque, atributos, ambiguidade e ausencia de resultado.
- Gates rigidos: zero Produto inativo, zero violacao de hard filter, zero bypass de autorizacao, 100 por cento de acerto em identificadores exatos e 100 por cento em Preco/Estoque deterministico.
- Gates de qualidade: NDCG@5 pelo menos 10 por cento acima do baseline em consultas abertas, Recall@10 nao inferior ao baseline, nenhuma regressao nas consultas existentes e pelo menos 90 por cento de clarificacoes corretas. P95, custo, erro e fallback devem ficar no orcamento aprovado.

## Testing Decisions

Os testes devem observar comportamento externo, resposta estruturada, dados persistidos quando aplicavel, autorizacao, latencia e efeitos de fallback. Nao devem acoplar a ordenacao interna de arrays, classes concretas do modelo ou detalhes de implementacao que nao sejam contrato.

- Unit: normalizacao, parser e evaluator de Preco, operadores de Estoque, combinacao de atributos, allowlist de entrada, schema de saida, confianca, RRF, desempate e decisoes de cache.
- Feature: endpoint de Consulta de Estoques, endpoint de Orcamentos, autenticacao, autorizacao de Filiais, ocultacao de Preco, Produto Ativo, fallback, abstention, clarificacao e limites.
- Feature de contexto: Preco efetivo de Consulta, Preco de cliente/cargo/markup de Orcamento, total de estoque de Filiais e inclusao na Filial Base.
- Integracao de busca: identificador exato, lexical, vetor, fusao RRF, filtros antes do candidate cap, reranker, fallback de reranker e revalidacao dinamica.
- Integracao de apresentacao: cards com imagem, Preco, estoque, evidencia, estado Como entendi, detalhe comercial autorizado e estados sem resultado.
- Seguranca: rejeitar SQL e operadores livres, repetir autorizacao no servidor, garantir que Produto inativo nunca atravesse nenhuma camada e assegurar ausencia de PII na telemetria.
- Custo e resiliencia: cache hit, single-flight, limites de tokens/candidatos/tempo/linhas, circuit breaker, timeout e fallback para busca tradicional.
- Avaliacao offline: dataset anonimizado com acuracia de identificador, zero violacao, NDCG@5, Recall@10, clarificacao, latencia, custo e taxa de erro.
- Regressao: preservar testes existentes de Busca Assistida, Restricao de Preco, detalhe comercial, fotos, autorizacao de Filiais e adapters de Orcamentos.

## Out of Scope

- Mutacao de estoque, reserva, pedido ou qualquer operacao de escrita iniciada pela IA.
- Inclusao automatica de Produtos no Orcamento.
- Classificacao de equivalentes, substitutos e alternativas; isso exige contrato proprio de evidencia.
- Ranking por margem, popularidade, giro ou historico comercial.
- Voz, novo detalhe comercial, nova topologia vetorial e novas capacidades de comparacao.
- Promocao de atributos ausentes, sinonimos nao catalogados ou equivalencias nao provadas.
- Rollout gradual, shadow mode ou canario; a decisao e liberar de uma vez apos os gates.

## Further Notes

O dossie Wayfinder consolidado e a fonte de contexto funcional desta PRD. O prototipo visual escolhido e a Variacao A, com cards compactos e bloco Como entendi.

A implementacao deve preservar o detalhe comercial rico e a funcao existente de inclusao em Orcamentos, usando-os como seams de maior nivel em vez de duplicar esses fluxos.

Antes de criar novas tools, a equipe deve concluir a migracao validada do Laravel AI SDK. A ausencia de dado dinamico nao deve ser mascarada: Preco e Estoque devem informar contexto e instante de consulta ou serem omitidos conforme autorizacao.
