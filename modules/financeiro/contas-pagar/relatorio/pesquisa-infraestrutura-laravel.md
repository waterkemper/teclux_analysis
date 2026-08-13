# Pesquisa — infraestrutura Laravel para o Relatório de Contas a Pagar

## Escopo e conclusão

O Laravel já oferece uma base reutilizável para uma página Inertia de relatório, leitura do legado com escopo de Filiais, geração HTML/PDF pelo mesmo Blade e shell corporativo de impressão. O seam mais próximo é o Relatório de Movimentação Diária, não as impressões operacionais de Contas a Pagar. A lacuna decisiva é a fotografia imutável: os relatórios atuais remontam o view model e consultam o banco separadamente no HTML e no PDF; o armazenamento assíncrono existente é cache temporário de resultados, não um snapshot persistente e autorizável.

## Superfície atual de Contas a Pagar

- O hub é uma página Inertia e hoje lista Tipos de Pagamentos, Documentos a Pagar, Autorização/Desautorização, Quitação em Lote e Estorno em Lote. O novo relatório tem um seam natural como item irmão no mesmo hub; ainda não existe item ou página de relatório (`laravel/backend/app/Http/Controllers/ContasPagar/ContasPagarHubController.php:12-53`).
- A autorização do módulo é centralizada em `ContasPagarModuleAccessService`, com administrador ou vínculo entre rota Cloud e `usuariosacessosmodulos`; a lista de rotas reconhecidas ainda não inclui relatório (`laravel/backend/app/Services/Authorization/ContasPagarModuleAccessService.php:15-53`, `:59-69`).
- `DocumentoPagPolicy` já separa abilities de leitura, pagamentos e impressão operacional, mas não possui abilities de visualizar/gerar relatório (`laravel/backend/app/Policies/ContasPagar/DocumentoPagPolicy.php:17-27`, `:74-100`, `:125-130`). Convém aprofundar esse seam com abilities próprias do relatório, derivadas da permissão funcional acordada, em vez de autorizar apenas pela rota.
- As impressões atuais de Contas a Pagar são documentos operacionais: autorização e recibo. Há rota POST para PDF de autorização (`laravel/backend/routes/web.php:3036-3037`) e queries específicas `PrintPaymentAuthorizationQuery`/`PrintPaymentReceiptQuery`; elas não formam um read model analítico reutilizável.
- `DispatchBatchPaymentPrintJob` é apenas um stub pós-commit que registra recibo/cheque enfileirado; não renderiza nem armazena PDF (`laravel/backend/app/Jobs/ContasPagar/DispatchBatchPaymentPrintJob.php:14-38`). Não deve ser tratado como infraestrutura pronta para este relatório.

## Read models e filtros reaproveitáveis

- `LegacyBatchPaymentReadRepository` já demonstra o padrão de read model de Duplicatas abertas: consulta `duplicatas`, `documentospag`, `vfornecedores` e `eventos`, restringe por `filialemissao`, exclui previsões, exige `datapagto IS NULL` e autorização, e aplica interseção defensiva entre Filiais autorizadas e solicitadas (`laravel/backend/app/Infrastructure/Persistence/Legacy/ContasPagar/LegacyBatchPaymentReadRepository.php:109-168`, `:170-200`). Ele também expõe campos centrais de vencimento, valores, desconto, juros, multa, fornecedor, evento e complementos (`:109-138`).
- Esse repositório é paginado (`offset/limit`) e orientado à operação de quitação, não ao relatório (`LegacyBatchPaymentReadRepository.php:56-103`). Portanto, preservar joins, normalização e regras comprovadas, mas criar um read model de relatório que produza as três modalidades e seus agrupamentos/totais sem acoplar a paginação operacional.
- `LegacyBatchPaymentReversalReadRepository` cobre Duplicatas pagas, incluindo valor/data/Filial/Conta/Cheque de pagamento, fornecedor e documento (`laravel/backend/app/Infrastructure/Persistence/Legacy/ContasPagar/LegacyBatchPaymentReversalReadRepository.php:109-134`). Ele restringe por Filiais autorizadas e `datapagto IS NOT NULL`, aceita filtro de período de pagamento, fornecedor e conta (`:141-188`). É a principal fonte de regras já implementadas para a modalidade “pagamentos efetuados”.
- O mesmo repositório rejeita consulta acima de 2.000 linhas e carrega tudo sem paginação (`LegacyBatchPaymentReversalReadRepository.php:49-76`). Esse teto pertence à tela de estorno e não deve ser herdado automaticamente por um relatório; o relatório precisa de limite/estratégia pesada próprios.
- `LegacyDuplicataRepository` é CRUD de parcelas por Documento e não serve como consulta global; seu mapeamento confirma os campos persistidos relevantes (`datavencto`, `valorvencto`, desconto, juros, multa, `datapagto`, `valorpagto`, Filial/Conta/Cheque de pagamento, evento e observação) (`laravel/backend/app/Infrastructure/Persistence/Legacy/ContasPagar/LegacyDuplicataRepository.php:289-323`).

