Type: grilling
Status: resolved

## Question

O formulário de Help (spec 161-erp-help-zendesk) já implementa os campos Impacto (baixa/média/alta/crítica) e CC (cópia, múltiplos e-mails), além da captura automática de screenshot com consentimento. Para a primeira versão prática liberada a usuários reais, cada um desses três elementos deve ser mantido como está, simplificado ou cortado?

## Answer

Os três ficam **mantidos como estão**, sem mudança de escopo:

- **Impacto** (baixa/média/alta/crítica): mesmo com viés de autoavaliação (tendência a marcar "alta"/"crítica"), o campo ainda ajuda a triagem manual do suporte via assunto do e-mail. Não vale a complexidade de mudar antes do lançamento.
- **CC**: campo opcional, não atrapalha quem não usa, e é útil quando o usuário quer que gestor/colega acompanhe o chamado. Mantém.
- **Screenshot automático**: já implementado e funcional; reduz idas-e-voltas com suporte em bug real, que é exatamente o cenário que vai aparecer no lançamento para usuários reais. Mantém — mas seu fluxo de consentimento é revisto separadamente (ver ticket de simplificação de consentimento LGPD).

Nenhuma ação de código necessária para estes três pontos.
