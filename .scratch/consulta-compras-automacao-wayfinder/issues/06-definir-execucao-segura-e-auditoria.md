# Definir execução segura, idempotência e auditoria

Type: grilling
Status: resolved
Blocked by: 02, 03, 04, 05

## Question

## Comments

## Answer

- Cada execucao gera um snapshot imutavel da Rotina de Reposicao ECC, parametros, fatos de estoque e vendas, e uma proposta auditavel por produto, Filial Requisitante, fonte, quantidade e justificativa.
- Existe no maximo um lote pendente por rotina, Filial Requisitante e cenario. Nova janela nao cria duplicata: registra bloqueio/alerta e referencia o lote existente.
- A revisao revalida estoque, elegibilidade, concentracao, sugestao da fonte, minimo/maximo, pedidos concorrentes e duplicidade. Itens invalidos tornam-se excecoes; itens validos podem ser confirmados parcialmente.
- A confirmacao grava pedidosfiliais usando RequisicaoFiliaisCommandService e seu pipeline existente de transacao, advisory lock, locks ordenados, movimentos, revisao e auditoria. O job nao escreve esses efeitos diretamente.
- Retry e seguro para calculo e publicacao enquanto o lote nao foi confirmado; a confirmacao usa idempotencia/revisao e nao repete cegamente uma requisicao ja gravada.
- Um usuario autorizado pode cancelar o lote pendente. O cancelamento nao cria pedidosfiliais, libera nova execucao e preserva o snapshot, os itens e o motivo na auditoria.
- Auditoria deve relacionar ocorrencia, execution, lote, item, preparador, aprovador/gerente, decisao, excecao e codigo de pedidosfiliais resultante.

- A infraestrutura operacional existente fornece janela civil, idempotency_key, prevent_overlap, ocorrencia, execution, tentativa e recuperacao de publicacao.
- O job atual de Consulta de Compras gera somente o resultado pesado da sugestao; ainda nao existe uma tarefa recorrente especifica para criar lotes de propostas de reposicao.
- A confirmacao de pedidosfiliais ja possui transacao, advisory lock da tripla produto x requisitante x requisitada, locks ordenados de estoque, revalidacao de saldo, revisao otimista e auditoria em pedidosfiliais_log_new.
- O novo fluxo deve reutilizar RequisicaoFiliaisCommandService para gravar pedidosfiliais; nao deve duplicar locks nem escrever movimentos diretamente.
- Cada execucao deve congelar a configuracao da Rotina de Reposicao ECC e guardar proposta por item, filial destino, fonte, quantidade, fatos usados, justificativa e status.
- A confirmacao deve revalidar estoque, elegibilidade, concentracao, sugestao da fonte, minimo/maximo, pedidos concorrentes e duplicidade; itens invalidos viram excecao sem apagar a proposta original.
- Falhas de calculo podem sofrer retry idempotente; falhas de confirmacao nao podem repetir cegamente uma requisicao ja gravada.
- Enquanto existir um lote pendente de revisao para a mesma Rotina de Reposicao ECC, Filial Requisitante e cenario, uma nova janela nao cria outro lote; registra bloqueio/alerta e aponta para o lote pendente.

Qual deve ser o ciclo de vida de uma execução automática: snapshot, revalidação de estoque, lock, deduplicação, retry, cancelamento, aprovação, confirmação da requisição, tratamento de falhas e auditoria por item/filial/usuário/job?
