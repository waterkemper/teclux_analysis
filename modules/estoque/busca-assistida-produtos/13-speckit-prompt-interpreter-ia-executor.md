# Prompt SpecKit - Interpreter IA e Executor unico da Busca Assistida

Crie uma especificacao executavel e um plano de implementacao completos para corrigir e evoluir a Busca Assistida de Produtos no Laravel existente, conforme as decisoes finais em .scratch/busca-assistida-preco-tolerante-wayfinder/map.md.

Este prompt complementa e, para a estrategia de interpretacao, supersede qualquer trecho anterior que dependa de uma lista crescente de aliases deterministas para Restricao de Preco. Nao implemente ainda; produza a especificacao e o plano que outro agente executara.

## Contexto do problema

A consulta "produtos para escaras, baixo de 200" atualmente nao aplica preco porque o parser deterministico nao reconhece todas as variacoes de linguagem. Alem disso, o planner atual pode chamar BuscarProdutosTool, mas o resultado da chamada nao controla a resposta HTTP principal, e a tool declara campos estruturados que nao encaminha ao servico.

Nao corrija o problema adicionando regex indefinidamente ou fuzzy matching especulativo.

## Arquitetura obrigatoria

Implemente tres seams independentes:

1. Interpreter: um modelo barato interpreta consultas textuais e devolve somente structured output. O Interpreter nao recebe tools e nao executa busca.
2. PlanValidator: o servidor valida o plano contra schema fechado, regras de dominio, autorizacao, Filiais efetivas, limites, confianca e conflitos.
3. Executor: um servico deterministico executa a busca uma unica vez usando o plano validado.

HTTP e BuscarProdutosTool devem compartilhar o mesmo Executor. BuscarProdutosTool e apenas um adapter; nao pode possuir regra de negocio duplicada nem autoridade para bypassar validacao.

## Quando chamar IA

- Consulta composta apenas por codigo, referencia, codigo visual ou codigo de barras pode usar fast path sem IA.
- Toda consulta textual ou que contenha linguagem natural passa por uma chamada do Interpreter.
- A chamada deve ser uma unica por requisicao, salvo retry tecnico explicitamente limitado.
- Cachear o plano por HMAC da consulta, provider/modelo, versao do prompt/schema e contexto seguro.
- Nao persistir texto bruto, PII ou Cliente no cache de interpretacao.

## Contrato de saida do Interpreter

Defina um DTO versionado e fechado contendo, no minimo:

- texto_busca residual;
- identificadores;
- preco: operador lt, lte, gt ou gte; valor; valor_ate opcional;
- emestoque: operador gt ou gte; valor;
- filial solicitada, sem autorizar a Filial;
- atributos comerciais evidenciados;
- ordenacao: relevancia, menor_preco ou maior_emestoque;
- confianca por campo;
- pedir_clarificacao e motivo estruturado;
- versao do plano.

O modelo deve interpretar linguagem, erros de digitacao, voz transcrita, acentos ausentes e variacoes coloquiais. Por exemplo, "baixo de 200" deve poder resultar em preco lt 200. O modelo nao deve inventar atributo, sinonimo, preco, estoque, Filial, permissao ou regra comercial.

Se houver baixa confianca, conflito entre filtros ou suspeita de um filtro que nao possa ser interpretado com seguranca, retornar pedir_clarificacao. Nunca remover silenciosamente um filtro possivelmente solicitado e seguir com resultado irrestrito.

## Validacao server-side

Implementar validacao independente da resposta do modelo:

- allowlist de campos e operadores;
- tipos, limites numericos, moeda brasileira e intervalo valido;
- identificadores normalizados;
- atributos aceitos somente por catalogo/evidencia;
- Filial limitada ao contexto autorizado e nunca escolhida livremente pelo modelo;
- ordenacao fechada;
- limite e paginacao dentro do teto;
- conflito de preco e confianca por campo;
- Produto Ativo sempre como hard filter;
- nenhuma entrada de SQL, tabela, coluna, credencial, permissao ou query livre.

