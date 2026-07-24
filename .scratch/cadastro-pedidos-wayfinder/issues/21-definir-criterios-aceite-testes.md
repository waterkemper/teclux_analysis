# Definir critérios de aceite e matriz de testes

Type: task
Status: open
Blocked by: 20

## Question

Consolidar critérios de aceite e a matriz mínima de testes cobrindo os casos-ouro de cada fatia: cabeçalho (4 validações de `GravarPedido`, máquina de situação), previsões (soma 100%, absorção de resto), itens (auto-cadastro de fornecedor, wipe ao trocar fornecedor), motor de custo (rateio, produto novo sem preço), motor de impostos (ICMS/ICMS-ST com e sem divergência de alíquota, IPI, PIS/COFINS, CSOSN vs. CST por regime do fornecedor), formação de preço de venda, grade (bloqueio de edição quando divergente, produtos compostos), documentos a pagar (espelho com previsões, remoção ao cancelar), e as funcionalidades acessórias decididas em escopo.
