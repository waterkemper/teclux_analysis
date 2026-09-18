# Mapear fronteiras arquiteturais e padrões de projeto

Type: research
Status: resolved
Blocked by:

## Question

Quais fronteiras existem entre HTTP, Application, Domain, Infrastructure, Models, Services e Support, e quais padrões de projeto são realmente usados (ports/adapters, commands, DTOs, policies, repositories, events, anti-corruption layer, read models etc.)? Onde a estrutura é profunda e coerente, e onde há vazamento de responsabilidades, duplicação ou acoplamento transversal?

## Answer

### Escopo e método

Foi feita leitura estática do backend em laravel/backend/app, rotas, providers, documentação arquitetural e frontend em resources/js. A análise inclui contagem de arquivos/linhas e busca de imports entre namespaces; imports são evidência de acoplamento direcional, não prova de que todo caminho de execução use cada dependência. Não houve implementação.

Snapshot aproximado:

| Área | Arquivos | Linhas |
|---|---:|---:|
| Http | 875 | 85.221 |
| Application | 669 | 80.183 |
| Domain | 588 | 33.666 |
| Infrastructure | 565 | 114.177 |
| Models | 121 | 1.863 |
| Services | 943 | 137.221 |
| Support | 453 | 40.892 |
| Jobs | 49 | 3.041 |
| Events | 1 | 17 |
| Listeners | 2 | 46 |

Confiança: alta para contagens e referências de arquivo/linha; média para inferências sobre intenção arquitetural.

### Fronteiras efetivas

laravel/backend/docs/CONVENTIONS.md define a intenção HTTP -> Application/Services -> Domain/Infrastructure: controllers finos, FormRequests para entrada, Services para lógica/orquestração e Infrastructure para detalhes transversais. O código real é híbrido e não acíclico:

* Http importa diretamente Application, Domain, Infrastructure, Models, Services e Support: 2.379 imports App\... em 588 arquivos.
* Application importa 690 referências de Infrastructure, 221 de Models, 251 de Services, 108 de Support, 17 de Jobs e 3 de Http.
* Services, a maior camada, importa 1.023 referências de Infrastructure, 655 de Domain, 624 de Support, 359 de Models, 216 de Application, 20 de Http e 20 de Jobs.
* Domain tem 55 imports cruzados em 27 arquivos: 24 para Infrastructure, 14 para Application, 7 para Services, 6 para Support e 4 para Models.
* Support importa Application, Domain, Infrastructure, Models, Services e Http, funcionando como segundo catch-all.

A fronteira mais nítida é a persistência legada/cloud: Infrastructure/Persistence/Legacy e Infrastructure/Persistence/Cloud concentram PostgreSQL legado, SQLite de testes, esquemas físicos e integrações. É uma boa fronteira contra Delphi/PostgreSQL, mas não é respeitada uniformemente.

### Padrões reais e pontos fortes

1. **Ports and adapters / composition root.** Providers fazem bindings explícitos em app/Providers/AppServiceProvider.php:467-513, :536-620 e :660-707; o provider fiscal amplia o padrão em app/Providers/FiscalServiceProvider.php:142-179. Há portas para fiscal, transferência, marketplace, documentos, conferência, frete e venda perdida.

2. **Anti-corruption layer parcial.** Infrastructure/Persistence/Legacy/Vendas/LegacyOrcamentoRepository.php:11-95 concentra tabelas físicas, sequência PostgreSQL, fallback SQLite e revisão. LegacyClienteRepository.php:14-100 concentra SQL parametrizado, sequenciamento e colunas legadas. Legacy*, Cloud*, mappers, adapters e LegacySafe* evidenciam tradução consciente. O padrão é rompido quando Domain, Services ou controllers acessam detalhes físicos.

3. **Commands, queries, handlers e DTOs.** Application/Shared/VendaPerdida/VendaPerdidaCaptureEngine.php:21-148 orquestra transação, idempotência, filial, revisão otimista, invariantes, persistência e auditoria. Application/Vendas/Orcamentos/GerarContratoOrcamentoCommand.php:31-163 separa comando, pré-condições, autorização e transação. Há final readonly classes, fromArray()/toArray(), snapshots e value objects. A dependência em repositórios concretos e facades impede uma aplicação totalmente orientada a portas.

4. **Policies, middleware e autorização contextual.** Há 94 policies registradas no AppServiceProvider.php:1010-1060, aliases de middleware por módulo em bootstrap/app.php:104-177, auth.context, Gate em controllers e authorize() em FormRequests. Isso oferece defesa em profundidade para usuário, módulo e Filial, mas repete decisões em middleware, request, controller e Service.

