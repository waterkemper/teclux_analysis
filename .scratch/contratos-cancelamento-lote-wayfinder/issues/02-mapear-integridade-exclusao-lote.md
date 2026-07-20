# Mapear integridade e elegibilidade da Exclusão física em lote

Type: task
Status: resolved
Blocked by:

## Question

Quais guardas o Delphi aplica nesta tela antes de permitir a Exclusão física de um Contrato Orçado em lote (Situação, vínculos, parcelas, reservas, dados fiscais, Atendimento)? É o mesmo caminho de código/guardas já mapeado para o Cadastro principal em `dmcadastrocontratos.pas` (referenciado no ticket 21 do `cadastro-contratos-wayfinder`) ou uma implementação duplicada/divergente própria desta Consulta?

**Escopo já reduzido pelo ticket** [Documentar o fluxo completo da tela de Cancelamento em lote no Delphi](01-documentar-fluxo-cancelamento-lote-delphi.md): confirmou que `ExcluirContratos` (`dmcancelamentocontratos.pas:477-534`) só é alcançável pela aba Orçados, exclui apenas Produtos/Parcelas/cabeçalho, sem checar nenhum vínculo além da Situação `O`, sem excluir Movimentos, e com `RetiraContratodoOrcamento` desativado (comentado). Falta apenas: (a) comparar esse caminho com a exclusão física própria de `dmcadastrocontratos.pas` referenciada no ticket 21 (mesma rotina reaproveitada ou duplicada?); e (b) levantar quais outros vínculos podem existir sobre um Contrato ainda Orçado (Atendimento, anexos, fotos, Questionário, flag `os`/Ordem de Serviço visto na query base) que hoje não bloqueiam a Exclusão nesta tela, para decidir se isso é aceitável ou lacuna a corrigir na migração.

## Answer

### Exclusão física: mesma rotina ou duplicada?

- `CONFIRMADO` — é rotina **duplicada**, não reaproveitada. `TdtmCadastroContratos.ExcluirContrato` (`dmcadastrocontratos.pas:5899-5960`) opera sobre datasets próprios do Cadastro principal; `TdtmCancelamentoContratos.ExcluirContratos` (`dmcancelamentocontratos.pas:477-534`) opera sobre datasets próprios da tela de lote. Não há chamada cruzada.
- `CONFIRMADO` — mas o **comportamento é equivalente** para Orçado: o ramo `scORCADO`/`CancelarCtrOrcado=False` do Cadastro principal (`dmcadastrocontratos.pas:5932-5938`) também só apaga Produtos, Parcelas e o cabeçalho — sem checar Atendimento, anexos, fotos, Questionário, Movimentos ou qualquer outro vínculo além da própria Situação `O`. Ou seja, a ausência de guardas na tela de lote **não é uma lacuna introduzida por ela**; reproduz fielmente o que o Cadastro principal já faz (ou não faz) para Exclusão de Orçado. Não é uma divergência a corrigir isoladamente aqui — é uma característica herdada de ambos os caminhos legados.
- `POSSÍVEL BUG LEGADO (compartilhado, não exclusivo desta tela)` — nenhum dos dois caminhos remove Movimentos de estoque nem desfaz vínculo com o Orçamento de origem (`RetiraContratodoOrcamento` também está inacessível/comentado nesta tela; no Cadastro principal a chamada não aparece neste trecho). Ambos ficam sujeitos ao mesmo risco de órfãos.

### Cancelamento de Faturado: guarda financeira/fiscal real do Cadastro principal

- `CONFIRMADO` — `TdtmCadastroContratos.CancelarContratoReservado` (`dmcadastrocontratos.pas:4033-4064`, usada para `R` e `F`) tem uma guarda **explícita** ausente na tela de lote:
  ```pascal
  if (SituacaoContrato = scFATURADO) and (QualQuerPagamento or DevolucoesouTrocasEfetuadas) then
    Result := False; // 'Contratos faturados somente podem ser cancelados se não houver
                      //  nenhum tipo de pagamento ou estorno nas parcelas ou trocas e devoluções efetuadas.'
  ```
- `DIVERGENTE (confirmado, não mais hipótese)` — a tela de lote (`dmcancelamentocontratos.pas`) **não chama** `QualQuerPagamento`/`DevolucoesouTrocasEfetuadas` nem equivalente. Sua única proteção é o filtro de listagem (Faturados sem nenhuma parcela com `datapagto`/`tipopagto` preenchido), que cobre o caso "pagamento" mas **não** cobre `DevolucoesouTrocasEfetuadas` — um Contrato Faturado com devolução/troca já efetuada, mas parcelas ainda tecnicamente em aberto, pode passar pelo filtro de listagem e ser cancelado em lote sem o bloqueio que o Cadastro principal aplicaria. Isto é uma lacuna real da tela de lote, não uma característica equivalente ao Cadastro principal — precisa de decisão explícita no ticket de reconciliação.

### Outros vínculos sobre Contrato Orçado

- `CONFIRMADO` (por precedente já registrado no `cadastro-contratos-wayfinder`) — um Contrato, mesmo Orçado, pode ter Atendimentos, Contatos, Fotos/Anexos e aplicação de Questionário vinculados (ticket [Integrar relacionamento, questionários, fotos e anexos ao shell](../cadastro-contratos-wayfinder/issues/20-integrar-relacionamento-questionarios-fotos-e-anexos-ao-shell.md)). Nenhum desses vínculos é checado por nenhum dos dois caminhos de Exclusão física (lote ou Cadastro principal) hoje.
- `DÚVIDA (não resolvida neste ticket)` — significado exato da flag `os` usada no filtro base (`os IS NULL OR os='false'`) permanece não confirmado; não foi localizada no Cadastro principal nem em `dmcadastrocontratos.pas`. Fica registrada como dúvida remanescente para o handoff final, sem bloquear as decisões deste mapa.

### Síntese para a decisão de migração

- A Exclusão física em lote **não introduz risco novo** frente ao Cadastro principal — ambas são igualmente rasas para Orçado. Uma decisão sobre reforçar guardas de Exclusão (checar Atendimento/anexos/fotos/Questionário/Movimentos) vale para os dois caminhos, não é exclusiva deste mapa, mas deve ser declarada explicitamente no prompt final para não ser fielmente replicada sem questionamento.
- O Cancelamento de Faturado em lote **introduz risco real**: falta a guarda `DevolucoesouTrocasEfetuadas` que o Cadastro principal aplica. Isto vai para o ticket de reconciliação como uma lacuna a decidir (reproduzir a guarda vs. aceitar o comportamento legado).
