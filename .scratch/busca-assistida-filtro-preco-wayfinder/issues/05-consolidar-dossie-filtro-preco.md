# Consolidar o dossiê da restrição de preço na Busca Assistida

Type: task
Status: resolved
Blocked by: 02, 03, 04

## Question

Como consolidar as decisões (estratégia de extração, aplicação sem perda de resultados, nomenclatura de domínio) num dossiê autocontido e verificável para posterior conversão em prompt SpecKit, sem mandar o executor redescobrir os fatos já auditados sobre o pipeline de preço?

## Answer

Consolidado em [`dossie.md`](../dossie.md) — autocontido, com todas as decisões dos tickets 01-04 inlined: estado atual do pipeline, nomenclatura de domínio (Restrição de Preço), estratégia de extração, aplicação sem perda de resultados (pré-check antes do corte), contratos técnicos consolidados, critérios de aceite, estados de erro e matriz de testes. Fecha com "Fora de escopo" (herdado do mapa).

Este dossiê é a fonte primária para uma futura conversão em prompt SpecKit (`speckit.specify`) — essa conversão em si é um passo deliberado fora deste mapa, não automático.
