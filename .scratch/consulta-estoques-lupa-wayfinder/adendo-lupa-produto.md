# Adendo — lupa enriquecida de Produto da Consulta de Estoques

## Escopo e decisão

Este documento especifica a lupa acionada no campo Produto de **Estoques → Consulta de Estoques**. Ela é diferente da lupa genérica de Produto porque apresenta uma linha por Produto+Filial, com dados de estoque e comerciais para ajudar o Usuário a escolher o Produto correto.

A adaptação Laravel será exclusiva da Consulta de Estoques. Deve reutilizar `ErpTwoColumnCatalogLookupModal` por meio de um wrapper local, sem alterar o contrato das demais lupas e sem reutilizar o endpoint comercial de Vendas.

A linha selecionada devolve somente a identidade do Produto: código interno validado, código visual e descrição. Filial, saldos, Pedidos, preços, comissões e demais valores são contexto visual e nunca alteram implicitamente o filtro separado de Filiais.

## Origem funcional comprovada

No legado, a Consulta configura o tipo `pesItemProdutosConsulta`, resolvido pela query enriquecida `qryConsultaEstoqueItemProdutos`. A seleção é posteriormente resolvida pelo código visual no dataset genérico de Produto. Por isso, várias linhas de Filiais diferentes para o mesmo Produto produzem a mesma regra de Produto.

A query funcional combina Produto, Característica de Produto, Grupo, Estoque e Filial. Modelos, Especificações, códigos de barras, Pedidos, preços e comissões são obtidos por relações/agregações ou funções. O Laravel deve reproduzir a semântica com query/service server-side e parâmetros vinculados, nunca por fragments SQL recebidos do navegador.

## Endpoint e componentes

- Wrapper frontend local sugerido: `ConsultaEstoquesProdutoLookupModal`.
- Base reutilizada: `ErpTwoColumnCatalogLookupModal`.
- Endpoint sugerido: `GET /cadastros/estoque/consulta-estoques/lookups/produtos`.
- Backend dedicado: FormRequest, action/controller, service e repository/query da Consulta.
- Pesquisa inicial: `deferred`; página padrão 25; máximo 100.
- Resposta: `data`, `meta` e manifesto/capabilities de colunas autorizadas.
- Seleção normalizada: `{ produto, codigovisual, descricao }`.

O endpoint recebe `q`, `search_field`, `page`, `per_page`, `sort`, `direction`, `filiais[]`, `situacao=ativos|inativos|ambos` e, somente quando aplicável, contexto explícito de Cliente/tipo. Toda entrada passa por whitelist e validação.

## Catálogo de colunas

| Campo | Título | Regra |
|---|---|---|
| `codigo` | — | ID interno obrigatório e oculto. |
| `nome`/`descricao` | Descrição | Obrigatória; primeira coluna; pesquisável e ordenável. |
| `valorgrade1` | Linha | Somente com `UsarGradesProdutos`; pesquisável. |
| `valorgrade2` | Coluna | Somente com `UsarGradesProdutos`; pesquisável. |
| `filial` e `filial_nome` | Filial | Visível no modo não independente; linha já autorizada. |
| `modelos_agg` | Modelos | Somente com visualização de Modelos; pesquisável. |
| `especificacoes_agg` | Especificações | Mesma regra de Modelos. |
| `mnemonico` | Mne. | Exibição somente; não pesquisar sem compilador inequívoco. |
| `emestoque` | Est. | Obrigatória; quantidade da Filial ou total autorizado identificado. |
| `reservado` | Res. | Obrigatória; quantidade da Filial da linha. |
| `futuro` | Fut. | Obrigatória; quantidade da Filial da linha. |
| `pedidos` | Pedidos | Obrigatória; calculada para Produto+Filial. |
| `preco_normal` | Preço Normal | Somente com capacidade de preços; valor por Produto+Filial. |
| `preco_promocao` | Preço Promoção | Somente com capacidade de preços; valor por Produto+Filial. |
| `referencia` | Referência | Obrigatória; pesquisável. |
| `codigovisual` | Código | Obrigatória; pesquisável; valor visual selecionado. |
| `codigobarras` | Código de Barras | Obrigatória; pesquisar na relação sem duplicar linhas. |
| `peso` | Peso Prod. | Somente com parâmetro de peso; quatro casas decimais. |
| `inativo` | Inativo | Data/situação; filtro Ativos/Inativos/Ambos ocorre no SQL. |
| `comissao_grupo` | Comiss.Grupo | Somente com capacidade de comissões; sufixo `V` ou `P`. |
| `comissao_produto` | Comiss.Prod. | Mesma regra de comissão de Grupo. |
| tipos de comissão | — | Campos internos para formatação, não colunas. |

Pesquisa avançada é uma opção de campo que usa full-text em `produtos.busca`; não deve ser serializada como uma coluna vazia. Grupo, Marca, Unidade, preço genérico, custo médio e última compra não integram esta lupa apenas por existirem em outros resultados.

