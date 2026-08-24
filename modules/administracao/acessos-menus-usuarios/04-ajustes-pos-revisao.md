# Prompt para /speckit.specify - ajustes pos-revisao de acessos, relatorios e credenciais

```text
/speckit.specify

Crie uma especificacao funcional e tecnica implementavel para corrigir as
lacunas encontradas na revisao dos lotes de organizacao de menus/rotas,
acesso a modulos por Usuario e credenciais no Cadastro de Usuarios do
Laravel. Nao implemente codigo durante /speckit.specify. Inspecione somente
laravel/backend e os documentos deste pacote. Cite arquivos e linhas
concretos do checkout atual.

Nao procure, solicite ou invente codigo Delphi. O Delphi e apenas contexto
historico ja registrado nos prompts anteriores. Classifique cada conclusao
como CONFIRMADO, INFERIDO, DUVIDA, NAO LOCALIZADO ou DIVERGENTE.

Leia antes:

- /mnt/c/teclux_analysis/modules/administracao/acessos-menus-usuarios/README.md
- /mnt/c/teclux_analysis/modules/administracao/acessos-menus-usuarios/01-organizacao-menus-rotas.md
- /mnt/c/teclux_analysis/modules/administracao/acessos-menus-usuarios/02-acesso-modulos-por-usuario.md
- /mnt/c/teclux_analysis/modules/administracao/acessos-menus-usuarios/03-credenciais-no-cadastro-usuarios.md
- /mnt/c/teclux_analysis/modules/administracao/acessos-menus-usuarios/pesquisa-padroes-laravel.md
- /mnt/c/teclux_analysis/laravel/specs/374-org-menus-rotas/spec.md
- /mnt/c/teclux_analysis/laravel/specs/375-user-module-grants/spec.md
- /mnt/c/teclux_analysis/laravel/specs/376-user-credentials-cadastro/spec.md
- /mnt/c/teclux_analysis/laravel/backend/app/Http/Controllers/ContasPagar/RelatorioContasPagarController.php
- /mnt/c/teclux_analysis/laravel/backend/routes/web.php
- /mnt/c/teclux_analysis/laravel/backend/app/Services/ContasPagar/ContasPagarModuleAccessService.php
- /mnt/c/teclux_analysis/laravel/backend/app/Http/Middleware/EnsureContasPagarRelatorioModuleAccess.php
- /mnt/c/teclux_analysis/laravel/backend/app/Services/User/UsuarioModuleGrantsService.php
- /mnt/c/teclux_analysis/laravel/backend/app/Http/Requests/User/SyncUsuarioModuleGrantsRequest.php
- /mnt/c/teclux_analysis/laravel/backend/app/Infrastructure/Persistence/Legacy/User/LegacyUsuarioCredentialAuditWriter.php
- /mnt/c/teclux_analysis/laravel/backend/app/Services/User/UsersService.php
- testes Feature e Unit dos modulos acima

## Fronteira

Este prompt cobre somente:

1. garantir que um Usuario com o grant da folha do Relatorio de Contas a
   Pagar consiga usar todos os endpoints da propria tela, inclusive filtros,
   exportacao, PDF, status, cancelamento, retry e downloads;
2. fechar o contrato de validacao do fingerprint de grants;
3. completar ou esclarecer a auditoria explicita de credenciais no mesmo
   registro legado de usuarios_log;
4. substituir testes que hoje apenas comparam constantes ou literais por
   verificacoes de comportamento real;
5. documentar rollout, compatibilidade e eventuais itens deliberadamente
   fora deste lote.

Nao reabra as decisoes fechadas dos prompts anteriores. Nao criar grupos,
permissoes novas, tabela paralela de credenciais ou grants, aliases ou
redirects para a antiga URL /cloud/modulos. Nao alterar o campo
usuarios.email, que continua sendo e-mail operacional compartilhavel, nem
copiar seu valor para usuarios_auth.email.

## Achado 1 - endpoints auxiliares do relatorio

Investigue a montagem de URLs em
`RelatorioContasPagarController::index` e todos os middlewares aplicados aos
endpoints chamados pelo frontend. O estado atual aparenta enviar para o
relatorio as rotas:

- contas_pagar.documentos_pagar.lookup_fornecedores;
- contas_pagar.documentos_pagar.lookup_bancos;
- contas_pagar.documentos_pagar.lookup_contas;
- contas_pagar.tipos_pagamento.lookup.

Essas rotas aparentam estar protegidas por grants de modulos irmaos,
enquanto a pagina usa contas_pagar.relatorio.module. Confirme isso no
checkout e trace as chamadas reais do React, incluindo endpoints indiretos.

A especificacao deve escolher e justificar uma solucao que preserve a regra:
uma folha concedida deve controlar a pagina e todos os filhos necessarios
para seu uso. A solucao preferencial e expor endpoints de lookup proprios do
relatorio, com nomes e URLs canonicos, reutilizando os services/repositories
de consulta existentes e protegendo-os com o middleware da folha do
relatorio. Se a investigacao provar que compartilhar endpoints e seguro sem
conceder modulo irmao, documente o mecanismo server-side que garante isso.

Nao duplicar regra de negocio nem abrir lookup sem autenticacao e sem o
grant correto. Nao conceder automaticamente documentos_pagar ou
tipos_pagamento somente porque o Usuario recebeu o relatorio.

Defina tambem o comportamento de um Usuario sem esses grants, de um
Administrador, de uma URL antiga e de cada endpoint de lookup. Inclua teste
que cria Usuario nao administrador com somente a folha do relatorio e
confirma que a tela carrega filtros e executa suas operacoes permitidas.

## Achado 2 - fingerprint de grants

Compare o contrato de `expected_fingerprint` nos specs com o
`SyncUsuarioModuleGrantsRequest` e `UsuarioModuleGrantsService` atuais.

O contrato deve deixar explicito:

- fingerprint esperado = SHA-256 hexadecimal de 64 caracteres;
- fingerprint ausente, vazio ou malformado deve ter resposta definida;
- fingerprint divergente deve continuar retornando 409 e nunca sobrescrever
  grants concorrentes;
- a validacao de formato nao pode eliminar indevidamente a semantica de 409
  definida para fingerprint ausente/stale;
- a regra deve ser coberta por FormRequest/service e testes HTTP.

Escolha a menor implementacao coerente com o contrato existente. Nao mover a
validacao de autorizacao para o React e nao aceitar fingerprint arbitrario
so porque o service consegue tratar parte dos casos.

## Achado 3 - auditoria de credenciais

Compare `LegacyUsuarioCredentialAuditWriter`, `UsersService`,
`DatabaseAuditContext`, schema de `usuarios_log` e os testes de auditoria.
Determine qual e a fonte de verdade para cada evento: trigger legado,
evento explicito da aplicacao ou ambos.

O contrato final deve permitir auditar, sem segredos:

- operador e Usuario afetado;
- inclusao ou alteracao da credencial;
- login anterior e novo, quando houver mudanca;
- booleano indicando alteracao de senha, sem valor da senha;
- estado resultante ativo/inativo;
- resultado da operacao;
- timestamp e request_id/trace_id.

Nao invente colunas em usuarios_log sem verificar o schema atual. Se o schema
nao comportar campos dedicados, defina shape JSON versionado em `dados` ou
outro mecanismo compativel com o padrao existente, sempre sem senha, hash,
token ou confirmacao. Se o trigger ja cobrir estado e resultado, nao duplique
o dado sem necessidade: documente a composicao dos eventos e prove-a com
testes.

Inclua cenarios de inclusao, alteracao de login, alteracao de senha,
regularizacao de Usuario legado, inativacao/reativacao, no-op, falha de
validacao, conflito de unicidade e rollback por falha de auditoria. A
transacao deve continuar atomica e nenhuma falha pode deixar credencial sem
o respectivo registro de auditoria exigido pelo contrato.

## Achado 4 - qualidade dos testes

Localize testes que comparam uma constante com um literal, que apenas
confirmam a implementacao sem exercitar comportamento, ou que deixam de
verificar o contrato dos prompts 374, 375 e 376.

Substitua esses testes por verificacoes observaveis, priorizando:

- catalogo concedivel exclui a propria tela administrativa;
- rota canonica e middleware correto;
- Usuario com somente o grant da folha usa todos os endpoints do relatorio;
- Usuario sem grant recebe 403 e nao obtem dados de lookup;
- Administrador mantem bypass conforme regra fechada;
- fingerprint invalido/ausente/stale;
- shape completo e sem segredos da auditoria de credenciais;
- ausencia do comando `auth:create-user`;
- regressao do e-mail operacional `usuarios.email` e preservacao de
  `usuarios_auth.email`.

Os testes devem usar os helpers e fixtures existentes. Nao tornar testes
dependentes de dados especificos do Delphi ou de um banco de producao.

## Rotas, middleware e frontend

Para cada endpoint novo ou alterado entregue uma tabela com:

- metodo e URL;
- nome da rota;
- controller/action;
- middleware de autenticacao/contexto;
- middleware ou service de autorizacao da folha;
- formato de sucesso e erros 401/403/404/409/422.

Atualize o contrato Inertia/React somente onde necessario para consumir as
URLs corretas. Nao colocar decisao de autorizacao no frontend. A UI deve
continuar funcionando quando o Usuario tem apenas a folha do relatorio.

## Migrations e rollout

Informe se ha migration necessaria. Toda migration de catalogo deve ser
idempotente, preservar grants existentes e falhar de forma segura em caso de
rota ausente ou duplicada. Nao apagar grants nem reescrever historico.

Se houver endpoint novo para lookup, descreva rollout e compatibilidade com
dados existentes. A URL canonica continua sem /cloud:
`/cadastros/contas-pagar/relatorios/contas-a-pagar`.

## Saida obrigatoria

Entregue uma especificacao com:

- resumo executivo das lacunas confirmadas;
- classificacao de cada achado e evidencia com arquivo/linha;
- invariantes e vocabulario;
- contratos de autorizacao, rotas, middleware, HTTP e Inertia;
- decisao sobre os lookups do relatorio;
- contrato de fingerprint;
- contrato e shape da auditoria de credenciais;
- plano de testes observaveis;
- migrations e rollout, quando necessarios;
- arquivos existentes a reutilizar e arquivos novos propostos;
- criterios de aceite verificaveis;
- duvidas/bloqueios acionaveis, sem solicitar acesso ao Delphi.

O resultado deve ser uma especificacao pronta para `/speckit.plan`, sem
implementar codigo nesta etapa.
```

