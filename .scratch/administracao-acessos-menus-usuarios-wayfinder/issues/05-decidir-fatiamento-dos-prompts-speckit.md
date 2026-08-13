# Decidir o fatiamento e o contrato dos prompts SpecKit

Type: grilling
Status: resolved
Blocked by: 02, 03, 04

## Question

Qual e o menor conjunto de prompts /speckit.specify, em ordem de execucao, que cobre integralmente a tela administrativa de acesso a modulos, a organizacao de menus e rotas e a integracao de credenciais no Cadastro de Usuarios sem duplicar services, middleware, catalogo de navegacao ou regras de seguranca?

## Answer

Decisoes confirmadas pelo usuario:

- O trabalho sera dividido em tres prompts de implementacao, cada um com fronteira funcional completa:
  1. 01-organizacao-menus-rotas.md;
  2. 02-acesso-modulos-por-usuario.md;
  3. 03-credenciais-no-cadastro-usuarios.md.
- A ordem recomendada e 01, 02 e 03. O primeiro estabelece o catalogo canonico e as folhas concediveis; o segundo reutiliza esse catalogo; o terceiro consolida o fluxo de credenciais web. O terceiro e tecnicamente independente, mas sera validado por ultimo.
- Deve existir README.md no diretorio dos prompts, com objetivo, limites, decisoes dos tickets 02 a 04, vocabulario, fontes Laravel, regra de nao investigar Delphi e ordem de execucao.
- O Prompt 01 sera o unico responsavel por rotas, URLs, catalogo acessosmodulos, arvore visual, migrations de menu e protecao das rotas filhas.
- O Prompt 02 sera o unico responsavel por listar folhas, conceder e revogar acessos, auditar alteracoes e autorizar a tela administrativa.
- O Prompt 03 sera o unico responsavel por credenciais, usuarios_auth, distincao de e-mails, Usuarios legados e remocao do comando Artisan.
- Nenhum prompt criara uma tabela paralela de permissoes ou reimplementara MenuService, UsersService ou Policies existentes sem justificar uma extensao.
- Cada prompt devera conter dependencias, arquivos de referencia, contratos HTTP/Inertia/React quando aplicavel, migrations, seguranca, testes de autorizacao e criterios de aceite do proprio escopo.
- Os prompts seguirao o padrao existente: iniciarao com /speckit.specify, nao implementarao codigo durante a especificacao, inspecionarao somente o Laravel acessivel, citarao arquivos e linhas concretos e classificarao evidencias como CONFIRMADO, INFERIDO, DUVIDA, NAO LOCALIZADO ou DIVERGENTE.
- O Cursor devera registrar bloqueios e divergencias em vez de inventar comportamento Delphi ou solicitar acesso ao codigo Delphi. A saida esperada e uma especificacao implementavel, nao uma alteracao no checkout.

