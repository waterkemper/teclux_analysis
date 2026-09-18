# Pesquisa de autenticação, autorização e segredos

## Achados verificáveis

### Autenticação

- O guard `web` usa sessão e um provider Eloquent customizado para a tabela legada `usuarios`; o provider restringe as colunas hidratadas e aplica cache curto para a recuperação do usuário autenticado. Fonte: [config/auth.php](../../../laravel/backend/config/auth.php#L20-L43), [LegacyUsuarioEloquentUserProvider.php](../../../laravel/backend/app/Auth/LegacyUsuarioEloquentUserProvider.php#L23-L90).
- As credenciais ficam no modelo separado `UsuarioAuth`. O fluxo usa `Hash::check`, rejeita usuário/credencial inativos, trata expiração de senha e valida o acesso à Filial antes de criar a sessão. Fonte: [LoginService.php](../../../laravel/backend/app/Services/Auth/LoginService.php#L30-L105).
- Há dois mecanismos de contenção de tentativa: rate limiter por identificador normalizado + IP, habilitado por padrão com 10 tentativas/60 segundos, e bloqueio da conta após cinco falhas por 15 minutos. Fonte: [auth.php](../../../laravel/backend/config/auth.php#L88-L101), [LoginService.php](../../../laravel/backend/app/Services/Auth/LoginService.php#L17-L19), [LoginController.php](../../../laravel/backend/app/Http/Controllers/Auth/LoginController.php#L40-L73).
- Após autenticação, a sessão é regenerada; no logout, é invalidada e o token CSRF é regenerado. Fonte: [LoginService.php](../../../laravel/backend/app/Services/Auth/LoginService.php#L100-L103), [LoginController.php](../../../laravel/backend/app/Http/Controllers/Auth/LoginController.php#L133-L140).

### Autorização e escopo

- O bootstrap registra `auth.context` e dezenas de middleware de acesso por módulo. O primeiro exige usuário autenticado, resolve a Filial ativa e grava `user_id`/`filial_id` no contexto da requisição; rotas sem Filial são exceções explícitas por nome/prefixo. Fonte: [bootstrap/app.php](../../../laravel/backend/bootstrap/app.php#L89-L177), [InjectAuthContext.php](../../../laravel/backend/app/Http/Middleware/InjectAuthContext.php#L15-L160).
- O projeto mantém muitas Policies e usa middleware `can:` para capacidades específicas; em vários módulos há uma combinação de acesso ao módulo, policy e autorização de ação. Fonte: [app/Policies](../../../laravel/backend/app/Policies), [routes/web.php](../../../laravel/backend/routes/web.php#L341-L370).
- Operações sensíveis possuem endpoint separado de avaliação/validação de prova, ficam dentro de `auth` + `auth.context` e distinguem usuário operador, Filial, ação e autorização contextual. Fonte: [routes/web.php](../../../laravel/backend/routes/web.php#L361-L364), [SensitiveOperationAuthController.php](../../../laravel/backend/app/Http/Controllers/Authorization/SensitiveOperationAuthController.php#L17-L82), [ValidatesSensitiveOperationProof.php](../../../laravel/backend/app/Support/Authorization/ValidatesSensitiveOperationProof.php#L11-L104).

### Segredos e dados de autenticação

- O arquivo `backend/.env` existe no checkout, mas não aparece entre os arquivos rastreados pelo Git; somente `.env.example` é rastreado. Isso reduz o risco de commit acidental, mas não prova segurança do armazenamento, distribuição ou rotação dos valores em cada ambiente.
- A preferência de Filial usa cookie HttpOnly e SameSite `lax`, mas grava o identificador de login e o código da Filial em claro por aproximadamente 400 dias; o atributo `Secure` depende de `session.secure` e tem fallback `false`. É preferência de UI, não credencial, porém merece decisão de minimização/privacidade e configuração de produção. Fonte: [LoginFilialPreferenceStore.php](../../../laravel/backend/app/Services/Auth/LoginFilialPreferenceStore.php#L14-L22), [LoginFilialPreferenceStore.php](../../../laravel/backend/app/Services/Auth/LoginFilialPreferenceStore.php#L79-L113).
- O bootstrap confia em todos os proxies (`at: '*'`) e dispensa CSRF para dois webhooks de marketplace. Ambos podem ser corretos atrás de uma topologia controlada, mas a segurança efetiva depende de cabeçalhos encaminhados, assinatura/autenticação dos webhooks e isolamento de rede; isso deve ser verificado na auditoria da superfície web. Fonte: [bootstrap/app.php](../../../laravel/backend/bootstrap/app.php#L89-L97).

## Avaliação

Há uma postura de segurança deliberada e relativamente madura: credencial separada do cadastro legado, hashing, lockout, rate limiting, regeneração de sessão, contexto explícito de Filial, Policies, capacidades e provas de autorização sensível auditáveis. A arquitetura também evita depender apenas de visibilidade de menu.

As principais incertezas não resolvidas são a completude da aplicação de Policies em todas as rotas mutáveis, a autoridade real de Administrador versus escopo de Filial, a configuração `session.secure` por ambiente, a validação dos webhooks sem CSRF e a custódia/rotação dos segredos de integrações e certificados. Não foram classificados como vulnerabilidades confirmadas neste ticket.

## Confiança

Alta para os controles diretamente observados; média para a cobertura global, porque a superfície de rotas e as configurações efetivas de produção ainda não foram auditadas integralmente.
