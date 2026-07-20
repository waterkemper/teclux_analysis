# Prompt SpecKit — Evolução da Experiência da Busca Assistida de Produtos

Crie uma especificação e um plano de implementação completos para evoluir, no Laravel já existente, a **Busca Assistida de Produtos**: de seleção única imediata para multisseleção controlada, com detalhe comercial rico (galeria, descrição sanitizada, características, preço e estoque por Filial), preservando tudo o que já foi decidido em [09-speckit-prompt.md](09-speckit-prompt.md) (recuperação híbrida, embeddings, cache, orçamento de tokens, topologia pgvector) — **não reabra essas decisões**.

## Regra de investigação

Você tem acesso somente ao Laravel atual. Inspecione-o detalhadamente — `BuscaAssistidaPanel`, `BuscaAssistidaTrigger`, `BuscaAssistidaSearchService`, `BuscaAssistidaSearchController`, `ProductPhotoService`, `ProductPhotoAuthRegistry`, `ProductPhotoGalleryModal`, `ConsultaEstoquesIndex` e seu `ProductFilterPanel` — e trate-o como ponto real de partida. **Não procure, não solicite e não dependa de Delphi**. Todo contrato necessário está neste prompt.

## Estado atual e o que reaproveitar sem alteração

O MVP já está em produção: `BuscaAssistidaTrigger`/`BuscaAssistidaPanel` integrados à Consulta de Estoques, recebendo URLs, Filiais efetivas, filtros de Produto e capabilities por props — o painel não importa a Consulta de Estoques, seam correto, preserve-o.

Reaproveite sem modificar: shell lateral e Trigger; endpoints de busca/ditado/feedback; captura de voz e transcritor com orçamento e privacidade; recuperação híbrida com evidência e revalidação; `ProductPhotoService`, o endpoint de fotos, `useProductPhotos` e `ProductPhotoGalleryModal` (inclusive sua convenção de `aria-modal`/foco preso, já usada em dezenas de modais do projeto); capabilities e resolução de Filiais da Consulta; a regra `item_produto.codigo` e a invalidação (`dirty`) já existentes na Consulta.

## Lacunas obrigatórias a fechar

- Botão "Ditar" textual sem máquina de estados explícita nem confirmação antes de buscar.
- Seleção única, imediata, que fecha o painel sozinho e não preserva escolhas anteriores.
- `currentSelection` e `renderFilterSlot` declarados no tipo e nunca usados.
- DTO da resposta de busca divergente do tipo TypeScript declarado (`contexto.filial/evidencia` exigido pelo tipo, mas a API entrega os campos na raiz) — normalize um único DTO coerente.
- `BuscaAssistidaSearchController` valida o campo `product` do request mas não o repassa ao serviço de busca hoje — corrija esse repasse (bug pré-existente encontrado na auditoria, não uma decisão de design).
- Nenhum detalhe rico, nenhuma sanitização de HTML, nenhuma quebra de estoque por Filial.

## Máquina de estados do microfone

Substitua o botão "Ditar" textual por esta máquina de estados explícita:

`ready → recording → processing_transcription → review_transcript → searching → results`

Ramificações recuperáveis retornam a `ready` ou `review_transcript`; fechar produz `closed`; cancelar não fecha.

- Botão circular alternável: em repouso, ícone de microfone com `aria-label`/tooltip "Iniciar gravação"; em `recording`, vermelho, pulsa suavemente, ícone de parada, "Gravando mm:ss" ao lado, `aria-pressed`, região viva anuncia início/fim sem narrar cada segundo — nunca depende só de cor. Segundo clique para; aviso aos 50s; parada automática aos 60s; backend mantém limite de 5 MB.
- Após parar: spinner "Processando áudio…" com "Cancelar processamento" via `AbortController` + id de geração; cancelamento e respostas tardias nunca alteram a consulta.
- Texto vazio recebe a transcrição; texto existente recebe espaço + transcrição; snapshot restaurável em cancelamento/falha.
- Transcrição editável com confirmação inline "Deseja buscar?" ("Buscar agora" / "Corrigir texto"); só "Buscar agora" dispara a busca.
- Esc por camadas: em gravação cancela a captura; em processamento aborta a transcrição; ambos mantêm o painel aberto; nos demais estados fecha. X/overlay encerram recorder, tracks, timers, AbortControllers e gerações antes de fechar.
- Falhas (sem suporte a MediaRecorder/MIME, permissão negada, áudio vazio, cota, falha de transcrição) mostram mensagem específica, preservam texto, nunca iniciam busca nem abrem a lupa sozinhas.

