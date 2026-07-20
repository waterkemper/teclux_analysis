# Aplicação de Questionários no Orçamento

Status: ready-for-agent
Label: ready-for-agent

## Problem Statement

O Cadastro de Questionários já existe no Laravel, mas o Cadastro de Orçamentos ainda não aplica automaticamente o Questionário configurado após a gravação. No Delphi, o Orçamento é persistido primeiro e, quando há Questionário vigente e Cliente elegível, uma janela obrigatória coleta todas as respostas. Essa aplicação considera o Parâmetro do Sistema por Filial, a preferência do Cliente, a repetição por Cliente/documento e o vínculo entre Orçamento e Contrato.

O modelo legado grava respostas apontando para perguntas e opções mutáveis. Isso não preserva integralmente o significado histórico quando o Cadastro de Questionários é alterado. A nova solução também precisa evitar uma tela específica de Orçamentos, pois Contratos e frente de caixa deverão reutilizar o mesmo aplicador posteriormente.

## Solution

Criar um agregado de Aplicação de Questionário e um aplicador modal reutilizável. Após a gravação bem-sucedida do Orçamento, o backend resolve o Questionário elegível por Filial e Cliente, cria ou retoma uma aplicação pendente com fotografia imutável do modelo e devolve essa pendência à tela. A modal obrigatória coleta respostas de texto, escolha única e múltipla, incluindo justificativas obrigatórias quando configuradas.

A gravação do Orçamento permanece concluída e não é revertida por falha no Questionário. Entretanto, não existe “Responder depois”: a navegação normal fica bloqueada até a conclusão. Se a sessão for interrompida à força, a pendência é reaberta no próximo acesso ao Orçamento. O mesmo núcleo suporta consulta/edição autorizada do histórico e expõe um contrato contextual para futuros consumidores em Contratos e frente de caixa.

## User Stories

