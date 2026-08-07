# Pesquisa — reuso Laravel para o Relatório de Situação dos Fornecedores

## Conclusão executiva

Após os pulls, o Relatório de Contas a Pagar não é mais apenas uma especificação: existe uma implementação ponta a ponta com página Inertia, geração assíncrona, envelope persistente, Fotografia de Relatório em storage privado, integridade, histórico, cancelamento/retry, autorização por ability e Filiais, HTML, PDF derivado e impressão pelo navegador.

Para Situação dos Fornecedores, esse pipeline deve ser reutilizado diretamente. A lacuna funcional mínima é um read model/materializador específico que produza **Documento a Pagar como cabeçalho**, vencimentos como detalhe e **Saldo Devedor na Data de Situação** com temporalidade histórica. A infraestrutura atual trabalha com linhas de Duplicata/Adiantamento e estado presente (`datapagto IS NULL`/`IS NOT NULL`), portanto não resolve esse saldo histórico por mera configuração.

## Estado revalidado do Relatório de Contas a Pagar

O dossiê original descrevia como lacunas o envelope persistente, histórico e abilities (`modules/financeiro/contas-pagar/relatorio/dossie.md:37-47`). Essas lacunas foram implementadas no checkout atual:

- rotas protegidas para página, gerar, status, cancelar, retry, fotografia e PDF (`laravel/backend/routes/web.php:719-745`);
- página no hub e rota modular própria (`laravel/backend/app/Http/Controllers/ContasPagar/ContasPagarHubController.php:57-66`; `laravel/backend/app/Services/Authorization/ContasPagarModuleAccessService.php:29`);
- tabela de gerações com UUID, situação, modalidade, critérios, Filiais, Operador, versões, `data_as_of`, integridade, caminhos de snapshot/PDF, falha, retenção e vínculo de retry (`laravel/backend/database/migrations/2026_07_28_160000_create_cloud_contas_pagar_relatorio_geracoes_table.php:17-50`);
- jobs próprios para materialização e PDF (`laravel/backend/app/Jobs/Erp/GerarRelatorioContasPagarJob.php`; `laravel/backend/app/Jobs/Erp/GerarPdfRelatorioContasPagarJob.php`);
- fotografia JSON e PDF no storage privado, por `generation_id` (`laravel/backend/app/Services/ContasPagar/Relatorio/AccountsPayableReportSnapshotStore.php:18-35`, `:41-58`, `:66-86`);
- UI React completa com persistência dos filtros na sessão, polling, cancelamento, histórico, abertura da fotografia e PDF (`laravel/backend/resources/js/Pages/Cadastros/ContasPagar/Relatorio/Index.tsx:18-43`, `:181-315`, `:335-447`, `:541-623`);
- visualização que lê exclusivamente o snapshot, oferece PDF e chama `window.print()` (`laravel/backend/resources/js/Pages/Cadastros/ContasPagar/Relatorio/View.tsx:655-717`).

## Matriz de reuso direto e lacunas

### Filtros

**Reuso direto**

- O request já valida período, Filiais/Grupos, Parte Fornecedora, Grupo de Fornecedor, tipos de fornecimento e modos de agrupamento/ordenação (`laravel/backend/app/Http/Requests/ContasPagar/RelatorioContasPagarRequest.php:23-57`).
- O normalizador expande Grupos de Filiais, usa todas as Filiais autorizadas quando a seleção está vazia e intersecta a seleção do Operador com o escopo autorizado (`laravel/backend/app/Services/ContasPagar/Relatorio/AccountsPayableReportFilterNormalizer.php:29-47`, `:75-108`).
- Os lookups existentes de Filiais, Grupos de Filiais, fornecedores e Grupos de Fornecedores podem alimentar a nova tela; o controller já publica esses endpoints e defaults (`laravel/backend/app/Http/Controllers/ContasPagar/RelatorioContasPagarController.php:53-90`, `:104-160`).
- Os componentes visuais e padrões de estado de `RelatorioFiltrosPanel`/`Index` podem ser extraídos ou parametrizados, preservando polling, erros, histórico e acessibilidade.

**Lacunas mínimas**

- Criar um request/normalizador fino para os filtros que o Delphi comprovar: data inicial, Data de Situação, Filiais/Grupos e Parte/Grupo de Fornecedor, sem expor modalidades e controles irrelevantes do Relatório de Contas a Pagar.
- Não reutilizar `stripDisabledControls()` como regra de Situação: ele é acoplado às modalidades `OPEN_PAYABLES`, `ACCRUAL` e `PAID` (`AccountsPayableReportFilterNormalizer.php:54-68`). Reutilizar a resolução de Filiais em um seam compartilhado e manter a normalização específica do relatório.

### Read model e saldo histórico

**Reuso direto**

