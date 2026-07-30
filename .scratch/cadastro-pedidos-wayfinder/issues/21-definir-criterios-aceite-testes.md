# Definir critérios de aceite e matriz de testes

Type: task
Status: resolved
Blocked by: 20

## Question

Consolidar critérios de aceite e a matriz mínima de testes cobrindo os casos-ouro de cada fatia: cabeçalho (4 validações de `GravarPedido`, máquina de situação), previsões (soma 100%, absorção de resto), itens (auto-cadastro de fornecedor, wipe ao trocar fornecedor), motor de custo (rateio, produto novo sem preço), motor de impostos (ICMS/ICMS-ST com e sem divergência de alíquota, IPI, PIS/COFINS, CSOSN vs. CST por regime do fornecedor), formação de preço de venda, grade (bloqueio de edição quando divergente, produtos compostos), documentos a pagar (espelho com previsões, remoção ao cancelar), e as funcionalidades acessórias decididas em escopo.

## Answer

### Critérios de aceite — Cabeçalho e máquina de situação

- [ ] `GravarPedido` roda as 4 validações na ordem confirmada (≥1 item → ≥1 previsão → soma de percentuais = 100 → total das previsões bate com o valor calculado), cada uma abortando com mensagem própria.
- [ ] Situação do cabeçalho usa código próprio para "Concluído" (não reaproveita o código de "Aberto" — bug legado corrigido, ticket 03/20).
- [ ] `AtualizarSituacaoPedido` deriva corretamente P/A/Concluído a partir da situação agregada dos itens (A/L).
- [ ] `PodeExcluirAlterarPedido` só libera edição/exclusão quando nada foi entregue e a situação não é Cancelado.
- [ ] `ExcluirPedido` ramifica corretamente pelas 4 situações (Liquidado bloqueado; Cancelado/Parcial-liquidado bloqueado; Parcial só permite cancelar; Aberto oferece excluir fisicamente ou cancelar logicamente).
- [ ] "Gerar Pedido de Compra" a partir da Consulta de Compras reabre a mesma instância de tela (singleton) em vez de empilhar rascunhos.

### Critérios de aceite — Previsões

- [ ] Trava em tempo real: gravar uma previsão que faça a soma de percentuais ultrapassar 100 é rejeitado.
- [ ] Resto de arredondamento é sempre absorvido pela primeira previsão (menor número), nunca distribuído.
- [ ] Pedido com previsões somando menos de 100% pode ser salvo como rascunho de item/previsão individual, mas `GravarPedido` do pedido inteiro exige exatamente 100%.

### Critérios de aceite — Itens

- [ ] Trocar o fornecedor do pedido dispara wipe total dos itens existentes (`HouveTrocaFornecedor`).
- [ ] Comprar um produto ainda não vinculado ao fornecedor oferece criar o vínculo produto-fornecedor com confirmação (não é cadastro obrigatório em tela separada).
- [ ] Reduzir a quantidade de um item abaixo do que já foi recebido é bloqueado, revertendo ao valor anterior.
- [ ] Alterar quantidade/preço de um item recalcula as Previsões automaticamente.

### Critérios de aceite — Motor de Custo

- [ ] `PrecoCusto` do item = preço×quantidade + IPI (se não contribuinte) + frete/despesas rateados pelo peso do item + ICMS-ST de custo + frete do item − desconto; ICMS e PIS/COFINS são subtraídos do custo fora de importação/Simples/ST.
- [ ] Rateio de frete/desconto/despesas acessórias: valor a ratear = total menos soma digitada manualmente; distribuição proporcional ao peso; último item absorve o resto.
- [ ] Produto comprado pela primeira vez (sem coluna de preço cadastrada) recebe preço de venda automaticamente ao gravar o pedido, sem passo manual.
- [ ] `NaoAtualizarPrecoMenorQueAtual` impede que a propagação de preço baixe um preço já maior.
- [ ] `CalcularPrecoSugestao`/`CalcularPrecoSugestaoProdutos` (código morto) não são replicados — só o caminho `CalcularCusto`/`CalcularPrecoVenda` via `dmCalcularCusto`.

### Critérios de aceite — Motor de Impostos

- [ ] ICMS: base = quantidade×preço − desconto + frete + seguro + IPI/despesas condicionais; alíquota resolvida por tabela UF origem/destino/contribuinte/consumidor-final (não fixa por produto); as duas reduções de base (oficial vs. custo) calculadas em paralelo.
- [ ] Divergência de alíquota de ICMS dispara o aviso correspondente (`msgDifAliquotaICMS`) sem travar o cálculo.
- [ ] ICMS-ST: base = `(baseICMS+IPI) × fator MVA ajustado × equalização`, com `BaseDupla` sempre falso (Pedidos é sempre entrada) e fator de substituição sempre lido do campo do item, nunca recalculado.
- [ ] IPI: mesma estrutura de base do ICMS, com exclusão opcional do frete (`NaoCalcularIPISobreFrete`); editável por padrão, travado só em transferência entre filiais ou documento eletrônico já vinculado.
- [ ] PIS/COFINS: base soma sempre o IPI, subtrai condicionalmente o ICMS via configuração por filial (`ExcluirICMSdePISeCOFINS`); zerado em notas de importação.
- [ ] CSOSN vs. CST exibido ao usuário segue o regime tributário do **fornecedor** (`CondicaoCSOSN`), não da filial própria.
- [ ] Campos com flag "digitado" (`valoricmsdigitado`, `valoricmsstdigitado`, `ValorIPIDigitado`, `ValorPISDigitado`, `ValorCOFINSDigitado`) suprimem o recálculo automático sobre valores editados manualmente.
- [ ] DIFAL não é calculado em nenhuma circunstância (estruturalmente inaplicável a Pedidos — sempre entrada).
- [ ] Rateio entre produtos compostos: o kit-pai nunca recebe rateio diretamente, só os componentes, proporcional ao preço do componente dentro do kit.

