# Especificar a aba "Notas Fiscais"

Type: grilling
Status: resolved
Blocked by:

## Question

A aba "4-Notas Fiscais" (`notas_fiscais.png`) lista notas fiscais vinculadas ao pedido: data, fornecedor, razão social, série, número da nota, situação. Localizar em `dmcadastropedidos.pas`/`.dfm` a query que alimenta este grid — provavelmente as notas de entrada já recebidas contra este pedido (ligação com o módulo de Notas Fiscais de Entrada, já confirmado existente no legado pelo ticket 02 do mapa anterior). Confirmar: é somente leitura? Existe navegação/drill-down para abrir a nota (dupla clique, botão)? A "situação" mostrada (`NOTA` no exemplo) é um enum a mapear. Documentar o contrato de leitura (de onde vêm os dados no Laravel — provavelmente já existe uma tabela/model de notas fiscais de entrada a reaproveitar) e se algo aqui precisa de spec nova ou só uma consulta simples.

## Answer

### SQL completa confirmada (CONFIRMADO, `dmcadastropedidos.dfm:2770-2830`)

```sql
SELECT DISTINCT(n.Codigo), n.Fornecedor, n.TipoFornecedor,
  (SELECT vf.nome FROM vfornecedores vf
   WHERE vf.tipo = n.TipoFornecedor AND vf.codigo = n.Fornecedor LIMIT 1) AS NomeFornecedor,
  n.Serie, n.Numero, n.Data,
  CAST(CASE WHEN n.Situacao = 'N' THEN 'NOTA'
            WHEN n.Situacao = 'P' THEN 'PARCIAL'
            WHEN n.situacao = 'C' THEN 'CANCELADA'
       END AS VARCHAR) AS DescricaoSituacao
FROM notaspag n, produtosnotaspag pn
WHERE n.Codigo = pn.CodigoNota AND pn.pedido = :pedido
```

Grid 100% read-only confirmado no `.dfm` (`ReadOnly = True`, `CanDelete = False`, `CanNotInsertFromGrid = False`). Colunas exibidas: Data, Fornecedor (código), Razão Social, Série, Nº Nota, Situação. `Situacao` é um enum de 3 valores (`N`=Nota, `P`=Parcial, `C`=Cancelada) — mapeado para descrição na própria query, não no client.

**Achado**: as tabelas `notaspag`/`produtosnotaspag` são **distintas** de `documentospag`/`duplicatas` (já especificadas no ticket 11 do mapa anterior, "Documentos a Pagar") — são as notas fiscais de entrada efetivamente recebidas contra os produtos deste pedido (join por `pn.pedido = :pedido`), não o título financeiro gerado ao gravar o pedido. Não confundir os dois pares de tabelas.

### Decisão

Especificação simples: um endpoint que executa essencialmente esta mesma query (parametrizada pelo número do pedido), somente leitura, sem paginação necessária (poucas notas por pedido). Sem drill-down/navegação identificado no `.dfm` (grid sem `OnDblClick` nem botão de ação associado a esta aba especificamente). Publicado junto no prompt `11-speckit-prompt.md`.
