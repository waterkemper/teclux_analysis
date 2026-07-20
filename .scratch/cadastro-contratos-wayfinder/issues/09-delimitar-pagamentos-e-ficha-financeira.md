Type: task
Status: resolved
Blocked by: 01, 02, 03

## Question

Qual é a fronteira entre o Cadastro de Contratos, planos de pagamento, parcelas e Ficha Financeira, incluindo recálculo, vencimentos, formas de pagamento, financiamento, bônus, cashback, saldo de troca, impostos retidos e bloqueios por situação?

Identificar dados persistidos, dados derivados, autorizações e componentes Laravel existentes que devem ser reaproveitados.

## Answer

### Fronteira entre Cadastro e razão financeiro

- `DECISÃO NOVA` — Em `O/R`, a aba Pagamentos mantém uma **proposta financeira do Contrato**: plano selecionado, parâmetros do cálculo, parcelas projetadas, vencimentos, valores, formas/tipos de recebimento e instrumentos aplicados. Tudo integra o rascunho e o F8 atômico.
- `DECISÃO NOVA` — Em `F`, as parcelas deixam de ser projeção livre e passam a compromissos financeiros. Recebimentos, baixa, juros/multa, renegociação, estorno, boleto, TEF e alterações de saldo pertencem à Ficha Financeira/serviços financeiros. O Cadastro fica em leitura e só expõe comandos operacionais explícitos e autorizados.
- `CONFIRMADO` — O Delphi persiste em `parcelas` número, vencimento, valor, forma, tipo de recebimento, seleção, pagamento, filial, transação, origem, boleto, evento e crédito (`dmcadastrocontratos.dfm:2867-3006`). A mesma estrutura mistura projeção e realização, mas essa limitação física não obriga a misturar responsabilidades no Laravel.
- `CONFIRMADO` — Voltar de `F` para `R` e cancelar pode ser impedido por parcelas pagas (`fmcadastrocontratos.pas:2153,2177`). Logo, a matriz de transição deve consultar o razão financeiro, não apenas a situação do contrato.

### Dados persistidos e derivados

- `DECISÃO NOVA` — Persistir no Contrato: plano, taxa/encargos e desconto financeiro confirmados, total a prazo, valor aplicado de crédito de troca, valor aplicado de cashback, identificação do Cliente de bônus quando aplicável e coleção ordenada de parcelas projetadas.
- `DECISÃO NOVA` — Cada parcela projetada preserva sequência/origem, vencimento, valor, forma de pagamento, tipo e descrição de recebimento e indicador de parcela tributária quando aplicável. Campos de pagamento, transação, boleto, evento, filial/data/valor pagos são controlados pelo domínio financeiro após `F`.
- `DECISÃO NOVA` — São derivados e não fontes de verdade: totais exibidos, resumo de número/valor das parcelas, “parcelas desatualizadas”, lista de motivos do recálculo, saldo disponível de cashback/crédito e simulações de planos.
- `CONFIRMADO` — O Delphi mantém `PrecisaReCalcularParcelas` e lista de motivos; mudanças em Produtos, Serviços, IPI, retenções, frete, seguro, cashback e crédito de troca invalidam o cálculo (`fmcadastrocontratos.pas:1699-1746,1889-1902,2068-2090,2422-2463`; `dmcadastrocontratos.pas:20620-20628`).

### Cálculo, seleção de plano e parcelas

- `CONFIRMADO` — O Delphi só abre o cálculo antes de `F`, calcula mercadoria/serviços/retidos, frete, seguro, desconto financeiro, crédito de troca, ST, data, UF e grupos/classes; depois substitui a coleção de parcelas (`fmcadastrocontratos.pas:976-1076,2848-2930`; `dmcadastrocontratos.pas:5000-5195`).
- `DECISÃO NOVA` — Reutilizar e aprofundar `CalculoFinanciamentoEngine`, `OrcamentoFinanciamentoEmbutidoService` e `FinanciamentoEmbutidoPanel` como módulo neutro de financiamento. Orçamento e Contrato fornecem adapters de documento e persistência; não duplicar algoritmo ou manter nomes de Orçamento na interface profunda.
- `CONFIRMADO` — O painel Laravel existente já seleciona plano, preserva parcelas existentes, edita vencimento/valor/tipo de recebimento quando permitido, valida totais, solicita autorização de desconto extra e confirma substituição do plano.
- `DECISÃO NOVA` — Qualquer mudança na assinatura financeira invalida a confirmação: itens/serviços e totais, descontos, frete/seguro, impostos/retidos, cashback, crédito de troca, Cliente/UF e condições comerciais que alterem planos elegíveis.
- `DECISÃO NOVA` — Enquanto inválida, a aba mostra parcelas anteriores como **desatualizadas**, os motivos e ação Recalcular; F8 e transição para `R/F` são bloqueados. Não recalcular silenciosamente e substituir escolhas manuais.
- `DECISÃO NOVA` — Recalcular gera preview. A nova coleção só substitui a anterior após confirmação; mudança de plano ou descarte de edições exige confirmação. O backend revalida soma, datas, tipos e plano no F8.
- `CONFIRMADO` — O Delphi bloqueia gravação e mostra `RECALCULAR PARCELAS` se a invalidação persistir, exceto geração automática válida (`fmcadastrocontratos.pas:2439-2463`).

