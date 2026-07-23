# Inventariar o vínculo bancário no Laravel atual

Type: task
Status: resolved
Blocked by:

## Question

Quais commands, adapters, writers, repositories, campos de schema e testes Laravel atuais participam de Pay, Rebuild, Cancel, lote e retorno, onde documento/observações/chaves são produzidos e quais identificadores bancários são retornados e persistidos hoje?

## Answer

### Superfície atual

O fluxo financeiro de Contas a Pagar está concentrado em `PayDuplicataCommand`, `CancelDuplicataPaymentCommand`, `RebuildDuplicataPaymentCommand`, `ContasPagarMovimentoBancarioWriter`, `LegacyContasPagarMovtosBancosRepository` e `LegacyDuplicataRepository`. A UI chama Pay e Cancel por `DocumentosPagarController`; há rota para Rebuild, porém nenhum acionamento funcional dela foi localizado na UI. `DuplicataDialog` mostra apenas um checkbox “Refazer o pagamento” desabilitado.

Todos os três commands usam Policy/authorization service, Filiais, proof, revisão, idempotência e `DB::transaction`. Essa infraestrutura deve ser preservada, mas a idempotência é finalizada fora da transação de negócio pelo guard atual, fato já coberto pelo dossiê amplo e não redefinido neste inventário.

### Pay: produção e persistência atuais

- `CONFIRMADO`: `PayDuplicataCommand` bloqueia Documento e Duplicata, valida estado/revisão/proof/Filiais e monta primeiro o update da Duplicata com data, valor, tipo, conta, `chequepagto`, filial e `autorizado=true`.
- `CONFIRMADO`: esse update não contém `evento`, `sequencia` nem `sequenciaevento`.
- `CONFIRMADO`: somente depois de atualizar a Duplicata, quando `valorpagto > 0`, chama `writePagamento` com `documento=(string) documentopag`, `observacoes='Pagto doc {documentopag} parc {numero}'`, evento do request, conta/data/valor e filial.
- `DIVERGENTE`: `chequepagto` é persistido na Duplicata, mas não é enviado ao writer; `movtosbancos.documento` recebe o Documento a Pagar.
- `DIVERGENTE`: a descrição é montada no command e não usa nota, complemento nem Parte Fornecedora.
- `DIVERGENTE`: o `evento` usado no movimento não é persistido na Duplicata. Embora normalmente venha de `documentospag.evento` pela UI, o backend aceita o valor do request e não fixa o vínculo criado.
- `DIVERGENTE`: o writer retorna uma `sequencia`, mas Pay só converte o resultado em booleano `efeitos.movimento_bancario`; não atualiza a Duplicata com essa sequência. `sequenciaevento` nem sequer é retornada.
- `CONFIRMADO`: pagamento zero não chama o writer, diferindo do ramo estranho de desconto integral do Delphi. Parcial residual/desconto usa o mesmo writer para o valor efetivamente pago; a parcela residual aberta não recebe vínculo bancário.
- `CONFIRMADO`: o command passa `documento['adiantamento']` ao writer. No writer esse flag apenas dispensa a obrigatoriedade do evento; não impede a criação do movimento. A ausência prática de Duplicatas em Documento de Adiantamento reduz o alcance, mas o contrato interno não garante o skip legado.
- `DIVERGENTE`: `isIntegracaoAtiva` valida apenas se o parâmetro “Início Integração Bancos” existe, é data válida e é posterior a `1980-01-01`; não compara `datapagto` com a data parametrizada.

### Writer e repository bancário

