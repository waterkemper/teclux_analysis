# Produção segura e acesso contínuo do ERP Laravel

Label: wayfinder:map

## Destination

Produzir uma decisão arquitetural e um checklist de produção para o login e a sessão do ERP Laravel, permitindo uso prolongado sem exigir login frequente e definindo se o acesso fora do perímetro interno deve exigir 2FA, VPN, rede confiável, faixa de IP ou combinação desses controles.

## Notes

- Domínio: Plataforma Laravel / segurança operacional do ERP; usar o vocabulário de `CONTEXT.md`, especialmente Usuário, Permissão, Autorização e Auditoria.
- Consultar `grilling` e `domain-modeling` nas decisões com impacto operacional; consultar `research` para documentação atual do Laravel, navegador, proxy e VPN.
- Estado confirmado no código até o chart inicial: guard `web` com provider legado `usuarios`; `SESSION_DRIVER=redis` no exemplo de produção; lifetime padrão de 120 minutos; `expire_on_close=false`; cookie `HttpOnly` habilitado; `SameSite=Lax`; Docker de produção com Nginx, PHP-FPM, Redis, Horizon e scheduler.
- Hipótese de trabalho, ainda não decisão: manter o ERP atrás de VPN ou outro perímetro de acesso, mas não usar VPN/IP como substituto do login e da identificação do Usuário; 2FA seria avaliado no login externo, não em cada operação do ERP.
- Nenhuma implementação, migration, alteração de infraestrutura ou mudança de `.env` será feita neste esforço; o destino é a decisão e o checklist para execução posterior.

## Decisions so far

- [Comparar VPN, allowlist de IP e acesso Zero Trust](issues/03-comparar-vpn-ip-allowlist-e-acesso-zero-trust.md) — Research completed: defense in depth; network restricts exposure but does not replace Laravel authentication/authorization.

- [Pesquisar sessão longa e reautenticação Laravel](issues/02-pesquisar-sessao-longa-e-reautenticacao-laravel.md) — `SESSION_LIFETIME` é ocioso/deslizante; decidir timeout absoluto, step-up/MFA e revogação server-side separadamente; VPN/IP não substituem identidade.

<!-- Uma linha por ticket resolvido, com link e síntese. -->

## Not yet specified

- Quais superfícies do ERP devem ser privadas, quais podem ser acessadas externamente e se haverá integrações ou suporte fora da rede corporativa.
- Qual é o modelo de rede confiável: VPN site-to-site, VPN por Usuário, túnel de acesso, allowlist no proxy, ou combinação deles; e quais IPs são realmente observáveis pelo Laravel.
- Limites aceitáveis para sessão ociosa, sessão absoluta, encerramento remoto, múltiplos dispositivos e troca de rede durante uma sessão.
- Se o login fora do perímetro interno exigirá 2FA, em quais condições e como será o fallback de recuperação.
- Requisitos de disponibilidade, recuperação da VPN/proxy, suporte, auditoria, alertas e resposta a sequestro de sessão.
- Forma final do rollout, testes de segurança e checklist operacional de produção.

## Out of scope

- Implementar o login, VPN, firewall, reverse proxy, MFA ou qualquer middleware neste workspace.
- Proteger individualmente pagamentos, emissão fiscal, cancelamentos, alterações de preço ou outras operações com MFA/reautenticação; isso fica fora deste esforço.
- Redesenhar o modelo de Permissão funcional do ERP ou substituir a identidade legada `usuarios`.
- Definir uma solução de SSO corporativo sem antes confirmar os provedores e requisitos de identidade disponíveis.
- Permitir acesso anônimo ou tratar uma faixa de IP como prova suficiente de identidade.
