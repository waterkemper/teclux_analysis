# Inventário da topologia, runtime e dependências

## Escopo

Levantamento estrutural da Plataforma Laravel em `laravel/`, com foco no backend em `laravel/backend/`. A análise é estática e descreve o estado observado no checkout de 2026-09-03; não valida a configuração efetivamente usada em produção.

## Achados

### 1. Repositório e aplicação

- `laravel/` é um repositório Git aninhado e estava limpo no momento da análise; o repositório pai o acompanha como uma unidade distinta.
- A aplicação executável está em `laravel/backend/`, com entrypoint Artisan, bootstrap Laravel, configuração, rotas, banco, recursos frontend, testes e scripts próprios.
- Há somente `routes/web.php` e `routes/console.php` no diretório de rotas. O `web.php` concentra aproximadamente 160 declarações de rota e também abriga endpoints com prefixo `api/device-gateway/...` e webhooks. Fonte: [routes/web.php](../../../laravel/backend/routes/web.php), [routes/console.php](../../../laravel/backend/routes/console.php).

### 2. Runtime e stack

- O runtime declarado é PHP `^8.5` e Laravel `^13.0`.
- A camada web usa Inertia Laravel `^2.0`, React `^19.2.4`, TypeScript `^5.9.3`, Vite `^7.0.7` e Tailwind `^4.0.0`. O frontend também usa TanStack Table/Virtual, Vitest, Testing Library e Puppeteer.
- O backend incorpora Horizon para filas, Pulse, Sentry, Telescope em desenvolvimento, o Laravel AI SDK e bibliotecas fiscais NF-e/NFC-e. Fontes: [composer.json](../../../laravel/backend/composer.json#L9-L34), [package.json](../../../laravel/backend/package.json#L4-L40).

### 3. Organização interna

O diretório `app/` apresenta uma arquitetura explicitamente modularizada, com:

- `Application`: casos de uso e orquestração por contexto funcional;
- `Domain`: conceitos, regras, portas, value objects e eventos;
- `Infrastructure`: persistência, integrações e adaptadores;
- `Http`: controllers, middleware e requests;
- `Models`, `Jobs`, `Events`, `Listeners`, `Policies`, `Rules`, `Services` e `Support` como áreas transversais ou legadas.

No snapshot, foram contados aproximadamente 669 arquivos em `Application`, 588 em `Domain`, 565 em `Infrastructure`, 875 em `Http`, 121 em `Models`, 943 em `Services`, 49 em `Jobs` e 1.970 em `resources/js`. Esses números são indicadores de escala, não uma métrica de qualidade.

A presença simultânea de `Application`/`Domain`/`Infrastructure` e de um diretório muito grande `Services` é um sinal para o ticket de fronteiras arquiteturais: pode representar uma migração bem-sucedida em andamento, mas também pode esconder duas formas concorrentes de organizar casos de uso.

### 4. Bootstrap e composição da aplicação

- O bootstrap usa `Application::configure()`, registra `web.php`, `console.php` e health check `/up`.
- O middleware global registra rastreamento de requisição, Inertia, autenticação de agente, contexto de autenticação e numerosos guards de acesso por módulo.
- O CSRF é explicitamente dispensado para dois webhooks de marketplace. Proxies confiáveis estão configurados com `at: '*'`. Esses pontos não são classificados aqui como vulnerabilidade: exigem análise contextual no ticket de superfície web e integrações.

Fonte: [bootstrap/app.php](../../../laravel/backend/bootstrap/app.php#L83-L182).

### 5. Execução e implantação

- O compose de produção separa `nginx`, `php`, `redis`, `scheduler`, `horizon-default`, `horizon-heavy-reports`, `horizon-fiscal-nfe` e `horizon-fiscal-artefatos`, com healthchecks e redes/volumes dedicados.
- A separação dos grupos de Horizon por finalidade é uma boa fronteira operacional para isolar relatórios pesados e processamento fiscal.
- Os fallbacks de imagem de produção usam `teclux/nginx:latest`, `teclux/php-fpm:latest` e `redis:7-alpine`. O uso de `latest` como fallback reduz reprodutibilidade e torna mudanças de runtime potencialmente implícitas; a gravidade depende de os ambientes sempre fornecerem tags imutáveis por `TECLUX_IMAGE_*`.

Fonte: [docker-compose.prod.yml](../../../laravel/docker-compose.prod.yml#L55-L260).

### 6. Testes e documentação de desenvolvimento

- O backend possui PHPUnit 12 e uma configuração específica para PostgreSQL; o package frontend possui Vitest.
- O snapshot contém aproximadamente 1.692 arquivos em `tests/Feature`, 960 em `tests/Unit` e 683 migrations. A quantidade sugere investimento relevante em testes e evolução incremental, mas não informa cobertura, qualidade dos cenários nem execução em CI.
- A documentação de contexto e os ADRs já registram fronteiras importantes para legado, fiscal, operações e projeções de IA; a análise de conformidade entre essas decisões e o código pertence aos tickets seguintes.

## Implicações para o diagnóstico

1. A plataforma não é um Laravel monolítico convencional sem estrutura: existe uma tentativa clara de modularização por contexto e camada, com infraestrutura operacional separada.
2. A principal incerteza arquitetural não é a ausência de camadas, mas a consistência das fronteiras entre `Application`, `Domain`, `Infrastructure`, `Services`, `Support` e `Models`.
3. A concentração de rotas em um único `web.php`, incluindo endpoints de agentes e webhooks, aumenta a importância de revisar middleware, autenticação, CSRF e rate limiting por superfície.
4. O runtime declarado é atual, mas a modernidade do código não pode ser inferida apenas pelas versões: dependências, deploy, configuração e práticas de atualização precisam ser avaliados separadamente.

## Confiança

Alta para a topologia declarada e os arquivos presentes; média para conclusões de risco, pois a configuração de ambiente, o CI e o comportamento em produção não foram observados.
