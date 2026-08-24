# Pesquisa de padrões Laravel, grid, relatório, cancelamento e schema

Status da pesquisa: concluída para o ticket **Mapear padrões Laravel para Relatório, grid, consulta cancelável e schema**.

Escopo: inspeção do checkout `laravel/backend` e dos artefatos já gerados em `modules/entregas/cadastro-romaneios/` e `modules/interlojas/consulta-transferencias/`. As fontes citadas abaixo são código, testes, migrations e documentação do próprio checkout. Este arquivo é o contrato intermediário para os prompts futuros; não pede que a implementação reabra as fontes Delphi.

Classificação usada: `CONFIRMADO` significa seam existente no checkout; `OPORTUNIDADE` significa composição/adaptação necessária; `LACUNA` significa que o seam ainda não fornece o contrato do Relatório de Entregas; `DIVERGENTE` significa algo existente que não deve ser copiado por contrariar as regras permanentes do módulo.

## Resultado executivo

| Área | Seam primário | Decisão para os prompts do Relatório de Entregas |
|---|---|---|
| Acesso/menu | `EntregasRomaneiosModuleAccessService` e `acessosmodulos` | Criar uma folha própria sob `Entregas e Montagens → Entregas`, com rota canônica própria e concessão explícita; não copiar grants de Romaneios. |
| Filial/parâmetros | `BranchContextService`, `UserBranchAccessService`, `ParameterService`, manifest por módulo | Resolver Filial no servidor e ler todos os parâmetros com um `getMany` por Filial; o browser recebe apenas estado de UI. |
| Breadcrumb/barra | `AppLayout`, `ErpConsultaOperationBar` | Usar breadcrumb `Entregas e Montagens → Entregas → Relatório de Entregas`; Gerar/F6 e Cancelar são ações visíveis e declarativas. |
| F9 | `useRegistryCadastroShortcuts`, `ErpTwoColumnCatalogLookupModal`, `LocalizarRomaneioModal` | Reutilizar o modal padrão de pesquisa e seu contrato de sessão, paginação e ordenação; não criar modal ad hoc. |
| Grid | `ErpPreferenceDataGrid`, catálogo TS/PHP e `GridExportOrchestrator` | Catálogo próprio, versionado, com allowlist de campos/sort, preferências, colunas, exportação e contexto de filtros. |
| Relatório | `ErpReportLayoutService`, `BrowsershotPdfGenerator`, relatórios de Consulta de Requisições e Contas a Pagar | Grid, preview e PDF devem derivar do mesmo dataset/fotografia canônica; HTML e PDF não devem refazer consultas independentes. |
| Cancelamento F6 | `PgsqlGerarQueryRunner`, `PgsqlCancellableStatement`, `PgsqlGerarQueryCancelService`, `CancelsPgsqlGerarQuery` | Exibir Cancelar antes do primeiro `await`, registrar `trace_id`/backend PID e executar `pg_cancel_backend`/terminação no servidor; `AbortController` é somente complemento visual. |
| Chave NF-e | `NfeAccessKeyInput`, `nfeAccessKey.ts`, `NfeAccessKey`, `NfeAccessKeyValid` | Reutilizar a autoridade `NfeAccessKey*`; não duplicar máscara, regex ou cálculo de DV. |
| Schema | `modules/*/schema/` + snapshot JSON versionado | Criar snapshot autoritativo local para as relações/funções usadas pelo relatório, com data, hash, versão e README de captura. Não fazer introspecção `hasTable`/`Schema::has*` em request de negócio. |

## 1. Acesso, capability, menu e Filial

### 1.1 Estrutura do menu

**CONFIRMADO.** O seam de Entregas já nomeia a árvore do menu em `laravel/backend/app/Services/Authorization/EntregasRomaneiosModuleAccessService.php:15-25`:

- raiz `cloud.modulo.entrega_e_montagem`, label `Entregas e Montagens`;
- grupo `cloud.modulo.entregas`, label `Entregas`;
- folha `entregas.romaneios.index`, label `Romaneios`.

O novo módulo deve conservar a raiz e o grupo, mas declarar uma folha diferente, por exemplo uma rota nomeada equivalente a `entregas.relatorio-entregas.index` e label `Relatório de Entregas`. O nome exato da rota pertence à especificação de fundação; o requisito inegociável é que a rota da folha, a capability e o registro em `acessosmodulos` sejam uma única identidade.

