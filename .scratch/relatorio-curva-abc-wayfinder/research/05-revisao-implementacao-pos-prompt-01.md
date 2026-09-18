# Revisao da implementacao pos-prompt 01 da Curva ABC

Data: 2026-09-09  
Baseline: `97376be77`  
Implementacao revisada: `c719f93be` (`abc 1`)

## Resultado

A implementacao avancou a observabilidade e criou testes importantes, mas ainda nao deve liberar o prompt 02. Ha divergencias de contrato e lacunas que podem reproduzir o sintoma de resultado incorreto ou mascarar sua causa.

## Achados confirmados

### 1. Top N divergiu do contrato

O spec 474 exige `quantidade` inteira `>= 1` e default 100. O codigo atual aceita zero como “todos” em `GerarCurvaAbcRequest`, `buildGerarPayload.ts` e no input React; o controller tambem passou a usar default zero. Isso contradiz o spec e muda o contrato sem decisao registrada.

### 2. `raw_row_count` pode virar uma contagem falsa

`LegacyCurvaAbcRepository` le o GUC `teclux.abc_nitens`, mas quando a leitura falha/vem vazia retorna o numero de linhas emitidas. Esse fallback e incorreto quando Top N corta o universo. A funcao legada de 22 parametros tambem nao recebe a mesma instrumentacao da funcao Cloud. O resultado precisa ser erro observavel, nullable com proveniencia explicita ou instrumentacao equivalente, nunca um numero apresentado como universo.

### 3. Proveniencia numerica e declarativa, nao observada

`CurvaAbcService` devolve `numeric_provenance.mapper_null_to_zero = false` como constante. O campo nao demonstra comparacao entre linha crua e linha mapeada e nao distingue nulo real, zero do SQL e perda no mapper.

### 4. Teste de overflow nao testa o overflow alegado

O teste nomeado como caso acima do antigo `numeric(11,2)` usa cinco itens a 50 milhoes e verifica apenas soma maior que 11. O total aproximado de 250 milhoes ainda cabe em `numeric(11,2)`. O teste precisa exceder 999.999.999,99 e verificar resultado positivo/não saturado, ou ser renomeado para sua garantia real.

### 5. Verificacao do corpo SQL e fraca

A fixture verifica apenas se o texto da funcao contem `itens := 1` e `posicao := 1`. Isso pode encontrar declaracoes/atribuicoes fora do ponto de reset. E necessario testar a ordem efetiva ou o comportamento da funcao implantada, alem de provar que a migration foi aplicada.

### 6. A UI pode conservar linhas antigas

No tratamento de erro/404 do `handleGerar`, o estado `result`, `hasGerado` e a assinatura do payload anterior nao sao limpos. Assim uma falha tecnica ou expiracao pode deixar a grade antiga visivel junto do aviso para gerar novamente. O inicio de uma nova geracao tambem deve invalidar o resultado anterior.

### 7. Alteracao compartilhada pode executar job sem rastreamento

`TrackOperationalExecution` passou a continuar o job quando a execucao operacional nao existe em ambiente local. Isso evita falha de infraestrutura, mas permite uma execucao sem o registro que o heavy-reports usa para liveness/auditoria. A politica precisa ser explicita, fail-closed ou fallback instrumentado e testado.

## Evidencias de validacao

- `php -l` passou nos arquivos PHP alterados.
- A suite Vitest focada nao iniciou: o esbuild retornou `spawn EPERM` ao carregar `vitest.config.ts`.
- A suite Laravel nao foi executavel neste ambiente: o vendor exige PHP `>= 8.4.1`, mas o runtime disponivel e PHP `8.2.21`; o Docker tambem nao esta acessivel.
- `git diff 97376be77...c719f93be --check` encontrou whitespace/trailing whitespace principalmente nos SQL exportados e documentos; isso deve ser separado de mudancas funcionais.

## Conclusao

O proximo passo e executar o prompt `03-speckit-prompt-hardening-pos-prompt-01.md`. Ele deve gerar uma especificacao de correcao/aceite, nao alterar o codigo durante o `/speckit.specify`. O prompt 02 deve continuar bloqueado ate o gate PostgreSQL real, o contrato Top N e a limpeza de estado da UI estarem aprovados.
