# Análise — Login adaptativo por Rede Confiável e Código de Acesso por E-mail

## Resultado

A primeira versão deve preservar o login por Usuário, senha e Filial e aplicar uma política adaptativa por instalação on-premises da **Empresa Cliente**:

- em `disabled`, manter o fluxo atual;
- em `observe`, classificar e auditar a origem sem alterar o acesso;
- em `enforce`, dispensar somente a **Verificação Adicional de Login** quando a origem for comprovadamente uma **Rede Confiável**;
- em origem `external` ou `unknown`, criar um **Login Pendente** e exigir um **Código de Acesso por E-mail** antes de criar a sessão.

O código por e-mail é uma proteção transitória de menor garantia. Não deve ser apresentado como MFA/2FA forte, compatível com NIST ou resistente a phishing. A política “exigir prova adicional” deve permanecer separada do mecanismo concreto para permitir evolução.

## Contexto e limites

Cada Empresa Cliente opera sua própria instalação on-premises, acessível pela internet. Empresa Cliente não é Filial: a Filial continua sendo selecionada e validada durante o login. A Rede Confiável é contexto de origem, não identidade, autorização nem vínculo organizacional.

Não fazem parte da primeira versão: dispositivo confiável, SMS, WhatsApp, TOTP, passkeys, SSO/IdP, tela administrativa de CIDRs ou mudança de permissões funcionais.

## Alternativas

| Alternativa | Garantia e riscos | Operação on-premises | Decisão |
|---|---|---|---|
| Código por e-mail | Eleva a barreira contra posse isolada da senha, mas é digitável, phishable e depende da segurança da caixa postal. E-mail não é autenticador out-of-band aceito pelo NIST. | Aderência inicial simples, porém depende de SMTP, fila, entrega, cadastro verificado e recuperação local. | **Escolhida para a primeira versão**, com linguagem de Verificação Adicional e controles fail-closed. |
| TOTP | Independente do e-mail, mas ainda capturável por phishing e exige segredo recuperável no servidor. | Exige ativação, relógio, revogação, backup e recuperação próprios. | Evolução possível quando a independência do e-mail justificar a operação adicional. |
| Passkeys/WebAuthn | Resistente a phishing e replay quando corretamente vinculada à origem/RP; servidor não guarda chave privada. | Requer HTTPS e domínio estáveis, múltiplas credenciais e recuperação. | **Direção preferencial de maior garantia**. |
| IdP por OIDC/SAML | A garantia depende da política e dos autenticadores do IdP; validação incompleta concentra risco. | Bom encaixe para Empresa Cliente com identidade corporativa, offboarding e MFA centralizados; exige governança e contingência. | Evolução opcional, mantendo Filial e autorização local no ERP. |
| Allowlist de IP na borda | Impediria o próprio login externo que precisa receber código e confundiria rede com identidade. | Simples, mas incompatível com acesso de qualquer local. | Rejeitada. A borda apenas impede bypass do origin e falsificação de IP. |
| Código mestre/bypass de suporte | Cria uma credencial universal e transforma recuperação no caminho mais fraco. | Facilita suporte no curto prazo, mas elimina o fail-closed e a rastreabilidade. | Rejeitada. |

## Arquitetura decidida

### Rede e borda

A classificação deve ser centralizada e determinística, com `mode`, `trusted_networks`, `trusted_proxies`, `forwarded_header_profile` e `policy_version` validados por deployment. CIDRs aceitam IPv4/IPv6; curingas, hostnames e confiança implícita em redes privadas são proibidos.

O peer imediato só autoriza interpretar headers encaminhados quando pertence a `trusted_proxies`. A cadeia é saneada da direita para a esquerda; erro, ambiguidade ou configuração inválida produz `unknown`, tratado como externo. O atual `trustProxies('*')` precisa ser removido antes de IP influenciar autenticação.

### Login Pendente e código

O Login Pendente é agregado durável no banco, criado somente depois de validar credencial, estado do Usuário, senha expirada quando aplicável e acesso à Filial, mas antes de autenticar o guard.

- ID opaco em cookie `Secure`, `HttpOnly` e `SameSite`; nunca em URL ou Web Storage.
- Um pendente por tentativa/navegador e no máximo três ativos por Usuário.
- Prazo total fixo de 10 minutos, não prorrogável.
- Código CSPRNG de 6 dígitos, uso único e no máximo 5 erros somados entre gerações.
- Reenvio manual após 60 segundos, no máximo três por pendente, sempre criando geração nova e invalidando a anterior.
- Persistência somente de HMAC/MAC contextual com chave dedicada e versionada fora do banco; hash simples é insuficiente para o espaço de seis dígitos.
- Consumo, erro, expiração, bloqueio e substituição de geração são atômicos.
- A sessão só nasce depois do consumo vencedor; então autentica o guard, regenera a sessão, grava a Filial, atualiza último login e remove o estado pendente.

Mudança de IP não transforma pendente externo em confiável. Mudança de senha, E-mail de Acesso ou revisão de segurança revoga pendentes. O fluxo de senha expirada retorna ao mesmo orquestrador adaptativo e não cria sessão diretamente.

