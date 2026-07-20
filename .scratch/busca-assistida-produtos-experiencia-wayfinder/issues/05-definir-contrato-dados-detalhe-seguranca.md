# Definir dados, carregamento e segurança do detalhe

Type: task
Status: resolved
Blocked by: 01, 04

## Question

Quais fontes Laravel existentes, endpoints e DTOs devem sustentar o detalhe sob demanda; como buscar fotos, `produtos.descricaocomplementar`, características, preço e estoque sem duplicar regras; e quais contratos de sanitização, autorização, redaction, cache, falha parcial, paginação de fotos e revalidação ao vivo são obrigatórios?

## Answer

### Fatos levantados (sem sanitizador existente, sem breakdown por Filial, sem cache)

- Não existe sanitizador de HTML hoje, nem backend (`composer.lock`) nem frontend (`package.json`) — `EncodingSanitizer` trata apenas mojibake de charset, `DocumentNormalizer::literal()` só descarta tags para texto puro (não serve para renderizar HTML seguro).
- `LegacyBuscaAssistidaRevalidationRepository::revalidate()` soma estoque entre Filiais e calcula preço só para a primeira Filial da lista — não existe consulta por Filial nem uso da Filial Base.
- `BuscaAssistidaSearchController` já resolve e passa a Filial Base como `filial_ativa_codigo` da sessão (`(int) $request->session()->get('filial_ativa_codigo', 0)`) para `BuscaAssistidaSearchService::search()`, hoje usada só para checar se o recurso está habilitado — não para calcular preço.
- Autorização de fotos é um registro nomeado por contexto (`ProductPhotoAuthRegistry`, registrado em `AppServiceProvider::registerProductPhotoAuthContexts()`), um `Closure` por contexto; contextos desconhecidos são negados por padrão. `consulta_estoques` delega para `EstoqueConsultaEstoquesModuleAccessService::canAccess`.
- Não existe cache (`Cache::remember`/tags) para fotos, preço ou estoque hoje — apenas memoização em memória por requisição. O padrão de falha parcial já estabelecido no código (`ProductPhotoGalleryModal`, `ResultThumb`) é: erro **inline, escopado à própria seção**, com mensagem e ação explícita "Tentar novamente" — nunca um erro global de tela inteira.
- `produtos.descricaocomplementar` já é lido em `LegacyBuscaAssistidaProductSourceRepository`, mas hoje só alimenta `ProductSemanticDocumentBuilder`/`DocumentNormalizer`, que produzem texto puro para embeddings — o detalhe precisa de uma leitura própria do HTML bruto (após `EncodingSanitizer::forOutput()`, antes do sanitizador de markup ainda a ser adicionado).

### Decisões

- **Autorização**: novo contexto nomeado `busca_assistida` no `ProductPhotoAuthRegistry`, reaproveitando a mesma checagem de acesso ao módulo que `consulta_estoques` já usa (`EstoqueConsultaEstoquesModuleAccessService::canAccess`). Só Consulta de Estoques é integrado agora; cada hospedeiro futuro (Orçamentos, Contratos) registra seu próprio contexto quando adotar o painel, seguindo o mesmo padrão — sem inventar uma abstração de contexto dinâmico antes de existir um segundo consumidor real.
- **Preço**: o detalhe usa a **Filial Base** (`filial_ativa_codigo` da sessão) para calcular o Preço Efetivo, e não a primeira Filial autorizada/solicitada como a busca faz hoje — corrige a distinção que a auditoria já tinha sinalizado como pendente.
- **Estoque por Filial**: exige uma consulta nova no repositório legado, agrupada por Filial (a `revalidate()` atual não serve, pois soma), escopada às Filiais autorizadas efetivas do usuário — mesma autorização já usada na busca, sem mecanismo novo de autorização.
- **Sanitização**: adicionar `league/html-sanitizer` no backend, com allow-list de tags seguras, sanitizando antes de responder. O frontend nunca sanitiza — apenas renderiza o HTML já limpo pelo servidor. Nenhuma sanitização client-side (ex. DOMPurify) é introduzida.
- **Formato do endpoint**: um endpoint novo e combinado devolve descrição complementar sanitizada + características + preço permitido (via Filial Base) + estoque por Filial numa única resposta — uma autorização, uma consulta legada, sem duplicar regras. Fotos continuam no endpoint/infraestrutura existente (`ProductPhotoService`, `useProductPhotos`, `ProductPhotoGalleryModal`), agora autorizado também pelo contexto `busca_assistida`.
- **Falha parcial**: duas unidades de falha independentes — galeria de fotos (endpoint próprio) e o bloco combinado (descrição/características/preço/estoque, endpoint novo) — cada uma com erro inline e "Tentar novamente" próprio, seguindo o padrão já existente no código; nenhuma delas derruba a outra nem o painel inteiro.
- **Cache**: nenhum cache novo para fotos, preço ou estoque — mantém o padrão zero-cache já existente para esses dados, consistente com a exigência de nunca confiar no cartão antigo e sempre revalidar ao vivo na abertura do detalhe.
- **Paginação de fotos**: nenhuma mudança — reaproveita o endpoint existente como está hoje (parâmetro `limit` opcional, sem paginação por página/cursor).
