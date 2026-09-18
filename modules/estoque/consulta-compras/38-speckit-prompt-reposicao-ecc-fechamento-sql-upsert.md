# Prompt 38 - Fechamento de compatibilidade SQL e contrato de upsert ECC

## Contexto

O Prompt 37 foi implementado nos commits `08fc9a20` e `847bd3eb` (`ecc 37`), sobre o `884fb6bb` (`ecc 36`). A revisão confirmou a correção dos predicados de pares NULL-safe e a inclusão do escopo no `UPDATE` de reconhecimento, mas encontrou três resíduos que ainda podem quebrar a leitura ou permitir vínculo inventado.

Não reabrir cadastro de Rotinas, agenda, snapshot, cálculo, confirmação, pedidosfiliais, migration, coluna, índice ou DDL. Não misturar esta tarefa com o Prompt 37 da frente F10.

## Achados confirmados

### 1. A consulta ainda agrega `rotina_id` UUID com `MAX`

Em `backend/app/Infrastructure/Persistence/Cloud/Estoque/ReposicaoEcc/CloudReposicaoEccAlertaRepository.php:247-267`, as subconsultas `snapCanon` e `jExecCanon` continuam usando:

```sql
MIN(id), MAX(rotina_id), MAX(filial_requisitante)
```

`rotina_id` é UUID. O Prompt 37 retirou `COALESCE(rotina_id, '')`, mas deixou uma agregação `MAX(rotina_id)` que não é uma forma segura de selecionar UUID em PostgreSQL 9.5/9.6 e não é necessária para escolher o candidato canônico. A listagem, o detalhe e a contagem ainda podem falhar ou depender de suporte de agregação que não está garantido nessa versão.

### 2. Alvo inexistente ainda recebe vínculo do payload

Em `backend/app/Services/Estoque/ReposicaoEcc/ReposicaoEccAlertaService.php`, `payloadVinculoParaUpsert` mantém o caminho final que devolve `[$payloadRotina, $payloadFilial]` quando não há alvo resolvível e não há divergência persistida.

Isso contraria o contrato do Prompt 37/feature `452`: alvo órfão, ambíguo, divergente ou não confiável não pode receber Rotina/filial inventadas pelo payload. A exceção é apenas o alerta agregado explícito, que deve continuar sem inventar Rotina e respeitando sua semântica de filial vazia.

O teste existente cobre alvo órfão com candidato materializado, mas não cobre alvo inexistente sem candidato e payload com vínculo.

### 3. `permitir_vinculo` é um gate de confiança controlado pelo chamador

`CloudReposicaoEccAlertaRepository::upsertAtivo` aceita `permitir_vinculo=true` no array recebido. Uma chamada direta pode informar esse flag junto com qualquer UUID/filial e gravar o vínculo, porque o repositório não revalida o payload contra o alvo.

O service atualmente envia `permitir_vinculo=true` inclusive quando os valores já foram zerados. Isso faz o gate parecer seguro, mas não impede bypass por outro chamador, teste, comando ou futura integração que invoque o repositório.

O contrato exige que a entrada de gravação ativa impeça conflito no próprio limite da persistência ou receba uma entrada canônica que não possa ser confundida com payload bruto.

## Objetivo

Eliminar a última dependência de agregação UUID não garantida e fechar o limite de emissão/reemissão para que somente vínculo autorizado pela política canônica possa ser persistido.

## Alterações obrigatórias

### A. Seleção canônica sem `MAX`/`MIN` de UUID

1. Remover `MAX(rotina_id)` de `snapCanon` e `jExecCanon`.
2. Manter seleção determinística pelo menor `id` do candidato, mas sem usar `MIN`/`MAX` em identificador UUID para montar o vínculo.
3. A consulta deve continuar distinguindo:
   - nenhum candidato;
   - candidatos com o mesmo par, inclusive todos nulos;
   - pares distintos, inclusive NULL + UUID;
   - snapshot presente versus fallback para janela.
4. A estratégia escolhida deve funcionar em PostgreSQL 9.5/9.6 e SQLite. Pode usar subconsulta correlacionada/`ORDER BY id` ou outra forma compatível, desde que não reintroduza duplicação nem escolha um candidato conflitante.
5. O envelope produzido por `list`, `find`, `countNaoReconhecidos` e pelo resolver deve permanecer idêntico nos casos confiável, todos nulos, conflito e snapshot com janelas conflitantes.

