# Prompt para /speckit.specify - Geracao da Curva ABC

/speckit.specify

Crie uma especificacao implementavel para ajustar a geracao da Curva ABC existente em /cadastros/estoque/relatorios/curva-abc. Gere somente a especificacao; nao implemente codigo nesta etapa.

## Leituras obrigatorias

Leia primeiro:

- modules/estoque/relatorio-curva-abc/README.md
- modules/estoque/relatorio-curva-abc/dossie.md
- os tres arquivos de pesquisa referenciados no README
- o checkout Laravel vigente, especialmente Controller, Request, Service, Job, GerarJobStore, dispatcher/lifecycle heavy-reports, Policy, acesso modular, Index.tsx, grid, hook, tipos, rotas e testes existentes da Curva ABC
- o diagnostico Top N com universo grande referenciado no README, incluindo o incidente 4500/100 e as limitacoes de reproducao local
- laravel/.cursor/rules/erp-reports-pdf.mdc somente para confirmar que PDF esta fora deste prompt

As pesquisas sao a consolidacao da evidencia Delphi. Nao reabra os fontes Delphi durante esta especificacao. Se o checkout divergir, classifique o achado e proponha somente a menor correcao necessaria.

## Missao

Preservar e ajustar a geracao F6 e a exibicao do resultado corrente na tela, usando o pipeline heavy-reports existente. O resultado e efemero: nao criar tabela de historico, Fotografia persistente, retencao de negocio, PDF, impressao ou Excel.

Antes de propor qualquer alteracao funcional, transformar o incidente Top N em um teste de regressao executavel no PostgreSQL. O caso minimo e: universo de aproximadamente 4500 produtos com movimento positivo, periodo de 1o de marco a 1o de setembro e Top N 100. O teste deve provar o caminho completo da funcao `teclux_abc_prod` implantada ate o JSON consumido pela grade.

## Requisitos funcionais

1. F6 valida o contrato atual de datas, percentuais A/B/C e filtros, mantendo a semantica comprovada da tela e corrigindo divergencias somente quando o dossie exigir.
2. Preservar os modos 0 a 5 para consulta/grade, sem afirmar formulas de abc_prod que nao estao comprovadas. Compras nao deve ser inventado: manter fora do contrato ou remover/desabilitar conforme o baseline real e registrar a decisao.
3. Exibir rows/meta no grid atual quando o job terminar. O resultado deve desaparecer conforme a politica tecnica existente; se nao estiver disponivel, a UI orienta Gerar novamente.
4. Tratar Top N como limite de emissao, nao como tamanho do universo. O contrato e a instrumentacao devem distinguir `raw_row_count`/universo, `row_count`/rows emitidas e valores crus antes do mapper. Para o caso 4500/100, a grade nao pode receber 4500 rows.
5. Para uma fixture com movimento positivo, a geracao nao pode transformar silenciosamente as metricas em zero. Se houver rows com campos nulos/ausentes, a especificacao deve diferenciar nulidade real do banco, perda no mapper e zero calculado pela funcao.
6. Reutilizar dispatcher, ManagedHeavyReportJob, OperationalExecution, GerarJobStore/blob, polling, queue heavy-reports, cancelamento e reconciliacao. Nao criar dispatcher, fila ou lifecycle paralelo.
7. Preservar a idempotencia por Idempotency-Key: mesma chave, ambiente, usuario e payload normalizado retorna a mesma intencao; conflito de payload nao inicia job.
8. Cancelar usa trace_id e o cancelamento PostgreSQL existente. Nao publicar resultado parcial. Se o job ja estiver pronto, cancelar nao deve apagar a entrega pronta.
9. Estados, retry e reconciliacao seguem o contrato do dossie. Retry deliberado cria nova geracao operacional; nao existe historico de negocio.
10. Progresso deve representar fases reais e nao fingir percentual durante SQL longo. Registrar heartbeat/liveness nos checkpoints existentes.
11. Filiais e grupos devem ser resolvidos e autorizados no servidor. O payload do browser nao concede Filial. Gerar usa somente Filiais efetivas autorizadas.
12. F6 nao chama nem simula a Gravacao da Classificacao ABC. O contrato de gravacao sera especificado no prompt 02.

## Guardrails tecnicos

- Revalidar nomes e seams no checkout atual antes de propor alteracoes.
- Inspecionar o diff e a migration que alteram `teclux_abc_prod` antes de aceitar a tentativa recente como correcao. Confirmar que o SQL da funcao foi aplicado no PostgreSQL do ambiente alvo.
- Exigir teste de integracao PostgreSQL (ou fixture equivalente que execute o corpo real da funcao), nao apenas mock do repositorio, para 4500/100 e totais que excedam o antigo `numeric(11,2)`.
- Nao usar resultado temporario como autoridade de produtos.resultadocurvaabc.
- Nao usar SQL concatenado, lookup N+1, driver como teste ou Schema::hasTable/hasColumn em runtime.
- Nao introduzir fotografia persistente, historico, PDF, impressao, Excel ou nova infraestrutura generica.
- Controllers/React nao devem conhecer detalhes de SQL, fila ou armazenamento interno.

## Testes e aceite

Especifique testes para defaults/validacao, cada modo de consulta, filtros de Filial/Grupo, autorizacao fail-closed, idempotencia, polling, cancelamento real, timeout, falha, retry, reconciliacao, resultado vazio, perda de resultado tecnico e ausencia de qualquer efeito em produtos.resultadocurvaabc durante F6. Inclua teste que prove que modos agregados continuam somente consulta.

Inclua obrigatoriamente a matriz de regressao Top N: universo aproximado 4500/Top N 100, universo menor que Top N, Top N igual ao universo, movimento positivo com totais grandes, modos 0/1/2 e uma comparacao de `raw_row_count`, `row_count`, primeiro/ultimo `ordem`, campos numericos crus e campos numericos serializados. O aceite deve falhar se a consulta retornar 4500 rows para Top N 100 ou se transformar movimento positivo em zeros sem explicacao de nulidade no banco.

## Saida esperada do SpecKit

Produza spec.md, plan.md, tasks.md e contratos/testes necessarios para esta fatia. Nao inclua a Gravacao da Classificacao ABC como implementacao desta especificacao; apenas documente a interface de handoff para o prompt 02.
