Type: task
Status: resolved
Blocked by: 09, 14

## Question

Quais casos dourados fixam a equivalência entre o cálculo Delphi e `CalculoFinanciamentoEngine` para base financiada, desconto financeiro, arredondamento, intervalos e mês de 30 dias, edição de vencimento/valor, parcelas com mesmo vencimento, parcela de ST, cobertura integral por brinde/crédito de troca, cashback e saldo residual?

Registrar entradas, parâmetros, plano, parcelas e totais esperados. Separar divergência intencional de possível bug legado antes do `$to-spec` do módulo compartilhado de financiamento.

## Answer

### Evidência e representação

- `CONFIRMADO` — foram analisados conjuntamente `dmcalculofinanciamento.pas/.dfm`, `fmcalculofinanciamento.pas/.dfm`, a integração em `dmcadastrocontratos.pas`, `CalculoFinanciamentoEngine`, `SimulacaoFinanciamentoService` e os testes Laravel existentes.
- `CONFIRMADO` — o Delphi calcula internamente faixas de prestações: `prestacao` é o número inicial, `parcela` é a quantidade de repetições, `datavencto` é o primeiro vencimento e `valorvencto` é o valor unitário. Ao gravar o Contrato, expande cada faixa em linhas individuais: `dmcadastrocontratos.pas:5105-5150`.
- `CONFIRMADO` — o Laravel já retorna uma linha por prestação, com `parcela=1`. Essa representação é adequada para persistência e edição, desde que o adapter aceite/expanda faixas legadas ao ler dados existentes.
- `DECISÃO NOVA` — o Cadastro de Orçamentos Laravel e seu `CalculoFinanciamentoEngine` são a base canônica para o Contrato. O contrato público, a interface e a persistência usam sempre parcelas expandidas, uma linha por parcela, com identidade estável (`installmentId`, `prestacao`, vencimento e valor). Não haverá agrupamento de parcelas no Laravel. As faixas Delphi existem somente no adapter de leitura/conversão legado, que deve expandi-las antes de entregar os dados ao domínio.

### Base financiada e ordem das reduções

- `CONFIRMADO` — no Delphi, `Financiado = mercadoria + frete + seguro − créditoTroca`; a ST é somada à base somente quando não está sendo calculada/tratada separadamente: `dmcalculofinanciamento.pas:1673-1680`.
- `CONFIRMADO` — no Cadastro de Contratos, “mercadoria” já chega líquida dos descontos do item, geral, cashback e cupom por meio dos totais comerciais. Portanto cashback não deve ser novamente subtraído dentro do motor financeiro.
- `CONFIRMADO` — crédito de troca não é desconto financeiro: na gravação ele produz parcela própria, forma `T`, no valor do crédito, e o saldo restante recebe o plano: `dmcadastrocontratos.pas:5088-5110`.
- `DECISÃO NOVA` — entradas explícitas do motor:
  - `commercialTotal`: produtos e serviços após descontos comerciais/cashback/cupom;
  - `freight`, `insurance` e encargos financiáveis;
  - `tradeCreditApplied`, limitado pelo saldo e disponibilidade do Cliente;
  - `stAmount` e `stMode = separate_installment | prorated | included`;
  - plano, data de cálculo e parâmetros de calendário.
- `DECISÃO NOVA` — `financeableBase = max(0, commercialTotal + freight + insurance + includedCharges − tradeCreditApplied)`. Desconto financeiro do plano incide uma única vez sobre essa base; crédito de troca e cashback nunca são classificados como desconto financeiro.

### Matriz dourada sem juros

Use data de cálculo `2026-01-15`, salvo indicação diferente.

| Caso | Plano/entrada | Saída esperada |
|---|---|---|
| divisão exata | base `1.200,00`; `12x`; taxa `0`; primeiro em 30 dias | 12 parcelas de `100,00`; total `1.200,00`; acréscimo `0,00` |
| resíduo | base `1.000,00`; `3x`; taxa `0`; intervalo 30 dias corridos | `333,34`, `333,33`, `333,33`; soma `1.000,00`; resíduo na primeira parcela cronológica não-ST |
| entrada percentual | base `1.000,00`; `6x`; entrada `20%`; prazo da entrada 15 dias | primeira `200,00`; saldo `800,00` dividido nas cinco restantes; soma `1.000,00` |
| desconto do plano | bruto `1.000,00`; desconto financeiro `5%`; `1x` | financiado/total a pagar `950,00`; desconto `50,00`; à vista bruto `1.000,00` |
| crédito parcial | comercial `1.000,00`; crédito `250,00`; `3x` | parcela de crédito `250,00` na data do Contrato + parcelas financeiras `250,00` cada; compromisso total `1.000,00`, base financiada `750,00` |
| crédito integral | comercial `1.000,00`; crédito disponível/aplicado `1.000,00` | uma liquidação por crédito de `1.000,00`; base financiada zero; nenhuma parcela ordinária do plano |
| somente brindes sem ST | total comercial zero | base e parcelas financeiras zero; estado explícito `covered_without_financing`; não gerar cobrança positiva |
| somente brindes com ST separada | comercial zero; ST `80,00`; modo separado | uma parcela ST de `80,00`; nenhuma parcela ordinária |

