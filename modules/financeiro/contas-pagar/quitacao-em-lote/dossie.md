# Dossiê — Quitação em Lote de Duplicatas em Contas a Pagar

## 1. Autoridade e objetivo

Fonte canônica para especificar no Laravel a página e o contrato de **Quitação em Lote de Duplicatas**, consolidando o Delphi alcançável, o Laravel revalidado em 2026-07-24 e as decisões do Wayfinder.

Vocabulário:

- **Autorização de Pagamento:** pré-condição vigente da Duplicata; não é criada pela Quitação;
- **Quitação:** transição atômica `AUTHORIZED -> PAID`, confirmada somente após efeitos e reconciliação;
- **Quitação em Lote:** uma intenção com várias Duplicatas e resultado indivisível;
- **agrupamento visual:** projeção da seleção por Documento ou Parte Fornecedora;
- **agrupamento bancário:** estratégia `NONE` ou `SINGLE_CHECK`, independente da visualização;
- **Estorno do Pagamento:** única operação posterior sobre uma Duplicata paga, conforme ADR-0247.

## 2. Fontes e classificação

Delphi: `dmquitacaoduplicatas.pas/.dfm`, `fmquitacaoduplicatas.pas/.dfm`, `dmcontaspagar.pas` (`QuitarDuplicatas`), `clparametrossistema.pas` e rotinas diretamente alcançadas de banco, Contabilidade, tributos, autorização e impressão em `C:/projetos.vcl`.

Laravel: `specs/196-contas-pagar-quitacao`, commands, adapter batch, Writer origem `P`, repositories, Policies, Sensitive Operation, parâmetros, revisão, idempotência, reconciliador, UI e testes atuais; dossiês de `quitacao-duplicata` e `autorizacao-pagamentos`; ADR-0002, ADR-0005, ADR-0007, ADR-0246 e ADR-0247.

Classificações usadas: `CONFIRMADO`, `DECIDIDO`, `DIVERGENTE`, `POSSÍVEL BUG LEGADO`, `NÃO LOCALIZADO` e `OPORTUNIDADE`.

## 3. Baseline Laravel a preservar e aprofundar

O Laravel já possui `PayDuplicataCommand`, `PayDuplicatasBatchAdapter`, `ContasPagarFinancialRevision`, `ContasPagarIdempotencyGuard`, repositories com locks, `ContasPagarMovimentoBancarioWriter`, `ContasPagarAccountingAdapter`, sincronização tributária, reconciliador, Filiais, Policies, proof sensível, UI de Documentos a Pagar e testes.

Reutilizar especialmente `DocumentoPagCadastroPageService`, `DocumentosPagarController`, `DocumentoPagPolicy`, `ContasPagarDocumentosPagarAuthorizationService`, `LegacyDocumentoPagRepository`, `LegacyDuplicataRepository`, infraestrutura de parâmetros/Sensitive Operation e componentes `AppLayout`, grid, `CatalogCodeLookup`, `BrIsoDateTextInput`, `BrNumericAmountField` e `SensitiveOperationAuthDialog`.

Lacunas confirmadas na revalidação:

- `PayDuplicatasBatchAdapter` é loop de `PayDuplicataCommand`, com idempotência e commit por item: não é lote atômico;
- `PayDuplicataCommand` concentra transação, proof, cálculo, parcial e writers, e ainda pode autorizar implicitamente item não autorizado;
- pagamento parcial residual usa alocação `MAX+1` sem serialização e não respeita integralmente o parâmetro de autorização automática;
- pagamento zero ainda é aceito no command, embora este fluxo de lote deva rejeitá-lo;
- Writer recebe `documentopag` em `movtosbancos.documento`, histórico `Pagto doc ... parc ...` e não devolve/persiste `sequenciaevento` completo;
- agregação bancária é heurística, sem intenção/manifesto tipado do lote;
- Auditoria financeira ainda depende de log técnico e a Contabilidade permanece fail-closed quando ativa;
- não há rota, página, read model, preview ou controller próprios para Quitação em Lote;
- testes PostgreSQL críticos ainda não constituem gate integral.

Não criar segundo motor. Extrair e aprofundar o núcleo individual existente.

## 4. Paridade funcional do Delphi

Jornada confirmada: parâmetros → gerar (F6) → registros detalhados/agrupados → marcar e editar previsão → dados comuns → confirmar (F5) → impressão. F11 alterna visões quando aplicável.

Filtros: intervalo de vencimento, uma ou mais Filiais, Carteira/Banco, Banco em cobrança, Parte Fornecedora, DDA e ordenação por vencimento/Fornecedor/valor. No legado, “Com DDA” significa todos; no Laravel usar `Todos`, `Sem DDA`, `Somente DDA`.

Colunas relevantes: Parte Fornecedora, Documento, número, nota/complemento, vencimento, atraso, valor no vencimento, previsão, Evento, observação e marcação. A previsão é recalculada pela data de pagamento e pode ser editada.

