# Definir a curva ABC e a Tabela Redutora

Type: grilling
Status: resolved
Blocked by: 01, 04

## Question

Como replicar a classificação por Curva ABC (A/C/B/Não Definido, vista nos radiobuttons da aba Parâmetros) e a Tabela Redutora (`qryReducaoTabelaCompras`, grid editável com colunas "Estoque para" e "Sugestão para", incluído/excluído via `sbnIncluirReducaoTabelaCompras`/`sbnExcluirReducaoTabelaCompras`) — qual é a fórmula de redução proporcional e como ela se combina com o cálculo de velocidade de vendas (ticket 04) e o "Proporcional para: N dias"?

## Answer

### Curva ABC é só filtro — CONFIRMADO

Busca em `dmconsultacompras.pas:1762-1802` confirma: os 4 checkboxes (`CurvaABC_A/B/C/NaoDefinido`) montam uma cláusula `OR` sobre `p.resultadocurvaabc` (`= 'A'`, `= 'B'`, `= 'C'`, ou `coalesce(resultadocurvaabc,'') = ''` para "Não Definido"), aplicada via macro `qryComprasTotal.MacroByName('resultadocurvaabc')`. Esta tela **não calcula** a curva ABC — ela é uma classificação pré-existente em `produtos.resultadocurvaabc`, calculada em algum processo externo não coberto por estes arquivos. O ticket 07 (fórmula final) só precisa aplicar este filtro, não reimplementar o cálculo da curva.

### Tabela Redutora — CONFIRMADO estrutura, tabela de referência global

`reducaoconsultacompras` (`estoquepara` → `sugestaopara`, ambos inteiros) é uma tabela de referência **sem escopo por Filial ou Usuário** — `select rcc.* from reducaoconsultacompras rcc order by rcc.estoquepara`, sem `WHERE`. É editada diretamente pela grade desta tela: `sbnIncluirReducaoTabelaCompras`/`sbnExcluirReducaoTabelaCompras` disparam `Append`/`Delete` em `qryReducaoTabelaCompras`, persistidos via `Perpetrar` nos handlers `AfterPost`/`AfterDelete` (CRUD simples, sem autorização especial nem escopo).

**DECISÃO DO USUÁRIO**: manter a edição inline dentro da própria Consulta de Compras (como no Delphi) — sem isolar como Cadastro/lookup separado no Configuration Center.

### Aplicação na fórmula (deferida ao ticket 07)

`FParametroDiasEstoqueProporcional` (o "Proporcional para: N dias" da aba Parâmetros) é passado como parâmetro para as queries de totalização (`qryComprasTotal` e variantes), mas a query principal que efetivamente faz o lookup contra `reducaoconsultacompras` é grande demais para ser lida linha a linha nesta ticket — a leitura completa e a fórmula exata de como `estoquepara`/`sugestaopara` reduzem/ajustam o dia-de-cobertura considerado (e como isso se combina com a velocidade de vendas do ticket 04) ficam para o ticket [Definir a fórmula final da sugestão de compras](07-definir-formula-sugestao-compras.md), que já lista a Tabela Redutora como um dos insumos a incorporar.
