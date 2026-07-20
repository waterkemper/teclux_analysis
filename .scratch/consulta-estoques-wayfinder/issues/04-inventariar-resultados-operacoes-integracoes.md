# Inventariar resultados, operações e integrações Delphi

Type: task
Status: resolved
Blocked by: 01, 02, 03

## Answer

### Estrutura dos resultados

`CONFIRMADO` — A tela mantém um resultado mestre por Produto/Filial e troca a perspectiva externa sem duplicar o painel interno. As perspectivas são **Itens do Produto**, **Lotes dos Itens**, **Produtos Similares**, **Grade**, **Modelos**, **Componentes** e **Atributos**; o page control interno é fisicamente movido para Itens, Lotes, Similares ou Componentes e seu datasource muda para o dataset correspondente (`fmconsultaestoque.pas:613-738`).

O conjunto visível, já cruzado com os datasets do ticket **Inventariar datasets, queries e regras de cálculo Delphi**, é:

| Resultado | Colunas/dados funcionais | Agrupamento e totais | Evidência |
|---|---|---|---|
| Produtos, Similares e Lotes | Identificação visual, descrição, Filial, dimensões de Grade, saldos, preço, promoção, situação, grupo/marca, comissão e peso condicional; Lotes acrescentam lote e validade | Ordenação por descrição normalizada e Filial; detalhes internos seguem a linha ativa | `fmconsultaestoque.dfm:3532-4842`; `dmconsultaestoque.dfm:161-482,1161-1456,3463-3757` |
| Componentes | Produto componente, dimensões, quantidade/unidade da composição, preço unitário e total, além de situação/estoque | Um conjunto por Produto composto ativo; aba aparece dinamicamente quando `composto` ou `composto2` | `fmconsultaestoque.pas:1038-1048`; `dmconsultaestoque.dfm:2338-2547` |
| Grade | Matriz linha × coluna; cada célula contém Produto, `Em estoque/Estoque total` e preço atual | Cabeçalhos são valores das dimensões; seleção de célula muda o Produto ativo e reabre detalhes | `fmconsultaestoque.pas:678-716,1174-1216`; `dmconsultaestoque.pas:1286-1515` |
| Modelos | Modelo e observação vinculados à Característica | Lista simples do Produto ativo | `fmconsultaestoque.dfm:4843-5153`; `dmconsultaestoque.dfm:2127-2183` |
| Atributos | Nome, descrição e valor convertido; booleanos como Sim/Não | Expansão do JSON do Produto ativo | `fmconsultaestoque.dfm:5592-5789`; `dmconsultaestoque.dfm:4080-4173` |
| Estoques | Estoque total, Em estoque, Danificada, Reservado, Futuro, Demonstração, Pedidos, Conserto, Estoque venda, Em trânsito, Reserva prévia, Estoque físico; preço normal/promocional/validade; localização, mínimo e máximo | Painel de valores da linha, sem footer | `fmconsultaestoque.dfm:870-1368` |
| Financeiro | Custo médio, Financeiro, IPI, margem, últimas movimentações, última compra, valores com/sem ICMS, Fornecedor e CST/CSOSN | Painéis por assunto; somente `GerenteEstoque` | `fmconsultaestoque.dfm:1369-2090`; `.pas:319` |
| Acumuladores | Período e total de Compras/Vendas | Total mensal por Produto/Filial, períodos mais recentes primeiro | `fmconsultaestoque.dfm:2091-2240`; `dmconsultaestoque.dfm:851-948` |
| Preços/Cargos/Cliente | Coluna e valor normal/promocional/validade; cargo/markup/preço; Cliente, código no Cliente, preço e última venda | Uma modalidade de preço normal ou por cargo; Cliente é aba adicional | `fmconsultaestoque.dfm:2241-2652`; `dmconsultaestoque.dfm:1022-1157,1929-1996,2070-2123` |
| Pedidos | Pedido, data/Filial e quantidade pendente; Notas Pendentes de Entrada com identificação da NSU/Fornecedor/Produto | Apenas pedidos A/P com pendência positiva; notas excluem canceladas/já recebidas | `fmconsultaestoque.dfm:2653-2924`; `dmconsultaestoque.dfm:2187-2247,3239-3387` |
| Fornecedores | Fornecedor, preço, IPI e data da última entrada | Linhas por vínculo Produto–Fornecedor; somente gerente | `fmconsultaestoque.dfm:2925-3124`; `dmconsultaestoque.dfm:2896-3235` |
| Licitações | Licitação, Cliente, situação, quantidade, saldo pendente, preço, custo/ICMS e `TotalSaldoPendente` | Footer soma quantidade, saldo pendente e valor total; somente saldos positivos | `fmconsultaestoque.pas:1243-1255`; `dmconsultaestoque.dfm:4177-4459` |

