# Dossiê — Evolução da Experiência da Busca Assistida de Produtos

Autocontido: quem for converter isto em prompt SpecKit não precisa investigar o Delphi, reabrir os tickets nem redescobrir decisões — tudo relevante está aqui. Complementa, sem reabrir, as decisões de [Busca Assistida de Produtos](../busca-assistida-produtos-wayfinder/dossie.md) (recuperação híbrida, embeddings, cache, orçamento de tokens).

## Objetivo e estado atual

O MVP já está em produção, integrado à Consulta de Estoques por `BuscaAssistidaTrigger` e `BuscaAssistidaPanel` (`resources/js/Components/erp/busca-assistida/`). O painel recebe URLs, Filiais efetivas, filtros de Produto e capabilities do hospedeiro por props — não importa a Consulta de Estoques, seam correto para reuso.

Reaproveitável sem alteração: shell lateral e Trigger; endpoints de busca/ditado/feedback; captura de voz e transcritor com orçamento e privacidade; recuperação híbrida com evidência e revalidação; `ProductPhotoService`, endpoint de fotos, `useProductPhotos` e `ProductPhotoGalleryModal`; capabilities e resolução de Filiais da Consulta; regra `item_produto.codigo` e invalidação da Consulta.

Lacunas que esta entrega fecha: botão "Ditar" textual sem máquina de estados explícita; seleção única e imediata sem confirmação; `currentSelection`/`renderFilterSlot` declarados e não usados; DTO da resposta de busca divergente do tipo TypeScript (`contexto.filial/evidencia` exigido, mas a API entrega campos na raiz — normalizar ao implementar); nenhum detalhe rico, nenhuma sanitização de HTML, nenhuma quebra de estoque por Filial. `BuscaAssistidaSearchController` valida o campo `product` do request mas hoje não o repassa ao serviço — filtros herdados exibidos não restringem de fato a busca; corrigir ao implementar, fora do escopo de decisão deste mapa.

## UX — máquina de estados do microfone

Estados: `ready → recording → processing_transcription → review_transcript → searching → results`, com ramificações recuperáveis voltando a `ready` ou `review_transcript`. Fechar produz `closed`; cancelar não fecha.

Um botão circular alternável: em repouso, ícone de microfone com `aria-label`/tooltip "Iniciar gravação"; em `recording`, vermelho, pulsa suavemente, ícone de parada, "Gravando mm:ss" ao lado, `aria-pressed`, região viva anuncia início/fim sem narrar cada segundo (nunca depende só de cor). Segundo clique para; aviso aos 50s, parada automática aos 60s; backend mantém limite de 5 MB.

Após parar: spinner "Processando áudio…" com "Cancelar processamento" via `AbortController` + id de geração — cancelamento e respostas tardias nunca alteram a consulta. Texto vazio recebe a transcrição; texto existente recebe espaço + transcrição, com snapshot restaurável. Transcrição editável com confirmação inline "Deseja buscar?" ("Buscar agora" / "Corrigir texto"); só "Buscar agora" dispara a busca — nunca automático.

Esc por camadas: em gravação cancela a captura; em processamento aborta a transcrição; em ambos mantém o painel aberto; nos demais estados fecha. X/overlay encerram recorder, tracks, timers, AbortControllers e gerações antes de fechar, sempre restaurando snapshot e foco no textarea. Falhas (sem suporte a MediaRecorder/MIME, permissão negada, áudio vazio, cota, falha de transcrição) mostram mensagem específica, preservam texto e nunca abrem a lupa ou iniciam busca sozinhas.

## UX — multisseleção e contrato com o hospedeiro

Painel sempre em modo multisseleção (checkbox em cada cartão, sem alternância de modo). Seleção é um conjunto à parte da lista de resultados, chaveado por `produto`, exibido como faixa/chips persistente ("N selecionados") com remoção individual e "Limpar seleção"; uma nova busca/refinamento nunca limpa a seleção implicitamente. Limite de 15 seleções simultâneas, constante fixa no painel por enquanto (não configurável por hospedeiro nesta entrega).

