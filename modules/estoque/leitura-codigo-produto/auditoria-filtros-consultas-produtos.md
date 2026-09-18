# Auditoria Laravel — filtros e consultas de Produtos

## Escopo e método

Auditoria estática somente do checkout Laravel em `C:\teclux_analysis\laravel\backend`.
Não foram consultados Delphi, fontes Delphi ou comparações com Delphi, e nenhuma
implementação foi alterada. As linhas abaixo são referências ao estado auditado.

O ticket `.scratch/leitura-codigo-produto-wayfinder/issues/04-auditar-filtros-e-consultas-de-produtos.md`
continua dependente da decisão do contrato canônico do ticket 01. Portanto, as
classificações “adotar exato” abaixo são recomendações de superfície; a precedência
entre `codigo`, `codigovisual` e barcode permanece uma decisão pendente.

## Resumo executivo

| Superfície | Comportamento atual | Barcode no caminho | Paginação/ordenação | Classificação para a mudança |
|---|---|---:|---|---|
| Cadastro de Produtos / lookup de itens | Filtro por nome e código; código visual prefixado; barcode só como coluna/filtro específico | Não no campo `codigo`; sim em `codigo_barras` | `count` + `forPage`, default 25, teto 100; ordenação whitelist | Manter parcial para catálogo; lookup de identificação deve ser exato |
| Ficha de Produtos | Endpoint de resolução exata por `codigovisual` ou `EXISTS` em barcode; listagem separada e parcial | Sim na resolução; sim em busca específica, mas via expressão/`MIN` | `count` + `forPage`, default 25, teto 100; ordenação whitelist | Adotar exato no resolve; manter parcial na listagem |
| Consulta de Estoques | Lookup de produto inclui visual, barcode e código interno; nome/referência/grades prefixados | Sim em `applyCodigoSearch` | `count` + `offset/limit`, contexto recebe page/per-page; sort whitelist | Adotar exato apenas no lookup/entidade; manter parcial na grade |
| Filtros de Contratos | Regras por abas; `codigo` exato numérico; `codigovisual` somente `eq`; descrição contains/not_contains | Não | Consulta principal `count` + `forPage`; consulta de seleção limitada a 2000 | Barcode deve entrar somente na resolução exata/novo campo, não transformar descrição em exata |
| Filtros de Orçamentos | Mesmo compilador de filtros; fallback de item usa `produtosorcamentos.produto = ?` | Não | `count`, soma e `forPage`; default 50, teto 200 | Barcode deve resolver para produto antes do filtro/seleção |
| Inclusão de item em orçamento | Resolve `codigo` interno, depois visual exato, depois barcode exato | Sim | Não é listagem | Adotar exato; preservar zeros como texto no barcode/visual |
| Filtros compartilhados por Característica | Aba `produto` representa `caracteristicas`; campos `caracteristica`, `codigo`, `codigovisual`, descrição | Não para produto/barcode | Depende da consulta consumidora; lookup de entidade é pontual | Distinguir Característica de SKU; não usar barcode para resolver Característica |

## 1. Cadastro e pesquisa de Produtos

### Listagem/lookup paginado

O endpoint do cadastro está em `routes/web.php:1706-1714` para os lookups de
características/itens e a implementação principal da busca de itens está em
`app/Http/Controllers/Estoque/FichaProdutosController.php` (o cadastro usa o
mesmo conjunto de tabelas e a rota de Produtos é declarada em
`routes/web.php:1436-1447`). A busca de Produtos observada em
`VendaProdutoPesquisaService.php:38-60`:

- normaliza `page` para no mínimo 1 e `perPage` para 1..100, default 25
  (`:46-55`);
- faz `produtos p JOIN caracteristicas c JOIN estoques e`, restringindo produto
  ativo, característica disponível no sistema e filial (`:60-67`);
- aplica preço positivo via `estoques_preco(...)` no PostgreSQL ou `EXISTS` em
  `colunasprecos` no SQLite (`:276-295`);
- calcula total por `count(p.codigo)`, busca com `offset/limit` e devolve meta de
  paginação (`:120-150`, `:203-215`);
- ordena por código, referência ou descrição normalizada; no modo avançado usa
  `ts_rank_cd` sobre `p.busca` (`:90-117`).

No modo `search_field=codigo`, o SQL atual é código interno somente quando o
termo é numérico, ou `codigovisual ILIKE termo%`; não há `produtoscodigobarras`
nesse ramo (`VendaProdutoPesquisaService.php:318-331`). Nome e referência são
buscas de prefixo (`:344-350`), enquanto o modo avançado é full-text
(`:334-341`). Portanto, não tratar essa listagem como resolvedor exato.

