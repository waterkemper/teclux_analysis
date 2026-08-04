# Definir F6, SQL set-based, desempenho e cancelamento

Type: grilling
Status: resolved
Blocked by: 01, 02, 03, 05

## Answer

O contrato da F6 foi fechado em entrevista HITL. A decisão explícita é **query direta completa, sem paginação e sem fila pesada**.

- Cada F6 usa uma única sessão PostgreSQL cancelável, envolvendo a consulta direta, agregações/enriquecimentos e preparação da exportação síncrona quando aplicável.
- A query principal é set-based e retorna todo o conjunto filtrado; não há paginação, cursor ou limite silencioso.
- A consulta usa SQL direto parametrizado, bindings obrigatórios, allowlists de filtros/ordenação e `IN`, `= ANY(array)`, `unnest` ou `VALUES` para lotes. Arrays vazios têm semântica explícita.
- Joins obrigatórios, confirmados por `NOT NULL`/FK, são `INNER JOIN`; `LEFT JOIN` só aparece para relação opcional deliberada, conforme o snapshot autoritativo.
- A query principal concentra joins/agregações; eventual dado complementar é carregado em lote dentro do mesmo runner. É proibida query em `foreach`, `AfterScroll` ou por linha.
- O botão Cancelar aparece antes do primeiro `await`, chama o endpoint de cancelamento e executa `pg_cancel_backend()` com ownership por usuário/`X-Trace-Id` antes do aborto local. Cancelamento é resultado explícito, preserva o último resultado válido e não substitui a grade por dados parciais.
- A exportação reexecuta a mesma query direta no servidor com contexto congelado de filtros, ordenação e Filial; nunca confia nas linhas enviadas pela UI.
- Não haverá medição de limiar, `EXPLAIN` obrigatório ou execução em fila pesada. A validação cobre apenas comportamento real no PostgreSQL: query count sem N+1, bindings/allowlists, filtros/exportação server-side e cancelamento real. Permanecem proibidos testes de driver e `hashtablefs`.

Nenhuma query, endpoint, componente ou teste foi implementado nesta decisão.

## Complemento confirmado

- Os unicos filtros editaveis sao data inicial e data final; a Filial Requisitante e fixa e somente leitura.
- A selecao e individual por linha; Romaneio de Passagem aparece, mas nao pode ser confirmado; somente entrada CONFIRMADA pode ser marcada.
- Confirmar usa F5 e so fica habilitado com ao menos um Romaneio selecionado.
- A ordenacao inicial e romaneio/dadofiscal; o grid pode ordenar depois com desempate estavel e a exportacao respeita o mesmo conjunto/ordenacao.
- A consulta permanece sincrona; fila pesada nao sera usada sem medicao posterior que prove necessidade.

## Question

Qual contrato de filtros, resultados, seleção, ordenação, paginação/virtualização, exportação e enriquecimento deve reger a F6? Como garantir uma consulta set-based por página/lote, sem N+1, usando `IN`, `= ANY(array)` ou `unnest` com binds e arrays vazios explícitos? Como escolher `INNER JOIN` versus `LEFT JOIN` pela nulabilidade confirmada e como disponibilizar Cancelar antes do primeiro await para cancelar a query no PostgreSQL?

Definir também o limite mensurado para eventual fila pesada, o catálogo allow-list de ordenação e os testes de query count, plano e cancelamento real. Não aceitar “Cancelar” que apenas descarte a resposta no browser.
