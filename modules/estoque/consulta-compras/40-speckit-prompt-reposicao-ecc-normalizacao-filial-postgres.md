# Prompt 40 - Fechamento da normalização de filial e prova PostgreSQL ECC

## Contexto

O Prompt 39 foi implementado no commit `8a86a3d0` (`ecc 39`), sobre o `be059b68` (`ecc 38`). A revisão confirmou a remoção de agregações UUID da seleção canônica e a proteção do alvo histórico no upsert. A suíte direcionada passou com **39 testes e 152 asserções**.

Ainda há uma divergência de representação para filial nula e a compatibilidade PostgreSQL continua sem prova de execução real. Não reabrir cadastro de Rotinas, agenda, snapshot, cálculo, confirmação, pedidosfiliais, migration, coluna, índice ou DDL. Não misturar esta tarefa com o Prompt 37 da frente F10.

## Achados confirmados

### 1. Resolver PHP e `mapRow` representam filial nula de forma diferente

`ReposicaoEccAlertaVinculoPares::classificar` normaliza `filial_requisitante = NULL` para `0`, e `fromLote`/`fromJanela` também fazem cast para inteiro. Porém, em `CloudReposicaoEccAlertaRepository::mapRow`, `filial_alvo = NULL` permanece `NULL` (`:576-613`).

Isso diverge nos casos ainda não cobertos pela matriz:

- candidato com Rotina nula e filial nula;
- candidato com Rotina viva e filial nula;
- alerta com alvo materializado e filial nula;
- alvo sem vínculo e alerta persistido nulo.

No segundo caso, o resolver pode marcar o vínculo como não confiável porque `0` não coincide com a filial da Rotina viva, enquanto `mapRow` considera o alerta confiável apenas porque a Rotina existe (`:587`). No primeiro caso, o envelope pode alternar entre filial `0` e `NULL` conforme a superfície.

O contrato exige que resolver, seleção SQL, `mapRow`, filtro, contagem, detalhe e reconhecimento usem uma representação única, sem perder a distinção de pares exigida pela política.

### 2. A prova PostgreSQL ainda é indireta

O teste `test_base_query_nao_agrega_uuid` apenas inspeciona a SQL por expressão regular e a suíte padrão usa SQLite. Isso não prova que a consulta com `NOT EXISTS`, comparação `id < id`, subconsultas correlacionadas e `HAVING COUNT` execute no PostgreSQL 9.5/9.6 real.

O contrato do Prompt 39 exige validação no banco legado. A existência de um teste de schema PostgreSQL separado não cobre a execução destas consultas do read model de alertas.

## Objetivo

Eliminar a divergência de filial nula entre domínio e read model e criar uma prova executável de compatibilidade da consulta canônica no PostgreSQL 9.5/9.6, preservando a semântica de agregado e de conflito.

## Alterações obrigatórias

### A. Uma única representação de filial

1. Escolher, com base na política já vigente (`filial nula → 0` nos pares), uma representação canônica para o envelope de candidatos e aplicá-la de maneira uniforme.
2. Alinhar `mapRow`, `FILIAL_ALVO`, `excludeDivergentes`, `whereDivergenciaAusenteCorrelacionada`, `applyEscopoFiliais`, reconhecimento e resolver.
3. Garantir que:
   - Rotina nula + filial nula produza o mesmo envelope em PHP e SQL;
   - Rotina nula + mesma filial nula repetida seja um único par coerente;
   - filial nula + filial preenchida distinta seja conflito;
   - Rotina viva + filial nula seja classificada como não confiável se a normalização não coincidir com a filial da Rotina;
   - alerta agregado explícito continue distinto de alvo materializado com filial ausente.
4. Não corrigir a divergência usando fallback para `a.filial_requisitante` quando há alvo materializado.
5. Preservar `a.id`, `a.alvo_id`, fatos, snapshots e a semântica já aceita de filial vazia para agregado.

### B. Teste real do read model no PostgreSQL legado

1. Criar ou habilitar teste marcado `@group postgres` que execute de fato `list`, `find` e `countNaoReconhecidos` contra PostgreSQL 9.5/9.6 configurado para a suíte.
2. Cobrir pelo menos:
   - candidato UUID confiável;
   - dois candidatos iguais e escolha por `NOT EXISTS`/ordenação;
   - candidatos `NULL + UUID`;
   - todos nulos;
   - filial nula versus preenchida;
   - snapshot presente e janelas conflitantes;
   - alerta existente com vínculo persistido nulo.
3. O teste deve falhar se houver função/agregação não suportada ou diferença de envelope/desfecho em relação ao resolver.
4. Se o ambiente local não possuir PostgreSQL, deixar o teste executável em CI/ambiente oficial e registrar claramente o comando e a razão do skip local; não substituir a prova por regex em SQLite.

### C. Matriz de equivalência

Adicionar testes que comparem, nos casos de filial nula, resolver versus:

- `CloudReposicaoEccAlertaRepository::find`;
- listagem;
- contagem;
- filtro por Rotina;
- reconhecimento;
- emissão/reemissão quando aplicável.

Verificar simultaneamente `rotina_id`, `nome_rotina`, `filial_requisitante`, `agregado`, elegibilidade e resposta segura.

## Testes obrigatórios

1. Dois candidatos com Rotina nula e filial nula: mesmo par, escolha estável e envelope idêntico em PHP/SQL.
2. Rotina viva com filial nula: resultado idêntico entre resolver, `find`, listagem, count e reconhecimento.
3. Filial nula e filial preenchida: conflito em todas as superfícies, sem escolher um lado.
4. Agregado explícito com filial vazia: regressão da semântica existente, sem ser confundido com alvo materializado.
5. PostgreSQL 9.5/9.6 real: consultas canônicas UUID executam sem erro e retornam os mesmos desfechos do SQLite/resolver.
6. Regressão integral ECC 438–454, testes de vínculo/read model, Pint e TypeScript quando aplicável.
7. Confirmar zero migration, zero DDL, zero alteração de snapshot/fatos históricos e zero ramo novo por `tipo`.

## Não fazer

- não introduzir nova política de filial apenas no read model;
- não tratar `NULL` como preenchido arbitrário;
- não usar fallback persistido para mascarar alvo materializado;
- não trocar `NOT EXISTS` por `MIN`/`MAX` em UUID;
- não considerar regex da SQL em SQLite como prova PostgreSQL;
- não alterar snapshots, alvo, fatos ou nome no corte;
- não criar segundo mapa de autorização;
- não reabrir cadastro, agenda, cálculo, confirmação ou pedidosfiliais.

