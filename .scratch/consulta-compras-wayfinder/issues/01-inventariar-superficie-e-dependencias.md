# Inventariar superfície e dependências da Consulta de Compras

Type: task
Status: resolved
Blocked by:

## Question

Analisando conjuntamente `dmconsultacompras.pas`/`.dfm` e `fmconsultacompras.pas`/`.dfm`, qual é o inventário completo da tela: todas as abas (Parâmetros: Filial, Grupo Filial, Filiais com/sem Estoque, filtro de produtos; Consulta: Produtos Total, Produtos Similares, Produtos Grades), todos os botões/atalhos (Gravar F5, Gerar F6, Relatório F7, Estoque F8, Pedido F10, Requisição F11, e os atalhos de navegação para Cadastro de Produtos/Ficha de Produtos/Manutenção de Preço), todas as queries principais (`qryComprasTotal`, `qryVVendas` e variantes por filial/grupo/anterior/similares, `qryDetalhesCompra`, `qryProdutosSimilares`, `qryProdutosGrades`, `qryReducaoTabelaCompras`, `qryPedidosFiliais`), e quais dependências externas already existem no Laravel (Busca Assistida — descartada, Ficha de Produtos, Manutenção de Preços, Consulta de Estoques) vs. o que é novo (Cadastro de Pedidos de Compra, fora de escopo)?

## Answer

### Estrutura de abas (CONFIRMADO, `fmconsultacompras.dfm`)

- **Parâmetros** (`tstParametros`): Filial (`tstFilial`), Grupo Filial (`tstGrupoFilial`), Filiais com Estoque (`tstFiliaisEstoque`), Filiais sem Estoque (`tstFiliaisSemEstoque`), e um bloco de filtro de produtos herdado (`inherited tstItemdeProduto`, `tstProduto`, e várias `tstSelecaoAleatoria*` — Grupo/Classe/Marca/Modelo/Especificações/Promoções/CST/CSOSN/Lista Padronizada/Localizações/Lotes/MarketPlace/Atributos/Serviços — o mesmo componente de filtro usado por Manutenção de Preços, mas **sem** a Busca Assistida, descartada por decisão do usuário).
- **Consulta** (`tstConsulta`): Produtos Total (`tstProdutosTotal`), Produtos Similares (`tstProdutosSimilares`), Produtos Grades (`tstProdutosGrades`).
- Painel de opções auxiliares na aba Parâmetros: período de vendas (datas ou nº de dias), "Estoque para: N dias", filtros de produto (em linha/fora de linha, com/sem montagem, brinde, ativo/inativo, composto), filtro de estoque por status (em estoque, reservado, em trânsito, demonstração, conserto, danificada, reserva prévia), "Incluir resultados" (sugestão zero, marcados para pedido), "% acima do mínimo", Curva ABC (A/C/B/Não Definido) com "Proporcional para: N dias", "Incluir no resultado dos pedidos" (pedidos entre filiais / não considerar pedidos de compra), Tabela Redutora, filtro por Conceitos e Grupos de Fornecedores.

### Botões e destinos (CONFIRMADO)

| Botão | Atalho | Handler | Destino/efeito |
|---|---|---|---|
| Gravar | F5 | (herdado do ancestral) | `LerArquivoCFG(true, ...)` — persiste parâmetros num arquivo `.cfg` local, não é gravação de negócio |
| Gerar | F6 | `sbnGerarClick` | Recalcula a consulta/sugestão a partir dos parâmetros atuais |
| Relatório | F7 | `sbnRelatorioClick` | Impressão do relatório da consulta (FastReport — fora de escopo detalhado, mas citado para o ticket de critérios) |
| Estoque | F8 | `sbnConsultaEstoqueClick` | Abre `TfrmConsultaEstoque` (**já migrado**: `modules/estoque/consulta-estoques`), passando filial+produto da linha ativa (Total, Similares ou Grades) |
| Pedido | F10 | `sbngerarPedidoClick` | Abre `TfrmCadastroPedidos`/`TdtmCadastroPedidos` (**não migrado, fora de escopo**), pré-popula itens/quantidades selecionados |
| Requisição | F11 | `sbngerarRequisicaoClick` | `GerarDadosRequisicoes` + `MontarGradeDadosRequisicoes` — autocontido, sem tela externa |
| Cadastro de Produtos | — | `sbnProdutos` (via `AcionarTela...`) | Navega para o Cadastro de Produtos |
| Ficha de Produtos | — | `sbnFichaProdutosClick` | Abre `TfrmConsultaFichaProduto` (**já migrado**: `modules/estoque/ficha-produtos`), passando o produto visual da linha ativa |
| Manutenção de Preço | — | `sbnManutencaoPrecoClick` | Abre `tfrmManutencaoPreco` (**já migrado**: `modules/estoque/manutencao-precos`), opcionalmente pré-populando a lista de produtos selecionados no filtro de seleção aleatória dele |

