# Pesquisa de padroes Laravel para Consulta de Entrega de Produtos

Status: concluida  
Tipo: pesquisa de repositorio  
Escopo: localizar seams reutilizaveis no checkout Laravel e nos modulos gerados, com foco em grid, relatorio/read model, fotografia, F6, F9, persistencia de edicao e schema.  
Fontes primarias: codigo Laravel, testes Feature, documentacao de arquitetura e notas de pesquisa dos modulos `relatorio-entregas` e `cadastro-romaneios`.

Esta nota nao altera fontes Delphi, o mapa Wayfinder ou o ticket da pesquisa.

## Conclusao executiva

| Area | Seam reutilizavel | Limite ou lacuna para este modulo |
| --- | --- | --- |
| Grid | `GridColumnCatalog` + `ErpPreferenceDataGrid` + `useErpGridPreferences` + `ErpGridExport` | O catalogo precisa de `gridId`, `screenKey`, `schemaVersion`, allowlist de ordenacao e colunas autorizadas proprios. Preferencias nao sao persistencia de negocio. |
| Read model | Repositorio paginado com query base, ordenacao allowlistada e enriquecimento em lote | Nao fazer N+1. O read model de Entregas deve ser definido antes de montar SQL e precisa distinguir consulta de fotografia de relatorio. |
| Relatorio | `ConsultaRequisicoesRelatorioService` e `ErpReportLayoutService` fornecem shell/PDF; o materializer de Contas a Pagar fornece o padrao de fotografia, integridade e expiracao | Nao existe um snapshot de relatorio especifico para Consulta de Entrega de Produtos. Deve-se definir contrato, `data_as_of`, criterios, autorizacao, hash, expiracao e paridade com o grid. |
| Fotografia | `ProductPhotoService` e `ConsultaRequisicoesPhotoEnricher` fazem coleta de IDs, cache por requisicao e batches | Ha limite de produtos e chunk de 400. A URL da foto nao deve virar uma consulta por linha nem ser tratada como dado imutavel sem definir sua validade. |
| F6 | `PgsqlGerarQueryRunner` registra PID/trace antes do SQL; endpoint chama `pg_cancel_backend`; hook envia cancelamento antes do abort local | O estado `busy` e o trace precisam existir antes do primeiro `await postGerar`. `AbortController` sozinho nao cancela o SQL no PostgreSQL. Teste de driver/skip nao satisfaz o contrato deste ticket. |
| F9 | `useRegistryCadastroShortcuts` + `ErpTwoColumnCatalogLookupModal` | Usar endpoint e politica de acesso do produto; nao copiar modal ad hoc nem consultar tabela diretamente no componente. |
| Edicao | Commands de Romaneios com idempotencia, revisao esperada, transacao e 409 de conflito | `EditableDataGrid`/preferencias nao substituem commandos de dominio. Se a consulta for read-only, nao inventar persistencia de celula. |
| Schema | Snapshot PostgreSQL datado + manifest com SHA e regras de fail-fast | Nao usar `hasTable`, `Schema::has*`, `information_schema`, `pg_catalog` ou teste condicional de driver no caminho de negocio/aceite deste modulo. Ainda falta capturar o snapshot proprio do produto. |

## 1. Grid: catalogo, preferencias, ordenacao e exportacao

O contrato de coluna e explicito e inclui o que a tela precisa para layout e exportacao: identificador, campo de dados, visibilidade, ordem, dimensoes, flags de reordenacao/resize, exportabilidade, formato, sensibilidade e autorizacao. A fonte e `laravel/backend/app/Support/ErpGrid/GridColumnDefinition.php:L7-L26`, com serializacao em `:L31-L50`.

O catalogo de servidor centraliza identidade da tela, `schemaVersion`, colunas exportaveis e filtragem de colunas autorizadas: `laravel/backend/app/Support/ErpGrid/GridColumnCatalog.php:L9-L20`, `:L25-L31` e `:L47-L92`. Um exemplo de uso real e `laravel/backend/app/Support/ErpGrid/Catalogs/ConsultaTransferenciasGridCatalog.php:L10-L25`, `:L30-L65` e `:L68-L92`. O catalogo TypeScript correspondente declara `schemaVersion` e o contrato de preferencias em `laravel/backend/resources/js/Components/erp/data-grid/catalog/types.ts:L1-L58`; o exemplo de Consulta Transferencias esta em `laravel/backend/resources/js/Pages/Interlojas/ConsultaTransferencias/consultaTransferenciasGridCatalog.ts:L4-L6`, `:L8-L41`, `:L43-L66` e `:L124-L132`.

