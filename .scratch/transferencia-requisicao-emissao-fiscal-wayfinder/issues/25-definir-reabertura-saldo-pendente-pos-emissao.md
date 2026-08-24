# Definir reabertura por saldo pendente após a emissão da Transferência

Label: wayfinder:issue
Type: decision
Status: resolved
Blocked by: 24-pesquisar-lotes-agrupamentos-e-saldo-parcial-delphi-laravel

## Question

Quando a confirmação fiscal atende somente parte da quantidade pedida, o Laravel deve criar automaticamente uma nova requisição para o saldo, seguindo o parâmetro do Delphi, e qual deve ser o ciclo de estados entre a requisição original, o documento fiscal e a nova requisição?

## Answer

### DECISAO NOVA — ciclo do saldo pendente

O comportamento a especificar no Laravel e:

1. Ler e bloquear as linhas da confirmacao com `FOR UPDATE`; o payload da tela nao e fonte de verdade.
2. Para cada linha original com `qtderecebida > 0` e `qtdepedida > qtderecebida`, calcular `saldo = qtdepedida - qtderecebida`.
3. Alocar o documento fiscal do grupo e aplicar, na mesma transacao, os movimentos da quantidade atendida e a liberacao da quantidade nao atendida.
4. Se o parametro legado estiver ativo, criar uma nova linha aberta por linha original com saldo positivo, mesmo produto, requisitante e requisitada, `codigoorigem` apontando para a origem, `dadofiscal` nulo e sem copiar lote operacional ou artefato fiscal.
5. Reservar o saldo da nova linha com `TEP` quando `requisicao_subtrai_estoque` estiver ativo.
6. Fechar a linha original em `F` e vincular seu `dadofiscal`. A linha original nao e reaberta.

### CONFIRMADO — escopo e parametro

O parametro canonico e o existente `Reincluir requisicoes com saldo pendente`, resolvido pelo manifesto da Transferencia para a filial ativa. Nao deve ser criado outro parametro fiscal ou por NF.

O disparo e por linha original, dentro do grupo requisitante que esta sendo confirmado. O agrupamento da NF continua sendo por filial requisitante; a quantidade de saldo nao cria uma nova NF naquele momento.

### CONFIRMADO — estados e falhas

- Atendimento total: linha original `A -> F), com `dadofiscal); nenhuma nova requisicao.
- Atendimento parcial com parametro desligado: linha original `A -> F), com liberacao da diferenca; nenhuma nova requisicao.
- Atendimento parcial com parametro ligado: linha original `A -> F), com `dadofiscal), e nova linha `A) com o saldo.
- Quantidade zero: linha nao e elegivel para emissao e nao gera saldo.
- Falha antes do commit fiscal/operacional: rollback do grupo; nao fecha a linha, nao cria saldo e nao deixa movimentos parciais.
- Documento pendente de autorizacao: a Transferencia permanece encerrada operacionalmente; a autorizacao posterior nao reabre a linha nem altera a nova requisicao de saldo.
- Retry da mesma intencao: retorna o resultado idempotente. Uma nova tentativa nao pode gerar outro saldo porque a linha original ja esta fechada e vinculada.

### CONFIRMADO — movimentos

O Laravel atual ja implementa a sequencia `TPE/TFR) para liberar a diferenca, cria a nova requisicao e grava `TEP) para o saldo. Os testes `TransferenciaRequisicaoConfirmarTest` e `TransferenciaRequisicaoConfirmarTpeTfrTepDadofiscalTest` cobrem saldo, origem, situacao aberta e vinculo fiscal dos movimentos.

### DIVERGENTE — observabilidade a corrigir no prompt futuro

A nova linha Laravel ainda nao recebe a observacao legada “Saldo pendente da requisicao n. X”. O prompt de ajuste deve exigir essa mensagem, preservando tambem `codigoorigem`.

### CRITERIO PARA O PROXIMO PROMPT

O prompt final deve manter a implementacao existente de transacao, lock, idempotencia e movimentos, acrescentando apenas as lacunas confirmadas: observacao compativel, validacao da filial fisica na fotografia e testes de total/parcial/zero/falha/retry/concorrencia. Cancelamento e inutilizacao continuam no modulo posterior de Notas Fiscais Avulsas.

## Decision boundaries

- A requisição original que recebeu `dadofiscal` deve permanecer fechada para a transferência realizada; não limpar seu documento nem reutilizar seu número.
- O saldo deve ser `qtdepedida - qtderecebida`, calculado a partir de leitura atual protegida por lock, nunca do payload antigo da tela.
- A nova requisição não pode copiar `dadofiscal`, movimentos ou artefatos fiscais da original.
- Cancelamento/inutilização fiscal pertence ao módulo posterior de Notas Fiscais Avulsas e não deve ser introduzido neste fluxo.

## Required output

Definir:

1. nome e escopo do parâmetro;
2. evento exato que dispara a criação do saldo (por linha, por grupo requisitante ou após todas as NFs);
3. transação, locks e idempotência;
4. campos herdados e campos obrigatoriamente novos;
5. estados e mensagens exibidos ao operador;
6. comportamento quando a emissão falha antes de existir `dadofiscal` ou fica pendente de autorização;
7. testes de quantidade total, parcial, zero, retry e concorrência.

Do not implement code. Produce the decision that a later `/speckit.specify` prompt can implement without inventing a reconciliação Delphi órfã.
