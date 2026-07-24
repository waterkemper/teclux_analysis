/speckit.specify

# Correção — Consulta de Compras: botões "Notas Pendentes" e "Requisições" (grid de Produtos das Filiais)

## Escopo

Ao lado do grid de Produtos das Filiais/Grupos de Filiais existem dois botões, ambos operando sobre a linha/produto selecionado: **Notas Pendentes** (NF-e's recebidas via SEFAZ ainda não processadas) e **Requisições** (requisições entre filiais já existentes para o produto). O primeiro já foi parcialmente migrado para o Laravel; o segundo não existe. Duas correções:

- **A. Notas Pendentes** — completar o cross-reference com o Pedido de Compra em aberto, hoje ausente.
- **B. Requisições** — implementar do zero (listagem Requisitante/Requisitado + cancelamento).

## A. Notas Pendentes

Evidência Delphi (`sbnNFePendenteClick`, `fmconsultacompras.pas:2418-2427`; `repositorio/fmConsultaProdutosNotasSefaz.pas`/`.dfm`): abre uma tela reaproveitável do sistema (não exclusiva desta consulta) que roda uma única query cruzando duas fontes para o produto ativo:

1. `nsus`/`nsus_prod` — NF-e's recebidas eletronicamente via SEFAZ (protocolo NSU), ainda não processadas (`NOT EXISTS` contra `notaspag`), casadas ao nosso fornecedor pelo CNPJ e ao nosso produto via `produtosfornecedores` (código do produto no fornecedor).
2. `produtospedidos` → `pedidos` — o(s) nosso(s) Pedido(s) de Compra **em aberto** (`situacao = 'A'`) para o mesmo produto/fornecedor, emitido(s) antes da NF-e (`nsus.dhemi >= pedido.database`).

Colunas: do nosso pedido (Nr Pedido, P.Emissão, Fornec., P.Qtde, P.Preço) lado a lado com os dados crus da NF-e (CHV NFe, Nome Fornecedor, Emissão/Recebimento NFe, Produto/Descrição na NF-e, NCM, CEAN, UN, Qtde NFe, Vlr Unit. NFe). **O valor central da tela é comparar o que o fornecedor emitiu contra o que consta no nosso pedido em aberto** — não é só uma lista de notas.

Hoje no Laravel (`ConsultaComprasBreakdownService::nfePendentes()` → `LegacyConsultaEstoquesDetalheRepository::listNfeEntradaPendentes()`, `LegacyConsultaEstoquesDetalheRepository.php:296-390`): a busca de NF-e's pendentes já existe e funciona — inclusive com uma melhoria real sobre o Delphi (casa também por código de barras via `produtoscodigobarras`, caminho que no Delphi está comentado/morto — **manter essa melhoria**). Porém **falta inteiramente o cross-reference com o Pedido de Compra**: a query Laravel não faz `JOIN` com `pedidos`/`produtospedidos`, então as colunas Nr Pedido/P.Emissão/P.Qtde/P.Preço não existem no resultado hoje.

Correção proposta:
- Estender `listNfeEntradaPendentes` (ou criar uma consulta companion) para incluir, por NF-e pendente, o(s) Pedido(s) de Compra em aberto do mesmo produto+fornecedor emitidos antes da data da NF-e — mesma lógica de junção do Delphi (`pe.situacao = 'A'` e `nsus.dhemi >= pe.database`).
- Adicionar ao catálogo de colunas da grade (`ConsultaComprasNfePendentesGridCatalog.php`) os campos do pedido: número, emissão, fornecedor, quantidade pedida, preço do pedido.
- Preservar o filtro de cancelamento e o match por produtos-fornecedores + código de barras já implementados — não regredir.

## B. Requisições

Evidência Delphi (`sbnRequisicoesClick`, `fmconsultacompras.pas:1814-1821`; `dtmConsultaCompras.abrirListaPedidosFiliais`, `dmconsultacompras.pas:3802-3816`; `TfrmListadePedidos`, `fmListadePedidos.pas`/`.dfm`; `qryListaPedidosFiliais_Requisitante`/`_Requisitado`, `dmconsultacompras.dfm:13456-13609`; cancelamento em `dmconsultacompras.pas:4507-4554`):

Abre um modal com **duas listas lado a lado, com rolagem sincronizada**: "Requisitante" (requisições onde a filial pede) e "Requisitado" (requisições onde a filial é solicitada), ambas filtradas pelo produto ativo. Colunas: Nr° Pedido, Data/Hora, Requisitante, Requisitada, Pedida (qtdepedida), Recebida (qtderecebida), Situação, Observação, Nr Lote, Usuário (quem criou, via log de auditoria) — com **soma de Pedida/Recebida no rodapé** de cada lista.

Cada lista tem um botão **Cancelar**, habilitado só para linhas com `situacao = 'A'` (Aberto) que envolvem a filial do usuário logado — cancela a requisição (delega para `TdtmRequisicaoExposicao.ExcluirPedidosTransferencia`, `apps/interlojas/dmrequisicaoexposicao.pas:191-236`, o mesmo módulo compartilhado usado pela tela de Requisição de Exposição entre lojas) e recarrega a lista + recalcula a sugestão do produto.

**Detalhamento do cancelamento, confirmado por leitura direta do código** (não é um detalhe secundário — é obrigatório para não deixar saldo de estoque incoerente):

- **Reversão de estoque**: se `ParSistema.RequisicaoSubtraiEstoque` estava ativo quando a requisição foi criada (o mesmo parâmetro do prompt `03` que faz a requisição debitar estoque imediatamente via movimento `'TEP'`), cancelar **cria um movimento reverso** (`tipomovimento = 'TPE'`, referência `'EXCLUSAO REQUISICAO <código>'`) creditando de volta a **quantidade pedida inteira** na filial requisitada, sob bloqueio pessimista — tudo na mesma transação que muda a situação para `'C'`. Há ainda um caso especial: se parte do estoque devolvido já estava reservada para uma venda futura (`qryEstoqueBloqueiofuturo`), um segundo movimento desvia essa parte para reserva em vez de estoque livre.
- **Bloqueio**: requisição já entregue (`situacao <> 'A'`) não pode ser cancelada (mensagem de aviso).
- **Confirmação**: diálogo Sim/Não com captura de motivo do cancelamento — obrigatório ou opcional conforme `ParSistema.InformarMotivoCancelamentoPedido`. **Não há reautenticação por usuário/senha neste fluxo** — verificado diretamente no código, não é uma omissão da investigação. Não adicionar um gate de senha que não existe no comportamento original.

**DÚVIDA a resolver antes de implementar** (achado, não decidido neste prompt): no Delphi, o filtro por filial está **comentado** em ambas as queries — na prática, as duas listas mostram **todas** as requisições do produto em qualquer filial, só a ordenação muda. Não está confirmado se isso é intencional (visão completa do produto) ou um bug de uma correção anterior. **Decisão a tomar com o usuário antes de codar**: replicar sem filtro (mostrar todas as filiais) ou filtrar pela filial da linha selecionada no grid de Produtos das Filiais.

Hoje no Laravel: **não existe nenhuma implementação** — nem rota, nem serviço, nem componente, nem colunas. `pedidosfiliais` só é usado como insumo agregado da fórmula de sugestão (`ConsultaComprasSugestaoService.php`/`ConsultaComprasBreakdownService.php`), não como listagem própria.

Correção proposta:
- Novo endpoint/serviço que retorna as requisições (`pedidosfiliais`) do produto ativo, nas duas orientações (requisitante/requisitado) — com ou sem filtro de filial conforme a decisão acima.
- Novo modal (reaproveitando `ErpPreferenceDataGrid` ou padrão equivalente já usado nas outras telas deste módulo) com duas grades lado a lado (ou duas abas, se lado a lado não couber bem no layout web) e rodapé de soma.
- Ação de cancelar por linha, restrita a `situacao = 'A'` e à filial do usuário logado — endpoint de cancelamento próprio (não é preciso portar o módulo Delphi inteiro, só o comportamento): muda `situacao` para `'C'`, registra o motivo (com a mesma trava opcional/obrigatório do parâmetro), e **se a requisição tinha debitado estoque na criação** (`RequisicaoSubtraiEstoque` ativo), grava um movimento de estoque reverso creditando a quantidade pedida de volta na filial requisitada, na mesma transação — mesmo padrão de escrita atômica já usado na Requisição entre Filiais do prompt `03`. Confirmação simples (Sim/Não + motivo), sem exigir usuário/senha.

## Critérios de aceite

- [ ] "Notas Pendentes" exibe, por NF-e pendente, o(s) Pedido(s) de Compra em aberto do mesmo produto/fornecedor emitidos antes da NF-e (Nr Pedido, Emissão, Fornecedor, Qtde, Preço).
- [ ] O match de "Notas Pendentes" continua funcionando por código de produto do fornecedor **e** por código de barras (não regredir a melhoria já existente).
- [ ] Botão "Requisições" abre uma visualização com as requisições do produto ativo nas duas orientações (requisitante/requisitado), com soma de quantidade pedida/recebida.
- [ ] Cada requisição listada com `situacao = 'A'` envolvendo a filial do usuário logado pode ser cancelada; as demais não.
- [ ] Cancelar uma requisição que havia debitado estoque na criação gera um movimento reverso creditando a quantidade pedida de volta, na mesma transação.
- [ ] Cancelar uma requisição que não debitou estoque na criação (`RequisicaoSubtraiEstoque` inativo) não gera nenhum movimento de estoque.
- [ ] Cancelar exige confirmação e captura de motivo (obrigatório/opcional conforme o parâmetro) — sem exigir usuário/senha.
- [ ] Cancelar uma requisição recarrega a lista e recalcula a sugestão do produto.
- [ ] Decisão sobre o filtro por filial (replicar sem filtro vs. corrigir) tomada explicitamente antes de implementar, não assumida.

## Matriz mínima de testes

| # | Cenário | Resultado esperado |
|---|---|---|
| 1 | Produto com NF-e pendente e Pedido de Compra em aberto correspondente | Linha mostra as duas visões lado a lado (NF-e e Pedido) |
| 2 | Produto com NF-e pendente sem Pedido de Compra em aberto | Linha aparece só com dados da NF-e, colunas do pedido vazias |
| 3 | Produto com match só por código de barras (sem `produtosfornecedores` cadastrado) | NF-e ainda aparece na lista |
| 4 | Produto com requisições em ambas as direções (pediu de uma filial, foi pedido por outra) | As duas listas mostram as linhas corretas, somas batem |
| 5 | Cancelar requisição com `situacao = 'A'` da própria filial, criada com `RequisicaoSubtraiEstoque` ativo | Some da lista; movimento reverso credita a quantidade pedida de volta ao estoque; sugestão do produto recalculada |
| 6 | Cancelar requisição criada com `RequisicaoSubtraiEstoque` inativo | Some da lista; nenhum movimento de estoque é gerado |
| 7 | Tentar cancelar requisição de outra filial ou já finalizada | Ação bloqueada/indisponível |

## Fora de escopo

- Qualquer correção ao motor de sugestão, fórmula ou parâmetros — já cobertos em `01-08`.
- Reimplementar o módulo compartilhado `TdtmRequisicaoExposicao`/"Requisição de Exposição" do Delphi — o cancelamento no Laravel usa o padrão já estabelecido em `03-speckit-prompt.md` para a Requisição entre Filiais, não uma réplica desse módulo.
- Investigar a fundo a lógica de dedução de cancelamento de NF-e por auto-join (`nsus_c`) do Delphi — o filtro simplificado já implementado no Laravel (`csitnfe = '1'`) é mantido, salvo indicação em contrário do usuário.
