# Prompt para /speckit.specify

```text
/speckit.specify

Crie uma especificação funcional e técnica detalhada para construir, no Laravel, o **rateio proporcional de frete/desconto/despesas acessórias** e o tratamento de **produtos compostos (kits)** dentro do Motor de Impostos, construído sobre a orquestração e as famílias fiscais já especificadas (`modules/estoque/cadastro-pedidos/02-speckit-prompt.md` a `04-speckit-prompt.md`). Esta é a quinta e última fatia do Motor de Impostos/Custo; as specs 06-08 cobrem as telas do Cadastro de Pedidos que consomem tudo isso.

Não implemente nesta etapa. Você não possui acesso ao código Delphi. Considere as seções `Evidência Delphi confirmada` deste prompt como o pacote funcional legado autoritativo. Inspecione somente o checkout Laravel, incluindo o que as specs 01-04 já devem ter entregado. Corrija hipóteses sobre o estado Laravel quando forem contrariadas pelo código acessível e cite evidência concreta do checkout. Classifique descobertas Laravel como CONFIRMADO, INFERIDO, DÚVIDA, NÃO LOCALIZADO ou DIVERGENTE; preserve as classificações POSSÍVEL BUG LEGADO e DECISÃO NOVA já fornecidas.

## Limite desta entrega

A entrega termina quando existir: o algoritmo único de rateio proporcional (reaproveitado para os 3 campos — desconto, frete, despesas acessórias), e o tratamento de produtos compostos dentro desse rateio (o kit-pai nunca recebe rateio diretamente, só seus componentes).

Não inclua nesta entrega: as fórmulas de ICMS/ICMS-ST/IPI/PIS-COFINS em si (specs 02-04, este rateio só alimenta a base delas); nenhuma tela do Cadastro de Pedidos (specs 06-08).

## Fronteira de acesso às fontes

- Não tente localizar, abrir ou solicitar arquivos PAS, DFM, data modules, queries ou qualquer outra fonte Delphi.
- As evidências Delphi abaixo já foram extraídas no workspace de análise a partir de `repositorio/dmbasico.pas` (`CalcularRateioDespesasAcessorias`/`CalcularRateios`) e `apps/estoque/dmcadastropedidos.pas` (ponto de disparo por Pedidos).
- Use essas evidências como requisitos legados de entrada, preservando suas classificações.
- Inspecione o checkout Laravel para confirmar o estado atual, incluindo o que as specs 01-04 já devem ter entregado.
- Se uma decisão depender de informação Delphi ausente (incluindo a direção exata dos botões manuais de rateio, não localizada na investigação Delphi), registre a pergunta exata para o workspace de análise — não infira o comportamento da UI Delphi.

## Investigação Laravel obrigatória

- os artefatos entregues pelas specs 01-04: como os itens do documento já expõem quantidade/preço/flags "digitado" por campo — o rateio opera sobre essa mesma estrutura;
- modelagem de produto composto (kit) já existente no Laravel — relação componente↔composto, e como o preço/quantidade do componente dentro do kit-pai já é modelado, para reaproveitar em vez de recriar.

## Evidência Delphi confirmada

### Ponto de entrada em Pedidos — só "solta" o campo (CONFIRMADO, `dmcadastropedidos.pas:5060-5083`)

`TdtmCadastroPedidos.RatearFrete`/`RatearDesconto` (a versão local, em Cadastro de Pedidos) **não** fazem o rateio de fato — só zeram o campo do item atual e desmarcam a flag "digitado", devolvendo o controle para o rateio automático do motor compartilhado (evidência abaixo). Não replicar essas duas rotinas locais como se contivessem lógica de distribuição — elas são só o gatilho.

### Algoritmo de rateio — idêntico para os 3 campos (CONFIRMADO, `CalcularRateioDespesasAcessorias`/`CalcularRateios`, `dmbasico.pas:22514-22692` e adiante)

Padrão idêntico para desconto, frete e despesas acessórias:

1. **Limpa** o campo de todos os itens que **não** foram digitados manualmente; conta quantos itens (`t`) entram no rateio.
2. **Valor a ratear** = total do documento **menos** a soma do que já foi digitado manualmente item a item — nunca negativo (trava em 0).
3. Para cada item elegível, na ordem: se é o **último** item do lote, recebe o **saldo restante inteiro** (absorve o resto de arredondamento); senão, recebe uma fração **proporcional ao seu peso no total líquido de produtos não-digitados** (`preço unitário × quantidade × valor_a_ratear / total_líquido_não_digitado`).

### Produtos compostos (CONFIRMADO, comentário explícito no código-fonte)

O produto-pai (kit/composto) **nunca** recebe rateio diretamente — só seus componentes e os itens não-compostos — evitando duplicar valor entre pai e componentes. Quando o item é um componente, sua fração é calculada com fórmula própria baseada no preço do componente dentro do kit-pai:

```
fração do componente = precoComponente × qtd do composto × qtd do item
                      × valor do campo já rateado no composto
                      / (qtd do composto × precovenda do composto)
