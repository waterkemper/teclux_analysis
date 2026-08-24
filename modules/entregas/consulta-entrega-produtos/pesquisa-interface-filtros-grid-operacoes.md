# Pesquisa da interface, filtros, grid e operações — Consulta de Entrega de Produtos

## Escopo, fonte e classificação

Esta nota foi produzida a partir somente das quatro fontes solicitadas:

- `C:\projetos.vcl\apps\entrega\fmConsultaEntregaProdutos.pas` e `.dfm` — formulário, controles e eventos.
- `C:\projetos.vcl\apps\entrega\dmConsultaEntregaProdutos.pas` e `.dfm` — dataset, SQL, campos e persistência.

As citações abaixo usam o formato `arquivo:linha`. `CONFIRMADO` significa que a propriedade ou efeito aparece diretamente nas fontes; `INFERIDO` significa que resulta da combinação de evidências estáticas, sem confirmação de execução; `NÃO LOCALIZADO` significa que não há evidência nas quatro fontes. Dependências herdadas (por exemplo, os frames de filiais e fornecedores) não foram tratadas como contrato interno dessas fontes.

## Resumo executivo

- `CONFIRMADO` — A tela é **Agendamento de entregas**, com abas **Parâmetros** e **Dados**, e botões **Gravar F5**, **Gerar F6** e **Contrato F10** (`fmConsultaEntregaProdutos.dfm:1-15,25-177,180-189,726-755`).
- `CONFIRMADO` — O resultado vem de `UNION ALL`: candidatos de `produtosdadosfiscais` ligados a documento fiscal e candidatos de `produtoscontratos` ainda não totalmente faturados (`dmConsultaEntregaProdutos.dfm:118-331,333-575`).
- `CONFIRMADO` — Os filtros são intervalo de data, “Todas as entregas”, filiais de venda, filiais do produto, períodos marcados, fornecedores de transporte e contexto de romaneio (`fmConsultaEntregaProdutos.pas:140-166`; `dmConsultaEntregaProdutos.pas:101-195`; `dmConsultaEntregaProdutos.dfm:283-327,522-570,591-597`).
- `CONFIRMADO` — O caminho de gravação compara data, hora e período contra campos auxiliares originais e gera `UPDATE` em `produtosdadosfiscais` ou `produtoscontratos` (`dmConsultaEntregaProdutos.pas:246-286`).
- `CONFIRMADO` — O grid de resultados tem edição habilitada e handlers específicos para data, hora e período, mas as colunas visíveis desses três campos estão marcadas `ReadOnly = True` no DFM. A intenção de edição é comprovada; a aceitação efetiva pelo componente em runtime não é demonstrada nas fontes (`fmConsultaEntregaProdutos.dfm:729-756,866-988`; `fmConsultaEntregaProdutos.pas:339-385`).
- `NÃO LOCALIZADO` — Não há handler próprio para F9 ou Ctrl+F9 nesta unidade. Ctrl+F9/Ctrl+Del aparecem somente em um rótulo herdado, enquanto o popup desta tela define atalhos próprios para pesquisar, exportar e copiar (`fmConsultaEntregaProdutos.dfm:703-716,1846-1865`; `fmConsultaEntregaProdutos.pas:216-238,428-450`).

## Interface e defaults

### Parâmetros

| Controle | Contrato observável | Classificação/evidência |
|---|---|---|
| Intervalo | `fraIntervaloDatas1`, caption `INTERVALO DE ENTREGAS`, com data inicial e final | `CONFIRMADO` — `fmConsultaEntregaProdutos.dfm:191-210` |
| Todas as entregas | Checkbox `Todas as entregas`; quando marcado, a validação local passa sem exigir data | `CONFIRMADO` — `fmConsultaEntregaProdutos.dfm:500-507`; `fmConsultaEntregaProdutos.pas:168-188` |
| Filiais de venda | Frame `fraListaFiliaisVenda`, caption `FILIAIS DE VENDA` | `CONFIRMADO` quanto à presença; conteúdo e defaults do frame herdado não estão nas fontes — `fmConsultaEntregaProdutos.dfm:212-238` |
| Períodos | `DBAdvGrid1`, quatro colunas: seleção, período, hora inicial e hora final | `CONFIRMADO` — `fmConsultaEntregaProdutos.dfm:240-462` |
| Filiais do produto | Frame `fraListaFiliaisProduto`, caption `FILIAIS DO PRODUTO` | `CONFIRMADO` quanto à presença; conteúdo e defaults do frame herdado não estão nas fontes — `fmConsultaEntregaProdutos.dfm:508-534` |
| Fornecedores | `fraSelecaoAleatoriaFornecedores1` dentro de `LISTA DE FORNECEDORES DE TRANSPORTE` | `CONFIRMADO` — `fmConsultaEntregaProdutos.dfm:535-724`; o formulário configura o tipo de cliente para fornecedor (`F`) — `fmConsultaEntregaProdutos.pas:135-136` |

