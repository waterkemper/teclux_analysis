# Auditoria da implementação do prompt 20

Data: 2026-08-26  
Base comparada: `2fac72cf` (prompt 19) → `origin/main` (`a23097fc`, `ecc automatico 20`)

## Resultado

O prompt 20 resolveu os dois gaps principais:

- o motivo efetivo agora direciona a persistência para saldo, duplicidade ou revalidação;
- item já confirmado com parcelas reais passa a ecoar as parcelas e códigos existentes, sem novo pedido.

Os testes adicionados cobrem duplicidade, estoque alterado, saldo, mistura com falha técnica, nova chave, replay e legado sem parcelas.

Ainda há três pendências de aceite.

## Pendências encontradas

### P2 — `excecoes[]` não carrega fatos, etapa e fonte suficientes

No ramo parcelar `ok=false`, o registro persistido recebe contexto e fatos, mas a entrada adicionada em `excecoesTx` contém somente `item_id`, `parcela_id`, `excecao_id`, `motivo_codigo` e `motivo_texto`. O contrato 436 exige também fatos/etapa/fonte suficientes para a fila.

O mesmo ocorre no ramo agregado `!algumaConfirmada`: o retorno de `fromSaldoInsuficiente()`/`fromRevalidacao()` não é preservado como `excecao_id` e a entrada do envelope não expõe os fatos.

Referências: `ReposicaoEccConfirmarService.php:469-475` e `ReposicaoEccConfirmarService.php:650-677`.

Correção necessária: projetar no envelope o mesmo contexto persistido, ao menos `excecao_id`, `parcela_id`, `filial_fonte`, `etapa`, `motivo_detalhe_codigo` e fatos sanitizados; no agregado, preservar também o ID retornado pelo materializer.

### P2 — fallback sintético ainda pode ocorrer com linhas de parcela existentes

`ecoItemJaConfirmado()` só entra no caminho real quando encontra parcelas com PF. Se `row['parcelas']` não estiver vazio, mas nenhuma linha tiver estado confirmado/PF, o método cai no fallback agregado e cria uma parcela sintética com `parcela_id=null`.

O contrato permite sintética somente quando não existem linhas em `_item_parcelas`. Com linhas existentes, o sistema deve expor as parcelas reais ou sinalizar inconsistência; não deve reconstruir pelo código agregado do item.

Referência: `ReposicaoEccConfirmarService.php:752-786`.

Correção necessária: restringir o fallback a `$parcelasItem === []`. Se houver linhas, mas nenhuma confirmada válida, retornar exceção/inconsistência observável sem inventar parcela sintética.

### Observação — compatibilidade do backfill PostgreSQL 9.5/9.6

O commit 20 modifica `2026_08_25_431000_cloud_estoque_reposicao_ecc_item_parcelas.php`, trocando o backfill PostgreSQL baseado em `gen_random_uuid()` por UUID gerado pela aplicação. A justificativa é válida: `gen_random_uuid()` depende de extensão/suporte que não deve ser presumido em PostgreSQL 9.5/9.6.

Permanece apenas uma verificação operacional: a alteração não será aplicada a instalações que já executaram a migration 431 e o loop PHP pode aumentar tempo/memória em bases com muitos itens. Como a mudança é necessária para compatibilidade, isso deve ser documentado no procedimento de deploy e validado com volume representativo; não é uma falha funcional do prompt 20.

## Verificações aprovadas

- Roteamento `saldo_insuficiente` preserva quantidades original/confirmada/pendente.
- Duplicidade e `pedido_equivalente` não são persistidos como saldo.
- Estoque alterado/sem fonte usa motivo não-saldo.
- Falha técnica continua distinta de saldo.
- Agregada de saldo exige falha efetiva de saldo e pendência.
- Item já confirmado ecoa parcelas reais e união de códigos.
- Nova chave não cria segundo PF.
- Replay mantém envelope.
- Legado sem parcelas mantém uma parcela sintética.

## Observação de validação

A auditoria foi estática contra `a23097fc`. A suíte Docker não foi executada porque o checkout local Laravel está em outra revisão, com alterações independentes.

## Conclusão

O prompt 20 está funcionalmente quase completo, mas o aceite deve aguardar o enriquecimento do envelope de exceções, a restrição do fallback sintético e a decisão/reversão da alteração da migration histórica 431.
