# Auditoria — Tela de Resultados da Consulta de Compras (Delphi vs. Laravel)

Escopo: tela pós-"Gerar F6" (aba "Consulta" no Delphi / aba "Resultados" no Laravel). Não cobre a aba Parâmetros (já tratada em `04-speckit-prompt-correcao-parametros.md`/`05-speckit-prompt-correcao-sql.md`).

Fontes Delphi: `C:\projetos.vcl\apps\estoque\fmconsultacompras.dfm` (layout/grids), `fmconsultacompras.pas` (handlers de botão), `dmconsultacompras.pas` (datasets/campos).
Fontes Laravel: `resources/js/Pages/Cadastros/Estoque/ConsultaCompras/*`, `app/Services/Estoque/ConsultaComprasSugestaoService.php`, `app/Support/ErpGrid/Catalogs/ConsultaComprasSugestaoGridCatalog.php`.

## Estrutura real do Delphi (importante)

A aba "Consulta" (`tstConsulta`, `.dfm:2807`) tem um `pgcProdutosConsulta` com 3 sub-abas — mas **só a primeira tem grid definido em `.dfm`**:

- `tstProdutosTotal` ("Produtos dos Grupos de Filiais", `.dfm:2856-3732`) — grid principal `dbgProdutos` (28 colunas, fonte `dsrComprasTotal`/`qryComprasTotal`).
- `tstProdutosSimilares` ("Produtos Similares", `.dfm:3733-4653`) — grid quase-clone `dbgProdutosSimilares` (fonte `dsrProdutosSimilares`) + grid de rollup `dbgProdutosSimilaresTotal` (fonte `dsrTotalProdutosSimilares`).
- `tstProdutosGrades` ("Grades", `.dfm:4654-4657`) — **vazio no `.dfm`**, sem grid próprio declarado (populado em runtime via `.pas`, não auditado aqui — fora do escopo desta análise estática).

Abaixo do `pgcProdutosConsulta`, um painel `pnlConsultaAbaixo` (`.dfm:4659-6900+`) é **compartilhado pelas 3 abas** (não refaz por aba) e contém: grid VENDAS, Observações Lembrar Pedido, grid "Produtos dos Grupos das Filiais", grid "Produtos das Filiais", e o painel esquerdo (Valores por / Custo médio / Mark-up / Preço normal / Última compra / Próximo pedido / Descrição do preço). Isso explica por que a captura de tela mostra tudo isso junto com a aba "Produtos dos Grupos de Filiais" selecionada.

---

## 1. Grid principal — `dbgProdutos` (aba "Produtos dos Grupos de Filiais")

Fonte: `dsrComprasTotal` / `qryComprasTotal`. 28 colunas (`.dfm:2901-3567`).

