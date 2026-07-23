# Inventariar a Autorização de Pagamentos já implementada no Laravel

Type: task
Status: resolved
Blocked by:

## Question

Qual é o contrato real atual de autorização de pagamento no Laravel — commands, requests, rotas, Policies/abilities, Sensitive Operation/proof, revisão, Filiais, UI e testes —, quais capacidades da tela Delphi já existem e quais estão incompletas, divergentes, duplicadas ou ausentes?

## Answer

### Escopo verificado

Inventário realizado sobre o Laravel atual em `laravel/backend`, confrontando command, FormRequest, controller, rotas, Policy/serviços de autorização, Sensitive Operation, parâmetros, repositories, UI React/Inertia e testes de Contas a Pagar. Foram consideradas ADR-0002, ADR-0005, ADR-0007, ADR-0246 e o dossiê de Quitação da Duplicata.

### Superfície backend existente

- `CONFIRMADO`: existe `POST /cadastros/contas-pagar/documentos-pagar/duplicatas/autorizar`, atendido por `AuthorizeDuplicataPaymentRequest`, `DocumentosPagarController::autorizarDuplicata` e `AuthorizeDuplicataPaymentCommand`.
- `CONFIRMADO`: o payload é unitário e exige `(documentopag, datavencto, numero)`, `expected_revision` SHA-256 e `idempotency_key`; aceita `prova_autorizacao` e `origem`. A resposta atual informa `autorizado`, `revision` e `replayed`.
- `CONFIRMADO`: o command inicia guarda de idempotência, abre transação, bloqueia documento e duplicata, verifica filial, pagamento prévio, estado já autorizado e revisão do agregado, grava e registra log estruturado.
- `CONFIRMADO`: existe query/rota JSON separada de impressão, com escopo `atual` ou `todas`; ela relê apenas duplicatas abertas e autorizadas do mesmo documento e não altera estado.
- `CONFIRMADO`: o rascunho cadastral rejeita campos financeiros e o repository protege parcelas pagas ou autorizadas, alinhado à ADR-0246.
- `CONFIRMADO`: `PayDuplicataCommand` reconhece `autorizado=true` como evidência suficiente para quitar; se falso, pode consumir proof `ContasPagar/quitar_duplicata` ou aceitar operador com capacidade de autorizar. Pagamento continua sendo command distinto.

### Policies, abilities e Filiais

- `CONFIRMADO`: `DocumentoPagPolicy` expõe `authorizePayment` e `printPaymentAuthorization`; ambas delegam a `ContasPagarDocumentosPagarAuthorizationService`.
- `CONFIRMADO`: `canAuthorizePayment` exige acesso ao módulo e `UsuarioPagamentoAuthService::isAutorizadoPagamento`; imprimir reutiliza exatamente essa ability. `executePayment` e `cancelPayment` usam a mesma capacidade Pagamento.
- `CONFIRMADO`: FormRequest e command repetem o gate de `authorizePayment`, e o command revalida acesso à filial de emissão com `UserBranchAccessService` depois de carregar o documento sob lock.
- `CONFIRMADO`: a página recebe props granulares `can.authorizePayment` e `can.printPaymentAuthorization`.
- `OPORTUNIDADE`: criar abilities distintas para autorizar, desautorizar e imprimir se a matriz final exigir segregação; hoje elas colapsam no mesmo perfil legado.

### Sensitive Operation e proof

- `CONFIRMADO`: o catálogo possui `ContasPagar/quitar_duplicata`, permissão `AUTORIZAR_PAGAMENTO`, coluna legada `pagamento`, sem reuso de contexto e sem persistir autorizador no registro. Ele suporta senha do próprio operador com perfil ou login/senha de outro autorizador.
- `DIVERGENTE`: não existe ação sensível específica `autorizar_pagamento_duplicata`; `AuthorizeDuplicataPaymentCommand` consome proof de `quitar_duplicata`, misturando evidência de autorização com execução da quitação.
- `DIVERGENTE`: `AuthorizeDuplicataPaymentRequest::authorize()` e o primeiro gate do command exigem que o operador já tenha perfil Pagamento. Assim, um operador comum nunca chega ao ramo que aceitaria proof de outro autorizador; a delegação existente no corpo do command é inalcançável nesse caso.
- `DIVERGENTE`: quando proof é fornecido, o command proíbe autorizador igual ao operador, mas o catálogo foi desenhado para permitir senha do próprio operador com perfil. Sem proof, o mesmo operador é registrado no log como autorizador. O contrato é internamente inconsistente.
- `CONFIRMADO`: proof não é logado; o log de aplicação inclui operador, autorizador, request id e idempotency key. A identidade do autorizador não é persistida na duplicata.

### Persistência e parâmetro

- `CONFIRMADO`: o command atual grava somente `duplicatas.autorizado = true`.
- `DIVERGENTE`: `dataautorizacaopagto` não é gravada pelo command, não é mapeada pelo `LegacyDuplicataRepository` e não aparece no Laravel analisado. Isso quebra filtro, coluna, cancelamento e relatório equivalentes ao Delphi.
- `CONFIRMADO`: `ContasPagarParameterManifest` declara `AUTORIZACAO PAGTO AUTOMATICA`, resolve-o pelo bundle de parâmetros com precedência de filial e o expõe como `autorizacao_pagto_automatica` à página.
- `DIVERGENTE`: o parâmetro é consultado somente dentro de `AuthorizeDuplicataPaymentCommand`, depois de o operador já ter passado pelo gate Pagamento. Não foi localizado nos commands de criação/geração de parcelas; portanto, duplicatas não nascem automaticamente autorizadas como no Delphi e o ramo atual tem pouco ou nenhum efeito prático.
- `CONFIRMADO`: a leitura usa a abstração Laravel equivalente ao `parametros_valor('AUTORIZACAO PAGTO AUTOMATICA')`, consistente com ADR-0005; não há introspecção de schema no caminho de negócio, consistente com ADR-0007.

