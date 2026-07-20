# Prompt para /speckit.specify — Atendimento no Cancelamento de Contratos

```text
/speckit.specify

Crie uma especificação funcional e técnica para corrigir e completar, no Laravel, a criação de Atendimento dentro do comando de Cancelamento de Contrato já implementado (`App\Application\Vendas\Contratos\CancelarContratoCommand::insertAtendimentoCancelamento`), usado pela feature "Vendas → Cancelamento de Contratos" (lote) já em produção/dev.

Não implemente nesta etapa. Produza uma especificação pronta para planejamento e implementação. Inspecione o código atual antes de concluir e corrija qualquer hipótese deste prompt que seja contrariada por evidência concreta — em especial os nomes exatos de tabelas/colunas, já que parte da evidência abaixo é do legado Delphi e precisa ser confirmada linha a linha no schema real.

## Contexto — o que já existe e não deve ser refeito

Esta não é uma feature nova. `CancelarContratoCommand` já é o comando canônico de Cancelamento de Contrato (`O/R/F → C`), já ativo, já com as guardas financeira/fiscal (`hasParcelaComPagamentoReal`, `hasDevolucaoOuTroca`) e já injetando `LegacyAtendimentoRepository`/`LegacyTipoAtendimentoRepository`. Ele **já cria um Atendimento** quando `ObrigarDigitacaoaoExcluir` exige descrição — mas de forma incompleta e com um valor de `tipo` incorreto. Este prompt corrige três pontos específicos, não redesenha o comando.

Reaproveitar sem modificar: `LegacyAtendimentoRepository::findExistenteInclusaoAtendimento` (já suporta `tipo='C'`/união por `contrato` — só muda o valor de `tipo` passado), `insert`/`update` (genéricos por array de atributos, com concorrência otimista), e o padrão de follow-up já implementado em `App\Services\CobrancaSac\AtendimentoService` (cópia de `tipocliente`/`contrato`/`origem` para uma nova linha, `informes` limpo).

## Vocabulário obrigatório

- `Atendimento`: registro do módulo SAC (tabela legada `atendimentos`), classificado por `tipo` (`'C'`=Cobrança, `'R'`=Reclamação, `'V'`=Contato, `'O'`=Orçamento). Para Cancelamento de Contrato, o `tipo` correto é **`'V'` (Contato)** — nenhum código existente significa literalmente "Contrato"; `'C'` e `'O'`, hoje usados nos caminhos de Cancelamento (Delphi e/ou Laravel), são bug de copy-paste, não convenção válida.
- `Atendimento de Cancelamento`: Atendimento vinculado a um Contrato específico (campo `contrato`) que registra o motivo/texto do Cancelamento. Sempre um por Contrato — nunca consolidado por Cliente, mesmo quando vários Contratos do mesmo Cliente são cancelados juntos.
- `Follow-up`: nova linha de Atendimento vinculada por `origem` a um Atendimento raiz existente, usada para reaproveitar um Atendimento já aberto em vez de criar um duplicado.

## Regras de evidência

Classifique toda descoberta relevante como CONFIRMADO, INFERIDO, DÚVIDA, NÃO LOCALIZADO, DIVERGENTE, POSSÍVEL BUG LEGADO ou DECISÃO NOVA, sempre com evidência concreta (arquivo:linha). Compare o comportamento Delphi com o Laravel atual antes de propor a correção final.

## Evidência confirmada

### Mecanismo Delphi (referência, não fonte da verdade para o `tipo`)

- `CONFIRMADO` — `dmcadastrocontratos.pas:5907-5908`: `IncluirAtendimento_(Documento, Cliente, TipoCliente, CancelamentoContrato, TextoCancelamento)` só roda quando `TextoCancelamento <> ''` (texto do modal `TfrmMotivos`, condicionado a `ObrigarDigitacaoaoExcluir`, `fmcadastrocontratos.pas:2267-2274`).
- `CONFIRMADO` — implementação real em `delphi/apps/sac/dmcadastroatendimentos.pas:2103-2179`: busca Atendimento aberto do Contrato (`qryExisteAtendimento` filtrado por `tipo`, `contrato=Documento`); se existe, cria uma linha de follow-up (`IncluirAtendimentos(true, true)`) copiando campos e fechando com o texto; se não existe, cria um novo já fechado (`IncluirAtendimentos(['IncluirCancelamentoDiretoContrato', ...])`). Nunca duplica.
- `POSSÍVEL BUG LEGADO (Delphi)` — a busca usa `tipo='C'` mas a criação grava `tipo='O'` (`dmcadastroatendimentos.pas:2130-2133` vs. `:956-980`) — inconsistente mesmo no Delphi; a rotina de reaproveitamento nunca funcionaria de fato para este caminho específico. `GetDescricaoAtendimento` (`dmcadastroatendimentos.pas:538-551`) confirma que `'C'`=Cobrança e `'O'`=Orçamento — nenhum dos dois é "Contrato".

### Estado Laravel atual (a corrigir)

- `CONFIRMADO` — `CancelarContratoCommand::insertAtendimentoCancelamento` (`laravel/backend/app/Application/Vendas/Contratos/CancelarContratoCommand.php:344-384`), chamado dentro da mesma `DB::transaction` de `execute()` (linhas 196-251), quando `$requireDescricao && $descricao !== ''` (linha 248-250).
- `DIVERGENTE` — grava `tipo='C'` (linha 364) — deveria ser `'V'`.
- `DIVERGENTE` — sempre executa `insert()` (linha 383) — nunca verifica se já existe um Atendimento aberto para aquele Contrato via `findExistenteInclusaoAtendimento`, então nunca reaproveita como follow-up; cada Cancelamento subsequente do mesmo Contrato (se o Contrato pudesse ser cancelado de novo, o que a guarda de Situação já impede — mas o método em si não tem essa proteção) criaria um Atendimento duplicado.
- `DIVERGENTE` — texto gravado é só `descrição . ' — Contrato ' . numero . ' cancelado.'` (linha 360) — não inclui a descrição do Motivo selecionado.
- `CONFIRMADO` — `tipoatendimento` é resolvido via `$this->tipoAtendimentoRepository->findSoleCodigoByTipoPrincipal('C')` (linha 379) — deve mudar para `'V'` também.
- `CONFIRMADO` — `LegacyAtendimentoRepository::findExistenteInclusaoAtendimento` (`laravel/backend/app/Infrastructure/Persistence/Legacy/CobrancaSac/LegacyAtendimentoRepository.php:694-752`) já suporta a busca por `tipo='C'` com união por `contrato` — só é preciso trocar o valor de `tipo` passado para `'V'`, não criar lógica nova de busca.
- `NÃO LOCALIZADO` — nenhum backfill necessário nem desejado: Atendimentos já criados com `tipo='C'` pelo comportamento atual permanecem como estão, sem migração retroativa.

## Solução funcional obrigatória

### 1. Corrigir o `tipo`

Trocar todas as ocorrências de `'C'` relacionadas a este fluxo específico (o valor gravado em `insertAtendimentoCancelamento` e o argumento de `findSoleCodigoByTipoPrincipal`) por `'V'`. Não alterar `tipo` em nenhum outro fluxo de Atendimento (Cobrança continua `'C'` em todo o resto do sistema).

### 2. Implementar a checagem de existência e o follow-up

Antes de decidir criar um novo Atendimento, chamar `LegacyAtendimentoRepository::findExistenteInclusaoAtendimento(cliente, tipocliente, tipo: 'V', dataAtual: false, orcamento: null, contrato: $numero)`:

- Se retornar um Atendimento existente: criar uma nova linha de follow-up vinculada por `origem` ao Atendimento raiz (usar o mesmo padrão de `AtendimentoService`: copiar `cliente`/`tipocliente`/`contrato`/`origem`, `informes` com o novo texto, `status`/`fechado`/`concluido` fechados imediatamente), em vez de criar um Atendimento solto sem vínculo de `origem`.
- Se não retornar nada: manter o comportamento atual de `insert()` de um novo Atendimento, corrigindo `tipo` para `'V'`.
- Nunca duplicar: no máximo uma operação de Atendimento (criação ou follow-up) por Contrato, por chamada de `insertAtendimentoCancelamento`.

### 3. Incluir o Motivo no texto

Quando um Motivo foi selecionado (`$motivo !== null`), buscar sua descrição e prefixar o texto: `"Motivo: <descrição> — <descrição atual> — Contrato <numero> cancelado."` (ajustar formatação exata na fase de planejamento, mantendo a intenção: Motivo visível para quem só lê o Atendimento). Quando não há Motivo selecionado, manter só o texto atual sem o prefixo.

### 4. Preservar tudo o que já está correto

- Mesma transação do Cancelamento (decisão consciente, documentada — divergência aceita do ticket 21 do `cadastro-contratos-wayfinder`, que previa outbox/retry pós-commit para o F6 inline do Cadastro completo, não para este comando de lote).
- Um Atendimento por Contrato, nunca consolidado por Cliente, mesmo com múltiplos Contratos do mesmo Cliente no mesmo lote — a busca de existência deve sempre incluir `contrato` explícito, nunca confiar só no casamento de Cliente+tipo+data.
- Ativação condicionada a `ObrigarDigitacaoaoExcluir` — sem mudança.
- Idempotência já coberta pela guarda de Situação existente (Contrato já `Cancelado` nunca chega a este método) — não adicionar mecanismo de idempotência específico para o Atendimento.
- `ContratoLoteItemResult` não ganha novo campo para status do Atendimento.
- Nenhum backfill de Atendimentos históricos.

## Testing Decisions

Ver matriz completa em `.scratch/contratos-cancelamento-atendimento-wayfinder/issues/04-definir-testes-e-aceite.md`. Resumo:

- `ObrigarDigitacaoaoExcluir` inativo/ativo × descrição presente/ausente.
- `tipo='V'` em busca e criação, nunca `'C'`/`'O'`.
- Busca sempre por `contrato` explícito.
- Atendimento aberto do mesmo Contrato → follow-up, fechado, sem duplicar.
- Sem Atendimento aberto → novo, já fechado.
- Múltiplos Contratos do mesmo Cliente no lote → Atendimentos independentes por Contrato.
- Atendimento aberto de outro Contrato/Cliente não é afetado.
- Texto com/sem Motivo.
- Falha na etapa de Atendimento reverte o Cancelamento do item (`falha_transacional`) — comportamento preservado, não corrigido.
- Contrato já cancelado não gera nova tentativa.
- Nenhum Atendimento histórico alterado.

## Critérios de aceite

1. `tipo='V'` é usado consistentemente na busca de existência e na criação/follow-up de Atendimento de Cancelamento de Contrato.
2. A busca de existência inclui sempre `contrato` explícito — nunca casamento só por Cliente+tipo+data.
3. Atendimento aberto do mesmo Contrato é reaproveitado como follow-up (vinculado por `origem`), fechado com o novo texto — nunca duplicado.
4. Sem Atendimento aberto do mesmo Contrato, um novo Atendimento é criado, `tipo='V'`, já fechado.
5. O texto inclui a descrição do Motivo quando selecionado; mantém-se sem o prefixo quando não há Motivo.
6. Múltiplos Contratos do mesmo Cliente no mesmo lote geram/atualizam Atendimentos independentes, um por Contrato, nunca consolidados.
7. A criação/atualização do Atendimento permanece na mesma transação do Cancelamento; falha nessa etapa continua revertendo o Cancelamento do item e é reportada como `falha_transacional`.
8. Ativação continua condicionada a `ObrigarDigitacaoaoExcluir` ativo e descrição informada — sem mudança nessa regra.
9. Nenhum Atendimento histórico (`tipo='C'` criado pelo comportamento anterior) é alterado, migrado ou reclassificado.
10. `ContratoLoteItemResult` permanece sem campo novo para status do Atendimento.
11. Testes cobrem tanto o caminho de criação quanto o de follow-up, com e sem Motivo, e com falha isolada da etapa de Atendimento provocando rollback do item.

## Out of Scope

- Alterar o Delphi.
- Implementar durante `/speckit.specify`.
- Mover a criação de Atendimento para fora da transação do Cancelamento (outbox/retry) — divergência consciente do ticket 21, documentada, não revisitada aqui.
- Backfill/migração de Atendimentos já criados com `tipo='C'` pelo comportamento anterior.
- Qualquer alteração em `CancelarOrcamentoService.php` (lacuna irmã de Atendimento em Orçamentos — fora de escopo).
- Novo campo de resultado por item para status do Atendimento.
- Qualquer alteração ao comando `CancelarContrato` além dos três pontos corrigidos aqui (guardas financeira/fiscal, movimentos de estoque, parcelas etc. já estão corretos e não devem ser tocados).

## Further Notes

- Precedente/origem deste retrofit: `.scratch/contratos-cancelamento-atendimento-wayfinder/` (mapa completo com as 5 decisões e evidências).
- Prompt irmão (feature base já publicada): `modules/vendas/contratos-cancelamento-lote/01-speckit-prompt.md`.
- Vocabulário de domínio: `AGENTS.md`/`CONTEXT.md` (raiz), `modules/vendas/contratos/CONTEXT.md`.

## Formato esperado

Produza obrigatoriamente:

1. Problem Statement;
2. Solution;
3. User Stories numeradas cobrindo os três pontos de correção (tipo, follow-up, texto com Motivo);
4. Implementation Decisions (assinatura exata do método corrigido, uso de `findExistenteInclusaoAtendimento`, forma da linha de follow-up, formatação do texto com Motivo);
5. Testing Decisions;
6. Out of Scope;
7. Further Notes;
8. matriz de evidências Delphi × Laravel atual × Laravel corrigido;
9. critérios de aceite verificáveis (os 11 listados acima, mais quaisquer refinamentos justificados por evidência nova do schema real);
10. dúvidas remanescentes separadas dos requisitos.
```