- `CONFIRMADO`: `ContasPagarMovimentoBancarioWriter` é uma fachada fina sobre `LegacyContasPagarMovtosBancosRepository`; não usa o serviço geral `MovimentacaoBancariaService`.
- `CONFIRMADO`: `writePagamento` retorna hoje `{skipped, movimento?: {conta,data,sequencia,valor}}`. Não há `evento` nem `sequenciaevento` no contrato de retorno.
- `CONFIRMADO`: para movimento novo, o repository grava cabeçalho origem `P`, tipo `S`, valor negativo, documento truncado a 20 caracteres e a observação recebida; grava evento com observação idêntica e `sequenciaevento=1`.
- `CONFIRMADO`: para agregado, localiza o primeiro cabeçalho origem `P` por conta+data e, se documento não vazio, também por documento. Como Pay envia `documentopag`, a agregação ocorre apenas entre pagamentos da mesma conta/data/documentopag, não pela sequência ou cheque do contrato Delphi.
- `DIVERGENTE`: no agregado, concatena observações individuais no cabeçalho separadas por quebra de linha; não usa `PAGTO DIVERSAS DUPLICATAS`, não limpa o evento do cabeçalho e não recompõe um histórico canônico.
- `CONFIRMADO`: cada agregado com evento calcula e grava `sequenciaevento=MAX+1` por conta/data/sequência/evento. A variável existe apenas dentro do ramo e é descartada no retorno.
- `POSSÍVEL BUG`: se o evento for nulo (permitido para adiantamento), não há evento bancário nem `sequenciaevento`, mas o writer ainda relata movimento criado.
- `POSSÍVEL BUG`: `proximaSequencia`, `proximaSequenciaEvento` e `proximaSeqCompensacao` usam `MAX+1` sem lock/advisory lock/retry explícito. O lock da Duplicata não serializa movimentos diferentes na mesma conta/data.
- `POSSÍVEL BUG`: a busca e atualização do agregado fazem múltiplas consultas sem lock no cabeçalho; dois pagamentos concorrentes podem perder valor/observação ou colidir nas sequências.

### Cancel

- `CONFIRMADO`: `CancelDuplicataPaymentCommand` lê `contapagto`, `datapagto`, `valorpagto`, `sequencia` e `evento` da Duplicata; limpa pagamento, conta, cheque, filial, autorização, `sequencia` e `evento`; não lê nem limpa `sequenciaevento`.
- `DIVERGENTE`: como Pay não persiste `sequencia`, pagamentos criados pelo Laravel normalmente entram no cancelamento com sequência nula. Nesse caso `reducePagamento` não é chamado e o movimento/evento origem `P` fica órfão.
- `DIVERGENTE`: mesmo quando uma sequência já existe, Cancel passa somente `(conta,data,sequencia,valor,evento)`. O repository escolhe o evento mais recente daquele código (`orderByDesc(sequenciaevento)`), em vez do evento exato vinculado à Duplicata.
- `CONFIRMADO`: se o total do cabeçalho zerar, remove todos os seus eventos e o cabeçalho. Caso contrário, reduz o valor e remove/ajusta o evento escolhido; não atualiza documento, evento ou observação do cabeçalho após restar um único pagamento.
- `POSSÍVEL BUG`: quando o evento escolhido tem valor de magnitude diferente, ele é parcialmente ajustado, podendo fundir efeitos de Duplicatas distintas em uma mesma linha de evento.
- `DIVERGENTE`: Cancel só chama o writer quando `valorPago > 0`; não existe tratamento bancário para desconto integral/valor zero, coerente com Pay atual mas distinto do ramo Delphi.

### Rebuild

- `CONFIRMADO`: `RebuildDuplicataPaymentCommand` exige Duplicata já paga, mas não executa Cancel, não reduz/remove o movimento anterior, não limpa/regrava chaves da Duplicata e não altera os fatos de pagamento.
- `DIVERGENTE`: ele chama diretamente `writePagamento` novamente, com `documento=documentopag` e `observacoes='Refazer pagto doc {documentopag} parc {numero}'`. Na prática pode criar ou agregar outro débito/evento ao movimento anterior.
- `DIVERGENTE`: descarta também a `sequencia` retornada e não tem acesso a `sequenciaevento`. Assim não reproduz o refazer Delphi (desfazer e reaplicar) e pode duplicar o efeito bancário a cada idempotency key nova.
- `NÃO LOCALIZADO`: consumo funcional da rota Rebuild no frontend atual. A rota, request, controller, command e ability existem; o controle visual está desabilitado.

### Lote e retorno

