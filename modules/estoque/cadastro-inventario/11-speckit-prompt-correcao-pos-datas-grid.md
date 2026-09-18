# Prompt corretivo 11 — revisão pós-datas, grid e painel de negativos

## Contexto

Revise a implementação vigente do Cadastro de Inventário no Laravel, commit `1c53c7150`,
após o prompt corretivo 10. Use o código atual, `laravel/specs/487-fix-inventario-datas-grid/`
e os artefatos de `modules/estoque/cadastro-inventario/`. Não solicitar inspeção direta dos
fontes Delphi. Este prompt é residual e não deve desfazer as correções anteriores.

O fluxo do operador continua sendo um único comando **Processar**. A prévia pode existir
internamente para validação/autorização, mas não criar botão de “Simular processamento”.

## Correções obrigatórias

### 1. Separar os três significados de posterior

O código atual usa conceitos distintos com aliases próximos. Separe contratos, queries, campos
de resposta e testes:

1. **Projeção por data**: saldo inicial usa o último movimento com
   `movimentos.data <= inventario.data`; projeção de calendário usa
   `inventario.data < movimentos.data <= inventario.processamento`. Repetir a regra em
   `movimentoslotes`.
2. **Concorrência/alteração do item**: bloqueio e explicação da prévia continuam usando
   `movimentos.processamento > inventarioprodutos.datahoraalteracao` e o equivalente de
   lotes. Não somar esse conjunto novamente se o movimento já entrou na projeção por data.
3. **Saldo negativo posterior**: flag independente, calculada pela posição efetiva conforme o
   SQL legado capturado. Deve considerar `emestoque`, `reservado` e `reservaprevia`, não
   apenas quantidade de movimentos ou concorrência.

Na versão atual, `flagSaldoNegativoPosterior()` considera somente `emestoque`, e
`listPosterioresProjecao()` lista o intervalo sem restringir às linhas que possuem saldo
negativo. Corrigir:

- não usar `posteriores_count` de concorrência como
  `possuisaldonegativoposteriormente`;
- não marcar item como negativo só porque houve movimento;
- calcular a flag com uma consulta agregada/set-based, incluindo as três posições;
- retornar no painel apenas os movimentos/linhas negativos, com Data, Estoque, Reservado e
  Reserva Prévia;
- preservar o corte temporal exato da consulta `qryMovimentosNegativoPosteriores`
  documentada nos artefatos. Se o SQL legado usa a Data do Processamento inclusive, preservar
  esse limite; não substituí-lo silenciosamente por todo o intervalo de projeção;
- tratar Produto + Filial + Lote com a mesma semântica;
- com datas iguais, não criar falso negativo por projeção;
- manter o filtro do grid principal como filtro do conjunto já carregado, sem N+1.

Use nomes explícitos como `movimentado_posterior`,
`possui_saldo_negativo_posteriormente` e `posteriores_negativos`.

### 2. F6, prévia e F8 devem usar as mesmas fórmulas

O F6 atual calcula `diferenca` como quantidade menos apenas `emestoque` e
`saldoaposprocessamento` por uma fórmula própria baseada em quantidade, reservado e reserva
prévia. Isso diverge do SQL legado e do plano de processamento. Além disso, a projeção atual
usa `SUM(m.quantidade)` sem os sinais derivados de `operacao`.

Corrigir para que F6, prévia, painel e persistência usem a mesma fotografia:

- saldo inicial e saldos de reserva vêm do mesmo último movimento;
- diferença respeita a composição de saldo do legado, sem subtração parcial criada na camada
  HTTP;
- `movimentado` respeita os sinais/posições da operação, inclusive as posições aplicáveis;
- saldo após processamento, custo, financeiro e campos `*processamento` representam a
  fotografia até `inventario.processamento`;
- lotes usam a mesma regra em `movimentoslotes`;
- remover fórmulas duplicadas divergentes entre `LegacyInventarioReadRepository` e
  `InventarioProcessingPlanBuilder`, ou provar paridade por teste;
- o valor exibido pelo F6 não pode divergir do valor confirmado pelo Processar;
- manter binds e consultas set-based; usar `IN`, `ANY(array)` ou `unnest` para
  enriquecimentos, nunca uma query por item/lote.

Testar movimento na Data do Inventário, na Data do Processamento, depois do processamento,
negativo em cada uma das três posições e produto com lote.

### 3. Persistir/recarregar datas antes do F6 e revalidar no F8

Na versão atual, alterar Data do Inventário, Data do Processamento ou Filial apenas limpa a
prévia. O F6 pode continuar consultando as datas antigas persistidas porque o pedido de F6
envia apenas identificadores/filial.

Obrigatório:

- em Situação A, salvar o par de datas antes de uma consulta que dependa dele, ou fazer o F6
  usar um contrato server-side explícito que persista e valide o par antes da leitura;
