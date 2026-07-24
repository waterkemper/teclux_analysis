# Definir a Grade (matriz linha/coluna) de produtos

Type: grilling
Status: resolved
Blocked by: 05, 13, 15

## Question

Como funciona a grade matricial de produtos (variantes por linha/coluna, ex.: tamanho×cor) no Cadastro de Pedidos — `GerarTabelaGrade`, `dsrGradeDataChange`, `PosicionarLinhaColunanoProduto(Pedido)(Copia)`, `GetColunadaGrade`/`GetLinhadaGrade`, `EditarGrade`, `UtilizandoGrade` (`dmcadastropedidos.pas:3502-3931,4223-4267`)? A troca linha↔coluna (`sbnTrocarLInhaColunaClick`, `fmcadastropedidosgrade.pas:240-256`) e o destaque de divergência por célula (preço/desconto/ICMS/IPI diferente do restante da grade, `GetGradePrecoDiferene`/`DescontoDiferente`/`IcmsDiferente`/`IPIDiferente`, `fmcadastropedidosgrade.pas:104-147`) — qual a regra exata de "diferente" e o que acontece ao tentar editar uma célula divergente (`dbgGradesKeyPress`, `fmcadastropedidosgrade.pas:195-225`)?

## Answer

### Estrutura dinâmica da grade (CONFIRMADO, `GerarTabelaGrade`, `dmcadastropedidos.pas:3512-3685`)

A grade **não tem schema fixo** — é uma tabela em memória (`TtecQuery` construída a partir de SQL montado em runtime) com: 1 coluna de rótulo (`LinhaColuna`, o valor da linha — ex.: cor), **N colunas dinâmicas** (`_0`, `_1`, ... uma por valor distinto de coluna — ex.: cada tamanho encontrado nas variantes do produto), e colunas fixas ao final: `quantidade` (total da linha, somatório das células, read-only), `preco`, `precodiferente`, `desconto`, `descontodiferente`, `valoricms`, `icmsdiferente`, `valoripi`, `ipidiferente`, `total` (read-only). Uma linha da grade = todas as variantes que compartilham o mesmo valor de "linha" (ex.: todas as combinações da cor Azul); uma célula = a quantidade pedida daquela combinação linha×coluna específica (ex.: Azul, tamanho M).

**Achado de nomenclatura importante**: apesar dos nomes dos campos (`valoricms`, `valoripi`), na grade eles são exibidos e tratados como **percentuais** (`DisplayLabel := 'ICMS (%)'`/`'IPI (%)'`, `:3587,3589`) — diferente do restante do sistema (tickets 05/13-16), onde `valoricms`/`valoripi` no item são sempre **valores monetários**. Não confundir os dois contextos ao especificar os campos no Laravel.

### Preenchimento e divergência (CONFIRMADO, mesma rotina)

Para cada linha, ao preencher as células: acumula a quantidade total; para preço/desconto/ICMS/IPI, guarda o **último valor não-zero encontrado** como representativo da linha, e marca a flag "diferente" correspondente assim que encontra uma célula com valor não-zero **diferente** do já guardado. Ou seja, "diferente" significa: pelo menos duas variantes preenchidas na mesma linha têm preço (ou desconto, ou ICMS%, ou IPI%) diferentes entre si.

### Edição de célula (CONFIRMADO, `dsrGradeDataChange`, `dmcadastropedidos.pas:3732-3855`)

- Editar uma **célula de quantidade** (uma das colunas dinâmicas `_N`): localiza o produto da combinação linha×coluna numa tabela de staging (`qryCopiaProdutosPedidos`); se já existe, atualiza a quantidade; se não existe e o valor digitado é diferente de zero, **cria uma nova linha de staging**, copiando preço/desconto/ICMS%/IPI% dos campos **atuais da linha da grade** (ou seja, uma célula nova herda os valores já uniformes da linha, não zerados). Recalcula o total da linha e `CalcularTotalGrade`.
- Editar **preço/desconto/ICMS%/IPI% no nível da linha** (as colunas fixas): propaga esse valor para **todas** as linhas de staging que pertencem àquela linha da grade (bulk-update) — é assim que definir o preço uma vez na grade aplica a mesma condição fiscal/comercial a todas as variantes daquela cor/linha de uma vez.

### Trava de edição quando divergente (CONFIRMADO — mais preciso que o achado do ticket 01)

`CalcularTotalGrade` (`dmcadastropedidos.pas:4098-4187`) recalcula as flags "diferente" e, crucialmente, **define `ReadOnly` diretamente nos campos da grade** (`qrygrade.FieldByName('preco').ReadOnly := vprecodiferente`, idem desconto/ICMS/IPI) — não é só um aviso de UI (`MensagemAviso` em `dbgGradesKeyPress`, ticket 01), é uma trava **no próprio dado**: quando uma linha tem valores divergentes entre suas células, o campo correspondente no nível da linha fica fisicamente bloqueado para edição em lote, até que a divergência seja resolvida item a item (fora da grade).

### Achado — POSSÍVEL BUG LEGADO na fórmula do total de IPI

```pascal
vipi := vipi + qryCopiaProdutosPedidospreco.AsCurrency -
        Truncar((quantidade × preco × (100 − valoripi%)) / 100, 2);
```

Comparado com a fórmula equivalente de desconto (`dmcadastropedidos.pas:4141-4144`), que corretamente multiplica a diferença por `quantidade`:

```pascal
vdesconto := vdesconto + (preco − truncar(preco × (100−desconto%)/100)) × quantidade;
```

A fórmula do IPI **soma `preco` sem multiplicar por quantidade**, enquanto a parte subtraída já usa `quantidade × preco`. Para `quantidade = 1` o resultado bate; para `quantidade > 1`, o termo `preco` isolado (não multiplicado) produz um valor de IPI total incorreto no resumo da linha (confirmável algebricamente: com preco=100, valoripi=10%, quantidade=2, a fórmula resulta em −80, um valor negativo sem sentido para um total de imposto). **Não replicar esta fórmula tal como está** — especificar a versão corrigida, simétrica à do desconto: `vipi += (preco − truncar(preco×(100−valoripi%)/100)) × quantidade`.

### Decisão

Especificar a grade como uma visualização/edição em lote (matriz dinâmica linha×coluna, dimensões descobertas em runtime a partir das variantes do produto), com: quantidade por célula editável diretamente; preço/desconto/ICMS%/IPI% editáveis só no nível da linha (aplicam a todas as células da linha); bloqueio de edição em lote quando a linha já tem valores divergentes entre células (obrigando resolução item a item); e troca de orientação linha↔coluna preservando os dados. Corrigir a fórmula de total de IPI (bug confirmado) em vez de replicá-la. Reaproveitar a mesma listagem de Produtos Similares/página lateral já descrita nos tickets 01/05 quando aplicável.
