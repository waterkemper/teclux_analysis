# Definir política de inventário e nível de serviço

Type: grilling
Status: resolved
Blocked by: 03

## Question

Como converter demanda prevista e incerteza em decisão operacional: nível de serviço, estoque de segurança, ponto de pedido, revisão periódica, mínimo/máximo, cobertura e quantidade sugerida?

Definir políticas por ABC/XYZ, criticidade, intermitência e ciclo de vida, incluindo limites 0/9999 quando aplicáveis, capacidade, múltiplos/embalagens futuros, produtos sem histórico e a regra para sugestão zero.

## Answer

- A primeira entrega usará revisão periódica com política de nível-alvo (order-up-to), alinhada à agenda da Rotina ECC. O alvo cobre o período de revisão mais o lead time.
- A proteção de serviço será calculada por quantis da demanda no horizonte de proteção, sem assumir distribuição normal ou usar z universal. O nível de serviço será configurável por segmento e filial.
- estoques.minimo e estoques.maximo serão guardrails: o alvo efetivo não fica abaixo do mínimo nem acima do máximo real. 0 representa ausência de piso e 9999 ausência de teto prático.
- Sugestão zero não gera parcela, pedidosfiliais nem compra. Pode aparecer na revisão apenas quando o cliente habilitar a visualização.
- Embalagens, múltiplos e arredondamentos ficam fora desta primeira entrega.
- Não haverá capacidade estática nova: a capacidade inicial da fonte será a disponibilidade líquida, descontando reservas e compromissos. transito só entra quando houver previsão confiável de chegada.
- A segmentação será composta por dimensões configuráveis: ABC existente, XYZ por variabilidade, intermitência por frequência de venda, ciclo de vida por evidência histórica/cadastral e criticidade definida pelo cliente, sem limiares universais.
- A posição projetada será escolhida explicitamente pelo cliente, componente a componente, e fotografada na execução. A fórmula e os componentes usados devem ser visíveis na revisão; não haverá default oculto.
- Haverá uma necessidade total única por produto/filial. Transferências elegíveis atendem primeiro; compras com fornecedores recebem somente o residual. O núcleo de demanda é comum, mas políticas, fontes, lead times e métricas continuam separados por canal.
- Produtos sem histórico usam os fallbacks já definidos no ticket de demanda, com baixa confiança e revisão manual quando a evidência for insuficiente.
