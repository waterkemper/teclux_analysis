# Administracao de acessos, menus, rotas e Usuarios no Laravel - prompts SpecKit

Label: wayfinder:map

## Destination

Produzir em modules/administracao/acessos-menus-usuarios/ um conjunto autoritativo e fatiado de prompts /speckit.specify para o Laravel: tela administrativa, disponivel somente a Administradores, para conceder acesso de Usuarios as folhas de modulos; organizacao coerente de menus e rotas com mapeamento explicito; e criacao/gestao das credenciais diretamente no Cadastro de Usuarios, substituindo a dependencia operacional do comando Artisan.

Os prompts devem ser autocontidos para execucao pelo Cursor, que nao tem acesso ao codigo Delphi. A entrega deste mapa e a rota de decisoes e, ao final, os prompts; nao e implementacao no checkout Laravel nem alteracao do Delphi.

## Notes

- Contexto: Plataforma Laravel e convivencia com o legado Delphi.
- Usar grilling, domain-modeling e research conforme o ticket; decisoes de negocio pertencem ao usuario e fatos devem ser confirmados no checkout Laravel.
- A fonte de implementacao disponivel para os prompts e laravel/backend; os prompts autoritativos devem ficar no diretorio raiz modules/..., seguindo o padrao ja existente.
- Nao pedir ao Cursor para procurar Delphi, nao inventar evidencia Delphi e nao transformar o exemplo legado em requisito nao confirmado.
- Vocabulario: Usuario e a identidade; Permissao e capacidade de acesso/acao; Autorizacao e aprovacao contextual. A tela administra concessoes de acesso a modulos, nao deve misturar automaticamente permissoes operacionais.
- Inventario resolvido: MenuService e a autoridade de leitura da arvore Cloud; o Cadastro de Usuarios ja sincroniza usuarios_auth; nao foi localizada tela/endpoint para gravar usuariosacessosmodulos; nao existe catalogo unico menu-rota-URL.
- Toda especificacao devera mandar inspecionar o Laravel vigente antes de escolher nomes, reaproveitar seams existentes, classificar CONFIRMADO, INFERIDO, DUVIDA, NAO LOCALIZADO e DIVERGENTE, e nao implementar durante /speckit.specify.

## Decisions so far

- [Inventariar padroes Laravel de acesso, menu, rotas e Usuarios](issues/01-inventariar-padroes-laravel-acesso-menu-usuarios.md) - O Laravel ja renderiza a arvore Cloud e sincroniza credenciais no Cadastro de Usuarios; a lacuna de grants nao possui tela/endpoint e nao existe catalogo unico menu-rota-URL.
- [Decidir a semantica da tela administrativa de acesso a modulos](issues/02-decidir-semantica-tela-acesso-modulos.md) - A primeira versao concede folhas diretamente a Usuarios, somente Administradores operam a tela, o grant protege o modulo efetivamente e cada diff e atomico, idempotente e auditado.
- [Decidir a organizacao canonica de menus e rotas](issues/03-decidir-organizacao-canonica-menu-rotas.md) - A reorganizacao sera incremental; o nome da rota Laravel sera a identidade em acessosmodulos.rota; URLs passam a seguir a convencao /cadastros/...; o legado /cloud/modulos/... sera removido; rotas filhas compartilham o grant da folha e migrations validam duplicidades e orfaos sem apagar concessoes silenciosamente.
- [Decidir a integracao de credenciais no Cadastro de Usuarios](issues/04-decidir-integracao-credenciais-no-cadastro-usuarios.md) - O Cadastro web sera o unico fluxo oficial; auth:create-user sera removido; usuarios.email continuara sendo o e-mail operacional compartilhavel do legado; usuarios_auth.email ficara fora deste ajuste; credenciais legadas serao regularizadas em transacao e com auditoria sem segredos.
- [Decidir o fatiamento e o contrato dos prompts SpecKit](issues/05-decidir-fatiamento-dos-prompts-speckit.md) - A entrega tera tres prompts em ordem 01 menus/rotas, 02 grants por Usuario e 03 credenciais, apoiados por README compartilhado; cada prompt tera fronteira propria e produzira especificacao sem implementar durante /speckit.specify.
- [Produzir e validar os prompts SpecKit de acessos, menus, rotas e Usuarios](issues/06-produzir-validar-prompts-speckit.md) - README e tres prompts foram publicados em modules/administracao/acessos-menus-usuarios/; estrutura, referencias, fences e diff documental foram validados.

## Not yet specified

O caminho ate a entrega de prompts esta concluido; nao ha outra decisao em
aberto neste mapa.

## Out of scope

- Alterar o Delphi ou exigir que o Cursor tenha acesso ao codigo Delphi.
- Implementar diretamente o Laravel durante o wayfinding.
- Redesenhar regras de negocio dos modulos ou criar uma nova camada de permissoes operacionais sem decisao especifica.
- Reescrever indiscriminadamente todas as URLs do sistema fora dos lotes e do catalogo aprovados.
