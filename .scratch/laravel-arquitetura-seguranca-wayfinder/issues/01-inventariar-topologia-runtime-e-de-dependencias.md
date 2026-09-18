# Inventariar topologia, runtime e dependências da Plataforma Laravel

Type: research
Status: resolved
Assignee: Codex
Blocked by:

## Question

Qual é a estrutura efetiva do projeto Laravel — aplicações, camadas, módulos, entrypoints, runtime PHP/JS, bancos, filas, serviços externos, containers, dependências diretas e ferramentas — e quais sinais de obsolescência, acoplamento ou divergência entre documentação e execução devem orientar o restante do diagnóstico?

## Answer

### Escopo e metodo

Inventario estatico do checkout observado em 2026-09-03. Foram lidos codigo-fonte, manifests, configuracoes, Docker Compose/Dockerfiles, scripts de deploy, testes e documentacao. Nao foi executada aplicacao, migracao, teste destrutivo, pentest ou validacao de producao. As contagens abaixo sao indicadores de escala do snapshot, nao metricas de qualidade.

### Resumo executivo

- `laravel/` e um repositorio Git aninhado exposto neste workspace como junction para `C:\\teclux_cloud`; `laravel/backend` aponta para `C:\\teclux_cloud\\backend`. Isso cria uma dependencia de topologia local/operacional que deve ser explicitada para build, CI e deploy.
- O backend e um monolito modular Laravel 13/PHP 8.5, com Inertia/React 19/TypeScript/Vite/Tailwind, PostgreSQL legado como dependencia principal, uma conexao PostgreSQL separada para IA, Redis e Horizon.
- A arquitetura alvo esta claramente expressa em `Application`, `Domain` e `Infrastructure`, mas a implementacao ainda combina esses limites com um `Services` muito grande, acesso direto a DB em controllers e dependencias cruzadas. A modernizacao parece incremental, nao concluida.
- A operacao de producao separa NGINX, PHP-FPM, Redis, scheduler e quatro grupos Horizon. Ha uma divergencia importante: o script de deploy inicia/reinicia apenas os workers default/heavy e o scheduler, nao os workers fiscais declarados no compose.
- Os maiores sinais de obsolescencia ou divergencia sao: PHP host 8.2 contra requisito 8.5; documentacao WSL que ainda cita ^8.3; `web.php` monolitico apesar do blueprint modular; docs de servicos de producao incompletas; CI visivel limitado a publicar imagens; imagens `latest` como fallback; e dois caminhos operacionais para workers (Horizon e `queue:work` legado).

### 1. Topologia e entrypoints

A raiz `laravel/` contem README, contexto, ADRs, especificacoes, contratos, `modules/`, Docker e `backend/`. O backend possui `app/`, `bootstrap/`, `config/`, `database/`, `public/`, `resources/`, `routes/`, `tests/`, scripts e artefatos de docs. O README raiz descreve a migracao incremental do ERP Delphi para Laravel/Inertia/React ([laravel/README.md:1-17]).

Entrypoints observados:

- `backend/public/index.php:6-20`: autoload Composer, carrega `bootstrap/app.php` e trata a requisicao HTTP.
- `backend/artisan`: entrypoint CLI Laravel.
- `backend/bootstrap/app.php:83-103`: configura `web.php`, `console.php`, health check `/up`, proxies confiaveis, CSRF exceptions de dois webhooks, trace de requisicao e Inertia.
- `backend/bootstrap/app.php:104-177`: registra aliases de dezenas de middlewares de acesso contextual, agente e modulos.
- `backend/routes/web.php`: unico arquivo HTTP principal, com 4.139 linhas e aproximadamente 1.689 ocorrencias `Route::`; contem rotas web, endpoints sob prefixo `api/device-gateway`, webhooks e superficies administrativas.
- `backend/routes/console.php:17-108`: scheduler de `operations:tick`, alertas/outbox, retencao e rotinas fiscais, incluindo execucao a cada cinco segundos em uma rotina fiscal.

