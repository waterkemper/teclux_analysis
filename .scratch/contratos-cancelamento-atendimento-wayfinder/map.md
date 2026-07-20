Label: wayfinder:map

## Destination

Produzir, com evidência concreta do Delphi (`IncluirAtendimento_` em `delphi/apps/vendas/dmcadastrocontratos.pas:5907-5908`/`fmcadastrocontratos.pas:2267-2274`, implementação real em `delphi/apps/sac/dmcadastroatendimentos.pas:2103-2179`) e do estado atual do Laravel (feature `CancelamentoContratos` já implementada em `laravel/backend/app/**/*Cancelamento*`, primitivas já existentes em `LegacyAtendimentoRepository`), decisões e um prompt `/speckit.specify` complementar que adiciona a criação/reaproveitamento (follow-up) de Atendimento à feature de Cancelamento em lote de Contratos já em produção — com Motivo/texto compartilhado entre todos os Contratos selecionados quando `ObrigarDigitacaoaoExcluir` exigir, reaproveitando o domínio de Atendimento já existente no Laravel, sem duplicar primitivas que já existem.

## Notes

- Consultar `grilling` e `domain-modeling`.
- Escopo: só a feature já implementada "Vendas → Cancelamento de Contratos" (lote, `.scratch/contratos-cancelamento-lote-wayfinder/`, concluído). O F6 inline do Cadastro de Contratos completo (comando `CancelarContrato`, Etapa 6 do `cadastro-contratos-wayfinder`) ainda não existe — fica fora deste mapa, reaproveitável futuramente sem redecisão quando a Fundação existir.
- Tratar `delphi/` e `laravel/` como somente leitura; escrever apenas em `modules/`, `docs/` ou `.scratch/`.
- Classificar toda descoberta como CONFIRMADO, INFERIDO, DÚVIDA, NÃO LOCALIZADO, DIVERGENTE, POSSÍVEL BUG LEGADO ou DECISÃO NOVA, sempre com evidência concreta (arquivo:linha).
- Reaproveitar as primitivas já existentes em `LegacyAtendimentoRepository` (`insert`, `update` com `expectedRowVersion`, `findExistenteInclusaoAtendimento` — paridade explícita com `qryExisteAtendimento` do Delphi —, `updateStatusByCodigos`, árvore de follow-up: `collectOrigemTreeCodigos`/`findOrigemRootCodigo`/`fetchLatestInOrigemChain`) em vez de duplicar. O trabalho deste mapa é majoritariamente orquestração, não construção de infraestrutura nova.
- Motivo/texto de Cancelamento em lote é compartilhado entre todos os Contratos selecionados na mesma confirmação — decisão já herdada do mapa anterior (um Motivo/descrição por operação, não por item).
- `CancelarOrcamentoService.php` não cria Atendimento hoje, apesar do prompt de Orçamentos (`227-orcamento-f6-excluir-cancelar`) ter pedido isso — lacuna irmã, fora de escopo deste mapa.
- Nenhuma implementação será feita neste workspace.

## Decisions so far

<!-- Uma linha por ticket resolvido, com link e síntese. -->

- [Consolidar a mecânica completa de Atendimento no Cancelamento de Contrato](issues/01-consolidar-mecanica-atendimento-cancelamento.md) — mapeou o mecanismo Delphi completo (reaproveitar/fechar como follow-up vs. criar novo já fechado) e confirmou que a infraestrutura Laravel já existe e é reaproveitável quase sem modificação (`findExistenteInclusaoAtendimento` já suporta Contrato, `insert`/`update` genéricos, `AtendimentoService` já tem rotina de follow-up); encontrou uma inconsistência real no próprio Delphi (busca usa `tipo='C'`, inclusão nova grava `tipo='O'`) que precisa de decisão explícita, não resolução automática.
- [Definir o contrato do Atendimento de Cancelamento em lote](issues/02-definir-contrato-atendimento-cancelamento-lote.md) — corrigiu a inconsistência do Delphi: usar `tipo='V'` (Contato), não `'C'`/`'O'` (bug de copy-paste, nenhum dos dois significa Contrato); um Atendimento por Contrato, vinculado por `contrato`, nunca consolidado por Cliente; texto inclui a descrição do Motivo prefixada, divergindo conscientemente do Delphi para melhor leitura fora do Cadastro.
- [Definir a integração no CancelamentoContratosLoteOrchestrator](issues/03-definir-integracao-orchestrator.md) — achado central: a criação de Atendimento já existe hoje em `CancelarContratoCommand::insertAtendimentoCancelamento`, não no Orchestrator, dentro da mesma transação do Cancelamento — mas com `tipo='C'` errado, sempre cria novo (sem follow-up) e texto sem Motivo. Decidiu manter na mesma transação (divergindo conscientemente do ticket 21), sem backfill de registros antigos, sem novo campo de resultado por item.
- [Definir testes e critérios de aceite](issues/04-definir-testes-e-aceite.md) — consolidou a matriz de testes e 11 critérios de aceite verificáveis a partir das decisões dos tickets 01–03, sem decisão nova.
- [Consolidar e produzir o prompt /speckit.specify complementar](issues/05-consolidar-prompt-speckit-complementar.md) — publicou [`modules/vendas/contratos-cancelamento-lote/02-speckit-prompt-atendimento.md`](../../modules/vendas/contratos-cancelamento-lote/02-speckit-prompt-atendimento.md), um prompt de correção (não redesenho) explicitando que `CancelarContratoCommand` já existe e só precisa de três correções pontuais.

## Not yet specified

Nenhuma névoa funcional restante. O mapa está concluído: os 5 tickets foram resolvidos e o prompt `/speckit.specify` complementar foi publicado em `modules/vendas/contratos-cancelamento-lote/02-speckit-prompt-atendimento.md`. Próximo passo é rodar `/speckit.specify` com esse prompt no Cursor, não abrir novo mapa.

## Out of scope

- F6 inline do Cadastro de Contratos completo / comando `CancelarContrato` (Etapa 6, ainda não implementado) — fica para quando a Fundação existir, reaproveitando as decisões deste mapa sem redecidir.
- Atendimento em `CancelarOrcamentoService` (Orçamentos) — lacuna irmã, não deste mapa.
- Implementar Delphi ou Laravel, migrations, Composer, npm, builds, formatadores ou geradores.