**CONFIRMADO.** A autorização de Romaneios e a de Consulta de Transferências procuram o código da folha em `acessosmodulos` e conferem `usuariosacessosmodulos`, com administrador como exceção explícita (`EntregasRomaneiosModuleAccessService.php:27-49`; `InterlojasConsultaTransferenciasModuleAccessService.php:17-40`). A consulta vizinha também protege o grupo de rotas, não apenas o GET, como mostram o controller e as rotas de `ConsultaTransferencias` (`app/Http/Controllers/Interlojas/ConsultaTransferenciasController.php:40-55,57-83`; `routes/web.php:1928` e o grupo adjacente).

**OPORTUNIDADE.** A migration de referência `database/migrations/2026_07_30_295000_acessosmodulos_consulta_requisicoes.php:16-70` mostra a forma de localizar o pai, atualizar uma folha existente, calcular `ordem` e inserir sem replicar grants. Ela é referência de intenção de menu, não autorização para copiar suas guardas de introspecção; essa migration usa `Schema::hasTable`/`Schema::hasColumn` nas linhas 24-26, o que é uma divergência frente às regras deste módulo e deve ficar explicitamente fora dos prompts futuros.

### 1.2 Capability e Filial ativa

**CONFIRMADO.** A página de Consulta de Transferências envia capability, Filial ativa, opções autorizadas, defaults, parâmetros e URLs em `app/Http/Controllers/Interlojas/ConsultaTransferenciasController.php:57-83`. O padrão adequado para o Relatório de Entregas é:

1. GET Inertia leve para compor a página.
2. Service de autorização que resolve a Filial ativa pela sessão, nunca por um código confiado do browser.
3. Form Request que allowlista filtros, paginação, ordenação e limites.
4. Revalidação de acesso em consultar, exportar, visualizar fotografia e obter PDF.

`ConsultaTransferenciasPageService.php:76-140` comprova a separação entre Filial ausente, inválida, não autorizada e válida. `UserBranchAccessService` deve ser o resolvedor do escopo de Filiais autorizado; o conjunto efetivo deve ser aplicado novamente no repositório.

O acesso ao menu não é autorização de uma operação futura. Se o Relatório de Entregas tiver somente leitura, a capability pode ser `access/view/generate` conforme o catálogo do projeto; não criar permissões de alteração, exclusão ou operação só porque existem botões no Delphi.

## 2. Parâmetros legados

**CONFIRMADO.** `laravel/backend/app/Services/Parameter/ParameterService.php:13-28` define a fachada: PostgreSQL usa `parametros_valor(nome, filial)` e `getMany` faz a leitura em lote; a função legada permanece a fonte autoritativa, sem fallback de negócio para `parametrosfiliais` no PostgreSQL. `getMany` e sua memória por request estão em `:117-173`; a resolução individual está em `:188-215`.

**CONFIRMADO.** `ConsultaTransferenciasParameterManifest.php:14-66` é o exemplo reutilizável de manifest: constantes com descrições literais, `descriptions()`, uma chamada `getMany` por Filial e conversão de booleanos/números/datas em nomes semânticos para a UI. O Relatório de Entregas deve criar um manifest próprio com os literais comprovados na pesquisa Delphi já consolidada, inclusive qualquer uso de `parametros_valor('', '')` que altere filtros, agrupamento, exibição, data padrão ou regra de relatório.

**Proibições para o prompt:** não emitir SQL direto para parâmetros no controller/repositório, não fazer uma leitura por linha/filial, não aceitar parâmetro efetivo vindo do browser e não transformar ausência de parâmetro em uma consulta sem escopo. O browser pode receber apenas flags de apresentação, limites e defaults já normalizados.

## 3. Breadcrumb, command bar e atalhos

**CONFIRMADO.** `resources/js/Pages/Interlojas/ConsultaTransferencias/Index.tsx:107-122` constrói breadcrumbs e passa-os a `AppLayout`. Para esta tela, o breadcrumb deve ser a trilha completa `Entregas e Montagens`, `Entregas`, `Relatório de Entregas`, com a folha marcada como página corrente no padrão já usado pelo layout.

