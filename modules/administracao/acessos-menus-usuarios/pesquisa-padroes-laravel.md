# Pesquisa: padroes Laravel para acesso, menu, rotas e Usuarios

## Escopo e fonte

Esta pesquisa usa somente fontes primarias locais do checkout Laravel em
`laravel/backend`. O Cursor que executara os futuros prompts nao deve procurar
nem solicitar codigo Delphi. O objetivo e registrar o que ja existe, os seams
reutilizaveis e as lacunas que ainda exigem decisao.

## Resumo executivo

1. O menu Cloud ja e dirigido por `acessosmodulos`, sua hierarquia
   `codigo_pai`, `ordem`, `rota`, `habilitado` e `teclux_cloud`.
   Administrador recebe todas as folhas Cloud; os demais Usuarios recebem
   somente as folhas presentes em `usuariosacessosmodulos`.
2. `MenuService::getModulesForPermissionsChoice()` ja existe e lista folhas
   Cloud habilitadas com rota existente, mas seu retorno e plano
   (`codigo`, `nomemenu`) e nao foi localizado um consumidor na tela de
   Usuarios nem endpoint que grave concessoes.
3. O modulo Usuarios ja possui primeira camada de acesso por
   `UsersModuleAccessService` + `users.module`, e segunda camada por
   `UsersActionAuthorizationService` + `UsuarioPolicy`. Administrador tem
   bypass; Usuario comum precisa do grant da folha `users.cadastro`.
4. O Cadastro de Usuarios ja recebe login e senha, persiste o registro raiz e
   sincroniza `usuarios_auth` em transacao. Inclusao exige senha; alteracao
   permite senha vazia somente quando a credencial ja existe. Ha testes para
   criacao e para Usuario legado sem `usuarios_auth`.
5. O comando `auth:create-user` ainda existe em `routes/console.php`, mas
   representa um fluxo paralelo de criacao de credencial. Nao foi localizado
   teste especifico do comando.
6. As rotas nomeadas e as URLs estao declaradas em `routes/web.php`, enquanto
   as folhas do menu sao semeadas por varias migrations. Nao foi localizado um
   catalogo unico que seja autoridade para menu, nome de rota e URL.

## CONFIRMADO: catalogo e renderizacao do menu

- `laravel/backend/app/Services/Menu/MenuService.php:15-16` documenta a
  regra atual: somente itens `teclux_cloud = true`; Administrador ve todos;
  Usuario comum depende de `usuariosacessosmodulos`.
- `MenuService.php:28-38` escolhe a arvore administrativa com acesso total
  ou a arvore filtrada pelo codigo do Usuario.
- `MenuService.php:61-77` possui o unico seam explicitamente proximo da
  futura tela de permissao: `getModulesForPermissionsChoice()`. Ele consulta
  folhas Cloud habilitadas, exige rota nao vazia e, por padrao, descarta nomes
  de rota que nao existem no router. O retorno e uma lista plana de
  `codigo` e `nomemenu`.
- `MenuService.php:104-131` carrega as linhas de `acessosmodulos`; para
  Usuario comum faz join com `usuariosacessosmodulos` e filtra por
  `usuario` e `teclux_cloud`.
- `MenuService.php:144-264` reconstrui a arvore, usa `codigo_pai` e
  `ordem`, oculta folha inativa, sem rota ou com rota inexistente, e usa
  `Route::getRoutes()->getRoutesByName()` para validar a existencia da rota.
  Grupos sao mantidos somente quando possuem filhos visiveis ou uma rota de
  hub valida.
- `laravel/backend/database/migrations/2025_03_18_000001_create_legacy_erp_tables_for_sqlite.php:121-134`
  confirma as tabelas basicas `acessosmodulos` e
  `usuariosacessosmodulos`; a chave de concessao e composta por
  `usuario` + `acesso`.
- `laravel/backend/database/migrations/2025_03_19_000002_add_teclux_cloud_columns_to_acessosmodulos.php`
  adiciona ao catalogo as colunas de hierarquia, Cloud, ordem, habilitacao e
  rota usadas pelo `MenuService`.
