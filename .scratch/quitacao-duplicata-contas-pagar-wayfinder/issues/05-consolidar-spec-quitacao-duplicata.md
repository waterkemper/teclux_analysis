# Consolidar o dossiê e o prompt Spec Kit da Quitação de Duplicata

Type: task
Status: resolved
Blocked by: 04

## Question

Como consolidar as evidências e decisões em `modules/financeiro/contas-pagar/quitacao-duplicata/`, produzindo um dossiê focado e um prompt `/speckit.specify` autocontido para o Cursor, com baseline Laravel, requisitos, fluxos, contratos, arquivos prováveis, reusos obrigatórios, segurança, parâmetros, transações, testes, critérios de aceite, fases e exclusões explícitas?

## Answer

Foram produzidos os dois artefatos que completam a Destination:

- [`dossie.md`](../../../modules/financeiro/contas-pagar/quitacao-duplicata/dossie.md) — consolida autoridade, baseline Laravel, estados, comportamento funcional, interface do módulo, rotas, segurança, Filiais, transação, efeitos bancários/contábeis/tributários, parâmetros canônicos, idempotência, auditoria, erros, UX, adapters, fases, testes, aceite e exclusões;
- [`speckit-prompt.md`](../../../modules/financeiro/contas-pagar/quitacao-duplicata/speckit-prompt.md) — prompt `/speckit.specify` autocontido e pronto para o Cursor gerar uma spec implementável sem nova investigação do Delphi ou entrevista.

O prompt manda inspecionar o Laravel atual antes de planejar, preservar os componentes e services existentes e substituir somente os contratos inseguros. Ele fixa `preview/Pay/Cancel/Rebuild`, proof contextual, Filial de Pagamento, revisão/idempotência, parcial/residual/desconto integral, writers transacionais origem `P`, reconciliação, auditoria, adapters de lote/retorno, erros, UX, fases e testes PostgreSQL.

A checagem final confirmou UTF-8, estrutura Markdown, bloco de prompt fechado e presença dos parâmetros canônicos. Nenhuma implementação Laravel ou alteração Delphi foi realizada.
