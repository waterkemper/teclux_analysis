# Revisar o código atualizado e gerar prompt SpecKit de correção

Type: task
Status: resolved
Blocked by:

## Question

Depois do commit `861a351e` (`remocao vendas e devolucao transferencias`), quais lacunas ainda existem na implementação Laravel da emissão fiscal de Transferencia e qual prompt `/speckit.specify` deve orientar a próxima correção sem reintroduzir venda entre filiais ou devolução?

## Answer

A auditoria encontrou seis lacunas remanescentes: estado de fotografia/emissão em memória; fixture e defaults no caminho HTTP; projeção autorizada sem fotografia selada e rota manual com fixture; listeners sem retry durável e estados colapsados; SQL direto e reconciliação incompleta; e testes bloqueados pelo PHP 8.2.21 enquanto o projeto exige PHP >= 8.4.1.

O relatório está em [06-auditoria-codigo-861a351e-e-prompts.md](../research/06-auditoria-codigo-861a351e-e-prompts.md) e o novo prompt `/speckit.specify` em [09-speckit-prompt-specify-revisao-apos-861a351e.md](../../../modules/interlojas/transferencia-requisicao-emissao-fiscal/09-speckit-prompt-specify-revisao-apos-861a351e.md). O escopo permanece somente `Transferencia`; venda e devolução continuam fora.
