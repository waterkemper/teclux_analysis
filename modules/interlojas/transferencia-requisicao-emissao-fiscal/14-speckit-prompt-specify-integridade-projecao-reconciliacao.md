# Prompt SpecKit 14 - Integridade da projecao, reconciliacao e eventos

```text
/speckit.specify

Especifique a correcao incremental das garantias de integridade entre emissao, projecao no destino e reconciliacao da NF-e 55 de Transferencia. Nao implemente codigo nesta etapa.

Leia:

- .scratch/transferencia-requisicao-emissao-fiscal-wayfinder/research/08-revisao-implementacao-356-e-prompts-restantes.md
- specs/356-trf-fiscal-homologacao/spec.md
- specs/356-trf-fiscal-homologacao/contracts/fotografia-projecao-transferencia.md
- specs/356-trf-fiscal-homologacao/contracts/estados-falhas-reconciliacao.md
- backend/app/Application/Interlojas/TransferenciaRequisicaoEmissaoFiscal/TransferenciaFiscalProjecaoDestinoHandler.php
- backend/app/Infrastructure/Persistence/Cloud/Interlojas/CloudTransferenciaFiscalGrupoRepository.php
- backend/app/Infrastructure/Fiscal/TransferenciaFiscalPlatformAdapter.php
- backend/app/Domain/Fiscal/Emissao/EmissaoFiscalDomainEventEmitter.php
- backend/app/Application/Interlojas/TransferenciaRequisicaoEmissaoFiscal/Listeners/TransferenciaFiscalOnEmissaoAutorizadaListener.php
- backend/app/Domain/Fiscal/Reconciliacao/ComparadorEvidenciasNfe.php

Escopo exclusivo: Transferencia, NF-e modelo 55 e os efeitos de emissao/projecao/reconciliacao necessarios a homologacao. VendaTransferencia e DevolucaoTransferencia continuam fora.

Especifique:

1. Validacao fail-closed da fotografia carregada: revisao, hash, grupo, emitente, destinatario, modelo, tipo, serie, numero, chave e demais identidade obrigatoria devem existir e ser recomputados/conferidos; ausencia nao pode ser tratada como igualdade.
2. Projecao idempotente e segura, com rejeicao de fotografia/hash divergente, chave divergente, documento duplicado ou serie omitida. Busca legado nunca pode reduzir a identidade de filial+numero quando serie/modelo/chave sao obrigatorios.
3. Eventos pos-commit com outbox ou mecanismo duravel equivalente, retry com backoff, idempotencia e dead-letter. Falha do listener nao pode depender de relancamento sincronico nem perder a projecao.
4. Reconciliacao somente com evidencias completas: XML assinado, protocolo/nfeProc quando autorizado, hash, chave, origem, tipo, modelo, serie e numero. Ausencia de evidencia obrigatoria deve gerar divergencia ou pendencia explicita.
5. Contratos de estado para autorizado, rejeitado, processamento, timeout, pendente e divergente, sem produzir efeito de estoque ou financeiro antes da evidencia exigida.
6. Testes de ausencia de hash/revisao, alteracao de fotografia, duplicidade, serie diferente, retry, dead-letter, replay e reconciliacao com protocolo real.

Entregue matriz de invariantes, contratos de erro, estados, criterios de aceite e dependencias. Nao altere codigo nesta etapa.
```