### Cores e estados visuais

- `CONFIRMADO` — Produto/Similar/Componente inativo ou fora de linha recebe fundo laranja (`$007DBEFF`) e texto preto; promoção recebe fundo branco e texto vermelho (`fmconsultaestoque.pas:743-810,1004-1036`).
- `CONFIRMADO` — Comissão de Produto ou Grupo tem fundo verde (`$0002FD86`), texto vermelho e negrito, precedendo as demais regras de cor (`fmconsultaestoque.pas:748-763,783-798,1009-1024`).
- `CONFIRMADO` — Célula promocional da Grade usa texto vermelho/negrito, inclusive quando selecionada (`fmconsultaestoque.pas:1174-1206`).
- `CONFIRMADO` — Preço e validade promocionais no painel usam fonte vermelha; a legenda diferencia promoção e Produto fora de linha/inativo (`fmconsultaestoque.pas:335-336`; `.dfm:3492-3530`).
- `CONFIRMADO` — Grade e Licitações usam a cor zebrada de `ParSistema.CorZebradoRelatorio`; grids DB convencionais têm `DoubleRowColor`/`StrippedColor` configurados no DFM (`fmconsultaestoque.pas:375-377`; `.dfm`, propriedades de cada grid).
- `POSSÍVEL BUG LEGADO` — Em Similares, o getter de inatividade devolve o flag de fora de linha; a cor pode não representar inatividade real (`dmconsultaestoque.pas:1587-1595`).

### Operações locais

| Operação | Elegibilidade/entrada | Efeito e saída | Erro/observação |
|---|---|---|---|
| **Gerar** | Exige alguma seleção nos frames; recebe Filial opcional, listas condicionais e flags. Botão, `F6` ou Enter no handler legado | Abre mestre, registra `estoques_estatistica`, volta para **Itens do Produto** e atualiza detalhes; quando vazio devolve foco à Filial | Não há `try/except` local; `AbrirTabelaConsultaEstoques=True` significa dataset vazio, convenção invertida (`fmconsultaestoque.pas:398-445`; `dmconsultaestoque.pas:763-770,1934-1961`) |
| **Limpar/refazer** | `Esc` | Fecha conjunto principal via `ReFazConsultaTabelas` e foca Filial | A rotina não enumera todos os datasets dependentes (`fmconsultaestoque.pas:453-462`; `dmconsultaestoque.pas:894-912`) |
| **Editar mínimo/máximo/localização** | Fields editáveis apenas para `GerenteEstoque` em Produtos, Similares e Lotes | Post grava máximo/mínimo por Produto+Filial | Localização está comentada no UPDATE: `POSSÍVEL BUG LEGADO` (`dmconsultaestoque.pas:958-960,1260-1262,1814-1861,2013-2015`) |
| **Gravar última compra** | Aba Financeiro gerencial; alteração habilita botão, Enter também grava | Chama `GravarValorUltimaCompra`; desabilita botão depois na variante principal | Leitura usa Produto+FilialBase, UPDATE só Produto e pode atingir todas as Filiais; variante de Similar parece código residual (`fmconsultaestoque.pas:934-1001`; `dmconsultaestoque.pas:1620-1637`; `.dfm:2000-2069`) |
| **Selecionar Grade** | Célula não fixa da matriz | Posiciona combinação linha/coluna no Produto e reabre a consulta/detalhes desse Produto | Sem mensagem local para célula sem correspondência (`fmconsultaestoque.pas:1208-1216`) |

### Integrações externas acionadas

#### Histórico de Notas Fiscais anteriores

- **Gatilho:** botão `sbnVisualizarDetalhesProdutosNota` (`fmconsultaestoque.dfm:1618`; `.pas:1057-1062`).
- **Entrada:** callbacks `GetCodigoNotaProduto` e `GetProduto` do Produto ativo.
- **Contrato:** `AcionarTelaonsultaProdutosNotasAnteriores(Owner, CodigoNota, Produto)` cria/reutiliza uma única janela por owner, injeta os dois valores, abre `qryProdutosNotaFiscalAnteriores` e traz a janela à frente (`repositorio/fmConsultaProdutosNotasAnteriores.pas:23,30-54`). Ao trocar Produto/Lote/Similar, se essa janela estiver aberta para o mesmo owner, a query é reaberta (`fmconsultaestoque.pas:634-635,654-655,671-672,1230-1231`).
- **Limite:** migrar o acionamento e parâmetros; a tela/histórico interno é dependência externa.