A topologia documentada em `laravel/docs/architecture/erp-module-blueprint.md:41-72` recomenda arquivos de rotas por modulo e caminhos separados para Application, Domain, Infrastructure, UI, policies e testes. Nao foi encontrada uma arvore `backend/routes/modules`; a execucao efetiva continua concentrada em `web.php`. Isto e uma divergencia arquitetural verificavel, nao apenas uma preferencia de estilo.

### 2. Camadas, modulos e escala

No snapshot, as contagens aproximadas foram:

- `app/`: 4.461 arquivos.
- `app/Application`: 669; `app/Domain`: 588; `app/Infrastructure`: 565.
- `app/Http`: 875, incluindo 218 controllers, 75 middlewares e 582 requests.
- `app/Models`: 121; `app/Policies`: 94; `app/Jobs`: 49.
- `app/Services`: 943; `app/Support`: 453.
- `database/migrations`: 681 migrations principais e 2 de teste.
- `resources/js/Pages`: Admin, Auth, Cadastros, Caixa, Entregas, Estoque, Financeiro, Fiscal, Interlojas, Vendas, Marketplace, configuracoes e outros.

Os modulos de dominio mais visiveis na UI/controllers incluem Caixa, Entregas, Estoque, Interlojas, Fiscal, Financeiro, Vendas, Marketplace, Administracao e Device Gateway. Em paralelo, `laravel/modules/` contem schemas, SQL, prompts e contratos de `caixa`, `entregas`, `estoque` e `interlojas`. Esses artefatos sao montados somente como leitura em `/var/www/modules` por `docker-compose.yml:7-12,30-35`; nao sao namespaces Composer nem modulos PHP carregados diretamente.

Evidencias de fronteira em transicao:

- 171 controllers importam `App\\Services`; 68 importam `App\\Application`; 115 importam `App\\Infrastructure`; 46 importam `App\\Domain`.
- 154 arquivos de Application importam Services; 277 importam Infrastructure; 280 importam Domain.
- `app/Http/Controllers/Vendas/OrcamentosController.php:7-52,61-85` combina Application, Infrastructure/Persistence/Legacy, Services, Support e DB facade, com muitas dependencias no construtor.
- Ha uso direto de DB em controllers, por exemplo `Auth/LoginController.php:152-160`, `Admin/BuscaAssistida/BuscaAssistidaAdminController.php:44,86,159`, `Entregas/CadastroRomaneiosOperacoesController.php:68,173` e `Vendas/OrcamentosController.php:396,767,884`.
- `app/Infrastructure/Persistence/Legacy` tem aproximadamente 354 arquivos, incluindo Estoque, Vendas, Cadastros e Interlojas; isso confirma que o legado esta sendo encapsulado, mas ainda e uma parte substancial da arquitetura.
- `app/Providers/AppServiceProvider.php` tem 1.281 linhas e concentra bindings, factories, listeners, gates, policies, guards, rate limiters e guardas de comandos destrutivos ([AppServiceProvider.php:815-1198]). E um ponto de composicao valido, mas tambem um acoplamento central de alto raio de impacto.
- O binding global de `ContratoCoberturaFiscalGate` para `MockContratoCoberturaFiscalGate` em `AppServiceProvider.php:1033` merece verificacao por ambiente. Existe uma protecao explicita contra adapter fiscal fake em producao em `AppServiceProvider.php:1325-1348`, mas ela nao cobre esse mock de contrato.

Padroes positivos identificaveis: ports/adapters para fiscal, marketplace, storage e freight; FormRequests; Policies/Gates; handlers/commands em Application; jobs, outbox, idempotencia e auditoria em varios fluxos. O risco nao e falta de padroes, mas coexistencia de dois estilos sem uma regra de dependencia observavel.

### 3. Runtime PHP/JS e dependencias

`backend/composer.json:8-23` declara PHP `^8.5`, Laravel `^13.0`, Inertia Laravel 2, Horizon 5, Pulse 1, Sentry, Browsershot, Symfony HTML Sanitizer e bibliotecas NFe/NFCe. O lock observado fixa Laravel 13.25.0, Horizon 5.48.1, Pulse 1.7.2, Sentry Laravel 4.24.0, Browsershot 5.2.3, PHPUnit 12.5.14 e pacotes NFePHP correspondentes.

