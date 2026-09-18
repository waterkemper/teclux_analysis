# Prompt para `/speckit.specify` — Login adaptativo por rede e código por e-mail

`/speckit.specify`

Crie uma especificação funcional, visual, técnica, operacional e de testes para implementar autenticação adaptativa no login Laravel do ERP tecLUX. Cada **Empresa Cliente** opera sua própria instalação on-premises, acessível pela internet, e pode possuir várias **Filiais**.

Não implemente nesta etapa. Produza somente a especificação pronta para planejamento e implementação. Não execute migrations, não altere Laravel, Nginx, Compose ou infraestrutura e não peça que `/speckit.specify` implemente. Antes de concluir, inspecione os arquivos atuais; se uma afirmação deste prompt divergir do código, registre a divergência com evidência concreta sem enfraquecer os invariantes de segurança.

## Objetivo

Preservar o login por Usuário, senha e Filial e aplicar uma política por instalação:

1. `disabled`: preservar o comportamento atual;
2. `observe`: classificar e auditar a origem sem alterar o resultado do login;
3. `enforce`: após credencial e Filial válidas, origem comprovadamente `trusted` conclui o login sem código; origem `external` ou `unknown` cria um **Login Pendente** e exige **Código de Acesso por E-mail** antes de criar a sessão.

A **Rede Confiável** dispensa somente a **Verificação Adicional de Login**. Ela nunca substitui Usuário/senha, não seleciona Filial, não concede Permissão e não cria exceção para administrador ou suporte.

O Código de Acesso por E-mail é mecanismo transitório de menor garantia. A especificação não pode chamá-lo de MFA/2FA forte, conforme NIST ou resistente a phishing. Modele a política de prova adicional separada do mecanismo para permitir futura adoção de TOTP, passkeys/WebAuthn ou IdP.

## Vocabulário obrigatório

Use os termos do `laravel/CONTEXT.md`:

- **Empresa Cliente**: organização que usa uma instalação on-premises; não é a Filial.
- **Filial**: contexto operacional selecionado e autorizado no login.
- **Rede Confiável**: CIDRs explícitos que dispensam somente a verificação adicional.
- **Verificação Adicional de Login**: barreira posterior à senha correta; não é MFA forte.
- **Login Pendente**: tentativa primária válida, ainda sem sessão autenticada.
- **Código de Acesso por E-mail**: código de uso único ligado ao Login Pendente.
- **E-mail de Acesso**: endereço individual e verificado em `usuarios_auth.email`, separado da conta operacional.
- **Bloqueio de Verificação Externa**: bloqueio temporário do caminho adicional, sem bloquear Rede Confiável.
- **Evento de Segurança de Acesso**: evidência append-only de decisão/transição de acesso.

Não use “empresa” como sinônimo de Filial, “sessão parcial” para Login Pendente, “e-mail da Filial” para E-mail de Acesso ou “MFA por e-mail” para o mecanismo.

## Investigação obrigatória

Inspecione e cite pelo menos:

- `laravel/backend/routes/web.php`;
- `app/Http/Controllers/Auth/LoginController.php`;
- `app/Http/Requests/LoginRequest.php`;
- `app/Services/Auth/LoginService.php`;
- `app/Services/Auth/UsuarioAuthLookup.php`;
- `app/Services/Auth/LoginAuditLogger.php`;
- `app/Http/Middleware/AssignRequestTrace.php`;
- `app/Services/User/UsersService.php`;
- migration/model de `usuarios_auth`;
- `resources/js/Pages/Auth/Login.tsx`;
- cadastro em `resources/js/Pages/Cadastros/Users/`;
- `resources/js/Layouts/AuthLayout.tsx`, `Components/Auth/LoginBrandPanel.tsx`, `Components/Auth/AuthAlertBanner.tsx`, `Components/Button.tsx` e `Components/Input.tsx`;
- `resources/css/app.css` e `docs/architecture/erp-theme-tokens.md`;
- `bootstrap/app.php`, `config/auth.php`, `config/session.php`, `config/mail.php`;
- `app/Mail/MailManager.php` e exemplos atuais de mailables enfileirados;
- Compose, Nginx, Horizon/workers e documentação de produção;
- `tests/Feature/Auth/LoginTest.php`, `tests/Unit/Auth/LoginServiceTest.php`, `UsuarioAuthLookupTest`, `FilialSessaoObrigatoriaTest` e testes do Cadastro de Usuários.

