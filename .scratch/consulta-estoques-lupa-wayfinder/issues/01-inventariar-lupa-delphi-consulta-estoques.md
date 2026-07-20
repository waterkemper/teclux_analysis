Type: task
Status: resolved
Blocked by:

## Question

Qual é o contrato completo da lupa de Produto usada especificamente pela Consulta de Estoques no Delphi: qual componente e tipo de pesquisa a acionam, quais units/datasets constroem a busca, qual SQL efetivo e seus parâmetros/macros/joins, quais filtros e ordenações aceita, quais colunas ficam disponíveis ou visíveis com títulos e formatos, quais valores são calculados — especialmente Filial, Saldo de Estoque e preço de venda —, quais permissões/configurações alteram o resultado e quais campos retornam à tela após a seleção?
## Answer

### Conclusão

A Consulta de Estoques usa deliberadamente uma pesquisa diferente da lupa genérica de Item de Produto. No construtor da tela, o frame de seleção múltipla recebe:

`TipoPesquisa := pesItemProdutosConsulta`.

Esse tipo é roteado pelo framework para `qryConsultaEstoqueItemProdutos`, uma query enriquecida por Produto + Filial. A grade da lupa mostra identidade do Produto, Grade, Filial, mnemônico, estoques, pedidos, preços, referência, código de barras, peso, situação, comissões e, conforme configuração, Modelos/Especificações.

Ao confirmar uma linha, porém, o framework consulta novamente o dataset genérico `qryProcuraItemProdutos` usando apenas `codigovisual`. O filtro da Consulta de Estoques recebe o código visual e a descrição concatenada. **Filial, estoque, pedidos, preços e comissões são contexto para decidir; não fazem parte do valor selecionado.**

### Encadeamento dos componentes

1. `TfrmConsultaEstoque` contém o frame de seleção múltipla de Item de Produto.
2. `TfraSelecaoAleatoriaItemdeProdutos` cria internamente `TfraConsultaCodigo`.
3. O frame nasce como `pesITEMPRODUTOS`, mas a tela substitui por `pesItemProdutosConsulta`.
4. Duplo clique/atalho aciona `InternoPesquisar(''Item de Produto'')`.
5. `TfraConsulta.TabelaDePesquisa` associa `pesItemProdutosConsulta` a `qryConsultaEstoqueItemProdutos`.
6. `TfrmConsultaBasica` monta a grade e considera pesquisável todo campo visível de tipo textual, numérico ou data.
7. Ao selecionar, `TfraConsulta.Selecionar` refaz `qryProcuraItemProdutos` por `produtovisual`.
8. O callback do frame grava na regra múltipla:
   - `codigo` = código visual;
   - `descricao` = descrição concatenada do Produto;
   - default `campo = codigo`;
   - default `opcomparacao = = Igual a`;
   - default `oplogico = ou`.

O bloco alternativo específico para `pesItemProdutosConsulta` no callback está comentado. O trecho ativo é comum e continua lendo o dataset genérico após a seleção. Portanto, não existe retorno de Filial/estoque/preço para a regra.

### Query efetiva da lupa

Fonte principal:

- `estoques e`;
- `produtos p`;
- `caracteristicas c`;
- `grupos g`;
- `filiais f`;
- subquery de full-text baseada em `p.busca`.

Junções:

- `e.produto = p.codigo`;
- `p.caracteristica = c.codigo`;
- `c.grupo = g.codigo`;
- `e.filial = f.codigo`.

A unidade normal da linha é **Produto + Filial**. Um Produto com registros em várias Filiais aparece várias vezes, salvo configuração especial descrita adiante.

Projeção conceitual:

- descrição composta = descrição + valor da Grade 1 + valor da Grade 2 + referência;
- código interno e código visual;
- código de barras agregado por função;
- Filial e mnemônico;
- Em estoque, Reservado, Futuro;
- estoque em Pedidos;
- preço normal e preço promocional;
- peso;
- data de inatividade efetiva de Produto/Característica;
- comissão de Grupo e Produto e seus tipos;
- Modelos e Especificações agregados;
- sequência para ordenar FilialBase primeiro;
- ranks de pesquisa avançada.

