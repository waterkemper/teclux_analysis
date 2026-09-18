# Auditoria da implementação do prompt 22

**Commit auditado:** `2b0312b03329d730528bd891ca9f4fb61af6f248c1` (`ecc 22`)  
**Base:** `62f8a9f05bf68eb928ca28e47c9e52357220c7f1` (prompt 21)  
**Data:** 2026-08-26

## Resultado

Prompt 22 aprovado. Os dois resíduos identificados na auditoria do prompt 21 foram corrigidos:

- `ReposicaoEccExcecaoMaterializer::fromRevalidacao()` agora sempre grava `etapa`, usando o valor do contexto ou `confirmacao`.
- O comentário da migration 431 foi reformulado e não contém mais `gen_random_uuid` nem `pgcrypto`; o grep operacional deixa de produzir falso positivo.

## Testes adicionados

- O teste de envelope de duplicidade verifica `etapa` no envelope e em `fatos_observados_json`.
- O teste de exceção agregada verifica etapa e quantidades no envelope e na persistência.
- O teste da migration verifica ausência dos tokens proibidos, presença de `Str::uuid()` e `chunk(500)`.

## Verificações estáticas

- Diferença limitada ao materializer, migration e testes diretamente relacionados.
- `git diff --check`: sem ocorrências.
- Migration: nenhum token proibido encontrado.
- Nenhuma decisão dos prompts 19–21 foi reaberta.

Os filtros PHPUnit não foram executados neste worktree porque ele está em `193d9a25`, de outra tarefa, e não no commit auditado. A validação dinâmica deve ser executada após integrar ou disponibilizar o commit `2b0312b0` no checkout usado pelo Docker.

## Conclusão

Não há necessidade de prompt 23 para os pontos auditados. O próximo passo é executar a matriz PHPUnit da quickstart da spec 437 e as regressões 434–436 no checkout correto.
