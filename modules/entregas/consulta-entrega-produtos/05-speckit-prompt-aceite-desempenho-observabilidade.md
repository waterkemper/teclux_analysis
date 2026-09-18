# Prompt 05 — Aceite, desempenho e observabilidade


## Matriz funcional

Cobrir:

- folha Cloud, rota, capability, middleware, menu e breadcrumb;
- Filial efetiva e autorização em consulta, F9, F5, F6, F10, exportação e relatório;
- filtros de datas, Todas as entregas, filiais, períodos, fornecedores e romaneio;
- F9 no modal padrão, F5 gravação atômica, F6 Gerar, Cancelar imediato e F10 Contrato;
- grid com catálogo, ordenação determinística, agrupamento, preferências, personalização e exportação;
- campos editáveis somente data/hora/período e todos os derivados read-only;
- schema manifest, checksum, joins, nulabilidade, funções e ausência de SQL contra objetos não comprovados;
- equivalência entre grid, relatório, fotografia, PDF, impressão e exportação.

## PostgreSQL real

Executar testes de contrato contra PostgreSQL real e o snapshot autoritativo, nunca por driver alternativo. Provar:

- as 15 relações e contratos_atual existem conforme o manifest;
- binds e arrays são usados para todos os filtros;
- duas branches UNION ALL preservam source_kind e identidade;
- saldos e devoluções têm cardinalidade correta;
- joins obrigatórios são INNER JOIN e joins opcionais têm justificativa;
- nenhuma consulta é feita no loop de linhas ou no mapper;
- F6 registra PID, Cancelar chama pg_cancel_backend e a query realmente termina;
- F5 usa transação, revisão, idempotência, rollback e conflito 409;
- grid e relatório retornam o mesmo conjunto e as mesmas identidades.

Não usar hasTable, Schema::has*, information_schema, pg_catalog ou teste condicional de driver para esconder lacuna ou decidir comportamento.

## Desempenho e concorrência

Registrar contagem de queries, duração, trace, generation_id, PID, cancelamento, cardinalidade, linhas materializadas e hash. Medir EXPLAIN no ambiente alvo antes de escolher síncrono ou heavy. Testar filtros vazios, grandes conjuntos, múltiplas linhas por contrato/documento, duplicação entre branches, fornecedor/região ausente, empate de limite, resposta tardia e duas gerações concorrentes.

## Interface e acessibilidade

Confirmar que busy e Cancelar aparecem antes do primeiro await; cancelamento preserva o último resultado completo; respostas obsoletas não substituem resultado novo; atalhos têm labels e preventDefault corretos; foco retorna ao modal F9; ícones têm nome acessível; erros de Filial, autorização, conflito e schema são explícitos.

## Saída

Produzir matriz requisito → evidência → teste → resultado, lista de riscos residuais e critérios de go/no-go. O aceite deve bloquear N+1, SQL textual, identidade não comprovada, cancelamento apenas visual, commit parcial, divergência grid/relatório e qualquer pedido de reabrir os fontes Delphi.