### E-mail de Acesso e entrega

`usuarios_auth.email` será o **E-mail de Acesso** individual, normalizado, único e verificável. Ele não será copiado nem sincronizado com `usuarios.email`/`email_conta`, que permanece conta operacional de mensagens.

Novo endereço é candidato pendente e usa link aleatório, de uso único, válido por 24 horas e persistido somente como hash. A abertura válida prova posse, mas não autentica nem cria sessão. Endereço existente não é presumido verificado durante a migração.

O envio do código usa fila e mailer lógicos exclusivos de segurança. O job recebe apenas IDs e gera o código em memória. Drivers `log`/`array`, TLS relaxado, segredo em `failed_jobs` e fallback para canal operacional são proibidos. Há até três tentativas automáticas, com backoff de 5, 15 e 30 segundos; cada tentativa cria geração nova. A interface só informa “enviado” após aceitação SMTP.

Usuário sem E-mail de Acesso verificado entra apenas pela Rede Confiável. A recuperação usa comando Artisan local, operador identificado e motivo; pode revogar e cadastrar candidato, mas nunca força verificação, cria sessão ou revela código.

### Abuso, auditoria e operação

Senha e código possuem contadores separados. O quinto código incorreto encerra o pendente e cria **Bloqueio de Verificação Externa** durável por 15 minutos, sem bloquear o caminho da Rede Confiável.

Rate limits combinam Login Pendente, Usuário, IP efetivo e instalação. Estado e bloqueio ficam no banco; janelas agregadas ficam no Redis. Redis indisponível fecha criação, reenvio e validação externos.

Uma tabela append-only de **Eventos de Segurança de Acesso** é a evidência autoritativa. Transições críticas gravam estado e evento na mesma transação. Senha, código, verificador, token, cookie, sessão, headers e payload de e-mail são proibidos. Eventos comuns ficam 180 dias; ações administrativas e mudanças de segurança, 365; logs, 30; métricas, 90.

`enforce` exige readiness de banco, chave HMAC, Redis, fila/worker, SMTP seguro, auditoria, HTTPS e cadeia de proxy. Incidentes nunca ampliam CIDRs, liberam bloqueios nem rebaixam automaticamente a política.

## Experiência validada

Foi escolhida a **opção A — passo focado**, como continuação direta do login atual:

- mesma coluna do formulário e painel institucional;
- versão compacta do painel em telas pequenas;
- indicação “Etapa 2 de 2” e uma ação principal;
- fonte `Instrument Sans` via `font-sans`;
- reutilização de `AuthLayout`, `LoginBrandPanel`, `Button`, `Input` e padrão de alerta;
- papéis visuais por aliases semânticos ligados a `--erp-*`: `surface-*`, `content-*`, `border-*`, `action-*` e `status-*`;
- `teclux-*` restrito à marca/overlay já previsto; sem cores físicas como papel da interface;
- texto/categoria além de cor, foco visível, `aria-live`, teclado e responsividade.

## Seams atuais e impacto

O seam principal é separar validação primária e conclusão da sessão em [LoginService.php](../../../laravel/backend/app/Services/Auth/LoginService.php). O mesmo vale para senha expirada. [LoginController.php](../../../laravel/backend/app/Http/Controllers/Auth/LoginController.php), [LoginRequest.php](../../../laravel/backend/app/Http/Requests/LoginRequest.php) e [Auth/Login.tsx](../../../laravel/backend/resources/js/Pages/Auth/Login.tsx) são as superfícies HTTP/UI.

O cadastro atual não mantém `usuarios_auth.email`; [UsersService.php](../../../laravel/backend/app/Services/User/UsersService.php) e o cadastro em `resources/js/Pages/Cadastros/Users/` precisam distinguir E-mail de Acesso de `email_conta`.

Configuração e borda passam por [bootstrap/app.php](../../../laravel/backend/bootstrap/app.php), `config/auth.php`, `config/session.php`, `config/mail.php`, Nginx e Compose. Redis, Horizon, Mail Manager, trace e testes existentes são prior art reutilizável, sem reaproveitar tokens de ativação/reset ou mailables de documentos como desafio.

## Evidências e rastreabilidade

- [Pesquisa de segurança e alternativas](../../../.scratch/login-adaptativo-rede-email-wayfinder/research/01-alternativas-e-requisitos-seguranca.md)
- [Inventário dos seams Laravel](../../../.scratch/login-adaptativo-rede-email-wayfinder/research/02-inventario-seams-login-email-proxy.md)
- [Mapa e decisões detalhadas](../../../.scratch/login-adaptativo-rede-email-wayfinder/map.md)
- [Vocabulário da Plataforma Laravel](../../../laravel/CONTEXT.md)

As fontes primárias e links normativos estão registrados na pesquisa. Esta análise consolida as decisões do mapa; o prompt adjacente transforma-as em instruções autocontidas para especificação, sem autorizar implementação.
