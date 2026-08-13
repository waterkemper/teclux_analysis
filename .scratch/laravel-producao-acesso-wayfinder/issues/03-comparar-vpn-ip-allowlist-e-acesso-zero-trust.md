Type: research
Status: resolved
Blocked by:

## Answer

Research report completed at [03-vpn-ip-allowlist-zero-trust.md](../research/03-vpn-ip-allowlist-zero-trust.md). It separates facts from inferences and covers protection, availability, remote support, tunnel failure, Nginx/Docker, IP/header trust, and why Laravel authentication and authorization remain required. The inferred recommendation is defense in depth: private ingress, site-to-site for branches, per-user VPN or identity-aware proxy/ZTNA for remote access, and allowlisting only as a complementary control.

## Question

Comparar, para um ERP com dados fiscais, financeiros e operacionais, VPN site-to-site, VPN por Usuário, allowlist de IP no reverse proxy/firewall, private ingress e acesso por identity-aware proxy/Zero Trust. Para cada opção, avaliar proteção real, disponibilidade, custo operacional, suporte remoto, integração com Docker/Nginx, risco de confiar em `X-Forwarded-For`, comportamento quando a VPN cai e necessidade de controles no aplicativo.
