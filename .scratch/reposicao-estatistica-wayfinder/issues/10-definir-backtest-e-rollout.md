# Definir backtest, rollout e guardrails

Type: task
Status: resolved
Blocked by:

## Answer

- A validacao usara backtest temporal walk-forward, treinando somente com dados anteriores a cada corte e simulando o horizonte real de reposicao. Os resultados serao consolidados por produto, filial, segmento e canal.
- As metricas combinarao erro absoluto ponderado, vies e cobertura dos intervalos com fill rate, dias de ruptura, estoque medio/excesso, transferencias, residual para compras, cancelamentos, edicoes e bloqueios. A comparacao obrigatoria sera contra ECC e operacao manual quando houver registro.
- O rollout tera modo sombra obrigatorio e depois piloto controlado por clusters de abastecimento, mantendo grupos de controle no fluxo atual. A duracao dependera de amostra suficiente, ciclo de reposicao e sazonalidade relevante, nao apenas de prazo fixo.
- Transferencia entre filiais e compra de fornecedor terao gates, metricas, guardrails, piloto e rollback independentes. Transferencia sera avaliada antes do residual de compra.
- A primeira entrega produtiva exigira revisao humana. A recomendacao estatistica sera revalidada pelo ECC antes de gerar pedidosfiliais ou encaminhar residual para compras; promocao automatica, geracao sem aprovacao e retreinamento automatico ficam fora desta entrega.
- Limites de quantidade, valor, confianca, amplitude do intervalo, estoque da fonte, qualidade e infraestrutura serao configuraveis por cliente. Violacoes gerarao excecao explicita, sem truncamento silencioso, com fallback para ECC ou revisao manual.
- Havera monitoramento por produto, filial, segmento e canal, com alertas de degradacao/drift e circuit breaker para suspender o modelo afetado e retornar ao ECC/revisao manual. Cada execucao, modelo, parametros, snapshot, decisao e rollback sera versionado e preservado.

## Question

Como validar a reposição sem contaminar o futuro: janelas temporais, backtesting por produto/filial/segmento, benchmark contra ECC e operação manual, métricas de previsão e negócio, intervalos, testes de estresse e análise de erros?

Definir modo sombra, piloto, critérios de promoção, revisão humana, limites de quantidade/valor, alertas de degradação, drift, logs, rollback e coexistência com o fluxo atual.
