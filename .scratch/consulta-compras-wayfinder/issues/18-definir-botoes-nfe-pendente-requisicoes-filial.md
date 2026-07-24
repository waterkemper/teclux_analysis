# Definir os botões "Notas Pendentes" e "Requisições" (grid de Produtos das Filiais)

Type: grilling
Status: resolved
Blocked by:

## Question

Ao lado do grid de Produtos das Filiais/Grupos de Filiais existem dois botões não detalhados nos tickets anteriores: um para verificar notas fiscais pendentes (`sbnNFePendente`) e outro para verificar requisições entre filiais da filial selecionada (`sbnRequisicoes`). O que cada um faz, qual modal abre, quais colunas e qual SQL — e como isso se compara ao que já existe no checkout Laravel atual?

## Answer

### Botão "Notas Pendentes" (`sbnNFePendenteClick`, `fmconsultacompras.pas:2418-2427`) — CONFIRMADO

Não abre um modal próprio da tela — aciona um formulário **registrado/singleton** do sistema (`TfrmPrincipalBasico.MostrarFormRegistrado(['Abrir', produto], 'TfrmConsultaProdutosNotasSefaz', True)`), passando o produto ativo. É reaproveitável por qualquer tela que precise dessa consulta (não é exclusivo de Consulta de Compras).

`TfrmConsultaProdutosNotasSefaz` (`repositorio/fmConsultaProdutosNotasSefaz.pas`/`.dfm`) — tela simples com uma única grade (`dbgProdutosPedidosNfePendentes`) sobre `qryProdutosPedidosNfePendentes`, reaberta via `OperacaoPadrao(['Abrir', produto])` com o parâmetro `:produto`.

**SQL confirmado** (`fmConsultaProdutosNotasSefaz.dfm:166-306`): cruza duas fontes —
1. `nsus`/`nsus_prod` — as NF-e's que chegaram eletronicamente via SEFAZ (protocolo NSU/manifestação do destinatário), ainda não processadas;
2. `produtospedidos pp` → `pedidos pe` → `fornecedores f` (nosso Pedido de Compra em aberto para o mesmo produto/fornecedor).

Join: `f.pessoanumero = nsus.cnpjemitente` (CNPJ do fornecedor emissor da NF-e) → `nsus_prod` (mesma cnpj+nsu+tipo) → `produtosfornecedores pf` casado por `nsus_prod.cprod = pf.produtonofornecedor` (código do produto no fornecedor — **o match por `xprod`/`infadprod`/código de barras está comentado/morto no Delphi**, só o código do fornecedor é usado de fato) → `produtos p`.

