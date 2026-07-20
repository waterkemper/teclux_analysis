Type: task
Status: resolved
Blocked by:

## Question

Como o data module Delphi constrói e executa todas as consultas da Ficha de Produtos — incluindo as variantes ficha/saldo/contrato para produto e lote — e quais parâmetros, macros, unions, ordenações, funções de banco, regras de sinal, saldos acumulados, custos, valores financeiros e efeitos por dimensão de estoque determinam cada resultado?

## Answer

### Fontes e conclusão central

Foram lidos integralmente `dmconsultafichaproduto.pas/.dfm` e, para interpretar a codificação de operação, `ctconstantes.pas`, `dmlancamentosmanuais.pas` e consultas correlatas de estoque.

A Ficha **não soma os lançamentos do período para reconstruir saldos**. `movimentos` e `movimentoslotes` já guardam, em cada lançamento, snapshots acumulados das dimensões de estoque e do financeiro. A tela lista esses snapshots; “SALDO ANTERIOR” copia o último snapshot anterior ao início. Portanto, a migração precisa consultar a fonte histórica autoritativa ou reproduzir uma projeção equivalente, não somar ingenuamente `quantidade`.

### Os seis datasets

| Dataset | Fonte | Papel | Atualizável |
|---|---|---|---|
| `qryFichaProduto` | `movimentos m`, left join `lotes l` | movimentos do produto no período | Sim, cached/request live |
| `qryFichaProduto_Saldo` | `movimentos m` | último snapshot do produto anterior ao período | Não |
| `qryFichaProduto_Contrato` | movimentos + produtos/contratos | detalhe histórico dos contratos encontrados | Não |
| `qryFichaProdutoLote` | `movimentos m` + `lotes l` + `movimentoslotes ml` | movimentos detalhados por lote | Sim no componente, embora não haja fluxo de gravação próprio |
| `qryFichaProdutoLote_Saldo` | `movimentos m` + `movimentoslotes ml` | último snapshot anterior por lote | Não |
| `qryFichaProdutoLote_Contrato` | mesmas fontes de contrato + `movimentoslotes` | detalhe contratual por lote | Não |

`qryMoedas` é auxiliar: faz `UNION ALL` entre uma opção nula e `moedas`, ordenada por código. Não há `UNION` nos seis datasets funcionais.

### Parâmetros e macros

Parâmetros recebidos do formulário:

- `produto`: obrigatório, identificador interno;
- `lote`: opcional, identificador interno;
- `filial`: opcional para gerente, fixa para não gerente;
- `tipomovimento`: opcional;
- `datainicial` e `datafinal`;
- `SomenteLancamentosAvulsos`;
- `VisualizarProdutosporContrato`.

Macros:

- `Linha`: fragmento SQL concatenado em Delphi;
- `CondicaoLote`: `and m.loteproduto = <ID>` ou vazio;
- `ListadeContratos`: lista literal de contratos coletada do resultado mestre; usa `'0'` quando vazia.

O período principal é inclusivo:

- `m.data >= início 00:00:00`;
- `m.data <= fim 23:59:59`.

Filial e tipo são acrescentados a `Linha` quando informados. “Somente avulsos” acrescenta `m.usuarioautorizacao is not null` somente depois de a macro de saldo por lote já ter sido configurada.

Os valores são concatenados diretamente nos fragments SQL. Produto e datas de saldo usam parâmetros; datas, filial, tipo e lote da consulta principal não. Para Laravel, usar bindings/Query Builder, nunca reproduzir concatenação.

### Sequência de execução

1. Monta `Linha` com período, filial e tipo.
2. Atribui essa versão a `qryFichaProdutoLote_Saldo.Linha`.
3. Se “avulsos”, acrescenta autorização não nula.
4. Atribui a linha final a movimentos de produto e de lote.
5. Atribui/limpa `CondicaoLote` nos quatro datasets de movimentos/saldo.
6. Reconstrói uma `Linha` sem período, contendo apenas filial e tipo, para `qryFichaProduto_Saldo`.
7. Abre movimentos do produto e movimentos por lote.
8. Abre saldo anterior do produto e saldo anterior por lote.
9. Se a grade de contrato está visível, abre os dois datasets de contrato.
10. Insere no início de `qryFichaProduto` a linha sintética de saldo anterior.
11. A linha sintética dos lotes só é inserida ao entrar na aba Lotes.

### Movimentos por produto

`qryFichaProduto` filtra `m.produto = :produto`, aplica `Linha` e `CondicaoLote` e ordena por:

`m.filial, cast(m.data as date), m.lancto`.

Retorna:

