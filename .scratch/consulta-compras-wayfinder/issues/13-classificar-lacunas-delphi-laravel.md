# Classificar as lacunas Delphi–Laravel da Consulta de Compras

Type: task
Status: resolved
Blocked by: 03, 04, 05, 06, 07, 08, 09, 10, 11, 12

## Question

Consolidando as decisões de 03 a 12, quais lacunas exatas existem hoje entre o Delphi e o estado atual do Laravel (nada implementado) para a Consulta/motor de Sugestão de Compras e a Requisição entre Filiais, classificadas como CONFIRMADO, INFERIDO, DÚVIDA, NÃO LOCALIZADO, DIVERGENTE, POSSÍVEL BUG LEGADO ou DECISÃO NOVA, com evidência concreta de arquivo/trecho para cada uma?

## Answer

### CONFIRMADO — mecanismos centrais com evidência de arquivo/trecho

- Superfície completa de abas/botões/queries (ticket 01), com três atalhos de navegação para módulos já migrados (Consulta de Estoques, Ficha de Produtos, Manutenção de Preços).
- Fórmula de velocidade de vendas: três fontes (saídas de movimento+fiscal, produtos de contratos faturados menos devoluções, entradas de devolução ao fornecedor) — ticket 04.
- Estoque disponível: expressão SQL aditiva sobre 7 categorias de status, escolhidas por checkbox — ticket 05.
- Curva ABC: filtro sobre classificação pré-existente, não calculada aqui; Tabela Redutora: lookup global de retornos decrescentes — ticket 06.
- Fórmula final da sugestão: `ROUND(velocidade_diária × sugestaopara) − estoque − pedidos + futuro`, com `sugestaopara` vindo do lookup na Tabela Redutora — ticket 07.
- Produtos Similares/Grades: cálculo independente por variante/substituto + rollup agregado — tickets 08, 09.
- Detalhamento de Compra: `qryDetalhesCompra` (custo, fonte da precedência de `DefinirValorProduto`) e `qryDetalhesPrecos` (venda, informativo) — ticket 10.
- Requisição entre Filiais: 4 fases completas (gerar dados → revisão → revalidação de estoque → persistência transacional) — ticket 11.
- Integração com Pedido de Compra: contrato de itens/quantidade/valor/filial/fornecedor — ticket 12.

### NÃO LOCALIZADO — lacunas reais no Laravel

- Toda a Consulta/motor de Sugestão de Compras — nada existe ainda (schema, repositórios, cálculo).
- Cadastro de Pedidos de Compra completo (`dmcadastropedidos`/`fmcadastropedidos`/`fmcadastropedidosgrade`, ~20 mil linhas) — fora de escopo, mapa/esforço futuro.
- As ~13 telas/fluxos que escrevem dados consumidos por esta Consulta (Frente de Caixa/vendas que geram `movimentos`/`produtoscontratos`, cadastro de Fornecedores/Produtos com `resultadocurvaabc`/`minimo`/`maximo` etc.) — presumivelmente já existem em outros módulos de Estoque/Vendas já migrados ou a confirmar caso a caso durante a implementação.

### DIVERGENTE — o próprio Delphi se contradiz, mantido por decisão do usuário

- Seleção de Filial: "nenhuma marcada" tratado igual a "algumas desmarcadas" (`TodasFiliais` nunca vira `True` nesse caso) — ticket 03.
- Checkboxes de status de estoque: nenhum marcado por padrão, resultando em estoque considerado = 0 sem interação do usuário — ticket 05.
- "% acima do mínimo" usa uma expressão de estoque **fixa** (soma todas as 7 categorias sempre), diferente da expressão **configurável** pelos checkboxes usada no cálculo da sugestão em si — ticket 07.
- Filtro de inclusão de linhas no Pedido de Compra sempre verifica o campo `sugestao`, mesmo quando o usuário escolhe enviar `sugestaominimo`/`sugestaomaximo` como quantidade — ticket 12.

### POSSÍVEL BUG LEGADO

- Cancelamento do modal de escolha de quantidade (`TFrmselecionarquantidades`) ao gerar Pedido de Compra não é tratado explicitamente — o código não reinicializa a variável `Campo`, podendo prosseguir com estado indefinido/anterior — ticket 12.

### DÚVIDA

- Variantes `_porFilial`/`_porGrupo`/`_Anterior`/`_Similares` de `qryVVendas` não foram lidas linha a linha (a query-base já tem ~500 linhas de SQL) — inferidas com alta confiança pela comparação de campos, mas a spec deve confirmar a fórmula exata de cada uma durante a implementação — ticket 04.
- Se as chaves dos 3 novos Parâmetros do Sistema achados no ticket 11 (`Transferir_Produtos_Compostos`, `Permitir_Requisicoes_de_Produtos_Duplicadas`, `RequisicaoSubtraiEstoque`) já existem cadastradas no Configuration Center ou só a infraestrutura genérica existe.

### DECISÃO NOVA

- Filtro de produtos segue o padrão arquitetural da Consulta de Estoques (filtros nativos por cadastro), não a Busca Assistida — decisão do usuário no início do mapa.
- Cadastro de Pedidos de Compra fica fora de escopo deste mapa — vira um esforço/mapa futuro próprio, com esta Consulta definindo só o contrato de integração (ticket 12).
