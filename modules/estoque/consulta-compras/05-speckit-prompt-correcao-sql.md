# Prompt para /speckit.specify — Correção (SQL/fórmulas do motor de sugestão)

```text
/speckit.specify

Corrija o SQL e as fórmulas exatas do motor de sugestão da Consulta de Compras (Estoque → Compras → Consultas), já implementado em `modules/estoque/consulta-compras/01-speckit-prompt.md`/`02-speckit-prompt.md` → spec `266-consulta-compras-parametros` → backend em `app/Infrastructure/Persistence/Legacy/Estoque/` e `app/Domain/Estoque/ConsultaCompras/`. Isto **não é uma feature nova**: é uma correção pontual identificada por comparação linha-a-linha entre o SQL Delphi (`dmconsultacompras.pas` — `qryVVendas`, `qryComprasTotal`, `qryDetalhesCompra`, `qryDetalhesPrecos`) e o SQL/fórmulas exatos que o Laravel executa hoje.

Não invente comportamento novo além do que este prompt descreve. Inspecione o checkout Laravel atual antes de alterar qualquer arquivo — os caminhos e trechos citados abaixo já foram lidos no checkout no momento da análise, mas confirme novamente antes de editar, e cite evidência concreta (arquivo + trecho) de qualquer divergência frente ao que este prompt afirma. Para cada item, releia o trecho correspondente de `dmconsultacompras.pas` antes de implementar — este prompt resume a divergência, não substitui a leitura do SQL Delphi original.

## Escopo

Catorze correções independentes, agrupadas em 6 áreas:

**A. Velocidade de Vendas (3 fontes, `LegacyConsultaComprasVelocidadeRepository.php`)**
1. Filtro de Conceitos aceito na UI mas nunca aplicado ao SQL.
2. Fonte "contratos" filtra pela data errada.
3. Fonte "devolução ao fornecedor" não valida a devolução de fato — os `LEFT JOIN`s são inertes.

**B. Período/Dias**
4. Contagem de dias inclusiva (+1) onde o Delphi é exclusivo.

**C. Tabela Redutora (`ConsultaComprasSugestaoService.php`, `TabelaRedutoraLookup.php`)**
5. Falta agregação entre filiais para `diasestoque_geral` quando a Tabela Redutora está ativa.
6. Falta o guard de limite superior no lookup da Tabela Redutora.

**D. Filtros e Detalhamento**
7. "% acima do mínimo" ativo com limiar 0% em vez de desligado quando o parâmetro é 0.
8. Seleção de linha de `estoques` em `LegacyConsultaComprasDetalheCompraRepository::loadOne` sem critério de desempate.
9. `customedio` calculado só sobre a filial única, não a média ponderada entre todas as filiais do produto — e `valornormal`/`valorpromocao` não implementados (sempre null).

**E. Filtros/controles ausentes por inteiro (nem UI, nem parâmetro, nem SQL)**
10. Radio "Totalização" (Sugestão / Qtde vendida) — não existe, nem as colunas derivadas que ele controla.
11. Filtro "Produtos cad. entre:" (intervalo de cadastro de produto) — ausente.
12. Filtro "Entrada NF entre:" (intervalo de entrada de nota fiscal) — ausente.
13. Filtro "Última venda entre:" (intervalo de última venda) — ausente.

**F. Campo sem paralelo Delphi e sem efeito algum — remover**
14. Dropdown "Agrupamento" (Filial / Grupo de filiais), ao lado do "% acima do mínimo" — não existe no Delphi e não afeta o resultado hoje. Remover.

## A.1 — Filtro de Conceitos é aceito mas nunca aplicado

**Evidência Delphi**: `dmconsultacompras.pas` — `MontarFiltroConceitos` monta `Conceitos` a partir de `qryConceitos`/`clbConceitos` e injeta em **todas as 3 fontes** de velocidade via `qryComprasTotal.ParamByName('conceitos')`, `qryVVendas.MacroByName('FILTRO_CONCEITO')` (linhas ~3345-3361), com a macro `FiltroConceito = '( %sconceito IN (%s))'` aplicada como `fc.conceito`.

**Evidência Laravel**: o parâmetro `conceitos` é recebido, validado (`ValidarConsultaComprasParametrosRequest.php:82-83`, `GerarConsultaComprasRequest.php:90-91`) e normalizado (`ConsultaComprasParametrosService.php:54-59,106`) — mas não existe **nenhuma referência a `conceito`** em `LegacyConsultaComprasVelocidadeRepository.php`, `LegacyConsultaComprasSugestaoRepository.php` ou `ConsultaComprasSugestaoService.php`. A tela aceita a seleção de Conceitos e ela não tem nenhum efeito no resultado.

**Correção**: aplicar `parametros.conceitos` como filtro `IN (...)` nas 3 subqueries de `LegacyConsultaComprasVelocidadeRepository::agregarPorProdutoFilial` (`sqlFonteMovimentos`, `sqlFonteContratos`, `sqlFonteNotasPag`), via join com a tabela que carrega `conceito` em cada fonte (confirme no Delphi qual alias/tabela expõe `conceito` em cada uma das 3 queries — no Delphi é `fc.conceito`, então precisa identificar a tabela `fc` equivalente ligada a cada fonte). Lista vazia de conceitos = sem filtro (todos), mesma semântica do Delphi (`TodosConceitos` quando nenhum desmarcado).

## A.2 — Fonte "contratos": data errada

**Evidência Laravel** (`LegacyConsultaComprasVelocidadeRepository.php:154`):
```sql
AND CAST(c.data AS date) BETWEEN CAST(? AS date) AND CAST(? AS date)
```
Filtra pela data de registro/criação do contrato (`c.data`, tabela `contratos`).

**Evidência Delphi**: a fonte de contratos do `qryVVendas` filtra pela **data de faturamento** do contrato (não a data de criação/registro) — releia o trecho correspondente em `dmconsultacompras.pas` para confirmar a coluna exata (`ct.faturamento` ou equivalente) antes de corrigir, já que o nome de coluna exato precisa ser reconfirmado no schema atual.

**Correção**: trocar a condição de período da fonte 2 para a coluna de data de faturamento correta, não a data de criação do contrato.

## A.3 — Fonte "devolução ao fornecedor": LEFT JOINs inertes

**Evidência Laravel** (`LegacyConsultaComprasVelocidadeRepository.php:162-180`, método `sqlFonteNotasPag`):
```sql
FROM movimentos m
LEFT JOIN tiposmovimentos tm ON tm.codigo = m.tipomovimento
LEFT JOIN produtosnotaspag pnp ON pnp.codigonota = m.codigonota AND pnp.produto = m.produto
LEFT JOIN notaspag np ON np.codigo = COALESCE(pnp.codigonota, m.codigonota)
WHERE m.produto IN ({$prodIn})
  AND CAST(m.data AS date) BETWEEN CAST(? AS date) AND CAST(? AS date)
  AND SUBSTR(COALESCE(m.operacao, tm.operacao, ''), 13, 1) = '-'
