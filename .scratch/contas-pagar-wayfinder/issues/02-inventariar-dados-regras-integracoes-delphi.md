# Inventariar dados, regras e integrações Delphi de Contas a Pagar

Type: task
Status: resolved
Blocked by:

## Question

Quais datasets, SQLs estáticos e dinâmicos, macros, parâmetros de consulta, campos calculados, tabelas, funções, procedures, transações, escritas, relatórios, arquivos, remessas/retornos e módulos auxiliares sustentam os fluxos alcançáveis de Contas a Pagar, e quais invariantes, efeitos colaterais, riscos e limites de integração eles revelam?

## Answer

### Síntese arquitetural

`CONFIRMADO` — `documentospag` é a raiz do agregado operacional e `duplicatas` é sua coleção de parcelas. Uma quitação não é uma simples atualização da Duplicata: pode produzir/alterar `movtosbancos`, `movtosbancoseventos`, `lancamentos`, impostos retidos derivados e vínculos de lote. `TdtmContasPagar.GravarContasPagar` coordena essas mudanças, chama `Perpetrar(...)` com os datasets participantes e valida o resultado por funções PostgreSQL; falha provoca rollback e reabertura (`dmcontaspagar.pas:1756-2657,2521-2636,4874-4907`).

`DECISÃO` — A futura implementação deve tratar Documento, Duplicatas, impostos derivados, Contabilidade e movimentos bancários como uma **unidade de trabalho transacional única**, mantendo o PostgreSQL legado e suas funções como parte do contrato até que a matriz Laravel demonstre substituição segura. Não é aceitável gravar cada efeito em endpoints/transações independentes.

### Grafo de dados alcançável

- **Documento** — `documentospag`: número, fornecedor/tipo, emissão, lançamento, Filial de emissão/contábil, complemento, referência, valor bruto e líquido calculado, impostos retidos, previsão, Pedido, Evento, contas contábeis, origem, administrador, fornecedor para ISS, adiantamento, pagamento/conta/cheque do Adiantamento e Regime de Caixa. Query mestre e consultas usam `documentospag`, `vfornecedores`, `filiais` e `notaspag` (`dmcontaspagar.dfm:32-106,1115-1200,1573-1631`).
- **Duplicata** — `duplicatas`, chave composta funcional `documentopag + datavencto + numero`: valor de vencimento, desconto, juros/multa e tipos, pagamento, Filial, Tipo de Pagamento, Conta, cheque, usuário, autorização/data, Evento, observação, sequências bancária/Evento e número de lote contábil (`dmcontaspagar.dfm:713-874`).
- **Origem fiscal** — `notaspag` vincula Documento originado em Nota; documentos derivados de impostos usam `documentopagorigem + datavenctoorigem + numeroorigem`. A origem bloqueia alterações/exclusão local e liga pagamentos de impostos ao vencimento original (`dmcontaspagar.dfm:1186-1200,1573-1631,1754-1971`; `dmcontaspagar.pas:3710-3744`).
- **Impostos retidos** — consultas espelho de `documentospag`/`duplicatas`, configuração `venctosimpostosretidosentradas` e contas `contasentradasfiliais`. O fluxo chama `Verificarimpostosretidos(...)` para validar/criar/ajustar os documentos tributários associados (`dmcontaspagar.dfm:1754-2127`; `dmcontaspagar.pas:1987-2013,2200-2309`).
- **Pagamento bancário** — `movtosbancos` é o movimento agregado por Conta/Data/Sequência; `movtosbancoseventos` detalha Evento e sequência do Evento. `contas`, `bancos`, `agencias`, `tipospagamentos` e Evento fornecem configuração/lookup (`dmcontaspagar.dfm:1269-1509,2355-2816`).
- **Contabilidade** — `lancamentos` é manipulada por `TdtmLancamentoContabilidade`; Documento usa origem `D` ou `E`, Adiantamento usa `A`, pagamento usa `P`. `lancamentos_proximonrlancto(...)` e consulta de máximo compõem numeração/lote (`dmcontaspagar.dfm:1533-1549,2295-2337`; `dmcontaspagar.pas:1765-1985`).
- **Adiantamento** — saldo deriva de entradas do Documento de Adiantamento menos saídas já consumidas e a saída do Documento corrente; há segunda verificação de saldo contábil via `SaldoContabil(...)` quando Contabilidade está ativa (`dmcontaspagar.dfm:2162-2272`; `dmcontaspagar.pas:4488-4606`).
- **Totais de UI** — `cdsTotalDuplicatas` agrega vencimento, desconto, juros, multa, a pagar, pago, juros/descontos pagos; Valor Líquido do Documento é bruto menos IRRF, INSS, ISS, PIS, COFINS, CSLL e o combinado (`dmcontaspagar.pas:3027-3068,4829-4841,5970-6006`; `dmcontaspagar.dfm:5494-5571`).

