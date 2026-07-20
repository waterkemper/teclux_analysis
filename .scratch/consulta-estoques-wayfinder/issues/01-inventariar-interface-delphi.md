# Inventariar interface, abas e filtros Delphi

Type: task
Status: resolved
Blocked by:

## Question

Qual é a composição completa de `fmconsultaestoque`, incluindo herança, abas, controles, frames, filtros, lookups, defaults, validações, habilitação/visibilidade condicional, atalhos, foco, estados visuais e relação entre os controles da interface?

## Answer

### Resumo

`TfrmConsultaEstoque` é uma janela de consulta rica, herdada de `TfrmAjudaBt`, que combina três regiões: barra de ações, painel superior de parâmetros e uma área inferior de resultados mestre–detalhe. A consulta não é reativa: o Usuário monta uma ou mais expressões nos frames de seleção múltipla e executa **Gerar F6**. Depois, a linha ativa do resultado governa todas as abas de detalhe.

Fontes centrais: `delphi/apps/estoque/fmconsultaestoque.pas:23-284`, `delphi/apps/estoque/fmconsultaestoque.dfm:1-5829`, `delphi/repositorio/frmultiplaselecaoaleatoria.pas:70-162` e `delphi/repositorio/frselecaoaleatoria.pas:122-143,918-1026,1134-1149`.

### Herança e estrutura global

- `CONFIRMADO` — A classe herda `TfrmAjudaBt`, portanto recebe barra superior, botão de ajuda e tratamento genérico de pesquisa por F9. O botão Procurar herdado é escondido, mas o botão Ajuda permanece ligado a `Action1` (`fmconsultaestoque.dfm:12-29`; `fmajudabt.pas:45-55`).
- `CONFIRMADO` — A barra acrescenta `Gerar F6`, `Visualizar foto` e `VP`/Registrar Vendas Perdidas (`fmconsultaestoque.dfm:30-255`). As integrações dessas ações serão aprofundadas em **Inventariar resultados, operações e integrações Delphi**.
- `CONFIRMADO` — O painel superior contém o frame `fraMultiplaSelecaoAleatoria`, o lookup de Filial e dez flags binárias de Produto mais `Sem Estoque Zero` (`fmconsultaestoque.dfm:259-840`).
- `CONFIRMADO` — A área inferior é o `pgcItensProdutos`, cujas abas trocam o conjunto de Produtos apresentado. A primeira aba também hospeda `pgcEstoques`, um segundo page control com perspectivas detalhadas do registro ativo (`fmconsultaestoque.dfm:841-3491`).

### Filtros de seleção múltipla

O frame compartilhado representa cada dimensão como uma grade editável de expressões. Cada linha possui campo, operador de comparação, valor e conjunção lógica; as abas com linhas ficam destacadas pelo timer (`frmultiplaselecaoaleatoria.pas:70-87`). O Usuário pode incluir, excluir ou excluir todas as linhas; a própria interface orienta `Ctrl+F9` para pesquisar e `Ctrl+Del` para excluir (`frselecaoaleatoria.dfm:66-343`; `frselecaoaleatoria.pas:122-143`).

Operadores confirmados no compilador compartilhado:

- `Contém` → `ilike`;
- `Não Contém` → `not ilike`;
- `Contido na Lista` → `in`;
- `não Contido na Lista` → `not in`;
- os demais usam os dois primeiros caracteres do texto do operador, cobrindo comparadores simbólicos (`frselecaoaleatoria.pas:1134-1149`).

As linhas são ligadas por `e`/`and` ou, para qualquer outro valor, `or`. Valores vazios ou expressões incompletas são silenciosamente ignorados porque as mensagens e os `abort` correspondentes estão comentados (`frselecaoaleatoria.pas:922-1026`). Isso é `POSSÍVEL BUG LEGADO`: a interface pode aparentar que uma condição incompleta participa da consulta quando ela é descartada.

Abas efetivamente disponíveis na Consulta de Estoques:

- `Item de Produto` — compara o código visual do item (`p.codigovisual`); possui painel recolhível com `Produtos com Agendamento` e `Incluir Similares` (`frselecaoaleatoriaitemdeprodutos.pas:276-305,308-335`; `.dfm:127-172`).
- `Produto` — característica/código visual (`c.codigovisual`).
- `Grupo` — `g.codigo`.
- `Classe` — `cl.codigo`.
- `Marca` — `m.codigo`.
- `Modelos` — `mo.codigo`, visível somente se `ParSistema.LiberarVisualizacaodeModelosProdutos` estiver ativo e o owner for `TfrmConsultaEstoque`.
- `Especificações` — usa descrição no frame e é visível sob a mesma condição de Modelos.
- `Promoções` — `pro.codigo`.
- `Localizações Estoque` — `e.localizacao`, visível especificamente para `TfrmConsultaEstoque`.
- `Lotes` — lote/número do lote.
- `Atributos` — estrutura composta atributo/valor, serializada pelo frame em condição JSON.