Classifique descobertas como `CONFIRMADO`, `INFERIDO`, `DÚVIDA`, `NÃO LOCALIZADO`, `DIVERGENTE`, `POSSÍVEL BUG ATUAL` ou `DECISÃO NOVA`. Não converta bugs ou limitações atuais em requisitos.

## Invariantes de autenticação

1. Usuário, senha, estado da credencial/Usuário e acesso à Filial são validados antes de a rede influenciar o avanço.
2. Antes dessa validação, respostas e tempos devem evitar enumeração de conta, política ou e-mail.
3. Login Pendente não autentica o guard, não preenche Filial ativa, não atualiza `last_login_at` e não acessa rota autenticada.
4. A sessão só nasce depois de Rede Confiável válida ou consumo atômico do código.
5. Senha expirada confirma a nova senha, avança a revisão de segurança e retorna ao mesmo orquestrador adaptativo; nunca chama login direto como bypass.
6. Todos os Usuários, inclusive administradores e suporte, seguem a mesma política em origem externa.
7. Banco, Redis, fila, SMTP, auditoria, HMAC ou configuração desconhecidos nunca transformam origem externa em confiável.
8. Não existe código mestre, bypass permanente, “confiar neste dispositivo”, recuperação externa informal nem fallback automático de `enforce`.

## Rede Confiável e borda

Defina um resolvedor centralizado, usado por política, rate limiting e auditoria. Controllers e serviços de domínio não interpretam headers nem leem `env()` diretamente.

O contrato de configuração por deployment contém:

- `mode: disabled | observe | enforce`, desativado por padrão;
- `trusted_networks`: CIDRs explícitos IPv4/IPv6; IP isolado normalizado para `/32` ou `/128`;
- `trusted_proxies`: IPs/CIDRs explícitos dos proxies reais;
- `forwarded_header_profile`: perfil fechado da borda implantada;
- `policy_version`: versão estável incluída em decisões e Logins Pendentes.

Proíba curingas, hostnames, intervalos textuais, confiança implícita em RFC1918/ULA/loopback, `trustProxies('*')` e descoberta de proxy a partir do header. Valores entram por configuração Laravel, participam de `config:cache` e mudam somente por deploy/restart coordenado.

O resolvedor produz `transport_peer_ip`, `effective_client_ip`, `network_class: trusted | external | unknown`, `reason`, versão e identificador não secreto do CIDR casado. Se o peer não for proxy confiável, ignore headers. Se for, caminhe da direita para a esquerda removendo apenas proxies explícitos; o primeiro hop não confiável é o cliente. Header ausente, malformado, incompatível, excessivo ou sem origem restante produz `unknown`.

Use parser maduro, comparação binária e regra canônica para IPv4, IPv6 e IPv4 mapeado. Portas, zone identifiers e valores não-IP são inválidos. A borda deve sanear headers e impedir acesso público direto ao origin; PHP-FPM, Redis e workers não têm portas públicas. Não use allowlist de Rede Confiável para bloquear HTTP no Nginx, pois o login externo precisa continuar acessível.

Um Login Pendente criado como externo permanece externo mesmo após troca de IP/rede; para nova classificação o Usuário cancela e reinicia. Sessão já autenticada não é encerrada ou elevada por mudança de rede nesta versão.

## Login Pendente e máquina de estados

Modele Login Pendente como agregado durável no banco. Redis é apenas rate limit/cache auxiliar e nunca fonte de promoção.

Identidade e concorrência:

- cada navegador/tentativa tem pendente e código próprios;
- iniciar novo login no mesmo navegador cancela o anterior;
- no máximo três pendentes ativos por Usuário; exceder rejeita a nova criação sem cancelar silenciosamente outro dispositivo;
- o navegador recebe somente ID opaco e aleatório em cookie de sessão `Secure`, `HttpOnly`, `SameSite`; POSTs usam CSRF;
- proíba senha, código, Usuário ou Filial em URL, localStorage ou cookie persistente;
- concluir um pendente não consome os demais;
- alteração de senha, E-mail de Acesso, estado/revisão da credencial ou recuperação cancela os pendentes afetados.