### Consultas, macros e identidade

- `CONFIRMADO` — Documento é procurado por consulta enriquecida com Fornecedor e totais; Duplicatas usam macro `SelecionarPorChave`, normalmente vazia para todas as parcelas e preenchida por Vencimento+Número nos fluxos em lote (`dmcontaspagar.dfm:32-106,713-874`; `dmcontaspagar.pas:3747-3761,3924-3966`).
- `CONFIRMADO` — pesquisas parametrizadas abrangem Fornecedores, Filiais, Tipos de Pagamento, Contas/Bancos e Eventos. SQL dinâmico fica restrito a macros montadas no servidor Delphi; nenhum consumidor fornece SQL arbitrário (`dmcontaspagar.pas:1107-1140,1475-1530,2946-3026`).
- `CONFIRMADO` — `documentospag_proximonumero()` gera identidade do Documento; número da Duplicata é sequencial dentro do Documento e `AjustarSequencias` recompõe sua ordem (`dmcontaspagar.dfm:681-682`; `dmcontaspagar.pas:4287-4345`).
- `CONFIRMADO` — pagamentos contábeis usam `nrlotecontabil` composto por prefixo do lote + seis posições do Documento + três da Duplicata. O prefixo com nove zeros representa o agrupamento; o número completo identifica a parcela (`dmcontaspagar.pas:1804-1817,4703-4709,4785-4792`).

### Cálculos e invariantes financeiros

- **Valor Líquido** = Valor Bruto − todos os impostos retidos. Impostos não podem exceder o bruto (`dmcontaspagar.pas:2161-2168,3059-3068,4829-4841`).
- **Total das Duplicatas** deve igualar o líquido. Em Regime de Caixa o Usuário pode confirmar a divergência e o bruto é ajustado ao total; fora dele a gravação é bloqueada (`dmcontaspagar.pas:2168-2186`).
- **Valor a pagar** vem da função compartilhada `calcular_valor_pagar(...)`, considerando vencimento, data-base, Filial, multa/juros em valor ou percentual, desconto e primeiro dia útil. O código antigo local está comentado e não é autoridade (`dmcontaspagar.pas:3093-3180`).
- **Pagamento parcial** exige decisão entre gerar nova parcela com o saldo ou converter a diferença em desconto. A nova parcela herda vencimento, juros/multa e recebe nova autorização conforme parâmetro (`dmcontaspagar.pas:2659-2745`).
- **Quitação com valor zero** representa 100% de desconto mediante confirmação e limpa dados bancários/tipo de pagamento (`dmcontaspagar.pas:3345-3360`).
- **Cheque** não pode ser reutilizado em outra data. No mesmo dia pode ser agrupado após confirmação, compartilhando sequência bancária e prefixo contábil (`dmcontaspagar.pas:4386-4447`).
- **Adiantamento** (Tipo de Pagamento 3) não gera novo movimento bancário, pois o caixa já foi movimentado ao criar o Adiantamento; exige saldo operacional e, com Contabilidade, saldo da conta e contrapartida do Fornecedor (`dmcontaspagar.pas:3225-3257,4496-4606,4874-4892,5747-5827`).
- **Impostos vinculados** impedem cancelar a quitação original quando algum Documento tributário derivado já está pago (`dmcontaspagar.pas:3710-3744,3871-3922`).

