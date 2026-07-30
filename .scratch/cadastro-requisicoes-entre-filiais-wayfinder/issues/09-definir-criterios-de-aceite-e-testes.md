# Definir critérios de aceite e testes

Type: task
Status: resolved
Blocked by: 08

## Question

Quais critérios de aceite e cenários de teste funcionais, transacionais, concorrentes e de compatibilidade comprovam que o Cadastro Laravel reproduz as regras escolhidas e reaproveita com segurança a infraestrutura da Consulta de Compras?

## Answer

### Estratégia de evidência

O aceite exige quatro níveis complementares:

1. **unitários PHP/TypeScript**, para regras puras, manifesto de parâmetros, cálculos, ordenação e estado da tela;
2. **feature tests Laravel em SQLite**, para contratos HTTP, autorização, validação, persistência e rollback rápido;
3. **integração PostgreSQL real**, obrigatória para gatilhos, `pedidosfiliais_log_new`, `pg_advisory_xact_lock`, locks concorrentes e convivência com escritas que simulam o Delphi;
4. **testes de componente Vitest e smoke test integrado**, para jornada, atalhos, dependências dos campos, modais e menu.

Um teste PostgreSQL que apenas chama `markTestSkipped` fora desse ambiente documenta a seam, mas não satisfaz o aceite. A pipeline ou checklist de entrega deve executar explicitamente a suíte PostgreSQL. A decisão de revisão pelo log em **Decidir autorização, auditoria e convivência Delphi–Laravel** substitui o uso exclusivo de `datahoraalteracaousuario` descrito anteriormente.

### Critérios do núcleo compartilhado

#### Parâmetros

- O manifesto consulta somente as descrições literais:
  - `Transferir Produtos Compostos`;
  - `Permitir requisições de produtos duplicadas`;
  - `REQUISICAOSUBTRAIESTOQUE`;
  - `Informar o motivo do cancelamento do pedido`;
  - `USAR GRADES PRODUTOS`.
- Cada parâmetro é resolvido por `parametros_valor(descricao, filial_ativa_da_sessão)`, mesmo quando a Filial Requisitante selecionada é outra.
- Para cada booleano, testar `True`/valor válido verdadeiro e a matriz falsa: `''`, `NULL`, linha ausente, valor inválido e falso válido.
- O payload do frontend não consegue substituir nenhum parâmetro.
- Alterar o parâmetro entre criação, edição e cancelamento comprova que cada operação usa o valor corrente, sem inferir o modo original pelos movimentos.

#### Identidade, duplicidade e quantidade

- O número vem de `pedidosfiliais_proximocodigo()` no PostgreSQL e nunca de `max + 1`; o fallback SQLite é isolado aos testes.
- Quantidade aceita somente inteiro maior que zero no Cadastro, respeitando a representação interna decimal.
- Com duplicatas permitidas, duas criações geram registros distintos.
- Com duplicatas proibidas, o Cadastro rejeita a nova gravação e retorna a requisição aberta para opção de abertura, sem somar.
- No mesmo cenário, a Consulta de Compras continua somando a quantidade à aberta.
- Duas transações simultâneas para a mesma tríade não criam duplicata quando proibida; o teste PostgreSQL deve usar duas conexões reais e comprovar o efeito do advisory lock.
- Produtos compostos são aceitos ou rejeitados conforme o parâmetro literal.

#### Estoque e movimentos

- Com `REQUISICAOSUBTRAIESTOQUE` falso, criar, editar e cancelar alteram `pedidosfiliais` sem gerar TEP, TPE ou TFR.
- Na criação com parâmetro verdadeiro, TEP move a quantidade de `emestoque` para `reservaprevia`, usa a filial física da requisitada virtual, grava `trffilial`, `usuariologado` e referência `REQUISICAO <codigo>`.
- Saldo zero continua permitindo localizar o produto, mas quantidade positiva sem `emestoque` suficiente falha na gravação.
- Aumento gera TEP apenas da diferença; redução libera apenas a diferença; quantidade inalterada não gera movimento.
- Troca de produto ou requisitada libera o antigo e reserva integralmente o novo na mesma transação.
- Se o novo estoque não suportar a troca, requisição, estoque antigo, estoque novo, movimentos e logs permanecem como antes.
- Locks de múltiplos estoques seguem ordem determinística `(produto, filial física)`; teste PostgreSQL concorrente com ordens de entrada invertidas termina sem deadlock e com saldos corretos.
- O saldo é relido depois do lock: uma segunda transação que consome estoque antes da aquisição do lock faz a primeira falhar sem escrita parcial.

