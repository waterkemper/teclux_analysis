# Pesquisa de interface e fluxo observável — Cadastro de Inventário Delphi

## Escopo e método

Este documento resolve o ticket **Inventariar interface e fluxo Delphi do Cadastro de Inventário**. O foco é registrar comportamento observável para a futura especificação Laravel; não é uma implementação, não altera fontes Delphi e não fecha o contrato de dados Laravel.

Fontes principais consultadas:

- `delphi/apps/estoque/fmcadastroinventario.pas` e `.dfm` — formulário, abas, comandos, atalhos e grids.
- `delphi/apps/estoque/dmcadastroinventario.pas` e `.dfm` — datasets, eventos, defaults, validações, operações, SQL embutido e relatório.

Units referenciadas consultadas somente onde eram necessárias para explicar a edição delegada:

- `delphi/apps/estoque/fmcadastroprodutosinventario.pas` e `.dfm` — modal de edição do item e grid de lotes.
- `delphi/apps/estoque/fmcopiarprodutosinventarios.pas` e `.dfm` — modal de seleção de inventários de origem para cópia.
- `delphi/biblio/clparametrossistema.pas` — propriedades de parâmetros efetivamente usadas pela tela.

As linhas abaixo referem-se ao estado atual dos arquivos no repositório. A classificação usada é:

- **CONFIRMADO** — comportamento diretamente demonstrado por código ou DFM.
- **INFERIDO** — consequência funcional razoável de evidências confirmadas, sem chamada explícita única.
- **DÚVIDA** — o fonte deixa mais de uma interpretação possível.
- **NÃO LOCALIZADO** — não há evidência no escopo pesquisado.
- **DIVERGENTE** — duas evidências do próprio legado não coincidem.
- **POSSÍVEL BUG LEGADO** — comportamento suspeito documentado sem corrigi-lo.

## Resumo funcional

**CONFIRMADO.** A tela é um cadastro de inventário com duas abas: `Parâmetros` e `Inventário`. A aba de parâmetros define o conjunto de produtos a gerar; a aba de inventário mostra os produtos selecionados, permite inclusão/exclusão por comandos e abre a edição detalhada do item em modal (`fmcadastroprodutosinventario`). Evidências: `fmcadastroinventario.dfm:28-39,616-619`; `fmcadastroinventario.pas:324-343`.

**CONFIRMADO.** O registro de inventário tem número, filial, situação, data do inventário, data de processamento e filtros persistidos no próprio registro. A situação legada é `A` = aberto, `P` = processado e `T` = transferido para outro inventário. Evidências: `dmcadastroinventario.pas:550-559,737-748`; `dmcadastroinventario.dfm:40-112`; `fmcadastroinventario.dfm:1914-2163`.

**CONFIRMADO.** Apenas inventário aberto habilita processamento, exclusão e manutenção de produtos; inventário processado torna campos e datasets somente leitura. Evidências: `fmcadastroinventario.pas:390-415`; `dmcadastroinventario.pas:1335-1363`.

**CONFIRMADO.** Processar gera movimentos de estoque, exige confirmação quando há produtos não inventariados, exige autorização de gerente de estoque e muda a situação para processado somente após as validações e persistência. Evidências: `dmcadastroinventario.pas:826-895,1224-1279`; `fmcadastroinventario.pas:423-431`.

## Interface, abas e controles

### Aba `Parâmetros`

**CONFIRMADO.** A aba tem o hint “Definição dos filtros para seleção de produtos” e contém:

- `LOCALIZAÇÃO`: texto livre `edtLocalizacao` (`fmcadastroinventario.dfm:56-84`).
- `FORNECEDOR`: `TfraConsultaCodigo`, pesquisa de fornecedores, tipo de cliente/fornecedor `F` (`fmcadastroinventario.dfm:97-154`; `fmcadastroinventario.pas:225-227`).
- `DESCRIÇÃO DE PRODUTOS`: texto parcial (`fmcadastroinventario.dfm:160-190`).
- `Produtos`: quatro checkboxes — `Em Linha`, `Fora de Linha`, `Inativo`, `Ativo` — todos marcados no DFM (`fmcadastroinventario.dfm:193-238`).
- `GRUPOS DE FORNECEDORES`: frame com lista e comandos para marcar/desmarcar (`fmcadastroinventario.dfm:242-285`).
- `TfraMultiplaSelecaoAleatoria`: frame composto com seleção de itens, produtos, grupos, classes, marcas, modelos, especificações, promoções, CST, CSOSN, listas padronizadas, localizações de estoque, lotes, marketplace, atributos e serviços (`fmcadastroinventario.dfm:295-593`).
- Dois comandos administrativos para incluir reservas/trânsito inconsistentes, ocultos inicialmente no DFM (`fmcadastroinventario.dfm:597-613`; visibilidade dinâmica em `fmcadastroinventario.pas:872-891`).