**CONFIRMADO.** `resources/js/Components/erp/consulta/ErpConsultaOperationBar.tsx:6-19,56-105,145-188` recebe ações declarativas com label, shortcut, ícone, variante, disabled e processing. A tela vizinha usa Gerar/F6 e exibe Cancelar danger somente enquanto `busy` (`ConsultaTransferencias/Index.tsx:126-155`). O prompt deve mandar compor a barra com o ícone e o estado de processamento do design system, preservando acessibilidade, texto e tooltip.

**Contrato recomendado:** F6 chama exatamente o mesmo handler do botão Gerar; `busy` é definido antes do primeiro await; enquanto `busy`, Gerar fica processing/disabled e Cancelar fica visível; cancelamento/erro não apaga o último resultado completo. O hook de teclado deve ignorar modificadores, `defaultPrevented`, repetição e modais ativos, e remover o listener no cleanup.

Não inventar F3/F8/F7/F10 para uma tela de relatório se a pesquisa da tela não comprovar a tecla. O padrão de cadastro `useRegistryCadastroShortcuts.ts:21-71` é reutilizável como disciplina de captura e cleanup, mas a semântica de F6 nesta consulta é Gerar/Cancelar, não Excluir.

## 4. F9 e modal padrão de pesquisa

**CONFIRMADO.** O padrão de cadastro usa `useRegistryCadastroShortcuts.ts:3-10,21-71` para F9/Localizar e dispara o handler somente quando a operação está habilitada. `modules/entregas/cadastro-romaneios` já materializou o uso em `resources/js/Pages/Entregas/Romaneios/components/LocalizarRomaneioModal.tsx:1-29`, que apenas configura `ErpTwoColumnCatalogLookupModal`.

**CONFIRMADO.** `resources/js/Components/erp/cadastro/ErpTwoColumnCatalogLookupModal.tsx:376-430` é o casulo comum para pesquisa em duas colunas; o mesmo arquivo implementa busca por campo, Enter, Esc, paginação, ordenação, seleção, sessão persistida e preferências opcionais de colunas (`:1018-1057` e o fluxo de carregamento próximo de `:640-676`).

**Decisão para os prompts:** se F9 localizar um registro, Filial, documento, romaneio ou chave, o módulo deve abrir o modal padrão com endpoint próprio, colunas e allowlist do domínio. O endpoint precisa revalidar acesso e retornar somente dados permitidos. Não criar `<dialog>` isolado, filtro textual sem paginação ou atalho F9 que faça consulta direta na página. Quando F9 estiver em um modal filho, o evento deve ficar escopado ao modal e não propagar para a tela.

## 5. Grid, catálogo, ordenação, preferências e exportação

### 5.1 Catálogo e preferências

**CONFIRMADO.** `resources/js/Components/erp/data-grid/ErpPreferenceDataGrid.tsx:90-145` compõe `ErpGridShell`, layout persistido, `DataGrid`/`EditableDataGrid` e exportação; a UI do catálogo controla visibilidade, ordem, largura, resize, reorder, formato e exportabilidade. O catálogo da Consulta de Transferências é um exemplo concreto em `resources/js/Pages/Interlojas/ConsultaTransferencias/consultaTransferenciasGridCatalog.ts:4-6,8-41,43-66,124-132`, com `screenKey`, `gridId`, versão e allowlist de sort. O equivalente PHP está em `app/Support/ErpGrid/Catalogs/ConsultaTransferenciasGridCatalog.php:10-25,30-92`.

O Relatório de Entregas deve ter `screenKey`, `gridId` e `schemaVersion` próprios. Se houver mais de uma grade (resultado principal, agrupamento, detalhe ou totais), cada uma precisa de identidade e catálogo próprios. Coluna técnica, ID interno e campo não comprovado devem ser ocultos e não exportáveis por padrão.

### 5.2 Paginação, ordenação e exportação

**CONFIRMADO.** A Consulta de Transferências valida ordenação no backend e pagina o repositório (`ConsultaTransferenciasController.php:109-160`; `LegacyConsultaTransferenciasReadRepository.php:27-69`). A consulta canônica é enviada para exportação pelo `GridExportOrchestrator`: ele grava contexto com usuário, tela, grid, versão de filtro e payload normalizado, decide síncrono/assíncrono pelo limite de 5.000 registros e rejeita token de outro usuário (`app/Services/Erp/GridExportOrchestrator.php:9-47`).

