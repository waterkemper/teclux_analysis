# Pesquisa — SQL, domínio e efeitos da Transferência/Requisição para Exposição Delphi

## Escopo, fontes e exclusões

Fontes primárias lidas integralmente:

- C:\projetos.vcl\apps\interlojas\dmtransferenciarequisicaoexposicao.pas
- C:\projetos.vcl\apps\interlojas\dmtransferenciarequisicaoexposicao.dfm

As referências usam arquivo:linha inicial-linha final. O inventário descreve o comportamento observado; não presume que Perpetrar, triggers, constraints ou funções PostgreSQL sejam atômicos sem confirmar seus próprios fontes/schema.

**Fora do escopo — Emissão Fiscal Eletrônica e Venda entre Filiais.** O DataModule contém os datasets e rotinas fiscais porque a confirmação legada pode produzir uma nota, mas este relatório não modela esses efeitos. Ficam explicitamente excluídos: dados fiscais, notas, séries, volumes fiscais, vencimentos, impostos, DANFE/NF-e, XML/SEFAZ, Contrato por dado fiscal, VendaTransferencia, crédito de troca e duplicatas. Eles são citados somente para marcar a fronteira. Evidências: pas:37-38, pas:588-590, pas:1343-1977; dfm:498-826 e dfm:2013-2750.

## Resumo executivo

**Confirmado:** a unidade operacional é uma linha de pedidosfiliais, identificada por codigo, com Produto, Filial requisitante, Filial requisitada, quantidade pedida/recebida, Situação, lote opcional e eventual vínculo fiscal. A consulta principal resolve filial física tipo V por coalesce(filial_estoque,codigo) e lê estoque/reserva das filiais.

**Confirmado:** confirmação percorre linhas A marcadas, agrega Produtos e registra movimentos. Com ParSistema.RequisicaoSubtraiEstoque ativo, disponibilidade é reservaprevia; caso contrário, emestoque. O conjunto de estoque é aberto com FOR UPDATE.

**Confirmado:** cancelamento/reabertura alterna C/A; com subtração de estoque cria movimentos TPE, TEP e TFR e persiste Estoque, Movimentos e Pedido no fluxo de Perpetrar.

**Risco alto:** há consultas por Produto/Filial em loops, Locate aninhado, verificação de log uma requisição por vez e funções escalares de estoque/vendas/pedidos nas consultas analíticas. O redesenho deve ser set-based, com lock determinístico e revalidação sob lock.

## 1. Consulta mestre e domínio de leitura

qryPedidosFiliais é TtecQuery com CachedUpdates=True, RequestLive=True, a mesma Database/Transaction centrais e eventos de abertura, edição, postagem, scroll e filtro [dm...dfm:106-124].

SQL base e joins [dm...dfm:156-273]:

- pedidosfiliais pf;
- LEFT JOIN notas n ON pf.dadofiscal = n.dadofiscal;
- JOIN produtos p ON pf.produto = p.codigo, JOIN caracteristicas c ON p.caracteristica = c.codigo e LEFT JOIN promocoes pro ON p.promocao = pro.codigo;
- JOIN filiais f ON f.codigo = pf.requisitada e JOIN filiais f1 ON f1.codigo = pf.requisitante;
- JOIN estoques e ON e.produto = pf.produto AND e.filial = pf.requisitada;
- WHERE pf.requisitada = :requisitada; ORDER BY pf.requisitante, pf.produto.

A projeção usa pf.* e acrescenta descrição/referência/código visual do Produto, nome da filial, série/número de nota, grades linha/coluna por subconsultas, CST/CSOSN/PIS/COFINS, localização, promoção e quantidade recebida anterior. Também calcula:

- estoquerequisitante, minimo e maximo por subconsultas a estoques;
- estoquerequisitada e reservapreviarequisitada pela filial física da requisitada;
- filial_estoque e filial_estoque_requisitante, resolvidas para tipo V por coalesce(filial_estoque,codigo);
- marcarlotetransferencia como verdadeiro se houver lote ou qtderecebida diferente de zero.

Macros declaradas: Periodo, Requisitante, Situacao, CurvaABC, QtdeConfirmada e produtos; o bind fixo é requisitada [dm...dfm:125-155,263-283].

- MontaIntervaloData concatena igualdade ou intervalo inclusivo em cast(pf.data as date) [dm...pas:2427-2442].
- SetFilialRequisitante concatena and (pf.requisitante = valor) [dm...pas:2629-2634].
- SetSituacao mapeia 0/1/2/3 para A/F/D/C [dm...pas:2636-2644].
- GerarConsultaRequisicao constrói o OR da Curva ABC, replica as macros na consulta de código de barras e abre os datasets [dm...pas:1184-1258].
- Reatualizar copia SQL, macros e parâmetros para outro DataModule e adiciona and p.codigo in (...) [dm...pas:3576-3622].