`avancado` é projetado externamente como texto nulo. Ele existe para oferecer uma coluna/campo virtual que dispara full-text; não contém dado exibível por linha.

### Colunas disponíveis na grade

Por padrão, todos os campos persistentes abaixo são visíveis, exceto os explicitamente marcados como ocultos ou desligados dinamicamente.

| Ordem | Campo | Título | Largura/formato | Visibilidade/regra |
|---:|---|---|---|---|
| 1 | `descricao` | Descrição | largura 30 | visível e pesquisável |
| 2 | `valorgrade1` | Linha | largura 8 | somente se `UsarGradesProdutos` |
| 3 | `valorgrade2` | Coluna | largura 8 | somente se `UsarGradesProdutos` |
| 4 | `filial` | Fil. | largura 3, formato `0` | somente quando Filiais não são independentes |
| 5 | `modelos_agg` | Modelos | largura 10 | somente se liberada visualização de Modelos |
| 6 | `especificacoes_agg` | Especificações | largura 10 | mesma regra de Modelos |
| 7 | `mnemonico` | Mne. | largura 8 | visível |
| 8 | `emestoque` | Est. | largura 8, `0.00` | visível |
| 9 | `reservado` | Res. | largura 8, `0.00` | visível |
| 10 | `futuro` | Fut. | largura 8 | visível |
| 11 | `pedidos_estoquepedido` | Pedidos | largura 8 | visível |
| 12 | `preco_normal` | Preço Normal | largura 9 | visível |
| 13 | `preco_promocao` | Preço Promoção | largura 9 | visível |
| 14 | `referencia` | Referência | largura 10 | visível |
| 15 | `codigo` | Código | — | **oculto**; ID interno |
| 16 | `codigovisual` | Código | largura 15 | visível |
| 17 | `codigobarras` | Código de Barras | largura 12 | visível |
| 18 | `peso` | Peso Prod. | largura 8, `###,##0.0000` | somente se liberado por parâmetro |
| 19 | `inativo` | Inativo | largura 8, data | visível; também governa Ativos/Inativos |
| 20 | `comissao_grupo` | Comiss.Grupo | largura 5 | visível, valor formatado com tipo |
| 21 | `comissao_produto` | Comiss.Prod. | largura 5 | visível, valor formatado com tipo |
| 22 | `tipocomissao_grupo` | — | — | **oculto**, suporte à formatação |
| 23 | `tipocomissao_produto` | — | — | **oculto**, suporte à formatação |
| 24 | `avancado` | Avançado | largura 10 | visível/pesquisável, valor nulo por linha |

Comissões diferentes de zero são exibidas com sufixo `V` quando o tipo é valor; nos demais casos, `P`. A grade colore as colunas de comissão, mas cor é detalhe incidental e não contrato de dados.

### Campos pesquisáveis e semântica

O framework permite pesquisar qualquer campo visível de tipo string, inteiro, float, currency ou data. Logo, a disponibilidade acompanha a visibilidade dinâmica acima.

Regras específicas em `ExisteEstoqueItemProduto`:

| Campo escolhido | Semântica |
|---|---|
| `codigovisual` ou `codigobarras` | prefixo sobre ID interno convertido, código visual e códigos de barras; se habilitado, também código do Produto no Cliente |
| `descricao` | prefixo normalizado sobre descrição + Grades + referência |
| `valorgrade1` / `valorgrade2` / `referencia` | prefixo normalizado no campo de Produto |
| `filial` / `emestoque` / `reservado` / `futuro` | comparação textual por prefixo sobre campo de estoque |
| `peso` | comparação textual por prefixo |
| `modelos_agg` | prefixo sobre descrição de Modelo relacionado à Característica |
| `especificacoes_agg` | prefixo sobre Especificação de Modelo relacionada |
| `comissao_produto` / `comissao_grupo` | igualdade numérica |
| `preco_normal` / `preco_promocao` | igualdade numérica pelas funções de preço |
| `pedidos_estoquepedido` | igualdade numérica pela função de Pedidos |
| `avancado` | full-text em `p.busca`, ordenado por ranks |
| `mnemonico` / `inativo` | aparecem pesquisáveis pelo framework, mas não possuem branch específico no compilador; a busca tende a manter/usar condição anterior ou falhar em produzir filtro coerente |

A ausência de tratamento explícito para Mnemônico e Inativo é um possível bug legado, não uma regra a copiar.

### Pesquisa de identidade

Código/código de barras usa busca por prefixo, normalizada sem acentos:

- ID interno convertido em texto;
- `p.codigovisual`;
- `produtoscodigobarras.codigobarras`;
- opcionalmente `clientesprodutos.produto_cliente` quando `PesquisarProdutonoCliente` está ativo.

O fragmento de Produto no Cliente não limita Cliente/tipo no trecho observado; pode encontrar códigos de qualquer Cliente. Além disso, a concatenação de condições `AND/OR` não envolve todo o bloco em parênteses. Isso pode enfraquecer condições posteriores de Filial por precedência SQL. Ambos são riscos, não paridade desejada.

### Pesquisa avançada

A coluna virtual **Avançado** envia o texto como parâmetro `textopesquisa` e aplica full-text em `p.busca` com `plainto_tsquery(converte_texto(...))`. A ordenação passa a:

1. encontrou rank;
2. rank exato/compacto;
3. rank OR.

Nas demais pesquisas, a ordenação padrão é:

1. descrição normalizada sem acentos;
2. Grade 1;
3. Grade 2;
4. sequência;
5. mnemônico da Filial.

`sequencia` vale zero para FilialBase e o código da Filial para as demais; portanto, dentro do mesmo Produto/descrição, a FilialBase tende a aparecer primeiro.

### Estados Ativos/Inativos

A janela exibe seletor:

- ATIVOS, default;
- INATIVOS;
- AMBOS.

O filtro ocorre em memória após abrir o dataset:

- ativo quando `inativo` é nulo ou posterior à data do servidor;
- inativo quando a data é menor ou igual à data do servidor;
- ambos não filtra.

`inativo` é `coalesce(p.inativo, c.inativo)`.

### Regras de Filial

Há três comportamentos:

#### Operação normal, Filiais não independentes

A query retorna uma linha por Produto + Filial de `estoques`. A coluna Filial fica visível. A função de callback que deveria parametrizar a lupa com a Filial selecionada na Consulta de Estoques está inteiramente comentada; portanto, a lupa não é limitada pelo campo Filial da tela.

#### Filiais independentes

A macro acrescenta Filial igual à FilialBase efetiva, ou FilialBase da virtual quando a Filial é virtual. A coluna Filial fica oculta.

#### Parâmetro de pesquisa consolidada

Quando `Pesquisa_do_produto_por_filial_base_e_com_soma_total_do_estoque` está ativo **e** o tipo é `pesItemProdutosConsulta`:

- a query mantém somente a linha da FilialBase;
- `emestoque` vira a soma de `emestoque` em todas as Filiais do Produto;
- `reservado`, `futuro`, Pedidos e preços continuam vindos da FilialBase.

Isso mistura estoque global com outros valores da FilialBase na mesma linha. É comportamento confirmado, mas precisa de decisão explícita; não se deve inferir que todos os saldos são consolidados.

### Valores de estoque e preço

