# Construir a matriz de paridade, reuso e ajustes de Contas a Pagar

Type: task
Status: resolved
Blocked by: 01, 02, 03, 04

## Question

Para cada capacidade, estado, fluxo, campo, regra, operação, integração, Permissão, Autorização e Parâmetro encontrado, qual é o equivalente Laravel, o reuso direto ou com extensão, a divergência intencional, a lacuna ou o possível bug legado, e quais decisões e critérios de ajuste tornam a paridade segura e verificável?

## Answer

### Decisão de arquitetura e ordem de execução

`DECISÃO` — A implementação Laravel atual é o baseline. A ficha `DocumentosPagar/Cadastro.tsx`, `DocumentosPagarController`, `DocumentoPagCadastroPageService`, repositories legados, cálculos, lookups, readonly e geração de impostos serão aprofundados. Não será criado um segundo módulo paralelo.

`DECISÃO` — O agregado financeiro terá dois caminhos explícitos:

1. **Rascunho cadastral:** criação/alteração de campos ainda mutáveis e geração de parcelas abertas.
2. **Comandos financeiros:** autorizar, pagar, cancelar/refazer, gerar Contabilidade e processar lote/retorno. Cada comando carrega o estado persistido, aplica Policy/gates/Filial, usa prova sensível quando necessária e confirma todos os efeitos numa única transação.

O update cadastral não poderá gravar fatos de pagamento, autorização, usuário, sequências bancárias ou lotes contábeis enviados pelo cliente. Também não poderá substituir Duplicatas já pagas, autorizadas ou vinculadas.

Ordem obrigatória para o prompt final:

| Fase | Objetivo | Dependência |
|---|---|---|
| P0 | Caracterização e testes de regressão do que já existe | nenhuma |
| P1 | Corrigir Policies, FormRequests, Filiais, Documento administrador e mass assignment financeiro | P0 |
| P2 | Tornar Documento+Duplicatas um agregado concorrente, com revisão/locks e invariantes server-side | P1 |
| P3 | Implementar autorização, pagamento, parcial, cancelamento/refazer e movimento bancário como comandos idempotentes | P2 |
| P4 | Completar impostos, parâmetros, Contabilidade e PIS/COFINS | P3 para efeitos de pagamento; P2 para cadastro |
| P5 | Logs, impressão e adaptadores para lote/retorno | P3/P4 |
| P6 | Paridade de UX, testes end-to-end, reconciliação e documentação | P1–P5 |

### Legenda da matriz

- `REUSO DIRETO`: contrato Laravel já atende e deve ser preservado.
- `REUSO COM EXTENSÃO`: ativo correto, mas incompleto.
- `DIVERGENTE`: comportamento existente difere do Delphi ou do requisito seguro.
- `LACUNA`: capacidade não localizada.
- `NÃO DESEJÁVEL`: comportamento legado que não será copiado.
- `POSSÍVEL BUG`: contradição/risco que exige regra explícita e teste.

### Matriz funcional e de UX

