# Mapear componentes e capacidades existentes no Laravel

Type: task
Status: resolved
Blocked by:

## Answer

### Conclusão

`CONFIRMADO` — Não existe no Laravel uma página denominada **Consulta de Estoques** nem um endpoint que reproduza diretamente o form Delphi. O ativo mais próximo é **Análise de Estoques**, em `/cadastros/estoque/analise-estoques`, que já entrega a fundação transversal necessária: tela Inertia/React, Gerar por `F6`, filtros por cadastro, Filiais autorizadas, validação versionada, compilação SQL com binds, execução pesada assíncrona/cancelável, paginação, grid configurável, preferências e exportação (`routes/web.php:1495-1516`; `AnaliseEstoquesController.php`; `Pages/Cadastros/Estoque/AnaliseEstoques/Index.tsx`).

`DIVERGENTE` — Análise de Estoques é relatório analítico por intervalo de datas, vendas, estoque, pedidos, margem e Fornecedor; não possui as perspectivas operacionais Delphi de Lotes/Similares/Grade/Componentes com painel de Estoques, Financeiro, Acumuladores, Preços, Pedidos, Fornecedores e Licitações. Deve ser fonte de componentes e arquitetura, não ser renomeada ou adaptada destrutivamente.

### Capacidades reutilizáveis

| Capacidade Laravel | Contrato comprovado | Reuso na Consulta de Estoques | Limitação/lacuna |
|---|---|---|---|
| `AnaliseEstoques/Index.tsx` | Abas **Parâmetros/Dados**, operação Gerar `F6`, cancelar, banner de processamento, estado stale quando filtros mudam e mensagens de validação/erro | Shell e ciclo Gerar → resultado | Resultado atual é relatório temporal; Consulta precisa master-detail e detalhes sob demanda |
| `ProductFilterPanel` | Regras por aba com `E/OU`, flag “exceto”, lookup remoto e modo compacto/embedded | Substitui os frames Delphi de seleção múltipla | Abas atuais: item, Produto, Grupo, Classe, Marca, Promoção, CSOSN, CST, NCM, Lotes e Atributos; faltam Modelo, Especificação e Localização de Estoque (`ProductFilterTabSets.php:13-51`) |
| `SupplierFilterPanel` | Abas Fornecedor e Grupo de Fornecedor, regras/operadores e “exceto” | Reutilizável se filtros de Fornecedor forem desejados; também atende consultas futuras | Não existe filtro Delphi equivalente no topo da Consulta atual; não deve ser incluído só porque existe |
| `AuthorizedFiliaisCheckList` | Seleção múltipla normalizada, lookup paginado e somente Filiais autorizadas | Melhor equivalente ao lookup de Filial; evita acesso amplo legado | Delphi escolhe uma Filial opcional; contrato Laravel atual é múltiplo e vazio tem semântica perigosa |
| `ConsultaFilterSection`, `EntitySelectionCheckList`, `EntitySelectionTabPanel` | Contêineres compactos, contagem ativa, estado readonly e seleção remota | Composição visual dos filtros sem copiar o layout Delphi | Exige novos catálogos/lookups para Modelo, Especificação e Localização |
| `GerarAnaliseEstoquesRequest` | Payload v1, datas válidas, máximo de 100 regras, operadores `eq/neq/gt/gte/lt/lte/contains`, conectores `and/or`, valida campo+operador e Filiais solicitadas | Padrão de FormRequest e payload versionado | Consulta Delphi não requer intervalo de datas nem filtro de compostos global; precisa request próprio (`GerarAnaliseEstoquesRequest.php:31-82,137-205`) |
| Compiladores `AnaliseEstoques*FilterCompiler` | Fragments SQL com binds, composição `AND` entre abas, `E/OU` dentro da aba, `EXISTS/NOT`, suporte fiscal/lotes/atributos | Base direta para filtros de Produto e Fornecedor; já reutilizada por Movimentação Diária, Curva ABC, Consulta Contratos e Marketplace | Não cobre todas as macros Delphi; deve ser estendido por composição, sem injetar SQL vindo do browser |
| Geração pesada | Job assíncrono, status/polling, cancelamento por usuário e cancelamento da query PostgreSQL; classifica timeout, SQL error e cancelamento | Apropriado para Gerar mestre quando filtros forem amplos | Detalhes por aba devem ser endpoints menores sob demanda, não novos jobs para cada clique |
| `ErpPreferenceDataGrid` | Readonly/editável, ordenação, busca global, seletor de colunas, resize/reorder, persistência, atalhos `Ctrl+F`, `Alt+G`, exportação `Ctrl+X` | Grid mestre e grids secundárias | Catálogo atual de Análise não corresponde às colunas Delphi; criar screen/grid IDs próprios |
| Grid catalog/export | Catálogo server-side versionado; colunas hideable/resizable/reorderable/exportable; export sync ou job acima de 5.000 linhas | Infraestrutura pronta para catálogo e eventual exportação | Exportação não é paridade Delphi comprovada; se adotada, classificar `OPORTUNIDADE`, não requisito |
| Help screen filters | Snapshot dos filtros gerados e formatados para ajuda/suporte | Diagnóstico da consulta e suporte operacional | Não substitui persistência de filtros do usuário |

