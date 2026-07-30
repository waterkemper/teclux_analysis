# Define the operational domain model

Type: grilling
Status: resolved
Blocked by: 01

## Question

What canonical concepts and lifecycle states should distinguish a queued Job, managed Operational Execution, Worker, Queue, Registered Operational Task, Scheduled Run, Alert, and immutable Administrative Action without conflating framework state with durable business-operational state?

## Comments

## Answer

Adotar um modelo operacional próprio, em português brasileiro na interface, sem tratar estados transitórios do Horizon como verdade durável:

- **Execução Operacional** é a identidade durável do trabalho. Uma retentativa cria outra **Tentativa de Execução** sob a mesma Execução Operacional; uma nova solicitação manual cria outra Execução Operacional ligada à anterior.
- O **Estado do Processamento** é independente do **Resultado da Execução**. Estados canônicos: `Aguardando`, `Enfileirada`, `Em execução`, `Suspensão solicitada`, `Suspensa`, `Verificação necessária` e `Encerrada`. Resultados terminais: `Concluída`, `Falhou`, `Cancelada` e `Cancelada antes da execução`.
- **Suspensa** é reversível. A ação de excluir um payload pendente não apaga a Execução Operacional: encerra-a como `Cancelada antes da execução`, preservando tentativas e auditoria. “Excluída” é nome de ação, não estado persistido.
- Resultado tecnicamente ambíguo permanece `Indeterminado`, com processamento em `Verificação necessária`; repetição fica bloqueada até reconciliação específica ou resolução administrativa justificada.
- **Fila**, **Grupo de Processadores** e **Processador** são conceitos distintos. Controle administrativo atua sobre Fila ou Grupo de Processadores; Processadores individuais, por serem efêmeros, são somente observáveis.
- **Tarefa Operacional**, **Programação Operacional**, **Execução Agendada** e **Execução Manual** têm identidades distintas. Alterar a programação não altera a tarefa nem seu histórico.
- Job legado sem contrato gerenciado aparece como **Job Observado**, marcado `Não gerenciado`, com somente as garantias transitórias e operações seguras oferecidas pelo Horizon.
- **Alerta Operacional** é durável e deduplicado, com severidade `Atenção` ou `Crítica` e estados `Aberto`, `Reconhecido` e `Resolvido`. Reconhecimento não resolve nem silencia a condição. Cada tentativa externa é uma **Entrega de Alerta**; recuperação gera notificação de normalização.
- Toda mutação produz uma **Ação Administrativa** imutável, inclusive recusas e falhas, com ator, ambiente, alvo, motivo, confirmação digitada, evidência de reautenticação sem senha, estados sanitizados anterior/pretendido, correlação e resultado `Concluída`, `Recusada`, `Falhou` ou `Sem efeito`.
- Toda a UI administrativa—rótulos, estados, confirmações, validações, alertas, datas e mensagens—usa português brasileiro; identificadores internos podem permanecer em inglês.

Vocabulário canônico registrado em [`laravel/CONTEXT.md`](../../../laravel/CONTEXT.md).
