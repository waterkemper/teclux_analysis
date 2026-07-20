# Definir o contrato seguro de Exclusão física em lote

Type: grilling
Status: resolved
Blocked by: 02-mapear-integridade-exclusao-lote, 03-inventariar-estado-laravel, 04-definir-resolucao-cancelar-excluir-abas

## Question

Qual operação atômica deve validar e executar a Exclusão física em lote de Contratos Orçados elegíveis, incluindo revalidação de elegibilidade por item no momento da transação, remoção de filhos próprios, bloqueio por vínculos, e resposta detalhada por item (mesmo padrão de "não converter silenciosamente Exclusão em Cancelamento" adotado em Orçamentos)?

## Answer

- `CONFIRMADO` — Contrato Orçado nunca reserva estoque nem gera Movimentos (`O`: "Consultar disponibilidade... não reservar", só `O → R` cria reservas/movimentos — [Delimitar estoque, reserva e conferência](../cadastro-contratos-wayfinder/issues/10-delimitar-estoque-reserva-e-conferencia.md) do `cadastro-contratos-wayfinder`). A ausência de exclusão de Movimentos nos dois caminhos Delphi (achado dos tickets 01/02) **não é lacuna** — não há Movimento para excluir num Contrato Orçado. Ponto fechado, não entra no comando novo.
- `DECISÃO NOVA` — diferente das demais decisões deste mapa (que seguiram "o padrão real do Delphi"), a Exclusão física é o único ponto onde se decide **não** replicar a ausência de guardas: o comando novo (`ExcluirContratoOrcado`, nome de trabalho) deve bloquear a Exclusão quando existir Atendimento, anexo, foto ou aplicação de Questionário vinculados ao Contrato — nenhum caminho do Delphi verifica isso hoje, mas é uma proteção nova justificada, não rigor gratuito: é o único lugar deste mapa onde "seguir o Delphi" colidiria com uma operação irreversível sem nenhuma rede de segurança em nenhum caminho legado. Mesmo padrão já adotado em Orçamentos (`modules/vendas/orcamentos-f6-exclusao-cancelamento/09-speckit-prompt.md`: Contrato bloqueia Exclusão).
- `DÚVIDA (registrada, não decidida)` — `RetiraContratodoOrcamento` (desvincular o Orçamento de origem) está desativado/comentado em **todos** os caminhos Delphi onde aparece, inclusive na referência do Cadastro principal — não há caminho ativo para reproduzir nem inconsistência interna a fechar. Fica registrada como dúvida para decisão de negócio no prompt final, sem presumir se deve ser reativada (pode ter sido desligada por bug nunca corrigido) ou se é proposital (nunca desvincular).
- `DECISÃO NOVA` — forma do comando `ExcluirContratoOrcado`, por item, dentro de uma transação:
  1. revalidar Situação `= O` e `revision` esperada no momento da transação (mesma infraestrutura de concorrência já fixada como Fundação no `cadastro-contratos-wayfinder`, independente do que qualquer tela Delphi faz — Delphi não tem conceito de `revision`);
  2. revalidar capability/Permissão de Exclusão física (distinta da Permissão de Cancelamento — decisão de nomes/matriz fica para o ticket [Definir Permissões, Autorizações, Auditoria e concorrência do lote](07-definir-permissoes-auditoria-concorrencia-lote.md));
  3. revalidar ausência de vínculo bloqueador (Atendimento, anexo, foto, Questionário) — se houver, recusar com o bloqueador tipado e oferecer Cancelamento como alternativa, nunca converter silenciosamente;
  4. remover filhos próprios em ordem segura: Produtos e Parcelas (não há Movimentos a remover, ver acima);
  5. remover o cabeçalho por último;
  6. preservar a Auditoria por triggers `_log_new` (mesmo padrão do resto do `cadastro-contratos-wayfinder`);
  7. **não** desvincular o Orçamento de origem (ver dúvida registrada acima) até decisão de negócio;
  8. retornar resultado por item: excluído, não elegível (Situação), vínculo bloqueador (tipado), sem permissão, conflito de `revision`, falha transacional — nunca uma mensagem genérica única como o Delphi.
- `CONFIRMADO` — nenhum dos dois caminhos Delphi (esta tela e o Cadastro principal) tem checagem de autorização explícita antes da Exclusão física de Orçado (diferente do Cancelamento, que exige `ObterAutorizacao`/`DevolucaoProduto`). A definição de qual Permissão/capability exigir para `ExcluirContratoOrcado` no Laravel fica para o ticket [Definir Permissões, Autorizações, Auditoria e concorrência do lote](07-definir-permissoes-auditoria-concorrencia-lote.md), não redecidida aqui.
