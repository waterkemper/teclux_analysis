# Relatório de Entregas — pacote SpecKit

Este diretório contém as evidências consolidadas e quatro prompts coordenados para especificar no Laravel **Entregas e Montagens → Entregas → Relatório de Entregas**.

## Ordem de execução

| Ordem | Prompt | Fronteira |
|---:|---|---|
| 1 | [Fundação, acesso e filtros](01-speckit-prompt-fundacao-acesso-filtros.md) | capability, menu, Filial, breadcrumb, F9 e contrato tipado dos filtros |
| 2 | [Consulta F6, grid, schema e cancelamento](02-speckit-prompt-consulta-f6-grid-cancelamento.md) | read model, SQL set-based, schema gate, grid e cancelamento PostgreSQL |
| 3 | [Fotografia, relatório e exportação](03-speckit-prompt-fotografia-relatorio-exportacao.md) | fotografia única, preview/PDF/impressão, layout, totais e exportação |
| 4 | [Aceite, desempenho e observabilidade](04-speckit-prompt-aceite-desempenho-observabilidade.md) | gates PostgreSQL, N+1, cancelamento real, segurança, acessibilidade e telemetria |

A saída de cada prompt é pré-condição do seguinte. Cada bloco deve ser executado com `/speckit.specify` no checkout Laravel alvo. Os prompts especificam; não implementam.

## Autoridades

- [Interface Delphi consolidada](pesquisa-interface-delphi.md)
- [SQL e semântica Delphi consolidados](pesquisa-sql-delphi.md)
- [Parâmetros, autorizações e menu](pesquisa-parametros-autorizacoes-menu.md)
- [Padrões Laravel e estratégia de schema](pesquisa-padroes-laravel-schema.md)
- [Manifesto de schema autoritativo](schema/relatorio-entregas-schema-manifest.json)
- [Procedimento do schema](schema/README.md)
- [Snapshot PostgreSQL autoritativo](schema/postgresql-authoritative-2026-08-19.json)
- [Funções PostgreSQL coletadas](schema/functions-2026-08-19.sql)

Os prompts devem consultar o checkout Laravel atual para confirmar nomes e seams concretos, mas não devem pedir nova inspeção direta dos fontes Delphi. Divergências devem ser classificadas e bloquear somente o contrato afetado.

## Regras comuns

- Não implementar durante `/speckit.specify`.
- Não usar SQL concatenado, N+1, query em loop, lookup por linha ou `LEFT JOIN` automático.
- Usar binds, `IN`/`whereIn` ou `ANY(array)` quando aplicável; usar `INNER JOIN` para vínculos obrigatórios com campos `NOT NULL` e `LEFT JOIN` somente quando a ausência for semântica e comprovada.
- F6 e o botão Gerar compartilham handler; Cancelar aparece antes do primeiro `await` e cancela a consulta no PostgreSQL.
- Grid, relatório, preview, PDF, impressão e exportação usam o mesmo read model/Fotografia de Relatório.
- F9 usa o modal padrão de pesquisa; breadcrumb e command bar usam componentes existentes.
- Chave NF-e, se necessária em evolução futura, usa exclusivamente `NfeAccessKey*`.
- Nunca testar driver, usar `hasTable`/`Schema::has*` ou transformar `AbortController` em prova de cancelamento.
- Manter as classificações `CONFIRMADO`, `INFERIDO`, `DÚVIDA`, `NÃO LOCALIZADO`, `DIVERGENTE`, `POSSÍVEL BUG LEGADO` e `OPORTUNIDADE`.