O formulário inicia na aba **Parâmetros** (`fmConsultaEntregaProdutos.dfm:180-189`). O DFM não serializa `Checked` para o checkbox “Todas as entregas”; portanto o valor inicial falso é `INFERIDO` pela ausência da propriedade e também é explicitamente imposto nos fluxos de abertura por comando (`fmConsultaEntregaProdutos.pas:252-256,279-284`). O formulário não define datas no `FormCreate`; defaults específicos são aplicados pelos comandos externos descritos abaixo (`fmConsultaEntregaProdutos.pas:330-337`).

O query de períodos é aberto no construtor e seleciona todos os períodos em ordem de código, criando `marcar = false` para cada linha (`fmConsultaEntregaProdutos.pas:96-103`; `dmConsultaEntregaProdutos.dfm:783-835`). A seleção dos períodos é, portanto, estado local do dataset de períodos; não há `UPDATE` da tabela `periodosentrega` nesta unidade (`dmConsultaEntregaProdutos.dfm:794-800`; `dmConsultaEntregaProdutos.pas:150-169`). A possibilidade de o usuário marcar diretamente a coluna booleana é `INFERIDA` pela coluna `marcar` sem `ReadOnly` e pelo uso posterior do campo; o evento específico de clique/edição não está nesta unidade.

### Validação de datas

`VerificaCampos` aceita a consulta sem datas quando “Todas as entregas” está marcado. Caso contrário, exige pelo menos uma das duas datas; com ambas preenchidas, rejeita início maior que fim, mostra `ctDTINICIALMAIORDTFINAL`, devolve foco à data inicial e não chama a consulta (`fmConsultaEntregaProdutos.pas:168-190`). A validação de formato/parsing é deixada para `StrToDate` na chamada do data module (`dmConsultaEntregaProdutos.pas:111-121`); a implementação concreta do frame de datas não está no escopo das fontes e é `NÃO LOCALIZADA`.

### Aberturas por operação externa

Há dois pontos de entrada com a operação textual `Consultar entregas em aberto`:

- `OperacaoPadrao` cria a tela, desmarca “Todas as entregas”, define data inicial = `Now()` e final vazio, desmarca filiais de venda e produto, gera e abre modalmente (`fmConsultaEntregaProdutos.pas:240-266`).
- A rotina global `AbrirConsultaEntregaProdutos` repete esses defaults e ainda chama `MarcarListaArmazenada(Value[1])` para filiais do produto (`fmConsultaEntregaProdutos.pas:268-291`).

Há também `Consultar entrega romaneio`: marca todas as entregas, deixa ambas as datas vazias, desmarca filiais de venda duas vezes (a segunda chamada parece ser uma duplicação; a desmarcação de filiais do produto não aparece nesse ramo), grava `romaneio` e `romaneiodadofiscal`, gera, zera essas propriedades e só então abre a tela modal (`fmConsultaEntregaProdutos.pas:293-318`). A duplicação e a ausência de desmarcação do produto são `CONFIRMADAS` como texto legado; a intenção original é `INFERIDA`.

## Filtros e semântica do SQL

### Parâmetros e macros

`AbrirConsultaEntregaProdutos` preenche o parâmetro booleano `TodoIntervalodeEntregas`, converte datas preenchidas para `DateTime` e limpa as ausentes (`dmConsultaEntregaProdutos.pas:101-121`; `dmConsultaEntregaProdutos.dfm:601-616`).

Quando há filiais de venda, são inseridos simultaneamente:

- `and ct.filialvenda in (...)` no ramo de contratos;
- `and df.filialvenda in (...)` no ramo fiscal.

