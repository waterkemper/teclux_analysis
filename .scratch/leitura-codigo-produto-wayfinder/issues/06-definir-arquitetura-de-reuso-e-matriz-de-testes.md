Type: grilling
Status: resolved
Blocked by: 02, 03, 04, 05

## Question

## Answer

Adotar um resolvedor Laravel unico de Produto, em camada de suporte/dominio, com resultado explicito `not_found`, `resolved` ou `ambiguous` contendo candidatos. O resolvedor aceita `produtos.codigo`, `produtos.codigovisual` e `produtoscodigobarras.codigobarras`, preserva o texto de entrada e nao escolhe silenciosamente em colisoes.

Endpoints de lookup reutilizam esse contrato. `CatalogCodeLookup` permanece componente de apresentacao: exibe encontrado, erro ou abre a tela de selecao para ambiguidade; nao conhece SQL nem decide precedencia. Filtros paginados usam primitive SQL equivalente, sem carregar o catalogo para PHP, mantendo busca exata separada de busca parcial.

A matriz minima cobre unidade (normalizacao, zeros, fontes, inexistente, colisao e Produto versus Caracteristica), feature (cada endpoint e filial), frontend (lupa, selecao, teclado e estados assincronos) e regressao de quantidade, preco e estoque nos consumidores.

Como consolidar o contrato em uma arquitetura reutilizável sem acoplar UI a SQL: primitive/resolvedor, DTO de resultado, integração com filtros, lookup e comandos, tratamento de ambiguidades, observabilidade, compatibilidade por driver e matriz de testes unitários, feature e frontend?