`backend/package.json:4-40` declara React 19.2.4, Inertia React 2.3.18, TypeScript 5.9, Vite 7, Tailwind 4, Vitest 3, VitePress e Puppeteer. `vite.config.js:1-43` usa entradas Laravel/Vite, React, Tailwind e chunks manuais; `tsconfig.json:1-24` usa `strict: true`, `noEmit`, JSX React e alias `@/*`. Ha uma separacao razoavelmente moderna no frontend, embora `axios` esteja em devDependencies e o repositorio mantenha `backend/node_modules`, caches VitePress e `vendor` no workspace local.

Divergencias de runtime:

- PHP CLI do host observado: 8.2.21; Composer exige ^8.5. Os Dockerfiles usam PHP 8.5 e `backend/AGENTS.md:187-195` determina que Artisan/PHPUnit rodem dentro do container.
- `docs/architecture/windows-wsl-setup.md:105-118` ainda orienta PHP WSL compativel com ^8.3, enquanto Composer e Docker exigem 8.5.
- `docs/architecture/local-environment-setup.md:45-65` mostra comandos host como `php artisan key:generate` e `php artisan migrate`, em conflito com a regra operacional do AGENTS de nunca usar PHP host.
- `backend/composer.json:48-63` tem scripts setup/dev/test que instalam dependencias, fazem migrate e iniciam queue/Pail/Vite; o script `dev` mistura processo PHP em container e Vite no host.
- Ha `package-lock.json` completo em `backend/`, mas tambem um `laravel/package-lock.json` de 97 bytes, sinal de artefato raiz stale ou de duas expectativas de workspace.

### 4. Banco, cache e filas

O banco principal e PostgreSQL: `config/database.php:95-125` define a conexao `pgsql` e a conexao `ai`, com defaults distintos. Nao ha PostgreSQL no Compose; o ambiente local usa `host.docker.internal` ([backend/.env:10-13], [backend/.env.example:56-61]), portanto o backend depende de um banco externo ao stack Docker. `database/migrations/2025_03_18_000001_create_legacy_erp_tables_for_sqlite.php:10-19` confirma que o schema legado de producao ja existe e que a migration cria somente tabelas minimas para testes SQLite. Isso e uma fronteira anticorrupcao real, mas aumenta o risco operacional de drift entre schema legado e migrations Laravel.

Pontos de atencao do banco:

- `DB_SSLMODE` default `prefer` em `config/database.php:105-110` deixa a decisao de criptografia dependente do ambiente.
- `docs/operations/legacy-database-safety.md:7-20,87-105` bloqueia migrate:fresh/refresh/reset/db:wipe para PostgreSQL quando `PREVENT_DB_DESTRUCTIVE_COMMANDS` esta ativo; e uma salvaguarda importante.
- O compose local publica permissao ampla em storage/cache e nao declara banco; reproducao de ambiente depende de credenciais e disponibilidade externas.

Cache e filas usam Redis:

- `config/cache.php:18-39,96-100` usa Redis por padrao, com conexao de cache separada.
- `config/queue.php:67-83` define filas Redis default e `redis-heavy`, retry default 150 e heavy 660 segundos.
- `config/session.php:21,172-202` usa Redis por padrao, com `secure` dependente de env, `http_only=true` e `same_site=lax`.
- Compose usa `redis:7-alpine`, mas nao configura senha, TLS nem volume de persistencia em `docker-compose.yml:70-79` e `docker-compose.prod.yml:249-259`. Em producao, substituir o container pode perder jobs/sessoes pendentes; a gravidade depende da topologia externa de Redis, nao observada aqui.
- A documentacao de runtime recomenda retry heavy 720 em `docs/architecture/runtime-and-local-development.md:46-55`, enquanto o default de config e 660 e `.env.example:116-120` cita 1080. Ha divergencia que deve ser resolvida junto com timeout real dos workers.