## Shell, HTML, PDF e impressão

- `ErpReportLayoutService` é o seam corporativo a preservar: resolve data/hora, logo, dados institucionais da Filial, orientação e cor zebrada; `wrapViewData` injeta shell, CSS padrão e CSS do módulo (`laravel/backend/app/Services/Reports/ErpReportLayoutService.php:22-41`, `:44-72`).
- `ErpReportShellViewModel` define título, emissão, logo, orientação, dados institucionais e repetição de cabeçalhos (`laravel/backend/app/Support/Reports/ErpReportShellViewModel.php:11-50`).
- O layout Blade padrão monta cabeçalho, corpo e rodapé e suporta retrato/paisagem e formatos especiais (`laravel/backend/resources/views/reports/layouts/erp-standard.blade.php:1-31`). O Relatório de Contas a Pagar deve estender esse layout e fornecer apenas corpo/partials e CSS próprio.
- `BrowsershotPdfGenerator` converte o HTML em PDF via Node/Chromium, aplica mídia de impressão, fundos, margens, A4/paisagem e cabeçalho/rodapé Puppeteer (`laravel/backend/app/Support/Pdf/BrowsershotPdfGenerator.php:11-33`, `:63-109`, `:127-161`). Esse é o gerador padrão a preservar.
- O Relatório de Movimentação Diária é a referência de fluxo: endpoint HTML monta um view model e devolve o Blade com `private, no-store`; endpoint PDF monta o mesmo tipo de view model, renderiza o mesmo Blade e passa o HTML ao Browsershot inline (`laravel/backend/app/Http/Controllers/Estoque/MovimentacaoDiariaController.php:174-222`). Seu service separa compilação de filtros, leitura, mapeamento, agrupamento, totais, labels e shell (`laravel/backend/app/Services/Estoque/MovimentacaoDiariaRelatorioService.php:37-150`).
- Esse padrão garante paridade de código, mas não de dados: HTML e PDF chamam `buildRelatorioViewModel` separadamente (`MovimentacaoDiariaController.php:182-186`, `:202-211`). Para cumprir a fotografia imutável, o novo relatório deve gerar uma vez um dataset canônico/snapshot e fazer preview, PDF e impressão lerem essa mesma identidade.

## Filiais, Policies e defesa em profundidade

- A referência de relatórios resolve Filiais no service, expandindo grupos e submetendo a seleção ao acesso autorizado; conjunto vazio é erro (`laravel/backend/app/Services/Estoque/MovimentacaoDiariaRelatorioService.php:173-191`). Esse padrão deve ser preservado: a Filial do payload jamais é autoridade por si só.
- Em Contas a Pagar, os read models existentes recebem `filial_ids` já autorizados e ainda intersectam a seleção pedida antes do SQL (`LegacyBatchPaymentReadRepository.php:67-80`, `:170-180`; `LegacyBatchPaymentReversalReadRepository.php:51-62`, `:152-163`). A nova consulta deve manter as duas camadas: resolução de escopo na aplicação e `whereIn` obrigatório no repositório.
- O shell institucional resolve dados para a requisição e o cabeçalho não deve substituir o escopo do dataset (`ErpReportLayoutService.php:28-38`). Em relatório multi-Filial, a especificação precisa decidir qual identidade institucional aparece e imprimir explicitamente as Filiais filtradas.

## Jobs, armazenamento e fotografia

