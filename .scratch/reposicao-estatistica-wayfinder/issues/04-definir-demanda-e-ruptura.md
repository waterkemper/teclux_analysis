# Definir sinal de demanda e tratamento de ruptura

Type: grilling
Status: resolved
Blocked by: 01

## Question

Como reconstruir a demanda quando o histórico de vendas está censurado por falta de estoque, fechamento, horário, produto indisponível, transferência, reserva, preço ou promoção?

Definir o sinal prioritário, agregação temporal, tratamento de zeros, outliers, devoluções, vendas perdidas, produtos novos/descontinuados, sazonalidade, feriados e mudanças de mix, incluindo o que fazer quando a evidência for insuficiente.

## Answer

- A fonte principal será a venda fiscal concluída, agregada diariamente por produto e filial usando a data local da venda.
- Transferências, requisições entre filiais e entradas de NF não serão demanda; serão sinais separados de abastecimento, compromisso ou disponibilidade.
- Na primeira entrega, `vendasperdidas` ficará fora do cálculo. Poderá ser incorporado futuramente como ajuste de demanda censurada.
- Venda zero será observada somente quando o produto estiver ativo, disponível em estoque e a filial estiver em operação. Dias sem disponibilidade, fechamento ou produto inativo serão marcados como desconhecidos/censurados, não como demanda zero.
- Devoluções seguirão exatamente a semântica já usada pela Consulta de Compras.
- Picos reais, inclusive promoções, permanecerão na série. Anomalias evidentes de dados serão sinalizadas separadamente, sem corte estatístico automático.
- Produtos novos ou com pouco histórico usarão fallback hierárquico: próprio produto/filial, produto em outras filiais, grupo/marca/classe e, sem evidência suficiente, recomendação apenas para revisão com baixa confiança.
- Sazonalidade, feriados e mudanças de mix serão usados quando houver histórico suficiente; sem evidência, o motor recuará para o baseline e sinalizará baixa confiança.
- `produtos.inativol` exclui o produto das duas reposições. `produtos.foralinhal` exclui o produto somente da reposição para compra com fornecedor; na transferência entre filiais ele continua elegível, sujeito às regras de estoque e abastecimento.