#### Fotos e detalhes do Produto

- **Gatilho:** botão **Visualizar foto** (`fmconsultaestoque.dfm:94-207`; `.pas:1064-1075`).
- **Entrada:** Produto ativo; na Grade, Produto da célula selecionada.
- **Contrato:** `AcionarTelaVisualizarImageURL(Owner, Produto)` abre fotos, detalhes HTML e atributos. Se não houver foto, ainda abre quando existirem características/descrição complementar; caso contrário mostra “Imagem não encontrada.” (`repositorio/fmVisualizarImageURL.pas:64-92,133-169`).
- **Limite:** Laravel pode reutilizar sua visualização de Produto/mídia, preservando a resolução do Produto selecionado e o estado vazio.

#### Abrir Pedido

- **Gatilho:** botão da grade de Pedidos ou duplo clique em `dbgProdutosPedidos`; o handler de duplo clique da grade de notas de entrada também aponta para a mesma ação (`fmconsultaestoque.dfm:2730,2755`; `.pas:1077-1088,1218-1222`).
- **Entrada:** `qryConsultaProdutosPedidosPedido`.
- **Contrato:** `MostrarFormRegistrado(['Abrir', numeroPedido], 'TfrmCadastroPedidos', True)` solicita ao shell abrir o cadastro registrado em modo leitura/abertura (`fmconsultaestoque.pas:1077-1082`).
- `POSSÍVEL BUG LEGADO` — `dbgConsultaProdutosEntradaSefazDblClick` reutiliza o número do dataset de Pedidos, não um identificador da NSU; pode abrir Pedido incorreto/vazio (`fmconsultaestoque.pas:1084-1088`).

#### Registrar Venda Perdida

- **Gatilho:** botão `sbnLostSales` no topo (`fmconsultaestoque.dfm:213-255`; `.pas:1235-1241`).
- **Entrada:** nenhuma informação do Produto atual é repassada.
- **Contrato:** `MostrarFormRegistrado(['Incluir'], 'TfrmVendasPerdidas', True)` abre o cadastro externo em inclusão; `TfrmVendasPerdidas.OperacaoPadrao` apenas chama `InternoIncluir` (`apps/vendas/fmVendasPerdidas.pas:167-172`).
- `CONFIRMADO` — Embora parta da Consulta de Estoques, o usuário precisa preencher Produto/Grupo/Vendedor no módulo chamado; não presumir pré-preenchimento no Laravel.

### Impressão, exportação e relatórios

- `NÃO LOCALIZADO` — Não há botão, action ou método explícito de imprimir, exportar, gerar Excel/CSV ou chamar relatório nesta tela.
- `INFERIDO` — `TDBAdvGrid` possui `PrintSettings` no DFM para Grade, Atributos e Licitações, mas não foi localizado comando que as acione. Isso é capacidade técnica do componente, não requisito funcional comprovado (`fmconsultaestoque.dfm:3190-3446,5047-5112,5655-5781`).
- `NÃO LOCALIZADO` — Tratamento de erro específico das integrações. Exceções dependem do framework/rotinas chamadas; a única mensagem local comprovada nesse limite é o estado sem imagem da visualização externa.

### Contrato para a comparação Laravel

1. Preservar resultados e carga de detalhes sob demanda por perspectiva/aba, sem executar todos os datasets para cada linha.
2. Tratar cores como semântica de estado — promoção, inativo/fora de linha e comissão — e não como valores visuais rígidos quando já houver componentes Laravel equivalentes.
3. Implementar escritas por endpoints/abilities explícitos e decidir conscientemente os bugs de escopo de Filial; não copiar os UPDATEs defeituosos como paridade automática.
4. Reutilizar cadastros/páginas Laravel de Pedido, Produto/mídia, histórico fiscal e Venda Perdida por seus contratos existentes; não migrar internamente esses módulos neste esforço.
5. Não incluir exportação/relatório como paridade obrigatória sem evidência adicional.

## Original question

Quais colunas, agrupamentos, totais, seleções, cores e estados compõem os resultados; quais operações e atalhos existem; e quais são sua elegibilidade, entrada, efeito, saída, tratamento de erro e contrato com relatórios, exportações, históricos, fotos, cadastros ou outros módulos externos?
