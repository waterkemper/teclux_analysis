# Prompt 06 — Execução assíncrona, snapshots e idempotência

## Prompt para /speckit.specify

/speckit.specify

Especifique e implemente a execução assíncrona da Reposição Estatística usando as filas, scheduler e Horizon já existentes. Leia os contratos de OperationalTaskRegistry, scheduled_occurrences, operational_executions e os jobs do ECC antes de criar novos nomes.

Uma execução deve:

- ser disparada por rotina/configuração válida ou manualmente com permissão;
- montar dataset e política no Laravel;
- criar snapshot imutável de filtros, componentes de estoque, período, calendário, lead time, modelo, versão, políticas e dados de entrada;
- calcular recomendação e alocação em job reprocessável;
- produzir status pendente, processando, pronto, fallback, bloqueado ou falho;
- ser idempotente por rotina, janela, ciclo e versão efetiva;
- impedir duplicidade de lote pendente no mesmo cenário;
- preservar resultado parcial e motivo de falha;
- nunca confirmar pedidosfiliais durante o cálculo.

Uma configuração alterada só afeta execuções futuras. Retry não pode duplicar snapshot, recomendação, decisão ou pedido. O snapshot deve manter a linhagem suficiente para explicar cada linha e permitir backtest posterior.

Implemente os modos sombra e piloto como estados de política, sem alterar o fluxo atual no modo sombra. No piloto, a recomendação aparece para revisão humana, mas ainda não há aprovação automática. Transferência e compra possuem estados e métricas independentes.

## Aceite

- [ ] Execução é assíncrona, idempotente e observável.
- [ ] Snapshot é autocontido e imutável.
- [ ] Retry não duplica efeitos.
- [ ] Nenhum job confirma estoque ou pedidosfiliais.
- [ ] Modo sombra não altera o fluxo atual.
- [ ] Piloto exige revisão humana.
- [ ] Falhas de qualidade/infraestrutura usam fallback ECC ou revisão manual.
- [ ] Compatibilidade PostgreSQL 9.5/9.6 é validada.
