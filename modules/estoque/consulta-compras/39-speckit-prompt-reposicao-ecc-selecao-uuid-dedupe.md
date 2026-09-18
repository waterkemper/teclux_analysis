# Prompt 39 - Fechamento da seleção canônica UUID e integridade do alvo no upsert ECC

## Contexto

O Prompt 38 foi implementado nos commits `be059b68` e `3d2ce637` (`ecc 38/37`), sobre o `847bd3eb` (`ecc 37`). A suíte direcionada atual passou, mas a revisão do código encontrou dois resíduos não cobertos pelos testes.

Não reabrir cadastro de Rotinas, agenda, snapshot, cálculo, confirmação, pedidosfiliais, migration, coluna, índice ou DDL. Não misturar esta tarefa com o Prompt 37 da frente F10.

## Achados confirmados

### 1. `MIN(id)` ainda é agregação sobre UUID

Em `backend/app/Infrastructure/Persistence/Cloud/Estoque/ReposicaoEcc/CloudReposicaoEccAlertaRepository.php:319-350`, `snapCanon` e `jExecCanon` passaram a selecionar a linha canônica com:

```sql
SELECT operational_execution_id, MIN(id) AS min_id
```

e equivalente para janelas. O campo `id` dessas tabelas também é UUID. Portanto, a implementação removeu `MAX(rotina_id)`, mas manteve `MIN(id)` sobre identificador UUID. A documentação do PostgreSQL 9.6 lista `min`/`max` para tipos numéricos, string, data/hora, rede, enum e arrays, não para UUID; essa consulta não pode ser tratada como compatível apenas porque funciona no SQLite. [Documentação oficial de agregados do PostgreSQL 9.6](https://www.postgresql.org/docs/9.6/functions-aggregate.html)

Além da compatibilidade, a política deve escolher o menor candidato de forma determinística sem agregar UUID. A escolha pode ser feita por `ORDER BY id` em subconsulta correlacionada ou outra forma compatível, desde que o `HAVING` de coerência seja aplicado antes do pick e que candidatos conflitantes não sejam escolhidos.

### 2. Upsert existente pode resolver pelo alvo do payload, não pelo alvo histórico

Em `CloudReposicaoEccAlertaRepository::upsertAtivo:45-65`, quando existe alerta ativo/reconhecido para a `dedupe_key`, o método escolhe `alvo_tipo` e `alvo_id` do payload quando presentes. Em seguida, `vinculoParaPersistencia` resolve esse alvo (`:280-312`), mas o `UPDATE` altera somente fatos, resumo, severidade e campos nulos de vínculo; `a.alvo_tipo` e `a.alvo_id` permanecem os valores históricos.

Assim, uma chamada com a mesma `dedupe_key`, mas com `alvo_id` diferente, pode preencher `rotina_id`/filial do alerta antigo usando outro alvo. Isso quebra a relação vínculo-alvo e preserva um registro histórico com envelope incompatível com seu próprio alvo.

O contrato de ids históricos intactos não significa aceitar um payload que tente trocar o alvo usado para validar o vínculo. O alvo canônico de um alerta existente deve ser o alvo já persistido, ou a operação deve recusar a chamada se o payload divergir.

## Objetivo

Garantir seleção canônica compatível com PostgreSQL 9.5/9.6 e impedir que reemissão/upsert reutilize uma chave de deduplicação para resolver ou preencher vínculo a partir de alvo diferente do alvo histórico.

## Alterações obrigatórias

### A. Seleção canônica sem agregação de UUID

1. Remover `MIN(id)` e qualquer `MIN`/`MAX` aplicado a coluna UUID da seleção de `snapCanon` e `jExecCanon`.
2. Manter a classificação de pares (`sqlHavingParesCoerentes`) antes da seleção do candidato.
3. Escolher deterministicamente o menor `id` pela ordenação definida pelo contrato, sem agregação de UUID e sem `DISTINCT ON` incompatível com PostgreSQL 9.5/9.6.
4. Preservar:
   - snapshot com precedência sobre janela;
   - uma linha por alerta;
   - mesmo envelope do resolver;
   - conflito quando houver pares distintos, inclusive `NULL` + UUID;
   - coerência para todos os candidatos com o mesmo par.
5. Validar a SQL gerada/executada em PostgreSQL 9.5/9.6 e SQLite. Não basta teste SQLite, pois SQLite aceita agregação textual de UUID.

### B. Tornar o alvo histórico a autoridade no upsert existente

1. Em alerta já encontrado pela `dedupe_key`, usar sempre `existing->alvo_tipo` e `existing->alvo_id` para resolver o vínculo.
2. Se `payload.alvo_tipo` ou `payload.alvo_id` vierem preenchidos e divergirem do alvo persistido, escolher uma política explícita:
   - recusar a operação com erro de contrato; ou
   - ignorar os campos divergentes e continuar apenas com o alvo persistido.
3. Não atualizar `a.alvo_tipo` nem `a.alvo_id` nesta fatia.
4. Resolver vínculo persistido-versus-alvo usando o alvo histórico e manter:
   - vínculos preenchidos imutáveis;
   - campos nulos preenchidos somente quando a política autorizar;
   - alvo órfão, ambíguo, divergente ou inexistente sem vínculo inventado.
5. Garantir que `dedupe_key` não seja tratada como autorização para trocar o alvo.

### C. Preservar o contrato já fechado

1. Ignorar qualquer flag legado como `permitir_vinculo`; a autorização deve continuar derivando do resolver/política canônica.
2. Não alterar fatos, snapshot, nome no corte, ids históricos ou semântica de alerta agregado.
3. Manter o escopo autorizado no `UPDATE` de reconhecimento e a distinção entre recusa segura e conflito OCC.
4. Não criar segundo mapa de autorização ou ramo novo por `tipo`.

## Testes obrigatórios

1. PostgreSQL 9.5/9.6: listagem, detalhe e contagem com snapshots/janelas UUID executam sem `MIN(id)`, `MAX(id)`, `MIN(rotina_id)` ou `MAX(rotina_id)`.
2. SQLite: os mesmos cenários mantêm envelope e candidato canônico estáveis.
3. Dois candidatos coerentes: menor `id` é escolhido deterministicamente sem agregação UUID.
4. Candidatos conflitantes: nenhum lado é escolhido e o alerta fica inelegível.
5. Snapshot presente e janelas conflitantes: somente snapshot participa.
6. Alerta existente com `dedupe_key` igual e payload apontando para outro `alvo_id`: vínculo é resolvido pelo alvo persistido; não há preenchimento cruzado.
7. Política escolhida para payload de alvo divergente é testada explicitamente (recusa ou ignorância), sem alterar `alvo_tipo`/`alvo_id`.
8. Alerta existente com vínculo preenchido permanece imutável mesmo com payload de outro alvo e outra Rotina.
9. Regressão integral da suíte ECC 438–454, testes de vínculo/read model, Pint e TypeScript quando aplicável.
10. Confirmar zero migration, zero DDL, zero alteração de snapshot/fatos históricos e zero ramo novo por `tipo`.

## Não fazer

- não usar `MIN`/`MAX` em UUID;
- não aceitar alvo do payload para revalidar alerta existente;
- não trocar ou reescrever alvo histórico;
- não usar `dedupe_key` como autorização de vínculo;
- não escolher candidato conflitante;
- não deduplicar somente na interface;
- não criar segundo mapa de filiais;
- não reabrir cadastro, agenda, cálculo, confirmação ou pedidosfiliais.

