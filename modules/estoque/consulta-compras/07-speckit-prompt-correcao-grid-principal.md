/speckit.specify

# Correção — Consulta de Compras: edição inline, cores e destaque no grid principal

## Escopo

O grid principal de resultados (`dbgProdutos` no Delphi, aba **Produtos dos Grupos de Filiais** / `AbaProdutosTotal.tsx` no Laravel) é hoje **inteiramente somente-leitura** (`ErpPreferenceDataGrid as="readonly"`, ver `consultaComprasSugestaoColumns.tsx:...` e `AbaProdutosTotal.tsx:51`). No Delphi, 4 colunas são editáveis diretamente na grade e disparam efeitos reais (gravação imediata no banco ou seleção automática da linha), e várias células têm destaque de cor/negrito com significado de negócio. Nenhum desses dois comportamentos existe hoje no Laravel. Três correções independentes:

- **A. Colunas editáveis in-line** (4 campos + seus efeitos)
- **B. Cores/destaque de células e legenda**
- **C. Coluna "OK" (seleção da linha) — somente leitura, controlada por regra**

## A. Colunas editáveis in-line

Evidência Delphi — `fmconsultacompras.dfm` (colunas de `dbgProdutos`, a partir de `.dfm:2901`): das ~39 colunas do grid, apenas 4 **não** têm `ReadOnly = True`:

| Campo | Coluna Delphi | Efeito ao editar | Evidência |
|---|---|---|---|
| `lembrarpedido` | LEMBRAR (checkbox) | Grava imediatamente `produtos.lembrarpedido`, `datalembrarpedido` (data/hora do servidor) e `usuariolembrarpedido` (usuário logado) | `.dfm:3092-3104`; `dmconsultacompras.pas:3201-3212` (`dsrComprasTotalDataChange`, ramo `qryComprasTotallembrarpedido`) |
| `minimo` | MÍN. | Grava imediatamente o novo mínimo de estoque do produto **naquela filial** (`qryAtualizarEstoque`) | `.dfm:3356-3373`; `dmconsultacompras.pas:3225-3242` |
| `maximo` | MÁXIMO | Grava imediatamente o novo máximo de estoque do produto **naquela filial** (`qryAtualizarEstoque`, mesmo `ExecSql` de `minimo`) | `.dfm:3394-3412`; `dmconsultacompras.pas:3225-3242` |
| `sugestao` | SUGESTÃO | **Não** grava nada sozinho — apenas recalcula a coluna "OK" (`selecionado`) da própria linha: se o novo valor for `> 0` e a linha não estiver selecionada, seleciona; se for `<= 0` e estiver selecionada, deseleciona | `.dfm:3310-3327`; `dmconsultacompras.pas:3247-3262` (`dsrComprasTotalDataChange`, ramo `qryComprasTotalsugestao`) |

Cada edição de `minimo`/`maximo`/`lembrarpedido` é um `ExecSQL` imediato por célula (on-blur/post do campo), não um "salvar tudo" em lote — não há botão de confirmação para essas 3 colunas.

Hoje no Laravel: `minimo`, `maximo` e `lembrarpedido` já chegam no payload (`ConsultaComprasSugestaoService.php:294-296`) mas são exibidos como texto puro (`formatCell`, `consultaComprasSugestaoColumns.tsx:88-102`); `sugestao` idem. Não existe nenhum handler de edição, PATCH ou lógica de auto-seleção.

**Nota de infraestrutura**: o design system de grids já tem um modo editável pronto — `ErpPreferenceDataGrid` aceita `as="editable"` e delega para `EditableDataGrid` (`ErpPreferenceDataGrid.tsx:21-24,43-61`), já usado em outras telas (ex.: `userFiliaisColumns.tsx`, `userComissoesColumns.tsx`, `ManutencaoAgendamentoGrids.tsx`). A correção deve reaproveitar esse modo, não criar edição inline do zero.

