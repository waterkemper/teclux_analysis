# Prompt para /speckit.specify — transferência administrativa Delphi → Laravel

```text
/speckit.specify

Crie uma especificação funcional e técnica detalhada para transferir administrativamente uma emissão elegível do Delphi para o Laravel. Depende de `02-speckit-prompt.md` e `16-speckit-prompt.md` em /mnt/c/teclux_analysis/modules/fiscal/emissao-fiscal-eletronica/.

Não implemente. Trate posse fiscal como uma invariável crítica; nenhuma recuperação pode deixar os dois sistemas autorizados a agir.

## Limite desta entrega

- comando exclusivo de Administrador reautenticado, com motivo, confirmação, expected revision e idempotency key;
- sincronização imediatamente anterior, Vínculo de Certificado Fiscal ativo e elegível para Filial/UF/ambiente/modelo/operação, consulta SEFAZ e validação de evidências;
- criação/validação de Fotografia para emissão pendente;
- confirmação operacional durável de inatividade no Delphi;
- mudança atômica e auditável da posse, liberando capabilities Laravel somente depois;
- recuperação de falha parcial com proprietário inequívoco;
- mudança posterior detectada no Delphi suspende comandos Laravel e força Reconciliação.

Não inclua transferência em massa, failover automático, alteração retroativa do histórico ou tentativa de comandar a UI Delphi.

## Testes obrigatórios

- transferência elegível bem-sucedida e ação posterior exclusiva do Laravel;
- usuário sem reautenticação, certificado ou vínculo elegível ausente, vínculo de outro Contribuinte Fiscal, evidência divergente, processamento ativo ou Delphi não inativo bloqueiam;
- concorrência/replay produz uma única posse;
- falha em cada etapa mantém dono inequívoco;
- alteração Delphi pós-transferência suspende mutações e abre incidente/reconciliação;
- auditoria contém ator, motivo, evidências e antes/depois sem segredos.

Produza spec, plano, protocolo de transferência, estados de posse e testes de falha. Não implemente durante `/speckit.specify`.
```
