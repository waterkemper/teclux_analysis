# Prompt para /speckit.specify — cancelamento de NF-e

```text
/speckit.specify

Crie uma especificação funcional e técnica detalhada para cancelar NF-e autorizada a partir da Central. Depende de `09-speckit-prompt.md` e inaugura o pipeline compartilhado de Eventos Fiscais.

Não implemente. Reutilize gateway, certificado, leases, Tentativas, reconciliação e custódia já especificados; não crie atalhos síncronos.

## Limite desta entrega

- Evento Fiscal independente com identidade, estado, Tentativas, XML e protocolo próprios;
- elegibilidade por situação, prazo, UF/ambiente, permissão e ausência de evento conflitante;
- comando com justificativa, confirmação, ator, revisão e idempotency key;
- assinatura, transmissão e reconciliação do cancelamento pela fila `fiscal-eventos`;
- preservação do XML/protocolo no catálogo de Artefatos;
- alteração da Emissão para CANCELADA e projeção legada `C` somente após protocolo confirmado;
- histórico da autorização original preservado e ação exibida na Central.

Não inclua CC-e, inutilização, cancelamento sem protocolo ou reversão comercial/estoque não comprovada pela especificação.

## Invariantes e testes

- um resultado ambíguo preserva identidade/XML/seqüência e bloqueia evento equivalente até reconciliar;
- retry da mesma chave não cria outro evento;
- testes cobrem elegível, fora do prazo, justificativa inválida, acesso negado, autorizado, rejeitado, timeout e replay;
- projeção legada só muda após confirmação e é idempotente;
- Artefatos e auditoria registram evidências sem XML completo no log.

Produza spec, plano, contrato do evento, estados/capabilities e testes. Não implemente durante `/speckit.specify`.
```
