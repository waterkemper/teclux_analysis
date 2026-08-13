# Pesquisa: sessão longa e reautenticação no ERP Laravel

Data da pesquisa: 2026-08-04  
Escopo: sessão ociosa longa, duração absoluta, cookies persistentes, rotação, revogação, CSRF, `remember me`, múltiplos dispositivos, mudança de IP/rede e reautenticação de ações sensíveis.

## Base e limites

As referências do framework usam a documentação e o código-fonte primário da linha Laravel 13.x, que é a linha atual consultada. A versão efetivamente instalada no ERP ainda deve ser confirmada antes de aplicar qualquer decisão: Laravel 13 introduziu `PreventRequestForgery` e verificação de origem com `Sec-Fetch-Site`; nas linhas anteriores o middleware e o comportamento de CSRF podem ser diferentes. Esta pesquisa não implementa mudanças.

O mapa local informa que o cenário atual usa `web` com provider legado `usuarios`, Redis para sessão em produção, lifetime de 120 minutos, `expire_on_close=false`, `HttpOnly` habilitado e `SameSite=Lax`. Esses itens são contexto local, não fatos inferidos das fontes externas.

## Resumo executivo

Para um ERP usado durante o expediente, a solução mais equilibrada é manter a sessão primária sem exigir login a cada poucos minutos, mas com quatro camadas independentes:

1. timeout ocioso server-side;
2. timeout absoluto server-side;
3. reautenticação/step-up apenas para ações sensíveis ou sinais de risco;
4. perímetro de rede (VPN, proxy ou allowlist) como redução de superfície, nunca como substituto de autenticação, autorização ou revogação.

O Laravel fornece diretamente a primeira camada (`lifetime`), a rotação de ID no login, a invalidação da sessão no logout, logout de outros dispositivos via `AuthenticateSession` e password confirmation com timeout configurável. O timeout absoluto, registro de sessões por dispositivo, revogação arbitrária e política contextual por rede precisam ser desenhados na aplicação/perímetro.

`remember me` não deve ser usado como sinônimo de sessão ilimitada nem como autorização para operações críticas. Na documentação ele mantém o usuário autenticado “indefinitely or until logout”; no código atual do `SessionGuard`, o cookie recaller é criado com duração padrão de 576.000 minutos, aproximadamente 400 dias, e depende do `remember_token` persistido no usuário. Portanto, é uma credencial persistente de recuperação de autenticação, com risco e ciclo de revogação próprios.

## Fatos confirmados

### 1. O lifetime padrão do Laravel é ocioso e deslizante