Mapeamentos: `fmconsultaestoque.pas:403-414`; `frmultiplaselecaoaleatoria.pas:91-108`; units `frselecaoaleatoria*.pas`, métodos `GetListaCondicional`.

Abas herdadas que **não** atuam como filtros desta tela:

- `CST`, `CSOSN` e `Lista Padrão` nascem com `TabVisible=False` e não são reabilitadas (`frmultiplaselecaoaleatoria.dfm:503-698`).
- `MarketPlace` só é visível para Manutenção de Preço, Manutenção de Produtos ou Relatório de Estoque; `Serviços` só para Relatório de Produtos por Cliente e Vendedor (`frmultiplaselecaoaleatoria.pas:102-106`). Portanto ficam ocultas aqui.

### Filial e flags de Produto

- `CONFIRMADO` — O lookup de Filial é `edfFilial`, ligado a `dsrProcuraFilial.codigo`, com nome exibido por `dtxFilial`. O botão com hint `Procura Filial` põe foco no campo e abre a pesquisa (`fmconsultaestoque.dfm:583-723`; `.pas:389-394`).
- `CONFIRMADO` — `Ctrl+F9`/F9 sobre o campo usa pesquisa de Filiais; se selecionada, o data module valida e posiciona a Filial (`fmconsultaestoque.pas:465-530`).
- `CONFIRMADO` — Quando `ParSistema.FiliaisIndependentes=True`, todo o grupo Filial desaparece, as colunas Filial de Produtos e Similares somem e Pedidos passa a exibir `totalfiliais` em vez de `quantidadefilial` (`fmconsultaestoque.pas:326-334`). A Filial efetiva deverá ser esclarecida no ticket de dados/configurações.
- `CONFIRMADO` — Defaults: Em Linha, Fora de Linha, Ativo, Com Montagem, Sem Montagem, Brinde, Não Brinde, Disponível no site e Não disponível no site começam marcados. Inativo e Sem Estoque Zero começam desmarcados (`fmconsultaestoque.dfm:732-839`).
- `CONFIRMADO` — As flags são pares inclusivos. Com ambos os lados marcados, não restringem essa dimensão; com apenas um marcado, restringem; a semântica quando ambos estão desmarcados será confirmada em **Inventariar datasets, queries e regras de cálculo Delphi**.

### Validação e execução

- `CONFIRMADO` — Gerar exige pelo menos uma linha válida em uma destas dimensões: Item, Produto, Grupo, Classe, Marca, Modelo, Especificação, Promoção, Localização, Lote ou Atributo (`fmconsultaestoque.pas:532-544`). **A Filial ou as flags isoladamente não satisfazem a validação.**
- `CONFIRMADO` — Sem seleção, mostra `Informe um parâmetro para a consulta!`, volta para a primeira aba de filtros e foca a grade de Item de Produto (`fmconsultaestoque.pas:547-554`).
- `CONFIRMADO` — Se uma Filial foi informada, `edfFilial.Exist` precisa validá-la. Campo vazio é aceito pela validação (`fmconsultaestoque.pas:547-548`).
- `CONFIRMADO` — Gerar copia todos os filtros e flags para propriedades do data module e chama `AbrirTabelaConsultaEstoques`; ao fim sempre volta a área de resultados para `Itens do Produto` (`fmconsultaestoque.pas:398-445`).
- `POSSÍVEL BUG LEGADO` — `Produtos com Agendamento` modifica apenas a query de pesquisa usada para localizar itens no modal, não aparece como propriedade copiada para a consulta final. Logo parece filtrar as opções pesquisáveis, e não necessariamente o resultado final (`frselecaoaleatoriaitemdeprodutos.pas:323-335`).
- `CONFIRMADO` — `Incluir Similares` expande a condição do Item para incluir Produtos Similares na lista produzida pelo frame (`frselecaoaleatoriaitemdeprodutos.pas:276-305`).

### Abas principais de resultado

`pgcItensProdutos` inicia em `Itens do Produto` e contém:

1. `Itens do Produto`;
2. `Lotes dos Itens`;
3. `Produtos Similares`;
4. `Grade de Produtos`;
5. `Modelos de Produtos`;
6. `Componentes`;
7. `Atributos` (`fmconsultaestoque.dfm:858,3999,4497,4843,5154,5251,5592`).

Ao trocar a aba:

- Itens, Lotes, Similares e Componentes alteram `TipoConsultaProduto`, dataset mestre e movem fisicamente `pgcEstoques` e a legenda para dentro da aba ativa; Itens também move `dbgProdutos` (`fmconsultaestoque.pas:613-738`).
- Grade monta uma matriz linha × coluna, procura o Produto visual atual, atualiza o Produto ativo ao selecionar uma célula e reabre seus detalhes (`fmconsultaestoque.pas:678-716,864-909,1208-1216`).
- Modelos abre modelos da Característica de Produto; Atributos move a grade principal e abre os atributos (`fmconsultaestoque.pas:718-738`).
- Componentes só fica visível quando o Produto ativo é composto conforme um dos dois campos `composto` (`fmconsultaestoque.pas:1038-1048`).
- Grade fica inicialmente condicionada a `ParSistema.UsarGradesProdutos` e depois também à existência de nomes de linha ou coluna no Produto ativo (`fmconsultaestoque.pas:337-343,812-817`).

