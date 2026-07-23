# Consolidar o dossiê e o prompt Spec Kit da Autorização de Pagamentos

Type: task
Status: resolved
Blocked by: 04

## Question

Como consolidar as evidências e decisões em `modules/financeiro/contas-pagar/autorizacao-pagamentos/`, produzindo dossiê focado e prompt `/speckit.specify` autocontido, com baseline Laravel atualizado, requisitos, jornadas, contratos, arquivos prováveis, reusos, segurança, parâmetros, testes, fases, critérios de aceite e exclusões explícitas?

## Answer

Foram produzidos os artefatos finais:

- [Dossiê — Autorização de Pagamentos](../../../modules/financeiro/contas-pagar/autorizacao-pagamentos/dossie.md): consolida evidência Delphi, baseline Laravel revalidado, matriz preservar/estender/substituir/excluir, estados, read model, seleção/lote, commands, proof, Parâmetro do Sistema, Auditoria, impressão, UX, erros, integração, arquivos, fases, testes, aceite e exclusões.
- [Prompt `/speckit.specify` — Autorização de Pagamentos](../../../modules/financeiro/contas-pagar/autorizacao-pagamentos/speckit-prompt.md): briefing autocontido para o Cursor, instruindo-o a inspecionar primeiro o Laravel atual, reutilizar os ativos existentes e gerar uma spec pronta para `/speckit.plan`, sem reler Delphi nem deixar decisões financeiras abertas.

O prompt preserva explicitamente `AuthorizeDuplicataPaymentCommand`, Policies, Sensitive Operation, revision, idempotência, Filiais, manifest de parâmetros, query de impressão e testes atuais; exige apenas os seams ausentes. O mapa atingiu o destino e não possui fog ou tickets abertos.
