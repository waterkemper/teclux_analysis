# Pesquisa: parâmetros, autorizações, menu e padrões fiscais

Data da pesquisa: 23/08/2026

Escopo: `C:\projetos.vcl\biblio\clparametrossistema.pas`, as unidades Delphi da Consulta de Entrega de Produtos e do menu de Entregas, e as implementações Laravel já disponíveis no repositório. As citações abaixo apontam para a fonte e suas linhas. A pesquisa não altera fontes Delphi, mapa ou ticket.

## Conclusão executiva

Não foi localizado parâmetro de sistema específico da Consulta de Entrega de Produtos. A tela usa filtros operacionais (intervalo de datas, filiais, períodos e transportador), mas não chama `parametros_valor`, `ParSistema` nem uma autorização própria. Portanto, não há base para criar agora um manifesto de parâmetros para esta tela.

Também não foi localizada implementação Laravel de `ConsultaEntregaProdutos`. Há, porém, um padrão Laravel consolidado para o módulo irmão de Romaneios: catálogo Cloud com folha habilitada e rota existente, autorização explícita por usuário, middleware protegendo o grupo inteiro de rotas e negação quando catálogo, usuário ou rota não forem resolvidos. Esse é o padrão a reutilizar; os grants legados não devem ser inferidos nem copiados.

Há uma divergência de nomenclatura que precisa permanecer explícita:

* o ticket descreve `Entregas e Montagens → Entregas → Relatório de Entregas`;
* o menu Delphi contém `Entrega e Montagem → Entrega → Relatório de Entrega` e, como folha irmã, `Consulta de Entrega de Produtos`;
* o padrão Laravel recente usa os rótulos `Entregas e Montagens → Entregas → Romaneios`.

Esses nomes não provam que a Consulta de Entrega de Produtos deve ser registrada como Relatório de Entregas. A folha, rota e código do novo módulo precisam ser decididos separadamente.

## Evidência confirmada no Delphi

### Tela e consulta

`C:\projetos.vcl\apps\entrega\fmConsultaEntregaProdutos.pas:16-42` declara a tela com aba de parâmetros, intervalo de datas, listas de filiais de venda e produto, períodos de entrega, fornecedor de transporte, geração, gravação, contrato, grade e ações de pesquisa/exportação. A execução é feita em `sbnGerarClick`, que valida campos e chama o data module com esses filtros (`fmConsultaEntregaProdutos.pas:140-190`).

`C:\projetos.vcl\apps\entrega\fmConsultaEntregaProdutos.pas:216-238` confirma os atalhos existentes: F5 grava, F6 gera e F10 abre o contrato. Não há F9 nessa tela. A busca da grade é uma ação de popup (`fmConsultaEntregaProdutos.pas:428-434`), não um lookup acionado por F9.

`C:\projetos.vcl\apps\entrega\dmConsultaEntregaProdutos.pas:101-193` liga os parâmetros de intervalo, listas de filiais, períodos e fornecedores aos macros SQL e abre a consulta. A gravação altera diretamente dados fiscais/contratuais (`dmConsultaEntregaProdutos.pas:246-286` e `316-380`). Isso confirma que a autorização de leitura e, separadamente, a autorização de gravação terão de ser regras Laravel explícitas; não existe uma chamada de autorização embutida nessa unidade.

O SQL confirma a semântica operacional: contratos atuais com entrega habilitada, período de datas, filiais selecionadas e saldo ainda não entregue, descontando devoluções e quantidades fiscais (`C:\projetos.vcl\apps\entrega\dmConsultaEntregaProdutos.dfm:508-596`). Os macros localizados são filtros de consulta, não parâmetros de configuração do sistema (`dmConsultaEntregaProdutos.dfm:19-63`).

### `clparametrossistema.pas`

O mecanismo legado carrega valores da tabela `parametrosfiliais`, juntando a descrição em `parametros`, incluindo o valor global com filial `-1` quando não existe valor filial (`C:\projetos.vcl\biblio\clparametrossistema.pas:1889-1909`). A lista é lida por `TtecParametrosSistema.Ler`, que agrupa valores por nome e filial (`clparametrossistema.pas:3157-3195`).

Para leitura, `getAsString` tenta a filial corrente e só cai para o global quando `ValorGlobal` está habilitado (`clparametrossistema.pas:7139-7155`); `getAsBoolean` só considera verdadeiro o texto `true` (`clparametrossistema.pas:7076-7088`). A ausência de um item não cria um valor de negócio: `GetItemByName` registra erro para filial não zero e devolve objeto vazio (`clparametrossistema.pas:7300-7319`).

