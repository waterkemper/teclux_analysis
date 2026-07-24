# Inventariar superfície e dependências do Cadastro de Pedidos de Compra

Type: task
Status: resolved
Blocked by:

## Question

Analisando `dmcadastropedidos.pas` (5.662 linhas), `fmcadastropedidos.pas` (1.364 linhas) e os dois satélites essenciais `fmcadastroprodutospedidos_.pas` (edição de item/imposto) e `fmcadastropedidosgrade.pas` (matriz linha/coluna), qual é o inventário completo de subsistemas, e quais dependências externas (compartilhadas com outros módulos) precisam ser investigadas antes de especificar cada fatia do zero?

## Answer

### Escala (CONFIRMADO)

| Arquivo | Linhas | Procs/Functions |
|---|---|---|
| `dmcadastropedidos.pas` | 5.662 | 155 |
| `dmcadastropedidos.dfm` | 7.418 | — |
| `fmcadastropedidos.pas` | 1.364 | 58 |
| `fmcadastropedidos.dfm` | 5.006 | — |
| `fmcadastroprodutospedidos_.pas` | ~44K (bytes) | 39 |
| `fmcadastroprodutospedidos_.dfm` | ~125K (bytes) | — |
| `fmcadastropedidosgrade.pas` | 258 | 6 |
| `fmcadastropedidosgrade.dfm` | 179 | — |

`fmcadastroprodutospedidos_` é maior em bytes que o próprio formulário principal — é onde a edição de imposto/preço por linha de item acontece.

### ~12 subsistemas identificados (CONFIRMADO, por assinatura de procedure/function)