**Risco:** filial, Produto, listas e datas são incorporados como texto SQL. O futuro contrato deve aceitar tipos estruturados, binds/whereIn e lista vazia explícita; não deve transportar macros textuais.

## 2. Consultas auxiliares

| Dataset | SQL/efeito | Evidência |
|---|---|---|
| qryProcuraFiliais | Busca uma Filial por codigo, exclui requisitada e deriva filial_estoque para tipo V. | dfm:6-62 |
| qryConsultaFiliais | Lista Filiais exceto requisitada, ordenada por nome. | dfm:69-104 |
| qryPedidosFiliaisCodigoBarras | pedidosfiliais + produtos + caracteristicas + produtoscodigobarras; recebe macros da consulta-base. | dfm:2076-2148; pas:1229-1234 |
| qryFilialDestino | Cadastro/endereço da Filial requisitante; bairro, cidade e IBGE por subconsultas. | dfm:1053-1171 |
| qryTotaisPedidosFiliais | Dataset sintético; AfterOpen calcula totais com SomarValores. | dfm:2153-2182; pas:2897-2916 |
| qryPedidosFiliaisAtuais | Reconsulta códigos por lista textual para comparar quantidades e detectar alteração. | dfm:2897-3008; pas:3421-3481 |
| qryUltimaAlteracaoPedidosFiliais_Log | Último evento em pedidosfiliais_log por código, usuário/trigger/data. | dfm:4168-4231 |

## 3. Situações e transições

| Código | Semântica observada | Evidência |
|---|---|---|
| A | Aberta/ativa; é elegível para confirmação e edição. | pas:924-930; pas:2636-2643 |
| F | Fechada; AtualizarPedidosFiliais grava F nos pedidos associados ao Produto. | pas:657-670 |
| D | Confirmada segundo GetConfirmado; filtro público aceita D. | pas:1272-1275, 2636-2643 |
| C | Cancelada; GetCancelado lê C. | pas:1262-1265 |

CancelarRequisicao alterna C para A ou a situação corrente para C, anexa motivo à observação, zera qtderecebida ao cancelar e grava a linha [pas:748-832]. AfterScroll torna o dataset somente leitura em F/C; BeforeInsert aborta inserção de linha [pas:2523-2535].

**Ponto de decisão:** o código não implementa uma máquina de estados completa. O contrato novo deve declarar transições permitidas e rejeitar situação desconhecida, em vez de inferir tudo de ReadOnly.

## 4. Estoque e reserva

BloquearEstoque percorre os Produtos, consulta qryExisteEstoque por Produto/Filial requisitante e cria linha de estoques zerada se ausente; depois persiste qryEstoques [pas:693-746]. A criação inicializa emestoque, reservado, transito, demonstracao, conserto, futuro, danificada e estoquefisico com zero [pas:697-711; dfm:1385-1454].

qryEstoqueBloqueio lê produto, filial, emestoque, reservaprevia e futuro de estoques e termina com FOR UPDATE; %ProdutoFilial é preenchido em runtime [dfm:826-876]. O PAS monta o predicado por concatenação dos pares de qryProdutos [pas:724-745]. No cancelamento/reabertura, a mesma consulta é aberta para um par [pas:3332-3370].

Na edição de quantidade recebida, o limite é reservapreviarequisitada quando RequisicaoSubtraiEstoque é verdadeiro; caso contrário é estoquerequisitada [pas:1037-1149]. Na confirmação, VerificarSaldoEstoqueouReserva compara reservaprevia ou emestoque. Quando falta saldo, remove qryProdutos e continua, em vez de abortar explicitamente [pas:3084-3128]. Essa semântica precisa ser decidida.

ReservaPreviaProduto, após bloquear o par, faz:

- Situação C: cria TPE com qtdepedida; se há futuro, cria TFR limitado entre quantidade pedida e futuro;
- reabertura A: exige emestoque >= qtdepedida e cria TEP;
- referência dos movimentos: REQUISICAO <codigo>.

Evidência: pas:2537-2596; dataset de movimentos de cancelamento/reabertura em dfm:1886-2010.

**Leitura conservadora:** TEP, TPE e TFR são códigos legados observados. O comentário do PAS descreve retorno ao estoque e transferência de futuro para reserva, mas o significado final das colunas de saldo deve ser confirmado em triggers/funções do motor de movimentos.

## 5. Confirmação e efeitos dentro do escopo

ConfirmaRequisicao valida inconsistências, percorre apenas qtderecebida > 0, situação A e lote marcado, agrupando por Filial requisitante [pas:896-971]. A cadeia fiscal que começa em ImprimirNotaFiscal está excluída; os efeitos compartilhados são os seguintes.

