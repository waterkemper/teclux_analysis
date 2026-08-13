# Efeitos reais e reconciliação Delphi

Type: task
Status: ready-for-agent
Blocked by: 03

## Question

Como aplicar contrato/crédito/vencimentos de forma mensurável e reconciliar Delphi por documento, fotografia e artefatos sem segunda emissão?

## Acceptance

- efeitos reais são idempotentes ou geram pendência;
- hash não mascara efeito ausente;
- devolução não inventa baixa;
- documento Delphi compatível é espelhado/vinculado;
- divergência gera pendência sem mutar Delphi.

## Prompt

Executar `modules/interlojas/transferencia-requisicao-emissao-fiscal/07-speckit-prompt-correcao-efeitos-delphi.md`.