1. **Cabeçalho do Pedido** — CRUD (`IncluirPedido`, `GravarPedido`, `ExcluirPedido`, `AbrirPedido`), fornecedor/filiais (fatura/entrega/cobrança)/transporte, situação (`GetSituacaoPedidos`, `AtualizarSituacaoPedido`, `GetPedidoCancelado`, `GetPedidoReadOnly`, `PodeExcluirAlterarPedido`), lookups de validação (`ExisteFornecedor`, `ExisteFilial`, `ExisteEstado`, `ExisteProduto`, `ExistePedido`, `ExisteFornecedorTransporte`).
2. **Previsões de Pedido** (agenda de entrega/percentuais) — `CalcularPrevisoes`, `ReCalcularPrevisoes`, `GravarPrevisaoPedido`, `IncluirPrevisaoPedido`, `ExcluirPrevisaoPedido`, `SomaPercentualPrevisao`, `dsrPrevisoesPedidosDataChange`. Aberta via satélite de UI `fmcadastroprevisoespedidos` (fora de escopo como arquivo, mas a lógica de dados está no núcleo, em escopo).
3. **Itens do Pedido (produtos)** — CRUD (`GravarProdutoPedido`, `IncluirProdutoPedido`, `ExcluirProdutoPedido`), eventos de dataset (`dsrProdutosPedidosDataChange`, `qryProdutosPedidos*`), troca de produto (`qryProdutosPedidosprodutoChange`), validação de fornecedor (`VerificarProdutosFornecedor`), produtos similares/substitutos (`RefazConsultaProdutosSimilares`).
4. **Motor de Custo** — `CalcularCusto`, `RatearFrete`, `RatearDesconto`, `GetValorRatear`, `GetValorRatearICMS`, `CalcularAcrescimoDesconto`. Delega parte do cálculo a `TdtmCalcularCusto` (data module externo, `getdtmCalcularCusto`, `dmcadastropedidos.pas:5459`) — **dependência compartilhada a investigar antes de reespecificar**.
5. **Motor de Impostos por item** — `CalcularImpostos` (com parâmetro `msgDifAliquotaICMS` — aviso de divergência de alíquota), CSOSN/CST (`CondicaoCSOSN`, seletor em `fmcadastroprodutospedidos_`), Natureza/CFOP (`CondicoesdaConsultaNaturezasCFOP_NF`), botões "Gerar Total" por imposto (IPI/ICMS/ICMS-ST/PIS/COFINS) em `fmcadastroprodutospedidos_.pas`. Núcleo do que precisa servir de base à emissão de NF-e futura.
6. **Formação de Preço de Venda** — `CalcularPrecoVenda`, `CalcularPrecoSugestao`, `CalcularPrecoSugestaoProdutos`, `AtribuirPreco`, `IncluirPrecosNaoCadastrados`, `MarcarDesmarcarAtualizarPrecodeVenda`, `AtribuirDadosCalculosImpostos_`. Botão dedicado `sbnAcionarTelaFormacaoPrecoVenda` (`fmcadastropedidos.pas:1213-1224`) abre `AcionarTelaFormacaoPrecoVenda` — unit `fmFormacaoPrecoVenda`, **compartilhada fora do módulo** — investigar se é só visualização (read-only) do resultado já calculado, antes de especificar como novo.
7. **Grade (matriz linha/coluna)** — `GerarTabelaGrade`, `dsrGradeDataChange`, `PosicionarLinhaColunanoProduto(Pedido)(Copia)`, `GetColunadaGrade`/`GetLinhadaGrade`, divergência por célula (`GetGradePrecoDiferene`/`DescontoDiferente`/`IcmsDiferente`/`IPIDiferente` — destaque vermelho em `fmcadastropedidosgrade.pas:104-147`), `EditarGrade`, `UtilizandoGrade`, troca linha↔coluna (`sbnTrocarLInhaColunaClick`).
8. **Cópia de Produtos (interna, ligada à grade)** — `CopiarProdutosPedidos`, `GravarCopiaProdutosPedidos`, `IncluirProdutosPedidoCopia`, `SelecionarProdutosPedidoCopiar`, `AlterarPrecoProdutosPedidoCopiar`, `HaProdutoContratoCopiarSelecionado`, `TabelaCopiaProdutoPedido`. **DÚVIDA a resolver no ticket 10**: se é o mesmo mecanismo do satélite autônomo `fmcopiarprodutospedidos` (fora de escopo) ou um mecanismo distinto exclusivo da grade.
9. **Documentos a Pagar** — `GerarDocumentosPag`, `AlterarDocumentosPag`, `ExcluirDocumentosPag` — integração com Contas a Pagar a partir do Pedido gravado.
10. **Envio de Pedido** — `sbnEnviarPedidoClick` (`fmcadastropedidos.pas:640`) — não investigado a fundo neste ticket; propósito exato (e-mail? EDI? só mudança de situação?) fica para o ticket 12.
11. **Importação Daico** — `ImportarArquivoDaico` (`dmcadastropedidos.pas:4821-4931`, ~110 linhas) — importação de arquivo de fornecedor em formato proprietário/EDI.
12. **Relatório e Exportação** — `ImprimirRelatorio`/`frpRelatorioPedidos*` (FastReport), `GravarExcel` (`dmcadastropedidos.pas:4569-4681`, ~113 linhas).

### Dependências compartilhadas a investigar (NÃO LOCALIZADO neste ticket, sinalizado para os tickets seguintes)

- `TdtmCalcularCusto` (motor de custo externo) — pode ser o mesmo motor de precedência já confirmado em Consulta de Compras (`qryDetalhesCompra`/`DefinirValorProduto`, ticket 10 daquele mapa). Investigar no ticket 06 antes de reespecificar.
- `fmFormacaoPrecoVenda`/`AcionarTelaFormacaoPrecoVenda` (visualizador de formação de preço) — compartilhado fora do módulo. Investigar no ticket 08.
- Produtos Similares (`RefazConsultaProdutosSimilares`) pode reaproveitar a mesma noção de `produtos_similares` já confirmada em Consulta de Compras (ticket 08 daquele mapa).

### Decisão

Os 12 subsistemas acima definem a base dos tickets 02–12 deste mapa. O motor de impostos (subsistema 5) é o de maior incerteza — provável candidato a se desdobrar em mais de um ticket uma vez aberto.