Exportar deve reproduzir filtros, Filial, ordenação, versão do filtro, colunas autorizadas e fotografia lógica da geração. O download deve resolver token/contexto no servidor, reautorizar o usuário e nunca aceitar uma lista de linhas como autoridade. A exportação em cache (`GridExportJobStore.php:9-40`) é transitória; para um relatório pesado ou auditável, a fotografia persistente é a autoridade.

### 5.3 Anti-N+1 e SQL set-based

**CONFIRMADO.** `LegacyConsultaTransferenciasReadRepository.php:35-58` carrega as linhas e hidrata estoques em lote. `:210-287` coleta pares produto/Filial, resolve Filiais físicas em lote e obtém o mapa de estoques em uma consulta, em vez de consultar dentro do `foreach` que monta o DTO. Esse é o seam a preservar.

**Obrigatório para o Relatório de Entregas:**

- não fazer query, lookup, `find`, `exists` ou chamada de parâmetro dentro de loop de linhas;
- coletar IDs/chaves e resolver em lote;
- preferir uma consulta set-based com `whereIn` ou PostgreSQL `= ANY(?::int[])`/array quando a chave for adequada;
- quando houver chave composta, usar uma estratégia set-based explícita (pares em `VALUES`, CTE, tabela temporária controlada ou arrays paralelos) e manter uma única consulta de enriquecimento;
- separar count, página e exportação apenas quando o protocolo exigir, evitando enriquecimento repetido desnecessário;
- manter uma allowlist de campos de ordenação; preferência de coluna não pode inventar SQL.

As subconsultas escalares existentes em `LegacyConsultaTransferenciasReadRepository.php:196-202` são uma evidência de que o resultado pode ser montado em SQL, mas não devem ser copiadas automaticamente para o novo relatório. Se as tabelas relacionadas forem obrigatórias e os campos de vínculo forem `NOT NULL`, preferir `INNER JOIN`. `LEFT JOIN` somente quando a ausência da relação for parte do resultado e a nulabilidade estiver comprovada pelo snapshot/schema ou pela regra de domínio. Nunca usar `LEFT JOIN` para esconder tabela/coluna inexistente ou para mascarar um vínculo que deveria eliminar a linha.

## 6. Relatório, fotografia e saída

### 6.1 Saída institucional

**CONFIRMADO.** `app/Services/Reports/ErpReportLayoutService.php:12-19,24-62,76-113` resolve título, data/hora, logo, dados institucionais da Filial, orientação, cor e CSS padrão. `app/Support/Reports/ErpReportShellViewModel.php:11-50` é o view model do shell; `BrowsershotPdfGenerator` e o layout `resources/views/reports/layouts/erp-standard.blade.php` são os seams de renderização.

**CONFIRMADO.** `ConsultaRequisicoesRelatorioService.php:29-39,45-88` mostra o fluxo pequeno: autoriza, conta, busca linhas, agrupa, envolve os dados com shell e renderiza HTML/PDF. Isso é suficiente como referência visual, mas não resolve sozinho a fotografia, pois HTML e PDF podem reconstruir os dados em momentos diferentes.

### 6.2 Fotografia canônica

**CONFIRMADO.** O padrão mais completo está em Contas a Pagar:

- `RequestAccountsPayableReportCommand.php:41-101` normaliza critérios, Filiais e trace, cria uma geração e devolve `poll_url` e `cancel_url`;
- `AccountsPayableReportMaterializer.php:160-229` monta uma fotografia com `contract_version`, `template_version`, critérios, Filiais, agrupamentos, ordenação, linhas, totais e integridade/hash antes de gravá-la;
- `AccountsPayableReportSnapshotStore.php:11-87` armazena `snapshot.json` e `report.pdf` em disco privado por `generationId`;
- `ViewAccountsPayableReportQuery.php:32-97` autoriza a geração, exige estado concluído, lê a fotografia, rejeita fotografia incompatível/expirada e audita a visualização;
- `CancelAccountsPayableReportCommand.php:30-72` cancela a query/geração, limpa o PID e registra auditoria.

**Decisão para o Relatório de Entregas:** o F6 deve produzir um dataset canônico que alimente simultaneamente o grid e o relatório. Se o volume couber no gateway, a consulta pode ser síncrona e cancelável; se o `EXPLAIN`, cardinalidade ou PDF exigirem fila, usar geração pesada com `generationId`, polling e snapshot. Em ambos os casos, preview, PDF, exportação e grid devem apontar para a mesma identidade de resultado, filtros normalizados, Filial, ordenação e versão de contrato. Não gerar o grid por uma query e o PDF por outra.

