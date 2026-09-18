# Rastrear o fluxo de confirmação do Romaneio em Interlojas

Type: research
Status: resolved
Blocked by:

## Question

Partindo de `delphi/apps/interlojas`, qual ação e cadeia de chamadas pode levar um Romaneio a `ENTREGUE`, e essa cadeia contém escrita direta ou indireta em `documentospag.previsao`? Registrar cada salto com arquivo, rotina e linha, inclusive chamadas a funções PostgreSQL.

## Answer

As confirmações por Romaneio e por Nota no Interlojas inserem diretamente um
novo `documentospag` com `previsao = false` antes de executar
`Atualizar_situacao_romaneio`, que pode calcular e gravar `ENTREGUE`.
Não foi localizada trigger que vincule a situação do Romaneio ao campo, nem
UPDATE `true -> false` de documento preexistente nessas cadeias.

Pesquisa completa:
[Fluxo Interlojas: documentospag.previsao e Romaneio ENTREGUE](../research/02-fluxo-interlojas-delphi.md).
