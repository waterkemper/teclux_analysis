# Prompt para /speckit.specify

```text
/speckit.specify

Crie uma especificação funcional e técnica detalhada para construir, no Laravel, o **cabeçalho do Pedido de Compra** e suas **Previsões de entrega** (Estoque → Compras → Cadastro de Pedidos), construído sobre o Motor de Custo e o Motor de Impostos já especificados (`modules/estoque/cadastro-pedidos/01-speckit-prompt.md` a `05-speckit-prompt.md`) e sobre o contrato de integração "Gerar Pedido de Compra" já fechado em `modules/estoque/consulta-compras/03-speckit-prompt.md`. Esta é a sexta de 8 fatias do Cadastro de Pedidos de Compra; as specs 07-08 cobrem itens, grade e as demais funcionalidades da tela.

Não implemente nesta etapa. Você não possui acesso ao código Delphi. Considere as seções `Evidência Delphi confirmada` deste prompt como o pacote funcional legado autoritativo. Inspecione somente o checkout Laravel, incluindo o que as specs 01-05 e a spec 03 de Consulta de Compras já devem ter entregado. Corrija hipóteses sobre o estado Laravel quando forem contrariadas pelo código acessível e cite evidência concreta do checkout. Classifique descobertas Laravel como CONFIRMADO, INFERIDO, DÚVIDA, NÃO LOCALIZADO ou DIVERGENTE; preserve as classificações POSSÍVEL BUG LEGADO e DECISÃO NOVA já fornecidas.

## Limite desta entrega

A entrega termina quando existir:

- o **ciclo de vida do cabeçalho**: incluir, gravar (com as 4 validações obrigatórias), excluir/cancelar, e a máquina de situação completa;
- como o contrato de "Gerar Pedido de Compra" popula o cabeçalho pela primeira vez (reconfirmado sem divergência — só aplicar, não redecidir);
- as **Previsões de entrega**: parcelamento por dias/percentual/valor, trava de soma ≤ 100% por linha, exigência de soma = 100% para gravar o pedido inteiro, absorção do resto de arredondamento na primeira parcela.

Não inclua nesta entrega: itens do pedido (spec 07); grade, cópia de produtos, formação de preço de venda, documentos a pagar e funcionalidades acessórias (spec 08); qualquer detalhe de motor de custo/impostos além de consumi-los como serviços já prontos (specs 01-05).

## Fronteira de acesso às fontes

- Não tente localizar, abrir ou solicitar arquivos PAS, DFM, data modules, queries ou qualquer outra fonte Delphi.
- As evidências Delphi abaixo já foram extraídas no workspace de análise a partir de `apps/estoque/dmcadastropedidos.pas` e `apps/estoque/fmcadastropedidos.pas`.
- Use essas evidências como requisitos legados de entrada, preservando suas classificações.
- Inspecione o checkout Laravel para confirmar o estado atual, incluindo o que as specs 01-05 e a spec 03 de Consulta de Compras já devem ter entregado.
- Se uma decisão depender de informação Delphi ausente (incluindo a persistência/regras exatas do campo "observações", não detalhada na investigação), registre a pergunta exata para o workspace de análise — não infira.

## Investigação Laravel obrigatória

- os artefatos entregues pelas specs 01-05 (Motor de Custo/Impostos) — `GravarPedido` sincroniza com esses serviços numa única transação;
- o contrato de integração de "Gerar Pedido de Compra" já entregue pela spec 03 de Consulta de Compras — este cabeçalho é o consumidor desse contrato;
- se já existe um padrão de singleton/reabertura de formulário em edição no checkout Laravel (para replicar o comportamento de "reaproveitar a mesma sessão de pedido em edição" ao gerar um novo pedido a partir da Consulta de Compras).

## Evidência Delphi confirmada

### Ciclo de vida: Incluir → Gravar (CONFIRMADO, `dmcadastropedidos.pas:2006-2225`)

- **Incluir**: destrava campos, cria o registro, emissão/data = data do servidor, situação inicial = Aberto. Durante a criação, o cálculo de impostos fica suprimido para não disparar sobre um registro ainda vazio.
- **Gravar** — **4 validações obrigatórias, nesta ordem**, cada uma abortando com mensagem própria se falhar:
  1. Deve ter pelo menos 1 item.
  2. Deve ter pelo menos 1 previsão de entrega.
  3. A soma dos percentuais de previsão deve ser **exatamente 100**.
  4. O total das previsões deve bater com o valor calculado da nota (sincronizado pelo Motor de Impostos, specs 02-05).
  - Se passou: obtém o próximo número do pedido; reatribui a FK de pedido em itens/previsões inseridos antes do número existir; gera/reconstrói o Documento a Pagar (spec 08); persiste **tudo numa única transação**, incluindo as tabelas do Motor de Custo (confirma que o motor de custo não é só leitura — também escreve, na mesma transação do pedido).

### Máquina de situação (CONFIRMADO, `dmcadastropedidos.pas:5538-5584`)

Cabeçalho: Aberto, Parcial, Cancelado, Parcial Liquidado (cancelado após já ter recebido parte). Item: Aberto, Liquidado/recebido (a transição Aberto→Liquidado do item acontece em outro módulo — recebimento de mercadoria/Nota de Entrada, fora de escopo aqui). A situação do cabeçalho é recalculada a partir da situação agregada de todos os itens:

- algum item Aberto **e** algum Liquidado (ou já existe item Parcial) → cabeçalho Parcial;
- só Aberto → cabeçalho Aberto;
- só Liquidado → cabeçalho "Concluído".

**POSSÍVEL BUG LEGADO, não replicar**: no Delphi, "Concluído" reaproveita o mesmo código de banco de "Aberto" — só a descrição muda. **Decisão**: usar um código de situação próprio para "Concluído" no Laravel, para que qualquer lógica que compare a situação para decidir "ainda pode editar" não fique incorretamente permissiva.

### Regras de exclusão/cancelamento (CONFIRMADO, `dmcadastropedidos.pas:1708-1777,2513-2519`)

- Liquidado → bloqueado, não pode excluir nem cancelar.
- Cancelado/Parcial Liquidado → já cancelado, bloqueado.
- Parcial → só oferece "Cancelar" (rebaixa para Parcial Liquidado, pois já havia recebimento parcial).
- Aberto (nada recebido) → oferece exclusão física (remove o registro e o Documento a Pagar) ou cancelamento lógico (situação → Cancelado, Documento a Pagar também removido — spec 08).

`PodeExcluirAlterarPedido` = verdadeiro somente se a quantidade já entregue for zero **e** a situação não for Cancelado.

### Como "Gerar Pedido de Compra" popula o cabeçalho (CONFIRMADO, reconfirmação sem divergência do contrato já fechado)

- **Reaproveita uma única instância** da tela de Cadastro de Pedidos (padrão singleton) — se já está aberta, traz para frente e cancela qualquer edição pendente antes de reabrir; não empilha rascunhos. Se o usuário já tem um pedido em edição e volta à Consulta de Compras para gerar outro, a "sessão" de pedido continua/substitui, não empilha.
- Filial de fatura, fornecedor, preço (precedência já confirmada) e quantidade (campo escolhido no modal de origem) populam o pedido exatamente como o contrato já fechado descreve — nenhuma revisão necessária.
- Impostos são calculados **uma vez, no final do lote** de itens gerados (não item a item durante a inserção, por performance).

### Previsões — modelo de dados (CONFIRMADO)

Cada previsão tem: dias (deslocamento a partir da data do pedido), data (derivada), percentual (% do valor total do pedido) e valor (derivado do percentual sobre o valor calculado). É um parcelamento da **entrega esperada**, não um cronograma de pagamento (isso é o Documento a Pagar, spec 08 — entidade separada, ainda que espelhada 1:1).

### Previsões — cálculo e rateio de arredondamento (CONFIRMADO)

Ao recalcular todas as previsões: cada linha (exceto a **primeira**, por número) recebe `valor = round(total × percentual / 100)`. A **primeira previsão** recebe o **resto**: `valor = total − soma das demais` — absorvendo toda a diferença de arredondamento numa única parcela (mesmo padrão de "última/primeira linha absorve o resto" já usado no Motor de Custo e no rateio, specs 01/05).

### Previsões — regra de soma de percentuais (CONFIRMADO)

- Ao gravar cada previsão individual: se a soma de todos os percentuais já cadastrados **ultrapassar 100** ao incluir/editar essa linha, a gravação é cancelada com aviso — trava em tempo real.
- Se a soma bater **exatamente 100**, corrige automaticamente qualquer diferença de centavos entre a soma dos valores e o total, jogando a diferença na **primeira previsão**.
- **Não fechar 100% é permitido durante a edição** de uma previsão individual (o usuário pode estar montando o pedido aos poucos) — a trava dura de exigir soma = 100% só se aplica ao gravar o **pedido inteiro** (validação 3 acima), não a cada previsão isolada.

## Decisões obrigatórias

1. `GravarPedido` executa as 4 validações na ordem exata acima, cada uma com mensagem própria.
2. Situação do cabeçalho usa um código próprio para "Concluído" — **não** reaproveitar o código de "Aberto" (bug legado corrigido, não replicado).
3. Regras de exclusão/cancelamento ramificam pelas 4 situações do cabeçalho exatamente como descrito.
4. O contrato de "Gerar Pedido de Compra" é aplicado como já fechado, incluindo o comportamento singleton de reabertura de tela — nenhuma revisão.
5. Previsões: trava de soma ≤ 100% por linha ao gravar individualmente; exigência de soma = 100% só ao gravar o pedido inteiro; resto de arredondamento sempre absorvido na primeira previsão.

## Critérios de aceite

- [ ] `GravarPedido` roda as 4 validações na ordem confirmada, cada uma abortando com mensagem própria.
- [ ] Situação "Concluído" usa código próprio, distinto de "Aberto".
- [ ] `AtualizarSituacaoPedido` deriva corretamente Parcial/Aberto/Concluído a partir da situação agregada dos itens.
- [ ] `PodeExcluirAlterarPedido` só libera edição/exclusão quando nada foi entregue e a situação não é Cancelado.
- [ ] `ExcluirPedido` ramifica corretamente pelas 4 situações (Liquidado bloqueado; Cancelado/Parcial-liquidado bloqueado; Parcial só permite cancelar; Aberto oferece excluir fisicamente ou cancelar logicamente).
- [ ] "Gerar Pedido de Compra" reabre a mesma instância de tela (singleton) em vez de empilhar rascunhos.
- [ ] Trava em tempo real: gravar uma previsão que faça a soma de percentuais ultrapassar 100 é rejeitado.
- [ ] Resto de arredondamento das previsões é sempre absorvido pela primeira previsão, nunca distribuído.
- [ ] Pedido com previsões somando menos de 100% pode ter previsões individuais salvas, mas `GravarPedido` do pedido inteiro exige exatamente 100%.

## Matriz mínima de testes

- **Cabeçalho — 4 validações em cascata**: pedido sem item → erro específico; com item mas sem previsão → erro específico; com previsão somando <100% → erro específico; somando 100% mas total divergente do calculado → erro específico; tudo correto → grava.
- **Situação — ciclo completo**: pedido novo (Aberto) → recebe parte de um item (Parcial) → recebe o resto (Concluído, código próprio) → tentar excluir em cada estágio confirma as regras de bloqueio corretas.
- **Previsões — soma e resto**: 3 previsões de 33,33% cada → a primeira recebe o centavo de resto, soma bate exatamente com o total do pedido.
- **Gerar Pedido — singleton**: usuário com um pedido em edição volta à Consulta de Compras e gera outro pedido → mesma instância de tela é reaproveitada, edição pendente é cancelada antes de reabrir.

## Saída esperada do SpecKit

Produza uma especificação executável e um plano que:

- listem os requisitos funcionais do cabeçalho e das previsões;
- identifiquem os repositórios/serviços Laravel atuais a estender ou criar, após inspecioná-los (incluindo o que as specs 01-05 e a spec 03 de Consulta de Compras entregaram);
- detalhem o ciclo de vida, a máquina de situação (com a correção do bug) e as regras de previsão acima;
- incluam os critérios de aceite e a matriz de testes acima;
- declarem explicitamente que itens, grade e demais funcionalidades **não fazem parte** desta entrega;
- não mandem investigar Delphi, nem inventem lógica de itens/grade/motor de custo-impostos além do já especificado.

## Fora de escopo

- implementar durante `/speckit.specify`;
- itens do pedido (spec 07);
- grade, cópia de produtos, formação de preço de venda, documentos a pagar e funcionalidades acessórias (spec 08);
- qualquer detalhe interno do Motor de Custo/Impostos além de consumi-los como serviços prontos (specs 01-05);
- revisitar o contrato de "Gerar Pedido de Compra" já fechado;
- alterar o schema Delphi ou desativar qualquer tela Delphi.
```
