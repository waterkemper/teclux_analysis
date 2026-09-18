# Auditar implementação Laravel e gerar prompts corretivos

Status: resolved

## Resultado

A implementação existe em `/caixa/controle-recebimentos`. A auditoria foi
registrada em:

- `modules/caixa/controle-recebimentos/auditoria-implementacao-laravel-vs-delphi.md`

Foram criados os prompts corretivos:

- `04-speckit-prompt-correcao-ui-grid-comportamento.md`
- `05-speckit-prompt-correcao-gravacao-efeitos-financeiros.md`
- `06-speckit-prompt-aceite-integrado-f6-relatorio.md`

## Achados principais

- Defaults de datas por operação divergentes.
- Títulos, aba, ordenação e seleção do grid divergentes.
- Seleção e “Confirmar todos” limitados à página carregada.
- Recálculo de tipo reaproveitando códigos e omitindo campos que o Delphi
  persiste.
- Confirmação/estorno sem equivalência em documento, duplicata, movimento,
  evento, operador/data e `rowCount`.
- F6 gera a fotografia canônica, mas a semântica do relatório/F7 precisa ser
  explicitada para atender ao requisito de relatório gerado por F6.

O ticket 08 permanece aberto para a decisão formal de proteção concorrente,
idempotência e auditoria; o Prompt 05 exige testes de integração para não
declarar atomicidade sem comprovação.

