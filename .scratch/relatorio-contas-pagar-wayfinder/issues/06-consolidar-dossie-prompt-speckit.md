# Consolidar o dossiê e o prompt Speck/Specify do Relatório de Contas a Pagar

Type: task
Status: resolved
Blocked by: 05

## Question

Como consolidar decisões e evidências em um dossiê rastreável e num prompt `/speckit.specify` autocontido, pronto para gerar a spec do Relatório de Contas a Pagar no Laravel sem investigação funcional em aberto?

## Answer

A consolidação foi concluída em dois artefatos complementares:

- [Dossiê — Relatório de Contas a Pagar](../../../modules/financeiro/contas-pagar/relatorio/dossie.md): organiza fontes, evidências classificadas, modalidades, filtros, read model, cálculos, fotografia, UX, segurança, testes, matriz de reaproveitamento, fases, gates e limites de escopo.
- [Prompt Spec Kit — Relatório de Contas a Pagar](../../../modules/financeiro/contas-pagar/relatorio/speckit-prompt.md): entrada autocontida para `/speckit.specify`, com decisões funcionais e arquiteturais imperativas, leituras de baseline, saída esperada e proibições explícitas.

O prompt exige revalidação do checkout Laravel antes da spec, mas não deixa investigação funcional em aberto. Ele fixa as três modalidades canônicas, conjunto completo sem paginação até 100.000 linhas, filtros condicionais tipados, cinco medidas financeiras distintas, regime de caixa, agrupamentos, geração exclusivamente assíncrona, Fotografia de Relatório única para visualização/PDF/impressão, retenção de 7 dias, cancelamento/retry, autorização por todas as Filiais, Auditoria de Relatório, acessibilidade, testes PostgreSQL e gates de entrega.

A verificação final confirmou a presença desses contratos nos dois artefatos e `git diff --check` passou sem erro.
