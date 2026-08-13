# Prompt para /speckit.specify - acesso a modulos por Usuario

```text
/speckit.specify

Crie uma especificacao funcional e tecnica implementavel para a tela
administrativa de concessao de acesso a modulos por Usuario no Laravel. Nao
implemente codigo durante /speckit.specify. Inspecione somente laravel/backend
e cite arquivos e linhas concretos.

Leia antes:

- modules/administracao/acessos-menus-usuarios/README.md
- modules/administracao/acessos-menus-usuarios/pesquisa-padroes-laravel.md
- resultado e catalogo canonico produzido pelo prompt
  01-organizacao-menus-rotas.md
- laravel/backend/app/Services/Menu/MenuService.php
- laravel/backend/app/Services/Authorization/UsersModuleAccessService.php
- laravel/backend/app/Http/Middleware/EnsureUsersModuleAccess.php
- laravel/backend/app/Services/Authorization/UsersActionAuthorizationService.php
- laravel/backend/app/Policies/UsuarioPolicy.php
- migrations de acessosmodulos e usuariosacessosmodulos
- padroes de Inertia, React, requests, auditoria e testes do Users module

Nao procure, solicite ou invente codigo Delphi. Classifique cada achado como
CONFIRMADO, INFERIDO, DUVIDA, NAO LOCALIZADO ou DIVERGENTE.

## Fronteira

Este prompt e o unico responsavel por:

- tela web para selecionar um Usuario e visualizar folhas concediveis;
- leitura hierarquica do catalogo canonico;
- concessao e revogacao direta em usuariosacessosmodulos;
- service transacional, concorrencia, auditoria e respostas HTTP;
- autorizacao exclusiva de Administradores para ler e gravar a tela;
- testes de acesso e de regressao do menu filtrado.

Nao crie uma tabela paralela, grupos de Usuarios ou permissoes operacionais
novas. Nao renomeie rotas nem altere o Cadastro de credenciais, salvo uma
integracao minima explicitamente justificada.

## Regra de autorizacao

Somente Usuario autenticado com administrador verdadeiro pode acessar
listagem, detalhe, leitura do catalogo ou escrita de grants. A verificacao
deve ser server-side e nao pode depender de esconder botao no React.

Administrador tem bypass absoluto para modulos Cloud e nao e editado pela
tela de grants. Nao permitir que a tela de grants conceda, remova ou altere
capacidade administrativa. Acesso a users.cadastro nao e suficiente para
operar esta tela.

O alvo e um Usuario por edicao. A primeira versao nao inclui grupos nem
operacao em massa. Usuarios ativos e inativos podem ser selecionados, com
filtro ativo como padrao. Inativar um Usuario nao remove seus grants.

## Catalogo e interface

Use somente folhas Cloud ativas, com rota nomeada existente e sem
ambiguidade. Grupos e hubs aparecem como estrutura visual, mas nao sao
selecionaveis. Um hub exclusivo deve ser modelado como folha no catalogo.

Reaproveite MenuService e seus seams sem quebrar consumidores. Especifique
um read model hierarquico ou uma extensao compativel que entregue codigo,
nome, pai, ordem, rota, estado, selecionavel e concedido. A UI deve deixar
claro quais folhas ja estao concedidas e quais foram alteradas.

Defina contratos de:

- GET Inertia para a pagina, Usuario alvo e arvore de folhas;
- endpoints de busca ou lookup, se forem necessarios;
- POST/PATCH/PUT para substituir o conjunto desejado de folhas;
- erros de validacao, 403, 404 e 409;
- confirmacao visual com resumo adicionado/removido;
- retorno de sucesso com o estado persistido, nao com estado otimista.

## Persistencia e transacao

Use usuariosacessosmodulos com sua chave existente usuario + acesso.
Concessao e revogacao devem ocorrer em uma unica transacao, com lock e
releitura do estado quando necessario. O diff deve ser:

- atomico: falha desfaz todas as alteracoes;
- idempotente: repetir o mesmo conjunto nao cria novas linhas nem auditoria;
- concorrente: versao ou fingerprint stale retorna 409 e exige recarregar;
- validado: folhas inativas, invalidas, orfas, sem rota ou ambiguas nao
  podem receber novo grant;
- conservador: linhas antigas inconsistentes nao sao apagadas
  silenciosamente; ficam diagnosticadas, somente leitura e sem acesso efetivo.

Um grant e autorizacao efetiva do modulo. Toda pagina e rota filha deve
revalidar esse mesmo grant. Policies ou abilities de acao continuam sendo
regras separadas e nao devem ser inferidas da existencia do grant.

## Auditoria e seguranca

Registre um evento por diff real com operador, Usuario alvo, folhas
adicionadas e removidas, estado anterior e posterior, timestamp,
request/trace id e resultado. Nao registre senha, hash, token ou segredo.
Nao gere evento em no-op. Defina como uma falha de auditoria afeta a
transacao e como erros nao vazam existencia indevida de dados.

## Saida esperada

Entregue:

- modelo de dominio e invariantes;
- contratos HTTP, Inertia e React;
- service/repository/request/middleware/policy propostos, distinguindo o que
  ja existe do que deve ser estendido;
- estrategia de lock, diff, idempotencia e concorrencia;
- migration somente se necessaria, sem tabela paralela;
- matriz de autorizacao para Administrador, Usuario autorizado, Usuario sem
  grant, Usuario inativo e anonimo;
- testes de feature, middleware, policy, transacao, auditoria, no-op, 409,
  folhas invalidas e rotas filhas;
- criterios de aceite verificaveis e sequencia de implementacao.

Nao implemente. Se houver conflito entre o checkout e uma decisao fechada,
registre a divergencia e especifique a correcao minima.
```

