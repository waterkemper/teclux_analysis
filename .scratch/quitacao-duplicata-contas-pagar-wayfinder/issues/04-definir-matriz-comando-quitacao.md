# Definir a matriz e o contrato seguro do comando de Quitação de Duplicata

Type: task
Status: resolved
Blocked by: 01, 02, 03

## Question

Confrontando tela Laravel, comportamento Delphi e efeitos transacionais, quais capacidades serão reutilizadas, estendidas, substituídas ou excluídas, e qual deve ser o contrato verificável de autorização, Pay/Cancel/Rebuild, parcial/residual/desconto, Filiais, parâmetros, revisão, idempotência, locks, auditoria, erros, UX e adapters de lote/retorno?

## Answer

### Decisão arquitetural

Criar um módulo profundo **Quitação de Duplicata** em `App\Services\ContasPagar\QuitacaoDuplicata`, com uma interface pública pequena e toda a complexidade financeira escondida em sua implementação:

```php
preview(PaymentPreviewCommand): PaymentPreviewResult
pay(PayDuplicataCommand): PaymentCommandResult
cancel(CancelPaymentCommand): PaymentCommandResult
rebuild(RebuildPaymentCommand): PaymentCommandResult
```

O seam externo é essa interface. Controllers da tela, lote e retorno são adapters e não chamam repositories/writers diretamente. Writers tributário, bancário, contábil, auditoria, revisão e idempotência são seams internos da implementação, não parte da interface conhecida pelos callers.

`DECISÃO` — `preview` é somente leitura, não reserva valores nem autoriza a operação. `pay`, `cancel` e `rebuild` são comandos financeiros server-side, atômicos e idempotentes. Não existe “salvar o Documento para efetivar pagamento”.

### Matriz preservar/reutilizar/estender/substituir/excluir

| Capacidade atual | Decisão | Contrato futuro |
|---|---|---|
| `Cadastro.tsx`, `DuplicatasGrid`, `DuplicataDialog` | **Preservar e estender** | Manter seleção, lookups, layout e prévia; adicionar estados `pay`, `cancel`, `rebuild`, Filial de Pagamento, decisão parcial e feedback pós-commit. |
| `calcDuplicataValorAPagar` TypeScript | **Preservar como projeção** | Exibir estimativa; backend recalcula e é autoridade. Divergência relevante exige nova confirmação/revisão. |
| `useSensitiveOperationAuth` e proof | **Estender** | Retornar proof/contexto ao comando; backend faz peek dentro da validação e consumo vinculado ao sucesso. |
| `DocumentoPagPolicy`/`canEdit` | **Substituir para finanças** | Abilities separadas `payDuplicata`, `cancelDuplicataPayment`, `rebuildDuplicataPayment`; edição cadastral não concede pagamento. |
| `LegacyDuplicataRepository` | **Reutilizar leituras; estender writes pontuais/locks** | Proibir `replaceAll` para fatos financeiros e impedir update cadastral desses campos. |
| `DocumentoPagCadastroPageService` | **Separar responsabilidades** | Continua cadastro; deixa de aceitar/derivar Quitação e deixa de sincronizar ocasião Pagamento no save genérico. |
| `DocumentoPagImpostosRetidosGenerationService` | **Estender** | Manter regras e vínculo, mas executar ocasião `PagamentoDuplicatas` dentro da transação do comando, com locks/idempotência. |
| `LegacyMovtosBancosRepository` | **Reutilizar mapeamentos/leitura; não reutilizar CRUD como comando** | Extrair writer de pagamento origem `P`, participante da transação externa e com allocator atômico. CRUD manual continua origem `B`. |
| Contabilidade de pagamento | **Criar** | Writer origem `P`, lote atômico, balanceamento e cancelamento/rebuild simétricos. |
| login literal `tecsoft` | **Excluir** | Ability privilegiada + proof + motivo + auditoria. |
| `MAX+1`, estado financeiro do cliente e autorização apenas visual | **Excluir** | Sequence/allocator com lock; derivação server-side; proof consumido pelo comando. |

### Identidade, estado e revisão financeira

A Duplicata é identificada por `{documento_pag, data_vencimento, numero}`. Toda resposta inclui `payment_id` estável para a Quitação e `financial_revision` opaca. A revisão é uma versão monotônica persistida do agregado financeiro — preferencialmente coluna/version store; enquanto o schema legado não puder recebê-la, usar registro de comando/auditoria versionado, nunca hash calculado somente no cliente.

Estados expostos:

```text
OPEN_UNAUTHORIZED | OPEN_AUTHORIZED | PAID | CANCELLED (histórico) | REBUILT (histórico)
```

`PAID` é derivado do fato confirmado e seus efeitos reconciliados, não apenas de `datapagto`. `CANCELLED` e `REBUILT` são eventos/auditoria; a parcela corrente volta a aberta ou permanece paga, respectivamente.