Estados não terminais:

- `aguardando_envio`: criado sem geração utilizável;
- `aguardando_codigo`: geração vigente aceita pelo contrato SMTP e disponível para validação.

Estados terminais:

- `consumido`: validação correta venceu a disputa;
- `expirado`: prazo total encerrado;
- `bloqueado`: cinco erros ou controle de abuso aplicável;
- `cancelado`: reinício, cancelamento ou revogação;
- `falha_entrega`: canal não tornou uma geração utilizável.

O agregado registra Usuário, Filial, criação/expiração, revisão de segurança, política/versão aplicada, classe/reason de rede, IP observado, contador de erros e geração monotônica. Use revisão de segurança explícita; não use `updated_at` genérico.

Antes do consumo, releia Usuário/credencial ativos, Filial autorizada, revisão, endereço/geração, política e estado do pendente. Código correto, incremento de erro, expiração, bloqueio, consumo e substituição são mutuamente exclusivos por lock ou compare-and-swap. Apenas a requisição vencedora:

1. consome o pendente;
2. autentica o guard;
3. regenera o ID de sessão;
4. grava a Filial ativa;
5. atualiza último login;
6. registra Evento de Segurança;
7. remove cookie/estado pendente.

Não há transação distribuída entre banco e Redis/session. Se falhar depois do consumo e antes da resposta autenticada, o pendente permanece consumido e o Usuário começa novo login; jamais reabra o mesmo código.

## Código, gerações e verificador

- código CSPRNG de exatamente 6 dígitos;
- prazo total de 10 minutos desde a criação do Login Pendente;
- no máximo 5 códigos incorretos somados entre todas as gerações;
- reenvio manual somente após 60 segundos;
- no máximo 3 reenvios manuais por Login Pendente;
- reenvio e retentativa de transporte criam geração nova e invalidam atomicamente a anterior;
- envio/reenvio não prorrogam prazo nem reiniciam erros;
- código de geração anterior, pendente terminal ou job atrasado nunca é aceito/enviado;
- consumo ocorre uma vez e é vinculado a pendente, Usuário, Filial, revisão e geração.

Persista apenas HMAC/MAC do código, com chave dedicada, versionada e fora do banco, ligado ao ID do pendente e à geração. Compare em tempo constante. Hash simples de seis dígitos e password hash isolado não mitigam enumeração offline do pequeno espaço. Nunca armazene reversivelmente o código para permitir reenvio.

## E-mail de Acesso

`usuarios_auth.email` é a fonte autoritativa do **E-mail de Acesso** e pode continuar como identificador de login. `usuarios.email`/`email_conta` permanece conta operacional de mensagens e não deve ser copiado, sincronizado ou usado para códigos.

O Cadastro de Usuários deve exibir campos e estados distintos. E-mail de Acesso é individual, normalizado sem diferenciar caixa e único na instalação. Modele ausência, candidato pendente, ativo verificado e revogado, com instante de verificação e revisão de segurança.

Cadastro/troca:

1. novo valor cria candidato pendente, sem substituir imediatamente o ativo;
2. envia link aleatório, de uso único, válido por 24 horas e persistido somente como hash;
3. nova emissão invalida link anterior;
4. consumo válido apenas prova posse e promove atomicamente o candidato; não autentica nem cria sessão;
5. troca normal mantém o endereço anterior ativo até a confirmação do novo;
6. ativação, substituição ou revogação avança revisão de segurança, cancela pendentes/códigos e encerra sessões;
7. endereços anterior e novo recebem aviso quando possível, sem código/link sensível para o anterior.

Revogação emergencial é operação separada, restrita a administrador autenticado pela Rede Confiável, com permissão e motivo auditados. Ela invalida o ativo imediatamente e deixa o Usuário sem acesso externo até verificar outro endereço.

Migração:

- nunca copiar `usuarios.email`;
- preservar `usuarios_auth.email` existente como identificador, mas tratá-lo como não verificado para entrega;
- exigir revisão administrativa e prova de posse;
- usar `observe` para inventariar ausentes, inválidos, duplicados e pendentes;
- habilitar `enforce` somente após decisão operacional explícita sobre não regularizados.

