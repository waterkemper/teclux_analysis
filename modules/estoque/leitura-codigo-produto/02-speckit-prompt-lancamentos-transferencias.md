# Prompt para /speckit.specify - Lancamentos e Transferencias

/speckit.specify

Crie uma especificacao para consolidar a resolucao de codigo de Produto em Lancamentos Avulsos e Transferencia para Exposicao, mantendo filial, estoque, lote, grades e elegibilidade.

Inspecione somente `laravel/backend`. Nao investigue Delphi e nao implemente. Use a auditoria em `modules/estoque/leitura-codigo-produto/auditoria-demais-entradas-laravel.md` e o contrato canonico do ticket 01.

Evidencias: Lancamentos em `resources/js/Pages/Cadastros/Estoque/LancamentosAvulsos/Index.tsx:328-336,1003-1045`, `app/Http/Controllers/Estoque/LancamentosAvulsosController.php:125-143,362-364` e `app/Infrastructure/Persistence/Legacy/Estoque/LegacyLancamentosAvulsosProdutoLookupRepository.php:38-53`; Transferencia em `resources/js/Pages/Interlojas/RequisicaoParaExposicao/components/RequisicaoExposicaoProdutoLookup.tsx:102-154`, `app/Http/Controllers/Interlojas/RequisicaoExposicaoController.php:226-240` e `app/Infrastructure/Persistence/Legacy/Interlojas/LegacyRequisicaoExposicaoProdutoLookupRepository.php:74-98`.

Defina preservacao ou substituicao dos endpoints, codigo visual/barcode/numerico, comparacao canonica, resultado unico, erros observaveis, escopo de filial, estoque automatico, financeiro, grades, lote e filial fisica. Diferencie lookup parcial do modal e resolucao exata do leitor. Inclua testes de regressao e telemetria segura. Classifique conclusoes como confirmada, inferida, duvida ou decisao pendente. Nao altere Delphi.