| ID | Capacidade Delphi | Laravel atual | Classificação | Ajuste decidido / aceite verificável |
|---|---|---|---|---|
| UX-01 | Cadastro mestre Documento+Duplicatas, abertura direta por número | Rotas, controller, shell, lookup direto e ficha já existem | `REUSO DIRETO` | Preservar URLs, navegação e componentes; teste abre novo/existente e mantém feedback/dirty guard |
| UX-02 | Cabeçalho com Fornecedor, Emissão, Lançamento, Filial, Evento, referência, valores, previsão, administrador, regime/data de referência | Campos e persistência presentes | `REUSO COM EXTENSÃO` | Revalidar todos os gates no backend e completar Série/NF/Pedido quando somente leitura/origem exigir; dados derivados não vêm do cliente |
| UX-03 | Duplicatas com grupos Vencimento/Pagamento, observação destacada e totais | Grid, colunas agrupadas, modal, observação e cálculos presentes | `REUSO COM EXTENSÃO` | Preservar grid; derivar editabilidade por linha no backend; totais financeiros recalculados no servidor e comparados ao cliente |
| UX-04 | Inserir/editar/excluir Duplicata aberta | Hoje altera coleção local e usa `replaceAll` no save | `DIVERGENTE/CRÍTICO` | Introduzir diff/comandos de parcela ou replace protegido; recusar alteração/exclusão de paga, autorizada, originada ou tributariamente vinculada |
| UX-05 | Gerar parcelas, substituindo abertas com fechamento monetário exato | Calculadora e testes frontend existem | `REUSO COM EXTENSÃO` | Recalcular/validar no backend; atomicidade; precisão centesimal; recusar se houver fatos financeiros/vínculos; diferença final na última parcela |
| UX-06 | Adiantamento por F7, sem Duplicatas, com Tipo/Conta/cheque | Modo, tela, validação básica e persistência presentes | `REUSO COM EXTENSÃO` | Validar Conta/Filial/perfil, integração bancária/contábil e saldo; não criar Duplicata; cobrir inclusão, uso e insuficiência de saldo |
| UX-07 | Documento original e documentos tributários derivados somente leitura | Resumo/origem e lista de gerados presentes | `REUSO COM EXTENSÃO` | Proibir update/delete do derivado fora do motor; navegar mantendo escopo de Filial/administrador |
| UX-08 | Aba Contabilidade condicional | Ausente | `LACUNA` | Usar componentes/serviços contábeis compartilhados; mostrar apenas com `GERARCONTABILIDADE`, não previsão e ability; origem própria fica editável conforme regra coerente |
| UX-09 | Aba PIS/COFINS com CST, bases, alíquotas, natureza e recálculo | Aba placeholder | `LACUNA EXPLÍCITA` | Implementar campos/cálculos persistidos e validação server-side; ocultar em Nota de origem; testes de recálculo e arredondamento |
| UX-10 | Imprimir autorização/recibo: atual ou elegíveis | Ausente | `LACUNA` | Criar endpoints de preview/saída; seleção server-side; autorização exige step-up; recibo somente pago; sem mutação financeira |
| UX-11 | Log de Documento e Duplicata | Ausente no contexto | `LACUNA` | Reusar modal/grid de auditoria, criar readers para tabelas legadas e registrar novos comandos com operador/autorizador/contexto |
| UX-12 | Atalhos F7, Ctrl+P/G/R e operações de grid | F7, command bar e parte dos atalhos já existem | `REUSO COM EXTENSÃO` | Manter somente atalhos alcançáveis e não conflitantes; Ctrl+P chama comando pagar/cancelar, G varia por aba, R só Contabilidade de caixa |
| UX-13 | Reinf desativado | Não implementado | `NÃO DESEJÁVEL/FORA` | Não criar aba nem requisito Reinf neste esforço |

### Matriz de regras do Documento e das Duplicatas

| ID | Invariante/regra | Laravel atual | Classificação | Decisão e critério de aceite |
|---|---|---|---|---|
| REG-01 | Líquido = bruto − retenções; retenções não excedem bruto | Cálculo visual e parte das validações | `REUSO COM EXTENSÃO` | Value object/serviço monetário server-side; rejeitar negativo/excesso; centavos determinísticos |
| REG-02 | Soma das Duplicatas = líquido; Regime de Caixa pode confirmar ajuste do bruto | UI compara soma; contrato completo não está no backend | `DIVERGENTE` | Backend bloqueia diferença; fluxo explícito de confirmação para Regime de Caixa recalcula bruto, nunca aceite implícito do payload |
| REG-03 | Datas de Emissão/Lançamento/Pagamento respeitam retroatividade e fechamento | Services/requests e testes para `DIASNOTARETROATIVA`/`DATA CONTABIL` | `REUSO COM EXTENSÃO` | Reutilizar services; usar data do servidor; revalidar contra estado/Filial persistidos no comando |
| REG-04 | Evento ativo, tipo A, saída S; evento atual continua pesquisável | Lookup filtra saída; contrato completo precisa ser confirmado no comando | `REUSO COM EXTENSÃO` | Validar existência/classificação server-side e permitir valor legado atual apenas na edição compatível |
| REG-05 | Defaults: hoje, Filial Base, F, flags falsas | Hoje existe hoje/flags; Filial pode ficar nula | `DIVERGENTE` | Resolver Filial Base autorizada no backend; ausência/Filial não autorizada bloqueia, sem escolher silenciosamente outra |
| REG-06 | Autorização automática de novas/residuais | Não usa parâmetro; cliente envia `autorizado` | `DIVERGENTE/CRÍTICO` | Derivar de `AUTORIZACAO PAGTO AUTOMATICA`; gravar data/origem; cliente nunca define o fato |
| REG-07 | Valor a pagar usa `calcular_valor_pagar`/calendário e primeiro dia útil | Cálculos TypeScript/calendário presentes | `REUSO COM EXTENSÃO` | Backend é autoridade e deve confrontar função PostgreSQL/serviço compartilhado; frontend apenas prévia |
| REG-08 | Pagamento parcial gera residual ou converte diferença em desconto | Ausente | `LACUNA` | Comando exige escolha; residual herda regras e recebe autorização conforme parâmetro; soma preservada |
| REG-09 | Pagamento zero representa desconto integral confirmado | Ausente como comando confiável | `LACUNA` | Ação explícita, confirmada e auditada; limpa campos bancários/tipo conforme contrato |
| REG-10 | Cheque não pode ser reutilizado em outra data e pode agregar no mesmo dia | Não localizado | `LACUNA` | Constraint/consulta sob lock e testes para mesma data versus data distinta |
| REG-11 | Exclusão Documento bloqueia pagamento, imposto quitado, origem e período fechado | Hoje bloqueia apenas Duplicata quitada; Policy genérica | `DIVERGENTE` | Gate contextual único no service/policy, desvinculação fiscal controlada e teste para cada motivo |
| REG-12 | Documento administrativo invisível a não Admin/Suporte | UI esconde checkbox; backend aceita flag e não filtra toda leitura | `DIVERGENTE/CRÍTICO` | Filtrar lookup e leitura direta; ability para visualizar/marcar; ignorar/rejeitar flag adulterada |
| REG-13 | Observação pode ser escrita separadamente | Hoje integra update total | `DIVERGÊNCIA INTENCIONAL` | Não copiar autosave implícito; salvar com Documento ou endpoint explícito versionado, com feedback e auditoria |
| REG-14 | Contradição legado em editabilidade contábil de Documento originado | Contabilidade ausente | `POSSÍVEL BUG LEGADO` | Regra escolhida: Documento derivado é somente leitura no cadastro; Contabilidade própria só em Documento não originado e autorizado |

