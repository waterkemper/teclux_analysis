# Definir o motor de Custo (rateio de frete/desconto)

Type: grilling
Status: resolved
Blocked by: 05

## Question

Qual a fórmula completa do motor de Custo por item (`CalcularCusto`, `RatearFrete`, `RatearDesconto`, `GetValorRatear`, `GetValorRatearICMS`, `CalcularAcrescimoDesconto`, `dmcadastropedidos.pas:1345-1438,5060-5388`)? Crucialmente: `getdtmCalcularCusto`/`TdtmCalcularCusto` (`dmcadastropedidos.pas:5459`) delega a um data module externo — é o mesmo motor de precedência custo já confirmado em Consulta de Compras (`qryDetalhesCompra`/`DefinirValorProduto`, ticket 10 daquele mapa) ou um motor distinto? Se for o mesmo, este ticket deve apontar para reaproveitamento em vez de reespecificar. Esta é a fatia que, junto do ticket 07, forma o "motor de custo/formação de preço/impostos" que sai como especificação própria e reaproveitável (ver Notes do mapa).

## Answer

### `TdtmCalcularCusto` (CONFIRMADO, `apps/estoque/dmCalcularCusto.pas`, 1.020 linhas)

Herda de `TdtmBasico` (o mesmo data module gigante de `CalcularImpostos_`, ticket 07) — ou seja, é uma **subclasse especializada**, não um motor totalmente separado: usa a infraestrutura base de `TdtmBasico` e adiciona 4 métodos públicos de custo/preço. Todos os métodos são parametrizados por `OrigemCalculo: TtecOrigemCalculo` (`NotaEntrada` ou `CadastroPedidos`, mesmo enum já visto no ticket 07), com funções locais auxiliares (`f_FilialBase`, `f_precounitario`, `f_regimetributario`, `f_Preco`, `f_PrecoNormal`) que só trocam o nome do campo lido conforme a origem — confirma novamente que é código genuinamente compartilhado entre os dois módulos, não uma cópia.

**Não é o mesmo motor da precedência já usada em Consulta de Compras** (`qryDetalhesCompra`/`DefinirValorProduto`, ticket 10 daquele mapa) — aquele é uma **leitura read-only** (visualização de precedência preço com ICMS → última compra → custo médio, só para exibir sugestão na consulta). Este (`TdtmCalcularCusto`) é o motor de **escrita**: efetivamente calcula e grava `custototal`/`custoparavenda`/`precovenda`/`precoatribuido` nos itens do documento (Pedido ou Nota de Entrada). São dois motores relacionados mas distintos — não reaproveitar um pelo outro, cada um serve a um momento diferente (consulta informativa vs. gravação transacional).

### `CalcularCusto_` (CONFIRMADO, `dmCalcularCusto.pas:274-486`)

Por item: `PrecoCusto = (preço unitário × quantidade) + IPI (se não ContribIPI) + frete/despesas rateados proporcionalmente ao peso do item no total do documento + ICMS-ST de custo + frete do item − desconto do item`; depois (exceto em importação) **subtrai** ICMS e PIS/COFINS do custo, se o regime tributário aplicável não for Simples Nacional e o produto não estiver em substituição tributária. `custoparavenda` (o valor efetivamente usado para formar preço de venda) = `custototal / quantidade / fatorconversao`, com a opção (`ParSistema.NaorateardescontoparacalculodeprecodevendanaNFE`) de **não** descontar o desconto dessa base.

**2 Parâmetros do Sistema novos, não capturados no ticket 02** (adicionar ao manifesto):
- `RegimeTributarioparaCalculodoCusto` — inteiro; valor `4` = usar o regime tributário real da filial/documento; qualquer outro valor = **força** um regime tributário fixo só para fins de cálculo de custo, independente do regime real do documento. Achado sutil e importante — não é um simples liga/desliga.
- `NaorateardescontoparacalculodeprecodevendanaNFE` — se true, a base de custo-para-venda ignora o desconto do item (soma de volta).
- `Nao_somar_PISCONFINS_no_calculo_do_preco_de_venda` — usado em `CalcularPrecoVenda_`, zera as alíquotas de PIS/COFINS na fórmula de preço de venda quando true (distinto de `RetirarPISCONFINSCalPreco`, que afeta o cálculo de custo, não o de preço de venda).