Para Consulta de Entrega de Produtos, o catalogo deve nascer com uma lista fechada de colunas e uma allowlist de ordenacao. A ordenacao de Consulta Transferencias valida campo e direcao, aplica expressao SQL somente a partir da allowlist e acrescenta desempate deterministico: `laravel/backend/app/Application/Interlojas/ConsultaTransferencias/ConsultaTransferenciasOrdenacao.php:L12-L20`, `:L49-L71`, `:L79-L104` e `:L117-L152`. O ramo especial para SQLite em `:L191-L198` e uma divergencia existente; nao deve ser usado para relaxar o contrato PostgreSQL deste modulo.

As preferencias sao por usuario/tela, possuem revisao e usam concorrencia otimista no repositorio `laravel/backend/app/Infrastructure/Persistence/Preferences/UserScreenPreferencesRepository.php:L11-L20`, `:L24-L40` e `:L45-L101`. O hook le e salva a secao com `expectedRevision` em `laravel/backend/resources/js/Components/erp/data-grid/useErpGridPreferences.ts:L22-L30`, `:L75-L135` e restaura defaults em `:L309-L346`. O layout so aceita IDs conhecidos pelo catalogo e salva sua `schemaVersion`: `laravel/backend/resources/js/Components/erp/data-grid/useErpGridLayout.ts:L126-L214`.

O componente composto ja integra preferencias, layout e exportacao: `laravel/backend/resources/js/Components/erp/data-grid/ErpPreferenceDataGrid.tsx:L9-L34` e `:L92-L149`. O shell tambem controla atalhos de grade e o estado travado: `laravel/backend/resources/js/Components/erp/data-grid/ErpGridShell.tsx:L17-L44` e `:L83-L186`. Exportacao deve resolver contexto no servidor e respeitar o mesmo usuario; o orquestrador limita a execucao sincrona a 5.000 linhas: `laravel/backend/app/Services/Erp/GridExportOrchestrator.php:L9-L47`.

Seam recomendado para este modulo:

1. Definir `gridId`, `screenKey`, `schemaVersion`, colunas e allowlist de ordenacao no catalogo.
2. Passar o catalogo ao `ErpPreferenceDataGrid`; tratar preferencias como layout por usuario, nunca como regra de negocio.
3. Reusar o exportador com o contexto filtrado/autorizado do servidor e o limite sincrono existente.
4. Incrementar `schemaVersion` quando a forma do grid mudar; IDs desconhecidos devem ser descartados pelo resolvedor de layout.

## 2. Read model, relatorio e fotografia

O repositorio de Consulta Transferencias e o melhor exemplo de read model paginado: conta, aplica ordenacao, busca a pagina e enriquece em lote antes de mapear a resposta, em `laravel/backend/app/Infrastructure/Persistence/Legacy/Interlojas/LegacyConsultaTransferenciasReadRepository.php:L27-L69`. O caminho de exportacao usa uma consulta para o conjunto filtrado e o mesmo enriquecimento em lote em `:L77-L103`. A query base esta em `:L110-L139`; os dados auxiliares sao coletados e carregados por batches em `:L210-L287`. Nao ha consulta dentro do mapeamento de cada linha.

O padrao deve ser preservado para produtos/entregas: query base set-based, pagina estavel, `ORDER BY` allowlistado, identidade natural estavel, metadados de pagina e enriquecimentos agrupados por IDs. A nota de pesquisa de Entregas explicita a regra: `modules/entregas/relatorio-entregas/pesquisa-padroes-laravel-schema.md:L78-L105` exige coleta de IDs e `whereIn`/`ANY`/`VALUES`/CTE, sem lookup ou `find` no loop de linhas.

Para um PDF simples, `ConsultaRequisicoesRelatorioService` mostra o fluxo servidor -> read model -> view model -> shell -> PDF: `laravel/backend/app/Services/Interlojas/ConsultaRequisicoes/ConsultaRequisicoesRelatorioService.php:L18-L39` e `:L45-L88`. O agrupador trabalha em memoria sobre linhas ja carregadas (`laravel/backend/app/Support/Interlojas/ConsultaRequisicoesRelatorioGrouper.php:L7-L41`), e o mapper normaliza os dados (`laravel/backend/app/Support/Interlojas/ConsultaRequisicoesRelatorioLinhaMapper.php:L10-L47`). O shell institucional e reutilizavel em `laravel/backend/app/Services/Reports/ErpReportLayoutService.php:L12-L19`, `:L24-L62` e `:L65-L124`, com view model em `laravel/backend/app/Support/Reports/ErpReportShellViewModel.php:L11-L51` e geracao PDF em `laravel/backend/app/Support/Pdf/BrowsershotPdfGenerator.php:L11-L36`, `:L51-L69` e `:L86-L123`.

