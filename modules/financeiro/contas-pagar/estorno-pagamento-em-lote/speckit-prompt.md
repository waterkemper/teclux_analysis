# Prompt Spec Kit — Estorno de Pagamento em Lote

Copie o bloco abaixo como entrada de `/speckit.specify`.

```text
CONTEXTO E MISSÃO

Crie uma nova especificação para implementar no Laravel a página completa de Estorno de Pagamento em Lote de Duplicatas em Contas a Pagar. Gere a spec, não implemente a feature nesta etapa.

Use **Estorno do Pagamento** e **Estorno de Pagamento em Lote** como termos canônicos. “Cancelamento de quitação”, Cancel/Cancelled e Rebuild são nomes legados a remover da nova superfície conforme ADR-0247/0255.

Antes de escrever, revalide o Laravel vigente; classes/rotas abaixo são baseline, não licença para duplicar componentes. Leia:

- modules/financeiro/contas-pagar/estorno-pagamento-em-lote/dossie.md
- modules/financeiro/contas-pagar/estorno-pagamento-em-lote/inventario-delphi.md
- modules/financeiro/contas-pagar/estorno-pagamento-em-lote/pesquisa-interface-fluxo-delphi.md
- modules/financeiro/contas-pagar/estorno-pagamento-em-lote/pesquisa-laravel-atual.md
- modules/financeiro/contas-pagar/quitacao-em-lote/dossie.md
- modules/financeiro/contas-pagar/quitacao-duplicata/dossie.md
- C:/projetos.vcl/apps/contaspagar/dmcancelamentoquitacao.pas e .dfm
- C:/projetos.vcl/apps/contaspagar/fmcancelamentoquitacao.pas e .dfm
- C:/projetos.vcl/apps/contaspagar/dmcontaspagar.pas e .dfm
- C:/projetos.vcl/apps/contaspagar/fmcontaspagar.pas e .dfm
- laravel/specs/247-quitacao-duplicata, 254-quitacao-duplicata-bank e 277-quitacao-lote-duplicatas
- laravel/docs/adr/0246-documentos-pagar-financial-commands.md
- laravel/docs/adr/0247-contas-pagar-payment-manifesto.md
- laravel/docs/adr/0254-contas-pagar-bank-payment-link.md
- laravel/docs/adr/0255-duplicata-paga-imutavel-estorno-unico.md
- laravel/docs/adr/0277-quitacao-lote-atomica.md

REGRA CENTRAL

Um Estorno em Lote é uma única intenção financeira atômica sobre uma ou várias Duplicatas. Todas são estornadas ou nenhuma é alterada. Nunca chame commands individuais em loop e nunca retorne sucesso parcial.

A única transição é PAID -> AUTHORIZED. Preserve identidade/dados originais e restaure a evidência de Autorização de Pagamento original. PAID permanece imutável fora do Estorno.

Manifestos originais são históricos imutáveis. Cada Estorno cria manifesto próprio ligado ao payment_id. O envelope da Quitação original expõe situação derivada PAID, PARTIALLY_REVERSED ou REVERSED sem reescrever sua fotografia.

BASELINE A PRESERVAR E CORRIGIR

Preserve ContasPagarPaymentManifestRepository, batch_payment_id, ContasPagarMovimentoBancarioWriter e LegacyContasPagarMovtosBancosRepository::estornarEventoExato. Essa primitiva já remove evento exato, recalcula cabeçalho pelos eventos restantes e o exclui no último evento.

Aprofunde o Estorno individual existente; extraia um núcleo reversível compartilhado. Não mantenha CancelDuplicataPaymentCommand e um segundo command batch com motores próprios. Elimine Rebuild e nomenclatura Cancel/Cancelled na superfície canônica; não propague aliases.

Confirme lacunas atuais: ausência de preview/confirm/read model/página/idempotência/envelope/reconciliador batch; retorno contábil incompleto; scope SHARED_BANK_GROUP enganoso; QuitacaoEmLoteEstornoPostgresTest incompleto.

CONTRATO DE APPLICATION

Especifique superfície equivalente a:

preview(BatchPaymentReversalDraft, OperatorContext): BatchPaymentReversalPreview
confirm(BatchPaymentReversalConfirmation, OperatorContext): BatchPaymentReversalResult

# interno e compartilhado com Estorno individual
preflight(PaymentReversalIntent, LockedPaymentContext): PaymentReversePlan
apply(PaymentReversePlan[], SharedTransactionContext): PaymentReversalEffectManifest

Controllers, Requests e React não conhecem repositories, writers, locks ou transações.

PREVIEW E CONFIRM

Preview é estritamente somente leitura: normaliza/deduplica identidades+revisões+payment_id, resolve dependências, calcula ordem causal/canônica, materializa before/after, planeja adoção legada e retorna token/hash expirável. Não consome proof, não grava e não mantém locks duradouros.

Confirm recebe token/hash, seleção final, dependências aceitas, revisões, motivo, idempotency_key e proof. Em uma única DB::transaction:

1. reserve idempotência batch crash-safe;
2. bloqueie Documentos e Duplicatas em ordem canônica;
3. bloqueie residuais, tributos e agregados bancários/contábeis em ordem determinística;
4. repita todo o preflight antes do primeiro write;
5. persista adoções legadas determinísticas;
6. aplique ReversePlans agrupados por agregado;
7. grave Duplicatas, dependências, banco, Contabilidade, tributos, manifestos, envelopes e Auditoria;
8. reconcilie tudo, conclua idempotência e commit;
9. execute verificação pós-commit somente leitura e observabilidade.

ELEGIBILIDADE E LEGADO

Sob lock, rejeite item inexistente, não PAID, já estornado, fora da Filial, com revisão alterada, vínculo incompleto, período fechado, movimento conciliado/integrado, dependência ausente ou efeito não reversível.

Pagamento sem manifesto só é elegível se as chaves persistidas permitirem reconstruir e validar deterministicamente manifesto completo. Nunca parseie histórico, aproxime por valor, escolha primeiro compatível ou limpe a Duplicata antes de provar a reversão. Adoção é planejada no preview e persistida no confirm.

DEPENDÊNCIAS, RESIDUAL, DESCONTO E TRIBUTOS

Preview calcula fechamento de dependências, mas nunca amplia seleção silenciosamente. Mostre e exija aceite/inclusão explícita.

- residual aberta e inalterada: excluir e restaurar integralmente a Duplicata original;
- residual posteriormente paga: incluir seu pagamento e estornar cadeia em ordem causal inversa;
- residual alterada, ciclo, ambiguidade ou dependência ausente: rejeitar lote;
- Desconto Obtido: restaurar exatamente valordesconto anterior do manifesto, desfazendo somente o delta;
- legado sem snapshot de desconto: somente adotar se valor anterior for determinístico;
- imposto retido pago: precisa integrar seleção e ser reversível; período fechado/vínculo incompleto bloqueia.

RECONSTRUÇÃO DE SINGLE_CHECK E CONTABILIDADE

Seleção pode conter apenas parte de uma Quitação original com cheque único. Não expanda para todas as Duplicatas.

Agrupe ReversePlans por cabeçalho. Remova todos os eventos selecionados por vínculo completo {conta, datapagto, sequencia, evento, sequenciaevento} e calcule uma fotografia final única:

- restam eventos: preserve identidade, cheque e vínculos; recalcule valor/caracterização pela soma persistida;
- nenhum evento: exclua cabeçalho;
- aplique semântica equivalente a créditos/lotes contábeis compartilhados.

Movimento conciliado ou integrado externamente bloqueia. Não reabra conciliação e não gere compensação automática.

SEGURANÇA, MOTIVO E AUDITORIA

Defina abilities técnicas distintas para visualizar, preview e confirmar, todas derivadas da mesma Permissão funcional Pagamento e Filiais. Não crie perfil funcional de Estorno.

Proof sensível específico do Estorno em Lote deve estar vinculado a seleção, revisões, dependências, motivo, preview hash e efeitos. Operador com Pagamento usa própria senha; sem ele, Autorizador com Pagamento. Admin/Suporte não substitui esse perfil. Persista Operador e Autorizador separadamente, nunca senha/proof bruto.

Motivo único por lote: obrigatório, trim, 3–500 caracteres. Não sobrescreve observacao da Duplicata. Integra hash, proof, idempotência, manifestos e Auditoria.

Auditoria persistente/transacional registra batch_reversal_id, correlação/idempotência, proof fingerprint, Operador/Autorizador, Filiais/filtros, motivo, before/after, itens/dependências, manifestos, residual/desconto, tributos, banco, Contabilidade, agregados reconstruídos, parâmetros, revisões e reconciliação. Falha causa rollback; Log::info não é Auditoria.

READ MODEL E UX

Crie página própria no hub de Contas a Pagar, irmã da Quitação em Lote, reutilizando AppLayout, grid/lookups/campos/atalhos vigentes. Não misture quitar/estornar na mesma rota/modo.

Filtros: período de Data de Pagamento; uma ou mais Filiais; Parte Fornecedora; Conta; cheque; Documento/Duplicata; batch_payment_id; ordenação por Data, Parte Fornecedora ou Valor.

Sem paginação: retornar todos os registros até 2.000. Acima disso, 413 e nenhum conjunto parcial; exigir refino. Grid virtualizado é otimização visual, sem mudar conjunto/seleção.

Linhas carregam identidade, revisão e payment_id. Inelegíveis ficam visíveis/desabilitadas com motivo. Colunas: elegibilidade; Parte Fornecedora; Documento/vencimento/número; nota/complemento; Data/Valor Pago; Conta/cheque; NONE/SINGLE_CHECK; lote; residual/desconto; situação bancária/contábil; bloqueio. Totais pesquisados/selecionados fixos.

Fluxo: filtros/F6 -> lista completa -> seleção -> motivo -> preview/F5 -> dependências explícitas -> proof -> Confirmar Estorno em Lote -> resultado/reload.

Preview separa selecionados, dependências obrigatórias, reconstruções before/after e bloqueios. Alterar filtros, seleção, dependências ou motivo invalida preview/proof. Esc cancela/fecha sem efeito. Bloqueie edição e duplo envio durante confirm.

Cubra loading, vazio, limite, forbidden, validação, conflito, preview expirado, dependência indisponível, confirmando, processamento em verificação, replay e sucesso. Timeout consulta status por batch_reversal_id/idempotência; nunca reenvia automaticamente.

IDEMPOTÊNCIA, ERROS E RESULTADO

Mesma chave+hash retorna mesmo resultado; mesma chave com conteúdo diferente retorna 409. pending usa lease/ownership recuperável.

Envelope de erro: code, message, field_errors, item_errors, correlation_id, retryable. Padronize 401 sessão; 403 ability/Filial/proof; 404 recurso no escopo; 409 revisão/estado/dependência/agregado/idempotência; 410 preview expirado; 413 >2.000; 422 payload/motivo/seleção; 503 dependência. Nunca sucesso parcial.

BatchPaymentReversalResult retorna batch_reversal_id, replay, instante, correlação/idempotência, motivo, Operador/Autorizador, itens AUTHORIZED, dependências, revisões, estados dos lotes originais, manifestos de Estorno, fotografias bancária/contábil/tributária, residual/desconto restaurados, Auditoria e warnings.

RECONCILIAÇÃO

Antes do commit, prove todas e somente as transições planejadas; autorização/snapshots; residual/desconto; dependências; eventos removidos; somas/sinais/cardinalidades; Contabilidade; tributos; manifestos/envelopes; Auditoria; revisões; ausência de efeitos fora do conjunto/órfãos. Divergência lança erro e rollback.

Após commit, faça verificação somente leitura por batch_reversal_id para alerta/observabilidade, sem reparação automática.

TESTES OBRIGATÓRIOS

Unitários: normalização/hash; fechamento de dependências; ordem causal/locks; adoção legada; residual/desconto; reconstrução agrupada banco/Contabilidade; situação PAID/PARTIALLY_REVERSED/REVERSED; reconciliador; erros/idempotência.

Feature: rota/menu/middleware; filtros; lista sem paginação; teto 2.000 sem parcial; seleção/inelegibilidade; motivo 3–500; invalidação; abilities/Filiais; proof próprio/Autorizador; dependências; envelopes; replay/status pending.

PostgreSQL real: rollback no enésimo item; NONE; SINGLE_CHECK parcial e último evento; vários itens do mesmo cabeçalho; mistura de agregados; residual aberto/cadeia paga; desconto; tributos; Contabilidade; Auditoria; adoção legada; reconciliação/ausência de órfãos.

Concorrência: dois Estornos no mesmo item/agregado; mudança preview/confirm; ordem anti-deadlock; replay simultâneo; mismatch; recovery pending.

Frontend/acessibilidade: virtualização completa; seleção/totais; F6/F5; foco/teclado/regions live; dependências; invalidação; duplo clique; timeout/status; replay. Cor não é único indicador.

Regressão: Estorno individual usa o mesmo núcleo; Quitação individual/em lote, Autorização de Pagamento, PAID imutável, manifestos e writers NONE/SINGLE_CHECK continuam verdes. Nenhum teste PostgreSQL crítico pode ficar skipped ou markTestIncomplete; mocks não são prova única.

MATRIZ E FASES

Inclua matriz já implementado/incompleto/faltante e preservar/corrigir/criar/remover baseada no código revalidado.

P0 caracterizar código/schema/rotas/testes e matriz.
P1 extrair núcleo reversível compartilhado; regressão individual.
P2 fechar manifestos/dependências/reconstrução e PostgreSQL.
P3 criar orquestração atômica, idempotência, Auditoria e reconciliação.
P4 criar página/UX/retomada/observabilidade.
P5 concorrência/regressão/documentação/feature flag.

Rota/menu ocultos até motor individual verde, PostgreSQL real provar atomicidade/SINGLE_CHECK, Auditoria/reconciliação obrigatórias e recovery de timeout. Ativar por feature flag em Filial controlada. Nunca fallback para loop item a item.

FORA DO ESCOPO E PROIBIDO

Não alterar Delphi; não reespecificar Quitação ou Autorização de Pagamento além dos seams compartilhados; não estornar outros domínios; não criar motor paralelo; não usar commit por item; não ampliar seleção implicitamente; não usar heurística textual/valor; não reabrir conciliação; não corrigir dados silenciosamente; não confiar fatos financeiros do browser; não esperar Usuário dentro de TX; não aceitar sucesso parcial.

SAÍDA ESPERADA

Produza spec autocontida pronta para /speckit.clarify e /speckit.plan, sem decisão financeira aberta. Inclua jornadas/casos/falhas priorizados; requisitos numerados; estados/entidades/invariantes; contratos HTTP/Application; abilities/proof/Filiais/Auditoria; banco/Contabilidade/tributos/residual/desconto; concorrência/locks/idempotência/reconciliação; UX/acessibilidade; critérios mensuráveis; matriz de testes; matriz preservar/corrigir/criar/remover; fases/gates; documentação de usuário/suporte/operação/arquitetura; arquivos atuais a preservar/corrigir e novos realmente necessários.
```
