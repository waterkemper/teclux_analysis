# Busca Assistida de Produtos

Status: ready-for-agent

## Problem Statement

Vendedores conhecem o problema ou a necessidade comercial do Cliente, mas nem sempre sabem qual código, descrição ou termo exato procurar. A lupa tradicional encontra Produtos por identificadores e texto cadastrado, porém não interpreta solicitações em linguagem natural. Isso torna a descoberta lenta, depende do conhecimento individual do catálogo e dificulta oferecer alternativas.

Ao mesmo tempo, uma busca baseada em IA não pode inventar benefícios, expor preços ou Filiais sem autorização, consumir tokens desnecessariamente nem tornar a operação dependente de serviços externos. O ERP precisa preservar integralmente a lupa tradicional e reutilizar a nova capacidade futuramente em Orçamentos e Contratos.

## Solution

Adicionar à Consulta de Estoques uma Busca Assistida opcional em painel lateral. O vendedor digita ou dita uma necessidade; o sistema combina identificadores exatos, busca lexical existente e índice semântico, apresentando Produtos com Evidência Comercial literal do cadastro. Estoque, disponibilidade, Filial e preço são consultados ao vivo e respeitam as autorizações atuais.

A solução pode se abster quando não houver evidência suficiente. Falhas, limites ou desativação afetam somente o painel; a lupa tradicional permanece independente. O painel devolve a seleção por contrato desacoplado, permitindo reutilização posterior.

## User Stories

1. Como vendedor, quero descrever a necessidade em linguagem natural, para descobrir Produtos mesmo sem conhecer o termo cadastrado.
2. Como vendedor, quero ditar a necessidade, para pesquisar enquanto atendo o Cliente.
3. Como vendedor, quero editar a transcrição antes de buscar, para corrigir reconhecimento incorreto.
4. Como vendedor, quero iniciar a busca explicitamente, para controlar quando haverá processamento.
5. Como vendedor, quero manter a Consulta de Estoques visível, para não perder meu contexto.
6. Como vendedor, quero herdar meus filtros e Filiais, para receber resultados compatíveis com a consulta atual.
7. Como vendedor, quero que códigos, referências e códigos de barras exatos tenham precedência, para localizar diretamente o Produto informado.
8. Como vendedor, quero ver uma lista compacta de sugestões, para avaliar rapidamente as opções.
9. Como vendedor, quero ver a Evidência Comercial e sua fonte, para entender por que o Produto foi sugerido.
10. Como vendedor, quero ver linguagem calibrada de aderência, para não interpretar aproximação como certeza.
11. Como vendedor, quero ser informado quando não houver evidência suficiente, para não oferecer um Produto inadequado.
12. Como vendedor, quero ver estoque e disponibilidade atuais por Filial, para não agir sobre dados do índice semântico.
13. Como vendedor autorizado, quero ver o preço atual, para informar corretamente o Cliente.
14. Como usuário sem autorização de preço, quero que o dado nem seja entregue, para preservar confidencialidade.
15. Como vendedor, quero limitar sugestões repetidas da mesma Característica, para enxergar alternativas úteis.
16. Como vendedor, quero selecionar um Produto no painel, para devolvê-lo à Consulta sem gravação automática.
17. Como vendedor, quero fechar o painel sem perder a Consulta, para continuar pelo fluxo anterior.
18. Como vendedor, quero abrir a lupa tradicional em qualquer estado, para nunca depender da IA.
19. Como vendedor, quero cancelar uma busca demorada, para manter o atendimento fluido.
20. Como vendedor, quero que respostas antigas sejam ignoradas após mudar filtros ou consulta, para não selecionar dados obsoletos.
21. Como vendedor, quero informar se a busca ajudou, para melhorar a avaliação da capacidade.
22. Como vendedor, quero marcar sugestão inadequada, para registrar falhas sem armazenar a consulta.
23. Como administrador, quero habilitar a capacidade por um único Parâmetro do Sistema, para controlar o rollout.
24. Como administrador, quero pré-visualizar volume, tokens, custo e espaço antes do backfill, para aprovar conscientemente.
25. Como administrador, quero pausar, retomar e reprocessar somente itens necessários, para controlar custo e operação.
26. Como administrador, quero acompanhar cobertura, atraso, filas, falhas e geração ativa, para conhecer a saúde do índice.
27. Como administrador, quero acompanhar consumo separado de indexação, consulta e transcrição, para administrar orçamento.
28. Como administrador, quero receber alertas em 80%, 95% e 100%, para agir antes da suspensão.
29. Como administrador, quero bloquear um Produto da Busca Assistida, para impedir sugestões indevidas sem alterar o cadastro.
30. Como administrador, quero ativar ou reverter uma geração avaliada, para fazer rollout seguro.
31. Como administrador, quero limpar cache e dados expirados com confirmação, para administrar privacidade e espaço.
32. Como auditor, quero rastrear ações administrativas sem conteúdo pesquisado, para ter responsabilização sem violar privacidade.
33. Como operador, quero que falhas do PostgreSQL de IA ou provider não afetem o legado, para preservar o ERP.
34. Como futuro módulo hospedeiro, quero consumir a seleção por callback estável, para reutilizar a busca sem acoplamento à Consulta.

