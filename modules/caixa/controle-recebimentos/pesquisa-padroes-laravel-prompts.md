# Auditoria de padrões Laravel e prompts existentes — Controle de Recebimentos

## Escopo

Foram consultados os prompts/dossiês já gerados em `modules/interlojas/confirmacao-por-notas`, `modules/interlojas/consulta-entrega-produtos`, `modules/entregas/consulta-entrega-produtos`, `modules/financeiro/contas-pagar`, `modules/caixa/fechamentos` e `modules/erp/grids`, além dos componentes/serviços Laravel referenciados por eles. A finalidade é orientar os futuros prompts SpecKit sem duplicar componentes nem pedir reabertura dos fontes Delphi.

## 1. Matriz de reuso

| Necessidade | Padrão/artefato localizado | Contrato confirmado | Limite para Controle de Recebimentos |
|---|---|---|---|
| Página/shell/breadcrumb | `AppLayout`, shell de Cadastro/Consulta, `ErpConsultaOperationBar` | Breadcrumb e command bar devem ser dados pela página; folha é o último item | Definir hierarquia Caixa → Controle de Recebimentos somente após confirmar o menu |
| F6/Gerar | `useErpGerarRequest`, `ErpConsultaOperationBar`, `ErpConsultaGerandoBanner` | estado busy/trace e Cancelar aparecem antes do primeiro `await` | contrato de filtros e `screenKey` próprios |
| Cancelar PostgreSQL | `PgsqlGerarQueryRunner`, `PgsqlCancellableStatement`, `PgsqlGerarQueryCancelService`, `PgsqlQueryCancelRegistry` | Cancelar chama endpoint protegido e `pg_cancel_backend`; abort local sozinho não basta | decidir síncrono/worker por evidência, sem fallback automático |
| Grid | `GridColumnCatalog`, `ErpPreferenceDataGrid`, `ErpGridShell`, catálogos TypeScript/PHP | catálogo próprio, `gridId`, `screenKey`, `schemaVersion`, allowlist de colunas/sort e preferências por usuário | preferências são layout, não autorização nem persistência de negócio |
| Exportação | `GridExportOrchestrator`, `ExportContextStore`, `useErpGridExcelExport` | contexto congela filtro/Filial/sort/colunas/usuário e é reautorizado | não exportar coluna que não esteja no catálogo/autorização |
| F9/lookup | `CatalogCodeLookup`, `ErpTwoColumnCatalogLookupModal`, `ErpCadastroLookupModal`, `useRegistryCadastroShortcuts` | endpoint paginado/autorizado, sessão de lookup, foco/restauração e F9 preventDefault | cliente/tipo de recebimento devem ter lookup próprio se contrato genérico for incompatível |
| Chave NF-e | `NfeAccessKeyInput`, `NfeAccessKeyText`, `NfeAccessKey`, `NfeAccessKeyValid` | normalização a 44 dígitos, máscara, DV e autoridade backend compartilhadas | a tela Delphi não possui chave NF-e; só usar se decisão de domínio a introduzir |
| Autorização sensível | `SensitiveOperationCatalog`, `SensitiveOperationAuthService`, `SensitiveOperationProofService` | ação/módulo/contexto/Filial, credencial validada, prova curta, lock, auditoria sem senha | ação de Analista de Crédito deve ser própria; não reutilizar autorização de outro módulo sem contrato |
| Parâmetros | `ParameterService::get/getMany`, manifests de módulo | `getMany` reduz leituras e `parametros_valor(?, ?)` é fonte PostgreSQL | manifesto próprio para `Recebimentos Integrado com Bancos` |
| Menu/grants | migrations de `acessosmodulos`, service de acesso por rota, middleware, `usuariosacessosmodulos` | folha própria, rota canônica, grant explícito, Administrador bypass explícito | não inventar código numérico nem herdar grants |
| Relatórios | `ErpReportLayoutService`, `ErpReportShellViewModel`, fotografia/read model dos relatórios de Contas a Pagar | geração, grid e saída devem compartilhar contrato/fotografia; F6 inicia a geração | não há relatório Delphi localizado; é requisito Laravel novo |

Fontes primárias de padrões: `modules/entregas/consulta-entrega-produtos/pesquisa-padroes-laravel-grid-relatorio-cancelamento-schema.md:14-38,60-82`, `modules/entregas/consulta-entrega-produtos/pesquisa-parametros-autorizacoes-menu-padroes.md:90-140`, `modules/entregas/cadastro-romaneios/pesquisa-padroes-laravel-reutilizaveis.md:13-66`, `modules/financeiro/contas-pagar/relatorio-situacao-fornecedores/pesquisa-reuso-relatorios-laravel.md:56-129`.

