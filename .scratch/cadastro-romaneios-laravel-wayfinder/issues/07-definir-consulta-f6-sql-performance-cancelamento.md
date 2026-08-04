# Definir consulta F6, SQL, performance e cancelamento

Type: grilling
Status: resolved
Blocked by: 01, 02, 03, 05

## Question

Qual contrato de filtros e resultados, estratégia de paginação/ordenação/exportação, desenho set-based sem N+1, política de joins conforme nulabilidade e mecanismo Laravel de cancelamento real devem reger a consulta F6 do Cadastro de Romaneios?

## Answer

A F6 será a Consulta de Documentos Candidatos ao Romaneio: síncrona, server-side e cancelável no PostgreSQL. Reutiliza `useErpGerarRequest`, `PgsqlGerarQueryRunner` e o endpoint protegido de `pg_cancel_backend()`; `busy` começa antes do primeiro await e Cancelar aparece imediatamente. Fila `heavy-reports` só será adotada se medições no banco-alvo comprovarem estouro frequente do orçamento HTTP depois da otimização.

Os filtros preservam emissão obrigatória (padrão servidor−15 dias até hoje), Filiais autorizadas, Clientes, intervalo de entrega e “somente NF com itens para entrega”. Tipo, situação fiscal, duplicidade e invariantes de Normal/Transferência determinam elegibilidade. A seleção não reserva documentos: todos os IDs são relidos e revalidados em lote ao gravar.

A consulta usa base paginada de IDs e enriquecimento set-based da página, uma linha por `dadosfiscais.numero`, sem subconsulta/query por linha. Ordenação vem de catálogo allow-list com desempate canônico; arrays têm semântica vazia explícita. Joins seguem nulabilidade e cardinalidade do snapshot, com `INNER JOIN` nas relações obrigatórias e `LEFT JOIN` apenas nas opcionais necessárias.

Grid e exportação compartilham filtros/sort/Filiais congelados e reautorizados. Exportação segue `GridExportOrchestrator`: síncrona até 5.000 registros e assíncrona acima, sem obrigar a F6 interativa a usar fila.

O contrato completo, política de cancelamento, medição e critérios de aceite estão em [consulta-f6-sql-performance-cancelamento.md](../../../modules/entregas/cadastro-romaneios/consulta-f6-sql-performance-cancelamento.md). O termo foi registrado em `laravel/CONTEXT.md`.
