# Definir Previsões de Pedido

Type: grilling
Status: resolved
Blocked by: 03

## Question

Como funciona a agenda de Previsões do Pedido (`CalcularPrevisoes`, `ReCalcularPrevisoes`, `GravarPrevisaoPedido`, `IncluirPrevisaoPedido`, `ExcluirPrevisaoPedido`, `SomaPercentualPrevisao`, `dmcadastropedidos.pas:1438-1531,2106-2260,2630-2789`)? É uma divisão do pedido em datas/percentuais de entrega esperada — qual a regra de soma de percentuais, o que acontece se não fechar 100%, e o satélite de UI `fmcadastroprevisoespedidos` (fora de escopo como arquivo) só renderiza essa lógica ou tem alguma regra própria não capturada no núcleo?

## Answer

### Modelo de dados (CONFIRMADO)

Cada previsão tem: `dias` (deslocamento em dias a partir de `qryPedidos.database`), `data` (derivada: `database + dias`), `percentual` (% do valor total do pedido) e `valor` (derivado do percentual sobre `qryPedidosValorNotaCalculada`). É literalmente um parcelamento da entrega esperada por data, não um cronograma de pagamento (isso é `Documentos a Pagar`, ticket 11, entidade separada).

### Cálculo e rateio de arredondamento (CONFIRMADO, `CalcularPrevisoes`, `dmcadastropedidos.pas:1438-1479`)

Ao recalcular todas as previsões: para cada linha (exceto a **primeira**, por número), `valor := round(ValorNotaCalculada × percentual / 100, casas decimais de ParSistema.PrecoUnitarioCasasDecimais)`. A **primeira previsão** (menor `numero`) recebe o **resto**: `valor := ValorNotaCalculada − soma dos valores das demais` — absorvendo toda a diferença de arredondamento numa única parcela em vez de deixar sobra/falta distribuída. Mesmo padrão de rateio de resto já visto no motor de Custo (`RatearFrete`/`RatearDesconto`, ticket 06) — convém reaproveitar a mesma abordagem no Laravel.

### Regra de soma de percentuais (CONFIRMADO, `SomaPercentualPrevisao`, `dmcadastropedidos.pas:2713-2747`)

- Ao **gravar cada previsão individual** (`GravarPrevisaoPedido`): se a soma de todos os percentuais já cadastrados **ultrapassar 100** ao incluir/editar essa linha, a gravação é cancelada com aviso (`ctERRORPERCENTUALPREVISAOPEDIDOCOMPLETO`) — trava em tempo real, não deixa passar de 100% mesmo temporariamente.
- Se a soma bater **exatamente 100**, `SomaPercentualPrevisao` corrige automaticamente qualquer diferença de centavos entre a soma dos valores e o total da nota, jogando a diferença na **primeira previsão** — mesmo padrão de absorção de resto do cálculo acima.
- **Não fechar 100% é permitido durante a edição** (o usuário pode ter, por exemplo, só 60% cadastrado enquanto ainda está montando o pedido) — a trava dura (bloquear salvamento do pedido inteiro) só acontece em `GravarPedido` (ticket 03, validação 3): não fechar 100% impede gravar o **pedido**, não impede gravar uma previsão individual abaixo de 100% acumulado.

### Satélite de UI `fmcadastroprevisoespedidos` (INFERIDO)

Não foi aberto o arquivo (fora do escopo de arquivos deste mapa), mas pela assinatura `AcionaCadastroPrevisoesPedidos(Editar: Boolean): Boolean` (`fmcadastropedidos.pas:303`) e pelo padrão idêntico usado para o satélite de itens (`AcionaCadastroProdutosPedidos`), é consistente com um simples modal de edição de uma linha (dias/percentual) que delega toda a lógica de cálculo/validação ao núcleo (`IncluirPrevisaoPedido`/`GravarPrevisaoPedido` já cobrem tudo) — não há evidência de regra de negócio própria no satélite.

### Decisão

Especificar Previsões como uma lista de parcelas (dias/data/percentual/valor) vinculada ao pedido, com: trava de soma de percentual ≤ 100 por linha, exigência de soma = 100 para gravar o pedido inteiro, e absorção do resto de arredondamento na primeira parcela. Não é necessário investigar o satélite de UI separadamente — a lógica já está inteiramente capturada no núcleo.