### Matriz de Permissões, Autorizações e Filiais

| ID | Controle | Laravel atual | Classificação | Decisão / aceite |
|---|---|---|---|---|
| SEC-01 | Abrir módulo | `ContasPagarModuleAccessService` + middleware | `REUSO DIRETO` | Manter como gate de entrada, nunca como autorização suficiente para mutações |
| SEC-02 | CRUD Documento/Duplicata | Policy/service retornam o mesmo acesso do módulo; FormRequest autoriza sempre | `DIVERGENTE/CRÍTICO` | Abilities separadas `view`, `maintain_document`, `maintain_installment`, aplicadas em controller/FormRequest/service |
| SEC-03 | Contabilidade | Auth service `AlterarDadosContabeis` existe; feature ausente | `REUSO COM EXTENSÃO` | Ability `maintain_accounting` + período/parâmetro/origem/Filial no servidor |
| SEC-04 | Autorizar/quitar | Sensitive operation `ContasPagar/quitar_duplicata` existe, mas prova fica na UI | `DIVERGENTE/CRÍTICO` | Comando valida proof server-side ligado a Duplicata+revisão+Filial+ação; persiste operador e autorizador separados |
| SEC-05 | Cancelar/refazer/imprimir | Definições específicas ausentes | `LACUNA` | Operações sensíveis próprias; `force_rebuild_payment` substitui login mágico `tecsoft` |
| SEC-06 | Invalidar autorização após mudança financeira | Ausente | `LACUNA/SEGURANÇA` | Assinatura/revisão inclui Documento, parcela, valor, vencimento, fornecedor e Filial; alteração invalida ou exige nova prova |
| SEC-07 | Filial em lookup | Lookup de Documento usa `authorizedFilialCodes` | `REUSO COM EXTENSÃO` | Preservar e incluir Admin/Suporte/Documento administrador corretamente |
| SEC-08 | Filial em leitura direta e mutação | Não chama `assertFilialAuthorized` | `DIVERGENTE/CRÍTICO` | Aplicar a Emissão, Contábil e Pagamento em todas as leituras/comandos; Filial Base é default, não permissão |
| SEC-09 | Props readonly/can* | Backend produz props, frontend replica gates | `REUSO COM EXTENSÃO` | UI reflete decisão; serviço de domínio repete a autorização usando registro persistido e não confia em disabled |
| SEC-10 | Rate limit/auditoria de credenciais | Framework sensível já possui | `REUSO DIRETO` | Preservar; complementar com auditoria do resultado financeiro, inclusive falha/retry |

### Matriz de parâmetros

Todos devem ser resolvidos por `ParameterService::get/getMany` usando o texto canônico persistido; o identificador Pascal nunca vai ao banco. Criar `ContasPagarParameterManifest` tipado, por Filial, com cache apenas na duração segura do comando.

