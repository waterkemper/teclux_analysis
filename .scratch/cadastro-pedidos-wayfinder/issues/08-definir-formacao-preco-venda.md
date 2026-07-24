# Definir Formação de Preço de Venda a partir do Pedido

Type: grilling
Status: resolved
Blocked by: 06, 13, 16

## Question

Como o Pedido de Compra determina/sugere o preço de venda dos itens recebidos — `CalcularPrecoVenda`, `CalcularPrecoSugestao`, `CalcularPrecoSugestaoProdutos`, `AtribuirPreco`, `IncluirPrecosNaoCadastrados`, `MarcarDesmarcarAtualizarPrecodeVenda`, `AtribuirDadosCalculosImpostos_` (`dmcadastropedidos.pas:3323-3473,5156-5527`)? E o botão `sbnAcionarTelaFormacaoPrecoVenda` (`fmcadastropedidos.pas:1213-1224`) — abre `AcionarTelaFormacaoPrecoVenda`/unit `fmFormacaoPrecoVenda`, compartilhada fora do módulo: é um visualizador read-only do cálculo já feito, ou permite edição própria? Investigar se esse fluxo já tem equivalente no módulo Manutenção de Preços já migrado (`modules/estoque/manutencao-precos`) antes de especificar como novo — se for o mesmo motor/tela, este ticket deve apontar para reaproveitamento.

## Answer

### Divergência do ticket 06 — resolvida: `CalcularPrecoSugestao`/`CalcularPrecoSugestaoProdutos` são código morto (CONFIRMADO)

As **declarações de interface** de `CalcularPrecoSugestao` e `CalcularPrecoSugestaoProdutos` estão **comentadas** na seção de tipo da classe (`dmcadastropedidos.pas:1036,1073` — `//    procedure CalcularPrecoSugestao;`) — só a implementação (`:3323-3472`) permanece no arquivo, chamando-se mutuamente mas **inacessível como método público da classe**, e nenhum outro ponto do código as invoca. É orfã/morta.

O caminho **realmente ativo** é (`dmcadastropedidos.pas:5352-5396`):
```
function TdtmCadastroPedidos.CalcularCusto: Boolean;
begin
  result := dtmCalcularCusto.CalcularCusto_(qryProdutosPedidos, qryPedidos, FExisteAlteracaoCusto,
                false, ValorRatear, ValorRatearICMS, CadastroPedidos);
end;

function TdtmCadastroPedidos.CalcularPrecoVenda: Boolean;
begin
  result := dtmCalcularCusto.CalcularPrecoVenda_(qryProdutosPedidos, qryPedidos,
                qryProcuraFornecedores, FExisteAlteracaoCusto, CadastroPedidos);
end;
```
— cascas finas que delegam para `dtmCalcularCusto.CalcularCusto_`/`CalcularPrecoVenda_`, já documentados por completo no ticket 06. **Não há dois caminhos concorrentes**: é o mesmo padrão "casca fina → motor compartilhado" já visto em `CalcularImpostos`→`CalcularImpostos_` (ticket 07). `CalcularPrecoSugestao`/`CalcularPrecoSugestaoProdutos` não devem ser replicados de forma alguma.

`ValorRatear`/`ValorRatearICMS` (os valores efetivamente passados ao motor de custo, `GetValorRatear`/`GetValorRatearICMS`, `dmcadastropedidos.pas:5359-5386`) são: `ValorRatear = despesasacessorias + acrescimo + seguro` (do cabeçalho do pedido); `ValorRatearICMS = 0` sempre para Pedidos (o rateio de ICMS de frete só se aplica a Nota Fiscal, código correspondente está comentado/desligado aqui).

### `AcionarTelaFormacaoPrecoVenda` — confirmado visualizador read-only (CONFIRMADO, `repositorio/fmFormacaoPrecoVenda.pas`/`.dfm`, `dmFormacaoPrecoVenda.pas`, 106 linhas)

`AcionarTelaFormacaoPrecoVenda_(CodigoNota, NumeroProduto, produto, Origem)` só abre uma consulta parametrizada (`qryFormacaoPrecoVenda`, filtrada por `codigonota`/`numeroproduto`/`produto`/`origem` — Pedidos chama com `origem = 'Pedidos'`) e mostra a tela. **Todos os ~20 campos do formulário são `ReadOnly = True`** no `.dfm` — confirma que é puramente um "quadro demonstrativo" do cálculo já feito: preço unitário, frete, despesas acessórias, II, seguro, acréscimo, desconto, ICMS (base/alíquota/valor), IPI (base/%/valor), MVA/ICMS-ST, PIS (%/valor), COFINS (%/valor), custo total — cada grupo mapeando diretamente para os componentes já documentados nos tickets 06 e 13-16. Não é exclusivo de Pedidos (parâmetro `Origem` genérico) — é o mesmo "raio-X do cálculo" reaproveitável por qualquer módulo que já usa o motor (Notas Fiscais, e potencialmente o próprio Manutenção de Preços).

**NÃO LOCALIZADO**: não foi confirmado neste ticket se o módulo Manutenção de Preços já migrado no Laravel (`modules/estoque/manutencao-precos`) já expõe uma visualização equivalente — não investigado a fundo, fica como verificação para quem for consumir este prompt, mas a fonte de dados (a mesma query `qryFormacaoPrecoVenda`) é compartilhada no Delphi, o que sugere que a versão Laravel, se existir, deveria ser a mesma peça reaproveitada aqui.

### Decisão

Especificar Formação de Preço de Venda como: (1) o Pedido delega inteiramente ao motor de custo/preço já especificado no ticket 06 (`CalcularCusto_`/`CalcularPrecoVenda_`) — não reimplementar `CalcularPrecoSugestao` (morto); (2) uma visualização read-only opcional do detalhamento do cálculo (preço/custo/impostos por item), parametrizável por origem, reaproveitando os mesmos dados já produzidos pelos tickets 06/13-19 — não uma tela nova com lógica própria; (3) verificar antes de implementar se Manutenção de Preços no Laravel já cobre essa visualização, para não duplicar.
