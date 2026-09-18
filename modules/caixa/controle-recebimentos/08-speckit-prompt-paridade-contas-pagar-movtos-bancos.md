# Prompt 08 — Paridade financeira com Contas a Pagar e Movimentos Bancários

Execute `/speckit.specify` para corrigir o fluxo financeiro já implementado de
`/caixa/controle-recebimentos`. Leia os prompts 01–07, a seção de reauditoria
de `auditoria-implementacao-laravel-vs-delphi.md`,
`pesquisa-sqls-parametros-delphi.md`, `contrato-dominio-laravel-delphi.md`, o
snapshot/manifesto de schema e o checkout Laravel atual. Não peça reabertura,
inspeção ou conferência direta dos fontes Delphi; use os artefatos versionados.
Não implemente nesta execução do `/speckit.specify`.

Este prompt é específico para `documentospag`, `duplicatas`, `movtosbancos` e
`movtosbancoseventos`. Não reabra defaults, catálogo, títulos, editabilidade,
seleção global, F6 ou autorização já corrigidos.

## 1. Valor financeiro correto do Documento a Pagar

O valor do Documento a Pagar e da Duplicata não é automaticamente o valor de
confirmação. Reproduza a regra capturada para `VlrDesagio`:

- se `valor_confirmacao` for diferente de zero, `valorlancto` também for
  diferente de zero e `valorlancto >= valor_confirmacao`, usar
  `valorlancto - valor_confirmacao`;
- caso contrário, se `valorlancto >= valorvencto`, usar
  `valorlancto - valorvencto`;
- nos demais casos, usar zero.

Use esse valor líquido para `documentospag.valor`,
`duplicatas.valorvencto` e `duplicatas.valorpagto`. Valor zero não pode gerar
Documento a Pagar.

## 2. Campos e datas de Contas a Pagar

Na criação ou atualização, manter a semântica documentada:

1. `documentospag.emissao` e `documentospag.datalancto` recebem a data de
   lançamento do recebimento, não a data de confirmação.
2. `documentospag.fornecedor`, `filialemissao`, `evento`, `tipofornecedor`,
   `complemento`, `referencia`, `previsao`, `adiantamento` e demais campos
   comprovados pelo schema devem ser preenchidos com os valores observados.
3. `duplicatas.datavencto`, `datapagto` e os valores de pagamento usam a data
   e o valor líquido da confirmação. Preencher também observação, filial de
   pagamento, usuário e defaults operacionais comprovados (`juros`, desconto,
   multa, tipos e autorização), sem inventar colunas fora do snapshot.
4. Ao atualizar um documento existente, atualizar seus campos e a duplicata
   encontrada pela chave correta. Se a data de vencimento da duplicata mudar,
   tratar a alteração de sua chave `(documentopag, datavencto, numero)` com
   bloqueio e `rowCount` verificado; não deixar a data antiga por conveniência.
5. O lookup da duplicata deve considerar a data de confirmação atual e a data
   anterior capturada. Nunca escolher silenciosamente uma duplicata diferente
   quando a chave esperada não existir.
6. Criação só ocorre com documento inexistente, fornecedor/evento válidos,
   valor líquido diferente de zero e data de confirmação válida. O recebimento
   deve receber `documentopag`, `duplicata`, fornecedor e evento no mesmo
   change set.

## 3. Estorno de Contas a Pagar

Reproduza a rotina observada de desfazer o efeito financeiro:

- localizar a duplicata pela data de confirmação anterior;
- apagar duplicata e documento quando essa for a regra do efeito capturado;
- limpar no recebimento `documentopag`, `duplicata`, `fornecedor` e
  `eventodocumentopag`, além da confirmação/data/valor;
- preservar `recebimentos.codigo` e gravar `data_operacao` e
  `usuario_confirmacao`.

Não criar uma regra silenciosa de preservação de documento compartilhado que
altere a semântica observada. Se o schema demonstrar compartilhamento real e
isso exigir decisão, o spec deve registrar o conflito e definir a proteção
antes da mutação, sem apagar somente parte do efeito nem deixar vínculo órfão.

