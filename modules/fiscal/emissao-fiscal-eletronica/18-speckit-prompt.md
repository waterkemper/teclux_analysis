# Prompt para /speckit.specify — distribuição de documentos fiscais

```text
/speckit.specify

Crie uma especificação funcional e técnica detalhada para distribuir documentos fiscais por e-mail, impressão/reimpressão e download autenticado. Depende de `07`, `10` e `11`.

Não implemente. Inspecione a infraestrutura real de e-mail e perfis SMTP do Laravel. Preserve inicialmente o comportamento Delphi confirmado: SMTP completo da Filial tem precedência e, se ausente, usa-se o perfil completo do Usuário; nunca misture campos dos dois.

## Limite desta entrega

- Distribuição Fiscal e Tentativas imutáveis/idempotentes, assíncronas e fora do caminho crítico da NFC-e;
- destinatários de `dadosfiscais.email`, Contatos com `enviar_nfe` e Transportadora aplicável, validados, deduplicados e congelados por distribuição;
- autorização envia `nfeProc` e DANFE; cancelamento e CC-e enviam seus Artefatos; inutilização não é distribuída;
- templates versionados e rodapé configurado, sem edição livre por envio;
- retry em 1, 5, 15 e 60 minutos e Pendência de Distribuição para falha permanente/ausência de SMTP;
- reenvio humano cria nova Distribuição auditável;
- acesso só a Artefatos íntegros, nunca em QUARENTENA.

Não inclua WhatsApp, SMS, portal público ou alterar o resultado fiscal por falha de envio.

## Testes obrigatórios

- precedência Filial, fallback integral para Usuário e ausência de ambos;
- destinatários deduplicados e preservados mesmo após mudança cadastral;
- anexos corretos por autorização/cancelamento/CC-e e ausência para inutilização;
- agenda de retry, falha permanente, replay e reenvio humano;
- credenciais não aparecem em logs/auditoria;
- distribuição falha sem reverter autorização fiscal.

Produza spec, plano, máquina da Distribuição, seleção de remetente/destinatários e testes. Não implemente durante `/speckit.specify`.
```
