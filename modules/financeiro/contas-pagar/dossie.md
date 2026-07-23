# Dossiê de paridade — Contas a Pagar Delphi × Laravel

## 1. Objetivo e autoridade

Este documento consolida o comportamento alcançável de `delphi/apps/contaspagar/dmcontaspagar.pas/.dfm` e `fmcontaspagar.pas/.dfm`, confrontado com o Laravel atual em `laravel/backend`. Ele é a fonte funcional para especificar os ajustes de Contas a Pagar sem nova investigação do Delphi.

O Laravel atual é o baseline técnico: deve ser estendido, não substituído. Paridade significa preservar capacidades e invariantes do legado, corrigindo deliberadamente seus riscos de segurança, concorrência e proteção apenas visual.

Fontes detalhadas:

- `.scratch/contas-pagar-wayfinder/issues/01-inventariar-interface-fluxos-delphi.md`;
- `.scratch/contas-pagar-wayfinder/issues/02-inventariar-dados-regras-integracoes-delphi.md`;
- `.scratch/contas-pagar-wayfinder/issues/03-inventariar-autorizacoes-parametros-delphi.md`;
- `.scratch/contas-pagar-wayfinder/issues/04-inventariar-laravel-e-reusos.md` — considerar somente a resposta revisada de 2026-07-20;
- `.scratch/contas-pagar-wayfinder/issues/05-construir-matriz-paridade-ajustes.md`.

## 2. Vocabulário e agregado

- **Documento a Pagar**: raiz em `documentospag`.
- **Duplicata**: parcela do Documento, com chave funcional `documentopag + datavencto + numero`.
- **Autorização de pagamento**: fato distinto da quitação; identifica operador, autorizador, instante e contexto financeiro.
- **Pagamento/quitação**: comando que altera a Duplicata e pode produzir Contabilidade, movimento bancário e imposto derivado.
- **Adiantamento**: Documento especial sem Duplicatas, com Tipo de Pagamento, Conta e cheque; possui saldo consumível.
- **Documento derivado**: Documento tributário ligado por `documentopagorigem + datavenctoorigem + numeroorigem`.

Documento, Duplicatas, impostos derivados, lançamentos contábeis e movimentos bancários formam uma única unidade de trabalho nos comandos financeiros.

## 3. Estado real do Laravel

Já existem:

- hub/menu e rotas de Documentos a Pagar;
- `DocumentosPagarController`;
- `DocumentoPagCadastroPageService`;
- `LegacyDocumentoPagRepository`, `LegacyDuplicataRepository` e repositories tributários;
- página `Cadastros/ContasPagar/DocumentosPagar/Cadastro.tsx`;
- grid/modal/cálculo de Duplicatas;
- modo Adiantamento;
- lookups de Documento, origem, Fornecedor, Evento, Conta e Banco;
- validação de `DIASNOTARETROATIVA` e `DATA CONTABIL` via `ParameterService`;
- readonly contextual por Nota, impostos, fechamento e perfis;
- geração de documentos de impostos retidos;
- operação sensível `ContasPagar/quitar_duplicata`;
- testes PHP e TypeScript para cadastro, datas, parcelas, lookups, readonly, Adiantamento e impostos.

Lacunas ou implementações incompletas:

- Policies de Documento reduzem CRUD ao acesso geral do módulo;
- FormRequests de Documento retornam `authorize=true`;
- leitura direta e mutações não validam Filial autorizada;
- `administrador`, `autorizado` e dados de pagamento são aceitos do cliente;
- a prova sensível abre o modal no React, mas não é validada no save;
- update usa `replaceAll` e pode sobrescrever estado financeiro;
- não há comando financeiro idempotente, lock/revisão nem reconciliação pós-gravação;
- pagamento não coordena movimentos bancários/Contabilidade/auditoria;
- PIS/COFINS é placeholder;
- faltam Contabilidade, cancelamento/refazer, impressão, logs e adaptadores de lote/retorno.

## 4. Comportamento funcional obrigatório

### 4.1 Documento e UI

Preservar a página completa e os componentes ERP atuais. O cabeçalho contempla Número, Emissão, Fornecedor/tipo, Nota/Pedido quando originado, Lançamento, Filial, Evento, bruto/líquido, referência, previsão, administrador, regime de caixa e data de referência.

Abas:

1. Duplicatas ou Adiantamento;
2. Contabilidade, condicional;
3. PIS/COFINS, ocultada quando houver Nota de origem.

Documento derivado exibe origem e fica somente leitura. Reinf permanece fora do escopo porque está desativado no Delphi.

### 4.2 Duplicatas

