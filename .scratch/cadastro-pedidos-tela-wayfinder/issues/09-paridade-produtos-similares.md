# Paridade da aba "Produtos Similares" — colunas reais

Type: grilling
Status: resolved
Blocked by:

## Question

O ticket 05 do mapa anterior (`Definir Itens do Pedido`) confirmou Produtos Similares como "painel informativo lateral, sem escrita, sem cálculo próprio", reaproveitando a mesma entidade já usada em Consulta de Compras. A imagem `produtos_similares.png` mostra um grid com colunas mais ricas do que um painel simples sugeriria: Código, Descrição, Linha, Coluna, Filial, Estoque, Reserva, Pedida, Valor, Similar, Produto. Confirmar se `PedidoCompraSimilaresPanel.tsx`/`PedidoCompraSimilaresReadService.php` (já implementados) já cobrem exatamente estas colunas — em particular Linha/Coluna (parecem ligadas ao conceito de grade/variantes, ticket 09 do mapa anterior) e Reserva/Pedida (quantidades que não apareceram documentadas no ticket 05 original). Se houver colunas faltando na implementação atual, documentar a query de origem e o gap.

## Answer

### Gap confirmado — implementação atual tem 3 campos, Delphi expõe ~10 (CONFIRMADO)

`resources/js/Pages/Cadastros/Estoque/PedidosCompra/types.ts:113-117`:
```ts
export type PedidoCompraSimilar = { produto: number; codigo_visual: string; descricao: string; };
```

`dmcadastropedidos.dfm:4048+` (`qryProdutosSimilares`, fonte `select distinct pssel.* ...`): confirma as colunas adicionais vistas em `produtos_similares.png` — **Linha/Coluna** são derivadas de `grade1`/`grade2` do produto similar (`case when pssel.grade1 is not null then (select g.descricao from grades g where g.codigo = pssel.grade1) ... end as linha`) — ou seja, **não é lógica nova**, é o rótulo da variante de grade (cor/tamanho) do produto similar, mesmo conceito de Grade já especificado na spec 08 do mapa anterior, só reexibido aqui como coluna informativa. Filial/Estoque/Reserva/Pedida/Valor vêm da mesma view base `pssel` (não totalmente rastreada nesta sessão — **INFERIDO** que são os mesmos campos de saldo por filial já usados em Consulta de Estoques/Consulta de Compras, dado o padrão de nomenclatura idêntico).

### Decisão

Especificar a expansão do painel de Produtos Similares para as colunas completas (Código, Descrição, Linha, Coluna, Filial, Estoque, Reserva, Pedida, Valor, Similar, Produto), mantendo a confirmação já feita no mapa anterior de que é um painel **somente leitura, sem cálculo próprio** — só amplia o que é exibido, reaproveitando a mesma entidade/view já usada em Consulta de Compras (ticket 08 daquele mapa). Publicado como prompt `14-speckit-prompt.md`.
