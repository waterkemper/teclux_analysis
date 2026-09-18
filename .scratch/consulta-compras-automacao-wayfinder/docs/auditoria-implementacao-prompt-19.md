# Auditoria da implementação do prompt 19

Data: 2026-08-26  
Base comparada: `5b95036f` (spec 18) → `origin/434-fix-ecc-parcela-gaps` (`2fac72cf`, `ecc automatico 19`)

## Resultado

O prompt 19 resolveu os quatro gaps apontados na auditoria anterior:

- exceções passaram a ter `parcela_id` persistido e lookup por identidade;
- falhas técnicas do núcleo passaram a usar `falha_infraestrutura`;
- a confirmação passou a devolver `confirmados[].parcelas[]` e `pedidosfiliais_codigos[]`;
- os três pontos de falha pós-reserve ganharam regressões.

Ainda há duas pendências no caminho parcelar que impedem o aceite final.

## Pendências encontradas

### P1 — duplicidade na revalidação ainda grava `saldo_insuficiente`

Quando `ReposicaoEccRevalidarService` classifica uma parcela como `ok=false` por `duplicidade`, `estoque_fonte_alterado` ou outro motivo de revalidação, `ReposicaoEccConfirmarService::confirmarParcelas()` entra no bloco inicial de falha e chama `fromSaldoInsuficiente()` incondicionalmente.

O envelope usa o motivo original, mas a linha persistida recebe `motivo = saldo_insuficiente`. Portanto, o retorno pode dizer duplicidade enquanto a fila/indicadores registram falta de estoque. Também `houveFalhaSaldo` é marcado para qualquer motivo.

Referência: `ReposicaoEccConfirmarService.php:428-472`.

Correção necessária: centralizar a materialização dessa falha usando o motivo efetivo. `duplicidade` deve usar a exceção de duplicidade; motivos de fonte/revalidação devem usar `fromRevalidacao`/mapeamento correspondente; somente `saldo_insuficiente` deve usar `fromSaldoInsuficiente`. Os flags agregados também devem distinguir saldo, duplicidade e falha técnica.

### P2 — item já confirmado perde a identidade das parcelas no envelope

No início da confirmação, se o item já está `confirmado`, o serviço chama `appendConfirmadoParcela()` com `parcela_id = null` e uma única linha agregada do item. Isso ocorre mesmo quando o item possui várias parcelas reais já confirmadas.

Esse cenário é possível quando o lote continua pendente por outro item e o operador confirma novamente um item já concluído usando uma nova chave de idempotência. O resultado não é replay: ele devolve uma parcela sintética e viola o contrato de que cada confirmação parcelar deve preservar `parcela_id` e código PF correspondente.

Referência: `ReposicaoEccConfirmarService.php:153-166`.

Correção necessária: para item confirmado com parcelas persistidas, carregar as parcelas confirmadas e projetar cada uma no envelope, com sua fonte, quantidade e `pedidosfiliais_codigo`. A parcela sintética sem ID deve permanecer exclusiva do caminho legado realmente sem linhas em `_item_parcelas`. Adicionar teste com lote ainda pendente por outro item e nova confirmação do item já confirmado.

## Verificações aprovadas

- Duas parcelas com mesmo motivo mantêm exceções e fatos distintos.
- Retry da mesma identidade de exceção atualiza fatos sem duplicar a linha.
- Exceção agregada e parcelar coexistem.
- Falha técnica não cria `saldo_insuficiente` no cenário coberto.
- Parcelas seguras continuam confirmando com PF.
- Envelope aninhado e replay preservam os códigos.
- Falhas de execução, snapshot e enqueue possuem testes de recuperação.

## Observação de validação

Foi feita revisão estática contra a revisão `2fac72cf`. A suíte Docker não foi executada nesta auditoria porque o checkout Laravel local está em outra revisão e contém alterações independentes; executar os testes diretamente nele não validaria o commit 19.

## Conclusão

O prompt 19 está majoritariamente implementado, mas o aceite deve aguardar a correção da classificação persistente de duplicidade/outros motivos e do envelope ao reconsultar item parcelar já confirmado.