- `laravel/backend/database/migrations/2026_03_19_000003_seed_acessosmodulos_cadastros_usuarios.php:22-74`
  cria/reaproveita o grupo `Cadastros` e a folha `Usuarios`, com
  `codigo_pai`, `habilitado = true` e rota `users.cadastro`.

## CONFIRMADO: acesso do modulo Usuarios

- `laravel/backend/app/Services/Authorization/UsersModuleAccessService.php:14-76`
  define `users.cadastro` como rota da folha, concede bypass a
  `$user->administrador` e, para Usuario comum, procura o codigo da folha em
  `acessosmodulos` e exige a relacao correspondente em
  `usuariosacessosmodulos`. O acesso a logs usa `users.logs`, com fallback
  para o acesso principal quando a folha ainda nao existe.
- `laravel/backend/app/Http/Middleware/EnsureUsersModuleAccess.php:20-39`
  redireciona anonimo para login e retorna HTTP 403 quando o Usuario nao pode
  gerenciar Usuarios.
- `laravel/backend/bootstrap/app.php:119` registra o alias
  `users.module`.
- `laravel/backend/routes/web.php:803-831` envolve a listagem, cadastro,
  lookups, logs, Inclusao e Alteracao de Usuarios no middleware
  `users.module`.
- `laravel/backend/app/Services/Authorization/UsersActionAuthorizationService.php:10-58`
  mantem a segunda camada por acao, mas atualmente todos os metodos principais
  delegam ao acesso do modulo.
- `laravel/backend/app/Policies/UsuarioPolicy.php:17-64` e o ponto usado pelo
  controller para `viewAny`, `view`, `create`, `update`, logs e lookup
  de CEP.

## CONFIRMADO: rotas e exemplo Contas a Pagar

- `laravel/backend/routes/web.php:727-757` declara o hub e a pagina de
  relatorio com a URL
  `/cloud/modulos/contas-a-pagar/relatorio` e o nome
  `contas_pagar.relatorio`. As rotas de gerar, status, cancelar, retry,
  fotografias, PDF e lookups ficam no mesmo grupo protegido por
  `contas_pagar.module` e `contas_pagar.relatorio.module`.
- `laravel/backend/routes/web.php:798-801` tambem mostra rotas Cloud
  placeholder derivadas de uma lista local, indicando que a declaracao de
  rotas e parcialmente catalogada, mas nao e a mesma fonte que as migrations
  de `acessosmodulos`.
- As migrations de menu sao numerosas e incluem criacao, reparenting, dedupe e
  reparos. Exemplos: migrations `2026_03_26_000001_fix_acessosmodulos_estoques_raiz_menu.php`,
  `2026_03_28_000002_contas_pagar_hub_and_tipos_pagamento_menu.php` e
  `2026_07_30_295000_acessosmodulos_consulta_requisicoes.php`.

## CONFIRMADO: Cadastro de Usuarios ja administra credenciais

- `laravel/backend/app/Http/Controllers/User/UsersController.php:32-111`
  carrega listagem/cadastro e projeta `canCreateUser` e
  `canUpdateUser`; `:291-313` autoriza e delega Inclusao/Alteracao a
  `UsersService`.
- `laravel/backend/app/Http/Requests/User/StoreUserRequest.php:104-122`
  exige `login`, `senha` e confirmacao na Inclusao. A request tambem
  valida complexidade da senha e prazos de validade.
- `laravel/backend/app/Http/Requests/User/UpdateUserRequest.php:108-119`
  exige login na Alteracao e torna a nova senha opcional quando fornecida
  vazia, preservando a credencial existente.
- `laravel/backend/app/Services/User/UsersService.php:446-551`
  cria `usuarios` e dados relacionados em transacao, aplica contexto de
  Auditoria e chama `syncUsuarioAuthFromPayload(..., requirePassword: true)`.
- `UsersService.php:554-672` atualiza com controle de concorrencia,
  sincroniza dados relacionados em transacao e chama a mesma sincronizacao de
  credencial com senha opcional.