Esse comportamento é evidência do mecanismo genérico, não de uma dependência da Consulta. Na unidade concreta da tela e no respectivo DFM não foram encontrados `parametros_valor`, `ParSistema`, `acessosmodulos`, usuário, gerente ou autorização. A aba chamada “Parâmetros” é a aba de filtros da consulta (`fmConsultaEntregaProdutos.dfm:180-210`), não um manifesto de parâmetros de sistema.

### Menu e autorização legados

O DFM do menu registra, sob o grupo de Entregas, os seguintes itens (`C:\projetos.vcl\apps\tecsoft\fmtecsoft.dfm:576-614`):

* raiz: `Entrega e Montagem`;
* grupo: `Entrega`;
* folhas irmãs: `Relatório de Entrega` e `Consulta de Entrega de Produtos`.

`C:\projetos.vcl\apps\entrega\rgentrega.pas:10-20` registra as formas do relatório e da consulta, incluindo `TfrmConsultaEntregaProdutos`. O registro da forma permite ao mecanismo genérico reconhecer uma folha, mas não demonstra que um usuário específico tenha grant.

`C:\projetos.vcl\apps\tecsoft\fmtecsoft.pas:1351-1456` implementa a visibilidade genérica. A expressão considera forma registrada, usuário de suporte, administrador, item encontrado em `UsuarioLogin.AcessosUsuarios` ou `Tag=1`; depois aplica o resultado a `Visible`/`Enabled` (`fmtecsoft.pas:1408-1420`). Não foi localizado tratamento especial para `mitConsultaEntregaProdutos` ou `mitrelatorioentrega`.

`C:\projetos.vcl\biblio\clusuario.pas:332-344` carrega `nomemenu` de `acessosmodulos` a partir de grants diretos em `usuariosacessosmodulos` ou grants herdados por grupos. A lista do usuário corrente é carregada em `clusuario.pas:425-439` e aplicada em `clusuario.pas:612-625`. Isso confirma a existência do modelo legado direto + grupo, mas não localiza o registro/grant concreto desta tela.

## Ausências e limites da evidência

“Ausente” aqui significa não localizado no escopo concreto inspecionado; não significa que uma instalação Delphi ou banco externo nunca possa conter o item.

1. Não há chamada direta a `parametros_valor`, `ParSistema` ou parâmetro literal de sistema em `fmConsultaEntregaProdutos.pas`, `dmConsultaEntregaProdutos.pas` e seus DFMs.
2. Não há chamada direta a `acessosmodulos`, leitura de grant, gerente ou senha de autorização nessas unidades.
3. Não foi localizada linha de banco que conceda acesso a `Consulta de Entrega de Produtos` ou `Relatório de Entrega`; o código encontrado é o verificador genérico do menu.
4. Não foi localizada rota, controller, página, manifest de parâmetros ou lookup Laravel chamado `ConsultaEntregaProdutos`/`consulta-entrega-produtos`. Sob `resources/js/Pages/Entregas`, a implementação encontrada é de Romaneios.
5. Não há F9 no Delphi desta consulta e não há evidência de que a tela precise de chave de NF-e.
6. Não há `NfeAccessKey*` na unidade Delphi da consulta. Campos como documento fiscal, filial, série e número na projeção SQL não são uma chave de acesso de 44 dígitos.
7. A unidade irmã do Relatório de Entrega usa `AtribuirParametrosBaseRelatorio`, mas isso é preparação genérica de relatório e não prova parâmetro ou grant específico; a implementação dessa rotina não foi localizada no escopo (`C:\projetos.vcl\apps\entrega\dmrelatorioentrega.pas:45-54` e `70-152`).

## Padrão Laravel confirmado

### Menu e autorização fail-closed

`laravel/backend/app/Services/Menu/MenuService.php:14-18` estabelece que o menu Cloud só mostra item habilitado cuja rota exista; para usuário comum, a folha também precisa estar entre os módulos autorizados. `cloudTreeMenu` filtra por `teclux_cloud`, rota existente e grant da folha (`MenuService.php:228-253`, `268-287` e `337-398`). Grupos sem filhos visíveis não são exibidos (`MenuService.php:351-379`). O menu é uma projeção de autorização, não a autoridade final.

O serviço específico de Romaneios é a referência mais próxima:

* `laravel/backend/app/Services/Authorization/EntregasRomaneiosModuleAccessService.php:15-25` define rotas/rótulos da raiz, grupo e folha;
* usuário nulo nega, administrador passa e usuário comum precisa de item Cloud com rota exata e linha correspondente em `usuariosacessosmodulos` (`EntregasRomaneiosModuleAccessService.php:27-50`);
* `laravel/backend/app/Http/Middleware/EnsureEntregasRomaneiosModuleAccess.php:21-32` redireciona não autenticado e retorna 403 quando `canAccess` falha;
* `laravel/backend/routes/web.php:2047-2138` envolve páginas, capacidades, consultas, CRUD, operações, relatório, HTML e PDF no mesmo middleware.

