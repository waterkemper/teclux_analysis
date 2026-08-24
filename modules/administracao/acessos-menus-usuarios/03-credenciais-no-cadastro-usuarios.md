# Prompt para /speckit.specify - credenciais no Cadastro de Usuarios

```text
/speckit.specify

Crie uma especificacao funcional e tecnica implementavel para consolidar
criacao e manutencao de credenciais no Cadastro de Usuarios do Laravel. Nao
implemente codigo durante /speckit.specify. Inspecione somente laravel/backend
e cite arquivos e linhas concretos.

Leia antes:

- /mnt/c/teclux_analysis/modules/administracao/acessos-menus-usuarios/README.md
- /mnt/c/teclux_analysis/modules/administracao/acessos-menus-usuarios/pesquisa-padroes-laravel.md
- /mnt/c/teclux_analysis/laravel/backend/app/Services/User/UsersService.php
- /mnt/c/teclux_analysis/laravel/backend/app/Http/Controllers/User/UsersController.php
- /mnt/c/teclux_analysis/laravel/backend/app/Http/Requests/User/StoreUserRequest.php
- /mnt/c/teclux_analysis/laravel/backend/app/Http/Requests/User/UpdateUserRequest.php
- /mnt/c/teclux_analysis/laravel/backend/resources/js/Pages/Cadastros/Users/UsersCadastroForm.tsx
- /mnt/c/teclux_analysis/laravel/backend/routes/console.php
- migrations e testes de usuarios, usuarios_auth e auditoria

Nao procure, solicite ou invente codigo Delphi. Classifique cada achado como
CONFIRMADO, INFERIDO, DUVIDA, NAO LOCALIZADO ou DIVERGENTE.

## Fronteira

Este prompt e o unico responsavel por:

- login e senha no Cadastro web;
- inclusao e alteracao de usuarios_auth;
- regularizacao de Usuario legado sem usuarios_auth;
- estado ativo/inativo e credencial;
- separacao de e-mails;
- remocao do comando auth:create-user;
- transacao, auditoria e testes de credenciais.

Nao crie segunda tela de credenciais, nao copie logica para o React e nao
crie outro service de autenticacao se UsersService puder ser estendido com
seguranca. Nao altere usuariosacessosmodulos nem a tela de grants.

## E-mails e identidade

Trate explicitamente os campos:

- usuarios.email: e-mail operacional legado, usado como conta de envio de
  XML em alguns cenarios. Pode ser compartilhado por varios Usuarios. O
  contrato nao pode impor unicidade nem usa-lo como login.
- usuarios_auth.email: e-mail separado da autenticacao. Fica fora deste
  ajuste. Preserve valores existentes e nao copie email_conta para ele.
- usuarios_auth.login: identificador obrigatorio e unico da autenticacao.

Se a listagem ou payload atual usar apenas a chave generica email e misturar
essas fontes, especifique a renomeacao ou separacao minima para tornar a
semantica explicita.

## Inclusao, alteracao e legados

Na inclusao, exigir login, senha, confirmacao e regras atuais de complexidade.
Na alteracao, senha vazia preserva a credencial existente; uma senha
preenchida substitui o hash. Se o Usuario legado nao tiver usuarios_auth,
exigir login, senha e confirmacao e criar a linha na mesma transacao.

Nao gerar senha automaticamente, nao retornar senha ou hash e nao registrar
segredos. A senha definida pelo administrador fica ativa imediatamente e
must_change_password permanece false por padrao. Validade e aviso seguem
diasvalidadesenha, diasavisosenha e expiracaosenha.

Usuario inativo nao autentica. Inativacao preserva usuarios_auth, grants e
auditoria e permite reativacao. O fluxo normal nao cria nem altera
credencial de Usuario inativo. Explique o comportamento atual e o menor
ajuste necessario sem apagar historico.

## Transacao, unicidade e auditoria

Inclusao e alteracao devem envolver usuarios, usuarios_auth, dados relacionados
do mesmo cadastro e auditoria em uma unica transacao. Erro de login duplicado,
validacao, concorrencia ou auditoria deve reverter o conjunto inteiro.

Audite operador, Usuario afetado, inclusao/alteracao, login anterior e novo
quando aplicavel, estado, resultado, timestamp e request/trace id. Nunca
registre senha, hash, token ou confirmacao. Reutilize DatabaseAuditContext e
os seams existentes; nao crie uma trilha paralela.

## Remocao do Artisan

Especifique a remocao de auth:create-user em routes/console.php e de suas
referencias e documentacao. O Cadastro web deve ser o unico caminho oficial.
Inclua verificacao de que o comando nao permanece publicado e que o fluxo web
cobre os casos que ele cobria: Usuario ativo, login ocupado, credencial ja
existente, credencial ausente e erro transacional.

## Saida esperada

Entregue:

- contrato de dominio para Usuario, credencial, login e e-mails;
- leitura do estado atual e divergencias com as decisoes fechadas;
- requests, controller, UsersService, React e payloads a reutilizar ou
  estender;
- regras de inclusao, alteracao, legado, inativacao e reativacao;
- migration somente se indispensavel, sem copiar e-mails operacionais;
- auditoria, concorrencia, transacao e tratamento de segredos;
- testes feature e de servico para sucesso, falhas, rollback, unicidade,
  legados, inativos, senha preservada e ausencia do comando;
- criterios de aceite e sequencia segura de implementacao.

Nao implemente. Se uma regra nao puder ser confirmada no Laravel, classifique
como DUVIDA/BLOQUEIO e nao solicite investigacao no Delphi.
```

