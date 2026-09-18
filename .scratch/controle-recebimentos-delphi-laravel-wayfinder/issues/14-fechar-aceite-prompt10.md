# Fechar aceite do Prompt 10

Status: open

## Objetivo

Fechar a reauditoria do Prompt 10 sem alterar a regra funcional: com o snapshot
atual, a transição de data que exigiria inserir evento bancário deve recusar
atomicamente porque não há alocador seguro.

## Achados

- O comando Laravel já não sobrescreve o evento destino e recusa antes de
  `recebimentos`, Contas a Pagar, movimentos, eventos e vínculos.
- Os testes do aceite ainda verificam o driver PostgreSQL explicitamente,
  contrariando o contrato do módulo de nunca testar driver.
- O orçamento usa `assertLessThan(80)` em vez do
  `DatabaseQueryCountAsserter` previsto na spec.
- Os testes de recusa não capturam e comparam o estado financeiro completo,
  especialmente títulos/duplicatas e cabeçalhos dos dois movimentos.

## Saída

Usar `modules/caixa/controle-recebimentos/11-speckit-prompt-fechamento-aceite-prompt10.md`.
O spec deve limitar-se a testes/documentação de aceite, preservar a recusa
atômica e não criar alocador bancário nem nova implementação Delphi.
