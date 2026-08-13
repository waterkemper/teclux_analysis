# Prompt para /speckit.specify — Concorrência, idempotência e numeração

```text
/speckit.specify

Crie uma especificação corretiva P0 para tornar as mutações do Cadastro de Pedidos de Compra seguras sob concorrência entre Laravel, Delphi, retries HTTP e múltiplas sessões. Gere a spec; não implemente nesta etapa.

REVALIDAÇÃO OBRIGATÓRIA

Leia antes de especificar:
- modules/estoque/cadastro-pedidos/auditoria-matriz-requisitos-prompts.md
- modules/estoque/cadastro-pedidos/auditoria-implementacao-laravel-atual.md
- modules/estoque/cadastro-pedidos/auditoria-delphi-paridade-nao-coberta.md
- modules/estoque/cadastro-pedidos/06-speckit-prompt.md
- modules/estoque/cadastro-pedidos/07-speckit-prompt.md
- modules/estoque/cadastro-pedidos/08-speckit-prompt.md
- implementação atual em laravel/backend de inclusão/gravação/exclusão, itens, previsões, grade, reordenação, allocator e financeiro.

Reconfirme classes, schema, sequence, transações e testes atuais. Caminhos citados nas auditorias são baseline, não autorização para duplicar componentes.

PROBLEMA CONFIRMADO

As mutações usam transações, mas não há prova de revisão esperada ou locks do agregado. updateOrInsert/replaceAll/delete+insert permitem lost update. A renumeração de itens não bloqueia o conjunto. O allocator cai de sequence para MAX(numero)+1, inseguro. Retries/duplo clique podem repetir Inclusão ou efeitos.

CONTRATO CENTRAL

Toda mutação recebe:
- identidade do Pedido, quando existente;
- expected_revision opaca obtida na última leitura;
- idempotency_key e hash normalizado da intenção;
- OperatorContext/Filial autorizada.

A revisão precisa detectar alterações feitas por Laravel e Delphi. Derive-a deterministicamente dos fatos persistidos relevantes do Pedido (cabeçalho, itens/ordem/situações, previsões e referências financeiras que governam a mutação). Se houver log legado confiável, ele pode compor o token. É proibida coluna/revisão controlada só pelo Laravel que ignore alterações Delphi.

No comando:
1. reserve idempotência durável;
2. abra uma única transação PostgreSQL;
3. bloqueie Pedido e dependências afetadas em ordem canônica;
4. releia os fatos e recalcule revision;
5. compare expected_revision antes do primeiro write;
6. execute a mutação uma vez;
7. reconcilie o estado final, conclua idempotência e commit.

Mesma chave+mesmo hash retorna replay do resultado. Mesma chave+conteúdo diferente retorna conflito. pending deve possuir lease/ownership recuperável. Nunca reenvie automaticamente uma mutação ambígua.

LOCKS E ESCOPO

Defina ordem determinística para cabeçalho, itens, previsões, staging/grade, ordem dos itens e referências financeiras. Não espere interação humana mantendo locks. Conflito de revisão produz zero efeitos e orienta recarregar o Pedido.

NUMERAÇÃO

Elimine completamente MAX(numero)+1. A sequence PostgreSQL é a única autoridade para novo número de Pedido. Se ausente, sem permissão ou indisponível, falhe a Inclusão com rollback; não improvise número, não faça retry com MAX e não reutilize número reservado ambiguamente.

ERROS

Envelope: code, message, field_errors, correlation_id, retryable e current_revision quando autorizado.
- ORDER_REVISION_CONFLICT: “O pedido foi alterado por outra sessão. Recarregue para continuar.”
- ORDER_IDEMPOTENCY_MISMATCH
- ORDER_OPERATION_PENDING
- ORDER_NUMBER_SEQUENCE_UNAVAILABLE

Não exponha SQL, lock details ou payload sensível.

PRESERVAR/CORRIGIR/CRIAR/REMOVER

Preserve serviços focados, transações, sequence existente e autorização modular. Corrija contratos de requests/services/repositories para revisão/idempotência/locks. Crie store/envelope de idempotência somente se não houver seam compartilhado adequado. Remova fallback MAX+1 e last-write-wins silencioso. Não crie outro agregado de Pedido.

TESTES OBRIGATÓRIOS

PostgreSQL real, sem skip/incomplete:
- duas gravações concorrentes do mesmo Pedido;
- editar/excluir o mesmo item;
- substituir previsões enquanto outra sessão grava;
- reordenar simultaneamente;
- grade versus item individual;
- mesma chave replay e mismatch;
- pending recovery após falha;
- mudança feita diretamente como Delphi entre leitura e confirmação;
- sequence concorrente produz números únicos;
- sequence indisponível falha sem Pedido parcial;
- ordem de locks evita deadlock ou trata retry controlado sem duplicar efeito.

Execute regressão de Cadastro de Pedidos. Nenhum teste crítico pode usar SQLite como prova única ou pular por falta de stub.

SAÍDA ESPERADA

Spec pronta para clarify/plan com jornadas, requisitos numerados, revisão/fingerprint, idempotência, lock order, estados/erros, contratos HTTP/Application, matriz de testes PostgreSQL, migração compatível com convivência Delphi, rollout e lista mínima de arquivos após revalidar o checkout.

FORA DE ESCOPO

Não alterar Delphi; reespecificar regras fiscais/financeiras; criar event sourcing; criar revisão invisível ao Delphi; MAX+1; lock durante interação; sucesso parcial; implementar agora.
```
