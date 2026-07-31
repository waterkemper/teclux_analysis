# Definir o comportamento funcional do Cadastro no Laravel

Type: grilling
Status: resolved
Blocked by: 01, 03

## Question

Quais jornadas, campos, estados, pesquisas, ações e feedbacks do Cadastro Delphi devem ser preservados no Laravel, quais devem seguir padrões já adotados pela plataforma e quais peculiaridades legadas não devem ser reproduzidas?

## Answer

### Identidade e jornada

Preservar o nome e a localização do legado: **Interlojas → Requisição para Exposição**. Implementar uma página única de cadastro unitário, sem transformá-la em consulta histórica geral, com os modos **Novo**, **Editando aberta** e **Somente leitura**.

Ações: Nova, Gravar, Cancelar requisição, Procurar e Descartar/Voltar. Manter F3, F5, F6, F9 e Esc como atalhos, sem tornar a operação dependente do teclado. Avisar antes de perder alterações locais.

Usar os padrões Laravel existentes: `ErpCadastroShell`, feedback operacional por `ErpRegistryOperationFeedback`, erros junto aos campos, confirmações em modal e infraestrutura de `CatalogCodeLookup`/`ErpTwoColumnCatalogLookupModal`. Os endpoints serão próprios deste Cadastro, pois os catálogos genéricos não impõem todos os contratos Delphi.

### Campos e estados

- Cabeçalho somente leitura: número, data/hora, situação e requisição de origem.
- Editáveis enquanto aberta: requisitante, requisitada, produto, quantidade pedida e observação.
- Contexto informativo: descrição, unidade e estoques da requisitante e requisitada.
- Resultado posterior somente leitura: quantidade recebida, série e número da nota fiscal.

Quantidade pedida será inteiro maior que zero. Zero não cancela implicitamente: cancelamento usa a ação própria. Observação mantém o limite de 150 caracteres, com contador e sem truncamento; observação mais motivo também deve caber nesse limite.

Requisições em situação `A` são editáveis e canceláveis. Fechada, confirmada, cancelada ou qualquer outra situação é somente leitura.

### Dependências dos campos

- requisitante lista somente filiais autorizadas ao usuário;
- requisitada exclui a requisitante;
- produto só é habilitado após a requisitada;
- alterar requisitante limpa requisitada, produto e quantidade;
- alterar requisitada limpa produto e quantidade;
- alterar produto limpa quantidade.

Requisitante, requisitada e produto continuam alteráveis enquanto a requisição estiver aberta. A semântica transacional dessas trocas fica para **Decidir a semântica de estoque, concorrência e cancelamento**.

### Lookups e SQL legado

O produto deve possuir registro em `estoques` na filial física da requisitada, resolvendo filial tipo `V` por `filial_estoque`; saldo zero continua elegível. A resolução direta aceita código visual ou código de barras. Produtos compostos são filtrados conforme parâmetro.

A pesquisa de produtos mostra descrição, grades, referência, código, filial, estoque e unidade. A pesquisa de abertas mostra produto, grades, número, filiais, data e referência. Preservar ordenação sem acentos por descrição e, quando aplicável, grades.

`UsarGradesProdutos` controla a visibilidade de Linha e Coluna. Com o parâmetro desligado, ocultar essas colunas e manter ordenação estável por descrição e código.

F9 lista apenas requisições abertas da requisitante selecionada. A resolução direta por `(requisitante, código)` carrega qualquer situação; as não abertas ficam somente leitura.

### Duplicidade, gravação e cancelamento

Quando duplicatas são proibidas e já existe uma aberta para produto, requisitante e requisitada, exibir mensagem equivalente a `ctPRODUTOJAREQUISITADO + ctALTERARQUANTIDADE`, oferecendo abrir a existente ou permanecer no rascunho. Nunca somar automaticamente. A gravação permanece bloqueada enquanto a duplicidade existir.

O número é gerado exclusivamente no servidor, dentro da transação, por `pedidosfiliais_proximocodigo()`. A ficha nova exibe “Novo” e, após sucesso, redireciona para a ficha persistida.

Cancelar exige confirmação e motivo opcional ou obrigatório conforme parâmetro, sem inventar senha de supervisor. Após sucesso, manter a ficha visível, cancelada e somente leitura.

### Parâmetros

Resolver no servidor por `parametros_valor(descricao, filial_ativa_da_sessão)`, inclusive quando a requisitante escolhida for outra. Nunca aceitar parâmetros do frontend. Usar literalmente as chaves de `clparametrossistema.pas`:

- `Transferir Produtos Compostos`;
- `Permitir requisições de produtos duplicadas`;
- `REQUISICAOSUBTRAIESTOQUE`;
- `Informar o motivo do cancelamento do pedido`;
- `USAR GRADES PRODUTOS`.

Corrigir o manifesto Laravel atual, que usa incorretamente nomes de propriedades Delphi nas três primeiras chaves. `''`, `NULL`, ausência e valor booleano inválido significam `false` e precisam de testes explícitos.
