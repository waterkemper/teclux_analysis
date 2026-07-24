# Definir o cabeçalho do Pedido de Compra

Type: grilling
Status: resolved
Blocked by:

## Question

Qual o contrato completo do cabeçalho do Pedido (`IncluirPedido`, `GravarPedido`, `ExcluirPedido`, `AbrirPedido`, `dmcadastropedidos.pas:2006-2227`)? Campos (fornecedor, filiais de fatura/entrega/cobrança, transporte, datas, observações), regras de bloqueio (`PodeExcluirAlterarPedido`, `GetPedidoReadOnly`, `GetPedidoCancelado`, `dmcadastropedidos.pas:2513,1986,5055`), máquina de situação (`GetSituacaoPedidos`/`AtualizarSituacaoPedido`, `dmcadastropedidos.pas:2658-2789,5538-5584`), e como o contrato de entrada de "Gerar Pedido de Compra" (já fechado em `modules/estoque/consulta-compras/03-speckit-prompt.md`) popula esse cabeçalho pela primeira vez?

## Answer

### Ciclo de vida: Incluir → Gravar (CONFIRMADO, `dmcadastropedidos.pas:2006-2225`)

- **Incluir** (`IncluirPedido`): destrava campos, `qryPedidos.Append`, `emissao`/`database` = data do servidor, `situacao := 'A'` (Aberto). Durante o `Append` a flag `CalculodeImpostosBloqueado` fica `true` para não disparar o motor de impostos num registro ainda vazio.
- **Gravar** (`GravarPedido`) — 4 validações obrigatórias, nesta ordem, cada uma com mensagem própria e abortando se falhar:
  1. Deve ter pelo menos 1 item (`qryProdutosPedidos.recordcount <> 0`) — senão `ctERRORPEDIDOVAZIO`.
  2. Deve ter pelo menos 1 previsão de entrega (`qryPrevisoesPedidos.recordcount <> 0`) — senão `ctERRORPREVISAOVAZIO`.
  3. A soma dos percentuais de previsão deve ser **exatamente 100** — senão `ctERRORPERCENTUALPREVISAOPEDIDOINCOMPLETO` (ver ticket 04).
  4. O total das previsões deve bater com o valor calculado da nota (`FTotalPrevisao = qryPedidosValorNotaCalculada`) — senão `ctERRORTOTALPREVISAOPEDIDO`.
  - Se passou: no insert, obtém o próximo número via `spcPedidosProximo` (stored procedure/sequence); reatribui a FK `pedido` em itens/previsões que ainda estavam com número 0 (caso tenham sido inseridos antes do número existir); gera/altera Documentos a Pagar (`GerarDocumentosPag` no insert, `AlterarDocumentosPag` na edição — **acontece dentro do próprio `GravarPedido`, não é um passo separado**); chama `IncluirPrecosNaoCadastrados`; e persiste **tudo numa única transação** (`Perpetrar`) que inclui não só as tabelas do próprio módulo (`qryPedidos`, `qryPrevisoesPedidos`, `qryProdutosPedidos`, `qryFornecedorProduto`, `qryDocumentosPag`, `qryDuplicatas`) mas também **as queries do motor de custo externo** (`dtmCalcularCusto.qryprecos`, `.qrycolunasprecos`, `.qryprodutosalteracao`) — confirma que `dmCalcularCusto` não é só leitura: ele também escreve, na mesma transação do pedido.

### Máquina de situação (CONFIRMADO)

Valores de `situacao` no cabeçalho: `A` (Aberto), `P` (Parcial), `C` (Cancelado), `Q` (Parcial Liquidado — cancelado depois de já ter recebido parte). No item: `A` (Aberto), `L` (Liquidado/recebido) — a transição de item `A`→`L` acontece em outro módulo (recebimento de mercadoria / Nota de Entrada, fora de escopo aqui), não dentro deste dm.

