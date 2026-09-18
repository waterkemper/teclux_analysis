# Reauditar N+1 e data global do rodapé

Status: open

## Objetivo

Corrigir somente o N+1 no caminho de fotografia/aceite da confirmação e a
precedência da data global do rodapé no payload de F5.

## Escopo fechado

As outras alterações existentes no checkout foram feitas pelo usuário e não
fazem parte desta auditoria. Não revertê-las nem criar prompt para elas.

## Evidências

- `Index.tsx` copia `dataConfirmacaoLote` ao draft quando a linha é marcada.
- `handleDataConfirmacaoLoteChange` altera apenas o estado global.
- `montarLinhasGravar` serializa o draft; portanto, mudar o rodapé depois da
  marcação pode enviar a data antiga.
- A fotografia atual percorre recebimentos, pares de movimento e documentos em
  loops com consultas individuais; a captura deve ser set-based.

## Saída

Usar `modules/caixa/controle-recebimentos/12-speckit-prompt-reconciliacao-escopo-e-data-confirmacao-prompt11.md`.
Não reabrir a recusa bancária do Prompt 10 nem alterar as demais implementações.