### Produtos e movimentos

IncluirProdutos agrega por Produto/Filial de estoque a quantidade recebida e acumula Listacodigopedidofilial. Os ramos fiscais também atribuem dados de imposto e preço, portanto não fazem parte do contrato deste relatório [pas:2173-2394].

qryMovimentos é um dataset live sobre movimentos com m.numero=0, contendo Produto, Filial, data, tipo, quantidade, referência, saldos, valor, Produto/Filial de transferência, Cliente/tipo e dado fiscal [dfm:878-1015]. NovoMovimento aloca numero por movimentos_proximonumero(), fixa Produto/Filial, cliente=filial e tipocliente=L [dfm:1017-1031; pas:2444-2454].

IncluirMovimentos:

1. percorre Produtos não compostos e compostos;
2. cria movimento com quantidade do Produto;
3. usa SPT quando subtrai estoque e SET caso contrário;
4. referencia NF-<numero> S-<serie> TRANSFERENCIA, trfproduto, trffilial e dadofiscal;
5. quando a quantidade produzida é menor que o total pedido e há subtração, cria TPE para a diferença não confirmada;
6. se há futuro, cria TFR limitado ao futuro ou à diferença.

Evidência: pas:2020-2158. O registro conjunto posterior inclui Estoque, Movimentos, Produtos e Pedidos [pas:1913-1931].

**Risco de atomicidade:** a confirmação processa grupos em sequência e chama Perpetrar dentro do fluxo; estes arquivos não demonstram se falha posterior desfaz todos os grupos anteriores.

### Atualização dos Pedidos

AtualizarPedidosFiliais abre consulta com predicado em runtime, percorre Produtos, explode Listacodigopedidofilial e para cada codigo encontrado grava situacao=F e o mesmo dadofiscal [pas:642-691; dfm:1175-1221].

O vínculo Produto → códigos é lista textual e o update usa Locate repetidamente. O redesenho deve usar conjunto de códigos e atualização set-based, com regra explícita para falta, duplicidade e quantidade parcial.

### Requisição de saldo

Quando a quantidade pedida excede a recebida, ReincluirRequisicao chama dtmRequisicaoExposicao, cria uma nova linha com qtdepedida = qtdepedida - qtderecebida, copia filial/Produto/origem e grava [pas:927-950, 3833-3874]. A SQL e a transação desse outro DataModule não estão nesta fonte.

## 6. Lotes e conferência

qryLotesTransferencia lê lotestransferencia por código; o próximo código vem de lotestransferencia_proximocodigo() [dfm:2187-2246]. VerificarLoteTransferencia e GerarLoteTransferencia criam código, Usuário e data/hora e atribuem lote às linhas marcadas e sem lote [pas:2918-3017, 3273-3330].

qryLotesPedidosFiliais lista lotes distintos não nulos da requisitada, reaplicando macros da consulta-base. AbrirLotesPedidosFiliais copia macros e abre o dataset após AfterOpen [dfm:2249-2343; pas:3033-3050]. O filtro de cada Pedido percorre a lista de lotes selecionados [pas:2729-2778].

Ao desmarcar Produto já loteado, qryApagarProdutoConferencia executa DELETE em produtosconferencia com tipo TRF e binds lote/produto [dfm:2345-2376; pas:1112-1146].

qryPedidosInconsistentes combina pedidosfiliais, produtos, filiais, produtosconferencia.lido e estoques.reservaprevia, filtrando pares (lotetransferencia, produto) [dfm:2776-2892]. Há duas validações:

- qtderecebida <> lido;
- qtderecebida > reservapreviarequisitada.

Ambas montam pares em memória e injetam macros [pas:3155-3262]. VerificarProdutosNaoConferidos_ chama motor externo com lista de códigos e tipo TRF [pas:3795-3831].

## 7. Concorrência e desatualização

Os datasets usam a mesma conexão/transação central e CachedUpdates; somente o conjunto de Estoque tem FOR UPDATE no núcleo [dfm:106-124,826-876].

1. BloquearEstoque consulta/cria linhas ausentes antes de abrir o conjunto bloqueado [pas:693-746]. Sem unique/upsert protegido, dois processos podem criar a mesma linha.
2. O predicado de lock é texto concatenado e não tem ORDER BY; confirmações sobrepostas podem adquirir locks em ordens diferentes [pas:724-745].
3. Edição, pós, cancelamento e AtualizarQtdePedida chamam PedidosFiliaisDesatualizado, que consulta log e compara timestamp sem bloquear o Pedido antes da decisão [pas:2484-2519, 3374-3485, 3876-3910].
4. AfterEdit grava datahoraalteracaousuario e executa UPDATE pedidosfiliais ... WHERE codigo=:requisicao; o ExecSQL e o Perpetrar aparecem como chamadas separadas [pas:3926-3964; dfm:4232-4261].
5. As variantes de criação de lote têm pontos de Perpetrar diferentes: uma persiste o conjunto ao final, outra durante a iteração [pas:2928-3012, 3282-3325].
6. qrySeriesFiliais usa FOR UPDATE, mas pertence à fronteira fiscal excluída [dfm:774-826]; não é lock geral de Pedido.

