# Rastrear o fluxo de entrega do Romaneio no Delphi

Type: research
Status: resolved
Blocked by:

## Question

Partindo de `delphi/apps/entrega`, qual ação e cadeia de chamadas altera um Romaneio para `ENTREGUE`, e essa cadeia contém escrita direta ou indireta em `documentospag.previsao`? Registrar cada salto com arquivo, rotina e linha, inclusive chamadas a funções PostgreSQL.

## Answer

Confirmado: salvar a confirmação de entrega grava `romaneiosnotas.entrega`, recalcula a situação por `Atualizar_situacao_romaneio` e chama `IncluirDocumentosPag`. Esta rotina Delphi compartilhada — não uma trigger localizada — grava `documentospag.previsao=false` quando todos os itens não cancelados têm `entrega` preenchida. A regra não testa literalmente a situação `ENTREGUE`.

Pesquisa completa: [Fluxo de entrega do Romaneio e documentospag.previsao](../research/01-fluxo-entrega-delphi.md).
