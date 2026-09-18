# Rastrear funções e triggers PostgreSQL envolvidos

Type: research
Status: resolved
Blocked by:

## Question

Nos snapshots, definições SQL e demais fontes versionadas do banco, qual função, procedure ou trigger alcançada pela transição do Romaneio para `ENTREGUE` escreve `documentospag.previsao = false`? Provar a cadeia entre situação do Romaneio, vínculo financeiro e escrita no campo, ou classificar precisamente o trecho ausente como `NÃO LOCALIZADO`.

## Answer

**NÃO LOCALIZADO em PostgreSQL:** os snapshots de Entregas e Interlojas não contêm função, procedure ou trigger que converta a situação `ENTREGUE` em `documentospag.previsao = false`. `atualizar_situacao_romaneio` atualiza somente `romaneios.situacao_romaneio`; `documentospag_log` apenas audita o valor recebido.

A cadeia comprovada termina no Delphi: após persistir os itens e recalcular a situação, o Cadastro de Romaneios chama `IncluirDocumentosPag`; essa rotina grava `previsao = false` quando não resta item não cancelado com `romaneiosnotas.entrega` nulo. Interlojas possui outra atribuição direta a `false` ao criar o documento financeiro de entrada, também antes do recálculo da situação e sem trigger.

Pesquisa completa: [Objetos PostgreSQL e `documentospag.previsao`](../research/03-objetos-postgresql.md).
