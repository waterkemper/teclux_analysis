/speckit.specify

# Correção — Consulta de Compras: agrupamento do grid principal (produto agregado vs. por filial)

## Escopo

No Delphi, o grid principal "Produtos dos Grupos de Filiais" (`qryComprasTotal`) nunca mostra o mesmo produto repetido — mesmo quando nenhuma filial está filtrada (o que significa analisar o grupo inteiro para compra junto ao fornecedor). No Laravel atual, os produtos aparecem repetidos, uma linha por filial. **Não é um problema de exibição/deduplicação** — é a query não implementar o agrupamento correto, o que também afeta o **valor da sugestão calculada** em um dos dois modos.

## A. O que controla o agrupamento — não é a seleção de filial, é "Usar Tabela Redutora"

Evidência Delphi (`qryComprasTotalBeforeOpen`, `dmconsultacompras.pas:4769-4785`; SQL de `qryComprasTotal`, `dmconsultacompras.dfm:6-994`):

A query lê `FROM estoques e` (uma linha por filial) e agrega com `SUM(e.emestoque)`, `SUM(e.transito)`, `SUM(e.reservado)`, `SUM(e.minimo)`, `SUM(maximo)`, `SUM(e.futuro)` etc., fechando com `GROUP BY p.produto, %Agrupamento p.datacadastro, p.linha, p.coluna, ...` — a macro `%Agrupamento` decide se `e.filial` entra no `GROUP BY`:

- **`UsarTabelaRedutora = true`** (checkbox "Usar Tabela Redutora" marcado) → `Agrupamento = ''` → `GROUP BY` só por atributos do produto → **uma linha por produto**, somando estoque/vendido/pedidos/etc. de **todas as filiais no escopo do filtro** (não importa se é 1, várias, ou nenhuma marcada = grupo inteiro). A fórmula da sugestão (`02-speckit-prompt.md`) roda sobre esses totais já agregados — o resultado é **uma sugestão só por produto**, calculada com o grupo inteiro em mente.
- **`UsarTabelaRedutora = false`** → `Agrupamento = 'e.filial,'` → `GROUP BY` inclui `e.filial` → **uma linha por produto×filial**, cada uma com sua sugestão calculada isoladamente com os números daquela filial.

Ou seja: **os dois comportamentos são legítimos no Delphi**, cada um ligado ao estado do checkbox "Usar Tabela Redutora" — não é "sempre uma linha por produto" nem "sempre uma linha por filial"; depende desse parâmetro, já existente no motor de sugestão (`usar_redutora`).

**Correção ao ticket de investigação `03` do mapa** (não afeta este prompt diretamente, mas evita reabrir a discussão): "nenhuma filial marcada" não é uma ambiguidade — o Delphi trata isso deliberadamente como "sem restrição de filial" (mesmo efeito de "todas marcadas"), já replicado corretamente no filtro (`01-speckit-prompt.md`). O problema do agrupamento é ortogonal a isso.

## B. Hoje no Laravel — gap real, não cosmético

`LegacyConsultaComprasSugestaoRepository::loadCandidatos()` (`LegacyConsultaComprasSugestaoRepository.php:37-230`) lê `FROM estoques e WHERE e.filial IN (:filiaisEfetivas) ORDER BY p.codigo, e.filial` **sem nenhum `GROUP BY`** — cada linha do resultado já vem uma-por-(produto,filial) direto de `estoques`. `ConsultaComprasSugestaoService::gerar()` (`ConsultaComprasSugestaoService.php:140-156`) itera `foreach ($candidatos as $cand)`, produzindo uma linha de saída por candidato — sempre uma linha por produto×filial, **independente do valor de `usar_redutora`**.

Existe um `$agregadoPorProduto` (`:119-134`, soma `estoque`/`vendido` por produto) — mas ele só alimenta o cálculo de `diasestoque_geral`/lookup da Tabela Redutora dentro de `buildLinha`, **não colapsa as linhas de saída**.

**Consequência dupla**:
1. **Linhas duplicadas** por produto sempre que há mais de uma filial no escopo — inclusive o caso citado pelo usuário (nenhuma filial marcada = grupo inteiro, o caso mais comum de ter várias filiais em jogo).
2. **A sugestão calculada está errada** quando `usar_redutora` está ativo: o Delphi computaria uma única sugestão por produto usando estoque/vendido/pedidos somados de todo o grupo; o Laravel atual computa uma sugestão por filial, isolada, sem nunca produzir o número agregado que o Delphi mostraria.

