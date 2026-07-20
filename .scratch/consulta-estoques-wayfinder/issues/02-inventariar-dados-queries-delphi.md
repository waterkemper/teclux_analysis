# Inventariar datasets, queries e regras de cálculo Delphi

Type: task
Status: resolved
Blocked by:

## Question

Quais datasets, queries, joins, subqueries, funções de banco, macros, parâmetros SQL, campos calculados, agregações, ordenações e transformações existem em `dmconsultaestoque`, e como cada um alimenta filtros, abas, resultados, totais e operações da consulta?

## Answer

### Visão geral

`TdtmConsultaEstoque` é um data module stateful: recebe condições SQL prontas dos frames, injeta-as como macros, abre uma consulta mestre e, a cada mudança de linha ou aba, reexecuta datasets dependentes. O conjunto mestre usa `estoques` para Produtos normais, `estoqueslotes` + `lotes` para a perspectiva por lote, uma relação de similares para Produtos Similares e `produtoscompostos` para Componentes.

Fontes centrais: `delphi/apps/estoque/dmconsultaestoque.pas:18-679,698-2095` e `delphi/apps/estoque/dmconsultaestoque.dfm:1-4459`.

### Consulta mestre e efeito colateral estatístico

`qryConsultaEstoques` executa duas instruções SQL em sequência:

1. insere cada Produto distinto selecionado em `estoques_estatistica`, junto de `:datahora`, `:filialbase` e `:usuario_logado`;
2. repete a seleção e devolve as linhas detalhadas (`dmconsultaestoque.dfm:161-218,449-482`).

`CONFIRMADO` — Os parâmetros de auditoria são preenchidos imediatamente antes da abertura com data/hora do servidor, Filial base e Usuário logado (`dmconsultaestoque.pas:1954-1961`). Portanto, **Gerar não é uma leitura pura**: toda consulta bem encaminhada registra estatística dos Produtos correspondentes.

O núcleo faz joins entre:

- `estoques e`;
- `filiais f`;
- `produtos p`, com `left join promocoes pro`;
- `caracteristicas c`;
- `ipi i`;
- `grupos g`;
- `classes cl`;
- `marcas m` (`dmconsultaestoque.dfm:179-191,449-461`).

Ordenação: descrição do Produto sem acentos e sem diferença de caixa (`UPPER(TO_ASCII(...,'latin1'))`), seguida de `sequencia`. A Filial base recebe sequência `0`; demais Filiais recebem seu próprio código, fazendo a Filial base aparecer primeiro dentro de cada Produto (`dmconsultaestoque.dfm:339-340,482`).

### Macros e filtros

As condições produzidas pelos frames entram como fragmentos SQL textuais, não parâmetros bind. Macros da consulta mestre: `Filial`, `Classe`, `Marcas`, `Modelos`, `Especificacoes`, `Grupo`, `Item`, `Produto`, `produtos`, `Promocoes`, `LocalizacaoEstoque`, `LotesProdutos`, `Atributos` e `estoque` (`dmconsultaestoque.dfm:90-160,194-210`).

Mapeamento confirmado:

- Item → expressão sobre `p.codigovisual`;
- Produto/Característica → `c.codigovisual`;
- Grupo → `g.codigo`;
- Classe → expressão direta do frame;
- Marca → `m.codigo`;
- Promoção → `pro.codigo`;
- Localização → `e.localizacao`;
- Modelo e Especificação → `c.codigo in (...)` via `modeloscaracteristicas` + `modelos`;
- Lote → Produto precisa existir em `lotes`; na perspectiva por lotes, restringe `e.lote`;
- Atributos → expressão JSON aplicada tanto à consulta mestre quanto à consulta por lotes (`dmconsultaestoque.pas:847-892,1796-1811,1864-1905,1934-1951,2019-2075`).

`CONFIRMADO` — A Filial segue três regras:

- `FiliaisIndependentes=True`: força `e.filial = FilialBase` em Produtos, Similares e Componentes;
- Filial informada: força o código digitado nos mesmos três datasets;
- Filial vazia: não adiciona restrição (`dmconsultaestoque.pas:853-873`).