- `UsersService.php:672-755` atualiza login e hash quando
  `usuarios_auth` existe; cria a linha quando ela nao existe; rejeita login
  duplicado; exige senha para criar uma credencial ausente; e inicializa
  estado de autenticacao. Senhas nao sao devolvidas no payload.
- `laravel/backend/resources/js/Pages/Cadastros/Users/UsersCadastroForm.tsx:300-445`
  exibe o bloco de Login e senha, confirmacao, validade e aviso de expiracao.
- Testes existentes: `tests/Feature/User/UsersStoreTest.php`,
  `tests/Feature/User/UsersUpdateTest.php:315-398`,
  `tests/Feature/User/UsersModuleAuthorizationTest.php` e
  `tests/Feature/User/UsersActionAuthorizationTest.php`.

## CONFIRMADO: comando paralelo ainda publicado

- `laravel/backend/routes/console.php:21-67` define
  `auth:create-user {codigo} {login} {password}`.
- O comando procura o Usuario, exige que esteja ativo, falha quando ja existe
  `usuarios_auth` ou o login esta ocupado, copia email quando possivel e
  grava senha com `Hash::make`.
- O comando alerta sobre a necessidade de ao menos uma linha em
  `usuariosfiliais`, mas nao foi localizado teste especifico do comando nem
  uma chamada do comando pelo Cadastro web.

## NAO LOCALIZADO

As buscas no escopo Laravel nao localizaram:

- controller, request, rota web ou componente React que liste e grave
  concessoes em `usuariosacessosmodulos`;
- consumidor de `MenuService::getModulesForPermissionsChoice()`;
- tela administrativa dedicada a administrar acessos de folhas de modulo;
- service transacional dedicado a conceder/remover acessos de modulo;
- Auditoria de antes/depois especifica para cada alteracao de
  `usuariosacessosmodulos`;
- catalogo unico que seja autoridade simultanea para arvore visual,
  `acessosmodulos.rota`, rota nomeada e URL;
- teste dedicado ao comando `auth:create-user`.

## INFERIDO / recomendacoes para os proximos tickets

- O futuro modulo de acesso deve reutilizar a mesma fonte de autoridade
  (`acessosmodulos` e `usuariosacessosmodulos`) e nao criar uma tabela
  paralela. Entretanto, o seam atual de escolha e plano e insuficiente para
  uma UI hierarquica: o ticket da tela precisa decidir se cria um read model
  hierarquico ou estende o retorno sem quebrar consumidores futuros.
- A autorizacao da tela de acesso deve ser separada do acesso que ela concede.
  Reutilizar `users.module` para abrir o Cadastro de Usuarios nao prova que
  todo Usuario autorizado possa administrar grants de outros Usuarios.
- A organizacao menu/rota precisa tratar separadamente: texto/hierarquia
  visual, nome da rota em `acessosmodulos`, URL HTTP e protecao de rotas
  filhas. O exemplo de Contas a Pagar mostra que uma folha pode proteger
  endpoints de geracao e download alem do GET da pagina.
- A parte de credenciais nao deve ser duplicada no frontend: o fluxo web ja
  tem transacao, hash, validacao, concorrencia e testes. O ticket de decisao
  deve comparar o contrato do comando com esse fluxo e decidir se o comando
  sera removido, depreciado ou mantido apenas como ferramenta operacional
  documentada.

## Decisoes que permanecem

- Quais folhas Cloud podem ser administradas e se grupos de Usuarios entram
  no primeiro escopo.
- Se Administrador e bypass absoluto tambem na tela de grants e como impedir
  auto-revogacao ou perda do ultimo acesso administrativo.
- Se concessoes de grupos serao herdadas, materializadas ou permanecerao fora
  da primeira entrega.
- Qual parcela do catalogo menu/rota sera normalizada e qual politica de
  compatibilidade sera usada para URLs e nomes existentes.
- Qual contrato final de descontinuacao do `auth:create-user`, incluindo
  Usuarios legados sem `usuarios_auth`, senha inicial e Auditoria.
