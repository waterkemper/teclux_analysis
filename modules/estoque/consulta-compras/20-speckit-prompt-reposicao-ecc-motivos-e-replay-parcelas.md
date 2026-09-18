# Prompt para `/speckit.specify` — Reposição ECC: motivos de revalidação e replay de parcelas confirmadas

```text
/speckit.specify

Crie uma especificação corretiva incremental para fechar as duas pendências residuais encontradas na auditoria da implementação do prompt 19 em em  /mnt/c/teclux_analysis/modules/estoque/consulta-compras/ da Reposição ECC. Não implemente código nesta etapa. Consuma os prompts 16–19 em em  /mnt/c/teclux_analysis/modules/estoque/consulta-compras/, as specs 431–434 e o checkout atual.

## Diagnóstico obrigatório

O prompt 19 resolveu identidade persistível de exceção, falha técnica distinta de saldo, envelope aninhado e testes dos três pontos de dispatch. Ainda existem dois problemas:

1. No bloco parcelar de `ReposicaoEccConfirmarService` que trata `ok=false` vindo da revalidação, qualquer motivo (`duplicidade`, `estoque_fonte_alterado`, sem fonte ou saldo) chama `fromSaldoInsuficiente()`. O envelope mantém o motivo original, mas a exceção persistida vira `saldo_insuficiente`.
2. Quando um item já está confirmado, o serviço monta uma única parcela sintética com `parcela_id=null`, mesmo que existam várias parcelas reais confirmadas. Isso quebra o contrato quando o lote continua pendente por outros itens e o operador envia uma nova confirmação para esse item.

Preserve concentração, prefixos, filtros congelados, gerente de vendas, núcleo `pedidosfiliais`, idempotência, OCC, timezone, tela própria, redistribuição, projeção, identidade de exceção, falha técnica e os três testes de dispatch já fechados.

## 1. Persistência pelo motivo efetivo

No tratamento de uma parcela `ok=false` após a revalidação:

- `saldo_insuficiente` deve materializar `fromSaldoInsuficiente`, preservando original/confirmada/pendente;
- `duplicidade` ou `pedido_equivalente` deve materializar a exceção de duplicidade, sem criar `saldo_insuficiente`;
- `estoque_fonte_alterado`, `sem_fonte_elegivel`, proteção/concentração e demais motivos devem usar o mapeamento de revalidação já existente, preservando o motivo persistido e o `motivo_detalhe_codigo`;
- falha técnica continua usando `falha_infraestrutura`, nunca saldo;
- `excecao_id`, `parcela_id`, fatos, fonte e etapa devem aparecer no registro e no `excecoes[]`;
- flags/agrupadores como `houveFalhaSaldo` devem ser derivados do motivo efetivo, não apenas de `ok=false`;
- uma exceção agregada de saldo só pode ser criada quando houver saldo pendente real, não apenas porque houve duplicidade ou outro motivo.

Não resolver isso apenas alterando o texto do envelope: fila, indicadores e persistência precisam concordar.

## 2. Envelope de item já confirmado

Ao confirmar um lote ainda pendente:

- se o item já estiver confirmado e possuir linhas em `_item_parcelas`, devolver cada parcela confirmada com `parcela_id`, fonte, ordem, quantidade e `pedidosfiliais_codigo`;
- o envelope deve manter um único objeto do item em `confirmados[]`, com `parcelas[]` contendo todas as parcelas reais;
- `pedidosfiliais_codigos[]` deve ser a união estável dos códigos das parcelas;
- não executar novo `somarWithinTransaction` nem alterar estado das parcelas já confirmadas;
- a parcela sintética com `parcela_id=null` só é permitida no caminho legado comprovadamente sem linhas em `_item_parcelas`;
- replay da mesma chave continua byte/semanticamente idêntico;
- uma nova chave para o mesmo item confirmado deve devolver a mesma identidade parcelar sem criar novo PF.

Se o repositório de lote já devolve as parcelas em `listItens`, reutilize essa fonte; não reconstrua a identidade a partir de um único campo agregado do item.

## Testes obrigatórios

Adicione ou complete testes de comportamento para:

- duplicidade detectada na revalidação: `excecoes[].motivo_codigo = duplicidade`, exceção persistida com `motivo = duplicidade`, zero exceções `saldo_insuficiente` causadas por esse caso;
- `estoque_fonte_alterado`/sem fonte: persistência mantém motivo correto;
- saldo insuficiente: continua persistindo saldo com quantidades original/confirmada/pendente;
- combinação de duplicidade e falha técnica sem criar saldo indevido agregado;
- lote com item A parcelar já confirmado e item B ainda pendente; nova confirmação de A devolve todas as parcelas reais de A com seus códigos;
- nova chave para o item já confirmado não cria segundo `pedidosfiliais`;
- replay da mesma chave mantém o mesmo envelope;
- item legado sem parcelas continua usando apenas uma parcela sintética sem ID.

## Aceite mínimo

- Nenhuma exceção de duplicidade, estoque alterado ou sem fonte é persistida como `saldo_insuficiente`.
- O indicador de saldo só aumenta quando o motivo efetivo é saldo insuficiente.
- Item parcelar já confirmado nunca perde `parcela_id` ou código no envelope.
- Nova confirmação/replay não cria novo PF para parcelas confirmadas.
- O caminho legado sem parcelas permanece explicitamente compatível.

## Arquivos prioritários

- `backend/app/Services/Estoque/ReposicaoEcc/ReposicaoEccConfirmarService.php`;
- `backend/app/Application/Estoque/ReposicaoEcc/ReposicaoEccExcecaoMaterializer.php`;
- `backend/app/Domain/Estoque/ReposicaoEcc/ReposicaoEccRevalidacao.php`;
- `backend/app/Infrastructure/Persistence/Cloud/Estoque/ReposicaoEcc/CloudReposicaoEccLoteRepository.php`;
- `backend/tests/Feature/Estoque/ReposicaoEcc/`;
- `backend/tests/Unit/Estoque/ReposicaoEcc/`.
```