O lookup paginado específico da Ficha confirma a mesma separação em
`FichaProdutosController.php:358-445`: `q` e `search_field` são validados, o
default é nome, `codigo` aceita visual prefixado ou código interno numérico
(`:415-424`), `codigo_barras` faz `LIKE '%q%'` sobre `codigobarras(p.codigo)`
no PostgreSQL ou sobre uma subconsulta `MIN(pcb.codigobarras)` no SQLite
(`:395-401`, `:425-437`), e a busca “all” combina descrição/visual/grades/barcode
e texto avançado (`:431-440`). O total e as páginas são calculados antes de
`orderBy(...)->forPage(...)`, com default 25 e teto 100 (`:447-478`).

Conclusão: campos de catálogo e seleção exploratória devem continuar parciais
(prefixo para código visual/nome e contém para colunas explicitamente “all” ou
barcode). A tecla Enter/blur, quando pretende identificar um item, deve usar um
endpoint exato separado.

### Resolução exata da Ficha

`FichaProdutosController::resolveProduto` valida texto de até 50 caracteres e
faz um único `first` sobre `produtos p`, com:

```sql
p.codigovisual = :texto
OR EXISTS (
  SELECT 1
  FROM produtoscodigobarras pcb
  WHERE pcb.produto = p.codigo
    AND pcb.codigobarras = :texto
)
```

Evidência: `FichaProdutosController.php:314-343`. O resultado é 404 quando não
há correspondência (`:345-347`). Este endpoint não tenta `p.codigo` numérico,
não normaliza caixa/acento e não declara tratamento de ambiguidade; esses pontos
dependem do ticket 01. A rota é
`routes/web.php:2492-2499`.

O prefill de produto da Ficha é diferente: para termo numérico usa
`p.codigovisual = termo OR p.codigo = int(termo)` e para não numérico somente
`p.codigovisual = termo`; não consulta barcode
(`FichaProdutosController.php:649-668`). Esse é um segundo gap de consistência.

## 2. Consulta de Estoques

O endpoint é `routes/web.php:1844-1846`. O serviço monta o contexto de filial,
consolidação, permissões, página, tamanho e ordenação em
`ConsultaEstoquesProdutoLookupService.php:41-115`; se `q` estiver vazio, retorna
lista vazia sem consultar o repositório (`:117-139`). O resultado inclui
`current_page`, `per_page`, `total` e `last_page` (`:157-179`).

O repositório é `LegacyConsultaEstoquesProdutoLookupRepository.php`:

- conta antes da página e usa `offset(($page - 1) * $perPage)->limit($perPage)`
  (`:44-71`);
- constrói SQL diferente por driver. No PostgreSQL, barcode exibido é
  `CAST(codigobarras(p.codigo) AS varchar(50))`; no fallback, é uma subconsulta
  `MIN(pcb.codigobarras)` (`:90-129`), selecionado como `codigo_barras`
  (`:141-149`);
- junta `produtos`, `caracteristicas`, `estoques`, `filiais` e opcionalmente
  `grupos`; em modo consolidado soma `estoques.emestoque` por produto nas
  filiais autorizadas (`:153-179`);
- despacha `search_field` para descrição, código, referência, grades, filial,
  números, modelos/especificações, visual, barcode e avançado
  (`:227-241`).

Em `applyCodigoSearch`, a busca combina `p.codigovisual` com prefixo e um
`EXISTS` em `produtoscodigobarras` com o mesmo padrão; código interno numérico
e código de produto de cliente também são alternativas
(`LegacyConsultaEstoquesProdutoLookupRepository.php:324-368`). Assim, o campo
“código” desta grade é parcial, não um resolvedor exato. O campo
`codigo_barras` também é parcial e, no SQL exibido, usa subconsulta agregada;
isso é funcional, mas tende a ser mais caro que `EXISTS` para filtrar.

Filtros de característica/produto são regras independentes compiladas em SQL,
com `AND` entre abas e possibilidade de negação; a integração aparece em
`LegacyConsultaEstoquesProdutoLookupRepository.php:1101-1120` e o compilador
em `AnaliseEstoquesProductFilterCompiler.php:64-117`. Lotes e atributos usam
`EXISTS` correlacionado (`:125-141`, `:207-223`), portanto não devem ser
misturados com a resolução de SKU.

## 3. Ficha de Produtos e estoques relacionados

