# Paridade da grade "Produtos" — legendas, ícones e ordenação

Type: grilling
Status: resolved
Blocked by:

## Question

Nas imagens (`tela_principal.png`, `notas_fiscais.png`, `contatos.png`) o grid de Produtos mostra: colorização por linha conforme situação (verde para itens liquidados/concluídos no exemplo), uma legenda de rodapé "SITUAÇÃO DOS PRODUTOS: Em [A]berto [P]arcial Li[Q]uidado Conc[L]uído Concluído Excedido [C]ancelado" com um checkbox "Marcar/Desmarcar Todos [Atualização do preço de Venda]", e uma coluna de ícones à direita do grid (página/documento, X vermelho, cópia, cifrão $, F11 com setas para cima/baixo). Mapear cada ícone/legenda para a ação real no `dmcadastropedidos.pas`/`fmcadastropedidos.pas` (ex.: $ provavelmente abre Formação de Preço de Venda do item selecionado, X exclui, cópia aciona a Cópia de Produtos ligada à grade, F11/setas ordenam colunas) e comparar com o que `PedidoCompraItensPanel.tsx`/`PedidoCompraGradeMatrix.tsx` (já implementados) oferecem hoje. Registrar gaps de paridade visual/funcional a corrigir.

## Answer

### Mapeamento dos ícones (CONFIRMADO, `fmcadastropedidos.dfm:4046-4535`)

| Ícone | Botão | Hint/ação | Já implementado em `PedidoCompraItensPanel.tsx`? |
|---|---|---|---|
| Página/documento | `sbnIncluirProduto` | Incluir produto pedido | **Sim** (`startIncluir`) |
| X vermelho | `sbnExcluirProduto` | Excluir produto pedido | **Sim** (`excluirItem`) |
| Cópia | `sbnCopiarProdutos` | "Copiar produtos de **outro pedido**" | **Fora de escopo** — aciona o satélite `fmcopiarprodutospedidos`, já excluído no mapa anterior (ticket 10), não a grade. Não é gap. |
| $ | `sbnAcionarTelaFormacaoPrecoVenda` / `sbnCustoePrecoVenda` | Formação de Preço de Venda / alternância de visualização Custo×Preço | **Sim**, Formação de Preço (`abrirFormacao`) já wireado. `sbnCustoePrecoVenda` (alternar exibição percentual atual×venda×digitado, com destaque vermelho quando há diferença) **não confirmado como implementado** — verificar. |
| Setas cima/baixo | `sbnDeslocarParaCima`/`sbnDeslocarRegistroParaBaixo` | Reordenar item na lista (Alt+Up/Alt+Down) | **NÃO LOCALIZADO** em `PedidoCompraItensPanel.tsx` — gap real. |
| (não visível na imagem, condicional) | `sbnVisualizarGrade`, `sbnRecalcularPrecoSugerido`, `sbnImportarPedidoDaico` | Grade / recalcular preço sugerido / Daico | Grade: **Sim** (`abrirGrade`). Recalcular preço sugerido: não confirmado. Daico: fora de escopo (dúvida de negócio não confirmada, ticket 12 do mapa anterior). |

### Legenda de situação e cores (CONFIRMADO, `fmcadastropedidos.pas:849-897`)

```
A (Aberto)            → fundo branco,  texto preto
P (Parcial)            → fundo aqua,    texto preto
L (Concluído)           → fundo verde ($007FAA55), texto preto
  — Concluído Excedido (quantidade < totalrecebido) → mesmo fundo verde, texto VERMELHO
Q (Parcial Liquidado)   → fundo cinza,   texto preto
C (Cancelado)           → fundo amarelo, texto preto
```

Adicional: coluna de preço com `precodigitadoalterado = true` → fonte vermelha nessa célula (indica edição manual divergente do calculado). **Nenhuma dessa coloração está implementada hoje** em `PedidoCompraItensPanel.tsx` (busca por padrões de cor/situação não encontrou nada) — gap real e visualmente importante (é o principal sinalizador visual da tela no Delphi).

### Checkbox "Marcar/Desmarcar Todos" (CONFIRMADO, `fmcadastropedidos.pas:1324-1327`)

`ckbMarcarTodos.Checked` → `dtmCadastroPedidos.MarcarDesmarcarAtualizarPrecodeVenda(bool)` — alterna em lote a mesma flag por item já vista no modal de item ("Atualizar o preço de venda deste produto a partir deste pedido", campo `permitiratualizardigitado`). **Não confirmado como implementado** na grade atual — verificar.

### Decisão

3 gaps reais confirmados a especificar: (1) colorização de linha por situação + a variante "Concluído Excedido" com texto vermelho + destaque vermelho de preço editado manualmente; (2) reordenação de itens (deslocar cima/baixo); (3) checkbox "Marcar/Desmarcar Todos" para a flag de atualização de preço em lote. Cópia de produtos confirmada fora de escopo (não é ação da grade). Publicado como prompt `13-speckit-prompt.md`.