- `CONFIRMADO` — o Delphi permite crédito igual ao `valorvista`; só rejeita crédito maior que o saldo disponível ou maior que `valorvista`: `dmcadastrocontratos.pas:14425-14445`.
- `DIVERGENTE` — `SimulacaoFinanciamentoService::validarCreditoTroca` rejeita crédito `>= total`. Para Contratos, igualdade deve ser aceita e produzir saldo financiado zero; somente `>` é inválido.
- `CONFIRMADO` — para somente brindes e nenhuma ST, o Delphi cria uma parcela `0,00` já quitada quando o parâmetro de brindes permite: `dmcadastrocontratos.pas:5220-5242`.
- `DIVERGENTE` — o novo domínio não deve inventar lançamento financeiro de valor zero. A ausência de parcela positiva é representada pelo resultado `covered_without_financing`; adapters legados podem tolerar a linha zero já existente.

### Calendário, intervalo e mês de 30 dias

- `CONFIRMADO` — com `mestrintadias=false`, o intervalo é somado em dias corridos; com `true`, `SomarDia(...,'S')` usa mês comercial. Isso afeta primeiro vencimento de prazo 30 e os seguintes: `dmcalculofinanciamento.pas:350-370`, `:1276-1285`.
- `CONFIRMADO` — os testes Laravel já fixam:
  - `2026-01-15 + 30` comercial = `2026-02-15`;
  - `2026-01-15 + 30` corridos = `2026-02-14`;
  - `2026-07-03 + 30` comercial = `2026-08-03`.
- `DECISÃO NOVA` — preservar essa distinção. `intervaloparcelas=30` não significa automaticamente um mês; somente `mestrintadias=true` ativa calendário comercial.
- `CONFIRMADO` — dia fixo usa `diabase/aposdia`: se a data de cálculo ainda não ultrapassou o corte, usa o dia-base no mês corrente; caso contrário, no próximo mês: `dmcalculofinanciamento.pas:312-337`.
- `DECISÃO NOVA` — datas inválidas no mês-alvo usam o último dia do mês; calendário de dias úteis/feriados é política separada e não foi localizado como parte deste motor.

### Juros, arredondamento e múltiplo

- `CONFIRMADO` — Delphi e Laravel calculam taxa acumulada por vencimento, truncam a parcela-base em duas casas e convergem a diferença; com juros, o Delphi chama `tecFinanceira.ArredondaValores` usando `planos.multiplo`: `dmcalculofinanciamento.pas:931-1009`, `:1219-1234`.
- `CONFIRMADO` — juros simples (`tipo='S'`) usam proporção mensal por dias/30; os demais usam capitalização composta diária equivalente à taxa mensal no engine Laravel.
- `NÃO LOCALIZADO` — o repositório contém um teste Laravel de paridade Delphi explicitamente ignorado e nenhum fixture capturado do ERP para juros/múltiplo: `tests/fixtures/financiamento/README.md` e `CalculoFinanciamentoEngineTest::test_convergencia_respeita_tolerancia_por_quantidade_parcelas`.
- `DECISÃO NOVA` — o `$to-spec` deve exigir fixtures de caracterização para pelo menos: `6x` a `2,5%` composto, `6x` a `2,5%` simples, múltiplo `5,00`, entrada + juros e vencimentos irregulares. Até esses vetores existirem, a fórmula Laravel é `INFERIDO` como equivalente, não `CONFIRMADO`.
- `DECISÃO NOVA` — todo ajuste residual monetário vai para a primeira parcela cronológica ordinária. Parcela ST separada e parcela de crédito nunca absorvem resíduo do financiamento.

### Edição de vencimento, valor e tipo de recebimento

- `CONFIRMADO` — cada permissão vem do plano: `alterarvencimento`, `alterarvalor` e `alterartiporecebimento`: `dmcalculofinanciamento.dfm:78-85`; Laravel já expõe essas capabilities.
- `CONFIRMADO` — alterado um vencimento no Delphi, os posteriores são recompostos a partir dele usando intervalo/mês comercial; havendo juros, seus valores são recalculados: `dmcalculofinanciamento.pas:1261-1450`.
- `CONFIRMADO` — alterado um valor antes da última faixa, o Delphi redistribui o saldo nas parcelas posteriores e preserva as anteriores. O Laravel implementa a mesma intenção em `recalcularComEdicoes`.
- `DECISÃO NOVA` — caso dourado de valor: base `1.000,00`, parcelas `[333,34;333,33;333,33]`; usuário fixa a primeira em `400,00`; resultado `[400,00;300,00;300,00]`. Editar a última para total incompatível deve retornar erro/saldo residual, não criar parcela invisível.
- `DECISÃO NOVA` — caso dourado de data: parcelas mensais em `15/02`, `15/03`, `15/04`; usuário autorizado muda a primeira para `20/02`; posteriores tornam-se `20/03`, `20/04` no calendário comercial. Com juros, valores e resumo mudam conjuntamente.
- `DECISÃO NOVA` — edição é comando preparado com `expectedRevision`, preview do antes/depois e confirmação. Mudança parcial nunca persiste parcelas sem atualizar plano, totais e assinatura financeira.

