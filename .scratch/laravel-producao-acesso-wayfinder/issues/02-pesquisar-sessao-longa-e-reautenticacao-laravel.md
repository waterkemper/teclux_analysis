Type: research
Status: resolved
Blocked by:

## Answer

Relatório concluído em [02-sessao-longa-e-reautenticacao.md](../research/02-sessao-longa-e-reautenticacao.md). A pesquisa separa fatos do Laravel 13.x, RFC/Fetch Metadata, OWASP e NIST de recomendações para o ERP. Principais conclusões: `SESSION_LIFETIME` é timeout ocioso/deslizante, não absoluto; o timeout absoluto precisa de estado/middleware adicional; `remember me` é um recaller persistente separado (o código atual usa 576.000 minutos, cerca de 400 dias, apesar da documentação dizer “indefinitely or until logout”); Laravel gira IDs, invalida logout e oferece `AuthenticateSession`/`logoutOtherDevices` e `password.confirm`; VPN/IP são perímetro/sinais de risco, nunca identidade; e a política recomendada combina idle + absoluto + step-up/MFA para ações sensíveis + revogação server-side.

## Question

Quais são as recomendações atuais e os limites técnicos do Laravel e dos navegadores para sessão ociosa longa, sessão absoluta, cookie persistente, rotação de sessão, encerramento remoto, múltiplos dispositivos, troca de IP/rede, CSRF e reautenticação de ações sensíveis? Comparar `remember me`, lifetime de sessão e step-up authentication sem assumir que qualquer um deles equivale a uma sessão ilimitada.