#### Liberação, Venda Futura e cancelamento

- Redução, troca e cancelamento calculam `quantidade_liberavel = min(quantidade_a_liberar, reservaprevia_atual)`.
- Sem Venda Futura, toda quantidade liberável retorna a `emestoque` via TPE.
- Com Venda Futura, TFR direciona primeiro `min(futuro, quantidade_liberavel)` para `reservado`; somente o restante retorna a `emestoque`.
- Testar Venda Futura menor, igual e maior que a quantidade liberável.
- Se `reservaprevia` estiver abaixo do esperado por movimento avulso, a operação é confirmada com o disponível e retorna alerta persistível contendo quantidade esperada, movimentada e diferença.
- Cancelamento é permitido para situação `A` mesmo com `qtderecebida > 0`; usa `qtdepedida` como expectativa, limpa `qtderecebida`, grava situação `C`, observação e motivo.
- Situações `F`, `D`, `C` ou desconhecidas rejeitam edição e cancelamento sem movimentos.
- TPE de cancelamento usa `EXCLUSAO REQUISICAO <codigo>`; TEP, ajustes e TFR usam `REQUISICAO <codigo>`.

#### Atomicidade

Injetar falha controlada em cada fronteira relevante — após obter número, após gravar `pedidosfiliais`, após primeiro movimento, antes de atualizar a requisição e antes do commit — e comprovar rollback conjunto de:

- cabeçalho/linha em `pedidosfiliais`;
- movimentos TEP/TPE/TFR;
- efeitos derivados em `estoques`;
- entrada em `pedidosfiliais_log_new`;
- revisão visível ao cliente.

### Concorrência e convivência Delphi–Laravel

- A leitura da ficha retorna uma Revisão da Requisição derivada do maior `trigger_id` aplicável em `pedidosfiliais_log_new`.
- Alteração ou cancelamento com revisão atual funciona; com revisão antiga retorna conflito específico e não grava nada.
- Um UPDATE direto em `pedidosfiliais`, sem `DatabaseAuditContext`, simula o Delphi: cria log com usuário do banco, campos de aplicação nulos e invalida a revisão carregada pelo Laravel.
- Uma alteração Laravel aplica `DatabaseAuditContext` e grava `app_user_id`, login, nome, `app_source` e `request_id`.
- INSERT, UPDATE e DELETE são cobertos pelo gatilho; UPDATE armazena somente o diff segundo o padrão de `clientes_log_new`.
- `pedidosfiliais_log` e seu gatilho legado continuam presentes e funcionais depois das migrações.
- Requisição criada pelo Delphi pode ser carregada, editada ou cancelada no Laravel; requisição criada no Laravel permanece legível e operável pelo SQL/contratos Delphi.
- `datahoraalteracaousuario` continua compatível, mas modificar apenas esse campo não substitui nem contorna a revisão baseada no log.

### Critérios do backend específico do Cadastro

#### Acesso e filial

- Visitante recebe autenticação; usuário sem o módulo recebe 403; administrador acessa; usuário comum com `usuariosacessosmodulos` acessa.
- Usuário comum vê e usa como requisitante somente filiais de `usuariosfiliais`; administrador vê todas as válidas.
- Cada endpoint mutável revalida o módulo e a Filial Requisitante, inclusive contra payload adulterado.
- A Filial Requisitada pode ser qualquer filial válida diferente da requisitante e não precisa pertencer a `usuariosfiliais`.
- Filial inexistente, requisitada igual à requisitante e filial requisitante não autorizada são rejeitadas sem escrita.

#### Ficha e estados

- Nova ficha apresenta “Novo”, campos iniciais e não reserva número antes da gravação.
- Gravação válida redireciona/carrega a identidade persistida `(requisitante, codigo)`.
- Carga direta por essa identidade encontra qualquer situação.
- Somente situação `A` permite editar/cancelar; demais situações devolvem a ficha em leitura.
- Campos de recebimento, série e número da nota são sempre somente leitura; o backend ignora/rejeita tentativa de alterá-los.
- Observação aceita até 150 caracteres sem truncar; composição com o texto/motivo de cancelamento também respeita 150.
- Motivo é obrigatório somente quando o parâmetro corrente exige; quando informado, deve existir, ser do tipo pedido e estar ativo.

