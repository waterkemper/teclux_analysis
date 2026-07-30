# Prompt Spec Kit — Quitação em Lote de Duplicatas

Copie o conteúdo do bloco abaixo como entrada de `/speckit.specify` no Cursor.

```text
CONTEXTO E MISSÃO

Crie uma nova especificação para implementar no Laravel a página completa de Quitação em Lote de Duplicatas em Contas a Pagar. Gere a spec, não implemente a feature nesta etapa.

Antes de escrever a especificação, analise novamente o Laravel vigente. O código pode ter mudado: procure primeiro abstrações equivalentes e trate nomes de classes/rotas abaixo como baseline a confirmar, não como licença para duplicar componentes. Confronte o estado atual com:

- modules/financeiro/contas-pagar/quitacao-em-lote/dossie.md
- modules/financeiro/contas-pagar/quitacao-duplicata/dossie.md
- modules/financeiro/contas-pagar/autorizacao-pagamentos/dossie.md
- C:/projetos.vcl/apps/contaspagar/dmquitacaoduplicatas.pas e .dfm
- C:/projetos.vcl/apps/contaspagar/fmquitacaoduplicatas.pas e .dfm
- C:/projetos.vcl/apps/contaspagar/dmcontaspagar.pas, especialmente QuitarDuplicatas
- C:/projetos.vcl/biblio/clparametrossistema.pas
- laravel/specs/196-contas-pagar-quitacao/
- laravel/docs/adr/0002-erp-ui-interaction-decisions.md
- laravel/docs/adr/0005-parametros-sistema.md, ou ADR vigente equivalente
- laravel/docs/adr/0007-schema-fail-fast.md, ou ADR vigente equivalente
- laravel/docs/adr/0246-documentos-pagar-financial-commands.md
- laravel/docs/adr/0247-duplicata-paga-imutavel-estorno-unico.md

Esta é uma nova feature de Quitação em Lote, mas deve aprofundar o módulo Contas a Pagar atual. Não recrie a Quitação individual nem crie arquitetura paralela. Preserve e reutilize Policies, Filiais, Sensitive Operation, ParameterService/parametros_valor, revisão, idempotência, repositories/locks, Writer origem P, Contabilidade, tributos, reconciliador, Auditoria, UI ERP e testes já existentes.

REGRA CENTRAL

Um lote é uma única intenção financeira atômica. Todas as Duplicatas devem estar com Autorização de Pagamento vigente antes do lote. Qualquer item não autorizado, pago, fora do escopo, incompatível ou alterado concorrentemente rejeita o lote inteiro. Nunca há sucesso parcial.

Todas as perguntas de pagamento parcial são respondidas antes de qualquer persistência. Cancelar em qualquer pergunta encerra o lote com zero efeitos. Nenhuma transação aguarda Usuário ou impressora.

BASELINE A CORRIGIR, NÃO DUPLICAR

Na revalidação de 2026-07-24, o Laravel possuía PayDuplicataCommand e PayDuplicatasBatchAdapter. O adapter apenas iterava o command individual, gerando commits/idempotências independentes. PayDuplicataCommand misturava autorização, cálculo, parcial, transação e writers; permitia autorização implícita, pagamento zero, residual com MAX+1 e gravava movimento com documento/histórico incorretos. ContasPagarMovimentoBancarioWriter não retornava vínculo evento/sequenciaevento completo.

Confirme o estado atual. Se essas lacunas persistirem, corrija os seams existentes. Se já tiverem sido corrigidas, reutilize a implementação vigente e ajuste a spec à realidade. Não mantenha dois motores financeiros.

INTERFACE DE APLICAÇÃO

Especifique um módulo profundo com superfície pública equivalente a:

preview(BatchPaymentDraft, OperatorContext): BatchPaymentPreview
confirm(BatchPaymentConfirmation, OperatorContext): BatchPaymentResult

Extraia ou reutilize um motor interno compartilhado pela Quitação individual e pelo lote, equivalente a:

preflight(PaymentIntent, LockedPaymentContext): PaymentPlan
apply(PaymentPlan, SharedTransactionContext): PaymentEffectManifest

Controllers, Requests e React não conhecem repositories, writers, locks, allocators ou transações. O command individual conserva sua orquestração; o lote usa o motor dentro de uma única transação compartilhada. PayDuplicatasBatchAdapter deve delegar ao novo contrato ou ser removido, nunca continuar como loop de commits unitários.

ELEGIBILIDADE E ESTADO

Identifique Duplicata por documentopag+datavencto+numero e inclua revisão do agregado. Sob lock, valide:

- Documento não é previsão;
- Duplicata existe, não está paga e está AUTHORIZED;
- Autorização de Pagamento está vigente para o snapshot;
- Filiais de emissão/pagamento estão no escopo do Operador;
- não existe remessa ou fluxo conflitante;
- Conta, Tipo, Evento, data/calendário, parâmetros, banco, Contabilidade e tributos são compatíveis.

A única transição é AUTHORIZED -> PAID. Após commit, PAID é imutável e somente admite Estorno do Pagamento conforme ADR-0247. Proof de Quitação não cria Autorização de Pagamento.

SEGURANÇA

Defina abilities distintas para visualizar/iniciar e confirmar a Quitação em Lote, integradas ao acesso do módulo e às Filiais. Confirmação exige Sensitive Operation `ContasPagar/quitar_duplicatas_lote` vinculada ao manifesto completo.

Operador com perfil legado `pagamento` confirma com senha própria; sem ele, usa credencial de um Autorizador com `pagamento`. Administrador/Suporte não substitui esse perfil automaticamente. Persista Operador e Autorizador separadamente; nunca senha ou proof bruto. O FormRequest valida ability de iniciar e permite que o proof forneça o Autorizador autorizado.

READ MODEL, FILTROS E SELEÇÃO

Crie página completa no hub de Contas a Pagar, não modal no cadastro. Siga as convenções atuais de rota/middleware/menu e ADR-0002.

Filtros: vencimento inicial/final; uma ou mais Filiais permitidas; Parte Fornecedora; Carteira e/ou Banco; Banco em cobrança quando aplicável; DDA com rótulos `Todos`, `Sem DDA`, `Somente DDA`; ordenação por vencimento, Fornecedor ou valor. F6 pesquisa.

Grid paginado, padrão 25, com seleção explícita por identidade+revisão e colunas: Fornecedor, Documento, parcela, nota/complemento, vencimento, atraso, valor no vencimento, previsão calculada/editável, Evento, autorização/elegibilidade e observação. Linhas inelegíveis ficam desabilitadas e explicam o motivo. Seleção persiste entre páginas; “Selecionar página” não significa todos os resultados. Não use booleano implícito `all_results` no primeiro escopo.

Ofereça projeções `Detalhada`, `Por documento` e `Por fornecedor`. Agrupamento visual é somente apresentação: ao selecionar grupo, materialize/exiba as identidades filhas. Nunca envie apenas uma chave agregada e nunca confunda isso com cheque único.

DADOS COMUNS E PREVIEW

Painel fixo mostra quantidade, total no vencimento, total previsto e total efetivo e recebe datapagto, filialpagto, tipopagamento, contapagto, cheque quando aplicável e opções de impressão. Reutilize AppLayout, grid atual, CatalogCodeLookup, BrIsoDateTextInput, BrNumericAmountField e componentes ERP vigentes.

Alterar seleção, previsão ou dados comuns invalida preview. F5/Quitar chama primeiro `preview`, que é estritamente somente leitura: normaliza/deduplica/ordena, aplica limite, relê tudo, calcula valores server-side, valida dependências e devolve token opaco expirável, preview_hash, revisões, totais, warnings, textos/efeitos planejados e decisões parciais pendentes. Não consome proof, não grava e não mantém locks duradouros.

PAGAMENTO PARCIAL

Quando 0 < previsão < valor devido, percorra um diálogo sequencial acessível, com progresso, na ordem estável dos itens e opções:

- Cancelar: aborta toda a jornada e não chama confirm;
- Gerar outra parcela (`GENERATE_REMAINDER_INSTALLMENT`): quita a atual pelo valor informado e cria o saldo com mesmo vencimento e próximo número alocado com segurança sob lock; preserve configurações de multa/juros sem capitalizar encargos já realizados; a residual nasce autorizada somente quando `parametros_valor('AUTORIZACAO PAGTO AUTOMATICA')` estiver ativo;
- Desconto Obtido (`OBTAINED_DISCOUNT`): não cria parcela e persiste explicitamente a diferença adicional em valordesconto.

Valor zero/desconto integral não pertence a esta tela; valor acima do devido retorna 422. Não invente vencimento residual no browser. Decisões entram no preview_hash, proof, idempotência e Auditoria. Após responder todas, gere/revalide a prévia final antes da prova sensível.

AGRUPAMENTO BANCÁRIO E CHEQUE

O Operador escolhe explicitamente:

- `NONE` / Um movimento por Duplicata: um movtosbancos e um movtosbancoseventos por item;
- `SINGLE_CHECK` / Cheque único para o lote: um movtosbancos pelo total e exatamente um movtosbancoseventos por Duplicata.

SINGLE_CHECK exige cheque e Conta/data/Filial/Tipo comuns. Não anexe implicitamente a movimento histórico; cheque já usado fora de replay retorna 409. Informar cheque com NONE não autoriza agregação.

Use intenção bancária tipada e manifesto retornado pelo Writer. Em cada Duplicata, grave na mesma transação as chaves realmente persistidas `sequencia` e `sequenciaevento`.

Regras obrigatórias:

- movtosbancos.documento recebe duplicatas.chequepagto; sem cheque, vazio; nunca documentopag;
- histórico individual: `[NF|DOC][ complemento] DUP {documentopag}/{numero} - {Parte Fornecedora}`;
- assert de caracterização: `DOC DUP 209120/1 - ANDRA UNIFORMES`;
- NONE usa histórico e Evento individuais no cabeçalho/evento;
- SINGLE_CHECK usa cabeçalho negativo com `PAGTO DIVERSAS DUPLICATAS` e Evento nulo, e eventos com históricos individuais;
- proíba MAX+1 desprotegido, busca pelo primeiro agregado compatível, correspondência por texto ou chave criada no frontend.

TRANSAÇÃO, LOCKS E IDEMPOTÊNCIA

Confirm recebe token/hash, revisões, decisões, dados comuns, agrupamento e uma idempotency_key do lote. Em uma única DB::transaction:

1. reserve idempotência batch crash-safe;
2. bloqueie Documentos em ordem crescente;
3. bloqueie Duplicatas em ordem canônica;
4. serialize allocators bancário, contábil e de parcela;
5. releia parâmetros e execute preflight de todos antes do primeiro write;
6. aplique todos os planos, banco, tributos, Contabilidade e Auditoria;
7. reconcilie todos os efeitos, conclua idempotência e commite;
8. somente pós-commit agende impressão e recarregue a UI.

Uma revisão inicial por Documento deve permitir vários itens do mesmo Documento sem auto-conflito. Mesma chave+hash retorna replay do resultado; mesma chave com payload diferente retorna 409. Estado pending usa lease/ownership recuperável e não é simplesmente apagado após falha incerta. Timeout de rede permite consultar/retomar pelo identificador ou idempotência sem pagar novamente.

CONTABILIDADE, TRIBUTOS, PARÂMETROS E AUDITORIA

Use ContasPagarParameterManifest/ParameterReadBundle e ParameterService com os textos exatos de parametros_valor localizados em clparametrossistema, inclusive `AUTORIZACAO PAGTO AUTOMATICA`, `DATA CONTABIL`, `GERARCONTABILIDADE`, `EXERCICIOCONTABILIDADE`, `Início Integração Bancos`, histórico padrão e parâmetros tributários já existentes. Não crie aliases.

GERARCONTABILIDADE=false produz status skipped. Ativo exige adapter real e contrapartidas validadas antes de writes; stub indisponível bloqueia todo o lote. Impostos usam OrigemImpostosRetidos::PagamentoDuplicatas dentro da transação. Schema/parâmetro obrigatório ausente falha cedo conforme ADR-0007.

Auditoria persistente e transacional registra batch_payment_id, Operador, Autorizador, Filiais, correlação, idempotência, dados comuns, estratégia/cheque, parâmetros efetivos, before/after de cada item, decisões, residual/desconto e manifestos. Falha de Auditoria causa rollback. Log::info é observabilidade, não Auditoria.

RECONCILIAÇÃO

Antes do commit, prove contra PaymentEffectManifest:

- todas e somente as Duplicatas planejadas em PAID, com campos/vínculos esperados;
- em NONE, um cabeçalho/evento por item; em SINGLE_CHECK, um cabeçalho e um evento por item;
- soma dos eventos igual ao cabeçalho, com sinais corretos;
- documento, histórico, Conta, data, Filial, cheque, Evento, sequencia e sequenciaevento exatos, sem órfãos;
- residual/desconto, Contabilidade, tributos, parâmetros, revisão e Auditoria exatos;
- nenhum efeito fora do conjunto, colisão de allocator ou revisão perdida.

Qualquer divergência lança erro e reverte tudo. O mesmo manifesto/fotografia deve permitir que o Estorno posterior remova/recomponha efeitos de NONE e SINGLE_CHECK sem heurística textual.

RESULTADO, ERROS E IMPRESSÃO

BatchPaymentResult retorna batch_payment_id, replay, instante, quantidade/total, agrupamento, revisões, itens PAID, residual opcional, sequencia/sequenciaevento, manifesto bancário, estados contábil/tributário, Auditoria, jobs de impressão e warnings.

Padronize 401 sessão, 403 ability/Filial/proof, 404 recurso no escopo, 409 revisão/estado/cheque/idempotência/manifesto, 410 preview expirado, 413 limite, 422 payload/parcial/data/Conta/Tipo/Evento e 503 dependência. Envelope: code, message, field_errors, item_errors, correlation_id, retryable. Nunca retorne sucesso parcial.

Recibos por Documento/Fornecedor e cheque são efeitos pós-commit idempotentes via job/outbox. Falha de impressão gera aviso e retry sem repetir a Quitação.

UX E ACESSIBILIDADE

Fluxo: filtros/F6 -> seleção -> dados comuns/estratégia -> preview/F5 -> loop parcial -> revisão final -> proof -> confirmação única -> resultado/reload -> impressão.

Bloqueie edição e duplo envio durante confirm. Diálogos prendem foco, têm rótulos e progresso; Esc no diálogo parcial equivale claramente a Cancelar o lote, nunca escolhe uma decisão por padrão. Cubra loading, vazio, forbidden, validação por campo/item, conflito, preview expirado, processando, replay, sucesso e sucesso com falha de impressão. Só anuncie sucesso depois do commit e reconciliação.

TESTES OBRIGATÓRIOS

Unitários:
- cálculo/previsão/totais e decisões parciais;
- máquina de estados da UI e invalidação do preview;
- filtros, inelegibilidade e seleção explícita;
- planners NONE/SINGLE_CHECK, cardinalidade/somas e formatador de histórico;
- hash/idempotência, ordem de locks, allocators e reconciliador.

Feature:
- rotas/menu/middleware, abilities, Filiais e proof próprio/de Autorizador;
- filtros/paginação/seleção e rejeição de ids/revisões adulterados;
- preview sem escrita e todos os envelopes de erro;
- Cancelar sem confirm, replay/retomada e impressão pós-commit.

PostgreSQL real:
- lote com vários Documentos e rollback total ao falhar o enésimo item;
- NONE e SINGLE_CHECK com cardinalidade, soma, sinal, documento, histórico, sequencia e sequenciaevento exatos;
- parcial residual/desconto, autorização automática e alocação segura;
- Contabilidade ativa/inativa, tributos, Auditoria e falha de reconciliação sem resíduos;
- transações sobrepostas, alteração entre preview/confirm, colisão, ordem anti-deadlock, replay simultâneo e recovery de pending.

Frontend:
- filtros/paginação/seleção; independência de agrupamento visual/bancário;
- edição de previsão/totais; loop parcial e Cancelar sem request;
- revisão/proof, acessibilidade, duplo clique, conflito/expiração, replay e falha/retry de impressão.

Regressão:
- Quitação individual usa o mesmo motor;
- Autorização em lote permanece pré-condição sem efeitos financeiros;
- PAID permanece imutável;
- Estorno consome os manifestos de NONE/SINGLE_CHECK.

Converta placeholders PostgreSQL financeiros em fixtures executáveis. Não use markTestSkipped como resultado aceitável; o grupo CI deve falhar se PostgreSQL estiver indisponível. Mocks não são prova única dos efeitos bancários.

FASES E GATES

P0: caracterizar código/schema/parâmetros/rotas/testes atuais e registrar matriz preservar/corrigir/criar/remover.
P1: extrair motor compartilhado, contratos preview/confirm, DTOs, proof batch e read model.
P2: tornar Writer/manifesto, allocators, parcial e efeitos reversíveis corretos, com testes PostgreSQL.
P3: implementar orquestração batch atômica, idempotência crash-safe, Auditoria e reconciliação.
P4: implementar página/UX, impressão pós-commit e observabilidade/retomada.
P5: regressão integral, concorrência e gates de implantação.

Cada fase deve manter testes anteriores verdes e nenhum rollout pode expor a rota antes de atomicidade, Auditoria e reconciliação estarem ativas.

FORA DO ESCOPO E PROIBIDO

Não alterar Delphi; não reespecificar a Autorização em Lote; não migrar remessa/retorno; não corrigir históricos silenciosamente; não criar segundo motor; não permitir edição ou refazer após PAID; não usar Filial global, SQL concatenado, MAX+1 inseguro, fatos financeiros do browser, agregação implícita, transação aguardando Usuário, commit por item, sucesso parcial ou impressão como parte do commit financeiro.

SAÍDA ESPERADA

Produza uma spec pronta para `/speckit.clarify` e `/speckit.plan`, autocontida, sem investigação Delphi ou decisão financeira em aberto. Inclua:

- jornadas, casos de uso e falhas priorizados;
- requisitos funcionais e não funcionais numerados;
- estados, entidades e invariantes;
- contratos HTTP e de Application, payloads/resultados/erros;
- abilities, proof, Filiais e Auditoria;
- parâmetros, Contabilidade, tributos, banco, impressão e reconciliação;
- concorrência, locks, revisão e idempotência;
- UX/acessibilidade;
- critérios de aceite mensuráveis;
- matriz de testes e fases/gates;
- matriz `já implementado / incompleto / faltante / preservar / remover`, baseada no código atual;
- arquivos atuais a preservar/corrigir e somente novos arquivos realmente necessários.
```
