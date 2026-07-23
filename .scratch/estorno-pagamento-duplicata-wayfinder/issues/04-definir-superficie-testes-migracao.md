# Definir a superfície Laravel e os testes da regra pós-pagamento

Type: task
Status: resolved
Blocked by: 03

## Answer

### Superfície canônica a preservar e renomear

- Preservar a separação entre rascunho cadastral e comandos financeiros, `DB::transaction`, locks, `ContasPagarFinancialRevision`, `ContasPagarIdempotencyGuard`, acesso por Filiais, prova sensível, repositories, Writer bancário origem `P`, adapter contábil, sincronização tributária e reconciliador.
- Substituir `CancelDuplicataPaymentCommand` por `ReverseDuplicataPaymentCommand`, `CancelDuplicataPaymentRequest` por `ReverseDuplicataPaymentRequest`, controller `cancelarPagamentoDuplicata` por `estornarPagamentoDuplicata` e log/auditoria `cancelar_pagamento` por `estornar_pagamento`.
- A rota canônica será `POST /cadastros/contas-pagar/documentos-pagar/duplicatas/estornar-pagamento`, nome `contas_pagar.documentos_pagar.duplicatas.estornar_pagamento`.
- O payload permanece pequeno: `documentopag`, `datavencto`, `numero`, `expected_revision`, `idempotency_key`, `prova_autorizacao` e `origem` opcional. Não aceitar campos de pagamento, lista de movimentos nem flags como `force`, `ignore_missing` ou `cancelar_todos` vindos do cliente.
- Renomear ability `cancelPayment` para `reversePayment`; ela continua exigindo acesso ao módulo e perfil legado de pagamento. Renomear a ação sensível para `estornar_pagamento_duplicata`, sem parâmetro habilitador e com perfil legado `pagamento`.
- Respostas: sucesso contém `replayed`, nova `revision`, Duplicata/Documento atualizados e resumo verificável dos efeitos; `403` para Permissão/Filial; `409` para estado, revisão, concorrência ou vínculo histórico inconsistente; validação de forma/prova segue o padrão Laravel atual. Mensagens ao Usuário devem usar **Estorno do Pagamento**, nunca Exclusão/Refazer/Cancelamento como sinônimos.

### Remoção definitiva de Refazer

- Excluir `RebuildDuplicataPaymentCommand`, `RebuildDuplicataPaymentRequest`, método/injeções/imports do controller, rota `refazer-pagamento`, ability `forceRebuildPayment`, métodos `canForceRebuildPayment`, props/type Inertia, configuração `refazer_pagamento_duplicata`, documentação de suporte e testes dedicados à permissão de Refazer.
- Remover também referências normativas em `specs/246-documentos-pagar-parity` e superseder a cláusula correspondente da ADR-0246. Histórico de specs pode registrar que a decisão foi revogada, mas nenhum contrato ativo pode instruir implementação ou uso de Refazer.
- Não manter alias HTTP, feature flag, endpoint oculto, chamada administrativa ou compatibilidade temporária para Refazer. Reparação/reconciliação de dados é operação operacional separada, não uma mutação disponível sobre a Duplicata paga.

### Imutabilidade no backend

- Centralizar um guard de domínio reutilizável para impedir qualquer mutação genérica de Duplicata `PAID`. Aplicá-lo ao update do Documento/rascunho, geração/substituição de parcelas, autorização, pagamento, exclusão e adapters de lote/retorno; somente `ReverseDuplicataPaymentCommand` atravessa a transição.
- `UpdateDocumentoPagDraft` deve tratar linhas pagas como fotografia protegida do servidor, sem aceitar sobreposição do payload. A Request pode omiti-las ou enviá-las apenas como identidade/revisão, mas qualquer diferença de conteúdo deve falhar; nunca reconstituí-las com campos financeiros nulos.
- Quando houver Duplicata paga, bloquear no Documento campos cuja alteração mude seu significado econômico ou vínculo — fornecedor, Filial, valor, Evento e demais campos usados na Quitação/reconciliação — e bloquear Exclusão/geração global que toque a paga. Alterações independentes sobre outras Duplicatas abertas só permanecem se o agregado continuar reconciliado.
- `PayDuplicataCommand` deve persistir, na própria transação da Quitação, o vínculo bancário exato retornado pelo Writer: conta/data/`sequencia`/Evento/`sequenciaevento`, além da fotografia necessária para reverter pagamento parcial. Uma Quitação nova não pode produzir `PAID` sem essas evidências quando o efeito é obrigatório.

### UI e interação

