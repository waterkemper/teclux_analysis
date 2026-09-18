# Reconciliar a cadeia causal da alteração de previsão

Type: task
Status: resolved
Blocked by: 01, 02, 03

## Question

Considerando conjuntamente as evidências de Entrega, Interlojas e PostgreSQL, onde exatamente ocorre a alteração de `documentospag.previsao` para `false` quando o Romaneio se torna `ENTREGUE`? Distinguir o disparador, os intermediários e o escritor efetivo; apontar divergências entre caminhos e lacunas do checkout.

## Answer

**CONFIRMADO — fluxo principal de Cadastro de Romaneios:** o escritor efetivo é o Delphi compartilhado de Contas a Pagar, em `delphi/apps/contaspagar/dmcontaspagar.pas:5556`:

```pascal
qryDocumentosPagprevisao.AsBoolean := not ExisteEntregaPendente;
```

A cadeia é: a tela de `delphi/apps/entrega` grava `romaneiosnotas.entrega`; `GravarRomaneios` persiste os itens, chama `Atualizar_situacao_romaneio` e, quando `IncluirDocumentoaPagarnoRomaneio` está habilitado, chama `IncluirDocumentosPag` (`dmcadastroromaneios.pas:853-895`). A função local `ExisteEntregaPendente` começa em `true` e muda para `false` se encontrar item não cancelado com `entrega IS NULL` (`dmcontaspagar.pas:5472-5487`). Portanto, apesar do nome invertido, todos os itens entregues resultam em `not true`, isto é, `previsao = false`. Documento já quitado não é alterado.

**A situação `ENTREGUE` não é a condição da atribuição.** `Atualizar_situacao_romaneio(integer)` calcula e grava somente `romaneios.situacao_romaneio`; depois o Delphi calcula `previsao` a partir dos itens. Os dois valores são efeitos correlatos da mesma gravação, não uma regra SQL `ENTREGUE -> previsao=false`.

**CONFIRMADO — fluxo distinto de Interlojas:** `dmconfirmarromaneiostransferencia.pas:996` e `dmconfirmarnotastransferencia.pas:952` criam um novo `documentospag` já com `previsao := false`. A persistência ocorre antes da chamada a `Atualizar_situacao_romaneio`; por isso esse caminho não explica um `UPDATE true -> false` de documento preexistente.

**NÃO LOCALIZADO no banco versionado:** nenhum trigger, função ou procedure dos snapshots de 2026-08-01 e 2026-08-03 altera `documentospag.previsao` por causa da situação do Romaneio. `documentospag_log` apenas audita o valor, e `Atualizar_situacao_romaneio` escreve somente no mestre `romaneios`.

Evidências completas: [`01-fluxo-entrega-delphi.md`](../research/01-fluxo-entrega-delphi.md), [`02-fluxo-interlojas-delphi.md`](../research/02-fluxo-interlojas-delphi.md) e [`03-objetos-postgresql.md`](../research/03-objetos-postgresql.md).
