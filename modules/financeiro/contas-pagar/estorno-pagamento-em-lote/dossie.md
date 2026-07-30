# Dossiê — Estorno de Pagamento em Lote de Duplicatas

## 1. Missão e fontes

Este dossiê fixa o contrato para especificar no Laravel uma página completa de **Estorno de Pagamento em Lote**, com paridade funcional ao Cadastro/Tela de Cancelamento de Quitação Delphi e simetria arquitetural com a Quitação em Lote. Ele planeja; não implementa.

Fontes primárias:

- `C:/projetos.vcl/apps/contaspagar/dmcancelamentoquitacao.pas/.dfm`;
- `C:/projetos.vcl/apps/contaspagar/fmcancelamentoquitacao.pas/.dfm`;
- caminhos alcançados em `dmcontaspagar.pas/.dfm`, `fmcontaspagar.pas/.dfm`, `dmquitacaoduplicatas.pas/.dfm` e `dmautorizacaopagamento.pas/.dfm`;
- [Inventário Delphi](inventario-delphi.md);
- [Interface e fluxo Delphi](pesquisa-interface-fluxo-delphi.md);
- [Baseline Laravel](pesquisa-laravel-atual.md);
- `laravel/specs/247-quitacao-duplicata`, `254-quitacao-duplicata-bank` e `277-quitacao-lote-duplicatas`;
- ADR-0246, ADR-0247/0255, ADR-0254 e ADR-0277.

Termo canônico: **Estorno do Pagamento**. `Cancel`, `Cancelled`, `Rebuild` e “cancelamento de quitação” são nomes legados/técnicos a eliminar da nova superfície, não conceitos novos.

## 2. Evidência consolidada

### Delphi

`CONFIRMADO`: existe página completa com jornada `Parâmetros → F6 → lista/seleção → F5 → senha/Autorizador → processamento`. Filtra Data de Pagamento, Filial/Grupo, Parte Fornecedora, Conta e Conta contábil; exibe Duplicatas pagas, marcação e totais.

`CONFIRMADO`: quem possui perfil `Pagamento` pode desquitar; sem ele, um Autorizador com esse perfil fornece credencial. Não existe permissão funcional exclusiva de Estorno.

`CONFIRMADO`: o núcleo limpa fatos de pagamento, volta a Duplicata para autorizada, remove eventos exatos e reconstrói movimentos bancários/contábeis compartilhados. É possível desfazer somente uma Duplicata de um cheque compartilhado.

`DIVERGENTE`: a tela em lote chama o núcleo por Duplicata, ignora retorno falso e não garante atomicidade global.

`DIVERGENTE`: o Delphi renova a data de autorização; a decisão atual restaura a evidência original.

`NÃO LOCALIZADO`: campo específico de motivo e Auditoria explícita nas units. O motivo obrigatório é requisito novo confirmado, não paridade demonstrada.

`NÃO LOCALIZADO`: fusão explícita de residual no Estorno legado. O Laravel deve usar manifesto causal, não inferência.

### Laravel atual

`CONFIRMADO`: o Estorno individual já é transacional/idempotente por manifesto e possui adoção de pagamentos órfãos.

`CONFIRMADO`: Quitação em Lote cria manifestos individuais correlacionados por `batch_payment_id`, além de envelope batch.

`CONFIRMADO`: `estornarEventoExato()` já remove evento exato, soma eventos restantes, preserva/exclui cabeçalho conforme cardinalidade. É a primitiva única para reconstrução parcial de `SINGLE_CHECK`.

`DIVERGENTE`: `CancelDuplicataPaymentCommand` mistura autorização, preflight e apply; não existe núcleo reversível compartilhado.

`DIVERGENTE`: persistem nomes `Cancel`, `Cancelled`, `Rebuild` e scope `SHARED_BANK_GROUP` sem a semântica sugerida.

`NÃO LOCALIZADO`: orquestração batch de Estorno, preview, read model, endpoint, página, envelope, reconciliador e idempotência batch.

`DIVERGENTE`: `QuitacaoEmLoteEstornoPostgresTest` está `markTestIncomplete`.

## 3. Regra central e máquina de estados

O Estorno de Pagamento em Lote é uma única intenção financeira atômica sobre uma ou várias Duplicatas. Qualquer falha produz zero efeitos.

```text
PAID --Estorno do Pagamento--> AUTHORIZED
```

PAID permanece imutável fora do Estorno. O Estorno preserva identidade/dados originais e restaura a autorização original. Manifestos de Quitação são históricos imutáveis; cada Estorno cria seu próprio manifesto ligado ao `payment_id` original.

