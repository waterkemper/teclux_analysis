# Fotografia autoritativa completa

Type: task
Status: ready-for-agent
Blocked by: 01

## Question

Como completar a fotografia server-side sem defaults fiscais, sem fixture de produção e sem aceitar autoridade do request?

## Acceptance

- origem confirmada, revisão, linhas, lotes, estoque/reserva e filial física são server-side;
- participante, classificação, preço, impostos, transporte, volumes e efeitos aplicáveis são resolvidos antes do seal;
- ausência/conflito bloqueia com pendência;
- retry usa revisão persistida mesmo após alteração cadastral;
- fixture só existe em teste/dry-run isolado.

## Prompt

Executar `modules/interlojas/transferencia-requisicao-emissao-fiscal/05-speckit-prompt-correcao-fotografia-autoritativa.md`.
