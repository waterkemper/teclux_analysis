# Avaliar autenticação, autorização e proteção de segredos

Type: research
Status: resolved
Blocked by:

## Question

Como a Plataforma Laravel implementa autenticação, sessão, reautenticação, autorização por Permissão/Autoridade, escopo por Filial, proteção contra escalação e custódia de segredos; quais controles estão presentes, ausentes, inconsistentes ou dependem apenas de convenção?

## Answer

A autenticação usa sessão Laravel sobre provider customizado para `usuarios`, credencial separada em `UsuarioAuth`, hashing, expiração de senha, rate limiting, lockout e regeneração/invalidação de sessão. A autorização é composta por middleware `auth.context`, escopo explícito de Filial, Policies, middleware `can:` e provas contextuais para operações sensíveis.

O desenho é consistente e acima de uma implementação básica, mas a conclusão de segurança ainda depende de verificar cobertura de Policies nas rotas mutáveis, autoridade de Administrador, `session.secure` por ambiente, assinatura dos webhooks sem CSRF, confiança em proxies e custódia/rotação de segredos. O cookie de preferência de login expõe identificador e Filial por longo prazo, embora seja HttpOnly e não contenha credencial. Evidências detalhadas: [Pesquisa de autenticação, autorização e segredos](../research/02-autenticacao-autorizacao-segredos.md).

## Audit update — subinvestigação 02 (2026-09-03)

### Método e limite

Auditoria estática do backend Laravel, rotas, middleware, Policies/Gates, serviços de autorização, configuração, migrations e ADRs. Não foram lidos os valores reais de laravel/backend/.env, nem validados proxy, Redis, secret manager ou produção. A confiança é alta para controles/lacunas diretamente citados e média para cobertura transversal.

### Controles presentes

