# Definir o cálculo de estoque disponível e "estoque para N dias"

Type: grilling
Status: resolved
Blocked by: 01

## Question

Como replicar o cálculo de estoque disponível (evidenciado por `qryEstoques`, `qryEstoqueBloqueio`, `qryMovimentos`) e o parâmetro "Estoque para: N dias" (que define quantos dias de estoque futuro a sugestão deve cobrir), incluindo a segmentação por status de estoque (Em Estoque, Reservado, Em Trânsito, Demonstração, Conserto, Danificada, Reserva Prévia) vista nos checkboxes da aba Parâmetros?

## Answer

### Mecanismo confirmado: expressão SQL aditiva construída pelos checkboxes

CONFIRMADO (`fmconsultacompras.pas:674-710`): a tabela `estoques` tem colunas separadas por status (`emestoque`, `reservado`, `transito`, `demonstracao`, `conserto`, `danificada`, `reservaprevia` — evidenciadas também em `movimentos`, que carrega o mesmo conjunto como saldo corrente por status a cada movimentação). Os 7 checkboxes da aba Parâmetros constroem `Param_Estoque` como uma expressão aditiva, começando em `'0'` e somando `' + e.<coluna>'` para cada checkbox marcado — ex.: com "Em Estoque" e "Reservado" marcados, `Param_Estoque = '0 + e.emEstoque + e.Reservado'`. Essa expressão vira `ParametroEstoque`, usado como macro na query principal da sugestão (`qryComprasTotal`, ticket 07). Em paralelo, `CabecalhoSaldoEstoque` monta um rótulo textual (“em Estoque + Reservado + …”) para exibir no cabeçalho do relatório, listando os componentes escolhidos.

`qryEstoques`/`qryEstoqueBloqueio` (que só expõem `emestoque`) **não** são o caminho de leitura para o cálculo da sugestão — `qryEstoqueBloqueio` é usada para bloqueio pessimista (`for update`) e `qryMovimentos` é usada para **escrita** (criação de registros de movimento ao gerar uma Requisição entre Filiais, ticket 11), não para leitura do saldo disponível.

### "Estoque para: N dias" e "Proporcional para: N dias"

CONFIRMADO: `edtDiasEstoque` → `ParametroDiasEstoque` (dias de cobertura futura que a sugestão deve garantir) e `edtDiasProporcional` → `ParametroDiasEstoqueProporcional` (usado pela Tabela Redutora, ticket 06) são parâmetros distintos, ambos strings de texto passadas como parâmetro para a query principal — a fórmula exata de como “dias de cobertura” se combina com a velocidade de vendas (ticket 04) é resolvida no ticket [Definir a fórmula final da sugestão de compras](07-definir-formula-sugestao-compras.md).

### Decisão: nenhum checkbox de status marcado por padrão

Nenhum dos 7 checkboxes tem `Checked = True` no `.dfm` — todos começam desmarcados; sem interação do usuário, `Param_Estoque` resolve para `'0'` (estoque disponível considerado zero). **DECISÃO DO USUÁRIO**: manter esse comportamento exatamente como está no Delphi — nenhum padrão marcado no Laravel, consistente com a mesma fidelidade já decidida para a seleção de Filial (ticket 03).
