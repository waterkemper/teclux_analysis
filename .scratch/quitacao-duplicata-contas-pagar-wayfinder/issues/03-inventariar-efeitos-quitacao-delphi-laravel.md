# Inventariar dados e efeitos transacionais da Quitação de Duplicata

Type: task
Status: resolved
Blocked by:

## Question

Quais tabelas, funções, sequences, locks, transações, lançamentos contábeis, movimentos/Eventos bancários, impostos derivados, lotes, logs e validações pós-gravação participam da quitação/cancelamento/refazer no Delphi, quais equivalentes e ativos reutilizáveis existem hoje no Laravel e quais riscos de concorrência, retry, duplicidade ou efeito parcial precisam ser eliminados?

## Answer

### Conclusão

`CONFIRMADO` — No Delphi, Quitação não é uma atualização isolada de `duplicatas`. `QuitarDuplicatas` prepara os dados e chama `GravarContasPagar(topPAGAMENTO)`; esta função valida impostos, cria/agrupa movimento e eventos bancários, gera lançamentos contábeis, submete todos os datasets por `Perpetrar(...)` e só confirma após uma reconciliação financeira (`dmcontaspagar.pas:3747-3862,1756-2640`). Cancelamento percorre o caminho inverso e Refazer encadeia cancelamento + reaplicação.

`DIVERGENTE` — O Laravel atual possui transação apenas do save cadastral: atualiza `documentospag`, executa `duplicatas::replaceAll` e sincroniza impostos. Não cria movimento bancário de origem Pagamento, lote/lançamento contábil, log financeiro, lock/revisão ou reconciliação (`DocumentoPagCadastroPageService.php:322-334,348-383`).

### Agregado e dados persistidos no Delphi

| Área | Tabelas/datasets confirmados | Papel na Quitação |
|---|---|---|
| Documento/parcela | `documentospag`, `duplicatas` | Parcela recebe `datapagto`, `valorpagto`, `valordesconto`, `filialpagto`, `tipopagamento`, `contapagto`, `chequepagto`, `usuario`, `observacao`, `evento`, `sequencia`, `sequenciaevento`, `nrlotecontabil` e auxiliares que preservam Data/Conta/Cheque para cancelamento (`dmcontaspagar.pas:3747-3845,2493-2515`). |
| Agrupamento | `qryLotesPagamento_Duplicatas` e cópias de Documento/impostos do lote | Descobre parcelas que compartilham lote/cheque, permite cancelamento total e recalcula os efeitos remanescentes (`dmcontaspagar.pas:1204-1279,2017-2039`). |
| Bancos | `movtosbancos`, `movtosbancoseventos` | Cabeçalho agregado por Conta/Data/Sequência e detalhe por Evento/Sequência-evento; origem do cabeçalho é `P` (`dmcontaspagar.pas:2322-2419`). |
| Contabilidade | datasets de lançamentos do Documento, pagamentos de Duplicatas e vínculo Documento↔lançamentos | Pagamento usa origem `P`, data da quitação, exercício do ano, Filial de Pagamento e número de lote composto; cancelamento exclui a parcela e reequilibra crédito agregado (`dmcontaspagar.pas:1765-1983`). |
| Tributário | `documentospagimpostosretidos`, `duplicatasimpostosretidos`, configurações de vencimento/contas e equivalentes do lote | Valida e grava documentos derivados conforme a ocasião `PagamentoDuplicatas`; bloqueia cancelamento quando imposto derivado já foi quitado (`dmcontaspagar.pas:1987-2039,2200-2232,2281-2311`). |

`CONFIRMADO` — Adiantamento (`tipopagamento=3`) não cria novo movimento bancário na Quitação da Duplicata, pois o movimento já nasceu no Documento de Adiantamento (`dmcontaspagar.pas:2322-2325,2423-2426,4874-4881`). Quitação com 100% de desconto entra na condição bancária do legado, mas os campos Conta/Tipo foram limpos; a validação trata Conta zero como sem movimento. Isso é `POSSÍVEL BUG LEGADO`/regra ambígua e não deve ser copiado sem decisão.

### Movimento bancário e agrupamento

