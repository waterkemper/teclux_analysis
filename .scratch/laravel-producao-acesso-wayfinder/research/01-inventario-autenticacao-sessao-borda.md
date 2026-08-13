# Relatório de pesquisa — autenticação, sessão e borda Laravel

- Ticket: .scratch/laravel-producao-acesso-wayfinder/issues/01-inventariar-autenticacao-sessao-e-borda-laravel.md
- Escopo: somente estado local/versionado do repositório; nenhuma implementação realizada.
- Data: 2026-08-04.
- Classificação: **Confirmado** é evidência direta; **Inferido** é consequência técnica; **Dúvida** depende do runtime; **Não localizado** não apareceu na busca local.

## Resumo

- **Confirmado** — O ERP autentica por sessão no guard web, usando provider próprio sobre usuarios e identidade usuarios.codigo; credenciais ficam em usuarios_auth. [config/auth.php:13-43](../../../laravel/backend/config/auth.php#L13-L43), [app/Models/Usuario.php:14-18,24-41,118-121](../../../laravel/backend/app/Models/Usuario.php#L14-L18), [app/Models/UsuarioAuth.php:12-36](../../../laravel/backend/app/Models/UsuarioAuth.php#L12-L36)
- **Confirmado** — A configuração base usa Redis para sessão, lifetime ocioso de 120 minutos, expire_on_close=false, HttpOnly=true e SameSite=Lax. [config/session.php:21-37,130-202](../../../laravel/backend/config/session.php#L21-L37), [.env.example:105-107](../../../laravel/backend/.env.example#L105-L107)
- **Confirmado** — Login regenera o ID da sessão; logout faz logout, invalidate e regenera o token CSRF. [LoginService.php:94-105](../../../laravel/backend/app/Services/Auth/LoginService.php#L94-L105), [LoginController.php:133-140](../../../laravel/backend/app/Http/Controllers/Auth/LoginController.php#L133-L140)
- **Confirmado** — O bootstrap usa trustProxies(at: '*'); no framework local isso equivale a confiar nas redes IPv4 e IPv6 inteiras e nos headers encaminhados padrão. [bootstrap/app.php:77-84](../../../laravel/backend/bootstrap/app.php#L77-L84), [TrustProxies.php:52-85,120-146](../../../laravel/backend/vendor/laravel/framework/src/Illuminate/Http/Middleware/TrustProxies.php#L52-L85)
- **Confirmado** — O Nginx de produção versionado escuta HTTP na porta 80 do container e não contém TLS, allowlist de IP ou headers de segurança. [docker/production/nginx/default.conf:1-28](../../../laravel/docker/production/nginx/default.conf#L1-L28)
- **Confirmado** — O Compose publica essa porta como NGINX_PORT, 8080 por padrão; TLS e o domínio HTTPS são externos ou não localizados. [docker-compose.prod.yml:50-66](../../../laravel/docker-compose.prod.yml#L50-L66), [docs/deploy/production-docker.md:36-54,137-146](../../../laravel/docs/deploy/production-docker.md#L36-L54)
- **Confirmado** — Login rate-limits por identificador + IP observado; há também bloqueio por conta após cinco falhas por quinze minutos. [LoginController.php:43-74,180-185](../../../laravel/backend/app/Http/Controllers/Auth/LoginController.php#L43-L74), [LoginService.php:15-18,246-269](../../../laravel/backend/app/Services/Auth/LoginService.php#L15-L18)
- **Confirmado** — A auditoria atual registra eventos estruturados de login, trace ID, IP e User-Agent; não há evidência de auditoria persistente do ciclo de vida de sessões web. [LoginAuditLogger.php:11-62](../../../laravel/backend/app/Services/Auth/LoginAuditLogger.php#L11-L62), [AssignRequestTrace.php:23-39](../../../laravel/backend/app/Http/Middleware/AssignRequestTrace.php#L23-L39)

## Autenticação e rotas

- **Confirmado** — O guard web é session e aponta para o provider usuarios; AppServiceProvider registra legacy_usuario_eloquent. [config/auth.php:25-43](../../../laravel/backend/config/auth.php#L25-L43), [AppServiceProvider.php:638-656](../../../laravel/backend/app/Providers/AppServiceProvider.php#L638-L656)
- **Confirmado** — O fluxo valida credencial, conta, Usuário ativo, acesso à Filial e expiração de senha antes de gravar usuario e filial_ativa na sessão. [LoginService.php:29-111](../../../laravel/backend/app/Services/Auth/LoginService.php#L29-L111)
- **Confirmado** — GET/POST login, alteração de senha expirada e POST logout são declarados antes dos grupos autenticados. [routes/web.php:188-191](../../../laravel/backend/routes/web.php#L188-L191)
- **Confirmado** — Administração de operações está em auth; o shell ERP segue em auth + auth.context, com gates/policies e middlewares de módulo. [routes/web.php:236-337](../../../laravel/backend/routes/web.php#L236-L337), [bootstrap/app.php:92-153](../../../laravel/backend/bootstrap/app.php#L92-L153)
- **Inferido** — Como a rota web é registrada por withRouting(web: ...), o grupo web do framework fornece EncryptCookies, AddQueuedCookies, StartSession, ShareErrorsFromSession e PreventRequestForgery. [bootstrap/app.php:71-76](../../../laravel/backend/bootstrap/app.php#L71-L76), [Middleware.php:482-493](../../../laravel/backend/vendor/laravel/framework/src/Illuminate/Foundation/Configuration/Middleware.php#L482-L493)
- **Confirmado** — Não foi localizada rota/serviço para encerrar todas as sessões, revogar por dispositivo, revogar ao trocar senha ou invalidar sessões do Usuário inativado.
- **Confirmado** — A migração cria tabela sessions, mas o driver declarado para produção é Redis; a fonte efetiva de sessão, portanto, não é essa tabela quando o ambiente segue o exemplo. [0001_create_users_table.php:24-37](../../../laravel/backend/database/migrations/0001_01_01_000000_create_users_table.php#L24-L37), [config/session.php:21-22](../../../laravel/backend/config/session.php#L21-L22)
- **Confirmado** — Existe cookie separado de preferência de Filial com aproximadamente 400 dias e até 20 identificadores; ele não é autenticação. [LoginFilialPreferenceStore.php:10-21,79-112](../../../laravel/backend/app/Services/Auth/LoginFilialPreferenceStore.php#L10-L112)
- **Dúvida** — O .env local observado é APP_ENV=local, APP_DEBUG=false, APP_URL=http://localhost:8080, SESSION_DRIVER=redis e CACHE/QUEUE Redis; seus valores não representam a produção. [backend/.env:2-24](../../../laravel/backend/.env#L2-L24)
- **Não localizado** — MFA, SSO, política de sessão absoluta, limites por dispositivo ou sessão concorrente. O ADR correspondente ainda é proposta/stub. [ADR 0001:7-22](../../../laravel/docs/adr/0001-auth-evolution-mfa-password-policy.md#L7-L22)

## Cookies e CSRF

- **Confirmado** — SESSION_LIFETIME tem default 120 minutos de inatividade e expire_on_close tem default false. [config/session.php:25-37](../../../laravel/backend/config/session.php#L25-L37)
- **Confirmado** — Cookie de sessão usa secure vindo de SESSION_SECURE_COOKIE, HttpOnly=true e SameSite=Lax; SESSION_ENCRYPT é false por default. [config/session.php:41-50,161-202](../../../laravel/backend/config/session.php#L41-L50)
- **Confirmado** — PreventRequestForgery adiciona XSRF-TOKEN e aceita _token, X-CSRF-TOKEN ou X-XSRF-TOKEN; requests que não sejam leitura precisam passar origem/token. [PreventRequestForgery.php:100-111,143-195,219-251](../../../laravel/backend/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/PreventRequestForgery.php#L100-L111)
- **Confirmado** — As únicas exceções CSRF no bootstrap são os webhooks Mercado Livre e Magalu. [bootstrap/app.php:81-84](../../../laravel/backend/bootstrap/app.php#L81-L84)
- **Dúvida** — Valores efetivos de SESSION_SECURE_COOKIE, SESSION_DOMAIN, SESSION_LIFETIME, SESSION_SAME_SITE e SESSION_ENCRYPT em produção não estão versionados.
- **Inferido** — O objetivo de uso prolongado exigirá decisão explícita sobre renovação deslizante, limite absoluto e reautenticação; aumentar indefinidamente o lifetime não resolve revogação nem risco.

## Webhooks e superfícies públicas

- **Confirmado** — Os dois webhooks são públicos, recebem throttle:60,1 e estão fora do CSRF. [routes/web.php:228-234](../../../laravel/backend/routes/web.php#L228-L234)
- **Confirmado** — Mercado Livre valida topic/user_id/resource; Magalu extrai código e seller_id/user_id e registra o payload. [MarketplaceWebhookController.php:23-65,71-102](../../../laravel/backend/app/Http/Controllers/Marketplace/MarketplaceWebhookController.php#L23-L102), [MagaluWebhookController.php:16-33](../../../laravel/backend/app/Http/Controllers/Marketplace/MagaluWebhookController.php#L16-L33)
- **Não localizado** — Não foi encontrada assinatura/HMAC, segredo de webhook ou allowlist local de IP para autenticar o remetente.
- **Dúvida** — Pode existir autenticação no provedor externo ou na borda do cliente, mas ela não está no repositório.
- **Confirmado** — A rota de health /up é configurada no bootstrap. [bootstrap/app.php:71-76](../../../laravel/backend/bootstrap/app.php#L71-L76)
- **Não localizado** — Não há classificação documentada das superfícies /up, device gateway, administração, shell ERP, suporte e webhooks por rede pública/VPN.

## IP, proxy e rate limiting

- **Confirmado** — trustProxies(at: '*') não restringe proxy por CIDR. A implementação local transforma '*' em 0.0.0.0/0 e ::/0 e usa X-Forwarded-For/Host/Port/Proto/Prefix/AWS ELB. [bootstrap/app.php:77-80](../../../laravel/backend/bootstrap/app.php#L77-L80), [TrustProxies.php:22-27,67-85,114-146](../../../laravel/backend/vendor/laravel/framework/src/Illuminate/Http/Middleware/TrustProxies.php#L22-L27)
- **Confirmado** — Request::ip() alimenta rate limit de login, ajuda, autorização sensível, auditoria de login e client_ip do trace. [LoginController.php:49-62](../../../laravel/backend/app/Http/Controllers/Auth/LoginController.php#L49-L62), [AppServiceProvider.php:977-1013](../../../laravel/backend/app/Providers/AppServiceProvider.php#L977-L1013)
- **Inferido** — Se o único caminho for um edge confiável que remove/recria X-Forwarded-For, Request::ip() pode representar o cliente original; se houver acesso direto ou proxy que repasse header do cliente, controles por IP podem ser burlados.
- **Não localizado** — CIDRs confiáveis, firewall, security group, WAF, VPN, allowlist no Nginx, regra de bloqueio de acesso direto ou contrato de sanitização de headers.
- **Dúvida** — O IP real, a cadeia de proxies e a possibilidade de alcançar diretamente o Nginx não podem ser determinados pelo repositório.

## Nginx, Docker e deploy

- **Confirmado** — Nginx de produção faz front controller, passa PHP a php:9000, permite 50 MB, usa fastcgi timeout até 600s e bloqueia arquivos ocultos; não configura HTTPS, redirect, HSTS, CSP, XFO, XCTO, allowlist ou autenticação de borda. [default.conf:1-28](../../../laravel/docker/production/nginx/default.conf#L1-L28)
- **Confirmado** — Compose publica NGINX_PORT:80 (8080 default); PHP e Redis permanecem apenas na rede bridge app-net. [docker-compose.prod.yml:50-92,179-197](../../../laravel/docker-compose.prod.yml#L50-L92)
- **Confirmado** — Deploy injeta backend/.env via env_file, executa migrate --force, config:cache, view:cache, preflight Horizon e reinicia workers/scheduler. [docker-compose.prod.yml:1-32](../../../laravel/docker-compose.prod.yml#L1-L32), [deploy.sh:45-116](../../../laravel/deploy/deploy.sh#L45-L116)
- **Inferido** — TLS/domínio HTTPS dependem de componente externo ao stack versionado. APP_URL=https recomendado não prova que a conexão do cliente até o edge seja HTTPS.
- **Dúvida** — Não há evidência sobre proxy/TLS no cliente, certificados, HSTS, DNS, firewall, exposição real de NGINX_PORT ou proteção do host Docker.
- **Não localizado** — Kubernetes, load balancer gerenciado, Nginx externo, Caddy, Traefik, VPN, firewall ou pipeline que publique TLS.

## Observabilidade e Auditoria

- **Confirmado** — AssignRequestTrace registra trace_id, método, path e client_ip no Context e devolve X-Trace-Id. [AssignRequestTrace.php:13-39](../../../laravel/backend/app/Http/Middleware/AssignRequestTrace.php#L13-L39)
- **Confirmado** — LoginAuditLogger registra sucesso, falha e bloqueio com identificador, usuario_codigo, filial_codigo, IP e User-Agent, sem senha. [LoginAuditLogger.php:11-62](../../../laravel/backend/app/Services/Auth/LoginAuditLogger.php#L11-L62)
- **Confirmado** — Logs aceitam arquivo diário, stderr, syslog, Papertrail e Slack; Compose de produção força LOG_CHANNEL=stderr nos serviços. [config/logging.php:27-30,59-112](../../../laravel/backend/config/logging.php#L27-L112), [docker-compose.prod.yml:75-78,104-106](../../../laravel/docker-compose.prod.yml#L75-L78)
- **Confirmado** — Slow query pode omitir SQL/bindings; .env.example orienta SQL completo falso em produção. [config/observability.php:13-20](../../../laravel/backend/config/observability.php#L13-L20), [.env.example:20-23](../../../laravel/backend/.env.example#L20-L23)
- **Confirmado** — Pulse só autoriza administradores; Telescope não é registrado em produção; Horizon tem gate falso. [AppServiceProvider.php:658-660,920-938](../../../laravel/backend/app/Providers/AppServiceProvider.php#L658-L660), [TelescopeServiceProvider.php:81-90](../../../laravel/backend/app/Providers/TelescopeServiceProvider.php#L81-L90), [HorizonServiceProvider.php:23-31](../../../laravel/backend/app/Providers/HorizonServiceProvider.php#L23-L31)
- **Não localizado** — Retenção/alerta/centralização dos logs, auditoria de sessão, detecção de mudança de rede e runbook de sequestro de sessão.

## Riscos

1. trustProxies('*') sem contrato de edge pode fazer IP e headers encaminhados serem manipuláveis; isso afeta rate limit, auditoria e futura allowlist.
2. O artefato Nginx fala HTTP; sem TLS externo obrigatório, cookie/sessão ficam expostos no caminho.
3. Lifetime ocioso de 120 minutos pode exigir login frequente e não há limite absoluto/revogação concorrente formal.
4. Logout só invalida a sessão corrente; não há prova de revogação remota, por Usuário ou por dispositivo.
5. Webhooks públicos têm CSRF excluído, rate limit e validação de payload, mas não têm assinatura/HMAC localizada.
6. Logs de login não formam inventário de sessões e dependem de coleta externa no ambiente.
7. Configuração real de produção e runtime cache não estão disponíveis; o .env local não é evidência do cliente.

## Decisões para os tickets seguintes

### 04 — superfícies públicas e rede confiável

- Classificar login, logout, /up, webhooks, device gateway, shell ERP, suporte e administração por exposição.
- Decidir VPN site-to-site, VPN por Usuário, zero trust/túnel ou combinação; definir suporte, trabalho remoto, Filiais e falha da VPN.
- Decidir se rede é pré-condição, sinal de risco ou ambos, mantendo autenticação, Permissões e Autorizações.
- Exigir assinatura/segredo de webhook e/ou controle no edge antes de deixá-los públicos.

### 05 — política de sessão continuada

- Definir idle timeout, duração absoluta, renovação deslizante, fechamento do navegador e troca de rede.
- Definir reautenticação/MFA para operações sensíveis e quando a sessão será considerada de risco.
- Definir sessões concorrentes/dispositivos, encerramento de uma sessão, todas as sessões, troca de senha e Usuário inativado.
- Decidir se Redis receberá metadados de dispositivo/IP/último uso e qual Auditoria será persistida.
- Definir mensagens para expiração/revogação e manter separado o cookie persistente de preferência de Filial.

### 07 — confiança no proxy e controles de borda

- Definir proxies/CIDRs confiáveis e impedir acesso direto ao container/Nginx.
- Definir terminação TLS, sanitização de X-Forwarded-For/Proto/Host/Port e fonte autorizada do IP real.
- Definir allowlist/denylist no edge, VPN/firewall/WAF, health checks e resposta fora do perímetro.
- Definir cookies seguros, redirect HTTPS, HSTS, headers de segurança e testes de regressão.
- Definir coleta, retenção, alertas e correlação de logs; detectar IP inesperado e bloqueios.
- Definir contrato de deploy para .env, config:cache, certificados, rollback e validação pós-deploy.

## Conclusão

A base local cobre autenticação por sessão, CSRF, rate limit, rotação no login e logs de login. Ainda não cobre as decisões de sessão longa segura nem de confiança em rede/IP. O bloqueio arquitetural principal é externo ao Laravel: sem especificar e restringir o proxy/edge, Request::ip() não pode fundamentar sozinho VPN, allowlist ou avaliação de risco.

