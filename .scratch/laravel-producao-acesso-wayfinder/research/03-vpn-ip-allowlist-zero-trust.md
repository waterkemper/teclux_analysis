# Pesquisa — VPN, allowlist, private ingress e Zero Trust para o ERP

- **Ticket:** \`03-comparar-vpn-ip-allowlist-e-acesso-zero-trust.md\`
- **Data:** 2026-08-04
- **Escopo:** VPN site-to-site, VPN por usuário, allowlist de IP em firewall/reverse proxy, private ingress e identity-aware proxy/Zero Trust para ERP com dados fiscais, financeiros e operacionais.
- **Método:** fontes primárias/autoridades técnicas e inspeção somente leitura da estrutura local. **Fatos** e **inferências** estão separados. Não houve implementação.

## Resumo executivo

Para este ERP, a opção mais segura e operável é uma defesa em camadas:

1. HTTPS e um único ponto de entrada controlado;
2. private ingress ou firewall que impeça acesso direto aos serviços;
3. VPN site-to-site para filiais/redes conhecidas;
4. VPN por usuário ou identity-aware proxy/ZTNA para funcionários e suporte remoto;
5. allowlist de IP como barreira complementar, nunca como identidade;
6. autenticação de sessão e autorização de negócio no Laravel.

**Inferência principal:** para ERP web, um identity-aware proxy/ZTNA tende a oferecer a melhor experiência remota (SSO/MFA, grupos e sessão renovável sem login a cada requisição), enquanto site-to-site é mais natural para filiais. Se não houver IdP/proxy adequado, VPN por usuário é o caminho pragmático. Private ingress reduz muito a exposição, mas precisa de VPN, peering ou proxy para ser acessível.

Rede não substitui autenticação: IP informa origem de rede, não usuário, dispositivo íntegro, filial permitida, papel ou autorização para aprovar pagamento/emitir documento. O Laravel deve continuar autenticando e autorizando.

## Contexto observado no repositório

### Fatos

- A produção publica somente o Nginx no host Docker com \`\${NGINX_PORT:-8080}:80\`; PHP-FPM, Redis e workers não publicam portas. A rede é uma bridge definida como \`app-net\`. Fonte: [docker-compose.prod.yml](../../../laravel/docker-compose.prod.yml).
- O Nginx atual escuta HTTP na porta 80 do container, encaminha para \`php:9000\` e não contém \`allow\`, \`deny\`, \`real_ip_header\`, \`set_real_ip_from\` ou TLS. Fonte: [default.conf](../../../laravel/docker/production/nginx/default.conf).
- A documentação prevê \`SESSION_DRIVER=redis\`, \`CACHE_STORE=redis\`, \`APP_DEBUG=false\` e \`APP_URL=https://...\`. Fontes: [docker-compose.prod.yml](../../../laravel/docker-compose.prod.yml) e [production-docker.md](../../../laravel/docs/deploy/production-docker.md).
- A linha de base local já exige auditoria de login com origem, cookies/sessão protegidos e autorização no backend; explicita que menu visível não equivale a autorização. Fonte: [security-baseline.md](../../../laravel/docs/security-baseline.md).
- Docker documenta que bridge definida pelo usuário isola redes diferentes, mas contêineres na mesma bridge podem comunicar entre si; portas publicadas podem ser acessadas fora do host. Fonte: [Docker bridge network](https://docs.docker.com/engine/network/drivers/bridge/).

### Inferências

- A borda deve ser controlada no firewall/host, Nginx ou proxy/LB anterior a ele. Uma regra apenas na rede Docker não protege uma porta publicada se o host aceitar tráfego indevido.
- Qualquer desenho com LB, VPN terminada antes do host ou proxy de identidade precisa definir: terminação TLS, origem real observável, headers confiáveis, bloqueio do caminho direto e health checks.

## Princípios normativos

### Fatos

- NIST Zero Trust remove confiança implícita baseada apenas em localização física ou de rede; autenticação e autorização são funções distintas, e o foco é proteger recursos, não segmentos. Fonte: [NIST SP 800-207](https://csrc.nist.gov/pubs/sp/800/207/final).
- Para cloud-native, NIST descreve a migração de políticas baseadas em IP/subrede/perímetro para identidade de usuário, dispositivo, aplicação e serviço, com gateways de ingresso. Fonte: [NIST SP 800-207A](https://csrc.nist.gov/pubs/sp/800/207/a/final).
- IPsec é um controle de segurança de camada de rede, normalmente estabelecido com IKE; a orientação não o apresenta como autorização funcional da aplicação. Fonte: [NIST SP 800-77 Rev. 1](https://csrc.nist.gov/pubs/sp/800/77/r1/final).
- OWASP diferencia autenticação (verificar identidade) de autorização (verificar se a ação é permitida) e alerta que autorização fornecida por plataforma/framework pode ser insuficiente. Fonte: [OWASP Authorization Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Authorization_Cheat_Sheet.html).
- Laravel separa autenticação de roles/permissões e fornece Gates/Policies para autorização. Fontes: [Authentication](https://laravel.com/docs/12.x/authentication) e [Authorization](https://laravel.com/docs/12.x/authorization).

### Inferências

- VPN/IP responde “por qual rede/caminho veio?”; não responde “qual usuário?”, “qual filial?”, “qual recurso?” ou “qual operação?”.
- O requisito de não exigir login frequentemente deve ser atendido por sessão segura de duração adequada, SSO/MFA com renovação transparente ou reautenticação apenas para ações de alto risco — não por remover autenticação do Laravel.

## Comparação

| Opção | Proteção real | Disponibilidade / queda | Suporte remoto | Nginx/Docker | Risco/custo |
|---|---|---|---|---|---|
| **VPN site-to-site** | Criptografa e roteia uma rede/filial; reduz superfície pública. Não identifica cada operador por padrão. | Boa com túneis/roteadores redundantes; queda remove a alcançabilidade da filial até failover. | Boa para usuários dentro da filial; ruim para técnico isolado sem outra VPN/jump host. | Transparente ao Nginx; exige rotas, firewall, CIDRs não sobrepostos e regras no host. | Pode dar acesso amplo à rede; comprometimento do gateway aumenta impacto. |
| **VPN por usuário** | Pode combinar usuário, certificado/mTLS e SAML/AD; é mais forte que IP, mas ainda é acesso de rede. | Depende de cliente, IdP e endpoint; queda exige reconexão, possivelmente novo login. | Boa para funcionários/técnicos distribuídos; exige onboarding, revogação e suporte ao cliente. | Normalmente transparente; Laravel pode ver IP do pool VPN, não identidade do túnel. | Cliente, certificados, split/full tunnel e possível alcance excessivo à rede. |
| **Allowlist IP** | Filtra CIDRs no firewall/Nginx; ótima barreira de exposição. Não autentica usuário/dispositivo. | Simples, mas IP dinâmico/NAT/mudança de provedor pode bloquear todos; erro de regra pode expor todos. | Boa para escritório com IP fixo; ruim para home office. | Integração direta com Nginx \`allow/deny\` ou firewall. Exige origem confiável e IPv4/IPv6. | Baixo custo, baixo contexto e alto risco se \`X-Forwarded-For\` for aceito sem sanitização. |
| **Private ingress** | Frontend/LB apenas privado; remove acesso direto da Internet e reduz scanners/borda pública. | Pode ser excelente com LB/health checks; pode falhar por túnel, DNS privado ou gateway único. | Bom dentro da rede; remoto requer VPN, peering, agente ou proxy publicado. | Nginx pode continuar privado; host deve bindar só à interface necessária. | Não identifica usuário; conectividade privada ampla pode aumentar movimento lateral. |
| **Identity-aware proxy/ZTNA** | Políticas por identidade, grupo, dispositivo, IP/contexto e recurso HTTP; MFA/SSO sem rede ampla. | Depende de proxy/IdP; sessão pode renovar, mas indisponibilidade impede novos acessos. | Muito boa para ERP web e suporte por navegador; menos adequada a protocolos arbitrários. | Deve bloquear origin direto, validar assertions/headers e mapear identidade ao Laravel. | Custo, vendor lock-in, integração e risco de bypass se origin continuar público. |

## Fatos por opção e aplicação ao ERP

### VPN site-to-site

**Fatos:** NIST define IPsec como proteção de comunicação na camada IP ([SP 800-77](https://csrc.nist.gov/pubs/sp/800/77/r1/final)). Como exemplo de produto, cada conexão AWS Site-to-Site VPN inclui dois túneis para alta disponibilidade ([AWS](https://docs.aws.amazon.com/vpn/latest/s2svpn/VPC_VPN.html)).

**Inferências:** é a escolha natural para filiais com firewall/roteador administrável e sub-redes estáveis. Deve liberar somente o VIP/porta do ERP, não Redis, PHP-FPM, banco nem painel. Queda deve negar acesso ou usar um segundo túnel previamente testado; não deve acionar fallback público sem as mesmas políticas.

### VPN por usuário

**Fatos:** NIST exige considerar todos os componentes do acesso remoto, inclusive dispositivos corporativos/BYOD e o modelo de ameaça ([SP 800-46](https://csrc.nist.gov/pubs/sp/800/46/r2/final)). Um Client VPN oficial suporta AD, certificado mútuo e SAML, inclusive combinações ([AWS Client VPN authentication](https://docs.aws.amazon.com/vpn/latest/clientvpn-admin/client-authentication.html)); o cliente documenta diretivas de reconexão e possível novo login ([AWS client](https://docs.aws.amazon.com/vpn/latest/clientvpn-user/connect-aws-client-vpn-connect.html)).

**Inferências:** é o caminho mais pragmático para suporte remoto antes de um proxy de identidade. O pool VPN pode ser allowlist adicional, mas não substitui a sessão do usuário. Rotas devem ser mínimas; full-tunnel ou acesso à sub-rede inteira amplia o impacto de uma estação comprometida.

### Allowlist e confiança em headers

**Fatos:** Nginx \`ngx_http_access_module\` permite \`allow/deny\` por endereço/CIDR e pode combinar endereço com senha, subrequest ou JWT via \`satisfy\` ([Nginx access](https://nginx.org/en/docs/http/ngx_http_access_module.html)). O \`realip_module\` só deve substituir o endereço a partir de header quando \`set_real_ip_from\` declara os emissores confiáveis ([Nginx realip](https://nginx.org/en/docs/http/ngx_http_realip_module.html)). RFC 7239 trata cadeia, validade, integridade, vazamento e privacidade do header \`Forwarded\` ([RFC 7239](https://www.rfc-editor.org/rfc/rfc7239)). Laravel chama IP de entrada não confiável e pede configuração explícita de proxies/headers confiáveis ([Laravel requests](https://laravel.com/docs/12.x/requests)).

**Inferências operacionais:** o primeiro proxy deve remover/sobrescrever headers fornecidos pelo cliente; Nginx só deve confiar em CIDRs de proxies conhecidos; Laravel deve confiar apenas nos proxies existentes. Nunca usar \`X-Forwarded-For\` vindo diretamente da Internet como allowlist. Registrar IP de transporte, IP derivado da cadeia confiável, proxy, usuário, rota e resultado de autorização.

### Private ingress

**Fatos:** LB interno tem apenas IP privado e só roteia clientes com acesso à VPC; LB público tem IP público ([AWS ELB](https://docs.aws.amazon.com/elasticloadbalancing/latest/userguide/how-elastic-load-balancing-works.html)). Subnet sem rota para Internet Gateway não recebe tráfego da Internet ([AWS private subnet](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Internet_Gateway.html)). LB pode remover targets doentes e a documentação recomenda múltiplas zonas ([AWS ELB availability](https://docs.aws.amazon.com/elasticloadbalancing/latest/userguide/how-elastic-load-balancing-works.html)).

**Inferências:** private ingress é exposição, não identidade. Para o Compose, somente Nginx/LB deve ter entrada; o host deve bloquear a porta publicada fora das interfaces/CIDRs necessários. Para usuários externos, combinar com site-to-site, VPN por usuário ou proxy de identidade.

### Identity-aware proxy / ZTNA

**Fatos:** NIST exige autenticação/autorização por sessão, menor privilégio e políticas dinâmicas ([SP 800-207](https://csrc.nist.gov/pubs/sp/800/207/final)). Google IAP exemplifica camada central para HTTPS, com autenticação/autorização por principal, IAM e grupos sem VPN ([IAP overview](https://cloud.google.com/iap/docs/concepts-overview)); oferece controles contextuais ([IAP context](https://cloud.google.com/iap/docs/cloud-iap-context-aware-access-howto)) e sessões renováveis ([IAP sessions](https://cloud.google.com/iap/docs/sessions-howto)). A documentação alerta que acesso direto à porta do backend pode bypassar IAP se firewall/regras não o impedirem ([IAP responsibilities](https://cloud.google.com/iap/docs/concepts-overview)).

**Inferências:** é o melhor encaixe para ERP web com suporte remoto e baixa frequência de login, desde que o origin seja privado e a assertion do proxy seja validada. Um header livre como \`X-User\` não é prova de identidade. O Laravel ainda precisa manter guard/sessão ou integração formal, Policies/Gates, CSRF, auditoria e reautenticação para operações críticas.

## Queda de VPN/proxy e escrita transacional

### Fatos

- Site-to-site pode ter dois túneis, mas a redundância depende de rotas/equipamentos preparados ([AWS Site-to-Site](https://docs.aws.amazon.com/vpn/latest/s2svpn/VPC_VPN.html)).
- VPN por usuário pode reconectar, mas depende de DNS, rotas, cliente e endpoint ([AWS client](https://docs.aws.amazon.com/vpn/latest/clientvpn-user/connect-aws-client-vpn-connect.html)).
- Proxy de identidade pode devolver redirect/401 quando a sessão expira e depende de proxy/IdP para renovar ([IAP sessions](https://cloud.google.com/iap/docs/sessions-howto)).

### Inferências

- Nunca trocar silenciosamente para endpoint público ou login relaxado quando o túnel cair.
- Operações de escrita devem ser idempotentes/reconciliáveis: queda depois do commit e antes da resposta não pode duplicar emissão, pagamento, baixa ou cancelamento.
- O runbook deve separar falha de Internet, cliente VPN, túnel, DNS privado, firewall, proxy/IdP e aplicação.

## Recomendação inferida

1. **Base comum:** HTTPS, \`SESSION_DRIVER=redis\`, \`APP_DEBUG=false\`, cookies seguros, auditoria e autorização Laravel.
2. **Filiais:** private ingress alcançável por site-to-site com rotas mínimas e redundância quando o RTO exigir.
3. **Funcionários/suporte:** identity-aware proxy/ZTNA com SSO/MFA/grupos se houver IdP; caso contrário, VPN por usuário com certificado/IdP e rotas restritas.
4. **Allowlist:** usar como camada adicional para escritório, pool VPN e rotas administrativas; nunca como autenticação.
5. **Ações sensíveis:** separar no perímetro e no Laravel administração, configurações, emissão fiscal, pagamentos, cancelamentos e manutenção; autorização final considera usuário, papel, filial, recurso, estado e ação.
6. **Bypass:** bloquear acesso direto ao origin/backend. Proxy de identidade sem esse bloqueio não cumpre o objetivo.

## Dados que faltam para fechar a decisão

- Hospedagem: servidor próprio, cloud/VPC ou cliente Windows/Linux?
- Filiais têm IP público fixo e roteadores administráveis?
- Existe IdP (Entra ID, Google Workspace, AD/LDAP, Keycloak etc.) e MFA?
- Suporte remoto precisa só do navegador ou também banco, impressoras, serviço fiscal e compartilhamentos?
- Quais rotas devem ser internas e quais externas?
- RTO/RPO e tolerância para indisponibilidade de VPN, DNS, proxy ou IdP?

## Fontes primárias e autoridades

- [NIST SP 800-207](https://csrc.nist.gov/pubs/sp/800/207/final) · [NIST SP 800-207A](https://csrc.nist.gov/pubs/sp/800/207/a/final) · [NIST SP 800-77 Rev. 1](https://csrc.nist.gov/pubs/sp/800/77/r1/final) · [NIST SP 800-46 Rev. 2](https://csrc.nist.gov/pubs/sp/800/46/r2/final)
- [AWS Site-to-Site VPN](https://docs.aws.amazon.com/vpn/latest/s2svpn/VPC_VPN.html) · [AWS Client VPN authentication](https://docs.aws.amazon.com/vpn/latest/clientvpn-admin/client-authentication.html) · [AWS Client VPN client](https://docs.aws.amazon.com/vpn/latest/clientvpn-user/connect-aws-client-vpn-connect.html)
- [Nginx access module](https://nginx.org/en/docs/http/ngx_http_access_module.html) · [Nginx realip module](https://nginx.org/en/docs/http/ngx_http_realip_module.html) · [RFC 7239](https://www.rfc-editor.org/rfc/rfc7239)
- [Docker bridge](https://docs.docker.com/engine/network/drivers/bridge/) · [AWS internal load balancer](https://docs.aws.amazon.com/elasticloadbalancing/latest/userguide/how-elastic-load-balancing-works.html) · [AWS private subnet](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Internet_Gateway.html)
- [Google IAP overview](https://cloud.google.com/iap/docs/concepts-overview) · [IAP context](https://cloud.google.com/iap/docs/cloud-iap-context-aware-access-howto) · [IAP sessions](https://cloud.google.com/iap/docs/sessions-howto)
- [Laravel requests](https://laravel.com/docs/12.x/requests) · [Laravel authentication](https://laravel.com/docs/12.x/authentication) · [Laravel authorization](https://laravel.com/docs/12.x/authorization)
- [OWASP Authorization Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Authorization_Cheat_Sheet.html)
