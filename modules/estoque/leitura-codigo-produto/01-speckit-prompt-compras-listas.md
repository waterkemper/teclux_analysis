# Prompt para /speckit.specify - leitura de codigo em Compras e Listas

/speckit.specify

Crie uma especificacao funcional e tecnica para permitir que a digitacao/leitura de codigo de Produto em Pedido de Compra e Lista Padrao resolva codigo visual ou codigo de barras e produza a PK canonica do Produto.

Inspecione somente `laravel/backend`. Nao investigue Delphi e nao implemente nesta etapa. Leia primeiro `modules/estoque/leitura-codigo-produto/auditoria-demais-entradas-laravel.md` e o contrato canonico fechado pelo ticket 01.

Alvos confirmados:
- `resources/js/Pages/Cadastros/Estoque/PedidosCompra/components/PedidoCompraItemForm.tsx:1041-1076`;
- `app/Http/Controllers/Estoque/PedidoCompraController.php:568-574,833-840`;
- `app/Infrastructure/Persistence/Legacy/Estoque/LegacyPedidoCompraProdutoLookupRepository.php:100-112`;
- `resources/js/Pages/Cadastros/ListasPadrao/Cadastro.tsx:737-796`;
- `app/Services/Cadastros/ListasPadraoCadastroService.php:239-243`.

A especificacao deve definir endpoint/servico de resolucao exata, precedencia, normalizacao, zeros iniciais, duplicidade/ambiguidade, Produto inativo, busca parcial separada, revalidacao no backend, vinculo fornecedor, precos, unidade e testes PHP/React/PostgreSQL. A PK recebida nao pode ser a unica autoridade quando o fluxo nasceu de texto digitado. Cite arquivos/linhas reais e liste criterios de aceite. Nao investigue Delphi.