Usuário sem E-mail de Acesso verificado pode entrar pela Rede Confiável, mas não recebe código nem possui fallback externo.

## Entrega assíncrona

Use fila durável e mailer lógico exclusivos de segurança, ainda que compartilhem o servidor SMTP da instalação.

- O job contém apenas IDs não secretos.
- O código nasce em memória no worker; somente o HMAC contextual é persistido.
- Proíba drivers `log`/`array`, TLS/certificado/hostname relaxados e fallback para conta operacional.
- Não exponha segredo em banco, payload serializado, `failed_jobs`, logs ou telemetria.
- Exija readiness de configuração, TLS, conectividade SMTP, Redis, worker e fila antes de `enforce`.
- Cada solicitação admite até 3 tentativas automáticas, com backoff de 5, 15 e 30 segundos e interrupção após expiração.
- Cada tentativa automática cria geração nova; timeout ambíguo pode produzir vários e-mails, portanto a mensagem informa que só o código mais recente funciona.
- A interface só muda para “código enviado” após aceitação SMTP; aceitação não é garantia de chegada.
- Falha permanente termina em `falha_entrega` e mantém acesso externo fechado.

O e-mail identifica ERP e Empresa Cliente, destaca o código, informa validade de 10 minutos, prevalência do mais recente, Filial, horário e orientação para avisar a administração. Não inclui senha, link de login, IP completo ou dado sensível.

## Recuperação local

Especifique comando Artisan executado no servidor on-premises por operador autorizado, exigindo Usuário-alvo, identidade do operador e motivo. Ele pode revogar endereço, pendentes e sessões, cadastrar candidato e enviar o link normal.

O comando nunca marca endereço como verificado, autentica Usuário, cria sessão, imprime token/código, gera código mestre ou desativa política. Falha de SMTP/fila deve ser reparada, não contornada.

## Controles de abuso

Separe falhas de senha e de código. Código incorreto não incrementa `usuarios_auth.login_attempts`; senha correta não limpa contador do desafio.

Defaults seguros, configuráveis e versionados por deployment:

| Operação | Login Pendente | Usuário | IP efetivo | Instalação |
|---|---:|---:|---:|---:|
| Credencial primária | — | 5 erros/15 min | 10 req/min por identificador+IP | métrica |
| Criar desafio | um por tentativa | 3/15 min; 20/24 h | 30/15 min | alerta agregado |
| Reenvio manual | 3 nos 10 min | 5/15 min; 20/24 h | 30/15 min | alerta agregado |
| Código incorreto | 5 entre gerações | bloqueio externo/15 min | 30/15 min | alerta agregado |
| E-mails | gerações vigentes | incluído acima | incluído acima | alerta em 100/15 min |
| Validações incorretas | incluído nas 5 | incluído no bloqueio | incluído nas 30 | alerta em 200/15 min |

O quinto erro encerra o Login Pendente e cria **Bloqueio de Verificação Externa** durável por 15 minutos. Novo login, navegador, Filial, reenvio ou IP não contorna. O bloqueio não afeta login pela Rede Confiável e não é limpo por senha correta.

Liberação antecipada exige administrador autenticado pela Rede Confiável, permissão específica e motivo; cancela desafios, exige tentativa nova, gera evento/notificação e não pode ocorrer externamente ou por confirmação verbal.

Verificação e incremento são atômicos. Resposta limitada usa mensagem da fase e `Retry-After`, sem revelar qual contador disparou. Não crie chaves de alta cardinalidade diretamente de input não normalizado.

Contador de erros e bloqueio ficam no banco. Janelas agregadas ficam no Redis com operação atômica e TTL. Redis indisponível fecha criação, reenvio e validação externos; não use fallback em memória. Limite por instalação alerta e permite contenção seletiva, nunca bloqueio global automático vulnerável a negação de serviço.

## Eventos, privacidade e retenção

Crie tabela append-only de **Eventos de Segurança de Acesso** como fonte autoritativa; logs estruturados e métricas são projeções. Transições críticas persistem estado e evento na mesma transação. Falha de auditoria aborta criação/consumo/cancelamento de desafio, sessão, bloqueio, alteração/revogação de e-mail, recuperação e mudança de política.

O catálogo fechado deve cobrir:

- classificação de rede e política;
- credencial primária aceita/rejeitada;
- Login Pendente criado, enviado, cancelado, expirado, bloqueado e consumido;
- entrega enfileirada, aceita, retentada e falha;
- código reenviado, rejeitado e aceito;
- rate limit e bloqueio iniciado, expirado ou liberado;
- sessão criada;
- E-mail de Acesso solicitado, verificado, trocado e revogado;
- recuperação local;
- política, CIDRs ou proxies alterados;
- readiness degradado/restaurado;
- consulta/exportação da auditoria e retenção executada.

Tipo, resultado e motivo são códigos versionados. Evento pode conter ID, UTC, `trace_id`, Usuário/Filial/ator quando conhecidos, ID opaco do pendente, revisões, modo/versão da política e classe/motivo da rede.

Minimização obrigatória:

- IP completo apenas em evento ligado a Usuário conhecido e com acesso restrito;
- identificador desconhecido vira HMAC rotativo do valor normalizado;
- navegador/SO são categorias, sem `User-Agent` bruto;
- e-mail aparece mascarado na UI e como revisão/identidade interna na auditoria;
- proibir senha, código, verificador/HMAC, token, cookie, ID de sessão, segredo, headers brutos e corpo/payload completo de e-mail;
- métricas não usam IP, Usuário, login ou e-mail como labels;
- tentativas anônimas volumosas ficam em telemetria controlada e geram resumo durável por janela, sem linha por requisição no banco.

Retenção padrão:

- autenticação comum: 180 dias;
- alteração/revogação de E-mail de Acesso, recuperação, política/CIDRs/proxies e ações administrativas: 365 dias;
- logs: 30 dias;
- métricas: 90 dias.

Prazos são configuráveis, validados e não indefinidos por padrão. Rotina agendada remove lotes de forma idempotente e registra resumo. Somente função administrativa específica de segurança consulta/exporta a trilha, em modo somente leitura; o próprio acesso é auditado.

## Readiness, alertas e resposta

`enforce` só pode ser habilitado com preflight aprovado para:

- modo/CIDRs/proxies/perfil válidos e `trustProxies('*')` removido;
- HTTPS e origin inacessível fora da borda;
- chave HMAC válida e versionada;
- banco/auditoria;
- Redis;
- fila e worker exclusivos;
- SMTP de segurança com TLS/certificado/hostname válidos;
- ausência de drivers `log`/`array`.

Alertas críticos imediatos: auditoria indisponível, HMAC/configuração inválida, recuperação local e mudança de modo/CIDRs/proxies. Alertas críticos após 5 minutos: Redis, worker ou mailer indisponível.

Avisos: fila acima de 60 segundos; falha de entrega maior que 20%/5 min; 10 cadeias inválidas/5 min; dois bloqueios do mesmo Usuário/24 h; 100 envios ou 200 códigos incorretos/15 min na instalação.

Deduplicar alertas por 15 minutos. Usar canal operacional independente do mailer de códigos e manter evidência local quando a integração externa falhar. Alertas carregam release, instalação, severidade, motivo e runbook, sem segredo ou dado pessoal excessivo.

Resposta operacional nunca rebaixa `enforce`, amplia CIDRs/proxies, libera Usuário, cria bypass ou reclassifica origem. O início e a liberação do Bloqueio de Verificação Externa notificam o E-mail de Acesso com horário, Filial e orientação, sem código, link ou IP completo; falha da notificação não desfaz o bloqueio.

## Experiência e layout — opção A confirmada

Adote a **opção A — passo focado**. A verificação é continuação visual direta do login, na mesma coluna do formulário. Preserve o painel institucional em desktop e sua versão compacta no celular, mostre “Etapa 2 de 2 · Verificação adicional” e mantenha uma ação principal clara.

Contrato visual obrigatório:

- reutilizar `AuthLayout`, `LoginBrandPanel`, `AuthAlertBanner`, `Button` e `Input`;
- herdar `Instrument Sans` por `font-sans`, sem fonte própria;
- usar aliases semânticos ligados a `--erp-*`: `surface-*`, `content-*`, `border-*`, `action-*` e `status-*`;
- reservar `teclux-*` à marca/overlay institucional já previsto;
- não usar `slate-*`, `gray-*`, branco ou hex como papéis de canvas, painel, texto, borda, ação ou status;
- respeitar tema efetivo, contraste WCAG 2.2 AA, foco visível, reflow/zoom, `prefers-reduced-motion` e alvos de toque;
- estados devem ter categoria/texto/ícone quando útil e nunca depender apenas de cor;
- navegação por teclado, label visível, `inputmode=numeric`, `autocomplete=one-time-code`, `aria-live=polite` para progresso e `role=alert`/`assertive` somente para bloqueios/erros relevantes;
- ao entrar na etapa, focar o campo de código quando ele estiver disponível; ao retornar, focar adequadamente o formulário inicial;
- não exibir a barra exploratória do protótipo nem as opções B/C na implementação.

Estados de interface:

- `trusted`: acesso continua sem código, sem apresentar a rede como identidade;
- `sending`: informar envio em andamento, impedir submissão prematura e acompanhar estado durável;
- `sent`: mostrar endereço mascarado, campo de seis dígitos, validade e reenvio;
- `cooldown`: reenvio desabilitado com contagem/horário disponível;
- `invalid`: mensagem segura e tentativas restantes, sem revelar o código esperado;
- `expired`: exigir retorno ao login completo;
- `missing_email`: orientar regularização pela administração na Rede Confiável;
- `operational_failure`: referência correlacionável, sem host/diagnóstico SMTP;
- `blocked`: informar prazo e orientação, sem expor qual limite interno disparou;
- `verified`: concluir sessão e navegar ao ERP, evitando tela de sucesso enganosa antes do commit.

A tela não permite editar E-mail de Acesso. Antes da validação primária, não mostra endereço nem revela se o Usuário existe. Depois dela, mostra somente forma mascarada, como `j***@e***.com`.

Cancelar ou voltar invalida/cancela o Login Pendente conforme o contrato e retorna ao login de Usuário, senha e Filial. Atualização, múltiplas abas, botão voltar, dupla submissão e perda de cookie devem ter comportamento explícito e fail-closed.

## Endpoints e separação de responsabilidades

Defina endpoints públicos, porém CSRF-protegidos e rate-limited, para:

- apresentar/consultar estado do Login Pendente sem dado sensível;
- validar código;
- solicitar reenvio;
- cancelar e voltar ao login;
- consumir link de verificação do E-mail de Acesso sem criar sessão.

Não coloque código, e-mail, Usuário, Filial, segredo ou ID enumerável em query string. O token do link de verificação pode estar na URL somente na forma opaca necessária ao próprio fluxo, deve ser uso único, expirar e não aparecer em logs de aplicação; proponha mitigação de referer e retenção de access logs.

Prefira módulos profundos e interfaces pequenas:

- resultado tipado de validação primária, separado de conclusão da sessão;
- orquestrador único usado por login normal e senha expirada;
- resolvedor de contexto de rede;
- agregado/repositório de Login Pendente e gerações;
- política de exigência separada do mecanismo de verificação;
- porta/mailer de segurança;
- gravador de Eventos de Segurança transacional;
- serviço de E-mail de Acesso e revisão de segurança.

Não espalhe leitura de configuração, header, estado ou rate limit pelos controllers. Não reutilize token de ativação/reset, prova de operação sensível, mailable de documento ou `usuarios.email`.

## Rollout e rollback

Planeje:

1. migrations/modelos e código implantados com `mode=disabled`;
2. cadastro e verificação do E-mail de Acesso disponíveis pela Rede Confiável;
3. hardening de proxies/origin, mailer/fila de segurança, HMAC, auditoria e readiness;
4. `observe` por período definido, com métricas de `trusted/external/unknown`, cadeia inválida e cobertura de e-mails;
5. regularização de ausentes/duplicados/não verificados;
6. preflight e aprovação operacional explícita;
7. `enforce` por instalação;
8. acompanhamento de entrega, bloqueios, unknown e falhas.

Rollback de incidente é mudança explícita, auditada e autorizada para `observe` ou `disabled`; nunca automático. Deve registrar motivo, ator, versão anterior/nova e alertar. Reativação exige novo preflight. Alteração de CIDR/proxy segue deploy, `config:cache` e restart coordenado.

