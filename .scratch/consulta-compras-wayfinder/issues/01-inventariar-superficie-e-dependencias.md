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

### Correção (2026-07-24) — "F5" NÃO é "Gravar preferências"; achado um gap funcional real

Reverificado a pedido do usuário. A linha original da tabela acima ("Gravar | F5 | LerArquivoCFG...") estava **errada** — corrigida por remoção. Evidência:

- `TfrmConsultaCompras.KeyDown` (`fmconsultacompras.pas:594-601`): `VK_F5` chama `sbnSalvarClick(Self)`, condicionado a `sbnSalvar.Enabled := dtmConsultaCompras.vTotalAtendido <> 0`. **`sbnSalvarClick`** (já lido no ticket 11, `fmconsultacompras.pas:2084-2099`) é o mesmo botão "Confirmar" da grade de Requisição entre Filiais — chama `dtmConsultaCompras.IncluirPedidosFiliais` (a fase de persistência já documentada por completo no ticket 11 e no prompt `03`). Ou seja: **F5 é um atalho de teclado para confirmar/gravar a Requisição entre Filiais quando a grade está aberta e há algo pendente para salvar** — uma ação de negócio real, não uma preferência de UI. Só fica habilitado quando `gbxRequisicoes` está visível e `vTotalAtendido <> 0`.
- `LerArquivoCFG` **existe** de fato (persistência de preferências de busca em arquivo `.cfg` local), mas é chamado automaticamente em `TfrmConsultaCompras.Create` (`:473`, modo leitura) e em `TfrmConsultaCompras.Destroy` (`:541`, modo gravação) — **nunca a partir do KeyDown/F5**. Não há botão "Gravar" nem atalho dedicado a essa persistência no Delphi; ela é inteiramente automática (abrir a tela lê o `.cfg`, fechar a tela grava).

**Impacto nos artefatos já publicados** (achado, não corrigido neste ticket — decisão de correção fica com o usuário):
- `modules/estoque/consulta-compras/01-speckit-prompt.md`, item 5, herda o mesmo engano ("Gravar F5" = preferência local).
- `modules/estoque/consulta-compras/04-speckit-prompt-correcao-parametros.md`, seção 5, **instruiu remover** um botão "Gravar preferências (F5)" da tela Laravel (`Index.tsx:596-601`) — a remoção em si não é errada (persistência automática de preferências é uma melhoria legítima, e o Delphi realmente já faz isso automaticamente), mas a premissa de que isso era "o F5" estava equivocada.
- **Gap funcional confirmado**: verificado em `teclux_cloud/backend/resources/js/Pages/Cadastros/Estoque/ConsultaCompras/Index.tsx` — não há nenhum handler de tecla F5 hoje. O atalho real do Delphi (F5 = confirmar a Requisição entre Filiais quando pendente) nunca foi implementado no Laravel; hoje a confirmação da Requisição só existe via clique no botão "Confirmar" do modal (`RequisicaoEntreFiliaisModal.tsx`). Isso é uma lacuna de atalho de teclado, não de funcionalidade (a ação em si — confirmar a requisição — já está implementada e correta, só falta o atalho F5).

### Dependências Laravel — o que já existe vs. o que é novo

CONFIRMADO já migrado e reaproveitável: Consulta de Estoques (`modules/estoque/consulta-estoques`), Ficha de Produtos (`modules/estoque/ficha-produtos`), Manutenção de Preços (`modules/estoque/manutencao-precos`) — os três acionados por botões desta tela via navegação/contexto, não precisam ser redesenhados.

DECISÃO já tomada: Busca Assistida (`BuscaAssistidaPanel` e infraestrutura relacionada) **não** será reaproveitada para o filtro de produtos desta tela, apesar de o componente Delphi de filtro (`tstSelecaoAleatoria*`) ser o mesmo usado por Manutenção de Preços. O mecanismo de filtro de produtos efetivo fica para o ticket 03 decidir.

NÃO LOCALIZADO (fora de escopo): Cadastro de Pedidos de Compra (`dmcadastropedidos.pas`/`fmcadastropedidos.pas`/`fmcadastropedidosgrade.pas`, ~20 mil linhas) — acionado por "Pedido F10", não migrado, mapa/esforço futuro próprio.

NÃO LOCALIZADO (dentro de escopo, a especificar pelos tickets seguintes): toda a lógica de cálculo de velocidade de vendas, estoque disponível, curva ABC, tabela redutora, fórmula de sugestão, Produtos Similares/Grades, Detalhamento de Compra e Requisição entre Filiais — nada disso existe ainda no Laravel.
