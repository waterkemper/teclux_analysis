# Pesquisa de SQLs, parâmetros e dados — Cadastro de Inventário Delphi

## Escopo e método

Este dossiê cataloga os SQLs embutidos no DFM, a montagem dinâmica no Pascal e os parâmetros de `TtecParametrosSistema` usados pelo Cadastro de Inventário. As fontes primárias são:

- `delphi/apps/estoque/dmcadastroinventario.dfm` — SQLs, macros, binds e datasets.
- `delphi/apps/estoque/dmcadastroinventario.pas` — execução, montagem de macros, gravação e transações.
- `delphi/apps/estoque/fmcadastroinventario.pas` e `fmcadastroprodutosinventario.pas` — chamadas de pesquisa e regras de edição.
- `delphi/biblio/clparametrossistema.pas` — catálogo, leitura e conversão dos parâmetros.

Classificação: **CONFIRMADO** vem do SQL ou chamada observável; **INFERIDO** é uma consequência funcional; **DÚVIDA** exige decisão posterior; **NÃO LOCALIZADO** não foi encontrado no escopo; **DIVERGENTE** indica evidências conflitantes; **POSSÍVEL BUG LEGADO** indica risco preservado para decisão do contrato Laravel.

## Resumo executivo

- **CONFIRMADO:** `qryInventario` lê um registro por `numero` em `inventario` e busca o nome da Filial por subconsulta em `filiais` (`dmcadastroinventario.dfm:7-112`).
- **CONFIRMADO:** `qryInventarioProduto` é a leitura principal do grid. Parte dos saldos vem de `inventarioprodutos` quando processado; antes do processamento, saldos e valores são reconstruídos por várias subconsultas em `movimentos`, `estoques`, `grades` e `QuantidadeTotalDoEstoque` (`dmcadastroinventario.dfm:120-630`).
- **CONFIRMADO:** a geração usa `qryEstoques_Anterior` ou `qryEstoques_Atual`, copia o SQL para `qryEstoques`, injeta filtros por macros e executa `INSERT` em lote em `inventarioprodutos` e, quando aplicável, `inventarioprodutoslotes` (`dmcadastroinventario.dfm:1213-1695`; `dmcadastroinventario.pas:1366-1525`).
- **CONFIRMADO:** a gravação do processamento cria movimentos `IE+`, `IE-`, `IR-` e `IP-` por produto/lote em `qryMovimentos`, dentro de chamadas `Perpetrar` e `Rollback` (`dmcadastroinventario.pas:826-1280`).
- **CONFIRMADO:** há exclusão direta de produtos gerados pelo sistema e de movimentos do inventário (`dmcadastroinventario.dfm:2364-2386,4026-4047`; `dmcadastroinventario.pas:464-477,1680-1687`).
- **CONFIRMADO:** não foi localizada chamada literal a `parametros_valor('', '')` nas units pesquisadas. A tela usa propriedades de `ParSistema`, cuja implementação lê `FList[...]` em `clparametrossistema.pas`.
- **POSSÍVEL BUG LEGADO:** `qryInventarioProximo` usa `select coalesce(max(numero),0)+1` (`dmcadastroinventario.dfm:811-832`), sujeito a colisão concorrente; a especificação Laravel não deve reproduzir `MAX()+1`.
- **POSSÍVEL BUG LEGADO:** a geração injeta listas e condições SQL por macros textuais (`dmcadastroinventario.pas:1371-1518`); o Laravel deve substituir isso por DTOs tipados, binds e `IN`/`= ANY(array)`/`unnest`.
- **POSSÍVEL BUG LEGADO:** o grid usa múltiplas subconsultas correlacionadas por produto e por lote. O prompt deve exigir uma leitura set-based, evitando N+1 lógico e consultas repetidas por linha.

## Datasets e SQLs por finalidade

### Cabeçalho e leitura do Cadastro

