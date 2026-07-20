# Definir a experiência da tela (filtros, seleção, confirmações, resultado por item)

Type: grilling
Status: resolved
Blocked by: 04-definir-resolucao-cancelar-excluir-abas, 05-reconciliar-contrato-cancelamento-lote, 06-definir-contrato-exclusao-fisica-lote, 07-definir-permissoes-auditoria-concorrencia-lote

## Question

Como a experiência Laravel deve reproduzir (ou melhorar sem quebrar) filtros (Filial/Vendedor/Cliente/Data), seleção múltipla com contadores/totais, modal de Motivo, confirmação final e apresentação de resultado detalhado por Contrato (sucesso, já cancelado, não elegível, sem permissão, conflito, falha)?

## Answer

### Filtros e listagem

- `CONFIRMADO/replicar` — Filial, Vendedor, Cliente, Data de emissão continuam como filtros de listagem, sem alteração de comportamento.
- `DECISÃO NOVA` (já fixada no ticket [Definir a resolução Cancelar × Excluir × abas Orçados/Reservados/Faturados](04-definir-resolucao-cancelar-excluir-abas.md)) — o filtro de Situação vira um controle de escolha única (radio/segmented), substituindo as três telas/abas do Delphi por uma única tela, sem nunca misturar Situações na mesma listagem/execução.

### Seleção

- `CONFIRMADO/replicar` — seleção por checkbox por linha, "selecionar todos", contadores de quantidade e total geral versus marcados — mesmo padrão do Delphi (`edtQtdeContratos`/`edtQtdeMarcados`/`edtTotalContratos`/`edtTotalMarcados`), sem mudança.

### Motivo e descrição

- `CONFIRMADO` (já fixado no ticket [Reconciliar o contrato atômico de Cancelamento em lote](05-reconciliar-contrato-cancelamento-lote.md)) — Motivo via lookup, opcional; descrição aparece e passa a ser exigida somente quando `ObrigarDigitacaoaoExcluir` estiver ativo.

### Modo Perguntar (`P`)

- `DECISÃO NOVA` — no modo `Perguntar`, a escolha entre Cancelar/Excluir continua sendo **única para o lote inteiro selecionado**, replicando fielmente o Delphi (`ctCANCELARCONTRATOORCADO`) — não uma escolha por Contrato individual dentro da mesma leva. Como consequência, a ação resolvida é sempre **homogênea** dentro de uma mesma confirmação (nunca mistura Cancelar/Excluir na mesma execução), o que simplifica a confirmação abaixo.

### Confirmação final

- `DECISÃO NOVA` — a confirmação é um resumo simples com contagem e ação ("N contratos serão cancelados"/"N contratos serão excluídos"), sem listar cada Contrato de novo dentro do modal — a grade da tela já é a lista. Isso já é uma melhoria pontual sobre o Delphi (que hoje não informa nem a contagem), sem inventar uma interação nova.

### Resultado pós-execução

- `DECISÃO NOVA` — a **API/backend continua retornando o resultado tipado por item** (sucesso, já cancelado, não elegível, bloqueio financeiro/fiscal/devolução/estoque/logística/vínculo, sem permissão, conflito de `revision`, falha), exatamente como já fixado nos tickets [Definir a resolução Cancelar × Excluir × abas Orçados/Reservados/Faturados](04-definir-resolucao-cancelar-excluir-abas.md) e [Definir Permissões, Autorizações, Auditoria e concorrência do lote](07-definir-permissoes-auditoria-concorrencia-lote.md) — isso não muda.
- `DECISÃO NOVA` — a **tela**, no entanto, não precisa renderizar um relatório completo de todos os tipos de resultado: deve exibir pelo menos a **lista dos Contratos que tiveram sucesso** (cancelados/excluídos), servindo tanto de confirmação visual quanto de registro imediato do que foi processado. O restante do detalhamento por item (bloqueios, falhas, conflitos) fica disponível via API/resposta, sem exigência de UI dedicada nesta primeira versão — mais simples que meu relatório completo recomendado, mas menos genérico que a mensagem única do Delphi.
