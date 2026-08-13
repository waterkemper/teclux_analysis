# Prompt SpecKit 15 - Fechamento da rota real de homologacao

```text
/speckit.specify

Especifique a correcao final dos bloqueadores R-15 a R-18 para permitir o primeiro smoke real de NF-e modelo 55 de Transferencia em homologacao. Nao implemente codigo nesta etapa.

Leia:

- .scratch/transferencia-requisicao-emissao-fiscal-wayfinder/research/09-revisao-implementacao-357-360-e-roteiro-homologacao.md
- specs/357-fix-trf-homolog-fotografia/spec.md
- specs/358-trf-sefaz-parser-custody/spec.md
- specs/359-trf-homolog-preflight-gate/spec.md
- specs/360-trf-fiscal-integrity-gates/spec.md
- backend/app/Application/Interlojas/TransferenciaRequisicaoEmissaoFiscal/TransferenciaFiscalPrepararFotografiaService.php
- backend/app/Infrastructure/Fiscal/NfePhp/NfePhpFotografiaSerializer.php
- backend/app/Infrastructure/Fiscal/NfePhp/NfePhpFiscalGateway.php
- backend/app/Infrastructure/Fiscal/NfePhp/NfePhpToolsFactory.php
- backend/app/Infrastructure/Fiscal/NfePhp/NfePhpNfeProcBuilder.php
- backend/app/Application/Fiscal/RunFiscalHomologacaoDiagnosticoService.php
- backend/app/Application/Fiscal/TransferenciaHomologacaoSmokeGate.php
- backend/app/Application/Fiscal/RunTransferenciaHomologacaoSmokeService.php

Escopo exclusivo: Transferencia, NF-e 55, homologacao. VendaTransferencia, DevolucaoTransferencia, NF-e de entrada, financeiro e pipeline paralelo continuam proibidos.

Especifique:

1. Matriz de origem autoritativa para cada campo necessario da fotografia HTTP: codigo fiscal, ambiente, natureza, indicadores da ide, CRT, destinatario, itens, NCM, CFOP, GTIN, ICMS, PIS, COFINS, totais, transporte, pagamento e volumes. Overrides e fixtures devem ser impossiveis no caminho HTTP/homologacao; campo sem fonte deve bloquear antes do seal.
2. Materializacao completa da fotografia no XML, incluindo volumes quando presentes no contrato, sem descartar blocos nem substituir valores por defaults. O preparer nao pode inventar ambiente 2, `idDest=1`, indicadores ou `verProc`.
3. Endpoint de status e autorizacao do `FiscalConfigSnapshot` deve ser o endpoint efetivamente utilizado pelo adapter NFePHP, ou o contrato deve declarar e testar o mapeamento oficial que prova equivalencia. Validar endpoint sem aplica-lo nao atende.
4. Selecao deterministica do pacote XSD exato do snapshot, sem nome fixo `nfe_v4.00` ou glob que escolha o ultimo arquivo; verificar versao, imports, hash, UF, ambiente e modelo.
5. `nfeProc` somente com NF-e assinada persistida e `protNFe` real. Apos qualquer builder NFePHP, revalidar chave, digest, tpAmb, emitente, modelo, serie, numero, `cStat`, `nProt`, `digVal` e versao; sem fallback `4.00`.
6. Diagnostico e smoke vinculados a filial concreta: `CertificateRequest.filialCodigo` deve ser a filial emissora; UF deve ser obrigatoria; o diagnostico-id deve ser conferido contra filial, UF, modelo, ambiente, snapshot e grupo. Diagnostico antigo ou de outra filial deve bloquear.
7. O smoke gate deve exigir grupo real para liberar RB-03 e registrar que o comando e gate, enquanto a emissao usa exclusivamente a rota Transferencia existente. Nao criar segundo pipeline de emissao.
8. Testes: HTTP sem overrides, ausencia de cada fonte fiscal, volumes no XML, endpoint aplicado, XSD errado, nfeProc com digest/chave divergentes, certificado de filial errada, diagnostico stale/de outra filial e grupo ausente.

Entregue matriz de contratos, erros tipados, criterios de aceite, comandos/rotas de teste e ordem de implementacao. Nao altere codigo nesta etapa.
```
