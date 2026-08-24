# Consolidar a spec completa da emissão da Transferência

Type: task
Status: resolved

## Answer

A consolidação foi publicada em [24-speckit-prompt-specify-consolidacao-coreografia-danfe.md](../../../modules/interlojas/transferencia-requisicao-emissao-fiscal/24-speckit-prompt-specify-consolidacao-coreografia-danfe.md).

O prompt incremental:

- combina as decisões dos tickets de coreografia, DANFE e etiquetas;
- define confirmação operacional e preparação fiscal atômicas por grupo;
- exige numeração com FOR UPDATE, idempotência e não reutilização;
- vincula dadofiscal, pedidos e movimentos sem duplicar estoque;
- separa estados operacionais e fiscais;
- define retry, rejeição, reconciliação Laravel/Delphi e inutilização manual posterior;
- usa exclusivamente a plataforma fiscal comum;
- define somente DANFE padrão em PDF, sem UniDANFE, impressão automática ou etiquetas;
- mantém fora VendaTransferencia, DevolucaoTransferencia, NF-e de entrada, financeiro e NFSe;
- entrega requisitos, contratos, tarefas, testes, quickstart, rollout e critérios de aceite para o SpecKit.

Nenhum código Laravel, fonte Delphi ou banco foi alterado.
Blocked by: 19, 20

## Question

Como consolidar as decisões de estoque–emissão, reconciliação Delphi, DANFE padrão, DANFE simplificada e etiquetas em uma nova especificação `/speckit.specify` para `modules/interlojas/transferencia-requisicao-emissao-fiscal/`, preservando as specs já implementadas e excluindo venda/devolução entre filiais, NF-e de entrada automática e financeiro?

A saída deve ser um prompt de correção/continuação com matriz Laravel × Delphi, contratos, estados, efeitos, artefatos, UI, testes de homologação e critérios de aceite. Não implementar código durante a especificação.
