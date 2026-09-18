# Prompt para `/speckit.specify` — Reposição ECC: envelope de exceções e higiene de migrations

```text
/speckit.specify

Crie uma especificação corretiva incremental para fechar os resíduos encontrados na auditoria da implementação do prompt 20 em /mnt/c/teclux_analysis/modules/estoque/consulta-compras/ . Não implemente código nesta etapa. Consuma os prompts 19–20 em /mnt/c/teclux_analysis/modules/estoque/consulta-compras/, as specs 431–436 e o checkout atual.

## Diagnóstico obrigatório

O prompt 20 corrigiu o roteamento por motivo efetivo e o eco de parcelas reais de itens já confirmados. Permanecem três pontos:

1. `excecoes[]` de confirmação não expõe fatos, etapa e fonte suficientes para a fila; no ramo agregado também perde o `excecao_id` retornado pelo materializer.
2. `ecoItemJaConfirmado()` pode criar parcela sintética quando existem linhas em `_item_parcelas`, mas nenhuma linha confirmada válida. Sintética é permitida somente quando não há linhas.
3. O commit 20 alterou a migration histórica `2026_08_25_431000_cloud_estoque_reposicao_ecc_item_parcelas.php`, trocando backfill PostgreSQL baseado em `gen_random_uuid()` por UUID gerado pela aplicação para suportar PostgreSQL 9.5/9.6 sem presumir extensão. A decisão é válida, mas o loop deve ser avaliado em volume e o procedimento de upgrade precisa deixar claro o comportamento para instalações que já executaram 431.

Preserve identidade de exceção 434, falha técnica, motivo efetivo 436, envelope parcelar, idempotência, OCC, dispatch, concentração, filtros, gerente, timezone e núcleo 292.

## 1. Enriquecer `excecoes[]` sem divergir da persistência

Para cada exceção materializada na confirmação, o envelope deve conter:

- `item_id`;
- `parcela_id` quando aplicável;
- `excecao_id` retornado pelo materializer;
- `motivo_codigo` igual ao motivo persistido;
- `motivo_texto`;
- `motivo_detalhe_codigo` quando houver;
- `filial_fonte` quando houver;
- `etapa`;
- fatos sanitizados suficientes para a fila, incluindo quantidades quando o motivo for saldo e `codigo_estavel/retryable` quando for falha técnica.

No ramo agregado (`parcela_id = null`), preservar o ID retornado por `fromSaldoInsuficiente()` ou `fromRevalidacao()` em `excecoesTx`. Não alterar o contrato de idempotência: o mesmo envelope completo deve ser salvo e devolvido no replay.

Não duplicar lógica de fatos com formatos divergentes: defina uma projeção comum do registro de exceção para o envelope.

## 2. Restringir parcela sintética ao legado sem linhas

No eco de item já confirmado:

- se `row['parcelas']` estiver vazio, permitir uma parcela sintética com `parcela_id=null`, desde que exista o código agregado do item;
- se houver uma ou mais linhas em `row['parcelas']`, nunca usar o código agregado para inventar uma sintética;
- expor todas as linhas confirmadas válidas com identidade, fonte, ordem, quantidade e PF;
- se houver linhas, mas nenhuma puder ser projetada como confirmada, devolver uma falha/inconsistência observável ou um envelope sem confirmação — nunca mascarar como legado;
- não executar `somarWithinTransaction` nem alterar parcelas nesse caminho;
- manter nova chave e replay sem segundo PF.

Adicionar teste explícito para linhas presentes sem PF/estado confirmado, além dos testes já existentes de parcelas reais e legado sem linhas.

## 3. Backfill compatível com PostgreSQL 9.5/9.6

Valide a alteração feita em `2026_08_25_431000_cloud_estoque_reposicao_ecc_item_parcelas.php`:

- confirme que não há dependência residual de `gen_random_uuid()`/`pgcrypto` incompatível com PostgreSQL 9.5/9.6;
- valide o loop com processamento seguro para o volume real, evitando carregar milhões de linhas em memória se a base puder atingir esse tamanho;
- documente quais instalações já executaram 431 e como o deploy trata instalações novas, migrations 431 pendentes e migrations 431 já concluídas;
- mantenha idempotência do backfill (`NOT EXISTS` por item) e não altere schema legado nem tabelas fora do escopo ECC.

## Testes obrigatórios

- exceção parcelar não-saldo no envelope contém ID, detalhe, fonte, etapa e fatos;
- exceção saldo contém original/confirmada/pendente no envelope e no registro;
- falha técnica contém código estável e `retryable` no envelope;
- exceção agregada preserva `excecao_id`;
- linhas de parcela presentes sem confirmação válida nunca geram sintética;
- legado sem linhas gera exatamente uma sintética;
- replay da mesma chave devolve o envelope completo e idêntico;
- nova chave para item confirmado não cria PF;
- migration/upgrade validado em SQLite e PostgreSQL conforme a decisão tomada.

## Aceite mínimo

- Fila/API conseguem diagnosticar cada exceção sem buscar fatos ausentes no banco.
- Motivo, `excecao_id` e fatos do envelope são consistentes com a persistência.
- Parcela sintética só aparece sem linhas reais.
- A compatibilidade PostgreSQL 9.5/9.6 e o desempenho do backfill estão documentados e validados.
- Regressões 434–436 permanecem verdes.

## Arquivos prioritários

- `backend/app/Services/Estoque/ReposicaoEcc/ReposicaoEccConfirmarService.php`;
- `backend/app/Application/Estoque/ReposicaoEcc/ReposicaoEccExcecaoMaterializer.php`;
- `backend/app/Domain/Estoque/ReposicaoEcc/ReposicaoEccConfirmacaoMotivoEfetivo.php`;
- `backend/database/migrations/2026_08_25_431000_cloud_estoque_reposicao_ecc_item_parcelas.php`;
- `backend/tests/Feature/Estoque/ReposicaoEcc/`;
- `backend/tests/Unit/Estoque/ReposicaoEcc/`.
```