- A integração só ocorre quando `datapagto >= parametros_valor('Início Integração Bancos')` e o parâmetro é posterior a 01/01/1980 (`dmcontaspagar.pas:2322-2331`).
- A chave do cabeçalho é **Conta + Data + Sequência**; o detalhe acrescenta **Evento + Sequência-evento**. Para movimento novo, o Delphi consulta o maior número e soma 1 (`dmcontaspagar.pas:2351-2363`).
- O cabeçalho recebe compensação igual à Data de Pagamento, Evento, `origemlancto='P'`, cheque formatado como Documento, histórico do pagamento e valor. O evento recebe o valor da parcela (`dmcontaspagar.pas:2364-2387`).
- Em pagamento múltiplo, o cabeçalho acumula valor negativo, muda observação para “PAGTO DIVERSAS DUPLICATAS” e limpa o Evento do cabeçalho; cada Duplicata mantém seu detalhe (`dmcontaspagar.pas:2392-2417`).
- No cancelamento, remove o evento correspondente e exclui o cabeçalho se ficou sem valor; caso contrário subtrai a parcela e restaura descrição/Evento quando deixa de ser múltiplo (`dmcontaspagar.pas:2423-2488`).
- `RISCO CRÍTICO` — “consultar MAX + 1” para sequência e sequência-evento não mostra lock atômico. Duas quitações simultâneas na mesma Conta/Data podem escolher a mesma chave, sobrescrever/violar PK ou agregar incorretamente.

### Contabilidade e lote

- Com `GERARCONTABILIDADE`, a Duplicata recebe `nrlotecontabil`. O lote combina próximo número do exercício + Documento + número da parcela; em agrupamento, lançamentos comuns podem usar a raiz do lote terminada em zeros (`dmcontaspagar.pas:1800-1865,3820-3840`).
- Os lançamentos de pagamento usam Data de Pagamento, ano como exercício e Filial de Pagamento; a origem contábil é `P` (`dmcontaspagar.pas:1845-1864,1871-1873`).
- Cancelamento total apaga o lote. Cancelamento individual remove débito/crédito da parcela, reduz o crédito agregado e converte o lote múltiplo remanescente em origem/complemento individual quando necessário (`dmcontaspagar.pas:1868-1983`).
- Antes de persistir, a UI Delphi gera e verifica balanceamento dos lançamentos; `GravarContasPagar` finalmente inclui os datasets contábeis no mesmo `Perpetrar` (`fmcadastroduplicatascontaspagar.pas:393-420`; `dmcontaspagar.pas:2519-2557`).
- `RISCO CRÍTICO` — O próximo lote/número de lançamento também é alocado por consulta/estado mutável. O Laravel precisa de sequence PostgreSQL ou allocator com lock, nunca `MAX+1`.

### Impostos derivados

- O Delphi chama `Verificarimpostosretidos` primeiro em modo `VALIDAR` e depois `GRAVAR`, tanto para a parcela corrente quanto para todo o lote em cancelamento total (`dmcontaspagar.pas:2200-2232,2281-2311`).
- A operação recebe `OrigemImpostosRetidos=PagamentoDuplicatas`, Documento/Duplicatas fonte, configuração por Filial e gerador de próximo Documento. Documentos derivados guardam vínculo `documentopagorigem + datavenctoorigem + numeroorigem`.
- Quitação de imposto derivado impede removê-lo ou cancelar sua fonte. Isso é invariante, não simples readonly de UI.
- `RISCO` — O gerador usa novo número de Documento; qualquer allocator não atômico pode duplicar números. Geração repetida precisa localizar pelo vínculo e ser idempotente.

### Unidade transacional e reconciliação Delphi

- Pagamento e cancelamento passam a `Perpetrar` uma lista única contendo Documento, Duplicata, lote, impostos fonte/derivados, movimentos/eventos bancários e, quando existente, Contabilidade (`dmcontaspagar.pas:2527-2588`).
- Depois da submissão, `ValidarValoresDocumentosPag(Conta,Data,Sequencia,ehCancelamento)` compara os valores persistidos. Falha executa `Rollback` explícito e reabre o Documento (`dmcontaspagar.pas:2599-2635,4874-4906`).
- Só depois da reconciliação verdadeira ocorre `Perpetrar([])`, que encerra/ confirma a unidade, e as Duplicatas são relidas (`dmcontaspagar.pas:2609-2635`).
- O próprio código alerta que alterações posteriores não persistem sem fechar a transação, sinal de fragilidade do mecanismo legado (`dmcontaspagar.pas:2589-2595`).
- `CONFIRMADO` — Não foi localizado log de auditoria financeira durável contendo antes/depois, operador, autorizador e motivo. O campo `duplicatas.usuario` registra usuário operacional, mas não substitui auditoria nem prova de autorização.

### Ativos Laravel reutilizáveis