Correção proposta:
- Trocar `as="readonly"` por `as="editable"` no grid de `AbaProdutosTotal.tsx` (e replicar em `AbaProdutosSimilares`/`AbaProdutosGrades`, que compartilham a mesma origem de dados no Delphi).
- `lembrarpedido`: checkbox editável; on-change dispara `PATCH` imediato (ex.: `/estoque/consulta-compras/produtos/{produto}/lembrar-pedido`) que grava `lembrarpedido`, `data_lembrar_pedido` e `usuario_lembrar_pedido` (usuário autenticado da sessão).
- `minimo`/`maximo`: campo numérico editável; on-blur/on-commit dispara `PATCH` imediato (ex.: `/estoque/consulta-compras/produtos/{produto}/estoque-minimo-maximo`, com `filial` no corpo) que grava o mínimo/máximo do produto **na filial daquela linha** — não em todas as filiais.
- `sugestao`: campo numérico editável; on-commit **não** chama o backend — apenas recalcula `selecionado` no estado local da linha (`> 0` → true, `<= 0` → false), reaproveitando a mesma lógica que já seleciona linhas hoje (ver item C).

## B. Cores e destaque de células

Evidência Delphi — `dbgProdutosDrawColumnCell` (`fmconsultacompras.pas:1339-1397`) e legenda (`.dfm:3577-3623`, painel `pnlSelecionar`):

| Condição | Efeito visual | Cor (Delphi) |
|---|---|---|
| Linha com `selecionado = true` (linha "OK") | Fundo de toda a linha (exceto colunas `lembrarpedido`/`promo`, que têm regra própria) | `clInfoBk` (bege claro do Windows, ~`#FFFFE1`), texto preto, **não** negrito |
| Linha com `ExisteSimilar = true` | Texto azul + **negrito**, combinável com o destaque de `selecionado` acima | Azul (`clBlue`) |
| Célula da coluna `lembrarpedido`, quando `true` | Fundo laranja-avermelhado | `$00142EDC` → RGB(220, 46, 20) — aprox. `#DC2E14` |
| Célula da coluna `promo` (produto em promoção), quando `true` | Fundo laranja-avermelhado (mesma cor acima) + texto branco **negrito** | Fundo `#DC2E14`, texto branco |

Legenda exibida abaixo do grid (`.dfm:3577-3623`), com as mesmas cores:
- Quadrado azul — "Existe similar"
- Quadrado laranja-avermelhado — "Produto em promoção"
- Quadrado laranja-avermelhado — "Lembrar Pedido"

Hoje no Laravel: nenhuma dessas 4 regras existe — o grid é renderização de texto simples sem cor condicional, e não há legenda.

Correção proposta:
- Aplicar as 4 regras de destaque acima como estilo condicional de célula/linha no grid (reutilizando os campos que já existem no payload: `selecionado`, `existe_similar`/`ExisteSimilar`, `lembrarpedido`, `produtoempromocao` — conferir nome exato de cada campo no payload atual e completar o que faltar).
- Adicionar uma legenda equivalente abaixo do grid com as 3 indicações acima (cores podem ser adaptadas à paleta do design system, mas mantendo o mesmo significado semântico: azul = existe similar, laranja/vermelho = promoção ou lembrar pedido).
- Onde `selecionado` e `ExisteSimilar` coincidirem na mesma linha, ambas as regras se aplicam simultaneamente (fundo bege + texto azul negrito), como no Delphi.

## C. Coluna "OK" (seleção da linha)

A coluna `selecionado` (caption "OK", `.dfm:3434-3452`) **é `ReadOnly = True`** — diferente das outras 4 — ou seja, o usuário **não clica nela diretamente** para marcar/desmarcar. Ela só muda de valor:
- automaticamente, pela edição de `sugestao` (item A, regra `> 0`/`<= 0` acima);
- ou pelo checkbox "Selecionar todos os produtos" (`ckbSelecionartodosprodutos`, `.dfm:3715-3730`), já coberto por `_select`/`onToggleAll` no Laravel atual.

Correção proposta: manter a coluna "OK" como somente-leitura no Laravel (não adicionar um checkbox clicável nela); seu valor deve refletir automaticamente o resultado da edição de `sugestao` da própria linha, além do "selecionar todos" já existente.

## Observação — não replicar

