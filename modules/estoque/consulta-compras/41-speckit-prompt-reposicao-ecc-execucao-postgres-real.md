# Prompt 41 - Tornar executável a prova PostgreSQL do vínculo ECC

## Contexto

O Prompt 40 foi implementado no commit `19c8cff8` (`ecc 40`). A lógica de normalização de filial foi incorporada e a suíte SQLite passou com **40 testes e 175 asserções**.

Entretanto, `ReposicaoEccAlertaVinculoPostgresTest` foi executado como **1 skipped** no ambiente atual. O teste PostgreSQL existe, mas o `phpunit.xml` força `DB_CONNECTION=sqlite` e o teste apenas faz skip quando o driver não é `pgsql`. Assim, o comando documentado para o grupo PostgreSQL não garante execução real; também não há validação da versão do servidor.

Esta fatia é de evidência/infraestrutura de teste. Não reabrir cadastro de Rotinas, agenda, snapshot, cálculo, confirmação, pedidosfiliais, lógica de vínculo, migration, coluna, índice ou DDL de produto. Não misturar com o Prompt 37 da frente F10.

## Achados confirmados

### 1. O teste PostgreSQL pode nunca sair do SQLite

`backend/phpunit.xml` define `DB_CONNECTION=sqlite` com `force="true"`. O teste `ReposicaoEccAlertaVinculoPostgresTest` exige `pgsql` no `setUp` e, por isso, a execução padrão documentada termina em skip antes de executar `list`, `find` e `count` no PostgreSQL.

### 2. “PostgreSQL 9.5/9.6” não é verificado

Mesmo em um ambiente com driver `pgsql`, o teste atual não verifica `server_version_num`. Um PostgreSQL moderno poderia passar pelo teste, sem provar compatibilidade com as versões legadas exigidas pelo contrato.

### 3. A prova atual mistura inspeção de SQL com execução real

O teste faz regex em `toSql()` e depois executa operações. A regex é útil como guarda, mas não substitui execução das consultas em cada versão PostgreSQL, especialmente para `HAVING`, `NOT EXISTS`, comparação de UUID e subconsultas correlacionadas.

## Objetivo

Permitir que a prova de vínculo ECC rode de forma determinística contra PostgreSQL real 9.5 e 9.6, sem quebrar a suíte SQLite padrão, e registrar claramente quando a prova não foi executada.

## Alterações obrigatórias

### A. Separar configuração SQLite e PostgreSQL

1. Manter o `phpunit.xml` padrão em SQLite para a suíte rápida.
2. Criar configuração/comando específico para o grupo PostgreSQL ou outro mecanismo equivalente que permita definir `DB_CONNECTION=pgsql` sem ser sobrescrito por `force="true"`.
3. O comando documentado em `quickstart.md` deve realmente selecionar a conexão PostgreSQL e falhar quando o serviço/banco não estiver disponível, em vez de passar silenciosamente com skip.
4. Não alterar migrations de produto nem criar DDL específico da funcionalidade ECC para viabilizar o teste.

### B. Executar nos dois alvos de versão

1. Configurar CI/ambiente oficial para executar `ReposicaoEccAlertaVinculoPostgresTest` contra PostgreSQL 9.5 e 9.6, ou documentar dois jobs equivalentes.
2. No início do teste, consultar `SHOW server_version_num` e aceitar somente versões dentro de 90500–90699.
3. Se o teste for executado em outra versão deliberadamente, criar um teste separado de smoke, sem chamar isso de prova 9.5/9.6.
4. O job deve falhar por configuração ausente ou conexão inválida; skip deve ser reservado para a suíte SQLite padrão, não para o comando oficial PostgreSQL.

### C. Cobrir execução real das consultas

1. Executar de fato `CloudReposicaoEccAlertaRepository::list`, `find` e `countNaoReconhecidos` no PostgreSQL, não apenas obter `toSql()`.
2. Manter os cenários:
   - candidato UUID confiável;
   - dois candidatos iguais e escolha por `NOT EXISTS`/ordenação;
   - conflito NULL + UUID;
   - todos nulos ou filial normalizada para zero;
   - filial nula/preenchida quando o schema/test fixture permitir;
   - snapshot com precedência sobre janelas conflitantes;
   - vínculo persistido nulo e preenchimento pelo alvo.
3. Comparar o envelope real com o resolver: Rotina, nome, filial, `agregado` e elegibilidade.
4. Manter uma linha por alerta e contagem unitária.
5. A regex de ausência de `MIN/MAX` pode permanecer como assertiva auxiliar, mas não deve ser a única prova de compatibilidade.

### D. Documentar o gate de execução

Atualizar `specs/454-fix-ecc-vinculo-gate/quickstart.md` e, se existir nota correspondente, a documentação de arquitetura com:

- configuração usada para SQLite;
- configuração usada para PostgreSQL;
- comandos para PostgreSQL 9.5 e 9.6;
- critério de versão (`server_version_num`);
- diferença entre teste executado e teste skipped na suíte padrão;
- resultado esperado e política de falha do CI.

## Testes obrigatórios

1. Suíte padrão SQLite permanece verde e não tenta se conectar a PostgreSQL.
2. Job PostgreSQL 9.5 executa o teste, não faz skip e valida list/find/count.
3. Job PostgreSQL 9.6 executa o teste, não faz skip e valida list/find/count.
4. PostgreSQL fora da faixa é rejeitado explicitamente pelo teste de compatibilidade.
5. Ausência do serviço PostgreSQL faz o comando oficial falhar claramente.
6. Os envelopes e desfechos dos cenários da matriz são iguais entre PostgreSQL 9.5, 9.6, SQLite e resolver PHP.
7. Regressão ECC 438–454, Pint e TypeScript quando aplicável.
8. Confirmar zero migration, zero DDL de produto, zero alteração de snapshot/fatos históricos e zero ramo novo por `tipo`.

## Não fazer

- não considerar um teste skipped como prova PostgreSQL;
- não forçar SQLite no comando do grupo PostgreSQL;
- não validar somente por regex da SQL;
- não declarar compatibilidade 9.5/9.6 executando apenas PostgreSQL moderno;
- não alterar schema/migration de produto para fabricar o ambiente;
- não misturar este prompt com F10;
- não reabrir a lógica funcional já corrigida nos Prompts 37–40.

