# Decidir o contrato da Rede Confiável e da borda

Type: grilling
Status: resolved
Blocked by: 02

## Question

Qual contrato de configuração e resolução de IP/CIDR deve classificar uma tentativa como originada da Rede Confiável em instalações on-premises, cobrindo IPv4/IPv6, proxies explícitos, headers saneados, acesso direto ao origin, configuração inválida, modo de observação, mudança de rede e evidências operacionais?

## Answer

### Decisão

A Rede Confiável é um sinal de contexto por instalação da Empresa Cliente. Ela dispensa somente a Verificação Adicional de Login depois de usuário, senha e Filial válidos; não autentica o Usuário, não concede permissão, não representa uma Filial e não cria exceção para administrador ou suporte.

A classificação será centralizada em um resolvedor de contexto de rede usado pelo rate limiting, auditoria e orquestrador de login. Controllers e serviços de domínio não interpretarão headers nem lerão `env()` diretamente.

### Contrato de configuração por deployment

- `mode`: enum obrigatório `disabled | observe | enforce`, desativado por padrão.
- `trusted_networks`: lista explícita de CIDRs IPv4/IPv6. Um IP isolado é normalizado para `/32` ou `/128`; hostnames, curingas, intervalos textuais e a noção implícita de “IP privado” não são aceitos.
- `trusted_proxies`: lista explícita de IPs/CIDRs dos proxies realmente existentes. `*`, “todos os proxies” e descoberta a partir do próprio header são proibidos.
- `forwarded_header_profile`: perfil fechado correspondente à borda implantada; não haverá seleção livre de qualquer header pelo cliente.
- `policy_version`: identificador estável da configuração efetiva, incluído nas decisões e nos Logins Pendentes para auditoria.

Os valores entram por `.env` somente através de um arquivo de configuração Laravel, são congelados por `config:cache` e exigem deploy/restart coordenado para mudança. Segredos não fazem parte desse contrato.

Um preflight de deploy/readiness deve rejeitar modo desconhecido, CIDR inválido ou ambíguo, proxy curinga, perfil incompatível, HTTP público quando `enforce` estiver ativo e configuração que permita acesso direto ao origin. Em execução, qualquer caso não demonstravelmente confiável resulta em `unknown`, tratado como externo; nunca existe fallback para confiável.

### Contrato da borda

Há um único caminho público previsto até o ERP:

1. quando não existe proxy anterior, a conexão chega diretamente ao Nginx versionado e o endereço do socket é a origem efetiva;
2. quando existe reverse proxy/LB, seu IP/CIDR consta explicitamente em `trusted_proxies`, ele termina ou preserva HTTPS conforme o runbook e remove/sobrescreve headers de encaminhamento recebidos do cliente;
3. firewall, bind ou regras equivalentes impedem alcançar Nginx/PHP por um caminho que contorne a borda declarada; PHP-FPM, Redis e workers continuam sem portas públicas.

O `trustProxies(at: '*')` atual deve ser substituído. Laravel só confia nos proxies e no conjunto mínimo de headers do perfil configurado. A borda não deve aplicar a allowlist da Rede Confiável como bloqueio HTTP, porque usuários externos precisam alcançar o login e concluir o código; regras de rede na borda servem para impedir bypass do origin e falsificação da origem.

### Resolução determinística da origem

O resolvedor distingue:

- `transport_peer_ip`: IP do socket que entregou a requisição;
- `effective_client_ip`: origem derivada apenas de uma cadeia autenticada por proxies explícitos;
- `network_class`: `trusted | external | unknown`;
- `reason`: código fechado que explica a decisão e o CIDR lógico que casou, quando houver.

Se o peer imediato não for proxy confiável, todo `Forwarded`/`X-Forwarded-For` é ignorado e o peer é o cliente. Se for confiável, a cadeia é percorrida da direita para a esquerda, removendo apenas hops pertencentes a `trusted_proxies`; o primeiro hop não confiável é o cliente. Header ausente quando obrigatório, malformado, duplicado de modo incompatível, com quantidade excessiva de hops ou sem origem remanescente produz `unknown`.

