# Auditoria da implementação do spec 18

Data: 2026-08-26  
Base comparada: `origin/432-reposicao-ecc-ops-hardening` (`105a4273`) → `origin/433-reposicao-ecc-closeout` / `origin/main` (`5b95036f`)

## Resultado

A implementação cobre a maior parte do fechamento previsto: redistribuição por parcela, capacidade comprometida, persistência de quantidade revalidada antes da confirmação, savepoint lógico por parcela, projeção compartilhada de fontes, exposição de parcelas no detalhe do lote e regressões de timezone/idempotência.

Ela ainda não deve ser considerada concluída porque há inconsistências de contrato e de persistência nos casos de múltiplas parcelas e falha técnica.

## Pendências encontradas

### P1 — exceções de saldo podem perder a identidade da parcela

`ReposicaoEccExcecaoMaterializer::materialize()` procura uma exceção vigente por `item_id + motivo` e, quando encontra, substitui todo o JSON de fatos. O repositório `findVigentePorItemMotivo()` não considera `parcela_id`; esse campo só é gravado dentro dos fatos JSON.

Consequência: se duas parcelas do mesmo item falharem ou forem materializadas em momentos distintos, a segunda atualização pode reutilizar a primeira exceção e apagar os fatos/parcela anteriores. Isso viola o vínculo operacional parcela → exceção e torna a fila de exceções ambígua.

Referências: `ReposicaoEccExcecaoMaterializer.php:149-163`, `CloudReposicaoEccExcecaoRepository.php:56-65`.

Correção necessária: definir a chave de reuso explicitamente. Para exceção parcelar, localizar por item + motivo + parcela, preservando exceções de parcelas diferentes; para exceção agregada, usar uma identidade agregada explícita. A solução deve funcionar com o modelo de persistência existente e manter retry idempotente.

### P1 — falha técnica do núcleo é convertida em saldo insuficiente

No caminho parcelar, o `catch (Throwable)` que envolve `somarWithinTransaction()` marca a parcela como exceção e chama `fromSaldoInsuficiente()`, embora a falha possa ser `nucleo_requisicao_indisponivel` ou outra falha de infraestrutura. O retorno ainda classifica o caso como `ESTOQUE_FONTE_ALTERADO`.

Consequência: indisponibilidade técnica vira falso “saldo insuficiente”, contaminando indicadores e a fila operacional; o operador não recebe a semântica de retry técnico prevista para o núcleo.

Referência: `ReposicaoEccConfirmarService.php:460-526`.

Correção necessária: separar falhas de negócio/revalidação de falhas técnicas. A parcela deve ficar materializada com código/fatos próprios de falha do núcleo, sem criar `saldo_insuficiente`; definir se o erro é retornado como exceção parcial recuperável ou se aborta somente a operação conforme o contrato de idempotência.

### P2 — resposta de confirmação não cumpre `confirmados[].parcelas[]`

O fluxo parcelar adiciona cada parcela diretamente em `confirmadosTx` como elemento plano. O contrato do spec 431/433 exige que o resultado possa ser agrupado por item em `confirmados[].parcelas[]`, mantendo `parcela_id`, fonte, quantidade e código de `pedidosfiliais`.

O detalhe do lote já expõe parcelas, mas a resposta da confirmação e o `result_json` da idempotência não mantêm o envelope parcelar exigido.

Referências: `ReposicaoEccConfirmarService.php:149-169`, `ReposicaoEccConfirmarService.php:539-545`.

Correção necessária: montar o contrato parcelar para itens com parcelas, incluindo todos os códigos e mantendo compatibilidade explícita com itens legados mono-fonte, se ainda necessário.

### P2 — matriz de testes de dispatch está incompleta

Os testes novos `ReposicaoEccDispatchRecoveryTest` e `ReposicaoEccEnqueueRecoveryTest` forçam somente falha no `INSERT` do snapshot (`trg_ecc432_fail_snapshot_insert`). Não há prova equivalente para:

- falha depois do reserve ao criar `OperationalExecution`;
- falha ao despachar/enfileirar o job.

Assim, os três pontos obrigatórios do prompt 17 não estão cobertos por regressão executável, embora o caminho de recuperação tenha sido alterado.

Referências: `ReposicaoEccDispatchRecoveryTest.php:21-37`, `ReposicaoEccEnqueueRecoveryTest.php:25-40`.

## Pontos aprovados nesta revisão

- Redistribuição A=6/B=4 preservando B e usando fontes alternativas quando A perde elegibilidade.
- Consideração da capacidade já comprometida por outras parcelas.
- Persistência de `quantidade_revalidada` e estado antes da criação do pedido.
- Isolamento da confirmação por parcela com transação aninhada/savepoint lógico.
- Exceção parcial com quantidades original, confirmada e pendente no fluxo agregado.
- Projeção de vendas/estoque que prioriza dados do preview e não infere `sem_venda=true` na ausência da linha.
- Separação visual de tentativas de fontes e parcelas na tela.

## Conclusão

O spec 18 está parcialmente concluído. Recomenda-se um spec corretivo 19 antes do aceite final, concentrado nos quatro itens acima. Não foi alterado código Laravel nesta auditoria; a análise foi estática contra a revisão `5b95036f`.
