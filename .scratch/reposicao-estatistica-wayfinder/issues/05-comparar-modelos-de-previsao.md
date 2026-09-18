# Comparar modelos de previsão e incerteza

Type: research
Status: resolved
Blocked by: 01, 02

## Question

Qual portfólio de modelos deve ser testado por segmento: baseline ingênuo/média móvel, suavização exponencial, Croston/TSB, regressão linear, KNN por produtos/filiais análogos, árvores/boosting e previsões probabilísticas?

Definir se KNN e regressão agregam valor além dos baselines, e usar Monte Carlo para representar incerteza, lead time e cenários quando fizer sentido, em vez de tratá-lo automaticamente como previsão. Estabelecer seleção por backtest, fallback, limites de confiança e versionamento.

## Answer

Pesquisa registrada em [modelos de previsão e incerteza](../research/modelos-de-previsao.md).

Não será adotado um algoritmo único. A primeira entrega deverá comparar baselines, ETS para séries regulares, SBA/TSB para demanda intermitente, regressão linear como candidato global explicável e previsões quantílicas quando houver dados suficientes. Boosting fica inicialmente em modo sombra/piloto; KNN fica restrito a analogia e cold start; Monte Carlo será usado para simular demanda/lead time e cenários, nunca como previsão isolada.

A seleção será por segmento e canal, usando rolling-origin backtest e métricas estatísticas e operacionais. O fallback termina na regra atual do ECC e na revisão manual. O motor estatístico continuará separado da política de fontes, alocação e efetivação: transferência atende primeiro, compra atende o residual, e o fluxo existente de `pedidosfiliais` continua sendo aplicado.
