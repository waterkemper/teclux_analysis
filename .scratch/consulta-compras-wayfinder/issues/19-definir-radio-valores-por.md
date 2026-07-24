# Definir o rádio "Valores por" (Total Geral / Total por Grupo / Total por Filial)

Type: grilling
Status: resolved
Blocked by:

## Question

No painel de detalhe do produto ativo existe um rádio "Valores por" com 3 opções (Total Geral, Total por Grupo, Total por Filial). Qual o comportamento exato, qual a opção padrão selecionada, e como isso se compara ao que existe hoje no Laravel?

## Answer

### O que o rádio controla (CONFIRMADO, `fmconsultacompras.dfm:6042-6062`, `fmconsultacompras.pas:988-992`, `dmconsultacompras.pas:2338-2361`)

`rgpTotalizacao` (Caption "Valores por", `Items = ['Total Geral', 'Total por Grupo', 'Total por Filial']`, **`ItemIndex = 0` → padrão é "Total Geral"**). Ao clicar (`rgpTotalizacaoClick`), seta `dtmConsultaCompras.Visualizacao := rgpTotalizacao.ItemIndex` (0/1/2). `SetVisualizacao` troca qual query alimenta a grade de detalhe do produto (`dbgVendas`, ligada a `dsrVVendas`):

| Índice | Opção | Query (aba Produtos Total) | Query (aba Produtos Similares) |
|---|---|---|---|
| 0 | Total Geral | `qryVVendas` | `qryVVendas_Similares` |
| 1 | Total por Grupo | `qryVVendas_porGrupo` | `qryVVendas_porGrupo_Similares` |
| 2 | Total por Filial | `qryVVendas_porFilial` | `qryVVendas_porFilial_Similares` |

**Não é um radio novo com fórmula própria** — as 3 queries (e suas variantes `_Similares`) são exatamente as mesmas já documentadas por completo no ticket 04 deste mapa ("Definir o cálculo de velocidade de vendas": "Variantes por Filial/Grupo/Anterior/Similares seguem a mesma fórmula com dimensão/janela/lista de produtos alteradas"). Este rádio é só o **seletor de granularidade** que decide qual dimensão de agregação (nenhuma, por grupo de filiais, ou por filial) é exibida no painel de detalhe — não recalcula nada novo.

### Estrutura da grade de detalhe (CONFIRMADO, `dbgVendas`, `fmconsultacompras.dfm:4700-...`)

Uma linha **por mês** (`mes`), com colunas: `totalvendas`/`QtContrato` (total vendido e quantidade via contratos), `totalinternet`/`qtinternet`, `totalloja`/`qtloja` — a mesma classificação Internet/Loja via `pedidos_site` já confirmada no ticket 04. Trocar o rádio não muda as colunas, muda **quantas linhas** aparecem e o que cada linha representa: com "Total Geral" cada mês é uma linha agregando todas as filiais selecionadas; com "Total por Grupo"/"Total por Filial", cada combinação mês×grupo ou mês×filial vira uma linha própria.

### Reaproveitamento em "Visualizar Venda Diária" (CONFIRMADO, `dmconsultacompras.pas:3818-3850`)

O mesmo valor `Visualizacao` também controla o filtro de filial/grupo usado pela tela de Venda Diária (`sbnVisualizarVendaDiariaClick`→`AbrirVendasDiarias`, `qryVVendasDiaria_Detalhada`) — o rádio "Valores por" afeta duas visualizações diferentes do mesmo produto, não só a grade `dbgVendas`.

### Comparação com o Laravel (CONFIRMADO — gap completo)

Não existe, no checkout Laravel atual, nenhum componente equivalente a `dbgVendas`/o painel de detalhe de vendas por produto, nem ao rádio "Valores por" — busca em `Index.tsx` e nos componentes da pasta não encontrou nada (o único rádio "Totalização" existente no Laravel, `MotorOpcoesPanel.tsx`/`ConsultaComprasTotalizacaoSelecao`, é um componente **diferente**: corresponde a `rgpTotalizacaoSelecao`, "Sugestão"/"Qtde vendida", já implementado corretamente — não confundir os dois). O prompt `02-speckit-prompt.md` (Motor de Sugestão) especificou a fórmula de velocidade de vendas para uso no **cálculo** da sugestão, mas nunca especificou este **painel de visualização** do detalhe mês a mês por produto — é uma lacuna do prompt original, não uma implementação incompleta de algo já especificado.

### Decisão

Vira um novo prompt de correção/adição (`10`, mesma série): especificar o painel de detalhe de vendas do produto ativo (grade mês a mês com Total/Contrato/Internet/Loja) com o seletor de granularidade Total Geral (padrão) / Total por Grupo / Total por Filial, reaproveitando as fórmulas já documentadas no ticket 04 — sem recalcular nada novo, só reagrupar.
