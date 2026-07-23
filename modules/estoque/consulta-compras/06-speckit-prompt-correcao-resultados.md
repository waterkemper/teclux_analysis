# Prompt para /speckit.specify — Correção (Tela de Resultados)

```text
/speckit.specify

Corrija a tela de Resultados da Consulta de Compras (Estoque → Compras → Consultas), já implementada em `modules/estoque/consulta-compras/01-speckit-prompt.md`/`02-speckit-prompt.md`/`03-speckit-prompt.md` → spec `266-consulta-compras-parametros` → aba "Resultados" de `resources/js/Pages/Cadastros/Estoque/ConsultaCompras/`. Isto **não é uma feature nova**: é uma correção de completude identificada por comparação minuciosa entre a tela Delphi pós-"Gerar F6" (aba "Consulta" em `fmconsultacompras.dfm`/`.pas`, captura `resultados_delphi.png`, log de SQL `sqls.sql`) e o que o Laravel exibe hoje. A tela Delphi tem 3 camadas que o Laravel implementa apenas parcialmente: (1) o grid principal expõe 10 de 28 colunas Delphi; (2) dois grids de breakdown por grupo-de-filial e por filial individual não existem; (3) todo o painel de contexto do produto selecionado (histórico de vendas, próximo pedido, observações, etc.) está ausente.

Não invente comportamento novo além do que este prompt descreve. Inspecione o checkout Laravel atual antes de alterar qualquer arquivo — os caminhos citados abaixo refletem o estado no momento da auditoria; confirme novamente antes de editar. Para cada item, releia o trecho correspondente de `fmconsultacompras.dfm`/`.pas`/`dmconsultacompras.pas` antes de implementar — este prompt resume a divergência, não substitui a leitura do Delphi original. As citações "Laravel" abaixo referenciam arquivos em `resources/js/Pages/Cadastros/Estoque/ConsultaCompras/` e `app/Services/Estoque/ConsultaComprasSugestaoService.php`, salvo indicação contrária.

**Nota de sobreposição**: o item "Totalização (Sugestão/Qtde vendida)" já foi especificado no `05-speckit-prompt-correcao-sql.md` (item E.1) — as colunas `total_venda`/`total_custo` já estão cadastradas no catálogo de colunas do grid principal (`ConsultaComprasSugestaoGridCatalog.php:39-40`, `defaultOrder` 75/76) mas nunca são populadas por `ConsultaComprasSugestaoService::buildLinha`. Implemente esse item pelo `05`, não repita aqui — só está mencionado para você não estranhar a coluna "vazia" durante os outros itens deste prompt.

## Escopo

Cinco áreas independentes:

**A. Grid principal (`dbgProdutos`/"Produtos dos Grupos de Filiais") — colunas ausentes**
1. Colunas já disponíveis no payload PHP mas não cadastradas no catálogo de colunas exibidas (correção rápida).
2. Colunas sem nenhum dado no backend (gap real, precisa de trabalho de query/domínio).

**B. Grids de breakdown do produto selecionado — ausentes por inteiro**
3. Grid "Produtos dos Grupos das Filiais" (breakdown por grupo de filiais).
4. Grid "Produtos das Filiais" (breakdown por filial individual, todas as filiais do produto).

**C. Painel de contexto do produto selecionado (drill-down) — ausente por inteiro**
5. Grid VENDAS (histórico mensal, 3 canais).
6. Observações Lembrar Pedido.
7. Próximo Pedido (NR/Qtdade/Previsão/Emissão).
8. Última Venda, Data de Cadastro, Alterado em/Validade do preço.
9. CST/CSOSN, Descrição do Preço.
10. Visualizador de foto do produto.

**D. Aba "Produtos Similares" — gaps adicionais**
11. Coluna INATIVO ausente.
12. Sub-grid de rollup por categoria de estoque (trânsito/reserva/reserva prévia/pedidos separados) simplificado demais.

**E. Barra de comandos — ações ausentes**
13. Relatório F7 (impressão).
14. "Pendente" (produtos pendentes de emissão de NF).
15. "Cadastro de Produtos" (distinto de "Ficha de Produtos").
16. "Requisitar item atual" (Ctrl+F11, por linha) e "Atualizar Registro" (refresh de uma linha) — ações de grid, não de toolbar.

## A.1 — Colunas já no payload, faltando só no catálogo

**Evidência**: os seguintes campos já são retornados por `ConsultaComprasSugestaoService::buildLinha` mas não estão registrados em `ConsultaComprasSugestaoGridCatalog.php`, logo chegam ao front e não aparecem em nenhuma coluna:

| Campo Laravel | Linha em `buildLinha` | Coluna Delphi equivalente |
|---|---|---|
| `minimo` | `:241` | MÍN. |
| `maximo` | `:242` | MÁXIMO |
| `sugestaominimo` | `:239` | SUG.MÍNIMO |
| `sugestaomaximo` | `:240` | SUG.MÁXIMO |
| `resultadocurvaabc` | `:244` | ABC |
| `lembrarpedido` | `:243` | LEMBRAR |
| `valorgrade1` | `:247` | LINHA |
| `valorgrade2` | `:248` | COLUNA |
| `diasestoque` | `:236` | DIAS EM ESTOQUE |

**Correção**: registrar essas 9 colunas em `ConsultaComprasSugestaoGridCatalog.php`, com `defaultOrder`/visibilidade coerente com a posição das colunas equivalentes no Delphi (`.dfm:2901-3567`), sem exigir mudança de backend — o dado já existe.

## A.2 — Colunas sem dado no backend (gap real)

**Evidência Delphi** (`fmconsultacompras.dfm:2901-3567`, cross-referenciado com `dmconsultacompras.pas`/`qryComprasTotal`):

| Coluna Delphi | Campo Delphi | Significado |
|---|---|---|
| PRODUTO | `caracteristicavisual` | código visual da característica/grade |
| COMPOSTO | `composto` | produto composto (kit) |
| GRUPO | `codigogrupo` | grupo do produto |
| PROMO / PROMOÇÃO | `promocao`/`descricaopromocao` | código/descrição da promoção |
| REFERÊNCIA | `referencia` | referência do produto |
| TRÂNSITO | `total_transito` | estoque em trânsito (hoje só somado dentro de `total_estoque`) |
| RESERVA | `reservado` | estoque reservado (idem) |
| RES.PRÉVIA | `reservaprevia` | reserva prévia (idem) |
| PED.FILIAIS / PED.FORN. | `total_pedidos_filiais`/`total_pedidos_fornecedores` | pedidos pendentes por origem (hoje só combinado em `total_pedido`) |
| DIAS EST.PED.FIL./COMPRA | `diasestoquecompedidosdecompra` | dias de cobertura COM pedidos pendentes somados |
| DIAS EM EST.SIM./DAS SIM.EST.PED.FIL. | `diasEstoqueSimilares`/variante com pedidos | dias de estoque considerando produtos similares agrupados |
| DIAS EM EST.CALC./DAS EST.CALC.PED.FIL. | `diasEstoqueCalculado`/variante com pedidos | dias de estoque recalculado pós-sugestão |
| CST / CSOSN | `incidencia`/`csosn` | situação tributária |
| CLASSE | `codigoclasse`/`classe` | código e descrição da classe do produto |
| PROMO (cor da célula) | `promo` | destaque visual de "produto em promoção" (ver legenda da grid) |
| FORNEC./NOME DO FORNECEDOR | `fornecedor`/`nomefornecedor` | fornecedor da última nota de entrada (`LEFT JOIN notaspag` em `qryComprasTotal`) |

**Correção**: para cada campo, adicionar ao SELECT de `LegacyConsultaComprasSugestaoRepository`/`ConsultaComprasSugestaoService::buildLinha` (a maioria já está disponível via os joins existentes com `produtos`/`caracteristicas`/`grupos`/`promocoes` — confirme no Delphi de onde cada um vem exatamente antes de implementar) e registrar a coluna correspondente no catálogo. Trânsito/Reserva/Res.Prévia/Ped.Filiais/Ped.Fornecedor: já são somados hoje (dentro de `total_estoque`/`total_pedido`), só precisam ser expostos também como campos individuais, sem remover as somas já existentes. Os 3 campos de "dias" derivados (`diasestoquecompedidosdecompra`, `diasEstoqueSimilares`, `diasEstoqueCalculado`) exigem replicar as fórmulas Delphi correspondentes — releia `qryComprasTotal` (log `sqls.sql`, linha 1) para cada uma antes de implementar. Fornecedor da última compra: precisa do mesmo `LEFT JOIN notaspag`/`vfornecedores` que o Delphi usa em `qryComprasTotal` (ver final da query no log — `left join notaspag np on (...) left join vfornecedores vf on (...)`), hoje ausente de `LegacyConsultaComprasDetalheCompraRepository`.

## B — Grids de breakdown do produto selecionado ausentes

**Evidência Delphi**:
- "PRODUTOS DOS GRUPOS DAS FILIAIS" (`dbgProdutosGrupos`, fonte `dsrComprasGruposFiliais`/`qryComprasGruposFiliais` — log `sqls.sql` linha 2): breakdown do produto selecionado **por grupo de filiais** — colunas mnemônico, estoque, trânsito, reservado, reserva prévia, futuro, ped.filiais, ped.fornecedor, vendido, dias em estoque, dias est.ped.compra, sugestão, mínimo, sug.mínimo, máximo, sug.máximo, últ.transf.filial, últ.venda, %estoque.
- "PRODUTOS DAS FILIAIS" (`dbgProdutosFiliais`, fonte `dsrComprasFiliaisGrupo`/`qryComprasFiliaisGrupo` — log `sqls.sql` linha 3): mesmo conjunto de colunas, mas breakdown **por filial individual** (todas as filiais do produto, não só a filial "vencedora" da linha principal).

**Evidência Laravel**: `ConsultaComprasSugestaoService::buildLinha` sempre retorna `'grupo_filial' => null` (linha 230) — não existe rota de agregação por grupo de filiais nem endpoint que traga "esse produto em todas as filiais" como grid à parte. Esses dois grids não existem em nenhum lugar da aba Resultados.

**Correção**:
- Criar dois novos repositórios/serviços (ex.: `LegacyConsultaComprasBreakdownGrupoRepository`/`...FilialRepository`, ou métodos novos nos repositórios existentes), replicando `qryComprasGruposFiliais` e `qryComprasFiliaisGrupo` (log `sqls.sql`, linhas 2 e 3) — mesma fórmula de sugestão/diasestoque já implementada em `SugestaoCompraFormula`/`TabelaRedutoraLookup`, mas agregada por grupo de filiais e por filial, respectivamente, do produto atualmente selecionado na grid principal.
- Expor via endpoint (drill-down ao selecionar uma linha na grid principal, mesmo padrão de UX que o Delphi usa — os dois grids atualizam quando o usuário seleciona um produto diferente na grid de cima).
- Criar dois novos componentes React (grids) na aba Resultados, exibidos abaixo/ao lado da grid principal, populados a partir da seleção de linha atual.
- `Últ.Transf.Filial`/`Últ.Venda`: confirme a origem exata desses dois campos em `dmconsultacompras.pas` (parecem vir de subqueries pontuais — `datahorapedido`/`ultimavenda`, ver log `sqls.sql` linha 3) antes de implementar.

## C — Painel de contexto do produto selecionado (drill-down)

**Evidência Delphi**: painel compartilhado `pnlConsultaAbaixo` (`.dfm:4659-6900+`), visível abaixo da grid principal, atualizado conforme a linha selecionada.

### C.1 — Grid VENDAS (histórico mensal, 3 canais)

**Evidência**: `dbgVendas`, fonte `dsrVVendas` (log `sqls.sql`, linha 4 — `qryVVendas`): colunas Mês, Total Geral (Qtdade/Vendas), Total Internet (Qtdade/Vendas), Total Loja (Qtdade/Vendas) — série histórica mês a mês do produto selecionado, já com a mesma separação internet/loja usada na velocidade de vendas (`total_internet`/`total_loja`, já existentes em `buildLinha`, mas aqui por mês, não só o total do período).

**Correção**: criar um novo endpoint/serviço que agregue `qryVVendas` por mês para o produto selecionado (reaproveitando a lógica de `LegacyConsultaComprasVelocidadeRepository`, mas agrupando por `mes` em vez de somar o período inteiro), e um componente de grid mensal na aba Resultados, drill-down por seleção de linha.

### C.2 — Observações Lembrar Pedido

**Evidência**: `mmoObsLembarPedido`, campo `obslembrarpedido` de `dsrComprasTotal` — texto livre associado ao produto quando marcado "lembrar pedido".

**Correção**: adicionar `obslembrarpedido` ao SELECT/retorno de `buildLinha` (ou do detalhe do produto), exibir como campo de texto (read-only, a menos que o Delphi permita edição — confirme) no painel de contexto.

### C.3 — Próximo Pedido (NR/Qtdade/Previsão/Emissão)

**Evidência**: fonte `dsrConsultaProdutosPedidos` — campos `pedido`(NR)/`quantidadependente`(Qtdade)/`entrega`(Previsão)/`emissao`(Emissão) — dados do próximo pedido de compra já em aberto para o produto.

**Correção**: criar uma consulta nova (não existe hoje nenhuma leitura de "próximo pedido pendente" no Laravel) que busque o pedido de compra em aberto mais relevante para o produto+filial selecionado, e exibir no painel de contexto. Releia `dmconsultacompras.pas` para a query exata de `dsrConsultaProdutosPedidos` (critério de seleção do "próximo" pedido) antes de implementar.

### C.4 — Última Venda / Data de Cadastro / Alterado em / Validade do preço

**Evidência**: campos de `dsrDetalhesPreco` (`ultimavenda`, `alteracaopreconormal`, `validade`) e `dsrDetalhesCompra_Filiais` (`datacadastro`).

**Correção**: adicionar esses 4 campos ao retorno de `LegacyConsultaComprasDetalheCompraRepository`/`ConsultaComprasSugestaoService::buildDetalhamento`, exibir no painel de contexto ao lado dos campos de preço já existentes (`AbaDetalhamentoCompra.tsx`). "Preço normal"/"Preço promoção" (`valornormal`/`valorpromocao`) já foram reportados como stub sem dado real no item D.3 do `05-speckit-prompt-correcao-sql.md` — implemente o join/fórmula real lá; aqui só adicione os 4 campos de data/contexto que faltam ao redor deles.

### C.5 — CST/CSOSN, Descrição do Preço

**Evidência**: `dtxcst`/`dtxcsosn` (campos `incidencia`/`csosn` de `dsrComprasTotal` — mesmo gap do item A.2); `dtxDescricaoPreco` — rótulo textual do tipo de preço aplicado (ex.: "Normal" no screenshot).

**Correção**: reaproveitar `incidencia`/`csosn` do item A.2 (mesmo campo, exibido tanto na grid principal quanto no painel de contexto — confirme se o Delphi realmente duplica ou se é só um, releia o `.dfm`). "Descrição do Preço": Laravel já cobre a *precedência* de valor via `valor_unitario_fonte` (`AbaDetalhamentoCompra.tsx:34,55`), mas não o conceito Delphi de rótulo de tabela de preço aplicada — investigue a origem exata de `dtxDescricaoPreco` em `dmconsultacompras.pas` antes de decidir se são a mesma coisa ou se falta um campo novo.

### C.6 — Visualizador de foto do produto

**Evidência**: botão câmera/lupa (`sbnVisualizarFoto`, `.pas:1615-1619`) — abre `AcionarTelaVisualizarImageURL`, visualizador de imagem do produto selecionado.

**Correção**: adicionar um botão equivalente no painel de contexto ou na toolbar (ver também item E, já que o botão aparece na barra superior do Delphi) que abra a foto do produto selecionado — reaproveite qualquer componente de visualização de imagem de produto já existente no restante do ERP (ex.: cadastro de produtos), se houver.

## D — Aba "Produtos Similares": gaps adicionais

**Evidência Delphi**: `dbgProdutosSimilares` (`.dfm:3806-4298`) tem as mesmas ~27 colunas do grid principal (seção A), mais **INATIVO** (`inativo`), sem a coluna PRODUTO (`caracteristicavisual`). O sub-grid de rollup `dbgProdutosSimilaresTotal` (`.dfm:4324-4511`, fonte `dsrTotalProdutosSimilares`) soma, como uma linha "Total" separada: `total_estoque`, `total_transito`, `reservado`, `reservaprevia`, `futuro`, `total_pedidos_filiais`, `total_pedidos_fornecedores` — cada categoria de estoque somada individualmente.

**Evidência Laravel**: `AbaProdutosSimilares.tsx` reusa o catálogo de 10 colunas da grid principal (herdando os mesmos gaps das seções A.1/A.2), sem a coluna INATIVO. `SugestaoRollup.php` soma um conjunto menor de campos (`total_vendido, total_estoque, total_pedido, futuro, sugestao, sugestaominimo, sugestaomaximo, minimo, maximo, total_internet, total_loja`) — não separa trânsito/reserva/reserva prévia/pedidos por origem no rollup.

**Correção**:
- Adicionar `inativo` ao SELECT/retorno usado por `AbaProdutosSimilares.tsx`, exibir como coluna.
- Expandir `SugestaoRollup::QTY_FIELDS` (`SugestaoRollup.php:18-30`) para somar também `total_transito`, `reservado`, `reservaprevia`, `total_pedidos_filiais`, `total_pedidos_fornecedores` individualmente (depende dos campos individuais já terem sido adicionados a `buildLinha` no item A.2) — a linha "Total" da aba Similares deve refletir a mesma quebra por categoria que o Delphi mostra.

## E — Barra de comandos: ações ausentes

**Evidência Delphi** (`fmconsultacompras.pas`):

| Botão | Atalho | Handler | O que faz |
|---|---|---|---|
| Relatório F7 | F7 | `sbnRelatorioClick` (`.pas:835-838`) | `dtmConsultaCompras.ImprimirRelatorio` — imprime relatório da consulta |
| Pendente | — | `sbnNFePendenteClick` (`.pas:2418-2427`) | abre `TfrmConsultaProdutosNotasSefaz` — produtos pendentes de emissão de NF |
| Cadastro de Produtos | — | `sbnProdutosClick` (`.pas:1779-1794`) | abre `TfrmCadastroCaracteristicas` — cadastro da característica/produto (**distinto** de "Ficha de Produtos", que é `TfrmConsultaFichaProduto`, somente leitura) |
| Requisitar item atual | Ctrl+F11 | `sbnRequisitarItemAtual` | requisita só o produto/linha atual entre filiais (distinto da requisição em lote já existente) |
| Atualizar Registro | — | `sbnAtualizarRegistros` | atualiza uma linha específica da grid com dados novos do banco, sem regerar a consulta inteira |

**Evidência Laravel**: `Index.tsx` tem "Gerar" (F6), "Cancelar", "Consulta de Estoques" (F8), "Gerar Pedido de Compra" (F10, fora da toolbar), "Requisição entre Filiais" (F11, em lote, fora da toolbar), "Ficha de Produtos", "Manutenção de Preços" — mas não tem Relatório F7, Pendente, Cadastro de Produtos (distinto de Ficha), nem as duas ações de grid (Requisitar item atual / Atualizar Registro).

**Correção**:
- Adicionar ação "Relatório" (F7) — defina com o usuário/produto se deve gerar PDF ou reaproveitar algum mecanismo de relatório já existente no ERP antes de implementar (este prompt não prescreve o formato de saída — é uma decisão em aberto, sinalize se precisar de mais contexto do usuário).
- Adicionar ação "Pendente" — consulta de produtos pendentes de emissão de NF; verifique se já existe uma tela equivalente em outro módulo do ERP a reaproveitar antes de criar uma nova.
- Adicionar ação "Cadastro de Produtos" distinta de "Ficha de Produtos" — deve abrir o cadastro editável da característica/produto (não a consulta somente-leitura que "Ficha de Produtos" já cobre).
- Adicionar ação "Requisitar item atual" (Ctrl+F11) por linha selecionada, além do fluxo em lote já existente (`RequisicaoEntreFiliaisModal`).
- Adicionar ação "Atualizar Registro" por linha selecionada — atualiza os dados daquela linha específica sem regerar a consulta inteira (reaproveite o mesmo backend de `buildLinha` para uma única linha, se possível).
- Visualizador de foto (C.6) pode ser implementado aqui, na toolbar, ao invés do painel de contexto — confirme com o Delphi qual posição faz mais sentido no layout Laravel atual.

## Critérios de aceite

- [ ] As 9 colunas do item A.1 aparecem na grid principal, populadas corretamente.
- [ ] Trânsito, Reserva, Res.Prévia, Ped.Filiais, Ped.Fornecedor aparecem como colunas individuais além das somas já existentes.
- [ ] Os 3 campos de "dias" derivados (com pedidos de compra, com similares, calculado pós-sugestão) aparecem como colunas, com valores batendo com a fórmula Delphi.
- [ ] Composto, Grupo, Promoção, Referência, CST/CSOSN, Classe, Fornecedor da última compra aparecem como colunas.
- [ ] Produto em promoção tem destaque visual equivalente à célula colorida do Delphi.
- [ ] Grid "Produtos dos Grupos das Filiais" aparece ao selecionar um produto na grid principal, com os valores agregados por grupo de filiais.
- [ ] Grid "Produtos das Filiais" aparece ao selecionar um produto, com os valores de todas as filiais individuais do produto.
- [ ] Grid VENDAS mensal (3 canais) aparece para o produto selecionado.
- [ ] Observações Lembrar Pedido aparece e reflete o campo `obslembrarpedido`.
- [ ] Próximo Pedido (NR/Qtdade/Previsão/Emissão) aparece quando existe pedido em aberto para o produto.
- [ ] Última Venda, Data de Cadastro, Alterado em, Validade do preço aparecem no painel de contexto.
- [ ] Visualizador de foto abre a imagem do produto selecionado.
- [ ] Aba Produtos Similares mostra a coluna INATIVO e a linha "Total" com trânsito/reserva/reserva prévia/pedidos separados.
- [ ] Botões Relatório F7, Pendente, Cadastro de Produtos aparecem na barra de comandos e disparam a ação correspondente.
- [ ] Ações "Requisitar item atual" e "Atualizar Registro" existem por linha da grid.

## Matriz mínima de testes

- Gerar uma consulta com produtos que têm estoque em trânsito/reservado/reserva prévia não-zero → colunas individuais batem com a soma que já aparecia em `total_estoque`.
- Produto com pedido pendente de fornecedor E de filial simultaneamente → colunas Ped.Filiais/Ped.Fornecedor mostram valores distintos, e a soma bate com `total_pedido` já existente.
- Selecionar um produto com estoque em 3+ filiais → grid "Produtos das Filiais" mostra uma linha por filial com valores corretos; grid "Produtos dos Grupos das Filiais" mostra os totais agregados por grupo.
- Selecionar um produto com vendas em pelo menos 2 meses diferentes do período → grid VENDAS mostra uma linha por mês, com Total Internet/Total Loja somando para o Total Geral do mês.
- Produto marcado "lembrar pedido" com observação preenchida no Delphi → mesma observação aparece no Laravel.
- Produto com pedido de compra em aberto → Próximo Pedido mostra NR/Qtdade/Previsão/Emissão corretos.
- Produto em promoção → aparece com destaque visual na grid principal.
- Produto inativo dentro de um grupo de similares → aparece marcado INATIVO na aba Produtos Similares.
- Clicar em Relatório F7 → gera/abre o relatório da consulta atual.
- Clicar em Pendente → mostra produtos pendentes de emissão de NF.
- Clicar em Cadastro de Produtos vs. Ficha de Produtos → abrem telas diferentes (edição vs. somente leitura).
- Selecionar uma linha e clicar "Requisitar item atual" → gera requisição só daquele produto, sem afetar as demais linhas marcadas.
- Selecionar uma linha e clicar "Atualizar Registro" → só aquela linha é atualizada, sem regerar a consulta inteira.
- Clicar no botão de foto de um produto que tem imagem cadastrada → abre o visualizador com a imagem correta.

## Fora de escopo

- "Totalização (Sugestão/Qtde vendida)" (`total_venda`/`total_custo`) — já especificado no item E.1 do `05-speckit-prompt-correcao-sql.md`; não duplicar aqui.
- Qualquer correção de fórmula/SQL já coberta pelo `05-speckit-prompt-correcao-sql.md` (velocidade de vendas, tabela redutora, percentual acima do mínimo, customedio, preços informativos) — este prompt é só sobre completude de grids/painéis/botões da tela de Resultados, não sobre a exatidão das fórmulas já cobertas lá.
- Qualquer correção da aba Parâmetros já coberta pelo `04-speckit-prompt-correcao-parametros.md`.
- Aba "Grades": o `.dfm` Delphi não tem grid próprio declarado para essa aba (populado em runtime, não auditado em detalhe) — trate como herdando os mesmos gaps das seções A/B/C aplicados à agregação por grade, sem tentar reproduzir alguma coluna extra específica não confirmada nesta auditoria.