### Criação e substituição de parcelas

`CONFIRMADO` — Gerar Parcelas valida bruto e impostos, suspende eventos dos datasets, remove todas as Duplicatas existentes e recria `NP` parcelas pelo primeiro vencimento/intervalo, distribuindo a diferença monetária para fechar exatamente o total. A operação apresenta progresso e depois restaura callbacks (`dmcontaspagar.pas:1563-1682`).

`RISCO` — A geração é destrutiva sobre as linhas em memória. A futura implementação precisa exigir estado editável, executar atomicamente, preservar precisão e recusar substituição quando já houver pagamento/vínculos; não deve expor uma sequência de DELETE/INSERT parcialmente observável.

### Pagamento, agrupamento e cancelamento

- `CONFIRMADO` — Pagamento grava data, valor, desconto, Filial, tipo, Conta/cheque, Usuário, observação, sequência, Evento e lote; depois atualiza Contabilidade, movimentos bancários e impostos (`dmcontaspagar.pas:3747-3858`).
- `CONFIRMADO` — Após a data de `InicioIntegracaoBancos`, pagamento não Adiantamento cria `movtosbancos` negativo e `movtosbancoseventos`; se Conta/Data/Sequência já existe, soma ao movimento agregado, troca descrição para “PAGTO DIVERSAS DUPLICATAS” e acrescenta detalhe de Evento (`dmcontaspagar.pas:2315-2417`).
- `CONFIRMADO` — Cancelamento reduz/exclui o movimento agregado e seus Eventos; em lote recalcula lançamentos e descrições restantes. Cancela todos os lançamentos do lote ou somente os da parcela conforme o contexto (`dmcontaspagar.pas:1868-1983,2423-2480`).
- `CONFIRMADO` — Mudança de Evento/contrapartida em Documento já quitado aciona “refazer pagamento”: cancela e reaplica cada pagamento para reconstruir efeitos bancários/contábeis coerentes (`fmcontaspagar.pas:698-778`; `dmcontaspagar.pas:4850-4858`).
- `CONFIRMADO` — O mesmo motor é chamado por **Quitação de Duplicatas**, **Cancelamento de Quitação** e **Leitura de Retorno de Pagamento a Fornecedor**, via `QuitarDuplicatas`/`DesQuitarDuplicatas` (`dmquitacaoduplicatas.pas:814-850`; `dmcancelamentoquitacao.pas:253-257`; `dmLerRetornoPagFor.pas:2703-2773`). Esses consumidores são contratos de integração obrigatórios, não telas internas a reimplementar neste esforço.

### Transação e validação pós-gravação

- `CONFIRMADO` — Conforme a operação, `Perpetrar(...)` recebe Documento, Duplicatas, documentos/duplicatas de impostos, lotes, lançamentos e movimentos bancários; `AguardareTerminarDentroDm` é usado em caminhos sensíveis (`dmcontaspagar.pas:2521-2585`).
- `CONFIRMADO` — Depois da persistência, `ValidarValoresDocumentosPag(conta,data,sequencia,cancelamento)` ou `ValidarValoresDocumentosPag(documento)` verifica invariantes no banco. Resultado falso chama rollback e reabre o Documento (`dmcontaspagar.dfm:3437-3491`; `dmcontaspagar.pas:2599-2636,4874-4907`).
- `POSSÍVEL BUG/RISCO LEGADO` — comentário no código relata que nova alteração de Duplicata pode não persistir após `Perpetrar` sem fechar a transação, levando à reabertura forçada de todas as tabelas (`dmcontaspagar.pas:2590-2595`). O Laravel deve usar fronteira transacional explícita e testes de concorrência; não copiar o workaround de datasets.
- `RISCO DE CONCORRÊNCIA` — próximas sequências bancárias usam `MAX(sequencia)+1` e lote usa `MAX(...) + 1` (`dmcontaspagar.dfm:2295-2337,2708-2767`). Sem lock/constraint/idempotência, duas quitações concorrentes podem colidir. A matriz deve exigir estratégia atômica no banco.
- `RISCO DE RETRY` — não há chave de idempotência de comando visível. Repetir pagamento/retorno pode duplicar movimentos antes das validações finais. Consumidores em lote e retorno exigem identificador durável e comportamento idempotente no Laravel.

