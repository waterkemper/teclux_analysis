# Prompt para /speckit.specify — autorização normal de NF-e

```text
/speckit.specify

Crie uma especificação funcional e técnica detalhada para autorizar uma NF-e modelo 55 preparada pelo fluxo normal SEFAZ. Esta Etapa 4 depende de `01-speckit-prompt.md`, `02-speckit-prompt.md` e `03-speckit-prompt.md` já especificados e implementados.

Não implemente durante o specify. Confirme os seams reais do Laravel e componha os contratos existentes, sem criar um segundo agregado, contador ou gateway.

## Limite desta entrega

- worker da fila `fiscal-nfe`, lease durável e Tentativa Fiscal;
- serialização da Fotografia selada, validação XSD, assinatura A1 e persistência dos bytes/hash antes da rede;
- checkpoint `PRONTO_PARA_ENVIO`, versão do certificado e correlação;
- transmissão normal, interpretação de autorização e rejeição explícita;
- registro de chave, recibo, protocolo, datas e evidência bruta sem transformar `cStat` em estado de domínio;
- projeção idempotente de `nfeProc` e protocolo nas tabelas legadas;
- retorno assíncrono à UI após registrar intenção.

Não inclua reconciliação completa, correção, S3/DANFE, eventos ou contingência.

## Invariantes

1. Worker adquire lease sob `FOR UPDATE`, cria Tentativa e libera a transação antes da rede.
2. Resultado só é aplicado se token e estado ainda forem válidos.
3. Falha comprovada antes do primeiro byte pode retentar com backoff; após início do envio vai para `AGUARDANDO_RECONCILIACAO`, sem reenvio cego.
4. Retransmissão não cria nova Emissão nem nova Fotografia.
5. Processamento e ambiguidade não inventam códigos de situação legados.

## Testes obrigatórios

- autorização e rejeição explícita de ponta a ponta em adapter falso/contrato;
- falha antes do envio versus timeout após início;
- replay do worker, lease expirado e resultado tardio não duplicam efeitos;
- bytes enviados correspondem ao hash persistido;
- projeção legada idempotente e nenhum segredo na telemetria.

Produza spec, plano, contratos do worker/gateway, transições e testes. Não implemente durante `/speckit.specify`.
```