**CONFIRMADO.** Ao navegar para um inventário existente, os valores do registro são copiados para os controles: grupo de fornecedor, fornecedor/tipo, localização, descrição e os quatro indicadores de linha/atividade. As listas condicionais do frame são copiadas para variáveis de filtro antes da geração. Evidências: `fmcadastroinventario.pas:532-575`.

**CONFIRMADO.** O formulário não usa radio buttons nesta tela; o legado usa checkboxes para combinações de linha/atividade. A preferência por radio buttons é requisito de futura especificação, não comportamento Delphi confirmado.

### Aba `Inventário`

**CONFIRMADO.** A aba é a “Planilha de digitação do inventário” e contém o grupo `PRODUTOS`, comandos sobre produtos, grid principal, legenda de cores, importação e painel condicional de produtos com estoque negativo (`fmcadastroinventario.dfm:616-628,1424-1595,1597-1883`).

**CONFIRMADO.** O cabeçalho do inventário contém:

- `NÚMERO`: `TtecDbEditFind`, campo `numero`, máximo de 6 caracteres, não permite zero nem nulo; a pesquisa padrão é `pesINVENTARIO` e a pesquisa é feita pelo modal `TfraConsultaCodigo` criado em runtime (`fmcadastroinventario.dfm:1900-1954`; `fmcadastroinventario.pas:167-177`).
- `FILIAL`: frame `TfraConsultaCodigo`, pesquisa `pesFILIAIS`, código máximo de 4 caracteres, lookup pelo código e descrição da filial (`fmcadastroinventario.dfm:1957-2028`; `fmcadastroinventario.pas:178-179,516-523`).
- `SITUAÇÃO`: texto somente leitura baseado em `DescricaoSituacao`; exibe `ABERTO`, `PROCESSADO` ou `TRANSFERIDO P/ INVENTÁRIO Nº ...` (`fmcadastroinventario.dfm:2031-2064`; `dmcadastroinventario.pas:737-748`).
- `DATAS`: `edtData` ligado a `data` e `edtProcessamento` ligado a `processamento`, ambos componentes de data opcionais (`fmcadastroinventario.dfm:2068-2163`).

**CONFIRMADO.** Ao trocar de aba para `Inventário`, o foco vai para o número quando o dataset não está em edição; durante inclusão/edição vai para filial. Evidência: `fmcadastroinventario.pas:578-594`.

### Comandos visíveis

**CONFIRMADO.** Os comandos de produto estão associados a estes eventos e hints (`fmcadastroinventario.dfm:653-1114`):

| Controle | Ação observável | Evidência de execução |
|---|---|---|
| `sbnIncluirProduto` | Incluir produto | `fmcadastroinventario.pas:324-343` |
| `sbnExcluirProduto` | Excluir produto, com confirmação | `fmcadastroinventario.pas:354-358`; `dmcadastroinventario.pas:563-576` |
| `sbnGerarProdutosSemInventario` | Gerar produtos não inventariados, mas com estoque | `fmcadastroinventario.pas:433-439` |
| `sbnExcluirProdutosSemInventario` | Excluir produtos gerados nessa categoria | `fmcadastroinventario.pas:525-530`; `dmcadastroinventario.pas:1680-1727` |
| `sbnCopiarProdutos` | Copiar produtos de outro inventário | `fmcadastroinventario.pas:631-647`; `dmcadastroinventario.pas:1994-2045` |
| `sbnGerarProdutosParametros` | Gerar produtos conforme parâmetros | `fmcadastroinventario.pas:657-663` |
| `sbnVisualizarFoto` | Abrir imagem relacionada ao produto | `fmcadastroinventario.pas:1024-1028` |
| `sbnArquivo` | Selecionar/processar arquivo de importação | `fmcadastroinventario.pas:665-685` |
| `sbnProcessarArquivoImportacao` | Reprocessar o caminho já informado | `fmcadastroinventario.pas:703-715` |
| `sbnGerar` | Processar inventário | `fmcadastroinventario.pas:423-431`; DFM caption `Processar F8` em `fmcadastroinventario.dfm:2175-2237` |
| `sbnImprimir` | Visualizar relatório | DFM caption `Imprimir F7` em `fmcadastroinventario.dfm:2239-2283`; execução em `fmcadastroinventario.pas:505-514` |

Os ícones são bitmaps embutidos no DFM; o texto acessível/hint é a evidência confiável para a futura equivalência, não o bitmap em si.

## Identidade, defaults e validações

### Inclusão e chave primária

**CONFIRMADO.** A inclusão chama `qryInventario.Insert`; o número é obtido por `qryInventarioProximo`, que executa `select coalesce(max(numero),0)+1` (`dmcadastroinventario.pas:527-531,1673-1678`; `dmcadastroinventario.dfm:824-830`).