1. As a Usuário de Orçamentos, I want the configured Questionnaire applied after save, so that required customer information is collected.
2. As a Usuário, I want the Orçamento persisted before the Questionnaire opens, so that questionnaire failure does not undo valid commercial work.
3. As a Usuário, I want the application modal opened automatically, so that I do not forget the required Questionnaire.
4. As a Usuário, I want navigation blocked until completion, so that the mandatory application cannot be postponed.
5. As a Usuário, I want a forced interruption recovered later, so that the pending Questionnaire is not lost.
6. As a Usuário, I want the same pending application resumed rather than duplicated, so that answers remain coherent.
7. As a Usuário, I want the current Questionnaire resolved for the active Filial, so that branch policy is respected.
8. As a Usuário, I want only available, active and temporally valid Questionnaires applied, so that obsolete models are not used.
9. As a Usuário, I want an Orçamento without Cliente saved without a Questionnaire, so that anonymous proposals remain possible.
10. As a Cliente marked “Não responder questionários”, I want no application opened, so that my configured preference is respected.
11. As a Usuário, I want non-application to remain silent, so that no unnecessary record or warning is created.
12. As a Usuário, I want a non-repeatable Questionnaire asked only once per Cliente, so that duplicate surveys are avoided.
13. As a Usuário, I want a repeatable Questionnaire asked once per document, so that each new commercial event can collect answers.
14. As a Usuário, I want an Orçamento and its derived Contract recognized as the same application context, so that conversion does not duplicate the Questionnaire.
15. As a Usuário, I want each application linked to the Cliente and source document, so that history can be found from either context.
16. As a Usuário, I want Questionnaire description and instructions visible, so that I understand what is being asked.
17. As a Usuário, I want questions displayed in configured sequence, so that the intended flow is preserved.
18. As a Usuário, I want a text question to require non-empty content, so that it is truly answered.
19. As a Usuário, I want a single-choice question to accept exactly one option, so that its meaning is unambiguous.
20. As a Usuário, I want a multiple-choice question to require at least one option, so that it is not skipped.
21. As a Usuário, I want justification required when configured, so that selected answers include the expected explanation.
22. As a Usuário, I want per-question validation near the field, so that errors are easy to correct.
23. As a Usuário, I want progress and previous/next navigation, so that long Questionnaires remain manageable.
24. As a keyboard user, I want the modal fully accessible, so that every question can be completed without a mouse.
25. As a Usuário, I want answers saved safely during progress, so that a forced interruption loses as little work as possible.
26. As a Usuário, I want only complete valid answers to conclude the application, so that no required question remains unanswered.
27. As a Usuário, I want closing and route changes prevented while pending, so that there is no ordinary bypass.
28. As a Usuário, I want browser/session interruption to leave a recoverable pending state, so that the Orçamento itself remains saved.
29. As a Usuário, I want a changed Questionnaire model not to alter an application already started, so that the pending flow remains stable.
30. As an auditor, I want completed applications to retain a snapshot of description, questions and options, so that old answers remain interpretable.
31. As an auditor, I want Cliente, document, Filial, Usuário and timestamps recorded, so that the application is traceable.
32. As a Usuário, I want a manual Questionnaire action on the Orçamento, so that I can inspect its applications and answers.
33. As a Usuário, I want completed answers read-only by default, so that history is protected.
34. As an authorized Usuário, I want to edit answers while the document is editable, so that genuine mistakes can be corrected.
35. As an authorized Usuário, I want answer changes audited, so that the original completion and later edits are distinguishable.
36. As a Usuário, I want editing disabled when the document is no longer editable, so that finalized history cannot be rewritten.
37. As a Usuário, I want concurrent answer edits detected, so that another session is not silently overwritten.
38. As a Usuário, I want repeated submit clicks idempotent, so that responses are not duplicated.
39. As a Usuário, I want an unavailable or deleted model after application creation not to break the snapshot, so that completion remains possible.
40. As a Usuário, I want a clear recoverable error when response persistence fails, so that the modal does not falsely conclude.
41. As a maintainer, I want Cadastro and Application responsibilities separated, so that model editing does not leak into document workflows.
42. As a maintainer, I want one reusable Questionnaire runner, so that Contracts and point of sale can adopt it without copying UI/business rules.
43. As a maintainer, I want document-specific behavior injected through context, so that the shared runner remains independent of Orçamento internals.
44. As a future Contract user, I want an Orçamento-derived Contract to reuse the existing application identity, so that answers are not duplicated.
45. As a future point-of-sale user, I want the same runner to support an identified Cliente, so that sales can collect the same Questionnaire.
46. As a future point-of-sale user, I want an unidentified sale to skip the Questionnaire, so that anonymous checkout is not blocked.
47. As a maintainer, I want Delphi evidence and Laravel decisions classified, so that legacy UI limitations are not requirements.
48. As a maintainer, I want high-level tests across save, modal and persistence, so that the complete obligation is proven.

## Implementation Decisions

- Distinguish Questionnaire model from Questionnaire Application occurrence.
- Introduce an application aggregate with status at least pending/completed, source context, Cliente/type, Filial, actor/timestamps, snapshot, answers and revision.
- Resolve `QUESTIONARIO ATUAL` using the active Filial and existing parameter precedence.
- Require Questionnaire availability, current temporal window and no effective inactivation at the moment an application is created.
- Skip silently when there is no Cliente or a type `C` Cliente has `naoresponderquestionarios`; do not persist a reason for non-application.
- Apply `respondermaisdeumavez = false` once per Questionnaire+Cliente/type. When true, apply once per canonical document identity.
- Treat an Orçamento and its derived Contract as equivalent for repetition.
- Persist a full semantic snapshot: Questionnaire description/instructions, sequence, questions, types, justification flags and options.
- Never derive historical rendering solely from mutable Cadastro rows.
- Complete the Orçamento transaction first. Questionnaire preparation/application is a separate durable workflow and never rolls back the Orçamento.
- Return application-pending metadata in the authoritative save response.
- Open one mandatory modal with no “Responder depois”. Block normal close/navigation until completion.
- Persist/recover a pending application if the browser or session is forcibly interrupted.
- Prefer incremental drafts/autosave or explicit per-step durable progress, while only marking completed after server-side validation of all questions.
- Validate text non-empty, unique exactly one, multiple at least one and configured justification non-empty.
- Keep Cadastro APIs/services separate; expose read-only snapshot creation through an application service.
- Provide pending-answer and history/view/edit modes in one reusable runner.
- Require a specific Permission and editable source document for editing completed answers.
- Audit all application creation, completion and authorized edits using existing trigger conventions where applicable.
- Use optimistic revision/locking and idempotent commands for create/resume/save/complete.
- Define a minimal source-context adapter containing source type/id/revision, Cliente/type, Filial, editability, canonical document identity and return behavior.
- Implement only the Orçamento adapter now; specify but do not integrate Contract and point-of-sale adapters.