## Multisseleção e contrato com o hospedeiro

O painel opera **sempre em modo multisseleção** — checkbox em cada cartão de resultado, sem alternância de modo. A seleção é um conjunto à parte da lista de resultados, chaveado por `produto`, exibido como faixa/chips persistente ("N selecionados") com remoção individual e "Limpar seleção"; uma nova busca ou refinamento **nunca** limpa a seleção implicitamente. Limite de 15 seleções simultâneas, constante fixa no painel (não configurável por hospedeiro nesta entrega).

Substitua `onSelect` (um callback por clique em cartão) por:

```
onApply: (selections: BuscaAssistidaSelection[]) => void
```

Disparado **só** ao clicar "Aplicar seleção" — marcar/desmarcar checkbox nunca chama o hospedeiro. O painel não se fecha sozinho, nem ao Aplicar; fechar continua sendo decisão do hospedeiro/usuário. Amplie `currentSelection` para `BuscaAssistidaSelection[]`: o hospedeiro passa, ao abrir, os produtos já presentes nos filtros atuais (de qualquer origem), e o painel pré-marca esses itens na faixa de seleção — Aplicar é um **full-sync**, não um merge. Mantenha `renderFilterSlot` declarado, sem uso nesta entrega.

Adapte `ConsultaEstoquesIndex`: ao Aplicar, substitua exatamente as linhas `{ tab: 'item_produto', field: 'codigo', op: 'eq' }` existentes em `productRules` (qualquer origem — lupa tradicional ou aplicação anterior da Busca Assistida) pelo conjunto atual do painel, encadeadas por `with_next: 'or'`; todas as demais linhas/abas permanecem intocadas. Isso resolve deduplicação e remoção por construção — não implemente lógica de dedup separada. Seleção vazia + Aplicar é válida e limpa todas as linhas; Aplicar fica sempre habilitado, mesmo com zero selecionados. Nenhuma revalidação extra ocorre ao Aplicar — o código do produto é identificador estável, a busca já revalida no legado, e o Gerar da Consulta sempre roda uma consulta fresca; Gerar continua ação explícita e separada, não altere seu comportamento. Extraia a reconciliação das linhas como função pura testável isoladamente (ex. `syncItemProdutoCodigoRules(rules, selections)`), em vez de misturá-la ao componente de página.

A lupa tradicional continua sobrescrevendo por índice de linha (`itemProdutoLookupLine`) sem alteração — convive com o full-sync porque `currentSelection` reflete o estado real das linhas, de qualquer origem.

## Leiaute de resultados e detalhe

"Ver mais detalhes" abre um **modal centralizado sobreposto** à lista de resultados (mesma linguagem de `ProductPhotoGalleryModal`, já usada em outras telas) — a lista fica congelada atrás de um backdrop; fechar (✕, clique fora, Esc) retorna exatamente ao mesmo estado de rolagem e seleção, sem desmontar a lista por baixo, com foco devolvido ao botão "Ver mais detalhes" que abriu.

A faixa de seleção fica sempre visível acima dos resultados, com ou sem detalhe aberto. Marcar/desmarcar checkbox nunca abre o detalhe; abrir o detalhe nunca altera a seleção. Cada cartão mostra thumbnail, código, descrição, evidência, preço permitido, estoque total e as duas ações lado a lado (checkbox "Selecionar" e botão "Ver mais detalhes"), ambas alcançáveis por Tab, nenhuma aciona a outra.

O detalhe é organizado em blocos verticais, nesta ordem: galeria (foto principal + miniaturas clicáveis) → descrição complementar em HTML pré-sanitizado (com nota de que a sanitização ocorre no servidor) → características (pares chave/valor) → preço permitido em destaque → estoque por Filial (tabela Filial/Estoque/Reservado).

## Contrato de dados e segurança do detalhe

Registre um novo contexto nomeado `busca_assistida` em `ProductPhotoAuthRegistry`/`AppServiceProvider::registerProductPhotoAuthContexts()`, reaproveitando a mesma checagem que `consulta_estoques` já usa (`EstoqueConsultaEstoquesModuleAccessService::canAccess`). Autorize **só** Consulta de Estoques nesta entrega; hospedeiros futuros (Orçamentos, Contratos) registram seu próprio contexto ao adotar o painel, seguindo o mesmo padrão — não invente uma abstração de contexto dinâmico antes de existir um segundo consumidor real. Contextos não registrados são negados por padrão; preserve esse comportamento.

