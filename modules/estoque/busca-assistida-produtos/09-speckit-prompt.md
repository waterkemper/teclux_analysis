# Prompt SpecKit — Busca Assistida de Produtos

Crie uma especificação e um plano de implementação completos para adicionar ao Laravel uma **Busca Assistida de Produtos**, inicialmente na Consulta de Estoques e projetada para reutilização posterior por Orçamentos e Contratos.

## Regra de investigação

Você tem acesso somente ao Laravel atual. Inspecione-o detalhadamente e trate-o como ponto real de partida. **Não procure, não solicite e não dependa de Delphi**. Todo contrato necessário está neste prompt.

Preserve e reutilize, após confirmar seus contratos reais: ConsultaEstoquesController, Index.tsx, ConsultaEstoquesProdutoLookupModal, ErpTwoColumnCatalogLookupModal, ProductFilterPanel, EstoqueConsultaEstoquesModuleAccessService, LaravelAiSpeechTranscriber, filas/cache/auditoria existentes e config/ai.php. Não reutilize o interpretador NLU experimental de comandos de Usuários.

## Resultado funcional

Adicionar ação **Busca assistida** à Consulta de Estoques. Ela abre um painel lateral contextual, mantendo a tela visível. Aceita texto ou ditado, aplica filtros e Filiais autorizadas, recupera Produtos por busca exata + lexical + semântica, mostra Evidência Comercial literal, estoque e preço ao vivo e devolve a seleção por callback desacoplado.

A lupa tradicional continua disponível e completamente independente. Falha, desativação, cota ou indisponibilidade de qualquer infraestrutura de IA não pode alterar, atrasar nem bloquear a lupa.

Não diagnosticar, prescrever ou inventar benefícios. A solução é comercial e multissetorial. Deve abster-se quando o cadastro não sustentar uma sugestão.

## Estado e restrições obrigatórias

- Cada cliente possui implantação e bancos próprios; não criar tenant_id. Filial é autorização/filtro operacional.
- produtos.busca continua sendo o tsvector PostgreSQL lexical existente; não convertê-lo nem substituí-lo.
- Estoque, reservado, pedidos, preço, promoção, Filial e permissões nunca entram em embedding.
- O fluxo padrão não usa modelo de chat.
- Áudio, texto/transcrição da consulta, dados pessoais e vínculo com Cliente ou Usuário não são persistidos.
- Um único Parâmetro do Sistema habilita a funcionalidade. Não criar nova Permissão: acesso é herdado da Consulta. Preços e comissões respeitam capabilities existentes, inclusive no JSON.
- Provider, modelo, dimensões, segredo, timeout e cotas são configuração técnica, não Parâmetros do Sistema.

## Topologia obrigatória

Manter PostgreSQL legado 9.5 como única autoridade. Adicionar no mesmo servidor um PostgreSQL moderno com pgvector, serviço/porta/diretório/usuário/pool/limites/backup próprios e conexão Laravel ai. Migrations vetoriais devem apontar explicitamente para essa conexão e jamais rodar no legado.

A base ai é projeção eventualmente consistente, sem triggers entre bancos, escrita reversa ou transação distribuída. Persistir documentos/partes/fontes/hashes, vetores, gerações, jobs, cache HMAC, consumo agregado, feedback anônimo, bloqueios e auditoria administrativa.

Primeira geração:

- provider OpenAI;
- modelo text-embedding-3-small;
- 1.536 dimensões;
- distância cosseno;
- HNSW para produção e busca exata para avaliação;
- identidade provider + modelo + dimensão + normalizer_version.

Troca incompatível cria geração paralela. Ativação e rollback são administrativos. Indisponibilidade da conexão ai desabilita somente a Busca Assistida.

## Documento Semântico do Produto

Elegíveis: Produtos ativos, em linha, não bloqueados e com conteúdo comercial útil. Montar documento determinístico a partir de descrição, descrição complementar e características sem HTML, mais marca, modelo, grupo, classe e Característica quando disponíveis.

Definir precedência de fontes, normalização Unicode/espaços/HTML, limites por tokens, divisão estável em partes, versão do documento e hashes por parte. Persistir Evidência Comercial como trecho literal + origem. Conteúdo idêntico deve reutilizar embedding quando hash, provider, modelo e dimensão coincidirem.

Permitir associação semântica indireta apenas com linguagem neutra e evidência literal. Produto sem evidência suficiente é inelegível para aquela resposta.

## Recuperação híbrida

Implementar pipeline server-side:

1. sanitizar e normalizar a consulta, preservando números/identificadores;
2. reconhecer código interno/visual, referência e código de barras exatos com precedência;
3. executar busca lexical canônica no legado e busca semântica no pgvector;
4. fundir rankings por Reciprocal Rank Fusion, sem comparar scores heterogêneos diretamente;
5. consolidar partes pelo melhor resultado do Produto;
6. limitar candidatos antes de consultar dados dinâmicos;
7. revalidar no legado Produto ativo/em linha, bloqueio, Filiais autorizadas, disponibilidade, preço e capabilities;
8. aplicar diversidade, inicialmente no máximo duas variantes da mesma Característica;
9. exigir evidência/limiar calibrado ou retornar abstenção.

Não fazer scan vetorial em PHP, cachear resultado final, chamar chat automaticamente nem trocar silenciosamente para provider/modelo mais caro. Identificadores exatos não podem perder para semântica.

Produzir dataset de avaliação multissetorial, versionado e sem dados pessoais, com consultas exatas, lexicais, semânticas, ambíguas, negativas e sem resposta. Medir Recall@K, MRR/nDCG, precisão/abstenção, diversidade, latência e recall HNSW contra busca exata. Uma geração só é ativada após avaliação humana e gates documentados.

## Painel lateral reutilizável

Criar componente transversal sem conhecimento de rotas ou gravações do hospedeiro. Contrato de entrada: Filiais autorizadas, filtros de Produto já existentes, capabilities de preço/comissão, seleção atual opcional e callbacks onSelect/onClose/onOpenTraditionalLookup.

O retorno de seleção contém identidade estável do Produto e contexto comercial confirmado; cada hospedeiro decide se seleciona linha, preenche item ou pede confirmação. O painel nunca grava Orçamento, Contrato ou estoque.

Fluxo:

1. abrir sem desmontar nem perder estado da Consulta;
2. campo textual multilinha com orientação para não informar dados pessoais;
3. Ditar reutiliza o transcritor atual; transcrição aparece editável e usa o mesmo endpoint de busca;
4. mostrar filtros/Filiais herdados e permitir refinamento por componentes existentes;
5. Buscar é explícito, cancelável e não dispara a cada tecla;
6. lista compacta mostra código, descrição, Característica, aderência calibrada, disponibilidade e preço permitido;
7. detalhe mostra Evidência Comercial literal, fonte, Filial, estoque e preço ao vivo;
8. Selecionar produto chama callback; fechar preserva o estado;
9. oferecer feedback Ajudou, Não ajudou e Sugestão inadequada;
10. em qualquer falha, oferecer Abrir lupa tradicional.

Estados: fechado, pronto, ditando, editando transcrição, buscando, resultados, detalhe, abstenção, cobertura parcial, falha recuperável, indisponível e seleção concluída. Incluir acessibilidade de foco/teclado, responsividade, cancelamento e proteção contra respostas obsoletas.

## Indexação e reconciliação

Com Parâmetro desligado:

1. dry-run local sem provider, contando elegíveis, partes, tokens, hashes, custo e espaço;
2. aprovação administrativa;
3. jobs pequenos de baixa prioridade, idempotentes e pausáveis;
4. persistência de sucesso por parte e subdivisão de lote falho;
5. retry/backoff apenas transitório;
6. avaliação, ativação da geração e depois habilitação do Parâmetro.

Detectar alterações incrementalmente por cursores/updated_at/logs e executar reconciliação completa diária, incluindo mudanças indiretas em Marca, Modelo, Grupo, Classe e Característica. Remontar localmente: hash igual não chama provider; somente partes novas/alteradas são enfileiradas. Inativação/bloqueio remove imediatamente da elegibilidade; reativação pode reutilizar hash.

O Laravel AI SDK é transporte, não cache autoritativo. Não depender de cache agregado de lote. Antes da chamada, consultar novamente o hash e usar locks/upserts para evitar cobrança duplicada.

## Cache, orçamento e retenção

Normalizador de consulta versionado. Chave:

HMAC(normalized_query + query_normalizer_version + provider + model + dimensions)

Persistir somente embedding, identidade técnica, uso e expiração de 90 dias. Nunca persistir texto. Rotação do segredo invalida o cache. Filial/preço/estoque não entram na chave. Cache curto de candidatos deve estar ligado à geração ativa; resultado final e dados dinâmicos nunca são cacheados.

Usar single-flight distribuído para consultas iguais. Métricas distinguem hit, miss, espera e chamada real.

Antes de qualquer provider, estimar e reservar atomicamente orçamento na categoria indexação, consulta ou transcrição. Reconciliar com uso real. Backfill não consome reserva interativa. Alertas administrativos deduplicados em 80%, 95% e 100%. Ao atingir limite, suspender somente IA.