| Coluna Delphi (caption) | Campo | Significado | Status Laravel | Evidência Laravel |
|---|---|---|---|---|
| PRODUTO | `caracteristicavisual` | código visual da característica (grade) | ausente | não encontrado em `ConsultaComprasSugestaoService::buildLinha` |
| ITEM | `produtovisual` | código visual do produto | presente | `codigo_visual` — `ConsultaComprasSugestaoService.php:227` |
| DESCRIÇÃO DO PRODUTO | `nomeproduto` | descrição | presente | `descricao` — `:228` |
| LINHA | `valorgrade1` | valor grade 1 (linha) | presente no payload, não exibido na grid principal | `valorgrade1` — `:247`; catálogo (`ConsultaComprasSugestaoGridCatalog.php`) não o lista |
| COLUNA | `valorgrade2` | valor grade 2 (coluna) | idem | `valorgrade2` — `:248`; ausente do catálogo |
| COMPOSTO | `composto` | produto composto (kit) | ausente | não encontrado |
| GRUPO | `codigogrupo` | grupo do produto | ausente | não encontrado |
| PROMO | `promocao` | código da promoção | ausente | não encontrado |
| PROMOÇÃO | `descricaopromocao` | descrição da promoção | ausente | não encontrado |
| REFERÊNCIA | `referencia` | referência do produto | ausente | não encontrado |
| ABC (sem título fixo) | `resultadocurvaabc` | classificação curva ABC | presente no payload, não exibido | `resultadocurvaabc` — `:244`; ausente do catálogo de colunas |
| LEMBRAR | `lembrarpedido` | flag "lembrar pedido" | presente no payload, não exibido | `lembrarpedido` — `:243`; ausente do catálogo |
| ESTOQUE | `total_estoque` | soma das 7 categorias de estoque | presente | `total_estoque` — catálogo `defaultOrder=40` |
| TRÂNSITO | `total_transito` | estoque em trânsito | **ausente como coluna separada** | só soma dentro de `total_estoque`; sem campo próprio no retorno de `buildLinha` |
| RESERVA | `reservado` | estoque reservado | ausente como coluna separada | idem |
| RES.PRÉVIA | `reservaprevia` | reserva prévia | ausente como coluna separada | idem |
| FUTURA | `futuro` | estoque futuro (entrada prevista) | presente | `futuro` — catálogo `defaultOrder=60` |
| PED.FILIAIS | `total_pedidos_filiais` | pedidos entre filiais pendentes | **ausente separado** — só combinado em `total_pedido` | `total_pedido` soma fornecedor+filiais (`ConsultaComprasSugestaoService.php:157-159`); sem split |
| PED.FORN. | `total_pedidos_fornecedores` | pedidos a fornecedor pendentes | idem — combinado | idem |
| VENDIDA | `total_vendido` | quantidade vendida no período | presente | `total_vendido` — catálogo `defaultOrder=30` |
| DIAS EM ESTOQUE | `diasEstoque` | dias de cobertura (sem considerar pedidos) | presente (nome diferente) | `diasestoque` — `:236`, ausente do catálogo de colunas exibidas |
| DIAS EST.PED.FIL./COMPRA | `diasestoquecompedidosdecompra` | dias de cobertura COM pedidos pendentes somados | **ausente** | nenhum campo equivalente em `buildLinha` |
| DIAS EM EST.SIM. | `diasEstoqueSimilares` | dias de estoque considerando produtos similares agrupados | **ausente** | sem equivalente — `SugestaoRollup` recalcula `diasestoque` do grupo mas não expõe como coluna própria na linha do produto individual |
| DAS SIM.EST.PED.FIL./COMPRA | `diasEstoqueSimComPedCompra` | idem, com pedidos | **ausente** | idem |
| SUGESTÃO | `sugestao` | quantidade sugerida | presente | `sugestao` — catálogo `defaultOrder=70` |
| DIAS EM EST.CALC. | `diasEstoqueCalculado` | dias de estoque recalculado pós-sugestão | **ausente** | sem equivalente |
| DAS EST.CALC.PED.FIL./COMPRA | `diasEstCalcPedCompra` | idem, com pedidos | **ausente** | sem equivalente |
| MÍN. | `minimo` | estoque mínimo parametrizado | presente no payload, não exibido | `minimo` — `:241`; ausente do catálogo |
| SUG.MÍNIMO | `sugestaominimo` | sugestão para atingir mínimo | presente no payload, não exibido | `sugestaominimo` — `:239`; ausente do catálogo |
| MÁXIMO | `maximo` | estoque máximo parametrizado | presente no payload, não exibido | `maximo` — `:242`; ausente do catálogo |
| SUG.MÁXIMO | `sugestaomaximo` | sugestão para atingir máximo | presente no payload, não exibido | `sugestaomaximo` — `:240`; ausente do catálogo |
| OK | `selecionado` | checkbox de seleção do produto | presente (equivalente funcional) | coluna `_select` em `consultaComprasSugestaoColumns.tsx:141-169` |
| CST | `incidencia` | código de situação tributária | **ausente** | sem equivalente |
| CSOSN | `csosn` | código CSOSN | **ausente** | sem equivalente |
| CLASSE (×2, `codigoclasse`/`classe`) | — | código e descrição da classe | **ausente** | sem equivalente |
| PROMO (2ª, cor por promoção) | `promo` | indicador visual (célula colorida) de produto em promoção | **ausente** | sem equivalente — perde-se o destaque visual de "produto em promoção" da legenda |
| FORNEC. / NOME DO FORNECEDOR | `fornecedor`/`nomefornecedor` | fornecedor da última nota de entrada (via `LEFT JOIN notaspag`) | **ausente** | sem equivalente em `buildLinha`; o `LegacyConsultaComprasDetalheCompraRepository` não traz fornecedor |

