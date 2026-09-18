# Definir o contrato operacional da Geração da Curva ABC em heavy-reports

Type: grilling
Status: resolved
Blocked by: 02, 04

## Question

Qual é o contrato final da Geração da Curva ABC sobre o padrão recente de `heavy-reports`: identidade e idempotência da intenção, estados e histórico duráveis, fotografia canônica do resultado, progressão/heartbeat, cancelamento real, retry/reconciliação, timeout/retry-after, autorização por Filial, retenção, visualização/exportação e relação entre geração e gravação persistente? Fixar somente mudanças específicas necessárias para Curva ABC, preservando o que já está correto.
## Answer

Decisao confirmada pelo usuario: a Curva ABC reutiliza o pipeline heavy-reports existente, mas o resultado e efemero e orientado a tela. Nao sera criado historico de negocio, Fotografia persistente, tabela propria de geracoes, retencao de resultado, PDF, impressao ou Excel neste escopo.

- F6 gera e entrega o resultado corrente na grade.
- GerarJobStore/blob serve apenas ao polling e ao tempo tecnico necessario para entregar o resultado.
- Estados operacionais seguem queued, running, ready, failed, cancelled e expired; cancelamento nao publica parcial; retry cria nova geracao; stale exige reconciliacao.
- Progresso e por fase, sem percentual falso durante SQL longo; heartbeat e evidencia de liveness, nao precisao artificial.
- Idempotency-Key e escopada por ambiente/usuario/payload normalizado; retry deliberado cria nova geracao.
- Gerar usa Filiais efetivamente autorizadas; Gravar e capacidade separada e exige escopo global.
- Gravar exige job ready, resultado do usuario/ambiente autorizado, payload de modo por Produto e resultado nao vazio. Resultado perdido, cancelado ou expirado exige gerar novamente.
- A substituicao global de resultadocurvaabc ocorre em uma unica transacao PostgreSQL.

O contrato nao adiciona uma arquitetura paralela: preserva dispatcher, fila, job, polling, cancelamento e reconciliacao atuais e limita a mudanca ao necessario para Curva ABC.