5. **Idempotência, revisão, auditoria, outbox e read models.** VendaPerdidaCaptureEngine implementa replay por request ID, revisão e auditoria. Infrastructure/Persistence/Cloud/Vendas/Contratos/CloudContratoExecucaoLogisticaRepository.php:18-74 usa idempotency key e revisão. Services/Vendas/Contratos/Outbox/DatabaseContratoCadastroOutbox.php:13-31 é um outbox real, embora localizado em Services. Application/Operations/OperationalHistoryService.php:22-195 constrói histórico, detalhe, exportação com allowlist e tombstone; OperationalTaskRegistry.php:15-114 é catálogo de tarefas/projeção.

6. **Jobs com garantias operacionais.** Jobs/Fiscal/ProcessarAutorizacaoNfeJob.php:16-50 transporta somente IDs, define fila/timeout/tentativas e delega ao handler, sem XML/PFX no payload. SyncMarketplaceCategoriesJob.php:16-59 usa unicidade, timeout e encadeamento. A consistência não é global.

7. **Frontend moderno.** resources/js/app.tsx:5-44 usa Inertia 2, resolução dinâmica de páginas, React e sincronização de CSRF. Há 1.967 arquivos TS/TSX, aproximadamente 1.301 páginas, 680 componentes e 370 arquivos de teste.

### Vazamentos e anti-padrões

1. **Services é uma camada de compatibilidade sem contrato único.** Com 943 arquivos/137 mil linhas, reúne negócio, dados, autorização, HTTP, serialização e Jobs. Services/VoiceAssistant/Registry/Handlers/UsersVoiceHandler.php:7-23 importa FormRequests HTTP, Models, Illuminate/Http/Request, Gate e validação; :61-88 executa autorização, validação e gravação. Services/Vendas/Orcamentos/OrcamentoImpressaoPayloadBuilder.php:7-18 e :403-454 mistura repositórios, sanitização, logs, download HTTP de fotos e payload de apresentação.

2. **Domain contém orquestração e infraestrutura concreta.** Domain/Marketplace/Services/Orders/MarketplaceOrderImportService.php:7-34 injeta cliente Mercado Livre concreto, repositórios legados/marketplace, notificações, MarketplaceCredentialService, DB e logging; usa queries em :185-206 e notificações em :332 e :379. MagaluOrderImportService.php repete a forma. É integração/importação em namespace Domain, não domínio puro.

3. **Direção invertida no Domain.** Domain/ContasPagar/Ports/DocumentoPagFinancialDraftByOriginPort.php:5-7 importa DTO de Application; Domain/Vendas/Financiamento/FinancingEngine.php:7-17 depende de App\Services legado e delega engine estática em :40-96; Domain/Cadastros/ConferenciaCadastro/ConferenceParameterReader.php:7 importa ParameterService. Outros arquivos Domain usam DB, Config, Illuminate/Query/Builder, Models e sanitizadores de Infrastructure.

4. **Application não é ainda uma fronteira de dependência invertida.** GerarContratoOrcamentoCommand.php:14-26 e ConfirmBatchPaymentCommand.php:7-20 importam repositórios legados concretos, Models, Services, Support, DB, Jobs e validação. OperationalHistoryService.php:7-13 acessa tabelas/modelos e sanitização. São bons orquestradores, mas ainda acoplados a persistência/framework; ports são opt-in.

5. **HTTP não é somente transporte.** Http/Controllers/Estoque/ProdutoCaracteristicaController.php tem 2.734 linhas e importa FormRequests, repositórios, Models, Services e Support (:53-104). Http/Controllers/Cadastros/ClientesController.php tem 1.828 linhas, faz DB::table() em :100, :266, :317, :712 e posteriores, e renderiza Inertia em :254. RelatorioEntregasController.php:7-42 recebe cerca de 14 colaboradores, incluindo Cloud persistence, Job, Model, Services, Gate e Storage. Em contraste, VendaPerdidaCaptureController.php:7-28 delega o fluxo em :30-132 e é um exemplo de controller fino.

6. **FormRequests acumulam autorização, contexto, leitura e mutação.** Http/Requests/Cadastros/UpdateClienteRequest.php:7-29 combina Gate, filial, Model, Services e repositório; :31-58 consulta DB::table('clientes') para preservar observacoes. StoreAtributoProdutoRequest.php:7-64 chama repositório em after() para codificar itens. A preservação server-side de campo não autorizado é positiva, mas a classe deixa de ser apenas contrato de entrada.

7. **Support é acoplador transversal.** Sanitizadores, exceções, PDF, helpers de filial, traits e contratos coexistem e são importados por Domain, Services, Application, Infrastructure e Http. Domain/Vendas/FreightQuote/FreightQuoteOptionNormalizer.php:5-44 importa EncodingSanitizer. O risco é qualquer utilitário se tornar dependência permitida em todas as direções.

