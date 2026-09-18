# Consolidar prompts SpecKit da reposição ECC

Type: task
Status: resolved
Blocked by: 01, 02, 03, 04, 05, 06, 07

## Question

Como transformar as decisões fechadas da automação da Consulta de Compras em prompts autocontidos para /speckit.specify, seguindo o padrão já adotado em modules, definindo o fatiamento, a sequência de execução, o diretório de publicação, as dependências entre prompts e os limites de cada especificação?

O resultado deve preparar o handoff para implementação no Laravel, sem implementar código neste ticket. Deve preservar o fluxo existente de pedidosfiliais e separar a automação ECC da Consulta de Compras manual.

## Answer

O handoff foi consolidado em quatro prompts incrementais no módulo existente modules/estoque/consulta-compras/, numerados a partir do prompt 12 para não misturar a automação com os prompts anteriores da Consulta manual:

- [12-speckit-prompt-reposicao-ecc-fundacao-orquestracao.md](../../../modules/estoque/consulta-compras/12-speckit-prompt-reposicao-ecc-fundacao-orquestracao.md) — rotinas, configuração, scheduler, execução, snapshot, lotes e idempotência;
- [13-speckit-prompt-reposicao-ecc-calculo-alocacao.md](../../../modules/estoque/consulta-compras/13-speckit-prompt-reposicao-ecc-calculo-alocacao.md) — filtros, M/D/U/F/O/C, máximo 0/9999, concentração, fontes, excedente e urgência;
- [14-speckit-prompt-reposicao-ecc-revisao-confirmacao.md](../../../modules/estoque/consulta-compras/14-speckit-prompt-reposicao-ecc-revisao-confirmacao.md) — tela própria, revisão parcial, autenticação de gerente e confirmação pelo núcleo existente de pedidosfiliais;
- [15-speckit-prompt-reposicao-ecc-excecoes-indicadores.md](../../../modules/estoque/consulta-compras/15-speckit-prompt-reposicao-ecc-excecoes-indicadores.md) — fila persistente de exceções, alertas, auditoria, baseline e indicadores.

Os prompts são autocontidos para /speckit.specify, citam o mapa e as evidências Laravel, não implementam código e deixam explícito que jobs não gravam estoque nem confirmam pedidosfiliais diretamente.