Os testes de Consulta Requisicoes registram uma regra importante: o relatorio deve ter os mesmos IDs do grid, rejeitar linhas fornecidas pelo cliente e respeitar limite/estado vazio, em `laravel/backend/tests/Feature/Interlojas/ConsultaRequisicoes/ConsultaRequisicoesRelatorioPdfTest.php:L46-L93` e `:L126-L189`. Isso e uma boa base de paridade, mas nao e ainda uma fotografia persistida.

O padrao completo de fotografia esta em Contas a Pagar. O materializer declara que materializa uma fotografia a partir do read model e gera envelope com `generation_id`, versoes de contrato/template, criterios, operador, filiais, agrupamentos, ordenacao, linhas, totais, `data_as_of` e hash: `laravel/backend/app/Application/ContasPagar/Relatorio/AccountsPayableReportMaterializer.php:L31-L47` e `:L171-L204`. Reconciliacao, escrita e transicao de estado estao em `:L206-L243`; armazenamento privado e leitura/limpeza em `laravel/backend/app/Services/ContasPagar/Relatorio/AccountsPayableReportSnapshotStore.php:L11-L87`; hash e contagens em `laravel/backend/app/Services/ContasPagar/Relatorio/AccountsPayableReportIntegrityService.php:L7-L20` e `:L22-L81`. Consulta posterior verifica autorizacao, expiracao, compatibilidade e auditoria em `laravel/backend/app/Application/ContasPagar/Relatorio/ViewAccountsPayableReportQuery.php:L19-L97`.

Limite: nao foi localizado um contrato de snapshot/generation especifico para Consulta de Entrega de Produtos, nem equivalente especifico de Entregas. Portanto, o shell/PDF pode ser reutilizado, mas o contrato de fotografia precisa ser definido para este modulo. O relatorio nao deve simplesmente refazer uma query sem registrar criterios, momento dos dados, identidade das linhas, autorizacao e integridade.

Fotografia de produto tambem tem seam set-based: `laravel/backend/app/Support/Interlojas/ConsultaRequisicoesPhotoEnricher.php:L10-L24`, `:L26-L42` e `:L75-L126` coleta IDs, limita produtos, divide em chunks de 400 e aplica mapas. `ProductPhotoService` memoiza por requisicao e faz batches em `laravel/backend/app/Services/Catalog/ProductPhotoService.php:L15-L25`, `:L31-L42`, `:L104-L190` e `:L192-L247`. O repositorio deixa explicito que nao usa `Schema::hasTable`/`hasColumn` e faz consultas em lote, em `laravel/backend/app/Infrastructure/Persistence/Legacy/Catalog/LegacyProductPhotosRepository.php:L11-L16` e `:L51-L160`.

Limites a registrar: o enriquecimento tem cap de produtos e chunking; fotos devem ser autorizadas pelo contexto e nao podem criar N+1. Se entrarem na fotografia do relatorio, decidir se o snapshot congela a URL/metadado ou se a renderizacao revalida uma referencia versionada.

## 3. F6: gerar e cancelar desde o primeiro await

O protocolo existente e cancelamento no servidor PostgreSQL, nao apenas cancelamento HTTP. `PgsqlCancellableStatement` configura timeout, obtem `pg_backend_pid()`, registra usuario/trace/PID/TTL, executa o callback e limpa o registro no `finally`: `laravel/backend/app/Support/Database/PgsqlCancellableStatement.php:L9-L12`, `:L20-L51`. O runner cria ou reaproveita o trace e envolve toda a operacao: `laravel/backend/app/Support/Database/PgsqlGerarQueryRunner.php:L9-L38`; a variante pesada esta em `:L40-L57`. O registro compartilhado entre web/worker e o servico que chama `pg_cancel_backend` estao em `laravel/backend/app/Support/Database/PgsqlQueryCancelRegistry.php:L9-L50` e `laravel/backend/app/Support/Database/PgsqlGerarQueryCancelService.php:L10-L66`. O controller valida o trace autenticado antes de cancelar em `laravel/backend/app/Http/Controllers/Concerns/CancelsPgsqlGerarQuery.php:L12-L31`.