**LACUNA.** Ainda não existe fotografia do Relatório de Entregas. Definir nos prompts: envelope, retenção, integridade/hash, limite de linhas, comportamento de vazio, agrupamentos/totais, política de acesso por usuário/Filial, expiração, cancelamento e se o PDF é gerado a partir do snapshot ou apenas do mesmo read model.

## 7. F6 e cancelamento real no PostgreSQL

**CONFIRMADO.** O backend da Consulta de Transferências envolve toda a operação no runner (`ConsultaTransferenciasController.php:109-125`), captura trace e expõe a rota Cancelar (`:158-161`; `routes/web.php:1928`). O runner (`app/Support/Database/PgsqlGerarQueryRunner.php:9-38`) aplica timeout e delega a `PgsqlCancellableStatement`; a variante `runHeavy` (`:40-57`) atende jobs longos.

**CONFIRMADO.** `app/Support/Database/PgsqlGerarQueryCancelService.php:10-66` resolve o backend PID registrado e chama `pg_cancel_backend` ou `pg_terminate_backend`. O trait `app/Http/Controllers/Concerns/CancelsPgsqlGerarQuery.php:12-31` limita o pedido ao usuário autenticado e a um UUID de trace. `useErpGerarRequest.ts:25-80` envia o POST de cancelamento antes de abortar o request local; essa ordem é a intenção correta.

**Obrigatório no prompt de implementação:**

1. `busy` e a identidade do trace devem ser estabelecidos antes do primeiro await, para que Cancelar apareça imediatamente.
2. Toda a montagem/consulta SQL, inclusive count, enriquecimento e materialização relevante, deve estar dentro do runner cancelável ou do worker que registra o PID.
3. O `screenKey` deve ser exclusivo da tela e a rota Cancelar deve compartilhar middleware, autenticação e autorização do Gerar.
4. O servidor cancela a query PostgreSQL; `AbortController` apenas encerra a espera do browser e nunca é a prova de cancelamento.
5. Cancelamento é estado neutro: não substitui o último resultado completo por resultado parcial e não aceita resposta tardia de uma geração anterior.
6. Teste de aceite deve observar a query real terminando no PostgreSQL e o estado de geração/resultado; não basta esperar `ERR_CANCELED` do Axios.

**DIVERGENTE.** O checkout contém guards de `getDriverName()` em `PgsqlGerarQueryCancelService.php:23-25`, em materializadores e em testes `@group postgres` (por exemplo `tests/Feature/Entregas/Romaneios/CadastroRomaneiosSchemaGatePostgresTest.php:27-31`). Para esta iniciativa, não criar testes que escolham comportamento por driver, não fazer `markTestSkipped` para esconder ausência de PostgreSQL e não tratar `AbortController` como cancelamento. O contrato do módulo é PostgreSQL; a suíte deve executar no ambiente PostgreSQL previsto e falhar por contrato quando a infraestrutura necessária não estiver disponível.

## 8. `NfeAccessKey*` e máscara fiscal

**CONFIRMADO.** `resources/js/Components/erp/fiscal/NfeAccessKeyInput.tsx:22-41,44-69,78-132,134-177` mantém valor canônico separado da exibição, normaliza colagem/digitação, preserva cursor, valida no blur e oferece Enter. `resources/js/lib/nfeAccessKey.ts:5-12,27-89,107-137` concentra comprimento, segmentação, máscara Delphi/visual e validação. No backend, `app/Domain/Fiscal/NfeAccessKey.php:7-41` delega à autoridade `NfeAccessKeyValidator`, e `app/Rules/NfeAccessKeyValid.php` é a rule de entrada.

O Relatório de Entregas deve reutilizar esses componentes/classes sempre que uma chave NF-e aparecer em filtro, grid, lookup, detalhe ou relatório. O valor persistido/transportado é a forma canônica de 44 dígitos; máscara é apresentação. Não criar regex, cálculo de DV, normalizador, máscara ou componente local. A decisão vale como padrão transversal para os demais módulos.

## 9. Armazenamento e versionamento autoritativo do schema

### 9.1 Localização comprovada