Comandos exigem `expected_revision`. Divergência retorna `409 FINANCIAL_REVISION_CONFLICT` com snapshot atual; o servidor nunca mescla silenciosamente intenção antiga.

### Rotas HTTP e envelopes

```text
POST /contas-pagar/documentos/{documento}/duplicatas/{vencimento}/{numero}/pagamento/preview
POST /contas-pagar/documentos/{documento}/duplicatas/{vencimento}/{numero}/pagamento
DELETE /contas-pagar/documentos/{documento}/duplicatas/{vencimento}/{numero}/pagamento
POST /contas-pagar/documentos/{documento}/duplicatas/{vencimento}/{numero}/pagamento/refazer
```

As rotas são comandos, não CRUD da Duplicata. `DELETE` recebe JSON validado para motivo/proof/revisão/idempotência; se a infraestrutura não aceitar body em DELETE, usar `POST .../pagamento/cancelar` sem mudar o contrato de domínio.

Cabeçalhos/campos comuns aos comandos mutáveis:

- `Idempotency-Key`: UUID obrigatório, único por ator + ação;
- `expected_revision`;
- `proof` e `authorization_context_id` quando a Policy/catalog exigir;
- `origin: ui|batch|supplier_return` derivado pelo adapter, não confiado de request arbitrário;
- `correlation_id` propagado ou criado no servidor.

Resposta `200/201`:

```json
{
  "command_id": "uuid",
  "payment_id": "uuid",
  "replayed": false,
  "financial_revision": "opaque",
  "duplicata": {},
  "residual_duplicata": null,
  "effects": {
    "bank": {"status": "applied|not_applicable", "key": null},
    "accounting": {"status": "applied|disabled", "batch": null},
    "withheld_taxes": {"status": "applied|not_applicable", "documents": []}
  },
  "audit_id": "uuid",
  "warnings": []
}
```

Retry com a mesma chave e mesmo fingerprint retorna a mesma resposta e `replayed=true`; mesma chave com payload diferente retorna `409 IDEMPOTENCY_KEY_REUSED`.

### Contrato de `preview`

Entrada: identidade, Data de Pagamento, Filial de Pagamento, Tipo, Conta opcional, cheque opcional e valor pretendido opcional. Saída: Data do Servidor, revisão corrente, valor calculado, juros/multa/desconto, capacidades, parâmetros efetivos, requisitos de Conta/Evento/Contabilidade e alternativas parciais válidas.

`preview` informa, sem mutar:

- `FULL_PAYMENT`;
- `PARTIAL_CREATE_RESIDUAL` com valor residual calculado;
- `PARTIAL_AS_DISCOUNT`;
- `FULL_DISCOUNT` quando valor financeiro é zero;
- warnings de data futura e cheque compartilhado;
- se proof será exigido.

O frontend não decide valores derivados nem envia `usuario`, `autorizado`, Evento, sequências, lote, conta contábil de crédito ou documentos de imposto.

### Contrato de `pay`

Entrada específica:

```text
payment_date, payment_branch_id, payment_type_id,
bank_account_id?, cheque_number?, observation?,
settlement_mode: FULL | PARTIAL_CREATE_RESIDUAL | PARTIAL_AS_DISCOUNT | FULL_DISCOUNT,
amount?, accepted_preview_fingerprint
```

Regras:

1. Documento/Duplicata persistidos, Documento fora de edição, não previsão e parcela aberta.
2. Policy `payDuplicata`; Filiais de Emissão, Contábil e Pagamento verificadas por `UserBranchAccessService` em leitura, lookup e comando.
3. Proof vinculado a ação, identidade completa, Filial de Pagamento, fornecedor, data, modalidade, valores e revisão. Alteração desses dados invalida o proof.
4. Data do servidor como default; Data de Pagamento não anterior à emissão nem a `parametros_valor('DATA CONTABIL')`. Data futura requer `accept_future_date=true` e warning/fingerprint vigente.
5. Recalcular valor server-side. Se divergir do preview acima da tolerância monetária, retornar `409 PAYMENT_PREVIEW_STALE` com nova prévia.
6. Pagamento não zero exige Tipo; bancário exige Conta compatível/autorizada e Evento. Adiantamento exige saldo suficiente sob lock e não cria novo movimento bancário.
7. `PARTIAL_CREATE_RESIDUAL` cria residual atomicamente, herdando vencimento/juros/multa; autorização da residual segue `parametros_valor('AUTORIZACAO PAGTO AUTOMATICA')`.
8. `PARTIAL_AS_DISCOUNT` não cria residual; diferença vira desconto confirmado.
9. `FULL_DISCOUNT` exige valor zero, desconto integral e limpa Tipo/Conta/Cheque; não cria movimento bancário.
10. Aplicar Duplicata, impostos, bancos origem `P`, Contabilidade, auditoria e reconciliação numa única transação.

