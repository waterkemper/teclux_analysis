# Consolidar a matriz de estado atual da conversao

Type: task
Status: resolved
Blocked by: 06

## Question

Qual e a matriz factual, por dominio e capacidade, que sustenta o Mapa de estado sem overclaim?

A tarefa deve cruzar o inventario ja levantado no mapa anterior com o codigo, as especificacoes fechadas e as ressalvas de conviviencia com o Delphi. Para cada entrada, registrar: dominio, capacidade visivel para o usuario, estado da regua, mudanca em relacao ao Delphi, evidencia primaria e ressalva. O resultado deve ser completo o suficiente para alimentar a apresentacao, mas agrupado para nao voltar a ser uma lista de menus.

## Answer

A matriz factual foi consolidada em [Matriz de estado atual da conversao](07-matriz-estado-atual.md).

Ela confirma dez dominios disponiveis no Laravel, com exemplos concretos de mudanca operacional; separa Help como em conversao/implantacao por depender de validacao ponta a ponta; e classifica Caixa e NF-e/NFC-e como especificados para evolucao, ainda nao implementados. Tambem registra as ressalvas de mobile, marketplaces e impressao termica para impedir overclaim.
