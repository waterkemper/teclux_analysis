# Paridade campo-a-campo do modal "Cadastro de Itens do Pedido"

Type: grilling
Status: resolved
Blocked by:

## Question

A imagem `tela_inclusao_produtos.png` mostra o modal completo de item: checkbox "Selecionar produtos por fornecedor", checkbox "Atualizar o preço de venda deste produto a partir deste pedido", CFOP na empresa (código + lookup F9 + descrição, ex. "2102 — COMPRA PARA COMERCIALIZAÇÃO" com uma segunda linha "1 — COMPRA PARA COMERCIALIZACAO 900" — possível CFOP efetivo/da nota distinto do CFOP da empresa), Produto (código + lookup + descrição), CST do produto, NCM, Descrição do Preço (coluna de preço, ex. "3 NORMAL 3"), Quantidade, Preço Unitário, Valor Total, Desc. Geral, Desc. Item, Valor Líquido, Frete, Valor Total + IPI, Unidade da NF (com lookup) + Unidade do Estoque, Fator Conversão, Qtde Estoque, Data Entrega, abas "1-Impostos da NF"/"2-Pis/Cofins" com os campos de ICMS Próprio/ICMS-ST/IPI já especificados nas specs 02-04 do mapa anterior, e um painel "Total Calculado" (Base Cálculo ICMS, Base Substituição, Base ST Ret Ant, Total Produtos, Valor do ICMS, ICMS Substituição, ICMS ST Ret Ant, Valor IPI, Total do Pedido). Comparar campo a campo com `PedidoCompraItemForm.tsx` (já implementado) e registrar todo campo/lookup/checkbox ausente ou divergente — em especial o CFOP de dois níveis (empresa vs. efetivo/nota), que não foi detalhado no mapa anterior.

## Answer

### Gap confirmado — implementação atual é um formulário mínimo, Delphi tem ~40 campos em 2 abas + painel de totais (CONFIRMADO)

`PedidoCompraItemForm.tsx` (198 linhas) hoje só tem: lookup de Produto, Descrição (read-only), Quantidade, Preço Unitário, Qtd. Entregue (read-only), botões Gravar/Cancelar. **Nenhum campo fiscal, nenhum checkbox de contexto, nenhuma aba, nenhum painel de totais.**

O tipo `PedidoCompraItemFiscal` (`types.ts:97`) já existe como `Record<string, string|boolean|null>` e o item já carrega um objeto `fiscal` vindo do backend (`resolveProduto`) — mas **nunca é renderizado** na tela.

No backend, `PedidoCompraItemProdutoResolveService.php:45-53` já monta a chave `fiscal` da resposta, mas com **`ncm`/`cfop`/`cst` como `null`** (placeholders não populados) — só as flags `alteracao_manual_icms/ipi/pis/cofins` (equivalentes às flags "digitado" das specs 02-05) parecem preenchidas. Ou seja: o gap não é só de UI — o próprio backend de resolução de item ainda não está devolvendo os valores fiscais reais calculados pelo motor (specs 02-05), só a estrutura.

### Campos/controles ausentes, por grupo (CONFIRMADO por comparação com `tela_inclusao_produtos.png`)

1. **Checkboxes de contexto**: "Selecionar produtos por fornecedor", "Atualizar o preço de venda deste produto a partir deste pedido" (mesma flag `permitiratualizardigitado` do ticket 08).
2. **"CFOP" é na verdade um lookup de Natureza da Operação, com 2 linhas de exibição** (CONFIRMADO, `fmcadastroprodutospedidos_.pas:746-1090`, resolvida a DÚVIDA que este ticket levantou inicialmente): o campo é `fraConsultaNatureza`, que resolve `qryProdutosPedidosnatureza` (um código pequeno de Natureza da Operação, ex. "1") para `qryProdutosPedidoscodigofiscal` (o CFOP de fato, ex. "2102"). A primeira linha exibida ("2102 — COMPRA PARA COMERCIALIZAÇÃO") é o CFOP resolvido; a segunda linha ("1 — COMPRA PARA COMERCIALIZACAO 900") é o registro de Natureza da Operação subjacente que gerou essa resolução — **não são dois CFOPs concorrentes**, é um único lookup (Natureza → CFOP) mostrando as duas metades da resolução. Especificar como um campo de busca de Natureza da Operação que resolve/exibe o CFOP correspondente.
3. **CST do produto, NCM, Descrição do Preço** (coluna de preço).
4. **Campos monetários**: Valor Total, Desc. Geral, Desc. Item, Valor Líquido, Frete, Valor Total + IPI.
5. **Unidade/conversão**: Unidade da NF (com lookup), Unidade do Estoque, Fator Conversão, Qtde Estoque, Data Entrega.
6. **Aba "Impostos da NF"**: CST empresa/nota, % Red., Valor Reduzido, Base de Cálculo, %ICMS, Valor, %SN, Valor SN (ICMS Próprio); MVA, %Red., Valor Redução, Base de Cálculo, %ICMS, Valor (ICMS-ST); CST IPI na empresa, Base de Cálculo, %IPI, Valor do IPI — todos já especificados em fórmula nas specs 02-04, faltando só a superfície de edição.
7. **Aba "Pis/Cofins"** — não aberta nas imagens, mas confirmada existente pela aba visível; campos correspondentes já especificados na spec 04.
8. **Painel "Total Calculado"** (somente leitura): Base Cálculo ICMS, Base Substituição, Base ST Ret Ant, Total Produtos, Valor do ICMS, ICMS Substituição, ICMS ST Ret Ant, Valor IPI, Total do Pedido.

### Decisão

Este é o maior gap de paridade do mapa — o formulário precisa crescer de 4 para ~40 campos, reaproveitando integralmente as fórmulas já especificadas nas specs 01-05 (nenhum cálculo novo, só exposição). O "CFOP em dois níveis" resolvido: é um único lookup de Natureza da Operação→CFOP, não dois campos concorrentes. Publicado como prompt `15-speckit-prompt.md`.
