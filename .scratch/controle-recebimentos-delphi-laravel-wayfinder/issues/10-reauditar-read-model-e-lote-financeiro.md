# Reauditar read model e efeitos financeiros em lote

Status: resolved

## Resultado

A implementação atual já incorporou os prompts corretivos 04–06 em defaults,
catálogo/títulos, ordenação, seleção completa, editabilidade, F6/fotografia,
recálculo, carimbos, row count, documentos, eventos e delta de movimento.

Permanecem duas lacunas comprovadas no checkout:

- o read model converte `valor_confirmacao` nulo em zero e não aplica a
  precedência `contrato -> autenticação`, nem a escolha `razao -> nome`;
- confirmação/estorno ainda precisam tratar critérios completos de criação de
  documento/duplicata e impedir que uma identidade de evento/movimento seja
  processada mais de uma vez no mesmo lote.

Foi criado o prompt complementar:

- `modules/caixa/controle-recebimentos/07-speckit-prompt-correcao-read-model-e-lote-financeiro.md`

O ticket 08 continua aberto para a decisão específica de proteção concorrente,
idempotência e auditoria que não é determinada pelo Delphi.
