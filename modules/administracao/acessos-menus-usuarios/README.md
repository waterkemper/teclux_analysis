# Administracao de acessos, menus, rotas e Usuarios

Este diretorio contem o pacote autoritativo de prompts para ajustes no
Laravel. O Cursor deve usar somente o checkout Laravel disponivel em
laravel/backend e os documentos deste diretorio. Nao solicitar, procurar ou
inventar codigo Delphi.

## Ordem de execucao

1. 01-organizacao-menus-rotas.md
2. 02-acesso-modulos-por-usuario.md
3. 03-credenciais-no-cadastro-usuarios.md
4. 04-ajustes-pos-revisao.md

O primeiro prompt estabelece o catalogo canonico e as folhas concediveis. O
segundo reutiliza esse catalogo para a tela administrativa de grants. O
terceiro consolida o Cadastro de Usuarios e remove o fluxo Artisan paralelo.
O quarto corrige as lacunas encontradas na revisao dos tres lotes: endpoints
auxiliares do relatorio, fingerprint, auditoria de credenciais e testes.

## Decisoes funcionais fechadas

- A primeira versao concede folhas diretamente a Usuarios. Grupos ficam fora.
- Somente Administradores podem abrir e operar a tela de grants. A regra e
  server-side e usa o campo administrador; acesso ao Cadastro de Usuarios nao
  concede automaticamente capacidade de administrar grants.
- Administradores tem bypass absoluto para modulos Cloud e nao sao editados
  pela tela de grants.
- A tela administra acesso efetivo ao modulo, nao somente visibilidade do
  menu. Pagina, geracao, status, cancelamento, retry, lookup, PDF,
  exportacao e download revalidam o mesmo grant da folha.
- Folhas concediveis sao folhas Cloud ativas com rota nomeada existente e
  univoca. Grupos e hubs sao apenas navegacao, salvo quando uma funcionalidade
  exclusiva for modelada como folha.
- Cada diff de grants e atomico, idempotente, auditado e protegido contra
  concorrencia. Repeticao identica nao cria evento; conflito retorna 409.
- A reorganizacao de menu e rota e incremental. O nome da rota Laravel e a
  identidade em acessosmodulos.rota; a URL e declarada em routes/web.php.
- A convencao nova para o exemplo e:
  Contas a Pagar -> Relatorios -> Contas a Pagar
  URL /cadastros/contas-pagar/relatorios/contas-a-pagar
  rota contas_pagar.relatorios.contas_a_pagar.index
- O lote remove /cloud/modulos/... e os nomes de rota antigos envolvidos,
  atualizando referencias internas, testes e frontend. Nao manter aliases ou
  redirects permanentes.
- Migrations de catalogo sao idempotentes. Rota inexistente, rota canonica
  duplicada ou catalogo ambiguo bloqueia a migration. Orfaos sao
  diagnosticados e nao exibidos. Nenhuma concessao e apagada silenciosamente.
- O Cadastro web e o unico fluxo oficial de credenciais. auth:create-user
  sera removido.
- usuarios.email e o e-mail operacional legado, compartilhavel e usado pelo
  Delphi em cenarios como envio de XML. Ele nao e um identificador de login.
- usuarios_auth.email e outro campo, em outra tabela, e fica fora deste
  ajuste. email_conta nao deve ser copiado para ele.
- login e obrigatorio e unico. Senha, validade e aviso seguem as regras atuais.
  must_change_password permanece false por padrao.
- Usuario legado sem usuarios_auth pode ser regularizado pelo cadastro com
  login, senha e confirmacao. Usuario inativo nao autentica, mas preserva
  credencial, grants e auditoria.
- Operacoes de cadastro e credenciais sao transacionais e auditadas. Nunca
  registrar senha, hash, token ou confirmacao.

## Fontes Laravel e evidencia

Comece sempre inspecionando o checkout atual. Use como pontos de partida:

- laravel/backend/app/Services/Menu/MenuService.php
- laravel/backend/app/Services/Authorization/UsersModuleAccessService.php
- laravel/backend/app/Http/Middleware/EnsureUsersModuleAccess.php
- laravel/backend/app/Services/Authorization/UsersActionAuthorizationService.php
- laravel/backend/app/Policies/UsuarioPolicy.php
- laravel/backend/app/Services/User/UsersService.php
- laravel/backend/app/Http/Controllers/User/UsersController.php
- laravel/backend/app/Http/Requests/User/StoreUserRequest.php
- laravel/backend/app/Http/Requests/User/UpdateUserRequest.php
- laravel/backend/resources/js/Pages/Cadastros/Users/UsersCadastroForm.tsx
- laravel/backend/routes/web.php
- laravel/backend/routes/console.php
- laravel/backend/database/migrations
- laravel/backend/tests/Feature/User

A pesquisa consolidada esta em:

modules/administracao/acessos-menus-usuarios/pesquisa-padroes-laravel.md

Toda conclusao do prompt deve ser classificada como CONFIRMADO, INFERIDO,
DUVIDA, NAO LOCALIZADO ou DIVERGENTE e deve citar arquivo e linha quando
estiver baseada no checkout. Se uma decisao fechada contrariar o checkout,
preserve a decisao, registre a divergencia e especifique o menor ajuste.

## Contrato de saida dos prompts

Cada prompt inicia com /speckit.specify e pede uma especificacao implementavel,
sem alterar codigo durante a etapa de especificacao. A saida deve conter:

- contexto e fronteira do modulo;
- vocabulario e invariantes;
- estado atual confirmado no Laravel;
- contratos de dominio e persistencia;
- rotas, middleware, Policies ou abilities;
- contratos HTTP, Inertia e React quando aplicavel;
- migrations idempotentes e estrategia de rollout;
- auditoria, concorrencia, transacao e tratamento de erros;
- testes de autorizacao, regressao e integracao;
- criterios de aceite verificaveis;
- arquivos existentes a reutilizar e arquivos novos propostos;
- duvidas e bloqueios acionaveis, sem pedir acesso ao Delphi.
