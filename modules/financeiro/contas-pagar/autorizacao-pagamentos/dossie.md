# Dossiê — Autorização de Pagamentos em Contas a Pagar

## 1. Objetivo e autoridade

Este documento especifica o módulo de **Autorização de Pagamentos** do tecLUX Laravel, confrontando a tela Delphi `fmautorizacaopagamento`/`dmautorizacaopagamento` com o Laravel revalidado em 2026-07-20. Ele complementa o dossiê de [Quitação de Duplicata](../quitacao-duplicata/dossie.md) e não o substitui.

Vocabulário obrigatório:

- **Duplicata**: parcela de uma obrigação de Contas a Pagar, identificada por `(documentopag, datavencto, numero)`;
- **Autorização de Pagamento**: evidência contextual e revogável que permite submeter uma Duplicata a uma tentativa de Quitação;
- **Quitação**: fato financeiro confirmado somente após commit e reconciliação;
- **Operador**: Usuário da sessão que inicia a ação;
- **Autorizador**: outro Usuário com Permissão Pagamento que concede a Autorização;
- **proof**: credencial opaca, curta e consumível que evidencia a aprovação; não é a Autorização persistida.

Fontes: tickets em `.scratch/autorizacao-pagamentos-wayfinder/issues/`, Delphi em `delphi/apps/contaspagar/`, Laravel em `laravel/backend/`, ADR-0002, ADR-0005, ADR-0007 e ADR-0246.

## 2. Comportamento Delphi confirmado

A tela Delphi oferece duas jornadas:

1. **Autorizar**: pesquisa Duplicatas abertas e ainda não autorizadas por Filial ou Grupo de Filiais, Parte Fornecedora, vencimento e lançamento.
2. **Cancelar ou Imprimir**: pesquisa Duplicatas abertas e autorizadas por data de autorização.

A grade exibe fornecedor, Documento, número da Duplicata, nota/série, vencimento, valor, previsão, data da autorização e marca. Permite marcar uma, marcar todas, ver observação, quantidade e valor do resultado e da seleção. `F5` executa Autorizar/Cancelar, `F6` consulta e `Esc` volta aos filtros. O rótulo `Imprimir F7` diverge do handler, que chama Autorizar/Cancelar; isso não deve ser reproduzido.

O estado fica em `duplicatas.autorizado` e `duplicatas.dataautorizacaopagto`. Autorizar grava `true/now`; desautorizar grava `false/null`. Duplicatas pagas (`datapagto` preenchida) e documentos de previsão ficam fora da tela. A Quitação seleciona somente Duplicatas abertas e autorizadas.

O desafio legado exige perfil `Pagamento`: senha do próprio Usuário quando ele possui o perfil, ou login/senha de outro Usuário autorizado. O Autorizador não é persistido. O parâmetro textual é `AUTORIZACAO PAGTO AUTOMATICA`; ativo faz caminhos de criação/recriação nascerem autorizados.

Não preservar: SQL concatenado, Filial apenas visual, data provisória usada como seleção, ausência de concorrência/auditoria, impressão que muta estado e divergência do F7.

## 3. Baseline Laravel revalidado

Já existem e devem ser aprofundados, não duplicados:

- `AuthorizeDuplicataPaymentCommand` e `AuthorizeDuplicataPaymentRequest`;
- rota `POST .../duplicatas/autorizar` e `DocumentosPagarController::autorizarDuplicata`;
- `DocumentoPagPolicy` e `ContasPagarDocumentosPagarAuthorizationService`;
- `ContasPagarFinancialRevision`, `ContasPagarIdempotencyGuard`, locks e repositories legados;
- `SensitiveOperationAuthService`, `SensitiveOperationProofService`, validator, hook e modal;
- `UserBranchAccessService`, `ParameterReadBundle` e `ContasPagarParameterManifest`;
- `PrintPaymentAuthorizationQuery` e rota JSON de impressão;
- `PayDuplicataCommand`, que consome o estado autorizado ou proof;
- logs, props `can`, parâmetros Inertia e testes de Contas a Pagar.

Pontos fortes atuais: identidade canônica, transação, lock, revisão, idempotência, revalidação de Filial, proteção do rascunho financeiro e impressão separada de mutação.

Lacunas confirmadas:

- command grava `autorizado=true`, mas não `dataautorizacaopagto`;
- proof usa a ação `quitar_duplicata`, misturando Autorização e Quitação;
- Request e command exigem perfil Pagamento do Operador antes de aceitar proof, tornando delegação inalcançável;
- regra sobre Autorizador igual/diferente do Operador é inconsistente;
- `AUTORIZACAO PAGTO AUTOMATICA` não é aplicado na criação/recriação;
- não existe página dedicada, consulta transversal, desautorização, lote ou seleção em massa;
- endpoint de autorizar não é chamado pela UI;
- impressão retorna somente JSON, limita-se a um Documento e não possui preview/PDF na UI;
- autoria existe somente em `Log::info`, sem Auditoria financeira durável;
- testes de autorização cobrem essencialmente um happy path.

## 4. Matriz de tratamento

| Capacidade | Tratamento |
|---|---|
| Identidade `(documentopag, datavencto, numero)` | Preservar |
| `autorizado` + `dataautorizacaopagto` | Preservar e tornar coerente |
| Command, lock, revision, idempotência e Filiais atuais | Preservar e aprofundar |
| Command unitário atual | Estender, sem criar paralelo |
| Read model, desautorização e lote | Adicionar |
| Proof `quitar_duplicata` para autorizar | Substituir por contexto próprio |
| Perfil Pagamento exigido do Operador | Substituir por ability de iniciar + proof do Autorizador |
| Parâmetro dentro do command manual | Mover para pontos de criação/recriação |
| Impressão JSON sem mutação | Estender para seleção, preview e PDF |
| Impressão que autoriza | Excluir |
| Log técnico | Manter para observabilidade; adicionar Auditoria transacional |

## 5. Estados e invariantes

Estados observáveis:

- `OPEN_UNAUTHORIZED`: aberta, `autorizado=false`, data nula;
- `OPEN_AUTHORIZED`: aberta, `autorizado=true`, data preenchida e evidência compatível com o snapshot vigente;
- `PAID`: `datapagto` preenchida; fora do módulo de Autorização.

Transições:

- autorizar: `OPEN_UNAUTHORIZED -> OPEN_AUTHORIZED`;
- desautorizar: `OPEN_AUTHORIZED -> OPEN_UNAUTHORIZED`;
- quitar: `OPEN_AUTHORIZED -> PAID`, sob o módulo de Quitação;
- Pay pode compor autorização e Quitação na mesma transação quando consumir proof para o mesmo fingerprint;
- `PAID` nunca pode ser autorizado ou desautorizado.

Documento de previsão, Duplicata paga, Filial inacessível, estado divergente ou revisão stale nunca são elegíveis. Alteração material de Documento, Duplicata, Parte Fornecedora, Filial ou valores invalida a evidência.

Durante coexistência, `autorizado=true` legado sem Auditoria Laravel é `LEGACY_UNATTRIBUTED`: continua consumível, mas nenhum Autorizador é inventado; o primeiro consumo Cloud registra snapshot e origem legada.

## 6. Read model e filtros

Criar consulta dedicada, separada do cadastro de um Documento, que:

- aplica ability e Filiais autorizadas antes de paginar;
- exclui previsões e pagas;
- aceita operação `AUTHORIZE` ou `DEAUTHORIZE_OR_PRINT`;
- filtra por Filial ou Grupo de Filiais, Parte Fornecedora `(tipo,codigo)`, vencimento, lançamento e data de autorização;
- valida datas ISO e intervalos e usa binds;
- pagina por páginas, 25 por padrão, com ordem determinística;
- retorna identidade, Documento, fornecedor, nota/série, vencimento, valores, previsão server-side, estado, data/origem, observação, Filial, revisão e elegibilidade/razão;
- retorna `total_count` e `total_previsao` para o filtro autorizado.

## 7. Seleção e commands

Seleção da UI jamais altera estado persistido. Marcar página usa identidades explícitas. Selecionar todos os resultados cria `selection_token` opaco, expirável e vinculado a Usuário, ação, filtros, Filiais, chaves e revisões. Não aceitar `todos=true` como autoridade.

Interface de aplicação pretendida:

```text
search(AuthorizationSearch): AuthorizationPage
createSelection(SelectionIntent): SelectionToken
authorize(AuthorizePaymentIntent): AuthorizationCommandResult
deauthorize(DeauthorizePaymentIntent): AuthorizationCommandResult
print(PrintPaymentAuthorizationQuery): AuthorizationReport
```