Correção proposta:
- Em `loadCandidatos` (ou numa camada logo acima, no serviço), quando `usar_redutora` estiver ativo: agregar (SUM) os campos por produto — `total_estoque`, `total_transito`, `reservado`, `reservaprevia`, `futuro`, `minimo`, `maximo`, `total_vendido`, `total_pedido`/variantes — através de todas as filiais do escopo, produzindo **uma linha por produto**; quando `usar_redutora` estiver desativado, manter uma linha por produto×filial (comportamento atual).
- A sugestão (`ConsultaComprasSugestaoService::buildLinha`) deve calcular sobre os valores já agregados quando `usar_redutora` estiver ativo — não recalcular por filial e depois tentar reconciliar.
- Reaproveitar `$agregadoPorProduto` como base do modo agregado, em vez de só alimentar o lookup da Tabela Redutora — evitar duplicar a soma.
- Replicar o mesmo ajuste nas abas Produtos Similares e Produtos Grades (`qryProdutosSimilares`/`qryTotalProdutosSimilares`, `qryProdutosGrades`/`qryTotalProdutosGrades` seguem exatamente o mesmo padrão de macro `Agrupamento` no Delphi, `dmconsultacompras.pas:4787-4825`).

## C. Correção adicional — edição de mínimo/máximo (já registrada em `07-speckit-prompt-correcao-grid-principal.md`)

`minimo`/`maximo` só são editáveis quando exatamente uma filial está marcada no filtro (`SomenteUmaFilialMarcada`, ortogonal ao agrupamento por Tabela Redutora — ver a correção já aplicada em `07-speckit-prompt-correcao-grid-principal.md`, seção A). Reforçar aqui: mesmo no modo agregado (uma linha por produto, várias filiais somadas), esses campos devem ficar somente leitura, porque não existe "a" filial certa para gravar o novo valor.

## Critérios de aceite

- [ ] Com "Usar Tabela Redutora" ativo e nenhuma filial marcada (grupo inteiro), o grid principal mostra uma linha por produto, com estoque/vendido/pedidos somados de todas as filiais em escopo.
- [ ] Com "Usar Tabela Redutora" ativo e múltiplas filiais marcadas (não todas), mesmo comportamento agregado sobre exatamente essas filiais.
- [ ] Com "Usar Tabela Redutora" desativado, o grid mostra uma linha por produto×filial, cada uma com sua própria sugestão.
- [ ] A sugestão calculada no modo agregado usa os totais somados, não a sugestão de uma filial isolada.
- [ ] `minimo`/`maximo` permanecem somente leitura sempre que o filtro não tiver exatamente uma filial selecionada, em ambos os modos de agrupamento.
- [ ] Mesmo comportamento replicado em Produtos Similares e Produtos Grades.

## Matriz mínima de testes

| # | Cenário | Resultado esperado |
|---|---|---|
| 1 | Tabela Redutora ativa, nenhuma filial marcada, produto com estoque em 3 filiais | Uma linha para o produto, com estoque = soma das 3 filiais |
| 2 | Tabela Redutora ativa, 2 de 5 filiais marcadas | Uma linha para o produto, agregando só as 2 filiais marcadas |
| 3 | Tabela Redutora desativada, mesmas 2 filiais marcadas | Duas linhas para o produto, uma por filial, sem soma |
| 4 | Tabela Redutora ativa, produto com sugestão diferente por filial se calculada isoladamente | Sugestão única exibida bate com o cálculo sobre o total agregado, não com nenhuma das sugestões por filial isoladas |
| 5 | Exatamente uma filial marcada (qualquer modo de Tabela Redutora) | `minimo`/`maximo` editáveis |
| 6 | Nenhuma ou múltiplas filiais marcadas (qualquer modo) | `minimo`/`maximo` somente leitura |

## Fora de escopo

- Qualquer correção à fórmula de sugestão em si (Tabela Redutora, velocidade de vendas, estoque disponível) — já fechadas em `02-speckit-prompt.md` e nos tickets 04-07 do mapa de investigação.
- A ambiguidade de "nenhuma filial marcada" — já corretamente especificada em `01-speckit-prompt.md`, não é o problema deste prompt.
