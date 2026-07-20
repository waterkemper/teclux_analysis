Type: task
Status: resolved
Blocked by: 01

## Question

Quais são todos os lookups e resolvers efetivamente usados em Lançamentos Avulsos no Delphi — Produto, Filial origem/destino, Tipo de Movimento, Lote e eventuais auxiliares — incluindo componentes, gatilhos, campos pesquisáveis, colunas da lupa, query, parâmetros, filtros contextuais, valor retornado, validações e efeitos ao trocar a seleção?

## Answer

Foram encontrados cinco contratos: **Filial de origem**, **Filial de destino**, **Tipo de Movimento**, **Produto** e **Lote**. Não há lookup próprio para operação, movimento existente ou autorizador; a operação vem do Tipo e a autorização ocorre em diálogo separado.

### Acionamento comum

- Filiais e Tipo usam `TtecDBFindLookup`; a lupa chama `InternoPesquisar` e a seleção grava o código no dataset.
- Produto e Lote usam o frame compartilhado `TfraConsultaProduto`, com dois `TfraConsultaCodigo`.
- Digitação direta e lupa convergem para o resolver exato; no Laravel devem produzir a mesma identidade e validações.

### Filial de origem

- **Campos:** `flkFilial`; `DataField=filial`; `LookupField=codigo`; `dsrProcuraFiliais`.
- **Resolver:** `select codigo,nome from filiais where codigo=:codigo`.
- **Lupa:** `select codigo,nome from filiais order by UPPER(TO_ASCII(nome,'latin1'))`.
- **Colunas:** **Nome** (largura 50, tamanho 40), **Código**; pesquisa por Código/Nome; retorna código inteiro.
- **Efeito:** após incluir, preserva a filial digitada; na ausência, usa `filialbase`.
- **Limitação legada:** lista todas as filiais sem autorização do usuário. Trocar filial não limpa produto/lote no código ativo; o antigo handler está comentado.

### Filial de destino

- **Campos:** `flkFilialTransferencia`; campo legado `filialtrasnferencia`; lookup `codigo`; `dsrProcuraFiliaisTransferencia`.
- **Resolver/lupa:** resolver separado com a mesma SQL da origem; lupa reutiliza `qryConsultaFiliais`, mesmas colunas e ordem.
- **Retorno/efeitos:** código inteiro; habilitada quando o Tipo tem `transferencia`; Tipo não transferencial limpa destino.
- **Validação posterior:** exige destino diferente da origem e Produto/Filial em `estoques`; com lote, lê também a projeção no destino.
- **Limitações legadas:** não exclui origem, não aplica autorização e não filtra destinos com o produto.

### Tipo de Movimento

- **Campos:** `flkTipoMovimento`; `DataField=tipomovimento`; `LookupField=codigo`; `dsrProcuraTiposMovimentos`.
- **Resolver:** `select codigo,descricao,transferencia,operacao from tiposmovimentos where codigo=:codigo and not interno and operacao<>'********************'`.
- **Lupa:** `select codigo,descricao from tiposmovimentos where not interno and operacao<>'********************' order by UPPER(TO_ASCII(descricao,'latin1'))`.
- **Colunas:** **Descrição** (DisplayWidth 70), **Código** (DisplayWidth 10; até 3 caracteres). Retorna código; o resolver traz `transferencia` e `operacao` de 20 caracteres.
- **Efeitos:** máscara habilita/limpa destino, Quantidade, custo, preços e última compra; composição do Produto também interfere em última compra.
- **Precisão:** não foi encontrado filtro `ativo`. Compatibilidade com Produto é validada depois.

### Produto

- **Campos:** `fraConsultaProduto1.fraConsultaItemProduto`; interno `produto`; visual `produtovisual`; parâmetro `:produtovisual`.
- **Resolver:** consulta Produtos, Característica, Classe, Grupo, Marca, promoção e códigos de barras. Retorna ID, código visual, descrição com grades/referência, unidade, grupo/classe, `composto`, `gerenciarloteevalidade`, IPI e auxiliares. Resolve código visual sem diferença de acento/caixa ou código de barras exato.
- **Parâmetro:** se `lancamentos_avulsos_de_produtos_compostos=false`, acrescenta `and not coalesce(c.composto,false)` ao resolver e à lupa.
- **Lupa:** full-text em `p.busca` com `plainto_tsquery(converte_texto(:textopesquisa))` e ranking. Colunas: **Código** (15), **Item de Produto** (30), **Código de Barras** (15), **Linha** (8), **Coluna** (8), e, conforme contexto, **PN** e **Produto no cliente**. ID interno oculto.
- **Retorno:** bigint `produto` canônico; `produtovisual` é apresentação.
- **Efeitos:** limpa Lote, passa ID ao lookup e torna lote obrigatório quando gerenciado. Composição interfere em última compra.
- **Limitação legada:** não filtra Filial nem existência em `estoques`; `qryExisteEstoque` valida depois. Código visual e barras funcionam na digitação direta.

### Lote

- **Campos:** `fraConsultaProduto1.fraConsultaLote`; interno `loteproduto`; visual `nrlote`; parâmetros `:produto` e `:nrlote`.
- **Resolver:** `select l.*,p.codigovisual as produtovisual from lotes l join produtos p on p.codigo=l.produto where case when nullif(:produto,'') is null then l.nrlote=:nrlote else l.produto=:produto and l.nrlote=:nrlote end`.
- **Lupa:** `select l.*,p.codigovisual,codigobarras(p.codigo),p.descricao from lotes l join produtos p on p.codigo=l.produto where true %SQLCondicao order by l.validade`; Produto é injetado pelo módulo, mas Laravel deve usar bind.
- **Colunas:** **Nº Lote** (20), **Produto** (20), **Código de Barras** (20), **Descrição do Produto** (30), **Validade**, **Fabricação**, **Inativo**, **Fora de Linha**, datas `DD/MM/YYYY`; IDs ocultos.
- **Retorno:** bigint `loteproduto` canônico e `nrlote` visível; fabricação/validade somente leitura.
- **Efeitos:** filtrado pelo Produto; troca de Produto limpa Lote; sem gestão de lote, deixa de ser obrigatório. Saldo por Filial é lido em `qryExisteEstoqueLotes`.
- **Limitações legadas:** não filtra Filial/`estoqueslotes`, saldo, vencimento, inatividade ou fora de linha. Não cria lote (`DenyInsert=True`).

### Consequências

- Distinguir **filtro da lupa**, **resolver exato** e **validação pré-INSERT**. Existência na Filial, destino diferente, estoque destino e contexto de lote não são filtros comprovados das lupas.
- Paginação, autorização por Filial, binds, estados vazio/erro e invalidação segura serão definidos no contrato Laravel, não atribuídos ao Delphi.
- O payload usa IDs/códigos canônicos; nomes, código visual e número do lote devem ser novamente resolvidos no servidor.
