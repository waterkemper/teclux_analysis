# Alternativas e requisitos de segurança para autenticação adaptativa

## Escopo

Pesquisa para a primeira versão on-premises por Empresa Cliente. Permanecem as decisões do mapa: usuário, senha e Filial são obrigatórios; Rede Confiável dispensa apenas a verificação adicional; fora dela todos usam Código de Acesso por E-mail; não há dispositivo confiável nem bypass.

**Fato** abaixo é sustentado por fonte primária. **Recomendação para o ERP** é inferência para este contexto, não alegação de conformidade.

## Conclusão

**Fato.** O NIST SP 800-63B-4 determina que e-mail não seja usado como autenticador out-of-band, pois pode ser acessível apenas por senha, interceptado em trânsito/intermediários ou redirecionado. Logo, senha + código por e-mail **não deve ser apresentado como MFA compatível com NIST** ([NIST SP 800-63B-4 — Out-of-Band Authenticators](https://pages.nist.gov/800-63-4/sp800-63b/authenticators/#out-of-band)). A OWASP também registra que e-mail pode depender apenas de outra senha, às vezes reutilizada, e por isso sua condição de fator é discutível ([OWASP MFA Cheat Sheet — Email](https://cheatsheetseries.owasp.org/cheatsheets/Multifactor_Authentication_Cheat_Sheet.html#email)).

**Recomendação para o ERP.** Usar o Código de Acesso por E-mail como **verificação adicional transitória e de menor garantia**, sem chamá-lo de “2FA forte”, “MFA conforme NIST” ou “resistente a phishing”. Ele eleva a barreira contra quem obteve apenas a senha do ERP, mas não protege adequadamente contra caixa postal comprometida, senha reutilizada, encaminhamento, malware ou phishing em tempo real. A Empresa Cliente deve aceitar esse risco, e a arquitetura deve permitir evolução.

## Comparação

| Alternativa | Segurança | Operação e encaixe on-premises |
|---|---|---|
| Código por e-mail | Não aceito pelo NIST como autenticador out-of-band; digitável e phishable; depende da caixa e do transporte. | Adesão simples e usa cadastro atual, mas SMTP pode atrasar/falhar e recuperação pode ficar circular. Controle inicial de menor garantia. |
| TOTP | Prova posse do segredo compartilhado; independe do e-mail, mas o código digitável ainda pode ser capturado por phishing. | Funciona offline. Exige provisionamento, relógio, revogação e recuperação; servidor precisa do segredo recuperável, portanto criptografado, não só hashado. |
| Passkeys/WebAuthn | Chave pública vinculada ao RP ID/origem e desafio; resistente a phishing e replay quando correta; servidor não guarda chave privada. | Requer HTTPS/domínio estável, suporte a dispositivos, múltiplas credenciais e recuperação. Melhor direção de segurança. |
| IdP via OIDC/SAML | Garantia depende da política/autenticadores do IdP; RP precisa validar integralmente a assertion. | Centraliza MFA, recuperação e desligamento, mas concentra risco, exige governança, provisionamento e plano de indisponibilidade. Pode ser local ou externo. |

**Fatos.** O RFC 6238 recomenda passo TOTP de 30 segundos, janela limitada e proíbe aceitar novamente código já validado ([RFC 6238, seções 5.2 e 6](https://www.rfc-editor.org/rfc/rfc6238.html#section-5.2)). WebAuthn verifica desafio, origem e RP ID por assertion assinada ([W3C WebAuthn Level 3 — RP Operations](https://www.w3.org/TR/webauthn-3/#sctn-rp-operations)); o NIST explica que credenciais sincronizáveis corretamente configuradas resistem a phishing pelo vínculo ao domínio/RP e a replay pelo nonce ([NIST — Syncable Authenticators](https://pages.nist.gov/800-63-4/sp800-63b/syncable/)). Em federação, o RP só cria sessão após validar assertion do IdP esperado, conta local, assinatura, audiência e replay ([NIST SP 800-63C-4 — Authenticated Sessions at the RP](https://pages.nist.gov/800-63-4/sp800-63c/Federation/#authenticated-sessions-at-the-rp)); OIDC exige validar issuer, audience, assinatura e nonce quando enviado ([OpenID Connect Core — ID Token Validation](https://openid.net/specs/openid-connect-core-1_0.html#IDTokenValidation)).

## Requisitos do Código de Acesso por E-mail

### Geração, validade e tentativas

**Fato.** Para out-of-band permitido por seu modelo, o NIST exige CSPRNG aprovado, ao menos seis dígitos, uso único, conclusão em até 10 minutos e rate limiting abaixo de 64 bits; gerar novo segredo não zera falhas ([NIST — Out-of-Band Verifiers](https://pages.nist.gov/800-63-4/sp800-63b/authenticators/#out-of-band-verifiers)). Isso não torna e-mail permitido, mas é piso técnico útil. OWASP recomenda TTL curto, uso único, limite rígido, invalidação no sucesso, CSPRNG e novo OTP no reenvio ([OWASP — OTP Handling](https://cheatsheetseries.owasp.org/cheatsheets/Multifactor_Authentication_Cheat_Sheet.html#one-time-password-otp-handling-and-storage)).

**Recomendação para o ERP.**

- Manter 6 dígitos, 10 minutos e no máximo 5 erros. Seis dígitos têm 1.000.000 de combinações, cerca de 20 bits; cinco palpites dão probabilidade bruta de 5/1.000.000 por desafio.
- Limitar por Usuário, desafio e instalação, e também por IP/origem. Reenvio ou nova tentativa não deve apagar imediatamente o histórico agregado.
- Comparar em tempo constante. Responder genericamente para código errado, vencido, consumido ou substituído.
- Reenvio após 60 segundos gera nova versão e invalida a anterior atomicamente. Impor também máximo de envios por janela para evitar flood/custo.
- Consumo, incremento de erros e substituição precisam ser atômicos para impedir dupla aceitação e corridas.

### Armazenamento

**Fato.** OWASP orienta não logar OTP nem mantê-lo em plaintext; alerta que hash simples de seis dígitos é rapidamente enumerável após vazamento do banco ([OWASP — Hashing OTPs](https://cheatsheetseries.owasp.org/cheatsheets/Multifactor_Authentication_Cheat_Sheet.html#hashing-otps)).

**Recomendação para o ERP.**

- Persistir somente verificador derivado, preservando a decisão do mapa. Preferir HMAC/MAC com chave da aplicação fora do banco e contexto único do desafio, ou construção revisada equivalente; SHA simples ou password hash isolado não elimina brute force offline do pequeno espaço.
- Nunca persistir/logar código, senha, cookie, sessão, chave da aplicação ou corpo completo do e-mail.
- Guardar ID aleatório do desafio, Usuário, Filial, criação, expiração, consumo, contador, último envio, geração e resultado operacional.

### Login Pendente e sessão

**Fato.** OWASP exige IDs de sessão imprevisíveis, cookies protegidos e renovação após autenticação; credenciais não devem ficar em URL ou Web Storage ([OWASP Session Management](https://cheatsheetseries.owasp.org/cheatsheets/Session_Management_Cheat_Sheet.html)). Laravel recomenda regenerar a sessão após autenticação manual ([Laravel Authentication](https://laravel.com/docs/13.x/authentication#manually-authenticating-users)).

**Recomendação para o ERP.**

- Após credenciais válidas, criar apenas **Login Pendente**; não autenticar o guard.
- Usar ID opaco e aleatório em cookie `Secure`, `HttpOnly`, `SameSite` adequado e POSTs com CSRF; nunca URL/localStorage.
- Permitir ao pendente somente exibir, validar, reenviar e cancelar. Nenhuma rota autenticada deve aceitá-lo.
- Vincular tentativa, Usuário e Filial. Registrar classificação de rede/IP confiável; não usar mudança de IP sozinha para invalidar sem decisão própria.
- No sucesso, consumir atomicamente, autenticar, regenerar ID e apagar estado pendente. Troca de senha expirada deve voltar à mesma política e não autenticar diretamente.

### Enumeração e abuso

**Fato.** OWASP recomenda mensagens genéricas e tempos aproximadamente uniformes para usuário inexistente, senha errada ou conta bloqueada; login em etapas não deve criar enumeração ([OWASP Authentication Responses](https://cheatsheetseries.owasp.org/cheatsheets/Authentication_Cheat_Sheet.html#authentication-responses), [OWASP Multi-Step Login](https://cheatsheetseries.owasp.org/cheatsheets/Credential_Stuffing_Prevention_Cheat_Sheet.html#multi-step-login-processes)). Solicitações por e-mail precisam de rate limiting por conta contra inundação ([OWASP Forgot Password](https://cheatsheetseries.owasp.org/cheatsheets/Forgot_Password_Cheat_Sheet.html#forgot-password-request)).

**Recomendação para o ERP.**

- Enviar somente depois de validar usuário, senha, estado, senha expirada e acesso à Filial.
- Antes disso, não revelar conta/e-mail e manter resposta equivalente. Só após senha correta mostrar endereço mascarado.
- Coordenar limites de senha, criação, validação e reenvio. Detectar ataques por conta/instalação, não só IP, sem lockout permanente fácil.
- Falha SMTP é fail-closed para externo e jamais reclassifica o acesso.

### Recuperação

**Fato.** Reset de MFA pode virar o caminho mais fraco. OWASP recomenda fator existente para mudança, tratamento de alto risco e notificação ([OWASP MFA Cheat Sheet — Resetting/Changing Factors](https://cheatsheetseries.owasp.org/cheatsheets/Multifactor_Authentication_Cheat_Sheet.html#resetting-mfa)).

**Recomendação para o ERP.**

- Aceitar somente e-mail individual. Usuário sem e-mail entra pela Rede Confiável e fica bloqueado externamente.
- Alteração só por administrador autenticado na Rede Confiável, com motivo; revogar desafios e preferencialmente sessões.
- Auditar e notificar endereço antigo e novo quando possível.
- Não criar código mestre, perguntas secretas, bypass de suporte ou recuperação externa baseada apenas no mesmo e-mail.

### Auditoria

**Fato.** OWASP recomenda logar sucessos/falhas de autenticação e excluir senhas, tokens e IDs de sessão; IP pode ajudar, mas pode ser dado pessoal ([OWASP Logging](https://cheatsheetseries.owasp.org/cheatsheets/Logging_Cheat_Sheet.html#which-events-to-log), [OWASP Logging Vocabulary — Authentication](https://cheatsheetseries.owasp.org/cheatsheets/Logging_Vocabulary_Cheat_Sheet.html#authentication-authn)).

**Recomendação para o ERP.** Emitir eventos estruturados para classificação de rede, credencial primária, criação/envio/reenvio, erro/expiração/consumo, sucesso, limite, cancelamento, alteração de e-mail e configuração. Incluir correlação, Usuário quando conhecido, Filial, IP obtido apenas de proxies confiáveis, timestamps e motivo categórico. Nunca incluir senha/código. Definir retenção, acesso e alertas para picos, múltiplas origens e indisponibilidade SMTP.

## Direção recomendada

1. Entregar a versão decidida como verificação adicional por e-mail de menor garantia, com todos os controles acima.
2. Modelar política (“prova adicional exigida”) separada do mecanismo; Rede Confiável é sinal, não identidade.
3. Evoluir para TOTP quando for necessário independência do e-mail, com segredo criptografado, ativação, replay e recuperação.
4. Preferir passkeys/WebAuthn como direção resistente a phishing, com múltiplas credenciais e recuperação.
5. Oferecer OIDC quando o cliente já tiver IdP; mapear `issuer+sub` à conta local, manter Filial/autorização no ERP e definir offboarding/indisponibilidade.

## Decisões validadas e qualificadas

- **Validadas como baseline:** 6 dígitos, 10 minutos, uso único, 5 tentativas, reenvio em 60 segundos invalidando o anterior, segredo não reversível, sessão só após validação, mensagens genéricas, fail-closed e recuperação auditada.
- **Qualificadas:** cinco erros precisam sobreviver a reenvios e ter limites agregados; hash simples não protege o pequeno espaço; “MFA/2FA por e-mail” não deve ser alegação de garantia.
- **Fora da primeira versão:** TOTP, passkeys e IdP permanecem alternativas de evolução.