```

Ou seja: o valor a ratear entre os componentes vem do **próprio composto pai** (já tendo recebido sua fração do rateio geral do documento), não do total geral do documento recalculado do zero para cada componente.

### Achados a não replicar / dúvidas a confirmar

- Direção exata dos botões "Ratear Valor Total Produtos"/"Ratear Valor Total Frete" — handlers de UI Delphi não localizados na investigação; inferência (não confirmada) é que disparam manualmente este mesmo algoritmo sob demanda. **DÚVIDA a confirmar na implementação**.

## Decisões obrigatórias

1. Um único algoritmo de rateio, reaproveitado para os 3 campos (desconto, frete, despesas acessórias) — não implementar 3 versões distintas.
2. Valor a ratear = total do documento menos soma dos valores digitados manualmente; nunca negativo.
3. Distribuição proporcional ao peso de cada item elegível; o último item do lote absorve o resto de arredondamento.
4. Produtos compostos nunca recebem rateio diretamente — só seus componentes, com base no valor já rateado para o composto pai.
5. Direção dos botões manuais de rateio registrada como dúvida a confirmar durante a implementação, não afirmada.

## Critérios de aceite

- [ ] Rateio de desconto/frete/despesas acessórias usa o mesmo algoritmo, reaproveitado para os 3 campos.
- [ ] Itens digitados manualmente ficam de fora do rateio automático; o valor a ratear já os exclui.
- [ ] Distribuição é proporcional ao peso de cada item; o último item absorve o resto de arredondamento.
- [ ] Produto composto (kit) nunca recebe rateio diretamente; seus componentes recebem, proporcional ao preço dentro do kit.
- [ ] "Soltar" um campo digitado manualmente (voltar ao automático) devolve o item ao pool do rateio automático.

## Matriz mínima de testes

- **Rateio proporcional — caso dourado**: documento com 3 itens de pesos diferentes e nenhum valor digitado → distribuição proporcional bate, último item absorve o resto.
- **Rateio com valores digitados**: documento com 1 item digitado manualmente e 2 automáticos → valor a ratear exclui o digitado; os 2 automáticos dividem só o restante.
- **Produtos compostos**: kit com 2 componentes de preços diferentes → kit-pai não recebe rateio; os 2 componentes recebem proporcional ao preço de cada um dentro do kit.
- **"Soltar" um campo**: item com desconto digitado manualmente → usuário aciona a ação de "voltar ao automático" → item volta a participar do rateio proporcional.

## Saída esperada do SpecKit

Produza uma especificação executável e um plano que:

- listem os requisitos funcionais do algoritmo de rateio e do tratamento de produtos compostos;
- identifiquem os repositórios/serviços Laravel atuais a estender, após inspecioná-los (incluindo o que as specs 01-04 entregaram e a modelagem de produto composto já existente);
- detalhem o algoritmo único e a fórmula de fração do componente acima;
- incluam os critérios de aceite e a matriz de testes acima;
- registrem a direção dos botões manuais de rateio como pergunta explícita a confirmar durante a implementação;
- não mandem investigar Delphi, nem inventem lógica de ICMS/ICMS-ST/IPI/PIS-COFINS ou de telas do Cadastro de Pedidos.

## Fora de escopo

- implementar durante `/speckit.specify`;
- as fórmulas de ICMS/ICMS-ST/IPI/PIS-COFINS em si (specs 02-04) — este rateio só alimenta a base delas;
- qualquer tela do Cadastro de Pedidos de Compra (specs 06-08);
- alterar o schema Delphi ou desativar qualquer tela Delphi.
```
