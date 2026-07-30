# Prompt para /speckit.specify — NFC-e offline e regularização

```text
/speckit.specify

Crie uma especificação funcional e técnica detalhada para contingência offline de NFC-e e sua transmissão/regularização posterior. Depende de `14-speckit-prompt.md` e reutiliza o pipeline de eventos de `10-speckit-prompt.md` quando uma substituição/cancelamento for fiscalmente exigido.

Não implemente. Restrinja o comportamento às regras versionadas da UF e preserve a liberação segura da venda.

## Limite desta entrega

- entrada em offline somente quando permitida, com Episódio de Contingência, motivo e horário;
- Fotografia/revisão, assinatura, QR Code e DANFE NFC-e de contingência antes de liberar a venda;
- fila prioritária para transmissão posterior e prazo operacional observável;
- retomada do serviço, reconciliação antes de retransmissão e convergência da mesma Emissão;
- rejeição posterior com capabilities válidas de correção ou substituição e vínculo entre original/substituta;
- saída do modo offline auditada e pendências visíveis na Central.

Não inclua SVC/FS-DA de NF-e, contingência não autorizada pela UF ou retransmissão cega.

## Testes obrigatórios

- emissão offline libera venda somente após documento auxiliar válido;
- retomada autoriza posteriormente a mesma Emissão;
- resultado incerto reconcilia antes de qualquer novo envio;
- rejeição posterior oferece somente ação fiscal aplicável;
- substituição preserva vínculo e não reutiliza número indevidamente;
- indisponibilidade prolongada, prazo, replay e saída concorrente são observáveis e idempotentes.

Produza spec, plano, máquina de contingência NFC-e, fluxo de regularização e testes. Não implemente durante `/speckit.specify`.
```