Situação derivada do envelope da Quitação original:

- `PAID`: nenhum item estornado;
- `PARTIALLY_REVERSED`: parte dos itens estornada;
- `REVERSED`: todos os itens estornados.

## 4. Contrato profundo

```text
preview(BatchPaymentReversalDraft, OperatorContext): BatchPaymentReversalPreview
confirm(BatchPaymentReversalConfirmation, OperatorContext): BatchPaymentReversalResult

# interno e compartilhado entre individual/lote
preflight(PaymentReversalIntent, LockedPaymentContext): PaymentReversePlan
apply(PaymentReversePlan[], SharedTransactionContext): PaymentReversalEffectManifest
```

Controllers/Requests/React não conhecem repositories, writers, locks ou transações. O Estorno individual passa a consumir o mesmo núcleo. É proibido loop de commands individuais.

`preview` é somente leitura: normaliza identidades/revisões/`payment_id`, resolve dependências, calcula ordem causal e fotografia before/after, adota logicamente legado, gera token/hash expirável. Não consome proof nem grava.

`confirm` repete o preflight sob locks antes da primeira escrita e executa tudo numa única transação: idempotência, Documentos, Duplicatas, residuais, tributos, agregados bancários/contábeis, apply agrupado, manifestos, envelopes, Auditoria e reconciliação.

## 5. Elegibilidade e adoção legada

Rejeitar o lote quando qualquer item estiver inexistente, não pago, já estornado, fora da Filial, com revisão alterada, vínculo incompleto, período fechado, movimento conciliado/integrado, dependência ausente ou efeito não reversível.

Pagamento antigo sem manifesto só entra quando o servidor reconstruir deterministicamente o manifesto completo por chaves persistidas. Nunca parsear histórico, aproximar por valor ou escolher “primeiro compatível”. A adoção é planejada no preview e persistida no confirm.

## 6. Dependências, residual, desconto e tributos

O preview calcula fechamento de dependências sem ampliar a seleção silenciosamente.

- residual aberta/inalterada criada pela Quitação: excluir e restaurar integralmente a Duplicata original;
- residual posteriormente paga: seu pagamento precisa integrar a seleção; estornar a cadeia em ordem causal inversa;
- residual alterada, ciclo ou dependência ausente: bloquear tudo;
- Desconto Obtido: restaurar exatamente o `valordesconto` anterior, desfazendo só o delta do manifesto;
- imposto retido pago: exigir inclusão explícita e reversibilidade; período fechado/vínculo incompleto bloqueia.

## 7. Reconstrução de efeitos compartilhados

Agrupar `PaymentReversePlan` por agregado. Remover todos os efeitos selecionados e produzir uma única fotografia final por cabeçalho.

Para `SINGLE_CHECK`:

- remover eventos por `{conta, datapagto, sequencia, evento, sequenciaevento}`;
- se restarem eventos, preservar identidade/cheque/vínculos e recalcular valor/caracterização pela soma persistida;
- se não restar evento, excluir o cabeçalho;
- aplicar regra equivalente aos créditos/lotes contábeis compartilhados.

Movimento conciliado/integrado externamente bloqueia; esta feature não reabre conciliação nem cria compensação.

## 8. Segurança, motivo e Auditoria

Abilities técnicas separadas para visualizar, preview e confirmar, todas derivadas da mesma Permissão funcional `Pagamento` e Filiais. Não criar perfil de Estorno.

Proof específico do Estorno em Lote, vinculado a seleção, revisões, dependências, motivo, preview hash e efeitos. Operador com `Pagamento` usa a própria senha; sem ele, Autorizador com `Pagamento`. Admin/Suporte não substitui o perfil.

Motivo único por lote, obrigatório, normalizado, 3–500 caracteres. Não sobrescreve observação da Duplicata. Integra hash, proof, idempotência, manifestos e Auditoria.

Auditoria transacional registra `batch_reversal_id`, correlação/idempotência, Operador/Autorizador, Filiais/filtros, motivo, before/after, dependências, manifestos, residual/desconto, tributos, banco, Contabilidade, reconstruções, parâmetros, revisões e reconciliação. Falha causa rollback.

## 9. Página e UX

Página própria, irmã da Quitação em Lote. Fluxo:

```text
filtros/F6 -> lista completa -> seleção -> motivo -> preview/F5
-> dependências explícitas -> proof -> confirmação única -> resultado/reload
```

Filtros: período de Data de Pagamento, Filiais, Parte Fornecedora, Conta, cheque, Documento/Duplicata, `batch_payment_id`; ordenação por Data, Parte Fornecedora ou Valor.