### B. Fechar a decisão de payload no service

1. Para vínculo confiável, preencher somente campos persistidos ausentes e aceitar apenas valores do payload iguais ao alvo.
2. Para vínculo ambíguo, órfão, divergente, não confiável ou alvo inexistente sem candidato, não persistir `rotina_id` nem `filial_requisitante` do payload.
3. Para `alvo_tipo=agregado`, preservar somente a regra explicitamente aceita para alerta agregado: nunca inventar Rotina; não permitir que um payload transforme um agregado em vínculo de Rotina.
4. Adicionar teste específico de emissão/reemissão para alvo inexistente sem candidato, com payload contendo UUID e filial, comprovando que ambos permanecem nulos.
5. Remover o comentário/regra que trata genericamente “alvo inexistente” como caso em que o payload pode estabelecer vínculo, salvo se houver uma exceção de produto formalmente documentada e testada.

### C. Tornar `upsertAtivo` seguro contra chamada direta

Escolher e documentar uma das duas estratégias, sem deixar um booleano controlável pelo chamador como única proteção:

1. **Entrada canônica:** alterar a API interna para receber uma estrutura/objeto produzido pelo service após a resolução, separando valores autorizados de payload bruto; ou
2. **Validação no repositório:** dentro de `upsertAtivo`, resolver/verificar o alvo e ignorar ou recusar qualquer Rotina/filial que não seja permitida pela política, inclusive em alerta novo e em alerta existente com campos nulos.

Em qualquer estratégia:

- vínculo preenchido no alerta existente permanece imutável;
- conflito de payload não é persistido;
- alvo inexistente/órfão/ambíguo não recebe vínculo inventado;
- snapshot tem precedência sobre janela;
- não se cria uma segunda política divergente da usada pelo resolver;
- não se altera `a.id`, `a.alvo_id`, fatos, snapshot ou nome no corte.

### D. Preservar reconhecimento atômico

1. Manter o escopo autorizado no predicado do `UPDATE`, usando o contrato existente de autorização.
2. Manter id, revisão, estado ativo e elegibilidade canônica no mesmo `UPDATE`.
3. Manter `FOR UPDATE` no PostgreSQL como proteção auxiliar, sem transformá-lo na única garantia.
4. Não alterar a distinção já aceita entre recusa segura por inelegibilidade/escopo e conflito OCC quando somente a revisão mudou.

## Testes obrigatórios

1. PostgreSQL 9.5/9.6: listagem, detalhe e contagem de alerta com candidatos UUID não executam `MAX(rotina_id)`/`MIN(rotina_id)` e permanecem funcionais.
2. SQLite: os mesmos envelopes e desfechos do PostgreSQL para candidato confiável, dois candidatos iguais, todos nulos, NULL + UUID e filial nula/preenchida.
3. Snapshot presente com janelas conflitantes: somente snapshot é usado e o resultado continua estável.
4. Emissão de alerta para alvo inexistente sem candidato e payload com Rotina/filial: ambos permanecem nulos.
5. Reemissão para alvo órfão, ambíguo e divergente: nenhum payload conflitante é gravado.
6. Chamada direta de `upsertAtivo` com payload conflitante e qualquer tentativa de forjar `permitir_vinculo`: operação recusa ou normaliza sem persistir conflito.
7. Chamada direta com alerta existente preenchido e payload diferente: vínculo original permanece intacto.
8. Reconhecimento sem escopo no `UPDATE`: recusa segura e estado continua ativo.
9. Revisão stale com escopo/elegibilidade válidos: conflito de concorrência.
10. Regressão integral da suíte ECC 438–452, testes de vínculo/read model, Pint e TypeScript quando aplicável.
11. Confirmar zero migration, zero DDL, zero alteração de snapshot/fatos históricos e zero ramo novo por `tipo`.

## Não fazer

- não adicionar migration, coluna, índice ou DDL;
- não usar `MAX`/`MIN` para selecionar UUID;
- não usar booleano externo como prova suficiente de autorização do vínculo;
- não permitir payload estabelecer vínculo para alvo inexistente sem contrato explícito;
- não sobrescrever vínculo persistido;
- não escolher candidato conflitante;
- não deduplicar somente na interface;
- não criar segundo mapa de autorização de filiais;
- não reabrir cadastro, agenda, cálculo, confirmação ou pedidosfiliais.