**CONFIRMADO.** Em `OnNewRecord`, o registro começa com situação `A`, data local, processamento igual à data do inventário e número atribuído. Evidência: `dmcadastroinventario.pas:550-559`.

**POSSÍVEL BUG LEGADO.** A numeração é calculada por `max(numero)+1`, não por uma operação atômica de sequência; concorrência pode produzir o mesmo próximo número. O código legado apenas confirma a estratégia, não define como resolver concorrência: `dmcadastroinventario.dfm:824-830`.

### Filial e datas

**CONFIRMADO.** Filial é um campo de cadastro ligado a `qryInventario.filial`, preenchido pelo frame de consulta; o nome da filial é copiado para o campo calculado/auxiliar `nomefilial`. Evidências: `fmcadastroinventario.dfm:1992-2019`; `fmcadastroinventario.pas:516-523`.

**CONFIRMADO.** A saída de `edtData` atualiza o estado dos botões e ajusta `edtProcessamento.Minimo` pela quantidade de dias entre hoje e a data do inventário; a saída de processamento também atualiza os botões. Evidências: `fmcadastroinventario.pas:492-497,742-748`.

**DÚVIDA.** Os componentes exibem `Minimo = 37353` no DFM (`fmcadastroinventario.dfm:1914-1939,2102-2163`), enquanto o código redefine apenas o mínimo de processamento no evento de saída de data. O significado histórico desse valor numérico e a validação final efetiva ficam delegados aos componentes/base e não estão explicitados nestes quatro arquivos.

**CONFIRMADO.** Gravar chama `CheckRequiredFields` no dataset do inventário, atribui número se ainda estiver em inclusão, vincula os produtos ao inventário e persiste inventário, produtos, lotes e inventários abertos por `Perpetrar`. Evidência: `dmcadastroinventario.pas:479-525`.

### Situação e somente leitura

**CONFIRMADO.** A situação `P` faz o inventário ficar somente leitura. Em situação `A` ou durante inclusão, filial, datas e datasets de produtos/lotes ficam editáveis; em outro estado, o valor de `SomenteLeitura` é aplicado aos campos. Evidência: `dmcadastroinventario.pas:401-402,1335-1363`.

**CONFIRMADO.** O botão `Processar F8` e o botão de exclusão do inventário só ficam habilitados para situação `A`. Inclusão/exclusão de produtos exige também inventário não vazio, filial, data e processamento preenchidos. Evidência: `fmcadastroinventario.pas:390-415`.

## Fluxo temporal observável

1. **Criar formulário/data module.** O formulário cria `TdtmCadastroInventario`, configura datasets, pesquisas, visibilidade das colunas de grade e recupera o último caminho de importação (`fmcadastroinventario.pas:167-243,649-655`; `fmcadastroinventario.dfm:1-39`).
2. **Pesquisar inventário.** Clique em procurar ou F9 chama `ConsultaInventario.InternoPesquisar(ctINVENTARIOESTOQUE)`. Ao encontrar, o número é atribuído, `qryInventario` é reaberto, a aba muda para `Inventário` e os botões são recalculados (`fmcadastroinventario.pas:156-165,287-320`).
3. **Selecionar/incluir.** Inclusão usa o fluxo herdado e, se autorizada pelo fluxo base, chama `IncluirInventario`; `OnNewRecord` aplica defaults (`fmcadastroinventario.pas:276-285`; `dmcadastroinventario.pas:527-559`).
4. **Definir parâmetros.** O usuário preenche controles/listas; `AtribuirListas` transfere os valores para o dataset/variáveis antes de gerar produtos (`fmcadastroinventario.pas:549-575`).
5. **Gerar produtos.** O comando usa filtros e executa `qryEstoques`; em seguida reabre produtos e lotes e atualiza a ordenação (`dmcadastroinventario.pas:1366-1533`; `fmcadastroinventario.pas:433-439,657-663`).
6. **Digitar/editar item.** Inclusão, duplo clique ou atalhos do grid abrem `TfrmCadastroProdutosInventario` modal com o dataset de produtos (`fmcadastroinventario.pas:324-343,360-377`).
7. **Salvar item.** O modal valida produto/quantidade e, se houver lotes, exige que a quantidade total dos lotes feche com a quantidade inventariada; então grava o produto e o inventário (`fmcadastroprodutosinventario.pas:435-471`; `dmcadastroinventario.pas:578-601`).
8. **Excluir item.** O comando pede confirmação, remove lotes do item, remove o produto e grava o inventário (`dmcadastroinventario.pas:563-576`).
9. **Processar.** O F8 verifica limite de dias, movimentações posteriores, quantidade não inventariada, autorização, gera movimentos de entrada/saída e, se não houver diferença após processamento, marca o inventário como `P` (`dmcadastroinventario.pas:826-895,923-1222,1224-1279`).
10. **Imprimir.** O F7 oculta o grid principal durante a montagem/visualização do relatório e restaura sua visibilidade no `finally` (`fmcadastroinventario.pas:505-514`).
11. **Reabrir/trocar registro.** Scroll do inventário fecha o painel de negativos, atualiza inventários abertos, reabre produtos/lotes quando necessário e repassa filtros aos controles (`dmcadastroinventario.pas:809-824`; `fmcadastroinventario.pas:532-547`).