### Análise de Estoques existente

`AnaliseEstoquesController@index` fornece defaults dos últimos três meses, `compostos=todos`, Filiais vazias, catálogo do grid, Filiais autorizadas, tabs de Produto e endpoints (`AnaliseEstoquesController.php:59-104`). `Index.tsx` combina:

- `SimpleDateRangeFieldset`;
- radio de compostos;
- `AuthorizedFiliaisCheckList`;
- `ProductFilterPanel` e `SupplierFilterPanel`;
- `ErpConsultaOperationBar`, `ErpConsultaGerandoBanner` e tabs ERP;
- `AnaliseEstoquesDadosGrid` baseado em `ErpPreferenceDataGrid`.

O retorno é paginado (default 100) e possui Produto/Item/Referência/Grades/Grupo/Marca, composto, curva ABC, estoque total, pedido, promoção, vendas mensais e agregadas, dias/valor de estoque, Fornecedor/última entrada, preços/custos/margens (`types/analiseEstoques.ts:12-51`; `AnaliseEstoquesGridCatalog.php:27-66`). Colunas mensais são dinâmicas. A exportação usa contexto vinculado ao Usuário e escolhe síncrona ou fila (`AnaliseEstoquesController.php:145-259`; `AnaliseEstoquesExportService.php:24-127`).

Testes comprovam: bloqueio sem acesso, bypass de Administrador, lookup limitado às Filiais autorizadas, validação de intervalo até 24 meses, rejeição de Filial não autorizada, shape dinâmico, job/poll, cancelamento, timeout e exportação (`AnaliseEstoquesAccessTest.php`; `AnaliseEstoquesGerarTest.php`; `AnaliseEstoquesGerarAsyncTest.php`; `AnaliseEstoquesGerarCancelTest.php`; `AnaliseEstoquesGerarTimeoutTest.php`; `AnaliseEstoquesGridExportTest.php`).

### Lookups e filtros disponíveis

- `CONFIRMADO` — `lookupFiliais` aceita busca, paginação até 100, ordenação e campo de busca, consulta apenas códigos retornados por `UserBranchAccessService` (`AnaliseEstoquesController.php:262-334`).
- `CONFIRMADO` — `lookupProductEntity` atende as 11 tabs; Lotes delega para `ConsultaContratosLoteLookupService`, Atributos pagina `atributos_produtos`, as demais usam `ConsultaContratosFilterEntityLookupService` (`AnaliseEstoquesController.php:336-376,398-439`).
- `CONFIRMADO` — `lookupSupplierEntity` atende Fornecedor e Grupo via `ConsultaContratosSupplierFilterLookupService` (`AnaliseEstoquesController.php:378-396`).
- `CONFIRMADO` — `ProductFilterFieldOperatorRegistry`, `SupplierFilterFieldOperatorRegistry` e normalizers impedem combinações campo/operador não suportadas; os compiladores produzem SQL e binds no servidor.
- `NÃO LOCALIZADO` — Lookup compartilhado pronto para Modelo de Produto, Especificação de Modelo e Localização de Estoque com o contrato do painel atual. Os cadastros/tabelas existem, mas essas três tabs precisarão de adaptadores/catalogação.