`DIVERGENTE` — `SetFilial` não configura uma macro equivalente em `qryConsultaEstoquesLotes`; contudo essa query é aberta por Produto a partir do resultado mestre. Isso significa que a aba de Lotes pode listar lotes de todas as Filiais mesmo quando a consulta mestre foi filtrada por uma Filial. Deve ser validado funcionalmente na especificação (`dmconsultaestoque.pas:853-873,1963-1968`; `dmconsultaestoque.dfm:3735-3755`).

Flags binárias só geram SQL quando exatamente um lado do par está marcado:

- Em Linha → `not p.foralinhal and not c.foralinhal`;
- Fora de Linha → `p.foralinhal or c.foralinhal`;
- Ativo → `p.inativo is null`;
- Inativo → `p.inativo is not null`;
- Com/Sem Montagem → `c.montagem` / `not c.montagem`;
- Brinde/Não Brinde → `c.brinde` / `not c.brinde`;
- Disponível/Não disponível no site → `p.aparecernosite` / negação (`dmconsultaestoque.pas:726-756`).

Com os dois marcados ou os dois desmarcados, o par não restringe. `Sem Estoque Zero` usa `quantidadetotaldoestoque(produto,filial) <> 0`; por lote usa `quantidadetotaldoestoquelote(produto,lote,filial) <> 0` (`dmconsultaestoque.pas:718-724,759-760`).

### Campos derivados da linha mestre

Além dos campos persistidos de `estoques`, Produto e Característica, a consulta calcula:

- `ultimacompra_com_icms`: para CSOSN 101/102, `valorultimacompra + (precocomicms-precosemicms)`; nos demais casos, `valorultimacompra`;
- `customedio`: `financeiro` dividido pela soma de Em estoque, Reservado, Reserva prévia, Em trânsito, Demonstração, Conserto e Danificada; zero quando o denominador é zero;
- `estoquevenda`: Em estoque + Reservado + Reserva prévia;
- `estoquetotal`: Estoque venda + Em trânsito + Demonstração + Conserto + Danificada;
- última Nota Fiscal de Entrada de compra não emitida por Filial, via `notaspag`, `produtosnotaspag` e `ehnotafiscalentradacompra`;
- promoção, inatividade e fora de linha por `estoques_produtoempromocao`, `estoques_produtoinativo` e `estoques_produtoforalinha`;
- preço atual por `estoques_preco(produto,filial)`;
- código de barras por `CodigoBarras(produto)`;
- situação tributária resumida `I/N/F/T`, derivada de `c.incidencia`;
- unidade, produção própria/terceiros, arredondamento, CEST, classificação fiscal, peso, composição, grupo, comissão e sublocalização;
- agregados textuais distintos de Modelos e Especificações via `string_agg` (`dmconsultaestoque.dfm:251-444`).

Uma camada externa acrescenta nome do Fornecedor da última entrada, CST/CSOSN usados na Nota Fiscal pela empresa e pelo Fornecedor e indicador de Fornecedor no Simples (`dmconsultaestoque.dfm:218-248`).

`POSSÍVEL BUG LEGADO` — A expressão `... = null` usada para detectar `fornecedornosimples` nunca é verdadeira em SQL padrão; quando a subconsulta retorna `NULL`, o `CASE` tende a produzir `NULL`, não `False` (`dmconsultaestoque.dfm:240-246`).

### Perspectivas derivadas

#### Produtos Similares

`qryConsultaEstoquesSimilares` replica quase todos os campos do mestre e encontra similares por dois mecanismos:

- Características ligadas na tabela `similares`, em ambas as direções;
- vínculos explícitos em `produtos_similares`.

Pode ainda exigir igualdade de `valorgrade1` ou `valorgrade2` conforme `caracteristicas.agrupamentosimilares`. Exclui o Produto original e ordena por descrição e Filial (`dmconsultaestoque.dfm:1161-1456`).

`POSSÍVEL BUG LEGADO` — `GetProdutoSimilarInativo` devolve `qryConsultaEstoquesSimilaresprodutoforalinha`, em vez de `produtoinativo`; a cor de “inativo” em Similares pode, portanto, refletir apenas Fora de Linha (`dmconsultaestoque.pas:1587-1595`).

#### Lotes

