# Dossiê — Busca Assistida de Produtos

## Objetivo e estado atual

Planejar uma busca comercial multissetorial, inicialmente na Consulta de Estoques e reutilizável por Orçamentos e Contratos. Recebe texto ou ditado, recupera Produtos por busca híbrida e apresenta apenas afirmações sustentadas pelo cadastro. A lupa tradicional continua independente.

Estado Laravel a preservar:

- ConsultaEstoquesController, rota estoque.consulta-estoques.index e Index.tsx;
- ConsultaEstoquesProdutoLookupModal sobre ErpTwoColumnCatalogLookupModal, com Filiais, estoque, pedidos, preços e capabilities;
- ProductFilterPanel, já usado também em Orçamentos e Contratos;
- EstoqueConsultaEstoquesModuleAccessService e capabilities de preço/comissão;
- LaravelAiSpeechTranscriber com Laravel AI Transcription; reutilizar transcrição, não o NLU experimental de Usuários;
- config/ai.php com OpenAI e text-embedding-3-small.

Cada cliente possui implantação e bases próprias. Filial é escopo operacional, não tenant. produtos.busca permanece o tsvector lexical. Não armazenar áudio, consulta ou vínculo com Cliente/Usuário. Estoque, preço e Filial não entram no embedding.

## Arquitetura

PostgreSQL 9.5 permanece autoridade. No mesmo servidor, PostgreSQL moderno com pgvector e conexão Laravel ai, porta/dados/usuário/backup/limites próprios, armazena projeções e administração de IA. Sem trigger entre bases, transação distribuída ou escrita reversa.

Geração inicial: OpenAI text-embedding-3-small, 1.536 dimensões, cosseno e HNSW; busca exata é referência de avaliação. Identidade inclui provider, modelo, dimensão e versão do normalizador. Troca cria geração paralela com ativação e rollback.

## Documento e recuperação

Indexar Produtos ativos/em linha e não bloqueados usando descrição, descrição complementar, características sem HTML e metadados comerciais úteis: marca, modelo, grupo, classe e característica. Normalização determinística, divisão por tokens, hashes por parte e precedência de fontes. Guardar trecho literal e origem como Evidência Comercial.

Conteúdo idêntico reutiliza vetor por hash/provider/modelo/dimensão. Recuperação:

1. sanitizar e normalizar;
2. resolver código, referência e código de barras exatos primeiro;
3. executar lexical no legado e semântica no pgvector;
4. fundir posições por RRF, consolidar partes por Produto e limitar candidatos;
5. revalidar elegibilidade, Filiais, disponibilidade e preço no legado;
6. limitar inicialmente duas variantes por Característica;
7. mostrar evidência literal e aderência calibrada ou abster-se.

O fluxo comum não chama chat. Não há fallback caro, scan PHP ou troca silenciosa de provider/modelo.

## Operação, cache e custo

Backfill começa com parâmetro desligado, dry-run, estimativa e aprovação. Jobs pequenos, idempotentes e pausáveis persistem sucessos por parte. Incremental por cursores e reconciliação diária remontam documentos; hash igual não chama provider.

Cache: HMAC da consulta normalizada + versão + provider + modelo + dimensão; persiste vetor/metadados por 90 dias, nunca texto. Single-flight evita cobranças duplicadas. Resultado final não é cacheado. Reserva atômica antecede indexação, consulta ou transcrição; cotas separadas e alertas administrativos em 80%, 95% e 100%.

## Segurança, administração e UX

Um único Parâmetro do Sistema habilita a capacidade. Não há nova Permissão: acesso é herdado da Consulta; preços/comissões continuam sob capabilities. Segredos/modelos ficam na configuração técnica.

A administração transversal mede por capacidade: cobertura, filas, falhas, cache, consumo, cotas, alertas, gerações, health, circuit breaker, bloqueios, limpeza e auditoria. Logs não contêm consulta, áudio, transcrição, vetor ou segredo.

UX escolhida: painel lateral contextual mantendo a Consulta visível. Texto e ditado convergem para campo editável; busca explícita e cancelável. Herda filtros e Filiais. Lista e detalhe mostram Produto, aderência, evidência/fonte, estoque e preço ao vivo. Seleção usa callback desacoplado. Abstenção, cobertura parcial e falha são estados próprios. Toda falha oferece Abrir lupa tradicional.

Feedback guarda apenas HMAC, Produtos exibidos/selecionados e sinal ajudou, não ajudou ou sugestão inadequada, sem identidade.

## Rollout e aceite

Provisionar pgvector, migrar somente conexão ai, executar dry-run e backfill aprovado, avaliação humana multissetorial, comparação HNSW/exata, ativar geração e então o parâmetro. Gates cobrem qualidade/abstenção, autorização, dados dinâmicos, orçamento, observabilidade e lupa funcionando com toda IA indisponível.

Detalhamento e rastreabilidade: [mapa](map.md) e tickets resolvidos.