### Permissões, Filiais e Autorizações

- `CONFIRMADO` — `AnaliseEstoquesPolicy::viewAny` delega ao acesso do módulo; controller, request, lookup, geração e exportação autorizam no servidor (`AnaliseEstoquesPolicy.php`; `AnaliseEstoquesController.php:59-61,107-112,121-262,336-396`).
- `CONFIRMADO` — O módulo usa a rota/folha `estoque.analise-estoques.index`; Administrador acessa sem grant explícito, demais Usuários precisam de acesso. Isso é superior ao gate visual Delphi e é o padrão a copiar com uma folha própria para Consulta (`AnaliseEstoquesAccessTest.php`).
- `CONFIRMADO` — Filial explicitamente informada fora do conjunto autorizado recebe 422 (`GerarAnaliseEstoquesRequest.php:137-159`; teste `test_gerar_422_for_unauthorized_filial`).
- `DIVERGENTE / RISCO DE SEGURANÇA` — Filiais ausentes/vazias significam **sem filtro SQL**, não “todas as Filiais autorizadas”. O comportamento está documentado no próprio service e testado por `test_gerar_without_filiais_does_not_apply_filial_sql_filter` (`EstoqueAnaliseEstoquesModuleAccessService.php:55-85`; `AnaliseEstoquesGerarTest.php`). A Consulta nova não deve copiar isso: vazio deve resolver para FilialBase ou conjunto autorizado conforme decisão de paridade, nunca para acesso global implícito.
- `NÃO LOCALIZADO` — Ability Laravel equivalente a `GerenteEstoque` aplicada aos campos financeiros/fornecedores ou às escritas desta futura consulta. O cadastro de Usuário pode conter o legado, mas a nova tela exigirá abilities explícitas e server-side.
- `CONFIRMADO` — Existe infraestrutura de Autorização sensível (`SensitiveOperationAuthController` e requests de proof), mas nenhuma evidência de que seja necessária para as operações Delphi; só reutilizar se uma decisão funcional exigir reautenticação.

### Cadastros e serviços de Produto já existentes

`CONFIRMADO` — O cadastro Laravel de Produto/Característica já possui serviços, endpoints e testes para grande parte das dependências que o Delphi apenas consulta:

| Dependência | Ativos reutilizáveis | Evidência |
|---|---|---|
| Estoques por Filial | `ProdutoEstoquesTabReadService`/`WriteService`, endpoints index/store/update | `ProdutoCaracteristicaController.php`; `ProdutoEstoquesTabListTest.php`, `ProdutoEstoquesTabWriteTest.php` |
| Lotes | `ProdutoLotesTabReadService`/`WriteService` | testes de list/store/update/delete de Lotes |
| Similares | `ProdutoSimilaresService`, similares por Característica e por Item | rotas `similares-caracteristicas` e `similares-itens`; testes do cadastro |
| Composição | `ProdutoComposicaoTabReadService`/`WriteService`, regras contra ciclos e preço normal | rotas `composicao.*`; `ProdutoComposicaoTabTest.php` |
| Preços e cargos | `ProdutoPrecosTabReadService`/`WriteService`, `ProdutoPrecosCargosTabReadService`/`WriteService`; parâmetro `ProdutosPrecosPorCargoParameter` | rotas `precos.*`; testes avançados e de cargos |
| Preço por Cliente | `ProdutoClientesProdutosTabReadService`/`WriteService` | rotas `clientes-produtos.*`; testes list/write |
| Fornecedores | serviços de cadastro e unidades do Fornecedor por Produto | rotas `produtos-fornecedores-*`; testes correspondentes |
| Grade e atributos | `ProdutoGradeStructureService`, `AgrupamentoGradeUiMapper`, serviços de Itens/Atributos | serviços em `app/Services/Estoque`; `AgrupamentoGradeUiMapperTest.php` |
| Fotos | `ProductPhotosController` e `ProductPhotoGalleryModal` com estado vazio/testes | rota `/cadastros/produtos/{produto}/fotos`; componentes `Components/product/*` |

