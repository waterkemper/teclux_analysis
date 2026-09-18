# Revisao da implementacao do prompt 04

## Escopo e ponto de comparacao

- Checkout revisado: `C:\teclux_analysis\laravel`.
- Ponto anterior: `b3c466a7f` (`abc 2`).
- Implementacao revisada: `3e20ee167` (`abc 4`), diff `b3c466a7f...3e20ee167`.
- Revisao estatica dos eixos Standards e Spec, com verificacao de sintaxe PHP e `git diff --check`.
- O PHPUnit nao executou neste host: o binario exige PHP >= 8.3 e o host possui PHP 8.2.21. O aceite PostgreSQL continua dependente do container/ambiente alvo.

## Resultado

**CONCLUSAO: ainda nao liberar a Curva ABC.** O prompt 04 corrigiu varios pontos importantes, mas deixou bloqueios de transacao, auditoria pos-commit e evidencia de aceite.

## Achados confirmados

### P0 - corrida de unique violation aborta a transacao PostgreSQL

**Evidencia:**

- `backend/app/Application/Estoque/CurvaAbc/CurvaAbcGravacaoIdempotencyGuard.php:103-143` faz `insert`, captura `QueryException` de unique violation e consulta a mesma conexao/transacao em seguida.
- `backend/app/Infrastructure/Persistence/Cloud/Estoque/CloudCurvaAbcGravacaoMutexRepository.php:94-112` faz o mesmo em `ensureRow()`; ele e chamado dentro da transacao principal de `lockAndAdvanceIfUnchanged()`.
- Em PostgreSQL, `23505` aborta a transacao corrente. O `catch` nao a recupera; o `find`/`SELECT FOR UPDATE` seguinte pode falhar com `current transaction is aborted`.
- `CurvaAbcGravarConcorrenciaPostgresTest::test_c1_mutex_unique_reread_not_opaque_500` cria a linha antes da chamada do repositorio. Portanto, nao dispara a corrida real dentro de `ensureRow()` e nao prova o caso que pretende cobrir.

**Classificacao:** CONFIRMADO; bloqueio critico de concorrencia/idempotencia.

**Correcao necessaria:** usar `INSERT ... ON CONFLICT DO NOTHING`/equivalente atomico, savepoint explicito ou uma estrategia de reserva que nao continue uma transacao abortada. Cobrir com duas sessoes que tentem criar a primeira linha da idempotencia e a primeira linha do mutex.

### P0 - auditoria pos-commit pode ficar inconsistente

**Evidencia:**

- `GravarCurvaAbcClassificacaoCommand.php:256-288` marca a reserva como `succeeded` em `complete()` antes de chamar `auditoria->append()`.
- Se `append()` falhar, o endpoint devolve `503`, mas a linha de idempotencia permanece `succeeded`; nao ha estado/marker explicito de auditoria pendente.
- O teste R6 injeta falha imediatamente apos o commit, mas nao injeta falha no writer de auditoria e nao verifica que o primeiro evento de sucesso foi preservado/compensado.
- O retry pode retornar replay e gravar outro evento, mas isso nao prova que o evento original, o estado e a resposta formam um protocolo consistente.

**Classificacao:** CONFIRMADO; bloqueio de contrato de auditoria e recuperacao.

**Correcao necessaria:** definir um estado persistente para `aplicado_sem_auditoria`/`audit_pending` ou tornar o registro de sucesso e a auditoria uma operacao recuperavel e idempotente. O retry deve reparar o bookkeeping sem repetir o UPDATE de Produtos e sem duplicar um sucesso logico.

### P1 - contagens aceitam numeros nao inteiros

**Evidencia:**

- `GravarCurvaAbcClassificacaoCommand.php:110-123` usa `is_numeric()` e depois faz cast para `int` em `row_count` e `raw_row_count`.
- Valores como `1.5` ou notacao exponencial podem ser aceitos e truncados, apesar do contrato exigir contagens inteiras.

