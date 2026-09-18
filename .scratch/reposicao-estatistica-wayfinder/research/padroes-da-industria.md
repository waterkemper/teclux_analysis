# Pesquisa: padrões da indústria de reposição varejista

Data da pesquisa: 2026-08-31

## Síntese

**CONFIRMADO:** em soluções maduras, reposição é um pipeline de decisão, não apenas uma previsão:

1. construir demanda histórica e previsão para o horizonte de cobertura;
2. representar incerteza (distribuição/quantis ou variabilidade);
3. combinar demanda, lead time, calendário de abastecimento, estoque disponível e suprimento em aberto;
4. calcular posição de estoque, estoque de segurança, ponto de reposição ou alvo máximo;
5. gerar necessidade líquida;
6. aplicar restrições como lote mínimo, múltiplos, capacidade, fonte e calendário;
7. monitorar nível de serviço, ruptura, estoque e custo.

Esse fluxo aparece explicitamente na documentação do AWS Supply Chain, que usa previsão, lead time, calendário de origem e nível de serviço para calcular o Target Inventory Position, faz o netting entre estoque/suprimento e demanda e aplica quantidade mínima/múltiplos ao gerar transferência ou compra ([AWS: Service level](https://docs.aws.amazon.com/connect-decisions/legacy/userguide/service-level.html), [AWS: Planning process](https://docs.aws.amazon.com/connect-decisions/legacy/userguide/planning-process.html)).

**CONFIRMADO:** nível de serviço, lead time e erro de previsão são determinantes do estoque de segurança. A documentação SAP descreve o nível de serviço como a capacidade de evitar falta durante o lead time e relaciona diretamente serviço, lead time e acurácia da previsão ao estoque de segurança ([SAP: Safety stock and reorder level](https://help.sap.com/docs/SAP_S4HANA_ON-PREMI_SE/af9ef57f504840d2b81be8667206d485/a06db6531de6b64ce10000000a174cb4.html)).

**CONFIRMADO:** políticas de buffer/min-max continuam presentes em produtos corporativos. O SAP Demand-Driven Replenishment calcula zonas de segurança, ponto de reposição e estoque máximo a partir de uso diário médio e lead time desacoplado ([SAP: Demand-Driven Replenishment](https://help.sap.com/docs/SAP_S4HANA_CLOUD/2bba750d1e124e1ea2a039bb1cd9b6c5/4694a223d18b4f648ea0b2872cf1d2c5.html)). Isso é uma prática disponível e relevante, mas não significa que DDMRP seja obrigatório para todo varejista.

## Previsão e seleção de modelos

**CONFIRMADO:** não existe um vencedor universal por SKU/filial. O livro de Hyndman/Athanasopoulos recomenda escolher o método conforme dados disponíveis, acurácia dos concorrentes, custo e uso da previsão; também recomenda validação temporal com origem deslizante, sem usar observações futuras ([Forecasting: data and methods](https://otexts.com/fpp3/data-methods.html), [Time series cross-validation](https://otexts.com/fpp3/tscv.html)).

**CONFIRMADO:** no M5, competição baseada em vendas varejistas hierárquicas do Walmart, modelos globais de gradient boosting/LightGBM tiveram desempenho superior no topo, mas métodos simples e baratos, como suavização exponencial, continuaram competitivos especialmente no nível produto-loja. Combinações de previsões foram relevantes e não há garantia de que uma combinação “ótima” supere uma combinação simples ([M5 accuracy competition](https://doi.org/10.1016/j.ijforecast.2021.11.013)).

**INFERIDO para este sistema:** devemos testar um portfólio por segmento, com baseline obrigatório:

- ingênuo sazonal/média móvel;
- suavização exponencial/ETS;
- Croston/SBA/TSB para demanda intermitente;
- regressão ou boosting quando preço, promoção, calendário e atributos explicarem a demanda;
- modelos globais quando houver muitas séries produto-filial relacionadas;
- quantis ou distribuição de demanda para alimentar serviço/estoque, não apenas uma previsão pontual.

### Demanda intermitente

**CONFIRMADO:** Croston é recorrente para séries com muitos zeros, estimando separadamente tamanho da demanda e intervalo entre demandas. Porém, não possui naturalmente intervalos de previsão e é conhecido por viés; a literatura posterior propõe variantes como SBA e TSB. O TSB atualiza a probabilidade de ocorrência a cada período e reage melhor à obsolescência ([OTexts: Time series of counts](https://otexts.com/fpp3/counts.html), [Teunter, Syntetos e Babai: TSB](https://doi.org/10.1016/j.ejor.2011.05.018)).

**DECISÃO RECOMENDADA:** itens intermitentes não devem ser tratados como “vendas zero normais” sem investigar ruptura, produto inativo, obsolescência e falta de registro de venda perdida.

## Avaliação orientada à decisão

**CONFIRMADO:** validação deve respeitar o tempo: cada janela de teste só pode usar dados anteriores ao ponto de previsão. Para previsões probabilísticas, cobertura e largura dos intervalos devem ser avaliadas, por exemplo com o Winkler score ([OTexts: Distributional forecast accuracy](https://otexts.com/fpp3/distaccuracy.html)).

**INFERIDO:** para reposição, RMSE/MAE isolados são insuficientes. O backtest deve medir também ruptura/fill rate, estoque médio, capital, excesso, transferências, quantidade não atendida e custo operacional, comparando contra ECC/manual. A previsão que erra menos, mas aumenta estoque ou não melhora serviço, não é necessariamente melhor.

## KNN, regressão linear e Monte Carlo

**CONFIRMADO:** KNN é uma técnica de regressão por vizinhança; ela prevê a partir das amostras mais próximas em um espaço de atributos ([scikit-learn: Nearest Neighbors](https://scikit-learn.org/stable/modules/neighbors.html)). Não aparece nas fontes corporativas consultadas como política padrão de reposição.

**INFERIDO:** KNN pode ser útil para produtos/filiais análogos, lançamentos e cold start, desde que existam atributos comparáveis e normalizados. Deve ser benchmark, não fundamento obrigatório.

**INFERIDO:** regressão linear é adequada como modelo interpretável quando preço, promoção, calendário, tendência e características explicam a demanda. Para contagens não negativas, sazonalidade complexa ou relações não lineares, deve ser comparada com ETS, modelos de contagem e boosting.

**CONFIRMADO:** plataformas corporativas já trabalham com distribuição/quantis de previsão e nível de serviço, em vez de depender só de ponto estimado ([AWS: Service level](https://docs.aws.amazon.com/connect-decisions/legacy/userguide/service-level.html)).

**DECISÃO RECOMENDADA:** Monte Carlo deve ser avaliado como mecanismo para simular demanda e lead time e produzir quantis/cenários, especialmente em itens críticos e rede multi-filial. Não deve ser imposto como “o algoritmo de previsão” nem usado para mascarar dados ruins.

## Rede de filiais

**CONFIRMADO:** em redes multi-echelon, estoque e serviço de um nó afetam o lead time e o estoque necessário em outros nós. A literatura de sistemas de dois níveis trata o serviço do armazém como variável que influencia o compromisso entre estoques no armazém e nas lojas ([Schneider, Rinks e Kelle: two-echelon inventory](https://doi.org/10.1111/j.1937-5956.1995.tb00300.x)).

**INFERIDO para o ECC:** a camada estatística deve calcular necessidade por produto-filial e depois entregar uma recomendação ao alocador/revalidador existente. A escolha de fonte, concentradora, saldo comprometido e geração de pedidosfiliais continua sendo uma política de rede separada da previsão.

## Consequências para o mapa

- A primeira versão deve ser “forecast + inventory policy + constrained allocation”, e não “projeto de IA”.
- Baselines e modelos estatísticos simples devem ser comparados antes de KNN/boosting.
- O produto precisa de previsão probabilística ou estimativa explícita de variabilidade para calcular segurança/serviço.
- O sucesso deve ser medido no resultado operacional, com backtesting temporal e modo sombra.
- Demanda censurada por ruptura e lead time real são riscos tão importantes quanto a escolha do modelo.
