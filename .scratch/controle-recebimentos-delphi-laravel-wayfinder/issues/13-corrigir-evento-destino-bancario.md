# Corrigir evento destino bancário

Status: open

## Objetivo

Aplicar o Prompt 10. A transição de data não pode sobrescrever o evento já
existente no movimento destino.

## Evidência

O comando atual localiza o movimento destino e monta a chave do evento usando o
mesmo `sequenciaevento` do recebimento antigo. Depois, chama
`atualizarEventoValor`; com isso, um evento destino previamente existente pode
ser alterado em vez de um novo evento ser criado.

O teste `ControleRecebimentosTransicaoDataPostgresTest` semeia esse cenário e
espera o valor sobrescrito, portanto não comprova paridade.

## Saída

Usar `modules/caixa/controle-recebimentos/10-speckit-prompt-correcao-evento-destino.md`.
O aceite deve comprovar criação com nova sequência e soma de todos os eventos,
ou recusa segura sem qualquer mutação quando não houver alocador autoritativo.
