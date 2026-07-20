# Auditar a experiência Laravel atual

Type: task
Status: resolved
Blocked by:

## Question

Qual é o contrato e o comportamento exato hoje de `BuscaAssistidaPanel`, comando de ditado/transcrição, resultados/seleção, integração com Consulta de Estoques, filtros, endpoints, DTOs, permissões, fotos e conteúdo comercial; o que já pode ser reutilizado e quais lacunas concretas impedem a experiência solicitada?

## Answer

### Superfície atual

O MVP já está integrado à Consulta de Estoques por `BuscaAssistidaTrigger` e `BuscaAssistidaPanel`. O gatilho alterna entre ícone e rótulo conforme o trilho da barra; o painel é um `aside` à direita, largura máxima `md`, com textarea, Buscar, Ditar/Parar, Cancelar, lupa tradicional e lista compacta.

O painel recebe URLs, Filiais efetivas, filtros de Produto, capabilities e callbacks. Ele não importa a Consulta de Estoques, o que é um seam correto para reuso. Porém `currentSelection` e `renderFilterSlot` estão declarados e não são consumidos, e o tipo global declara estados `detail`, `partial_coverage` e `selection_done` que a implementação local não possui.

### Voz e estados

Há captura real por `getUserMedia` + `MediaRecorder`. O áudio fica em memória, é enviado como `audio/webm`, transcrito pelo `SpeechTranscriberInterface`, limitado a 5 MB, cobrado na categoria `transcription` e não persistido/logado.

O fluxo efetivo é `ready → dictating → editing_transcript`. A busca não dispara automaticamente: o texto volta editável e o usuário precisa clicar Buscar. Isso já oferece confirmação implícita, mas não a pergunta explícita solicitada.

Lacunas:

- botão textual “Ditar/Parar”, sem ícone de microfone;
- não existe estado separado `processing_transcription`; após parar, continua visualmente em `dictating` até a resposta;
- não há pergunta/modal “Deseja buscar?”;
- fechar por X, overlay ou Esc não encerra explicitamente stream/recorder;
- transcrição não tem AbortController nem proteção de resposta obsoleta;
- ausência de detecção explícita de suporte a MediaRecorder/MIME;
- mensagens usam `role=alert`, mas gravação/processamento não têm região de status dedicada;
- Cancelar acumula responsabilidades de limpar, interromper e voltar ao início.

### Busca e filtros

`BuscaAssistidaSearchRequest` aceita `query`, `filiais`, `product` e `client_request_id`. O frontend envia todos. Entretanto o controller repassa somente consulta e Filiais ao serviço: `product` é atualmente ignorado. Portanto os filtros herdados exibidos no contrato não restringem a recuperação/revalidação.

O serviço faz recuperação híbrida, revalida Produto/Estoque no legado, restringe Filiais pelo acesso, omite preço sem capability, aplica evidência/abstenção e adiciona primeira thumbnail/média. Estoque é somado nas Filiais autorizadas solicitadas; preço e `filial` usam a primeira Filial, distinção que o detalhe futuro deve tornar explícita.

`client_request_id` é devolvido no topo pelo controller, enquanto o frontend procura também em `meta.client_request_id`; a proteção local por referência funciona, mas o contrato está desalinhado. O estado `partial_coverage` aceito nos tipos cai hoje em abstenção na UI.

### Resultado e seleção

Cada cartão mostra uma foto, código visual, descrição, evidência, preço permitido, estoque e “Selecionar produto”. A seleção é única, imediata, fecha o painel e publica feedback `helped` automaticamente. Não existe seleção persistente, checkbox, contador, ação Aplicar, deduplicação nem preservação entre nova busca.

O DTO TypeScript exige `contexto.filial/evidencia`, mas a resposta atual entrega `filial`, `evidencia`, `disponibilidade` e `preco` no nível raiz. O painel tolera parte disso por fallbacks; o callback recebe um objeto que não satisfaz de fato o tipo declarado. Antes de multisseleção, o DTO precisa ser normalizado.

Na Consulta de Estoques, `onSelect` substitui ou acrescenta uma regra `item_produto.codigo eq PK` e fecha o painel. Não executa Gerar automaticamente. A multisseleção não pode simplesmente acrescentar vários `eq` sem decidir a ligação OR/agrupamento do compilador existente; deve usar o contrato nativo de regras e marcar o resultado como desatualizado.

### Fotos e detalhe comercial

A busca já usa `ProductPhotoService` para thumbnail e imagem média. Existe infraestrutura madura e reutilizável:

- endpoint genérico `GET /cadastros/produtos/{produto}/fotos?context=...`;
- contexto autorizado `consulta_estoques`, com desconhecidos negados;
- `useProductPhotos` com cache em memória por Produto/Filial/contexto, aborto e prefetch;
- `ProductPhotoGalleryModal` responsivo, foco preso, teclado, navegação entre fotos/produtos e zoom;
- viewer/carrossel menor para outros hospedeiros.

O painel não usa essa galeria e não possui endpoint de detalhe. A resposta de busca contém somente thumbnail/média.

`produtos.descricaocomplementar` já é lido para o Documento Semântico, mas é normalizado como texto para embeddings — essa projeção não serve para renderizar o HTML original. Não foi localizado sanitizador HTML dedicado no frontend/backend. `EncodingSanitizer` trata codificação, não segurança de markup. Características comerciais também não têm DTO HTML no módulo.

Logo, o detalhe precisa de read model sob demanda, autorizado e independente do embedding, que devolva HTML previamente sanitizado ou formato seguro explicitamente definido. Preço e estoque devem ser revalidados ao abrir, com as mesmas Filiais/capabilities do painel, sem confiar no cartão antigo.

### Reuso seguro e lacunas prioritárias

Reutilizar:

- shell lateral, Trigger e isolamento da lupa;
- endpoints de search/transcribe/feedback;
- captura e transcritor, orçamento e privacidade;
- recuperação/evidência/revalidação;
- `ProductPhotoService`, endpoint, hook e galeria;
- capabilities e resolução de Filiais da Consulta;
- regra `item_produto.codigo` e invalidação da Consulta.

Evoluir, sem duplicar:

1. máquina de estados de voz com `processing_transcription` e confirmação explícita;
2. DTO único coerente entre backend e TypeScript;
3. seleção controlada múltipla + callback em lote, sem feedback automático por selecionar;
4. adaptador do hospedeiro para cardinalidade e composição das regras;
5. endpoint/read model de detalhe sob demanda;
6. sanitização HTML explícita;
7. galeria incorporada ao detalhe;
8. preço/estoque ao vivo e protegidos;
9. foco, cleanup, cancelamento e stale protection completos.

As três áreas que estavam em névoa já estão cobertas pelos tickets existentes: cardinalidade/revalidação em **Definir multisseleção e contrato com o hospedeiro**; lazy loading em **Definir dados, carregamento e segurança do detalhe**; variações de leiaute em **Prototipar resultados e detalhe comercial rico**.
