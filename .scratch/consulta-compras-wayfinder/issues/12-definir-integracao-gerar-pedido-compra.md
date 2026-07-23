# Definir o contrato de integração de Gerar Pedido de Compra

Type: grilling
Status: resolved
Blocked by: 02, 07

## Question

O botão "Pedido F10" (`sbngerarPedidoClick`) abre o Cadastro de Pedidos de Compra completo (`TfrmCadastroPedidos`/`TdtmCadastroPedidos`, fora de escopo deste mapa) e pré-popula os itens selecionados na sugestão. Qual é o contrato de integração exato — quais campos são enviados (produto, quantidade conforme `NomeCampoQuantidade`: sugestão/sugestão mínimo/sugestão máximo, escolhida via `TFrmselecionarquantidades`), o valor pré-populado (ordem de precedência do ticket 10), o fornecedor (opcional, via `fraConsultaFornecedor`) e a filial de fatura — sem especificar o Cadastro de Pedidos em si?

## Answer

### Fluxo completo confirmado (`fmconsultacompras.pas:1164-1290`)

1. **Guarda**: exige ao menos um produto selecionado (`VerificarSelecionados`); senão bloqueia com aviso.
2. **Fornecedor é opcional**: `ComFornecedor` = se `fraConsultaFornecedor.edfCodigo` está preenchido. Se vazio, o Cadastro de Pedidos abre com fornecedor em aberto (`PermitirAlterarFornecedor := True` por item) e o foco final vai para o campo de fornecedor; se preenchido, o foco final vai para a filial de fatura.
3. **Escolha da quantidade**: modal `TFrmselecionarquantidades` pede ao usuário qual campo usar como quantidade — `sugestao` (índice 0), `sugestaominimo` (1) ou `sugestaomaximo` (2), via `NomeCampoQuantidade`. Se o usuário cancelar o modal, a geração não deveria prosseguir (comportamento de cancelamento não tratado explicitamente no código-fonte — **DÚVIDA/POSSÍVEL BUG LEGADO**: `Campo` não é reinicializado se `ShowModal <> mrOk`, então o Delphi pode prosseguir com o valor de uma seleção anterior; o Laravel deve tratar isso explicitamente, cancelando a geração se nenhuma quantidade for confirmada).
4. **Filial de fatura**: se só uma Filial estiver marcada nos parâmetros (`SomenteUmaFilialMarcada`), usa essa; senão usa `FilialBase` (a filial do usuário logado).
5. **Filtro de linhas incluídas**: só produtos com `selecionado = true` **E** `sugestao <> 0` (o campo bruto de sugestão, não o campo de quantidade escolhido no passo 3) entram no pedido — **DIVERGENTE/nuance a preservar**: se o usuário escolher enviar `sugestaominimo` como quantidade, um produto com `sugestao = 0` mas `sugestaominimo > 0` ainda assim fica **de fora** do pedido, porque o filtro de inclusão sempre olha `sugestao`, não o campo escolhido.
6. **Valor unitário pré-populado**: `DefinirValorProduto` — a precedência já confirmada no ticket 10 (`precocomicms` → `valorultimacompra` → `customedio`), lida de `qryDetalhesCompra`.
7. **Quantidade enviada**: o valor do campo escolhido no passo 3 (`sugestao`/`sugestaominimo`/`sugestaomaximo`), lido de `qryComprasTotal` para cada linha incluída.
8. Todas as linhas são inseridas em lote com cálculo de impostos bloqueado durante a inserção, recalculado uma única vez ao final (`CalculodeImpostosBloqueado`/`CalcularImpostos(true,true)`) — evita recalcular impostos linha a linha.

### Contrato de integração (sem especificar o Cadastro de Pedidos em si)

O que a Consulta de Compras precisa fornecer ao iniciar um novo Pedido de Compra:
- Filial de fatura (uma Filial resolvida conforme o passo 4).
- Fornecedor (opcional — código, se pré-selecionado).
- Lista de itens: `{ produto, quantidade (do campo escolhido), valor unitário (precedência do ticket 10) }`, restrita às linhas selecionadas com `sugestao <> 0`.

### Decisão

Fluxo replicado como está, incluindo a nuance divergente do passo 5 (filtro por `sugestao`, não pelo campo escolhido). O caso de cancelamento do modal de quantidade (passo 3) fica registrado como DÚVIDA a esclarecer explicitamente na spec (o Laravel deve cancelar a geração, não prosseguir com estado indefinido).
