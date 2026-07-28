# Definir a UX, a segurança, a reconciliação e os testes do Estorno em Lote

Type: grilling
Status: resolved
Blocked by: 04

## Question

Como a página, filtros, seleção, prévia, confirmação, proof, permissões herdadas da Quitação, Auditoria, concorrência, idempotência, erros, acessibilidade, reconciliação e testes devem expor e provar o contrato transacional decidido para o Estorno em Lote?

## Answer

### Superfície e jornada

O Estorno de Pagamento em Lote terá página própria no hub de Contas a Pagar, irmã da Quitação em Lote. Reutiliza AppLayout, grid, lookups, campos, atalhos e linguagem visual vigentes, mas possui rota, título e intenção próprios; não haverá alternância “quitar/estornar” na mesma tela.

Fluxo canônico:

```text
filtros/F6 -> lista completa -> seleção -> motivo -> preview/F5
-> aceite explícito das dependências -> proof sensível
-> confirmação única -> resultado/reload
```

`Esc` fecha o diálogo ou abandona a jornada sem efeitos. O CTA final é **Confirmar Estorno em Lote**. Durante `confirm`, edição, navegação destrutiva e duplo envio ficam bloqueados; sucesso só é anunciado após commit e reconciliação.

### Filtros e lista sem paginação

Filtros: período de Data de Pagamento; uma ou mais Filiais permitidas; Parte Fornecedora; Conta de Pagamento; cheque; Documento/Duplicata; `batch_payment_id`; ordenação por Data de Pagamento, Parte Fornecedora ou Valor Pago. Conta contábil é projeção/efeito, não filtro obrigatório inicial.

A consulta retorna todos os registros encontrados em uma única lista, sem paginação, limitada a **2.000 registros**. Acima do teto, retorna erro específico e nenhum conjunto parcial, orientando refinar filtros. O grid usa virtualização apenas para renderização, sem alterar o conjunto ou a semântica de seleção.

Cada linha carrega identidade `(documentopag, datavencto, numero)`, revisão e `payment_id`. Linhas inelegíveis permanecem visíveis, desabilitadas e com motivo acionável. A seleção é explícita e nunca usa `all_results` ou ampliação implícita.

Colunas: seleção/elegibilidade; Parte Fornecedora; Documento, vencimento e número; nota/complemento; Data/Valor do Pagamento; Conta/cheque; origem `NONE`/`SINGLE_CHECK`; lote de Quitação; residual/desconto; situação bancária/contábil; observação de bloqueio. Totais fixos mostram quantidade/valor pesquisados e selecionados.

### Motivo, preview e dependências

O motivo comum é obrigatório antes da prévia, normalizado, com 3–500 caracteres, e não sobrescreve a observação da Duplicata. Alterar filtros, seleção, dependências aceitas ou motivo invalida imediatamente token/hash/proof e exige nova prévia.

A prévia separa visual e semanticamente:

- itens selecionados pelo Operador;
- dependências obrigatórias, como residual posteriormente pago ou tributo derivado;
- reconstruções compartilhadas, exibindo cheque/lote contábil antes e depois;
- bloqueios que impedem a confirmação.

Dependências nunca são acrescentadas silenciosamente. O Operador deve incluí-las/aceitá-las explicitamente e visualizar quantidade/valor, ordem causal e fotografia final dos agregados antes do proof.

### Segurança e Auditoria

Visualizar, gerar prévia e confirmar são abilities técnicas distintas para defesa em profundidade, todas derivadas da mesma Permissão funcional `Pagamento` e do escopo de Filiais. Não se cria perfil funcional de Estorno.

Confirmar exige proof específico do Estorno em Lote, vinculado a seleção, revisões, motivo, dependências, preview hash e efeitos compartilhados. O próprio Operador pode provar com perfil `Pagamento`; caso contrário, usa Autorizador com esse perfil. Administrador/Suporte não o substitui automaticamente. Persistem Operador e Autorizador separadamente, nunca senha/proof bruto.

A Auditoria é persistente e transacional e inclui `batch_reversal_id`, correlação/idempotência, motivo, proof fingerprint, Operador/Autorizador, Filiais, filtros, itens/dependências, before/after, manifestos originais e de Estorno, residual/desconto, tributos, banco, Contabilidade, cabeçalhos reconstruídos, envelopes originais, parâmetros efetivos, revisões e resultado de reconciliação. Falha causa rollback; log técnico não substitui Auditoria.