#### Lookups e pesquisas

- Requisitante lista somente filiais autorizadas e mantém ordenação por código.
- Requisitada exclui a requisitante atual.
- Produto só resolve após requisitada e exige linha em `estoques` na filial física; saldo zero é elegível.
- Resolução direta aceita código visual e código de barras.
- Com produtos compostos desabilitados, lookup direto e modal aplicam o mesmo bloqueio.
- Pesquisa de produto retorna descrição, grades, referência, código, filial, estoque e unidade na ordenação sem acentos por descrição, grades e desempate estável por código.
- `USAR GRADES PRODUTOS` controla apenas visibilidade das colunas Linha/Coluna; ocultá-las não altera a ordem.
- F9 lista somente abertas da requisitante escolhida e retorna os campos Delphi definidos.
- Paginação, busca e resolução direta não vazam requisições de requisitantes não autorizadas.

### Critérios da interface

Testes de componente devem comprovar:

- renderização dos modos Novo, Editando aberta e Somente leitura;
- ações Nova/F3, Gravar/F5, Cancelar/F6, Procurar/F9 e Descartar/Esc, além de botões clicáveis equivalentes;
- aviso antes de perder alterações locais;
- mudança da requisitante limpa requisitada, produto e quantidade; mudança da requisitada limpa produto e quantidade; mudança do produto limpa quantidade;
- produto fica desabilitado até existir requisitada;
- quantidade zero ou não inteira apresenta erro de campo e não envia gravação;
- observação exibe contador e nunca é truncada silenciosamente;
- grades aparecem/desaparecem conforme parâmetro retornado pelo servidor;
- duplicidade abre modal com opções de abrir a existente ou permanecer no rascunho, sem soma automática;
- cancelamento pede confirmação e, quando exigido, motivo; sucesso mantém a ficha cancelada e somente leitura;
- conflito de revisão pede recarga sem descartar silenciosamente o rascunho;
- divergência de Reserva Prévia permanece visível após o sucesso até reconhecimento/navegação;
- valores de parâmetros ou de campos somente leitura não são enviados como autoridade;
- menu exibe exatamente Interlojas → Requisição para Exposição apenas para quem possui acesso.

O smoke test integrado deve percorrer: abrir pelo menu, criar requisição, localizar por F9, editar quantidade, recarregar, cancelar e confirmar estado final, movimentos e auditoria.

### Regressão obrigatória da Consulta de Compras

Depois da extração do núcleo:

- toda a suíte existente de `tests/Feature/Estoque/ConsultaCompras` continua verde, ajustando somente fixtures que hoje usam descrições erradas dos parâmetros;
- preview, candidatas, cobertura, distribuição e snapshots permanecem específicos e sem dependência do Cadastro;
- confirmação em lote continua ignorando linhas sem quantidade positiva, validando estoque e somando duplicata aberta quando proibida a criação de outra;
- listagem/cancelamento já expostos pela Consulta passam pelo núcleo compartilhado sem perder seus contratos HTTP;
- testes novos cobrem ambos os chamadores contra o mesmo manifesto, repositório e política de movimentos;
- nenhum controller, Form Request, DTO ou componente visual do Cadastro é usado pela Consulta, e vice-versa.

### Gates por comando SpecKit

1. **Núcleo compartilhado:** unitários do manifesto e políticas, features transacionais dos dois chamadores, suíte PostgreSQL de auditoria/concorrência e regressão integral da Consulta.
2. **Backend do Cadastro:** features de acesso, CRUD, estados, lookups, parâmetros, pesquisas, duplicidade e conflitos; análise estática/formatação aplicável.
3. **Interface e integração:** Vitest dos estados/jornadas, build Vite, feature tests de rotas/menu e smoke test integrado documentado.

O módulo somente está aceito quando `composer test`, `npm test`, `npm run build` e a suíte PostgreSQL específica terminarem sem falhas ou skips nos cenários obrigatórios.
