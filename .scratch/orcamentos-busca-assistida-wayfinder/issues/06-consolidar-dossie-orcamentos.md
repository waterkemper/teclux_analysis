# Consolidar o dossiê da adaptação para Orçamentos

Type: task
Status: resolved
Blocked by: 02, 03, 05, 07

## Question

Como consolidar todas as decisões (autorização/capabilities, escopo de Filial, adaptador de Aplicar) num dossiê autocontido e verificável para posterior conversão em prompt SpecKit, sem mandar o executor reabrir as decisões do painel reutilizável ou redescobrir os fatos já auditados sobre Orçamentos?

## Answer

Consolidado em [`dossie.md`](../dossie.md) — autocontido, com todas as decisões dos tickets 01-05 e 07 inlined (não só linkadas): estado atual/seam de inclusão, coordenação com o PRD do modal tradicional, autorização/capabilities, escopo de Filial, preço por Cargo do Cliente, adaptador de Aplicar seleção, contratos técnicos consolidados, critérios de aceite, estados de erro e matriz de testes. Fecha com "Fora de escopo" (herdado do mapa).

Este dossiê é a fonte primária para uma futura conversão em prompt SpecKit (`speckit.specify`, seguindo o mesmo padrão dos módulos já existentes em `modules/`) — essa conversão em si é um passo deliberado fora deste mapa, não automático.