### Plano padrão e venda à vista

- `CONFIRMADO` — Se não há parcelas, `ClientesComPlanoPadrao` e `clientes.planopadrao` permitem calcular o plano padrão; se o total é coberto por crédito/brinde, usa `PlanoVendaVista` (`fmcadastrocontratos.pas:1038-1068,2440-2455`; `dmcadastrocontratos.pas:15753-15765`).
- `DECISÃO NOVA` — Plano padrão é sugestão/automatização parametrizada, não autorização para persistir cálculo inválido. Deve passar pelo mesmo motor e pelas mesmas validações.
- `DECISÃO NOVA` — Contrato integralmente coberto por crédito de troca ou somente brindes ainda precisa de um plano técnico à vista quando o legado exigir, mas não deve criar saldo a receber positivo. Ausência de `PlanoVendaVista` produz erro configuracional explícito.
- `CONFIRMADO` — `PlanoParcelasGate` já valida plano/parcelas ao gerar Contrato de Orçamento e deve ser reutilizado na abertura, sem tornar a fotografia vinda do Orçamento imutável em `O/R`.

### Vencimentos, formas e faturamento

- `CONFIRMADO` — Formas Delphi: dinheiro `D`, cartão de crédito `C`, débito `B`, cheque `H`, CDC `X` e crédito de troca `T`; atalhos aplicam a forma às parcelas selecionadas (`fmcadastrocontratos.pas:1374-1410,3220-3238`; `dmcadastrocontratos.pas:2973-3006`).
- `DECISÃO NOVA` — Forma de pagamento e tipo de recebimento são conceitos distintos e persistidos por parcela. A UI não deve inferir um pelo outro nem usar somente cor; rótulo textual e código permanecem disponíveis.
- `CONFIRMADO` — `FaturarAlteraPercelas` desloca vencimentos pela diferença entre abertura/faturamento; quando falso, vencimento anterior à reserva/faturamento bloqueia. Planos com mês de 30 dias têm tratamento próprio (`dmcadastrocontratos.pas:3180-3365`).
- `DECISÃO NOVA` — Ajuste de vencimentos no faturamento será uma política explícita e preview da transição `R → F`, não mutação oculta do formulário. Se o parâmetro não autoriza deslocar, vencimentos inválidos bloqueiam a transição.
- `DIVERGENTE` — O Delphi permite `AtribuirFormaPagamento` mesmo depois de `R`, removendo temporariamente guards e persistindo (`dmcadastrocontratos.pas:2973-3006`). Não reproduzir como edição livre: após `F`, qualquer troca é comando financeiro autorizado, auditado e validado contra pagamentos/TEF/boleto.

### Crédito de troca, cashback e bônus

- `DECISÃO NOVA` — Crédito de troca, cashback e bônus são capacidades distintas:
  - crédito de troca é saldo monetário do Cliente usado como funding e cria parcela `T`;
  - cashback é saldo promocional aplicado somente contra base elegível de Produtos;
  - bônus/fidelidade identifica outro Cliente de bônus e pode resgatar Produtos, portanto integra Produtos e não é parcela nem desconto monetário genérico.
- `CONFIRMADO` — `utilizarcreditotrocacontrato` mostra a capacidade; o Delphi sugere no máximo o saldo ou valor à vista, gera parcela `T` e registra saída vinculada ao Contrato (`fmcadastrocontratos.pas:1209,3589-3665`; `dmcadastrocontratos.pas:14481-14555,5088-5120`).
- `CONFIRMADO` — Cashback é limitado ao saldo, ao líquido elegível de Produtos, a um centavo abaixo do esgotamento e a `LimitePercentualCashBackSobreProdutos` (`dmcadastrocontratos.pas:19670-19785,20631-20669`).
- `DECISÃO NOVA` — Aplicar esses saldos em `O/R` apenas reserva/propõe o valor. A baixa efetiva ocorre atomicamente na transição que cria o compromisso financeiro, com chave idempotente por Contrato/revision/operação; cancelamento/reversão usa lançamento compensatório, nunca edição destrutiva de histórico.
- `CONFIRMADO` — Laravel já possui `SaldoCreditoClienteService`, `CashbackClienteService`, repositórios, modais e gates sensíveis na Ficha. Reutilizar cálculo/ledger/autorização; criar comandos de aplicação do Contrato, sem chamar “inclusão manual de saldo” como atalho.
- `DECISÃO NOVA` — Saldo é sempre recarregado e revalidado no servidor na confirmação/F8/transição. Valor exibido ao abrir o modal não garante disponibilidade futura.