Consulta Transferencias mostra o seam de controller: o trace e criado, e a chamada de dominio/read model inteira fica dentro de `PgsqlGerarQueryRunner::run`, com classificacao de cancelamento, em `laravel/backend/app/Http/Controllers/Interlojas/ConsultaTransferenciasController.php:L109-L156`; o endpoint de cancelamento fica em `:L158-L161`.

No cliente, `useErpGerarRequest` envia o POST de cancelamento primeiro e somente depois chama `AbortController.abort()`, em `laravel/backend/resources/js/hooks/useErpGerarRequest.ts:L25-L53`; o trace e enviado no header em `:L9-L16`. O abort local continua util para ignorar a resposta, mas nao e o cancelamento do backend.

O requisito “desde o primeiro await” aparece concretamente em `useConsultaTransferenciasConsulta`: ele incrementa a sequencia, seta `busy` e atualiza o estado antes de `await postGerar`, em `laravel/backend/resources/js/Pages/Interlojas/ConsultaTransferencias/hooks/useConsultaTransferenciasConsulta.ts:L69-L101`. Respostas obsoletas sao ignoradas em `:L103-L119`, cancelamento e neutro preservando o ultimo resultado em `:L121-L125`, e o busy e liberado no `finally`. A barra mostra Gerar/Cancelar, breadcrumb e estado de processamento em `laravel/backend/resources/js/Pages/Interlojas/ConsultaTransferencias/Index.tsx:L107-L155`; o contrato visual reutilizavel esta em `laravel/backend/resources/js/Components/erp/consulta/ErpConsultaOperationBar.tsx:L6-L19`, `:L42-L105` e `:L145-L188`.

Para F6 de Consulta de Entrega de Produtos:

- criar trace e registrar o estado antes do primeiro `await`;
- colocar toda a query e enriquecimento dentro do runner cancelavel;
- cancelar primeiro no servidor por `pg_cancel_backend`, depois abortar localmente;
- tratar cancelamento como estado neutro e preservar o ultimo resultado completo;
- ignorar respostas tardias por sequencia/trace;
- aceitar apenas teste em PostgreSQL real para provar PID, cancelamento e ausencia de N+1.

As notas geradas ja consolidam o mesmo contrato em `modules/entregas/relatorio-entregas/pesquisa-padroes-laravel-schema.md:L129-L143` e `modules/entregas/cadastro-romaneios/consulta-f6-sql-performance-cancelamento.md:L68-L79`. A regra de “nao usar teste de driver/skip” e de nao tratar `AbortController` como cancelamento unico esta em `modules/entregas/relatorio-entregas/04-speckit-prompt-aceite-desempenho-observabilidade.md:L13-L15`.

## 4. F9, command bar e breadcrumb

O hook global de cadastro registra atalhos em capture phase, respeita `defaultPrevented` e modificadores e remove listeners no cleanup: `laravel/backend/resources/js/Components/erp/cadastro/useRegistryCadastroShortcuts.ts:L21-L71`. O modal de Romaneios e apenas um wrapper fino que fornece URL, titulo, permissao, chave de persistencia e mapeamento da selecao para o componente padrao, em `laravel/backend/resources/js/Pages/Entregas/Romaneios/components/LocalizarRomaneioModal.tsx:L1-L29`.

`ErpTwoColumnCatalogLookupModal` ja cobre endpoint paginado, busca, ordenacao, colunas extras, persistencia de sessao, picker, resize, teclado, foco e estado de permissao: `laravel/backend/resources/js/Components/erp/cadastro/ErpTwoColumnCatalogLookupModal.tsx:L29-L60`, `:L88-L166`, `:L609-L689`, `:L942-L1005` e `:L1011-L1177`. O seam para F9 e adaptar esse modal com endpoint/allowlist/autorizacao do produto, nao criar consulta ou modal novo na pagina.