- **Est.**: normalmente `estoques.emestoque` da linha/Filial; no modo consolidado, soma `emestoque` de todas as Filiais.
- **Res.**: `estoques.reservado` da Filial.
- **Fut.**: `estoques.futuro` da Filial.
- **Pedidos**: `pedidos_estoquepedido(produto, filial)`.
- **Preço Normal**: `estoques_preconormal(produto, filial)`.
- **Preço Promoção**: `estoques_precopromocao(produto, filial)`.

Existe uma segunda query, `qryProcuraEstoqueItemProdutos`, usada pelo tipo `pesEstoqueItemProdutos` e não pelo retorno final de `pesItemProdutosConsulta`. Ela calcula `estoques_preco(produto, filial)` como `preco`, custo médio e última compra. Esses campos **não são colunas da lupa especial da Consulta de Estoques**. Para esta lupa, os preços comprovados são Normal e Promoção.

### Modelos, Grade, peso e outras configurações

- `UsarGradesProdutos` controla Linha e Coluna.
- `LiberarVisualizacaoPesoProdutonasPesquisas` controla Peso.
- `LiberarVisualizacaodeModelosProdutos` controla colunas e execução das agregações de Modelos/Especificações.
- `FiliaisIndependentes` restringe/oculta Filial.
- `Pesquisa_do_produto_por_filial_base_e_com_soma_total_do_estoque` ativa o modo misto consolidado.
- `PesquisarProdutonoCliente` amplia a pesquisa de identidade.
- o tipo de Filial virtual altera qual FilialBase é usada.

Não foi localizado gate de `GerenteEstoque` ou outra Permissão específica para preço e comissão na lupa. Assim, no legado, esses valores ficam visíveis a qualquer Usuário que acesse a pesquisa. Para Laravel, isso é risco de confidencialidade a ser confrontado com as capacidades já decididas da Consulta de Estoques.

### Contrato de seleção

Selecionar uma linha não fixa a Filial da linha e não devolve estoque/preço. O framework:

1. lê `codigovisual` da linha;
2. refaz o lookup genérico de Item de Produto por esse código;
3. grava no item da seleção múltipla o código visual e a descrição concatenada;
4. mantém a regra default de igualdade/OU, editável pelo frame;
5. a Consulta de Estoques posteriormente converte as regras para condições sobre Produto.

Consequências:

- duas linhas do mesmo Produto em Filiais diferentes selecionam o mesmo Produto;
- a Filial exibida serve apenas para contexto;
- Saldo de Estoque e preço não integram o payload da seleção;
- a Filial efetiva da consulta continua sendo o filtro separado da tela.

### SQL e riscos que não devem ser reproduzidos

- macros com entrada concatenada diretamente;
- comparações numéricas montadas como texto;
- Modelo/Especificação concatenados em SQL;
- bloco de identidade com `AND/OR` sem agrupamento global inequívoco;
- pesquisa de código do Cliente sem escopo de Cliente no trecho observado;
- filtro Ativo/Inativo em memória após carregar;
- callback de Filial da tela comentado;
- preço/comissão sem Permissão específica;
- coluna Avançado nula usada como mecanismo de filtro;
- campos Mnemônico/Inativo visíveis mas sem compilação específica;
- modo consolidado somando somente `emestoque` e misturando demais valores da FilialBase.

### Evidências principais

- `apps/estoque/fmconsultaestoque.pas`: atribuição de `pesItemProdutosConsulta` e callback de Filial comentado.
- `repositorio/frselecaoaleatoriaitemdeprodutos.pas`: criação do lookup, abertura da lupa e contrato da regra selecionada.
- `repositorio/frconsultacodigo.pas`: roteamento da pesquisa e comportamento da janela.
- `repositorio/frconsulta.pas`: dataset escolhido, compilação dos campos, seleção/refetch, visibilidade, filtro ativo/inativo e parâmetros.
- `repositorio/frconsulta.dfm`: SQL integral, macros, parâmetros, campos, labels, larguras e formatos.
- `repositorio/fmconsultabasica.pas`: regra genérica de campos pesquisáveis, ordenação e grade.