**Classificacao:** CONFIRMADO; divergencia de contrato e risco de envelope adulterado.

**Correcao necessaria:** validar tipo/representacao inteira estrita, limites e relacao `0 < row_count <= raw_row_count`, com testes para decimal, exponencial, negativo, `null` e string numerica valida.

### P1 - canonizacao TypeScript ignora linha invalida

**Evidencia:**

- `resources/js/Pages/Cadastros/Estoque/Relatorios/CurvaAbc/curvaAbcGravar.ts:5-10` usa `continue` quando `codigo <= 0` ou `tipo == null`.
- O PHP rejeita a mesma estrutura, mas o helper client-side mascara a linha e calcula digest de um subconjunto.

**Classificacao:** CONFIRMADO; divergencia entre cliente e servidor.

**Correcao necessaria:** falhar explicitamente em qualquer linha invalida e testar codigo zero/negativo, tipo nulo/invalido e duplicata.

### P1 - ambiente sem carimbo explicito no job ainda e aceito por fallback

**Evidencia:**

- `GravarCurvaAbcClassificacaoCommand.php:346-368` aceita job sem `environment` quando encontra `OperationalExecution` compativel.
- O contrato D2 do prompt 04 exige `environment` presente e exatamente igual no envelope; o fallback e uma excecao de compatibilidade nao refletida na matriz.

**Classificacao:** DIVERGENTE; pode ser decisao valida, mas nao esta fechada pelo contrato.

**Correcao necessaria:** remover o fallback ou documenta-lo como excecao temporal, com teste que diferencie job sem carimbo, carimbo errado e execucao operacional compativel. A especificacao nao pode simultaneamente exigir campo presente e aceitar sua ausencia.

### P1 - matriz e evidencia E1 ainda nao demonstram o aceite completo

**Evidencia:**

- `CurvaAbcGravarPostgresTest` abre uma transacao em `setUp()`; isso impede que esse arquivo prove visibilidade/commit externo como gate de producao.
- O teste C1 insere a linha do mutex antes da chamada; nao e uma corrida de duas chamadas ao repositorio.
- A matriz atual nao possui teste dedicado para falha do writer de auditoria, job expirado/blob ausente, corrida real de insercao da idempotencia e concorrencia comando Laravel x comando Laravel.
- `CurvaAbcTopNFixture` declara comentario sobre 2026, mas usa periodo de fixture 2098. Isso e aceitavel para isolamento somente se o registro E1 tambem reproduzir explicitamente o incidente original ou documentar a equivalencia.
- `contracts/evidencia-aceite.md` registra uma execucao falha, mas o campo “Matriz verde neste run” nao contem log, timestamp completo, SHA do checkout efetivamente executado nem relacao teste-resultado suficiente para ser um artefato reprodutivel.

**Classificacao:** CONFIRMADO como cobertura ausente; bloqueio de aceite, nao necessariamente defeito de producao.

## Verificacoes executadas

- `php -l` passou nos arquivos PHP alterados/relevantes.
- `git diff --check b3c466a7f...3e20ee167` encontrou whitespace nos artefatos gerados do SpecKit; isso e um achado de padrao, nao a causa funcional do incidente.
- PHPUnit nao foi executado no host por incompatibilidade PHP 8.2.21 versus requisito PHP >= 8.3.
- O working tree Laravel possui apenas a alteracao preexistente e nao relacionada em `backend/resources/js/Pages/Prototype/TemaEscuroRepresentativoPrototype.tsx`.

## Decisao

Criar o prompt 05 para corrigir as transacoes abortadas, fechar o protocolo de auditoria pos-commit, alinhar validacao cliente/servidor e produzir uma evidencia E1 realmente reproducivel. Nao alterar Delphi, formula `abc_prod`, leitores downstream ou o schema legado sem evidencia nova.