## Filtros e geração de produtos

**CONFIRMADO.** `GerarProdutosNaoIdentificados` não inclui produtos já presentes no inventário e aceita os seguintes filtros: item/produto/grupo/classe/marca/promoção, grupo de fornecedor, fornecedor, localização, descrição, linha/fora de linha, ativo/inativo e produtos compostos. A fonte distingue estoque atual da fotografia anterior conforme a data do inventário e pode limitar aos produtos com saldo. Evidência: `dmcadastroinventario.pas:1366-1518`.

**CONFIRMADO.** Se a data do inventário for a data local, a geração usa `qryEstoques_Atual`; caso contrário usa `qryEstoques_Anterior` com data parametrizada. `SomenteComEstoque` injeta condição de soma não nula. Evidência: `dmcadastroinventario.pas:1389-1418`.

**CONFIRMADO.** A seleção de produto no modal exclui produtos já selecionados, preserva o produto em edição, respeita filtros condicionais e pode excluir produtos compostos quando `ParSistema.Inventariar_Produtos_Compostos` for falso (`fmcadastroprodutosinventario.pas:138-178`).

**CONFIRMADO.** A localização textual separada por vírgulas é convertida em lista de literais para o macro SQL (`dmcadastroinventario.pas:1729-1754`).

**POSSÍVEL BUG LEGADO.** O filtro de geração é montado por macros e concatenação de expressões SQL, inclusive listas vindas de frames e localização (`dmcadastroinventario.pas:1371-1386,1424-1477`; `fmcadastroprodutosinventario.pas:145-156`). A futura especificação deve transformar isso em filtros tipados e parametrizados; não reproduzir concatenação SQL.

**POSSÍVEL BUG LEGADO / RISCO DE PERFORMANCE.** A consulta de produtos e as consultas de estoque/lotes possuem várias subconsultas escalares repetidas por produto e leituras do último movimento (`dmcadastroinventario.dfm:140-627,834-1055,4088-4689`). Esta evidência pertence ao levantamento do SQL; a migração deve usar consulta set-based e evitar N+1, preferindo `IN`, `= ANY(array)` ou `unnest` quando o caso exigir coleção.

**REGRA DE ESPECIFICAÇÃO, NÃO FATO DELPHI.** Ao reescrever joins, só usar `LEFT JOIN` quando a relação for opcional; se os campos/relações envolvidos forem obrigatórios e `NOT NULL`, usar `INNER JOIN`. Não adicionar testes de driver, `hasTable` ou introspecção de schema em runtime.

## Edição de produto e lotes

**CONFIRMADO.** O modal de produto apresenta quantidade inventariada editável, consulta de produto, descrição, sequência e indicadores de estoque/reserva/trânsito/diferença/demonstração/conserto/danificada/reserva prévia como informação de apoio. Evidência visual: `fmcadastroprodutosinventario.dfm:47-571`.

**CONFIRMADO.** Ao localizar o produto, o modal preenche produto interno/visual/digitado, descrição, grades, linha, coluna, controle de lote/validade e reatribui saldos e lotes. Evidência: `fmcadastroprodutosinventario.pas:494-530`.

**CONFIRMADO.** Para produto que gerencia lote/validade, a tela habilita o grupo de lotes, valida campos obrigatórios e exige igualdade entre quantidade inventariada e total dos lotes antes de gravar. Evidências: `fmcadastroprodutosinventario.pas:435-464,671-685,1045-1050`; `dmcadastroinventario.pas:2297-2406`.

**CONFIRMADO.** No grid de lotes, `nrlote` é escolhido via frame/modal de consulta; campos numéricos usam editor de float. Ctrl+F9 no campo de lote abre a pesquisa padrão de lotes. Evidências: `fmcadastroprodutosinventario.pas:734-760,922-949`; `fmcadastroprodutosinventario.dfm:1460-1996`.

**CONFIRMADO.** O usuário inclui lote por botão ou Ctrl+Insert, exclui o lote pelo botão, e o grid de lotes não permite adição automática sem passar pelo comando de inclusão. Evidências: `fmcadastroprodutosinventario.pas:963-1000`; `fmcadastroprodutosinventario.dfm:1480-1486`.

**CONFIRMADO.** O grid de totais de lotes soma quantidade, estoque, reserva, trânsito, movimentado, diferença, demonstração, conserto, danificada e reserva prévia; a máscara decimal usa `ParSistema.QtCasasDecimaisQuantidade`. Evidências: `fmcadastroprodutosinventario.pas:687-703,914-920`; `dmcadastroinventario.pas:428-450`.