Quando a lista é vazia, ambas as macros são limpas (`dmConsultaEntregaProdutos.pas:123-134`; `dmConsultaEntregaProdutos.dfm:19-29,40-49`). O mesmo ocorre para filiais do produto, aplicando `pc.filial` e `pdf.filial` (`dmConsultaEntregaProdutos.pas:136-147`). A lista já chega como texto de expressão SQL do frame; a fonte não demonstra tokenização, binding ou validação dessa lista.

Fornecedores de transporte usam a lista condicional recebida do frame. Quando não vazia, a rotina troca `vf.` por `vft.` e a envolve em `and (...)` (`dmConsultaEntregaProdutos.pas:184-188`). No SQL externo, `vft` é o fornecedor associado ao romaneio e `vfft` é o fornecedor original da entrega; o campo exibido usa `coalesce` entre eles (`dmConsultaEntregaProdutos.dfm:576-593`). A seleção é configurada para o tipo `F` no formulário (`fmConsultaEntregaProdutos.pas:135-136`). A gramática das condições e as operações internas do frame são `NÃO LOCALIZADAS` nas quatro fontes.

### Datas e períodos marcados

Com `TodoIntervalodeEntregas = true`, cada ramo exige somente uma data de entrega não nula (`dmConsultaEntregaProdutos.dfm:283-305,522-543`). Com a opção falsa, os três casos são:

- ambas preenchidas: `dataentrega between :DataInicial and :DataFinal`;
- somente inicial: `dataentrega >= :DataInicial`;
- somente final: `dataentrega <= :DataFinal`.

Isso aparece tanto no ramo fiscal (`pdf.dataentrega`, `dmConsultaEntregaProdutos.dfm:283-304`) quanto no ramo de contratos (`pc.dataentrega`, `dmConsultaEntregaProdutos.dfm:522-543`). A validação da tela adiciona a exigência de ao menos uma data, mas o SQL por si só não cria predicado no caso de ambas vazias quando a opção é falsa (`dmConsultaEntregaProdutos.dfm:285-303,524-542`; `fmConsultaEntregaProdutos.pas:170-188`).

Para cada linha marcada no dataset de períodos, a rotina gera um predicado inclusivo `horaentrega between inicio and fim`, unido por `or`. O mesmo predicado é transformado de `pc.` para `pdf.` para o ramo fiscal (`dmConsultaEntregaProdutos.pas:150-169`). Se houver ao menos um período marcado, as macros `PeriodoEntrega` e `PeriodoEntrega_DF` recebem a expressão. Se não houver, a rotina limpa explicitamente `PeriodoEntrega`, mas não limpa explicitamente `PeriodoEntrega_DF`; em uma reutilização da mesma instância após uma consulta com períodos marcados, isso é um `POSSÍVEL BUG LEGADO` comprovável pelo fluxo (`dmConsultaEntregaProdutos.pas:162-169`).

### Contexto de romaneio

Somente quando `romaneio <> 0` e `romaneiodadofiscal <> 0`, o ramo fiscal recebe `and df.numero = <romaneiodadofiscal>` e o ramo de contratos recebe `and false`. Caso contrário, ambas as condições ficam vazias (`dmConsultaEntregaProdutos.pas:172-182`; macros declaradas em `dmConsultaEntregaProdutos.dfm:30-39,50-59`). O número `romaneio` funciona como guarda para ativar o filtro, mas não é incorporado como predicado próprio no SQL; o valor fiscal é o identificador efetivamente filtrado.

### Elegibilidade fixa dos dois ramos

O ramo fiscal seleciona documento fiscal e produto quando:

- `coalesce(pdf.entregar,false)` é verdadeiro;
- `df.situacao = 'N'` e `df.contrato is not null`;
- a quantidade do item, menos devoluções não canceladas, é maior que zero;
- não existe recebimento em `romaneiosnotas` sem justificativa de entrega;
- filtros de filiais, período e contexto são satisfeitos.

Evidências: `dmConsultaEntregaProdutos.dfm:118-146,266-327`.

O ramo de contrato seleciona `produtoscontratos` quando:

- `coalesce(pc.entrega,'N') = 'S'`;
- `ct.situacao in ('F','P')` e `contratos_atual(ct.numero)`;
- a quantidade do produto, menos devoluções de situação `F` e quantidades já faturadas, é maior que zero;
- filtros de filiais, período e contexto são satisfeitos.

