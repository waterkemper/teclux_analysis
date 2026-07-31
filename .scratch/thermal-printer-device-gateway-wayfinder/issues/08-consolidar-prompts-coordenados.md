# Consolidar os três prompts SpecKit coordenados

Type: task
Status: resolved
Blocked by: 07

## Question

Como consolidar todas as decisões em três prompts /speckit.specify autocontidos e sequenciais para contracts, agent e Laravel, cada um declarando versão/tag de contrato, dependências, investigação obrigatória, critérios de aceite, testes, rollout e fora de escopo?

## Answer

Foram criados três prompts autocontidos no padrão de `modules/`: [`01-contracts-speckit-prompt.md`](../../../modules/erp/device-gateway/01-contracts-speckit-prompt.md), [`02-agent-speckit-prompt.md`](../../../modules/erp/device-gateway/02-agent-speckit-prompt.md) e [`03-laravel-speckit-prompt.md`](../../../modules/erp/device-gateway/03-laravel-speckit-prompt.md).

A ordem é contratos → merge/release/tag `v1.1.0` → agente pinado por lockfile → agente integrado/versionado → Laravel pinado e condicionado às capabilities anunciadas. Assim, cada branch criada pelo SpecKit conhece a anterior por artefato imutável, versão, commit e SHA-256, nunca por memória da conversa ou branch não mesclada.
