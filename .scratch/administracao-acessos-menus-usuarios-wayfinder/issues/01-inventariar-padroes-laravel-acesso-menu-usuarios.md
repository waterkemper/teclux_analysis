# Inventariar padroes Laravel de acesso, menu, rotas e Usuarios

Type: research
Status: resolved
Blocked by:

## Question

Qual e o baseline comprovavel no Laravel atual para este esforco? Inventarie, com caminhos e evidencia concreta:

- esquema, migrations, leitura e renderizacao da arvore acessosmodulos, hierarquia codigo_pai, rota, ordem, teclux_cloud, habilitado e concessoes em usuariosacessosmodulos;
- MenuService e demais builders/projections de menu, incluindo filtros por Administrador/Usuario e tratamento de folhas sem rota ou com rota ambigua;
- services de acesso de modulo, middleware, aliases, Policies/Gates e padrao de 401/403 ja usado;
- telas administrativas existentes que possam servir de seam para uma futura tela de concessao de modulos;
- UsersController, UsersService, requests, componentes React, migrations, testes e Auditoria envolvidos em criacao/edicao de Usuario e sincronizacao de usuarios_auth;
- o comando auth:create-user, seus usos/documentacao/testes e diferencas em relacao ao fluxo atual do Cadastro de Usuarios;
- rotas de exemplo, especialmente Contas a Pagar, e qualquer catalogo/registro central que permita mapear menu visual para rota nomeada/URL;
- inconsistencias, duplicidades, aliases e lacunas que precisam virar decisoes, sem investigar Delphi.

O resultado deve separar fato existente, inferencia e ausencia de evidencia, e recomendar os seams que os prompts devem reutilizar sem duplicar arquitetura.

## Answer

Inventario concluido em [pesquisa-padroes-laravel.md](../../../modules/administracao/acessos-menus-usuarios/pesquisa-padroes-laravel.md).

Achados principais:

- O MenuService ja e a autoridade de leitura da arvore Cloud: filtra teclux_cloud, habilitado, codigo_pai, ordem, rota existente e as concessoes de usuariosacessosmodulos; Administrador ve todas as folhas e Usuario comum ve somente as concedidas.
- Existe MenuService::getModulesForPermissionsChoice(), mas ele retorna uma lista plana e nao foi localizado consumidor, controller ou endpoint que grave concessoes em usuariosacessosmodulos.
- O modulo Usuarios ja possui UsersModuleAccessService, middleware users.module, Policy e autorizacao por acao. O bypass de Administrador e o grant da folha users.cadastro ja estao implementados.
- O Cadastro de Usuarios ja cria e atualiza usuarios_auth em transacao, com login, senha, hash, unicidade, concorrencia, validade de senha e testes; o frontend ja exibe login/senha. O fluxo nao deve ser duplicado.
- auth:create-user continua publicado em routes/console.php como fluxo paralelo, sem teste especifico localizado. A decisao de remover, depreciar ou manter o comando deve ficar no ticket de credenciais.
- Rotas nomeadas/URLs ficam em routes/web.php e folhas de menu sao semeadas por varias migrations; nao foi localizado catalogo unico para menu, rota nomeada e URL. O caso Contas a Pagar protege a pagina e endpoints filhos no mesmo grupo de middleware.

Recomendacoes para os tickets seguintes:

1. A tela de acesso deve reutilizar acessosmodulos e usuariosacessosmodulos, ter autorizacao propria e nao criar permissao operacional paralela.
2. O contrato da tela precisa decidir se o read model sera hierarquico, quais folhas/grupos sao administraveis, como funcionam concessoes e Auditoria e como evitar auto-revogacao administrativa.
3. O contrato de menus/rotas deve separar reorganizacao visual, nome em acessosmodulos, URL HTTP e protecao das rotas filhas.
4. O ticket de credenciais deve comparar o comando com o fluxo web existente e definir a politica de transicao.

Resolvido por pesquisa Laravel local; nenhum codigo de producao ou Delphi foi alterado.
