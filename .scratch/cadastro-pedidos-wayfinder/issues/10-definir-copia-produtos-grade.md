# Definir Cópia de Produtos ligada à grade

Type: grilling
Status: resolved
Blocked by: 05, 09

## Question

O mecanismo de cópia interno (`CopiarProdutosPedidos`, `GravarCopiaProdutosPedidos`, `IncluirProdutosPedidoCopia`, `SelecionarProdutosPedidoCopiar`, `AlterarPrecoProdutosPedidoCopiar`, `HaProdutoContratoCopiarSelecionado`, `TabelaCopiaProdutoPedido`, `dmcadastropedidos.pas:3932-4098,4435-4569`; `sbnCopiarProdutosClick`, `fmcadastropedidos.pas:1020-1033`) é o mesmo mecanismo do satélite autônomo `fmcopiarprodutospedidos.pas` (fora de escopo deste mapa), ou um mecanismo **distinto**, exclusivo do fluxo de grade (copiar seleção de células da matriz para linhas reais de item)? Resolver essa dúvida primeiro (comparando as duas units) e então documentar o contrato de cópia que está de fato em escopo aqui.

## Answer

### Dúvida resolvida — são dois mecanismos genuinamente distintos (CONFIRMADO, comparando `dmcadastropedidos.pas` e `fmcopiarprodutospedidos.pas`)

**Correção ao inventário do ticket 01**: os nomes `SelecionarProdutosPedidoCopiar`, `AlterarPrecoProdutosPedidoCopiar` e `HaProdutoContratoCopiarSelecionado` foram listados ali como parte do "subsistema de cópia ligado à grade" — **isso estava errado**. Comparando com `fmcopiarprodutospedidos.pas` (`:100-206`), esses três métodos são chamados **exclusivamente** por esse satélite autônomo (`TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.SelecionarProdutosPedidoCopiar(...)` etc.), junto com uma infraestrutura de dados **totalmente separada**: `dsrPedidosCopia`/`dsrProdutosPedidosCopia`/`qryPedidosCopia` (não `qryCopiaProdutosPedidos`). Esse satélite é uma tela de busca que abre **outro Pedido já existente** (`ConsultaPedido.InternoPesquisar`/`AbrirPedidos`→`AbrirPedido`) e permite ao usuário selecionar itens dele para copiar para o pedido atual — um recurso de "repetir um pedido anterior", com grade de seleção (destaque bege `clInfoBk` nas linhas marcadas, mesmo padrão visual já visto em Consulta de Compras) e opção de usar o preço original ou o preço sugerido atual. **Este mecanismo já está corretamente marcado como fora de escopo** (satélite `fmcopiarprodutospedidos`, decisão do mapa) — mover formalmente `SelecionarProdutosPedidoCopiar`/`AlterarPrecoProdutosPedidoCopiar`/`HaProdutoContratoCopiarSelecionado` para essa exclusão, corrigindo o ticket 01.

**O que de fato está em escopo, ligado à grade** (`qryCopiaProdutosPedidos`, `CopiarProdutosPedidos`/`GravarCopiaProdutosPedidos`, `dmcadastropedidos.pas:3976-4085`): já documentado em essência no ticket 09 — são os dois "bookends" do fluxo de grade, não um subsistema à parte:

- **`CopiarProdutosPedidos`** (carregar): ao abrir a grade para uma característica, copia **os próprios itens já existentes do pedido atual** (filtrados pela mesma característica) para a tabela de staging `qryCopiaProdutosPedidos` — clona todos os campos. É o "carregar dados na grade", chamado a partir de `GerarTabelaGrade` (ticket 09) quando `qryCopiaProdutosPedidos` ainda não está ativa.
- **`GravarCopiaProdutosPedidos`** (confirmar): ao fechar/salvar a grade (`TfrmCadastroPedidosGrade.InternoGravar`, ticket 01), percorre a tabela de staging e sincroniza de volta em `qryProdutosPedidos` — para cada linha de staging: se o produto já existe como item real e os valores mudaram, atualiza (`GravarProdutoPedido`); se a quantidade zerou, **exclui** o item; se o produto não existia como item real e a quantidade é diferente de zero, **inclui** um novo item. Ou seja, a grade funciona como uma "área de rascunho" — nada é gravado no pedido real até o usuário fechar a grade com sucesso.

### Decisão

Não é necessário nenhum ticket/spec adicional para "cópia ligada à grade" além do que os tickets 09 (mecânica da grade) e este (o carregar/confirmar) já cobrem — a funcionalidade de fato reaproveitável é só esse par carregar/sincronizar, tratado como parte integrante da especificação da Grade. `SelecionarProdutosPedidoCopiar`/`AlterarPrecoProdutosPedidoCopiar`/`HaProdutoContratoCopiarSelecionado` saem do escopo deste mapa, formalmente movidos para a exclusão já existente de `fmcopiarprodutospedidos` (ver seção "Out of scope" do mapa).