Quantidades usam precisão configurada do ERP; preços usam duas casas; peso usa quatro casas. Valores numéricos devem ser serializados de modo estável e formatados de forma localizada na UI.

## Pesquisa e ordenação

- Descrição: prefixo normalizado sobre Descrição, Grades e Referência.
- Código: prefixo sobre código visual e códigos de barras; ID interno aceita igualdade numérica validada.
- Código do Produto no Cliente: somente com parâmetro ativo e Cliente/tipo explicitamente informados.
- Linha, Coluna e Referência: prefixo normalizado.
- Filial: igualdade ou prefixo validado.
- Estoques e Pedidos: comparação numérica validada.
- Preços e comissões: igualdade numérica e somente se a capacidade permitir o campo.
- Modelos/Especificações: relação `exists`/agregação server-side.
- Avançado: full-text com relevância e desempate estável.
- Ativos/Inativos/Ambos: predicado SQL antes de contagem e paginação; default Ativos.

A ordenação padrão é Descrição normalizada, Linha, Coluna, Produto e Filial, com FilialBase primeiro dentro do Produto. Cabeçalhos somente são ordenáveis quando houver chave em whitelist e expressão server-side. Todo bloco `OR` deve ser agrupado e toda query usa bindings.

## Filiais e modo consolidado

- Filiais não independentes: vazio significa todas as Filiais autorizadas; seleção explícita é intersectada/validada no servidor; retorna Produto+Filial.
- Filial não autorizada: erro, sem execução ampla e sem fallback silencioso.
- Filiais independentes: ocultar Filial e usar somente FilialBase efetiva autorizada, incluindo a regra existente para Filial virtual.
- Consolidação desativada: todos os saldos, Pedidos e preços pertencem à Filial da linha.
- Consolidação ativada pelo parâmetro legado: uma linha da FilialBase autorizada por Produto; apenas `emestoque` soma as Filiais autorizadas. O DTO retorna `estoque_scope=consolidated_authorized` e a UI exibe “Est. autorizado (total)”. Reservado, Futuro, Pedidos e preços continuam pertencendo à FilialBase.

Nunca somar Filiais não autorizadas. Se a FilialBase exigida não for autorizada, rejeitar a requisição.

## Parâmetros e capacidades

Parâmetros que alteram o contrato:

- `FiliaisIndependentes`;
- `UsarGradesProdutos`;
- `LiberarVisualizacaodeModelosProdutos`;
- `LiberarVisualizacaoPesoProdutonasPesquisas`;
- `Pesquisa_do_produto_por_filial_base_e_com_soma_total_do_estoque`;
- `PesquisarProdutonoCliente`.

O backend resolve esses parâmetros e devolve apenas o manifesto necessário à UI. Parâmetro desativado remove coluna e campo da whitelist, não apenas da tela.

Autorizações independentes:

1. autenticação, acesso ao módulo e capacidade de consultar Estoques protegem a rota;
2. saldos, Pedidos e situação são operacionais e obedecem ao acesso da Consulta e às Filiais;
3. Preço Normal/Promoção exigem capacidade nomeada de visualizar preços na Consulta;
4. comissões exigem capacidade nomeada distinta;
5. campos proibidos são omitidos do JSON e não aceitos como busca/ordenação.

## Não reproduzir

- SQL ou macros concatenados;
- precedência ambígua de `AND/OR`;
- pesquisa de código do Cliente sem Cliente explícito;
- Filial visual sem aplicação na query;
- soma de Filiais não autorizadas;
- consolidação sem rótulo de escopo;
- filtro ativo/inativo em memória;
- preços/comissões enviados para depois serem escondidos;
- coluna vazia para pesquisa avançada;
- campos pesquisáveis sem compilador;
- endpoint/regras comerciais de Vendas;
- alteração global do resolvedor ou das lupas de Produto.

## Critérios de aceite

1. A Consulta usa somente o novo endpoint; outras lupas mantêm seus contratos.
2. Cada linha normal é Produto+Filial autorizada, mas a seleção retorna somente Produto.
3. Filial vazia, explícita, não autorizada e independente obedece às regras server-side.
4. Colunas, formatos, buscas e ordenações seguem o catálogo e os Parâmetros.
5. Preços e comissões são omitidos sem as capacidades correspondentes.
6. Ativos/Inativos/Ambos é aplicado antes de `count`, `offset` e `limit`.
7. Busca avançada usa full-text; todas as demais usam whitelist, bindings e ordenação estável.
8. O modo consolidado soma somente `emestoque` autorizado e identifica claramente o escopo.
9. A paginação tem metadados coerentes e limite máximo de 100.
10. Testes cobrem acesso, capacidades, Filiais, parâmetros, campos pesquisáveis, ordenação, paginação, seleção e regressão das lupas existentes.
