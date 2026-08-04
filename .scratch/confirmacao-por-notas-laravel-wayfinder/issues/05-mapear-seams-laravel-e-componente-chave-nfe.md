# Mapear seams Laravel e o componente compartilhado de chave NF-e

Type: research
Status: resolved
Blocked by:

## Question

Quais arquivos e contratos atuais do Laravel devem ser reutilizados para `acessosmodulos`, menu, capability, filial ativa, parâmetros, Inertia, grids, exportação, operações/atalhos e transações; e já existe componente, validador ou value object para chave NF-e que possa ser aprofundado como padrão compartilhado de máscara, normalização e validação?

## Comments

## Answer

Pesquisa concluída em [pesquisa-padroes-laravel-chave-nfe.md](../../../modules/interlojas/confirmacao-por-notas/pesquisa-padroes-laravel-chave-nfe.md).

O módulo deve aprofundar os seams existentes de `acessosmodulos`, autorização por rota, filial de sessão, `ParameterService::getMany`, GET Inertia + JSON intencional, `ErpPreferenceDataGrid`, `ErpConsultaOperationBar`, transação auditada, locks e idempotência. Queries em loops ficam proibidas: carregar conjuntos com `whereIn` ou `ANY(array)` e indexar em memória.

Não existe atualmente componente, validador ou value object específico para chave NF-e. A decisão recomendada é criar um padrão compartilhado com `NfeAccessKey` autoritativo no backend e `NfeAccessKeyInput`/utilitários puros no frontend: normalização para 44 dígitos, DV módulo 11, máscara apenas visual, colagem/cursor corretos e contrato acessível. Outbox deve ser usada somente para efeitos externos, após commit.
