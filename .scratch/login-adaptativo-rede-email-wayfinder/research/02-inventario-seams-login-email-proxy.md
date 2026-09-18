# Inventário dos seams de login, e-mail, sessão e proxy

## Resumo

O Laravel já possui credenciais separadas do cadastro legado, validação de acesso à Filial, lockout, rate limiting, sessão Redis, auditoria estruturada, SMTP configurável, filas Horizon e testes de login. O desafio adaptativo, porém, não pode ser acrescentado apenas à interface: hoje o `LoginService` mistura validação primária e criação da sessão, e o fluxo de senha expirada repete o mesmo acoplamento.

Os principais gaps são: inexistência de login pendente/desafio persistido; ausência de endereço de autenticação preenchido e verificado no cadastro atual; falta de mailer próprio para segurança; auditoria de login apenas em logs; nenhuma política de rede confiável; e confiança irrestrita em proxies, enquanto o Nginx versionado não declara a cadeia de IP real.

## Fluxo atual de autenticação

- As rotas públicas são `GET /login`, `POST /login` e `POST /login/password-expired`; logout invalida a sessão e regenera o token CSRF. [routes/web.php](../../../laravel/backend/routes/web.php#L211) · [LoginController.php](../../../laravel/backend/app/Http/Controllers/Auth/LoginController.php#L43)
- `LoginRequest` recebe `identifier`, `password` e `filial_codigo`. O identificador encontra `usuarios_auth` por login ou e-mail, sem diferenciar caixa. [LoginRequest.php](../../../laravel/backend/app/Http/Requests/LoginRequest.php#L18) · [UsuarioAuthLookup.php](../../../laravel/backend/app/Services/Auth/UsuarioAuthLookup.php#L14)
- `LoginService::attempt` valida credencial, bloqueio, estado, Usuário, Filial e expiração. No mesmo método ele limpa tentativas, atualiza `last_login_at`, chama `auth()->login()`, regenera a sessão, grava a Filial ativa e audita sucesso. Esse é o seam principal a separar em “credencial primária válida” e “concluir autenticação”. [LoginService.php](../../../laravel/backend/app/Services/Auth/LoginService.php#L30)
- `updateExpiredPasswordAndLogin` atualiza a senha e também cria a sessão diretamente. O desafio externo precisa entrar após o commit da senha, sem permitir que essa rota contorne a política adaptativa. [LoginService.php](../../../laravel/backend/app/Services/Auth/LoginService.php#L118)
- O rate limiter do controller usa hash de identificador normalizado + `Request::ip()`, com padrão de 10 tentativas por 60 segundos em cache Redis. Ele é limpo assim que `LoginService::attempt` retorna sucesso; no modelo novo, sucesso primário não poderá ser confundido com sessão autenticada, e geração/reenvio/validação exigirão limites próprios. [LoginController.php](../../../laravel/backend/app/Http/Controllers/Auth/LoginController.php#L49) · [config/auth.php](../../../laravel/backend/config/auth.php#L98)
- Há também bloqueio persistido em `usuarios_auth` após cinco senhas incorretas por 15 minutos. O contador é de senha e não deve ser reutilizado implicitamente para erros do Código de Acesso por E-mail. [LoginService.php](../../../laravel/backend/app/Services/Auth/LoginService.php#L17) · [LoginService.php](../../../laravel/backend/app/Services/Auth/LoginService.php#L247)

## Identidade e endereço de e-mail

- `usuarios_auth` possui um registro por Usuário, login único, `email` nullable/único, hash de senha, estado, tokens de ativação/reset, tentativas, bloqueio e último login. Não possui `email_verified_at`, versão do endereço ou campos de desafio adaptativo. [migration de usuarios_auth](../../../laravel/backend/database/migrations/2025_03_19_000001_create_usuarios_auth_table.php#L11)
- `usuarios_auth.email` já participa da identidade de login; portanto, alterá-lo tem efeito de segurança além de entrega de mensagens. [UsuarioAuthLookup.php](../../../laravel/backend/app/Services/Auth/UsuarioAuthLookup.php#L23)
- O Cadastro de Usuários atual cria `usuarios_auth.email = null` e, nas alterações posteriores, sincroniza apenas login e senha. [UsersService.php](../../../laravel/backend/app/Services/User/UsersService.php#L680) · [UsersService.php](../../../laravel/backend/app/Services/User/UsersService.php#L756)
- A tela de cadastro administra `usuarios.email` sob o nome `email_conta`, explicitamente documentado no frontend como distinto de `usuarios_auth.email`. Ele representa uma conta de mensagens e convive com credenciais SMTP por Usuário, não uma identidade de autenticação verificada. [types.ts](../../../laravel/backend/resources/js/Pages/Cadastros/Users/types.ts#L107) · [UsersInternetSection.tsx](../../../laravel/backend/resources/js/Pages/Cadastros/Users/UsersInternetSection.tsx#L52)
- Consequência: antes do rollout em enforcement é preciso decidir a fonte autoritativa do endereço do Código de Acesso, como cadastrá-la/verificá-la, como migrar dados existentes e como impedir que a troca do endereço seja um bypass. Usar silenciosamente `usuarios.email` ou assumir que `usuarios_auth.email` já está preenchido contradiz o código observado.

## Sessão e estado pendente

- O guard `web` usa sessão e o provider customizado `usuarios`; a identidade autenticada continua sendo `usuarios.codigo`. [config/auth.php](../../../laravel/backend/config/auth.php#L18)
- Produção documenta `SESSION_DRIVER=redis`; o padrão é 120 minutos de inatividade, `expire_on_close=false`, cookie HttpOnly e SameSite Lax. `Secure` depende do ambiente. [config/session.php](../../../laravel/backend/config/session.php#L21) · [production-docker.md](../../../laravel/docs/deploy/production-docker.md#L45)
- O estado pendente ainda não existe. Ele não deve chamar `auth()->login()`, preencher `filial_ativa_*`, atualizar `last_login_at` nem registrar `login_success` antes do código correto.
- Há tabelas genéricas `sessions`, `jobs` e `failed_jobs`, mas sessões Redis são a configuração de produção e nenhuma delas modela identidade, hash, uso único, tentativas ou concorrência de um desafio. Será necessário um contrato próprio, a decidir no ticket “Decidir o modelo do desafio e do login pendente”.

## Entrega de e-mail e filas

- A aplicação substitui o `mail.manager` padrão por `App\Mail\MailManager`, preservando os transports Laravel e acrescentando chaves que podem relaxar TLS para SMTP legado. [AppServiceProvider.php](../../../laravel/backend/app/Providers/AppServiceProvider.php#L522) · [MailManager.php](../../../laravel/backend/app/Mail/MailManager.php#L17)
- O mailer global aceita SMTP, SES, Postmark, Resend, failover e outros; o padrão sem configuração é `log`. Enforcement não pode ficar ativo quando o canal efetivo apenas grava o código em log. [config/mail.php](../../../laravel/backend/config/mail.php#L17)
- O `.env.example` já documenta SMTP global e produção executa Horizon com Redis. A configuração por deploy encaixa no processo existente de `config:cache` e reinício controlado dos workers. [.env.example](../../../laravel/backend/.env.example#L214) · [production-docker.md](../../../laravel/docs/deploy/production-docker.md#L84)
- Há exemplos síncronos (`Mail::raw` para alertas e mailers fiscais) e assíncronos (`ShouldQueue` para suporte e documentos). `DocumentEmailMailable` tem três tentativas, backoff, `afterCommit` e estado durável próprio, mas é acoplado a documentos e SMTP por Filial; não deve ser reutilizado como Código de Acesso. [OperationalAlertDeliveryService.php](../../../laravel/backend/app/Application/Operations/OperationalAlertDeliveryService.php#L111) · [DocumentEmailMailable.php](../../../laravel/backend/app/Infrastructure/Mail/DocumentEmail/DocumentEmailMailable.php#L19)
- Um mailable/porta específicos de autenticação podem reutilizar o mail manager global, `Mail::fake` e os padrões de filas. A decisão ainda precisa escolher entre envio síncrono — que permite detectar falha imediata — ou dispatch assíncrono — que reduz latência, mas confirma apenas enfileiramento e exige polling/estado operacional.
- O canal de segurança deve proibir `log` e relaxamentos de `verify_peer`/nome/TLS em enforcement, ou tratar essa configuração como não pronta. Códigos, hashes e payloads completos não podem aparecer em logs, failed jobs ou telemetria.

## Rede, proxy e implantação

- O bootstrap atual usa `trustProxies(at: '*')`; tanto o rate limiter quanto auditoria e trace usam `Request::ip()`. A classificação de Rede Confiável não pode ser introduzida enquanto essa confiança ampla permanecer. [bootstrap/app.php](../../../laravel/backend/bootstrap/app.php#L91) · [LoginAuditLogger.php](../../../laravel/backend/app/Services/Auth/LoginAuditLogger.php#L18) · [AssignRequestTrace.php](../../../laravel/backend/app/Http/Middleware/AssignRequestTrace.php#L17)
- O Compose publica somente o Nginx no host e mantém PHP/Redis na bridge interna, o que é uma boa fronteira básica. [docker-compose.prod.yml](../../../laravel/docker-compose.prod.yml#L56)
- O Nginx versionado escuta HTTP, encaminha FastCGI ao PHP e não declara `real_ip_header`, `set_real_ip_from`, allowlist ou TLS. A terminação TLS e eventual proxy anterior variam por instalação e não estão expressos nesse arquivo. [default.conf](../../../laravel/docker/production/nginx/default.conf#L1)
- O contrato futuro precisa parametrizar proxies confiáveis e CIDRs sem aceitar headers do cliente, suportar IPv4/IPv6, impedir acesso direto ao origin e classificar qualquer erro como externo. O modo de observação precisa registrar a decisão sem liberar sessão com base em IP.

## Auditoria e observabilidade

- `LoginAuditLogger` grava eventos estruturados de sucesso, falha e bloqueio com identificador, Usuário, Filial, IP e user-agent, mas é best-effort: engole falha do logger fora de debug e não persiste uma trilha própria. [LoginAuditLogger.php](../../../laravel/backend/app/Services/Auth/LoginAuditLogger.php#L13)
- `AssignRequestTrace` fornece `trace_id`, método, caminho e IP e devolve o ID na resposta; é um bom correlacionador para eventos de desafio. [AssignRequestTrace.php](../../../laravel/backend/app/Http/Middleware/AssignRequestTrace.php#L17)
- Faltam eventos e retenção definidos para classificação de rede, desafio criado, envio/enfileiramento/falha, reenvio, erro, expiração, consumo, bloqueio e conclusão. Também falta decidir se a evidência será apenas log centralizado ou tabela append-only/durável.
- O logger atual grava o identificador de login em claro. O ticket de privacidade precisa decidir minimização/mascaramento e evitar que o novo fluxo amplie a exposição.

## Interface e cobertura de testes

- `Auth/Login.tsx` contém o formulário de credenciais/Filial e o formulário inline de senha expirada. Não existe página, componente ou tipo para desafio pendente, e não foi localizado teste Vitest específico da página de login. [Login.tsx](../../../laravel/backend/resources/js/Pages/Auth/Login.tsx#L68)
- `LoginTest` cobre renderização, preferência de Filial, sucesso, senha inválida, bloqueio, Filial negada, administrador, rate limit, usuário inativo e senha expirada. `LoginServiceTest`, `UsuarioAuthLookupTest` e `FilialSessaoObrigatoriaTest` oferecem seams unitários/HTTP adicionais. [LoginTest.php](../../../laravel/backend/tests/Feature/Auth/LoginTest.php#L16) · [LoginServiceTest.php](../../../laravel/backend/tests/Unit/Auth/LoginServiceTest.php#L14)
- A especificação deverá acrescentar matrizes para política desativada/observação/enforcement; rede confiável/externa/proxy inválido; endereço ausente/não verificado; envio e reenvio; concorrência/replay; expiração/tentativas; senha expirada; indisponibilidade de cache, banco, fila e SMTP; auditoria sem segredo; IPv4/IPv6; e regressão integral dos testes atuais.

## Seams recomendados para os próximos tickets

1. Separar validação primária de conclusão da sessão em um resultado tipado; ambos os caminhos de senha normal e expirada passam pelo mesmo orquestrador adaptativo.
2. Criar um resolvedor único de política/rede, alimentado por configuração validada no deploy, sem espalhar leitura de `env()` por controller ou domínio.
3. Definir repositório/serviço próprios para o login pendente e o Código de Acesso por E-mail; não reutilizar tokens de ativação/reset nem provas de operações sensíveis.
4. Definir uma porta e mailable próprios de autenticação sobre o mail manager global, com readiness explícito e contrato de falha coerente com envio síncrono ou fila.
5. Estender a auditoria por eventos e correlação, mantendo `LoginAuditLogger` como adapter de compatibilidade se útil.
6. Adicionar endpoints públicos, porém CSRF-protegidos e rate-limited, para validar/reemitir/cancelar o desafio; nunca colocar credencial ou código em query string, cookie persistente ou localStorage.

## Conflitos e decisões expostas

- **ADR-0001 ainda está Proposed e sem decisão.** Este mapa deverá alimentar sua aceitação ou substituição quando a arquitetura for fechada. [ADR-0001](../../../laravel/docs/adr/0001-auth-evolution-mfa-password-policy.md)
- **E-mail autoritativo:** `usuarios_auth.email` é identidade de login, mas não é mantido pelo cadastro; `usuarios.email` é conta de mensagens. A fonte, verificação e migração precisam de decisão explícita.
- **Entrega:** fila existente não prova entrega imediata; envio síncrono aumenta latência. Readiness e UX dependem dessa escolha.
- **Proxy:** `trustProxies('*')` contradiz usar IP como sinal de dispensa do segundo fator até a cadeia de borda ser endurecida.
- **Auditoria:** logs best-effort podem ser insuficientes para recuperação, investigação e prova de rollout.
- **Configuração:** `config:cache` favorece configuração por deploy, mas alteração de CIDRs exige novo cache/restart coordenado; o runbook deve assumir isso.

Nenhum código Laravel, migration, configuração ou infraestrutura foi alterado neste inventário.