`DECISÃO` — O possível comportamento Delphi de movimento bancário em desconto integral é rejeitado: sem saída de caixa, banco é `not_applicable`.

### Contrato de `cancel`

Exige `payment_id`, `expected_revision`, `reason` obrigatório, proof e escopo explícito:

```text
scope: CURRENT_PAYMENT | SHARED_BANK_GROUP
```

- Policy `cancelDuplicataPayment`; parcela precisa estar paga pelo `payment_id` informado.
- Bloquear se imposto derivado/vínculo impeditivo já foi quitado ou período está fechado.
- `CURRENT_PAYMENT` remove somente os efeitos registrados no manifesto da Quitação e recalcula cabeçalhos/lotes compartilhados.
- `SHARED_BANK_GROUP` exige listar previamente os `payment_id`s afetados, proof cobrindo o conjunto e mesma revisão de grupo; tudo cancela ou nada cancela.
- Não localizar efeitos “por valor”; usar chaves/manifesto persistidos no comando original.
- Após cancelar, a Duplicata volta a `OPEN_AUTHORIZED` somente se existir autorização ainda válida para a nova revisão; caso contrário `OPEN_UNAUTHORIZED`. Não reproduzir reautorização automática Delphi.

### Contrato de `rebuild`

Exige Policy `rebuildDuplicataPayment`, proof sem reuso, motivo obrigatório e `payment_id` atual. Entrada contém o novo contrato completo de pagamento; `preserve_existing=true` apenas preenche a intenção no adapter, não ordena ao servidor copiar cegamente.

Na mesma transação:

```text
lock → validar pagamento atual → desfazer pelo manifesto
→ revalidar/recalcular novos dados → aplicar nova Quitação
→ reconciliar → auditoria única com before/after → commit
```

Não há estado aberto observável. O resultado recebe novo `payment_id` e revisão; auditoria liga `rebuilds_payment_id` ao anterior.

### Transação, locks e writers internos

Ordem obrigatória dentro de uma única `DB::transaction`, com retry apenas para deadlock/serialization e sempre protegido pela idempotência:

1. reservar/ler registro de idempotência;
2. `lockForUpdate` Documento, Duplicata e versão financeira;
3. validar Policy, Filiais, parâmetros, proof e estado;
4. bloquear saldo de Adiantamento e derivados tributários relevantes;
5. bloquear/obter allocator bancário Conta+Data e lote contábil;
6. aplicar writer pontual da Duplicata/residual;
7. aplicar writer tributário;
8. aplicar writer bancário origem `P`;
9. aplicar writer contábil origem `P`;
10. persistir manifesto dos efeitos, auditoria e nova revisão;
11. reconciliar Duplicata↔eventos↔cabeçalho, débito=crédito e vínculos tributários;
12. consumir proof e finalizar idempotência; commit.

Qualquer falha lança exceção e produz rollback integral. Writers não abrem/confirmam transações próprias. Allocators usam sequence PostgreSQL ou linha de contador bloqueada; `MAX+1` é proibido inclusive no fallback de teste.

### Parâmetros canônicos

Resolver por `ParameterService`/`parametros_valor('texto')`, com Filial contextual quando aplicável:

| Texto | Uso | Falha/ausência |
|---|---|---|
| `AUTORIZACAO PAGTO AUTOMATICA` | autorização de nova residual | false |
| `DATA CONTABIL` | fechamento/data mínima | inválido bloqueia mutação |
| `GERARCONTABILIDADE` | ativa writer contábil | false |
| `EXERCICIOCONTABILIDADE` | exercício/allocator contábil | ativo e inválido bloqueia |
| `Início Integração Bancos` | ativa writer bancário | data ausente/inválida: integração desativada com diagnóstico |
| `Histórico padrão pagto duplicata` | fallback de histórico | nullable; fornecedor tem precedência |

As chaves Laravel atuais `Gerar pagamentos dos impostos retidos` e `FornecedorParaISS` permanecem adicionais. Não criar aliases nem corrigir grafia silenciosamente.

### Auditoria e idempotência

Persistir, na mesma transação, um command log/manifesto com:

- comando, status e fingerprint canônico;
- ator, autorizador, proof/contexto e abilities;
- origem, correlação e idempotency key;
- Documento/Duplicata, Filiais e revisão antes/depois;
- snapshot financeiro antes/depois, modalidade e motivo;
- chaves bancárias, contábeis, tributárias e residual criadas/removidas;
- timestamps do servidor, resultado e erro sanitizado.

Senha e token bruto nunca entram no log. Falhas anteriores à transação podem ser registradas na auditoria sensível existente; sucesso financeiro e manifesto precisam ser transacionais.