| Dataset | SQL/efeito | Evidência |
|---|---|---|
| `qryInventario` | `select *` de `inventario` por `numero`, com nome da Filial por subconsulta em `filiais` | `dmcadastroinventario.dfm:7-112` |
| `qryInventarioProximo` | `select coalesce(max(numero),0)+1 as numero from inventario` | `dmcadastroinventario.dfm:811-832` |
| `qryNovoInventario` | Dataset vazio (`select * from inventario where false`) para copiar/criar Inventário | `dmcadastroinventario.dfm:2462-2528`; `dmcadastroinventario.pas:1868-1884` |
| `qryInventarioTransferido` | Busca inventários cujo `transferidopara` aponta para o inventário atual | `dmcadastroinventario.dfm:2568-2610` |
| `qryInventarioAberto` | Busca outros inventários abertos da mesma Filial, excluindo o atual | `dmcadastroinventario.dfm:2617-2668` |

### Grid de Produtos e saldos

`qryInventarioProduto` lê `inventarioprodutos` (`ip`) junto de `produtos` (`p`) e `caracteristicas` (`c`), projetando código visual, descrição, grades, localização, sublocalização, saldos, custo, financeiro, diferença e indicadores de saldo negativo. Para inventário aberto, as colunas são calculadas por subconsultas correlacionadas em `movimentos` e `estoques`; para processado, usam os valores persistidos em `ip` (`dmcadastroinventario.dfm:120-630`).

Os binds observáveis incluem `filial`, `data`, `processamento`, `MovimentoProcessado` e `inventario`. O histórico seleciona o último movimento por `data desc, lancto desc limit 1`. A coluna `movimentado` soma movimentos por posições da string `operacao`; custos usam `financeiro`, estoques e `QuantidadeTotalDoEstoque`.

`qryProdutoEstoque` calcula os saldos auxiliares de um único Produto, usando os mesmos filtros temporais e posições de `operacao`, além de localização/sublocalização (`dmcadastroinventario.dfm:834-1054`; chamada em `dmcadastroinventario.pas:779-797`). O fluxo atual recarrega esse dataset ao mudar Produto ou os binds do inventário (`dmcadastroinventario.pas:779-797,1309-1317`).

`qryInventarioProdutoTransferencia` lê produtos não selecionados pelo sistema para transferência, com produto, descrição, grades e localização (`dmcadastroinventario.dfm:2675-2774`).

### Geração de Produtos por filtros

`qryEstoques_Atual` e `qryEstoques_Anterior` são templates de geração. Ambos inserem em `inventarioprodutos`; também inserem lotes quando a característica exige controle de lote/validade (`dmcadastroinventario.dfm:1213-1695`).

As relações observadas são:

- `estoques` → `produtos` → `caracteristicas` → `classes`, `grupos`, `marcas`;
- `produtos` → `promocoes` por `p.promocao = pro.codigo`, atualmente como `LEFT JOIN`;
- `inventarioprodutos` → `inventario`, `produtos`, `caracteristicas`, `estoques`, `estoqueslotes`;
- histórico do saldo em `movimentos` e `movimentoslotes`.

Os filtros montados em Pascal são:

- exclusão dos produtos já pertencentes ao inventário: `inventarioprodutos`/`inventario`;
- itens selecionados, Produtos, Grupos, Classes, Marcas e promoções;
- Grupos de Fornecedores e Fornecedor via `fornecedoresprodutos`;
- Localização;
- descrição com `to_ascii(... ) ilike ...`;
- Em Linha/Fora de Linha;
- Ativo/Inativo;
- Produtos Compostos;
- quantidade diferente de zero, opcional;
- quantidade de lotes diferente de zero, opcional.

As macros são definidas em `dmcadastroinventario.pas:1366-1518`. O legado injeta listas textuais como `%SQLFiltroGrupos`, `%SQLFiltroClasses`, `%SQLFiltroMarcas`, `%ListaCondicionalPromocoes` e `%SQLFiltroItemProdutos`. Isso é evidência do comportamento legado, não contrato aceitável para o Laravel.

`qryIncluirInventarioProdutosLotes` repete a mesma geração para inclusão posterior, com `setval('chave', :sequencia)`, `nextval('chave')` e inserts set-based (`dmcadastroinventario.dfm:4867-5072`).

### Saldos por lote

`qryInventarioProdutoLotes` e `qryInventarioProdutoLotesTotais` calculam saldos e diferenças para `inventarioprodutoslotes`. A leitura usa `movimentoslotes`, `estoqueslotes`, `lotes`, `produtos`, `caracteristicas` e `grades`, com histórico por `data desc, lancto desc` (`dmcadastroinventario.dfm:4086-4860,5415-6084`).

