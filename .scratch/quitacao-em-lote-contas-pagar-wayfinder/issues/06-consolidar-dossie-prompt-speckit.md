# Consolidar o dossiê e o prompt Spec Kit da Quitação em Lote

Type: task
Status: resolved
Blocked by: 04, 05

## Question

Como consolidar todas as decisões e evidências em `modules/financeiro/contas-pagar/quitacao-em-lote/dossie.md` e em um único `speckit-prompt.md` autocontido, pronto para `/speckit.specify`, que mande o Cursor analisar e reutilizar o Laravel atual antes de implementar e contenha escopo, requisitos, cenários, critérios de aceite, restrições e referências suficientes?

## Answer

Consolidação concluída em dois artefatos canônicos:

- [`dossie.md`](../../../modules/financeiro/contas-pagar/quitacao-em-lote/dossie.md) reúne vocabulário, fontes/evidências, baseline Laravel revalidado, paridade Delphi, interface profunda, invariantes, parcial, atomicidade, banco, parâmetros, Auditoria, reconciliação, UI, testes, aceite e proibições;
- [`speckit-prompt.md`](../../../modules/financeiro/contas-pagar/quitacao-em-lote/speckit-prompt.md) contém um único prompt autocontido para `/speckit.specify`, ordenando caracterização prévia do Laravel vigente, reutilização dos seams existentes e produção de uma spec pronta para clarify/plan.

O prompt registra como baseline a confirmar — não como suposição eterna — o adapter batch em loop, o command individual monolítico, o Writer/vínculo bancário incompleto, a falta da página/read model e os testes PostgreSQL insuficientes. Todas as decisões dos tickets anteriores foram convertidas em requisitos verificáveis, cenários, gates e critérios de aceite, sem deixar decisão financeira para a etapa de implementação.