Defina runbooks para SMTP/fila, Redis, banco/auditoria, chave HMAC, cadeia de proxy, usuário sem e-mail, bloqueio e recuperação local.

## Estratégia de testes

Use o maior seam funcional disponível, PHPUnit 12 no backend e Vitest/Testing Library no frontend, seguindo a infraestrutura do repositório.

### Autenticação e sessão

- regressão completa do login atual: Usuário/login ou e-mail, senha inválida, bloqueio, inativo, Filial negada, administrador, preferência de Filial e logout;
- matriz `disabled/observe/enforce × trusted/external/unknown`;
- nenhum guard, Filial ativa, `last_login_at` ou rota autenticada antes da conclusão;
- Rede Confiável conclui somente depois de credencial/Filial válidas;
- externo exige código para Usuário comum, administrador e suporte;
- senha expirada retorna ao orquestrador adaptativo;
- regeneração de sessão, CSRF, cookies e ausência de dados em URL/Web Storage;
- falha após consumo não reabre código.

### Rede e configuração

- direto, um proxy e múltiplos proxies;
- header forjado de peer não confiável;
- header ausente, duplicado, malformado, cadeia longa e perfis incompatíveis;
- IPv4, IPv6, IPv4 mapeado, IP isolado e fronteiras dentro/fora do CIDR;
- RFC1918/ULA/loopback não listados;
- `trustProxies('*')`, CIDR inválido, proxy curinga, HTTP público e acesso direto ao origin rejeitados;
- configuração em cache e consistência entre política, rate limiter e auditoria;
- mudança de IP no pendente e em sessão já autenticada.

### Login Pendente, código e concorrência

- todos os estados e transições válidas/inválidas;
- prazo total fixo, uso único, cinco erros entre gerações e bloqueio;
- reenvio após 60 segundos, máximo de três e invalidação da geração anterior;
- validação concorrente, duplo submit, consumo versus reenvio/expiração/bloqueio;
- máximo de três pendentes por Usuário e reinício no mesmo navegador;
- mudança de senha/e-mail/revisão e cancelamento;
- HMAC contextual/versionado, comparação e rotação de chave;
- varredura de banco, jobs, `failed_jobs`, logs e respostas comprovando ausência de código/segredo.

### E-mail de Acesso e entrega

- cadastro inicial, normalização, unicidade e endereço compartilhado rejeitado;
- candidato, troca concorrente, reemissão, link expirado/reutilizado e consumo que não autentica;
- endereço antigo mantido até promoção e revogação emergencial;
- migração sem copiar `usuarios.email` e existente não presumido verificado;
- Usuário ausente/não verificado em Rede Confiável e externa;
- SMTP aceito, falha, timeout ambíguo, três retentativas, backoff e worker atrasado;
- cada retentativa gera código novo; nenhum envio após expiração;
- drivers/TLS inválidos bloqueiam readiness;
- mascaramento e não enumeração;
- recuperação Artisan, autorização, motivo, revogação e impossibilidade de forçar verificação.

### Abuso, auditoria e operação

- cada limite isolado e combinações por pendente/Usuário/IP/instalação;
- evasão por navegador, Filial e troca de IP;
- Redis indisponível e ausência de fallback;
- liberação antecipada somente local/autorizada;
- falha de auditoria abortando cada transição crítica;
- catálogo fechado, schema e payload sem segredos;
- resumo durável para anônimos e cardinalidade hostil;
- retenção em lote, autorização de leitura/exportação e auditoria do acesso;
- alertas, limiares, deduplicação, canal independente e falha do canal;
- garantia de que incidente não relaxa a política.

### Interface

- opção A em desktop, tablet, viewport estreita, zoom e reflow;
- estados sending/sent/cooldown/invalid/expired/missing/failure/blocked/verified;
- foco inicial/retorno, tabulação, leitor de tela, `aria-live`, `role=alert`, contraste e reduced motion;
- `Button`, `Input`, alertas e superfícies usando tokens semânticos;
- ausência de cores físicas como papéis da opção A;
- atualização, múltiplas abas, navegação voltar, perda de estado e retry;
- não usar snapshots frágeis de classes como única prova.

## Critérios de aceitação