**Resumo do grid principal**: catálogo Laravel hoje expõe só **10 colunas** (`codigo_visual, descricao, filial, total_vendido, total_estoque, total_pedido, futuro, sugestao, total_venda*, total_custo*, total_internet, total_loja` — `*` não populadas, ver seção 5) de fato visíveis, contra **28 colunas** no Delphi. Vários campos já existem no payload PHP (`minimo`, `maximo`, `sugestaominimo`, `sugestaomaximo`, `resultadocurvaabc`, `lembrarpedido`, `valorgrade1/2`) mas **não estão no catálogo de colunas exibidas** (`ConsultaComprasSugestaoGridCatalog.php`) — ou seja, o dado já chega ao front, só falta cadastrar a coluna. Outros (Tam/Cor, composto, grupo, promo/promoção, referência, trânsito/reserva/res.prévia separados, ped.filiais/ped.fornecedor separados, os 4 campos de "dias" derivados, CST/CSOSN/classe, fornecedor da última compra) **não existem em lugar nenhum do backend** — são gap de dado, não só de coluna.

## 2. Grid "Produtos Similares" (`dbgProdutosSimilares`)

Fonte: `dsrProdutosSimilares`. Mesma estrutura do grid principal (28→27 colunas, `.dfm:3806-4298`), acrescida de **INATIVO** (`inativo`) e reordenada; sem coluna `caracteristicavisual`("PRODUTO"). Além disso tem um sub-grid de rollup `dbgProdutosSimilaresTotal` (`.dfm:4324-4511`, fonte `dsrTotalProdutosSimilares`) com colunas: `Total`(rótulo "Principal"), `total_estoque`, `total_transito`, `reservado`, `reservaprevia`, `futuro`, `total_pedidos_filiais`, `total_pedidos_fornecedores` — resumo agregado do grupo mostrado como uma linha "Total" separada da grid de membros, com as mesmas categorias de estoque detalhadas.

**Status Laravel**: `AbaProdutosSimilares.tsx` reusa `AbaProdutosTotal` (mesmo catálogo de 10 colunas) para membros + 1 linha sintética "TOTAL" (`AbaProdutosSimilares.tsx:23-48`) construída a partir de `SugestaoRollup::rollup()` — **mesmas colunas ausentes do grid principal** (seção 1) se aplicam aqui, mais a coluna `INATIVO` que não existe em nenhum lugar do Laravel. O sub-grid de rollup por categoria de estoque (trânsito/reserva/res.prévia separados) não existe — o rollup Laravel (`SugestaoRollup.php`) soma um conjunto menor de campos (`total_vendido, total_estoque, total_pedido, futuro, sugestao, sugestaominimo, sugestaomaximo, minimo, maximo, total_internet, total_loja` — não soma trânsito/reserva/reservaprevia/pedidos_filiais/pedidos_fornecedores separadamente).

## 3. Aba "Grades"

Delphi: `tstProdutosGrades` está vazio no `.dfm` — grid populado em runtime (fora do escopo desta auditoria estática; não há evidência de colunas diferentes das outras abas sem ler o `.pas` em profundidade adicional).

