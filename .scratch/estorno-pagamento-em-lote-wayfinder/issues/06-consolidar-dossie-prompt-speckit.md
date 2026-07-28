# Consolidar o dossiê e o prompt Speck/Specify do Estorno em Lote

Type: task
Status: resolved
Blocked by: 05

## Question

Como consolidar todas as decisões e evidências em um dossiê rastreável e em um prompt `/speckit.specify` autocontido, sem investigação financeira em aberto e pronto para gerar a spec do Estorno de Pagamento em Lote no Laravel?

## Answer

As evidências Delphi/Laravel, decisões transacionais, UX, segurança, reconciliação, testes e fases foram consolidadas em:

- [Dossiê — Estorno de Pagamento em Lote](../../../modules/financeiro/contas-pagar/estorno-pagamento-em-lote/dossie.md);
- [Prompt Spec Kit — Estorno de Pagamento em Lote](../../../modules/financeiro/contas-pagar/estorno-pagamento-em-lote/speckit-prompt.md).

O dossiê contém rastreabilidade, classificação de evidências, contrato profundo e matriz `preservar / corrigir / criar / remover`. O prompt é autocontido, manda revalidar o código vigente e fixa atomicidade, dependências, reconstrução de efeitos compartilhados, segurança, lista sem paginação até 2.000 itens, idempotência, reconciliação, testes PostgreSQL reais e gates. Não resta decisão financeira conhecida antes de `/speckit.specify`.
