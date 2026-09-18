# Prompt 22 — Fechar fatos de revalidação e verificação da migration 431

O prompt 21 foi implementado no commit `62f8a9f05bf68eb928ca28e47c9e52357220c7f1`, mas a auditoria encontrou dois resíduos pequenos e objetivos. Implemente somente os ajustes abaixo, preservando as decisões já fechadas nos prompts 19–21.

## 1. Normalizar `etapa` nos fatos persistidos

Em `backend/app/Application/Estoque/ReposicaoEcc/ReposicaoEccExcecaoMaterializer.php`, ajuste `fromRevalidacao()` para que `fatos` sempre contenha:

```php
'etapa' => (string) ($context['etapa'] ?? 'confirmacao'),
```

O campo deve ser adicionado de forma centralizada, junto com `parcela_id`, sem apagar fatos já fornecidos. Assim, revalidações parcelar, agregada e de negócio persistem a mesma etapa que o projector expõe no envelope.

Confirme também que os caminhos de `materializarFalhaParcelaNegocio()` e de revalidação parcelar continuam com `etapa = confirmacao`, sem alterar motivo efetivo, identidade por parcela, fatos de saldo ou falha técnica.

## 2. Corrigir o falso positivo da verificação da migration

Em `backend/database/migrations/2026_08_25_431000_cloud_estoque_reposicao_ecc_item_parcelas.php`, reformule o comentário explicativo do backfill para não conter literalmente `gen_random_uuid` nem `pgcrypto`. O arquivo deve continuar sem esses tokens, porque o runbook usa grep como verificação operacional.

Não altere o comportamento já validado: `Str::uuid()`, `orderBy('id')->chunk(500)`, `exists()` por `item_id`, idempotência e nenhuma nova migration.

## 3. Testes obrigatórios

Adicione ou ajuste testes para provar:

1. Uma exceção de revalidação parcelar/duplicidade tem `etapa = confirmacao` tanto em `excecoes[].etapa` quanto em `fatos_observados_json.etapa`.
2. A projeção de exceção agregada continua com etapa e fatos completos.
3. A migration 431 não contém os tokens proibidos no arquivo-fonte, além de manter o backfill idempotente já coberto.

Execute, via Docker PHP, os filtros da quickstart da spec 437 e as regressões 434–436. Não execute PHP diretamente no host.

## Critérios de aceite

- Nenhuma exceção materializada pela confirmação possui fatos persistidos sem `etapa`.
- `excecoes[]` e `fatos_observados_json` permanecem coerentes no replay.
- O grep de verificação da migration não encontra `gen_random_uuid` nem `pgcrypto`.
- O backfill continua compatível com PostgreSQL 9.5/9.6, em chunks e idempotente.
- Nenhuma decisão fechada nos prompts anteriores é reaberta.