Laravel: `AbaProdutosGrades.tsx` reusa a mesma estrutura de `AbaProdutosSimilares.tsx` (membros do grupo + linha TOTAL via `SugestaoRollup`), agrupando por `agrupamentosimilares`/`valorgrade1`/`valorgrade2` em vez de produto-âncora similar. Mesmas 10 colunas do catálogo principal.

## 4. Painéis e grids compartilhados (`pnlConsultaAbaixo`)

| Elemento Delphi | Campo/fonte | Significado | Status Laravel | Evidência Laravel |
|---|---|---|---|---|
| Grid VENDAS (`dbgVendas`) | `dsrVVendas`: `mes`, `totalvendas`(Qtdade)/`QtContrato`(Vendas) Total Geral, `totalinternet`/`qtinternet` Total Internet, `totalloja`/`qtloja` Total Loja | histórico mensal de vendas do produto selecionado, 3 canais | **ausente por inteiro** | nenhum componente equivalente em `Pages/Cadastros/Estoque/ConsultaCompras/` |
| Botão câmera/lupa dentro do grid VENDAS (`sbnVisualizarVendaDiaria`) | — | abre popup de venda diária detalhada (usa o toggle "Valores por" para filtrar Total Geral/Grupo/Filial) | **ausente** | sem equivalente |
| OBSERVAÇÕES LEMBRAR PEDIDO (`mmoObsLembarPedido`) | `obslembrarpedido` (`dsrComprasTotal`) | texto livre associado ao produto quando marcado "lembrar pedido" | **ausente** | não encontrado em `ConsultaComprasLinhaSugestao`/`buildLinha` |
| Grid "PRODUTOS DOS GRUPOS DAS FILIAIS" (`dbgProdutosGrupos`) | `dsrComprasGruposFiliais`/`qryComprasGruposFiliais` — colunas: mnemonico, total_estoque, total_transito, reservado, reservaprevia, futuro, total_pedidos_filiais, total_pedidos_fornecedores, total_vendido, diasEstoque, diasestoquecompedidosdecompra, sugestao, minimo, sugestaominimo, maximo, sugestaomaximo, Últ.Transf.Filial, Últ.Venda, percestoque | breakdown do produto selecionado **por grupo de filiais** | **ausente por inteiro** | `ConsultaComprasSugestaoService::buildLinha` sempre retorna `'grupo_filial' => null` (linha 230) — não existe rota de agregação por grupo de filiais alguma no backend |
| Grid "PRODUTOS DAS FILIAIS" (`dbgProdutosFiliais`) | `dsrComprasFiliaisGrupo`/`qryComprasFiliaisGrupo` — colunas: mnemonico, emestoque, total_estoque, total_transito, reservado, reservaprevia, futuro, total_pedidos_filiais, total_pedidos_fornecedores, total_vendido, diasEstoque, diasestoquecompedidosdecompra, sugestao, minimo, sugestaominimo, maximo, sugestaomaximo, datahorapedido(Últ.Transf.Filial), ultimavenda(Últ.Venda), percestoque | breakdown do produto selecionado **por filial individual** (todas as filiais, não só a filial "vencedora" da linha principal) | **ausente por inteiro** | `buildLinha` retorna só a linha do candidato produto×filial já filtrado — não há endpoint/estrutura que traga "esse produto em todas as filiais" como grid à parte |
| Botão "Requisições entre Filiais" dentro do grid Produtos das Filiais (`sbnRequisicoes`) | — | atalho para requisição (duplica a ação do botão de toolbar) | presente, local diferente | `Index.tsx:1180-1182` — botão "Requisição entre Filiais" existe, mas fora de qualquer grid, como ação de página |
| Botão "Produtos pendentes de emissão de NF" (`sbnProdutosPendentes`) | — | idem "Pendente" da toolbar | ver seção 5 (Pendente) | — |
| "Valores por" (`rgpTotalizacao`: Total Geral/Total por Grupo/Total por Filial) | `Visualizacao` (`dmconsultacompras.pas:2338-2354,3820-3850`) | contexto de filial usado no popup de venda diária | **ausente** | sem equivalente (depende do grid VENDAS ausente) |
| CUSTO MÉDIO (`dtxCustoMedio`) | `customedio` (`dsrDetalhesCompra_Filiais`) | custo médio ponderado (ver divergência de fórmula já reportada no item D.3 do `05-speckit-prompt-correcao-sql.md`) | presente (tabela, não painel) | `AbaDetalhamentoCompra.tsx:29,48` — coluna "Custo médio" |
| MARK-UP (%) (`dtxMarkup`) | `markup` (`dsrDetalhesCompra_Filiais`) | markup % | presente | `AbaDetalhamentoCompra.tsx:30,49` |
| PREÇO NORMAL (`dtxPrecoVenda`) | `valornormal` (`dsrDetalhesPreco`) | preço de venda normal — **já reportado como não implementado (sempre null) no item D.3 do `05`** | presente na tabela, mas dado nunca populado | `AbaDetalhamentoCompra.tsx:31,50`; backend stub, ver `05-speckit-prompt-correcao-sql.md` D.3 |
| ALTERADO EM (`dtxAlteracaoPreco`) | `alteracaopreconormal` (`dsrDetalhesPreco`) | data da última alteração do preço normal | **ausente** | sem coluna equivalente em `ConsultaComprasDetalheCompra` |
| PREÇO PROMOÇÃO (`dtxPrecoPromocao`) | `valorpromocao` (`dsrDetalhesPreco`) | preço promocional — mesmo gap do "Preço normal" | presente na tabela, dado nunca populado | `AbaDetalhamentoCompra.tsx:32,51` |
| VALIDADE (`dtxValidadePreco`) | `validade` (`dsrDetalhesPreco`) | validade do preço promocional | **ausente** | sem equivalente |
| ÚLTIMA VENDA (`edtUltimaVenda`) | `ultimavenda` (`dsrDetalhesPreco`) | data da última venda do produto | **ausente** | sem equivalente em `ConsultaComprasDetalheCompra` (nome parecido `ultimavenda` só existe como coluna do grid "Produtos das Filiais", também ausente — seção acima) |
| ÚLTIMA COMPRA — FILIAL (`dtxFilial`) | `filial` (`dsrDetalhesCompra_Filiais`) | filial da última compra | presente (é a mesma coluna "Filial" da tabela) | `AbaDetalhamentoCompra.tsx:22,41` |
| ÚLTIMA COMPRA — DATA (`dtxData`) | `datacompra` | data da última compra | presente | `:28,47` |
| ÚLTIMA COMPRA — DATA CADASTRO (`dtxdatacadastro`) | `datacadastro` | data de cadastro do produto | **ausente** | sem coluna equivalente na tabela de detalhamento |
| ÚLTIMA COMPRA — PREÇO COM/SEM ICMS | `precocomicms`/`precosemicms` | preços de compra | presente | `:23-24,42-43` |
| ÚLTIMA COMPRA — QUANTIDADE (`dtxQuantidade`) | `qtdecompra` | quantidade da última compra | presente | `:25,44` |
| ÚLTIMA COMPRA — IPI % (`dtxvaloripi`) | `aliquotaipi` | alíquota de IPI | presente | `:26,45` |
| PRÓXIMO PEDIDO (NR/QTDADE/PREVISÃO/EMISSÃO) | `pedido`/`quantidadependente`/`entrega`/`emissao` (`dsrConsultaProdutosPedidos`) | dados do próximo pedido de compra já em aberto para o produto | **ausente por inteiro** | sem equivalente — não há consulta de "próximo pedido pendente" no Laravel |
| CST/CSOSN (`dtxcst`/`dtxcsosn`) | `incidencia`/`csosn` (`dsrComprasTotal`) | situação tributária | **ausente** | sem equivalente (mesmo gap do grid principal) |
| DESCRIÇÃO DO PREÇO (`dtxDescricaoPreco`) | — | rótulo textual do tipo de preço aplicado ("Normal", conforme screenshot) | parcialmente coberto | `valor_unitario_fonte` (`AbaDetalhamentoCompra.tsx:34,55`) cobre a *precedência* (precocomicms/valorultimacompra/customedio), mas não o conceito Delphi de "descrição do preço" (tabela de preços/coluna de preço aplicada) |

