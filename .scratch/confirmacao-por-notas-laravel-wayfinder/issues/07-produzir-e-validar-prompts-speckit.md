# Produzir e validar os prompts SpecKit de Confirmação por Notas

Type: task
Status: resolved
Blocked by: 06

## Question

Produzir em `modules/interlojas/confirmacao-por-notas/` os prompts autoritativos decididos e validar rastreabilidade de filtros, SQLs, batching anti-N+1, parâmetros, autorização, grids, chave NF-e, operações, atalhos, invariantes transacionais e cenários de teste.

## Comments

## Answer

Foram produzidos e validados quatro prompts:

- [Chave NF-e compartilhada](../../../modules/interlojas/confirmacao-por-notas/01-speckit-prompt-chave-nfe-compartilhada.md);
- [Fundação, acesso e autorização](../../../modules/interlojas/confirmacao-por-notas/02-speckit-prompt-fundacao-acesso-autorizacao.md);
- [Consulta, grids, batching e conferência](../../../modules/interlojas/confirmacao-por-notas/03-speckit-prompt-consulta-grids-batching-conferencia.md);
- [Confirmação transacional](../../../modules/interlojas/confirmacao-por-notas/04-speckit-prompt-confirmacao-transacional.md).

A validação confirmou rastreabilidade dos cinco parâmetros, chave canônica de 44 dígitos/DV, capability e reautenticação, Solicitante/Autorizador, filtros, ausência de paginação, dois grids, exatamente duas consultas por geração, proibição de queries em loops, `whereIn`/`ANY`/`unnest`, F5/F6, NST, `notaspag`/itens/impostos/movimentos/pedidos/financeiro, idempotência, locks, ROS/ROE e funções compartilhadas do romaneio.

Cada arquivo contém um bloco `/speckit.specify` balanceado, critérios de aceite, matriz de testes, saída esperada e fora de escopo. `git diff --check` passou sem erros.
