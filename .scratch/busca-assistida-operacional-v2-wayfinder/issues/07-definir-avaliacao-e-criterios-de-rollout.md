Type: grilling
Status: resolved
Blocked by: 01, 04, 05, 06

## Question

Quais consultas reais anonimizadas, metricas de relevancia, testes de interpretacao, limites de seguranca/custo e gates de rollout provam que a Busca Assistida operacional melhora o trabalho dos vendedores sem degradar a busca tradicional?

## Answer

A avaliacao deve usar um dataset offline de consultas reais anonimizadas. Cada caso registra consulta normalizada, contexto de Consulta ou Orcamento, filtros esperados, Produtos relevantes, regras de Preco/Estoque e indicacao de clarificacao, cobrindo identificadores, linguagem natural, erros de digitacao, filtros, atributos, ambiguidade e ausencia de resultado.

Os gates rigidos sao: zero Produto inativo, zero violacao de hard filter, zero bypass de autorizacao e 100% de acerto em identificadores exatos e Preco/Estoque deterministico. Os gates de qualidade sao NDCG@5 pelo menos 10% superior ao baseline em consultas abertas, Recall@10 nao inferior ao baseline, nenhuma regressao nas consultas que ja funcionam e pelo menos 90% de clarificacoes corretas. P95 de latencia e custo por consulta devem permanecer dentro do orcamento aprovado, com taxa de erro e fallback monitoradas.

Nao havera shadow mode nem rollout por etapas: a v2 sera liberada de uma vez depois de passar todos os gates pre-lancamento. A busca tradicional continua como fallback e deve existir um mecanismo operacional de desligamento/rollback para falhas criticas.

A telemetria pos-lancamento sera minimizada: HMAC da consulta, versao do plano/modelo, filtros aplicados, IDs dos resultados, abertura de detalhe, selecao, fallback, latencia, tokens, custo, erros e cache hit. Logs nao armazenam texto bruto, dados de cliente ou PII. O dataset anonimizado revisado permanece separado da telemetria operacional.
