# Revisao das implementacoes dos prompts 03 e 02

Data: 2026-09-09  
Baseline: `c719f93be` (`abc 1`)  
Commits revisados: `2c02295b2` (`abc 3`) e `b3c466a7f` (`abc 2`)

## Resultado

As implementacoes adicionaram o hardening da geracao e o comando de gravacao, mas o aceite final ainda esta bloqueado. A especificacao 475/476 declara mais cobertura e garantias do que o codigo e os testes demonstram.

## Achados confirmados

### 1. Top N ainda diverge na tela

`GerarCurvaAbcRequest` e `buildGerarPayload` exigem minimo 1, mas `Index.tsx` continua renderizando `min={0}` e a mensagem `0 = todos os registros`. Isso oferece ao operador um contrato que o backend rejeita.

### 2. Gravar nao restringe explicitamente o job ao relatorio Curva ABC

`GravarCurvaAbcClassificacaoCommand` valida usuario, ambiente quando presente e status, mas nao exige `report_key === curva_abc` nem confirma o `job_id` dentro do envelope. Um `ready` de outro relatorio, se possuir linhas com `codigo`/`tipo`, pode chegar ao digest e ao writer.

### 3. Metadados do resultado nao sao validados de forma fechada

O comando bloqueia apenas quando `universe_count_available` existe e e `false`. Campo ausente, `row_count` divergente de `count(rows)`, ambiente ausente ou envelope sem identidade da geracao nao sao recusados explicitamente. A UI tambem nao considera `universe_count_available` ao habilitar Gravar.

### 4. Entrada cliente e digest permitem perdas silenciosas

`GravarCurvaAbcClassificacaoRequest::clientRows()` converte array vazio em `null`, portanto um `rows: []` enviado nao e comparado ao snapshot. `CurvaAbcSnapshotDigest` colapsa repeticoes do mesmo `codigo` quando a letra coincide; isso pode esconder duplicata estrutural em vez de rejeitar a linha.

### 5. Idempotencia concorrente tem corrida

O `ownerToken` e deterministico para o mesmo usuario/chave/digest. Em estado `pending`, outra requisicao com a mesma intencao e tratada como o mesmo owner e retorna `new`; as duas podem executar a transacao. `complete()` e `fail()` nao verificam owner/lease/status vigente, permitindo que worker antigo altere a reserva de uma tentativa posterior.

O replay de uma chave concluida tambem compara somente hash, ambiente e chave; nao vincula explicitamente operador/job da reserva ao solicitante.

### 6. Matriz PostgreSQL obrigatoria nao foi implementada integralmente

`CurvaAbcGravarPostgresTest` cobre principalmente G1/G7/G8/G9/G10 e uma verificacao sequencial de versao. Nao ha prova de duas conexoes concorrentes, replay idempotente no PostgreSQL, expiração/blob perdido completo, leitores downstream G15 ou corrida de criação do mutex. O teste M5/M6 da geração usa valores nulo/zero construídos no mapper, não uma fixture PostgreSQL com nulo/zero real. Os modos 1/2 no caso 4500 validam contagem, mas não métrica positiva.

### 7. Pré-voo SQL continua baseado em busca textual fraca

`CurvaAbcTopNFixture::assertDeployedFunctionBody()` procura o primeiro `set_config` e depois qualquer ocorrência de `itens := 1`/`posicao := 1`; não prova que o reset está na ordem correta imediatamente antes da segunda leitura.

## Validacao executada

- `php -l` passou em todos os PHP alterados desde `c719f93be`.
- `git diff c719f93be...HEAD --check` encontrou trailing whitespace nos artefatos de especificação/documentação.
- A suíte Laravel/Vitest continua dependente do ambiente Docker/PHP do projeto; o ambiente local anterior não tinha PHP 8.4.1 nem Docker acessível. O gate PostgreSQL não foi considerado aprovado por inspeção estática.

## Conclusao

O próximo passo é executar `04-speckit-prompt-aceite-pos-prompts-03-02.md` antes de declarar a Curva ABC pronta ou usar Gravar em produção. Não foram feitas alterações no código da aplicação nesta revisão.
