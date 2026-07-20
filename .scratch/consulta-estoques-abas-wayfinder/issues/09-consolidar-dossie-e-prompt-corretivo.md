Type: task
Status: resolved
Blocked by: 08

## Answer

Foram produzidos dois artefatos autocontidos:

- [Dossiê de paridade das abas](../dossie.md): estado Laravel, gaps confirmados, contratos transversais e regras completas de Estoques, Acumuladores, Financeiro, Preços por Cargo e Pedidos.
- [Prompt SpecKit corretivo](../../../modules/estoque/consulta-estoques/10-speckit-prompt-correcao-abas.md): instrução executável para inspecionar somente o Laravel atual, preservar infraestrutura existente e especificar/planejar as correções com SQL, DTOs, AuthZ, parâmetros, UI e matriz de testes.

O prompt original `09-speckit-prompt.md` foi preservado como histórico da primeira implementação; a correção ganhou arquivo próprio. O novo prompt não exige acesso ao Delphi e contém o contrato legado necessário. Nenhuma correção foi implementada durante o Wayfinder.

## Question

Como consolidar as divergências e contratos decididos em um dossiê autocontido e em um prompt SpecKit corretivo para atualizar somente as cinco abas no Laravel atual, sem pedir acesso ao Delphi e com critérios de aceite suficientes para impedir regressões?
