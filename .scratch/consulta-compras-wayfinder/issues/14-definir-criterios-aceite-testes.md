# Definir critérios de aceite e testes

Type: grilling
Status: resolved
Blocked by: 13

## Question

Quais são os critérios de aceite mensuráveis e a matriz mínima de testes para a Fundação/Parâmetros, o Motor de Sugestão de Compras (velocidade de vendas, estoque, ABC, tabela redutora, fórmula final, similares, grades, detalhamento) e a Requisição entre Filiais + integração com Pedido de Compra, cobrindo os casos dourados de cada cálculo e os contratos de integração?

## Answer

### Critérios de aceite — Fundação/Parâmetros

- [ ] Filtro de produtos segue o padrão da Consulta de Estoques (filtros nativos por cadastro), sem nenhuma dependência da Busca Assistida.
- [ ] Seleção de Filial/Grupo Filial replica o comportamento Delphi, incluindo o caso "nenhuma marcada" tratado como filtro vazio (não como "todas").
- [ ] Período de vendas recalcula bidirecionalmente entre datas e número de dias.
- [ ] Os 7 checkboxes de status de estoque constroem a expressão aditiva correta; nenhum vem marcado por padrão.

### Critérios de aceite — Motor de Sugestão de Compras

- [ ] Velocidade de vendas soma corretamente as três fontes (movimentos+fiscal, contratos faturados menos devoluções, devoluções ao fornecedor), com Internet/Loja como informativo apenas.
- [ ] Curva ABC filtra por `resultadocurvaabc` sem recalculá-la.
- [ ] Tabela Redutora aplica o lookup correto (maior `estoquepara` ≤ cobertura atual), com fallback para `diasproporcional`.
- [ ] Fórmula final da sugestão bate com a fórmula confirmada, usando `MoneyDecimal`/precisão adequada (ou o padrão numérico já usado por outros módulos de Estoque).
- [ ] Produtos Similares e Grades calculam cada variante/substituto independentemente, com rollup agregado correto na linha TOTAL.
- [ ] Detalhamento de Compra calcula `customedio`, `precocomicms`/`valorultimacompra` e `markup` corretamente; `qryDetalhesPrecos` não influencia a precedência de valor.
- [ ] "% acima do mínimo" usa a expressão fixa de estoque (todas as 7 categorias), diferente da expressão configurável do cálculo da sugestão.
- [ ] Filtros de inclusão (sugestão zero, produtos marcados para pedido) funcionam conforme evidenciado.

### Critérios de aceite — Requisição entre Filiais + Integração com Pedido

- [ ] Requisição sempre parte da filial do usuário logado como requisitante; nunca requisita da própria filial.
- [ ] Produtos compostos são excluídos da requisição, a menos que o parâmetro correspondente permita.
- [ ] Revalidação de estoque detecta e avisa sobre diferenças de saldo antes de confirmar.
- [ ] Requisições duplicadas somam quantidade (ou criam novo registro), conforme o parâmetro de duplicidade.
- [ ] Quando `RequisicaoSubtraiEstoque` está ativo, um movimento de débito é criado na filial requisitada, sob bloqueio pessimista.
- [ ] Contrato de integração com Pedido de Compra envia produto/quantidade (campo escolhido)/valor (precedência confirmada)/filial de fatura/fornecedor (opcional) corretamente; linhas com `sugestao = 0` ficam de fora mesmo que outro campo de quantidade tenha sido escolhido (replicando a divergência confirmada).
- [ ] Cancelamento do modal de escolha de quantidade cancela a geração do pedido (correção do bug legado, não replicado).

### Matriz mínima de testes

- **Velocidade de vendas — três fontes**: uma venda via `movimentos`+fiscal, uma via Contrato faturado, uma devolução ao fornecedor no mesmo produto/período → total combinado correto, Internet/Loja exibidos mas não usados no cálculo.
- **Produto novo**: produto cadastrado dentro da janela de datas → `periodo` usa dias desde o cadastro, não a janela inteira.
- **Estoque disponível**: variar os 7 checkboxes e confirmar a soma correspondente; nenhum marcado → estoque considerado zero.
- **Tabela Redutora**: produto com cobertura atual acima e abaixo de um `estoquepara` cadastrado → `sugestaopara` correto em cada caso; tabela vazia ou `UsarTabelaRedutora` desligado → cai para `diasproporcional`.
- **Fórmula final**: caso dourado combinando velocidade, estoque, pedidos pendentes e `futuro` → valor de `sugestao` bate com a fórmula.
- **% acima do mínimo vs. checkboxes de estoque**: configurar os dois de forma diferente e confirmar que o filtro de inclusão usa a expressão fixa, não a configurável.
- **Similares/Grades**: grupo com 3 substitutos/variantes, cada um com estoque/venda diferentes → cada um calcula sua sugestão independente; TOTAL bate com a soma.
- **Requisição — filial de terceiro**: usuário de uma filial requisita produto disponível em duas outras filiais → grade de candidatas mostra as duas; confirmar gera registro(s) corretos em `pedidosfiliais` e, se aplicável, em `movimentos`.
- **Requisição — produto composto**: incluído na seleção sem o parâmetro permitir → excluído com aviso.
- **Gerar Pedido — três escolhas de quantidade**: gerar com sugestão/mínimo/máximo e confirmar que a quantidade enviada bate, e que o filtro de linhas incluídas continua baseado em `sugestao`.
- **Gerar Pedido — cancelamento do modal**: cancelar a escolha de quantidade não gera pedido nenhum (sem estado indefinido).
