# Definir prontidão para teste real em homologação

Type: task
Status: resolved
Blocked by:

## Question

Depois da revisão do código atualizado das transferências, o que ainda impede um teste real de autorização de NF-e em homologação e qual especificação incremental deve orientar os ajustes?

## Scope

Somente `Transferencia`. `VendaTransferencia` e `DevolucaoTransferencia` permanecem valores históricos de leitura e não podem voltar a formar grupos, preparar fotografia, emitir, reconciliar, projetar ou gerar efeitos.

## Expected output

Produzir uma auditoria de prontidão, um checklist executável para homologação e um prompt `/speckit.specify` incremental. A resposta deve distinguir bloqueios de código, ambiente, credenciamento fiscal, dados de teste, operação e evidências. Não implementar código neste ticket.

## Answer

A auditoria concluiu que o teste real está bloqueado por H-01/H-02: o gateway NFePHP ainda é skeleton, não assina com PKCS#12 real, não serializa a NF-e completa e não autoriza/consulta/eventos reais. Também permanecem F-01 a F-06 e os pré-requisitos de ambiente e credenciamento H-03 a H-06.

- Auditoria e checklist: [07-auditoria-atual-e-prontidao-homologacao.md](../research/07-auditoria-atual-e-prontidao-homologacao.md)
- Prompt `/speckit.specify`: [10-speckit-prompt-specify-prontidao-homologacao.md](../../../modules/interlojas/transferencia-requisicao-emissao-fiscal/10-speckit-prompt-specify-prontidao-homologacao.md)

O resultado preserva o escopo exclusivo de `Transferencia`; venda e devolução entre filiais continuam fora.
