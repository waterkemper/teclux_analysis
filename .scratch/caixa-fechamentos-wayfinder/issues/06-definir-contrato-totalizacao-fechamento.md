# Definir o contrato de totalização do Fechamento

Type: grilling
Status: resolved
Blocked by: 01, 04

## Question

Como replicar como agregação Laravel (matriz dourada de casos, com evidência SQL completa da query UNION de `qryTotalizacoesCaixa`) todos os totais do Fechamento — saldo anterior, juros, descontos, devoluções (numerário e saldo de troca), cheques (à vista/prazo/não identificado), documentos (entrada/saída, por comparação de saldo cronológica), depósitos, transferências (entrada/saída, pendente vs. confirmada), cancelamentos, perdas, prestações/recebimentos, resgate de cheque, duplicatas de fornecedores, cartão, PIX, ajuste de saldo de devolução/troca, saldo atual —, resumo por filial de venda e resumo de renegociados (`qryResumoVendas`/`qryRenegociado`/`qryOrigem`), preservando arredondamento e sinal exatamente como no Delphi?

## Answer

### Saldo Atual — divergência resolvida por investigação (CONFIRMADO)

Existem três cálculos no Delphi, mas só um é de fato usado:

1. `TdtmFechamentoCaixa.GetSaldoAtual` (property) — **código morto**, nunca chamada em lugar nenhum do app (a única ocorrência de `.SaldoAtual` no código é em `dmfrentecaixa.pas`, sobre um objeto totalmente diferente, `dtmVisualizarSaldoTroca`).
2. Coluna física `saldoatual` (última subquery do UNION, pega o `saldo` gravado do último lançamento) — calculada pela SQL mas **nunca exibida** em nenhum lugar (nem tela, nem relatório).
3. CalcField `Saldo_Atual` (`qryTotalizacoesCaixaCalcFields`) — **o único realmente usado**: confirmado como `DataField` do `dtxSaldoAtual` em tela (`fmfechamentocaixa.dfm:1022`) e como o valor impresso no relatório (`dmfechamentocaixa.pas`, seção "Saldo do Caixa no Dia").

**Decisão**: a agregação Laravel replica só a fórmula (3):
```
Saldo_Atual = SaldoAnterior
            + (Prestacoes + DocEntrada + TransEntrada + ResgateCheque + AjustSldDevTroca)
            - (Devolucoes + DevolucoesSaldo + DocSaida + TransSaida + Deposito
               + ChequeAVista + ChequePre + ChequeNaoIdentificado + Duplicatas + Cartao + Pix)
```
As fórmulas (1) e (2) ficam documentadas no prompt como POSSÍVEL BUG LEGADO/código morto, não replicadas.

### Precisão numérica (CONFIRMADO por decisão)

Toda a totalização usa `MoneyDecimal` (`App\Domain\Vendas\Comercial\MoneyDecimal`), a mesma convenção já estabelecida por Contratos/Orçamentos ("nunca float como contrato público"), mesmo o Delphi usando `TFloatField`/`Double` na maioria dos campos (só `Saldo_Atual`/`AjustSldDevTroca` são `TCurrencyField` no Delphi).

### Matriz dourada de totais (CONFIRMADO por SQL, ver ticket [Confirmar evidência física](01-confirmar-evidencia-fisica-e-tipos-lancamento.md) para o detalhe por tipo)

- **SaldoAnterior**: saldo do último lançamento do caixa/filial anterior à data pesquisada (ou 0 se nenhum existir).
- **Juros**: `SUM(a.valor − coalesce(a.valorvenctoparcela, p.valorvencto))` só quando `a.valor > valorvencido`, tipos `P`/`F`.
- **Descontos**: `SUM(valorvencido − a.valor)` só quando `valorvencido > a.valor`, tipos `P`/`F`.
- **Devolucoes**/**DevolucoesSaldo**/**Deposito**/**Perdas**/**ResgateCheque**/**Duplicatas**: soma simples de `a.valor` por tipo (`N`/`A`/`B`/`J`/`R`/`G`).
- **ChequeAVista**/**ChequePre**/**ChequeNaoIdentificado**: soma de `a.valor` tipo `H`, particionada por `cheques.data` vs `cheques.vencto` (ou cheque nulo).
- **DocEntrada**/**DocSaida**: soma de `a.valor` tipo `D`, particionada pela comparação cronológica de `a.saldo` com o lançamento anterior do mesmo caixa/filial.
- **TransEntrada**: soma tipo `E`. **TransSaida**: soma tipo `S` **só quando `confirmacao = true`** (pendentes ficam fora, ver `qryTransferenciaNaoConfirmada` no ticket 08).
- **Cancelamento**: `count(*)` tipo `C` (não é valor monetário).
- **Prestacoes**: soma de `a.valor` tipos `P`/`F`.
- **AjustSldDevTroca**: soma de `a.valor` tipo `U` (o tipo não documentado no comentário-fonte Delphi, ver ticket 01).
- **Cartao**/**Pix**: **não** somam `autenticacoes.valor** — somam `recebimentos.valorlancto` via `recebimentos.transacao = autenticacoes.transacao` (tipo `T`), filtrando `tiposrecebimentos.tiporecebimento in ('C','B')` (Cartão) ou `= 'P'` (Pix).
- Todas as somas (exceto Cancelamento) excluem lançamentos cancelados via `Not Exists (select a1.numero from autenticacoes a1 where a.numero = a1.autenticacao)` — este é o único predicado de cancelamento usado pela totalização (o boolean `cancelada` só aparece em `qryEventos`, fora do escopo deste ticket — ver ticket 07).
- **Resumo por filial de venda** (`qryResumoVendas`): agrupa por `contratos.filialvenda`, com Juros/Descontos recalculados **linha a linha** por parcela (`CASE WHEN a.valor > valorvencido THEN ... ELSE 0`), não pela mesma soma condicional da totalização principal — são dois cálculos independentes que podem, em tese, divergir por dados/arredondamento; ambos devem ser implementados fielmente, sem tentar unificá-los.
- **Resumo de renegociados** (`qryRenegociado`/`qryOrigem`): filtra parcelas cujo contrato tem `primogenito` preenchido; para cada uma, busca a parcela de origem via `parcelas.origempagto` no contrato primogênito. Relação 1-para-N (uma parcela renegociada pode ter múltiplas origens), exibida como sub-linhas por origem.
