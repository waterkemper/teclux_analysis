# Durabilidade, persistência e filial física

Type: task
Status: ready-for-agent
Blocked by:

## Question

Como eliminar o estado fiscal em memória, mover SQL para Infrastructure/Persistence, reutilizar a numeração comum, falhar explicitamente em schema/consulta e resolver `filial_estoque` sem assumir que `pf.requisitada` é a filial física?

## Acceptance

- restart/retry não perde fotografia nem emissão pendente;
- nenhum token de memória é necessário para continuar;
- consultas de Application/HTTP/listeners ficam atrás de repositórios;
- falhas não retornam vazio/null silenciosamente;
- série continua usando lock e rollback da plataforma;
- filial física é validada por fonte legada autoritativa.

## Prompt

Executar `modules/interlojas/transferencia-requisicao-emissao-fiscal/04-speckit-prompt-correcao-durabilidade-e-persistencia.md`.