A producao separa `horizon-default`, `horizon-heavy-reports`, `horizon-fiscal-nfe` e `horizon-fiscal-artefatos` ([docker-compose.prod.yml:101-224]). O overlay `docker-compose.legacy-workers.yml:2-58` oferece um segundo caminho com `queue:work`, evidenciando compatibilidade operacional legada e maior complexidade de suporte.

### 5. Integracoes e servicos externos

As integracoes principais estao adaptadas em Infrastructure:

- Mercado Livre e Magalu: `app/Infrastructure/Marketplace/MercadoLivre/HttpMercadoLivreApiClient.php:216-327` e `Magalu/HttpMagaluApiClient.php:164-245`, com base URL configuravel, bearer/token e timeout.
- Fiscal/SEFAZ: `app/Infrastructure/Fiscal/NfePhp/NfePhpFiscalGateway.php:61+`, com portas para autorizacao, consulta, XML e renderizacao, e dependencias de certificado.
- S3/object storage: `S3AttachmentsClientFactory.php:15-53` e `S3FiscalArtifactObjectStorage.php:18-47,130-160`; artefatos fiscais sao tratados como versionados/imutaveis e exigem VersionId.
- Freight quote: `FreightQuoteApiClient.php:23-68` valida allowlist de host/sufixo, timeout e erros de conexao; e um bom sinal de defesa contra endpoint arbitrario/SSRF.
- E-mail/Slack/Postmark/Resend/SES ficam em `config/services.php:17-35`; Sentry, fiscal, marketplace e freight possuem configuracoes dedicadas.
- Browsershot/Puppeteer usa Chromium do sistema no Docker ([docker/php/Dockerfile:5-30], [docker/production/Dockerfile:7-76]); isso e uma dependencia operacional adicional para PDFs/imagens.

A direcao de adapters e ports e adequada para isolar fornecedores. O inventario nao valida rotacao de tokens/certificados, contratos de webhook, limites de rate, disponibilidade dos fornecedores ou secret manager.

### 6. Containers, deploy e observabilidade

Desenvolvimento:

- `docker-compose.yml:1-86` tem NGINX, PHP-FPM e Redis; monta backend e especificacoes/modules/scripts como read-only.
- O PHP local usa PHP 8.5, extensoes PostgreSQL, SOAP, GD, pcntl e Redis ([docker/php/Dockerfile:1-30]).
- O comando de desenvolvimento faz `chmod -R 0777` em views/storage/cache e forca APP_DEBUG true ([docker-compose.yml:25-68]); aceitavel apenas como isolamento local, mas perigoso se promovido por engano.
- `docker-compose.workers.yml` e `docker-compose.legacy-workers.yml` adicionam workers opcionais e alternativos, aumentando a matriz de execucao.

Producao:

- `docker/production/Dockerfile:7-87` faz build frontend, instala Composer sem dev, gera autoload authoritative, monta imagem PHP-FPM e NGINX.
- `docker/production/entrypoint-php.sh:1-27` limpa `packages.php` e `services.php`, limpa route cache e usa permissao 1777 em views. O workaround, combinado ao volume persistente de `bootstrap/cache` documentado em `docs/deploy/production-docker.md:84-92,113-128`, indica acoplamento entre artefatos compilados e estado persistente de release.
- `docker-compose.prod.yml:55-267` declara oito servicos, mas usa `latest` como fallback para imagens Teclux. Sem tags explicitas por release, o runtime nao e plenamente reprodutivel.
- `deploy/deploy.ps1:42-63` sobe inicialmente apenas redis/php/nginx; `deploy/deploy.ps1:129-156` trata default/heavy e scheduler. Nao ha start/restart equivalente para `horizon-fiscal-nfe` e `horizon-fiscal-artefatos`, embora eles estejam declarados no compose. Este e o gap operacional mais concreto encontrado.
- `docs/deploy/production-docker.md:158-167` tambem lista apenas nginx/php/redis/horizon-default/horizon-heavy-reports/scheduler, omitindo os dois workers fiscais.

