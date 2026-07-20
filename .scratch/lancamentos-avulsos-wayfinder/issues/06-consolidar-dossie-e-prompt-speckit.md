Type: task
Status: resolved
Blocked by: 05

## Question

Como consolidar as descobertas e decisões em um dossiê autocontido e em um prompt SpecKit de Lançamentos Avulsos que detalhe integralmente o comportamento necessário, o contrato das triggers e a adaptação Laravel, sem exigir acesso ao Delphi ou à base PostgreSQL durante a especificação?

## Answer

Foram consolidados dois artefatos autocontidos:

- [Dossiê funcional e técnico](../../../modules/estoque/lancamentos-avulsos/dossie.md): reúne escopo, domínio, campos, vetor `operacao`, triggers, permissões, autorização, fluxo síncrono, idempotência, transação, erros, reuso Laravel, legado proibido e critérios de aceite.
- [Prompt para `/speckit.specify`](../../../modules/estoque/lancamentos-avulsos/09-speckit-prompt.md): briefing integral pronto para o SpecKit, com instrução explícita para não investigar Delphi ou PostgreSQL e para inspecionar somente o Laravel atual em busca de componentes reutilizáveis.

O prompt fixa Lançamentos Avulsos como comando síncrono, inclusion-only e trigger-aware; exige uma única raiz, preparação/confirmacão prévia, autorização por Gerente de Estoque, idempotência durável, rollback integral, Auditoria e testes reais em PostgreSQL. Nenhuma decisão permanece no fog e nenhum novo ticket foi necessário.