`qryConsultaEstoquesLotes` usa `estoqueslotes e join lotes l`, mantém os mesmos dados fiscais/comerciais do mestre e acrescenta número e validade do lote. É aberta pelo Produto ativo e pode receber filtros de lote, atributos e quantidade total diferente de zero (`dmconsultaestoque.dfm:3463-3757`; `dmconsultaestoque.pas:1963-2017`).

#### Componentes

`qryConsultaEstoquesComponentes` parte de `produtoscompostos`, liga o Produto componente a Produto/Característica/Marca/Grupo/IPI e aos Estoques por Filial. Acrescenta quantidade, unidade, preço unitário e total (`quantidade * preço`) da composição. Filtra por `pc.composto = :composto` e aceita Filial (`dmconsultaestoque.dfm:2338-2547`; `dmconsultaestoque.pas:1670-1674`).

#### Grade

`qryConsultaLinhaColuna` cruza elementos de `grade1` e `grade2` e liga as combinações aos Produtos da Característica e Filial, calculando Em estoque, Estoque total, promoção e preço atual (`dmconsultaestoque.dfm:1718-1821`).

`GerarTabelaGrade` altera linhas específicas do SQL conforme existam uma ou duas dimensões, cria dinamicamente um `TtecQuery` em memória e monta uma matriz. Cada célula contém:

`Produto` + quebra de linha + `Em estoque/Estoque total` + quebra de linha + preço atual.

A matriz é ordenada pelos valores de grade e reposicionada na combinação do Produto mestre (`dmconsultaestoque.pas:1286-1515`).

### Datasets por perspectiva interna

- **Acumuladores** — `qryVendasAcumuladas` interpreta o 13º caractere de `movimentos.operacao`; `qryComprasAcumuladas`, o 14º. Somam quantidades com sinal por Produto, Filial e mês/ano, ordenando do período mais recente (`dmconsultaestoque.dfm:851-948`). O operador PostgreSQL `@` obtém valor absoluto antes da aplicação do sinal.
- **Pedidos resumidos** — `pedidos_estoquepedido(produto,filial)` retorna quantidade por Filial. Com Filiais independentes, o Delphi percorre todas as Filiais, soma os resultados e grava o total no dataset em memória (`dmconsultaestoque.dfm:980-1018`; `.pas:1597-1612`).
- **Preços** — combina coluna normal e coluna promocional vigente de `colunasprecos`; aplica fator da Filial por `fatoresprecosfiliais`, soma normal/promoção e devolve validade, alteração e descrição (`dmconsultaestoque.dfm:1022-1157`). Depois da abertura, promoção vencida é apagada apenas do dataset de apresentação (`dmconsultaestoque.pas:922-926,1244-1248,1709-1713,2005-2009`).
- **Preços por Cargo** — usa `produtoscargos.markup` e `estoques_preco(produto,filial,markup)` (`dmconsultaestoque.dfm:1929-1996`).
- **Colunas de Preço** — lista todas as colunas da Característica e tabela de preço, com valor, validade, data e alteração (`dmconsultaestoque.dfm:2251-2334`).
- **Preço por Cliente** — lê `clientesprodutos`, trazendo Cliente, Produto no Cliente, preço e última venda (`dmconsultaestoque.dfm:2070-2123`).
- **Última compra editável** — lê `estoques.valorultimacompra` por Produto + Filial base (`dmconsultaestoque.dfm:2000-2036`).
- **Modelos** — lista `modeloscaracteristicas` + `modelos` para a Característica do Produto (`dmconsultaestoque.dfm:2127-2183`).
- **Pedidos detalhados** — `produtospedidos` + `pedidos` nas situações `A` e `P`; calcula pendência por `pedidos_estoquepedido_semnotaparcial` e mantém apenas valores positivos (`dmconsultaestoque.dfm:2187-2247`).
- **Estoques por depósito/Filial da Grade** — `qryEstoque` lista Filiais com `emestoque <> 0`; opcionalmente injeta `tipofilial='D'` quando `SoVisualizarEstoqueDeposito` (`dmconsultaestoque.dfm:2805-2844`; `.pas:1755-1780`).
- **Fornecedores** — usa `fornecedoresprodutos`/`fornecedores` e dados do último Movimento/Nota Fiscal de Entrada para preço, IPI e data. Há uma versão `_slow` preservada no DFM, mas a tela usa `qryFornecedoresProdutos` (`dmconsultaestoque.dfm:2896-3235`).
- **Notas pendentes de entrada** — cruza `nsus`, `nsus_prod`, Fornecedor, Filial, associação Produto–Fornecedor e código de barras; exclui notas já presentes em `notaspag` e eventos cancelados, aceitando correspondência por código/descrição/infAdProd/código de barras (`dmconsultaestoque.dfm:3239-3387`).
- **Atributos** — expande definição e valores JSON com `json_to_recordset` e `json_each_text`; transforma booleanos em Sim/Não e numéricos para vírgula decimal (`dmconsultaestoque.dfm:4080-4173`).
- **Licitações** — lê Licitação/Cliente/Produto, usa `situacao_licitacao`, calcula Saldo pendente descontando entregas, custo médio total combinado e alíquota ICMS. Só retorna `SaldoPendente > 0`; a situação padrão é `ABERTO` (`dmconsultaestoque.dfm:4177-4459`). `TotalSaldoPendente` é calculado no Delphi como saldo × preço (`dmconsultaestoque.pas:2079-2087`).