Evidências: `dmConsultaEntregaProdutos.dfm:333-375,508-570`.

O resultado externo enriquece fornecedor de transporte, região, limite de quantidade e texto de detalhes, e ordena por `dataentrega`, descrição do período, região, CEP, bairro e hora (`dmConsultaEntregaProdutos.dfm:65-111,576-597`).

## Grid de períodos

`DBAdvGrid1` está ligado a `dsrPeriodosEntrega`, tem quatro colunas e mostra `marcar`, `descricao`, `inicio` e `fim`; `descricao`, `inicio` e `fim` são `ReadOnly = True`, enquanto `marcar` não recebe essa propriedade (`fmConsultaEntregaProdutos.dfm:247-266,341-462,463-497`). A consulta de períodos é `select pe.*, false as marcar from periodosentrega pe order by pe.codigo` e fica ativa (`dmConsultaEntregaProdutos.dfm:783-800`).

O filtro de período não persiste os campos da tabela de períodos: a rotina apenas lê as linhas marcadas antes de fechar/abrir o query de resultados (`dmConsultaEntregaProdutos.pas:150-191`). A descrição, início, fim e hora padrão vêm da tabela; o booleano `marcar` é uma coluna de seleção local (`dmConsultaEntregaProdutos.dfm:803-834`).

## Grid de resultados

### Configuração

O grid `dbgConsultaEntregaProdutos` tem 25 colunas, edição habilitada (`goEditing`), menu popup, seleção ativa, linhas/colunas redimensionáveis e eventos de duplo clique, display, cálculo, agrupamento, ordenação, editor e formato numérico (`fmConsultaEntregaProdutos.dfm:729-756`). A ordenação inicial do SQL é a descrita acima; a ordenação pelo cabeçalho é tratada em memória pelo `TtecQuery` (`fmConsultaEntregaProdutos.pas:393-425`).

### Colunas e somente leitura

| Campo/coluna | Cabeçalho/uso | Edição e classificação |
|---|---|---|
| `dataentrega` | Data da Entrega | `CONFIRMADO` — coluna marcada `ReadOnly`; há editor de data customizado no PAS (`fmConsultaEntregaProdutos.dfm:865-895`; `fmConsultaEntregaProdutos.pas:346-355`) |
| `descricaoperiodoentrega` | Período da Entrega | `CONFIRMADO` — coluna marcada `ReadOnly`; há caminho de lookup customizado que grava o campo oculto `periodoentrega` (`fmConsultaEntregaProdutos.dfm:897-926`; `fmConsultaEntregaProdutos.pas:368-381`) |
| `horaentrega` | Hora da Entrega | `CONFIRMADO` — coluna marcada `ReadOnly`; há editor de hora customizado (`fmConsultaEntregaProdutos.dfm:958-988`; `fmConsultaEntregaProdutos.pas:357-366`) |
| `nomeregiao` | Região da Entrega | `ReadOnly` (`fmConsultaEntregaProdutos.dfm:928-956`) |
| `contratonota` | Detalhes; chave de agrupamento | Não há `ReadOnly` serializado, mas o campo é derivado no SQL e usado para agrupamento/recolhimento; edição funcional não está demonstrada — `INFERIDO`/não oferecer como mutável (`dmConsultaEntregaProdutos.dfm:101-111,765-768`; `fmConsultaEntregaProdutos.dfm:990-1017`) |
| `nomebairro` | Nome do Bairro | `ReadOnly` (`fmConsultaEntregaProdutos.dfm:1019-1048`) |
| `entregas` | Entregas | `Editor = edNone` e `ReadOnly`; agregado/indicador derivado (`fmConsultaEntregaProdutos.dfm:1050-1080`; `dmConsultaEntregaProdutos.dfm:755-757`) |
| `limitequantidade` | Limite | Não há `ReadOnly` serializado, mas é calculado por subconsulta e o PAS só o formata/oculta visualmente; editabilidade efetiva não está localizada — `INFERIDO` como somente leitura (`dmConsultaEntregaProdutos.dfm:79-97,769-772`; `fmConsultaEntregaProdutos.pas:452-465,608-620`) |
| `romaneio` | Romaneio | `ReadOnly` (`fmConsultaEntregaProdutos.dfm:1140-1168`) |
| `contrato` | Contrato | `ReadOnly`; usado para abrir cadastro e localizar registro (`fmConsultaEntregaProdutos.dfm:1170-1199`; `fmConsultaEntregaProdutos.pas:584-598`) |
| `filialnf`, `numero`, `serie` | Identidade do documento | `ReadOnly` (`fmConsultaEntregaProdutos.dfm:1201-1289`) |
| `filial`, `produtovisual`, `descricaoproduto`, `saldo_quantidade` | Filial do produto, produto, descrição e quantidade | `ReadOnly` (`fmConsultaEntregaProdutos.dfm:1291-1413`) |
| `estado`, `nomecidade`, `cep`, `endereco` | Endereço/UF | `ReadOnly` (`fmConsultaEntregaProdutos.dfm:1415-1537`); `endereco` é calculado no data module (`dmConsultaEntregaProdutos.pas:382-394`) |
| `fornecedor_transporte`, `nomefornecedortransporte` | Fornecedor e nome do transporte | `ReadOnly` (`fmConsultaEntregaProdutos.dfm:1539-1597`) |

