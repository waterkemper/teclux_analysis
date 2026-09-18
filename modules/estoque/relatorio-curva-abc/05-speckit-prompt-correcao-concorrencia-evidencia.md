# Prompt para /speckit.specify - Corrigir concorrencia PostgreSQL e fechar evidencia E1

## Objetivo

O prompt 04 em /mnt/c/teclux_analysis/modules/estoque/relatorio-curva-abc/ foi implementado no checkout Laravel no commit `3e20ee167`, mas a revisao `07-revisao-implementacao-prompt-04.md` encontrou bloqueios que impedem declarar a Curva ABC pronta. Produza uma especificacao de correcao e aceite para resolver os achados abaixo. Este prompt nao implementa codigo durante `/speckit.specify`.

## Leituras obrigatorias

- `/mnt/c/teclux_analysis/modules/estoque/relatorio-curva-abc/README.md` e `dossie.md`;
- `/mnt/c/teclux_analysis/.scratch/relatorio-curva-abc-wayfinder/research/07-revisao-implementacao-prompt-04.md`;
- `specs/477-fix-curva-abc-closeout/*`;
- `backend/app/Application/Estoque/CurvaAbc/CurvaAbcGravacaoIdempotencyGuard.php`;
- `backend/app/Infrastructure/Persistence/Cloud/Estoque/CloudCurvaAbcGravacaoMutexRepository.php`;
- `backend/app/Application/Estoque/CurvaAbc/GravarCurvaAbcClassificacaoCommand.php`;
- os testes atuais Top N, Gravacao, concorrencia PostgreSQL e os helpers TypeScript de Gravar.

Revalide os caminhos e os contratos no checkout vigente. Separe falha comprovada, risco inferido e cobertura ausente. Nao reescreva a formula legada nem altere Delphi.

## Correcoes obrigatorias da nova especificacao

### 1. Tornar corridas de insercao seguras no PostgreSQL

- Nao capturar `23505` e continuar usando a mesma transacao abortada.
- Definir uma estrategia atomica para a primeira linha de idempotencia e para a primeira linha do mutex: `ON CONFLICT DO NOTHING`, savepoint corretamente liberado ou equivalente que preserve o estado transacional.
- Manter owner aleatorio por request, pending `409`, takeover somente apos lease, e protecao contra `complete`/`fail` do worker antigo.
- Testar com duas conexoes PostgreSQL reais que concorram pela primeira criacao da mesma chave. A sessao perdedora deve receber pending/replay conforme o estado observado, nunca `500` por transacao abortada.
- Testar a corrida real de `ensureRow()` do mutex dentro da transacao que depois faz `SELECT FOR UPDATE`; o teste nao pode preinserir a linha e chamar o metodo apenas no caminho `exists=true`.

### 2. Fechar o protocolo de commit, idempotencia e auditoria

- Modelar explicitamente o caso em que Produtos foi aplicado, mas `complete()` ou a auditoria falhou.
- A primeira resposta deve informar `503`/incompleto sem declarar sucesso confirmado.
- Um retry com a mesma intencao deve reparar bookkeeping e auditoria sem repetir o replace/update material de Produtos.
- O estado persistido e os eventos de auditoria devem permitir distinguir sucesso confirmado, aplicado sem auditoria, falha antes do commit, conflito e replay.
- Tornar a escrita de auditoria idempotente por uma chave logica adequada, ou definir compensacao/reparacao verificavel; nao aceitar apenas “inserir outro evento” como prova.
- Adicionar teste que injete falha especificamente no writer de auditoria depois do commit, valide a resposta, o estado da reserva, a ausencia de segundo UPDATE e a auditoria apos retry.

### 3. Validar contagens e digest de forma estrita

- `row_count` e `raw_row_count` devem ser inteiros representados estritamente, nao decimal ou exponencial truncado.
- Exigir `0 < row_count <= raw_row_count`, `row_count === count(rows)` e `universe_count_available === true`.
- Cobrir `1.5`, `1e2`, negativo, `null`, string inteira valida e overflow de faixa.
- Fazer o helper TypeScript rejeitar linha com codigo zero/negativo, tipo ausente/invalido e duplicata; nunca usar `continue` silencioso.
- Manter digest de 64 caracteres hexadecimais, comparacao corpo/header e rejeicao de `rows: []` enviado explicitamente.

### 4. Resolver definitivamente o contrato de environment

Escolher e registrar uma unica regra:

- exigir `job.environment` presente e igual ao ambiente da sessao; ou
- manter o fallback por `OperationalExecution` como excecao de compatibilidade, com prazo/condicao clara e contrato atualizado.

Em qualquer escolha, testar job sem environment, environment divergente, environment correto e execucao operacional divergente. Nenhum caso pode permitir gravacao em ambiente errado.

### 5. Produzir evidencia E1 reprodutivel

- Separar testes unitarios/HTTP de testes de aceite PostgreSQL sem `beginTransaction` global que oculte commit, visibilidade, trigger ou concorrencia.
- Cobrir, com skip bloqueante fora de `pgsql`: Top N 4500/100 nos modos 0, 1 e 2 com metricas positivas; Top N zero; identidade/TTL/blob; digest; G1/G8-G17; C1/C2; takeover; corrida real de idempotencia e mutex; falha de auditoria pos-commit.
- Registrar data/hora ISO, branch e SHA realmente executados, imagem/container, `php -v`, driver, funcao/migration vigente, comando exato, resultado por teste e bloqueio de infraestrutura.
- O periodo 2098 da fixture pode ser usado para isolamento, mas o artefato deve registrar como ele reproduz o incidente de 2026-03-01 a 2026-09-01 e incluir evidencia de que nao ha mistura de dados de producao.
- Checkbox em `tasks.md`, `php -l`, mock de `fetchRows` ou suite SQLite nao contam como aceite dos gates PostgreSQL.

## Matriz minima de aceite

| Grupo | Prova minima |
|---|---|
| TX-1 | corrida de primeira insercao da reserva idempotente, duas sessoes, sem transacao abortada |
| TX-2 | corrida de primeira insercao do mutex seguida de lock/update na mesma operacao |
| TX-3 | worker antigo nao completa/falha takeover do novo owner |
| AUD-1 | falha do writer de auditoria apos commit, resposta incompleta e estado observavel |
| AUD-2 | retry repara auditoria/bookkeeping sem segundo update material |
| META-1 | contagens estritamente inteiras e relacao row/raw |
| META-2 | helper TS e PHP rejeitam as mesmas linhas invalidas |
| ENV-1 | job sem/divergente/correto conforme regra escolhida |
| E1 | formulario reproducivel com comando, SHA, ambiente, driver e resultado real |

## Fora de escopo

- Nao alterar Delphi, formula `abc_prod`, leitores downstream ou trigger legada sem evidencia especifica.
- Nao criar historico ou fotografia persistente da geracao.
- Nao substituir PostgreSQL por SQLite/mock nos gates de atomicidade, trigger, concorrencia, idempotencia ou auditoria.
- Nao declarar pronto apenas porque todos os itens de `tasks.md` estao marcados.

## Saida esperada do SpecKit

Produza `spec.md`, `plan.md`, `tasks.md`, contrato de estados/auditoria, matriz PostgreSQL e atualizacao do formulario E1. A especificacao deve declarar explicitamente os criterios que ainda bloqueiam o aceite e so pode liberar a Curva ABC quando a evidencia E1 reproduzivel estiver verde no ambiente PostgreSQL alvo.