## Implementation Decisions

- O PostgreSQL legado 9.5 permanece a única autoridade dos dados do ERP.
- Cada instalação executará no mesmo servidor um PostgreSQL moderno com pgvector, isolado por serviço, porta, dados, usuário, recursos, migrations e backup, conforme ADR de projeções de IA.
- O Laravel terá conexão de banco específica para IA. Nenhuma migration vetorial, extensão ou escrita de IA será executada no legado.
- A base de IA será uma projeção eventualmente consistente, sem trigger entre bancos, escrita reversa ou transação distribuída.
- Cada cliente já possui instalação e bancos próprios; não será criado tenant. Filial continua sendo filtro e escopo de autorização.
- A coluna busca de Produtos permanece responsável pela pesquisa textual PostgreSQL existente e não será convertida ou substituída.
- O índice semântico inicial usará OpenAI text-embedding-3-small, 1.536 dimensões, distância cosseno e HNSW. Busca exata será a referência de avaliação.
- A identidade de uma geração combina provider, modelo, dimensão e versão do normalizador. Gerações incompatíveis não se misturam; ativação e rollback são administrativos.
- O Documento Semântico inclui conteúdo comercial estável: descrição, descrição complementar, características sem HTML e metadados úteis de Marca, Modelo, Grupo, Classe e Característica.
- A montagem será determinística, versionada e limitada por tokens, com partes estáveis, hashes individuais, precedência das fontes e Evidência Comercial literal.
- Produto precisa estar ativo, em linha, não bloqueado e conter fonte comercial útil para ser indexado.
- Estoque, reservado, pedidos, preço, promoção, Filial e permissões nunca entram no Documento Semântico ou embedding.
- Conteúdo idêntico reutiliza vetor somente quando hash, provider, modelo e dimensão coincidirem.
- O pipeline resolve identificadores exatos primeiro, executa lexical no legado e semântico no pgvector, combina rankings por Reciprocal Rank Fusion e consolida partes por Produto.
- Scores lexicais e vetoriais não serão comparados diretamente. O resultado terá aderência calibrada por avaliação.
- Antes da resposta, o servidor revalida Produto, bloqueio, Filiais, disponibilidade, preços e capabilities no legado. Resultado final nunca será cacheado.
- Serão exibidas inicialmente no máximo duas variantes de uma mesma Característica.
- Toda sugestão precisa de Evidência Comercial literal e origem. A relação indireta usa linguagem neutra; evidência fraca produz abstenção.
- O caminho normal não usa chat, scan vetorial em PHP, fallback para provider/modelo mais caro ou troca silenciosa de configuração.
- A interface escolhida é um painel lateral contextual que mantém a Consulta visível.
- Texto e ditado convergem para a mesma consulta editável. A implementação reutiliza a transcrição atual, mas não o interpretador de comandos de Usuários.
- O painel recebe Filiais, filtros e capabilities e devolve seleção por callback. Ele não conhece rotas ou regras de gravação do hospedeiro.
- Busca é explícita e cancelável. O painel protege contra respostas obsoletas e oferece estados de abstenção, cobertura parcial e indisponibilidade.
- Abrir lupa tradicional fecha o painel e usa o fluxo lexical existente sem chamar banco, cache, provider, circuit breaker ou configuração de IA.
- Um único Parâmetro do Sistema habilita a Busca Assistida. Não haverá nova Permissão; o acesso é herdado da Consulta e dados sensíveis seguem capabilities existentes.
- Áudio, texto original, transcrição, dados pessoais e vínculo com Cliente ou Usuário não serão persistidos nem registrados em logs.
- Feedback persiste somente HMAC da consulta, Produtos exibidos/selecionados e o sinal, sem identidade do Usuário.
- A chave do cache de consulta é HMAC da consulta normalizada, versão, provider, modelo e dimensão. O cache guarda vetor e metadados técnicos por 90 dias, nunca o texto.
- Single-flight distribuído impede chamadas concorrentes duplicadas para o mesmo HMAC.
- Backfill exige Parâmetro desligado, dry-run local, estimativa e aprovação. Jobs são pequenos, idempotentes, pausáveis e persistem sucessos por parte.
- Atualização incremental usa cursores e alterações; reconciliação diária remonta documentos para detectar inclusive mudanças indiretas. Hash igual não chama provider.
- Antes de qualquer chamada haverá reserva atômica de orçamento por categoria. Indexação não consome a reserva das consultas interativas.
- Alertas administrativos deduplicados ocorrerão em 80%, 95% e 100%. Limite suspende somente a capacidade de IA.
- A geração ativa e a anterior são mantidas para rollback. Partes substituídas e cache de consultas têm retenção de 90 dias; geração experimental inativa pode expirar após 30 dias.
- A administração de IA será transversal ao ERP e identificará capacidades separadamente, começando por busca e indexação de Produtos.
- A administração expõe configuração sem segredo, cobertura, filas, falhas, cache, consumo, orçamento, gerações, health, HNSW e circuit breaker.
- A auditoria cobre alterações e ações administrativas, nunca consulta, áudio, transcrição, vetor, payload integral ou segredo.
- Falhas transitórias têm retry curto, timeout e circuit breaker. Índice parcial informa cobertura. Erro estrutural não será mascarado como resultado vazio.
- O rollout seguirá provisionamento, dry-run, backfill aprovado, avaliação humana multissetorial, comparação HNSW/exata, ativação da geração e habilitação do Parâmetro.