Esses são contratos de dependência: a Consulta deve lê-los/navegar para eles, não criar cadastros duplicados. Porém os serviços de abas são orientados ao cadastro de uma Característica e não constituem uma query mestre de Consulta de Estoques; adaptar endpoints de leitura, evitando acoplar a nova tela aos endpoints de escrita do cadastro.

### Integrações externas já existentes

- **Fotos:** `ProductPhotoGalleryModal` + `ProductPhotosController` já são usados em Orçamentos, Marketplace e Conferência. Reuso direto para o Produto selecionado; há testes de UI/controller.
- **Venda Perdida:** existe módulo completo, `VendaPerdidaCaptureModal`, endpoint `opening`, lookups e CRUD/capture com authorization service e invariantes (`routes/web.php:1902-1912`; `VendaPerdidaCaptureFeatureTest.php`). O contrato aceita contexto de origem; para paridade estrita, abrir sem pré-preencher Produto, pois o Delphi envia apenas `['Incluir']`.
- **Pedido:** o cadastro e consulta de Orçamentos/Pedidos já existem, mas não foi localizado neste levantamento um helper universal de “abrir Pedido por número” equivalente ao shell Delphi. A nova tela deverá usar a rota canônica existente após confirmar seu parâmetro, não duplicar o cadastro.
- **Histórico de notas do Produto:** existem informações fiscais e serviços de Produto, mas `NÃO LOCALIZADO` um componente/endereço Laravel que corresponda diretamente a `ConsultaProdutosNotasFiscaisAnteriores(CodigoNota, Produto)`. É lacuna de integração a tratar na matriz.

### Repositories e SQL

- `LegacyAnaliseEstoquesRepository` já executa a consulta montada e suporta contagem/paginação/exportação; `AnaliseEstoquesSqlAssembler` lê template SQL versionado, `AnaliseEstoquesSqlFragmentRenderer` renderiza fragments controlados e `AnaliseEstoquesRowMapper` normaliza a saída.
- `CONFIRMADO` — A arquitetura evita receber fragments SQL do frontend: o payload contém regras estruturadas, validadas e compiladas com binds. Esse deve ser o padrão para substituir as macros Delphi.
- `CONFIRMADO` — Compiladores de Produto são efetivamente compartilhados por Análise, Movimentação Diária, Curva ABC, Consulta de Contratos e Marketplace, com testes unitários específicos. Extensões para Modelo/Especificação/Localização devem aprofundar esse módulo compartilhado.
- `DIVERGENTE` — As funções e cálculos da Consulta Delphi (saldos por tipo, pedidos pendentes, promoções, custo médio, lotes, similares, licitações etc.) não estão reunidos em repository Laravel equivalente. Alguns dados existem nos serviços/cadastros, mas a orquestração master-detail é uma lacuna real.

### Decisão de reuso

1. Criar página/rota/policy próprias para **Consulta de Estoques**, mantendo **Análise de Estoques** intacta.
2. Reutilizar shell de consulta, operação Gerar/cancelar, filtros estruturados, lookups autorizados, compiladores, grid catalog/preferences e infraestrutura de jobs apenas onde o custo justificar.
3. Reutilizar os cadastros de Produto, Lotes, Similares, Composição, Preços, Cliente, Fornecedores e Fotos como dependências existentes.
4. Criar query/service master-detail próprios e endpoints sob demanda para cada detalhe; não tentar encaixar os resultados Delphi no dataset temporal de Análise.
5. Corrigir por desenho a semântica de Filial vazia e proteger dados financeiros/escritas no backend.
6. Tratar exportação/persistência de layout como `OPORTUNIDADE` Laravel já disponível, separada da paridade obrigatória.

## Original question

Quais páginas, componentes de filtro, lookups, grids, serviços, repositories, compiladores SQL, controles de geração, permissões, cadastros e integrações já existentes no Laravel podem atender à Consulta de Estoques, e quais são seus contratos e limitações comprovados no código e nos testes?