Além do lookup exato da Ficha, o endpoint de lotes usa `nrlote LIKE '%q%'`,
conta e pagina com `forPage` (`FichaProdutosController.php:576-588`). Isso é
busca parcial de lote, não busca de produto, e fica fora da adoção de código
exato.

Os endpoints de item/estoque da ficha recebem o produto interno como parâmetro
numérico e validam pertencimento à característica antes de consultar
(`ProdutoCaracteristicaController.php:343-401`, `:468-490`). Não há texto de
barcode nesses caminhos; a resolução deve ocorrer antes, na camada de lookup,
sem alterar a semântica de pertencimento à Característica.

## 4. Filtros de Contratos

`LegacyConsultaContratosRepository.php:19-26` declara que a listagem aplica o
filtro de produto diretamente no SQL. A consulta conta sem JOIN direto que
duplique contratos (`:88-92`), calcula agregados, e pagina a listagem com
ordenação por nome/data e `forPage` (`:119-128`). A consulta de seleção em lote
tem limite default 2000 e ordena antes de `limit` (`:337-375`).

As regras por aba tornam explícita a distinção entre Produto (característica)
e Item produto (SKU): ambas usam `produtoscontratos pc JOIN produtos p`, e a aba
`produto` pode também juntar `caracteristicas c`
(`:622-630`). O vínculo final é `EXISTS (... WHERE pc.contrato = contratos.numero
AND ...)` (`:667-670`), evitando duplicação de contrato.

Para `produto`/`item_produto`, o SQL atual é:

- `field=caracteristica`, somente na aba produto: `p.caracteristica = ?` ou `<>`
  (`:686-692`);
- `field=codigo`: `p.codigo = ?` ou `<>`, aceito apenas se o valor for numérico
  (`:693-698`);
- `field=codigovisual` com `eq`: `lower(trim(p.codigovisual)) =
  lower(trim(?))` (`:699-705`);
- descrição: igualdade normalizada ou `contains/not_contains`, compilado por
  `ProductFilterTextSearchSql` (`:706-714`).

Não existe ramo de barcode nessa construção. O registro de campos/operações
confirma que `item_produto` e `produto` oferecem `codigo` e `codigovisual`, mas
não `codigo_barras` (`ProductFilterFieldOperatorRegistry.php:18-28`). A UI
compartilhada usa as abas “Item produto” e “Produto” e aponta o catálogo de
Característica para `/cadastros/produtos/lookup/caracteristicas`
(`resources/js/Components/erp/vendas/ProductFilterPanel.tsx:24-28`, `:138-140`).

Recomendação: manter `contains/not_contains` e a semântica declarativa nos
filtros; acrescentar resolução exata de texto para seleção de entidade somente
quando o campo representar SKU. Barcode não deve resolver a aba
`produto`/Característica.

## 5. Filtros e consulta de Orçamentos

`LegacyOrcamentoConsultaRepository.php:34-51` conta orçamento, calcula soma e
pagina com default 50/teto 200 via `forPage`. A ordenação é whitelist de colunas
do orçamento e desempate por código (`:180-199`).

O filtro de Produto é um `EXISTS` sobre `produtosorcamentos po` ligado ao
orçamento, com joins adicionais por aba para característica, fiscal, promoção,
lote ou atributos (`:295-323`). O fallback simples aceita somente
`field=codigo`, operador `eq/neq`, valor numérico, e compara diretamente
`po.produto` (`:329-369`). O compilador compartilhado trata visual/descrição
como filtros de Produto em outras consultas, mas não barcode. Portanto, digitar
barcode no filtro atual não produz resolução de `po.produto`.

A inclusão de item em orçamento é uma superfície diferente e já tem resolução
exata em `OrcamentoProdutoInclusaoService.php:99-130`. A ordem atual é:

1. se houver `produto` explícito, usa o código interno;
2. se o texto for numérico, tenta `produtos.codigo` após conversão para inteiro
   (`:347-354`);
3. tenta igualdade case-insensitive com trim em `produtos.codigovisual`
   (`:356-362`);
4. tenta igualdade em `produtoscodigobarras.codigobarras`
   (`:364-368`).

Após resolver, busca o Produto por código e valida ativo, característica,
estoque da filial, preço e duplicidade (`:132-172`; regras detalhadas em
`:493-523`). Essa superfície deve permanecer exata, mas o tratamento de
precedência, zeros à esquerda, caixa e ambiguidade precisa ser alinhado ao
ticket 01.

## 6. Política textual e impacto de performance