- `CONFIRMADO`: `PayDuplicatasBatchAdapter` é apenas um loop sequencial de `PayDuplicataCommand`, mesclando pagamento compartilhado com cada item e criando idempotency key por item. Não oferece agrupamento compartilhado por cheque/sequência e não envolve o conjunto em transação única.
- `CONFIRMADO`: `ApplySupplierPaymentReturnAdapter` apenas resolve opcionalmente o evento parametrizado de romaneio, define origem/idempotency key e delega ao mesmo Pay.
- `NÃO LOCALIZADO`: consumidores de produção desses dois adapters fora das próprias classes. Não há controller/route/job/importador Laravel apontando para eles no código atual analisado.
- `CONFIRMADO`: o único teste dos adapters verifica que o container consegue resolvê-los. Não testa pagamento, movimento, agrupamento, retorno nem idempotência.
- `DIVERGENTE`: se forem conectados como estão, lote e retorno herdarão documento/observação/vínculo incorretos; lote não agrupará como o Delphi e retorno poderá gravar `documentopag` mesmo sem cheque.

### Schema e representação da Duplicata

- `CONFIRMADO`: o banco legado real possui `duplicatas.sequenciaevento`, conforme o Delphi e a questão observada. Porém o shape SQLite criado pelo Laravel para `duplicatas` contém `sequencia` e `evento`, mas omite `sequenciaevento`.
- `CONFIRMADO`: o shape SQLite de `movtosbancoseventos` contém a chave primária completa `(conta,data,sequencia,evento,sequenciaevento)` e FK para o cabeçalho; `movtosbancos.documento` permite 20 caracteres.
- `DIVERGENTE`: `LegacyDuplicataRepository::mapRowToForm` expõe `sequencia` e `evento`, mas omite `sequenciaevento`, mesmo quando a coluna existe no PostgreSQL legado.
- `CONFIRMADO`: `updateDuplicata` não usa allowlist de colunas e tecnicamente poderia gravar `sequenciaevento` se recebesse o campo em PostgreSQL, mas o shape SQLite atual falharia. A omissão está nos commands, mapper e migration de testes, não em uma proibição explícita do update.
- `CONFIRMADO`: `LegacyDocumentoPagRepository` já oferece `existsNotaByDocumentoPag`; o Documento carregado contém complemento, fornecedor e tipo. A base também já consulta `vfornecedores` em outros read models, portanto os dados para um formatter canônico são alcançáveis sem confiar no browser, embora ainda não exista formatter de histórico bancário.

### Testes atuais

- `CONFIRMADO`: os arquivos PostgreSQL de pagamento integral, parcial/zero/cheque, cancel/rebuild, concorrência, rollback e adiantamento são apenas marcadores; após validar o driver, executam `markTestSkipped` por falta de fixture legado completa.
- `CONFIRMADO`: não há teste direto de `ContasPagarMovimentoBancarioWriter` ou `LegacyContasPagarMovtosBancosRepository` no contexto de Contas a Pagar.
- `CONFIRMADO`: os testes extensos de `MovimentacaoBancariaService` exercitam outro repository/serviço e não provam o contrato específico de origem `P` usado por Pay.
- `NÃO LOCALIZADO`: assert de que Pay grave `movtosbancos.documento`, observações de cabeçalho/evento, `duplicatas.sequencia`, `duplicatas.evento` ou `duplicatas.sequenciaevento`; assert de cancelamento do evento exato; assert de rebuild sem duplicação; cobertura real de lote/retorno.

### Síntese para a decisão seguinte

A infraestrutura Laravel já tem a costura correta — commands transacionais, writer dedicado e repository origem `P` — mas o contrato entre eles é incompleto. Pay grava o fato da Duplicata antes de criar o movimento e descarta a chave criada; o repository conhece `sequenciaevento` apenas internamente; Cancel tenta desfazer por heurística; e Rebuild duplica o writer sem desfazer. Documento/histórico são produzidos nos commands com semântica divergente, e agregação é baseada no `documentopag`. Lote e retorno ainda são adapters desconectados que delegam a Pay. A correção deve aprofundar a interface existente, retornar a identidade bancária completa e persistir o vínculo dentro da mesma transação, em vez de criar um segundo motor.