Há ainda uma coluna inicial sem `FieldName` e outra coluna sem `FieldName` com largura 10 no conjunto serializado do grid (`fmConsultaEntregaProdutos.dfm:837-864,1113-1139`). Os campos `periodoentrega`, `dadofiscal`, `produto` e os campos `aux*` existem no dataset, mas não são colunas de resultado visíveis (`dmConsultaEntregaProdutos.dfm:654-738`).

### Campos editáveis e interação data/hora/período

O caminho de edição intencional é:

1. Ao editar `dataentrega`, o formulário usa `AdvDBDateTimePicker1`; se o valor for nulo, inicializa com `DataHoraServidor`, e limita a data mínima à coluna `data` do registro (`fmConsultaEntregaProdutos.pas:346-355`). O controle é `dkDate`, ligado ao campo `dataentrega` (`fmConsultaEntregaProdutos.dfm:1660-1684`).
2. Ao editar `horaentrega`, usa `AdvDBDateTimePicker2`; se nula, inicializa com `HoraServidor` (`fmConsultaEntregaProdutos.pas:357-366`). O controle é `dkTime`, ligado ao campo `horaentrega` (`fmConsultaEntregaProdutos.dfm:1763-1787`).
3. Ao editar a descrição do período, usa `AdvDBLookupComboBox1`, ligado ao campo `periodoentrega`, com `codigo` como chave e `descricao` como lista (`fmConsultaEntregaProdutos.pas:368-381`; `fmConsultaEntregaProdutos.dfm:1685-1737`). Se o período do registro estiver nulo, o handler primeiro atribui o código do período corrente (`fmConsultaEntregaProdutos.pas:370-372`).

O `TFormControlEditLink` é `esInplace`, aceita teclas esquerda/direita e cima/baixo, mas não declara aceitar Home/End, PageUp/PageDown, Return ou Escape (`fmConsultaEntregaProdutos.dfm:1794-1808`). A combinação de `goEditing`, handlers customizados e colunas `ReadOnly` é uma inconsistência estática: `CONFIRMADO` para a intenção e para os campos mutados pelo PAS; `NÃO LOCALIZADO` para uma prova de que a edição é aceita pelo componente em execução. Não transformar `limitequantidade`, `contratonota` ou qualquer campo sem handler em campo editável do destino.

### Regras de sincronização entre hora e período

Quando `periodoentrega` muda, o datasource atualiza a descrição e, se a hora atual ficar fora do intervalo inclusivo `[inicio, fim]`, troca a hora pela `horapadrao` do período selecionado (`dmConsultaEntregaProdutos.pas:203-216`).

Quando `horaentrega` muda, o datasource percorre os períodos e, no primeiro intervalo inclusivo que contém a hora, atribui o código e a descrição do período correspondente (`dmConsultaEntregaProdutos.pas:218-240`). Se nenhuma faixa contiver a hora, não há atribuição explícita de período; isso é `CONFIRMADO` no código e deve ser tratado como uma lacuna/decisão, não como regra inventada.

## Agrupamento, ordenação e apresentação

