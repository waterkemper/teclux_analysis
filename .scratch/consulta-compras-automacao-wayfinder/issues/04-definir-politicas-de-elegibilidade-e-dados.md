# Definir políticas de elegibilidade e dados mestres para automação

Type: grilling
Status: resolved
Blocked by: 01

## Question

Quais campos e regras devem impedir, limitar ou priorizar uma reposição automática: produtos identificados pelo prefixo literal da descrição (M), (D), (U), (F), (O) ou (C), produtos concentrados, máximas e mínimas (incluindo o sentinel legado 9999), produtos restritos a gerentes, embalagem fechada/múltiplos de unidade e demais classificações citadas no manual?

## Comments

## Answer

- Produtos concentrados sao uma politica por Produto x Filial; portanto, varias Filiais podem ser marcadas para o mesmo Produto.
- A alternativa recomendada para a primeira versao e o campo nullable estoques.concentrado_reposicao_ecc, sem movimentacao de saldo ao altera-lo.
- O valor null significa ainda nao configurado; true marca a Filial como concentrada e false registra que ela foi explicitamente desmarcada.
- A politica sera encapsulada para ser consumida pela tela, pelos jobs e pela confirmacao. A implementacao podera priorizar ou limitar as Filiais marcadas conforme a regra final de alocacao.

### Investigacao sobre produtos concentrados

- A tabela estoques possui granularidade Produto x Filial, chave primaria (produto, filial), e ja armazena minimo e maximo por filial.
- A Consulta de Compras ja parte de estoques para calcular candidatos e fontes.

### Clarificações e decisões da sessão

- M/D/U/F/O/C não são, nesta regra, códigos de um campo estruturado: são prefixos no início da descrição do Produto. Exemplo: (C)CONDICIONADOR CHEIRINHO PROLONGADO 200ML JOHNSON.
- O grupo continua possuindo o booleano somente_gerentes_solicitacao_ecc para indicar que seus Produtos exigem Gerente na solicitação.
- A elegibilidade do Usuário é verificada em usuarios.gerentevendas; portanto, a regra combina a configuração do grupo com o perfil do Usuário.
- Produtos com prefixo (M) ou (D) não entram na solicitação automática.
- Produtos com prefixo (U) ou (C) devem permanecer no Depósito e não entram na reposição automática das lojas.
- Produtos com prefixo (F) ou (O) devem ser atendidos usando estoque de lojas, não estoque do Depósito.
- Tanto maximo = 0 quanto maximo = 9999 significam que a Filial não deve receber novas solicitações automáticas daquele Produto. Isso não retira nem transfere automaticamente o estoque que a Filial já possui.
- A regra de embalagem fechada e múltiplos de unidade foi adiada e não será definida nesta etapa.
- O ticket permanece em discussão; ainda falta definir concentração e demais políticas.
