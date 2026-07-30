# Prompt para /speckit.specify — NFC-e normal no frente de caixa

```text
/speckit.specify

Crie uma especificação funcional e técnica detalhada para emitir NFC-e modelo 65 no frente de caixa pelo fluxo normal. Construa sobre a plataforma dos prompts `01` a `09`, reutilizando o mesmo agregado, numeração, gateway, certificado, reconciliação e custódia.

Não implemente. Inspecione os fluxos reais de venda/caixa e impressão no checkout Laravel. Preserve a prioridade operacional sem inventar detalhes de UX que serão avaliados depois.

## Limite desta entrega

- comando idempotente originado por venda elegível no caixa;
- Fotografia específica do modelo 65, CSC, QR Code e configuração por UF/ambiente;
- fila `fiscal-nfce-prioritaria` com capacidade reservada e limites seguros;
- janela curta de espera pelo mesmo comando; expirada, acompanhar assincronamente sem retransmitir;
- autorização/rejeição/reconciliação pelo pipeline compartilhado;
- XML e DANFE NFC-e para impressão no caixa;
- falha acionável sem duplicar venda, emissão ou pagamento;
- visibilidade operacional na Central.

Não inclua contingência offline, EPEC de NFC-e, reabrir venda ou criar infraestrutura fiscal paralela.

## Testes obrigatórios

- venda elegível autoriza, gera QR Code/XML/DANFE e imprime;
- CSC/configuração inválidos e venda inelegível bloqueiam antes da numeração;
- timeout da janela curta continua no mesmo comando;
- concorrência e replay não duplicam venda/emissão/número;
- capacidade reservada mantém NFC-e prioritária sem eliminar o processamento NF-e;
- rejeição e resultado ambíguo seguem estados e ações corretos.

Produza spec, plano, contrato Venda → Fotografia, política de fila e testes. Não implemente durante `/speckit.specify`.
```
