# Prompt para /speckit.specify - Venda Perdida e componente generico

/speckit.specify

Crie uma especificacao para que a captura de Venda Perdida aceite codigo visual ou barcode de Produto antes de gravar, e para decidir a extensao segura do componente generico de lookup.

Inspecione somente `laravel/backend`. Nao investigue Delphi e nao implemente. Leia a auditoria em `modules/estoque/leitura-codigo-produto/auditoria-demais-entradas-laravel.md` e o contrato canonico do ticket 01.

Evidencias: `resources/js/Components/erp/venda-perdida/VendaPerdidaCaptureModal.tsx:181-228`; `app/Services/Vendas/VendaPerdida/VendaPerdidaCatalogLookupService.php:28-67`; `app/Http/Controllers/Vendas/VendaPerdidaCaptureController.php:30-52`; `resources/js/Components/lookup/CatalogCodeLookup.tsx:68-80,127-199,1287-1322`.

Decida endpoint exato contextualizado por filial/cliente/cargo, Enter/blur versus modal, demanda livre, inativo, inexistente, ambiguidade, estrategia tipada versus `catalogExactResolveUrl`, resposta, acessibilidade, foco e protecao contra gravar somente o texto. Inclua matriz de testes para codigo visual, barcode, zeros iniciais, filial e demanda livre. Nao transforme busca parcial por nome em busca exata e nao altere outros usos sem evidencia. Cite arquivos/linhas e classifique conclusoes. Nao altere Delphi.

