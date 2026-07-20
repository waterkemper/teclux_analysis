# Consolidar e produzir o prompt /speckit.specify complementar

Type: task
Status: resolved
Blocked by: 04-definir-testes-e-aceite

## Question

Como consolidar a evidência, as decisões e os critérios de aceite deste mapa num prompt `/speckit.specify` complementar (não substituto) ao já publicado em `modules/vendas/contratos-cancelamento-lote/01-speckit-prompt.md`, pronto para uso no Cursor?

## Answer

- `DECISÃO NOVA` — prompt publicado em [`modules/vendas/contratos-cancelamento-lote/02-speckit-prompt-atendimento.md`](../../../modules/vendas/contratos-cancelamento-lote/02-speckit-prompt-atendimento.md), como um **prompt de correção/complemento**, não um redesenho — explicita logo no início que `CancelarContratoCommand` já existe e não deve ser refeito, e que só três pontos precisam de correção: `tipo` (`'C'`→`'V'`), ausência de checagem de follow-up, e texto sem o Motivo.
- Estrutura: contexto do que já existe e não deve ser tocado, vocabulário, evidência Delphi (referência) × Laravel atual (a corrigir), solução em 4 passos (corrigir tipo, implementar follow-up, incluir Motivo no texto, preservar o resto), Testing Decisions, 11 critérios de aceite, Out of Scope (explicitamente excluindo mover para outbox/retry e excluindo backfill) e Further Notes apontando para este mapa e para o prompt irmão da feature base.
- Reconcilia com o `Out of scope` deste mapa: F6 inline do Cadastro completo, Atendimento em `CancelarOrcamentoService`, e qualquer implementação direta.
