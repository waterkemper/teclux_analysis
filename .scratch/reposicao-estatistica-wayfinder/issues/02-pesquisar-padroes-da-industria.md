# Pesquisar padrões da indústria de reposição varejista

Type: research
Status: resolved
Blocked by:

## Question

Quais práticas são hoje padrão ou recorrentes no varejo para reposição de múltiplos itens e filiais: ABC/XYZ, previsão hierárquica, modelos de demanda intermitente, nível de serviço, estoque de segurança, ponto de pedido, revisão periódica, quantis, otimização de rede e simulação?

Comparar o uso real de baselines, suavização, Croston/TSB, regressão linear, KNN, gradient boosting e Monte Carlo; indicar quando cada técnica é apropriada, quais dados exige e quais fontes primárias sustentam a conclusão.

## Answer

Pesquisa registrada em [research/padroes-da-industria.md](../research/padroes-da-industria.md).

**CONFIRMADO:** o padrão maduro é combinar previsão, incerteza/quantis, lead time, calendário de abastecimento, estoque disponível, suprimento em aberto, política de serviço e restrições de lote/múltiplos/capacidade. A recomendação final é uma necessidade líquida sujeita à política de inventário, não simplesmente o resultado de um algoritmo de previsão.

**CONFIRMADO:** nível de serviço, lead time e erro de previsão dirigem o estoque de segurança. Soluções corporativas usam ponto de reposição, estoque de segurança e alvo máximo; DDMRP é uma opção relevante, não uma obrigação universal.

**CONFIRMADO:** validação deve ser temporal, com origem deslizante e sem vazamento de futuro. No M5, LightGBM/boosting global foi muito competitivo, mas suavização exponencial continuou competitiva no nível produto-loja; combinações também foram importantes.

**CONFIRMADO:** Croston é recorrente para demanda intermitente, mas tem limitações de viés e intervalos; SBA/TSB devem ser avaliados, especialmente quando houver obsolescência.

**INFERIDO:** KNN é candidato para analogias e cold start, regressão linear para explicabilidade e variáveis externas, e boosting para muitas séries relacionadas e covariáveis. Nenhum deles deve ser obrigatório sem backtest.

**DECISÃO NOVA:** Monte Carlo será tratado como mecanismo candidato para simular demanda/lead time e gerar cenários ou quantis, não como modelo universal de previsão.

**DECISÃO NOVA:** o módulo deve começar com um portfólio por segmento — baseline, ETS, intermitência e modelos com covariáveis — e selecionar por backtest orientado ao resultado operacional: ruptura/fill rate, estoque médio, excesso, capital, transferências e custo, além de MAE/RMSE.