Para chrome, `ErpCadastroCommandBar` fornece as acoes e labels de atalho (`laravel/backend/resources/js/Components/erp/cadastro/ErpCadastroCommandBar.tsx:L83-L178`), `RomaneioCommandBar` mapeia capacidades/busy para essa barra (`laravel/backend/resources/js/Pages/Entregas/Romaneios/components/RomaneioCommandBar.tsx:L48-L136`) e `ErpCadastroShell` organiza barra sticky ou rail (`laravel/backend/resources/js/Components/erp/cadastro/ErpCadastroShell.tsx:L7-L61`). O exemplo de pagina mostra breadcrumb + `AppLayout` + shell em `laravel/backend/resources/js/Pages/Entregas/Romaneios/Cadastro.tsx:L585-L610`; a consulta usa breadcrumb + `AppLayout` + `ErpConsultaOperationBar` em `laravel/backend/resources/js/Pages/Interlojas/ConsultaTransferencias/Index.tsx:L107-L155`. A regra de nao duplicar chrome global esta em `laravel/backend/docs/erp-ui/shared-chrome-vs-page.md:L3-L47`.

## 5. Persistencia de edicao

Romaneios mostra o seam correto para mutacao: endpoints de store/update/item/delete/toggle/lote passam por um executor comum, em `laravel/backend/app/Http/Controllers/Entregas/CadastroRomaneiosComandosController.php:L55-L143` e `:L260-L320`. O executor exige autenticacao, chave de idempotencia, hash canonico e revisao esperada; o handler executa transacao e atualiza a revisao. A revisao e derivada de header/itens/auditoria/segmentos em `laravel/backend/app/Application/Entregas/Romaneios/CadastroRomaneiosRevisionService.php:L88-L105`, conflito retorna 409 em `:L112-L131`, e a revisao e renovada depois da mutacao em `:L142-L193`.

O handler de update verifica editabilidade/existencia e persiste pelo repositorio em `laravel/backend/app/Application/Entregas/Romaneios/Commands/Handlers/UpdateRomaneioHandler.php:L47-L85`; o repositorio de escrita faz update/lock em `laravel/backend/app/Infrastructure/Persistence/Legacy/Entregas/LegacyRomaneioWriteRepository.php:L43-L53` e `:L79-L92`. Os testes provam persistencia e conflito sem sobrescrita: `laravel/backend/tests/Feature/Entregas/Romaneios/Crud/CadastroRomaneiosUpdateTest.php:L16-L34`, `:L62-L77` e `laravel/backend/tests/Feature/Entregas/Romaneios/Crud/CadastroRomaneiosRevisionConflictPostgresTest.php:L18-L58`.

Para campos editaveis vindos de uma consulta, usar um command explicito com change set, dirty state, revisao e auditoria. O change set de Vendas compara estado atual e entrada e produz apenas deltas em `laravel/backend/app/Support/Vendas/ConsultaContratosGravarAlteracaoChangeSet.php:L7-L111`; o hook de gravacao mantem a mutacao explicita em `laravel/backend/resources/js/hooks/useConsultaContratosGravarAlteracao.ts:L29-L68`, e o draft separa baseline, delta e dirty em `laravel/backend/resources/js/hooks/useConsultaContratosDetalheDraft.ts:L18-L46` e `:L76-L164`.

Limites: preferencias de grid, `commit` de layout e `EditableDataGrid` nao sao transacao, idempotencia, lock, revisao de negocio ou auditoria. A nota de Romaneios determina `ErpPreferenceDataGrid` sem persistencia inline e commands para create/update/delete/toggle, em `modules/entregas/cadastro-romaneios/03-speckit-prompt-cadastro-itens-financeiro.md:L24-L28` e `modules/entregas/cadastro-romaneios/pesquisa-padroes-laravel-reutilizaveis.md:L37-L48`. Se Consulta de Entrega de Produtos for somente leitura, a decisao correta e nao adicionar edicao.

## 6. Schema, snapshot e versionamento

O contrato de schema dos modulos gerados e um snapshot PostgreSQL datado, capturado em transacao read-only, acompanhado de manifest e SHA. O README de Relatorio de Entregas documenta banco, versao PostgreSQL, modo de captura e hashes em `modules/entregas/relatorio-entregas/schema/README.md:L1-L20`. Ele tambem impoe que o caminho de negocio nao consulte existencia de objetos e proibe `hasTable`, `Schema::has*`, `information_schema`, `pg_catalog` e testes comportamentais condicionais por driver; objeto ausente bloqueia o SQL e exige nova captura datada, em `:L22-L26`.