## 5. Barra de comandos (toolbar)

| Botão | Atalho | O que faz no Delphi | Status Laravel | Evidência Laravel |
|---|---|---|---|---|
| Gravar F5 | F5 | grava preferências (já coberto — remoção decidida no item 5 do `04-speckit-prompt-correcao-parametros.md`) | N/A | não aplicável (fora de escopo aqui) |
| Gerar F6 | F6 | executa a consulta/gera sugestão (`sbnGerarClick`, `.pas:631-...`) | presente | `Index.tsx:637-646` ("Gerar", shortcut F6) |
| Cancelar | — | sai do modo requisição / cancela geração (`sbnCancelarClick`, `.pas:1940`) | presente | `Index.tsx:647-655` |
| Relatório F7 | F7 | `dtmConsultaCompras.ImprimirRelatorio` (`sbnRelatorioClick`, `.pas:835-838`) — imprime relatório da consulta | **ausente** | nenhuma ação "Relatório"/"Imprimir" encontrada em `Index.tsx` |
| Estoque F8 | F8 | abre `TfrmConsultaEstoque` para o produto/filial selecionado (`sbnConsultaEstoqueClick`, `.pas:1621-...`) | presente | `Index.tsx:656-660` ("Consulta de Estoques" → `router.visit(atalhos.consulta_estoques)`) |
| Pedido F10 | F10 | monta pedido de compra a partir dos produtos marcados (`sbngerarPedidoClick`, `.pas:1164-...`) | presente, fora da toolbar | `Index.tsx:1190` "Gerar Pedido de Compra" — botão inline na área de resultados, não na `ErpConsultaOperationBar` |
| Requisição F11 | Ctrl+F11 (item atual) / F11 (grade) | gera requisição entre filiais dos produtos marcados/atual (`sbngerarRequisicaoClick`, `.pas:1444-1459`; `sbnRequisitarItemAtual` para o item atual) | presente, fora da toolbar | `Index.tsx:1180-1182` "Requisição entre Filiais" — idem, botão inline, não na toolbar |
| Pendente | — | abre `TfrmConsultaProdutosNotasSefaz` — produtos pendentes de emissão de NF (`sbnNFePendenteClick`, `.pas:2418-2427`) | **ausente** | nenhuma ação equivalente encontrada |
| Cadastro de Produtos | — | abre `TfrmCadastroCaracteristicas` (cadastro da característica/produto) (`sbnProdutosClick`, `.pas:1779-1794`) | **ausente** — distinto de "Ficha de Produtos" | `Index.tsx` só tem "Ficha de Produtos" (linha 662-665); não há uma segunda ação "Cadastro de Produtos" |
| Ficha de Produtos | — | abre `TfrmConsultaFichaProduto` (ficha/consulta, somente leitura) (`sbnFichaProdutosClick`, `.pas:1796-1812`) | presente | `Index.tsx:661-665` |
| Manutenção de Preço | — | abre `TfrmManutencaoPreco` para os produtos marcados (`sbnManutencaoPrecoClick`, `.pas:2338-...`) | presente | `Index.tsx:666-670` ("Manutenção de Preços" → `router.visit(atalhos.manutencao_precos)`) |
| Câmera/lupa (`sbnVisualizarFoto`) | — | abre visualizador de imagem do produto (`AcionarTelaVisualizarImageURL`, `.pas:1615-1619`) | **ausente** | nenhuma ação de visualização de foto encontrada em `Index.tsx` |
| (grid legend) "Requisitar o item atual — Ctrl+F11" (`sbnRequisitarItemAtual`) | Ctrl+F11 | requisita só o produto/linha atual (distinto do botão de requisição em lote) | **ausente** — só existe a versão em lote | `RequisicaoEntreFiliaisModal` cobre o fluxo em lote; não há ação por linha |
| (grid legend) "Atualizar Registro" (`sbnAtualizarRegistros`) | — | atualiza uma linha específica com dados novos do banco sem regerar tudo | **ausente** | sem equivalente |
| (grid legend) "Selecionar todos os produtos" (checkbox) | — | seleciona/desmarca todos | presente (equivalente) | checkbox "select all" em `consultaComprasSugestaoColumns.tsx:141-153` |

