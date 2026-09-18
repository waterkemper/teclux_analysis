# Especificar ajuste Laravel para elegibilidade por grupos

Type: task
Status: open
Blocked by: issues/03-verificar-paridade-laravel-e-cobertura.md

## Prompt for /speckit.specify — Laravel only

Implemente no Laravel a elegibilidade de planos de pagamento vinculados a `planosgrupos` e `planosclasses` no Cadastro de Orçamentos e no Cadastro de Contratos. A regra é: para um documento com produtos, obtenha no servidor os grupos/classes reais de todas as linhas atuais; um plano restrito só é elegível se cobrir todos os grupos/classes distintos exigidos pelo documento. Exemplo obrigatório: produto do grupo A + produto do grupo B; plano vinculado apenas ao grupo A não pode aparecer, não pode ser selecionado e não pode ser confirmado. Plano sem vínculos deve manter comportamento somente se essa exceção for confirmada como regra legada. Não confie em `grupos/classes` enviados pelo navegador como fonte de autoridade.

Analise e altere somente o Laravel, especialmente `PlanosFinanciamentoFilter`, `SimulacaoFinanciamentoService`, `LegacyPlanosSimulacaoRepository`, `OrcamentoFinanciamentoEmbutidoService`, `ContratoPropostaFinanceiraService` e os componentes/payloads dos Cadastros. Centralize a decisão de elegibilidade, aplique-a na listagem, na resolução de plano explícito, na confirmação, no recálculo e na gravação; cubra também plano à vista e documentos com produto sem grupo/classe conforme decisão documentada. Preserve validade, limites monetários, classes, descontos, juros, parcelas, OCC e demais regras existentes.

Inclua testes automatizados para: plano irrestrito; plano com grupo único compatível; grupo incompatível; mistura de grupos compatível/incompatível; múltiplas linhas no mesmo grupo; produto sem grupo; vínculos de classes; tentativa de confirmar plano inelegível; e paridade entre Orçamento e Contrato. Use os nomes e convenções existentes do projeto e não altere Delphi, banco legado ou regras fora da elegibilidade de planos.