Quando o plano for invalido ou a IA estiver indisponivel, retornar clarificacao ou fallback explicito para a busca tradicional. Nunca executar a consulta original ignorando os filtros estruturados.

## Executor

O Executor deve receber o DTO validado e executar uma unica busca. O fluxo deve ser:

1. autenticar e autorizar o contexto;
2. aplicar Produto Ativo antes de ranking e candidate cap;
3. aplicar preco, emestoque, atributos e demais hard filters antes do corte;
4. recuperar por identificador exato, lexical/BM25 e vetor;
5. fundir por RRF;
6. reranquear somente candidatos ja filtrados, quando permitido;
7. revalidar preco e estoque dinamicos;
8. anexar evidencia, imagem e dados leves;
9. retornar o envelope unico para o painel.

Usar somente a coluna emestoque para estoque. Nao usar reserva, transito, embalagem ou conversao de unidade. Preco deve ser resolvido pelo adapter do hospedeiro.

## BuscarProdutosTool

Atualizar schema e handle para que todos os campos declarados sejam efetivamente encaminhados ao PlanValidator/Executor: texto_busca, identificadores, preco, emestoque, filial, atributos, ordenacao, paginacao e limite.

O modelo que interpreta a consulta nao deve chamar essa tool. A tool pode continuar disponivel como adapter publico do Laravel AI SDK, mas sua execucao deve passar pelo mesmo validador e Executor usado pelo HTTP.

Adicionar teste que falhe se preco ou emestoque estiverem no schema mas forem descartados no handle.

## Laravel AI SDK e custo

Antes da implementacao, verificar a versao estavel compativel do Laravel AI SDK, PHP e Laravel e executar regressao dos fluxos existentes.

Usar structured output suportado pelo SDK, timeout, retry curto, circuit breaker, budget e telemetria minimizada. Modelo, provider, prompt version, schema version e limite de tokens devem ser configuraveis.

Consultas de identificador nao chamam IA. Consultas textuais usam modelo barato. Cachear planos e evitar reranker quando nao necessario. O custo da interpretacao deve ser mensuravel por consulta.

## Resposta e fallback

Preservar o envelope existente com status, itens, como_entendi, filtros_aplicados, confianca, avisos, capabilities e restricao_preco.

Quando houver clarificacao, retornar lista vazia e uma pergunta unica. Quando IA ou Executor estiver indisponivel, oferecer busca tradicional sem afirmar que filtros foram aplicados.

Produtos inativos nunca aparecem em candidatos, alternativas, detalhe ou resposta.

## Matriz minima de testes

- Unit do Interpreter com fake de structured output para "baixo de 200", consultas sem preco, preco + estoque, conflito, baixa confianca e acentos/voz.
- Unit do PlanValidator para campos extras, operadores invalidos, valores invalidos, Filial nao autorizada, atributos inexistentes e limites.
- Unit do Executor para uma unica execucao, hard filters antes do candidate cap e revalidacao dinamica.
- Unit da tool provando encaminhamento de todos os campos e ausencia de mutacoes.
- Feature de Consulta de Estoques cobrindo filtro de preco, emestoque, Produto Ativo, autorizacao e fallback.
- Feature de Orcamentos cobrindo preco Cargo-aware, Filial Base e estoque total de todas as Filiais.
- Teste de contrato garantindo uma chamada de interpretacao, uma execucao e um envelope unico.
- Regressao para identificadores sem IA, busca tradicional, fotos/detalhe, privacidade e SDK.

## Saida esperada do SpecKit

Produza requisitos funcionais e nao funcionais, DTOs e schemas, seams reais apos inspecao, fases tracer-bullet, estrategia de cache/custo, riscos, criterios de aceite, matriz de testes e plano de rollout. Nao implemente aliases adicionais nem fuzzy matching generico. Nao permita que o modelo execute SQL ou altere estoque, preco, Cliente, Cargo ou Filial.