Preço permitido no detalhe usa a **Filial Base** (`filial_ativa_codigo` da sessão, já resolvida em `BuscaAssistidaSearchController`) — não a primeira Filial autorizada/solicitada como a busca faz hoje. Estoque por Filial exige uma consulta nova no repositório legado, agrupada por Filial (a `LegacyBuscaAssistidaRevalidationRepository::revalidate()` atual soma entre Filiais e não serve), escopada às Filiais autorizadas efetivas do usuário — mesma autorização já usada na busca, sem mecanismo novo.

Adicione `league/html-sanitizer` (ou biblioteca PHP equivalente de allow-list) ao backend; sanitize `produtos.descricaocomplementar` (lido cru, após `EncodingSanitizer::forOutput()`, distinto da leitura que hoje alimenta `ProductSemanticDocumentBuilder`/`DocumentNormalizer` para embeddings, que é lossy e não serve para render) antes de responder. O frontend nunca sanitiza — só renderiza o HTML já limpo pelo servidor.

Crie **um único endpoint novo e combinado** que devolve descrição sanitizada + características + preço (via Filial Base) + estoque por Filial numa resposta — uma autorização, uma consulta legada, sem duplicar regras. Fotos continuam no endpoint/infraestrutura existente (`GET /cadastros/produtos/{produto}/fotos?context=busca_assistida`), sem paginação nova. Formato indicativo da resposta do endpoint combinado (a refinar na implementação):

```
{
  produto, codigovisual, descricao,
  descricao_complementar_html,   // já sanitizado
  caracteristicas: [{ nome, valor }],
  preco: { valor, moeda } | null, // omitido sem capability de preço
  estoque_por_filial: [{ filial, codigo, estoque, reservado }],
  filial_base
}
```

Nenhum cache novo para fotos, preço ou estoque — mantenha o padrão zero-cache já existente; preço/estoque sempre lidos ao vivo na abertura do detalhe, nunca confiando no cartão antigo da lista de resultados.

Falha parcial: duas unidades de falha independentes — galeria de fotos (endpoint próprio) e o bloco combinado (descrição/características/preço/estoque, endpoint novo) — cada uma com erro inline escopado à própria seção e "Tentar novamente", seguindo o padrão já existente em `ProductPhotoGalleryModal`/`ResultThumb`; nenhuma derruba a outra nem o painel inteiro.

## Acessibilidade, responsividade e reuso

Mobile/celular está **fora de escopo** nesta entrega — o painel continua como `aside` de largura fixa, desktop/tablet apenas; não construa um breakpoint dedicado. O painel deve funcionar por teclado do início ao fim (voz, seleção, detalhe) sem depender de mouse, e um leitor de tela deve anunciar contagem de resultados e de selecionados. O modal de detalhe deve prender o foco e devolvê-lo ao botão de origem ao fechar, seguindo a convenção `aria-modal` já usada no projeto.

O painel deve continuar recebendo todas as URLs como props do hospedeiro (busca, ditado, feedback e agora o endpoint combinado do detalhe) — nunca importe rotas de um hospedeiro específico. `onApply(selections[])` deve manter o painel cego às regras internas de cada hospedeiro; cada hospedeiro escreve seu próprio adaptador (o de Consulta de Estoques está especificado acima).

## Contratos técnicos consolidados

**`BuscaAssistidaPanelProps` (mudanças sobre o tipo atual):**

- `currentSelection?: BuscaAssistidaSelection[]` (era um único item opcional).
- `onSelect` removido; `onApply: (selections: BuscaAssistidaSelection[]) => void` adicionado.
- Novo prop de URL para o endpoint combinado do detalhe, mesmo padrão de `searchUrl`/`transcribeUrl`/`feedbackUrl`.
- `renderFilterSlot` mantido no tipo, sem novo uso.
- Limite de seleção (15) é constante interna do painel, não um prop.

**Adaptador `ConsultaEstoquesIndex`:** `onApply` chama a função pura de reconciliação (`syncItemProdutoCodigoRules` ou equivalente) sobre `productRules`; `currentSelection` é derivado das mesmas linhas ao abrir o painel.

**Autorização:** novo contexto `busca_assistida` em `ProductPhotoAuthRegistry`, delegando para `EstoqueConsultaEstoquesModuleAccessService::canAccess`.