### `CalcularPrecoVenda_` (CONFIRMADO, `dmCalcularCusto.pas:489-704`) — **DIVERGÊNCIA/POSSÍVEL DUPLICAÇÃO com achado do ticket 01**

Fórmula de markup: precedência `markup_produto_1 → markup_grupo_1 → markup do fornecedor → 0` (3 níveis — mais completa que a versão local vista em `dmcadastropedidos.pas:3323-3449`, `CalcularPrecoSugestao`, que só usava `markupproduto` e não tinha os 3 níveis de precedência). A fórmula de reversão markup→preço (`SugestaoPeloPrecoVenda`) e o arredondamento por múltiplo (`ArredondarPrecoProduto`, com precedência produto→grupo→classe→`ParSistema.MultiploPreco`) são **quase idênticos** ao código local já encontrado em `dmcadastropedidos.pas` no ticket 01/05 (`CalcularPrecoSugestao`/`CalcularPrecoSugestaoProdutos`). **Isso é uma divergência real a resolver no ticket 08**: existem dois caminhos de código para a mesma coisa — a versão compartilhada aqui (mais completa, com precedência de 3 níveis de markup e 3 níveis de múltiplo) e uma versão local em `dmcadastropedidos.pas` (mais simples). Precisa confirmar qual das duas efetivamente executa no fluxo real do Pedido (podem ambas rodar, uma sobrescrevendo a outra?) antes de especificar a fórmula final no ticket 08 — não assumir que a versão local é a autoritativa só porque está no arquivo do módulo.

### `AtribuirPreco` (CONFIRMADO, `dmCalcularCusto.pas:114-258`)

Depois de calcular um preço de venda sugerido para uma característica, varre TODAS as linhas do documento com a mesma característica+custo (ou mesma característica+código de preço) e atualiza o preço atribuído — mas só se o novo valor for **maior** que o já atribuído (`VerificarMaiorPreco=true`, modo "calculado": maior vence) ou incondicionalmente se foi uma edição manual (`VerificarMaiorPreco=false`, modo "digitado"). Controla também se essa sugestão deve **efetivamente atualizar o preço de venda cadastrado do produto** (não só sugerir): via um par de flags `permitiratualizar`/`permitiratualizardigitado`, respeitando `ParSistema.NaoAtualizarPrecoMenorQueAtual` (não baixar um preço já maior) — mesma trava já vista no ticket 02, confirmada aqui como implementada nesta rotina compartilhada, não em Pedidos.

### `IncluirPrecosNaoCadastrados` (CONFIRMADO, `dmCalcularCusto.pas:722-1012`) — onboarding automático de preço para produto novo

Já referenciado em `GravarPedido` (ticket 03) — esta é a implementação completa. Para produtos sem coluna de preço cadastrada ainda: elegibilidade via `ParSistema.GerarPrecoAutomatico` + `ParSistema.LocalCalculoPreco` (mais, especificamente para Nota de Entrada, faixas de CFOP — industrialização/comercialização, energia elétrica, substituição tributária, ou CFOP 551); tenta reaproveitar um código de preço de outra linha do mesmo documento com mesma característica+custo; senão, **cria um novo registro de preço do zero** (`spcPrecos` — sequence — + novo registro em `qryPrecos`/`qryColunasPrecos`). Confirma que produtos comprados pela primeira vez ganham preço de venda automaticamente ao gravar o pedido, sem passo manual em Manutenção de Preços.

### Decisão

`dmCalcularCusto`/`TdtmCalcularCusto` deve ser especificado como serviço de **escrita** (distinto da leitura read-only já usada em Consulta de Compras): 4 operações (calcular custo, calcular preço de venda, atribuir/propagar preço entre linhas relacionadas, auto-cadastrar preço para produto novo), parametrizável por origem (Pedido de Compra ou Nota de Entrada) para viabilizar reaproveitamento futuro por NF-e. A divergência entre esta fórmula de markup (3 níveis) e a versão local em `dmcadastropedidos.pas` fica como pendência explícita para o ticket 08 resolver, não decidida aqui.
