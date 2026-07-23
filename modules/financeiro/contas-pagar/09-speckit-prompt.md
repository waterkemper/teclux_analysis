# Prompt para `/speckit.specify` — Contas a Pagar

```text
/speckit.specify

Crie uma especificação funcional e técnica completa, implementável e verificável para concluir a paridade segura de **Financeiro → Contas a Pagar → Documentos a Pagar** no ERP tecLUX Laravel.

## Regra de autoridade

Este briefing é autocontido e autoritativo quanto ao comportamento Delphi. Não solicite, pesquise ou crie tarefas para reler Delphi, DFM ou units. Você pode e deve inspecionar o Laravel atual para confirmar nomes, contratos e testes dos ativos que serão estendidos. Se o código tiver evoluído, preserve o ativo compatível e registre a adaptação; não redescubra os requisitos.

Não implemente agora. Gere a spec, requisitos numerados, cenários, entidades, contratos, plano por fases e critérios de sucesso. Não faça nova entrevista.

## Objetivo

Concluir a implementação já existente de Documentos a Pagar, preservando cadastro, UI e testes atuais, mas corrigindo primeiro autorização, Filiais e integridade. Transformar autorização/pagamento/cancelamento em comandos financeiros transacionais, idempotentes e reutilizáveis por UI, lote e retorno. Completar bancos, Contabilidade, impostos, PIS/COFINS, Adiantamento, logs e impressão.

Não crie módulo paralelo nem reescreva a ficha existente.

## Baseline Laravel obrigatório

Inspecione e estenda, entre outros equivalentes atuais:

- `routes/web.php` e middlewares `contas_pagar.*`;
- `ContasPagarHubController`;
- `DocumentosPagarController`;
- `StoreDocumentoPagRequest` / `UpdateDocumentoPagRequest`;
- `DocumentoPagPolicy` e `ContasPagarDocumentosPagarAuthorizationService`;
- `DocumentoPagCadastroPageService`;
- `DocumentoPagReadonlyService`;
- `DocumentoPagEmissaoRetroativaService`;
- `DocumentoPagImpostosRetidosGenerationService`;
- `LegacyDocumentoPagRepository`, `LegacyDuplicataRepository` e repositories tributários;
- página `Cadastros/ContasPagar/DocumentosPagar/Cadastro.tsx`;
- `DuplicatasGrid`, `DuplicataDialog`, calculadora e helpers existentes;
- `UserBranchAccessService`;
- `ParameterService` e catálogos de parâmetros de módulo;
- `SensitiveOperationAuthService`, proof validator, dialog/hook e auditoria;
- componentes ERP de cadastro, lookup, grids e logs;
- infraestrutura Financeiro de Conta/Evento/movimentos apenas onde o contrato for compatível;
- componentes/services contábeis compartilhados existentes;
- testes `DocumentosPagarTest` e unit/frontend atuais.

Preserve rotas e UX compatíveis. Explique qualquer novo limite de módulo/repository. Não transforme repository genérico em depósito de SQL do contexto.

## Agregado e estados

`documentospag` é a raiz. `duplicatas` é coleção com chave funcional `documentopag + datavencto + numero`. Documento, Duplicatas, impostos derivados, lançamentos/lotes contábeis, movimentos/Eventos bancários e auditoria integram a unidade de trabalho financeira.

Modele estados/fatos explícitos: Documento aberto, previsão, originado, administrativo, Adiantamento; Duplicata aberta, autorizada, paga e cancelável. Estado deve ser derivado do banco, nunca do browser.

Separe:

1. **Rascunho cadastral**: criar/alterar campos ainda mutáveis e parcelas abertas.
2. **Comandos financeiros**: autorizar, pagar, cancelar/refazer, gerar Contabilidade e consumir via lote/retorno.

O update cadastral não aceita nem grava `autorizado`, datas/valores de pagamento, usuário, autorizador, sequências bancárias, Evento bancário ou lote contábil fornecidos pelo cliente. Não substitua Duplicatas pagas, autorizadas ou vinculadas.

## Documento e Duplicatas

Preserve cabeçalho, abertura direta, lookups, grid agrupado, observação, totais, cálculo de parcelas, Adiantamento, Documento original e impostos gerados.

Regras server-side:

- líquido = bruto menos IRRF, INSS, ISS, PIS, COFINS, CSLL e combinado;
- retenções não superam bruto;
- soma das Duplicatas fecha exatamente o líquido;
- Regime de Caixa só ajusta bruto após confirmação explícita;
- geração de parcelas é atômica, usa centavos determinísticos e ajusta a última;
- não gerar/substituir quando houver pagamento/autorização/vínculo;
- vencimento não antecede Emissão;
- Evento deve existir, estar ativo, tipo A e movimentação S; valor legado atual pode continuar visível na edição compatível;
- defaults usam data do servidor e Filial Base apenas se autorizada;
- Documento derivado é somente leitura no cadastro;
- exclusão bloqueia pagamento, imposto quitado, origem e período fechado;
- Documento administrativo só é visível/mutável por Administrador/Suporte.

Não copie o autosave silencioso de observação do Delphi: salve junto do rascunho ou por endpoint explícito versionado, com feedback.

## Datas e cálculo

Reutilize `DocumentoPagEmissaoRetroativaService`; revalide no backend usando relógio do servidor, Filial e estado persistido.

Valor a pagar considera data-base, calendário/primeiro dia útil, juros, multa e desconto. Frontend pode mostrar prévia, mas backend é autoridade e deve usar o serviço/função PostgreSQL compartilhada quando aplicável.

Pagamento parcial exige escolha explícita:

- criar parcela residual, herdando vencimento/juros/multa e autorização conforme parâmetro; ou
- converter diferença em desconto.

Pagamento zero significa desconto integral confirmado e limpa dados bancários/tipo incompatíveis. Cheque pode agregar no mesmo dia, mas não ser reutilizado em data diferente.

## Permissões e Filiais

Mantenha middleware de módulo apenas como gate de entrada. Especifique abilities distintas:

- `view`;
- `maintain_document`;
- `maintain_installment`;
- `view_admin_document`;
- `maintain_accounting`;
- `authorize_payment`;
- `execute_payment`;
- `cancel_payment`;
- `print_payment_authorization`;
- `force_rebuild_payment`.

Use nomes finais coerentes com o repositório. Aplique autorização no controller/FormRequest/Policy/application service. Corrija FormRequests que hoje autorizam sempre.

Reutilize `UserBranchAccessService`. Restrinja e revalide Filial de Emissão, Contábil e de Pagamento em lookup, leitura direta e cada mutação. Filial Base não concede permissão. Respostas 403 não revelam Documento de outra Filial.

Rejeite adulteração de `administrador` e fatos financeiros. Props `can*`, disabled e readonly apenas refletem a decisão server-side.

## Autorização sensível

Reutilize o framework existente e a ação `ContasPagar/quitar_duplicata`, ajustando nomes somente com compatibilidade/migração documentada.

A UI pode avaliar/abrir o desafio, mas o comando final obrigatoriamente valida/consome a prova. A prova liga operador, autorizador, ação, Filial, Duplicata e revisão/assinatura financeira. A assinatura inclui Documento, parcela, valor, vencimento, fornecedor e Filial; mudança invalida autorização.

Persistir operador e autorizador separados, instante do servidor, método/contexto e resultado. Autorização automática também gera evidência de origem. Adicione operações sensíveis próprias para cancelar, imprimir e refazer. `force_rebuild_payment` substitui o login mágico `tecsoft`.

Rate limit e auditoria de credenciais existentes permanecem; nunca logar senha ou proof.

## Parâmetros

Crie `ContasPagarParameterManifest` ou equivalente seguindo catálogos existentes e ADR Laravel 0005. Use `ParameterService::get/getMany`; no PostgreSQL ele resolve `parametros_valor`. Identidade é o texto exato, não a constante Pascal.

Implemente tipo, fallback e testes para:

- `GERARCONTABILIDADE`: bool, ausente/inválido=false;
- `DATA CONTABIL`: data, inválido bloqueia mutação dependente;
- `EXERCICIOCONTABILIDADE`: inteiro positivo, inválido bloqueia Contabilidade;
- `DIASNOTARETROATIVA`: inteiro ≥0, inválido=0;
- `AUTORIZACAO PAGTO AUTOMATICA`: bool, ausente/inválido=false;
- `Início Integração Bancos`: data, ausente ou <= 01/01/1980 desliga;
- `Geração automática do imposto retido`: bool, ausente/inválido=false;
- `Histórico padrão pagto duplicata`: código nullable;
- `Selecionar somente fornecedores nas contas a pagar`: bool, ausente=false;
- `Evento para pagamento de romaneio`: código nullable.

Mantenha `Gerar pagamentos dos impostos retidos` e `FornecedorParaISS` como configurações adicionais já usadas. Não trate como aliases nem renomeie dados silenciosamente. Documente papéis e precedência.

## Comandos financeiros

Especifique fronteiras equivalentes a:

- `CreateDocumentoPag` / `UpdateDocumentoPagDraft`;
- `GenerateDocumentoPagInstallments`;
- `AuthorizeDuplicataPayment`;
- `PayDuplicata`;
- `CancelDuplicataPayment`;
- `RebuildDuplicataPayment`;
- `GenerateDocumentoPagAccounting`;
- `PrintPaymentAuthorization` / `PrintPaymentReceipt`;
- adaptadores `PayDuplicatasBatch` / `ApplySupplierPaymentReturn`.

Nomes podem seguir o padrão local, mas não una comandos financeiros no update genérico.

### PayDuplicata

Entrada mínima: identidade estável da Duplicata, expected revision, idempotency key, Data de Pagamento, Filial de Pagamento, Tipo de Pagamento, Conta, cheque opcional, Evento quando exigido, valor/decisão parcial e proof quando exigido. Operador vem da sessão; autorizador vem da prova.

Dentro de uma única transação:

1. replay/reserva idempotente;
2. reler e bloquear Documento/Duplicata;
3. validar ability, Filiais, período, estado, revisão, parâmetros e proof;
4. recalcular valor;
5. persistir pagamento/usuários/autorização;
6. sincronizar impostos;
7. gerar movimento bancário/Evento;
8. gerar/ajustar Contabilidade;
9. auditar e reconciliar;
10. concluir idempotência.

Falha em qualquer etapa reverte tudo. Resposta só após commit/reload.

### Bancos

Após `Início Integração Bancos`, pagamento não Adiantamento exige Evento e grava `movtosbancos` negativo + `movtosbancoseventos`. Pagamentos na mesma Conta/Data podem agregar; descrição passa a representar diversas Duplicatas. Cancelamento reduz/exclui e recalcula detalhes sem órfãos.

Reutilize lookups/mapeamentos Financeiro, mas não chame store/update/delete do CRUD manual, que usa origem `B`. O writer de Contas a Pagar tem origem/semântica `P`, vínculo e transação próprios.

### Contabilidade

Habilitar somente com `GERARCONTABILIDADE`, Documento não previsão/não originado, ability, Data/Exercício e Filiais válidos. Origens: Documento/Nota `D/E`, Adiantamento `A`, pagamento `P`. Reutilize o motor contábil compartilhado por adapter. Lotes/sequências devem ser atômicos e lançamentos balanceados.

Histórico do pagamento: Fornecedor específico → `Histórico padrão pagto duplicata` → histórico geral do Fornecedor → zero.

### Impostos e PIS/COFINS

Estenda `DocumentoPagImpostosRetidosGenerationService`; execute na ocasião real de cadastro/pagamento dentro da mesma transação. Preserve vínculo triplo, configuração/vencimento/contas por Filial e bloqueio de imposto quitado.

Implemente aba PIS/COFINS hoje placeholder: CST/tributação, Natureza da Base, bases, alíquotas, valores e recálculo. PIS/COFINS/CSLL individuais e combinado são mutuamente exclusivos no backend e UI. Ocultar para Nota de origem.

### Adiantamento

Não cria Duplicatas. Validar Tipo, Conta, cheque, Filial e capability. Calcular saldo consumível e saldo contábil sob lock; rejeitar insuficiência/concorrência; gerar origem contábil `A` e efeitos bancários aplicáveis.

## Idempotência, revisão e locks

Use storage durável com chave única por origem/ação, payload hash, estado e resultado mínimo.

- mesma chave/hash concluída retorna o mesmo resultado com `replayed=true`;
- mesma chave/outro hash retorna 409;
- concorrentes convergem para uma execução;
- timeout incerto é repetido com a mesma chave;
- retry de deadlock/serialization é limitado e protegido por idempotência.

Use expected revision para rascunho/comandos. Bloqueie Duplicata, agregados Conta/Data e recursos de sequência/lote em ordem explícita. Não use `MAX+1` sem proteção; prefira functions/sequences PostgreSQL legadas e constraints.

## Reconciliação e auditoria

Após as escritas, invoque `ValidarValoresDocumentosPag` quando disponível ou reconciliador equivalente. Resultado falso lança exceção e faz rollback.

Auditoria contém ação, antes/depois relevante, operador, autorizador, Filiais, proof/context id, idempotency key, origem (`ui`, `lote`, `retorno`), request ID e resultado. Logs nunca expõem SQL, stack, senha ou proof ao usuário.

## Logs, impressão e integrações

Reutilize modal/grid de auditoria; crie readers para `documentospag_log` e `duplicatas_log` e una com eventos dos novos comandos.

Impressão de autorização: Duplicata aberta/elegível, atual ou todas, com step-up validado server-side. Recibo: somente paga, atual ou todas. Endpoints são queries/relatórios e não alteram finanças.

Lote, cancelamento em lote e retorno são consumidores do mesmo application service idempotente. Migre somente adapters/payloads necessários, não suas UIs integrais. Evento de Romaneio usa o parâmetro canônico e deve falhar claramente se configuração obrigatória estiver inválida.

## UI

Preserve página completa para cadastro denso e modal para lookup, conforme ADR Laravel 0002. Reuse shell, command bar, tab bar, feedback, lookups e grids existentes.

Abas:

1. Duplicatas ou Adiantamento;
2. Contabilidade condicional;
3. PIS/COFINS, salvo Documento de Nota/origem.

Atalhos: F7 Adiantamento; Ctrl+P pagar/cancelar; Ctrl+G parcelas ou Contabilidade conforme aba; Ctrl+R Regime de Caixa na Contabilidade; atalhos de inserir/editar grid. Respeite acessibilidade/foco e não conflite com browser.

Sucesso financeiro somente depois do commit. Recarregue estado e revisão. Desabilite duplo clique enquanto processa; erros preservam intenção segura e mostram motivo acionável.

## Erros

Defina contrato consistente: `code`, `message`, `field_errors`, `request_id`, `retryable`.

- 422: validação/regra conhecida;
- 403: acesso/Filial sem revelar dados;
- 409: revisão, estado, proof, idempotência ou concorrência;
- 503: timeout/deadlock retryable conforme classe;
- 500: schema/função/erro estrutural desconhecido.

Não converta toda `QueryException` em validação. Em caminhos de negócio, não use introspecção `Schema::hasTable/hasColumn`; falhe explicitamente conforme ADR Laravel 0007.

## Fases obrigatórias

P0 — caracterização: amplie testes do baseline antes de mudar contratos.

P1 — segurança: Policies/abilities, FormRequests, Filiais, Documento administrador, payload financeiro proibido.

P2 — agregado: revisão/locks, invariantes monetários, diff protegido de Duplicatas e geração server-side.

P3 — comandos: autorização, pagamento, parcial, zero, cancelamento/refazer, idempotência e bancos.

P4 — parâmetros, impostos, Contabilidade, PIS/COFINS e Adiantamento completo.

P5 — logs, impressão e adapters lote/retorno.

P6 — UX/atalhos, E2E, reconciliação, documentação e regressão.

Cada fase deve ter tasks e gate de testes. Não iniciar P3 antes de P1/P2. Pare e registre bloqueio se schema/função PostgreSQL real divergir do contrato e a divergência puder causar corrupção; não invente fallback financeiro.

## Testes obrigatórios

Inclua Unit, Feature, frontend e integração PostgreSQL real:

1. cada ability, acesso geral e ausência de acesso;
2. Filiais de Emissão/Contábil/Pagamento autorizadas e negadas;
3. Documento administrador e adulteração de flag;
4. adulteração de `autorizado`, pagamento, operador e sequências;
5. parâmetros true/false/ausente/vazio/inválido e precedência por Filial;
6. datas limite e relógio do servidor;
7. dinheiro, retenções, fechamento de parcelas e arredondamento;
8. geração protegida e conflito de revisão;
9. prova válida/inválida/expirada/consumida e invalidação por mudança financeira;
10. pagamento integral, parcial residual, parcial desconto e zero;
11. cheque mesma data versus data diferente;
12. movimento agregado, cancelamento e refazer;
13. Contabilidade D/E/A/P, lote atômico e balanceamento;
14. impostos, vínculo, quitação e mutual exclusion PIS/COFINS/CSLL;
15. Adiantamento e saldo concorrente;
16. duas quitações simultâneas e duas parcelas na mesma Conta/Data;
17. retry UI/lote/retorno e conflito de idempotência;
18. rollback induzido e reconciliação falsa;
19. logs/operador/autorizador sem segredo;
20. impressão elegível e adapters;
21. abas, readonly, atalhos e refresh pós-commit;
22. regressão de Sensitive Operation, Filiais, parâmetros, movimentos manuais, ERP UI e Contabilidade compartilhada.

SQLite cobre regras isoladas, mas não comprova locks/functions/sequences/transações legadas. Exija suíte PostgreSQL para efeitos financeiros.

## Critérios de aceite globais

- nenhum fato financeiro depende somente do frontend;
- nenhuma leitura/mutação ignora Filial ou Documento administrador;
- nenhum pagamento/cancelamento produz efeito parcial;
- retries não duplicam quitação, movimento, imposto ou lançamento;
- operador e autorizador permanecem distinguíveis;
- cadastro e testes atuais compatíveis continuam funcionando;
- componentes e services existentes são reutilizados;
- todas as divergências intencionais estão documentadas;
- sucesso só aparece após commit/reload;
- cada requisito possui teste positivo e negativo rastreável.

## Legado proibido e fora do escopo

Não reproduza login mágico `tecsoft`, proteção apenas visual, Filiais globais, SQL inseguro, `MAX+1` desprotegido, transação aguardando usuário, estado financeiro vindo do browser ou CRUD bancário manual como pagamento.

Fora do escopo: alterar Delphi; Reinf; corrigir dados históricos silenciosamente; migrar UIs integrais de remessa/retorno/lote; reimplementar motores compartilhados quando adapter atende; criar módulo paralelo.

## Saída esperada

Produza uma spec completa e pronta para `/speckit.plan`, com:

- requisitos funcionais e não funcionais numerados;
- jornadas felizes e falhas;
- modelo de estados e entidades;
- contratos HTTP/application service e erros;
- matriz de abilities e parâmetros;
- transações, locks, idempotência, auditoria e reconciliação;
- fases P0–P6 com dependências e gates;
- arquivos Laravel prováveis, distinguindo novos e alterados;
- plano de testes por camada;
- critérios mensuráveis e exclusões.

Não deixe tarefas de “investigar Delphi” ou decisões financeiras em aberto. A inspeção permitida é somente para encaixar a solução nos contratos atuais do Laravel.
```