Permitir inserir, editar, excluir e gerar somente parcelas abertas e desvinculadas. Pagas, autorizadas ou vinculadas a impostos/lotes não podem ser substituídas pelo update cadastral.

Regras:

- líquido = bruto − IRRF − INSS − ISS − PIS − COFINS − CSLL − combinado;
- retenções não podem superar o bruto;
- soma das Duplicatas deve fechar o líquido;
- no Regime de Caixa, diferença exige confirmação explícita e ajuste do bruto no servidor;
- geração distribui centavos de forma determinística, ajustando a última parcela;
- vencimento não antecede Emissão;
- valor a pagar considera data-base, calendário/primeiro dia útil, juros, multa e desconto;
- pagamento parcial exige escolher parcela residual ou desconto;
- pagamento zero representa desconto integral confirmado;
- cheque não pode aparecer em datas diferentes.

### 4.3 Pagamento e cancelamento

Pagamento não é update de formulário. O comando deve:

1. reler e bloquear Documento/Duplicata;
2. validar acesso, ability, Filiais, período, estado, revisão e idempotência;
3. validar/consumir prova sensível quando não houver autorização automática/durável válida;
4. calcular valores no servidor;
5. persistir operador e autorizador distintos;
6. atualizar a Duplicata;
7. gerar/ajustar impostos, movimento bancário e Contabilidade;
8. auditar e reconciliar;
9. confirmar tudo numa única transação.

Cancelamento desfaz os mesmos efeitos. Refazer pagamento é comando administrativo sensível que cancela e reaplica atomicamente; substitui o login mágico `tecsoft`.

Após `Início Integração Bancos`, pagamento não Adiantamento exige Evento e gera movimento negativo em `movtosbancos` com detalhe em `movtosbancoseventos`. Pagamentos na mesma Conta/Data podem ser agregados. Não usar o CRUD manual de Financeiro, que grava origem `B`; o writer de Contas a Pagar usa semântica própria/origem `P`.

### 4.4 Contabilidade, impostos e Adiantamento

Contabilidade é habilitada por `GERARCONTABILIDADE`, exige ability `maintain_accounting`, período/exercício válidos e Documento não originado/não previsão. Origens contábeis: Documento `D/E`, Adiantamento `A`, pagamento `P`. Número de lote deve ser atômico e balanceado.

Impostos retidos mantêm configuração por Filial, vencimento, contas e vínculo com a parcela fonte. PIS/COFINS/CSLL individuais e combinado são mutuamente exclusivos. O motor atual `DocumentoPagImpostosRetidosGenerationService` deve ser estendido e chamado na ocasião real, dentro da transação financeira.

Adiantamento não gera Duplicatas. Deve validar Conta, Filial, capacidade, saldo operacional/contábil e concorrência; consumo não pode tornar saldo insuficiente.

## 5. Permissões, autorização e Filiais

Separar:

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

O middleware do módulo é somente gate de entrada. Controller, FormRequest, Policy e application service aplicam as abilities e regras contextuais.

Filial de Emissão, Contábil e de Pagamento devem ser autorizadas por `UserBranchAccessService` em lookup, leitura direta e cada comando. Filial Base é default, não autorização.

Documento `administrador` só é visível/mutável por Administrador/Suporte. O backend rejeita adulteração desse flag.

A prova de operação sensível liga operador, autorizador, ação, Filial, Duplicata e revisão/assinatura financeira. Alterar Documento, valor, vencimento, fornecedor ou Filial invalida a autorização. Nenhuma senha/prova aparece em logs.

## 6. Parâmetros canônicos

Usar `ParameterService::get/getMany`; em PostgreSQL ele resolve `parametros_valor('<texto>')`. Criar manifest tipado por Filial. Nunca usar o identificador Pascal como chave persistida.

| Texto canônico | Tipo e fallback seguro | Efeito |
|---|---|---|
| `GERARCONTABILIDADE` | bool; ausente/inválido=false | Contabilidade |
| `DATA CONTABIL` | data; inválido bloqueia mutação fechada | fechamento/datas |
| `EXERCICIOCONTABILIDADE` | inteiro positivo; inválido bloqueia Contabilidade | exercício |
| `DIASNOTARETROATIVA` | inteiro ≥0; inválido=0 | Emissão/Lançamento |
| `AUTORIZACAO PAGTO AUTOMATICA` | bool; ausente/inválido=false | autorização inicial/residual |
| `Início Integração Bancos` | data; ausente ou ≤01/01/1980 desliga | banco/Evento |
| `Geração automática do imposto retido` | bool; ausente/inválido=false | habilitação tributária |
| `Histórico padrão pagto duplicata` | código nullable | precedência do histórico |
| `Selecionar somente fornecedores nas contas a pagar` | bool; ausente=false | tipos F/L no lookup |
| `Evento para pagamento de romaneio` | código nullable | integração Romaneio |

