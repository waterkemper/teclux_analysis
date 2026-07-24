# Definir o motor de Impostos — IPI

Type: grilling
Status: resolved
Blocked by: 05

## Question

Dentro de `TdtmBasico.CalcularImpostos_` (`repositorio/dmbasico.pas:20573-26694`), documentar a lógica de IPI: base de cálculo (`IPIBaseCalculo`, `dmbasico.pas:21385-21447`, com parâmetro `ConsiderarBaseFixa`), valor (`ValorIPI`, `:21448-21466`), NCM (`IPINCM`, `:20691-20700`), se ICMS incide sobre IPI (`ICMSSobreIPI`, já listado no ticket 13 — ponto de junção entre as duas famílias), se IPI incide sobre o frete (`NaoCalcularIPISobreFrete`, `:21019-21025`), permissão de alteração manual dos dados de IPI (`PermiteAlterarDadosIPI`, `:20804-20834`), e a flag de digitação manual (`ValorIPIDigitado`, `:22341-22347`). Cruzar com os botões "Gerar Total IPI"/`edtValorIPIKeyDown` já identificados em `fmcadastroprodutospedidos_.pas:444-461` (ticket 01) — qual direção de cálculo cada botão aciona (base×alíquota→valor, ou valor digitado→alíquota implícita)?

## Answer

### Base e valor (CONFIRMADO, `dmbasico.pas:21385-21464`)

`IPIBaseCalculo = quantidade × preço unitário − desconto do item − desconto + (frete, se não NaoCalcularIPISobreFrete) + seguro`, arredondado/truncado a 2 casas — estrutura quase idêntica à base do ICMS (ticket 13), com duas diferenças: (1) o frete só entra se `NaoCalcularIPISobreFrete = false` (flag por documento/parâmetro que pode excluir frete da base do IPI especificamente); (2) não tem o termo de "ICMS sobre IPI/despesas acessórias" (isso é ICMS incidindo sobre IPI, não o inverso). Mesmos bypasses do ICMS: importação/`NotaAcrescimoFinanceiro` usa campo já gravado; reaproveita `produtototal` quando não em edição manual (`not PermiteAlterarDadosIPI`, em vez de `PermiteAlterarDadosICMS`).

`ValorIPI = IPIBaseCalculo × aliquotaipi / 100` — exceto num caso especial: devolução de compra via Nota Avulsa (`OrigemCalculo = NotaAvulsa` + `CondicaoRequerNFEntrada` + `eHNotaFiscalSaidaDevolucao`), que busca o valor de uma tabela de valores retidos de custo em vez de recalcular — **irrelevante para Cadastro de Pedidos** (que nunca é `NotaAvulsa`), mesmo padrão de "bypass específico de devolução" já visto no ICMS-ST (ticket 14).

### Permissão de edição (CONFIRMADO, `PermiteAlterarDadosIPI`, `dmbasico.pas:20804-20833`)

Para entrada (`not saida`, sempre o caso de Pedidos): permitido editar IPI **exceto** se `OrigemCalculo = TransferenciaEntrada` (transferências entre filiais bloqueiam edição de IPI) ou se o item já referencia um documento eletrônico (`numerosequencianfe <> 0`, ou nota do tipo CT-e/NF-e/NFC-e) ou se há uma condição de cancelamento de dado fiscal referenciado. **Para Cadastro de Pedidos especificamente, IPI é editável por padrão** (nenhuma dessas travas se aplica a um pedido novo, que não é transferência nem referencia documento eletrônico ainda) — confirma o achado do ticket 05 de que os campos fiscais do item são editáveis.

### Direção do cálculo — botão "Gerar Total IPI" (INFERIDO, não localizada a implementação exata de `sbnGerarTotalIPIClick`/`edtValorIPIKeyDown` dentro do escopo lido)

Não foi possível confirmar, dentro dos arquivos deste mapa, o corpo exato de `sbnGerarTotalIPIClick`/`edtValorIPIKeyDown` (`fmcadastroprodutospedidos_.pas:444-461`) — são handlers de UI no formulário satélite, não no motor. Pelo padrão consistente do resto do motor (campos com flag "digitado" que, quando setados, fazem o motor **não** recalcular por cima — `ValorIPIDigitado`, `:22341-22347`), a inferência mais provável é: o campo de valor IPI aceita digitação direta (marcando `ValorIPIDigitado`), e o botão "Gerar Total" faz o cálculo padrão base×alíquota→valor, sobrescrevendo o que foi digitado. **DÚVIDA a resolver na implementação**: confirmar essa direção abrindo especificamente `fmcadastroprodutospedidos_.pas` antes de especificar o comportamento exato do botão — o restante da fórmula (base e valor) está confirmado com alta confiança.

### Decisão

Especificar IPI com a mesma estrutura do ICMS normal (base → alíquota → valor, mesmos bypasses de importação/produtototal), incluindo a exclusão opcional do frete da base (`NaoCalcularIPISobreFrete`) e a trava de edição por transferência/documento eletrônico vinculado (não relevante à maioria dos casos de Pedido). Marcar a direção exata do botão "Gerar Total IPI" como DÚVIDA a confirmar na implementação, não uma afirmação categórica.
