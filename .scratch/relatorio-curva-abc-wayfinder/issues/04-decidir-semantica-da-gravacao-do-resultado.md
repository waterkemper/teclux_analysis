# Decidir a semântica da gravação do Resultado da Curva ABC

Type: grilling
Status: resolved
Blocked by: 01, 03

## Question

Dado o comportamento confirmado do Delphi e a autoridade persistente encontrada no banco, qual contrato de negócio o Laravel deve oferecer para “Gravar”: substituir a classificação persistente global pelos Produtos do último resultado, atualizar somente o conjunto fotografado, ou separar explicitamente a Fotografia da Geração da operação de gravação? Fechar também autorização, confirmação, concorrência, idempotência, transação, auditoria, resultado por Produto, falhas e comportamento quando a Geração não produziu linhas.
## Answer

Decisao confirmada pelo usuario: separar explicitamente a Fotografia da Geracao da Gravacao da Classificacao ABC, preservando a semantica global do Delphi com guardrails.

- F6 apenas gera uma Fotografia da Geracao; nao grava automaticamente.
- Gravar e um comando separado, autorizado e auditado.
- A gravacao fica permitida somente nos modos por Produto (0, 1 e 2).
- Fornecedor, Grupo/Classe/Marca e Marca ficam somente para consulta/exportacao ate existir regra de conversao por Produto.
- A substituicao global deve ser atomica, com concorrencia, rollback e falhas explicitos.

Os termos canonicos desta decisao sao: Fotografia da Geracao, Classificacao ABC persistida e Gravacao da Classificacao ABC. A fotografia operacional do job nao substitui a autoridade compartilhada em produtos.resultadocurvaabc.
