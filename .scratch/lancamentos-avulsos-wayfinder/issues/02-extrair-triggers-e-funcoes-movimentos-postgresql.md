Type: research
Status: resolved
Blocked by:

## Question

Na base PostgreSQL local `puxare`, qual é o DDL integral e a cadeia de chamadas das triggers de `movimentos` — antes/depois de INSERT, UPDATE e DELETE —, quais funções/tabelas/colunas atualizam `estoques`, Lotes e movimentos relacionados, como interpretam `operacao`, flags de bypass, transferências, compostos, negativos, financeiro e última compra, e quais garantias/erros transacionais formam o contrato que o Laravel deve respeitar?

## Answer

A inspeção somente leitura confirmou que `movimentos` é simultaneamente Livro-Razão cronológico e fotografia posterior de cada Lançamento, enquanto `estoques` é a projeção corrente por Produto+Filial. As triggers BEFORE de INSERT/UPDATE serializam pelo registro de `estoques`, derivam `operacao` de `tiposmovimentos`, calculam saldos posicionais, Financeiro e Última Compra, rejeitam negativos conforme a configuração e projetam o resultado. As triggers AFTER geram Movimentos de componentes, compensação de negativo e transferência, propagam o recálculo cronológico, mantêm agregados e derivam `movimentoslotes`.

Para Produtos com Lote, a cadeia real é `movimentos` → `movimentoslotes` → `estoqueslotes`: triggers próprias de `movimentoslotes` mantêm a projeção Produto+Filial+Lote. Exclusões removem derivados por `cmpmovimento`, `negmovimento` e `trfmovimento`, recalculam os vizinhos ou zeram a projeção; a FK de `movimentoslotes` com `ON DELETE CASCADE` mantém a cadeia do Lote. Exceções abortam a mesma transação.

O contrato para o Laravel é gravar somente o Movimento-raiz em uma transação, nunca fornecer `operacao` livre, nunca atualizar diretamente `estoques`/`movimentoslotes`/`estoqueslotes` e nunca usar flags de bypass no fluxo normal. Alterações retroativas não são CRUD simples porque reprocessam a cadeia e seus derivados.

O levantamento autocontido, incluindo vetor posicional, funções auxiliares, tabelas afetadas, erros e implicações de teste, está em [PostgreSQL: triggers de `movimentos`](../research/triggers-movimentos-postgresql.md).
