# Prompt para `/speckit.specify`

```text
/speckit.specify

Leia `modules/estoque/leitura-codigo-produto/dossie.md` e os relatorios do mesmo diretorio. Crie a especificacao Laravel para um resolvedor canonico de Produto.

Implemente na especificacao um contrato tipado com estados `not_found`, `resolved` e `ambiguous`. A consulta exata deve aceitar `produtos.codigo`, `produtos.codigovisual` e `produtoscodigobarras.codigobarras`, preservar zeros a esquerda, usar parametros SQL e nunca converter barcode em inteiro. Em colisao, nao escolher silenciosamente: abrir selecao de Produto. Nao usar barcode para resolver Caracteristica.

Defina uma primitive compartilhada para endpoints de lookup e uma primitive SQL equivalente para filtros paginados. O `CatalogCodeLookup` deve permanecer apresentacao, sem SQL. Defina normalizacao, DTO, origem do match, limites, autorizacao, inativos, escopo de filial, erros, observabilidade e compatibilidade dos drivers existentes.

Mapeie os arquivos Laravel reais e proponha a menor mudanca coerente. Inclua testes unitarios, feature e frontend para fontes, zeros, colisao, duplicidade, inexistente, Produto/Caracteristica, lupa/digitacao, filial, inativo, paginacao, filtros parcial/exato e respostas assincronas obsoletas.

Nao investigar Delphi. Nao implementar nesta etapa. Nao alterar schema legado, nao corrigir duplicidades de dados e nao substituir a PK persistida pelo codigo visual ou barcode.
```
