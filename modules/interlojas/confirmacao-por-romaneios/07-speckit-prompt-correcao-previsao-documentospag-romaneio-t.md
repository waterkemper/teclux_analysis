# Prompt para `/speckit.specify` — correcao Laravel de previsao no Romaneio T

~~~text
/speckit.specify

Crie a especificacao de implementacao (e o plano de testes) para corrigir, no
Laravel, a confirmacao de interlojas quando um Romaneio do tipo T passa para
ENTREGUE mas o `documentospag.previsao` do documento original permanece
verdadeiro. O Cursor devera implementar a correcao somente apos gerar a
especificacao. Nao altere Delphi (.pas/.dfm), schema, migrations, triggers ou
funcoes PostgreSQL.

Leia antes de especificar:

- modules/interlojas/confirmacao-por-romaneios/README.md
- modules/interlojas/confirmacao-por-romaneios/06-speckit-prompt-correcao-passagem-laravel.md
- modules/interlojas/confirmacao-por-romaneios/pesquisa-sql-dominio-efeitos-delphi.md
- modules/interlojas/confirmacao-por-romaneios/pesquisa-padroes-laravel-reutilizaveis.md
- modules/interlojas/confirmacao-por-romaneios/schema/postgresql-authoritative-2026-08-03.json
- laravel/CONTEXT.md

## Evidencia e contrato

- A situacao canonica deve continuar sendo calculada por
  `atualizar_situacao_romaneio`; nao replique essa regra em PHP.
- No Delphi, a previsao do financeiro e derivada da existencia de itens nao
  entregues (`romaneiosnotas.entrega IS NULL`), mas no fluxo T a situacao pode
  tornar-se ENTREGUE pela conferencia ROE sem que esse campo seja preenchido.
- O PostgreSQL autoritativo nao fornece default para `documentospag.previsao`;
  portanto a escrita Laravel deve ser explicita e nao pode depender do default
  SQLite.
- O documento a reconciliar e o documento original ligado por
  `romaneios.documentopag`, nao o `notaspag.documentopag` criado para a entrada.

## Correcao obrigatoria

No comando de Confirmacao por Romaneios e no caminho compartilhado de entrada
usado pela Confirmacao por Notas:

1. Grave a evidencia de conferencia e invoque a funcao PostgreSQL de situacao
   dentro da mesma transacao/unidade atomica.
2. Depois de obter a situacao canonica, reconcilie o financeiro do Romaneio
   original pelo seam/porta de financeiro existente no Laravel. Para tipo T,
   quando a situacao canonica for ENTREGUE, atualize a previsao do documento
   original para `false`; em estados parciais, passagem ou transito, mantenha a
   previsao conforme a regra de pendencias. Nao fabrique `dataentrega` ou
   `data_hora_recebimento` apenas para forcar o financeiro: documente e teste a
   politica de campos de entrega, preenchendo-os somente quando a evidencia e o
   contrato legado exigirem.
3. Ao criar qualquer `documentospag` de entrada de transferencia, informe
   explicitamente `'previsao' => false` (inclusive no PostgreSQL, onde nao ha
   default). Nao use o documento de entrada para substituir o documento
   original do Romaneio.
4. O replay `already_confirmed` deve ser idempotente e tambem reparar a
   previsao do documento original se a situacao ja for ENTREGUE. Documentos
   pagos/fechados devem seguir a protecao financeira existente e gerar conflito
   auditavel, sem sobrescrita silenciosa.
5. Preserve lock em ordem deterministica, rollback integral, concorrencia,
   auditoria e publicacao da situacao somente apos commit. Nao use
   `Schema::hasTable`, introspeccao de catalogo, teste de driver ou estado
   paralelo Laravel.

### Revisao especifica da Confirmacao por Notas

Inclua no desenho e na implementacao o caminho
`ConfirmarConfirmacaoPorNotasNotaCommand` ->
`LegacyConfirmacaoPorNotasWriteRepository` ->
`LegacyConfirmacaoPorNotasRomaneioRepository`:

- confirme que a combinacao de operacoes `ROS` e `ROE` e realmente valida para
  cada tipo de Romaneio; para tipo T, nao grave uma etapa de saida apenas por
  conveniencia se o contrato exigir somente entrada ou outra etapa;
- mantenha a reconciliacao do documento original do Romaneio mesmo quando a
  entrada fiscal gerar um novo `notaspag.documentopag`;
- no retorno `alreadyConfirmed` (inclusive apos corrida de unicidade), execute
  a mesma verificacao/reparo financeiro de forma idempotente;
- se a nota nao possuir Romaneio associado, confirme somente a entrada fiscal
  e nao invente vinculo, situacao ou baixa financeira;
- diferencie falha de criacao da entrada, falha da conferencia e conflito de
  financeiro, garantindo rollback da unidade atomica;
- adicione testes proprios de Confirmacao por Notas para os casos T entregue,
  T parcial, documento pago, replay, corrida concorrente e erro apos a
  criacao da nota.

## Testes de aceite obrigatorios

Especifique testes de integracao PostgreSQL (ou fixture equivalente ao schema
autoritativo) para:

- Romaneio T com ROE completo: situacao ENTREGUE e documento original
  `previsao=true` tornam-se `false`;
- Romaneio T parcial/em transito: previsao nao e baixada prematuramente;
- entrada de transferencia sempre grava `previsao=false` explicitamente;
- Confirmacao por Notas com Romaneio T aplica a mesma reconciliacao do documento
  original e nao deixa `previsao` stale;
- Confirmacao por Notas sem Romaneio nao altera `romaneios` nem financeiro de
  outro documento;
- a sequencia de operacoes `ROS`/`ROE` varia conforme o contrato do Romaneio e
  nao e gravada de forma fixa sem teste;
- replay `already_confirmed` corrige uma previsao stale sem duplicar evidencia;
- documento original pago/fechado permanece protegido e auditado;
- `romaneiosnotas.entrega`/campos de recebimento seguem a politica documentada,
  sem datas inventadas;
- falha em qualquer etapa faz rollback de conferencia, situacao e financeiro;
- duas confirmacoes concorrentes produzem uma unica atualizacao idempotente;
- teste nao passa apenas porque SQLite aplicou default falso: valide o valor
  enviado pelo writer e execute a matriz contra PostgreSQL.

Entregue matriz requisito -> teste -> evidencia, arquivos Laravel a alterar,
seam de financeiro escolhido, SQL/binds e estrategia de lock. Mantenha fora do
escopo qualquer alteracao Delphi, banco, migration, trigger, cadastro de
Romaneios e mudanca de regra canonica de situacao.
~~~
