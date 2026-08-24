# Prompt para `/speckit.specify` — consulta F6, grid, schema e cancelamento

```text
/speckit.specify

Crie a especificação funcional e técnica da consulta F6 cancelável e do grid de resultados do **Relatório de Entregas**, segundo de quatro prompts. Consuma a spec 01 e os artefatos de pesquisa. Entregue schema gate, read model, repositório, SQL set-based, paginação, ordenação, catálogo de grid e cancelamento PostgreSQL real. Não reespecifique menu, Filial ou filtros; apenas detalhe seus contratos de uso.

Não implemente durante /speckit.specify. Inspecione o checkout Laravel atual e cite arquivos concretos. Não peça inspeção direta do Delphi.

Autoridades:
- modules/entregas/relatorio-entregas/README.md
- modules/entregas/relatorio-entregas/pesquisa-interface-delphi.md
- modules/entregas/relatorio-entregas/pesquisa-sql-delphi.md
- modules/entregas/relatorio-entregas/pesquisa-padroes-laravel-schema.md
- modules/entregas/relatorio-entregas/schema/README.md
- modules/entregas/relatorio-entregas/schema/relatorio-entregas-schema-manifest.json

## Schema e identidade

- O manifesto aponta para o snapshot PostgreSQL autoritativo datado e com hash. Use o snapshot como contrato estrutural; bloqueie SQL se o objeto necessário estiver ausente ou se a implantação usar outro banco/schema.
- Confirme a chave natural de ProdutosContratos; não invente ID persistido. Sem identidade de linha comprovada, bloqueie a implementação da consulta.
- Verifique a existência e assinatura de diadasemana e as relações contratos, produtoscontratos, produtos, vfornecedores, bairros, cidades, dadosfiscais, produtosdadosfiscais, romaneiosnotas, romaneios e regioes no snapshot.

## SQL seguro

- Reproduza apenas a semântica consolidada: pc.Entrega = S; contrato em F/N/P; filtros de venda/entrega; clientes; fornecedor de transporte; região; situação aberta/entregue.
- Use binds e allowlists. Coleções devem usar whereIn/IN ou PostgreSQL = ANY(array) conforme o tipo. Nunca aceitar lista textual, operador, coluna ou fragmento SQL do browser.
- Pré-agregue QuantidadeEntregue em uma relação set-based ou CTE por chaves autorizadas; não copie subconsulta correlacionada repetida nem faça lookup por linha.
- Use INNER JOIN para vínculos obrigatórios com campos NOT NULL comprovados. Use LEFT JOIN somente quando ausência for semântica, como região não definida, e isso estiver no schema/regra.
- Para relações fiscais usadas apenas como filtro, prefira EXISTS; evite multiplicar linhas. Prove ausência de N+1 e cardinalidade inesperada.
- Ordenação server-side por região, UF/cidade/bairro/endereço, contrato, cliente e tipo, com desempate estável e allowlist.

## F6 e resultado

- F6 e Gerar compartilham handler. Defina busy e trace_id antes do primeiro await; Cancelar aparece imediatamente.
- Toda montagem, consulta, pré-agregação, count e materialização relevante fica dentro de PgsqlGerarQueryRunner ou do worker heavy correspondente.
- Cancelar chama o endpoint server-side autorizado e pg_cancel_backend/serviço equivalente antes de abortar a espera local. AbortController sozinho não é cancelamento.
- Cancelamento preserva o último resultado completo; respostas tardias e resultados parciais são descartados.
- O modo padrão é síncrono. Defina gate mensurado por EXPLAIN, cardinalidade, tempo e custo de PDF para migrar ao protocolo heavy com generationId/polling/cancel_url.

## Grid

- Use ErpPreferenceDataGrid, ErpGridShell e catálogos PHP/TypeScript próprios, com screenKey, gridId e schemaVersion.
- Permita colunas, visibilidade, ordem, largura, preferências, paginação, ordenação e exportabilidade segundo allowlists server-side.
- O grid usa o mesmo read model/filtros da Fotografia de Relatório; não reconsulta ou enriquece linha a linha.
- O contrato da Fotografia, PDF, impressão e exportação será fechado na spec 03.

## Saída da spec

Entregue contrato SQL, DTO de consulta, repositório, runner/trace/cancelamento, response read model, catálogo de grid, paginação, sort, erros, vazio e testes de cardinalidade. Classifique qualquer divergência do snapshot e não use driver, hasTable ou Schema::has* em request de negócio.
```