A coluna `diasEstCalcPedCompra` (`.dfm:3342-3354`) é a **única** das ~6 colunas de "dias calculados" sem `ReadOnly = True` no Delphi — todas as suas colunas irmãs (`diasEstoque`, `diasestoquecompedidosdecompra`, `diasEstoqueSimilares`, `diasEstoqueSimComPedCompra`, `diasEstoqueCalculado`) são somente-leitura. Não há nenhum handler em `dsrComprasTotalDataChange` para esse campo — tudo indica que é uma omissão acidental no formulário Delphi, não um comportamento intencional. **Não replicar como editável**: tratar como somente-leitura, igual às demais colunas de "dias".

O padrão inconsistente de negrito por coluna (algumas colunas explicitamente não-negrito, outras herdando o negrito padrão do grid, sem correlação aparente com importância do dado) também não tem valor semântico identificável — não é necessário reproduzir célula a célula; manter a tipografia padrão do design system atual.

## Critérios de aceite

- [ ] `lembrarpedido`, `minimo` e `maximo` são editáveis in-line no grid principal (`AbaProdutosTotal`); cada edição grava imediatamente via PATCH (sem botão de confirmação separado).
- [ ] Editar `minimo`/`maximo` grava o valor apenas para a filial daquela linha.
- [ ] Editar `lembrarpedido` grava também data/hora e usuário responsável.
- [ ] `sugestao` é editável in-line; editar recalcula `selecionado` da própria linha (`> 0` seleciona, `<= 0` deseleciona), sem chamada ao backend.
- [ ] A coluna "OK" (`selecionado`) permanece somente-leitura (não clicável diretamente).
- [ ] Linhas com `selecionado = true` recebem destaque de fundo (equivalente a `clInfoBk`).
- [ ] Linhas com `ExisteSimilar = true` recebem texto azul em negrito.
- [ ] Célula de `lembrarpedido = true` recebe fundo laranja-avermelhado.
- [ ] Célula de produto em promoção recebe fundo laranja-avermelhado + texto branco negrito.
- [ ] Legenda com as 3 indicações (similar / promoção / lembrar pedido) exibida junto ao grid.
- [ ] `diasEstCalcPedCompra` permanece somente-leitura.
- [ ] Mesmas 3 colunas editáveis + mesmas regras de cor aplicadas também em `AbaProdutosSimilares` e `AbaProdutosGrades` (mesma origem Delphi, mesmo grid).

## Matriz mínima de testes

| # | Cenário | Resultado esperado |
|---|---|---|
| 1 | Editar `minimo` de um produto na filial X | Grava novo mínimo apenas na filial X; demais filiais do mesmo produto inalteradas |
| 2 | Editar `maximo` de um produto | Grava novo máximo na filial da linha |
| 3 | Marcar checkbox `lembrarpedido` de uma linha | Grava `lembrarpedido=true`, `data_lembrar_pedido`=agora, `usuario_lembrar_pedido`=usuário logado |
| 4 | Editar `sugestao` de uma linha não selecionada para valor `> 0` | Linha passa a `selecionado=true` (coluna OK marca), sem chamada ao backend |
| 5 | Editar `sugestao` de uma linha selecionada para `0` | Linha passa a `selecionado=false` |
| 6 | Tentar clicar diretamente na coluna "OK" | Nada acontece (somente leitura) |
| 7 | Linha com `selecionado=true` e `ExisteSimilar=true` simultaneamente | Fundo bege da linha + texto azul negrito, ambos aplicados |
| 8 | Produto em promoção | Célula da coluna de promoção com fundo laranja-avermelhado e texto branco negrito |
| 9 | Editar `sugestao`/`minimo`/`maximo` na aba Produtos Similares | Mesmo comportamento de A e B da aba Total |

## Fora de escopo

- Qualquer correção de fórmula/SQL já coberta em `05-speckit-prompt-correcao-sql.md`.
- Colunas ausentes do grid (COMPOSTO, GRUPO, PROMO/PROMOÇÃO, TRÂNSITO/RESERVA separados, CST/CSOSN, FORNEC., etc.) — já cobertas em `06-speckit-prompt-correcao-resultados.md`.
- Grids de breakdown (Grupos de Filiais / Filiais), painel de contexto do produto e barra de comandos — já cobertos em `06`.
- Réplica pixel-a-pixel do padrão de negrito por coluna (sem significado de negócio identificado).