## Testing Decisions

Os testes devem observar comportamento externo e contratos, não detalhes internos. O seam principal é o fluxo autorizado de Busca Assistida: consulta de entrada até candidatos, evidência, dados dinâmicos e seleção no painel. Seams menores cobrem Documento Semântico, processamento assíncrono e reserva de orçamento, que não são plenamente observáveis pelo endpoint.

- Testar Documento Semântico com HTML, normalização, tokens, partes, fontes, hashes, elegibilidade e bloqueio.
- Testar mudanças diretas e indiretas, reconciliação, idempotência, locks, lotes, subdivisão de falha, retry e retomada.
- Testar migrations exclusivamente na conexão de IA, isolamento do legado, gerações incompatíveis, ativação e rollback.
- Testar identificador exato, lexical, vetor, RRF, consolidação por Produto, diversidade, Evidência e abstenção.
- Avaliar HNSW contra busca exata por dataset multissetorial com consultas exatas, semânticas, ambíguas, negativas e sem resposta.
- Testar duas Filiais com dados e autorizações diferentes, garantindo ausência efetiva de preços/comissões proibidos no payload.
- Alterar Produto, estoque, preço e promoção depois da indexação e comprovar que a resposta usa o estado atual do legado.
- Testar HMAC, expiração, rotação, single-flight e impossibilidade de recuperar o texto pesquisado.
- Testar reserva concorrente, reconciliação do consumo, cotas, alertas e separação entre indexação, consulta e transcrição.
- Comprovar que áudio, consulta e transcrição não aparecem em banco, cache, logs ou exceções.
- Testar painel fechado, pronto, ditando, editando, buscando, resultado, detalhe, abstenção, cobertura parcial, falha e seleção.
- Testar cancelamento, resposta obsoleta, teclado, foco, responsividade, filtros herdados e callback desacoplado.
- Testar Parâmetro ligado/desligado, configuração ausente, timeout, circuit breaker, índice parcial e cota.
- Parar provider, fila/cache e PostgreSQL de IA e comprovar que Consulta e lupa tradicional continuam funcionando.
- Testar ações administrativas, auditoria, métricas, limpeza, bloqueio e ausência de segredos.

Como prior art, reutilizar o estilo dos testes feature da Consulta de Estoques para acesso, Filiais, lookup e capabilities; testes do assistente de voz para transcrição fake; testes de componentes/hook da Consulta para cancelamento e stale response; e infraestrutura de jobs/cache já adotada no Laravel.

## Out of Scope

- Substituir, alterar semanticamente ou tornar a lupa tradicional dependente de IA.
- Diagnosticar doenças, prescrever tratamento ou produzir aconselhamento profissional.
- Inserir automaticamente Produtos em Orçamentos ou Contratos no MVP.
- Implementar comandos administrativos em linguagem natural.
- Gerar ou reescrever automaticamente descrições e características dos Produtos.
- Vetorizar estoque, preço, promoção, Filial ou qualquer dado dinâmico.
- Usar chat no fluxo comum de recuperação.
- Modernizar ou instalar extensões no PostgreSQL legado.
- Compartilhar vetores, consultas ou dados entre instalações de clientes.
- Criar um tenant artificial para representar a instalação.
- Criar nova Permissão específica para a Busca Assistida.
- Fazer failover silencioso para provider ou modelo diferente.

## Further Notes

- Esta PRD foi sintetizada do Wayfinder concluído e do prompt SpecKit autocontido.
- A arquitetura respeita a ADR que separa o PostgreSQL legado do PostgreSQL moderno com pgvector.
- O agente implementador deve inspecionar o Laravel atual antes de propor arquivos concretos e reutilizar os componentes e serviços existentes.
- O agente não tem de investigar Delphi; todo comportamento requerido está especificado aqui.
- A entrega deve incluir provisionamento, backup, restauração, observabilidade, rollout e rollback, além do código funcional.
- A funcionalidade só é considerada pronta quando a lupa não tiver regressão, toda sugestão tiver Evidência ou abstenção, dados dinâmicos forem atuais e os testes relevantes passarem.