### Queries principais por finalidade (CONFIRMADO, `dmconsultacompras.dfm`)

- **Velocidade de vendas**: `qryVVendas`, `qryVVendas_porFilial`, `qryVVendas_porGrupo` (+ pares `_Anterior` para o período anterior, `_Similares`/`_Similares_Anterior` para produtos substitutos), `qryVVendasDiaria`/`qryVVendasDiaria_Detalhada`/`qryVVendasDiaria_Detalhada_Totais`, `qryVVendasmes`.
- **Estoque**: `qryEstoques`, `qryEstoqueBloqueio`, `qryMovimentos`.
- **Sugestão/totalização**: `qryComprasTotal` (+ `_ComTabelaReducao_FiliaisEspecificas`), `qryComprasFiliaisGrupo` (+ `_Similares`), `qryComprasGruposFiliais` (+ `_Similares`).
- **Similares/Grades**: `qryProdutosSimilares`, `qryTotalProdutosSimilares`, `qryListaProdutosSimilares_`, `qryProdutosGrades`, `qryTotalProdutosGrades`.
- **Preço/custo**: `qryDetalhesCompra` (+ `_Similares`), `qryDetalhesPrecos` (+ `_Similares`).
- **Tabela Redutora**: `qryReducaoTabelaCompras`.
- **Requisição entre Filiais**: `qryPedidosFiliais` (+ variantes `__`), `qryAtualizarPedidosFiliais`, `qryListaPedidosFiliais_Requisitante`/`_Requisitado`, `qryConsultaProdutosPedidos`.
- **Auxiliares**: `qryFiliais`, `qryGrupoFiliais`, `qryConceitos`, `qryProdutosPendentes`, `qryProdutosSelecionados`, `qryListaProdutos`, `qryAtualizarProduto`/`qryAtualizarEstoque`/`qryAtualizarObsProduto`, `qryTabelaTempDetalhe`.

### Dependências Laravel — o que já existe vs. o que é novo

CONFIRMADO já migrado e reaproveitável: Consulta de Estoques (`modules/estoque/consulta-estoques`), Ficha de Produtos (`modules/estoque/ficha-produtos`), Manutenção de Preços (`modules/estoque/manutencao-precos`) — os três acionados por botões desta tela via navegação/contexto, não precisam ser redesenhados.

DECISÃO já tomada: Busca Assistida (`BuscaAssistidaPanel` e infraestrutura relacionada) **não** será reaproveitada para o filtro de produtos desta tela, apesar de o componente Delphi de filtro (`tstSelecaoAleatoria*`) ser o mesmo usado por Manutenção de Preços. O mecanismo de filtro de produtos efetivo fica para o ticket 03 decidir.

NÃO LOCALIZADO (fora de escopo): Cadastro de Pedidos de Compra (`dmcadastropedidos.pas`/`fmcadastropedidos.pas`/`fmcadastropedidosgrade.pas`, ~20 mil linhas) — acionado por "Pedido F10", não migrado, mapa/esforço futuro próprio.

NÃO LOCALIZADO (dentro de escopo, a especificar pelos tickets seguintes): toda a lógica de cálculo de velocidade de vendas, estoque disponível, curva ABC, tabela redutora, fórmula de sugestão, Produtos Similares/Grades, Detalhamento de Compra e Requisição entre Filiais — nada disso existe ainda no Laravel.
