# Prompt para /speckit.specify — quantidade e cancelamento

```text
/speckit.specify

Crie uma especificação funcional e técnica detalhada para integrar à **Consulta de Requisições para Exposição** as duas únicas mutações permitidas: alterar `qtdepedida` e cancelar uma requisição aberta. Esta é a terceira de quatro fatias e consome a autorização da spec 01, o contrato de linha da spec 02 e o núcleo compartilhado `RequisicaoFiliais` já existente.

Não implemente nesta etapa. Inspecione o checkout Laravel atual, especialmente `RequisicaoFiliaisCommandService`, commands, revisão, auditoria, services do Cadastro e seus componentes React. Não investigue Delphi; este prompt é autoritativo. Não copie SQL de movimentos para a Consulta.

## Limite arquitetural

A Consulta fornece adapters HTTP estreitos; o núcleo continua autoridade exclusiva para requisição, estoque, Reserva Prévia, Venda Futura, TEP/TPE/TFR, locks, transação, revisão e alertas.

Reutilize ou extraia componentes pequenos atuais:

- `RequisicaoExposicaoCancelarDialog`;
- `RequisicaoExposicaoRevisaoConflitoDialog`;
- `RequisicaoExposicaoReservaPreviaAlert`;
- feedback/hook de mutações e atalhos quando o contrato permitir.

Não faça a Consulta depender do estado completo de `Cadastro.tsx`.

## Alteração de quantidade — F5

- Só situação A é mutável.
- Payload permitido: identidade da requisição, produto necessário à validação, revisão esperada e nova `qtdepedida`.
- Quantidade é inteira e maior que zero.
- Rejeitar/nunca aplicar produto novo, requisitante/requisitada novas, observação ou `qtderecebida`.
- Adapter revalida capability, filial ativa, requisitante autorizada e identidade persistida; configura `DatabaseAuditContext`; delega `AlterarRequisicaoFiliaisCommand`.
- Núcleo relê com lock, compara revisão, resolve parâmetros, aplica delta e retorna resultado/alertas.
- Após sucesso, recarregar a linha com revisão e saldos novos sem perder filtros, página ou seleção.

## Cancelamento — F6

- Exclusão lógica somente de A, com confirmação explícita e revisão esperada.
- `Informar o motivo do cancelamento do pedido` é resolvido novamente pela filial ativa: verdadeiro exige motivo; falso torna-o opcional. Motivo informado deve ser válido conforme o serviço atual.
- Cancelamento libera a `qtdepedida` integral mesmo quando `qtderecebida > 0`; o núcleo limpa recebida e grava C.
- Com `REQUISICAOSUBTRAIESTOQUE`, o núcleo libera somente a Reserva Prévia disponível. Venda Futura tem prioridade para Estoque Reservado; restante volta a estoque.
- Reserva insuficiente não invalida cancelamento: retornar `reserva_previa_divergente` com esperado, movimentado e diferença.
- A Consulta não cria TPE/TFR nem escreve em `pedidosfiliais_log_new`.

## Concorrência e auditoria

Toda mutação:

1. relê `pedidosfiliais` com `FOR UPDATE`;
2. valida situação A e revisão corrente;
3. bloqueia estoques em ordem determinística;
4. executa requisição e movimentos na mesma transação;
5. usa `DatabaseAuditContext` com usuário, filial ativa, origem web e `X-Request-Id`;
6. deixa o trigger `pedidosfiliais_audit_log_trg` gravar o log;
7. retorna revisão nova.

Alteração simulada pelo Delphi ou outra sessão invalida a revisão. Responder `409`, sem efeitos, com revisão atual; a UI oferece recarga explícita. Não fazer merge automático.

## Interação

- F5 habilita apenas quando a linha A possui edição válida; F6 apenas para linha A.
- Filtros/Gerar ficam protegidos contra perda acidental durante edição pendente.
- Modal aberto, carregamento ou foco incompatível bloqueiam atalhos.
- Erro 422 mantém o valor editado; 409 mostra diálogo; sucesso substitui a linha; alerta permanece até o usuário dispensar.
- Botões visíveis continuam o caminho principal.

## Contratos HTTP

Defina rotas, Form Requests, responses e códigos para: sucesso, 422, 403, 404, situação não aberta, estoque insuficiente, motivo inválido e conflito 409. Não reutilize o endpoint amplo de alteração do Cadastro se ele aceitar campos além do contrato desta Consulta; crie fachada própria delegando ao mesmo núcleo.

## Critérios de aceite

- [ ] Apenas Pedida de A pode ser alterada; payload amplo não muda outros campos.
- [ ] Alteração/cancelamento reutilizam comandos, locks, parâmetros e auditoria existentes.
- [ ] Cancelamento com recebida parcial usa quantidade integral e não é bloqueado.
- [ ] Venda Futura, Reserva Prévia e alerta seguem o núcleo atual.
- [ ] Revisão Delphi/Laravel obsoleta retorna 409 sem escrita.
- [ ] Rollback abrange requisição, estoques, movimentos e contexto.
- [ ] O trigger é o único escritor de `pedidosfiliais_log_new`.
- [ ] UI preserva contexto e recarrega somente a linha afetada.

## Matriz mínima de testes

- happy path de aumento, redução e quantidade igual;
- zero, negativa, fracionária e campos proibidos/adulterados;
- situações F/D/C;
- TEP/TPE/TFR, futuro menor/igual/maior e Reserva Prévia divergente;
- motivo obrigatório/opcional, inválido e válido;
- cancelamento A com `qtderecebida > 0`;
- revisão obsoleta por update SQL simulando Delphi e duas sessões Laravel;
- falha injetada entre pedido e movimentos, provando rollback;
- trigger com contexto web e ausência de log manual duplicado;
- Vitest de F5/F6, modal, 422, 409/recarga, sucesso e alerta;
- regressão integral do Cadastro e de `RequisicaoFiliais`.

Testes de lock, trigger e concorrência devem rodar em PostgreSQL real; skip não conta como aceite.

## Saída esperada do SpecKit

Produza spec e plano executáveis com adapters/services, requests, contratos JSON, sequência transacional por referência ao núcleo, estado React, extrações compartilhadas seguras, códigos de erro e testes. Não implemente durante `/speckit.specify`.

## Fora de escopo

- criar/somar requisições;
- trocar produto, filiais ou observação;
- alterar operacionalmente `qtderecebida`;
- duplicar SQL de estoque/movimentos/auditoria;
- relatório (spec 04);
- separação, transferência, expedição e recebimento;
- alterações no Delphi.
```