## Grid principal: colunas, edição, ordenação e cores

**CONFIRMADO.** `dbgProdutosInventario` é ligado a `dsrInventarioProduto`, declara `ReadOnly = True`, não permite exclusão pelo próprio grid, permite ordenação (`DenySort = False`) e não exibe número de linha. Evidência: `fmcadastroinventario.dfm:1117-1160`.

**CONFIRMADO.** As colunas, na ordem do DFM, são:

1. `sequencia` — `Nº`;
2. `produtodigitado` — `CÓDIGO`;
3. `descricao` — `DESCRIÇÃO`;
4. `gerenciarloteevalidade` — indicador de controle de lote/validade;
5. `valorgrade1` — `LINHA`;
6. `valorgrade2` — `COLUNA`;
7. `localizacao` — `LOCALIZAÇÃO`;
8. `sublocalizacao` — `SUBLOCALIZAÇÃO`;
9. `quantidade` — `INVENTÁRIO`;
10. `emestoque` — `ESTOQUE`;
11. `reservado` — `RESERVA`;
12. `reservaprevia` — `RESERVA PRÉVIA`;
13. `transito` — `TRÂNSITO`;
14. `diferenca` — `DIFERENÇA`;
15. `movimentado` — `MOVIMENTADO`;
16. `saldoaposprocessamento` — `SALDO APÓS PR.`;
17. `demonstracao` — `DEMONSTRAÇÃO`;
18. `conserto` — `CONSERTO`;
19. `danificada` — `DANIFICADA`.

Evidências: `fmcadastroinventario.dfm:1164-1421`.

**CONFIRMADO.** A edição não ocorre digitando diretamente no grid principal: duplo clique ou Ctrl+tecla de editar abre o modal; Ctrl+tecla de inserir abre um item novo. Evidências: `fmcadastroinventario.pas:360-377`.

**CONFIRMADO.** As colunas de grade e lotes usam a máscara de quantidade do sistema; as colunas de grade 1/2 ficam visíveis somente quando `ParSistema.UsarGradesProdutos` é verdadeiro e seus títulos são renomeados para `Linha`/`Coluna` conforme o produto selecionado. Evidências: `fmcadastroinventario.pas:187-221,345-350`; `dmcadastroinventario.pas:428-450,685-693`; `clparametrossistema.pas:1428-1429,7488-7495`.

**CONFIRMADO.** A ordem inicial dos itens é recalculada pelo campo `sequencia` descendente para obter a próxima sequência, e o componente é instruído a refazer a ordenação; ordenações manuais não são proibidas. Evidências: `dmcadastroinventario.pas:609-652`; `fmcadastroinventario.dfm:1144-1158`.

**CONFIRMADO.** A tela salva propriedades do formulário (`SalvarPropriedadesFormulario := true`), mas não há, nos quatro arquivos, um contrato explícito de quais propriedades são persistidas. Evidência: `fmcadastroinventario.pas:237-243`.

**CONFIRMADO.** Cores/legenda:

- produtos marcados pelo sistema aparecem em azul;
- a coluna de índice `11` é pintada de vermelho;
- saldo negativo posterior deixa a linha em negrito e, se também marcada pelo sistema, azul/negrito;
- produto alterado após a inclusão recebe fundo `$00A4A4FF`;
- a legenda mostra azul = “PRODUTOS NÃO INVENTARIADOS, MAS COM ESTOQUE” e vermelho = “PRODUTOS MOVIMENTADOS APÓS A INCLUSÃO”.

Evidências: `fmcadastroinventario.pas:441-479`; `fmcadastroinventario.dfm:1424-1478`.

**POSSÍVEL BUG LEGADO.** A cor vermelha é aplicada por `column.Index = 11`, em vez de pelo nome do campo; no DFM o índice 11 corresponde à coluna `reservaprevia`, enquanto a legenda fala de produto movimentado após a inclusão. A intenção visual pode depender de índices históricos ou estar deslocada. Evidências: `fmcadastroinventario.pas:449-455`; `fmcadastroinventario.dfm:1311-1322,1360-1368`.

**NÃO LOCALIZADO.** Não há totalizador explícito no grid principal, nem configuração de exportação nesse DFM. Totalizadores foram localizados somente no grid de totais de lotes (`fmcadastroprodutosinventario.pas:687-703`). Personalização de colunas e exportação podem ser capacidades herdadas do `TtecDBGrid`, mas não são demonstradas pelo escopo consultado.

## Importação

**CONFIRMADO.** O grupo `ARQUIVO PARA IMPORTAÇÃO` exibe caminho, botão `Arquivo` e botão para processar (`fmcadastroinventario.dfm:1487-1595`). O caminho é recuperado/salvo em arquivo INI na chave `Outros/CaminhoArquivoImportacaoInventario` (`fmcadastroinventario.pas:687-734`).

