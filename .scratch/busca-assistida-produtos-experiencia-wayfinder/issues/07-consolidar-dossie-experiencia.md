# Consolidar o dossiê da evolução da Busca Assistida

Type: task
Status: resolved
Blocked by: 02, 03, 04, 05, 06

## Question

Como consolidar todas as decisões em um dossiê autocontido e verificável para posterior conversão em prompt SpecKit, com estado atual, UX, contratos de componente e hospedeiro, APIs/DTOs, segurança, critérios de aceite, estados de erro e matriz de testes, sem mandar o executor investigar o Delphi ou redescobrir decisões anteriores?

## Answer

Consolidado em [`dossie.md`](../dossie.md) — autocontido, com todas as decisões dos tickets 01-06 inlined (não só linkadas): estado atual/lacunas, máquina de estados de voz, multisseleção e contrato com o hospedeiro, leiaute escolhido do detalhe (com o protótipo como asset), contrato de dados/segurança do detalhe, acessibilidade/reuso, uma síntese de contratos técnicos (props do painel, adaptador, autorização, formato indicativo do endpoint combinado), critérios de aceite, estados de erro e matriz de testes. Fecha com a seção "Fora do escopo" (herdada do mapa) e um gap não decidido pelo mapa (repasse de `product` ignorado pelo controller, achado na auditoria) sinalizado para quem for implementar.

Este dossiê é a fonte primária para uma futura conversão em prompt SpecKit (`speckit.specify`, a exemplo dos módulos já existentes em `modules/`) — essa conversão em si é um passo deliberado fora deste mapa, não automático.