Manter geração ativa e anterior para rollback. Partes substituídas e cache de consultas: 90 dias. Geração experimental inativa: expiração administrativa após 30 dias. Remoção exige confirmação e mostra espaço recuperável.

## Administração transversal e auditoria

Não criar administração confinada ao Estoque. Criar infraestrutura extensível por capability, começando por estoque.busca_assistida e estoque.indexacao_produtos, preparada para futuros comandos administrativos em Orçamentos, Contratos e Cadastros.

Exibir provider/modelo configurado sem segredo, consumo diário/mensal, reservado/confirmado, cache hit, cobertura, atraso, filas, throughput, falhas, gerações, última reconciliação, health, HNSW, circuit breaker e alertas. Permitir testar conectividade, dry-run, aprovar/pausar/retomar backfill, reprocessar ausentes/alterados/falhos, bloquear Produto, limpar cache e ativar/rollback de geração.

Auditar Usuário/momento para mudança do Parâmetro, backfill, identidade técnica, bloqueio, limpeza, cota e ativação. Nunca registrar consulta, áudio, transcrição, vetor, payload integral ou segredo. Feedback persiste apenas HMAC, Produtos exibidos/selecionados e sinal, sem identidade.

Falhas transitórias têm retry curto; usar timeout e circuit breaker. Índice parcial informa cobertura. Não usar Schema::hasTable/hasColumn em request para esconder implantação incompleta.

## Fases de implementação

Planeje tracer bullets verificáveis:

1. contratos, configuração e conexão ai com health check;
2. schema pgvector, documento determinístico, hashes e geração;
3. dry-run/backfill incremental com orçamento/observabilidade;
4. recuperação exata + lexical + vetorial, RRF, evidência e abstenção;
5. endpoint autorizado na Consulta com revalidação dinâmica;
6. painel lateral com texto, voz, seleção e lupa independente;
7. administração transversal, feedback e auditoria;
8. avaliação, rollout, ativação e rollback.

Cada fase deve manter a lupa funcionando e incluir migrations reversíveis, índices, DTOs PHP/TypeScript nominais e documentação operacional de provisionamento/backup/restore.

## Matriz mínima de testes

Inclua testes unitários, feature, integração PostgreSQL e frontend para:

- documento/HTML/tokens/hashes/partes/fontes/elegibilidade/bloqueio;
- mudanças diretas e indiretas, reconciliação, idempotência, locks, lotes, retry e retomada;
- gerações incompatíveis, ativação/rollback e migrations somente na conexão ai;
- exato, lexical, vetor, RRF, consolidação, diversidade, evidência, limiar e abstenção;
- HNSW versus exato e dataset multissetorial;
- duas Filiais com permissões diferentes; ausência real de preços/comissões não autorizados;
- atualização ao vivo de Produto, estoque, preço, promoção e Filial após candidato vetorial;
- HMAC, expiração, rotação, single-flight e impossibilidade de recuperar texto;
- reserva concorrente, cotas, alertas e separação backfill/consulta/transcrição;
- voz sem áudio persistido e texto/transcrição ausentes de DB/log/exceção;
- todos os estados do painel, cancelamento/stale response, teclado, responsividade e callback;
- parâmetro ligado/desligado, configuração ausente, timeout, circuit breaker, índice parcial e cota;
- lupa tradicional funcionando com provider, Redis/fila e PostgreSQL ai indisponíveis;
- ações administrativas, auditoria, métricas e ausência de segredos.

## Critérios de conclusão

Considere concluído somente quando:

- a lupa existente não tiver regressão nem dependência nova;
- o fluxo comum não chamar chat;
- toda sugestão tiver evidência literal ou houver abstenção;
- AuthZ e Filiais forem aplicadas antes de retornar dados sensíveis;
- dados dinâmicos vierem do legado no momento da resposta;
- reindexação reutilizar hashes e consumo estiver limitado/observável;
- o painel for desacoplado e reutilizável;
- provisionamento, backup, restauração, rollout e rollback estiverem documentados;
- testes relevantes passarem.

## Saída esperada do SpecKit

Produza especificação executável e plano, não apenas análise. Liste requisitos funcionais/não funcionais, contratos e payloads, migrations/tabelas/índices, serviços/jobs/endpoints/componentes atuais a alterar após inspecioná-los, fases, riscos, critérios de aceite e matriz de testes.

Não mande investigar Delphi. Não substitua a lupa. Não implemente chat no caminho padrão. Não simplifique segurança, economia, evidência, abstenção ou topologia decidida.
