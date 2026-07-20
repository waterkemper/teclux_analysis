# Consolidar análise de lacunas e produzir o(s) prompt(s) /speckit.specify

Type: task
Status: resolved
Blocked by: 09-definir-testes-e-aceite

## Question

Como consolidar a evidência Delphi, o inventário Laravel, as decisões, a matriz de lacunas, as dúvidas remanescentes, os contratos e os critérios de aceite em `modules/vendas/contratos-cancelamento-lote/`, produzindo um ou mais prompts `/speckit.specify` (no padrão de `modules/vendas/orcamentos-f6-exclusao-cancelamento/09-speckit-prompt.md`) prontos para uso no Cursor?

## Answer

- `DECISÃO NOVA` — consolidado um único prompt (esta fatia é coesa o suficiente para um `$to-spec`; não há necessidade de fragmentar Cancelamento e Exclusão física em prompts separados, já que compartilham tela, filtros, seleção e boa parte do contrato de resposta).
- Prompt publicado em [`modules/vendas/contratos-cancelamento-lote/01-speckit-prompt.md`](../../../modules/vendas/contratos-cancelamento-lote/01-speckit-prompt.md), seguindo a estrutura de `modules/vendas/orcamentos-f6-exclusao-cancelamento/09-speckit-prompt.md`: vocabulário, regras de evidência, evidência Delphi confirmada, estado Laravel confirmado, solução funcional obrigatória (6 seções: unificação/resolução, Cancelamento, Exclusão física, permissões/prova sensível, concorrência/idempotência, confirmação/resultado), contratos de API, costura de teste, Testing Decisions, user stories, critérios de aceite (os 17 do ticket 09), Out of Scope e Further Notes.
- O prompt declara explicitamente o pré-requisito de sequenciamento (Etapas 1–5 do rollout do `cadastro-contratos-wayfinder`, incluindo `CancelarContrato`, ainda não implementadas) para que quem rodar `/speckit.specify` não presuma que esta fatia pode avançar isoladamente.
- Dúvidas remanescentes não decididas por este mapa (`RetiraContratodoOrcamento`, significado do campo `os`) foram explicitamente carregadas para o prompt como itens 16 do "Formato esperado", não silenciadas.
- `Out of scope` do prompt final reconcilia com o `Out of scope` deste mapa (`ReverterFaturamentoContrato`, `TfrmCancelamentoReservas`, as três classes órfãs) e acrescenta itens específicos de implementação (não reativar `RetiraContratodoOrcamento`, sem identificador de lote).