As chaves Laravel atuais `Gerar pagamentos dos impostos retidos` e `FornecedorParaISS` permanecem adicionais e não são aliases automáticos. Não renomear/migrar silenciosamente.

## 7. Persistência, concorrência e idempotência

Separar rascunho de comandos financeiros:

- create/update cadastral só recebe campos mutáveis e parcelas abertas;
- pagamento/autorização/usuário/sequências/lotes nunca vêm do cliente;
- usar expected revision para conflitos de edição;
- reler e bloquear dentro da transação;
- não usar `MAX+1` sem lock/sequence;
- idempotency key durável por origem/ação, com hash do payload e replay do resultado;
- mesma chave com payload diferente retorna conflito;
- tela, lote e retorno chamam o mesmo application service;
- falha ou reconciliação falsa faz rollback integral;
- resposta somente após commit e reload.

Auditoria registra ação, antes/depois relevante, operador, autorizador, Filiais, proof/context id, idempotency key, origem (`ui`, `lote`, `retorno`) e resultado.

## 8. Contratos de aplicação

- `CreateDocumentoPag` / `UpdateDocumentoPagDraft`;
- `GenerateDocumentoPagInstallments`;
- `AuthorizeDuplicataPayment`;
- `PayDuplicata`;
- `CancelDuplicataPayment`;
- `RebuildDuplicataPayment`;
- `GenerateDocumentoPagAccounting`;
- `PrintPaymentAuthorization` / `PrintPaymentReceipt`;
- adaptadores `PayDuplicatasBatch` / `ApplySupplierPaymentReturn`.

Os nomes podem mudar para o padrão local; as fronteiras não.

## 9. Fases e gates

| Fase | Entrega | Gate |
|---|---|---|
| P0 | testes de caracterização | suíte atual verde |
| P1 | Policies, FormRequests, Filiais, administrador e payload seguro | testes de adulteração/acesso verdes |
| P2 | agregado versionado, invariantes, geração server-side e locks | testes de integridade/concorrência verdes |
| P3 | autorização, pagamento, parcial, cancelamento/refazer e bancos | PostgreSQL, rollback e idempotência verdes |
| P4 | parâmetros, impostos, Contabilidade, PIS/COFINS e Adiantamento completo | testes financeiros/contábeis verdes |
| P5 | logs, impressão, lote/retorno | contratos de integração verdes |
| P6 | UX/atalhos, E2E, reconciliação e documentação | aceite completo/regressão verde |

Não iniciar P3 antes de P1/P2. Não implementar Contabilidade/pagamento por caminhos independentes.

## 10. Testes e aceite

Exigir Unit, Feature, frontend e integração PostgreSQL real para:

- abilities, Filiais e Documento administrador;
- adulteração de autorização/pagamento/flags;
- datas/parâmetros/fallbacks;
- dinheiro, parcelas, parcial e desconto integral;
- impostos e mutual exclusion;
- pagamento/cancelamento, bancos e Contabilidade;
- Adiantamento e saldo concorrente;
- duas quitações simultâneas e duas parcelas na mesma Conta/Data;
- retry da UI/lote/retorno;
- rollback induzido e reconciliação;
- operador/autorizador e logs sem segredo;
- estados, abas, atalhos e refresh após commit;
- regressão de `SensitiveOperationAuthService`, `UserBranchAccessService`, `ParameterService`, movimentos manuais e componentes ERP.

Cada requisito precisa de caso positivo e negativo e não pode depender exclusivamente do frontend.

## 11. Exclusões

- alterar o Delphi;
- Reinf;
- migrar integralmente UIs de remessa, retorno ou lote;
- duplicar componentes/serviços existentes;
- chamar CRUD bancário manual como pagamento;
- copiar login mágico, Filiais globais, proteção apenas visual, SQL inseguro ou `MAX+1` desprotegido;
- corrigir dados históricos silenciosamente;
- introspecção de schema em runtime, conforme ADR Laravel 0007.

## 12. ADRs aplicáveis

- ADR Laravel 0002: página completa para cadastro denso, modal para lookup, paginação padrão 25.
- ADR Laravel 0005: catálogo de parâmetros, efeitos bloqueantes/condicionais e resolução por Filial.
- ADR Laravel 0007: fail-fast de schema legado; sem `Schema::hasTable/hasColumn` em caminho de negócio.

