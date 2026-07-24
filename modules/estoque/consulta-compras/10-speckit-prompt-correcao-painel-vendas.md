/speckit.specify

# Correção — Consulta de Compras: painel de detalhe de vendas do produto (rádio "Valores por")

## Escopo

O painel de detalhe do produto ativo (visível ao navegar pelo grid de resultados) tem uma grade de vendas mês a mês com um seletor de granularidade — "Valores por: Total Geral / Total por Grupo / Total por Filial" — que nunca foi especificado nos prompts anteriores (`01-03`) e não existe hoje no Laravel. As fórmulas de velocidade de vendas em si **já estão completas** em `02-speckit-prompt.md` (Motor de Sugestão) — este prompt só cobre a **visualização** em detalhe, reaproveitando o que já foi calculado.

## A. O seletor "Valores por"

Evidência Delphi (`rgpTotalizacao`, `fmconsultacompras.dfm:6042-6062`; `rgpTotalizacaoClick`, `fmconsultacompras.pas:988-992`; `SetVisualizacao`, `dmconsultacompras.pas:2338-2361`):

- 3 opções: **Total Geral** (padrão, `ItemIndex = 0`), Total por Grupo, Total por Filial.
- Controla qual das 3 variantes de velocidade de vendas já documentadas no ticket 04 do mapa de investigação (`qryVVendas`/`qryVVendas_porGrupo`/`qryVVendas_porFilial`, com as variantes `_Similares` equivalentes na aba Produtos Similares) alimenta o painel de detalhe do produto ativo.
- **Não recalcula nada** — as 3 fórmulas já existem (aplicadas ao Motor de Sugestão, prompt `02`); este seletor só troca a **dimensão de agregação exibida**: Total Geral = uma linha por mês somando todas as filiais selecionadas; Total por Grupo = uma linha por mês×grupo de filiais; Total por Filial = uma linha por mês×filial.
- O mesmo valor também controla a tela "Visualizar Venda Diária" (`sbnVisualizarVendaDiariaClick`) — trocar o rádio afeta as duas visualizações do produto ativo, não só o painel principal.

**Não confundir** com o rádio "Totalização" (Sugestão/Qtde vendida) já implementado em `MotorOpcoesPanel.tsx`/`ConsultaComprasTotalizacaoSelecao` — são dois seletores Delphi diferentes (`rgpTotalizacaoSelecao` vs. `rgpTotalizacao`), o segundo é o que falta.

## B. O painel de detalhe (grade mês a mês)

Evidência Delphi (`dbgVendas`, `fmconsultacompras.dfm:4700-4844`): uma linha por mês (`mes`), colunas: `totalvendas`/`QtContrato` (valor e quantidade vendida via contratos), `totalinternet`/`qtinternet`, `totalloja`/`qtloja` — mesma classificação Internet/Loja via `pedidos_site` já confirmada no ticket 04 do mapa (Internet/Loja é só informativo; a sugestão usa o total combinado).

Hoje no Laravel: não existe nenhum componente equivalente — nem a grade mensal, nem o seletor de granularidade. Não é uma implementação incompleta; é uma lacuna do próprio prompt `02` original, que especificou a fórmula para o cálculo da sugestão mas não este painel de visualização em detalhe.

Correção proposta:
- Adicionar um painel de detalhe (modal, aba ou seção lateral, conforme o padrão de layout já usado nas outras telas deste módulo) mostrando a série mensal de vendas do produto ativo: total vendido, quantidade via contrato, total/quantidade Internet, total/quantidade Loja.
- Adicionar o seletor de granularidade (Total Geral como padrão, Total por Grupo, Total por Filial), reaproveitando as 3 variantes de query já existentes no backend do Motor de Sugestão — sem duplicar a fórmula, só parametrizar a consulta pela dimensão de agrupamento escolhida.
- Replicar o mesmo comportamento na aba Produtos Similares (variantes `_Similares`).

## Critérios de aceite

- [ ] Painel de detalhe de vendas do produto ativo existe, com uma linha por mês e as colunas Total Vendido/Qtde Contrato/Total Internet/Qtde Internet/Total Loja/Qtde Loja.
- [ ] Seletor "Valores por" com as 3 opções, "Total Geral" selecionado por padrão.
- [ ] Trocar para "Total por Grupo" reagrupa as linhas por mês×grupo de filiais, sem recalcular a fórmula.
- [ ] Trocar para "Total por Filial" reagrupa as linhas por mês×filial.
- [ ] Mesmo comportamento disponível na aba Produtos Similares.
- [ ] Nenhuma nova fórmula de velocidade de vendas é introduzida — reaproveita exatamente o que já está especificado no prompt `02`.

## Matriz mínima de testes

| # | Cenário | Resultado esperado |
|---|---|---|
| 1 | Abrir o painel de detalhe de um produto pela primeira vez | "Total Geral" selecionado, uma linha por mês agregando todas as filiais |
| 2 | Trocar para "Total por Grupo" | Linhas se multiplicam por grupo de filiais, mesmos totais gerais ao somar |
| 3 | Trocar para "Total por Filial" | Linhas se multiplicam por filial, mesmos totais gerais ao somar |
| 4 | Produto com vendas via Internet e Loja no mesmo mês | Ambas as colunas aparecem preenchidas, total bate com a soma |
| 5 | Repetir 1-3 na aba Produtos Similares | Mesmo comportamento com as variantes `_Similares` |

## Fora de escopo

- Qualquer alteração à fórmula de velocidade de vendas — já especificada e fechada em `02-speckit-prompt.md`.
- O rádio "Totalização" (Sugestão/Qtde vendida) — já implementado corretamente, não faz parte desta correção.
- A tela "Visualizar Venda Diária" (`AbrirVendasDiarias`) em si — citada aqui só para registrar que compartilha o mesmo valor de granularidade; especificação própria fica para um prompt futuro se o usuário confirmar que essa tela também está ausente.