**CONFIRMADO.** O artefato de Romaneios já estabeleceu a convenção `modules/entregas/cadastro-romaneios/schema/`, com `README.md`, `postgresql-authoritative-2026-08-01.json` e `functions-2026-08-01.sql`. O helper `laravel/backend/tests/Support/CadastroRomaneios/CadastroRomaneios310Paths.php:7-39` aponta o checkout Laravel para esse snapshot fora de `app/`, e `CadastroRomaneiosSchemaGatePostgresTest.php:16-25` fixa um SHA-256 do arquivo.

Para o novo módulo, criar o equivalente em `modules/entregas/relatorio-entregas/schema/` quando as fontes Delphi e o banco autoritativo tiverem sido consolidados. O JSON deve conter, no mínimo, relações, funções, colunas, tipos, nulabilidade, chaves primárias/estrangeiras, índices e observações de versão; o SQL de funções deve ser separado e datado. O README deve registrar data/hora de captura, origem autorizada, ambiente/commit, escopo das tabelas, SHA-256, limitações e procedimento de atualização.

### 9.2 Contrato de uso

- O snapshot versionado é a referência para escrever/adaptar SQL e para decidir `INNER JOIN` versus `LEFT JOIN`.
- O prompt futuro deve instruir o agente a consultar primeiro esse snapshot e o schema catalogado pelo checkout; se uma coluna/relação não estiver no contrato, bloquear a query e registrar a lacuna.
- Alterar o schema exige novo arquivo versionado, hash atualizado, revisão do SQL e atualização explícita dos prompts afetados; não sobrescrever silenciosamente o snapshot anterior.
- O snapshot não é motivo para introspecção em cada request. A aplicação deve executar o SQL contra contratos conhecidos; migrações e deploys devem ser controlados pelo processo de banco do projeto.
- Um teste de checksum do arquivo é aceitável como verificação estática de integridade do artefato. Isso é diferente de `hasTable`, `Schema::has*` ou uma consulta de existência em request de negócio.

### 9.3 Proibições de runtime/teste

**DIVERGENTE.** O checkout atual tem testes que consultam `to_regclass`, `pg_proc`, constraints e `getDriverName()` para verificar presença do banco (`CadastroRomaneiosSchemaGatePostgresTest.php:27-88`; teste de schema de Transferência de Requisição no mesmo padrão). Também existem migrations históricas com `Schema::hasTable`/`Schema::hasColumn`.

Para o Relatório de Entregas, registrar nos prompts, literalmente:

- nunca testar driver;
- nunca usar `hasTable`, `Schema::has*` ou introspecção de existência em request, service ou query de negócio;
- nunca usar descoberta dinâmica de tabela para decidir qual SQL executar;
- validar estrutura pela revisão do snapshot autoritativo, checksum estático e suíte PostgreSQL de contrato previamente definida, sem transformar a consulta do usuário em um schema probe.

## 10. Guardrails que devem aparecer em todos os prompts

1. Consultas set-based, com parâmetros vinculados e allowlists; usar `IN`/`whereIn` ou `ANY(array)` quando a forma da chave permitir.
2. Nenhum N+1 em grids, relatórios, exportações, lookups ou parâmetros. O loop de mapeamento só transforma linhas já carregadas.
3. `LEFT JOIN` somente para relação opcional comprovada; vínculo `NOT NULL`/obrigatório com campos `NOT NULL` deve ser `INNER JOIN`.
4. Não copiar SQL concatenada, loops Delphi, subconsultas repetidas por linha ou enriquecimento por request.
5. Filial, capability, colunas exportáveis, sort e filtros efetivos são resolvidos/revalidados no backend.
6. F6 sempre apresenta o mesmo resultado no grid e na saída do Relatório; Cancelar aparece no início e cancela no PostgreSQL.
7. O F9 usa o modal padrão de pesquisa; a chave NF-e usa `NfeAccessKey*`; o breadcrumb e a barra de operações são do design system.
8. Nenhum prompt futuro deve pedir inspeção direta das fontes Delphi. A evidência legada deve ser lida dos artefatos de pesquisa consolidados em `modules/entregas/relatorio-entregas/`.

## 11. Checklist de reuso para os prompts `/speckit.specify`