O skeleton oficial de `config/session.php` descreve `lifetime` como o número de minutos que a sessão pode permanecer ociosa antes de expirar, com padrão de 120 minutos, e separa `expire_on_close` como a opção para expirar o cookie quando o navegador fecha: [config/session.php do Laravel 13.x](https://raw.githubusercontent.com/laravel/laravel/13.x/config/session.php#L19-L32).

O middleware `StartSession` calcula o lifetime server-side em segundos (`lifetime * 60`) e, em cada resposta, emite o cookie com expiração em `agora + lifetime` quando `expire_on_close` é falso. Quando a opção é verdadeira, a expiração do cookie é `0`: [StartSession.php](https://raw.githubusercontent.com/laravel/framework/13.x/src/Illuminate/Session/Middleware/StartSession.php#L203-L253). Isso caracteriza um prazo ocioso/deslizante do cookie, não um prazo absoluto desde o login.

No handler de banco, a leitura rejeita a sessão quando `last_activity` ultrapassa o limite e a gravação atualiza `last_activity`; a coleta de lixo remove registros antigos: [DatabaseSessionHandler.php](https://raw.githubusercontent.com/laravel/framework/13.x/src/Illuminate/Session/DatabaseSessionHandler.php#L89-L116) e [DatabaseSessionHandler.php](https://raw.githubusercontent.com/laravel/framework/13.x/src/Illuminate/Session/DatabaseSessionHandler.php#L262-L265). O handler baseado em cache grava a sessão com TTL de `minutes * 60`: [CacheBasedSessionHandler.php](https://raw.githubusercontent.com/laravel/framework/13.x/src/Illuminate/Session/CacheBasedSessionHandler.php#L0-L1).

O Laravel não registra, nesse mecanismo padrão, uma marca de “criada em” usada para impor duração absoluta. Logo, aumentar `SESSION_LIFETIME` reduz prompts, mas não resolve sozinho o risco de um token roubado permanecer válido enquanto recebe atividade.

### 2. Cookie de sessão, cookie persistente e fechamento do navegador são coisas diferentes

Pelo RFC 6265, sem `Expires` ou `Max-Age` o user agent trata o cookie como válido até o fim da “sessão atual”, definida pelo próprio user agent; com `Expires` ou `Max-Age`, o cookie pode ser persistido entre reinícios. O user agent ainda pode remover cookies antes do prazo por quota, privacidade ou ação do usuário. Para apagar, o servidor deve enviar um cookie com expiração passada e os mesmos atributos de escopo: [RFC 6265, visão geral e expiração](https://www.rfc-editor.org/rfc/rfc6265.html#section-3) e [semântica de `Expires`/`Max-Age`](https://www.rfc-editor.org/rfc/rfc6265.html#section-4.1.2).

O `expire_on_close` do Laravel controla a persistência do cookie no navegador, mas o fechamento da janela não envia necessariamente uma requisição ao servidor. Portanto, não deve ser tratado como revogação server-side garantida. A recomendação normativa atualizada do NIST também distingue o segredo da sessão, o logoff e os timeouts: [NIST SP 800-63B-4, Session Management](https://pages.nist.gov/800-63-4/sp800-63b/session/).

O RFC 6265bis-22 estava em fila editorial do IETF em 2026-05 e ainda era Internet-Draft, não uma norma final; deve ser usado como especificação em evolução, não como substituto silencioso do RFC publicado: [Datatracker, draft-ietf-httpbis-rfc6265bis-22](https://datatracker.ietf.org/doc/draft-ietf-httpbis-rfc6265bis/22/) e [histórico editorial](https://datatracker.ietf.org/doc/draft-ietf-httpbis-rfc6265bis/history/).

### 3. Cookies de sessão devem ter escopo e atributos de segurança adequados

O skeleton Laravel expõe `domain`, `secure`, `http_only`, `same_site` e, na linha atual, `partitioned`; o cookie de sessão é montado pelo `StartSession` com esses atributos: [config/session.php](https://raw.githubusercontent.com/laravel/laravel/13.x/config/session.php#L117-L212) e [StartSession.php](https://raw.githubusercontent.com/laravel/framework/13.x/src/Illuminate/Session/Middleware/StartSession.php#L203-L217).

OWASP recomenda HTTPS integral, `Secure`, `HttpOnly`, `SameSite=Strict` ou `Lax`, domínio o mais estreito possível e, quando compatível com a arquitetura, prefixo `__Host-` com `Secure`, sem `Domain` e `Path=/`: [OWASP Session Management — cookies](https://cheatsheetseries.owasp.org/cheatsheets/Session_Management_Cheat_Sheet.html#cookies). `HttpOnly` impede leitura via APIs de script, mas não impede que JavaScript malicioso faça requisições autenticadas no contexto de um XSS: [RFC 6265, `HttpOnly`](https://www.rfc-editor.org/rfc/rfc6265.html#section-4.1.2.6).

Cookies não devem ser substituídos por tokens de autenticação em `localStorage` ou `sessionStorage`; OWASP alerta que JavaScript da mesma origem pode ler esses valores em caso de XSS: [OWASP Session Management — Web Storage](https://cheatsheetseries.owasp.org/cheatsheets/Session_Management_Cheat_Sheet.html#html5-web-storage-api).

### 4. Laravel gira o ID da sessão no login e pode destruir o anterior

O `SessionGuard::login()` salva o identificador do usuário e chama `regenerate(true)`. O `true` faz o handler destruir o ID antigo; a regeneração também cria um novo token CSRF: [SessionGuard.php](https://raw.githubusercontent.com/laravel/framework/13.x/src/Illuminate/Auth/SessionGuard.php#L517-L546) e [Store.php](https://raw.githubusercontent.com/laravel/framework/13.x/src/Illuminate/Session/Store.php#L565-L605).

A documentação do Laravel recomenda regenerar a sessão durante autenticação manual e oferece `invalidate()` para apagar os dados e criar novo ID: [HTTP Session — regenerating the session ID](https://laravel.com/docs/13.x/session#regenerating-the-session-id). OWASP exige renovação após mudança de privilégio, inclusive autenticação, mudança de senha ou troca de papel: [OWASP Session Management — renew the session ID](https://cheatsheetseries.owasp.org/cheatsheets/Session_Management_Cheat_Sheet.html#renew-the-session-id-after-any-privilege-level-change).

O timeout de renovação do ID durante uma sessão longa é conceitualmente diferente do timeout absoluto: a rotação reduz a janela de reutilização de um ID roubado, mas não encerra a sessão enquanto o usuário continua ativo. OWASP descreve a renovação periódica como complemento aos timeouts ocioso e absoluto e chama atenção para uma possível corrida durante a troca: [OWASP Session Management — renewal timeout](https://cheatsheetseries.owasp.org/cheatsheets/Session_Management_Cheat_Sheet.html#renewal-timeout).

### 5. Logout local e logout remoto têm alcances diferentes

A documentação oficial recomenda, no logout, chamar `Auth::logout()`, invalidar a sessão e regenerar o token CSRF: [Laravel Authentication — Logging Out](https://laravel.com/docs/13.x/authentication#logging-out). O código do guard remove o identificador da sessão e esquece o recaller; o logout normal também troca o `remember_token`, enquanto `logoutCurrentDevice()` explicitamente não troca esse token: [SessionGuard.php](https://raw.githubusercontent.com/laravel/framework/13.x/src/Illuminate/Auth/SessionGuard.php#L598-L673).

O Laravel possui `AuthenticateSession` e `logoutOtherDevices($password)`. O middleware grava uma representação do hash de senha na sessão e encerra a sessão quando o hash corrente deixa de coincidir. O método de logout de outros dispositivos exige a senha atual e invalida as demais sessões, mantendo o dispositivo corrente: [Laravel Authentication — invalidating other devices](https://laravel.com/docs/13.x/authentication#invalidating-sessions-on-other-devices), [AuthenticateSession.php](https://raw.githubusercontent.com/laravel/framework/13.x/src/Illuminate/Session/Middleware/AuthenticateSession.php#L42-L68), [SessionGuard.php](https://raw.githubusercontent.com/laravel/framework/13.x/src/Illuminate/Auth/SessionGuard.php#L675-L718).

Isso não equivale a uma central completa de sessões por dispositivo. Uma UI de “sessões ativas”, revogação de um dispositivo específico, logout global por incidente e sincronização imediata de todos os navegadores exigem registro/estado adicional e uma política de revogação. Essa é uma conclusão de arquitetura baseada no escopo das APIs acima.

### 6. `remember me` é uma credencial persistente separada da sessão ociosa

Na documentação Laravel 13, `Auth::attempt(..., true)` habilita “remember me”, exigindo `remember_token`; a documentação descreve a autenticação como mantida indefinidamente ou até logout e expõe `viaRemember()` para detectar autenticação por recaller: [Laravel Authentication — Remembering Users](https://laravel.com/docs/13.x/authentication#remembering-users).

No código atual do `SessionGuard`:

- a duração padrão do recaller é `576000` minutos, cerca de 400 dias;
- o cookie contém identificador, `remember_token` e HMAC do hash de senha;
- quando a sessão normal não contém usuário, o guard consulta o recaller e cria uma nova sessão, girando o ID;
- logout normal troca o `remember_token`, invalidando recalleres antigos;
- a duração pode ser alterada no guard por `setRememberDuration()`.

Fontes: [SessionGuard.php — duração e recuperação](https://raw.githubusercontent.com/laravel/framework/13.x/src/Illuminate/Auth/SessionGuard.php#L47-L58), [SessionGuard.php — recaller e nova sessão](https://raw.githubusercontent.com/laravel/framework/13.x/src/Illuminate/Auth/SessionGuard.php#L162-L216), [SessionGuard.php — criação do cookie](https://raw.githubusercontent.com/laravel/framework/13.x/src/Illuminate/Auth/SessionGuard.php#L548-L596) e [SessionGuard.php — rotação no logout](https://raw.githubusercontent.com/laravel/framework/13.x/src/Illuminate/Auth/SessionGuard.php#L598-L673).

O recaller permite reconstituir uma sessão depois que a sessão ociosa expirou ou o navegador foi reiniciado; não é prova recente de presença do usuário nem step-up. O middleware `AuthenticateSession` verifica o HMAC relacionado à senha e força logout do dispositivo quando ele não coincide: [AuthenticateSession.php](https://raw.githubusercontent.com/laravel/framework/13.x/src/Illuminate/Session/Middleware/AuthenticateSession.php#L42-L63).

### 7. Password confirmation é step-up de senha com janela própria

O Laravel oferece `password.confirm` para rotas que exigem confirmação recente. Na documentação 13.x, após uma confirmação a senha não é solicitada de novo por três horas por padrão; o valor pode ser alterado em `auth.php` por `password_timeout`: [Laravel Authentication — Password Confirmation](https://laravel.com/docs/13.x/authentication#password-confirmation).

O middleware compara o timestamp `auth.password_confirmed_at` da sessão com o timeout; o padrão no código é 10.800 segundos, três horas. Ele não encerra a sessão primária e não é MFA: [RequirePassword.php](https://raw.githubusercontent.com/laravel/framework/13.x/src/Illuminate/Auth/Middleware/RequirePassword.php#L24-L42) e [RequirePassword.php](https://raw.githubusercontent.com/laravel/framework/13.x/src/Illuminate/Auth/Middleware/RequirePassword.php#L65-L92).

A própria documentação sugere aplicar o middleware às rotas de área ou ação sensível, incluindo GET e POST quando necessário. A etapa de confirmação deve continuar protegida por CSRF e limitação de tentativas, como no exemplo oficial: [Laravel Authentication — protecting routes](https://laravel.com/docs/13.x/authentication#protecting-routes).

### 8. CSRF não é substituto de autenticação nem de autorização

No Laravel 13, `PreventRequestForgery`, incluído no grupo `web`, faz verificação em duas camadas: usa `Sec-Fetch-Site` para origem em navegadores modernos e recorre à validação tradicional de token quando a verificação de origem não se aplica. O token fica na sessão e muda quando a sessão é regenerada: [Laravel CSRF Protection](https://laravel.com/docs/13.x/csrf#preventing-csrf-requests).

O Fetch Metadata define `Sec-Fetch-Site` com valores `cross-site`, `same-origin`, `same-site` e `none`; o header não deve ser presumido como único mecanismo para clientes antigos ou não-browser: [W3C Fetch Metadata](https://w3c.github.io/webappsec-fetch-metadata/#sec-fetch-site-http-request-header). O Laravel mantém fallback de token justamente para esses casos.

OWASP explica que cookies são enviados automaticamente pelo navegador, por isso CSRF explora a sessão autenticada, e recomenda proteção server-side por token ou mecanismos equivalentes: [OWASP CSRF Prevention](https://cheatsheetseries.owasp.org/cheatsheets/Cross-Site_Request_Forgery_Prevention_Cheat_Sheet.html#introduction).

Após logout, Laravel recomenda invalidar a sessão e regenerar o token CSRF. Isso evita continuar aceitando o estado anterior, mas não transforma um token de sessão roubado em seguro se a sessão server-side continuar válida em outro lugar.

### 9. IP/rede e VPN são sinais de contexto, não identidade

O Laravel documenta que `Request::ip()` pode refletir o cliente direto ou endereços encaminhados por proxies, e afirma que endereços IP devem ser considerados input não confiável e usados apenas para fins informacionais em geral. Quando há load balancer, proxy ou VPN, `TrustProxies` permite declarar explicitamente quais proxies e headers encaminhados são confiáveis: [Laravel Requests — Request IP Address](https://laravel.com/docs/13.x/requests#request-ip-address) e [Configuring Trusted Proxies](https://laravel.com/docs/13.x/requests#configuring-trusted-proxies).

OWASP recomenda observar mudanças de IP, User-Agent, idioma e outros atributos para detectar possível sequestro, mas documenta os falsos positivos e negativos: Wi-Fi, roaming, atualização do navegador e viagens mudam sinais legítimos; um atacante pode permanecer na mesma região. A resposta mais confiável a uma suspeita é reautenticar e emitir novo cookie, sem transformar a mudança de IP em bloqueio incondicional: [OWASP Cookie Theft Mitigation](https://cheatsheetseries.owasp.org/cheatsheets/Cookie_Theft_Mitigation_Cheat_Sheet.html#cookie-theft-detection) e [Session Management — binding to other properties](https://cheatsheetseries.owasp.org/cheatsheets/Session_Management_Cheat_Sheet.html#binding-the-session-id-to-other-user-properties).

O Fetch Metadata informa a relação entre origem de página e destino HTTP (`same-origin`, `same-site`, `cross-site`, `none`); ele não informa se o usuário está “dentro da VPN”: [W3C Fetch Metadata](https://w3c.github.io/webappsec-fetch-metadata/#sec-fetch-site-http-request-header).

## Recomendações para a decisão do ERP

Estas são recomendações arquiteturais derivadas dos fatos acima, não configurações já aplicadas.

### Política de sessão primária

- Usar sessão server-side compartilhada (Redis já aparece no contexto local) para que múltiplos containers e workers possam consultar o mesmo estado e para permitir revogação server-side.
- Definir um timeout ocioso compatível com o expediente e com o risco do ERP. O valor atual de 120 minutos é tecnicamente um timeout ocioso/deslizante, não um máximo de dois horas desde o login.
- Adicionar uma duração absoluta independente, armazenando `authenticated_at` ou equivalente no estado server-side e exigindo nova autenticação quando o limite for atingido, mesmo que haja atividade contínua.
- Considerar rotação periódica do ID durante sessões prolongadas e sempre após login, elevação de privilégio, troca de senha e step-up. Não confundir rotação com extensão indefinida.
- Exibir aviso e preservar trabalho não enviado antes de expiração; o aviso é UX, enquanto a decisão de expiração deve ser server-side. NIST recomenda aviso antes dos timeouts e distingue timeout de inatividade de timeout geral: [NIST Session Management](https://pages.nist.gov/800-63-4/sp800-63b/session/).

OWASP fornece referências orientativas, não uma regra universal: 2–5 minutos de idle para aplicações de alto valor, 15–30 para menor risco e 4–8 horas de absoluto para uso de escritório durante o dia. Para este ERP, esses números devem ser calibrados por operação, perfil de usuário, risco e capacidade de salvar trabalho: [OWASP Session Expiration](https://cheatsheetseries.owasp.org/cheatsheets/Session_Management_Cheat_Sheet.html#session-expiration).

### `remember me`

- Não habilitar por padrão para administradores, financeiro, faturamento, folha, dados pessoais ou operações irreversíveis.
- Se for necessário para usuários de baixo risco, tratá-lo como “lembrar este navegador” com duração explícita, menor que o padrão de 400 dias, e com possibilidade de revogação por usuário, administrador e incidente.
- Quando a autenticação ocorrer via recaller, considerar a sessão como autenticação de menor frescor: permitir navegação de baixo risco, mas exigir password confirmation ou MFA para operações críticas.
- Rotacionar/revogar `remember_token` em troca de senha, recuperação de conta, suspeita de comprometimento e logout global. Testar separadamente logout da sessão atual, logout de outros dispositivos e invalidação do recaller.

### Step-up e ações sensíveis

Aplicar `password.confirm` ou um fluxo MFA/transaction authorization a ações como alteração de senha/e-mail, troca de MFA, inclusão de dispositivo confiável, alteração de permissões, emissão de documentos fiscais, pagamentos, exclusões em massa, exportação de dados e qualquer ação irreversível. OWASP recomenda reautenticação para dados críticos, eventos de risco e ações sensíveis, e MFA adicional quando a operação justificar: [OWASP Authentication — sensitive features and risk events](https://cheatsheetseries.owasp.org/cheatsheets/Authentication_Cheat_Sheet.html#require-re-authentication-for-sensitive-features) e [OWASP Multifactor Authentication](https://cheatsheetseries.owasp.org/cheatsheets/Multifactor_Authentication_Cheat_Sheet.html).

Para transferências ou operações com efeito financeiro, a autorização deve estar ligada aos dados concretos da operação, ser verificada no servidor, expirar em janela curta e não ser reutilizável; uma simples senha confirmada na sessão é diferente de autorização transacional: [OWASP Transaction Authorization](https://cheatsheetseries.owasp.org/cheatsheets/Transaction_Authorization_Cheat_Sheet.html).

### Rede confiável, VPN e IP

- Preferir que o ERP inteiro fique atrás de VPN, túnel de acesso ou proxy de identidade quando o requisito for “não expor a superfície ao público”. Isso reduz superfície e automatiza o perímetro, mas não elimina autenticação, autorização, CSRF, MFA ou auditoria.
- Se houver áreas públicas e privadas, aplicar a restrição de rede no proxy/firewall antes do Laravel para rotas administrativas e operações de alto impacto; manter uma defesa server-side no Laravel para evitar bypass por rota alternativa.
- Definir claramente qual IP o Laravel deve observar: cliente final, egress da VPN ou proxy confiável. Configurar `TrustProxies` somente para os proxies conhecidos; confiar em qualquer `X-Forwarded-For` recebido da Internet permitiria falsificar o contexto.
- Não invalidar automaticamente qualquer troca de IP. Usar mudança de rede como sinal graduado: registrar, alertar, exigir step-up para ações sensíveis e revogar/bloquear apenas quando combinada com outros sinais ou quando a política de risco assim determinar.
- VPN corporativa com IP de saída estável pode ser uma boa condição de acesso ao perímetro; não é prova de qual Usuário está operando dentro dela. Contas, permissões e auditoria continuam obrigatórias.

### Múltiplos dispositivos e revogação

- Modelar cada login como uma sessão identificável, com hash do ID (nunca o ID em claro nos logs), usuário, dispositivo/UA, horário, último uso, rede observada e estado de revogação.
- Oferecer “encerrar esta sessão”, “encerrar outras sessões” e “encerrar todas”, além de revogar recalleres. O `logoutOtherDevices` do Laravel é uma base útil, mas não substitui o registro de sessões por dispositivo.
- Em incidente ou troca de credencial, invalidar server-side antes de apenas apagar cookies no navegador. Cookies apagados no dispositivo do usuário não removem um cookie roubado que ainda seja aceito pelo servidor.
- Não usar `localStorage` para transportar um token que contorne a política da sessão web.

## Limites e decisões que permanecem abertas

1. Versão exata do Laravel e do pacote de autenticação/kit utilizado.
2. Quais operações do ERP são apenas consulta, administrativas, financeiras, fiscais, destrutivas ou exportadoras.
3. Se VPN é obrigatória para todo o ERP ou apenas para superfícies de alto risco, e se existe acesso legítimo externo.
4. Qual componente termina TLS e qual cadeia de proxies deve ser confiada para determinar o IP real.
5. Valores aprovados para idle, absoluto, rotação de ID, timeout de password confirmation e MFA.
6. Requisitos de logout global, retenção de auditoria, alertas e suporte quando a sessão é revogada.
7. Estratégia para avisar expiração sem manter uma requisição artificial que renove o timeout ocioso.

## Fontes primárias consultadas

- [Laravel 13.x — Authentication](https://laravel.com/docs/13.x/authentication)
- [Laravel 13.x — HTTP Session](https://laravel.com/docs/13.x/session)
- [Laravel 13.x — CSRF Protection](https://laravel.com/docs/13.x/csrf)
- [Laravel 13.x — HTTP Requests e Trusted Proxies](https://laravel.com/docs/13.x/requests)
- [Laravel framework — SessionGuard.php, branch 13.x](https://github.com/laravel/framework/blob/13.x/src/Illuminate/Auth/SessionGuard.php)
- [Laravel framework — AuthenticateSession.php, branch 13.x](https://github.com/laravel/framework/blob/13.x/src/Illuminate/Session/Middleware/AuthenticateSession.php)
- [Laravel framework — StartSession.php, branch 13.x](https://github.com/laravel/framework/blob/13.x/src/Illuminate/Session/Middleware/StartSession.php)
- [Laravel framework — Store.php, branch 13.x](https://github.com/laravel/framework/blob/13.x/src/Illuminate/Session/Store.php)
- [Laravel skeleton — config/session.php, branch 13.x](https://github.com/laravel/laravel/blob/13.x/config/session.php)
- [OWASP — Session Management Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Session_Management_Cheat_Sheet.html)
- [OWASP — Authentication Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Authentication_Cheat_Sheet.html)
- [OWASP — CSRF Prevention Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Cross-Site_Request_Forgery_Prevention_Cheat_Sheet.html)
- [OWASP — Cookie Theft Mitigation](https://cheatsheetseries.owasp.org/cheatsheets/Cookie_Theft_Mitigation_Cheat_Sheet.html)
- [OWASP — Transaction Authorization](https://cheatsheetseries.owasp.org/cheatsheets/Transaction_Authorization_Cheat_Sheet.html)
- [IETF RFC 6265 — HTTP State Management Mechanism](https://www.rfc-editor.org/rfc/rfc6265.html)
- [IETF draft RFC 6265bis-22 — status atual do trabalho de cookies](https://datatracker.ietf.org/doc/draft-ietf-httpbis-rfc6265bis/22/)
- [W3C Fetch Metadata — `Sec-Fetch-Site`](https://w3c.github.io/webappsec-fetch-metadata/#sec-fetch-site-http-request-header)
- [NIST SP 800-63B-4 — Session Management](https://pages.nist.gov/800-63-4/sp800-63b/session/)
- [NIST SP 800-63B-4 — Authentication Assurance Levels](https://pages.nist.gov/800-63-4/sp800-63b/aal/)