## Testing Decisions

- Primary seam: save a real Orçamento through the Cadastro, receive the pending application, complete the mandatory modal, reopen the Orçamento and inspect the stable history.
- Recovery seam: interrupt after partial answers, reopen the Orçamento and prove the same pending application resumes without duplication.
- Test externally visible behavior rather than private helpers.
- Reuse existing Orçamento save Feature tests and Questionnaire Cadastro aggregate tests as prior art.
- Cover Filial parameter resolution, availability, temporal boundaries, inactive model, missing Cliente and Cliente opt-out.
- Cover repeatable and non-repeatable rules, including Orçamento-to-Contract equivalence.
- Cover all question types and justification validation.
- Cover model changes after application creation and prove snapshot stability.
- Cover no ordinary close/navigation, forced interruption recovery and Orçamento persistence independence.
- Cover idempotent repeated commands, concurrent sessions and stale revisions.
- Cover history view, authorized edit, denied edit, non-editable document and Audit.
- Add contract tests for future adapters without implementing their screens.

## Out of Scope

- Altering Delphi or Laravel in this analysis workspace.
- Integrating the runner into Contracts or point of sale now.
- Migrating Equipment/Service Order Checklists.
- Redesigning the existing Questionnaire Cadastro beyond minimal compatibility needs.
- Recording reasons for non-application.
- Rolling back a saved Orçamento because the Questionnaire fails or is interrupted.
- Allowing “Responder depois”.
- Copying the Delphi visual layout.

## Further Notes

- CONFIRMADO: Delphi invokes the survey after successful Orçamento persistence when save originated from the Orçamento screen.
- CONFIRMADO: Delphi also invokes it after generating/persisting a Contract from an Orçamento.
- CONFIRMADO: automatic selection reads `QUESTIONARIO ATUAL` by Filial and requires availability, vigency and no effective inactivation.
- CONFIRMADO: type `C` Cliente can opt out through `naoresponderquestionarios`; other resolved party types are not filtered by that flag in the inspected query.
- CONFIRMADO: Delphi supports `múltipla`, `única` and `texto`, with optional justification display.
- CONFIRMADO: Delphi requires every question answered, but does not require configured justification text; Laravel will improve this deliberately.
- CONFIRMADO: Delphi blocks normal window closing until validation succeeds.
- CONFIRMADO: Delphi stores Cliente/type, answer option, free text, Orçamento and Contract in `respostas_clientes`.
- CONFIRMADO: non-repeatable applies once per Cliente; repeatable prevents duplication in the same Orçamento/Contract and follows Orçamento-derived Contract equivalence.
- CONFIRMADO: the manual Orçamento button opens prior responses and allows editing according to document Situação.
- CONFIRMADO: Laravel already implements Questionnaire Cadastro, aggregate persistence, temporal status, concurrency revision, permissions and tests.
- NÃO LOCALIZADO: a Laravel application aggregate, answer repository/service, mandatory runner or Orçamento integration.
- DECISÃO NOVA: preserve a full model snapshot per application.
- DECISÃO NOVA: configured justification becomes mandatory.
- DECISÃO NOVA: forced interruption creates/resumes a durable pending application; normal postponement remains forbidden.
