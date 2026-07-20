# Definir testes e critérios de aceite

Type: task
Status: resolved
Blocked by: 02-definir-contrato-atendimento-cancelamento-lote, 03-definir-integracao-orchestrator

## Question

Qual é a matriz de testes e os critérios de aceite verificáveis para a criação/reaproveitamento de Atendimento no Cancelamento em lote de Contratos, cobrindo `ObrigarDigitacaoaoExcluir` ativo/inativo, Atendimento aberto/inexistente, Cliente ausente, múltiplos Contratos do mesmo Cliente no lote, falha isolada da etapa de Atendimento e idempotência?

## Answer

Consolidação direta das decisões dos tickets 01–03; nenhuma decisão nova aqui.

### Ativação condicional

- `ObrigarDigitacaoaoExcluir` inativo: nenhum Atendimento é criado ou atualizado, mesmo com Motivo informado (comportamento já existente, preservado).
- `ObrigarDigitacaoaoExcluir` ativo e descrição informada: Atendimento é criado (se não existir um aberto) ou reaproveitado como follow-up (se existir), sempre.

### Tipo e vínculo

- Atendimento gravado/buscado com `tipo='V'` (Contato) — nunca `'C'` (Cobrança) nem `'O'` (Orçamento).
- Vínculo sempre por `contrato` explícito (`findExistenteInclusaoAtendimento` com `contrato` informado), nunca só por Cliente+tipo+data.
- `tipoatendimento` resolvido pelo tipo principal correspondente a `'V'`, não mais `'C'`.

### Follow-up vs. criação

- Existe Atendimento aberto (`tipo='V'`, `contrato=X`): nova linha de follow-up, copiando campos da cadeia, fechada imediatamente com o texto — não duplica.
- Não existe: novo Atendimento, `tipo='V'`, `contrato=X`, `cliente`/`tipocliente` do Contrato, já fechado com o texto.
- Atendimento aberto de **outro** Contrato (mesmo Cliente) não é afetado nem reaproveitado.

### Lote com múltiplos Contratos do mesmo Cliente

- Cada Contrato do lote resolve seu próprio Atendimento independentemente — nunca consolida em um único Atendimento por Cliente, mesmo quando vários Contratos do mesmo Cliente estão no mesmo lote e mesmo dia.

### Texto

- Motivo selecionado: texto = `"Motivo: <descrição do motivo> — <texto livre>"`.
- Sem Motivo selecionado (Motivo continua opcional): só o texto livre, sem prefixo.
- Motivo/texto são os mesmos para todos os Contratos do lote (compartilhados na confirmação), mas cada Atendimento é uma operação própria por Contrato.

### Transação, falha e idempotência

- Falha na etapa de Atendimento reverte todo o Cancelamento daquele item (mesma transação) e é reportada como `falha_transacional` — comportamento já existente, preservado conscientemente (ver ticket 3).
- Contrato já `Cancelado` nunca tenta criar/atualizar Atendimento de novo — a guarda de Situação já existente cobre a idempotência, sem necessidade de mecanismo adicional.
- Nenhum backfill: Atendimentos já criados com `tipo='C'` continuam como estão; o teste não deve assumir migração de dados históricos.

## Critérios de aceite

1. Atendimento só é criado/atualizado quando `ObrigarDigitacaoaoExcluir` está ativo e a descrição foi informada.
2. `tipo='V'` é usado tanto na busca de existência quanto na criação — nunca `'C'` nem `'O'`.
3. A busca de existência é sempre por `contrato` explícito, nunca só por Cliente+tipo+data.
4. Atendimento aberto do mesmo Contrato é reaproveitado como follow-up e fechado; nunca duplicado.
5. Sem Atendimento aberto do mesmo Contrato, um novo é criado, já fechado.
6. Múltiplos Contratos do mesmo Cliente no mesmo lote geram/atualizam Atendimentos independentes, um por Contrato.
7. O texto do Atendimento inclui a descrição do Motivo quando selecionado; só o texto livre quando não.
8. Falha na criação/atualização do Atendimento reverte o Cancelamento daquele item e é reportada como `falha_transacional`.
9. Contrato já cancelado não gera nova tentativa de Atendimento em chamadas repetidas.
10. Nenhum Atendimento histórico (`tipo='C'`) é alterado ou migrado por este trabalho.
11. `ContratoLoteItemResult` não ganha novo campo para status do Atendimento — permanece como está.
