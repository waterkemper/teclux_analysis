# Prompt mestre para `/speckit.specify`

```text
/speckit.specify

Crie uma especificacao funcional e tecnica unica para ajustar somente o Laravel e padronizar a leitura/digitacao exata de Produto em todos os fluxos do ERP.

## Contexto

Leia antes de especificar:

- `modules/estoque/leitura-codigo-produto/dossie.md`;
- `modules/estoque/leitura-codigo-produto/pesquisa-auditoria-ficha-entradas-estoque.md`;
- `modules/estoque/leitura-codigo-produto/auditoria-filtros-consultas-produtos.md`;
- `modules/estoque/leitura-codigo-produto/auditoria-demais-entradas-laravel.md`;
- `laravel/CONTEXT.md`.

Inspecione os arquivos Laravel reais citados nesses documentos e atualize as referencias de linha. Nao investigar Delphi, nao alterar Delphi e nao implementar nesta etapa.

## Contrato obrigatorio

Defina um resolvedor compartilhado de Produto que aceite texto correspondente a:

1. `produtos.codigo`;
2. `produtos.codigovisual`;
3. `produtoscodigobarras.codigobarras`.

O texto deve permanecer textual durante a consulta e preservar zeros a esquerda. O contrato retorna `not_found`, `resolved` ou `ambiguous` com candidatos. Nunca escolher silenciosamente quando houver mais de um Produto. Nesse caso, a interface abre a tela de selecao. Barcode resolve Produto, nunca Caracteristica.

Defina a normalizacao canonica, igualdade, caixa, acentos, espacos, duplicidade, origem do match, limites, erros e compatibilidade PostgreSQL/SQLite. A PK interna continua sendo a unica identidade persistida e usada nos comandos.

## Arquitetura

Defina uma primitive/servico e DTO unicos para endpoints de lookup. O `CatalogCodeLookup` e componentes de UI apenas apresentam loading, encontrado, nao encontrado, ambiguidade e erro; nao conhecem SQL nem implementam precedencia.

Filtros paginados devem usar uma primitive SQL equivalente, com parametros e `EXISTS` em `produtoscodigobarras`, sem carregar o catalogo para PHP. Preserve a diferenca entre busca exata de identificacao e busca parcial exploratoria por descricao, referencia, lote ou barcode.

## Superficies obrigatorias

Inclua contratos, arquivos-alvo, impacto e criterios de aceite para:

- Ficha de Produtos: resolve, prefill, lupa e listagem;
- Consulta de Estoques e componentes de Estoque;
- Lançamentos Avulsos;
- Inventario e Conferencia;
- inclusao/edicao de item em Orcamentos, incluindo modal, lupa, quantidade, preco, estoque, filial e duplicidade;
- Pedidos de Compra;
- Listas Padrao;
- Transferencia para Exposicao;
- Venda Perdida e componentes genericos de catalogo;
- filtros de Produtos, Estoques, Contratos e Orcamentos.

Para cada superficie, classifique o caminho atual, a mudanca necessaria, o endpoint/servico reutilizado e o comportamento que deve permanecer parcial. Revalide no backend Produto ativo/elegivel, filial, estoque, preco, fornecedor, lote, grade, autorizacao e demais invariantes antes de gravar.

## Testes e entrega

Inclua matriz de testes unitarios PHP, feature HTTP/PostgreSQL e frontend React/TypeScript para: codigo interno, visual numerico e alfanumerico, barcode com zeros, varios barcodes, colisao, duplicidade, inexistente, inativo, filial, Produto versus Caracteristica, lupa versus digitacao, busca parcial versus exata, paginação, selecao, teclado, loading, erro, resposta assincrona obsoleta, quantidade, preco, estoque, lote e concorrencia.

Produza criterios de aceite ponta a ponta e liste riscos de performance/indices. A especificacao deve ser suficiente para o fluxo posterior `/speckit.plan`, `/speckit.tasks` e `/speckit.implement`, sem mandar o proximo agente pesquisar Delphi.

Fora de escopo: Delphi, schema legado, correcao de dados duplicados, substituicao da PK por codigo visual/barcode e implementacao nesta etapa.
```
