# Inventariar interface, filtros e atalhos da Consulta de Transferências Delphi

Type: research
Status: resolved
Blocked by:

## Question

Qual é o contrato funcional completo e comprovável da interface Delphi — controles, valores iniciais, filtros, validações, listas de filiais, seleção, estados, colunas condicionais, botões, operações, eventos e teclas de atalho — segundo `fmconsultatransferencias.pas/.dfm`, e quais ambiguidades ou possíveis bugs precisam permanecer explicitamente classificados para os prompts?

## Comments

## Answer

O contrato comprovável da interface, incluindo estado inicial, filtros, validações, seleção de filiais, geração por F6, transições, grade, colunas condicionais e ambiguidades, foi registrado em `modules/interlojas/consulta-transferencias/pesquisa-interface-delphi.md`, com cada afirmação ligada a `fmconsultatransferencias.pas/.dfm:linha`. O inventário separa explicitamente o que não pode ser concluído sem o frame de filiais, os componentes herdados ou o data module e preserva possíveis bugs para decisão posterior.