| Ativo atual | Reuso seguro | Limite confirmado |
|---|---|---|
| `DB::transaction` no `DocumentoPagCadastroPageService` | Padrão de unidade de trabalho e tratamento de exceção | Hoje engloba `replaceAll` cadastral, não locks, comando financeiro ou reconciliação (`DocumentoPagCadastroPageService.php:322-334,370-383`). |
| `LegacyDuplicataRepository` | Leituras e writes pontuais `insert/update/delete` | `replaceAll` apaga/recria todas as parcelas e não serve para Quitação concorrente (`LegacyDuplicataRepository.php:24-109`). |
| `DocumentoPagImpostosRetidosGenerationService` + repository tributário | Regras por ocasião, rateio, vínculo, upsert/remove e proteção de derivado quitado | É chamado no save geral para as duas ocasiões; deve ser invocado somente pela ocasião financeira real e ganhar lock/idempotência (`DocumentoPagImpostosRetidosGenerationService.php:34-173,198-331`). |
| `LegacyMovtosBancosRepository` | Mapeamento das tabelas, leituras, chave, eventos e utilitários | CRUD manual grava `origemlancto='B'`, usa `max()+1` e abre transações internas. Não chamar `insertMovimento` diretamente para pagamento; extrair writer `P` que participe da transação externa (`LegacyMovtosBancosRepository.php:386-405,563-611`). |
| framework de operação sensível | Validar/consumir proof e recuperar autorizador | O fluxo atual de Pagar descarta o proof. O trait oferece peek antes do write e consume após sucesso, útil para evitar consumo em rollback (`ValidatesSensitiveOperationProof.php:15-78`). |
| repositories de Documento/Impostos | Lookups de Evento, Conta, Filial e vínculos tributários | `nextCodigo()` usa procedure no PostgreSQL, mas fallback SQLite é `MAX+1`; precisa comportamento concorrente testável (`LegacyDocumentoPagRepository.php:47-72`). |

`NÃO LOCALIZADO` — writer Laravel de lançamentos contábeis de pagamento/origem `P`, allocator atômico de lote contábil, command log/idempotency store, lock/revision de Documento/Duplicata, reconciliação Quitação↔Bancos↔Contabilidade e serviço dedicado para cancelar/refazer.

### Contrato transacional encaminhado à matriz

1. Abrir uma única `DB::transaction` no application service; não aninhar writers que confirmem isoladamente.
2. Reler e aplicar `lockForUpdate` ao Documento, Duplicata, derivado tributário vinculado e cabeçalho bancário Conta/Data/Sequência relevante.
3. Validar `expected_revision`/assinatura financeira, estado aberto/pago, Filiais, Data Contábil, proof e idempotency key.
4. Recalcular valor, parcial/residual, desconto e saldo de Adiantamento server-side.
5. Persistir pontualmente a Duplicata; nunca aceitar `usuario`, autorização, Evento, sequências ou lote vindos do cliente.
6. Gerar impostos, movimento/evento origem `P` e Contabilidade com allocators atômicos.
7. Gravar auditoria financeira na mesma transação; consumir/vincular proof somente ao sucesso.
8. Reconciliar antes do commit: soma dos detalhes = cabeçalho bancário; débito = crédito; vínculos tributários válidos; estado da Duplicata coerente. Qualquer divergência lança exceção e faz rollback integral.
9. Retornar snapshot pós-commit e reutilizá-lo em retry pela idempotency key.

Cancelamento deve desfazer exatamente os efeitos identificados pela quitação original, sem “procurar por valor” ou recalcular chaves. Refazer deve executar cancelamento + reaplicação dentro da mesma transação e mesma trilha de auditoria, sem estado intermediário aberto observável.

### Matriz de riscos obrigatória

- **Concorrência:** duas quitações da mesma parcela; duas parcelas na mesma Conta/Data; duas residuais; cancelamento concorrente com retorno/lote.
- **Retry/duplicidade:** duplo clique, timeout após commit, reprocessamento de arquivo e job reiniciado não podem criar segundo movimento, evento, lote, imposto ou residual.
- **Efeito parcial:** falha induzida após cada writer deve deixar zero efeitos; transações internas não podem confirmar antes da externa.
- **Deriva:** `replaceAll` cadastral não pode alterar/limpar campos financeiros; update do Documento deve rejeitar parcelas pagas/autorizadas/vinculadas.
- **Reconciliação:** valor da Duplicata, evento bancário, cabeçalho agregado, lote contábil e imposto derivado precisam fechar antes do commit e também por rotina diagnóstica posterior.
- **Auditoria:** registrar comando, origem (`ui|lote|retorno`), operador, autorizador, proof/contexto, Filiais, antes/depois, motivo, idempotency key, resultado e correlação, sem senha.

### Decisão para o próximo frontier

`DECISÃO ENCAMINHADA` — Não reutilizar o CRUD bancário como comando financeiro nem ampliar `replaceAll`. A matriz deve definir um application service de Quitação com writers especializados e transação externa: writer pontual da Duplicata/residual, adaptador tributário existente, novo writer bancário origem `P`, novo writer contábil e auditoria/idempotência/reconciliação compartilhadas. Tela, lote e retorno tornam-se adaptadores do mesmo motor.
