# Prompt para /speckit.specify — NF-e originada de Contrato

```text
/speckit.specify

Crie uma especificação funcional e técnica detalhada para emitir NF-e modelo 55 a partir de Contrato faturado, reutilizando integralmente a plataforma criada pelos prompts `03`, `04` e `07`. Este prompt não cria um pipeline fiscal paralelo.

Não implemente. Inspecione o checkout Laravel, especialmente o Cadastro/Consulta de Contratos e seus contratos de faturamento, revisão, parcelas, estoque, séries e documentos fiscais. A evidência consolidada do workspace é autoridade sobre o Delphi; não solicite PAS/DFM.

## Limite desta entrega

- comando idempotente `SolicitarDocumentoFiscalContrato` ou nome coerente com o domínio existente;
- elegibilidade server-side do Contrato e origem rastreável;
- formação da Fotografia Fiscal autocontida com participantes, itens, tributos, totais, transporte, cobrança, pagamentos, referências, configurações e versões já resolvidos;
- rateio/vencimentos como fotografia do compromisso financeiro já existente, sem recriar parcelas;
- alocação das séries capturadas ao documento quando aplicável;
- consumo/efeitos de estoque somente no ponto fiscal já decidido e atomicamente coordenado com a criação;
- autorização, projeção legada, XML e DANFE pelo pipeline comum;
- atualização da visão documental `P/N` do Contrato como projeção, sem torná-la autoridade fiscal.

Não inclua refazer `R → F`, editar Contrato, criar outro contador/gateway ou emitir NFC-e.

## Testes obrigatórios

- Contrato elegível chega a NF-e autorizada, XML e DANFE;
- Contrato não faturado, revisão obsoleta, dados fiscais incompletos e séries inválidas são bloqueados antes da numeração;
- mesma operação/idempotency key não cria outra Emissão;
- falha transacional não deixa estoque, projeção ou contador parcialmente alterados;
- alterações posteriores no Contrato não mudam a Fotografia;
- regressão prova que emissão avulsa continua usando o mesmo pipeline.

Produza spec, plano, matriz Contrato → Fotografia e testes. Não implemente durante `/speckit.specify`.
```
