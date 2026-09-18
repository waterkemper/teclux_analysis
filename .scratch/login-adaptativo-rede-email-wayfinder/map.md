# Login adaptativo por rede e código por e-mail

Label: wayfinder:map

## Destination

Produzir uma análise documentada das alternativas e um prompt autocontido para `/speckit.specify`, publicado em `modules/shared/login-adaptativo-rede-email/`, para especificar autenticação adaptativa no login Laravel sem implementar o recurso nesta jornada.

## Notes

- Domínio: Plataforma Laravel / autenticação da Empresa Cliente. Consultar `grilling`, `domain-modeling` e o glossário em `laravel/CONTEXT.md`.
- Cada Empresa Cliente opera uma instalação on-premises própria, acessível pela internet de qualquer local; Empresa Cliente não é Filial.
- Preservar usuário, senha e Filial. A Rede Confiável dispensa somente a Verificação Adicional de Login; nunca substitui a identidade do Usuário.
- Quando a política estiver ativa, todos os usuários, inclusive administradores e suporte, devem concluir a Verificação Adicional de Login por Código de Acesso por E-mail fora da Rede Confiável. Esse mecanismo não deve ser apresentado como MFA, 2FA forte ou resistente a phishing.
- Primeira versão: e-mail individual já vinculado ao Usuário; 6 dígitos, validade de 10 minutos, até 5 tentativas, reenvio após 60 segundos, código anterior invalidado e segredo persistido somente como hash.
- O desafio pertence à tentativa, ao Usuário e à Filial. A sessão só nasce após a validação; não haverá “confiar neste dispositivo” na primeira versão.
- Usuário sem e-mail individual válido pode entrar pela Rede Confiável, mas fica bloqueado externamente até regularização administrativa.
- Falha de e-mail é fail-closed para acesso externo, sem código mestre ou bypass permanente. Troca de senha expirada também passa pela política adaptativa.
- Política e CIDRs serão administrados pelo ambiente/deploy da instalação, não por tela do ERP. Configuração ou cadeia de proxy inválida classifica a tentativa como externa.
- Backend deve aceitar tráfego somente pela borda prevista, confiar apenas em proxies explícitos e nunca usar cabeçalho de IP fornecido livremente pelo cliente.
- Rollout: desativado por padrão, modo de observação, validação operacional e então enforcement explícito; mudança e recuperação devem ser auditadas.
- Exceção a “plan, don't do”: o mapa inclui a publicação final da análise e do prompt `/speckit.specify`, pois esses artefatos são o destino solicitado. Não inclui executar o prompt nem alterar o Laravel.
- Reutilizar, sem duplicar conclusões, a pesquisa de [Produção segura e acesso contínuo do ERP Laravel](../laravel-producao-acesso-wayfinder/map.md).

## Decisions so far

<!-- Uma linha por ticket resolvido: síntese curta e link; o detalhe permanece no ticket. -->

- [Inventariar seams atuais de login, e-mail, sessão e proxy](issues/02-inventariar-seams-login-email-proxy.md) — O login normal e a troca de senha criam sessão diretamente; há bases reutilizáveis de Redis, rate limit, mail, filas, trace e testes, mas faltam desafio pendente, e-mail de autenticação mantido/verificado, auditoria durável e borda de proxy confiável.
- [Pesquisar alternativas e requisitos de segurança para autenticação adaptativa](issues/01-pesquisar-alternativas-e-requisitos-seguranca.md) — E-mail é verificação adicional transitória, não MFA conforme NIST; o baseline exige ciclo atômico e rate limits agregados, preservando evolução para TOTP, passkeys ou IdP.
- [Decidir o modelo do desafio e do login pendente](issues/03-decidir-modelo-desafio-login-pendente.md) — Login Pendente durável no banco, por navegador e limitado por Usuário, usa gerações não prorrogáveis, HMAC contextual e consumo atômico fail-closed antes de criar a sessão.
- [Decidir o contrato da Rede Confiável e da borda](issues/04-decidir-contrato-rede-confiavel.md) — A classificação centralizada usa CIDRs e proxies explícitos, saneia a cadeia da direita para a esquerda, trata erro como externo e evolui por disabled → observe → enforce sem bloquear o login externo na borda.
- [Decidir entrega, experiência e recuperação do código](issues/05-decidir-entrega-experiencia-recuperacao.md) — E-mail de Acesso separado e verificável, entrega assíncrona sem segredo persistido, UX não enumerável e recuperação local auditada mantêm o login externo fail-closed.
- [Decidir controles de abuso, auditoria e privacidade](issues/06-decidir-abuso-auditoria-privacidade.md) — Limites em camadas e bloqueio externo durável resistem a reinício/evasão; eventos append-only minimizados, retenção definida e alertas sem fallback sustentam investigação e operação.
- [Prototipar o fluxo do login adaptativo](issues/07-prototipar-fluxo-login-adaptativo.md) — Validada a opção A como continuação focada do login existente, reutilizando shell e componentes de autenticação, Instrument Sans e os utilitários semânticos ligados a `--erp-*`; as opções B e C foram descartadas.

## Not yet specified


## Out of scope

- Implementar código, migrations, infraestrutura, configuração de produção ou executar `/speckit.specify`.
- Substituir usuário e senha por IP, permitir acesso anônimo ou bloquear todo acesso externo.
- Criar tela administrativa para política/CIDRs na primeira versão.
- Incluir “confiar neste dispositivo”, SMS, WhatsApp, TOTP, passkeys, SSO ou provedor de identidade na primeira versão; essas opções entram apenas na comparação e evolução.
- Redesenhar permissões funcionais, Filiais ou autorizações sensíveis internas aos módulos.
