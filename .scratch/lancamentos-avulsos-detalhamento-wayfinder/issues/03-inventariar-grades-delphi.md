Type: task
Status: resolved
Blocked by: 01

## Question

Quais grades existem no módulo Delphi de Lançamentos Avulsos e qual é o contrato exato de cada uma: fonte/dataset, finalidade, ordem e título das colunas, largura/formato/defaults, seleção/edição, ordenação, filtros, atualização, estados e relação com Produto, Filial, Tipo, Lote, preparação e gravação?

## Answer

### Estrutura encontrada

O Delphi possui **cinco grids somente leitura**:

1. três abas históricas — **1 - Movimentos**, **2 - Quantidades** e **3 - Valores** — alimentadas pelo mesmo dataset com os dez movimentos mais recentes;
2. **Quantidades do Produto**, snapshot corrente de `estoques`;
3. **Quantidades do Lote**, snapshot corrente de `estoqueslotes`.

O painel **Valores atuais** não é grid: são cinco campos somente leitura ligados ao snapshot do Produto — Custo Médio, Financeiro, Preço com ICMS, Preço sem ICMS e Última Compra.

### Fonte comum das três abas históricas

`qryMovimentosAnteriores` recebe `:produto` e `:filial`, consulta `movimentos m`, faz `left join lotes l on m.loteproduto=l.lote`, filtra exatamente Produto + Filial, ordena por `m.numero desc` e aplica `limit 10`. Retorna:

`emestoque, reservado, transito, demonstracao, futuro, danificada, conserto, financeiro, precosemicms, precocomicms, data, tipomovimento, referencia, quantidade, valor, nrlote`.

Assim, as três abas mostram **as mesmas linhas na mesma ordem**, variando apenas as colunas. A ordenação real é número do Movimento decrescente, embora `numero` não seja retornado nem exibido. Não há paginação, pesquisa, seleção funcional ou edição. Os grids usam seleção da linha inteira, são `ReadOnly=True`, sem delete e sem número visual da linha. O componente possui `DenySort=False`, logo o Delphi tecnicamente permite ordenação visual; isso não altera a SQL nem possui valor funcional para o comando.

#### 1 - Movimentos — `dbgUltimo`

Ordem exata:

| # | Campo | Título Delphi | Largura | Formato |
|---|---|---|---:|---|
| 1 | `data` | DATA | 70 | data, máscara `DD/MM/YYYY` |
| 2 | `tipomovimento` | TIPO | 35 | texto, até 3 |
| 3 | `nrlote` | Nº LOTE | 90 | texto, até 30 |
| 4 | `referencia` | REFERÊNCIA | 178 | texto, até 60 |
| 5 | `quantidade` | QTDE | 70 | quantidade |
| 6 | `emestoque` | ESTOQUE | 70 | saldo posterior |
| 7 | `valor` | VALOR | 92 | `###,###,##0.00` |
| 8 | `financeiro` | FINANCEIRO | 92 | `###,###,##0.00` |

`quantidade` e `emestoque` são os valores persistidos na linha histórica: magnitude informada e saldo posterior, respectivamente.

#### 2 - Quantidades — `dbgEstoqueQuantidade`

Ordem exata:

| # | Campo | Título Delphi | Largura |
|---|---|---|---:|
| 1 | `data` | DATA | 70 |
| 2 | `tipomovimento` | TIPO | 35 |
| 3 | `nrlote` | Nº LOTE | 90 |
| 4 | `emestoque` | ESTOQUE | 70 |
| 5 | `reservado` | RESERVADO | 72 |
| 6 | `transito` | TRÂNSITO | 71 |
| 7 | `demonstracao` | DEMO | 71 |
| 8 | `conserto` | CONSERTO | 71 |
| 9 | `futuro` | FUTURO | 72 |
| 10 | `danificada` | DANIFICADA | 72 |

Todos são snapshots posteriores daquele Movimento. Apesar de existirem em `movimentos`, **Estoque físico, Reserva prévia, Acabados e Semiacabados não aparecem nesta grade Delphi**.

#### 3 - Valores — `dbgEstoqueCustos`

Ordem exata:

| # | Campo | Título Delphi | Largura | Formato |
|---|---|---|---:|---|
| 1 | `data` | DATA | 70 | `DD/MM/YYYY` |
| 2 | `tipomovimento` | TIPO | 35 | texto |
| 3 | `nrlote` | Nº LOTE | 90 | texto |
| 4 | `valor` | VALOR | 105 | `###,###,##0.00` |
| 5 | `financeiro` | FINANCEIRO | 105 | `###,###,##0.00` |
| 6 | `precocomicms` | PREÇO COM ICMS | 105 | `###,###,##0.00` |
| 7 | `precosemicms` | PREÇO SEM ICMS | 105 | `###,###,##0.00` |

