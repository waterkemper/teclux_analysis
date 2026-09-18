# Pesquisa: modelos de previsao e incerteza para reposicao

Data da pesquisa: 2026-08-31

## Conclusao

Nao existe um algoritmo vencedor para todos os pares produto/filial. O motor deve selecionar candidatos por segmento, sempre comparando com baselines simples e com a Consulta de Compras/ECC atual.

## Fatos confirmados

- Baselines simples sao obrigatorios. Validacao deve ser fora da amostra e respeitar o tempo; maior complexidade nao garante melhor resultado. [Forecasting: Principles and Practice - metodos](https://otexts.com/fpp3/basic-steps.html) e [validacao temporal](https://otexts.com/fpp3/tscv.html).
- ETS representa nivel, tendencia e sazonalidade e pode fornecer previsoes e intervalos. [Exponential smoothing](https://otexts.com/fpp3/expsmooth.html) e [ETS forecasting](https://otexts.com/fpp3/ets-forecasting.html).
- Croston trata demanda intermitente separando tamanho e intervalo. SBA reduz seu vies; TSB atualiza a probabilidade de ocorrencia e reage melhor a declinio/obsolescencia. [Croston](https://doi.org/10.1057/jors.1972.50), [SBA](https://doi.org/10.1016/j.ijforecast.2004.10.001), [TSB](https://doi.org/10.1016/j.ejor.2011.05.018) e [OTexts - demanda intermitente](https://otexts.com/fpp3/counts.html).
- Regressao linear e interpretavel e pode usar calendario, preco, promocao, defasagens e atributos; regressao quantilica produz quantis diretamente. [LinearRegression](https://scikit-learn.org/stable/modules/generated/sklearn.linear_model.LinearRegression.html) e [modelos lineares](https://scikit-learn.org/stable/modules/linear_model.html).
- Boosting e candidato para modelo global com muitas series e variaveis, mas precisa provar ganho no contexto do cliente e evitar vazamento. No M5, modelos globais de boosting foram fortes, enquanto ETS permaneceu competitivo em niveis produto-loja; isso nao deve ser generalizado sem backtest local. [M5 Accuracy Competition](https://doi.org/10.1016/j.ijforecast.2021.11.013) e [HistGradientBoostingRegressor](https://scikit-learn.org/stable/modules/generated/sklearn.ensemble.HistGradientBoostingRegressor.html).
- KNN depende de atributos, normalizacao, distancia e vizinhos; nao deve ser o modelo principal. Seu melhor uso e analogia, cold start e fallback. [Nearest Neighbors](https://scikit-learn.org/stable/modules/neighbors.html).
- Previsao probabilistica e necessaria para representar risco de ruptura, quantis e intervalos; deve ser avaliada por cobertura, pinball loss, Winkler score e CRPS. [Prediction intervals](https://otexts.com/fpp3/prediction-intervals.html) e [distributional accuracy](https://otexts.com/fpp3/distaccuracy.html).
- Monte Carlo deve propagar distribuicoes de demanda e lead time para cenarios de estoque, ruptura e sobra. Nao e um algoritmo de previsao isolado.

## Portfolio recomendado para a primeira entrega

1. Baselines: ultima venda, media movel, media historica e ingenuo sazonal quando houver evidencia.
2. ETS para produtos regulares, com ou sem sazonalidade comprovada.
3. SBA e TSB para produtos intermitentes; TSB especialmente quando houver declinio persistente.
4. Regressao linear como candidato global explicavel, somente quando houver variaveis confiaveis.
5. Previsoes quantilicas/probabilisticas nos segmentos com historico suficiente.
6. Boosting quantilico em modo sombra ou piloto, depois dos baselines e ETS.
7. KNN apenas para produtos/filiais analogos e fallback de produtos novos.
8. Monte Carlo somente quando as distribuicoes de demanda e lead time forem confiaveis.

## Selecao por segmento

| Segmento | Candidatos principais | Observacao |
|---|---|---|
| Regular e alto giro | ingenuo sazonal, ETS, regressao, boosting | medir principalmente fill rate e capital |
| Regular sazonal | ETS sazonal, regressao com calendario, boosting | sazonalidade precisa aparecer no historico |
| Intermitente | media movel, Croston como referencia, SBA, TSB | nao avaliar apenas com MAPE |
| Irregular/lumpy | SBA/TSB, distribuicao por evento, quantis | limitar automacao se a evidencia for insuficiente |
| Novo/pouco historico | agregacoes, analogia e KNN | baixa confianca e origem da estimativa visiveis |
| Declinio | TSB, baseline recente e tendencia | respeitar `produtos.inativol` e `produtos.foralinhal` por canal |

## Backtest e fallback

Usar rolling-origin cross-validation: treinar apenas com dados disponiveis na data da decisao, repetir em varias datas, respeitar o horizonte de reposicao e congelar as features historicas. Avaliar erro pontual (MAE, WAPE, MASE/RMSSE e vies), previsao probabilistica (pinball, cobertura, Winkler e CRPS) e resultado operacional (fill rate, rupturas, estoque medio, excesso, capital, transferencias e compras).

O vencedor deve ser selecionado por segmento e canal, com transferencia atendendo primeiro e compra cobrindo o residual. A hierarquia de fallback e: modelo vencedor; combinacao; ETS/media sazonal; SBA/TSB; agregacao; regra atual do ECC; revisao manual.

## Evidencia local e implicacao

O Laravel ja possui `ReposicaoEccMotorPort` e `ConsultaComprasReposicaoEccMotorAdapter`; hoje o ECC delega a sugestao para a Consulta de Compras. A camada estatistica deve entrar como motor adicional atras dessa fronteira, sem alterar neste ticket a revalidacao, alocacao, autorizacao ou geracao de `pedidosfiliais`. O desenho de execucao, persistencia e treinamento fica para o ticket de arquitetura.

## Inferencias para este sistema

- O mesmo nucleo de demanda pode servir os dois canais, mas a politica de estoque, as fontes elegiveis e as metricas devem permanecer separadas para transferencia e compra.
- O modelo estatistico deve produzir previsao, incerteza, confianca e explicacao; nao deve decidir sozinho a fonte nem efetivar requisicoes.
- `vendasperdidas` permanece fora da primeira entrega conforme decisao anterior; a censura por falta de disponibilidade continua sendo tratada explicitamente.
