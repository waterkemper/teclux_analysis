# Eventos, projeção, estados e capability

Type: task
Status: ready-for-agent
Blocked by: 01, 02

## Question

Como garantir que autorização real carregue a fotografia selada, projete uma única vez, trate falhas com retry e preserve estados/capability?

## Acceptance

- evento é pós-commit;
- listener carrega fotografia e verifica AUTORIZADA/compatibilidade;
- falha deixa pendência durável;
- rejeição/falha/reconciliação não colapsam estados;
- rota manual exige capability reforçada e é replay idempotente.

## Prompt

Executar `modules/interlojas/transferencia-requisicao-emissao-fiscal/06-speckit-prompt-correcao-eventos-projecao-estados.md`.