1. Usuário, senha e Filial permanecem obrigatórios em todos os modos.
2. Rede Confiável dispensa somente a verificação adicional e somente em `enforce`.
3. `external` e `unknown` exigem código em `enforce` para todos os perfis.
4. Nenhuma sessão ou acesso ao ERP existe durante Login Pendente.
5. Login normal e senha expirada atravessam o mesmo orquestrador.
6. Origem não pode ser falsificada por headers ou acesso direto ao origin.
7. Configuração inválida falha fechada e impede preflight de `enforce`.
8. Código possui 6 dígitos, 10 minutos, uso único e cinco erros totais.
9. Reenvio após 60 segundos cria geração nova sem prorrogar prazo/erros.
10. HMAC contextual é a única prova persistida; nenhum segredo vaza.
11. Corridas permitem no máximo um consumo e uma criação de sessão.
12. E-mail de Acesso é individual, verificado e separado de `usuarios.email`.
13. Migração nunca presume posse do endereço existente.
14. Entrega é assíncrona, durável, TLS-validada e fail-closed.
15. Usuário sem e-mail verificado não possui fallback externo.
16. Quinto erro cria bloqueio externo de 15 minutos sem afetar Rede Confiável.
17. Rate limits agregados sobrevivem a reenvio, navegador, Filial e IP.
18. Transições críticas e eventos append-only são atômicos.
19. Retenção, acesso e minimização impedem segredos/dados excessivos.
20. Readiness e alertas tornam falhas acionáveis sem relaxar segurança.
21. Rollout percorre disabled → observe → enforce com aprovação explícita.
22. Rollback é explícito, auditado e reversível.
23. A interface implementa somente a opção A e mantém o padrão visual ERP.
24. Estados são acessíveis, responsivos e não dependem apenas de cor.
25. Testes atuais de login, sessão, Filial e cadastro não sofrem regressão.

## Alternativas rejeitadas

- chamar e-mail de MFA/2FA forte;
- usar `usuarios.email` ou e-mail compartilhado;
- marcar endereço migrado/administrativo como verificado;
- envio síncrono ou armazenamento reversível do código;
- hash simples de seis dígitos;
- autenticar guard antes do código;
- manter `trustProxies('*')` ou confiar em qualquer rede privada;
- allowlist HTTP que bloqueia todo acesso externo;
- reclassificar pendente após mudança de rede;
- limitar apenas por IP ou apenas por pendente;
- bloqueio automático global da instalação;
- usar logs best-effort como única auditoria;
- persistir cada tentativa anônima ou payload bruto;
- fallback em memória quando Redis falha;
- código mestre, link impresso ou suporte verbal;
- tela administrativa de política/CIDRs nesta versão;
- implementar as opções visuais B ou C.

## Entregáveis de `/speckit.specify`

Antes de decompor tarefas, entregue:

1. diagnóstico e evidências do código atual;
2. glossário e fronteiras Empresa Cliente/Filial/Rede Confiável;
3. modelo de domínio, estados e invariantes;
4. contratos de configuração, proxy e resolução de origem;
5. contratos HTTP, cookie, CSRF e sessão;
6. contrato de E-mail de Acesso, migração e recuperação;
7. contrato de fila/mailer, gerações e HMAC;
8. rate limits, bloqueio e concorrência;
9. catálogo de eventos, privacidade, retenção e autorização;
10. readiness, métricas, alertas e runbooks;
11. especificação visual/acessível da opção A;
12. rollout, rollback e riscos;
13. matriz de testes e critérios de aceite;
14. dúvidas ou divergências remanescentes claramente marcadas.

## Fora de escopo

- implementar qualquer arquivo durante `/speckit.specify`;
- executar o prompt ou gerar plano/tarefas de implementação nesta etapa;
- substituir Usuário/senha por IP ou permitir acesso anônimo;
- tela administrativa de política, CIDRs ou proxies na primeira versão;
- dispositivo confiável, SMS, WhatsApp, TOTP, passkeys, SSO ou IdP na primeira versão;
- monitorar continuamente ou encerrar sessão por mudança de rede;
- redesenhar Filiais, Permissões ou autorizações internas dos módulos;
- alterar e-mail operacional ou reutilizar mailables de documentos;
- alegar garantia de MFA, conformidade NIST ou resistência a phishing.
