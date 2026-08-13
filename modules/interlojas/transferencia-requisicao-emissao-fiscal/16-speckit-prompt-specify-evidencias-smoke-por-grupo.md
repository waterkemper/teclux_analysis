# Prompt SpecKit 16 - Evidencias do smoke real por grupo

```text
/speckit.specify

Especifique a camada operacional de evidencias para executar e auditar uma unica NF-e 55 de Transferencia em homologacao, usando o pipeline existente. Nao implemente codigo nesta etapa.

Leia:

- .scratch/transferencia-requisicao-emissao-fiscal-wayfinder/research/09-revisao-implementacao-357-360-e-roteiro-homologacao.md
- specs/359-trf-homolog-preflight-gate/contracts/smoke-gate-comando.md
- specs/360-trf-fiscal-integrity-gates/contracts/estados-evidencias.md
- docs/operations/fiscal-transferencia-homologacao-smoke.md
- backend/app/Application/Fiscal/RunTransferenciaHomologacaoSmokeService.php
- backend/app/Application/Fiscal/TransferenciaHomologacaoSmokeGate.php
- backend/app/Console/Commands/FiscalSmokeTransferenciaHomologacaoCommand.php
- backend/app/Http/Controllers/Interlojas/TransferenciaRequisicaoEmissaoFiscalController.php
- backend/routes/web.php

Escopo exclusivo: um grupo real de Transferencia em homologacao. VendaTransferencia, DevolucaoTransferencia, NF-e de entrada, financeiro e producao ficam fora.

Especifique:

1. Contrato para `--diagnostico-id` e `--grupo`: ambos devem identificar o mesmo alvo fiscal; conferir filial base, UF, modelo 55, ambiente homologacao, snapshot e idempotency key. Sem grupo ou com diagnostico stale/divergente, nao liberar RB-03.
2. Separacao explicita entre gate, emissao HTTP existente e consulta de evidencias. O comando nao cria segundo pipeline nem transmite por conta propria, mas deve devolver o proximo passo inequivo e impedir alocacao/transmissao quando bloqueado.
3. Roteiro RB-00 a RB-10 executavel com payload minimo, headers de idempotencia, rota de emissao, consulta do grupo, consulta por recibo/chave, reconciliacao controlada, replay, projecao e aprovacao humana.
4. Pacote de evidencias sanitizadas por grupo: diagnostico, gate, idempotency key, hash/revisao da fotografia, serie/numero, chave, XML assinado, resposta SEFAZ, recibo, protocolo real, `nfeProc`, estado final, outbox/projecao, replay e ausencia de efeitos fora do escopo.
5. Estados esperados para autorizacao, rejeicao, processamento, timeout, divergencia e dead-letter; cada estado deve indicar o que pode ser consultado e o que e proibido fazer. Timeout nunca pode gerar retransmissao cega.
6. Criterios de abortar o teste, restaurar a operacao e registrar ata fiscal/operacional. Homologacao deve permanecer isolada e sem validade juridica.

Entregue runbook, matriz de evidencias, payload/rotas, codigos de bloqueio e criterios de aceite. Nao implemente codigo nesta etapa.
```
