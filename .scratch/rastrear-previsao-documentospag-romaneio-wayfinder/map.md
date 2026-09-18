# Rastrear a alteração de previsão financeira ao entregar Romaneio

Label: wayfinder:map

## Destination

Identificar, com uma cadeia de evidências citando arquivo e linha, qual código altera `documentospag.previsao` para `false` quando um Romaneio passa à situação `ENTREGUE`, distinguindo chamada Delphi, função/procedure PostgreSQL e trigger, e declarar quando o comportamento não estiver presente no checkout.

## Notes

- Começar pelas raízes solicitadas: `delphi/apps/entrega` (o diretório existente é singular) e `delphi/apps/interlojas`.
- Seguir chamadas para units compartilhadas e objetos PostgreSQL somente por caminhos comprovados; complementar com os snapshots e funções versionados em `modules/entregas/cadastro-romaneios/` e `modules/interlojas/confirmacao-por-romaneios/`.
- Procurar tanto escrita direta em `documentospag.previsao` quanto efeitos indiretos de `Atualizar_situacao_romaneio(integer)`, `situacao_romaneio(integer)`, procedures e triggers.
- Classificar cada conclusão como `CONFIRMADO`, `INFERIDO` ou `NÃO LOCALIZADO`, sempre citando arquivo e linha ou objeto de banco e sua definição.
- Investigação somente leitura: não alterar Delphi, Laravel, snapshots ou banco.

## Decisions so far

<!-- As evidências serão indexadas aqui quando os tickets forem resolvidos. -->

- [Rastrear o fluxo de entrega do Romaneio no Delphi](issues/01-rastrear-fluxo-entrega-delphi.md) — confirmou que `IncluirDocumentosPag`, em Contas a Pagar, calcula `previsao=false` quando não resta item não cancelado com entrega nula.
- [Rastrear o fluxo de confirmação do Romaneio em Interlojas](issues/02-rastrear-fluxo-interlojas-delphi.md) — confirmou que Interlojas cria outro Documento a Pagar já com `previsao=false`, antes de recalcular a situação.
- [Rastrear funções e triggers PostgreSQL envolvidos](issues/03-rastrear-objetos-postgresql.md) — descartou, nos snapshots versionados, função ou trigger que escreva o campo em resposta a `ENTREGUE`.
- [Reconciliar a cadeia causal da alteração de previsão](issues/04-reconciliar-cadeia-causal.md) — identificou o escritor principal em `dmcontaspagar.pas:5556` e separou correlação operacional de causalidade pela situação.

## Not yet specified

Nenhuma névoa restante: a cadeia causal foi reconciliada nas três superfícies.

## Out of scope

- Corrigir ou reimplementar o comportamento.
- Alterar a situação de Romaneios ou dados financeiros.
- Investigar outras mudanças em `documentospag` que não possam ser alcançadas pela transição para `ENTREGUE`.