Dados comuns: Filial, Tipo de Pagamento, Conta, data, cheque, conta contábil quando aplicável e impressão de recibos por Documento/Fornecedor. A Conta é exigida quando banco, Contabilidade ou cheque a demandarem.

`POSSÍVEL BUG LEGADO`: o Delphi commita por Duplicata e conversa com o Operador durante a persistência. A solução Laravel deliberadamente substitui isso por decisões prévias e uma transação única.

## 5. Interface profunda

Expor na camada Application:

```text
preview(BatchPaymentDraft, OperatorContext): BatchPaymentPreview
confirm(BatchPaymentConfirmation, OperatorContext): BatchPaymentResult
```

Extrair do command individual um motor interno compartilhado:

```text
preflight(PaymentIntent, LockedPaymentContext): PaymentPlan
apply(PaymentPlan, SharedTransactionContext): PaymentEffectManifest
```

Controller, Requests e React não acessam repositories, writers, transações ou allocators. O command individual conserva sua orquestração própria; o lote executa todos os planos em contexto transacional comum. O adapter atual deixa de executar loop independente e passa a delegar ou é removido.

## 6. Elegibilidade, autorização e segurança

Sob lock, cada identidade `(documentopag, datavencto, numero)` deve existir, estar no escopo de Filiais, pertencer a Documento não-previsão, estar não paga e em `AUTHORIZED`, possuir autorização vigente para a revisão e não estar em remessa/fluxo conflitante. Qualquer item inválido rejeita o lote inteiro.

Abilities separadas controlam consulta e confirmação em lote. Confirmar exige proof `ContasPagar/quitar_duplicatas_lote`, vinculado ao fingerprint completo. Operador com perfil `pagamento` usa senha própria; caso contrário, credencial de Autorizador com esse perfil. Administrador/Suporte não substitui o perfil. Operador e Autorizador são auditados separadamente; segredo/proof bruto nunca é persistido.

Proof de Quitação nunca autoriza Duplicata. Autorização em lote permanece outro caso de uso.

## 7. Preview, parcial e compatibilidade

`BatchPaymentDraft` leva itens com identidade/revisão, previsão informada e dados comuns: data, Filial, Tipo, Conta, cheque e estratégia. `preview` normaliza, deduplica e ordena; limita o tamanho; relê dados; calcula valores no servidor; valida parâmetros, datas, Evento, Conta/Tipo, banco, Contabilidade e tributos; devolve token expirável, hash, revisões, totais, warnings, textos bancários e decisões pendentes. Não grava, não consome proof e não reserva locks duradouros.

Para cada `0 < previsão < valor devido`, exigir:

- `GENERATE_REMAINDER_INSTALLMENT`: quita pelo informado e cria saldo com mesmo vencimento e número seguro sob lock, preservando multa/juros sem capitalizar encargos; nasce autorizada somente se `parametros_valor('AUTORIZACAO PAGTO AUTOMATICA')` estiver ativo;
- `OBTAINED_DISCOUNT`: não cria parcela e grava explicitamente o desconto adicional em `valordesconto`;
- `CANCEL`: existe somente na UI e não chama `confirm`.

Valor zero/desconto integral e valor acima do devido ficam fora/rejeitados. Todas as escolhas integram preview, hash, proof, idempotência e Auditoria. Todos os itens compartilham data, Filial de pagamento, Tipo e Conta e precisam ser compatíveis com calendário, integração, Contabilidade e impostos.

## 8. Transação, locks e idempotência

`confirm` valida token/hash/payload/proof e executa uma única `DB::transaction`:

1. reserva idempotência batch crash-safe;
2. bloqueia Documentos e Duplicatas em ordem canônica;
3. serializa allocators bancário, contábil e de parcela;
4. relê parâmetros e faz preflight de todos antes do primeiro write;
5. aplica planos, banco, tributos, Contabilidade e Auditoria;
6. reconcilia todo o manifesto e conclui idempotência;
7. commita; somente depois agenda impressão e recarrega a UI.

Mesma chave/hash retorna o resultado persistido; mesma chave com payload diferente retorna `409`. Pending usa lease/ownership recuperável, não é apagado cegamente. Itens do mesmo Documento compartilham uma revisão inicial e não se invalidam entre si durante a própria intenção.

## 9. Bancos, cheque e vínculos

Estratégias:

- `NONE`: um `movtosbancos` e um `movtosbancoseventos` por Duplicata;
- `SINGLE_CHECK`: um cabeçalho pelo total e exatamente um evento por Duplicata.

`SINGLE_CHECK` exige cheque, Conta/data/Filial/Tipo comuns e não se anexa implicitamente a movimento histórico. Cheque já usado fora do replay retorna `409`.

`movtosbancos.documento = chequepagto`; sem cheque, vazio. Histórico individual: `[NF|DOC][ complemento] DUP {documentopag}/{numero} - {Parte Fornecedora}`; exemplo obrigatório `DOC DUP 209120/1 - ANDRA UNIFORMES`. Em `NONE`, cabeçalho/evento usam o histórico e Evento individual. Em `SINGLE_CHECK`, o cabeçalho tem valor total negativo, observação `PAGTO DIVERSAS DUPLICATAS` e Evento nulo; eventos mantêm históricos individuais.