## 4. Confirmação em `movtosbancos`

Implementar os dois caminhos do comportamento capturado:

### Mesma data e mesma identidade

Quando data atual = data anterior e existem conta, sequência, evento e
sequência do evento, localizar exatamente:

- movimento `(conta, data, sequencia)`;
- evento `(conta, data, sequencia, evento, sequenciaevento)`.

Atualizar o valor do evento e o cabeçalho do movimento pelo delta:
`novo_valor_evento - valor_anterior_evento`. Os demais eventos permanecem
intactos.

### Mudança de data/identidade

Quando a data ou identidade muda:

1. remover o evento/movimento anterior conforme as chaves antigas;
2. localizar o movimento da nova conta/data ou criar um novo movimento;
3. criar o evento com sequência autoritativa;
4. atualizar no recebimento conta, sequência, evento e sequência do evento;
5. manter `origemlancto = 'X'`, tipo e evento do cabeçalho conforme o contrato;
6. ajustar o cabeçalho: um evento mantém o código; mais de um evento deixa o
   campo de evento nulo, conforme a regra capturada.

Criação deve usar alocador autoritativo e transacional. O uso legado de
`MAX()+1` não pode ser copiado. Se não houver alocador seguro comprovado, a
operação deve recusar antes de alterar recebimento, Contas a Pagar ou banco.

## 5. Estorno bancário

- Usar somente a identidade composta persistida no recebimento e a data de
  confirmação anterior.
- Se conta, data, sequência, evento ou sequência do evento estiverem ausentes,
  não inferir o evento pelo valor; recusar ou seguir o no-op explicitamente
  comprovado pelo contrato.
- Remover o evento uma única vez e subtrair seu valor do movimento.
- Se o movimento resultante for zero, aplicar a regra de remoção observada;
  caso contrário, manter o movimento, recalcular o evento do cabeçalho e
  preservar os eventos restantes.
- Limpar os vínculos bancários do recebimento somente no mesmo change set.

## 6. Lote, SQL e atomicidade

1. A atualização dos recebimentos deve ser set-based: uma operação por lote
   usando `WHERE IN` e `CASE`, `UPDATE ... FROM (VALUES ...)` ou equivalente
   parametrizado. Não executar um `UPDATE` por linha.
2. Carregar documentos, duplicatas, movimentos e eventos em consultas de
   conjunto. O estorno não pode chamar uma consulta de eventos uma vez por
   movimento; passar todas as chaves ao método batch.
3. Deduplicar identidades antes de atualizar/apagar. A mesma chave física não
   pode sofrer duas mutações no lote.
4. Bloquear em ordem determinística e validar `rowCount` de cada efeito. Falha
   em qualquer recebimento, documento, duplicata, evento, movimento,
   idempotência ou auditoria deve provocar rollback integral.
5. Usar `IN`, `= ANY(array)` ou `unnest` quando aplicável; não usar `select *`,
   concatenação SQL, `Locate`, N+1, teste de driver, `hasTable`/`Schema::has*`,
   `information_schema`, `pg_catalog` ou `MAX()+1` no caminho de negócio.

## Testes obrigatórios

Cobrir, na conexão PostgreSQL autoritativa:

- confirmação 100 → 90 gerando valor líquido 10 no documento/duplicata;
- confirmação com valor líquido zero sem criar título;
- datas de emissão/lançamento distintas da data de confirmação;
- atualização de duplicata com data anterior e nova data;
- estorno limpando todos os vínculos de Contas a Pagar;
- confirmação na mesma data alterando evento por delta;
- confirmação com mudança de data removendo o evento antigo e criando o novo;
- múltiplos eventos no mesmo movimento;
- estorno sem identidade bancária sem exclusão por heurística de valor;
- movimento zero, eventos restantes, cabeçalho e origem `X`;
- falhas injetadas em cada efeito, `rowCount`, replay e ausência de N+1.