- Há infraestrutura genérica de consultas pesadas: controllers podem despachar jobs e consultar status usando `DispatchesHeavyGerarJob`, `ResolvesHeavyGerarJobHttp` e `GerarJobStore` (integração visível em `MovimentacaoDiariaController.php:7-9`, `:41-54`, `:124-140`).
- `GerarJobStore` salva payload/status/result em `Cache` por 86.400 segundos; `markReady` guarda `rows` e `meta` no próprio cache (`laravel/backend/app/Support/Database/GerarJobStore.php:10-35`, `:59-81`). Isso é útil para processamento e polling, mas não fornece durabilidade, imutabilidade, vínculo ao Operador/escopo ou download posterior garantido.
- Os jobs pesados atuais, como `GerarMovimentacaoDiariaJob`, alimentam esse cache; `HeavyReportsQueue`/`HeavyReportsTimeout` centralizam fila e timeout. São seams a preservar para datasets grandes, mas precisam ficar atrás de um serviço de geração do relatório, não dentro do read model.
- Não foi encontrada fotografia persistente de relatório em Contas a Pagar nem armazenamento de PDF gerado. O único storage central de relatórios identificado é o de logotipo (`ReportLogoService`, disco local privado, `laravel/backend/app/Services/Reports/ReportLogoService.php:10-17`, `:104-156`), que não deve ser reutilizado para snapshots.
- Recomendação de seam: criar um envelope de geração persistente com UUID, hash dos filtros normalizados, Operador, escopo de Filiais, modalidade, estado, timestamps e referência ao dataset/PDF imutável; preview e PDF devem autorizar o dono/escopo e consumir esse envelope. O job pode produzir o envelope, mas o cache genérico não pode ser a fonte canônica.

## Testes disponíveis e lacunas

- O shell tem teste de integração que verifica cabeçalho, marca Tecsoft, título, página, data e logo (`laravel/backend/tests/Feature/Reports/ErpReportLayoutServiceTest.php:24-46`). Há ainda testes unitários dedicados a templates Browsershot, layout de grade larga e cor zebrada em `tests/Unit/Reports/`.
- `MovimentacaoDiariaRelatorioTest` cobre resposta HTML, modos/agrupamentos, validação, vazio, Filiais e PDF (`laravel/backend/tests/Feature/Estoque/MovimentacaoDiariaRelatorioTest.php:110-266`, `:315-440`). Contudo, o teste de PDF aceita `markTestSkipped` quando Browsershot/Node não está disponível (`:332-340`); para o novo relatório, testes críticos de fotografia e conteúdo não devem depender exclusivamente de um renderer opcional.
- Contas a Pagar tem ampla suíte PostgreSQL para pagamentos e estornos e testes de impressão de autorização/recibo, mas nenhum teste de relatório analítico. Reutilizar factories/helpers e cenários financeiros dessas suítes para provar aberto/todas/pago, Filiais e somatórios; adicionar testes do snapshot (imutabilidade após alteração no banco, acesso por outro Operador, expiração), equivalência HTML/PDF a partir do mesmo dataset e contrato de falha/timeout.
- A renderização pode ser testada em duas camadas: Blade/view model determinístico sempre executável e um smoke de Browsershot no ambiente que possua Chromium. Não deixar a correção dos totais e da fotografia coberta apenas por teste que pode ser pulado.

## Seams recomendados para a especificação

### Preservar

1. Página Inertia e item no hub de Contas a Pagar.
2. Policy/authorization service e dupla restrição de Filiais.
3. Queries legadas via repositório, com normalização explícita.
4. `ErpReportLayoutService`, layout `reports.layouts.erp-standard` e `BrowsershotPdfGenerator`.
5. Separação entre filtros, compilador/query, mapeamento, agrupamento/totais e view model observada na Movimentação Diária.
6. Infraestrutura de job pesado, polling, timeout e cancelamento quando o volume justificar.

### Aprofundar/criar

1. Read model próprio do Relatório de Contas a Pagar, capaz de representar as três modalidades sem herdar paginação ou limites operacionais.
2. Contrato canônico de filtros, ordenação, agrupamentos, linhas e totais, usado tanto pelo preview quanto pelo documento.
3. Fotografia persistente e imutável por geração, autorizada por Operador e Filiais, com retenção e limpeza definidas.
4. Endpoints separados para gerar/consultar a fotografia, visualizar HTML e obter PDF, todos referenciando o mesmo ID de geração.
5. Abilities específicas de visualizar e gerar relatório, incluídas na rota reconhecida pelo módulo.
6. Testes de paridade, imutabilidade, escopo multi-Filial, modalidades, agrupamentos, totais, concorrência/alteração após geração e execução PostgreSQL real.

## Fontes primárias consultadas

Todos os caminhos citados acima são código-fonte e testes do checkout Laravel atual em `laravel/backend`; não foram usadas fontes secundárias.