### Sincronização por linha e aba

`qryConsultaEstoques.AfterScroll` abre datasets da aba ativa, acumuladores, ajusta validade promocional, fecha Similares/Modelos obsoletos, dispara atualização de títulos de grade e define campos editáveis conforme o Usuário (`dmconsultaestoque.pas:914-962`). Similares, Lotes e Componentes possuem ciclos equivalentes (`dmconsultaestoque.pas:1228-1264,1692-1725,1988-2017`).

`AbrirTabelasEstoque` escolhe parâmetros a partir de `TipoConsultaProduto` e só abre datasets caros quando sua aba está ativa: preço/cargo/colunas, Cliente, última compra, Pedidos, NSU, Fornecedores e Licitações (`dmconsultaestoque.pas:999-1219`). A consulta Laravel deve preservar essa carga sob demanda ou adotar contrato equivalente, evitando executar todas as consultas por linha.

### Escritas disparadas pelos datasets

- `qryAtualizarEstoque` grava `maximo` e `minimo` por Produto + Filial após post no mestre ou Similar. `localizacao` está comentada no `UPDATE`, apesar de o campo existir na interface (`dmconsultaestoque.dfm:2848-2895`; `.pas:1814-1861`).
- `qryAtualizaValorUltimaCompra` grava `valorultimacompra` por Produto (`dmconsultaestoque.dfm:2040-2069`).

`POSSÍVEL BUG LEGADO` — A leitura da última compra usa Produto + Filial base, mas o `UPDATE` filtra somente Produto. Editar o valor aparentemente altera **todas as Filiais daquele Produto** (`dmconsultaestoque.dfm:2000-2054`; `.pas:1620-1637`). Não reproduzir como regra obrigatória sem decisão explícita.

### Outras observações e lacunas encaminhadas

- `CONFIRMADO` — Formatos de quantidade vêm de `ParSistema.MascaraQuantidadeGrade`; peso só fica visível com `LiberarVisualizacaoPesoProdutonasPesquisas` (`dmconsultaestoque.pas:773-809,1647-1667,1981-1986`).
- `CONFIRMADO` — Comissão é formatada com sufixo `V` quando tipo `V`, senão `P`; zero produz texto vazio (`dmconsultaestoque.pas:1907-1932`).
- `CONFIRMADO` — `ReFazConsultaTabelas` fecha Filial, Preços, Pedidos, acumuladores, mestre e Grade, mas não enumera todos os datasets dependentes (`dmconsultaestoque.pas:894-912`).
- `POSSÍVEL BUG LEGADO` — `AbrirTabelaConsultaEstoques` retorna `qryConsultaEstoques.IsEmpty`; portanto `True` significa ausência de resultado, convenção inversa ao nome (`dmconsultaestoque.pas:763-770`).
- `NÃO LOCALIZADO` — A implementação interna das funções de banco `quantidadetotaldoestoque`, `quantidadetotaldoestoquelote`, `estoques_preco`, `pedidos_estoquepedido`, `pedidos_estoquepedido_semnotaparcial`, `situacao_licitacao`, funções de Licitação e seleção de ICMS não está definida nos quatro arquivos centrais. Seus contratos observados estão documentados; aprofundar sua implementação só será necessário se a comparação Laravel revelar ausência de equivalente.