`onSelect` (um callback por clique em cartão) é substituído por `onApply(selections: BuscaAssistidaSelection[])`, disparado só ao clicar "Aplicar seleção" — marcar/desmarcar checkbox nunca chama o hospedeiro. O painel não se fecha sozinho nem ao Aplicar, permitindo buscar e aplicar em lote continuamente; fechar continua sendo decisão do hospedeiro/usuário. `currentSelection` é ampliado para array: o hospedeiro passa, ao abrir, os produtos já presentes nos filtros atuais (de qualquer origem), e o painel pré-marca esses itens — tornando Aplicar um full-sync, não um merge cego. `renderFilterSlot` permanece declarado e sem uso, fora do escopo desta entrega.

Adaptador da Consulta de Estoques: ao Aplicar, substitui exatamente as linhas `item_produto.codigo eq` existentes (qualquer origem) pelo conjunto atual do painel, encadeadas por `with_next: 'or'`; demais linhas/abas intocadas. Isso resolve deduplicação e remoção por construção. Seleção vazia + Aplicar é válida (limpa todas as linhas); Aplicar fica sempre habilitado. Nenhuma revalidação extra ao Aplicar — o código é identificador estável, a busca já revalida no legado, e o Gerar da Consulta sempre roda fresco; o Gerar continua ação explícita e separada. Observação preexistente preservada: a lupa tradicional continua sobrescrevendo por índice de linha (`itemProdutoLookupLine`); convive com o full-sync porque `currentSelection` reflete o estado real das linhas, de qualquer origem.

## UX — leiaute de resultados e detalhe

Protótipo com 3 variantes comparadas (asset: [`../busca-assistida-produtos-experiencia-wayfinder/prototype-resultados-detalhe/index.html`](prototype-resultados-detalhe/index.html)); variante escolhida: **modal sobreposto aos resultados** (mesma linguagem da galeria de fotos já usada em outras telas). "Ver mais detalhes" abre uma janela centralizada por cima da lista, que fica congelada atrás de um backdrop; fechar (✕, clique fora) retorna exatamente ao mesmo estado de rolagem e seleção, sem desmontar a lista.

Fixado para as três variantes e mantido na escolhida: a faixa de seleção fica sempre visível acima dos resultados, com ou sem detalhe aberto; marcar/desmarcar checkbox nunca abre o detalhe, abrir o detalhe nunca altera a seleção. Cada cartão mostra thumbnail, código, descrição, evidência, preço permitido, estoque total e as duas ações lado a lado. O detalhe é organizado em blocos verticais, nesta ordem: galeria (foto principal + miniaturas clicáveis) → descrição complementar em HTML pré-sanitizado (com nota de que a sanitização ocorre no servidor) → características (pares chave/valor) → preço permitido em destaque → estoque por Filial (tabela Filial/Estoque/Reservado).

## Segurança e dados do detalhe

Autorização: novo contexto nomeado `busca_assistida` no `ProductPhotoAuthRegistry` (`AppServiceProvider::registerProductPhotoAuthContexts()`), reaproveitando a mesma checagem que `consulta_estoques` já usa (`EstoqueConsultaEstoquesModuleAccessService::canAccess`) — só Consulta de Estoques é integrado nesta entrega; cada hospedeiro futuro (Orçamentos, Contratos) registra seu próprio contexto ao adotar o painel, seguindo o mesmo padrão. Contextos não registrados são negados por padrão — nenhum hospedeiro ainda não integrado corre risco de vazamento.

Preço permitido no detalhe usa a **Filial Base** (`filial_ativa_codigo` da sessão, já resolvida em `BuscaAssistidaSearchController`), não a primeira Filial autorizada/solicitada como a busca faz hoje — corrige a distinção que a auditoria já havia sinalizado. Estoque por Filial exige uma consulta nova no repositório legado, agrupada por Filial (`LegacyBuscaAssistidaRevalidationRepository::revalidate()` atual só soma, não serve), escopada às Filiais autorizadas efetivas — mesma autorização já usada na busca, sem mecanismo novo.