O command aceita itens explícitos ou token, nunca ambos. Lote é all-or-nothing: impõe limite, bloqueia em ordem canônica, revalida todos, consome proof e grava estado/Auditoria em uma transação. Conflito produz zero mutações e detalhes seguros por item.

Mutações exigem `Idempotency-Key`, revisões, proof/fingerprint e origem derivada pelo adapter. Idempotência deve ser crash-safe e transacional. Resposta: `command_id`, `replayed`, novas revisões, contagens, totais, itens, `audit_id` e warnings.

Autorizar grava `true/server_now`. Desautorizar exige motivo e grava `false/null`, sem tocar em Quitação. Estado já atingido é 409, salvo replay comprovado.

## 8. Segurança e proof

Abilities distintas:

- `viewPaymentAuthorizations`;
- `authorizePayment`;
- `deauthorizePayment`;
- `printPaymentAuthorization`.

A ability do Operador permite iniciar o fluxo dentro do módulo/Filiais; não substitui proof. Autorização manual exige sempre proof `ContasPagar/autorizar_pagamento_duplicata`; desautorização exige `ContasPagar/desautorizar_pagamento_duplicata` e motivo. O Autorizador possui Permissão Pagamento e é diferente do Operador. Administrador/Suporte não substitui Pagamento.

Proof vincula ação, Operador, Autorizador, Filiais, chaves, valores, revisões e hash do conjunto; mudança invalida. O consumo é único e transacional. Nunca persistir ou logar senha/proof bruto.

Impressão é leitura: exige ability e Filiais, sem proof sensível e sem mutação.

## 9. Parâmetro e origem automática

Usar `ContasPagarParameterManifest` como equivalente Laravel a `parametros_valor('AUTORIZACAO PAGTO AUTOMATICA')`, com precedência Filial -> global -> ausente e fallback `false`, conforme ADR-0005.

Aplicar o valor em todos os pontos canônicos que criam/recriam Duplicatas abertas, inclusive Documento a Pagar, entrada de nota e residual quando definido pelo contrato de Quitação. Ativo cria `OPEN_AUTHORIZED` com data do servidor e Auditoria `SYSTEM_PARAMETER`; inativo cria `OPEN_UNAUTHORIZED`. Não fabricar Autorizador humano. Não usar introspecção de schema em runtime, conforme ADR-0007.

## 10. Auditoria e impressão

Auditoria durável e transacional por command/item deve registrar ação, origem, Operador, Autorizador, chaves, Filiais, Parte Fornecedora, revisão, fingerprint antes/depois, data, motivo, correlação, referência segura ao evento sensível e resultado. `Log::info` não substitui Auditoria.

`PrintPaymentAuthorizationQuery` permanece pura, mas passa a aceitar itens ou token multi-documento, revalidar ability/Filiais/estado e gerar preview/PDF com fornecedor, Filial, valores, data/origem e Autorizador quando conhecido. Legado não atribuído deve ser identificado como tal. Impressão nunca autoriza, renova, consome ou revoga.

## 11. UX ERP

Criar página completa em modules, com toolbar superior conforme ADR-0002:

- modos Autorizar e Desautorizar/Imprimir;
- filtros primários e avançados colapsáveis;
- lookups acessíveis de Filial, Grupo e Parte Fornecedora;
- grid densa paginada com checkbox separado do estado, observação e inelegibilidade;
- totais do resultado e seleção;
- confirmação de quantidade/valor/efeito antes do proof;
- `F5` muta, `F6` consulta, `F7` abre preview, `Esc` volta/fecha; atalhos não disparam em inputs/modais;
- estados loading, empty, error, forbidden, conflict, success, replay e timeout/retry.

Timeout reutiliza a mesma chave. Conflito recarrega preservando filtros e limpa seleção stale. Alterar filtros invalida token; seleção entre páginas só persiste enquanto contexto/revisões forem compatíveis.

## 12. Erros

- `401`: sessão ausente;
- `403`: ability, Filial ou proof recusado;
- `404`: Documento/Duplicata não encontrada no escopo;
- `409`: revisão, estado, token, fingerprint ou idempotência divergente;
- `410`: token expirado;
- `413`: lote acima do limite;
- `422`: filtros, intervalos, motivo ou payload inválido;
- `503`: Auditoria/dependência indisponível, com rollback e correlação.

