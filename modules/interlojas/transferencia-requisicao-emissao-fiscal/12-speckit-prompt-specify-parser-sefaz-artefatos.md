# Prompt SpecKit 12 — Parser SEFAZ e artefatos autorizados

```text
/speckit.specify

Especifique a correção incremental do parsing das respostas SEFAZ e da custódia de artefatos da NF-e 55 de Transferencia. Não implemente código nesta etapa.

Leia:

- /mnt/c/teclux_analysis/.scratch/transferencia-requisicao-emissao-fiscal-wayfinder/research/08-revisao-implementacao-356-e-prompts-restantes.md
- /mnt/c/teclux_analysis/specs/356-trf-fiscal-homologacao/contracts/gateway-homologacao-nfe55.md
- /mnt/c/teclux_analysis/specs/356-trf-fiscal-homologacao/contracts/estados-falhas-reconciliacao.md
- backend/app/Infrastructure/Fiscal/NfePhp/NfePhpSefazResponseParser.php
- backend/app/Infrastructure/Fiscal/NfePhp/NfePhpFiscalGateway.php
- backend/app/Application/Fiscal/Emissao/ProcessarAutorizacaoNfeJobHandler.php
- backend/app/Application/Fiscal/Emissao/ProcessarReconciliacaoNfeJobHandler.php
- backend/app/Domain/Fiscal/Reconciliacao/ComparadorEvidenciasNfe.php
- backend/tests/Unit/Fiscal/NfePhpSefazResponseParserTest.php

Mantenha somente Transferencia; não criar eventos de venda/devolução, NF-e de entrada ou pipeline paralelo.

Especifique:

1. Parser baseado em XML estruturado, namespaces e caminhos sem ambiguidade entre SOAP envelope, retorno de recepção do lote, retorno de consulta de recibo, consulta por chave e protocolo/evento.
2. Classificação exata de `cStat`, `xMotivo`, recibo, chave, protocolo, data, digest e XML de resposta, distinguindo rejeição explícita, processamento, autorização, não localização, duplicidade e falha ambígua.
3. Proibição de fabricar `protNFe`, `nfeProc`, `digVal`, `verAplic`, `tpAmb`, chave ou protocolo. Se a SEFAZ não fornecer o protocolo necessário, persistir pendência/reconciliação e não declarar autorização nem gerar artefato autorizado.
4. Quando autorizado por consulta, formar o `nfeProc` canônico somente com o XML assinado persistido e o `protNFe` real validado, usando mecanismo compatível com NFePHP ou serializer XML controlado; nunca persistir SOAP bruto como artefato final.
5. Revalidar assinatura, digest, chave, emitente, modelo, série, número, ambiente, fotografia/hash e protocolo antes de concluir a emissão e projetar o destino.
6. Limpar `CertificateMaterial` em todos os caminhos de status, assinatura, autorização, consulta e diagnóstico, inclusive exceções e preflight.
7. Testes com respostas reais anonimizadas ou fixtures contratuais cobrindo namespaces, `cStat` externo/interno, timeout, resposta vazia, protocolo ausente, duplicidade e incompatibilidade de hash.

Entregue contratos de resultado/erro, transições de estado, critérios de aceite e matriz de testes. Não altere código nesta etapa.
```