### Estados, erros e retomada

Estados obrigatórios: inicial; carregando; vazio; resultados; limite excedido; seleção pronta; preview/revisão; proof; confirmando; verificação de timeout; validação; forbidden; conflito; preview expirado; dependência indisponível; sucesso; replay.

- conflito de revisão, dependência ou agregado: zero efeitos, itens destacados e nova prévia obrigatória;
- preview expirado: preserva filtros/seleção/motivo, mas recalcula;
- timeout após confirm: mostra **Processamento em verificação** e consulta por `batch_reversal_id`/idempotência, sem reenvio automático;
- replay concluído: devolve o mesmo resultado e o identifica como já processado;
- nunca existe sucesso parcial.

Envelope de erro uniforme: `code`, `message`, `field_errors`, `item_errors`, `correlation_id`, `retryable`. Baseline: 401 sessão; 403 ability/Filial/proof; 404 recurso no escopo; 409 revisão/estado/dependência/agregado/idempotência; 410 preview expirado; 413 teto de 2.000; 422 payload/motivo/seleção; 503 dependência.

### Acessibilidade

Grid virtualizado preserva navegação por teclado, foco e leitura de seleção. F6 pesquisa e F5 gera preview quando válidos. Diálogos prendem e restauram foco, possuem título/rótulos, resumo, ordem de dependências e ações explícitas. `Esc` nunca confirma. Loading, conflito, bloqueio e sucesso são anunciados por região viva; cor não é o único indicador.

### Reconciliação

Há duas provas:

1. dentro da transação, confrontar o manifesto planejado com Duplicatas, autorizações, residuais, descontos, dependências, tributos, Contabilidade, eventos/cabeçalhos bancários, manifestos, envelopes, Auditoria e revisões; qualquer divergência lança erro e reverte tudo;
2. após o commit, verificação somente leitura por `batch_reversal_id` para observabilidade/alerta, sem reparação automática nem reabertura da transação concluída.

### Testes obrigatórios

**Unitários**: normalização/hash; fechamento de dependências; ordem causal e de locks; adoção legada; restore de residual/desconto; agrupamento/reconstrução final de banco/Contabilidade; situação derivada do lote original; reconciliador; erros/idempotência.

**Feature**: rota/menu/middleware; filtros; lista sem paginação; teto 2.000 sem resultado parcial; seleção e inelegibilidade; motivo 3–500; invalidação do preview; abilities/Filiais; proof próprio/Autorizador; dependências explícitas; envelopes; replay/consulta de pending.

**PostgreSQL real**: rollback ao falhar o enésimo item; `NONE`; `SINGLE_CHECK` parcial e último evento; vários itens do mesmo cabeçalho; mistura de agregados; residual aberto e cadeia residual paga; Desconto Obtido; tributos; Contabilidade; Auditoria; adoção legada; reconciliação e ausência de órfãos.

**Concorrência**: dois Estornos do mesmo item/agregado; alteração entre preview/confirm; locks em ordens concorrentes; replay simultâneo; colisão de chave/hash; recovery de `pending`.

**Frontend/acessibilidade**: lista virtualizada completa; seleção/totais; atalhos; foco/teclado; dependências e before/after; invalidação; duplo clique; timeout/consulta; replay; mensagens sem sucesso parcial.

**Regressão**: Estorno individual usa o mesmo motor; Quitação individual/em lote, Autorização de Pagamento, PAID imutável e writers/manifestos `NONE`/`SINGLE_CHECK` permanecem verdes. Nenhum teste PostgreSQL crítico pode usar `skip` ou `markTestIncomplete` como resultado aceitável.

### Rollout e gates

Rota/menu permanecem ocultos até: motor reversível compartilhado e regressão individual verdes; PostgreSQL real provar atomicidade e `SINGLE_CHECK`; Auditoria/reconciliação obrigatórias; idempotência/timeout recuperáveis; documentação e observabilidade prontas. Ativação por feature flag começa em Filial controlada. Não existe fallback para loop item a item.