Endereços são parseados por biblioteca madura, normalizados antes da comparação e comparados em binário. O contrato cobre IPv4, IPv6, limites de CIDR e IPv4 mapeado em IPv6 com uma única regra canônica. Portas, zone identifiers e valores não-IP são rejeitados. Redes RFC1918/ULA/loopback não se tornam confiáveis por natureza: precisam estar explicitamente listadas e ser alcançadas pelo caminho previsto.

A classificação pode ser calculada antes da senha para rate limiting consistente, mas só influencia o avanço do login depois da validação da credencial e da Filial, evitando revelar a existência de conta ou sua política.

### Semântica dos modos

| Modo | Decisão observada | Efeito no login |
|---|---|---|
| `disabled` | Registra que a política está desligada | Preserva o fluxo legado; rede não concede nem retira acesso |
| `observe` | Calcula e audita `trusted/external/unknown` | Nunca exige o código; permite validar a configuração sem alterar o login |
| `enforce` | Calcula e audita a classe | `trusted` segue após senha; `external` e `unknown` exigem Verificação Adicional |

Passar para `enforce` requer preflight aprovado e evidência do período de observação. Reverter para `observe` ou `disabled` é mudança operacional explícita e auditada, não fallback automático por falha.

### Mudança de rede e vínculo com o Login Pendente

A classe é decidida em cada nova tentativa. Um Login Pendente iniciado como externo permanece externo durante toda a tentativa, mesmo que o IP mude ou passe a pertencer à Rede Confiável; o contexto e a versão da política ficam registrados, a mudança é auditada e reiniciar o login é a única forma de obter nova decisão.

Na primeira versão, mudar de rede depois de uma sessão autenticada não encerra nem eleva automaticamente a sessão. A política volta a ser aplicada no próximo login; isso deve ser explícito na especificação para não sugerir “dispositivo confiável” ou monitoramento contínuo.

### Evidência operacional e privacidade

Cada decisão expõe `trace_id`, modo, versão da política, classe, motivo, peer de transporte, origem efetiva, resultado da cadeia, identificador não secreto do CIDR casado e instante. Headers brutos fornecidos pelo cliente não são persistidos. Mascaramento, retenção e destino durável serão fechados no ticket de auditoria e privacidade; códigos e dados de configuração sensíveis nunca entram em log.

Métricas mínimas distinguem decisões por modo/classe/motivo, cadeias inválidas, tentativas de spoofing, mudanças de política e razão de falha do preflight, sem cardinalidade por IP. A readiness informa estado seguro e motivo acionável, sem devolver allowlists completas.

### Critérios de cobertura

A especificação deve exigir testes de:

- acesso direto, um proxy e múltiplos proxies; header forjado vindo de peer não confiável;
- header ausente, malformado, duplicado e cadeia longa;
- IPv4, IPv6, IPv4 mapeado, IP isolado e fronteiras dentro/fora de CIDR;
- ausência de CIDRs, lista inválida, proxy curinga e configuração em cache;
- matriz `disabled/observe/enforce × trusted/external/unknown`;
- mesma tentativa mudando de IP e sessão já autenticada mudando de rede;
- consistência da origem entre rate limiter, auditoria e política;
- impossibilidade de acesso público direto ao origin e ausência de portas públicas para PHP/Redis;
- ausência de segredo, header bruto e allowlist completa em logs e respostas.

### Alternativas rejeitadas

- Confiar em `Request::ip()` mantendo `trustProxies('*')`: permite que a decisão dependa de origem falsificável.
- Usar `allow/deny` da Rede Confiável no Nginx: bloquearia o fluxo externo que deve receber o código.
- Considerar toda rede privada/VPN confiável implicitamente: confunde topologia com política explícita.
- Reclassificar um Login Pendente externo como confiável após mudança de IP: cria bypass e torna a tentativa não determinística.
- Encerrar sessões existentes a cada mudança de rede na primeira versão: amplia o escopo para monitoramento contínuo sem requisito ou infraestrutura definidos.