`ProductFilterTextSearchSql.php:9-41` define que `contains` e `not_contains`
respeitam os curingas fornecidos pelo operador; o sistema não adiciona `%`
automaticamente nesse tipo de filtro. A política comum em
`ErpLegacyTextSearch.php:56-82`, `:110-160` e `:162-205` diferencia prefixo de
substring e, no PostgreSQL, gera `to_ascii(COALESCE(col,''), 'latin1') ILIKE ?`.
Isso preserva a semântica textual e acentos, mas funções sobre a coluna podem
impedir uso de índice B-tree comum.

Riscos observados, sem `EXPLAIN` nem medição de banco nesta auditoria:

- filtros `LIKE '%...%'`/`ILIKE '%...%'` em descrição, barcode, grades e
  agregados são candidatos a varredura; preferir prefixo quando o contrato
  permitir e considerar índices de expressão/trigram adequados ao PostgreSQL;
- `lower(trim(p.codigovisual))`, `to_ascii(...)` e casts de código são
  funcionalmente úteis, mas exigem índice de expressão correspondente se forem
  mantidos em caminhos frequentes;
- subconsultas agregadas `MIN(pcb.codigobarras)` usadas para exibição/filtro
  (`FichaProdutosController.php:395-397`; `LegacyConsultaEstoquesProdutoLookupRepository.php:116-120`)
  podem custar mais que `EXISTS` para resolver “há barcode igual?”;
- `count` separado da página é esperado pelo contrato de meta, mas custa uma
  segunda consulta; em grades grandes, limites, filtros seletivos e índices
  compostos devem ser verificados com plano real;
- `offset` degrada em páginas profundas. Não trocar por cursor sem decisão de
  contrato, porque os consumidores atuais expõem `current_page`/`last_page`.

Índices a verificar (não criar nesta auditoria):

- `produtos(codigo)` e `produtoscodigobarras(codigobarras, produto)` para
  igualdade exata;
- `produtos(codigovisual)` para igualdade/prefixo, ou índice de expressão se a
  normalização continuar no SQL;
- `estoques(produto, filial)` e, conforme o plano, `estoques(filial, produto)`;
- índices das FKs usadas nos `EXISTS`: `produtoscontratos(contrato, produto)`,
  `produtosorcamentos(orcamento, produto)`, `lotes(produto, nrlote)` e
  `atributos_produtos(codigo)`.

## 7. Matriz de gaps para os próximos tickets

| Gap | Evidência | Tratamento recomendado para especificação |
|---|---|---|
| Ficha resolve visual/barcode, mas não código interno numérico | `FichaProdutosController.php:327-343` | Decidir se endpoint exato aceita `p.codigo` como terceiro candidato |
| Prefill da Ficha não aceita barcode | `FichaProdutosController.php:649-668` | Unificar com resolvedor exato ou declarar prefill fora do contrato |
| Listagem de Produtos `search_field=codigo` não consulta barcode | `VendaProdutoPesquisaService.php:318-331` | Manter como filtro parcial ou acrescentar modo explícito de código/barcode |
| Consulta de Estoques campo código é parcial | `LegacyConsultaEstoquesProdutoLookupRepository.php:324-368` | Separar lookup exato de grade exploratória |
| Filtros de Contratos não têm barcode | `LegacyConsultaContratosRepository.php:686-714` | Resolver barcode para SKU antes de gerar regra, sem afetar Característica |
| Filtros de Orçamentos não têm barcode | `LegacyOrcamentoConsultaRepository.php:329-369` | Adicionar contrato específico para seleção exata de SKU |
| Inclusão de orçamento usa precedência própria e converte numérico em inteiro | `OrcamentoProdutoInclusaoService.php:347-368` | Alinhar com contrato canônico e preservar texto dos códigos |
| Normalização varia entre igualdade, `lower(trim())`, `TO_ASCII` e igualdade literal | `ProductFilterTextSearchSql.php:187-218`; `ConsultaContratosFilterEntityLookupService.php:193-214` | Fixar política de caixa, acento, trim, padding e duplicidade no ticket 01 |

## Limites desta entrega

Este arquivo é relatório de pesquisa para alimentar a consolidação do Wayfinder.
Não implementa resolvedor, não altera SQL, não cria índices, não cria prompts
`speckit.specify` e não investiga Delphi. Os prompts/dossiê da pasta
`modules/estoque/leitura-codigo-produto/` ficam para o ticket 07 após a decisão
canônica e a consolidação dos demais tickets de auditoria.