O manifest materializa autoridade, arquivo/hash/data do snapshot, banco/versao, funcoes, relacoes obrigatorias e regras de runtime em `modules/entregas/relatorio-entregas/schema/relatorio-entregas-schema-manifest.json:L1-L20` e `:L22-L61`. O README de Romaneios acrescenta que cardinalidades sao estimativas, que a consulta deve ser server-side/set-based e que um snapshot novo e necessario quando mudam banco, schema ou versao, em `modules/entregas/cadastro-romaneios/schema/README.md:L31-L45`.

Existe uma divergencia que deve ser registrada, nao copiada: o teste `laravel/backend/tests/Feature/Entregas/Romaneios/CadastroRomaneiosSchemaGatePostgresTest.php:L14-L24` e `:L27-L67` usa driver skip e catalogo PostgreSQL para validar o snapshot. Isso pode ser um gate legado de infraestrutura, mas conflita com a regra mais forte da pesquisa deste modulo. A politica arquitetural geral tambem diz para assumir schema alinhado e falhar explicitamente, sem sondagem de catalogo no caminho de negocio, em `laravel/docs/adr/0007-legacy-runtime-schema-fail-fast.md:L7-L17`.

Nao foi localizado snapshot/manifest especifico sob `modules/entregas/consulta-entrega-produtos` antes desta pesquisa. Portanto, nenhuma relacao ou funcao do produto deve ser presumida a partir de outro modulo. O proximo seam e capturar um snapshot autoritativo proprio, com arquivo JSON, SHA, data, banco, versao e manifest; depois, escrever SQL contra esse contrato e falhar de forma explicita quando um objeto obrigatorio nao existir.

Manter tres versoes distintas:

- `schemaVersion` do catalogo de grid: muda quando colunas/layout do grid mudam (`useErpGridLayout.ts:L165-L214`);
- versao de contrato/template do relatorio: muda quando envelope, apresentacao ou interpretacao do snapshot muda (`AccountsPayableReportMaterializer.php:L171-L204`);
- versao/hash do snapshot de banco: identifica a captura concreta e nao deve ser inferida em request por introspeccao.

## 7. Reuso recomendado e anti-padro a evitar

Reusar:

- `GridColumnCatalog`, `ErpPreferenceDataGrid`, `useErpGridPreferences`, `ErpGridShell` e `GridExportOrchestrator`;
- `PgsqlGerarQueryRunner`, registro/servico de cancelamento e `useErpGerarRequest`;
- `ErpConsultaOperationBar`, `useRegistryCadastroShortcuts` e `ErpTwoColumnCatalogLookupModal`;
- `ErpReportLayoutService`, shell/view model e `BrowsershotPdfGenerator`;
- repositorio set-based com enriquecimento por lote e `ProductPhotoService`;
- commands com idempotencia, revisao esperada, transacao, auditoria e 409 para qualquer edicao.

Nao reusar como regra para este produto:

- consulta SQL ou lookup dentro do loop de linhas;
- ordenacao recebida diretamente do cliente;
- `AbortController` como unico cancelamento;
- `hasTable`, `Schema::has*`, `information_schema`, `pg_catalog` ou deteccao de driver em request/service/repository;
- grid editavel como substituto de command de dominio;
- modal F9 ad hoc ou endpoint que devolve dados sem autorizacao/filial/contexto;
- relatorio que aceita linhas do cliente ou refaz dados sem snapshot/criterios/rastreabilidade;
- copiar o schema de `relatorio-entregas` ou `cadastro-romaneios` sem uma nova captura autoritativa do banco alvo.

## 8. Criterios de aceite derivados da pesquisa

1. O grid expõe catalogo com `gridId`, `screenKey`, `schemaVersion`, colunas autorizadas/exportaveis e ordenacao allowlistada.
2. A consulta e o export usam read model set-based, sem N+1, com identidade estavel e enriquecimentos em lote.
3. O F6 seta busy/trace antes do primeiro await; o backend registra o PID e o cancelamento real usa `pg_cancel_backend`; resposta tardia nao substitui resultado completo anterior.
4. O F9 usa o modal/catalogo padrao e uma politica explicita de autorizacao/filial.
5. Qualquer edicao passa por command explicito, revisao esperada, idempotencia, transacao e auditoria; preferencias de grid ficam fora da persistencia de negocio.
6. O relatorio define paridade de IDs com o grid e, se for fotografia, envelope versionado, `data_as_of`, criterios, autorizacao, expiracao e integridade.
7. Existe snapshot PostgreSQL proprio do modulo, datado e com SHA/manifest; o caminho de negocio nao faz introspeccao e o aceite de cancelamento/desempenho roda contra PostgreSQL real.

