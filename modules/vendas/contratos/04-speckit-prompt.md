# Prompt para /speckit.specify

```text
/speckit.specify

Crie uma especificação funcional e técnica detalhada para a proposta financeira, os planos e as parcelas do Cadastro de Contratos — Etapa 2 (Edição comercial), terceiro e último dos specs dessa etapa, construído sobre a Fundação (`01-speckit-prompt.md`), o spec de Cliente (`02-speckit-prompt.md`) e o motor comercial (`03-speckit-prompt.md`).

Não implemente nesta etapa. Você não possui acesso ao código Delphi. Considere as seções `Evidência Delphi confirmada` deste prompt como o pacote funcional legado autoritativo, incluindo as matrizes douradas — trate-as como contrato de aceitação. Inspecione somente o checkout Laravel; corrija hipóteses contrariadas por evidência concreta e cite arquivo/trecho. Classifique descobertas Laravel como CONFIRMADO, INFERIDO, DÚVIDA, NÃO LOCALIZADO ou DIVERGENTE; preserve as classificações POSSÍVEL BUG LEGADO e DECISÃO NOVA já fornecidas.

## Limite desta entrega

Inclua:

- ampliar e estabilizar o **módulo de financiamento já existente** (`CalculoFinanciamentoEngine`/`SimulacaoFinanciamentoService`) como motor compartilhado por Orçamento e Contrato, com representação de **uma linha por parcela** (nunca faixas agrupadas), identidade estável e decimal;
- a aba **Pagamentos** do Contrato em `O/R`: proposta financeira editável (plano, parcelas projetadas, vencimentos, formas/tipos de recebimento), crédito de troca, cashback e plano padrão/venda à vista;
- a **projeção somente leitura** em `F/C`, reaproveitando `FichaFinanceiraContratoParcelasPanel` e o deep-link para a Ficha Financeira completa;
- a implementação concreta do segundo método da porta `ClienteTransitionRecalculoComercialPort` (definida em `02-speckit-prompt.md`): recalcular planos/parcelas a partir dos totais produzidos pelo motor comercial (`03-speckit-prompt.md`);
- consumo da **assinatura comercial** do spec 3 para invalidar a proposta financeira e disparar o fluxo de recálculo com preview/confirmação.

Não inclua: cálculo de incidência fiscal/CFOP/alíquota (a ST é consumida como snapshot versionado, não calculada aqui), contabilização da transição `R → F`, recebimento/baixa/estorno/TEF/boleto pós-`F` (Ficha Financeira/serviços financeiros), e qualquer regra de Faturamento ou Cancelamento propriamente dita — este spec só define os contratos que essas fatias posteriores consomem.

## Fronteira de acesso às fontes

- Não tente localizar, abrir ou solicitar arquivos PAS, DFM ou data modules Delphi.
- As evidências abaixo, incluindo as matrizes douradas numéricas, já foram extraídas e comparadas com `CalculoFinanciamentoEngine`/`SimulacaoFinanciamentoService` no workspace de análise a partir de `dmcalculofinanciamento.pas/.dfm`, `fmcalculofinanciamento.pas/.dfm` e `dmcadastrocontratos.pas/.dfm`.
- Use-as como requisitos legados de entrada, preservando classificações, sem exigir reconfirmação no código/schema Delphi.
- Inspecione o checkout Laravel para confirmar o estado atual do motor de financiamento e construir a matriz de lacunas.

## Investigação Laravel obrigatória

- `App\Services\Vendas\Financiamento\{CalculoFinanciamentoEngine,SimulacaoFinanciamentoService}` — motor já em namespace neutro, base canônica a ampliar; **hoje `SimulacaoFinanciamentoService::validarCreditoTroca` rejeita crédito `>= total`** (confirme se ainda vale).
- `App\Services\Vendas\Orcamentos\OrcamentoFinanciamentoEmbutidoService` e `Pages/Vendas/Orcamentos/components/FinanciamentoEmbutidoPanel.tsx` — painel editável de referência (seleção de plano, preservação de parcelas, edição de vencimento/valor/tipo, autorização de desconto extra).
- `App\Application\Vendas\Orcamentos\GerarContrato\PlanoParcelasGate` — já valida plano/parcelas ao gerar Contrato de Orçamento; reutilize na abertura do Contrato sem tornar a fotografia vinda do Orçamento imutável em `O/R`.
- `App\Services\Vendas\{SaldoCreditoClienteService,CashbackClienteService}` — ledger/cálculo/autorização de crédito de troca e cashback já existentes na Ficha; reutilize, não recrie.
- `App\Services\Vendas\Orcamentos\OrcamentoDescontoExtraFinanciamentoGate` — prova sensível de desconto extra no financiamento, já existente.
- `Components/erp/vendas/fichaFinanceira/FichaFinanceiraContratoParcelasPanel.tsx`, `Components/erp/contratos/ParcelasLogModal.tsx`, `hooks/useConsultaContratosDetalheParcelas.ts` — projeção somente leitura e histórico já usados pela Consulta de Contratos/Ficha Financeira; reutilize tal como estão.
- O spec de motor comercial (`03-speckit-prompt.md`) — a saída/assinatura comercial que este motor financeiro consome como `commercialTotal` e demais componentes.
- O spec de Cliente (`02-speckit-prompt.md`) — o contrato da porta `ClienteTransitionRecalculoComercialPort` para o método "recalcular planos/parcelas".

## Evidência Delphi confirmada

### Fronteira entre Cadastro e razão financeiro

- Em `O/R`, a aba Pagamentos mantém uma **proposta financeira**: plano selecionado, parâmetros do cálculo, parcelas projetadas, vencimentos, valores, formas/tipos de recebimento e instrumentos aplicados — tudo integra o rascunho e o F8 atômico.
- Em `F`, as parcelas deixam de ser projeção livre e passam a compromissos financeiros; recebimento, baixa, juros/multa, renegociação, estorno, boleto, TEF pertencem à Ficha Financeira/serviços financeiros. O Cadastro fica em leitura, só expõe comandos operacionais explícitos e autorizados.
- Delphi persiste em `parcelas` número, vencimento, valor, forma, tipo de recebimento, seleção, pagamento, filial, transação, origem, boleto, evento e crédito (`dmcadastrocontratos.dfm:2867-3006`) — mistura projeção e realização fisicamente, mas isso não obriga o Laravel a misturar responsabilidades.
- Voltar de `F` para `R` e cancelar podem ser impedidos por parcelas pagas (`fmcadastrocontratos.pas:2153,2177`) — a matriz de transição das fatias de cancelamento/faturamento deve consultar o razão financeiro, não só a situação do Contrato.

### Dados persistidos versus derivados

- Persistir no Contrato: plano, taxa/encargos e desconto financeiro confirmados, total a prazo, valor aplicado de crédito de troca, valor aplicado de cashback, identificação do Cliente de bônus quando aplicável, e coleção ordenada de parcelas projetadas (sequência/origem, vencimento, valor, forma, tipo e descrição de recebimento, indicador de parcela tributária).
- Campos de pagamento, transação, boleto, evento, filial/data/valor pagos são controlados pelo domínio financeiro só após `F`.
- São derivados, nunca fonte de verdade: totais exibidos, resumo de número/valor das parcelas, "parcelas desatualizadas", lista de motivos do recálculo, saldo disponível de cashback/crédito e simulações de planos.
- Delphi mantém `PrecisaReCalcularParcelas` e lista de motivos; mudanças em Produtos, Serviços, IPI, retenções, frete, seguro, cashback e crédito de troca invalidam o cálculo (`fmcadastrocontratos.pas:1699-1746,1889-1902,2068-2090,2422-2463`; `dmcadastrocontratos.pas:20620-20628`). `POSSÍVEL BUG LEGADO`: a flag é atribuída em alguns pontos sem `or` com o valor anterior (`:1889`), podendo apagar outro motivo pendente — **não reproduzir**; derive invalidade da assinatura/lista de razões, nunca de uma flag mutável frágil.

### Motor de cálculo — base financiada e ordem das reduções

- `Financiado = mercadoria + frete + seguro − créditoTroca`; ST soma-se à base só quando não tratada separadamente (`dmcalculofinanciamento.pas:1673-1680`).
- No Contrato, "mercadoria" já chega líquida dos descontos de item, geral, cashback e cupom pelos totais comerciais do spec 3 — **cashback não é subtraído de novo dentro do motor financeiro**.
- Crédito de troca não é desconto financeiro: gera parcela própria, forma `T`, no valor do crédito; o saldo restante recebe o plano (`dmcadastrocontratos.pas:5088-5110`).
- Entradas explícitas do motor: `commercialTotal` (produtos/serviços após descontos comerciais/cashback/cupom, do spec 3), `freight`, `insurance` e encargos financiáveis, `tradeCreditApplied` (limitado por saldo/disponibilidade), `stAmount` e `stMode = separate_installment | prorated | included`, plano, data de cálculo e parâmetros de calendário.
- `financeableBase = max(0, commercialTotal + freight + insurance + includedCharges − tradeCreditApplied)`; desconto financeiro do plano incide uma única vez sobre essa base; crédito de troca e cashback nunca são classificados como desconto financeiro.

### Matriz dourada sem juros (data de cálculo `2026-01-15`, salvo indicação diferente)

| Caso | Plano/entrada | Saída esperada |
|---|---|---|
| divisão exata | base `1.200,00`; `12x`; taxa `0`; primeiro em 30 dias | 12 parcelas de `100,00`; total `1.200,00`; acréscimo `0,00` |
| resíduo | base `1.000,00`; `3x`; taxa `0`; intervalo 30 dias corridos | `333,34`, `333,33`, `333,33`; soma `1.000,00`; resíduo na primeira parcela cronológica não-ST |
| entrada percentual | base `1.000,00`; `6x`; entrada `20%`; prazo da entrada 15 dias | primeira `200,00`; saldo `800,00` dividido nas cinco restantes; soma `1.000,00` |
| desconto do plano | bruto `1.000,00`; desconto financeiro `5%`; `1x` | financiado/total a pagar `950,00`; desconto `50,00`; à vista bruto `1.000,00` |
| crédito parcial | comercial `1.000,00`; crédito `250,00`; `3x` | parcela de crédito `250,00` na data do Contrato + parcelas financeiras `250,00` cada; compromisso total `1.000,00`, base financiada `750,00` |
| crédito integral | comercial `1.000,00`; crédito disponível/aplicado `1.000,00` | uma liquidação por crédito de `1.000,00`; base financiada zero; nenhuma parcela ordinária |
| somente brindes sem ST | total comercial zero | base e parcelas financeiras zero; estado explícito `covered_without_financing`; não gerar cobrança positiva |
| somente brindes com ST separada | comercial zero; ST `80,00`; modo separado | uma parcela ST de `80,00`; nenhuma parcela ordinária |

- Delphi permite crédito igual ao `valorvista`, só rejeita crédito maior que o saldo disponível ou maior que `valorvista` (`dmcadastrocontratos.pas:14425-14445`). **`SimulacaoFinanciamentoService::validarCreditoTroca` hoje rejeita `>= total`** — para Contratos, igualdade deve ser aceita e produzir saldo financiado zero; só `>` é inválido.
- Para somente brindes e nenhuma ST, o Delphi cria uma parcela `0,00` já quitada (`dmcadastrocontratos.pas:5220-5242`) — **o novo domínio não reproduz lançamento financeiro de valor zero**; representa por `covered_without_financing`. Adapters legados de leitura podem tolerar a linha zero já existente nos dados antigos.

### Calendário, intervalo e mês de 30 dias

- Com `mestrintadias=false`, o intervalo é somado em dias corridos; com `true`, usa mês comercial (`SomarDia(...,'S')`) — afeta primeiro vencimento e os seguintes (`dmcalculofinanciamento.pas:350-370,1276-1285`).
- Testes Laravel já fixam: `2026-01-15 + 30` comercial = `2026-02-15`; `2026-01-15 + 30` corridos = `2026-02-14`; `2026-07-03 + 30` comercial = `2026-08-03`. Preserve essa distinção: `intervaloparcelas=30` não significa automaticamente um mês; só `mestrintadias=true` ativa calendário comercial.
- Dia fixo usa `diabase/aposdia`: se a data de cálculo ainda não ultrapassou o corte, usa o dia-base no mês corrente; senão, no próximo mês (`dmcalculofinanciamento.pas:312-337`). Datas inválidas no mês-alvo usam o último dia do mês; calendário de dias úteis/feriados não foi localizado como parte deste motor.

### Juros, arredondamento e múltiplo — paridade ainda não confirmada

- Delphi e Laravel calculam taxa acumulada por vencimento, truncam a parcela-base em duas casas e convergem a diferença; com juros, Delphi usa `planos.multiplo` (`dmcalculofinanciamento.pas:931-1009,1219-1234`). Juros simples (`tipo='S'`) usam proporção mensal por dias/30; os demais usam capitalização composta diária equivalente à taxa mensal no engine Laravel.
- **NÃO LOCALIZADO**: existe um teste Laravel de paridade Delphi explicitamente ignorado e nenhum fixture capturado do ERP para juros/múltiplo (`tests/fixtures/financiamento/README.md`, `CalculoFinanciamentoEngineTest::test_convergencia_respeita_tolerancia_por_quantidade_parcelas`). **Até existirem fixtures de caracterização** (mínimo: `6x` a `2,5%` composto, `6x` a `2,5%` simples, múltiplo `5,00`, entrada + juros, vencimentos irregulares), a fórmula Laravel é `INFERIDO` como equivalente, não `CONFIRMADO` — registre isso como bloqueio explícito para o workspace de análise, não presuma paridade.
- Todo ajuste residual monetário vai para a primeira parcela cronológica ordinária; parcela ST separada e parcela de crédito nunca absorvem resíduo do financiamento.

### Edição de vencimento, valor e tipo de recebimento

- Cada permissão vem do plano: `alterarvencimento`, `alterarvalor`, `alterartiporecebimento` (`dmcalculofinanciamento.dfm:78-85`); Laravel já expõe essas capabilities.
- Alterar um vencimento recompõe os posteriores a partir dele usando intervalo/mês comercial; havendo juros, seus valores são recalculados (`dmcalculofinanciamento.pas:1261-1450`). Alterar um valor antes da última faixa redistribui o saldo nas parcelas posteriores e preserva as anteriores — Laravel já implementa a mesma intenção em `recalcularComEdicoes`, mas hoje com arrays por `prestacao` e `float`.
- Caso dourado de valor: base `1.000,00`, parcelas `[333,34;333,33;333,33]`; usuário fixa a primeira em `400,00`; resultado `[400,00;300,00;300,00]`. Editar a última para total incompatível retorna erro/saldo residual, nunca cria parcela invisível.
- Caso dourado de data: parcelas mensais em `15/02`, `15/03`, `15/04`; usuário autorizado muda a primeira para `20/02`; posteriores tornam-se `20/03`, `20/04` no calendário comercial. Com juros, valores e resumo mudam conjuntamente.
- Edição é comando preparado com `expectedRevision`, preview do antes/depois e confirmação; mudança parcial nunca persiste parcelas sem atualizar plano, totais e assinatura financeira.

### Parcelas com o mesmo vencimento

- Delphi ordena parcelas por vencimento e mantém linhas distintas; vencimentos iguais compartilham o mesmo índice `parcelaorigem`; com ST separada e Cliente pessoa jurídica, a ST permanece grupo separado mesmo na mesma data (`dmcadastrocontratos.pas:5152-5218`).
- Não somar nem agrupar parcelas de mesmo vencimento, nem visualmente. Cada parcela aparece em linha própria e conserva origem (`trade_credit`, `financing`, `st`), identidade e tipo de recebimento — pagamentos, auditoria e conciliação usam essas identidades distintas.

### Substituição tributária (ST)

- Parametrizada como parcela própria, a ST recebe vencimento calculado por regras diferentes para dentro/fora do estado (`dmcalculofinanciamento.pas:876-915,1076-1091`). Sem parcela própria, é rateada proporcionalmente nas parcelas com diferença residual corrigida (`:1092-1110`).
- `CalculoFinanciamentoEngine`/`SimulacaoFinanciamentoService` atuais não calculam esses modos; `valorsubstituicao`/`valorvenctocomst` retornam `null` — modele ST como componente identificado, nunca misturado silenciosamente ao principal. Casos dourados: ST `90,00` separada produz uma parcela `90,00`; ST `90,00` rateada sobre três parcelas iguais produz `30,00` por parcela e `valorComST = principal + 30,00`. O motor consome um snapshot fiscal versionado — não calcula incidência, CFOP, alíquota ou retenção (isso é da fatia Fiscal).

### Cashback, crédito de troca e bônus

- Capacidades distintas: crédito de troca é saldo monetário do Cliente usado como funding e cria parcela `T`; cashback é saldo promocional aplicado só contra base elegível de Produtos; bônus/fidelidade identifica outro Cliente de bônus e pode resgatar Produtos — integra Produtos, não é parcela nem desconto monetário genérico (fora deste spec).
- `utilizarcreditotrocacontrato` mostra a capacidade; Delphi sugere no máximo o saldo ou valor à vista, gera parcela `T` e registra saída vinculada ao Contrato (`fmcadastrocontratos.pas:1209,3589-3665`; `dmcadastrocontratos.pas:14481-14555,5088-5120`).
- Cashback é limitado ao saldo, ao líquido elegível de Produtos, a um centavo abaixo do esgotamento e a `LimitePercentualCashBackSobreProdutos` (`dmcadastrocontratos.pas:19670-19785,20631-20669`) — se zerar o total, Delphi reduz o cashback em `0,01`; cashback integral deve retornar correção/validação para o máximo permitido, nunca financiado zero (crédito de troca integral continua permitido, por ser liquidação, não desconto).
- Aplicar esses saldos em `O/R` apenas reserva/propõe o valor; a baixa efetiva ocorre atomicamente na transição que cria o compromisso financeiro, com chave idempotente por Contrato/revision/operação; cancelamento/reversão usa lançamento compensatório, nunca edição destrutiva de histórico. Saldo é sempre recarregado e revalidado no servidor na confirmação/F8/transição — valor exibido ao abrir o modal não garante disponibilidade futura.

### Invariantes de saída obrigatórias

1. soma das parcelas ordinárias em valor presente fecha a base financiada dentro da tolerância documentada;
2. sem juros, soma nominal fecha exatamente a base em centavos;
3. crédito + parcelas ordinárias + ST separada representam integralmente o compromisso, sem dupla contagem;
4. nenhuma parcela tem valor negativo ou data anterior à permitida;
5. resíduo nunca fica só no cabeçalho: é atribuído deterministicamente ou impede confirmação;
6. número de recebimentos de cartão é decomposição informativa da parcela, não novas parcelas financeiras.

`POSSÍVEL BUG LEGADO`: existe no Delphi uma rotina completa de validação/correção do total das parcelas comentada (`ValidarTotalParcelasComTotalFinanciado`) — não reproduzir a ausência da validação; o novo motor sempre verifica fechamento.

## Estado Laravel confirmado

- `CalculoFinanciamentoEngine`/`SimulacaoFinanciamentoService` já vivem em namespace neutro (`Services\Vendas\Financiamento`) e já representam uma linha por parcela (`parcela=1`) — boa base canônica, mas ainda incompletos para ST e paridade de juros/múltiplo, e ainda com `recalcularComEdicoes` usando arrays por `prestacao` e `float` em vez de identidade estável/decimal.
- `validarCreditoTroca` hoje rejeita crédito `>= total` — confirmado divergente do comportamento desejado para Contrato (igualdade deve ser aceita).
- `FinanciamentoEmbutidoPanel`/`OrcamentoFinanciamentoEmbutidoService` já implementam seleção de plano, preservação de parcelas, edição de vencimento/valor/tipo quando permitido, validação de totais, autorização de desconto extra e confirmação de substituição do plano — base de referência para o painel editável do Contrato em `O/R`.
- `PlanoParcelasGate` já valida plano/parcelas na geração de Contrato a partir de Orçamento — reutilizável na abertura do Contrato.
- `SaldoCreditoClienteService`/`CashbackClienteService` e gates sensíveis na Ficha já existem — reutilize cálculo/ledger/autorização; crie comandos de aplicação próprios do Contrato, sem tratar "inclusão manual de saldo" como atalho.
- `FichaFinanceiraContratoParcelasPanel`, `ParcelasLogModal` e `useConsultaContratosDetalheParcelas` já existem e já são usados pela Consulta de Contratos — confirma a possibilidade de compartilhar o painel de projeção somente leitura sem duplicá-lo.
- NÃO LOCALIZADO: cálculo de ST (separada/rateada) no motor Laravel atual; fixtures Delphi de caracterização de juros/múltiplo.

## Decisões obrigatórias

1. `CalculoFinanciamentoEngine`/`SimulacaoFinanciamentoService` tornam-se o módulo de financiamento compartilhado por Orçamento e Contrato; representação sempre em **uma linha por parcela**, identidade estável (`installmentId`, `prestacao`, vencimento, valor), decimal — nunca `float` como contrato público. Faixas legadas só existem no adapter de leitura/conversão, que as expande antes de entregar ao domínio.
2. Em `O/R`, a aba Pagamentos é proposta financeira editável e integra o rascunho/F8 atômico; em `F`, parcelas viram compromissos financeiros e o Cadastro fica somente leitura, salvo comandos operacionais explícitos e autorizados (fora deste spec).
3. Persistir no Contrato apenas: plano, taxa/encargos/desconto financeiro confirmados, total a prazo, valor aplicado de crédito de troca, valor aplicado de cashback, Cliente de bônus quando aplicável, e a coleção ordenada de parcelas projetadas. Totais exibidos, resumo, motivos de recálculo e saldos são sempre derivados, nunca persistidos como fonte de verdade.
4. Invalidade da proposta financeira é derivada da assinatura comercial (spec 3) e de mudanças em frete/seguro/crédito/cashback/ST — nunca de uma flag mutável isolada. Enquanto inválida, a aba mostra parcelas anteriores como desatualizadas, os motivos, e a ação Recalcular; F8 e transição para `R/F` ficam bloqueados até recalcular e confirmar.
5. Recalcular gera preview; a nova coleção só substitui a anterior após confirmação explícita (mudança de plano ou descarte de edições manuais também exige confirmação); o backend sempre revalida soma, datas, tipos e plano no F8.
6. `financeableBase = max(0, commercialTotal + freight + insurance + includedCharges − tradeCreditApplied)`; desconto financeiro incide uma única vez sobre essa base; crédito de troca e cashback nunca são desconto financeiro.
7. Crédito de troca igual ao total é aceito e produz base financiada zero (liquidação integral); só valor maior que o saldo ou que o total é rejeitado — corrigindo a validação `>=` atual. Cobertura integral por brinde/crédito sem ST usa o estado explícito `covered_without_financing`/`covered_by_trade_credit`, nunca uma parcela de valor zero inventada.
8. Cashback nunca é subtraído de novo dentro do motor financeiro (já vem líquido no `commercialTotal` do spec 3); cashback integral é corrigido/validado ao máximo permitido, nunca produz financiado zero por si só.
9. ST é componente identificado (`separate_installment`/`prorated`/`included`) consumido como snapshot fiscal versionado — este motor não calcula incidência, CFOP, alíquota ou retenção.
10. Parcelas de mesmo vencimento nunca são somadas/agrupadas, nem visualmente; cada uma preserva linha, origem (`trade_credit`/`financing`/`st`), identidade e tipo de recebimento próprios.
11. Edição de vencimento/valor/tipo é comando preparado com `expectedRevision`, preview antes/depois e confirmação; segue as permissões do plano (`alterarvencimento`/`alterarvalor`/`alterartiporecebimento`) já existentes; mudança parcial nunca persiste sem atualizar plano, totais e assinatura financeira.
12. Calendário: `intervaloparcelas=30` não implica mês; só `mestrintadias=true` ativa calendário comercial; dia fixo usa `diabase/aposdia`; datas inválidas no mês-alvo usam o último dia do mês.
13. Paridade de juros/múltiplo permanece `INFERIDO`, não `CONFIRMADO`, até existirem fixtures de caracterização Delphi (mínimo: `6x`/`2,5%` composto, `6x`/`2,5%` simples, múltiplo `5,00`, entrada+juros, vencimentos irregulares); registre isso como bloqueio explícito, não implemente assumindo paridade silenciosa.
14. Invariantes de saída (fechamento de soma, sem parcela negativa/data inválida, resíduo sempre atribuído, decomposição de recebimento não cria parcela nova) são sempre verificadas — nunca reproduzir a ausência de validação comentada no Delphi.
15. Este motor implementa o segundo método da porta `ClienteTransitionRecalculoComercialPort` (spec 02): recalcular planos/parcelas a partir dos totais recém-produzidos pelo recálculo de produtos/serviços (spec 03).
16. Em `F/C`, a aba usa exclusivamente projeção somente leitura via `FichaFinanceiraContratoParcelasPanel`/`ParcelasLogModal` carregados sob demanda; o botão Ficha Financeira abre a experiência completa no contexto do Cliente/Contrato, sem duplicá-la no Cadastro.

## Seção "Pagamentos" dentro do seam do núcleo

- Segue o protocolo de seção da Fundação: carrega sob demanda, participa do payload sujo do F8 só quando alterada (proposta confirmada), namespace de validação próprio (`pagamentos.*`, `parcelas[i].*`), concorrência coberta pela `revision` geral.
- Em `O/R`, reutiliza `FinanciamentoEmbutidoPanel` como base visual/contratual, adaptado para consumir a assinatura comercial do Contrato em vez da do Orçamento.
- Em `F/C`, reutiliza `FichaFinanceiraContratoParcelasPanel` sem adaptação de escrita.
- F8 ordinário persiste a proposta financeira confirmada junto do restante do rascunho; nenhuma seção grava isoladamente fora do seam autoritativo.

## Autorizações e parâmetros

- Reaproveite a matriz de autorizações/parâmetros já fixada na Fundação; capabilities específicas desta seção são separadas e independentes: simular, escolher plano, editar parcelas, alterar forma/tipo, confirmar proposta — uma permissão genérica de editar Contrato não concede todas.
- Desconto extra no financiamento reusa `OrcamentoDescontoExtraFinanciamentoGate`/prova sensível já existente; provas são vinculadas a comando/plano/`revision` e expiram quando a assinatura financeira muda.
- Parcela paga, transação financeira/TEF, boleto emitido ou Contrato fora de `O/R` bloqueiam substituição da proposta no Cadastro — a Ficha Financeira é autoridade para exceções.

## Testes obrigatórios

1. Toda a matriz dourada sem juros (8 casos) como testes parametrizados do motor — regressão obrigatória.
2. Correção do `validarCreditoTroca`: crédito igual ao total aceito com base financiada zero; só `>` rejeitado.
3. Cobertura integral por brinde/crédito sem ST: nenhuma parcela de valor zero persistida; estado explícito retornado.
4. Calendário: os três casos de paridade comercial/corridos já fixados nos testes Laravel continuam passando; dia fixo antes/depois do corte.
5. Edição de valor e de data: os dois casos dourados (`[400,00;300,00;300,00]` e deslocamento de vencimento com recomposição) como testes de comando preparado/confirmado.
6. Parcelas de mesmo vencimento nunca são fundidas; identidade/origem preservadas em consulta e persistência.
7. ST: parcela separada e rateio proporcional produzem os valores dos casos dourados; ausência de fixture de incidência não bloqueia o teste do componente (mockar snapshot fiscal).
8. Invalidação: mudança na assinatura comercial (spec 3) marca a proposta como desatualizada com motivos; F8/transição bloqueados até recálculo e confirmação explícitos.
9. Crédito de troca/cashback: aplicação em `O/R` não baixa saldo real; revalidação no F8/confirmação sempre recarrega saldo do servidor; idempotência por Contrato/revision/operação.
10. Implementação da porta do spec de Cliente: dado um novo contexto de Cliente e totais comerciais já recalculados (spec 3), planos/parcelas são recompostos corretamente ou o plano manual é preservado conforme confirmado.
11. `F/C`: aba renderiza só projeção somente leitura; nenhuma rota de edição aceita comando de escrita fora de `O/R`.
12. Marcar juros/múltiplo como `INFERIDO`: incluir um teste companion que falha ruidosamente (ou é explicitamente skipado com razão) até fixtures de caracterização existirem — não deixe a lacuna silenciosa.

Prefira testes unitários table-driven para o motor financeiro (puro) e Feature tests no seam de aplicação real para proposta/recálculo/confirmação/F8 end-to-end, reutilizando fixtures compartilháveis com Orçamento quando a regra for comum.

## Entregáveis

- Contrato público do módulo de financiamento compartilhado (entrada/saída, representação por parcela, invariantes de fechamento).
- Matriz de evidência Delphi × Laravel para financiamento, incluindo divergências já confirmadas (crédito `>=`, parcela zero, ST não calculada, juros/múltiplo pendente de fixtures) e como corrigi-las ou sinalizá-las.
- Contrato da seção "Pagamentos" dentro do protocolo de seção da Fundação, incluindo a diferenciação `O/R` editável vs. `F/C` projeção.
- Implementação do segundo método da porta de recálculo comercial exigida pelo spec de Cliente.
- Critérios de aceitação e testes, incluindo as matrizes douradas como suíte obrigatória.
- Lista explícita de bloqueios que exijam fixtures/investigação Delphi adicional (juros/múltiplo, ST) antes de declarar paridade.

## Fora de escopo

- implementar durante `/speckit.specify`;
- cálculo de incidência fiscal, CFOP, alíquota, escrituração — ST é consumida como snapshot versionado;
- contabilização da transição, recebimento, baixa, juros/multa, renegociação, estorno, boleto e TEF pós-`F`;
- a transição `R → F` propriamente dita e o cancelamento/reversão financeiros — este spec só define os contratos que essas fatias consomem;
- bônus/fidelidade e resgate de Produtos (integra Produtos, fora daqui);
- redesenhar `FichaFinanceiraContratoParcelasPanel`, `ParcelasLogModal` ou a Ficha Financeira completa;
- declarar paridade de juros/múltiplo sem fixtures de caracterização Delphi;
- alterar o schema Delphi.
```
