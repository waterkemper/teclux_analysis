# Definir Itens do Pedido (produtos)

Type: grilling
Status: resolved
Blocked by: 03

## Question

Qual o contrato completo de um item de pedido (`GravarProdutoPedido`, `IncluirProdutoPedido`, `ExcluirProdutoPedido`, `dsrProdutosPedidosDataChange`, `qryProdutosPedidosprodutoChange`, `dmcadastropedidos.pas:2134-2304,2810-3219`)? Campos por linha, validação de fornecedor (`VerificarProdutosFornecedor`), e como Produtos Similares/substitutos (`RefazConsultaProdutosSimilares`, `dmcadastropedidos.pas:4402-4430`) se encaixam aqui — é o mesmo conceito `produtos_similares` já confirmado no ticket 08 do mapa de Consulta de Compras, ou algo distinto nesta tela?

## Answer

### Ciclo de vida do item (CONFIRMADO, `dmcadastropedidos.pas:2134-2304,1792-1841`)

- **Incluir** (`IncluirProdutoPedido`): tem dois modos — normal (`Editar=false`, `qryProdutosPedidos.Append`, `quantidade` começa em 0) e edição de linha existente (`Editar=true`, reabre para edição). Em ambos, `CalculodeImpostosBloqueado` fica `true` durante a preparação para não disparar o motor de impostos num registro incompleto.
- **Gravar** (`GravarProdutoPedido`): valida campos obrigatórios (`CheckRequiredFields`) e `VerificarProdutosFornecedor` (ver abaixo); tem uma ramificação inteiramente distinta quando a edição está vindo do fluxo de **grade** (`dsrProdutosPedidos.DataSet <> qryProdutosPedidos` — nesse caso grava em `qryCopiaProdutosPedidos`/`qryGrade` em vez do item real, ver ticket 09). No modo normal, ao postar o item recalcula as Previsões (`CalcularPrevisoes`, ticket 04) — mudar quantidade/preço de um item muda o valor total do pedido, que precisa redistribuir as parcelas.
- **Excluir** (`ExcluirProdutoPedido`): tem dois modos via o parâmetro `HouveTrocaFornecedor` — exclusão normal de uma linha (com confirmação), ou **wipe completo de todos os itens** quando o fornecedor do pedido é trocado no meio da edição (os itens ficam presos ao catálogo do fornecedor anterior, então trocar de fornecedor exige recomeçar a lista de itens do zero). Após excluir, recalcula impostos (`CalcularImpostos(false, true)`) e previsões.

### Validação de fornecedor (CONFIRMADO, `VerificarProdutosFornecedor`, `dmcadastropedidos.pas:2789-2807`)

Ao incluir um item, verifica se a característica do produto já está cadastrada para o fornecedor do pedido (`qryFornecedorProduto`). Se **não** estiver, pergunta ao usuário se quer cadastrar essa associação produto↔fornecedor na hora (`ctINCLUIRPRODNOFORNECEDOR`); se confirmado, insere o vínculo automaticamente (`qryFornecedorProduto.Append`). **Decisão de UX a levar para o Laravel**: o cadastro do vínculo produto-fornecedor não é uma tela separada obrigatória — pode nascer implicitamente ao comprar dele pela primeira vez, mediante confirmação.

### Troca de produto (CONFIRMADO, `qryProdutosPedidosprodutoChange`, `dmcadastropedidos.pas:5249-5280`)

Ao selecionar/trocar o produto de uma linha, dispara duas rotinas **globais/compartilhadas** (não exclusivas deste módulo): `AtribuirDadosProdutos` (preenche dados descritivos do produto) e `AtribuirDadosCalculosImpostos` (preenche a classificação fiscal padrão do produto — NCM, CFOP, CSOSN/CST, alíquotas default) — e então `CalcularImpostos`. **Esta é a porta de entrada para o motor de impostos (ticket 07)**: a maior parte de `dsrProdutosPedidosDataChange` (a partir de `dmcadastropedidos.pas:2842` em diante — campos `precodigitado`, `quantidade`, `preco`, e uma dúzia de campos de ICMS/ICMS-ST: `percentualreducaobase`, `valorreducaobase`, `icmsbasecalculo`, `aliquotaicms`, `icmsvalor`, `pMVAST`, `fatorsubstituicao`, `predbcst`, `reducaobasest`, `icmsbasecalculost`, `aliquotaicmsst`, `icmsvalorst`) é o próprio motor de impostos reagindo a edição manual campo a campo, cada um marcando uma flag "digitado" (`valoricmsdigitado`/`valoricmsstdigitado`) para o motor saber que aquele valor foi sobrescrito pelo usuário e não deve ser recalculado por cima — **deliberadamente não detalhado aqui, é o escopo do ticket 07**.

Uma trava de negócio notável nesse handler: **não é permitido reduzir a `quantidade` de um item abaixo do que já foi recebido** (`TotalRecebido`) — reverte para o valor anterior com aviso, se violado.

### Produtos Similares (CONFIRMADO — mesmo conceito de Consulta de Compras)

`RefazConsultaProdutosSimilares` só reconsulta `qryProdutosSimilares` (mesma tabela `produtos_similares` já confirmada no ticket 08 do mapa de Consulta de Compras) sempre que o produto ativo muda — é um painel informativo lateral, sem escrita, sem cálculo próprio. Nada de novo a especificar aqui além de "reaproveitar o mesmo componente/consulta".

### Decisão

Especificar o item do pedido com: ciclo incluir/gravar/excluir acima, a auto-criação (com confirmação) do vínculo produto-fornecedor, o wipe total de itens ao trocar fornecedor, a trava de quantidade mínima = já recebido, e apontar toda a superfície de campos fiscais (`dsrProdutosPedidosDataChange` a partir da linha 2842) para o ticket 07, sem duplicar a investigação aqui.
