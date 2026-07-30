# Prompt Spec Kit — Relatório de Contas a Pagar

Copie o bloco abaixo como entrada de `/speckit.specify`.

```text
CONTEXTO E MISSÃO

Crie uma nova especificação para implementar no Laravel uma página completa de Relatório de Contas a Pagar. Gere a spec; não implemente a feature nesta etapa.

Use os termos canônicos Relatório de Contas a Pagar, Geração de Relatório e Fotografia de Relatório. As modalidades são Contas a Pagar, Contas por Competência e Pagamentos Efetuados. Não nomeie a segunda como “todas as Duplicatas”.

Antes de escrever, revalide o checkout Laravel vigente; os caminhos citados são baseline, não licença para inventar classes ou duplicar seams. Leia:

- modules/financeiro/contas-pagar/relatorio/dossie.md
- modules/financeiro/contas-pagar/relatorio/pesquisa-interface-parametros-delphi.md
- modules/financeiro/contas-pagar/relatorio/pesquisa-dados-layout-calculos-delphi.md
- modules/financeiro/contas-pagar/relatorio/pesquisa-infraestrutura-laravel.md
- CONTEXT.md
- C:/projetos.vcl/apps/contaspagar/fmrelatorioduplicatas.pas e .dfm
- C:/projetos.vcl/apps/contaspagar/dmrelatorioduplicatas.pas e .dfm
- laravel/backend/app/Services/Reports/ErpReportLayoutService.php
- laravel/backend/app/Support/Reports/ErpReportShellViewModel.php
- laravel/backend/resources/views/reports/layouts/erp-standard.blade.php
- laravel/backend/app/Support/Pdf/BrowsershotPdfGenerator.php
- fluxo do Relatório de Movimentação Diária vigente
- Policies, autorização modular, read models e testes vigentes de Contas a Pagar

REGRA CENTRAL

Cada solicitação cria uma Geração de Relatório assíncrona e materializa no máximo uma Fotografia de Relatório persistente, imutável, íntegra e autorizável. Visualização, PDF e impressão da mesma geração consomem exclusivamente essa fotografia e nunca reconsultam fatos financeiros. Não existe caminho síncrono alternativo nem resultado parcial.

O relatório é estritamente somente leitura e não cria nem altera fatos financeiros.

MODALIDADES E TEMPORALIDADE

Especifique:

- OPEN_PAYABLES / Contas a Pagar: somente Duplicatas não pagas; período principal por vencimento.
- ACCRUAL / Contas por Competência: Duplicatas abertas e pagas; período principal pela competência efetiva.
- PAID / Pagamentos Efetuados: somente Duplicatas pagas; período principal pela data de pagamento.

Em regime de caixa, ACCRUAL usa vencimento como competência efetiva e valor no vencimento como valor efetivo. Preserve na fotografia os valores/datas originais e efetivos.

Período principal e emissão são inclusivos. Exija pelo menos um intervalo; valide extremos e ordem.

FILTROS TIPADOS E CONDICIONAIS

Cubra modalidade, períodos, Filiais/Grupos de Filiais, Parte Fornecedora/Grupo, Tipo de Fornecimento M/P/T, Banco, Conta, Tipo de Pagamento, Previsões, Autorizadas, Adiantamentos, DDA, Evento, Documento, agrupamentos, ordenação e nível de detalhe.

Matriz:

- Previsões e Autorizadas somente em OPEN_PAYABLES.
- Tipo de Pagamento e Adiantamentos somente em ACCRUAL e PAID.
- Adiantamentos: WITH/WITHOUT/ONLY, padrão WITHOUT; em OPEN_PAYABLES excluir e ocultar controle.
- Banco: cobrança em OPEN_PAYABLES/ACCRUAL; banco da Conta de pagamento em PAID.
- Filtro desabilitado não é enviado nem fotografado ocultamente.

Evento e Documento devem ser árvores tipadas, validadas e parametrizadas, com campos/operadores permitidos, listas e AND/OR. Proíba SQL, macro, alias ou coluna arbitrária do browser. Persista a árvore normalizada e uma descrição legível impressa.

READ MODEL, MEDIDAS E GRUPOS

Crie read model analítico próprio para as três modalidades, sem herdar paginação ou teto das telas operacionais. Combine Duplicatas e Adiantamentos com origem explícita; Adiantamento é linha sintética, nunca parcela fictícia com identidade enganosa.

Preserve cinco medidas distintas em linhas, subtotais e totais:

1. valor no vencimento;
2. desconto cadastrado (valordesconto);
3. valor pago;
4. juros pagos = max(valor pago - valor no vencimento, 0);
5. desconto obtido no pagamento = valor no vencimento - valor pago, apenas quando pagamento não zero e inferior.

Valor líquido = valor no vencimento - desconto cadastrado. Nunca funda desconto cadastrado e desconto obtido.

Agrupamentos independentes: Grupo de Filiais, Filial, Parte Fornecedora, Data e Documento. Defina ordem determinística e subtotal das cinco medidas por nível. Modos: DETAIL_WITH_SUMMARY, DETAIL_ONLY e SUMMARY_ONLY.

CONTRATO DE APPLICATION

Especifique superfície equivalente a:

request(AccountsPayableReportRequest, OperatorContext): ReportGenerationAccepted
status(ReportGenerationId, OperatorContext): ReportGenerationStatus
cancel(ReportGenerationId, OperatorContext): ReportGenerationStatus
retry(ReportGenerationId, OperatorContext): ReportGenerationAccepted
view(ReportGenerationId, OperatorContext): AccountsPayableReportSnapshot
pdf(ReportGenerationId, OperatorContext): BinaryDocument

Controllers, Requests e React não conhecem SQL, detalhes de snapshot, storage ou Browsershot.

FOTOGRAFIA, ESTADOS E LIMITE

Estados: QUEUED, RUNNING, COMPLETED, FAILED, CANCELLED e EXPIRED. Cancelar apenas QUEUED/RUNNING, terminal e sem parcial. Retry cria novo ID ligado ao anterior; nunca sobrescreve geração terminal.

O job abre transação PostgreSQL somente leitura com snapshot consistente REPEATABLE READ ou equivalente, registra data_as_of e materializa envelope persistente contendo: UUID/vínculo anterior; versões do contrato/template; critérios normalizados e descrição; criador e Filiais; modalidade; linhas tipadas e dados originais/efetivos; grupos/ordem/subtotais/totais/contagens; moeda/formatação/orientação; timestamps; hash/integridade.

Limite rígido de 100.000 linhas. Ao exceder: FAILED, sem fotografia, preview ou PDF parcial, com orientação para refinar filtros. COMPLETED somente após persistência, hash e reconciliação de contagens/subtotais/totais.

Retenção de 7 dias. Depois, EXPIRED e conteúdo/artefatos removidos conforme política, preservando metadados de auditoria necessários.

Não use GerarJobStore, HTML ao vivo, PDF ou cache temporário como fonte canônica. A infraestrutura de job/cache pode auxiliar execução e polling, mas a fotografia persistente é a autoridade.

UX, HTML, PDF E IMPRESSÃO

Adicione item irmão no hub de Contas a Pagar. Na página: filtros principais no topo; avançados recolhíveis; agrupamentos/saída em seção própria; acompanhamento de estado; histórico do Usuário nos últimos 7 dias com critérios resumidos e ações válidas.

A fotografia concluída abre em rota própria e a tela de filtros permanece disponível. Cubra loading, fila, execução, vazio, conclusão, falha, cancelamento, expiração, 403/perda de Filial, limite e falha de PDF. Polling não duplica geração. Erros são acionáveis e não expõem SQL ou dados fora do escopo.

Use ErpReportLayoutService, shell Blade padrão e BrowsershotPdfGenerator. Detalhado usa paisagem; SUMMARY_ONLY usa retrato. Orientação e versão do template integram a fotografia. Cabeçalho institucional da empresa; critérios listam todas as Filiais, sem fingir que uma Filial representa o escopo multi-Filial.

Repita cabeçalhos de coluna, evite quebrar grupos/subtotais quando couberem e marque continuação inevitável. Templates Laravel são versionados/determinísticos; não execute nem importe `.fr3` ou overrides externos.

PDF é derivado sob demanda da fotografia e pode ser armazenado ligado à geração. Falha de PDF não invalida a fotografia. Imprimir usa o navegador sobre a mesma visualização/template; não integre impressora do servidor.

SEGURANÇA E AUDITORIA DE RELATÓRIO

Crie abilities técnicas próprias de visualizar e gerar, derivadas da Permissão de consulta de Contas a Pagar. Em request, status, histórico, cancel, retry, view, PDF e impressão, revalide ability e acesso atual a todas as Filiais fotografadas. UUID/link nunca é autorização. Outro Usuário só acessa se possuir Permissão e todo o escopo.

Mantenha defesa dupla: aplicação resolve/intersecta Filiais autorizadas e repositório sempre restringe o SQL pelas Filiais resultantes. Payload não é autoridade.

Audite criação, visualização, download de PDF, impressão e cancelamento com Usuário, instante, geração e Filiais. É Auditoria de Relatório operacional, não Movimento financeiro. Não grave senha, token de sessão ou segredo.

ACESSIBILIDADE

Filtros, histórico e ações operáveis por teclado, foco visível, nomes acessíveis e anúncios adequados de mudanças assíncronas sem roubar foco. Situação/erro não dependem só de cor. Tabelas têm cabeçalhos semânticos, contraste, hierarquia e leitura coerente em ampliação.

BASELINE A PRESERVAR/CORRIGIR/CRIAR

Preserve/aprofunde hub Inertia, Policies/autorização modular, dupla defesa de Filiais, ErpReportLayoutService, Blade corporativo, Browsershot e separação filtro/query/mapeamento/grupos/totais da Movimentação Diária.

Reutilize joins e normalizações dos read models aberto/pago como evidência, mas crie read model do relatório. Não herde paginação/limites operacionais.

Corrija, para este relatório, reconsulta independente de HTML/PDF. Crie envelope persistente, estados, histórico, retenção, cancel/retry, abilities, Auditoria e template detalhe/resumo. Não duplique shell, PDF ou resolução de Filiais.

TESTES OBRIGATÓRIOS

Unitários: matriz de filtros; normalização; estados/transições; orientação; grupos/ordem; cinco medidas; líquido; descontos distintos; descrição legível das condições.

PostgreSQL real: três modalidades/temporalidades; regime de caixa; Duplicatas/Adiantamentos; todos os filtros; agrupamentos/totais; snapshot consistente sob alteração concorrente; integridade; expiração; limite 100.000; ausência de parcial; schema incompatível falha explicitamente.

Autorização: criador; outro Usuário integralmente autorizado; perda de Permissão; perda de uma Filial; UUID enumerado; todas as rotas e ações; SQL sempre limitado ao escopo.

Assíncrono: sucesso; falha; cancel antes/durante; retry com novo ID; polling idempotente; retenção/cleanup; PDF sob demanda sem reconsulta; falha do renderer sem invalidar fotografia.

Contrato: HTML, PDF e impressão recebem exatamente o mesmo generation_id, critérios, linhas, grupos, contagens e totais.

Renderização: Blade/view model determinístico sempre executável; smoke Browsershot para orientação, cabeçalhos, quebras, rodapés e impressão quando Chromium existir. Nenhuma regra financeira, autorização ou fotografia pode depender apenas de teste que possa ser skipped.

Desempenho: cenário próximo de 100.000 linhas registra duração/memória, confirma job assíncrono e detecta N+1. Use a primeira medição como baseline operacional antes de fixar SLA absoluto.

Acessibilidade/frontend: teclado, foco, nomes, live regions, tabela semântica, contraste, polling, cancel, retry e estados. Nenhum teste PostgreSQL crítico pode ficar skipped/incomplete.

FASES E GATES

P0 revalidar código/schema/rotas/Policies/fila/storage/testes e fechar matriz de campos.
P1 requests tipados, compilador seguro, read model, cálculos/grupos e testes PostgreSQL.
P2 fotografia persistente, job/snapshot consistente, integridade, limite, retenção, estados, cancel/retry e autorização.
P3 página/histórico, template, view/PDF/impressão e Auditoria de Relatório.
P4 concorrência, desempenho, acessibilidade, observabilidade, documentação e regressão.

Rota/menu só liberados após filtros/cálculos verdes em PostgreSQL, autorização de todas as Filiais provada em todas as ações e identidade entre view/PDF/impressão demonstrada. Use feature flag gradual se o módulo já possuir esse padrão.

FORA DO ESCOPO E PROIBIDO

Não alterar Delphi; reproduzir FastReport pixel a pixel; executar/importar .fr3; exportar Excel/CSV; criar/alterar fatos financeiros; aceitar SQL/macros do browser; confiar Filial do payload; usar UUID como autorização; reconsultar fatos para view/PDF/impressão; tratar PDF/cache como fotografia; paginar o conjunto gerado; publicar parcial; fundir descontos; ocultar falhas.

SAÍDA ESPERADA

Produza uma spec autocontida pronta para /speckit.clarify e /speckit.plan, sem investigação funcional aberta. Inclua jornadas e casos priorizados; requisitos numerados; entidades/estados/invariantes; contratos HTTP/Application; matriz de filtros/modalidades; contrato de linha/grupos/totais; armazenamento/retenção/integridade; jobs/cancel/retry; abilities/Filiais/Auditoria; UX/acessibilidade; erros observáveis; critérios mensuráveis; matriz de testes; matriz preservar/corrigir/criar; fases/gates; documentação para Usuário, suporte, operação e arquitetura; caminhos vigentes a preservar/corrigir e novos componentes realmente necessários.
```
