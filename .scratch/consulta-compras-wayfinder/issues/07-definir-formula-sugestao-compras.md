# Definir a fórmula final da sugestão de compras

Type: grilling
Status: resolved
Blocked by: 04, 05, 06

## Question

Como combinar velocidade de vendas (ticket 04), estoque disponível/estoque para N dias (ticket 05) e curva ABC/tabela redutora (ticket 06) na fórmula final de sugestão evidenciada por `qryComprasTotal` (campos `sugestao`, `sugestaominimo`, `sugestaomaximo`, `qryComprasTotalCalcFields`), incluindo os agrupamentos por filial (`qryComprasFiliaisGrupo`) e por grupo de filiais (`qryComprasGruposFiliais`), o "% acima do mínimo", a opção "incluir pedidos entre filiais"/"não considerar pedidos de compra", e "incluir resultados com sugestão zero"/"produtos marcados para pedido"?

## Answer

### A fórmula central (CONFIRMADO, extraída da SQL de `qryComprasTotal`, `dmconsultacompras.dfm:150-370`)

Camada por camada, de dentro para fora:

1. **`sugestaominimo = MAX(0, minimo − saldo)`**; **`sugestaomaximo = MAX(0, maximo − saldo)`** — ponto de reposição clássico contra os campos de Cadastro de Produto (`minimo`/`maximo`/`saldo`).
2. **`periodo`** = número de dias da janela consultada (`:datainicial`..`:datafinal`), **exceto** quando o produto foi cadastrado (`datacadastro`) dentro da janela — nesse caso `periodo` = dias desde o cadastro (ou `1`, se cadastrado no último dia) — evita diluir a velocidade de vendas de produtos novos com dias em que eles nem existiam.
3. **`sugestao1 = ROUND((total_vendido/periodo) × :diasestoque) − total_estoque − total_pedido + futuro`** — a fórmula clássica de reposição: (velocidade diária de vendas) × (dias de cobertura desejados) = nível-alvo de estoque; subtrai o que já está em estoque e já em pedido; soma `futuro` (estoque futuro/reservado já comprometido a entrar).
4. **`sugestao2`** = recalcula com `:diasproporcional` no lugar de `:diasestoque`, mas só quando `sugestao1 > 0` (produto realmente precisa de compra); senão fica 0.
5. **`diasestoque_geral`** = cobertura atual em dias (`estoque_atual / velocidade_diária`) — usando os números **agregados entre todas as filiais/grupo** (`estoque_filiais`/`vendido_filiais`/`total_pedido_filiais`) quando `:UsarTabelaRedutora` está ativo, senão usando os números da filial isolada (`emestoque`/`total_vendido`).
6. **`sugestaopara`** = *lookup* na Tabela Redutora (ticket 06): busca a linha de `reducaoconsultacompras` com o maior `estoquepara` que ainda seja **≤** `diasestoque_geral` (ordenado desc, limit 1) e usa seu `sugestaopara`; se não houver linha aplicável ou `UsarTabelaRedutora` estiver desligado, cai para o valor fixo `:diasproporcional`. **Este é o mecanismo real da Tabela Redutora**: quanto mais estoque atual em dias de cobertura o produto já tem, menor o número de dias-alvo usado no cálculo final — uma curva de retornos decrescentes, não um desconto percentual simples.
7. **`sugestao` (final) = ROUND((total_vendido/periodo) × sugestaopara) − total_estoque − total_pedido + futuro`** — mesma fórmula de `sugestao1`, mas usando `sugestaopara` (a saída da Tabela Redutora) como dias-alvo, não o `:diasestoque` bruto nem `sugestao1`/`sugestao2` diretamente.

`qryComprasFiliaisGrupo` e `qryComprasGruposFiliais` recebem os mesmos parâmetros (`periodo`, `diasproporcional`, `diasestoque`, `PedidosEntreFiliais`, `NaoConsiderarPedidosCompra`) e presumivelmente aplicam a mesma fórmula agrupando por filial/grupo de filiais em vez de por produto isolado — não lidas linha a linha (mesma ressalva do ticket 04 sobre variantes).

### Filtros de inclusão (WHERE), não fazem parte do valor da sugestão

- **"Incluir com sugestão zero" (`FParametroSugestaoNula`)**: quando marcado, remove o filtro inteiro — mostra todas as linhas, mesmo com sugestão ≤ 0.
- Quando desmarcado: filtro padrão `sugestao > 0 OR sugestaominimo > 0 OR sugestaomaximo > 0` — só produtos com necessidade real aparecem.
- **"Produtos marcados para pedido" (`ProdutosLembradosparaPedido`)**: quando marcado, o filtro vira `lembrarpedido OR (sugestao > 0 OR sugestaominimo > 0 OR sugestaomaximo > 0)` — produtos manualmente sinalizados (`p.lembrarpedido`, um campo do Cadastro de Produto) sempre aparecem, independente da sugestão calculada.
- **"% acima do mínimo"**: filtro **separado e com fórmula própria** (`dmconsultacompras.pas:1810-1814`) — só inclui a linha quando `(emestoque+reservado+transito+demonstracao+conserto+danificada+reservaprevia+pedidos_pendentes−futuro) ≤ (minimo + minimo×percentual/100)`. **DIVERGENTE confirmado e mantido por decisão do usuário**: esta soma usa sempre **todas** as 7 categorias de estoque, independentemente de quais checkboxes o usuário marcou para o cálculo da sugestão em si (ticket 05) — duas definições de "estoque" coexistem no Delphi, e o Laravel replica ambas exatamente como estão, sem unificá-las.
- **"Pedidos entre Filiais"/"Não Considerar Pedidos de Compra"**: passados como parâmetros de query, controlam se `total_pedido`/`total_pedido_filiais` (agregações JSON de pedidos pendentes) entram null (ignorados) ou com valor real na fórmula.
- **Ordenação**: por nome ou por código do produto — preferência de exibição, não altera o cálculo.

### Curva ABC (ticket 06)

Aplicada como filtro adicional (`resultadocurvaabc`) na mesma query, sem afetar a fórmula numérica — já coberto no ticket 06.
