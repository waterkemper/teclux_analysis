# Decidir cancelamento, concorrência e auditoria na Consulta

Type: grilling
Status: resolved
Blocked by: 02, 03, 04

## Question

Como Cancelar F6 e eventual alteração de quantidade devem consumir o núcleo compartilhado, a Revisão da Requisição, `pedidosfiliais_log_new`, parâmetros de motivo/estoque e alertas de Reserva Prévia, preservando convivência Delphi–Laravel e evitando outra autoridade transacional?

## Answer

### Cancelamento F6

Cancelar é exclusão lógica e só pode atingir requisição aberta (`A`). A Consulta envia identidade, requisitante, produto, revisão esperada, confirmação e motivo/texto conforme `Informar o motivo do cancelamento do pedido`. O núcleo relê a linha, valida a situação e aplica a mutação em transação.

A liberação usa a `qtdepedida` integral. `qtderecebida` é limpa como consequência do cancelamento, mas não reduz a quantidade liberada nem bloqueia o cancelamento por recebimento parcial. Quando `REQUISICAOSUBTRAIESTOQUE` está ativo, a Reserva Prévia disponível é movimentada; havendo Venda Futura, ela tem prioridade para ocupar o Estoque Reservado. Se a reserva disponível for menor que o esperado, o núcleo movimenta o disponível, mantém o futuro prioritário e devolve o alerta estruturado `reserva_previa_divergente` para a tela orientar conferência.

A Consulta não executa SQL de estoque nem cria TPE/TFR diretamente: delega `CancelarRequisicaoFiliaisCommand`/`RequisicaoFiliaisCommandService`, preservando locks, rollback, parâmetros e movimentos compartilhados.

### Alteração de quantidade

A edição direta da grade usa adapter restrito a identidade, revisão esperada e nova `qtdepedida`. O adapter delega `AlterarRequisicaoFiliaisCommand`; não aceita troca de produto, requisitante, requisitada ou `qtderecebida`. O núcleo aplica a mesma política de estoque, Reserva Prévia, Venda Futura e alertas e devolve a linha recarregada/revisão nova.

### Concorrência Delphi–Laravel

Toda alteração/cancelamento:

1. relê `pedidosfiliais` com `FOR UPDATE`;
2. verifica que permanece aberta;
3. compara a revisão enviada com a revisão corrente (`max(id)` da auditoria);
4. bloqueia estoques necessários em ordem determinística;
5. executa pedidos/movimentos na mesma transação;
6. retorna revisão nova e alertas.

Se Delphi, outro usuário Laravel ou outro fluxo já tiver alterado a requisição, a revisão diverge e a API retorna conflito `409`, sem sobrescrever a alteração concorrente. A UI exige recarga explícita da linha para tentar novamente.

### Auditoria

A Consulta reutiliza `DatabaseAuditContext` dentro da transação, informando usuário autenticado, filial ativa, origem web e `X-Request-Id`. Ela **não grava diretamente** em `pedidosfiliais_log_new` e não cria log paralelo. O trigger PostgreSQL `pedidosfiliais_audit_log_trg` escreve automaticamente INSERT/UPDATE/diff nessa tabela e distingue contexto Laravel de alterações Delphi/SQL direto. O repositório de revisão consulta o `max(id)` produzido pelo trigger.

Essa estratégia mantém uma única autoridade transacional: o núcleo compartilhado. A Consulta fornece apenas filtros, seleção e adapters HTTP; Cadastro, Consulta de Compras e Delphi continuam interoperando por locks, revisão e o mesmo trigger.