Observabilidade inclui Pulse, Telescope, Horizon e Sentry. `TelescopeServiceProvider.php:47-89` restringe detalhes sensiveis fora do local e exige admin para visualizar; `HorizonServiceProvider.php:11-31` nega dashboard Horizon por padrao. Isso e positivo, mas nao substitui auditoria de logs, PII e retencao.

### 7. CI, testes e documentacao

Ha PHPUnit/Vitest e uma suite extensa no snapshot (aproximadamente 2.819 arquivos de teste, 683 migrations), incluindo configuracao SQLite em `phpunit.xml:1-46` e uma suite PostgreSQL dedicada em `phpunit.postgres.xml:1-30`. A existencia dos testes nao prova cobertura nem execucao.

O unico workflow visivel em `.github/workflows/docker-publish.yml` faz checkout, Buildx, login GHCR e build/push das imagens. Nao demonstra gate de PHPUnit, Vitest, Pint, analise estatica, Composer audit, npm audit, SBOM, scanner de imagem ou assinatura de artefato. O risco aqui e de processo/supply chain, nao uma vulnerabilidade demonstrada no codigo.

A documentacao e rica (README, CONTEXT, ADRs, architecture, deploy, operations), mas ha sinais de drift: runtime WSL ^8.3, comandos host em setup, blueprint de rotas nao refletido na topologia, tabela de servicos sem fiscal e retry heavy divergente.

### 8. Priorizacao para as investigacoes seguintes

1. Alta: reconciliar o caminho de deploy dos workers fiscais com o compose e validar health/observabilidade por grupo.
2. Alta: definir matriz canonica de runtime PHP 8.5/Docker e remover orientacoes host ou ^8.3 conflitantes.
3. Alta: revisar superficie de `web.php`, especialmente device gateway, webhooks, CSRF exceptions, rate limits, proxies e contexto de filial.
4. Alta: esclarecer dependencias permitidas entre Application, Domain, Infrastructure, Services e controllers; medir vazamentos e escolher fronteiras de modulo.
5. Media: formalizar contrato operacional do PostgreSQL legado, SSL, migrations additive-only e estrategia de Redis (auth/TLS/persistencia/HA).
6. Media: alinhar docs, compose, deploy e retry/timeout; eliminar fallback `latest` e artefatos stale.
7. Media: completar gates de CI para testes, qualidade, vulnerabilidades e proveniencia das imagens.
8. Condicional: verificar em producao o binding de mock fiscal, flags de debug, cookies secure e valores reais de secret manager.

### Confianca e limites

Alta para caminhos, manifests, topologia declarada e divergencias textuais. Media para impacto operacional de Redis, deploy e configuracoes, porque o ambiente de producao/CI externo nao foi observado. Nenhuma vulnerabilidade foi declarada apenas por configuracao local; os itens de seguranca devem ser confirmados nos tickets especificos.

Nenhum arquivo de codigo, dependencia, container ou configuracao de runtime foi alterado nesta subinvestigacao.

A Plataforma Laravel é uma aplicação modular em `laravel/backend/`, com Laravel 13/PHP 8.5, Inertia/React/TypeScript/Vite/Tailwind no frontend, PostgreSQL legado/Delphi, Redis/Horizon e grupos de workers separados para padrão, relatórios pesados e fiscal. A estrutura explicita `Application`, `Domain` e `Infrastructure`, mas também mantém áreas extensas de `Services`, `Support` e `Models`; a coerência dessas fronteiras é a próxima questão arquitetural, não uma conclusão deste inventário.

Foram identificados como pontos de atenção a concentração de aproximadamente 160 rotas em `web.php` — incluindo endpoints de agente e webhooks — e os fallbacks `latest` nas imagens do compose de produção. O primeiro exige auditoria de superfície e controles; o segundo reduz reprodutibilidade quando tags explícitas não forem sempre fornecidas. O relatório de evidências está em [Inventário da topologia, runtime e dependências](../research/01-topologia-runtime-dependencias.md).
