# PostgreSQL: triggers de `movimentos`

## Método

Levantamento estritamente somente leitura no `puxare`, por `SELECT` em `pg_trigger`, `pg_proc`, `pg_class` e `pg_namespace`, com `pg_get_triggerdef`/`pg_get_functiondef`. Nenhuma credencial é registrada. Linhas citadas são relativas a `pg_get_functiondef`.

## Conclusão

`movimentos` é o livro encadeado e guarda o saldo posterior a cada lançamento; `estoques` é a projeção corrente por Produto+Filial. Para lote, `movimentoslotes` é o livro derivado e `estoqueslotes` a projeção Produto+Filial+Lote. Lançamentos Avulsos deve escrever somente em `movimentos`, em transação, deixando triggers manterem as projeções.

## Triggers confirmadas

- `movimentos_antesdeletar`: BEFORE DELETE -> função homônima.
- `movimentos_antesinseriratualizar`: BEFORE INSERT/UPDATE -> função homônima.
- `movimentos_depoisdeletar`: AFTER DELETE -> função homônima.
- `movimentos_depoisinseriratualizar`: AFTER INSERT/UPDATE -> função homônima.
- `trg_movimentos_audit_log_new`: auditoria.
- `trg_movimentos_set_created_updated_at`: timestamps.

## INSERT/UPDATE

`movimentos_antesinseriratualizar()`:

- preenche `UsuarioLogado`; preserva flags `NaoProcessarTRIGGERS`;
- exige `LoteProduto` quando a característica gerencia lote;
- gera `Numero` por `Movimentos_ProximoNumero()` e `Lancto=MAX+1` por Produto+Filial+Data;
- carrega `Operacao`, `Transferencia` e `QuandoEstoqueNegativo` de `TiposMovimentos`; em INSERT, `Operacao` nunca deve vir livremente da tela;
- completa transferência e Grupo;
- bloqueia `estoques(produto,filial) FOR UPDATE` (linhas 163-178); cria registro zerado apenas se `Parametros_Valor('INCLUIR ESTOQUE AUTOMATICO')='True'`;
- parte do movimento anterior por Produto+Filial, ordenado por Data/Lancto (linhas 287-315); sem anterior, parte de zero;
- atualiza saldos na própria linha e projeta em `estoques` (linhas 568-582);
- parâmetro `Atualizar última compra nas filiais` controla propagação de dados da última compra (linhas 530-566).

Contrato posicional de `TiposMovimentos.Operacao`:

| Pos. | Efeito |
|---:|---|
| 1 | EmEstoque |
| 2 | Reservado |
| 3 | Transito |
| 4 | Demonstracao |
| 5 | Conserto |
| 6 | Futuro |
| 7 | Danificada |
| 8 | EstoqueFisico |
| 9 | ReservaPrevia |
| 10 | UltimaEntrada quando `=` |
| 11 | última compra: data, quantidade, preços, IPI e valor |
| 12 | Financeiro (`+`, `-`, `=`, `*`, custo médio `C`) |
| 13 | venda/UltimaVenda e agregado Vendido |
| 14 | compra e agregado Comprado |
| 16 | Acabados |
| 17 | SemiAcabados |

Quantidades são absolutizadas antes do sinal (linhas 320-383). Se EmEstoque fica negativo e o tipo possui `QuandoEstoqueNegativo`, a parcela vira `QtdeNegativa`, EmEstoque fica zero e o AFTER gera compensação. Outros negativos/financeiro lançam exceção quando `ComExcecaoSeNegativo` está ativo.

`movimentos_depoisinseriratualizar()`:

- cria/atualiza movimentos componentes (`CmpMovimento`), negativos (`NEGMovimento`) e transferências (`TrfMovimento`);
- usa `RecalculoMovimentos` e força update do movimento cronologicamente seguinte para recalcular a cadeia;
- mantém `MovimentosVendasCompras` pelas posições 13/14 e chama `AtualizarQtdesCompostos`;
- com lote gerenciado, insere/atualiza `MovimentosLotes` com Produto, Filial, Lote, Data, Lancto, Tipo, Quantidade, Valor e Movimento (linhas 266-311).