### Parcelas com o mesmo vencimento

- `CONFIRMADO` — o Delphi ordena as parcelas por vencimento e mantém linhas distintas. Vencimentos iguais compartilham o mesmo índice `parcelaorigem`; quando há ST separada e Cliente pessoa jurídica, a ST permanece grupo separado mesmo na mesma data: `dmcadastrocontratos.pas:5152-5218`.
- `DECISÃO NOVA` — não somar nem agrupar parcelas de mesmo vencimento, inclusive visualmente. Cada parcela aparece em sua própria linha e conserva origem (`trade_credit`, `financing`, `st`), identidade e tipo de recebimento. Pagamentos, auditoria e conciliação usam essas identidades distintas.

### Substituição tributária

- `CONFIRMADO` — quando parametrizada como parcela própria, a ST recebe vencimento calculado por regras diferentes para dentro/fora do estado e consulta do dia de cobrança: `dmcalculofinanciamento.pas:876-915`, `:1076-1091`.
- `CONFIRMADO` — sem parcela própria, a ST é rateada proporcionalmente nas parcelas e uma diferença residual é corrigida: `dmcalculofinanciamento.pas:1092-1110`.
- `DIVERGENTE` — `CalculoFinanciamentoEngine`/`SimulacaoFinanciamentoService` atuais não calculam esses modos; `valorsubstituicao` e `valorvenctocomst` retornam `null`.
- `DECISÃO NOVA` — modelar ST como componente identificado, nunca misturado silenciosamente ao principal. Casos dourados: ST `90,00` separada produz uma parcela `90,00`; ST `90,00` rateada sobre três parcelas iguais produz `30,00` por parcela e `valorComST = principal + 30,00`.

### Cashback e cobertura integral

- `CONFIRMADO` — cashback reduz o total comercial antes do financiamento e é limitado ao saldo do Cliente, aos limites de desconto e ao valor líquido dos produtos. Se zerar o total, o Delphi reduz o cashback em `0,01`: `dmcadastrocontratos.pas:19739-19781`.
- `CONFIRMADO` — portanto, no comportamento atual, cashback não cobre integralmente a venda; deve restar ao menos `0,01` de produto, além de frete/seguro/serviços que não podem ser consumidos por ele.
- `DECISÃO NOVA` — preservar essa regra enquanto o parâmetro existir: cashback integral retorna correção/validação para o máximo permitido, não resultado financiado zero. Crédito de troca integral continua permitido porque é liquidação, não desconto.
- `DIVERGENTE` — o motor Laravel isolado não recebe cashback e isso é correto; a lacuna está no orquestrador, que deve fornecer `commercialTotal` já validado e uma assinatura do motor comercial.

### Saldo residual, invariantes e divergências

- `DECISÃO NOVA` — invariantes de saída:
  1. soma das parcelas ordinárias em valor presente fecha a base financiada dentro da tolerância documentada;
  2. sem juros, soma nominal fecha exatamente a base em centavos;
  3. crédito + parcelas ordinárias + ST separada representam integralmente o compromisso, sem dupla contagem;
  4. nenhuma parcela tem valor negativo ou data anterior à permitida;
  5. resíduo nunca fica apenas no cabeçalho: é atribuído deterministicamente ou impede confirmação;
  6. número de recebimentos de cartão é decomposição informativa da parcela, não novas parcelas financeiras.
- `POSSÍVEL BUG LEGADO` — existe no Delphi uma rotina completa de validação/correção do total das parcelas comentada (`ValidarTotalParcelasComTotalFinanciado`). Não reproduzir a ausência da validação; o novo motor deve sempre verificar fechamento.
- `DIVERGENTE` — `CalculoFinanciamentoEngine` normaliza financiado negativo para zero, mas não retorna motivo nem componentes; o novo contrato deve distinguir `covered_by_trade_credit`, `covered_without_financing` e entrada inválida.
- `DIVERGENTE` — `recalcularComEdicoes` usa arrays por `prestacao` e `float`; deve migrar para identidade estável, decimal e conflito por revision.

## Spec boundary

Esta fatia **deve receber `$to-spec` próprio** para ampliar e estabilizar o módulo compartilhado de financiamento já existente no Cadastro de Orçamentos. O spec deve conservar a representação de uma linha por parcela, consumir a assinatura do motor comercial, cobrir crédito integral, cashback, ST, edição e fechamento residual, e exigir fixtures Delphi antes de declarar paridade de juros/múltiplo. O Cadastro de Contratos será consumidor desse módulo; não deverá possuir uma segunda implementação de parcelas ou qualquer agrupador de faixas.
