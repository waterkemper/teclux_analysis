# Reconciliar o contrato atômico de Cancelamento em lote com CancelarContrato/ReverterFaturamentoContrato

Type: grilling
Status: resolved
Blocked by: 01-documentar-fluxo-cancelamento-lote-delphi, 02-mapear-integridade-exclusao-lote, 03-inventariar-estado-laravel

## Question

Como o Cancelamento disparado por esta tela de lote (Motivo, Filial, revalidação por item) reutiliza, sem redefinir, os comandos `CancelarContrato` e `ReverterFaturamentoContrato` e as guardas financeiras/fiscais/logísticas já decididas no ticket 21? O que é específico do lote (seleção múltipla, resultado por item, Filial do lote) e precisa de decisão própria aqui?

## Answer

**Princípio orientador fixado nesta sessão**: seguir o padrão real do Delphi — parâmetros, permissões e comportamento — em vez de introduzir rigor novo que o Delphi nunca teve. A distinção usada em cada decisão abaixo é: (a) mecanismo que **já existe** no Delphi, só que num caminho de código diferente que esta tela não chama → fechar a inconsistência interna, reaproveitando o mecanismo existente; (b) funcionalidade que **nunca existiu** em nenhum caminho do Delphi para esta tela → não inventar.

- `DECISÃO NOVA` — reaproveitar `CancelarContrato` (ticket 21) por item traz automaticamente **todas** as suas guardas (financeira, fiscal, `DevolucoesouTrocasEfetuadas`, estoque, logística, `revision`, capability). Isso inclui, deliberadamente, a guarda de devolução/troca que falta nesta tela do Delphi (achado do ticket [Mapear integridade e elegibilidade da Exclusão física em lote](02-mapear-integridade-exclusao-lote.md)) — não é rigor novo, é igualar esta tela ao que `CancelarContratoReservado` já aplica no Cadastro principal (caso (a) acima).
- `DECISÃO NOVA` — **Motivo continua opcional**, sem filtro por `tipomotivo`, fiel a esta tela específica do Delphi (`edfMotivo`/`TtecDbEditFind` simples) — não é um caminho alternativo já existente em outro lugar para esta tela, é comportamento próprio dela (caso (b)).
- `DECISÃO NOVA` — **descrição/texto complementar passa a existir, condicionada a `parsistema.ObrigarDigitacaoaoExcluir`** — não é funcionalidade nova: esse parâmetro já existe e já é aplicado ao Cancelamento de Contrato no Cadastro principal via o componente compartilhado `TfrmMotivos` (`fmcadastrocontratos.pas:2271`); esta tela de lote simplesmente não chama esse componente hoje. Fechar essa lacuna é caso (a). Quando o parâmetro exige texto, o comando reaproveitado gera Atendimento (mesma lógica condicional já decidida no ticket 21); quando não exige e o Usuário não digita nada, nenhum Atendimento é criado — reproduzindo fielmente o resto do Delphi.
- `DECISÃO NOVA` — **Filial da operação** (guardas e registro do comando) é sempre a Filial do Usuário autenticado (`FilialBase`), nunca a Filial selecionada no filtro de listagem da tela. O próprio Delphi já opera assim (`ExtornarParcelas`/`AtualizarSaldoCreditoCliente` gravam com `FilialBase`, independente de `edfFilial`); o filtro é só critério de busca, não parâmetro da operação.
- `DECISÃO NOVA` — **autorização por item**, reaproveitando exatamente as capabilities e o `SensitiveOperationProof` já decididos no ticket 21 para `CancelarContrato`. Nenhum mecanismo de "autorizar o lote inteiro de uma vez" — o Delphi nunca teve isso (já opera por item dentro do loop), e criar isso seria rigor novo não pedido.
- `CONFIRMADO` — o que é genuinamente específico do lote (não decorre de `CancelarContrato` sozinho): seleção múltipla de Contratos dentro de uma única Situação filtrada (ticket 04), orquestração que invoca o comando uma vez por item com transação própria por item, e agregação de um resultado detalhado por item (sucesso, já cancelado, não elegível, bloqueio financeiro/fiscal/devolução/estoque/logística, sem permissão, conflito de `revision`, falha) — isto fica para o ticket [Definir Permissões, Autorizações, Auditoria e concorrência do lote](07-definir-permissoes-auditoria-concorrencia-lote.md).