Para o núcleo futuro: bloquear pedidos e estoque em ordem determinística; reler saldos sob lock; validar Situação/quantidades novamente; usar identidade + versão/timestamp no UPDATE; manter Estoque, Movimentos, Pedidos e Lotes na unidade atômica escolhida pelo comando.

## 8. Riscos anti-N+1

| Trecho | Padrão e risco | Direção segura |
|---|---|---|
| BloquearEstoque | qryExisteEstoque uma vez por Produto/Filial e inclusão individual. | Resolver pares distintos em lote; upsert/constraint confirmado e lock ordenado. |
| AtualizarPedidosFiliais | Produto → lista textual → Locate/Edit/Post por pedido; O(P×R). | Tabela/CTE de vínculos e UPDATE FROM com contagem afetada. |
| IncluirMovimentos | NovoMovimento e função de número por linha; Locate e varredura de pedidos por Produto/Filial. | Pré-agregar, alocar números conforme autoridade do banco e inserir set-based. |
| PedidosFiliaisDesatualizado | Uma consulta de log por linha editada/confirmada. | Consultar logs para todos os códigos de uma vez e validar sob lock. |
| FilterRecord de lotes | Cada linha percorre dataset de lotes selecionados. | Conjunto de lotes e whereIn na consulta. |
| Reatualizar | DataModule paralelo, cópia e Locate aninhado por Produto/Grupo/Filial. | Uma projeção parametrizada por Produto, sem consulta na cópia/renderização. |

No SQL, a consulta mestre usa subconsultas correlacionadas de estoques/grades [dfm:164-208]. As consultas de compras têm funções escalares por Produto/Filial — movimentos_vendido, pedidos_estoquepedido e produtospedidos_recebido_semnotaparcial — além de subconsultas de pedidos entre filiais, preço, movimento STC e pedido de compra [dfm:3013-3972]. Isso é custo repetitivo dentro do banco, não necessariamente N+1 da aplicação; medir plano e cardinalidade antes de substituir por CTE/joins.

qryComprasGruposFiliais e qryComprasFiliaisGrupo são projeções de sugestão de compras, não o agregado de Requisição. Devem ficar fora do comando de escrita; se a tela continuar exibindo-as, carregá-las separadamente e com número constante de consultas [pas:3495-3568].

## 9. Matriz de efeitos

| Fluxo | Leituras | Escritas/efeitos no escopo | Exclusões |
|---|---|---|---|
| Consulta | pedidosfiliais, Produtos, Características, Filiais, Estoques, códigos de barras e lotes | Nenhuma intencional | Projeções de notas |
| Edição | linha e pedidosfiliais_log | pedidosfiliais e timestamp | — |
| Cancelamento/Reabertura | Pedido e Estoque bloqueado | Situação/observação/quantidade e TPE/TEP/TFR quando parâmetro ativo | Emissão Fiscal Eletrônica |
| Lote/conferência | Pedido, produtosconferencia, Estoque e lotes | Associação de lote; DELETE de conferência ao desmarcar | Motor completo de conferência |
| Confirmação | Pedidos A, Estoque/Reserva, lotes e conferência | SPT/SET e ajustes TPE/TFR; fechamento de Pedido | NF-e, DANFE, impostos, duplicatas, Contrato e crédito |
| Saldo pendente | Pedido recebido/parcial | Nova Requisição no outro DataModule | SQL do outro DataModule |

## 10. Schema e dependências a confirmar

Tabelas: pedidosfiliais, estoques, movimentos, lotestransferencia, produtosconferencia, pedidosfiliais_log, filiais, produtos, caracteristicas, grades, promocoes e produtoscodigobarras.

Funções: movimentos_proximonumero(), lotestransferencia_proximocodigo(), e triggers/funções que materializam saldos de estoques a partir de movimentos. Confirmar autoridade de Perpetrar, transação de CachedUpdates, unique de (produto, filial) em estoques, índices por código/situação/filial/Produto, e índice de pedidosfiliais_log por código e alteração.

Não confirmar neste ticket: schema de dadosfiscais, notas, seriesfiliais, notaspag, vencimentos, Contratos, XML/NF-e e crédito entre filiais. Esses objetos foram identificados apenas para marcar a exclusão de Emissão Fiscal Eletrônica e Venda entre Filiais.
