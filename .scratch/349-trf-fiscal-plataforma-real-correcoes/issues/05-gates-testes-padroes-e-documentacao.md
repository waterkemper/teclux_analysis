# Gates, testes, padrões e documentação

Type: task
Status: ready-for-agent
Blocked by: 01, 02, 03, 04

## Question

Como fechar o schema gate, remover violações de arquitetura, cobrir PostgreSQL e atualizar a documentação somente após evidência?

## Acceptance

- schema gate cobre todas as tabelas/colunas usadas;
- não há introspecção de schema em request;
- SQL fica em Infrastructure/Persistence;
- eventos duplicados são centralizados;
- matriz Unit/Feature/PostgreSQL passa no PHP suportado;
- ADR/runbook refletem o comportamento comprovado.

## Prompt

Executar `modules/interlojas/transferencia-requisicao-emissao-fiscal/08-speckit-prompt-correcao-gates-testes-padroes.md`.