Sem paginação. Retornar todos os registros até 2.000; acima disso, 413 e nenhum resultado parcial. Grid virtualizado preserva teclado/foco/seleção.

Grid: elegibilidade; Parte Fornecedora; Documento/vencimento/número; nota/complemento; Data/Valor Pago; Conta/cheque; `NONE`/`SINGLE_CHECK`; lote; residual/desconto; situação bancária/contábil; bloqueio. Totais pesquisados/selecionados fixos.

Preview separa selecionados, dependências, reconstruções before/after e bloqueios. Alterar filtros, seleção, dependências ou motivo invalida preview/proof.

Timeout após confirm entra em “Processamento em verificação” e consulta por `batch_reversal_id`/idempotência; nunca reenvia automaticamente. Nunca há sucesso parcial.

## 10. Reconciliação e idempotência

Mesma chave+hash retorna replay; mesma chave com conteúdo diferente retorna 409. `pending` usa lease/ownership recuperável.

Antes do commit, provar todas e somente as transições/efeitos planejados, snapshots, dependências, somas/cardinalidades, ausência de órfãos, manifestos/envelopes e Auditoria. Divergência reverte tudo.

Após commit, verificação somente leitura por `batch_reversal_id` gera observabilidade/alerta, sem reparação automática.

## 11. Matriz preservar/corrigir/criar/remover

| Superfície | Estado | Decisão |
|---|---|---|
| Manifestos individuais + `batch_payment_id` | implementado | **Preservar/aprofundar** |
| `estornarEventoExato` e writer bancário | implementado | **Preservar** como mecanismo único |
| Quitação em Lote preview/confirm/idempotência | implementado | **Reutilizar padrão**, não acoplar casos de uso |
| Estorno individual | implementado, misturado | **Corrigir** para usar núcleo reversível compartilhado |
| Adoção de órfão | implementada | **Aprofundar** com preflight determinístico e batch |
| Contabilidade/tributos do Estorno | parcial | **Corrigir** manifesto/resultado/reconciliação |
| `Cancel/Cancelled/Rebuild` | divergente | **Remover/renomear** conforme ADR-0255, sem aliases novos |
| scope `SHARED_BANK_GROUP` | enganoso | **Remover/corrigir**, pois seleção não expande lote |
| `QuitacaoEmLoteEstornoPostgresTest` incompleto | lacuna | **Substituir** por fixtures executáveis |
| núcleo `preflight/apply` reversível | inexistente | **Criar** internamente |
| preview/confirm/read model/UI batch | inexistente | **Criar** |
| envelope/idempotência/Auditoria batch reversal | inexistente | **Criar/estender stores existentes** |
| reconciliador batch e verificação pós-commit | inexistente | **Criar/aprofundar reconciliador financeiro** |
| perfil funcional de Estorno | inexistente | **Não criar**; reutilizar `Pagamento` |

## 12. Testes e gates

Unitários: hash, dependências, ordem causal/locks, adoção, residual/desconto, reconstrução agrupada, estados derivados, reconciliador.

Feature: rotas/menu, filtros sem paginação, teto 2.000, seleção, motivo, abilities/Filiais/proof, preview, erros, replay/pending.

PostgreSQL real: rollback no enésimo, `NONE`, `SINGLE_CHECK` parcial/último evento/múltiplos eventos, residual encadeado, desconto, tributos, Contabilidade, Auditoria, adoção e ausência de órfãos.

Concorrência: sobreposição por item/agregado, mudança preview/confirm, deadlock order, replay simultâneo e recovery.

Frontend: virtualização, teclado/foco, dependências, invalidação, duplo envio, timeout/replay e acessibilidade.

Nenhum teste financeiro PostgreSQL crítico pode ficar skipped/incomplete.

Fases: P0 caracterização/matriz; P1 núcleo reversível e regressão individual; P2 manifestos/dependências/reconstrução com PostgreSQL; P3 orquestração atômica/idempotência/Auditoria/reconciliação; P4 página/UX/retomada; P5 concorrência/regressão/feature flag. Rota/menu só são liberados após P3–P5 verdes.

## 13. Fora do escopo e proibido

Não alterar Delphi; reespecificar Quitação/Autorização de Pagamento salvo seam compartilhado; estornar outros domínios; criar motor paralelo; commit por item; seleção implícita; heurística textual/valor; reabrir conciliação; corrigir dados silenciosamente; usar Filial global; esperar Usuário dentro de TX; aceitar sucesso parcial; confiar fatos financeiros do browser.
