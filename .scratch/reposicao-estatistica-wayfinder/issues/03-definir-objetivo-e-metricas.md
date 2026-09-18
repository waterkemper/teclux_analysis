# Definir objetivo e métricas de sucesso

Type: grilling
Status: resolved
Blocked by: 01, 02

## Question

Qual problema a reposição deve otimizar primeiro: reduzir ruptura, elevar nível de serviço, reduzir estoque/capital, melhorar giro, reduzir transferências, evitar excesso/descarte ou diminuir trabalho manual?

Definir a função de objetivo, métricas por filial e produto, trade-offs aceitáveis, restrições invioláveis e o que significa superar a operação manual/ECC atual.

## Answer

**DECISÃO NOVA:** o objetivo primário da primeira versão é reduzir rupturas e elevar o nível de serviço, mantendo estoque médio, capital investido e excesso como restrições. O sistema não será otimizado apenas pela precisão estatística da previsão.

**DECISÃO NOVA:** o indicador principal de serviço será o fill rate por produto-filial, medido como percentual da demanda atendida. Dias em ruptura será indicador complementar; os valores agregados não substituirão o diagnóstico por produto e filial.

**DECISÃO NOVA:** haverá um núcleo comum de demanda, estoque e nível de serviço, com duas políticas de abastecimento:

- transferência entre filiais, usando o estoque transferível do grupo e respeitando concentração, saldo comprometido, fontes e o fluxo existente de pedidosfiliais;
- compra de fornecedor, cobrindo a necessidade que não puder ser atendida internamente e considerando lead time, fornecedor, custo, lote e geração de pedido de compra.

**DECISÃO NOVA:** a mesma necessidade seguirá uma cascata: calcular necessidade, alocar primeiro o estoque transferível do grupo e encaminhar apenas o residual para recomendação de compra. O operador poderá revisar ou optar por compra direta com justificativa.

**DECISÃO NOVA:** níveis de serviço serão configuráveis por perfil/segmento e filial, sem default universal entre clientes. Ausência de política deverá ser explícita e não poderá assumir silenciosamente um percentual.

**DECISÃO NOVA:** o painel terá métricas separadas por canal:

- transferência: fill rate, percentual coberto internamente, falta no grupo, consumo do excedente da fonte e prazo;
- compra: fill rate, estoque médio/capital, excesso, valor comprado, lead time e desempenho do fornecedor;
- comum: ruptura por produto-filial.

Essas decisões definem o objetivo e a mensuração. A segmentação, as fórmulas de estoque de segurança, o cálculo de lead time e a escolha de modelos permanecem nos tickets específicos.
