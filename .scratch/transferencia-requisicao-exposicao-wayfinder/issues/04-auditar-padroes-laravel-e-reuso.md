# Auditar padrões Laravel e reuso para Transferência de Requisição

Type: research
Status: resolved
Blocked by:

## Answer

O inventario foi registrado em pesquisa-padroes-laravel-reuso.md. A infraestrutura de Requisicao, Consulta de Requisicoes e Romaneios ja fornece nucleo/comandos, filial e parametros, shell, Breadcrumb, modal F9, ErpConsultaOperationBar, ErpPreferenceDataGrid, exportacao, atalhos e cancelamento PostgreSQL real.

O reuso deve ser por composicao, com adapters e catalogos especificos; nao copiar controllers, DTOs, estados ou SQL de outro fluxo. Permanecem lacunas proprias de Transferencia: agregado, elegibilidade, lotes, efeitos transacionais, autorizacao e grid. A chave NF-e deve usar NfeAccessKey/NfeAccessKeyInput; parametros devem usar getMany; e os testes devem excluir driver e hashtablefs/hastablefs.

## Question

Onde estão, no checkout Laravel atual, os contratos reutilizáveis para Requisição entre Filiais, Consulta de Requisições para Exposição, Romaneios, shell/breadcrumb, `ErpConsultaOperationBar`, `ErpPreferenceDataGrid`, exportação, ordenação, paginação/virtualização, modal F9, radio buttons, atalhos, chave NF-e, parâmetros em lote, autorização/menu, `PgsqlGerarQueryRunner` e cancelamento real? Registrar arquivos e seams concretos, o que já foi implementado e o que é lacuna, incluindo as proibições de driver e `hastablefs`.
