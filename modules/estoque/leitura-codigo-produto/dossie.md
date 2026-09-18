# Dossie — leitura exata de Produto

## Objetivo

Padronizar no Laravel as entradas que identificam Produto por `produtos.codigo`, `produtos.codigovisual` ou `produtoscodigobarras.codigobarras`. O texto digitado permanece texto durante a resolucao, inclusive zeros a esquerda.

Este dossie e somente Laravel. Nenhuma alteracao de Delphi, schema legado ou dado duplicado faz parte dele.

## Contrato decidido

Uma resolucao exata retorna exatamente um dos estados: `not_found`, `resolved` (um Produto) ou `ambiguous` (dois ou mais Produtos). As fontes sao consultadas por igualdade textual. Codigo de barras nunca e convertido em inteiro. Colisao nao escolhe vencedor silenciosamente e abre a tela de selecao.

Produto (SKU) e Caracteristica (familia) sao entidades distintas. Barcode pode resolver Produto, mas nao resolve Caracteristica.

## Arquitetura

Criar um resolvedor compartilhado em camada de suporte/dominio, com DTO tipado e consulta parametrizada. Endpoints de lookup usam o resolvedor. `CatalogCodeLookup` apenas apresenta estados, trata loading/erro e abre a tela de selecao em `ambiguous`; nao conhece SQL nem decide precedencia.

Filtros paginados nao carregam o catalogo para PHP. Usam primitive SQL equivalente, com `EXISTS` para `produtoscodigobarras`, mantendo lookup exato separado de busca parcial. Todo comando revalida no servidor Produto, ativo/elegivel, filial, estoque, preco, duplicidade e regras do consumidor.

## Estado auditado

- Ficha de Produtos: `resolveProduto` cobre visual/barcode, mas prefill, lupa e listagem divergem.
- Estoque/Lancamentos/Inventario: ha cobertura parcial de barcode e caminhos que usam `MIN(codigobarras)` ou lookup diferente.
- Orcamentos: `OrcamentoProdutoInclusaoService` ja resolve PK/visual/barcode no POST; a lupa nao cobre barcode de forma equivalente.
- Filtros: `ProductFilterVisualCodeResolver` resolve parte dos filtros de vendas; compiladores de Contratos/Orcamentos nao incluem barcode de modo uniforme.
- Compras, Listas e Venda Perdida: possuem lacunas de resolucao exata.

Relatorios: `pesquisa-auditoria-ficha-entradas-estoque.md`, `auditoria-filtros-consultas-produtos.md` e `auditoria-demais-entradas-laravel.md`.

## Aceite e testes

O mesmo texto produz o mesmo conjunto de Produtos em digitacao, lupa e endpoint exato. Barcode `021037` nao perde zeros. Colisao abre selecao. Busca parcial permanece parcial. Produto inativo ou fora do escopo nunca e selecionado. Nenhuma tela grava barcode no lugar da PK.

Cobrir fontes, normalizacao adotada, zeros, barcode alternativo, duplicidade, colisao, inexistente, Produto versus Caracteristica, filial, inativo, filtros, endpoints, selecao frontend, loading, erro, teclado e respostas assincronas obsoletas.