**CONFIRMADO.** O arquivo é lido linha a linha como CSV separado por vírgula; cada linha exige código e quantidade. Códigos alfanuméricos dependem de `ParSistema.PermitirProdutoAlfanumerico`; sem isso o código deve conter somente números. Quantidade inválida cancela a importação com mensagem. Evidências: `dmcadastroinventario.pas:2056-2136`; `clparametrossistema.pas:1466-1467,4819-4828`.

**CONFIRMADO.** Linhas repetidas do mesmo código são acumuladas. Produto já presente tem a quantidade somada; produto novo é incluído e recebe dados da consulta padrão de produto, saldos e grades. Evidência: `dmcadastroinventario.pas:2122-2189`.

**CONFIRMADO.** Ao concluir, o arquivo é renomeado para `.old`; se não for possível, é lançada exceção. Evidência: `fmcadastroinventario.pas:671-682`.

**POSSÍVEL BUG LEGADO.** O componente usado para seleção é `TSaveDialog` (`fmcadastroinventario.dfm:2286-2291`), embora o fluxo leia um arquivo existente. A futura interface deve usar um seletor de abertura de arquivo, mantendo o comportamento de reprocessamento e arquivamento apenas se isso for uma decisão explícita.

## Geração, cópia e exclusão especial

**CONFIRMADO.** “Produtos não inventariados, mas com estoque” pode ser gerado apenas com saldo (`SomenteComEstoque = true`) ou sem essa restrição (`false`). A remoção exige confirmação e apaga registros marcados pelo sistema via SQL de exclusão; depois a lista é reaberta. Evidências: `fmcadastroinventario.pas:433-439,525-530`; `dmcadastroinventario.pas:1366-1418,1680-1695`; `dmcadastroinventario.dfm:2364-2381`.

**CONFIRMADO.** O comando de copiar consulta inventários abertos da filial; se não houver, mostra “Não existem inventários em aberto nesta filial”. O modal permite selecionar inventários, e a cópia soma quantidade de produto já existente ou inclui produto novo; o inventário de origem é marcado como transferido para o inventário atual. Evidências: `fmcadastroinventario.pas:631-647`; `dmcadastroinventario.pas:1941-2045`; `fmcopiarprodutosinventarios.pas:57-105`.

**CONFIRMADO.** Após processamento, a consulta de movimentos negativos posteriores pode exibir o painel `PRODUTOS COM ESTOQUE NEGATIVO`, com grid somente leitura de data, estoque, reservado e reserva prévia. O checkbox filtra os produtos principais por `possuisaldonegativoposteriormente`; os comandos permitem excluir ou copiar itens. Evidências: `fmcadastroinventario.pas:597-629`; `fmcadastroinventario.dfm:1597-1880`; `dmcadastroinventario.pas:1764-1859,1861-1939`.

**CONFIRMADO.** Os comandos especiais para incluir reservas prévias/futuro inconsistentes só ficam visíveis quando o usuário é administrador, a situação é aberta e ainda não há produtos. Eles exigem a tela de verificação de reservas aberta, criam movimentos de ajuste e geram produtos novamente. Evidências: `fmcadastroinventario.pas:750-870,895-1022`.

## Processamento e autorização

**CONFIRMADO.** Antes de processar, o código:

- bloqueia processamento além de `ParSistema.LimitedeDiasParaProcessamentoInventario` quando o limite é diferente de zero;
- impede processamento se existirem produtos movimentados após inclusão/alteração;
- confirma que produtos não inventariados serão zerados;
- solicita autorização.

Evidências: `dmcadastroinventario.pas:833-879`; parâmetro em `clparametrossistema.pas:1574,6928-6937`.

**CONFIRMADO.** Se o usuário atual é gerente de estoque, a autorização usa senha; caso contrário usa login com exigência de gerente de estoque/autorizado. Sem autorização, exibe `ctUSUARIOSEMPERMISSAO`. Evidência: `dmcadastroinventario.pas:884-895,1212-1217`.

**CONFIRMADO.** O processamento gera movimentos `IE+` para diferença positiva e, para diferença negativa, pode gerar `IE-`, `IR-` e `IP-`, abatendo estoque/reserva/reserva prévia; para lotes aplica a mesma lógica informando o lote. Evidências: `dmcadastroinventario.pas:931-1049,1066-1193`.

**CONFIRMADO.** Se houver diferença após processar, é exibida mensagem, ocorre rollback e a situação volta a `A`; sem diferença, atualizações adicionais são persistidas e `SomenteLeitura` é ativado. Evidência: `dmcadastroinventario.pas:1233-1279`.

**NÃO LOCALIZADO.** Os quatro arquivos não demonstram autorização específica para gravar, excluir ou incluir produto além das regras herdadas e da autorização explícita do processamento. Também não demonstram o cadastro de `acessosmodulos`, menu/breadcrumb ou matriz de permissões; esses pontos devem ser resolvidos em ticket próprio, sem inferir que “gerente de estoque” seja a permissão do módulo.