## Gaps confirmados (ordenados por relevância)

1. **Grids "Produtos dos Grupos das Filiais" e "Produtos das Filiais" inteiramente ausentes.** Estes são os dois breakdowns por grupo-de-filial e por filial individual do produto selecionado — parte central do fluxo de decisão do comprador (ver de onde vem estoque/sugestão antes de decidir transferir vs. comprar). `buildLinha` sempre retorna `grupo_filial: null`; não há backend algum para esses dois recortes.
2. **Painel de contexto do produto selecionado (drill-down) inteiramente ausente**: grid VENDAS (histórico mensal 3 canais), Observações Lembrar Pedido, Próximo Pedido (NR/Qtdade/Previsão/Emissão), Última Venda, Alterado em/Validade do preço, Data de Cadastro, CST/CSOSN, Descrição do Preço, botão de visualização de foto. A tabela `AbaDetalhamentoCompra.tsx` cobre uma fração pequena disso (preços de compra e custo médio), sem nada do contexto de vendas/pedidos/observações.
3. **Grid principal expõe 10 de 28 colunas Delphi.** Vários campos (mínimo, máximo, sugestão mínimo/máximo, curva ABC, lembrar pedido, linha/coluna de grade) **já chegam ao front no payload** mas não estão cadastrados no catálogo de colunas (`ConsultaComprasSugestaoGridCatalog.php`) — correção rápida, é só cadastro de coluna. Outros (trânsito/reserva/reserva prévia/pedidos separados, os 4 campos de "dias" derivados, composto/grupo/promoção/referência, CST/CSOSN/classe, fornecedor da última compra) não existem em lugar nenhum do backend — gap de dado, não só de coluna.
4. **Toolbar: 4 ações ausentes por inteiro** — Relatório F7 (impressão), Pendente (NFe pendente), Cadastro de Produtos (distinto de Ficha), visualizar foto. Mais 2 ações de grid ausentes: "Requisitar item atual" (Ctrl+F11, por linha) e "Atualizar Registro" (refresh de uma linha).
5. **`total_venda`/`total_custo` já estão cadastrados no catálogo de colunas** (`ConsultaComprasSugestaoGridCatalog.php:39-40`, `defaultOrder` 75/76) **mas nunca são populados** — `ConsultaComprasSugestaoService::buildLinha` não os inclui no array de retorno. Isso é o mesmo gap identificado como item **E.1 ("Totalização Sugestão/Qtde vendida")** no `05-speckit-prompt-correcao-sql.md` — a coluna já existe na grid (renderiza "—"), falta só a fórmula. Vale reconciliar/mencionar essa sobreposição ao escrever o próximo prompt de correção.
6. **Aba Similares**: falta a coluna INATIVO e o detalhamento do sub-grid de rollup por categoria de estoque (trânsito/reserva/reserva prévia/pedidos separados) — `SugestaoRollup.php` soma um conjunto menor de campos que o Delphi.
7. **Aba Grades**: não auditável em detalhe contra Delphi porque `tstProdutosGrades` está vazio no `.dfm` (populado em runtime, não lido nesta auditoria) — mas a implementação Laravel reusa a mesma estrutura limitada de 10 colunas da aba Total, então herda os mesmos gaps da seção 1.
