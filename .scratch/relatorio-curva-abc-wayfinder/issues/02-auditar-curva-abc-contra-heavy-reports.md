# Auditar a geração Laravel da Curva ABC contra o padrão recente de heavy-reports

Type: research
Status: resolved

## Question

Como a rota atual `/cadastros/estoque/relatorios/curva-abc`, o `CurvaAbcService`, `GerarCurvaAbcJob`, `GerarJobStore`, cancelamento PostgreSQL, página Inertia e grid se comportam em relação ao padrão recente de `heavy-reports` do Laravel? Identificar capacidades já corretas, seams a preservar, divergências reais e lacunas de durabilidade, execução gerenciada, idempotência, retry, cancelamento, timeout, progresso, observabilidade, autorização, retenção e recuperação, com referências concretas e sem propor uma reescrita genérica.
## Comments

- Research artifact: .scratch/relatorio-curva-abc-wayfinder/research/02-curva-abc-heavy-reports.md
## Answer

Pesquisa consolidada em [02-curva-abc-heavy-reports.md](../research/02-curva-abc-heavy-reports.md). A Curva ABC ja usa dispatcher gerenciado, OperationalExecution, fila heavy-reports, checkpoints, progresso e reconciliacao; a especificacao deve preservar esse seam em vez de criar outro pipeline.

As lacunas confirmadas sao: o resultado do GerarJobStore e operacional/temporario e nao uma fotografia relacional duravel; heartbeat durante SQL longo nao esta fechado; retencao do resultado, escopo ambiental da idempotencia e alinhamento entre worker manual e Horizon precisam de contrato explicito. Tambem nao existe operacao Laravel para persistir produtos.resultadocurvaabc.
