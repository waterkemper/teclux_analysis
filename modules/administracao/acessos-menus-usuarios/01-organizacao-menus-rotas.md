# Prompt para /speckit.specify - organizacao canonica de menus e rotas

```text
/speckit.specify

Crie uma especificacao funcional e tecnica implementavel para o primeiro lote
da reorganizacao de menus, rotas e autorizacao de modulos no Laravel. Nao
implemente codigo durante /speckit.specify. Inspecione somente
laravel/backend e cite arquivos e linhas concretos.

Leia antes:

- modules/administracao/acessos-menus-usuarios/README.md
- modules/administracao/acessos-menus-usuarios/pesquisa-padroes-laravel.md
- laravel/backend/app/Services/Menu/MenuService.php
- laravel/backend/routes/web.php
- laravel/backend/database/migrations relacionadas a acessosmodulos
- testes e middleware dos modulos que forem incluidos no lote

Nao procure, solicite ou invente codigo Delphi. Classifique cada achado como
CONFIRMADO, INFERIDO, DUVIDA, NAO LOCALIZADO ou DIVERGENTE.

## Fronteira

Este prompt e o unico responsavel por:

- catalogo de folhas e grupos em acessosmodulos;
- codigo estavel, codigo_pai, nome, ordem, habilitado e teclux_cloud;
- mapeamento entre arvore visual, nome de rota e URL;
- migrations idempotentes do catalogo;
- reorganizacao de rotas e protecao de todas as rotas filhas.

Nao crie tela de grants, nao grave usuariosacessosmodulos e nao altere a
politica de credenciais. Se uma lacuna impedir a implementacao, registre-a
como bloqueio para os prompts seguintes.

## Contrato canonico

Trate acessosmodulos.rota como o nome canonico da rota Laravel, nunca como
URL. A URL publica permanece declarada em routes/web.php. A mudanca visual, a
renomeacao da rota e a mudanca de URL devem aparecer como mudancas separadas na
especificacao e nos testes.

Implemente no lote o exemplo:

- Menu: Contas a Pagar -> Relatorios -> Contas a Pagar.
- URL: /cadastros/contas-pagar/relatorios/contas-a-pagar.
- Rota principal: contas_pagar.relatorios.contas_a_pagar.index.
- Rotas filhas: namespace previsivel para gerar, status, cancelar, retry,
  PDF, exportacao, download e lookup, com nomes concretos somente depois da
  inspecao do router e dos controllers atuais.

Remova, neste lote, as URLs /cloud/modulos/... e os nomes antigos envolvidos,
ajustando referencias internas, testes e frontend. Nao crie aliases ou
redirects permanentes. Nao reescreva URLs fora do lote aprovado.

## Catalogo e validacao

Especifique migrations rerunnable e idempotentes que:

- reutilizem uma linha existente somente quando sua identidade for inequivoca;
- criem grupos e folhas ausentes com codigo estavel;
- validem que toda folha concedivel tem rota nomeada existente;
- falhem de forma acionavel diante de rota inexistente, rota canonica
  duplicada ou catalogo ambiguo;
- diagnostiquem folhas sem pai valido como orfas e as mantenham fora da
  arvore visivel;
- preservem usuariosacessosmodulos e nunca removam concessoes
  silenciosamente;
- validem ordem e reparenting sem duplicar linhas em execucoes repetidas.

Explique como o catalogo sera consultado pela tela de grants sem quebrar
consumidores existentes de MenuService. Prefira um retorno hierarquico
adequado a selecao visual, preservando contratos existentes quando houver.

## Autorizacao de rotas filhas

Todas as rotas filhas da folha devem revalidar o mesmo acesso de modulo da
pagina principal, incluindo endpoints de geracao, acompanhamento,
cancelamento, retry, lookup, PDF, exportacao e download. O grant de modulo
nao substitui Policies ou abilities operacionais especificas. Administrador
tem bypass conforme a regra existente; Usuario comum precisa do grant efetivo.

Nao aceite protecao somente no item GET da pagina. Mostre no desenho de rotas
qual middleware ou service sera a autoridade para cada grupo de endpoints e
como evitar que uma rota auxiliar fique sem protecao.

## Compatibilidade e rollout

Defina inventario mecanico de referencias a URLs e nomes antigos antes da
mudanca. Como o sistema esta sem usuarios operacionais, a decisao e remover o
legado envolvido e atualizar referencias internas, sem compatibilidade
permanente. Inclua plano de rollback seguro para migration e documente efeitos
em bookmarks locais, testes e caches de rota.

## Saida esperada

Entregue:

- fronteira de dominio e vocabulario;
- catalogo de rotas e menus afetado, com fontes Laravel;
- tabela menu -> folha -> rota nomeada -> URL -> middleware;
- migrations idempotentes e diagnostico de inconsistencias;
- contratos de middleware, Policies ou services;
- sequencia segura de implementacao;
- testes de router, catalogo, menu filtrado, Administrador, Usuario sem grant,
  rotas filhas, duplicidade, orfao, rerun e rollback;
- criterios de aceite verificaveis;
- arquivos existentes a reutilizar e novos arquivos propostos.

Nao implemente. Se a especificacao precisar de uma decisao nao fechada,
registre DUVIDA/BLOQUEIO em vez de inventar uma regra Delphi.
```