### UI atual

- `CONFIRMADO`: a Autorização de Pagamentos não possui módulo/página própria no Laravel. A única UI alcançável está dentro do cadastro de Documento a Pagar.
- `CONFIRMADO`: ao mandar pagar uma duplicata não autorizada, a UI abre `SensitiveOperationAuthDialog` para `quitar_duplicata`, guarda o proof temporariamente e o entrega ao diálogo/comando de pagamento. Se já autorizada, abre a quitação sem novo proof de autorização.
- `NÃO LOCALIZADO`: chamada frontend ao endpoint de autorizar, botão para autorizar sem quitar, desautorização, impressão da autorização, seleção múltipla, marcar todos, filtros por filial/grupo/fornecedor/datas, grade transversal, totais e observação conforme tela Delphi.
- `NÃO LOCALIZADO`: estados dedicados de loading, vazio, erro, sucesso parcial, conflito por item ou retry para uma lista de autorizações. O fluxo de pagamento usa busy/reload e alerts, mas não supre a tela dedicada.
- `DIVERGENTE`: props `can.authorizePayment`, `can.printPaymentAuthorization` e `parameters.autorizacao_pagto_automatica` existem nos tipos/payload, mas não materializam essas ações na UI atual.

### Lote, revisão e auditoria

- `CONFIRMADO`: autorização atual é exclusivamente unitária. Não há command/read model de lote, seleção por filtro nem resultado individualizado por item.
- `CONFIRMADO`: revision do agregado e lock de linha melhoram o contrato Delphi; idempotência diferencia replay de conflito de payload.
- `OPORTUNIDADE`: um command de lote deve preservar a atomicidade decidida, usar um snapshot/selection token ou identidades explícitas, revalidar cada item sob lock e definir resposta all-or-nothing ou por item, sem confiar em “selecionar todos” enviado pelo cliente.
- `CONFIRMADO`: o log estruturado de autorização existe, mas `ContasPagarAuditLogReader` e seu teste apenas garantem resposta sem segredos; não foi localizada persistência de evento financeiro/audit id retornado pelo command.

### Impressão

- `CONFIRMADO`: `PrintPaymentAuthorizationQuery` separa leitura de mutação, valida ability e filial, exclui pagas e exige ao menos uma autorizada. Isso é mais seguro que os caminhos Delphi que autorizam ao imprimir.
- `DIVERGENTE`: a saída é apenas payload JSON (`tipo`, documento, duplicatas, `gerado_em`); o próprio código registra PDF como entrega futura. Não há snapshot, identificador do autorizador, data de autorização nem UI/preview.
- `DIVERGENTE`: escopo `todas` significa todas as duplicatas autorizadas abertas de um único documento, enquanto a tela Delphi pode selecionar duplicatas de documentos/fornecedores distintos.

### Cobertura de testes existente

- `CONFIRMADO`: há teste feature do happy path de autorizar por usuário administrador com perfil Pagamento; ele verifica apenas `autorizado=true`.
- `CONFIRMADO`: há testes separados para manifest do parâmetro, abilities gerais, Filiais do cadastro, payload financeiro proibido, revisão, idempotência/concorrência de pagamento, logs sem segredo e validação mínima da rota de impressão.
- `NÃO LOCALIZADO`: testes de proof delegado no command de autorização, proof próprio, acesso negado, filial negada nesse endpoint, revisão stale, replay/mismatch, pago, já autorizado, rollback, `dataautorizacaopagto`, autorização automática na criação, desautorização, lote, impressão efetiva e UI.
- `DÚVIDA`: vários testes feature pulam quando a fixture não possui tabelas; não foi executada a suíte nesta decisão, portanto o inventário confirma código/cobertura declarada, não saúde do ambiente.

### Matriz resumida Delphi versus Laravel atual

| Capacidade | Estado Laravel |
|---|---|
| Autorizar uma duplicata | `CONFIRMADO`, backend sem UI e sem data |
| Autorizar em lote/selecionar todos | `NÃO LOCALIZADO` |
| Desautorizar/cancelar autorização | `NÃO LOCALIZADO` |
| Autorização automática na criação | `DIVERGENTE` |
| Proof sensível | `DIVERGENTE` |
| OCC, lock e idempotência | `CONFIRMADO`, superior ao Delphi |
| Escopo de Filiais | `CONFIRMADO` no command unitário |
| Filtros/grade/totais | `NÃO LOCALIZADO` |
| Imprimir sem mutar | `CONFIRMADO` como JSON, sem UI/PDF |
| Auditoria de operador/autorizador | `DIVERGENTE`, somente log |
| Integração com Quitação | `CONFIRMADO`, mas proof/contexto precisam separação |

### Limite de reuso

`AuthorizeDuplicataPaymentCommand` deve ser aprofundado, não descartado: preservar identidade canônica, transação, locks, revision, idempotência, branch access e logging. Ele precisa corrigir persistência da data, separar ability de operador e proof do autorizador, usar ação sensível própria e definir auditoria. A paridade completa exige ainda read model/lista dedicada, command de desautorização, orquestração de lote e UI ERP; `PrintPaymentAuthorizationQuery` pode ser base da impressão, desde que expandida para seleção multi-documento, preview/PDF e dados auditáveis.
