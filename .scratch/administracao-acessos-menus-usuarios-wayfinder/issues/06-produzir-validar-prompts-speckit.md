# Produzir e validar os prompts SpecKit de acessos, menus, rotas e Usuarios

Type: task
Status: resolved
Blocked by: 05

## Question

Com o fatiamento decidido, produzir em modules/administracao/acessos-menus-usuarios/ os prompts /speckit.specify autoritativos, autocontidos e rastreaveis. Validar que cada requisito de acesso administrativo, arvore de menu, mapeamento menu-rota-URL, compatibilidade, criacao de credenciais, comando Artisan, auditoria, seguranca e testes esteja ligado a uma decisao ou evidencia Laravel.

## Answer

Artefatos publicados:

- README.md: contexto compartilhado, ordem de execucao, decisoes fechadas,
  fontes Laravel, classificacao de evidencia e contrato de saida.
- 01-organizacao-menus-rotas.md: catalogo canonico, arvore visual,
  normalizacao de rotas e URLs, remocao do lote /cloud/modulos/...,
  migrations idempotentes e protecao de rotas filhas.
- 02-acesso-modulos-por-usuario.md: tela exclusiva de Administradores,
  folhas concediveis, grants diretos, diff transacional, concorrencia,
  auditoria e contratos HTTP/Inertia/React.
- 03-credenciais-no-cadastro-usuarios.md: credenciais no Cadastro web,
  Usuarios legados, separacao de usuarios.email e usuarios_auth.email,
  inativacao, auditoria e remocao de auth:create-user.

Validacoes executadas:

- Os quatro arquivos existem no diretorio autoritativo.
- Os tres prompts possuem fences Markdown balanceados.
- As referencias principais ao Laravel e a pesquisa consolidada existem.
- Nenhum dos quatro arquivos possui caractere nao ASCII corrompido.
- git diff --check passou no escopo dos prompts e do mapa.

Os prompts mandam o Cursor inspecionar o Laravel vigente, citar arquivos e
linhas, classificar evidencia, nao investigar Delphi e nao implementar durante
/speckit.specify. As fronteiras entre menu/rotas, grants e credenciais estao
explicitas para evitar services ou tabelas paralelas.