## 2. Grids, colunas, edição e exportação

### Catálogo e preferências

O contrato compartilhado de `GridColumnCatalog` centraliza identidade, `schemaVersion`, colunas visíveis/exportáveis, labels, tipos e allowlist de ordenação (`laravel/backend/app/Support/ErpGrid/GridColumnCatalog.php:9-92`). O exemplo de consumidor está em `laravel/backend/app/Support/ErpGrid/Catalogs/ConsultaTransferenciasGridCatalog.php:10-92`, e o contrato TypeScript em `laravel/backend/resources/js/Components/erp/data-grid/catalog/types.ts:1-58`.

`ErpPreferenceDataGrid` integra layout por usuário, visibilidade, reordenação, resize e exportação; `ErpGridShell` controla atalhos/estado travado (`laravel/backend/resources/js/Components/erp/data-grid/ErpPreferenceDataGrid.tsx:9-149`; `ErpGridShell.tsx:17-186`). O prompt de grids compartilhados confirma que preferências não podem carregar regras de negócio (`modules/erp/grids/01-speckit-prompt.md:14-37`).

Aplicação ao módulo:

- cada grid semântico recebe catálogo, `gridId`, `screenKey` e versão próprios;
- colunas calculadas/seleção/estado não são persistidas como fatos apenas por estarem no grid;
- se houver edição, declarar por campo e operação, com change set/command, validação, revisão, transação, idempotência e auditoria;
- `EditableDataGrid` não substitui autorização, command de domínio ou concorrência;
- exportação deve usar o mesmo contrato de filtros/Filial/sort e não executar uma consulta por linha.

## 3. F6 e cancelamento real

O protocolo reutilizável está documentado em `modules/entregas/consulta-entrega-produtos/pesquisa-padroes-laravel-grid-relatorio-cancelamento-schema.md:60-82`:

1. criar `trace_id`, estado `busy` e ação Cancelar antes do primeiro `await` de Gerar/F6;
2. executar montagem, consulta, pré-agregação e materialização no `PgsqlGerarQueryRunner`/runner apropriado;
3. registrar usuário, `screenKey`, trace e PID PostgreSQL no `PgsqlQueryCancelRegistry`;
4. endpoint de Cancelar valida usuário/tela/trace e chama `pg_cancel_backend()`;
5. somente depois disso abortar a espera HTTP local; resposta tardia não pode publicar resultado;
6. limpar o registro em `finally` e diferenciar cancelado, erro e resultado pronto.

Arquivos concretos: `laravel/backend/app/Support/Database/PgsqlCancellableStatement.php:9-51`, `PgsqlGerarQueryRunner.php:9-57`, `PgsqlQueryCancelRegistry.php:9-50`, `PgsqlGerarQueryCancelService.php:10-66` e o hook `useErpGerarRequest` citado no artefato de padrões.

O Delphi não oferece Cancelar durante `qryRecebimentos.Open` (`pesquisa-interface-fluxo-delphi.md:138`, `:314`); portanto cancelamento real é uma decisão/contrato Laravel novo, não paridade literal. Não adotar `AbortController` como único cancelamento.

## 4. F9, pesquisa e máscara NF-e

### F9/modal

`CatalogCodeLookup` encaminha ao `ErpTwoColumnCatalogLookupModal` (`laravel/backend/resources/js/Components/lookup/CatalogCodeLookup.tsx:206-232`); o modal usa endpoint paginado, restaura sessão e informa permissão (`ErpTwoColumnCatalogLookupModal.tsx:29-45`, `:88-146`). `useRegistryCadastroShortcuts.ts:3-71` captura F9, previne o comportamento padrão e só executa ação habilitada. O padrão de teclado geral está em `laravel/backend/docs/atalhos.md:11-19`.

O Controle de Recebimentos tem F9 herdado sem janela própria confirmada, mas o Cliente usa `pesCLIENTES`/modal do frame (`pesquisa-interface-fluxo-delphi.md:125-139`). O prompt deve usar a infraestrutura padrão, com endpoint/contrato/autorização próprios quando cliente, tipo ou outra entidade não couberem no lookup genérico.

### Máscara da chave NF-e

O padrão compartilhado já existe:

- `laravel/backend/resources/js/lib/nfeAccessKey.ts:5-125`: 44 dígitos, máscara/segmentos e DV;
- `laravel/backend/app/Domain/Fiscal/NfeAccessKeyValidator.php:7-52`: validação backend;
- `laravel/backend/app/Domain/Fiscal/NfeAccessKey.php:7-35`: value object canônico;
- `laravel/backend/resources/js/Components/erp/fiscal/NfeAccessKeyInput.tsx:22-176` e `NfeAccessKeyText.tsx:1-22`: entrada/exibição.

Não criar regex, máscara ou DV novo. Como nenhuma chave NF-e foi localizada no Delphi (`pesquisa-interface-fluxo-delphi.md:40`, `:323`), o prompt deve marcar a utilização como condicional à decisão de domínio e não inventar filtro fiscal para esta tela.

## 5. Relatórios e paridade do grid

Os relatórios existentes de Contas a Pagar usam geração/fotografia/read model e definem o layout como contrato comum entre HTML, PDF e impressão (`modules/financeiro/contas-pagar/relatorio-situacao-fornecedores/pesquisa-reuso-relatorios-laravel.md:56-129`; `modules/financeiro/contas-pagar/relatorio/speckit-prompt.md`).

Para este módulo:

- F6 deve iniciar a geração do relatório e oferecer Cancelar imediatamente;
- o grid e o relatório devem consumir o mesmo dataset/projeção/read model ou uma fotografia derivada do mesmo contrato;
- filtros, Filial, ordenação, colunas e permissões devem ser congelados no contexto da geração;
- PDF/HTML/exportação não devem reconsultar fatos divergentes nem executar N+1;
- como não há relatório Delphi localizado, o prompt deve distinguir requisito novo de comportamento legado confirmado.

## 6. Parâmetros, autorização e menu

`ParameterService::getMany` faz leitura agrupada e memoizada de `parametros_valor` (`laravel/backend/app/Services/Parameter/ParameterService.php:13-28`, `:113-174`). O Controle de Recebimentos deve declarar um manifesto próprio para `Recebimentos Integrado com Bancos`, com conversão booleana e Filial efetiva; não fazer uma chamada por linha.

O menu deve seguir a folha por rota e grant explícito documentada em `modules/caixa/controle-recebimentos/pesquisa-autorizacoes-menu.md:27-49`: migration/catalogo de `acessosmodulos`, serviço de acesso por rota, middleware/policy e `usuariosacessosmodulos`. A autorização sensível de Analista de Crédito é outra camada e deve usar o catálogo/prova contextual do Laravel, sem guardar senha.

## 7. Guardrails e divergências

### Obrigatórios nos prompts

- consultar primeiro o Laravel atual e os artefatos já gerados;
- referenciar os três inventários do módulo, não pedir reabertura direta dos fontes Delphi;
- projetar colunas explicitamente; não usar `select *` como contrato público;
- evitar N+1 com consulta set-based, pré-agregação e `IN`/`= ANY(array)`/`unnest` com binds;
- escolher `INNER JOIN` quando relações/colunas forem obrigatórias `NOT NULL`; usar `LEFT JOIN` somente quando ausência for funcionalmente válida e comprovada pelo schema;
- F6 deve nascer cancelável no backend PostgreSQL, com Cancelar antes do primeiro `await`;
- separar layout/preferências do grid de edição e autorização de negócio;
- não usar teste de driver, `hasTable`, `Schema::has*` nem introspecção de schema no caminho de negócio;
- não replicar código numérico de `acessosmodulos` nem conceder grants por herança implícita;
- declarar o que é confirmado, inferido, divergente, possível bug legado ou decisão nova.

### Divergências a não copiar

- migrations históricas com `Schema::hasTable`/`hasColumn` e serviços com `getDriverName()` aparecem no checkout, mas contradizem o guardrail deste esforço;
- SQL legado usa macros textuais, `r.*`, subconsultas correlacionadas, `MAX()+1` e `Locate`; os prompts devem orientar contratos seguros, não copiar esses mecanismos;
- o Delphi não oferece relatório nem Cancelar F6, e não contém chave NF-e; ambos são requisitos Laravel novos/condicionais;
- `F9` da tela é herdado sem janela própria localizada; usar modal padrão Laravel, não inventar modal ad hoc;
- preferências do grid não significam permissão para gravar ou alteração persistida.

## Handoff

Este artefato deve ser citado pelo ticket de consolidação. Os nomes finais de classes/rotas devem ser revalidados no checkout no momento do `/speckit.specify`; os caminhos acima são baseline de reuso, não autorização para criar duplicatas.
