# Definir o cálculo de velocidade de vendas

Type: grilling
Status: resolved
Blocked by: 01

## Question

Como replicar o cálculo de velocidade de vendas evidenciado pelas variantes de `qryVVendas` (`qryVVendas`, `qryVVendas_porFilial`, `qryVVendas_porGrupo`, e os pares `_Anterior` para comparação com o período anterior, mais `_Similares` para produtos substitutos), incluindo a segmentação Internet vs. Loja vista no grid (`dbgVendas` com colunas Total Geral/Total Internet/Total Loja), e o período de vendas mensal (`qryVVendasmes`)?

## Answer

### Fórmula de três fontes (CONFIRMADO, `qryVVendas`, `dmconsultacompras.dfm:1498-2024`)

`qryVVendas` calcula, por produto e por mês (`YYYY/mm`), a quantidade vendida combinando três fontes via `UNION ALL`:

1. **Saídas de movimento** (`movimentos` onde `substr(operacao,13,1)='+'`) juntado com dados fiscais (`dadosfiscais`/`produtosdadosfiscais`) no período `:datainicial`..`:datafinal` — vendas registradas via movimentação de estoque com documento fiscal vinculado.
2. **Produtos de Contratos faturados** (`produtoscontratos` join `contratos` onde `situacao in ('F','P')` e `contratos_atual(ct.numero)`, agrupado por contrato+produto+data de faturamento, com `HAVING quantidade - cancelado > devolvido`) — a fonte principal de vendas via Contrato, já descontando cancelamentos e devoluções (via subquery ligada a `dadosfiscais`/`produtosdadosfiscais`, excluindo notas vinculadas e Simples Faturamento via `ehNotaFiscalSaidaSimplesFaturamento`).
3. **Entradas de movimento** (`movimentos` onde `substr(operacao,13,1)='-'`) juntado com `notaspag`/`produtosnotaspag` — devoluções ao fornecedor, subtraídas do total (`-abs(quantidade)`).

Cada linha é classificada Internet vs. Loja pela presença de `pedidos_site.contrato` (join `left join pedidos_site p_s on ... m.contrato = p_s.contrato` ou `ct.numero = p_s.contrato`) — se existe, entra em `totalinternet`; senão, em `totalloja`. O filtro de Conceito (`:conceitos`/`%FILTRO_CONCEITO`) se aplica às três fontes.

A agregação externa soma por produto+mês: `totalvendas` (soma das três fontes), `qtcontrato`/`qtinternet`/`qtloja` (contagem de grupos com quantidade > 0 nesse mês), e o CalcField `MediaVendasContratos = totalvendas / qtcontrato` (média por transação dentro do mês, **não** é a velocidade diária/mensal consumida pela sugestão — essa é calculada a partir de `totalvendas` bruto no ticket da fórmula final).

### Internet vs. Loja é só informativo — CONFIRMADO por decisão

Busca exaustiva por `totalinternet`/`totalloja` em `dmconsultacompras.pas` só encontrou declarações de campo e atribuições de `DisplayFormat` — nenhuma referência em `qryComprasTotalCalcFields` nem em nenhuma outra lógica de cálculo. **DECISÃO CONFIRMADA**: a separação Internet/Loja é exibida na grade de vendas (`dbgVendas`) só para informação do usuário; a fórmula da sugestão de compras (ticket 07) usa exclusivamente `totalvendas` (o total combinado).

### Variantes por Filial/Grupo/Anterior/Similares (INFERIDO com alta confiança, campos confirmados)

`qryVVendas_porFilial` tem o mesmo shape de campos com uma dimensão adicional `filial` no agrupamento (confirmado por comparação de campos: `produto, filial, mes, totalvendas, QtContrato, totalinternet, qtinternet, totalloja, qtloja`) — mesma fórmula de três fontes, só adicionando `m.filial`/`ct.filialvenda` (ou equivalente) ao GROUP BY. `qryVVendas_porGrupo` segue o mesmo padrão agrupando por grupo de filiais. Os pares `_Anterior` aplicam a mesma fórmula com a janela de datas deslocada para o período anterior equivalente (mesma duração, imediatamente anterior a `:datainicial`) — usada para comparação de tendência. Os pares `_Similares` aplicam a mesma fórmula trocando a lista de produtos pela lista de produtos substitutos. Estas variantes não foram lidas linha a linha (a query-base já tem ~500 linhas de SQL); a spec deve confirmar a fórmula exata de cada uma inspecionando o Laravel após a implementação inicial da variante-base, citando qualquer divergência encontrada.

### Período de vendas mensal

`qryVVendasmes` (não lido em detalhe) é usado só para exibição/agrupamento por mês no grid — não é uma fonte de cálculo adicional, é uma projeção de `qryVVendas` já agregado.