### Critérios de aceite — Formação de Preço de Venda

- [ ] Visualização (se implementada) é somente leitura, reaproveitando os valores já calculados pelos motores de custo/impostos — nenhuma lógica de cálculo própria na tela.

### Critérios de aceite — Grade

- [ ] Quantidade é editável por célula; preço/desconto/ICMS%/IPI% são editáveis só no nível da linha (bulk-update para todas as células).
- [ ] Linha com valores divergentes entre células trava a edição em lote do campo correspondente (`ReadOnly` real no dado, não só aviso de UI) até a divergência ser resolvida item a item.
- [ ] Total de IPI da linha usa a fórmula corrigida (multiplicada por quantidade, simétrica ao desconto — bug legado não replicado).
- [ ] Trocar orientação linha↔coluna preserva os dados já editados.
- [ ] Fechar a grade sincroniza staging→itens reais (atualiza/exclui/inclui conforme a quantidade mudou/zerou/apareceu); nada é gravado no pedido até esse fechamento.

### Critérios de aceite — Documentos a Pagar

- [ ] Gravar o pedido sempre gera (insert) ou reconstrói do zero (edit) exatamente 1 Documento a Pagar, com parcelas espelhando 1:1 as Previsões vigentes.
- [ ] Cancelar ou excluir o pedido remove por completo o Documento a Pagar e suas parcelas — nunca fica "fatura fantasma".
- [ ] `CalcularAcrescimoDesconto` (cascata de desconto/acréscimo, código morto) não é replicado.

### Critérios de aceite — Funcionalidades acessórias

- [ ] Envio de Pedido dispara e-mail com resumo do pedido mediante ação explícita do usuário; nunca automático ao gravar.
- [ ] Importação Daico permanece fora desta entrega até confirmação de relevância de negócio (ticket 12/20); se implementada futuramente, replica "soma se já existe, cria com defaults fiscais senão".

### Matriz mínima de testes

- **Cabeçalho — 4 validações em cascata**: pedido sem item → erro específico; com item mas sem previsão → erro específico; com previsão somando <100% → erro específico; somando 100% mas total divergente do calculado → erro específico; tudo correto → grava.
- **Situação — ciclo completo**: pedido novo (Aberto) → recebe parte de um item (Parcial) → recebe o resto (Concluído, com código próprio, não 'A') → tentar excluir em cada estágio confirma as regras de bloqueio corretas.
- **Previsões — soma e resto**: 3 previsões de 33,33% cada → a primeira recebe o centavo de resto, soma bate exatamente com o total do pedido.
- **Itens — troca de fornecedor**: pedido com 3 itens do Fornecedor A → trocar para Fornecedor B → os 3 itens são removidos, lista some do zero.
- **Itens — vínculo automático**: comprar pela primeira vez um produto nunca associado ao fornecedor atual → prompt de confirmação → vínculo criado.
- **Motor de Custo — rateio + produto novo**: pedido com frete/despesas no cabeçalho e 3 itens de pesos diferentes → rateio proporcional bate, último item absorve o resto; um dos itens é a primeira compra de um produto sem preço cadastrado → preço de venda é criado automaticamente ao gravar.
- **Motor de Impostos — ICMS/ICMS-ST com e sem divergência de alíquota**: item com alíquota do cadastro igual à da tabela UF origem/destino → sem aviso; item com alíquota divergente → aviso disparado, cálculo segue pela alíquota resolvida por tabela, não pela do cadastro.
- **Motor de Impostos — CSOSN vs. CST por regime do fornecedor**: mesmo pedido, um fornecedor do Simples (mostra CSOSN) e um do regime Normal (mostra CST) → campo exibido muda conforme o fornecedor da linha, não a filial.
- **Motor de Impostos — edição manual com flag "digitado"**: usuário edita manualmente o valor de ICMS de um item → recálculo subsequente (ex.: troca de quantidade) preserva o valor digitado, não sobrescreve.
- **Grade — bloqueio por divergência**: duas células da mesma linha com preços diferentes → campo de preço da linha fica `ReadOnly`; igualar os dois valores item a item libera a edição em lote novamente.
- **Grade — produto composto**: grade de um produto composto → total de IPI da linha bate com a fórmula corrigida (não a fórmula com bug do Delphi).
- **Documentos a Pagar — espelho e remoção**: gravar pedido com 3 previsões → 3 parcelas idênticas geradas; editar previsões (mudar de 3 para 2 parcelas) → parcelas antigas somem, 2 novas aparecem; cancelar o pedido → Documento a Pagar inteiro desaparece.
- **DIFAL — ausência confirmada**: nenhum cenário de pedido (mesmo com fornecedor de outro estado, venda a consumidor final simulada) deve gerar valor de DIFAL — sempre zero/ausente.

### Decisão

Critérios de aceite e matriz de testes consolidados acima, fatia por fatia, cobrindo os achados classificados no ticket 20 (bugs corrigidos, código morto não replicado, divergências mantidas por decisão). Pronto para alimentar os prompts SpecKit do ticket 22.
