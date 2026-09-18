# Auditoria da implementação do prompt 21

**Commit auditado:** `62f8a9f05bf68eb928ca28e47c9e52357220c7f1` (`ecc automatico 21`)  
**Base de comparação:** `a23097fc` (prompt 20)  
**Data:** 2026-08-26

## Resultado

O prompt 21 fecha corretamente os dois problemas funcionais principais deixados pelo prompt 20:

- `ReposicaoEccExcecaoConfirmacaoProjector` centraliza a projeção de exceções persistidas e o serviço passou a utilizá-lo nos ramos parcelar, agregado, saldo e falha técnica.
- O eco de item confirmado só cria parcela sintética quando `parcelas[]` está vazio; com linhas presentes e nenhuma confirmável, retorna diagnóstico efêmero e não inclui o item em `confirmados[]`.
- A migration 431 usa `Str::uuid()` e `chunk(500)`, preservando a compatibilidade com PostgreSQL 9.5/9.6. A alteração da migration é válida e foi considerada intencional, conforme esclarecimento do cliente.
- O runbook cobre instalação nova, migration pendente e instalações que já executaram a versão anterior.

## Pendências encontradas

### P1 — `etapa` ausente nos fatos persistidos de revalidação parcelar

Em `ReposicaoEccConfirmarService.php:440-450`, o contexto usado por `fromRevalidacao()` contém somente `revalidacao_parcela`, sem `etapa`. Em seguida, `ReposicaoEccExcecaoMaterializer::fromRevalidacao()` (`:168-171`) apenas acrescenta `parcela_id`; ele não normaliza `etapa`.

Consequência: o projector apresenta `etapa: "confirmacao"` no envelope por fallback, mas `fatos_observados_json` não contém `etapa`. Isso quebra a exigência de que envelope e persistência tenham fatos coerentes e deixa o diagnóstico parcelar diferente do agregado/saldo.

O mesmo risco existe nos fatos criados por `materializarFalhaParcelaNegocio()` para duplicidade, que também não informam a etapa.

### P2 — verificação da migration contradiz o comentário da própria migration

A migration `2026_08_25_431000_cloud_estoque_reposicao_ecc_item_parcelas.php:49-50` não usa a função nem a extensão, mas o comentário contém os textos `gen_random_uuid()` e `pgcrypto`.

O contrato e o runbook prescrevem grep sem `gen_random_uuid`; portanto, o comando operacional imprime uma ocorrência e não confirma `OK`, apesar do código estar compatível. Deve-se remover ou reformular o comentário sem esses tokens, mantendo a explicação no runbook.

## Verificações realizadas

- Comparação de código entre `a23097fc` e `62f8a9f`.
- Conferência dos contratos da spec 437, dos testes novos e do runbook.
- Conferência de todos os pontos de materialização no serviço: cada ID retornado passa pelo projector, exceto o diagnóstico efêmero explicitamente fora da fila persistida.
- Conferência do backfill: `chunk(500)`, UUID gerado pela aplicação e `exists()` por item.
- `git diff --check`: somente whitespace em Markdown gerado; nenhum problema em PHP/TS.

Os testes não foram executados neste checkout porque o worktree compartilhado está em `193d9a25` (linha de outra tarefa), enquanto a implementação auditada está no commit remoto `62f8a9f`; executar os filtros da quickstart exige um checkout isolado ou a integração do commit.

## Conclusão

Implementação aprovada quanto ao fluxo principal, mas não deve ser considerada encerrada sem o prompt 22, que deve normalizar `etapa` dentro de `fatos_observados` para toda revalidação e corrigir o falso positivo do grep da migration, adicionando testes para ambos.
