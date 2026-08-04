# Definir modelo de domínio, coexistência e transações de Romaneios

Type: grilling
Status: resolved
Blocked by: 01, 02, 03, 04

## Question

Qual modelo de domínio e contrato transacional o Laravel deve adotar para operar os mesmos Romaneios do Delphi, incluindo identidade, estados, invariantes, concorrência, revisão, idempotência, auditoria, rollback e uso de funções/triggers legados?

## Answer

Laravel e Delphi compartilharão o mesmo agregado canônico: `romaneios.numero` identifica o Romaneio e `romaneiosnotas(romaneio,dadofiscal)` identifica o Item. Não haverá IDs ou cópia Cloud concorrentes; numeração usa somente as funções/sequences legadas.

Por decisão confirmada com o usuário, cada comando Laravel será uma transação PostgreSQL atômica por Romaneio, incluindo mestre/Itens, agenda/conferência, atualização da situação, financeiro opcional, autorização, idempotência e auditoria. Qualquer falha reverte todos os efeitos, ainda que isso seja mais forte que os commits parciais possíveis no Delphi.

A coexistência usa locks determinísticos e revisão otimista detectável por ambas as origens. Comando desatualizado é rejeitado e exige recarga, sem sobrescrita ou merge automático. Todo comando mutável possui chave de idempotência persistida: replay idêntico devolve o resultado original; mudança de payload/contexto conflita.

PostgreSQL permanece autoridade das funções e triggers legados. O Laravel grava de forma trigger-aware, chama as funções necessárias, relê o estado resultante e usa o relógio do banco. A auditoria distingue operador, Autorizador, Filial, origem, request/idempotência, revisões, antes/depois e resultado; rollback ou rejeição não pode ser registrado como mutação concluída.

O contrato detalhado e critérios dos futuros prompts estão em [modelo-dominio-coexistencia-transacoes.md](../../../modules/entregas/cadastro-romaneios/modelo-dominio-coexistencia-transacoes.md). O vocabulário foi acrescentado a `laravel/CONTEXT.md` e a decisão difícil de reverter foi registrada em `laravel/docs/adr/0305-romaneio-coexistencia-transacao-atomica.md`.