## Mensagens observáveis

Mensagens relevantes confirmadas:

- confirmação de exclusão de inventário: `dmcadastroinventario.pas:464-476`;
- confirmação de exclusão de produto: `dmcadastroinventario.pas:563-575`;
- limite de dias de processamento: `dmcadastroinventario.pas:833-840`;
- movimentações posteriores exigindo revisão: `dmcadastroinventario.pas:850-859`;
- confirmação de zerar itens não inventariados: `dmcadastroinventario.pas:874-879`;
- usuário sem permissão: `dmcadastroinventario.pas:1212-1217`;
- diferenças pós-processamento e itens em negrito: `dmcadastroinventario.pas:1242-1248`;
- inventário sem filial: `fmcadastroinventario.pas:862-868,1014-1020`;
- inventários abertos inexistentes para cópia: `fmcadastroinventario.pas:634-645`;
- arquivo inexistente: `fmcadastroinventario.pas:703-713`;
- código/quantidade inválidos na importação: `dmcadastroinventario.pas:2102-2117`;
- produto não cadastrado na importação: `dmcadastroinventario.pas:2160-2164`;
- lote/quantidade não fechando: `fmcadastroprodutosinventario.pas:451-464`;
- lote duplicado: `fmcadastroprodutosinventario.pas:850-870`.

## Atalhos e pesquisa

**CONFIRMADO.** No formulário principal:

- F9 pesquisa inventário pelo modal padrão `TfraConsultaCodigo` (`fmcadastroinventario.pas:287-300,316-322`).
- F7 chama impressão/visualização (`fmcadastroinventario.pas:302-306`).
- F8 chama processamento (`fmcadastroinventario.pas:308-312`).
- Ctrl+atalho de editar/inserir no grid abre o modal de produto (`fmcadastroinventario.pas:368-377`).

**CONFIRMADO.** No modal de produto, Ctrl+F9 no campo de lote chama a pesquisa de lote pelo frame padrão (`fmcadastroprodutosinventario.pas:922-949`).

**NÃO LOCALIZADO.** Não há tratamento explícito de F6/VK_F6 nos quatro arquivos nem nos dois modais referenciados pesquisados. Também não há botão de cancelar disponibilizado por esses handlers no início de uma consulta, nem chamada explícita de cancelamento de query; o único callback de progresso localizado apenas repassa `Cancel` a `ShowProgress` (`dmcadastroinventario.pas:1756-1762`). A exigência futura de F6 cancelável deve ser especificada como contrato Laravel, não descrita como paridade existente.

**DÚVIDA.** O F5 do salvar e outros comandos herdados vêm de `TfrmCadastroPadrao`, mas a unidade ancestral não foi necessária para identificar os fluxos específicos deste ticket; portanto, o texto exato/atalho de salvar herdado não é afirmado aqui.

## Impressão e relatórios

**CONFIRMADO.** O data module possui `TfrReport frpInventario`, datasets FastReport para inventário/produtos e um segundo `TfrxReport`. O relatório legado usa título `LEVANTAMENTO DE INVENTÁRIO`, prepara produtos/lotes, exibe o relatório composto em preview modal e aplica zebra nas linhas. Evidências: `dmcadastroinventario.pas:1612-1671`; `dmcadastroinventario.dfm:1714-1729,2357-2360,6092-6101`.

**DÚVIDA.** `ImprimirInventario` chama `DesignReport` tanto de `frpInventario` como de `frxReport1`, mas adiciona somente `frpInventario` ao `frCompositeReport` mostrado (`dmcadastroinventario.pas:1619-1652`). Não foi decidido se o segundo relatório é legado não utilizado ou se há uma etapa externa não visível.

**NÃO LOCALIZADO.** Não há F6 para geração de relatório, nem evidência de que o relatório use exatamente o leiaute do grid principal; o relatório é uma saída FastReport própria. A regra de futura paridade deve exigir F6 e leiaute equivalente ao grid, mas não atribuí-la ao Delphi.

## Parâmetros de sistema observados

**CONFIRMADO.** A tela acessa estes parâmetros por `ParSistema`:

