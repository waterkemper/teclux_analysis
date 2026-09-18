# Medir qualidade de uma amostra dos dados

Type: task
Status: resolved
Blocked by:

## Answer

O relatório [qualidade da amostra dos dados](../research/qualidade-da-amostra.md) foi produzido a partir das fontes locais e das autoridades do legado. Não há base de cliente conectada no workspace, portanto a medição numérica ficou pendente e nenhum número foi inventado.

Está confirmado que o sistema possui estoques atuais, movimentos com snapshots, documentos fiscais, vendas perdidas e pedidos entre filiais. O Delphi expõe produto, filial, tipomovimento, quantidade, operacao, data e saldos no dataset da Consulta de Compras. O shape de teste de estoques cobre saldos, reservas, transito, minimo/maximo e datas. Pedidosfiliais cobre requisitante, requisitada, quantidades, situacao e datas.

O relatório entrega consultas reproduziveis para cobertura temporal, volume, nulos, duplicidades heuristicas, ausencia de historico, dias sem movimento, divergencia entre ultimo snapshot e saldo atual, taxonomia e atraso de carga quando existir watermark. Também separa a medicao dos canais de transferencia e compra, respeitando inativol, foralinhal, vendas perdidas fora da primeira entrega e a semantica atual de devolucoes.

Até executar o roteiro em uma base representativa, a seleção definitiva de modelo fica bloqueada; ausência de movimento não será tratada automaticamente como venda zero e a primeira validação deve usar baselines/fallback ECC.

## Question

Com acesso a uma base representativa de cliente, medir por tabela e por produto × filial: quantidade de registros, cobertura temporal, primeira/última data, nulos, duplicidades, atrasos, produtos/filiais sem histórico, dias sem movimento, divergência entre movimento e saldo atual e distribuição de rupturas/vendas perdidas/transferências.

Entregar também a taxonomia observada de `tipomovimento`, `operação`, situação fiscal e estorno, com consultas reproduzíveis e amostra anonimizada ou somente estatísticas agregadas.
