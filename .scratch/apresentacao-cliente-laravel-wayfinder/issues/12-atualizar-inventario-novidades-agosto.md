# Atualizar inventário de módulos com as novidades desde a última correção (30/07)

Type: task
Status: resolved
Blocked by: 01

## Question

Desde a correção de estado da ticket "Inventariar módulos e menus já liberados no Laravel" (2026-07-30), o que mudou de fato no código (rotas, menus, gates de acesso, telas React) que precisa entrar no inventário do deck? Inspecionar `git log` do Laravel no período, `resources/js/Pages/`, `app/Services/Authorization/*ModuleAccessService.php` e os pacotes de prompts em `modules/` para confirmar o que é módulo real liberado (não apenas spec publicada) e produzir o texto atualizado.

## Answer

Levantamento via `git log --merges` (30/07 a 06/08), `resources/js/Pages/` e os `*ModuleAccessService.php`/middlewares de acesso confirma três blocos novos, todos com tela React real e gate de acesso próprio (não placeholder):

**1. Entregas (domínio novo, décimo domínio do inventário) — Romaneios.** Menu "Entregas e Montagens → Entregas → Romaneios", gate `EntregasRomaneiosModuleAccessService`/`EnsureEntregasRomaneiosModuleAccess`. Cadastro completo do romaneio de entrega/transferência: inclusão múltipla de notas, conferência de volumes, assinatura do recebedor (visualização de assinatura capturada), justificativa de entrega, impressão, e lançamento automático do frete em Contas a Pagar quando aplicável. Primeiro commit em 2026-08-01 (`roman 3` / PR #351 em diante) — inteiramente posterior à última correção do inventário.

**2. Interlojas — três telas novas** (a linha atual do inventário só cita Consulta de Requisições e Requisição para Exposição):
   - **Confirmação por Notas** (`Pages/Interlojas/ConfirmacaoPorNotas`) — confirma nota de transferência entre filiais por seleção em lote, com busca por chave de NF-e.
   - **Confirmação por Romaneios** (`Pages/Interlojas/ConfirmacaoPorRomaneios`) — mesma confirmação em lote, mas por romaneio, com conferência de volumes (F5) e geração de lista (F6).
   - **Consulta de Transferências** (`Pages/Interlojas/ConsultaTransferencias`) — consulta somente leitura das transferências entre filiais.

**3. Contas a Pagar — Relatório de Situação dos Fornecedores.** Tela nova (`Pages/Cadastros/ContasPagar/SituacaoFornecedores`), gate próprio (`ContasPagarSituacaoFornecedoresModuleAccess`), geração assíncrona (job) com PDF final — distinto do "Relatório" genérico já listado no inventário.

Texto atualizado das linhas afetadas (ver adendo aplicado na ticket 01):

- Nova linha de domínio **Entregas**: "Romaneios (Cadastro completo: inclusão múltipla de notas, conferência de volumes, assinatura do recebedor, justificativa de entrega, impressão, integração automática com Contas a Pagar)."
- **Interlojas** passa a ser: "Consulta de Requisições, Requisição para Exposição, Confirmação por Notas, Confirmação por Romaneios, Consulta de Transferências."
- **Contas a Pagar** ganha: "Relatório de Situação dos Fornecedores" na lista de itens.

Nada do que foi encontrado é placeholder (`EmBreve`) — todos têm implementação real, tela e gate de acesso confirmados no código.

**Impacto em outras tickets do mapa:** a contagem de domínios passa de nove para dez — a ticket "Decidir estrutura e roteiro final do deck" cita a lista de domínios de passagem; adendo aplicado lá também para não ficar desatualizada.

Fontes: `git log --merges` do Laravel (30/07–06/08), `backend/resources/js/Pages/Entregas/Romaneios/`, `backend/resources/js/Pages/Interlojas/{ConfirmacaoPorNotas,ConfirmacaoPorRomaneios,ConsultaTransferencias}`, `backend/resources/js/Pages/Cadastros/ContasPagar/SituacaoFornecedores/`, `backend/app/Services/Authorization/EntregasRomaneiosModuleAccessService.php`, `modules/entregas/cadastro-romaneios/README.md`, `modules/interlojas/{confirmacao-por-notas,confirmacao-por-romaneios}/`.