```
Os `LEFT JOIN`s para `produtosnotaspag`/`notaspag` **não são usados em nenhuma coluna do `SELECT` nem do `WHERE`** — são joins mortos. Na prática, esta fonte conta **qualquer** movimento de saída com sinal `-`, sem checar se ele de fato corresponde a uma devolução ao fornecedor registrada em `notaspag`.

**Evidência Delphi**: a fonte 3 do `qryVVendas` exige a existência da nota de devolução ao fornecedor correspondente (join efetivamente obrigatório com `notaspag`/`produtosnotaspag`, não um join solto) — reconfirme o trecho exato em `dmconsultacompras.pas` antes de corrigir.

**Correção**: tornar o join com `notaspag`/`produtosnotaspag` efetivo — ou trocar para `INNER JOIN` (se o Delphi exige a nota existir), ou adicionar a condição que falta no `WHERE`/`ON`, reproduzindo a semântica real de "devolução ao fornecedor" do Delphi, não apenas "todo movimento de saída".

## B — Contagem de dias inclusiva vs. exclusiva

**Evidência Laravel**:
- `app/Support/Estoque/ConsultaComprasPeriodoDias.php:42` — `computeDiasFromDatas`: `(int) $inicial->diffInDays($final) + 1`.
- `app/Services/Estoque/ConsultaComprasSugestaoService.php:57` — mesmo padrão duplicado: `Carbon::parse($dataInicial)->diffInDays(Carbon::parse($dataFinal)) + 1`.

**Evidência Delphi**: `DaysBetween` puro (exclusivo, sem `+1`) — confirmado também pela aritmética das capturas de tela originais (Delphi 23/03→21/07/2026 = 120 dias; Laravel equivalente dava 180 dias para um período comparável).

**Correção**: remover o `+1` das duas implementações (unificar num único ponto, já que hoje está duplicado — considere fazer `ConsultaComprasSugestaoService::gerar` chamar `ConsultaComprasPeriodoDias::computeDiasFromDatas` em vez de reimplementar). Ajustar `computeInicialFromDias` (linha 26, `subDays($dias - 1)`) na mesma correção para manter os dois lados (dias→datas e datas→dias) consistentes com a semântica exclusiva do Delphi.

## C.1 — Falta agregação entre filiais na Tabela Redutora

**Evidência Laravel** (`ConsultaComprasSugestaoService::buildLinha`, linhas 166-172): `diasestoque` é sempre calculado a partir de `$cand['total_estoque']`/`$totalVendido` da **linha do candidato por filial** — não existe nenhum branch condicionado a `$usarRedutora` que agregue estoque/vendido entre todas as filiais do produto antes de calcular a cobertura usada para consultar a Tabela Redutora.

**Evidência Delphi**: quando a Tabela Redutora está ativa, o cálculo de dias de estoque usado para localizar a faixa (`estoquepara`) é feito sobre o **total agregado entre filiais** do produto (`diasestoque_geral`), não por filial isolada — releia o trecho relevante de `qryComprasTotal` em `dmconsultacompras.pas` para confirmar a agregação exata antes de implementar.

**Correção**: quando `usar_tabela_redutora` estiver ativo, calcular `diasestoque_geral` a partir da soma de estoque/vendido do produto em todas as filiais candidatas (não só a linha atual), e usar esse valor para consultar `TabelaRedutoraLookup::resolve` — mantendo o `diasestoque` por filial (exibido na grid) como está, se for esse o caso no Delphi (confirme se a grid exibe o valor por filial ou o geral).

## C.2 — Falta guard de limite superior no lookup da Tabela Redutora

**Evidência Laravel** (`app/Domain/Estoque/ConsultaCompras/TabelaRedutoraLookup.php`): `resolve()` escolhe o maior `estoquepara <= cobertura`; quando a cobertura excede todos os `estoquepara` cadastrados, não há fallback — o último degrau da tabela é extrapolado.

**Evidência Delphi**: subquery com guard `(select max(rcc2.estoquepara) from reducaoconsultacompras rcc2) >= diasestoque_geral` — quando a cobertura excede o maior `estoquepara` da tabela, o Delphi cai para `diasProporcional` em vez de extrapolar o último degrau.

**Correção**: em `TabelaRedutoraLookup::resolve`, se `cobertura > max(estoquepara da tabela)`, retornar `diasProporcional` em vez do `sugestaopara` do último degrau.

## D.1 — "% acima do mínimo" ativo com limiar 0% por padrão

**Evidência Laravel** (`ConsultaComprasSugestaoService::buildLinha`, linha 208): `is_numeric($percentual) ? $percentual : null` — como as duas capturas de tela mostram `0` como valor padrão do campo, e `0` é numérico, o filtro é passado como **ativo com limiar 0%** para `PercentualAcimaMinimoFilter::include`.

**Evidência Delphi**: a cláusula SQL do "% acima do mínimo" só é adicionada quando `StrToInt(ParametroPercentual) > 0` — com o valor padrão `0`, o filtro fica **completamente desligado**, não ativo-com-zero.

**Correção**: trocar a condição para `is_numeric($percentual) && (float) $percentual > 0 ? $percentual : null` (ou equivalente), reproduzindo o `if StrToInt(...) > 0` do Delphi.

## D.2 — `loadOne` sem critério de desempate

**Evidência Laravel** (`LegacyConsultaComprasDetalheCompraRepository.php`, método `loadOne`): `DB::table('estoques as e')->where('e.produto', $produto)->where('e.filial', $filial)->first()` — sem `ORDER BY`.

**Evidência Delphi**: `qryDetalhesCompra` seleciona a linha via subquery com critério de desempate explícito — maior `datacompra`, depois maior quantidade em estoque combinada — releia o trecho de `dmconsultacompras.pas` (já documentado no ticket 10 do mapa original desta feature) antes de implementar.

**Correção**: adicionar `ORDER BY` reproduzindo o mesmo critério de desempate do Delphi antes do `first()` (ou usar uma subquery equivalente), para garantir resultado determinístico caso exista mais de uma linha de `estoques` por produto+filial.

## D.3 — `customedio` e preços informativos

**Evidência Laravel** (`LegacyConsultaComprasDetalheCompraRepository.php`, `computeCustomedio`): calcula `financeiro / (estoquefisico OR emestoque)` usando **apenas a linha da filial única** lida em `loadOne` — uma categoria de estoque (`estoquefisico` ou `emestoque`), não a soma das 7 categorias.

**Evidência Delphi** (`qryDetalhesCompra`, já confirmado no ticket 10 do mapa original):
```sql
customedio = SUM(e1.financeiro) / SUM(e1.emestoque + e1.reservado + e1.reservaprevia + e1.transito + e1.demonstracao + e1.conserto + e1.danificada)
```
agregado em **todas as filiais** do produto (não só a filial consultada), filtrando linhas com estoque OU financeiro zerados.

**Correção**: reescrever `loadOne`/`computeCustomedio` (ou o método correspondente) para agregar `financeiro` e a soma das 7 categorias de estoque em **todas as filiais** do produto, replicando exatamente a fórmula Delphi, excluindo linhas zeradas.

**Preços informativos** (`valornormal`/`valorpromocao`): hoje `loadPrecosInformativos` tenta ler essas colunas diretamente de `estoques` (o próprio código comenta que o stub normalmente não as tem) — retorna null na prática. Delphi calcula via `qryDetalhesPrecos`: join com `colunasprecos`/`fatorprecofilial`, fórmula `CASE WHEN fpf.fator > 0 THEN ROUND(cpn.valor * fpf.fator, 2) ELSE cpn.valor END`. Implementar esse join/fórmula real em vez do stub atual.

## E.1 — Radio "Totalização" (Sugestão / Qtde vendida) ausente

**Evidência Delphi**: `rgpTotalizacaoSelecao` (`fmconsultacompras.dfm:2150-2161`) — `TRadioGroup` com 2 opções, `Items.Strings = ('Sugestão', 'Qtde vendida')`, grava em `ParametroTotalizacao` (`dmconsultacompras.pas:1007`, atribuído em `fmconsultacompras.pas:758`). Controla como as colunas derivadas `totalvenda`/`totalcusto` são calculadas (`dmconsultacompras.pas:2203-2218`):
```pascal
if FParametroTotalizacao = 0 then
begin
  qryComprasTotaltotalvenda.AsFloat := (qryComprasTotalsugestao.AsCurrency * qryComprasTotalprecovenda.asfloat);
  qryComprasTotaltotalcusto.AsFloat := (qryComprasTotalsugestao.AsCurrency * qryComprasTotalprecocomicms.asfloat);