Filtros: produto = parâmetro; `pe.situacao = 'A'` (só Pedido aberto); `cast(nsus.dhemi as date) >= pe.database` (a NF-e precisa ter sido emitida depois do nosso pedido); `NOT EXISTS` contra `notaspag` (exclui NF-e's já processadas/vinculadas); mais um filtro de cancelamento (`cSitNFe = '3'` excluído, mais uma dedução de cancelamento correlacionado via auto-join em `nsus`, não detalhado exaustivamente aqui).

Colunas (DisplayLabel confirmado): Nr Pedido, P.Emissão, Fornec., CHV NFe, Nome Fornecedor, Emissão NFe, Recbto NFe, Produto (nosso), Descrição Produto (nossa), P.Qtde, P.Preço (do nosso pedido), Prod.NFe/Descrição Prod. NFe/UN/Qtde NFe/Vlr Unit. NFe (dados crus da NF-e), NCM, CEAN. **O valor central da tela é comparar o que o fornecedor emitiu na NF-e contra o que consta no nosso Pedido de Compra em aberto para o mesmo produto.**

### Botão "Requisições" (`sbnRequisicoesClick`, `fmconsultacompras.pas:1814-1821`) — CONFIRMADO

Chama `dtmConsultaCompras.abrirListaPedidosFiliais` (`dmconsultacompras.pas:3802-3816`) — reabre duas queries (`qryListaPedidosFiliais_Requisitante`/`_Requisitado`), passando `filial` (da linha selecionada no grid de Produtos das Filiais/Grupos de Filiais) e `produto` (produto ativo) — depois abre `TfrmListadePedidos` (`fmListadePedidos.pas`/`.dfm`) como modal.

**Achado — DÚVIDA/POSSÍVEL BUG LEGADO**: o filtro por filial está **comentado** em ambas as queries (`dmconsultacompras.dfm:13478,13590` — `/* and pf.requisitante = :filialRequisitante*/` e `/* and pf.requisitada = :filialrequisitada*/`). Na prática, **as duas listas mostram todas as requisições (`pedidosfiliais`) do produto, em qualquer filial** — só a ordenação muda (`order by pf.requisitada` na primeira, `order by pf.requisitante` na segunda). O parâmetro é recebido mas nunca usado no WHERE. Não é possível confirmar se isso é intencional (mostrar o panorama completo do produto) ou um bug de uma correção anterior que comentou o filtro e não removeu — **decisão do usuário necessária** antes de especificar o comportamento Laravel: replicar tal como está (sem filtro por filial) ou corrigir para filtrar pela filial selecionada.

**Estrutura do modal** (`TfrmListadePedidos`): dois painéis lado a lado com grades sincronizadas (`syncgrid`, rolagem em conjunto) — "Requisitante" e "Requisitado" — cada uma com rodapé de soma (`FloatingFooter`) nas colunas `qtdepedida`/`qtderecebida`. Colunas de ambas as queries (idênticas, `dmconsultacompras.dfm:13498-13561`): Nr° Pedido (codigo), Data/Hora, Requisitante, Requisitada, Pedida (qtdepedida), Recebida (qtderecebida), Sit. (situacao — valores confirmados aqui: `'A'` e `'F'`, além do `'Q'`/`'C'` já vistos no ticket 11 — **`'F'` não estava documentado antes**, provavelmente "Finalizado/Fechado"), Observação, Nr Lote (lotetransferencia), Usuário (subquery em `pedidosfiliais_log` pegando quem fez o INSERT original — trilha de auditoria).

Cada painel tem um botão **Cancelar** (`sbnCancelaFilialRequisitanteClick`/`sbnCancelaFilialRequisitadaClick`) — habilitado só quando a linha selecionada envolve a filial do usuário logado (`FilialRequisitante`) E `situacao = 'A'`. Delega para `CancelarPedidoFilialRequisitante`/`_Requisitada` (`dmconsultacompras.pas:4507-4554`), que por sua vez aciona um módulo compartilhado (`TdtmRequisicaoExposicao.ExcluirPedidosTransferencia`, `apps/interlojas/dmrequisicaoexposicao.pas:191-236` — o mesmo módulo usado pela tela de Requisição de Exposição entre lojas) e, ao concluir, reabre a lista e recalcula a sugestão do produto (`Reatualizar`).

### Detalhamento do cancelamento — estoque e autorização (CONFIRMADO, `dmrequisicaoexposicao.pas:191-236,576-579,634-721`, verificação sob demanda do usuário)

**Reversão de estoque — SIM, acontece**: `ExcluirPedidosTransferencia` bloqueia contra requisição já entregue (`Entregue` = `situacao <> 'A'`, mensagem `ctREQUISICAONAOPODEEXCLUIR`); se `ParSistema.RequisicaoSubtraiEstoque` estava ativo (o mesmo parâmetro do ticket 11 que faz a requisição debitar estoque imediatamente via movimento `'TEP'` na criação), o cancelamento chama `ReservaPreviaProduto(Cancelando=True)` (`:634-721`, ramo `if Cancelando`), que: bloqueia o estoque (`BloquearEstoque`, mesmo padrão pessimista `FOR UPDATE` do ticket 05), cria um **movimento reverso** `tipomovimento = 'TPE'` (referência `'EXCLUSAO REQUISICAO ' + código`) creditando de volta a **quantidade pedida inteira**, e ainda trata um caso especial: se parte do estoque já estava reservado para venda futura (`qryEstoqueBloqueiofuturo <> 0`), gera um segundo movimento movendo a parte correspondente para reserva em vez de estoque livre. Tudo gravado atomicamente junto com a mudança de `situacao` para `'C'` (`Perpetrar([qryPedidosFiliais, qryMovimentos])`).

**Autorização por usuário/senha — NÃO encontrada**: a confirmação antes de cancelar é `MensagemSimNaoopcaocancelamotivo` (`:201-202`) — um diálogo Sim/Não que **opcionalmente pede o motivo do cancelamento** (obrigatório ou não conforme `ParSistema.InformarMotivoCancelamentoPedido`), não uma reautenticação com usuário/senha. Não foi encontrado nenhum gate de senha/supervisor nesse fluxo específico de cancelamento — diferente de outras ações sensíveis do sistema que às vezes têm essa trava. Não descarta a possibilidade de uma interceptação genérica de permissão por módulo (`acessosmodulos`, já citado como infraestrutura padrão não detalhada no ticket 02), mas não há prompt de senha explícito no código deste cancelamento.

### Comparação com o Laravel atual (CONFIRMADO por leitura do checkout)

**"Notas Pendentes" — parcialmente implementado, com uma lacuna real e uma melhoria real**:
- `ConsultaComprasBreakdownService::nfePendentes()` → `LegacyConsultaEstoquesDetalheRepository::listNfeEntradaPendentes()` (`:296-390`) já existe e funciona.
- **Melhoria em relação ao Delphi**: o match usa `produtosfornecedores` (código/descrição/infadprod) **OU** `produtoscodigobarras` (EAN/EAN tributável) — o caminho por código de barras está **ativo** no Laravel, enquanto no Delphi está comentado/morto. Manter assim (é estritamente melhor, não uma regressão).
- **Lacuna real**: a query Laravel **não faz o join com `pedidos`/`produtospedidos`** — mostra só o lado da NF-e (filial, fornecedor, série/número, situação, emissão, tipo, chave, descrição do produto na NF-e), sem as colunas do nosso Pedido de Compra em aberto (Nr Pedido, P.Emissão, P.Qtde, P.Preço) que eram o ponto central da tela Delphi: comparar o que chegou contra o que foi pedido. Hoje o usuário Laravel só vê "há uma NF-e pendente", não "ela bate com o pedido X que fiz".
- Filtro de cancelamento simplificado (`csitnfe = '1'`) comparado à lógica de dedução por auto-join do Delphi — funcionalmente pode ser equivalente ou pode divergir em casos de NF-e cancelada-e-substituída; não confirmado, fica como dúvida menor.

**"Requisições" — não implementado**: nenhuma rota, serviço, componente ou coluna correspondente encontrada no checkout Laravel (`grep` por `pedidosfiliais`/`ListaPedidosFiliais`/`requisicoes_filial` só retorna o uso de `pedidosfiliais` como insumo agregado da fórmula de sugestão, `ConsultaComprasSugestaoService.php`/`ConsultaComprasBreakdownService.php` — não uma tela de listagem/cancelamento). Gap completo: nem a visualização (duas listas Requisitante/Requisitado) nem a ação de cancelar existem hoje.

### Decisão

Ambos os botões viram um novo prompt de correção/adição (`09`, mesma série de `04-08`): (A) completar "Notas Pendentes" adicionando o cross-reference com o Pedido de Compra em aberto (Nr Pedido/Emissão/Qtde/Preço), preservando a melhoria do match por código de barras já existente; (B) implementar "Requisições" do zero — listagem Requisitante/Requisitado lado a lado com soma de quantidade pedida/recebida, e ação de cancelar restrita a requisições `situacao = 'A'` envolvendo a filial do usuário — levando ao usuário, como pergunta explícita a resolver na implementação, se o filtro por filial (hoje desabilitado no Delphi) deve ser replicado tal como está (mostra tudo) ou corrigido (filtra pela filial selecionada).
