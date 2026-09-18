Type: research
Status: resolved

## Answer

Auditoria concluida somente no Laravel. As entradas abrangidas, excluidas e pendentes, com evidencias de arquivos/linhas, estao em [auditoria-demais-entradas-laravel](../../../modules/estoque/leitura-codigo-produto/auditoria-demais-entradas-laravel.md). Foram gerados tres prompts `/speckit.specify` em `modules/estoque/leitura-codigo-produto/` para Compras/Listas, Lancamentos/Transferencias e Venda Perdida/componente generico. Lancamentos e Transferencia ja possuem resolucao exata parcial com barcode; Compras, Listas e Venda Perdida ainda exigem integracao/alinhamento. Nenhum Delphi foi investigado e nenhum codigo Laravel foi implementado.
Blocked by: 01

## Question

Fazer uma varredura de todas as entradas Laravel que aceitam código de Produto fora de Estoque e Orçamentos — Compras, Contratos, lançamentos, listas, transferências, vendas perdidas e componentes genéricos de catálogo — classificando cada ocorrência como abrangida, explicitamente excluída ou dependente de decisão.
