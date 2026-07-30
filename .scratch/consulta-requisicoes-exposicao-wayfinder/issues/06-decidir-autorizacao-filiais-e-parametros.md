# Decidir autorização, filiais e parâmetros da Consulta

Type: grilling
Status: resolved
Blocked by: 02, 03, 04

## Question

Qual módulo/permissão deve proteger a Consulta, quais requisições e filiais cada usuário pode visualizar ou alterar, como a Filial Base do Delphi se traduz para filial ativa/filiais autorizadas no Laravel e quais parâmetros literais governam colunas e ações?

## Answer

### Módulo e menu

A Consulta usará uma capability própria na infraestrutura legada `acessosmodulos`, separada de `interlojas.requisicao-exposicao.cadastro` e da Consulta de Compras. A folha será apresentada exatamente como:

**Interlojas → Consulta de Requisições**

A rota/capability deverá ser criada sob o grupo Interlojas, replicando o padrão Laravel já usado para folhas de menu e vínculos em `usuariosacessosmodulos`. Administradores mantêm bypass; concessão de Cadastro ou Consulta de Compras não deve conceder automaticamente a Consulta.

### Filiais e autorização

A Filial Base do Delphi corresponde à filial ativa resolvida na sessão Laravel. A Consulta não oferece seleção livre da Filial Requisitante: toda leitura, alteração e cancelamento ficam limitados às Requisições entre Filiais cuja requisitante esteja autorizada em `usuariosfiliais`; administradores abrangem todas as filiais válidas.

A Filial Requisitada deve existir e ser diferente da requisitante. Ela não precisa estar vinculada ao usuário, pois representa o destino que deve fornecer o produto. A resolução de filial física, inclusive filial do tipo `V`, continua no resolver do núcleo e não deve ser duplicada na UI.

A autorização é aplicada em três níveis: middleware/capability para entrada no módulo, validação de requisitante em cada leitura e validação de identidade/revisão/requisitante em cada mutação. Não confiar em código de filial enviado pelo cliente para ampliar escopo.

### Parâmetros

A Consulta reutilizará o manifesto e o serviço de parâmetros já presentes no Laravel, sempre resolvendo por `parametros_valor(descricao, filial ativa)` e pelas descrições literais do ERP:

- `USAR GRADES PRODUTOS`: exibe Linha/Coluna nas grades Pedidos e Confirmados;
- `REQUISICAOSUBTRAIESTOQUE`: exibe Reserva Prévia e habilita validações, locks e movimentos de estoque do núcleo;
- `Informar o motivo do cancelamento do pedido`: controla a exigência de motivo no cancelamento;
- `Máscara Quantidade`: controla formato e dimensionamento de quantidades;
- `Permitir requisições de produtos duplicadas`: controla advisory lock/duplicidade no núcleo;
- `Transferir Produtos Compostos`: permanece regra do núcleo para elegibilidade, sem criar ação nova na Consulta.

Valores `''`, `NULL`, ausência e booleanos inválidos são falsos, conforme o padrão existente em todo o Laravel. A UI recebe somente um snapshot dos parâmetros necessários; a camada de comando resolve novamente os parâmetros dentro da operação para impedir adulteração e respeitar a filial ativa.

### Resultado

A Consulta terá autorização de módulo independente, escopo de leitura por Filial Requisitante Autorizada e parâmetros centralizados no padrão Laravel. Nenhuma regra de acesso, filial física ou parâmetro será implementada por SQL/UI específico da Consulta.