A migration correspondente é idempotente, verifica duplicidade de raiz/grupo/folha e falha com catálogo ambíguo, sem replicar grants automaticamente (`laravel/backend/database/migrations/2026_08_01_305000_acessosmodulos_entregas_romaneios.php:10-20`, `22-42`, `65-84` e `101-123`). Esse é o contrato fail-closed recomendado para a nova folha: rota inexistente, catálogo ausente/ambíguo, usuário ausente, grant ausente ou middleware ausente devem negar.

Não se deve transformar o `Tag=1`, o bypass de suporte ou os nomes legados em autorização Laravel. Se o produto precisar de bypass administrativo, ele deve ser a regra explícita do serviço Laravel; o navegador e a existência do item no menu não podem conceder acesso.

### Filial e autoridade do servidor

`laravel/backend/app/Services/Branch/BranchContextService.php:10-35` obtém a filial ativa da sessão e, se necessário, resolve o nome no banco. `UserBranchAccessService.php:23-35` testa a relação usuário/filial; `UserBranchAccessService.php:42-75` e `79-128` carregam as filiais autorizadas; `UserBranchAccessService.php:130-171` rejeita filial inválida ou fora do escopo.

Logo, o contrato da consulta deve derivar o contexto de filial da sessão e validar no backend cada filial solicitada. IDs, grants, filtros ou capacidades enviados pelo browser são intenção/seleção, nunca autoridade. A query e cada operação de gravação/exportação/impressão devem reaplicar o escopo autorizado no servidor.

Se aparecer futuramente um parâmetro real, o padrão disponível é manifesto com descrições literais e leitura em lote por filial: `laravel/backend/app/Services/Parameter/ParameterService.php:14-26` e `117-173`, com a chamada legada em lote em `228-252`. O exemplo de manifesto explicita nomes, tipos e fallback (`laravel/backend/app/Services/Estoque/RequisicaoFiliais/RequisicaoFiliaisParameterManifest.php:14-24`, `33-42` e `55-77`). Para esta tela, a decisão correta hoje é não inventar tal manifesto.

### F9, modal e lookup

O componente `CatalogCodeLookup` documenta o modal no padrão F9 e o encaminha ao `ErpTwoColumnCatalogLookupModal` (`laravel/backend/resources/js/Components/lookup/CatalogCodeLookup.tsx:206-232`). O modal usa endpoint de servidor, contrato paginado e linha selecionada (`laravel/backend/resources/js/Components/erp/cadastro/ErpTwoColumnCatalogLookupModal.tsx:29-45` e `88-107`), restaura a sessão de busca ao reabrir (`:117-146`) e expõe mensagem explícita de permissão negada. O hook de atalhos captura F9 em fase de captura, previne o comportamento padrão e só chama a ação quando habilitada (`laravel/backend/resources/js/Components/erp/cadastro/useRegistryCadastroShortcuts.ts:3-4`, `21-71`). A documentação geral registra F9 como abertura do lookup e exige `preventDefault` (`laravel/backend/docs/atalhos.md:11-19`).

Isso é um padrão disponível para uma futura busca assistida, não evidência de que a Consulta de Entrega de Produtos precise de F9. Se F9 for adicionado, o endpoint deve autorizar a operação e restringir dados no servidor; o modal não deve aceitar uma lista ou permissão fornecida pelo cliente.

### Breadcrumb, atalhos e ícones