- Os joins e nomes canônicos já comprovados — `documentospag`, `duplicatas`, `vfornecedores`, `filiais`, Evento, Nota e dados da Parte — estão concentrados em `LegacyAccountsPayableReportRepository` (`laravel/backend/app/Infrastructure/Persistence/Legacy/ContasPagar/LegacyAccountsPayableReportRepository.php:189-249`).
- Os filtros parametrizados de Filial, Parte e Grupo de Fornecedor podem ser extraídos/reaplicados; o SQL atual nunca confia em Filiais sem `IN` e usa bindings (`:144-145`, `:243-253`, `:408-427`).

**Não reutilizar como resposta funcional**

- O repositório atual tem granularidade de Duplicata/Adiantamento e escolhe estado atual por modalidade: aberta é `datapagto IS NULL`, paga é `IS NOT NULL`, competência aceita ambas (`LegacyAccountsPayableReportRepository.php:147-153`). Isso não responde “quanto o Documento devia na Data de Situação”.
- O período atual varia entre vencimento, pagamento e competência (`:362-384`) e a coluna “situação” calcula distância até `CURRENT_DATE`, não até uma data fotografada (`:218-221`).
- O materializador atual mapeia e totaliza linhas de parcela; Situação dos Fornecedores exige Documento como identidade/cabeçalho e vencimentos filhos. Apenas mudar agrupamento para `DOCUMENT` não resolve valor total, saldo histórico nem seleção temporal.

**Lacuna mínima**

- Criar um read repository/query específico para Situação dos Fornecedores, ainda sob `Infrastructure/Persistence/Legacy/ContasPagar`, que selecione Documentos no intervalo decidido, carregue seus vencimentos e derive o estado/saldo na Data de Situação com regras explícitas para pagamento posterior, pagamento até a data, descontos/juros e movimentos retroativos.
- Criar DTO/mapper de `DocumentoSituacao` com identidade do Documento, Parte, Filial, valor total, saldo histórico e lista ordenada de vencimentos. O agrupador/totais genéricos só deve receber essa projeção depois de fechado o contrato histórico.
- PostgreSQL real é obrigatório porque o read model atual contém SQL PostgreSQL (`NULL::smallint`, lateral joins e aritmética de datas; `LegacyAccountsPayableReportRepository.php:156-171`, `:236-242`).

### Geração, Fotografia e integridade

**Reuso direto**

- Estados, criação, cancelamento, retry, retenção, `previous_generation_id`, status/polling e expiração devem permanecer os mesmos. O repository já implementa transições e histórico do Operador (`laravel/backend/app/Infrastructure/Persistence/Cloud/ContasPagar/AccountsPayableReportGenerationRepository.php:21-52`, `:138-265`, `:283-352`).
- `AccountsPayableReportMaterializer` já faz limite, cancelamento cooperativo, ordenação, cálculo, reconciliação, hash, persistência da fotografia e despacho do PDF (`laravel/backend/app/Application/ContasPagar/Relatorio/AccountsPayableReportMaterializer.php:40-99`, `:128-200`).
- O envelope já contém versões, `data_as_of`, critérios, Operador, Filiais, ordenação, linhas/grupos/totais e integridade (`AccountsPayableReportMaterializer.php:139-172`). `AccountsPayableReportSnapshotStore` e `AccountsPayableReportIntegrityService` devem ser reutilizados.

**Lacunas mínimas**

- A tabela possui `modality`, mas não identifica a família/tipo de relatório (`cloud_contas_pagar_relatorio_geracoes`: colunas em `2026_07_28_160000...php:18-40`). Acrescentar um discriminador versionado de tipo de relatório — ou um equivalente inequívoco no envelope/repository — para impedir que histórico, materializador e template confundam Situação dos Fornecedores com as três modalidades atuais. Não sobrecarregar `ReportModality` com uma semântica que não é modalidade do mesmo relatório.
- Introduzir uma estratégia/materializador por tipo de relatório, reutilizando o orquestrador de geração, em vez de copiar jobs, storage, estados e comandos. A estratégia de Situação produz o envelope hierárquico Documento/vencimentos e seus totais.
- Incluir no hash e reconciliação o valor total do Documento, saldo na data, vencimentos e totais por fornecedor/Filial. `SUMMARY_ONLY` atualmente pode omitir linhas (`AccountsPayableReportMaterializer.php:109-137`); não adotar esse comportamento sem decidir se ele preserva evidência suficiente do saldo histórico.
- Persistir explicitamente a Data de Situação nos critérios e, se necessário, distinguir `data_as_of` técnico (instante da consulta) da data histórica funcional.

### Autorização, Auditoria e histórico

**Reuso direto**

- A Policy atual deriva `viewReport` e `generateReport` do acesso modular (`laravel/backend/app/Policies/ContasPagar/RelatorioContasPagarPolicy.php:10-24`).
- `AccountsPayableReportAuthorizationGuard` revalida ability e todas as Filiais fotografadas em cada operação; UUID não é autorização (`laravel/backend/app/Application/ContasPagar/Relatorio/AccountsPayableReportAuthorizationGuard.php:15-72`).
- O histórico é limitado ao Operador e à retenção configurada e fornece ações/URLs por estado (`laravel/backend/app/Application/ContasPagar/Relatorio/AccountsPayableReportHistoryQuery.php:23-53`).
- O audit writer/tabela existentes cobrem eventos operacionais da geração; devem registrar o novo tipo de relatório, mantendo a mesma trilha.