Não existe hoje nenhum sanitizador de HTML (nem backend nem frontend) — adicionar `league/html-sanitizer` no backend, allow-list de tags seguras, sanitizando antes de responder; o frontend nunca sanitiza, só renderiza o HTML já limpo pelo servidor. `produtos.descricaocomplementar` ganha uma leitura própria do HTML bruto (após `EncodingSanitizer::forOutput()`, que só trata charset) — distinta da leitura já existente que alimenta `ProductSemanticDocumentBuilder`/`DocumentNormalizer` para embeddings (essa é lossy, texto puro, não serve para render).

Um único endpoint novo e combinado devolve descrição sanitizada + características + preço (via Filial Base) + estoque por Filial numa resposta — uma autorização, uma consulta legada, sem duplicar regras. Fotos continuam no endpoint/infra existente (`GET /cadastros/produtos/{produto}/fotos?context=busca_assistida`, sem paginação nova, `limit` opcional como já é hoje). Formato indicativo da resposta do endpoint combinado, a refinar na implementação:

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

Nenhum cache novo é introduzido para fotos, preço ou estoque — mantém o padrão zero-cache já existente, consistente com nunca confiar no cartão antigo e sempre revalidar ao vivo na abertura do detalhe.

## Acessibilidade, responsividade e reuso

Mobile/celular fica fora de escopo por agora — o painel continua como `aside` de largura fixa, desktop/tablet apenas; revisitar se e quando um hospedeiro exigir. Cada cartão expõe dois controles independentes e alcançáveis por Tab (checkbox "Selecionar" e botão "Ver mais detalhes"), nenhum aciona o outro; cada chip removível na faixa de seleção tem rótulo acessível próprio ("Remover <produto> da seleção"). O modal de detalhe reaproveita a convenção de `aria-modal`/foco preso já usada em dezenas de modais do projeto (ex. `ProductPhotoGalleryModal`): Esc fecha, foco preso dentro, retorno de foco ao botão que abriu. Abrir/fechar o detalhe nunca altera a seleção nem a rolagem da lista por baixo (o detalhe é sobreposto, não substitui a lista).

Seams para outros hospedeiros: o painel recebe todas as URLs como props (busca, ditado, feedback e agora o endpoint combinado do detalhe) — nunca importa rotas de um hospedeiro específico; `onApply(selections[])` mantém o painel cego às regras internas de cada hospedeiro, cada um escreve seu próprio adaptador.

## Contratos técnicos consolidados

**`BuscaAssistidaPanelProps` (mudanças sobre o tipo atual em `types/buscaAssistida.ts`):**
- `currentSelection?: BuscaAssistidaSelection[]` (era um único item opcional) — produtos já aplicados no hospedeiro, seedam a faixa de seleção ao abrir.
- `onSelect` removido; `onApply: (selections: BuscaAssistidaSelection[]) => void` adicionado — disparado só no clique de "Aplicar seleção".
- Novo prop de URL para o endpoint combinado do detalhe (mesmo padrão de `searchUrl`/`transcribeUrl`/`feedbackUrl`, host-provided).
- `renderFilterSlot` mantido no tipo, sem novo uso.
- Limite de seleção (15) é constante interna do painel, não um prop nesta entrega.

**Adaptador Consulta de Estoques (`Index.tsx`):** `onApply` faz full-sync das linhas `tab: 'item_produto', field: 'codigo', op: 'eq'` em `productRules`, substituindo-as pelo conjunto recebido (encadeadas por `with_next: 'or'`), preservando todas as demais linhas/abas; `currentSelection` é derivado das mesmas linhas ao abrir o painel.

**Autorização de fotos/detalhe:** novo contexto `busca_assistida` registrado em `AppServiceProvider::registerProductPhotoAuthContexts()`, delegando para `EstoqueConsultaEstoquesModuleAccessService::canAccess`.

**Endpoint combinado do detalhe:** um novo endpoint (rota a definir no mesmo grupo de `estoque.consulta_estoques.module`), autorizado pela mesma checagem acima, respondendo o formato indicativo da seção anterior.

## Critérios de aceite

