# Consulta de Entrega de Produtos — pacote SpecKit

Este diretório contém cinco prompts coordenados para especificar no Laravel a migração de Consulta e Agendamento de Entregas derivada de dmConsultaEntregaProdutos e fmConsultaEntregaProdutos.

## Ordem de execução

1. 01-speckit-prompt-fundacao-acesso-filtros.md — folha Cloud, acesso, Filial, breadcrumb, filtros e F9.
2. 02-speckit-prompt-consulta-f6-grid-schema-cancelamento.md — schema, SQL set-based, grid, F6 e cancelamento.
3. 03-speckit-prompt-edicao-agendamento-f5-conflitos.md — edição de data/hora/período, F5 e conflitos.
4. 04-speckit-prompt-relatorio-fotografia-exportacao.md — resultado canônico, relatório, fotografia e exportação.
5. 05-speckit-prompt-aceite-desempenho-observabilidade.md — aceite, PostgreSQL, desempenho e observabilidade.

Cada prompt é entrada para /speckit.specify no checkout Laravel atual. A saída de um prompt é pré-condição do seguinte. Os prompts especificam e não implementam.

## Autoridades

- pesquisa-interface-filtros-grid-operacoes.md
- pesquisa-sql-projecao-atualizacao.md
- pesquisa-parametros-autorizacoes-menu-padroes.md
- pesquisa-padroes-laravel-grid-relatorio-cancelamento-schema.md
- schema/postgresql-authoritative-2026-08-23.json
- schema/consulta-entrega-produtos-schema-manifest.json
- schema/README.md

As notas consolidam as fontes Delphi. Os prompts não podem pedir inspeção direta de arquivos Delphi. Para seams e nomes concretos, consultar somente o checkout Laravel atual.

## Regras comuns

- Não implementar enquanto estiver executando /speckit.specify.
- Preservar a distinção fiscal/contrato com source_kind e identidade real confirmada pelo schema.
- Usar binds, IN/whereIn ou ANY(array); nunca concatenar listas, operadores, colunas ou SQL recebido do browser.
- Pré-agregar saldos e fatos; nenhum N+1, query em loop ou lookup por linha.
- Usar INNER JOIN para vínculos obrigatórios confirmados por NOT NULL/FK e LEFT JOIN somente quando a ausência for semântica e comprovada.
- F6 mostra Cancelar antes do primeiro await e cancela a sessão PostgreSQL por pg_cancel_backend; AbortController não é prova de cancelamento.
- F5 é comando transacional, idempotente, auditável e protegido por revisão/conflito; preferências do grid não são persistência de negócio.
- Grid, preview, relatório, PDF, impressão e exportação usam o mesmo resultado canônico.
- F9 usa o modal padrão paginado e autorizado; breadcrumb e command bar usam componentes Laravel existentes.
- Não usar teste de driver, hasTable, Schema::has*, information_schema ou pg_catalog no caminho de negócio.
- Classificar fatos como CONFIRMADO, INFERIDO, DÚVIDA, NÃO LOCALIZADO, DIVERGENTE, POSSÍVEL BUG LEGADO ou OPORTUNIDADE.
