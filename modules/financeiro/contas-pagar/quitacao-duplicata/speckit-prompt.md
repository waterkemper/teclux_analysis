# Prompt Spec Kit — Imutabilidade pós-pagamento e Estorno da Duplicata

```text
CONTEXTO E MISSÃO

Trabalhe no Laravel atual de Documentos a Pagar. Antes de especificar ou alterar qualquer coisa, inspecione novamente o código Laravel vigente e confronte-o com:

- modules/financeiro/contas-pagar/quitacao-duplicata/dossie.md
- CONTEXT.md
- delphi/apps/contaspagar/dmcontaspagar.pas e .dfm
- delphi/apps/contaspagar/fmcontaspagar.pas e .dfm
- delphi/apps/contaspagar/fmcadastroduplicatascontaspagar.pas e .dfm
- delphi/apps/contaspagar/dmquitacaoduplicatas.pas
- delphi/apps/contaspagar/dmcancelamentoquitacao.pas
- laravel/docs/adr/0246-documentos-pagar-financial-commands.md
- laravel/docs/adr/0247-duplicata-paga-imutavel-estorno-unico.md

Esta é uma emenda da feature já existente na branch `246-documentos-pagar-parity`. NÃO execute `/speckit.specify`, NÃO crie outra branch e NÃO crie outro diretório em `specs/`. Atualize diretamente os artefatos existentes em `specs/246-documentos-pagar-parity/` e continue o trabalho na branch atual.

Não recrie o módulo nem proponha arquitetura paralela. Preserve e aprofunde commands, requests, controller, policies, services, repositories, Writer origem P, Filiais, Sensitive Operation, parâmetros_valor, revisão, idempotência, transação, Auditoria e reconciliador já existentes.

REGRA INEGOCIÁVEL

Após a Quitação, a Duplicata está PAID e é imutável. A única operação permitida é Estorno do Pagamento, que executa PAID -> AUTHORIZED e desfaz integral e atomicamente a Quitação. Não existe operação de reconstrução/refação do pagamento, inclusive para administrador ou suporte.

Use “Estorno do Pagamento” como termo canônico. “Cancelamento da Quitação” é nome legado; “Exclusão” significa remoção cadastral.

BASELINE A CORRIGIR, NÃO DUPLICAR

O Laravel já possui CancelDuplicataPaymentCommand, RebuildDuplicataPaymentCommand, FormRequests, rotas/controller, FinancialRevision, IdempotencyGuard, locks, Writer bancário, AccountingAdapter, reconciliador, UI e testes. Trate-os como baseline:

- renomeie/aprofunde Cancel para Estorno;
- elimine Rebuild ponta a ponta, sem alias, feature flag ou rota administrativa;
- não mantenha dois commands equivalentes;
- preserve as boas fronteiras já existentes.

SUPERFÍCIE ALVO

- ReverseDuplicataPaymentCommand
- ReverseDuplicataPaymentRequest
- DocumentoPagPolicy::reversePayment
- canReversePayment / prop can.reversePayment
- DocumentosPagarController::estornarPagamentoDuplicata
- POST /cadastros/contas-pagar/documentos-pagar/duplicatas/estornar-pagamento
- route contas_pagar.documentos_pagar.duplicatas.estornar_pagamento
- Sensitive Operation estornar_pagamento_duplicata
- Auditoria contas_pagar.duplicata.estornar_pagamento

Payload: documentopag, datavencto, numero, expected_revision, idempotency_key, prova_autorizacao e origem opcional. Não aceite force, ignore_missing, lista de movimentos, cancelar_todos nem fatos financeiros fornecidos pelo browser.

IMUTABILIDADE

Crie/centralize guard de domínio server-side para PAID e aplique-o a update cadastral, geração/substituição, autorização, pagamento, exclusão e adapters. Somente o Estorno atravessa PAID.

Na UI, PAID desabilita Alterar, duplo clique, Excluir, Pagar, edição inline de complemento/observação e qualquer geração que substitua a linha. Exiba apenas Estornar pagamento quando can.reversePayment. Ctrl+P pode pagar aberta e estornar paga, mas deve existir ação visível.

Bloqueie alterações do Documento que mudem identidade ou significado econômico da paga. Permita manutenção independente de outras Duplicatas abertas somente se o agregado reconciliar.

QUITAÇÃO PROSPECTIVA

Corrija Pay para persistir na mesma transação o vínculo bancário exato retornado pelo Writer: conta, data, sequencia, Evento e sequenciaevento, além de payment_id/manifesto e fotografia necessária para reverter parcial/residual.

movtosbancos.documento recebe duplicatas.chequepagto; sem cheque fica vazio. Nunca grave documentopag nesse campo.

Histórico individual: [NF|DOC][ complemento] DUP {documentopag}/{numero} - {Parte Fornecedora}. Assert obrigatório: DOC DUP 209120/1 - ANDRA UNIFORMES. Cabeçalho agregado: PAGTO DIVERSAS DUPLICATAS e Evento nulo.

CONTRATO DO ESTORNO

Dentro de uma única DB::transaction:

1. reserve idempotência de forma crash-safe;
2. trave Documento, Duplicata e efeitos relacionados;
3. valide ability, Filiais, PAID, expected_revision, proof e bloqueadores;
4. capture e valide todo o manifesto/vínculo antes de limpar campos;
5. reverta bancos, Contabilidade, impostos, lote e parcial/residual;
6. limpe os fatos da Quitação;
7. grave Auditoria e nova revisão;
8. reconcilie tudo e somente então faça commit.

Limpe datapagto, valorpagto, filialpagto, tipopagamento, contapagto, chequepagto, contacredito, evento, sequencia, sequenciaevento, nrlotecontabil, datapagtoaux, contapagtoaux, chequepagtoaux e Usuário de pagamento quando esse for o significado de usuario.

Preserve identidade, dados originais não transformados, complemento, observação, banco de cobrança e a Autorização de Pagamento original. Resultado: autorizado=true, com Autorizador/evidência original preservados. Audite separadamente a prova do Estorno.

BANCOS

Localize cabeçalho por conta+datapagto+sequencia e evento por conta+datapagto+sequencia+evento+sequenciaevento, origem P.

- exclusivo: exclua eventos e cabeçalho;
- agregado: exclua somente o evento exato e recalcule pelos restantes;
- zero restante: exclua cabeçalho;
- um restante: restaure documento/observação/Evento individuais;
- vários: mantenha representação agregada.

Não escolha primeiro/último evento, não procure apenas por valor e não use somente subtração aritmética.

FALHA SEGURA E HISTÓRICO

Vínculo obrigatório ausente, incompleto, ambíguo, divergente, de origem diferente ou reivindicado por outro pagamento retorna 409 e rollback. Nunca limpe a Duplicata antes de provar a reversão.

Faça preflight somente leitura dos históricos: vínculo exato, ausência legítima, ausente, ambíguo/divergente, parcial sem fotografia e bloqueio tributário/contábil. Apenas exatos ou comprovadamente sem efeito bancário ficam elegíveis. Os demais permanecem PAID e bloqueados para reconciliação manual.

Não faça backfill heurístico em migration, não apague movimentos no deploy e não transforme reconciliação em ação da Duplicata.

CONTABILIDADE, IMPOSTOS E LOTE

Se Contabilidade estava ativa, reverta/recomponha exatamente seus lançamentos; adapter indisponível bloqueia. Imposto derivado já pago bloqueia. Reverta/sincronize demais impostos e vínculos de lote na mesma transação. Falha em qualquer efeito ou na Auditoria causa rollback.

CONCORRÊNCIA, IDEMPOTÊNCIA E AUDITORIA

Revisão divergente retorna 409 antes dos efeitos. Mesma origem+ação+chave+hash retorna replay; mesma chave/payload diferente conflita; nova chave após Estorno retorna 409 porque não está paga.

Auditoria persistente registra before/after, campos, vínculos/valores, Operador, Autorizador, Filiais, revisão, origem, request id, idempotency key e instante. Nunca persista senha/proof bruto. Log::info não substitui Auditoria.

PARÂMETROS

Use ParameterService/parametros_valor com os textos exatos já mapeados: AUTORIZACAO PAGTO AUTOMATICA, DATA CONTABIL, GERARCONTABILIDADE, EXERCICIOCONTABILIDADE, Início Integração Bancos e Histórico padrão pagto duplicata. Preserve os adicionais tributários existentes; não crie aliases.

REMOÇÕES OBRIGATÓRIAS

Remova RebuildDuplicataPaymentCommand, RebuildDuplicataPaymentRequest, rota/método/injeções, forceRebuildPayment, canForceRebuildPayment, prop UI, ação sensível refazer_pagamento_duplicata, documentação ativa e testes que afirmem essa capacidade. Atualize specs/246 e registre a supersessão parcial da ADR-0246 pela ADR-0247.

TESTES OBRIGATÓRIOS

Exija Unit, Feature, React e PostgreSQL real para:

- guard de PAID em todas as mutações;
- ability, Filiais e proof;
- campos limpos e resultado AUTHORIZED;
- exclusivo, agregado múltiplo, transição para um/zero evento;
- dois eventos com mesmo Evento e sequenciaevento diferentes;
- Adiantamento, integração inativa e desconto integral;
- histórico ausente/ambíguo/divergente com rollback total;
- Contabilidade, impostos, lote e restauração parcial/residual;
- OCC, duas requisições concorrentes e todas as regras de idempotência;
- Auditoria persistida uma vez;
- UI por estado/ability e mensagem de reconciliação;
- ausência de qualquer superfície ativa de reconstrução privilegiada.

Converta DocumentosPagarCancelRebuildPostgresTest de placeholder skipped em fixtures executáveis orientadas ao Estorno. Não aceite mocks como única prova dos efeitos bancários.

FASES/GATES

P0 caracterizar código/schema atual e criar testes de falha; P1 corrigir Pay prospectivo e vínculo exato; P2 implantar guard e Estorno fail-safe; P3 completar bancos/Contabilidade/impostos/lote/Auditoria; P4 preflight histórico e bloqueios; P5 remover superfície antiga e concluir UI/docs/observabilidade.

Pay não pode confirmar PAID quando efeito exigido estiver ausente. Estorno não pode confirmar sucesso quando qualquer efeito não tiver sido revertido/reconciliado.

SAÍDA

Antes de implementar, emende `specs/246-documentos-pagar-parity/spec.md` para substituir todas as regras conflitantes de Cancel/Refazer pelo contrato de imutabilidade e Estorno. Depois sincronize `plan.md`, `tasks.md`, `data-model.md`, `research.md` e `contracts/` somente onde forem afetados.

Preserve requisitos, decisões e tarefas já válidos. Não renumere nem marque novamente tarefas concluídas sem necessidade; registre tarefas delta para renomear Cancel para Estorno, remover Refazer, completar os vínculos/efeitos, proteger PAID, tratar históricos e criar os testes obrigatórios. Se uma tarefa concluída passou a estar incorreta, reabra-a explicitamente ou crie uma tarefa corretiva rastreável.

Não use `/speckit.specify`. Use `/speckit.plan` apenas se for necessário regenerar ou reconciliar o plano técnico após a emenda; caso `plan.md` e `tasks.md` já estejam em uso, atualize-os incrementalmente e prossiga pelas tarefas delta.

A spec 246 atualizada deve conter requisitos numerados, jornadas e falhas, estados, contratos HTTP/aplicação, arquivos existentes a alterar/remover, somente novos arquivos indispensáveis, fases/gates, migração/preflight e matriz de testes mensurável.

Inclua matriz “já implementado / incompleto / remover / preservar”. Não deixe investigação do Delphi, decisão financeira ou possibilidade de reconstrução privilegiada em aberto.
```