- Ditar mostra estados explícitos (`recording`→`processing_transcription`→`review_transcript`) com confirmação antes de qualquer busca; nenhuma busca dispara sem clique em "Buscar agora".
- Selecionar 0, 1 ou N produtos nunca fecha o painel nem chama o hospedeiro antes de "Aplicar seleção"; seleção sobrevive a uma nova busca/refinamento.
- Reabrir o painel com filtros já aplicados mostra esses produtos pré-marcados na faixa de seleção.
- Aplicar seleção substitui exatamente as linhas `item_produto.codigo eq` pelo conjunto atual, sem duplicar nem deixar sobras; seleção vazia limpa todas.
- "Ver mais detalhes" abre modal sobreposto sem alterar seleção nem rolagem; fechar retorna foco ao botão de origem.
- HTML de descrição complementar nunca executa script, evento inline ou URL perigosa.
- Preço do detalhe reflete a Filial Base da sessão; estoque do detalhe mostra quebra correta por Filial autorizada.
- Um hospedeiro sem o contexto `busca_assistida` (ou equivalente) registrado não consegue carregar fotos nem detalhe.
- Painel funciona por teclado do início ao fim (voz, seleção, detalhe) sem depender de mouse.

## Estados de erro

Voz: sem suporte a MediaRecorder/MIME, permissão negada, áudio vazio, cota excedida, falha de transcrição — cada um com mensagem específica, preserva texto, nunca inicia busca ou abre lupa sozinho. Busca: `abstention`, `partial_coverage`, `unavailable`, `recoverable_failure` (estados já existentes, preservados). Detalhe: duas unidades de falha independentes — galeria de fotos e bloco combinado (descrição/características/preço/estoque) — cada uma com erro inline escopado à própria seção e ação "Tentar novamente", nunca um erro global do modal ou do painel.

## Matriz de testes

- Voz: transições felizes, segundo clique, auto-stop aos 60s, cancelamento em cada estado, close/Esc por camada, cleanup de tracks/timers/AbortControllers, resposta obsoleta ignorada, combinação com texto existente, transcrição vazia, permissão negada, ausência de API/MIME, cota, foco e anúncios de leitor de tela.
- Seleção: marcar/desmarcar não fecha nem chama o hospedeiro; limite de 15 bloqueia com mensagem; Limpar seleção; Aplicar com N itens e com zero itens; seleção sobrevive a nova busca; reabrir painel pré-marca `currentSelection`.
- Adaptador: full-sync não duplica, remove o que foi desmarcado, preserva linhas de outras abas/campos; convive com uma seleção manual prévia via lupa tradicional.
- Detalhe: abrir/fechar preserva seleção e rolagem; foco retorna ao botão de origem; HTML sanitizado não executa `<script>`/`onerror`/`javascript:`; preço usa Filial Base mesmo com Filiais diferentes solicitadas na busca; estoque por Filial bate com os dados autorizados; falha isolada de fotos não derruba o restante do detalhe e vice-versa; contexto de autorização não registrado nega acesso.
- Acessibilidade: navegação completa por teclado (voz → resultados → seleção → detalhe → fechar) sem mouse; leitor de tela anuncia contagem de resultados e de selecionados; modal de detalhe prende foco e o devolve ao fechar.

## Fora do escopo desta entrega

- Alterar recuperação híbrida, embeddings, indexação, cache, modelo de IA ou orçamento de tokens já definidos em [Busca Assistida de Produtos](../busca-assistida-produtos-wayfinder/dossie.md).
- Substituir a lupa tradicional.
- Inserir automaticamente itens em Orçamentos ou Contratos nesta entrega; apenas o contrato reutilizável foi definido, para adoção futura por esses hospedeiros.
- Editar descrição complementar, características, fotos, preço ou estoque pelo painel.
- Suporte a celular/viewport estreito (decisão explícita: fora de escopo por agora).
- Corrigir o repasse de `product` (filtros herdados) do controller ao serviço de busca — gap encontrado na auditoria, não decidido por este mapa.

## Rastreabilidade

Mapa e tickets resolvidos: [`map.md`](map.md). Protótipo: [`prototype-resultados-detalhe/index.html`](prototype-resultados-detalhe/index.html).