- F6, prévia e F8 nunca podem usar datas livres ou uma fotografia anterior do navegador;
- o comando Processar deve reler o cabeçalho dentro da transação e recusar
  `processamento < data` antes de qualquer efeito;
- em caso de erro, não alterar Situação, Movimentos, lotes ou fotografias;
- a Data do Processamento permanece intacta ao marcar `P`;
- `LimitedeDiasParaProcessamentoInventario` continua sendo regra distinta, comparando a Data
  do Inventário com a data corrente do servidor;
- mudança de Data, Filial ou filtros invalida prévia/hash/autorização e não mistura linhas de
  consultas diferentes.

### 4. Corrigir precedência dos estilos do grid

O código já usa `columnId`, mas a combinação atual não reproduz o legado:

- diferença em vermelho somente na coluna `diferenca`;
- selecionado pelo sistema em azul somente fora da linha ativa e nas colunas aplicáveis;
- saldo negativo em negrito somente em Situação `A`;
- na coluna de diferença, vermelho prevalece sobre azul, sem classes conflitantes;
- fundo de alterado somente em `A` e fora da linha ativa;
- nunca fundo vermelho genérico por diferença/saldo negativo;
- documentar tokens de cor equivalentes ao legado;
- testar combinações de linha ativa, diferença, selecionado, negativo, alterado e Situação
  `P/T`.

### 5. Corrigir painel e ações assíncronas

O painel só aparece com saldo negativo real e não pode listar toda a projeção. No componente
React:

- callbacks de excluir/copiar devem retornar `Promise` (ou contrato equivalente);
- manter botões desabilitados até a requisição e o `applyShow` terminarem;
- liberar o busy em `finally`, tratar erro e impedir clique duplicado;
- excluir recarrega o mesmo Inventário; copiar abre o novo Inventário retornado, sem F8;
- servidor exige Situação `A`, filial, revisão, permissão e confirmação;
- ações são transacionais/auditáveis e validam novamente o conjunto negativo no servidor;
- respeitar linhas de lote, sem exclusão parcial silenciosa;
- não mudar Situação para `P` nem criar Movimentos de estoque.

### 6. Não usar estado antigo ao informar divergência

Em `Index.tsx`, a mensagem após a prévia usa `itens` do estado React, que pode ser de um
F6 anterior. Use a resposta recém-gerada pela prévia/plano para indicar divergência, itens em
negrito e painel, sem depender de F6 anterior.

## Número de Movimento — preservar o comportamento já correto

O writer atual omite `numero` no INSERT de `movimentos` e usa o identificador retornado pelo
banco para criar o registro de lote. Preservar isso: o trigger/estratégia autoritativa da tabela
gera o número.

Não reintroduzir `MAX(numero)+1`, allocator paralelo, número calculado no PHP ou preenchimento
manual de `movimentos.numero`. Testar que o INSERT omite a coluna e que o ID retornado é usado
em `movimentoslotes`.

## Regras permanentes

- um único fluxo de operador: Processar; prévia somente interna;
- F6/relatório cancelável desde o início e sem publicar resultado parcial;
- grid Laravel com ordenação, exportação, personalização, redimensionamento e catálogo;
- grid não edita célula; Produto/Lote edita somente no modal em Situação A;
- não usar N+1, concatenar SQL, testar driver, `hasTable`, `Schema::has*` ou equivalente;
- não pedir verificação direta de fonte Delphi;
- não criar migration/ALTER/tabela/coluna/FK/função sem schema autoritativo;
- usar INNER JOIN para relação comprovadamente obrigatória e LEFT JOIN apenas para relação
  opcional;
- não introspectar schema em runtime.

## Aceite mínimo

1. Fixture única produz os mesmos saldos/diferenças no F6, prévia e F8.
2. Concorrência posterior não é confundida com saldo negativo; reserva e reserva prévia também
   são detectadas.
3. Painel contém somente o detalhe negativo correto e fica oculto sem negativos.
4. Datas invertidas são recusadas no F8 sem mutação.
5. Movimento é inserido sem `numero`; banco/trigger fornece o ID.
6. Cores, negrito, fundo alterado e precedência passam nos testes React.
7. Copiar/excluir mantém busy durante toda a Promise, é concorrente/idempotente e não processa.
8. Testes cobrem limites temporais, lotes, negativos por posição, paridade F6/F8, concorrência e
   orçamento de queries.

Ao concluir, informe arquivos alterados, testes executados e bloqueios de schema.

### Testes proibidos encontrados na implementação atual

Revise e substitua os testes que inspecionam driver ou existência estrutural, incluindo testes
que chamem getDriverName(), hasTable ou Schema::has* para decidir se devem executar. Os testes
devem exercer o contrato com fixtures e ambiente autoritativo; não transformar a infraestrutura
em comportamento de produção.
