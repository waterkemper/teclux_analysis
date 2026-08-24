# Definir contrato de dados, UX e regras de consulta do Relatório de Entregas

Type: grilling
Status: resolved
Blocked by: 01, 02, 03, 04

## Question

Com base nos quatro inventários, decidir o contrato canônico do módulo: filtros tipados e combinações de datas, situação e agrupamentos; escopo de Filial; campos e identidade das linhas; ordenação e paginação; diferença entre grid e Fotografia de Relatório; totais e layout; sincronismo versus job pesado; cancelamento e retry; exportação; F9 e atalhos; uso eventual de chave NF-e; e critérios de segurança/performance. Fechar ambiguidades e classificar decisões, sem inventar regras que não tenham evidência ou decisão explícita.




## Answer

Contrato consolidado do Relatório de Entregas:

1. **Protocolo F6.** F6 e o botão Gerar chamam o mesmo handler. O modo padrão é síncrono e cancelável: `busy` e o `trace_id` são definidos antes do primeiro `await`; Cancelar aparece imediatamente; toda a montagem, consulta, pré-agregação, contagem e materialização relevante executa dentro do runner PostgreSQL cancelável. O servidor cancela a sessão/query por `pg_cancel_backend`; `AbortController` apenas encerra a espera visual. Se EXPLAIN, cardinalidade, tempo ou PDF excederem o limite operacional, usar o protocolo heavy com `generationId`, polling, `cancel_url` e a mesma fotografia canônica.

2. **Fotografia e saídas.** Cada F6 cria uma Fotografia de Relatório imutável, com filtros normalizados, Filial efetiva, ordenação, catálogo/schema/template version, totais, linhas, integridade/hash e política de retenção. Grid, preview, PDF, impressão e exportação leem a mesma fotografia/read model; não podem executar consultas independentes nem apresentar instantes diferentes. Cancelamento não substitui o último resultado completo por resultado parcial e respostas tardias de gerações anteriores são ignoradas.

3. **Filtros.** O DTO/Form Request tipado preserva período de vendas opcional; período de entrega com default recomendado de hoje até hoje + sete dias; situação por radio button, default `EM ABERTO`, ou `ENTREGUE`; clientes, fornecedores de transporte e regiões em coleções deduplicadas; e operadores/lógica apenas por allowlist, nunca como SQL do browser. A semântica confirmada permanece: aberto quando `quantidade - quantidadeentregue > 0`; entregue quando `quantidadeentregue > 0`; contratos `F`, `N`, `P`; somente `pc.Entrega = 'S'`. Região considera bairro ou cidade conforme regra consolidada.

4. **Filial e segurança.** A Filial efetiva vem da sessão/BranchContextService e é revalidada pelo UserBranchAccessService em consulta, F9, fotografia, exportação, preview e PDF. O request não é autoridade. Como não foi confirmado parâmetro específico da tela, o manifest fica vazio; qualquer parâmetro futuro exige evidência, leitura em lote por Filial e fallback explícito.

5. **Modelo de linha e SQL.** A unidade é o item de contrato a entregar. O schema deve confirmar a chave natural de `ProdutosContratos`; não inventar ID persistido. Sem identidade comprovada, bloquear a query. Quantidade entregue deve ser pré-agregada em SQL set-based. Coleções usam binds com `whereIn`/IN ou `= ANY(?::tipo[])`; nunca concatenar listas, operadores, colunas ou SQL.

6. **Joins.** Contrato, item, produto e cliente usam `INNER JOIN` quando o schema confirmar campos `NOT NULL` e presença obrigatória. Bairro, cidade e região permanecem `LEFT JOIN` somente quando a ausência tiver significado funcional, como região não definida, e isso estiver comprovado. Relações fiscais/romaneio devem ser pré-agregadas ou consultadas por `EXISTS` quando usadas apenas para filtro. Nenhum enriquecimento por linha ou N+1.

7. **Ordenação, agrupamento e grid.** Ordenação server-side determinística: região, UF/cidade/bairro/endereço, contrato, cliente e tipo, com desempate estável. O agrupamento legado não será exposto inicialmente: os checkboxes estavam ocultos e não eram enviados ao dataset. O Laravel criará grade própria com catálogo PHP/TypeScript, `screenKey`, `gridId`, `schemaVersion`, allowlist de sort, paginação, preferências, resize/reorder e exportação. Grid, PDF e exportação usam os mesmos campos e fotografia.

8. **F9, command bar e breadcrumb.** F9 em filtros/lookups abre o modal padrão com endpoint próprio, paginação, allowlist e reautorização. A command bar usa `ErpConsultaOperationBar`, ícones, acessibilidade, Gerar/F6, processing e Cancelar. Breadcrumb: **Entregas e Montagens → Entregas → Relatório de Entregas**. F6 é Gerar, nunca Excluir.

9. **Chave NF-e.** A tela Delphi não possui campo de chave NF-e. Se uma referência fiscal for acrescentada, reutilizar exclusivamente `NfeAccessKeyInput`, `NfeAccessKey`, `NfeAccessKeyValid` e `NfeAccessKeyText`; não criar máscara, regex ou cálculo de DV local.

10. **Schema e aceite.** Versionar em `modules/entregas/relatorio-entregas/schema/` snapshot JSON, SQL de funções e README com captura, origem, commit, escopo, nulabilidade, chaves, índices, hash e limitações. Bloquear SQL sem tabela, coluna, função ou cardinalidade comprovada. Não testar driver, usar `hasTable`/`Schema::has*` ou tratar `AbortController` como cancelamento. O aceite deve comprovar cancelamento PostgreSQL real, ausência de N+1, paridade grid/relatório/exportação e revalidação de acesso.

A decisão fecha as ambiguidades sem atribuir ao Delphi o F6, grid de resultados, cancelamento, fotografia, menu ou máscara NF-e, pois foram classificados como requisitos do destino ou não localizados.