### Retenções e parcela tributária

- `CONFIRMADO` — Retenções de Serviço e Produto reduzem a base financiada no Delphi; ST pode virar parcela separada conforme `GerarParcelaSubstituicaoTributaria` (`fmcadastrocontratos.pas:996-1035`; `dmcadastrocontratos.pas:5080-5195`).
- `DECISÃO NOVA` — O motor financeiro consome um snapshot fiscal calculado, contendo valores que reduzem o recebível e parcelas tributárias exigidas. Ele não calcula incidência, CFOP, alíquota ou retenção.
- `DECISÃO NOVA` — Definição tributária e confirmação da parcela de ST ficam na fatia Fiscal. Pagamentos define somente como um resultado fiscal versionado compõe a base e invalida parcelas quando muda.

### Autorizações e bloqueios

- `CONFIRMADO` — Desconto extra no financiamento já usa prova sensível no Laravel (`OrcamentoDescontoExtraFinanciamentoGate`); crédito/Cliente inadimplente pode exigir Analista de Crédito no Delphi e gates foram delimitados no ticket de autorizações.
- `DECISÃO NOVA` — Capabilities separadas: simular, escolher plano, editar parcelas, alterar forma/tipo, confirmar proposta e executar operação financeira pós-`F`. Uma permissão genérica de editar Contrato não concede todas.
- `DECISÃO NOVA` — Provas sensíveis são vinculadas ao comando/plano/revision e consumidas no F8/transição. Autorizações expiram quando a assinatura financeira muda.
- `DECISÃO NOVA` — Parcela paga, transação financeira/TEF, boleto emitido ou Contrato fora de `O/R` bloqueiam substituição da proposta no Cadastro. A Ficha Financeira é autoridade para exceções.

### Reaproveitamento da Ficha Financeira

- `CONFIRMADO` — Laravel já possui `FichaFinanceiraService`, policy, repositórios e componentes completos por Cliente/Contrato. `FichaFinanceiraContratoParcelasPanel` exibe parcelas, transações, recebimentos e log; `ParcelasLogModal` já é reutilizável.
- `DECISÃO NOVA` — Na aba Pagamentos do Cadastro:
  - em `O/R`, usar o painel de financiamento editável e um preview das parcelas;
  - em `F/C`, usar projeção somente leitura de `FichaFinanceiraContratoParcelasPanel`, carregada sob demanda;
  - o botão Ficha Financeira abre a experiência completa no contexto do Cliente/Contrato, sem duplicá-la no Cadastro.
- `CONFIRMADO` — Consulta de Contratos já carrega parcelas tardiamente com `useConsultaContratosDetalheParcelas`, confirmando a possibilidade de compartilhar o painel.

### Dúvidas e divergências controladas

- `DÚVIDA` — Precisão/arredondamento, datas em mês de 30 dias, agrupamento de parcelas com mesmo vencimento e composição exata de ST precisam de casos dourados contra o Delphi e `CalculoFinanciamentoEngine`.
- `DÚVIDA` — Identificar todas as condições legadas que permitem mudar forma de pagamento em `F` e se há integrações TEF/boleto que dependem dessa alteração; até lá, permanece operação financeira fora do editor.
- `POSSÍVEL BUG LEGADO` — `PrecisaReCalcularParcelas` é atribuído em alguns pontos sem `or` com o valor anterior (por exemplo `fmcadastrocontratos.pas:1889`), podendo apagar outro motivo pendente. O Laravel deve derivar invalidade da assinatura/lista de razões, não reproduzir flag mutável frágil.

### Fronteiras de especificação

Esta fatia recomenda três prompts independentes:

1. módulo compartilhado de financiamento: assinatura, planos, preview, edição, validação e casos dourados;
2. aba Pagamentos do Contrato em `O/R`, incluindo plano padrão, parcelas, formas, cashback e crédito de troca;
3. projeção financeira somente leitura em `F/C` e integração/deep-link com Ficha Financeira.

Cada uma comporta `$to-spec` próprio. Regras tributárias, contabilização da transição e estornos continuam nas fatias Fiscal, Faturamento e Cancelamento.