Depois de gerar uma consulta com registros, a tela abre a aba Dados e chama `AGrupamento` (`fmConsultaEntregaProdutos.pas:140-165`). A rotina remove agrupamentos anteriores, recarrega/atualiza, agrupa por data, faz subgrupos por período, região e `contratonota`, soma `entregas` e `saldo_quantidade`, usa cálculo customizado para `limitequantidade`, expande tudo e recolhe nós que possuem `contratonota` (`fmConsultaEntregaProdutos.pas:513-567`). Depois ajusta larguras associadas ao campo de detalhes (`fmConsultaEntregaProdutos.pas:576-580`).

O cálculo de grupo soma os valores da coluna entre `FromRow` e `ToRow` (`fmConsultaEntregaProdutos.pas:641-654`). `limitequantidade` é ocultado quando zero ou quando a região está vazia (`fmConsultaEntregaProdutos.pas:608-620`). O formato especial `%g` é aplicado às colunas `entregas`, `saldo_quantidade` e `limitequantidade` (`fmConsultaEntregaProdutos.pas:452-465`).

Ao clicar no cabeçalho, a tela chama `SortByField`; clicando novamente alterna ascendente/descendente; no terceiro ciclo, se `UndoSort` estiver habilitado, limpa a ordenação (`fmConsultaEntregaProdutos.pas:393-425`; `fmConsultaEntregaProdutos.dfm:820-836`). A ausência de uma coluna ou campo sem ordenação funcional não é demonstrada; o comportamento de ordenação é `CONFIRMADO` como chamada do componente, não como uma especificação de ordenação server-side.

## Operações, atalhos e popup

### Botões e teclas da tela

| Ação | Evidência | Resultado |
|---|---|---|
| Gravar / F5 | `fmConsultaEntregaProdutos.dfm:25-99`; `fmConsultaEntregaProdutos.pas:216-223,387-391` | Chama `GravarDados`, mas só fica habilitado na aba Dados quando `editando = true` (`fmConsultaEntregaProdutos.pas:206-214`). |
| Gerar / F6 | `fmConsultaEntregaProdutos.dfm:100-151`; `fmConsultaEntregaProdutos.pas:216-228,140-166` | Valida parâmetros, abre a consulta, muda para Dados se houver registros e avisa quando vazia. |
| Contrato / F10 | `fmConsultaEntregaProdutos.dfm:152-177`; `fmConsultaEntregaProdutos.pas:230-233,584-598` | Localiza o registro e abre `TfrmCadastroContratos` se houver contrato. Fica habilitado quando a linha corrente tem contrato (`fmConsultaEntregaProdutos.pas:206-214`). |
| F9 | Fontes solicitadas | `NÃO LOCALIZADO` como handler nesta tela/data module. |
| Ctrl+F9 / Ctrl+Del | `fmConsultaEntregaProdutos.dfm:703-716` | `NÃO LOCALIZADO` como implementação própria; apenas texto de orientação herdado. Não atribuir automaticamente esse comportamento a esta tela sem inspecionar a classe herdada. |

O override `KeyDown` testa somente o código da tecla; não testa `Shift`, portanto a distinção de modificadores não é implementada neste handler (`fmConsultaEntregaProdutos.pas:216-238`). O processamento herdado ainda é chamado depois do `case` (`fmConsultaEntregaProdutos.pas:235-238`).

### Duplo clique e reagendamento

Duplo clique só prossegue quando `produtovisual` não está vazio. A tela localiza por `contrato; filialnf; serie; numero; produtovisual` quando série e número existem, ou por `contrato; filialnf; produtovisual` caso contrário (`fmConsultaEntregaProdutos.pas:467-480`; `dmConsultaEntregaProdutos.pas:396-406`).

Então abre `TfrmReagendamentoEntregas`, vincula data, hora e período ao datasource corrente, impõe data mínima = data do servidor e máxima = servidor + 60 dias (`fmConsultaEntregaProdutos.pas:482-496`). Ao confirmar o modal, se o dataset estiver em edição, publica a linha, chama `GravarDadosEntrega` e reagrupa o grid (`fmConsultaEntregaProdutos.pas:498-505`).

`GravarDadosEntrega` copia data, hora, período e descrição para todas as linhas do dataset que tenham o mesmo contrato e o mesmo `dadofiscal` (`dmConsultaEntregaProdutos.pas:347-378`). Essa rotina não executa `qryAtualizar` nem chama `perpetrar`; ela altera/publica o cache do dataset. A persistência no banco fica, portanto, `INFERIDA` como dependente do Gravar F5 posterior, enquanto a cópia em lote na consulta está `CONFIRMADA` (`dmConsultaEntregaProdutos.pas:316-380`; `fmConsultaEntregaProdutos.pas:498-505`).