8. **Models misturam Active Record, identidade e subjects de política.** Models/Usuario.php:14-120 encapsula tabela legada, autenticação customizada, cache e flags administrativas. Há também Models/User.php:11-48, outra representação de identidade, e objetos leves como ClienteCadastro. OperationalExecution.php:11-36 usa Active Record e protected $guarded = [] em :15, convenção permissiva que merece revisão de segurança. Não há regra global clara separando entidade de domínio, record de persistência e sujeito de autorização.

9. **Rotas e autorização estão centralizadas e repetidas.** routes/web.php tem aproximadamente 4.291 linhas e 203 imports, com grupos por módulo e middleware; a organização funcional é boa, mas o arquivo é ponto de acoplamento. Controllers, FormRequests, policies e Services também decidem autorização. Webhooks têm exceções CSRF em bootstrap/app.php:93-96 e throttling em routes/web.php:250-255; a decisão é explícita, porém espalhada.

10. **Eventos não são fronteira consolidada.** Há apenas 1 Event e 2 Listeners. Events/DeviceGateway/DeviceGatewayJobAvailable.php:7-21 existe, mas Listeners/DeviceGateway/BroadcastDeviceGatewayJobAvailable.php:10-25 declara Reverb/Echo como pendente. Em Jobs/Operations/RunRegisteredOperationalTask.php:42-107, o executor é resolvido por registro e Bus::dispatchSync(new $class) em :83-91: um service locator dinâmico que reduz rastreabilidade estática.

### Frontend e fronteira backend/frontend

O frontend é atual e modular, mas o contrato de transporte está distribuído:

* resources/js/app.tsx:17-30 resolve páginas por glob e atualiza CSRF.
* resources/js/hooks/useCadastroConferenciaGate.ts:9-67 mantém endpoints hard-coded, constrói XSRF a partir de cookie e usa fetch manual.
* resources/js/Pages/Admin/Operations/Retention.tsx:2, :31-40 e :70-99 usa Axios, nomes de rotas dinâmicos, preview, idempotency key e confirmação de purge. É boa UX operacional, mas acopla a página a detalhes HTTP.
* resources/js/Pages/Cadastros/Clientes/Cadastro.tsx:123-136 mantém URLs de lookup/store localmente; outras páginas usam Inertia router ou Axios, e há axios.delete em vendas.

Existem pelo menos três clientes de transporte no browser — Inertia, Axios e fetch — com convenções próprias de URL/CSRF/erro. Não é vulnerabilidade por si só, mas cria risco de inconsistência de contratos e tratamento de erros; tipos de página não garantem contrato centralizado de resposta/erro.

### Profundidade por fatia

* **Mais profunda/coerente:** Fiscal, Operations Console, Romaneios, Venda Perdida e partes de Marketplace, com Commands/Handlers, DTOs/value objects, ports, adapters, repositórios, idempotência, auditoria, sanitização e jobs.
* **Intermediária:** contratos, transferências e documentos; providers e ports existem, mas adapters/outbox vivem parcialmente em Services e autorização é distribuída.
* **Mais fraca/legada:** Clientes, Produto/Características, Pedido de Compra e impressões/relatórios; controllers grandes, SQL em HTTP, Services monolíticos e payload builders com I/O.
* **Transversal:** o legado está relativamente isolado nos adapters, mas Domain -> Infrastructure, Application -> Models/DB e Services -> Http/Jobs quebram a direção. A plataforma é moderna por ilhas, não por uma arquitetura global coerente.

### Conclusão

**Evidência:** arquitetura híbrida em transição. Ports/adapters, Commands/DTOs, policies, idempotência, outbox e anti-corruption layer são reais em fatias novas; Services e Support são transversais; Domain/Application/HTTP ainda vazam Infrastructure, Models, DB, Jobs e apresentação.

**Risco/impacto:** sem direção obrigatória, regra de negócio, autorização, persistência, integração e apresentação se misturam. Isso aumenta custo de testes, regressões em escopo por Filial, dificuldade de substituir legado e dificuldade de auditar onde uma decisão de segurança ocorre.

**Recomendação para trabalhos posteriores:** preservar Infrastructure/Persistence/Legacy e Cloud como anti-corruption boundary; consolidar uma fatia por vez em HTTP -> Application -> Domain ports -> Infrastructure; deixar Services como compatibilidade temporária; definir política de dependências verificável; separar Support por contexto; e estabelecer contrato de transporte frontend/backend. Não fazer migração big-bang.

**Confiança:** alta nos vazamentos demonstrados pelos imports e exemplos; média na classificação de modernidade, pois execução e configuração também influenciam segurança e operação.