### Catálogo de erros verificável

| HTTP | Código | Tratamento UX |
|---|---|---|
| 403 | `PAYMENT_FORBIDDEN`, `PAYMENT_BRANCH_FORBIDDEN`, `AUTH_PROOF_INVALID` | fechar desafio/explicar permissão; não alterar grade |
| 404 | `DUPLICATA_NOT_FOUND` | fechar modal e recarregar Documento |
| 409 | `DUPLICATA_ALREADY_PAID`, `PAYMENT_NOT_FOUND`, `FINANCIAL_REVISION_CONFLICT` | exibir conflito e snapshot atual |
| 409 | `PAYMENT_PREVIEW_STALE`, `IDEMPOTENCY_KEY_REUSED` | renovar prévia ou gerar nova chave |
| 422 | `ACCOUNTING_PERIOD_CLOSED`, `WITHHELD_TAX_ALREADY_PAID`, `ADVANCE_BALANCE_INSUFFICIENT` | erro de domínio, manter intenção editável |
| 422 | `PAYMENT_TYPE_REQUIRED`, `BANK_ACCOUNT_REQUIRED`, `EVENT_REQUIRED`, `INVALID_SETTLEMENT_MODE` | focar campo correspondente |
| 503 | `PAYMENT_RECONCILIATION_FAILED` | informar rollback; oferecer retry seguro com mesma chave |

Erros nunca retornam sucesso parcial. Exceções técnicas recebem `correlation_id`.

### UX final

- Botão **Pagar** somente em parcela aberta e Documento persistido; **Cancelar Quitação** em paga; **Refazer Pagamento** somente com ability. `Ctrl+P` aciona a ação disponível.
- Abrir modal chama `preview`; defaults usam `dataServidor` e Filial Base acessível, não relógio do navegador nem Filial de Emissão disfarçada.
- Mudança de Data/Filial/Tipo/Conta/Valor renova preview e invalida proof anterior.
- Parcial exige escolha visual entre residual e desconto; zero exige confirmação “100% de desconto”.
- Confirmação chama o comando imediatamente. A linha só vira Paga após resposta pós-commit; save cadastral permanece independente.
- Durante envio, bloquear repetição; em timeout, repetir com a mesma idempotency key. Sucesso atualiza somente snapshot retornado e mostra `payment_id`/resumo dos efeitos; conflito recarrega a linha.
- Cancelamento mostra efeitos/conjunto atingido antes do proof. Refazer mostra antes/depois e exige motivo.

### Adapters de lote e retorno

- `PayDuplicatasBatch` itera/coordena comandos individuais usando a mesma interface, com `origin=batch`, chave determinística por lote+parcela e autorização de lote que cubra explicitamente o conjunto.
- `ApplySupplierPaymentReturn` usa `origin=supplier_return`, idempotency key derivada de arquivo+registro+parcela e ator técnico auditável. Arquivo não equivale a proof; a Policy define credencial/autoridade do adapter.
- Reprocessar arquivo/lote devolve replay, não duplica efeitos. Erro por parcela deve ter política explícita: padrão **transação por parcela com relatório**, salvo lote que exija atomicidade de grupo.
- Adapters convertem input externo para commands e resultados; não expõem writers, sequences ou SQL.

### Fases de implementação obrigatórias

1. **Proteção cadastral e seam:** retirar campos financeiros/autorização do FormRequest/update/`replaceAll`; criar interface, DTOs, erros, abilities, revisão e idempotency store.
2. **Motor Pay mínimo:** preview/pay, locks, proof, writer pontual, parcial/desconto/Adiantamento e auditoria; inicialmente effects desativados apenas se parâmetros legitimamente os tornam não aplicáveis.
3. **Efeitos financeiros:** writer bancário `P`, writer contábil, tributário na ocasião correta, allocators e reconciliação; Pay só pode ser liberado em produção quando todos os efeitos exigidos estiverem ativos.
4. **Cancel/Rebuild:** manifestos simétricos, grupo compartilhado, motivo e testes de rollback.
5. **UX e adapters:** modal/grade/atalho, lote/retorno, observabilidade e rotina de reconciliação operacional.

Cada fase exige testes PostgreSQL de adulteração, duas quitações concorrentes, duas parcelas Conta/Data, retry após commit, rollback induzido em cada writer, período/Filial/proof, parcial, desconto integral, Adiantamento, cancelamento compartilhado e rebuild.

### Critério de decisão encerrado

Esta matriz resolve a forma do comando, segurança, efeitos e UX. O próximo trabalho não precisa decidir arquitetura: deve consolidar estas decisões no dossiê específico e num prompt Spec Kit autocontido, mantendo referências ao Laravel atual e ao Delphi como evidência.