`qryProdutoEstoqueLotes` é a consulta auxiliar de saldo por lote e repete as somas por posições de `operacao` (`dmcadastroinventario.dfm:5097-5413`).

### Processamento e movimentos

`qryMovimentos` tem SQL inicial com `where /* Preenchido em runtime */ False`; o Pascal o abre para receber linhas de movimentos (`dmcadastroinventario.dfm:1056-1211`; `dmcadastroinventario.pas:923-1191`). Os campos gravados incluem Produto, Filial, data do inventário, quantidade, valor de custo, tipo de movimento, referência, lote e flag de exceção.

Para Produto sem lote, as diferenças positivas geram `IE+`; diferenças negativas abatem, na ordem observada, estoque (`IE-`), reserva (`IR-`) e reserva prévia (`IP-`). O abatimento de trânsito está comentado (`dmcadastroinventario.pas:935-1047`). Para Produto com lote, a mesma lógica usa `loteproduto` (`dmcadastroinventario.pas:1066-1191`).

`qryAtualizaInventarioAntesProcessamento` atualiza saldos calculados em `inventarioprodutos` e `inventarioprodutoslotes` (`dmcadastroinventario.dfm:3534-3995`). `qryAtualizaInventarioAposProcessamento` atualiza campos de processamento depois de persistir os movimentos (`dmcadastroinventario.dfm:2806-3098`).

`qryQuantidadeNaoInventariada` conta itens do inventário que serão zerados (`dmcadastroinventario.dfm:3997-4024`). `qryExisteMovimentacaoPosterior` verifica movimentação posterior ao inventário (`dmcadastroinventario.dfm:4049-4084`). `qryMovimentosNegativoPosteriores` lista saldos negativos posteriores à data de processamento (`dmcadastroinventario.dfm:2388-2455`).

`qryApagarMovimentosInventario` remove movimentos por `inventario`; `qryApagarProdutosNaoInventariados` remove produtos com `selecionadosistema` (`dmcadastroinventario.dfm:2364-2386,4026-4047`).

## Parâmetros do Sistema

### Chamadas efetivamente usadas

Não há ocorrência literal de `parametros_valor('', '')` nas units pesquisadas. O contrato legado passa por `ParSistema`, que resolve propriedades em `FList[...]` de `TtecParametrosSistema` (`clparametrossistema.pas:2416-2429` e getters individuais).

| Propriedade | Uso no módulo | Evidência |
|---|---|---|
| `MascaraQuantidadeGrade` | Formatação das quantidades do grid e relatório | `dmcadastroinventario.pas:428-450,2481`; getter em `clparametrossistema.pas:7849-7866` |
| `UsarGradesProdutos` | Visibilidade de valor de grade 1/2 | `dmcadastroinventario.pas:690-691`; `fmcadastroinventario.pas:187-188`; getter em `clparametrossistema.pas:7488-7495` |
| `LimitedeDiasParaProcessamentoInventario` | Bloqueia processamento após limite de dias | `dmcadastroinventario.pas:826-840`; getter em `clparametrossistema.pas:6928-6936` |
| `Inventariar_Produtos_Compostos` | Exclui ou inclui produtos compostos na geração | `dmcadastroinventario.pas:1515-1518`; `fmcadastroprodutosinventario.pas:165`; getter em `clparametrossistema.pas:6337-6345` |
| `PesquisaPadraoProdutoCodigoBarras` | Escolha do campo de pesquisa do Produto | `dmcadastroinventario.pas:2095-2154`; constante/getter em `clparametrossistema.pas:2574-2582` |
| `PermitirProdutoAlfanumerico` | Aceita código visual alfanumérico na pesquisa/edição | `dmcadastroinventario.pas:2099-2154`; `fmcadastroinventario.pas:229`; getter em `clparametrossistema.pas:4819-4827` |
| `ValordaQuantidade` | Decide se quantidade aceita valor fracionário/monetário na edição | `fmcadastroprodutosinventario.pas:381,482`; getter em `clparametrossistema.pas:7568-7575` |
| `QtCasasDecimaisQuantidade` | Formatação decimal da quantidade editada | `fmcadastroprodutosinventario.pas:397,919`; getter em `clparametrossistema.pas:6853-6860` |