Envelope com `code`, `message`, `field_errors`, `item_errors`, `correlation_id` e `retryable`. Usar códigos estáveis como `DUPLICATA_PAID`, `ALREADY_AUTHORIZED`, `REVISION_CONFLICT` e `PROOF_CONTEXT_MISMATCH`.

## 13. Integração com Quitação e adapters

`PayDuplicataCommand` usa o mesmo validador de Autorização e não replica regra de flag/proof. Se Pay receber proof para Duplicata não autorizada, compõe a mesma interface interna e vincula a evidência ao fingerprint da Quitação.

Autorização não chama writers bancário, contábil ou tributário. `PayDuplicatasBatch` e retorno de fornecedor consomem a interface, sem gravar `autorizado=true` diretamente. Cancelamento/Refazer da Quitação decidem o estado aberto resultante pela mesma política e não reutilizam proof.

## 14. Arquivos prováveis

Preservar/corrigir:

- `app/Application/ContasPagar/AuthorizeDuplicataPaymentCommand.php`;
- `app/Http/Requests/ContasPagar/AuthorizeDuplicataPaymentRequest.php`;
- `app/Http/Controllers/ContasPagar/DocumentosPagarController.php`;
- `app/Policies/ContasPagar/DocumentoPagPolicy.php`;
- `app/Services/Authorization/ContasPagarDocumentosPagarAuthorizationService.php`;
- `app/Application/ContasPagar/PrintPaymentAuthorizationQuery.php`;
- `app/Application/ContasPagar/PayDuplicataCommand.php`;
- `app/Infrastructure/Persistence/Legacy/ContasPagar/LegacyDuplicataRepository.php`;
- `app/Support/ContasPagar/ContasPagarParameterManifest.php`;
- `config/sensitive-operation-auth.php`;
- `resources/js/hooks/useSensitiveOperationAuth.ts` e componentes ERP existentes;
- testes `tests/Feature/ContasPagar/*`, `tests/Unit/ContasPagar/*` e testes frontend.

Novos apenas quando o seam exigir: read repository/query, request/controller da consulta e seleção, command/request de desautorização, fachada/orquestrador profundo, DTOs/results, storage de token, Auditoria financeira, report/PDF e página/componentes do módulo. Antes de criar, procurar padrões equivalentes no Laravel atual.

## 15. Fases

1. **P0 — Caracterização**: congelar baseline/testes, mapear rotas/menu/modules e schema real.
2. **P1 — Estado e segurança**: data coerente, abilities, contexts sensíveis, proof/fingerprint, Auditoria e parâmetro nos pontos de criação.
3. **P2 — Read model e UI**: consulta, filtros, paginação, totais, estados e seleção explícita.
4. **P3 — Desautorização e lote**: token, all-or-nothing, idempotência crash-safe, conflitos e retry.
5. **P4 — Impressão e integração**: preview/PDF, Pay/lote/retorno e observabilidade.

Cada fase preserva testes existentes e só avança com PostgreSQL real para locks, rollback e concorrência.

## 16. Testes e aceite

Exigir Unit, Feature, frontend e PostgreSQL para:

- filtros, paginação, totais, Grupos/Filiais e não vazamento;
- abilities, Operador/Autorizador e proof válido/expirado/usado/divergente;
- item/lote, estado/data, motivo e autorização automática;
- pago, previsão, stale, estado repetido, token expirado/adulterado e rollback;
- concorrência, locks ordenados, replay/mismatch e timeout;
- Auditoria, origem legada e ausência de segredos;
- preview/PDF multi-documento sem mutação;
- UX, teclado, acessibilidade e estados transversais;
- regressão do cadastro e integração sem efeitos financeiros indevidos.

Aceite: nenhum estado vem confiado do browser; nenhum pago/previsão/Filial externa é mutado; lote não produz sucesso parcial; retry não duplica; estado/data/Auditoria são coerentes; Operador e Autorizador são distintos; impressão é leitura; UI só confirma após commit; Autorização continua separada da Quitação.

## 17. Fora do escopo e proibido

- alterar Delphi;
- reespecificar Pay/Cancel/Rebuild além do consumo da Autorização;
- migrar integralmente telas de lote, remessa ou retorno;
- criar commands/services paralelos aos compatíveis existentes;
- copiar login mágico, proteção visual, Filiais globais, SQL concatenado, `MAX+1`, transação aguardando Usuário ou estado confiado ao cliente;
- corrigir silenciosamente Autorizações legadas sem autoria.