### Perspectivas internas do Produto ativo

`pgcEstoques` inicia em `Estoques` e oferece:

- `Estoques`: Quantidades (Estoque total, Em estoque, Danificada, Reservado, Futuro, Demonstração, Pedidos, Conserto, Estoque venda, Em trânsito, Reserva prévia e Estoque físico), Preços (normal, promoção, validade, alteração e descrição) e localização/mínimo/máximo (`fmconsultaestoque.dfm:870-1368`).
- `Financeiro`: Custo médio, Financeiro, alíquota de IPI, Margem Final, últimos Lançamentos, dados da última compra, valores com/sem ICMS, fornecedor, optante do simples e incidências CST/CSOSN (`fmconsultaestoque.dfm:1369-2090`).
- `Acumuladores`: grades de Compras e Vendas (`fmconsultaestoque.dfm:2091-2240`).
- `Preços Cargos`, quando `ParSistema.PrecosporCargo=True`; caso contrário aparece `Preços`, com colunas de preço (`fmconsultaestoque.pas:321-323`; `.dfm:2241-2562`).
- `Preço por Cliente`, quando `ParSistema.PrecoParaCliente=True` (`fmconsultaestoque.pas:323`; `.dfm:2563-2652`).
- `Pedidos`: Pedidos e Notas Pendentes de Entrada (`fmconsultaestoque.dfm:2653-2924`).
- `Fornecedores`, somente para `UsuarioLogin.GerenteEstoque` (`fmconsultaestoque.pas:320`; `.dfm:2925-3124`).
- `Licitações`, com totalizadores flutuantes de quantidade, saldo pendente e total do saldo pendente (`fmconsultaestoque.dfm:3125-3490`; `.pas:1243-1255`).

`Financeiro` e `Acumuladores` também são exclusivos de `GerenteEstoque` (`fmconsultaestoque.pas:319,324`). Os painéis CST/CSOSN de Produto são mostrados conforme a existência de Filiais nos regimes normal e simples (`fmconsultaestoque.pas:362-363`).

### Estado visual, foco e atalhos

- `CONFIRMADO` — Foco inicial: primeira aba de seleção e grade de Item de Produto; resultados começam em Itens do Produto/Estoques (`fmconsultaestoque.pas:315-318`).
- `CONFIRMADO` — `F6` gera; `Esc` refaz/fecha as tabelas da consulta e devolve foco à Filial; Enter no handler `edfGrupoKeyDown` também gera, embora o nome do handler seja residual e sua ligação não apareça explicitamente no DFM atual (`fmconsultaestoque.pas:447-463`).
- `CONFIRMADO` — A seleção múltipla anuncia `Ctrl+F9` para pesquisa e `Ctrl+Del` para exclusão; cada subframe implementa a pesquisa com Ctrl+F9.
- `CONFIRMADO` — Linhas de Produto, Similar e Componente fora de linha/inativas recebem fundo laranja; promoções usam fonte vermelha; colunas de comissão usam fundo verde, fonte vermelha e negrito (`fmconsultaestoque.pas:743-810,1004-1036`). A legenda explicita promoção e fora de linha/inativo (`fmconsultaestoque.dfm:3492-3530`).
- `CONFIRMADO` — Células promocionais da Grade usam fonte vermelha/negrito (`fmconsultaestoque.pas:1174-1206`).
- `CONFIRMADO` — Títulos das duas colunas de grade são renomeados dinamicamente para os nomes das dimensões do Produto; as grades mudam largura conforme `ParSistema.TamanhoMascaraQuantidade`, e o zebrado usa `ParSistema.CorZebradoRelatorio` (`fmconsultaestoque.pas:337-360,375-377,812-817,923-931,1050-1055,1224-1232`).
- `POSSÍVEL BUG LEGADO` — O ajuste de largura condicionado a `dbgCompras.Columns[1]` altera `dbgProdutosPedidos.Columns[1]`, indicando provável referência copiada incorretamente (`fmconsultaestoque.pas:359-360`).

### Limites deste ticket

Os nomes e relações visuais estão confirmados. A fórmula exata de cada quantidade, a composição SQL, a precedência das flags, a origem da Filial implícita e os campos completos das grades pertencem a **Inventariar datasets, queries e regras de cálculo Delphi**. Permissões e Parâmetros do Sistema serão consolidados em **Inventariar Permissões, Autorizações e configurações Delphi**; ações externas e edição de última compra serão detalhadas em **Inventariar resultados, operações e integrações Delphi**.