| Chave canônica | Estado atual | Tipo/fallback decidido | Uso obrigatório / testes |
|---|---|---|---|
| `GERARCONTABILIDADE` | ausente | bool; inválido/ausente = desabilitado seguro | Aba, obrigatoriedade e geração; true/false/ausente/inválido |
| `DATA CONTABIL` | implementado | data ISO válida; inválido = erro de configuração para mutação fechada | Datas e gates; limite anterior/igual/posterior |
| `EXERCICIOCONTABILIDADE` | ausente | inteiro positivo; inválido bloqueia manutenção contábil | Exercício/ano e mensagens |
| `DIASNOTARETROATIVA` | implementado | inteiro ≥0; inválido = 0 | Emissão/Lançamento; bordas e Filial |
| `AUTORIZACAO PAGTO AUTOMATICA` | ausente | bool; ausente/inválido = false | Novas/residuais; evidência de origem automática |
| `Início Integração Bancos` | ausente | data; ausente ou ≤01/01/1980 desabilita | Exigir Evento e gerar/cancelar movimento na fronteira |
| `Geração automática do imposto retido` | ausente/diverge | bool; ausente/inválido = false | Habilitação visual/funcional conforme Delphi |
| `Histórico padrão pagto duplicata` | ausente | código/string nullable | Precedência Fornecedor específico → parâmetro → geral → zero |
| `Selecionar somente fornecedores nas contas a pagar` | ausente | bool; ausente = false | Lookup F/L versus tipos permitidos; backend e UI iguais |
| `Evento para pagamento de romaneio` | ausente | código nullable | Adaptador Romaneio; validar Evento ou retornar erro configuracional |

`DÚVIDA RESOLVIDA PARA ESPECIFICAÇÃO` — `Gerar pagamentos dos impostos retidos` e `FornecedorParaISS`, já usados no Laravel, permanecem como configurações adicionais existentes. Não são aliases automáticos de `Geração automática do imposto retido`. O prompt deverá: manter compatibilidade; documentar os três papéis; consultar a chave Delphi para habilitação da automação de UI/fluxo; e usar a chave Laravel existente apenas no ponto de criação de documentos tributários até evidência de consolidação. Nenhuma migração/renomeação silenciosa.

### Matriz de pagamento, bancos, Contabilidade e impostos

| ID | Efeito | Laravel atual | Classificação | Decisão / aceite transacional |
|---|---|---|---|---|
| FIN-01 | Quitar Duplicata | Edição do payload + save integral | `DIVERGENTE/CRÍTICO` | Endpoint/comando dedicado, idempotency key, proof, expected revision e resposta com estado confirmado |
| FIN-02 | Movimento `movtosbancos`/Eventos após início da integração | Ausente no contexto; CRUD manual existe em Financeiro | `LACUNA COM REUSO PARCIAL` | Reusar mappings/lookups, não store manual origem B; writer do agregado usa origem P, Conta/Data/Sequência sob lock |
| FIN-03 | Agregar pagamentos na mesma Conta/Data e cancelar/recalcular | Ausente | `LACUNA` | Atualizar cabeçalho/detalhes atomicamente; descrição “diversas” derivada; cancelar remove/reduz sem órfãos |
| FIN-04 | Lançamentos contábeis D/E/A/P e lote por parcela | Ausente | `LACUNA` | Adaptador ao motor contábil compartilhado; numeração atômica; balanceamento e origem testados |
| FIN-05 | Refazer pagamento ao alterar Evento/contrapartida | Apenas checkbox/UI residual, sem motor | `LACUNA` | Comando privilegiado cancela e reaplica na mesma transação; nunca update manual das consequências |
| FIN-06 | Impostos retidos no lançamento/pagamento | Generation service/repositories implementados | `REUSO COM EXTENSÃO` | Manter vínculos e cálculo; chamar na ocasião real do comando; validar configuração/Filial/mutual exclusion; integrar rollback total |
| FIN-07 | PIS/COFINS/CSLL individual versus combinado | Campos existem, UI/regra completa não | `DIVERGENTE` | Exclusão mútua server-side e UI; recalcular bases/valores; impedir combinações ambíguas |
| FIN-08 | Adiantamento e saldo contábil | Cadastro simples existe | `REUSO COM EXTENSÃO` | Serviço de saldo e consumo sob lock; lançamentos A; rejeitar insuficiência e concorrência |
| FIN-09 | Pós-validação `ValidarValoresDocumentosPag` | Não localizado | `LACUNA` | Reusar função PostgreSQL quando disponível ou reconciliador equivalente; falso lança e faz rollback |
| FIN-10 | Lote/retorno como consumidores do mesmo motor | Ausente no contexto | `LACUNA DE INTEGRAÇÃO` | Application service público interno para tela/lote/retorno; payload versionado e idempotente; não migrar UIs vizinhas |