end
else
begin
  qryComprasTotaltotalvenda.AsFloat := (qryComprasTotaltotal_vendido.AsCurrency * qryComprasTotalprecovenda.asfloat);
  qryComprasTotaltotalcusto.AsFloat := (qryComprasTotaltotal_vendido.AsCurrency * qryComprasTotalprecocomicms.asfloat);
end;
```
Com `Sugestão` (índice 0): `totalvenda = sugestao × precovenda`, `totalcusto = sugestao × precocomicms`. Com `Qtde vendida` (índice 1): usa `total_vendido` no lugar de `sugestao`.

**Evidência Laravel**: nenhum campo `totalizacao`/equivalente em `ConsultaComprasParametrosService::normalize`, nenhum toggle em `Index.tsx`, e nenhuma coluna `totalvenda`/`totalcusto` calculada em `ConsultaComprasSugestaoService::buildLinha` (o array de retorno da linha, linhas 225-250, não tem esses campos).

**Correção**: adicionar o parâmetro `totalizacao_selecao` (`'sugestao'` | `'qtde_vendida'`, default `'sugestao'`) ao payload de parâmetros e à UI (radio de 2 opções), e calcular `total_venda`/`total_custo` em `buildLinha` conforme a fórmula Delphi acima, usando `precovenda`/`precocomicms` já disponíveis (confirme a origem desses dois preços no detalhamento de compra — mesma precedência de `DefinirValorProdutoPrecedence` ou campo próprio, releia `dmconsultacompras.pas` para confirmar).

## E.2 — Filtro "Produtos cad. entre:" ausente

**Evidência Delphi**: `gbxDataCadastroProdutos` (`fmconsultacompras.dfm:2474-2517`), campos `edtDataInicialCadastroProduto`/`edtDataFinalCadastroProduto`. Filtra `p.datacadastro` (`dmconsultacompras.pas:1283-1285`, montagem condicional em `1488-1504`, concatenado ao filtro de produtos em `1733-1734`: `SQLProdutos := SQLProdutos + ' and ' + SQLdatacadastroproduto`). Suporta os 3 casos: só inicial, só final, ou intervalo completo.

**Evidência Laravel**: nenhum campo equivalente em `ConsultaComprasParametrosService::normalize` nem em `Index.tsx`.

**Correção**: adicionar `cadastro_produto.data_inicial`/`data_final` (opcionais, independentes) ao payload de parâmetros e à UI, e aplicar como filtro `p.datacadastro BETWEEN`/`>=`/`<=` (conforme quais dos dois campos estão preenchidos, replicando os 3 casos do Delphi) na query de candidatos (`LegacyConsultaComprasSugestaoRepository::loadCandidatos`).

## E.3 — Filtro "Entrada NF entre:" ausente

**Evidência Delphi**: `gbxDataNFEntrada` (`fmconsultacompras.dfm:2518-2561`), campos `edtDataInicialEntradaNF`/`edtDataFinalEntradaNF`. Filtra via subquery em `produtosnotaspag` (`dmconsultacompras.pas:1287-1304`: `p.codigo in (select distinct pnp.produto from produtosnotaspag pnp ...)`, montagem condicional em `1507-1526`, concatenado em `1736-1737`).

**Evidência Laravel**: ausente.

**Correção**: adicionar `entrada_nf.data_inicial`/`data_final` ao payload e à UI, e aplicar como filtro `EXISTS`/`whereIn` equivalente à subquery Delphi sobre `produtosnotaspag`, na query de candidatos. Releia `dmconsultacompras.pas:1287-1304` para reproduzir exatamente as colunas/condições da subquery (não só a data).

## E.4 — Filtro "Última venda entre:" ausente

**Evidência Delphi**: `gbxDataUltimaVenda` (`fmconsultacompras.dfm:2562-...`), campos `edtDataInicialUltimaVenda`/`edtDataFinalUltimaVenda`. Filtra via subquery de última venda por produto (`dmconsultacompras.pas:1305-1404`, montagem condicional em `1528-1584`, concatenado em `1739-1740`). **Não confundir** com `diasDesdeCadastro`/`datacadastro` usado em `ConsultaComprasSugestaoService::buildLinha:140-147` — aquele é o cálculo de período de vendas desde o cadastro do produto (já implementado, para outro propósito), não este filtro de data de última venda.

**Evidência Laravel**: ausente.

**Correção**: adicionar `ultima_venda.data_inicial`/`data_final` ao payload e à UI, e aplicar como filtro equivalente à subquery Delphi de última venda, na query de candidatos. Releia `dmconsultacompras.pas:1305-1404` (a subquery mais longa das 3 — 3 variantes: intervalo completo, só inicial, só final) antes de implementar.

## F.1 — Remover o dropdown "Agrupamento" (Filial / Grupo de filiais)

**Evidência**: sem equivalente no Delphi — não existe controle correspondente no painel de parâmetros do `fmconsultacompras`. O único controle Delphi remotamente parecido em nome é `rgpTotalizacao`/`Visualizacao` (`.dfm:6042-6063`, `dmconsultacompras.pas:2338-2354,3820-3850`), mas é uma coisa diferente: fica na tela de **detalhe de venda diária** de um produto (drill-down), controlando o filtro de filial daquela subconsulta pontual — não um agrupamento do resultado principal. Não tem relação funcional com o campo Laravel.

No Laravel, o campo `motor.agrupamento` (`'filial' | 'grupo_filiais'`) é:
- Obrigatório na validação: `GerarConsultaComprasRequest.php:104` (`Rule::in(['filial', 'grupo_filiais'])`), mensagens em `:133-134`.
- Repassado ao payload: `GerarConsultaComprasRequest.php:186`.
- Exibido no resumo de filtros ativos: `buildConsultaComprasHelpScreenFilters.ts:47-52`.
- UI: dropdown em `MotorOpcoesPanel.tsx:137-155` (`AGRUPAMENTO_OPTIONS`, linhas 11-17), estado em `Index.tsx:120-123`, default em `buildMotorPayload.ts:18`, tipo em `types/consultaCompras.ts:113`.
- **Não é lido em nenhum lugar** de `ConsultaComprasSugestaoService.php` nem dos repositórios — não influencia SQL, agrupamento de linhas, rollup ou totalização. É puramente decorativo.

**Correção**: remover o campo por inteiro:
- `MotorOpcoesPanel.tsx`: remover o `<select>` de Agrupamento (linhas 137-155) e `AGRUPAMENTO_OPTIONS` (linhas 11-17); o "% acima do mínimo" passa a ocupar a linha sozinho (ajustar o grid de 2 colunas para 1, ou mover outro campo para o par, conforme o layout ficar melhor).
- `types/consultaCompras.ts:113`: remover `agrupamento` de `ConsultaComprasMotorOpcoes`.
- `Index.tsx:120-123`: remover a normalização de `agrupamento` do estado de preferências.
- `buildMotorPayload.ts:18`: remover `agrupamento: 'filial'` do payload default.
- `GerarConsultaComprasRequest.php:104,133-134,186`: remover a regra de validação, mensagens e o repasse do campo.
- `buildConsultaComprasHelpScreenFilters.ts:47-52`: remover a linha "Agrupamento" do resumo de critérios ativos.
- Confirmar se `motor.agrupamento` aparece em algum snapshot de preferências salvas (`preferencesLocal.ts`/mecanismo de auto-save da correção 04) e remover de lá também, se existir.

## Critérios de aceite

- [ ] Selecionar um subconjunto de Conceitos muda o resultado da consulta (velocidade de vendas filtrada por conceito nas 3 fontes).
- [ ] Fonte "contratos" filtra pela data de faturamento correta, não pela data de criação do contrato.
- [ ] Fonte "devolução ao fornecedor" só conta movimentos com nota de devolução correspondente de fato (join efetivo, não vestigial).
- [ ] Contagem de dias do período é exclusiva (igual ao Delphi), consistente entre `ConsultaComprasPeriodoDias` e `ConsultaComprasSugestaoService`.
- [ ] Com Tabela Redutora ativa, a cobertura usada para localizar a faixa é agregada entre filiais do produto.
- [ ] Cobertura acima do maior `estoquepara` cadastrado cai para `diasProporcional`, não extrapola o último degrau.
- [ ] Parâmetro "% acima do mínimo" = 0 desliga o filtro completamente (nenhum produto excluído por essa regra).
- [ ] `loadOne`/detalhamento de compra usa critério de desempate determinístico ao escolher a linha de `estoques`.
- [ ] `customedio` reproduz a média ponderada entre todas as filiais do produto, somando as 7 categorias de estoque.
- [ ] `valornormal`/`valorpromocao` retornam valores reais (via join/fórmula), não null por ausência de coluna.
- [ ] Radio "Totalização" (Sugestão/Qtde vendida) existe na UI e altera o cálculo de `total_venda`/`total_custo` na grid de resultado.
- [ ] Filtro "Produtos cad. entre:" existe e restringe candidatos por `p.datacadastro`.
- [ ] Filtro "Entrada NF entre:" existe e restringe candidatos pela subquery de entrada de NF.
- [ ] Filtro "Última venda entre:" existe e restringe candidatos pela subquery de última venda.
- [ ] Dropdown "Agrupamento" não existe mais na UI; `motor.agrupamento` não é mais aceito/validado no request nem aparece no resumo de filtros ativos.

## Matriz mínima de testes

- Gerar sugestão com um Conceito específico marcado vs. todos marcados → resultados de velocidade de vendas diferem quando há vendas em conceitos distintos.
- Produto com contrato faturado fora do período mas criado dentro do período (ou vice-versa) → aparece/não aparece conforme a data de faturamento, não a de criação.
- Movimento de saída sinal `-` sem nota de devolução correspondente → não é contado como devolução ao fornecedor.
- Período de N dias corridos (ex.: 01/01 a 31/01) → `numero_dias` calculado bate com a contagem exclusiva do Delphi, não N+1.
- Produto com estoque disperso entre 2+ filiais, Tabela Redutora ativa → cobertura usada para a faixa reflete a soma entre filiais, não só a filial em exibição.
- Produto com cobertura maior que o maior `estoquepara` cadastrado → cai para `diasProporcional`.
- "% acima do mínimo" = 0 → nenhum produto é excluído por esse filtro; "% acima do mínimo" = 10 → filtro aplicado normalmente.
- Produto com múltiplas linhas de `estoques` para o mesmo produto+filial (se aplicável ao schema) → `loadOne` sempre retorna a mesma linha (a de maior `datacompra`), não uma arbitrária.
- Produto com estoque em 3 filiais (algumas com reservado/trânsito/demonstração não-zero) → `customedio` bate com a soma ponderada entre filiais, não só a filial única.
- Produto com fator de preço por filial configurado → `valornormal`/`valorpromocao` retornam o valor calculado via `colunasprecos`/`fatorprecofilial`, não null.
- Alternar Totalização entre Sugestão e Qtde vendida com os dois valores diferentes de zero → `total_venda`/`total_custo` mudam de valor conforme a fórmula correspondente.
- Produto cadastrado fora do intervalo informado em "Produtos cad. entre:" → excluído do resultado; dentro do intervalo → incluído.
- Produto com entrada de NF fora/dentro do intervalo informado em "Entrada NF entre:" → excluído/incluído conforme o caso.
- Produto com última venda fora/dentro do intervalo informado em "Última venda entre:" → excluído/incluído conforme o caso; produto sem nenhuma venda no histórico → comportamento igual ao Delphi (confirme se é excluído ou incluído quando o filtro está ativo).
- Enviar `motor.agrupamento` no request após a remoção → campo ignorado (não gera erro de validação, mas também não é mais exigido).

## Fora de escopo

- Qualquer mudança na UI/parâmetros já coberta por `04-speckit-prompt-correcao-parametros.md` — este prompt é só sobre o SQL/fórmulas de backend.
- Reavaliação de `SugestaoRollup`, `FilialFaturaResolver`, `RequisicaoCompostoExclusion`, `GerarPedidoCompraContractBuilder` — não foram encontradas divergências nesses arquivos durante esta auditoria; não alterá-los como parte desta correção.
```
