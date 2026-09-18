# Prompt 05 — Corrigir gravação e equivalência financeira

Execute `/speckit.specify` para corrigir o write model existente de
`/caixa/controle-recebimentos`. Leia os prompts 01–04, a auditoria
`auditoria-implementacao-laravel-vs-delphi.md`,
`pesquisa-sqls-parametros-delphi.md`, `contrato-dominio-laravel-delphi.md`, o
snapshot/manifesto de schema e o checkout Laravel atual. Não peça inspeção
direta dos fontes Delphi e não implemente durante `/speckit.specify`.

## Regra de equivalência

Preserve o limite de três operações, mas corrija os efeitos observáveis:

### Modo 0 — alterar tipo

- O tipo selecionado é único para a ação e o grupo completo é recarregado e
  bloqueado.
- Recalcule cada grupo conforme `numerorecebimentos`, rateando em centavos
  com saldo na última parcela.
- Para cada uma das N linhas, aloque novo `recebimentos.codigo` pela função
  autoritativa comprovada `recebimentos_proximocodigo()`, defina
  `controlerecebimento` para o novo grupo e `controle = 1..N`, atribua o novo
  tipo/conta/evento, e limpe `datavencto` e `desagio` conforme o comportamento
  capturado.
- Remova as linhas antigas somente dentro da mesma unidade atômica, sem
  transformar isso em exclusão cadastral. Atualize o payload/reconsulta para
  os novos códigos.

### Modo 1 — confirmar

- Atualize em lote `data_confirmacao`, `valor_confirmacao`, `desagio` e
  `confirmado = true`, além de `data_operacao = agora` e
  `usuario_confirmacao = operador`.
- Se houver documento/duplicata existente, relacione e atualize os campos que
  o Delphi atualiza, incluindo fornecedor, evento, valor líquido, datas e
  vínculo da duplicata.
- Se precisar criar o efeito, preencha documento e duplicata com o contrato
  do schema; o número de documento usa somente
  `documentospag_proximonumero()`. A duplicata deve usar a data de
  confirmação como vencimento/pagamento e receber os campos operacionais
  observados, não a data de emissão por conveniência.
- Na integração bancária efetiva, trate a identidade composta de movimento e
  evento. Atualize o evento e ajuste o total do movimento por delta
  (`novo_valor - valor_anterior_do_evento`), não substitua o total pelo valor
  de uma linha quando houver outros eventos.
- Se for necessário criar movimento/evento, use alocador autoritativo,
  transacional e comprovado. Nunca copie `MAX()+1`; se não houver alocador
  seguro, recuse a operação antes de qualquer mutação.
- A observação de contratos/cupons deve ser construída em lote a partir dos
  dados auxiliares, sem lookup por linha.

### Modo 2 — estornar

- Preserve `recebimentos.codigo`, mas limpe confirmação, data, valor e os
  vínculos/efeitos conforme a rotina observada.
- Desfaça documento e duplicata efetivamente quando forem efeitos da
  confirmação; não deixe registros e vínculos financeiros órfãos apenas
  porque o recebimento foi desmarcado.
- Remova/desfaça o evento bancário vinculado e subtraia seu valor do movimento;
  só elimine o movimento quando a regra do efeito de origem exigir e quando
  não restarem eventos. Recalcule o campo de evento do cabeçalho conforme os
  eventos restantes.
- Grave `data_operacao` e `usuario_confirmacao` também no estorno, conforme o
  campo operacional observado.

## Atomicidade, concorrência e autorização

- Revalide modo, situação `N`, Filial autorizada, fingerprint e efeitos
  relacionados imediatamente antes da mutação.
- Bloqueie chaves em ordem determinística e confira `rowCount` esperado de
  cada UPDATE/DELETE/INSERT vinculado. Qualquer divergência interrompe a
  unidade inteira.
- Prove em teste de integração que recebimento, documento, duplicata,
  movimento/evento, idempotência e prova sensível têm rollback conjunto na
  conexão autoritativa. Não documente atomicidade sem essa prova.
- A mesma intenção deve reutilizar `idempotency_key` em retry; payload
  diferente com a mesma chave deve ser conflito. Auditoria é append-only e
  nunca armazena senha, prova ou chave sensível.
- Use a ação sensível de Analista de Crédito já catalogada, sem transformar
  Administrador em substituto do perfil legado e sem criar grants por
  operação que não foram evidenciados.

## Testes obrigatórios

Criar/ajustar testes para: novo código em todas as N linhas do recálculo;
`controle`, conta/evento e limpeza de campos; atualização e criação de
documento/duplicata; confirmação com múltiplos eventos no mesmo movimento;
estorno com e sem efeitos; limpeza de operador/data; rollback injetando falha
em cada efeito; `rowCount`; fingerprint; replay; prova inválida; Filial fora
do escopo; e orçamento de consultas sem N+1.

Não usar `select *`, concatenação SQL, `Locate`, loop de query por registro,
teste de driver, `hasTable`, `Schema::has*`, `information_schema`, `pg_catalog`
ou `MAX()+1`. Listas devem usar `IN`, `= ANY(array)` ou `unnest`; relações
obrigatórias devem ser `INNER JOIN` e `LEFT JOIN` somente quando a ausência
for opcional comprovada pelo snapshot.