### Contabilidade

- `CONFIRMADO` — Documento/Nota persiste lançamentos com data, exercício, Filial e número de origem do Documento. Pagamento cria lote por Duplicata e pode consolidar o crédito de várias parcelas; cancelamento remove a parcela e reequilibra ou desfaz o lançamento agregado (`dmcontaspagar.pas:1765-1985`).
- `CONFIRMADO` — geração contábil é delegada ao frame/data module compartilhado, que recebe callbacks para valores, contas, histórico, origem, Documento e edição. Esse contrato deve ser reutilizado/encapsulado no Laravel, não reimplementado a partir da UI (`fmcontaspagar.pas:444-490,1192-1209`).
- `CONFIRMADO` — histórico do pagamento segue precedência: histórico de pagamento do Fornecedor → Parâmetro do Sistema → histórico contábil geral do Fornecedor → zero (`dmcontaspagar.pas:4860-4872`).

### Impostos retidos

- `CONFIRMADO` — configuração por Filial define quais retenções existem, vencimento/periodicidade e contas. Documentos de imposto mantêm referência tripla à Duplicata original e podem gerar suas próprias Duplicatas (`dmcontaspagar.dfm:1754-2127`).
- `CONFIRMADO` — ISS pode exigir Fornecedor específico; ausência bloqueia gravação. PIS/COFINS/CSLL individuais e combinado são mutuamente exclusivos pela UI e devem permanecer consistentes no backend (`dmcontaspagar.pas:1987-2013,2647-2653`; `fmcontaspagar.pas:1348-1374`).
- `LIMITE` — A implementação interna de `Verificarimpostosretidos` está em infraestrutura compartilhada e será seguida somente até fixar seu contrato de entrada/saída. A especificação de Contas a Pagar deve cobrir quando chamar, atomicidade, vínculos e bloqueios; não migrar todo o motor tributário sem evidência de lacuna Laravel.

### Impressão, arquivos e integrações auxiliares

- `CONFIRMADO` — Autorização e Recibo delegam a `TdtmImprimeAutorizacaoPagto`, fornecendo uma lista serializada de Duplicatas elegíveis; ambos suportam atual ou todas. São saídas de relatório, não gravação financeira (`dmcontaspagar.pas:4625-4688,5851-5969`).
- `CONFIRMADO` — A tela não gera diretamente arquivo de remessa nem lê retorno. Contudo, o motor é consumidor do retorno em `dmLerRetornoPagFor`, logo o contrato de quitação/cancelamento deve permanecer reutilizável por esse fluxo.
- `NÃO LOCALIZADO` — Não há exportação genérica de grid nem anexos no núcleo analisado.
- `FORA DO NÚCLEO` — Gerar remessas, ler retorno, quitação/cancelamento em lote e relatórios próprios são módulos vizinhos. Documentar payloads/chamadas que atravessam a fronteira; não absorver suas UIs completas.

### Contrato mínimo que a matriz Delphi × Laravel deve preservar

1. Agregado Documento + Duplicatas com chave e precisão estáveis.
2. Estado explícito de aberto, previsão, autorizado, pago e cancelável, derivado de fatos persistidos.
3. Comando único e idempotente de pagamento/cancelamento, reutilizável pela tela, lote e retorno.
4. Transação abrangendo efeitos bancários, contábeis e tributários, com rollback integral.
5. Lock/numeração atômica para sequências e lotes; proteção contra concorrência e retry.
6. Reconciliação pós-gravação equivalente a `ValidarValoresDocumentosPag`.
7. Pagamento parcial, desconto integral, cheque compartilhado, Adiantamento e impostos vinculados como casos de aceite obrigatórios.
8. Reabertura/refresh somente após commit, sem depender do estado de datasets para consistência.
