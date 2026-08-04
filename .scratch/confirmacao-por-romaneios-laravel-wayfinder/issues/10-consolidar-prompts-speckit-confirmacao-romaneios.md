# Consolidar prompts SpecKit da Confirmação por Romaneios

Type: task
Status: resolved
Blocked by: 06, 07, 08, 09

## Answer

Foi consolidado o pacote final em [modules/interlojas/confirmacao-por-romaneios/README.md](../../../modules/interlojas/confirmacao-por-romaneios/README.md), com cinco prompts coordenados:

1. [01-speckit-prompt-fundacao-dominio-seguranca.md](../../../modules/interlojas/confirmacao-por-romaneios/01-speckit-prompt-fundacao-dominio-seguranca.md) — domínio, coexistência, menu, Filial, parâmetros, capabilities, autorização, idempotência, auditoria e schema.
2. [02-speckit-prompt-consulta-f6-cancelavel.md](../../../modules/interlojas/confirmacao-por-romaneios/02-speckit-prompt-consulta-f6-cancelavel.md) — F6 direta completa sem paginação/fila, SQL set-based, joins, exportação e cancelamento real.
3. [03-speckit-prompt-confirmacao-transacional.md](../../../modules/interlojas/confirmacao-por-romaneios/03-speckit-prompt-confirmacao-transacional.md) — F5, conferências, elegibilidade, locks, unidade atômica, rollback, idempotência e transição.
4. [04-speckit-prompt-interface-grids-operacoes.md](../../../modules/interlojas/confirmacao-por-romaneios/04-speckit-prompt-interface-grids-operacoes.md) — shell, filtros, radio buttons, F9, grids, NF-e, atalhos, estados e exportação.
5. [05-speckit-prompt-aceite-testes-observabilidade.md](../../../modules/interlojas/confirmacao-por-romaneios/05-speckit-prompt-aceite-testes-observabilidade.md) — aceite, testes PostgreSQL, cancelamento, concorrência, observabilidade e proibições.

O README aponta as quatro pesquisas Delphi/Laravel, o snapshot autoritativo PostgreSQL e o glossário. A rastreabilidade cobre filtros, SQL, parâmetros, autorizações, menu/acessosmodulos, grids, F9, máscara NF-e, F6/F5, joins pelo schema, ausência de N+1, `pg_cancel_backend()`, idempotência, rollback, testes e fora de escopo.

Não foi executado `/speckit.specify`, não houve implementação, migration, alteração PAS/DFM, teste de driver ou `hashtablefs`.

## Question

Como decompor as decisões e evidências em uma sequência mínima de prompts `/speckit.specify` em `modules/interlojas/confirmacao-por-romaneios/`, com README, pesquisas, schema, dependências, fronteiras, contratos, requisitos, critérios de aceite, matriz de testes e fora de escopo? Validar rastreabilidade para cada filtro, SQL, parâmetro, autorização, operação, grid, modal, atalho, máscara, join, consulta cancelável e regra de não-N+1.

Os prompts devem consultar os artefatos já gerados e o checkout Laravel, não implementar durante a especificação, não testar driver/`hashtablefs` e não reabrir escopos de Cadastro de Romaneios ou Confirmação por Notas.
