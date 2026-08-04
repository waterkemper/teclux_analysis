# Definir aceite, testes e observabilidade da Confirmação por Romaneios

Type: grilling
Status: resolved
Blocked by: 06, 07, 08

## Answer

O contrato de aceite, testes e observabilidade foi consolidado a partir das decisões anteriores e da autorização do usuário para as recomendações seguintes.

## Critérios de aceite

- O menu `Interlojas → Confirmação por Romaneios` respeita folha, capability, Filial e middleware; acesso visual sem autorização não libera endpoints.
- Os cinco parâmetros são resolvidos em lote por Filial, com fallback global, e configurações inválidas produzem erro explícito.
- F6 preserva filtros Delphi, executa query direta completa sem paginação, sem N+1, com bindings, arrays vazios explícitos e joins compatíveis com o snapshot.
- Cancelar aparece antes do primeiro `await`, cancela a sessão PostgreSQL real por `X-Trace-Id`/ownership e preserva o último resultado válido.
- F9 usa o modal padrão; a chave NF-e usa os componentes compartilhados; radio buttons representam escolhas mutuamente exclusivas; grids preservam seleção, exportação, ordenação e personalização.
- F5 e conferências respeitam atalhos, capabilities, autorização sensível, revalidação de Filial/situação e resultado por Romaneio.
- Cada Romaneio é atômico, idempotente e concorrente de forma determinística: alteração Delphi produz conflito, falha produz rollback completo e retry não duplica efeitos.
- Delphi e Laravel leem as mesmas situações e efeitos PostgreSQL; o sucesso só é publicado após commit.

## Contrato de testes

- Testes de feature para menu, capabilities, Filial, parâmetros, F9, máscara, radio buttons, atalhos, grids, exportação e estados de loading/erro/vazio/conflito.
- Testes de integração no PostgreSQL autoritativo para schema gate em CI, relações/funções do snapshot, arrays vazios, bindings, `INNER`/`LEFT JOIN`, ausência de N+1 e contagem de queries.
- Teste de cancelamento real usando runner cancelável e consulta bloqueável (`pg_sleep` ou equivalente), comprovando `pg_cancel_backend()` e término da query.
- Testes transacionais para sucesso, falha em cada etapa, rollback por Romaneio, concorrência Delphi–Laravel, revisão obsoleta, idempotência após timeout e retry.
- Testes de exportação para garantir reexecução server-side com contexto congelado e rejeição de linhas, SQL, filtros, colunas ou Filial arbitrários enviados pela UI.
- Nenhum teste deve depender de driver, `hashtablefs`, `Schema::hasTable`, introspecção runtime ou limites de performance não decididos.

## Observabilidade

Registrar com `X-Trace-Id`, usuário, Filial, operação, quantidade de Romaneios, resultado agregado, sucessos, conflitos, falhas, cancelamento e duração, sem senha, chave NF-e completa, SQL com dados, payload sensível ou credenciais.

Métricas mínimas: início/fim/cancelamento de F6, duração, erro PostgreSQL, conflito de revisão, rollback, idempotência reaproveitada, quantidade de queries e resultado por operação. Logs devem permitir correlacionar consulta, exportação e comando sem transformar dados fiscais em conteúdo de log.

Nenhum código, teste executável, migration ou instrumentação foi implementado nesta decisão.

## Question

Quais cenários de aceite demonstram paridade funcional, segurança, menu, parâmetros, Filiais, schema/SQL, ausência de N+1, joins corretos, cancelamento real, concorrência Delphi–Laravel, idempotência, grids, modal F9, máscara NF-e, atalhos, operações, conferência, transação e falhas? Definir evidências, logs/métricas sem dados sensíveis e proibições explícitas de testar driver ou `hashtablefs`.

Os testes devem usar contratos e PostgreSQL autoritativo quando a regra depender do banco. Cobrir estados vazios, arrays vazios, registros concorrentes e efeitos parciais/rollback.
