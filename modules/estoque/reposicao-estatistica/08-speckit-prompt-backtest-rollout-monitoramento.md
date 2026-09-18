# Prompt 08 — Backtest, rollout, monitoramento e rollback

## Prompt para /speckit.specify

/speckit.specify

Especifique e implemente a validação e promoção da Reposição Estatística conforme as decisões do ticket Definir backtest, rollout e guardrails.

Implemente backtest temporal walk-forward, treinando/ajustando somente com dados anteriores a cada corte e simulando o horizonte real. Consolidar métricas por produto, filial, segmento e canal, comparando contra ECC e operação manual quando houver registro.

Medir erro absoluto ponderado, viés, cobertura dos intervalos, fill rate, dias de ruptura, estoque médio/excesso, transferências, residual de compras, cancelamentos, edições e bloqueios. Não permitir que a média global esconda regressão em filial, segmento ou canal.

O rollout deve suportar:

- modo sombra obrigatório;
- piloto controlado por clusters de abastecimento, com grupo de controle;
- amostra mínima configurável, ciclo de reposição e sazonalidade relevante;
- aprovação humana obrigatória na primeira entrega;
- gates independentes para transferência e compra;
- promoção manual, versionada e justificada;
- retreinamento e promoção automáticos fora da primeira entrega.

Monitorar erro, viés, cobertura, fill rate, ruptura, estoque, exceções e drift. Limites de quantidade, valor, confiança, intervalo, estoque da fonte, qualidade e infraestrutura são configuráveis por cliente. Violação gera exceção explícita, sem truncamento silencioso. Circuit breaker suspende o modelo afetado e usa ECC/revisão manual. Preservar snapshots, recomendações, decisões, promoções e rollbacks.

## Aceite

- [ ] Não há vazamento temporal no backtest.
- [ ] Existe comparação contra ECC e controle operacional.
- [ ] Transferência e compra têm gates independentes.
- [ ] Modo sombra e piloto humano são obrigatórios.
- [ ] Promoção é manual e auditada na primeira entrega.
- [ ] Drift e degradação geram alertas e circuit breaker.
- [ ] Rollback retorna ao ECC/revisão manual sem apagar histórico.
- [ ] Não há autoaprovação nem retreinamento automático nesta fase.