- Na linha `PAID`, desabilitar **Alterar**, duplo clique de edição, **Excluir**, **Pagar**, edição inline de complemento/observação e qualquer gerador que substitua a linha. Exibir somente ação visível **Estornar pagamento** quando `can.reversePayment`; sem ability, mostrar a linha somente para consulta.
- A ação visível abre confirmação clara dos efeitos e depois o fluxo de autorização sensível. O atalho `Ctrl+P` pode ser preservado: em aberta chama Pagar; em paga chama Estornar, respeitando `can.reversePayment`. Não depender apenas do atalho.
- Durante execução, bloquear repetição; em sucesso recarregar estado/revisão após commit; em `409`, manter a tela sem alteração, apresentar o motivo e orientar recarregar ou encaminhar para reconciliação manual.
- Registros históricos bloqueados mostram **Estorno indisponível: vínculo do pagamento requer reconciliação**, sem oferecer Refazer ou edição como saída alternativa.

### Auditoria e observabilidade

- Usar a infraestrutura de Auditoria existente, acrescentando evento de domínio `contas_pagar.duplicata.estornar_pagamento` com before/after, efeitos e identidades definidos no contrato. `Log::info` é telemetria complementar, não substitui Auditoria persistente.
- Métricas/logs técnicos devem distinguir sucesso, replay, conflito de revisão, vínculo ausente, vínculo ambíguo, bloqueio tributário, bloqueio contábil e rollback, sempre com request id e sem segredo da prova.

### Compatibilidade e implantação

1. Fazer preflight somente leitura sobre Duplicatas pagas e classificá-las: vínculo exato; ausência legitimamente esperada; vínculo ausente; ambíguo/divergente; pagamento parcial sem fotografia; bloqueio tributário/contábil. Gerar relatório de reconciliação, sem alterar dados.
2. Confirmar o shape PostgreSQL real conforme a política fail-fast. Reutilizar `sequenciaevento` e campos legados existentes; qualquer armazenamento novo para fotografia/Auditoria exige migração explícita, nunca coluna presumida ou fallback silencioso.
3. Primeiro tornar novas Quitações completas: Writer retorna e `PayDuplicataCommand` persiste o vínculo exato e a fotografia reversível na mesma transação.
4. Implantar guard de imutabilidade e Estorno novo. Registros históricos classificados como exatos/legitimamente sem banco ficam elegíveis; os demais permanecem pagos, legíveis e bloqueados até reconciliação manual.
5. Remover Cancel antigo e Refazer no mesmo cutover de backend/UI/documentação. Não executar backfill heurístico e não apagar movimentos órfãos durante deploy.

### Suíte mínima obrigatória

- **Contrato/arquitetura:** rota, Request, ability, ação sensível e nomes novos presentes; nenhuma rota/classe/ability/config/UI ativa de Refazer; ADR/documentação sem instrução conflitante.
- **Imutabilidade:** para `PAID`, update genérico, alteração/dialog/inline, exclusão, autorização, novo pagamento e geração retornam bloqueio e deixam banco inalterado; outras abertas continuam mantíveis quando independentes.
- **Autorização:** módulo/perfil, Filiais do Documento/Pagamento, prova ausente/inválida/consumida, administrador sem perfil e exposição correta de `can.reversePayment`.
- **Estado/campos:** Estorno limpa toda a lista contratada, restaura fotografia parcial e termina `AUTHORIZED` preservando Autorizador/evidência original.
- **Banco PostgreSQL real:** movimento exclusivo; agregado permanecendo múltiplo; transição para um evento; remoção do último; mesma combinação de Evento com `sequenciaevento` diferentes; adiantamento; integração legitimamente inativa; valor zero com desconto total.
- **Falha segura:** vínculo obrigatório ausente, ambíguo, origem não `P`, valor divergente ou evento de outra Duplicata retorna `409` e comprova rollback da Duplicata, banco, impostos, Contabilidade e Auditoria.
- **Contabilidade/impostos/lote:** adapter desligado, ativo e indisponível, reversão implementada, imposto vinculado já pago, recomposição de lote individual e conjunto explícito.
- **OCC/idempotência:** revisão obsoleta, duas requisições concorrentes, replay de mesma chave/hash, chave reutilizada com payload diferente e nova chave após Estorno.
- **Auditoria:** before/after, Operador, Autorizador, Filiais, vínculos/valores, request/idempotency registrados uma vez; segredo não persistido; replay não duplica evento de domínio.
- **UI:** testes React para botões/campos/duplo clique/atalho por situação e ability, busy state, sucesso, `403`, `409` e mensagem de reconciliação.
- O placeholder atualmente ignorado em `DocumentosPagarCancelRebuildPostgresTest` deve ser substituído por testes PostgreSQL executáveis; efeitos bancários agregados não podem permanecer cobertos apenas por mocks ou `markTestSkipped` permanente.

## Question

Quais rotas, commands, abilities, controles de UI, payloads, mensagens, logs e testes devem ser preservados, renomeados ou removidos para que Estorno seja a única operação pós-pagamento, incluindo a retirada completa de Refazer e a compatibilidade de registros históricos?
