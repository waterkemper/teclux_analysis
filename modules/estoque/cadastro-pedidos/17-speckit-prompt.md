# Prompt para /speckit.specify — Motores fiscal e de custo autoritativos

```text
/speckit.specify

Crie uma especificação corretiva P0 para tornar os motores fiscal e de custo obrigatórios, autoritativos e reconciliados na gravação do Cadastro de Pedidos. Depende integralmente da spec 16. Gere a spec; não implemente.

LEITURAS OBRIGATÓRIAS

- modules/estoque/cadastro-pedidos/16-speckit-prompt.md
- modules/estoque/cadastro-pedidos/01 a 05-speckit-prompt.md
- modules/estoque/cadastro-pedidos/06, 07 e 15-speckit-prompt.md
- as três auditorias `auditoria-*.md` desta pasta
- código/testes atuais de GravarPedidoCompraService, PedidoCompraMotoresSyncService, gravação/recalculo de item, MotorCusto e MotorImpostos.

Revalide o checkout. Não duplique fórmulas ou motores já implementados.

PROBLEMA

O domínio possui fórmulas e testes amplos, mas a gravação chama o sincronizador com strict:false, captura Throwable, registra warning e continua. Também não há prova de que resultados retornados são persistidos e reconciliados no caminho de gravação do cabeçalho. Isso permite Pedido, itens e financeiro confirmados com cálculo ausente/desatualizado.

REGRA CENTRAL

Uma gravação que exige cálculo fiscal/custo só conclui se:
1. inputs forem fotografados após locks/revisão da spec 16;
2. motor fiscal executar na ordem já definida pelas specs 02–05;
3. motor de custo executar consumindo o resultado fiscal conforme spec 01;
4. resultados forem persistidos nos itens/cabeçalho na mesma transação;
5. totais, flags manuais, pares oficial/custo, custos/preços e efeitos de propagação forem reconciliados;
6. o estado persistido corresponder exatamente ao resultado calculado antes do commit.

Falha, resultado incompleto, schema incompatível ou divergência de reconciliação causam rollback integral. Não criar Pedido “pendente fiscal/custo”, não manter valor mercadoria como fallback e não despachar financeiro/e-mail/relatório antes do sucesso.

PRESERVAR

Preserve MotorCustoService, MotorImpostosOrchestrator, fórmulas/DTOs/repositórios existentes, ordem das fases, flags digitadas, diferenças oficial/custo, regras de composto/rateio e todas as exclusões já fechadas (DIFAL, saída, Serviços/ISS). Frontend não calcula imposto.

CORRIGIR

- remover strict:false/fallback silencioso dos caminhos válidos;
- tornar contrato do sincronizador explícito e tipado;
- aplicar resultado uma vez na transação da mutação;
- reconciliar inputs/resultados/estado final;
- não disparar propagação de preço de modo duplicado em retry;
- manter idempotência/revisão/locks da spec 16.

ERROS

- ORDER_TAX_ENGINE_FAILED
- ORDER_COST_ENGINE_FAILED
- ORDER_ENGINE_RESULT_INCOMPLETE
- ORDER_ENGINE_RECONCILIATION_FAILED

Cada erro tem mensagem acionável e correlation_id; log estruturado registra fase, Pedido/Filial autorizados, engine/version e causa sanitizada. Nunca exponha SQL nem retorne sucesso parcial.

TESTES

PostgreSQL real e não pulável:
- falha fiscal no primeiro/no enésimo item reverte Pedido, itens, previsões e financeiro;
- falha de custo após fiscal reverte tudo;
- resultado fiscal/custo persiste integralmente;
- flags manuais impedem sobrescrita;
- rateio/composto e arredondamento reconciliam;
- propagação/autocadastro de preço ocorre uma vez sob replay;
- alteração concorrente detectada pela spec 16;
- schema/campo ausente falha explicitamente;
- reabrir/gravar sem mudança produz resultado estável.

Regressão obrigatória: motores 01–05, Cadastro de Pedidos e Contas a Pagar. Não aceitar mock como prova única nem teste crítico skip/incomplete.

ROLLOUT

Este gate P0 precede a spec 18 e bloqueia ampliação do uso. Inclua métricas/alertas de falha por motor e plano de rollback que não reative fallback permissivo.

SAÍDA ESPERADA

Spec autocontida com Application contract, sequência transacional, DTOs/resultados, invariantes/reconciliação, erros, observabilidade, testes, migração compatível, matriz preservar/corrigir/criar/remover e arquivos mínimos revalidados.

FORA DE ESCOPO

Novas fórmulas; pendência fiscal; cálculo React; mudar Delphi; reabrir specs 01–05; implementar nesta etapa.
```