`laravel/backend/resources/js/Layouts/AppLayout.tsx:72` aceita breadcrumbs e os renderiza como trilha acessível em `AppLayout.tsx:978-1020`. A página de Romaneios usa rótulos de entrega sem depender de texto legado (`laravel/backend/resources/js/Pages/Entregas/Romaneios/Cadastro.tsx:585-594`). Para a nova tela, a folha escolhida deve aparecer como o último breadcrumb; não se deve misturar “Relatório de Entrega” com “Consulta de Entrega de Produtos`.

Para consultas, `ErpConsultaOperationBar` aceita ação, atalho, ícone, estado desabilitado e processamento (`laravel/backend/resources/js/Components/erp/consulta/ErpConsultaOperationBar.tsx:6-18`, `42-105` e `145-159`). `ConsultaRequisicoes/Index.tsx:22-31` usa ícones SVG locais e declara `Gerar F6` na barra (`:319-331`), um análogo útil para a operação de geração da consulta. Isso não autoriza transportar F10 ou criar um novo atalho: a tela Delphi confirma F5/F6/F10, enquanto a documentação Laravel alerta que F5 não deve ser usado como salvar por conflitar com atualização do navegador (`docs/atalhos.md:18`). Atalhos e ícones são affordances de UI; a autorização deve permanecer no servidor.

### `NfeAccessKey*`

Não há evidência dessa máscara na Consulta de Entrega de Produtos. O padrão fiscal Laravel existente deve ser citado somente se uma especificação futura introduzir uma chave de acesso:

* `laravel/backend/resources/js/lib/nfeAccessKey.ts:5-12` define 44 dígitos, segmentos Delphi `[2,4,14,2,3,9,1,8,1]` e estilos `spaced`/`delphi`; `:32-90` formata e `:92-125` calcula/valida o dígito verificador;
* `laravel/backend/app/Domain/Fiscal/NfeAccessKeyValidator.php:7-52` é a validação backend de comprimento, normalização e Mod-11;
* `laravel/backend/app/Domain/Fiscal/NfeAccessKey.php:7-35` encapsula a chave canônica somente em dígitos e rejeita valor inválido;
* `laravel/backend/resources/js/Components/erp/fiscal/NfeAccessKeyInput.tsx:22-42`, `44-62` e `154-176` fornece input numérico com normalização, validação no blur e Enter para localizar;
* `laravel/backend/resources/js/Components/erp/fiscal/NfeAccessKeyText.tsx:1-22` exibe a chave formatada, com estilo Delphi por padrão.

A implementação existente usa esses componentes em Romaneios, com validação adicional em controller/request; não é uma dependência descoberta da consulta. Se uma chave for incluída no futuro, o valor canônico e a validação do backend devem ser a autoridade, e a máscara visual não deve ser criada a partir de campos fiscais apenas parecidos.

## Contrato recomendado para a próxima implementação

1. Escolher explicitamente a folha: `Consulta de Entrega de Produtos` ou `Relatório de Entrega`; registrar uma única árvore Cloud sem usar o nome legado como inferência.
2. Criar a migration idempotente com verificação de rota única e catálogo não ambíguo. Não criar grants automáticos.
3. Implementar um serviço de acesso fail-closed e middleware no conjunto inteiro de endpoints, incluindo lookup, exportação, relatório, HTML/PDF e gravação.
4. Fazer o servidor resolver o usuário, grant Cloud, filial ativa e filiais autorizadas; rejeitar seleção fora do escopo e nunca confiar em autorização no browser.
5. Não criar manifesto de parâmetros até surgir evidência de uma descrição literal usada por esta tela. Quando surgir, usar leitura em lote por filial e diagnóstico explícito para parâmetro ausente.
6. Preservar somente atalhos com contrato confirmado. F9 e `NfeAccessKey*` são padrões disponíveis, não requisitos descobertos nesta pesquisa.

## Matriz de fontes

| Área | Evidência principal | Resultado |
|---|---|---|
| Parâmetros | `C:\projetos.vcl\biblio\clparametrossistema.pas:1889-1909`, `3157-3195`, `7139-7155` | mecanismo genérico filial/global; nenhuma dependência da consulta localizada |
| Consulta Delphi | `C:\projetos.vcl\apps\entrega\fmConsultaEntregaProdutos.pas:140-238`; `dmConsultaEntregaProdutos.pas:101-193` | filtros e atalhos F5/F6/F10; sem F9 ou autorização própria |
| Menu Delphi | `C:\projetos.vcl\apps\tecsoft\fmtecsoft.dfm:576-614`; `fmtecsoft.pas:1351-1456` | folhas irmãs e verificador genérico; nenhum grant específico localizado |
| Grants legados | `C:\projetos.vcl\biblio\clusuario.pas:332-344`, `425-439`, `612-625` | grants diretos e por grupo, sem prova de concessão desta folha |
| Menu Laravel | `laravel/backend/app/Services/Menu/MenuService.php:14-18`, `228-398` | folha Cloud só aparece com rota, habilitação e autorização |
| Acesso Laravel | `EntregasRomaneiosModuleAccessService.php:27-50`; middleware `:21-32`; rotas `web.php:2047-2138` | autorização de servidor e proteção de todos os endpoints |
| Filial | `BranchContextService.php:10-35`; `UserBranchAccessService.php:23-35`, `130-171` | contexto e escopo derivados/validados no servidor |
| F9/modal | `CatalogCodeLookup.tsx:206-232`; `ErpTwoColumnCatalogLookupModal.tsx:29-45`, `117-146` | lookup paginado, permission denied e restauração de sessão |
| Fiscal | `nfeAccessKey.ts:5-12`, `92-125`; `NfeAccessKeyValidator.php:7-52`; `NfeAccessKey.php:7-35` | padrão de 44 dígitos e validação backend; ausente na consulta |