O Writer recebe intenção tipada e retorna manifesto com `sequencia` e `sequenciaevento` realmente persistidas. Ambas são gravadas em cada Duplicata na mesma transação. Proibidos `MAX+1` desprotegido, busca por primeiro agregado compatível e conciliação por texto.

## 10. Contabilidade, tributos, parâmetros e Auditoria

Usar `ContasPagarParameterManifest`/`ParameterReadBundle` e `ParameterService`, com textos exatos de `parametros_valor`, incluindo `AUTORIZACAO PAGTO AUTOMATICA`, `DATA CONTABIL`, `GERARCONTABILIDADE`, `EXERCICIOCONTABILIDADE`, `Início Integração Bancos`, histórico padrão e parâmetros tributários existentes. Não criar aliases.

Contabilidade desativada resulta `skipped`; ativa exige adapter real e contrapartidas antes de writes. Impostos usam `OrigemImpostosRetidos::PagamentoDuplicatas` na mesma transação. Schema/parâmetro obrigatório ausente falha cedo conforme ADR-0007.

Auditoria persistente/transacional registra `batch_payment_id`, Operador, Autorizador, Filiais, correlação, idempotência, dados comuns, agrupamento, cheque, before/after, decisões, residuais e manifestos. Falha de Auditoria causa rollback; `Log::info` não basta.

## 11. Reconciliação e resultado

Antes do commit, reconciliar todas e somente as Duplicatas, campos de pagamento, revisões, `sequencia`/`sequenciaevento`, cardinalidades, soma/sinal de cabeçalhos e eventos, documento, histórico, banco, residual/desconto, Contabilidade, tributos, parâmetros e Auditoria. Não pode haver órfão, colisão ou efeito fora do conjunto. Divergência reverte tudo.

`BatchPaymentResult` retorna identificador, replay, instante, quantidade/total, estratégia, revisões novas, itens pagos, residual opcional, vínculos bancários, estados contábil/tributário, Auditoria, impressão e warnings. Após `PAID`, somente Estorno.

Erros: `401`, `403`, `404`, `409`, `410`, `413`, `422` e `503`, em envelope com `code`, `message`, `field_errors`, `item_errors`, `correlation_id` e `retryable`. Nunca sucesso parcial.

## 12. UI alvo

Página completa no hub, com endpoints separados para página/pesquisa, preview, confirmação e impressão.

1. Filtros e F6;
2. grid detalhado paginado, seleção explícita por identidade/revisão;
3. projeções detalhada/Documento/Fornecedor sem alterar o efeito bancário;
4. painel fixo de totais e dados comuns;
5. escolha explícita `NONE`/`SINGLE_CHECK`;
6. F5 chama preview e percorre diálogo parcial com progresso;
7. revisão final e proof sensível;
8. confirmação única, sem edição/duplo envio;
9. resultado/reload e impressão retomável pós-commit.

Linhas inelegíveis mostram motivo. Alteração da seleção, previsão ou dados comuns invalida a prévia. Cobrir loading, vazio, forbidden, validação, stale, preview expirado, processando, replay, sucesso e falha de impressão. Foco, teclado, rótulos e anúncios seguem ADR-0002.

## 13. Testes e critérios de aceite

Exigir Unit, Feature, frontend e PostgreSQL real para cálculos, parcial, seleção, filtros, abilities/Filiais/proof, preview sem escrita, atomicidade, rollback no enésimo item, locks/concorrência, idempotência/replay/crash, ambos os agrupamentos, vínculos/textos exatos, residual/desconto/parâmetro, Contabilidade, tributos, Auditoria, reconciliador, impressão pós-commit e regressão individual/Autorização/Estorno.

Testes PostgreSQL financeiros não podem permanecer `markTestSkipped`; indisponibilidade do ambiente no grupo CI falha visivelmente. Mocks não são prova única dos efeitos bancários.

Aceite:

- somente autorizadas são pagas e qualquer falha deixa zero efeitos;
- decisões interativas terminam antes da transação;
- `SINGLE_CHECK` produz um cabeçalho e um evento/vínculo exato por Duplicata; `NONE`, cabeçalhos individuais;
- documento/histórico e chaves persistidas coincidem com a prévia;
- retry não duplica e timeout pode retomar resultado;
- fatos financeiros nunca vêm confiados do browser;
- UI só anuncia sucesso após commit/reconciliação;
- Quitação individual e Estorno consomem os mesmos seams/manifestos.

## 14. Fora do escopo e proibido

Não alterar Delphi; reespecificar Autorização em Lote; migrar remessa/retorno; corrigir histórico silenciosamente; criar motor paralelo; permitir edição pós-pagamento; usar Filial global, SQL concatenado, `MAX+1` inseguro, transação aguardando Usuário, agregação implícita, sucesso parcial ou impressão dentro do sucesso financeiro.