### Popup

O resultado usa `AdvPopupMenu1` (`fmConsultaEntregaProdutos.dfm:729-748`) com:

| Item | Atalho serializado | Interpretação | Efeito |
|---|---:|---|---|
| Pesquisar | `16454` | Ctrl+F, pela codificação padrão de `ShortCut` | Atribui o grid ao `AdvGridFindDialog1` e executa a pesquisa (`fmConsultaEntregaProdutos.dfm:1850-1854`; `fmConsultaEntregaProdutos.pas:428-434`). |
| Exportar Excel | `16472` | Ctrl+X | Exporta para `Saidas\ConsultaEntregaProdutos.xls`, aba/identificador `ConsultaEntregaProdutos` (`fmConsultaEntregaProdutos.dfm:1855-1859`; `fmConsultaEntregaProdutos.pas:436-444`). |
| Copiar | `16451` | Ctrl+C | Copia a seleção do grid para o clipboard (`fmConsultaEntregaProdutos.dfm:1860-1863`; `fmConsultaEntregaProdutos.pas:446-450`). |

A dialog de pesquisa oferece escopo de todas as células, linha, coluna ou células selecionadas, direções e opções de maiúsculas, palavras inteiras, primeiro caractere, HTML, células fixas e curingas (`fmConsultaEntregaProdutos.dfm:1809-1836`). O arquivo de exportação e a sobrescrita/visualização em Excel são propriedades do componente, não uma API de persistência de negócio (`fmConsultaEntregaProdutos.dfm:1837-1845`).

## Eventos e persistência

### Estado de edição

O query principal usa `CachedUpdates = True`, `RequestLive = True`, `AfterPost = qryConsultaEntregaProdutosAfterPost` e `OnCalcFields = qryConsultaEntregaProdutosCalcFields` (`dmConsultaEntregaProdutos.dfm:7-18,598-616`). Depois de qualquer `Post`, `AfterPost` apenas marca `editando = true`; não grava imediatamente no banco (`dmConsultaEntregaProdutos.pas:301-313`).

O botão Gravar chama `GravarDados` (`fmConsultaEntregaProdutos.pas:387-391`). Essa função:

1. limpa o SQL de `qryAtualizar` e guarda o registro corrente;
2. percorre todas as linhas;
3. compara `dataentrega`, `horaentrega` e `periodoentrega` com `auxdataentrega`, `auxhoraentrega` e `auxperiodoentrega`;
4. para alterações em linha fiscal (`contrato` e `dadofiscal` não nulos), gera `UPDATE produtosdadosfiscais` por `dadofiscal` e `produto`;
5. caso contrário, gera `UPDATE produtoscontratos` por `contrato` e `produto`;
6. executa o SQL acumulado e chama `perpetrar([qryAtualizar])` quando há comandos;
7. sempre restaura a posição e zera `editando`.

Evidências: `dmConsultaEntregaProdutos.pas:246-286`.

Os valores originais usados na comparação vêm diretamente dos aliases `aux*` no SQL, tanto no ramo fiscal quanto no de contratos (`dmConsultaEntregaProdutos.dfm:138-146,367-374`; campos DFM `dmConsultaEntregaProdutos.dfm:726-738`). As datas/horas são serializadas nos updates como `yyyy-MM-dd`/`HH:mm:ss`, e o período como inteiro (`dmConsultaEntregaProdutos.pas:254-268`).

`GravarDados` não atribui explicitamente `Result := False` quando não há alterações; o resultado da função nesse caso não é comprovado pelas fontes (`dmConsultaEntregaProdutos.pas:246-286`). A atomicidade exata de `perpetrar` também não está nesta unidade: está `CONFIRMADO` que a rotina é chamada uma vez para o query de atualização, mas `NÃO LOCALIZADO` se isso representa uma transação única, rollback ou outra política.

### Campos calculados e derivados