### Fronteira transacional, concorrência e auditoria

`DECISÃO` — Cada comando financeiro roda em uma única `DB::transaction` abrangendo Duplicata, Documento, impostos derivados, movimentos/Eventos bancários, lançamentos/lotes e logs. O registro é relido sob lock; autorização, Filiais, período e expected revision são verificados dentro da transação.

Critérios obrigatórios:

1. `idempotency_key` única por origem/ação; repetição com o mesmo payload devolve o resultado anterior, e payload diferente conflita.
2. Lock pessimista ou estratégia PostgreSQL equivalente para Duplicata, movimento Conta/Data e geradores de sequência/lote; `MAX+1` sem lock não é aceito.
3. Número do Documento usa função/sequence legada quando disponível e constraint; criação tributária concorrente não duplica vínculo.
4. Auditoria durável contém ação, antes/depois relevante, operador, autorizador, Filiais, proof/context id, idempotency key, origem (`ui`, `lote`, `retorno`) e resultado.
5. Falha em qualquer efeito ou reconciliação faz rollback total; nenhum email/arquivo/evento externo é emitido antes do commit.
6. Resposta só é montada após commit/reload; frontend nunca presume sucesso por alteração local.

### Contratos de API/aplicação decididos

Os nomes finais podem seguir convenções do repositório, mas as fronteiras são obrigatórias:

- `CreateDocumentoPag` / `UpdateDocumentoPagDraft`: somente campos cadastrais e parcelas abertas, com expected revision.
- `GenerateDocumentoPagInstallments`: geração server-side atômica.
- `AuthorizeDuplicataPayment`: cria evidência durável ou registra autorização automática.
- `PayDuplicata`: quita/parcial/desconto integral e coordena impostos/bancos/Contabilidade.
- `CancelDuplicataPayment`: desfaz efeitos coordenados.
- `RebuildDuplicataPayment`: operação administrativa explícita e auditada.
- `GenerateDocumentoPagAccounting`: gera/regenera conforme regime e gates.
- `PrintPaymentAuthorization` / `PrintPaymentReceipt`: queries/relatórios, sem mutação.
- Adaptadores `PayDuplicatasBatch` e `ApplySupplierPaymentReturn` chamam o mesmo motor unitário com idempotência; não duplicam regra.

### Estratégia de testes e definição de paridade verificável

| Camada | Casos mínimos |
|---|---|
| Unitários | dinheiro/arredondamento, calendário, parâmetros/fallbacks, policies contextuais, assinatura de autorização, estado/editabilidade, rateio tributário, saldo de Adiantamento |
| Feature HTTP | cada ability; Filial autorizada/não autorizada; Documento administrador; adulteração de `autorizado`, pagamento e flags; datas; create/update/delete; comandos sensíveis e proofs |
| Integração PostgreSQL | functions/sequences, locks, pagamento/cancelamento, movimentos agregados, lotes, impostos e reconciliação; rollback induzido |
| Concorrência/idempotência | duas quitações da mesma parcela; duas parcelas na mesma Conta/Data; retry de UI/lote/retorno; criação tributária simultânea |
| Frontend | estados e atalhos, campos readonly por capacidade, geração de parcelas, pagamento parcial/zero, abas condicionais, erros do backend e refresh pós-commit |
| Regressão compartilhada | Sensitive Operation, UserBranchAccess, ParameterService, movimentos bancários manuais, componentes ERP e módulos contábeis já existentes |

Paridade é aceita quando, para cada linha desta matriz: (a) existe requisito implementável; (b) há teste positivo e negativo; (c) a origem Delphi e o ativo Laravel estão rastreados; (d) divergência intencional está documentada; e (e) nenhum fato financeiro depende exclusivamente do frontend.

### Escopo e forma do prompt final

`DECISÃO` — A amplitude cabe em **um prompt Spec Kit autocontido**, organizado pelas fases P0–P6 e por requisitos identificados nesta matriz. O Cursor deverá executar fase a fase, rodar gates de teste ao final de cada uma e parar diante de divergência de schema/função PostgreSQL não coberta pela evidência. Não serão produzidos prompts independentes que possam implementar segurança e pagamento fora de ordem.

`FORA DO ESCOPO MANTIDO` — Reinf; alteração do Delphi; migração integral das UIs de remessa/retorno/lote; reimplementação interna completa de motores compartilhados quando um adaptador atende; correção silenciosa de dados históricos.