**Endpoint combinado do detalhe:** nova rota no mesmo grupo de middleware de `estoque.consulta_estoques.module`, autorizada pela mesma checagem, respondendo o formato indicativo acima.

## Fases de implementação

Planeje tracer bullets verificáveis:

1. DTO único coerente entre backend e TypeScript para a resposta de busca; corrigir o repasse de `product` no controller.
2. Máquina de estados de voz completa (`recording`/`processing_transcription`/`review_transcript`) com confirmação explícita.
3. Multisseleção no painel: checkboxes, faixa/chips persistente, limite de 15, `onApply`, `currentSelection` ampliado.
4. Adaptador de full-sync em `ConsultaEstoquesIndex` (função pura + integração).
5. Novo contexto de autorização `busca_assistida`; endpoint combinado do detalhe com sanitização, Filial Base e estoque por Filial.
6. Modal de detalhe (galeria + descrição + características + preço + estoque), reaproveitando a convenção de foco/`aria-modal` existente.
7. Acessibilidade fim a fim (teclado, leitor de tela, foco) e validação de reuso (props/callbacks host-agnósticos).

Cada fase deve manter a lupa tradicional e o fluxo de busca híbrida existentes funcionando sem regressão.

## Matriz mínima de testes

Backend (Feature, HTTP real, seguindo `BuscaAssistidaSearchEndpointTest.php`):

- endpoint de fotos autoriza `context=busca_assistida` para Consulta de Estoques e nega contexto não registrado;
- endpoint combinado do detalhe: autorização, HTML sanitizado (nenhum `<script>`/evento inline/URL perigosa sobrevive), preço calculado pela Filial Base independente das Filiais solicitadas na busca, estoque com quebra correta por Filial autorizada, capability de preço ausente omite o campo;
- falha isolada de uma fonte (fotos vs. bloco combinado) não derruba a outra.

Frontend (componente, seguindo a divisão já existente `BuscaAssistidaPanel.test.tsx` / `.dictation.test.tsx` / `.recovery.test.tsx` / `.a11y.test.tsx`, mais arquivos novos no mesmo padrão):

- seleção: marcar/desmarcar não fecha o painel nem chama `onApply`; limite de 15 bloqueia com mensagem; Limpar seleção; Aplicar com N itens e com zero itens dispara `onApply` com o conjunto correto; reabrir com `currentSelection` pré-marca os itens;
- detalhe: abrir/fechar preserva seleção e rolagem; foco retorna ao botão de origem; Esc fecha o modal;
- voz: transições felizes, segundo clique, auto-stop aos 60s, cancelamento em cada estado, cleanup de tracks/timers/AbortControllers, resposta obsoleta ignorada;
- acessibilidade: navegação completa por teclado sem mouse; anúncio de contagem de resultados/selecionados.

Unit:

- função pura de reconciliação (`syncItemProdutoCodigoRules`): dedup, remoção, preservação de outras linhas/abas, seleção vazia limpa tudo, convive com seleção manual prévia via lupa tradicional.

## Critérios de conclusão

Considere concluído somente quando:

- a lupa tradicional e a recuperação híbrida existentes não tiverem regressão;
- selecionar 0, 1 ou N produtos nunca fechar o painel nem chamar o hospedeiro antes de "Aplicar seleção";
- Aplicar substituir exatamente as linhas `item_produto.codigo eq` pelo conjunto atual, sem duplicar nem deixar sobras;
- nenhum HTML de descrição complementar executar script, evento inline ou URL perigosa;
- preço do detalhe refletir a Filial Base da sessão; estoque do detalhe mostrar a quebra correta por Filial;
- um hospedeiro sem o contexto `busca_assistida` (ou equivalente) registrado não conseguir carregar fotos nem detalhe;
- o painel funcionar por teclado do início ao fim;
- testes relevantes (backend Feature, frontend componente, unit da função de reconciliação) passarem.

## Saída esperada do SpecKit

Produza especificação executável e plano, não apenas análise. Liste requisitos funcionais/não funcionais, contratos e payloads, serviços/endpoints/componentes atuais a alterar após inspecioná-los, fases, riscos, critérios de aceite e matriz de testes.

Não mande investigar Delphi. Não reabra decisões de recuperação híbrida, embeddings, cache ou orçamento de tokens já fixadas em [09-speckit-prompt.md](09-speckit-prompt.md). Não substitua a lupa tradicional. Não implemente suporte a celular/viewport estreito nesta entrega. Não simplifique sanitização, autorização por contexto, Filial Base ou o modelo de full-sync decidido.
