# Prompt para /speckit.specify — backend do Cadastro

```text
/speckit.specify

Crie uma especificação funcional e técnica detalhada para implementar o backend Laravel do Cadastro manual **Interlojas → Requisição para Exposição**, consumindo o núcleo compartilhado especificado em `modules/interlojas/requisicao-para-exposicao/01-speckit-prompt-nucleo-compartilhado.md`.

Não implemente nesta etapa. Inspecione o checkout Laravel e cite evidências concretas. Não abra fontes Delphi: o contrato funcional abaixo é autoritativo. Não reespecifique internamente locks/movimentos/auditoria do prompt 01; defina como o Cadastro chama esses contratos e quais projeções, autorizações, endpoints e SQLs próprios precisa.

## Objetivo e limite

Entregar o backend de uma página de cadastro unitário com:

- ficha nova;
- inclusão;
- carga direta por identidade;
- alteração enquanto aberta;
- cancelamento lógico;
- pesquisa F9 de abertas;
- lookups próprios de filiais, produtos e motivos;
- módulo/permissão próprios;
- contratos HTTP para a interface do prompt 03.

Não criar consulta histórica geral nem qualquer fluxo de separação, transferência, expedição ou recebimento.

## Estado Laravel a investigar e reutilizar

- núcleo entregue pelo prompt 01;
- `UserBranchAccessService`;
- padrões de `acessosmodulos`, `usuariosacessosmodulos` e serviços `*ModuleAccessService`;
- `LegacyMotivoRepository`;
- padrões de Form Requests, policies/gates, Inertia e endpoints de lookup;
- `CatalogCodeLookup` e contratos backend de catálogos;
- SQL/repositórios da Consulta de Compras apenas para extrair resolução de filial física e leitura de estoque, nunca suas projeções de sugestão;
- componentes backend de cadastros existentes para carga direta e pesquisas paginadas.

## Contrato funcional confirmado

### Identidade, campos e estados

Nome/menu: **Interlojas → Requisição para Exposição**.

Identidade de carga: `(requisitante, codigo)`. O número só nasce após gravação.

Campos:

- cabeçalho somente leitura: número, data/hora, situação, requisição de origem;
- editáveis enquanto situação `A`: requisitante, requisitada, produto, quantidade pedida, observação;
- contexto somente leitura: descrição, unidade, estoque da requisitante e da requisitada;
- resultado posterior somente leitura: quantidade recebida, série e número da nota fiscal.

Situação `A`: editável e cancelável. `F`, `D`, `C` ou desconhecida: somente leitura. Carga direta encontra qualquer situação. Quantidade é inteiro maior que zero; zero não cancela. Observação tem no máximo 150 caracteres, sem truncamento. Observação mais texto/motivo de cancelamento também deve caber no limite.

### Autorização

- administrador acessa o módulo e pode escolher qualquer filial válida como requisitante;
- usuário comum precisa do acesso próprio em `usuariosacessosmodulos`;
- requisitante deve pertencer a `usuariosfiliais`;
- requisitada pode ser qualquer filial válida diferente da requisitante, ainda que não esteja em `usuariosfiliais`;
- revalidar módulo, ator e filial requisitante em todo endpoint mutável e em toda leitura que exponha dados por requisitante;
- não criar permissão separada, senha ou reautenticação para incluir, alterar ou cancelar.

### Dependências

- requisitante lista somente filiais autorizadas;
- requisitada exclui a requisitante;
- produto só fica disponível após requisitada;
- mudar requisitante invalida requisitada, produto e quantidade;
- mudar requisitada invalida produto e quantidade;
- mudar produto invalida quantidade.

O backend deve rejeitar payload que tente contornar essas dependências.

### Produtos e filiais físicas

Um produto é elegível quando possui linha em `estoques` na filial física da requisitada, resolvendo filial tipo `V` por `coalesce(filial_estoque, codigo)`. Saldo zero permite localizar; a suficiência para gravar é responsabilidade transacional do núcleo.

Resolução direta aceita código visual ou código de barras. Aplicar `Transferir Produtos Compostos` tanto na resolução direta quanto na pesquisa.

Pesquisa de produtos retorna:

- descrição;
- Linha/Coluna de grade;
- referência;
- código;
- filial;
- estoque;
- unidade.

Ordenar sem acentos por descrição, depois grades quando visíveis e código como desempate estável. `USAR GRADES PRODUTOS` controla a visibilidade de Linha/Coluna sem mudar a ordem estável.

### Pesquisa F9 e carga

F9 lista somente requisições em situação `A` da requisitante escolhida. Retornar produto, grades, número, requisitante, requisitada, data e referência, com ordenação Delphi já confirmada e paginação/pesquisa no padrão Laravel.

Carga direta por `(requisitante, codigo)` retorna ficha detalhada, inclusive situações não abertas. Não permitir que usuário comum consulte requisitante não autorizada.

### Gravação e duplicidade

O frontend envia intenção e revisão, não número novo, parâmetros efetivos, autorização ou decisão de estoque.

Na inclusão:

- servidor gera o número dentro da transação;
- núcleo revalida parâmetros, duplicidade, produto, saldo e locks;
- se duplicatas forem proibidas e existir aberta para a tríade, retornar erro estruturado com identidade da aberta;
- o Cadastro nunca soma automaticamente: permite à interface abrir a existente ou manter o rascunho.

Na alteração:

- aceitar troca de requisitante, requisitada, produto, quantidade e observação enquanto aberta;
- enviar Revisão da Requisição carregada;
- núcleo executa delta/troca atômica;
- revisão obsoleta retorna conflito específico para recarga.

### Cancelamento

Exigir confirmação na interface; backend exige intenção explícita e revisão.

`Informar o motivo do cancelamento do pedido` é resolvido na filial ativa:

- verdadeiro: motivo obrigatório;
- falso: motivo opcional;
- se informado, motivo deve existir, ser do tipo pedido e estar ativo.

Não exigir supervisor. Permitir situação `A` mesmo com `qtderecebida > 0`. O núcleo limpa `qtderecebida`, cancela e movimenta estoque conforme o prompt 01. Após sucesso, retornar ficha cancelada e eventual alerta de Reserva Prévia divergente.

### Parâmetros e auditoria

Os cinco parâmetros são sempre resolvidos no servidor pela filial ativa, conforme prompt 01. Não expor valor como autoridade mutável; a resposta pode informar flags de apresentação, como grades e exigência de motivo.

Todo comando recebe o usuário autenticado, filial ativa e `request_id`, aplica auditoria no núcleo e grava `movimentos.usuariologado`.

## Contratos HTTP a especificar

Defina rotas, verbos, requests e respostas para:

- página/index;
- estado inicial de nova ficha;
- carregar ficha;
- criar;
- alterar;
- cancelar;
- pesquisar abertas (F9);
- listar/resolver requisitantes;
- listar/resolver requisitadas;
- listar/resolver produtos por visual/barras;
- listar/resolver motivos.

Respostas de mutação devem distinguir: validação, sem acesso, duplicidade com aberta, estoque insuficiente, conflito de revisão, situação não aberta e sucesso com alerta de Reserva Prévia.

## Critérios de aceite

- [ ] Menu/módulo possui identidade própria, separado da Consulta de Compras.
- [ ] Usuário sem módulo recebe 403; administrador e usuário concedido seguem as regras definidas.
- [ ] Toda leitura/mutação respeita `usuariosfiliais` para a requisitante e não exige vínculo com a requisitada.
- [ ] Nova ficha não reserva número; criação retorna identidade persistida.
- [ ] Somente aberta é mutável; campos de recebimento/NF nunca são alterados pelo payload.
- [ ] Quantidade, observação, motivo, produto e filiais são revalidados no servidor.
- [ ] Lookups direto/modal têm a mesma elegibilidade e respeitam filial física, compostos e grades.
- [ ] F9 retorna somente abertas da requisitante autorizada.
- [ ] Duplicidade retorna a aberta sem somar.
- [ ] Edição/cancelamento usam revisão do log e retornam conflito sem efeitos.
- [ ] Cancelamento respeita motivo corrente, aceita `qtderecebida > 0` em aberta e retorna alertas do núcleo.
- [ ] Ator, filial ativa e `request_id` chegam ao núcleo; frontend não controla parâmetros.

## Matriz mínima de testes

- visitante, usuário sem módulo, usuário concedido e administrador;
- usuário com uma filial tenta requisitante autorizada/não autorizada e requisitada não vinculada;
- requisitante igual à requisitada e filiais inexistentes;
- ficha nova, criação, carga aberta, carga fechada e tentativa de mutação de somente leitura;
- quantidade zero, negativa, fracionária e inteira positiva;
- observação 150/151 caracteres e composição de cancelamento no limite;
- produto por visual, barras, composto permitido/proibido, filial virtual e saldo zero;
- grades ligadas/desligadas e ordenação estável;
- F9 com duas requisitantes e situações distintas, provando ausência de vazamento;
- duplicidade permitida/proibida;
- alteração de quantidade, troca de produto/filial e revisão obsoleta;
- motivo obrigatório/opcional, tipo errado, inativo e válido;
- cancelamento aberto com `qtderecebida > 0` e não aberta;
- payload adulterado com parâmetros, número, filial e campos somente leitura.

Use feature tests Laravel em SQLite para contratos rápidos e a suíte PostgreSQL do prompt 01 para auditoria/concorrência. Não aceite testes obrigatórios silenciosamente ignorados.

## Saída esperada do SpecKit

Produza especificação e plano executáveis, incluindo arquitetura de controllers/requests/policies/repositórios/projeções, contratos JSON, SQLs/lookups, códigos de erro, dependência do núcleo, sequência de implementação e matriz de testes. Não implemente durante `/speckit.specify`.

## Fora de escopo

- página React e interação visual (prompt 03);
- consulta histórica geral;
- separação, transferência, expedição, recebimento e manutenção de `qtderecebida`;
- preview/candidatas/sugestão/distribuição da Consulta de Compras;
- Pedido de Compra, NF-e pendente e painéis da Consulta;
- criar DTO/controller/policy universal;
- senha de supervisor, requisição parcial ou alteração do Delphi.
```