- O guard web usa sessão e provider Eloquent customizado sobre usuarios; a credencial fica separada em UsuarioAuth, o provider hidrata colunas restritas e UsuarioAuth oculta password e tokens. Fontes: [config/auth.php](../../../laravel/backend/config/auth.php#L20-L43), [LegacyUsuarioEloquentUserProvider.php](../../../laravel/backend/app/Auth/LegacyUsuarioEloquentUserProvider.php#L23-L90), [UsuarioAuth.php](../../../laravel/backend/app/Models/UsuarioAuth.php#L20-L52).
- Login usa Hash::check/Hash::make, valida usuário/credencial ativos, valida acesso à Filial antes de autenticar, aplica rate limit por identificador + IP e bloqueia após cinco falhas por quinze minutos. Fontes: [LoginService.php](../../../laravel/backend/app/Services/Auth/LoginService.php#L17-L105), [LoginController.php](../../../laravel/backend/app/Http/Controllers/Auth/LoginController.php#L43-L73), [config/auth.php](../../../laravel/backend/config/auth.php#L88-L101).
- Login regenera a sessão; logout invalida sessão e regenera CSRF. O compartilhamento Inertia projeta campos explícitos, sem password. Fontes: [LoginService.php](../../../laravel/backend/app/Services/Auth/LoginService.php#L95-L105), [LoginController.php](../../../laravel/backend/app/Http/Controllers/Auth/LoginController.php#L133-L140), [HandleInertiaRequests.php](../../../laravel/backend/app/Http/Middleware/HandleInertiaRequests.php#L74-L109).
- Existem camadas auth, auth.context, middleware de módulo, Gates, Policies e FormRequests. auth.context resolve usuário/Filial ativa e rejeita a maioria das rotas sem Filial. Fontes: [bootstrap/app.php](../../../laravel/backend/bootstrap/app.php#L98-L177), [InjectAuthContext.php](../../../laravel/backend/app/Http/Middleware/InjectAuthContext.php#L104-L162), [AppServiceProvider.php](../../../laravel/backend/app/Providers/AppServiceProvider.php#L994-L1025).
- UserBranchAccessService e múltiplos casos de uso verificam Filial. Operações sensíveis têm prova vinculada a operador, Filial, módulo, ação e contexto, com TTL, lock distribuído e consumo único. Fontes: [UserBranchAccessService.php](../../../laravel/backend/app/Services/Branch/UserBranchAccessService.php#L29-L35), [SensitiveOperationAuthService.php](../../../laravel/backend/app/Services/Authorization/SensitiveOperationAuthService.php#L90-L267), [SensitiveOperationProofService.php](../../../laravel/backend/app/Services/Authorization/SensitiveOperationProofService.php#L171-L240).
- O console operacional combina capability/policy, feature flag, ambiente com hash_equals, desafio por senha/frase, token armazenado por hash e validação de ator, ambiente, ação, alvo, revisão e content hash. Fonte: [OperationalRequestAuthorizer.php](../../../laravel/backend/app/Application/Operations/OperationalRequestAuthorizer.php#L16-L35), [OperationalCommandService.php](../../../laravel/backend/app/Application/Operations/OperationalCommandService.php#L76-L141).
- Certificados fiscais custodiais usam AES-256-GCM, nonce/tag e chave mestre versionada; o provedor de diagnóstico é separado. Fonte: [AesGcmCertificateVault.php](../../../laravel/backend/app/Infrastructure/Fiscal/Certificate/AesGcmCertificateVault.php#L12-L53), [AesGcmCertificateVault.php](../../../laravel/backend/app/Infrastructure/Fiscal/Certificate/AesGcmCertificateVault.php#L107-L141), [DiagnosticEnvCertificateProvider.php](../../../laravel/backend/app/Infrastructure/Fiscal/Certificate/DiagnosticEnvCertificateProvider.php#L15-L33).
- FiscalSecretSanitizer redige senha, secret, PFX/PKCS12, chave privada, ciphertext, nonce, tag, CSC, XML e SMTP e é usado em muitos jobs/writers fiscais. Fonte: [FiscalSecretSanitizer.php](../../../laravel/backend/app/Infrastructure/Fiscal/Security/FiscalSecretSanitizer.php#L9-L147), [CertificateAuditWriter.php](../../../laravel/backend/app/Infrastructure/Fiscal/Persistence/CertificateAuditWriter.php#L35-L40).
- O ADR de autenticação interna exige bcrypt/argon2; MD5 é mantido somente para usuarios_site por compatibilidade legada. Fonte: [ADR-0006](../../../laravel/docs/adr/0006-usuarios-site-md5-legacy-password.md#L4-L20).

### Lacunas demonstráveis

#### F-01 — Alta: troca de senha expirada sem lockout/rate limit equivalente

POST /login/password-expired não declara throttle. Se current_password falha, o serviço apenas registra falha e retorna; não chama recordFailedAttempt. O fluxo normal registra tentativa e pode bloquear a conta. A nova senha exige apenas min:8 + confirmação. Fontes: [routes/web.php](../../../laravel/backend/routes/web.php#L210-L213), [LoginService.php](../../../laravel/backend/app/Services/Auth/LoginService.php#L141-L149), [LoginService.php](../../../laravel/backend/app/Services/Auth/LoginService.php#L247-L270), [LoginExpiredPasswordUpdateRequest.php](../../../laravel/backend/app/Http/Requests/LoginExpiredPasswordUpdateRequest.php#L18-L26).

Lacuna: a mesma senha é testada numa superfície com menor contenção demonstrada. MFA, complexidade corporativa e sessões concorrentes também não estão decididos; o ADR correspondente permanece Proposta. Fonte: [ADR-0001](../../../laravel/docs/adr/0001-auth-evolution-mfa-password-policy.md#L4-L17).

#### F-02 — Alta condicional: permissao_necessaria não é consumida pelo avaliador central

O catálogo declara permissao_necessaria e SensitiveOperationDefinition expõe o getter, mas a busca estática encontrou apenas configuração/getter. O caminho central delega a operatorHasRequiredProfile, que consulta perfis/flags legados, não a permissão nominal. Fontes: [config/sensitive-operation-auth.php](../../../laravel/backend/config/sensitive-operation-auth.php#L17-L40), [SensitiveOperationDefinition.php](../../../laravel/backend/app/Services/Authorization/SensitiveOperationDefinition.php#L25-L33), [SensitiveOperationCredentialValidator.php](../../../laravel/backend/app/Services/Authorization/SensitiveOperationCredentialValidator.php#L74-L101), [SensitiveOperationAuthService.php](../../../laravel/backend/app/Services/Authorization/SensitiveOperationAuthService.php#L477-L533).

Se esse campo é o contrato de Autoridade, ele pode ser metadado inerte no fluxo central. Gates adicionais podem existir por operação; o bypass precisa ser confirmado caso a caso.

#### F-03 — Média: reautorização contextual sem revogação efetiva no logout

SensitiveOperationContextCache mantém autorização por padrão por 1800 segundos. forgetAllForOperator é no-op e o logout observado não chama o cache; limpa apenas menu, sessão e CSRF. As provas individuais têm binding forte, mas o cache contextual sobrevive até o TTL. Fontes: [config/sensitive-operation-auth.php](../../../laravel/backend/config/sensitive-operation-auth.php#L5-L9), [SensitiveOperationContextCache.php](../../../laravel/backend/app/Services/Authorization/SensitiveOperationContextCache.php#L40-L68), [LoginController.php](../../../laravel/backend/app/Http/Controllers/Auth/LoginController.php#L133-L140).

Não há revogação imediata demonstrável em logout, desativação ou troca de senha. A chave inclui operador, Filial, contexto, módulo e ação, reduzindo mistura entre identidades.

#### F-04 — Média: Policies descartam alvo e não distinguem ação

UsersActionAuthorizationService descarta action e target e delega list/view/create/update ao mesmo canManageUsers. UsuarioPolicy recebe o sujeito, mas o serviço o ignora. A Policy de Filial descarta o objeto em update/delete e o serviço usa o mesmo grant para listar, criar, atualizar e excluir. Fontes: [UsersActionAuthorizationService.php](../../../laravel/backend/app/Services/Authorization/UsersActionAuthorizationService.php#L25-L59), [UsuarioPolicy.php](../../../laravel/backend/app/Policies/UsuarioPolicy.php#L29-L43), [FilialCadastroPolicy.php](../../../laravel/backend/app/Policies/Cadastros/FilialCadastroPolicy.php#L24-L40), [FiliaisCadastroAuthorizationService.php](../../../laravel/backend/app/Services/Authorization/FiliaisCadastroAuthorizationService.php#L18-L36).

Quem tem o grant recebe autorização equivalente, por essas Policies, para qualquer usuário/Filial e todas as ações modeladas. Pode ser intenção administrativa, mas não há barreira por alvo, Filial ou ação que impeça escalação horizontal dentro do módulo.

#### F-05 — Média: escopo de Filial distribuído e divergente para administradores

O login filtra filiais inativas, mas authorizedFilialCodes para administrador faz pluck de todos os códigos de filiais sem filtro de inativo. auth.context valida a Filial da sessão, mas o escopo de dados depende de cada consulta lembrar de aplicar o serviço/whereIn. Fontes: [LoginController.php](../../../laravel/backend/app/Http/Controllers/Auth/LoginController.php#L149-L156), [UserBranchAccessService.php](../../../laravel/backend/app/Services/Branch/UserBranchAccessService.php#L85-L123), [InjectAuthContext.php](../../../laravel/backend/app/Http/Middleware/InjectAuthContext.php#L135-L162).

Isso pode autorizar operações sobre Filial inativa e deixa novos endpoints sujeitos a omissão acidental. O impacto final depende da consulta e da regra de negócio.

#### F-06 — Média/Alta condicional: webhooks públicos sem autenticação criptográfica demonstrada

Os webhooks são exceções de CSRF. Mercado Livre valida formato, user_id/resource e conta; Magalu extrai identificadores, enfileira importação e retorna sucesso. Não há assinatura, HMAC, segredo ou token nesses controladores. Fontes: [bootstrap/app.php](../../../laravel/backend/bootstrap/app.php#L89-L97), [routes/web.php](../../../laravel/backend/routes/web.php#L250-L256), [MarketplaceWebhookController.php](../../../laravel/backend/app/Http/Controllers/Marketplace/MarketplaceWebhookController.php#L23-L65), [MagaluWebhookController.php](../../../laravel/backend/app/Http/Controllers/Marketplace/MagaluWebhookController.php#L16-L33).

Qualquer origem que conheça identificadores válidos pode provocar refresh/importação/enfileiramento. Proteção no proxy ou no fornecedor não é evidenciada no repositório.

#### F-07 — Média: payload Magalu é logado sem mascaramento

MagaluWebhookController grava o JSON inteiro no canal magalu_webhook, sem sanitizador. O sanitizador fiscal não é universal nem aplicado neste ponto. Fonte: [MagaluWebhookController.php](../../../laravel/backend/app/Http/Controllers/Marketplace/MagaluWebhookController.php#L16-L23), [FiscalSecretSanitizer.php](../../../laravel/backend/app/Infrastructure/Fiscal/Security/FiscalSecretSanitizer.php#L39-L147).

PII, tokens de integração ou campos futuros podem chegar ao log. Não há prova de segredo no payload atual; a lacuna é a ausência de filtragem antes da gravação.

#### F-08 — Média: confirmação/reset configurados, mas ciclo completo não comprovado

auth.password_timeout está em 10800 segundos e OperationalFormRequest lê auth.password_confirmed_at, mas a busca encontrou somente essa leitura, sem setter/rota de confirmação. O broker password_reset_tokens e colunas de activation/password_reset existem, mas não foram encontrados controllers/routes que completem o fluxo; o comando de criação inicializa tokens como null. Fontes: [config/auth.php](../../../laravel/backend/config/auth.php#L65-L85), [OperationalFormRequest.php](../../../laravel/backend/app/Http/Requests/Admin/Operations/OperationalFormRequest.php#L70-L79), [UsuarioAuth.php](../../../laravel/backend/app/Models/UsuarioAuth.php#L20-L52), [AuthCreateUserCommand.php](../../../laravel/backend/app/Console/Commands/AuthCreateUserCommand.php#L88-L99).

Isso pode ser configuração sem ciclo funcional. Não classifico sozinho como vulnerabilidade confirmada sem validar frontend/rotas/componentes externos.

#### F-09 — Baixa/Média: Usuario possui hidden vazio

Usuario declara hidden vazio. Os fluxos observados fazem projeções explícitas, mas serialização futura de atributos legados não terá essa segunda barreira. Fontes: [Usuario.php](../../../laravel/backend/app/Models/Usuario.php#L37-L55), [HandleInertiaRequests.php](../../../laravel/backend/app/Http/Middleware/HandleInertiaRequests.php#L74-L109).

### Dependências de ambiente

- Sessão usa Redis por padrão; SESSION_ENCRYPT é false por padrão; SESSION_SECURE_COOKIE não tem fallback explícito; HttpOnly true e SameSite lax estão presentes. Fontes: [config/session.php](../../../laravel/backend/config/session.php#L21-L50), [config/session.php](../../../laravel/backend/config/session.php#L168-L215).
- .env.example é local, com APP_DEBUG=true, URL HTTP, LOG_LEVEL=debug e DB_PASSWORD=secret como placeholder. Se promovido sem sobrescrita, aumenta risco de debug/log e credencial fraca. Fonte: [.env.example](../../../laravel/backend/.env.example#L1-L18), [.env.example](../../../laravel/backend/.env.example#L56-L62). laravel/backend/.env existe e não está rastreado; valores não foram lidos.
- trustProxies(at: '*') faz IP, HTTPS, cookies secure e limites por IP dependerem da borda restringir X-Forwarded-*. Fonte: [bootstrap/app.php](../../../laravel/backend/bootstrap/app.php#L89-L97).
- Sessão, rate limit, provas e locks dependem de cache compartilhado/consistente; Redis mal particionado pode enfraquecer lockout e single-use. Fontes: [config/session.php](../../../laravel/backend/config/session.php#L21-L37), [SensitiveOperationProofService.php](../../../laravel/backend/app/Services/Authorization/SensitiveOperationProofService.php#L171-L185).
- Chaves mestras fiscais, certificado de diagnóstico, CSC, S3 e integrações vêm do processo/ambiente. O vault valida chave base64 de 32 bytes e versão, mas secret manager, permissões, rotação e revogação são externos. Fontes: [AesGcmCertificateVault.php](../../../laravel/backend/app/Infrastructure/Fiscal/Certificate/AesGcmCertificateVault.php#L107-L141), [CscSecretResolver.php](../../../laravel/backend/app/Infrastructure/Fiscal/Secrets/CscSecretResolver.php#L11-L39), [.env.example](../../../laravel/backend/.env.example#L349-L368).

### Síntese e prioridade

A base é moderna nos mecanismos locais: provider anticorrupção para legado, credencial separada, hashing, FormRequests/Policies/Gates, serviços, cache/locks, prova contextual e vault criptográfico. A dívida principal é a distribuição da autorização: grants, perfis legados, metadados de permissão, exceções de rota e escopo de Filial convivem sem um contrato central único.

Prioridade de decisão/investigação, sem corrigir código neste ticket: F-01; contrato e consumo de permissao_necessaria; revogação de reautorização; granularidade de alvo/ação/Filial; assinatura dos webhooks e sanitização de payload; baseline de produção para secure cookie, session encryption, proxies, Redis e secret manager.

## Confidence — atualização

Alta para controles e lacunas citados diretamente; média para impacto final de F-02, F-04, F-05, F-06 e F-08, pois dependem de contratos de negócio ou componentes externos não presentes.