Não há coluna de Custo Médio histórico calculada; `valor` é o valor unitário do Movimento e `financeiro` é o saldo financeiro posterior.

### Quantidades do Produto — `dbgExisteEstoque`

- **Fonte:** `qryExisteEstoque`, cardinalidade esperada zero ou uma linha por `:produto, :filial`.
- **Colunas exatas:** **ESTOQUE** (`emestoque`), **RESERVADO**, **TRÂNSITO**, **DEMO**, **CONSERTO**, **FUTURO**, **DANIFICADA**, **RES.PRÉVIA** (`reservaprevia`) e **EST. FÍSICO** (`estoquefisico`).
- Não há larguras explícitas por coluna no DFM; o componente distribui os defaults. É somente leitura, seleção por linha, sem edição/delete e sem listras alternadas.
- A mesma query também retorna, sem exibi-los neste grid, Preços, Financeiro, Última Compra e Custo Médio calculado. Esses valores alimentam os cinco campos do painel **Valores atuais** e preenchem defaults do lançamento.
- É recarregado quando Produto ou Filial muda, desde que haja Filial positiva, e novamente após tentativa de gravação/commit. Zero linhas significa que o Produto não possui cadastro de Estoque nessa Filial e bloqueia a gravação.

### Quantidades do Lote — `dbgExisteEstoqueLotes`

- **Fonte:** `qryExisteEstoqueLotes`, cardinalidade esperada zero ou uma linha por `:produto, :lote, :filial`.
- **Colunas e ordem:** exatamente as mesmas nove de Quantidades do Produto: **ESTOQUE, RESERVADO, TRÂNSITO, DEMO, CONSERTO, FUTURO, DANIFICADA, RES.PRÉVIA, EST. FÍSICO**.
- Também não possui larguras explícitas; é somente leitura, seleção por linha e sem operações.
- O grupo inclui ao lado o **Nº do Lote** ligado ao movimento em edição.
- A SQL retorna auxiliares financeiros/preços, mas eles não são exibidos na grade e não substituem os valores agregados do Produto.
- No código observado, a recarga explícita ocorre na validação da transferência e após a tentativa de gravação, usando Produto + Lote + Filial. Não foi encontrado refresh autônomo confiável no evento de troca de Lote; essa é uma lacuna do legado, não comportamento a reproduzir.

### Atualização e estados

- O page control inicia na aba **1 - Movimentos**.
- Ao concluir a gravação, o Delphi recarrega o histórico, o snapshot do Produto e o snapshot do Lote. Isso ocorre tanto no caminho financeiro simples quanto no caminho com verificação de Custo Médio; no rollback por rejeição da confirmação, também recarrega para restaurar o estado visível.
- O histórico não é explicitamente recarregado no handler de troca de Produto/Filial encontrado; portanto pode permanecer vazio ou defasado até uma gravação. O Laravel deve tratar a escolha de Produto + Filial como gatilho de carregamento de todo o contexto.
- Sem Produto/Filial válidos, os grids devem ser considerados sem contexto, não “saldo zero”. Produto inexistente em `estoques` é erro de domínio; ausência de linha em `estoqueslotes` precisa ser distinguida de lote com saldos zerados.
- As grades são informativas e nunca participam do payload de gravação. O servidor relê contexto; a UI não soma saldos nem atualiza otimisticamente.

### Implicações para o contrato Laravel

- Preservar as cinco visões informacionais, podendo representar os snapshots de uma linha como cartões/tabela compacta, mas sem perder nenhuma das nove quantidades.
- Para o histórico, manter ordem canônica imutável do backend e limite dez; não oferecer ordenação que sugira outra cronologia.
- Incluir `numero` como chave técnica da linha no retorno Laravel, mesmo oculto, para React e testes; a ausência no SELECT Delphi é limitação técnica, não regra funcional.
- Segurança financeira deve controlar a visibilidade das duas visões que expõem Valor, Financeiro, Preços, Custo Médio e Última Compra. A política exata será fechada em **Definir contratos finais no Laravel**.
- Após commit síncrono, invalidar/recarregar conjuntamente histórico, Produto, Lote e Valores atuais a partir do servidor, pois as triggers podem criar Movimentos derivados e alterar projeções.