- identidade: número, lançamento, data, processamento, tipo, referência, filial, contrato e lote;
- delta do lançamento: `quantidade`;
- snapshots: `emestoque`, `reservado`, `transito`, `demonstracao`, `conserto`, `futuro`, `danificada`, `estoquefisico` e `reservaprevia`;
- operação em 14 posições;
- `valor`, preços com/sem ICMS, IPI, `financeiro`, moeda e valor em moeda;
- pedidos de cotação/aberto;
- usuário logado/autorizador e nomes;
- cliente/fornecedor;
- `naoprocessartriggers`.

O join com lote é `LEFT JOIN`; movimentos sem lote continuam presentes.

Riscos de ordenação: converter a data para `date` elimina a hora no primeiro critério e não usa `numero` como desempate. A ordem pode ser instável quando há lançamentos de mesmo dia/`lancto`.

### Movimentos por lote

`qryFichaProdutoLote` parte do movimento mestre, exige lote por `JOIN lotes` e liga `movimentoslotes ml` por `m.numero = ml.movimento`. Filtra o produto no movimento mestre, mas exibe quantidades, snapshots, operação e valores de `ml`.

Aplica `Linha` e `CondicaoLote` escritos com alias `m` e ordena:

`ml.filial, cast(ml.data as date), ml.lancto`.

O dataset declara `MasterSource = dsrFichaProduto` e `LinkFields loteproduto=loteproduto`. Isso acopla a aba ao lote da linha corrente do mestre, embora a consulta já tenha sido aberta para o produto inteiro. A implementação Laravel deve decidir explicitamente se a aba mostra todos os lotes do filtro ou segue a linha mestre; não copiar esse acoplamento por acidente.

### Saldo anterior do produto

`qryFichaProduto_Saldo` procura o último registro de `movimentos` que:

- pertence ao produto;
- possui `cast(m.data as date) < :datainicial`;
- respeita filial e tipo, quando informados;
- respeita lote, quando informado.

Ordena `data desc, numero desc, lancto desc` e usa `limit 1`. Não agrega: o registro já contém o estado acumulado.

O resultado tem data/tipo/filial visualmente nulos e referência **SALDO ANTERIOR**. O Delphi insere uma linha no início de `qryFichaProduto` e copia campo a campo o snapshot, exceto `naoprocessartriggers`. Se não existir anterior, insere linha vazia com a referência.

“Somente avulsos” **não é aplicado ao saldo anterior**. Isso é coerente se o saldo representa o estado real global antes do recorte; seria incoerente se a intenção fosse saldo apenas de avulsos. A especificação deverá nomear essa decisão.

### Saldo anterior por lote e defeito confirmado

A intenção de `qryFichaProdutoLote_Saldo` é retornar um último snapshot para cada par produto/lote anterior ao início. Usa uma tupla externa:

`(produto, loteproduto, ml.data, ml.numero, ml.lancto) IN (subconsulta agrupada por produto,lote)`.

Há dois problemas:

1. A subconsulta exige `cast(m.data as date) < :datainicial`, mas a macro `Linha` injetada nela ainda contém `m.data >= datainicial` e `m.data <= datafinal`. As condições são contraditórias; em uso normal o saldo por lote fica vazio e a tela insere uma linha sintética sem valores.
2. `MAX(ml.data)`, `MAX(ml.numero)` e `MAX(ml.lancto)` são calculados independentemente. A tupla formada pode não corresponder a nenhum registro real.

Além disso, a linha macro não recebe o filtro de “avulsos”. A migração não deve reproduzir esse SQL; deve obter deterministicamente o último snapshot anterior **por lote**, por exemplo com janela `row_number() over (partition by produto,lote order by data desc, numero desc, lancto desc)`, após definir os filtros que afetam o saldo.

`IncluirLinhaSaldoLotes` insere no dataset de lote somente uma linha **SALDO ANTERIOR**, usando o `loteproduto` da linha corrente. Mesmo que a query retornasse vários saldos, a cópia campo a campo não modela uma linha por lote de forma clara.

### Operação compactada e regras de sinal

`operacao` é uma string posicional. O enum `TtecOperacaoEstoque` confirma:

| Posição | Campo exibido | Semântica |
|---:|---|---|
| 1 | EST | Em estoque |
| 2 | RES | Reservado |
| 3 | TRÂ | Trânsito |
| 4 | DEM | Demonstração |
| 5 | CON | Conserto |
| 6 | FUT | Futuro |
| 7 | DAN | Danificado |
| 8 | FÍS | Estoque físico |
| 9 | PRV | Reserva prévia |
| 10 | U.ENT | Última entrada |
| 11 | U.COMP | Última compra |
| 12 | FIN | Financeiro |
| 13 | TVEN | Totalização de venda |
| 14 | TCOM | Totalização de compra |

A Ficha apenas extrai e mostra cada caractere com `substr`; ela não aplica o sinal. Em rotinas correlatas:

- `-` representa saída/redução e dispara validação de estoque insuficiente nas posições físicas;
- `+` representa entrada/adição; acumuladores de vendas/compras aplicam quantidade com sinal pelas posições 13/14;
- `*` representa posição ignorada/não processada em vários fluxos;
- há marcadores especiais como `C` e `=` em regras financeiras externas.

Não há no repositório SQL de triggers/procedures que materializam todos os snapshots, portanto não é seguro inventar a semântica completa de `C`/`=`. Para a consulta Laravel, o contrato mínimo é exibir o marcador histórico e os snapshots persistidos. A política de gravação pertence ao ticket de parâmetros/triggers.

### Cálculos e valores

O único cálculo próprio repetido nas consultas de movimento/contrato é:

`customedio = round(financeiro / denominador, 2)`,

com zero quando o denominador é zero. Denominador:

`emestoque + reservado + reservaprevia + transito + demonstracao + conserto + danificada`.

**Futuro e estoque físico não entram no custo médio.**

Interpretação dos campos:

- `quantidade`: quantidade do evento, não saldo;
- dimensões de estoque: saldo acumulado após/no registro;
- `financeiro`: saldo financeiro acumulado usado no custo médio;
- `valor`: valor/custo do movimento, exibido na visão alternável;
- `precocomicms`, `precosemicms`, `aliquotaipi`: valores fiscais do movimento;
- `moeda` e `valormoeda`: moeda e valor original;
- `pedcotacao` e `pedaberto`: vínculos/quantidades de pedidos persistidos no movimento.

Não há chamada a função de banco customizada nesses seis SQLs. Usam apenas recursos PostgreSQL comuns: `substr`, `cast`, `coalesce`, `round`, `sum`, `max` e subqueries.

### Cliente/fornecedor e auditoria

Cliente/fornecedor é resolvido por:

- `m.cliente + m.tipocliente` quando não há nota;
- fornecedor/tipo de `notaspag` quando `codigonota` existe.

Nomes de usuário vêm de subqueries em `usuarios` para `usuariologado` e `usuarioautorizacao`. Isso produz N+1 lógico dentro do SQL; no Laravel deve ser feito com joins/subqueries eficientes, preservando snapshot/auditoria.

### Consultas de contrato

Antes de abrir, o Delphi coleta todos os contratos distintos existentes no resultado mestre. Se nenhum, injeta `'0'`. As duas queries então:

- filtram produto;
- restringem `m.contrato in (lista)`;
- ligam `produtoscontratos`, `produtos`, `caracteristicas` e `contratos`;
- aceitam produto simples ou componente de produto composto;
- trazem situação e datas do contrato, produto/quantidade contratados;
- somam `contratosdevolvidos` por tipo `D` (devolvidos) e `T` (trocados);
- aplicam filtro em memória por filial + contrato da linha corrente.

Problemas:

- `qryFichaProduto_Contrato` declara macro `Linha`, mas ela nunca é preenchida;
- nenhuma consulta de contrato recebe período, tipo, “avulsos” ou lote;
- a consulta por lote também não restringe o lote corrente;
- logo, após achar um contrato no resultado filtrado, a grade pode mostrar todo o histórico daquele produto/contrato;
- a lista é interpolada como SQL literal;
- a regra para composto usa uma subconsulta escalar de componente e merece reescrita explícita.

Isso pode ser intenção de “histórico completo do contrato”, mas precisa ser rotulado assim. Se a expectativa for detalhe do recorte, é bug. Não decidir silenciosamente.

### Classificação para a migração

**Paridade obrigatória**

- histórico cronológico de movimentos e movimentos por lote;
- snapshots das nove dimensões;
- quantidade do evento e string/efeitos de operação;
- saldo anterior determinístico;
- custo médio com a fórmula legada;
- valores fiscais, moeda, cliente/fornecedor, contrato e auditoria;
- detalhe contratual e compostos, após definir seu recorte.

**Adaptação recomendada**

- bindings em todos os filtros;
- desempate total por timestamp, número e lançamento;
- janela SQL para último snapshot por produto/lote;
- joins eficientes para nomes e fornecedores;
- endpoint/query model somente leitura para consulta, isolando qualquer correção financeira.

**Comportamentos legados a não reproduzir**

- saldo por lote contraditório e `MAX` independentes;
- concatenação de filtros;
- lista literal de contratos;
- ordenação que descarta hora;
- acoplamento implícito mestre–lote;
- filtros de contrato silenciosamente diferentes dos filtros principais.

### Síntese

A futura Ficha deve ser construída como leitura de um ledger histórico que contém snapshots, com uma consulta principal por produto e uma projeção por lote. “Saldo anterior” é o snapshot imediatamente anterior ao intervalo, não uma soma do passado. O maior risco funcional é tentar derivar saldos apenas de `quantidade` ou transportar o SQL de saldo por lote/contrato sem corrigir e explicitar suas inconsistências.