O Laravel deve resolver esses parâmetros por um serviço tipado e escopo explícito de Filial, sem transformar o nome da propriedade em filtro textual ou consultar diretamente a tabela de parâmetros em cada linha do grid.

## Riscos de tradução para Laravel

1. **N+1 lógico:** as projeções do grid fazem múltiplas subconsultas correlacionadas em `movimentos`, `movimentoslotes`, `estoques` e `estoqueslotes`. Usar CTEs, agregações, `DISTINCT ON`/window functions ou joins set-based conforme o schema capturado; carregar dados auxiliares em lote.
2. **Listas SQL textuais:** substituir todas as macros de lista por arrays validados e `whereIn`, `= ANY(array)` ou `unnest`. Nunca interpolar IDs, filtros ou expressões recebidas do cliente.
3. **`MAX()+1` e `setval/nextval`:** confirmar no snapshot o objeto `chave` e sua autoridade. Não reproduzir `MAX(numero)+1`; escolher a autoridade de numeração e garantir concorrência.
4. **`LEFT JOIN` indevido:** o `LEFT JOIN promocoes` só deve permanecer se a relação for opcional e os campos envolvidos permitirem ausência. Para relações obrigatórias e `NOT NULL`, usar `INNER JOIN`.
5. **Gravação em laço:** preservar a semântica de movimentos, mas avaliar insert em lote/set-based dentro de uma transação atômica, com bloqueio e revalidação. Não usar uma query por Produto ou por lote sem justificativa.
6. **SQL de dataset vazio:** `where false` é apenas técnica de edição do legado; o contrato Laravel deve expor operações explícitas, não depender de datasets editáveis ou de SQL montado em runtime.
7. **Cancelamento:** qualquer consulta F6 longa deve iniciar com Cancelar disponível e possuir cancelamento real do backend PostgreSQL; o cancelamento visual não é suficiente.
8. **Schema:** os objetos abaixo são candidatos e precisam ser validados no snapshot antes de qualquer SQL Laravel.

## Objetos candidatos ao snapshot do schema

### Relações

`inventario`, `inventarioprodutos`, `inventarioprodutoslotes`, `produtos`, `caracteristicas`, `classes`, `grupos`, `marcas`, `promocoes`, `filiais`, `fornecedoresprodutos`, `estoques`, `estoqueslotes`, `movimentos`, `movimentoslotes`, `lotes`, `grades`, `parametros`, `parametrosfiliais`.

### Funções, sequences e outros

- `QuantidadeTotalDoEstoque` — usada no cálculo de custo e financeiro (`dmcadastroinventario.dfm:385-473,3474-3487,5736-5802`).
- Sequence/objeto `chave` — usado por `setval`/`nextval` na geração de sequências (`dmcadastroinventario.dfm:1305-1313,1579-1587,4958-4966`).
- Triggers, constraints, índices e FKs das relações acima, especialmente os que garantem identidade de Inventário/Produto/Lote, integridade de movimentos e concorrência da sequência.

## Lacunas e decisões para os próximos tickets

- **DÚVIDA:** nulabilidade e cardinalidade reais de todas as relações ainda dependem do snapshot autoritativo.
- **DÚVIDA:** a autoridade de `chave` e a estratégia correta de numeração do Inventário e da sequência de itens precisam ser decididas com o schema.
- **DÚVIDA:** a regra de custo quando `QuantidadeTotalDoEstoque = 0` precisa ser transformada em contrato explícito.
- **DIVERGENTE/POSSÍVEL BUG LEGADO:** o legado usa joins antigos e macros textuais em caminhos distintos (`qryEstoques_Anterior`, `qryEstoques_Atual`, `qryInventarioProdutoTransferencia`); não assumir que a forma SQL antiga é a forma segura para Laravel.
- **NÃO LOCALIZADO:** chamada direta a `parametros_valor('', '')` no módulo.

## Guardrails para prompts futuros

Os prompts devem consultar este dossiê e o snapshot, usar binds e projeções explícitas, proibir N+1, concatenação SQL, `MAX()+1`, teste de driver, `hasTable`/`Schema::has*`, introspecção de schema em runtime e reabertura direta dos fontes Delphi.
