# Prompt 10 — Correção do evento bancário no destino

Execute `/speckit.specify` para corrigir somente a transição de confirmação
entre datas em `movtosbancos`/`movtosbancoseventos` que permanece incorreta após
os prompts 01–09. Leia a auditoria atual, o Prompt 09, o contrato de domínio, a
pesquisa de SQLs/parâmetros, o snapshot/manifesto de schema e o checkout Laravel
atual. Use os artefatos versionados; não peça reabertura ou inspeção direta dos
fontes Delphi. Não implemente nesta execução do `/speckit.specify`.

## Estado que não deve regredir

Preserve os campos de Contas a Pagar já corrigidos (`VlrDesagio`, datas,
`tiporec`, complemento, referência, observação, defaults, filial e
`administrador`), a atualização set-based de `recebimentos`, as leituras em
lote, o estorno por identidade composta, a proteção contra documento
compartilhado e o comportamento seguro quando não existe alocador comprovado.

## Correção obrigatória

Na mudança de `data_confirmacao`, o evento no movimento destino é um novo efeito.
Nunca localizar o evento destino pelo mesmo `sequenciaevento` do evento antigo
para então sobrescrever seu valor. Se o destino já possuir um evento com a
mesma combinação `(conta, data, sequencia, evento)`, esse evento deve permanecer
intacto e o novo evento deve receber outra sequência autoritativa.

O fluxo deve ser transacional e, antes da primeira mutação:

1. bloquear e validar o evento/movimento antigo pela identidade completa;
2. bloquear o movimento destino por `(conta, data)`;
3. resolver um alocador autoritativo para a sequência do novo evento e, se
   necessário, do novo movimento;
4. se não houver alocador seguro comprovado pelo projeto/schema, recusar com
   erro explícito e deixar recebimento, evento e movimentos antigos exatamente
   como estavam;
5. se houver alocador seguro, remover o evento antigo, ajustar o movimento
   antigo, criar/reutilizar o movimento destino, inserir o novo evento com o
   valor da confirmação e atualizar as quatro partes da identidade no
   recebimento;
6. recalcular o valor e o cabeçalho do movimento destino considerando todos os
   eventos, sem substituir o total pelo valor de uma única linha.

Quando restarem vários eventos, o cabeçalho fica nulo; quando restar apenas um,
mantém o código desse evento. O movimento criado/reutilizado deve manter
`origemlancto = 'X'` e o tipo exigido pelo contrato.

## Aceite obrigatório

Corrigir o teste atual de transição. Ele não pode semear um evento destino com
`sequenciaevento = 1` e esperar que esse evento seja alterado para o valor da
confirmação. Deve provar uma destas alternativas, conforme o alocador que o
spec conseguir comprovar:

- com alocador seguro: evento destino original preservado, novo evento com
  sequência distinta, soma correta do movimento, quatro vínculos atualizados e
  evento antigo removido; ou
- sem alocador seguro: operação recusada antes da primeira escrita, com os
  efeitos antigos e o recebimento inalterados.

Adicionar casos para destino sem eventos, destino com evento de outro código,
destino com múltiplos eventos, movimento destino ambíguo, rollback, `rowCount`,
replay/idempotência e orçamento de consultas sem N+1. Não aceitar um teste que
apenas confira que a operação terminou sem exceção.

## Guardrails

Não usar `MAX()+1`, sequência inventada, inferência por valor, posição ou ordem
de consulta, SQL concatenado, `Locate`, N+1, teste de driver,
`hasTable`/`Schema::has*`, `information_schema` ou `pg_catalog`. Não reabrir
filtros, grid, títulos, editabilidade, F5/F6/F7, F9, autorização, menu,
breadcrumb, máscara de chave NF-e ou os campos financeiros já aceitos.

Se o alocador seguro não existir, o resultado correto é o bloqueio explícito e
atômico; não copiar a implementação legada baseada em `MAX()+1`.