Produtos compostos são calculados pelo mínimo disponível dos componentes dividido pela quantidade; movimentos de componentes são gerados e preços/valores rateados. Auxiliares: `Estoques_AtualizarProdutoComposto`, `AtualizarQtdesCompostos`, `Estoques_Preco`.

## DELETE

`movimentos_antesdeletar()` marca compostos em `MovimentosDeletando`, elimina derivados por `CmpMovimento`, `NEGMovimento` e `TrfMovimento`, e proíbe exclusão direta de componente fora da exclusão do pai.

`movimentos_depoisdeletar()` força recálculo do movimento anterior ou seguinte; sem vizinhos, zera `estoques` do Produto+Filial. Para composto, recalcula componentes e remove a marca.

## Cadeia de lotes

O AFTER de `movimentos` mantém `movimentoslotes`, não `estoqueslotes` diretamente. `movimentoslotes` possui `movimentoslotes_antesinseriratualizar` e `movimentoslotes_depoisdeletar`, além de auditoria/timestamps.

A função BEFORE de `movimentoslotes` busca o anterior por Produto+Filial+Lote e Data/Lancto, bloqueia `EstoquesLotes ... FOR UPDATE` (linhas 171-189), cria projeção zerada se ausente, aplica o mesmo vetor de Operação, valida negativos e atualiza `estoqueslotes`. O AFTER DELETE recalcula o vizinho ou zera a projeção. A FK `movimentoslotes.movimento -> movimentos.numero ON DELETE CASCADE` liga as exclusões.

## Tabelas/dependências confirmadas

`movimentos`, `tiposmovimentos`, `estoques`, `lotes`, `movimentoslotes`, `estoqueslotes`, `produtos`, `caracteristicas`, `produtoscompostos`, `movimentosdeletando`, `recalculomovimentos`, `movimentosvendascompras`, `usuarios`, `filiais`; funções `Movimentos_ProximoNumero`, `Parametros_Valor`, `Estoques_AtualizarProdutoComposto`, `AtualizarQtdesCompostos`, `Estoques_Preco`.

## Consequências para a especificação

1. Uma transação única deve escrever `movimentos`; exceção de trigger causa rollback integral.
2. Serviço fornece Produto, Filial, Data, Tipo, Quantidade e campos condicionais; não aceita Operação livre nem saldos calculados.
3. UI respeita lote obrigatório, transferência e campos financeiros definidos pelo Tipo.
4. Alterar Data/Produto/Filial/Tipo/Quantidade/Lote/valores pode reprocessar histórico e derivados: não é CRUD trivial.
5. Testes de integração observam `movimentos`, `estoques`, derivados, `movimentoslotes`, `estoqueslotes` e rollback.
6. Fluxo normal não usa `NaoProcessarTRIGGERS` nem atualiza projeções diretamente.

## Consultas usadas

```sql
SELECT t.tgname, pg_get_triggerdef(t.oid,true), p.proname
FROM pg_trigger t JOIN pg_class c ON c.oid=t.tgrelid
JOIN pg_namespace n ON n.oid=c.relnamespace JOIN pg_proc p ON p.oid=t.tgfoid
WHERE n.nspname='public' AND c.relname='movimentos' AND NOT t.tgisinternal;

SELECT pg_get_functiondef(p.oid)
FROM pg_proc p JOIN pg_namespace n ON n.oid=p.pronamespace
WHERE n.nspname='public' AND p.proname IN
('movimentos_antesdeletar','movimentos_antesinseriratualizar',
 'movimentos_depoisdeletar','movimentos_depoisinseriratualizar');
```

Consultas equivalentes foram feitas para `movimentoslotes` e `estoqueslotes`; nenhuma linha de negócio foi consultada.

## Pendências para Delphi/Laravel

Tipos permitidos no menu; campos editáveis; permissões de incluir/alterar/excluir; apresentação de transferência/lote/financeiro; serviço Laravel que traduz exceções; proteção de movimentos originados por outros módulos.