| Propriedade | Efeito observado | Evidência |
|---|---|---|
| `MascaraQuantidadeGrade` | formato de quantidades dos datasets | `dmcadastroinventario.pas:428-450`; implementação da máscara em `clparametrossistema.pas:7849-7866` |
| `TamanhoMascaraQuantidade` | largura mínima das colunas numéricas | `fmcadastroinventario.pas:190-221` |
| `UsarGradesProdutos` | visibilidade de Linha/Coluna | `fmcadastroinventario.pas:187-188`; `clparametrossistema.pas:7488-7495` |
| `PermitirProdutoAlfanumerico` | largura/código do produto e validação de importação | `fmcadastroinventario.pas:229-232`; `dmcadastroinventario.pas:2099-2108`; `clparametrossistema.pas:4819-4828` |
| `ValordaQuantidade` | foco inicial do modal de produto | `fmcadastroprodutosinventario.pas:381-384,473-485` |
| `QtCasasDecimaisQuantidade` | formato dos floats no grid de lotes | `fmcadastroprodutosinventario.pas:395-408,914-920` |
| `LimitedeDiasParaProcessamentoInventario` | bloqueio temporal do F8 | `dmcadastroinventario.pas:833-840`; `clparametrossistema.pas:6928-6937` |
| `Inventariar_Produtos_Compostos` | inclui/exclui produtos compostos na seleção/geração | `dmcadastroinventario.pas:1515-1518`; `fmcadastroprodutosinventario.pas:165-174`; `clparametrossistema.pas:6337-6346` |

**NÃO LOCALIZADO.** Não há chamada direta a `parametros_valor('', '')` nos quatro arquivos alvo ou nos dois modais referenciados. O acesso Delphi observado é a propriedade `ParSistema`; o mapeamento dessa propriedade para nomes literais de `parametros`/`parametros_valor` deve ser resolvido no ticket de parâmetros, sem inventar nomes no prompt desta pesquisa.

## Ordem e regras para futura especificação Laravel

Os itens a seguir são requisitos de handoff, não afirmações de que o Delphi já os implemente:

1. Preservar a ordem temporal: criar/abrir inventário → definir parâmetros → gerar produtos → editar produtos/lotes → salvar → processar → imprimir/consultar inconsistências.
2. Fazer F6 iniciar a consulta/relatório e mostrar cancelamento imediatamente, com cancelamento real da operação no banco; o Delphi pesquisado não fornece essa paridade.
3. Usar o modal de pesquisa padrão para F9 e para produto/filial/lote, preservando seleção e descrição.
4. No grid Laravel, manter ordenação, personalização, exportação e colunas do padrão do projeto; distinguir edição do registro por modal da visualização somente leitura do grid principal.
5. Modelar `quantidade` e lotes com validação transacional de fechamento; impedir persistência parcial de inventário processado.
6. Reescrever filtros como parâmetros tipados, sem concatenar listas SQL. Para coleções, preferir uma consulta set-based com `IN`, `= ANY(array)` ou `unnest`, evitando N+1.
7. Ao escolher joins, usar `INNER JOIN` para relações obrigatórias comprovadamente `NOT NULL`; reservar `LEFT JOIN` para opcionais.
8. Armazenar schema autoritativo/versionado das tabelas usadas, fora do caminho de runtime; não testar driver e não usar `hasTable`/`Schema::has*`.
9. Especificar autorização separadamente para visualizar, gravar, excluir, gerar produtos, processar e imprimir. A única autorização explícita encontrada aqui é a do processamento.
10. Usar breadcrumb padrão do Laravel.

## Lacunas e divergências para tickets seguintes

| Classificação | Lacuna/divergência | Evidência |
|---|---|---|
| NÃO LOCALIZADO | menu, breadcrumb e `acessosmodulos` | nenhum dos quatro arquivos contém cadastro de menu/acesso; ticket de autorização/menu |
| NÃO LOCALIZADO | F6 e cancelamento de consulta | busca de handlers nos quatro arquivos e modais; `dmcadastroinventario.pas:1756-1762` só mostra progresso |
| NÃO LOCALIZADO | exportação e totalizador do grid principal | `fmcadastroinventario.dfm:1117-1421` não declara esses recursos |
| DÚVIDA | escopo exato do segundo FastReport | `dmcadastroinventario.pas:1619-1652` |
| POSSÍVEL BUG LEGADO | `SaveDialog` para escolher arquivo de importação | `fmcadastroinventario.dfm:2286-2291` |
| POSSÍVEL BUG LEGADO | cor por índice 11 potencialmente desalinhada da legenda | `fmcadastroinventario.pas:449-455`; `fmcadastroinventario.dfm:1311-1368` |
| POSSÍVEL BUG LEGADO | `max(numero)+1` sob concorrência | `dmcadastroinventario.dfm:824-830` |
| DIVERGENTE | legenda sugere produto movimentado, mas cor vermelha usa índice de coluna sem nome | `fmcadastroinventario.pas:449-479`; `fmcadastroinventario.dfm:1311-1368` |

## Limites desta resolução

Não foram implementados Laravel, migrations, endpoints, policies, componentes React, SQL de produção, schema versionado ou alterações no Delphi. Não foram resolvidos os tickets de SQL/parâmetros, autorização/menu, padrões Laravel, schema ou consolidação de prompts. O agente futuro deve usar este artefato como evidência e não deve pedir ao usuário para reabrir diretamente os fontes Delphi.