- [ ] Folha `Relatório de Entregas` em `acessosmodulos` sob os dois níveis corretos de Entregas, sem grants automáticos.
- [ ] Service/middleware/Policy próprios, com capability e revalidação em consultar, exportar, snapshot, preview e PDF.
- [ ] Filial da sessão + `UserBranchAccessService`; parâmetros em manifest e `ParameterService::getMany`.
- [ ] `AppLayout` com breadcrumb completo e `ErpConsultaOperationBar` com Gerar/F6, ícones e Cancelar.
- [ ] Hook de atalhos sem listeners duplicados, sem colisão com modais e sem F6 destrutivo.
- [ ] F9 sobre `ErpTwoColumnCatalogLookupModal` ou variante oficial equivalente, com endpoint allowlisted.
- [ ] Catálogo PHP/TS versionado por grid; `ErpPreferenceDataGrid`, ordenação/paginação explicitamente escolhidas e exportação com contexto reautorizado.
- [ ] Read model único para grid/relatório; sem N+1; `IN`/`ANY(array)`/batch para coleções.
- [ ] Snapshot imutável com versão/hash, retenção e vínculo ao Operador/Filiais; HTML/PDF leem a mesma fotografia.
- [ ] F6 usa runner/registro de PID e endpoint server-side; teste real de cancelamento PostgreSQL, sem teste de driver.
- [ ] `NfeAccessKeyInput`, `NfeAccessKey`, `NfeAccessKeyValid` reutilizados.
- [ ] Schema local versionado com JSON/SQL/README e checksum; nenhum `hasTable`/`Schema::has*` no fluxo de negócio.

## Fontes primárias consultadas

- `laravel/backend/app/Services/Authorization/EntregasRomaneiosModuleAccessService.php`
- `laravel/backend/app/Services/Authorization/InterlojasConsultaTransferenciasModuleAccessService.php`
- `laravel/backend/app/Services/Parameter/ParameterService.php`
- `laravel/backend/app/Services/Interlojas/ConsultaTransferencias/ConsultaTransferenciasParameterManifest.php`
- `laravel/backend/app/Services/Interlojas/ConsultaTransferencias/ConsultaTransferenciasPageService.php`
- `laravel/backend/app/Http/Controllers/Interlojas/ConsultaTransferenciasController.php`
- `laravel/backend/app/Infrastructure/Persistence/Legacy/Interlojas/LegacyConsultaTransferenciasReadRepository.php`
- `laravel/backend/app/Support/Database/PgsqlGerarQueryRunner.php`
- `laravel/backend/app/Support/Database/PgsqlGerarQueryCancelService.php`
- `laravel/backend/app/Http/Controllers/Concerns/CancelsPgsqlGerarQuery.php`
- `laravel/backend/resources/js/hooks/useErpGerarRequest.ts`
- `laravel/backend/resources/js/Components/erp/consulta/ErpConsultaOperationBar.tsx`
- `laravel/backend/resources/js/Components/erp/data-grid/ErpPreferenceDataGrid.tsx`
- `laravel/backend/resources/js/Pages/Interlojas/ConsultaTransferencias/consultaTransferenciasGridCatalog.ts`
- `laravel/backend/app/Support/ErpGrid/Catalogs/ConsultaTransferenciasGridCatalog.php`
- `laravel/backend/app/Services/Reports/ErpReportLayoutService.php`
- `laravel/backend/app/Services/Interlojas/ConsultaRequisicoes/ConsultaRequisicoesRelatorioService.php`
- `laravel/backend/app/Application/ContasPagar/Relatorio/AccountsPayableReportMaterializer.php`
- `laravel/backend/app/Services/ContasPagar/Relatorio/AccountsPayableReportSnapshotStore.php`
- `laravel/backend/app/Application/ContasPagar/Relatorio/ViewAccountsPayableReportQuery.php`
- `laravel/backend/app/Domain/Fiscal/NfeAccessKey.php`
- `laravel/backend/resources/js/Components/erp/fiscal/NfeAccessKeyInput.tsx`
- `laravel/backend/resources/js/lib/nfeAccessKey.ts`
- `laravel/backend/tests/Support/CadastroRomaneios/CadastroRomaneios310Paths.php`
- `modules/entregas/cadastro-romaneios/pesquisa-padroes-laravel-reutilizaveis.md`
- `modules/interlojas/consulta-transferencias/pesquisa-padroes-laravel.md`
- `modules/entregas/cadastro-romaneios/schema/README.md`
- `modules/entregas/cadastro-romaneios/schema/postgresql-authoritative-2026-08-01.json`