`AtualizarSituacaoPedido` (`dmcadastropedidos.pas:5538-5584`) recalcula a situação do cabeçalho a partir da situação agregada de todos os itens:
- algum item `A` **e** algum `L` (ou já existe item `P`) → cabeçalho `P` "PARCIAL";
- só `A` → cabeçalho `A` "ABERTO";
- só `L` → cabeçalho `A` com descrição "CONCLUÍDO" — **POSSÍVEL BUG LEGADO**: o código da situação continua `'A'` (Aberto) mesmo quando 100% dos itens já foram recebidos; só a descrição muda para "CONCLUÍDO". Qualquer lógica que compare `situacao = 'A'` para decidir "ainda pode editar" ficaria incorretamente permissiva num pedido já concluído — vale corrigir no Laravel (usar um código de situação próprio para concluído), não replicar o bug.

`ExcluirPedido` (`dmcadastropedidos.pas:1708-1777`) ramifica pela situação atual:
- `L` → bloqueado, não pode excluir nem cancelar (`ctPEDIDONAOPODEXCLUIR`).
- `C` ou `Q` → já cancelado, bloqueado.
- `P` (parcial) → só oferece "Cancelar" (confirma → `CancelarPedido`, que rebaixa para `Q` "Parcial Liquidado" porque já havia recebimento parcial).
- `A` (aberto, nada recebido) → pergunta Sim/Não/Cancelar: **Sim = exclusão física** (`qryPedidos.Delete` + `ExcluirDocumentosPag`), **Não = cancelamento lógico** (situação → `C`).

`PodeExcluirAlterarPedido` (`dmcadastropedidos.pas:2513-2519`) = **verdadeiro somente se** a quantidade já entregue for zero (`qryPedidoEntregue`) **e** a situação não for `C`.

### Como "Gerar Pedido de Compra" popula o cabeçalho pela primeira vez (CONFIRMADO, `fmconsultacompras.pas:1164-1290`)

Confirma, sem nenhuma divergência, o contrato já fechado em `modules/estoque/consulta-compras/03-speckit-prompt.md`:

- **Reaproveita uma única instância** de `frmCadastroPedidos` (padrão singleton) — se já está aberto, só traz para frente e cancela qualquer edição pendente antes de reabrir; não cria uma janela nova a cada clique. **Relevante para a UX no Laravel**: se o usuário já tem um Pedido em edição na tela e volta à Consulta de Compras para gerar outro, o comportamento correto é continuar/substituir a mesma "sessão" de pedido, não empilhar rascunhos.
- Filial de fatura: se só uma filial estiver marcada nos parâmetros, usa ela; senão usa a filial base do usuário — confirma item 4 de `03-speckit-prompt.md`.
- Fornecedor: do campo opcional de fornecedor da tela de parâmetros — confirma.
- Por cada linha selecionada com `sugestao ≠ 0`: inclui o item, preço = `DefinirValorProduto` (precedência `precocomicms → valorultimacompra → customedio`, **idêntica** à já confirmada no ticket 10 de Consulta de Compras) e quantidade = o campo escolhido no modal (sugestão/mínimo/máximo) — confirma itens 6-7 de `03-speckit-prompt.md`.
- **Filtro de linhas incluídas usa sempre `sugestao ≠ 0`**, mesmo quando o campo de quantidade escolhido é outro — confirma a DIVERGENTE já registrada no item 5 de `03-speckit-prompt.md`. Nenhuma correção necessária, já documentada e decidida.
- Impostos são calculados **uma vez, no final do lote** (`CalcularImpostos(true, true)`, com os dois avisos habilitados), não item a item durante a inserção (a flag `CalculodeImpostosBloqueado` suprime o cálculo por item durante o loop, por performance).

### Decisão

Nenhuma revisão do contrato de entrada é necessária — está confirmado consistente com o que já foi fechado. O cabeçalho do pedido deve replicar: as 4 validações de `GravarPedido` na mesma ordem, a máquina de situação com os 6 valores (A/P/C/Q no cabeçalho, A/L no item) **corrigindo** o bug do código 'A' reutilizado para "Concluído", e o comportamento singleton de reabertura da tela a partir da Consulta de Compras.