**Lacunas mínimas**

- Decidir se Situação dos Fornecedores compartilha a mesma Permissão funcional do Relatório de Contas a Pagar. Mesmo compartilhando, criar rota/menu reconhecível e abilities técnicas do novo recurso ou parametrizar a Policy por tipo, sem depender apenas da ability do relatório existente.
- O histórico precisa filtrar/rotular o tipo do relatório; caso contrário, a página atual exibirá gerações heterogêneas como se fossem modalidades de Contas a Pagar.
- Revalidar o escopo atual de todas as Filiais também em status, cancel, retry, view, PDF e impressão, usando o mesmo guard.

### HTML, PDF e impressão

**Reuso direto**

- `AccountsPayableReportRelatorioService` monta view data exclusivamente da fotografia, enriquece resumo, escolhe template/orientação e gera PDF via `BrowsershotPdfGenerator` (`laravel/backend/app/Services/ContasPagar/Relatorio/AccountsPayableReportRelatorioService.php:30-69`, `:79-115`).
- O shell corporativo, logo, cabeçalho/rodapé, CSS de impressão e Browsershot continuam sendo autoridade arquitetural; os Blades atuais estendem `reports.layouts.erp-standard` (`laravel/backend/resources/views/reports/contas-pagar/relatorio/detalhe.blade.php`; `resumo.blade.php`).
- A fotografia React e a impressão pelo navegador já garantem que visualizar/imprimir não reconsultem fatos (`View.tsx:655-717`). O PDF persistido é derivado da mesma fotografia.

**Lacunas mínimas**

- Adicionar template/partial específico para cabeçalho de Documento e linhas de vencimento, com agrupamentos/totais determinados pelo legado. Não tentar adaptar `_detalhe-pagamentos` ou `_detalhe-competencia`, pois ambos assumem uma linha financeira plana.
- Parametrizar `AccountsPayableReportRelatorioService` por tipo/template, mantendo um único shell e renderer.
- Criar uma view React específica ou um renderer de snapshot discriminado; a atual lê `lines`, `layout_rows`, `groups` e modalidades do Relatório de Contas a Pagar (`View.tsx:665-673`).

### Testes

**Reuso direto**

- Há testes unitários para estados, normalização de Filiais, integridade/hash, agrupamento, orientação, medidas e layout (`laravel/backend/tests/Unit/ContasPagar/Relatorio/`).
- Há features para request/permissão, lookups, criação/status e ciclo assíncrono (`laravel/backend/tests/Feature/ContasPagar/Relatorio/RelatorioContasPagarRequestTest.php:11-42`; `RelatorioContasPagarAuthorizationTest.php:16-83`; `RelatorioContasPagarAsyncLifecycleTest.php:16-73`).
- `RelatorioContasPagarFixtures` pode ser ampliado para montar Documentos e vencimentos sem duplicar toda a infraestrutura de testes.

**Lacunas mínimas e riscos atuais**

- A suíte existente não contém teste PostgreSQL do Relatório de Contas a Pagar; o lifecycle explicitamente testa SQLite (`RelatorioContasPagarAsyncLifecycleTest.php:16`). Situação dos Fornecedores precisa provar o SQL e a temporalidade em PostgreSQL real.
- Criar matriz histórica: Documento aberto na data; pago depois; pago até a data; pagamentos/alterações retroativos; múltiplos vencimentos parcialmente liquidados; fora do intervalo; limites exatos; Filiais e Partes; total do Documento versus soma dos vencimentos; saldo por fornecedor e geral.
- Provar que alterar fatos após concluir a geração não muda HTML/PDF/impressão; que retry cria novo ID/data técnica; que perda de uma Filial bloqueia todas as ações; e que histórico não mistura tipos incorretamente.
- Reutilizar os testes de estados/storage/authorization como contrato parametrizado por tipo de relatório. Acrescentar testes Blade/view model determinísticos; regras de saldo não podem depender de smoke Browsershot passível de skip.

## Seam recomendado

```text
Pipeline compartilhado de Geração de Relatório de Contas a Pagar
  ├─ estados, repository de geração, jobs, storage, hash, retenção
  ├─ autorização, Auditoria, histórico, polling, cancel/retry
  ├─ shell corporativo, PDF e impressão
  └─ estratégia por report_type
       ├─ RELATORIO_CONTAS_PAGAR → materialização atual
       └─ SITUACAO_FORNECEDORES → read model histórico + Documento/vencimentos
```

Esse seam cria somente o discriminador e a estratégia funcional necessários. Ele evita uma segunda tabela de gerações, outro storage, novos estados, outro mecanismo de histórico ou cópia dos jobs/controllers.

## Fontes primárias consultadas

Foram consultados exclusivamente os artefatos em `modules/financeiro/contas-pagar/relatorio/` e o código, migrations, views e testes atuais de `laravel/backend`. Nenhuma fonte externa ou secundária foi usada.