O campo `endereco` é calculado concatenando rua, número e complemento (`dmConsultaEntregaProdutos.pas:382-394`; `dmConsultaEntregaProdutos.dfm:759-764`). `fornecedor_transporte`, `nomefornecedortransporte`, `regiao`, `nomeregiao`, `entregas`, `limitequantidade`, `contratonota` e `romaneio` são projetados/calculados no SQL externo (`dmConsultaEntregaProdutos.dfm:65-111,575-597`). Não há update desses campos em `GravarDados`; são somente leitura para o contrato desta tela.

## Separação entre legado confirmado e destino Laravel

### Deve ser preservado como paridade funcional Delphi

O contrato legado que pode ser levado ao módulo Laravel é:

- a distinção entre candidatos de produto em documento fiscal e candidatos diretamente de contrato (`dmConsultaEntregaProdutos.dfm:118-575`);
- os filtros de data inclusivos, filiais em ambos os ramos, períodos por faixas de hora, fornecedor de transporte e contexto fiscal de romaneio (`dmConsultaEntregaProdutos.pas:111-188`; `dmConsultaEntregaProdutos.dfm:283-327,522-570`);
- a edição restrita à agenda — data, hora e período — com ajuste de hora ao trocar período e ajuste de período ao trocar hora (`fmConsultaEntregaProdutos.pas:339-385`; `dmConsultaEntregaProdutos.pas:203-240`);
- a comparação contra o valor original e a escolha do update fiscal/contrato (`dmConsultaEntregaProdutos.pas:246-286`);
- F5 para persistir, F6 para gerar e F10 para abrir o contrato (`fmConsultaEntregaProdutos.pas:216-238,387-391,584-598`);
- agrupamento/apresentação do resultado por data, período, região e detalhes, com somas de entregas e saldo (`fmConsultaEntregaProdutos.pas:513-567`).

### Não é requisito Laravel comprovado pelo legado

Os itens abaixo não devem ser tratados como fatos do Delphi desta tela sem decisão própria:

- F9 ou Ctrl+F9 para pesquisar; só o popup Ctrl+F está implementado nesta unidade (`fmConsultaEntregaProdutos.dfm:1846-1865`; `fmConsultaEntregaProdutos.pas:428-434`).
- Ctrl+Del para excluir; aparece apenas no rótulo herdado (`fmConsultaEntregaProdutos.dfm:703-716`).
- uma API de exportação específica; o legado apenas escreve um `.xls` em caminho relativo ao executável (`fmConsultaEntregaProdutos.pas:436-444`).
- a regra de que `limitequantidade` ou `contratonota` seriam editáveis; não há handler de edição e ambos são derivados (`dmConsultaEntregaProdutos.dfm:65-111`; `fmConsultaEntregaProdutos.pas:339-385`).
- atomicidade, autorização, concorrência, idempotência ou rollback do update; a implementação de `perpetrar` não está nas fontes solicitadas (`dmConsultaEntregaProdutos.pas:276-280`).

Para o Laravel, a tela deve declarar explicitamente seus contratos de autorização, transação, conflito e cancelamento conforme a arquitetura existente; esta pesquisa não inventa esses requisitos a partir de componentes Delphi. O implementador pode usar esta nota como evidência de comportamento legado, sem precisar inspecionar novamente os fontes Delphi.

## Pontos não localizados ou que exigem decisão

1. `NÃO LOCALIZADO` — implementação de F9, Ctrl+F9 e Ctrl+Del na classe herdada ou em frames compartilhados; esta nota não atribui esses atalhos à tela.
2. `NÃO LOCALIZADO` — confirmação runtime de que as colunas `ReadOnly` aceitam os editores selecionados por `GetEditorType`.
3. `NÃO LOCALIZADO` — validação detalhada do frame de datas e gramática do frame de fornecedores/filiais.
4. `POSSÍVEL BUG LEGADO` — `PeriodoEntrega_DF` não é limpo no caminho sem períodos marcados (`dmConsultaEntregaProdutos.pas:162-169`).
5. `POSSÍVEL BUG LEGADO` — `GravarDados` não inicializa o retorno quando não há SQL de atualização (`dmConsultaEntregaProdutos.pas:246-286`).
6. `INFERIDO` — a cópia feita por `GravarDadosEntrega` só chega ao banco depois de Gravar F5; a rotina não contém execução SQL (`dmConsultaEntregaProdutos.pas:316-380`).
7. `NÃO LOCALIZADO` — semântica transacional de `perpetrar` e tratamento de erro do `qryAtualizar`.

