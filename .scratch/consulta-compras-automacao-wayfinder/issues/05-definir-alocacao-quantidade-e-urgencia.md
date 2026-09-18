# Definir alocação entre filiais, quantidade e urgência

Type: grilling
Status: resolved
Blocked by: 01

## Question

## Comments

## Answer

- A quantidade final parte da sugestao calculada pelo motor e e distribuida sem ultrapassar o excedente transferivel de cada fonte.
- O excedente de uma fonte deve reservar sua propria necessidade, calculada com os filtros da rotina, vendas, pedidos concorrentes, cobertura, minimo, maximo e tabela redutora.
- A ordem geral prioriza deposito e filiais nao concentradoras elegiveis; uma filial concentradora fica por ultimo e somente pode enviar para outra filial concentradora.
- A concentracao e direcional: filiais concentradoras sao destinos autorizados; filiais nao concentradoras nao podem requisitar de uma fonte concentradora.
- Se usar uma fonte concentradora comprometer sua sugestao, minimo ou saldo protegido, a linha fica para revisao humana e a fonte nao e zerada automaticamente.
- Urgencias so serao preenchidas automaticamente quando houver evidencia objetiva nos dados. ZERADO pode ser calculado pelo saldo; CONTRATO, ACL e CVV ficam para confirmacao ou ajuste manual quando nao houver regra/cadastro deterministico.
- Embalagem fechada e multiplos continuam fora desta etapa.

- A alocacao Laravel ja percorre as candidatas ordenadas, usa a necessidade sugerida e limita cada retirada ao estoque_snapshot, sem duplicar a necessidade entre filiais.
- A ordenacao atual e produto, grupo, nao requisitante, dias de estoque decrescente, estoque decrescente, pedido mais antigo, ultima venda mais antiga e codigo da filial.
- O manual exige prioridade explicita para deposito e depois lojas que nao venderam; essa prioridade ainda nao existe no contrato Laravel.
- A tabela redutora e as formulas de cobertura/minimo/maximo ja existem no motor de Consulta de Compras; embalagem e multiplos continuam adiados.
- A urgencia legada chega como observacao livre em pedidosfiliais, sem classificacao estruturada para contrato, ACL, CVV ou zerado.
- A marca concentrado_reposicao_ecc identifica a Filial destino que deve manter o estoque do Produto; nao identifica fonte de abastecimento.
- Quando houver uma ou mais Filiais marcadas para o Produto, as demais Filiais nao podem gerar requisicao automatica para recebe-lo.
- As Filiais marcadas continuam podendo ser abastecidas por fontes elegiveis; a prioridade das fontes sera definida separadamente.
- A concentracao nao bloqueia uma Filial marcada de ser fonte: uma Filial concentradora pode abastecer outra Filial concentradora quando necessario.
- A alocacao deve priorizar fontes nao concentradoras e, quando precisar usar outra Filial concentradora, calcular o saldo remanescente antes de transferir.
- Se a transferencia de uma fonte concentradora puder zerar ou comprometer seu estoque protegido, a linha deve ser sinalizada para revisao humana, nao descartada silenciosamente.
- Para uma fonte concentradora, a alocacao automatica deve preservar o valor de estoques.minimo e nunca permitir saldo final igual a zero quando o minimo for zero ou nao estiver configurado.
- A disponibilidade real de uma fonte nao e apenas estoque atual menos minimo: deve reservar a necessidade da propria Filial conforme os filtros da rotina, vendas, pedidos concorrentes, cobertura, minimo, maximo e tabela redutora.
- O calculo da fonte deve reutilizar a mesma sugestao do motor para verificar se ela tem excedente transferivel sem comprometer seu proprio abastecimento; maximo e sentinel de maximo continuam sendo respeitados na decisao.
- A regra de concentracao e direcional: uma Filial concentradora pode enviar uma transferencia somente para outra Filial concentradora. Uma Filial nao concentradora pode abastecer uma Filial concentradora quando houver excedente elegivel.

Como calcular a quantidade final e distribuí-la entre depósito e lojas, respeitando tabela redutora, cobertura de 15/60 dias, mínimo/máximo, estoque disponível, pedidos concorrentes e múltiplos de embalagem? Como classificar e preencher automaticamente as observações de urgência (contrato, ACL, CVV e zerado)?
