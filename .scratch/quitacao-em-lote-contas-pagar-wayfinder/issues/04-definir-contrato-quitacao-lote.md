# Definir o contrato transacional da Quitação em Lote

Type: task
Status: resolved
Blocked by: 01, 02, 03

## Question

Confrontando Delphi, Laravel atual e decisões já fixadas, qual deve ser o contrato server-side do lote para elegibilidade, autorização, compatibilidade entre itens, preview, coleta prévia das decisões de parcial, atomicidade, locks, idempotência, erros, Auditoria, Contabilidade, tributos e transição de estado, e qual interface profunda reutilizará a Quitação individual?

## Answer

### Interface profunda e seam

Criar o módulo profundo **Quitação em Lote de Duplicatas** na camada Application, com apenas:

```text
preview(BatchPaymentDraft, OperatorContext): BatchPaymentPreview
confirm(BatchPaymentConfirmation, OperatorContext): BatchPaymentResult
```

Controller, Request e UI são adapters e não conhecem repositories, writers, locks ou transações. Extrair de `PayDuplicataCommand` um **Motor de Quitação de Duplicata** interno:

```text
preflight(PaymentIntent, LockedPaymentContext): PaymentPlan
apply(PaymentPlan, SharedTransactionContext): PaymentEffectManifest
```

O command individual e o lote consomem esse seam. O individual conserva sua própria idempotência/transação; o lote chama o motor dentro de uma transação compartilhada. `PayDuplicatasBatchAdapter` deixa de ser o seam público: pode ser removido ou delegar a `confirm`, nunca executar loop de commits unitários.

### Elegibilidade e estado

Sob lock, cada Duplicata deve existir por `(documentopag, datavencto, numero)`, pertencer a Documento não-previsão e Filiais acessíveis, estar não paga e em `AUTHORIZED`, ter Autorização de Pagamento vigente para o snapshot e não participar de fluxo/remessa conflitante.

Uma inelegibilidade invalida o lote inteiro. Proof de Quitação não autoriza Duplicata: o lote rejeita qualquer item sem Autorização de Pagamento vigente. A única transição é `AUTHORIZED -> PAID`; depois do commit, `PAID` é imutável e só admite Estorno do Pagamento, conforme ADR-0247.

### Segurança e proof

- `viewBatchPayments` controla consulta e `initiateBatchPayment` permite iniciar o fluxo no módulo/Filiais.
- Confirmar exige Sensitive Operation `ContasPagar/quitar_duplicatas_lote` vinculada ao manifesto inteiro.
- Com perfil `pagamento`, o Operador confirma com senha própria; sem perfil, usa credencial de um Autorizador com perfil `pagamento`, como no legado.
- O FormRequest verifica a ability de iniciar, não exige perfil antes de aceitar proof.
- Operador e Autorizador são persistidos separadamente; podem coincidir no modo senha própria.
- Administrador/Suporte não substitui automaticamente o perfil `pagamento`.
- O proof vincula ação, identidades, Filiais, valores, decisões parciais, agrupamento, cheque, revisões e `preview_hash`, sendo consumido uma única vez na transação. Nunca persistir proof/senha brutos.

### Preview somente leitura

`BatchPaymentDraft` contém itens com identidade/revisão, dados comuns (`datapagto`, `filialpagto`, `tipopagamento`, `contapagto`, cheque/observação opcionais) e agrupamento `NONE` ou `SINGLE_CHECK`.

`preview` normaliza/deduplica/ordena, limita o lote, aplica Filiais, relê dados, calcula valores server-side para a data, valida Tipo/Conta/Evento/Parâmetros/integração/Contabilidade, classifica integrais e parciais e retorna token opaco expirável, `preview_hash`, revisões por Documento, totais, warnings e decisões pendentes. Não reserva saldo, não cria locks duradouros, não consome proof e não grava efeitos.

### Pagamento parcial

Para cada `0 < valorpagto < valor devido`, `confirm` exige uma decisão:

- `GENERATE_REMAINDER_INSTALLMENT`;
- `OBTAINED_DISCOUNT`.

`CANCEL` existe somente na UI: fecha o fluxo sem chamar `confirm`.

**Gerar outra parcela** quita a atual pelo valor informado e cria o saldo com o mesmo vencimento e próximo número alocado sob lock. Preserva configurações de multa/juros do legado sem capitalizar novamente encargos já realizados. A residual nasce autorizada apenas quando `parametros_valor('AUTORIZACAO PAGTO AUTOMATICA')` estiver ativo; senão nasce aberta e não autorizada. Exige fotografia reversível e allocator seguro, nunca `MAX+1` desprotegido.

**Desconto Obtido** não cria parcela e persiste explicitamente o desconto adicional em `valordesconto`, com fotografia before/after. Valor zero/desconto integral fica fora desta tela, usando o fluxo individual. Valor acima do devido é `422`.

### Compatibilidade e agrupamento

Todos compartilham data, Filial de Pagamento, Tipo e Conta. Cada item preserva Evento, Parte Fornecedora, Documento, valor e decisão parcial. Todos devem ser compatíveis com Filiais, calendário/data contábil, Conta/Tipo ativos, integração bancária, contrapartida/adapter contábil e impostos.

`SINGLE_CHECK` exige cheque, uma Conta/data/Filial/Tipo e cria um agregado apenas para esta intenção. Não anexa implicitamente a movimento histórico. Cheque já usado fora do replay retorna `409`. `NONE` cria um cabeçalho por Duplicata; informar cheque não autoriza agregação implícita.

### Transação, locks e idempotência

`confirm` valida token/hash/payload, valida proof e abre uma única `DB::transaction`. Dentro dela:

1. reserva idempotência batch crash-safe;
2. bloqueia Documentos em ordem crescente;
3. bloqueia Duplicatas por `(documentopag, datavencto, numero)`;
4. serializa allocators bancários, contábeis e de parcela em ordem canônica;
5. relê Parâmetros e executa preflight de todos antes do primeiro write;
6. aplica todos os planos, banco, impostos, Contabilidade e Auditoria;
7. reconcilia todos os efeitos e conclui idempotência;
8. faz commit; somente depois agenda impressão e recarrega a UI.

Nenhuma transação aguarda diálogo ou impressora. Uma única `idempotency_key` e hash cobrem manifesto, itens ordenados, revisões, valores, parcial, dados comuns, agrupamento e cheque. Mesma chave/hash retorna replay; mesma chave com outro hash retorna `409`. Pending não é apagado para tentar novamente: usa lease/ownership crash-safe. Revisões são validadas por Documento, e itens do mesmo Documento não invalidam uns aos outros dentro da própria intenção.

### Writer e manifesto bancário

Substituir a heurística atual por uma intenção bancária tipada contendo `payment_id`, agrupamento, Conta/data/cheque/Filial e entradas por Duplicata. O resultado contém cabeçalho e, por item, Evento, `sequenciaevento`, valor e observação.

- `movtosbancos.documento = chequepagto`; sem cheque fica vazio.
- Histórico individual: `[NF|DOC][ complemento] DUP {documentopag}/{numero} - {Parte Fornecedora}`.
- `NONE`: cabeçalho/evento individuais usam histórico e Evento do item.
- `SINGLE_CHECK`: um cabeçalho total negativo, observação `PAGTO DIVERSAS DUPLICATAS` e Evento nulo; um evento individual por Duplicata.
- O writer retorna `sequencia` e `sequenciaevento` realmente persistidas; ambas são gravadas na Duplicata na mesma transação.
- Alocação é serializada; proíbem-se `MAX+1` inseguro e busca pelo “primeiro agregado compatível”.

Cada `PaymentEffectManifest` inclui fotografia da Duplicata, vínculo bancário completo, impostos, Contabilidade e Auditoria, sendo base reversível para Estorno.

### Campos e efeitos

Persistir por item `datapagto`, `valorpagto`, `filialpagto`, `tipopagamento`, `contapagto`, `chequepagto`, Evento, `sequencia`, `sequenciaevento`, lote/conta contábil, Operador e referência do manifesto/Auditoria. Preservar a Autorização de Pagamento e sua autoria.

Usar somente `ContasPagarParameterManifest`/`ParameterReadBundle`. Com `GERARCONTABILIDADE=false`, efeito contábil é `skipped`; ativo exige adapter real e contrapartidas antes de writes, e o stub atual bloqueia tudo. Impostos usam `OrigemImpostosRetidos::PagamentoDuplicatas` na mesma transação. Schema/parâmetro obrigatório ausente falha rápido conforme ADR-0007.

### Reconciliação, Auditoria e impressão

Antes do commit, reconciliar estado/valores das Duplicatas, revisões dos Documentos, soma cabeçalho/eventos, chaves exatas, Contabilidade, impostos, lote e ausência de órfãos.

Auditoria persistente/transacional registra `batch_payment_id`, Operador, Autorizador, proof seguro, Filiais, idempotência/correlação, dados comuns, agrupamento/cheque, cada before/after, decisão parcial/residual e manifestos dos efeitos. Falha de Auditoria causa rollback; `Log::info` é apenas observabilidade.

Impressão/recibo é efeito pós-commit recuperável e idempotente. Falha de impressora não desfaz nem torna incerta a Quitação.

### Resultado e erros

`BatchPaymentResult` retorna `batch_payment_id`, replay, instante, quantidade/total, agrupamento, novas revisões por Documento, itens, manifesto bancário, estados contábil/tributário, Auditoria, jobs de impressão e warnings. Cada item retorna estado `PAID`, valor, residual opcional, `sequencia` e `sequenciaevento`.

Erros: `401` sessão; `403` ability/Filial/proof; `404` recurso no escopo; `409` revisão/estado/cheque/idempotência/manifesto; `410` preview expirado; `413` lote excedido; `422` payload/parcial/data/Conta/Tipo/Evento; `503` dependência/Contabilidade/Auditoria. Envelope: `code`, `message`, `field_errors`, `item_errors`, `correlation_id`, `retryable`. Nunca há sucesso parcial.

### Matriz de tratamento

| Capacidade | Decisão |
|---|---|
| `PayDuplicataCommand` | preservar como adapter individual; extrair motor interno |
| `PayDuplicatasBatchAdapter` | substituir o loop por interface batch profunda |
| locks/revisão/Filiais | preservar e ampliar ao conjunto ordenado |
| idempotência | aprofundar para uma intenção batch crash-safe |
| cálculo/parcial | centralizar; coletar escolhas antes do write |
| writer bancário | substituir heurística por intenção/manifesto tipado |
| parâmetros/impostos | preservar seams existentes |
| Contabilidade | preservar seam fail-closed; exigir implementação real quando ativa |
| reconciliador | ampliar para todos os efeitos/lote |
| Sensitive Operation | preservar infraestrutura; criar contexto batch |
| logs | manter; adicionar Auditoria persistente |
| impressão | pós-commit, fora do sucesso financeiro |

### Proibido

Loop de commands com commits independentes; transação aguardando Usuário; fatos financeiros confiados ao browser; agregação implícita; `MAX+1` inseguro; anexar a histórico ambíguo; sucesso antes de commit/reconciliação/Auditoria; Refazer Pagamento; ou segundo motor financeiro exclusivo do lote.
