Type: task
Status: resolved
Blocked by: 08

## Question

Quais casos dourados extraídos do Delphi fixam, para Produtos e Serviços do Contrato, as chaves de duplicidade/substituição/incremento, arredondamento por item e agregado, rateio do desconto geral/cashback/cupom, resíduo após reordenação e tratamento de brindes?

Executar uma matriz de exemplos contra `TfrmCadastroProdutosContrato`, data module e dados legados representativos; comparar com os serviços equivalentes do Orçamento Laravel e registrar entradas e saídas esperadas antes do `$to-spec` do motor comercial compartilhado.

## Answer

### Evidência examinada

- `CONFIRMADO` — PAS e DFM foram analisados conjuntamente: `fmcadastroprodutoscontrato.pas/.dfm` define entrada, quantidade, preço, desconto e brinde; `dmcadastrocontratos.pas/.dfm` contém a consulta, eventos de dataset, totalização e rateios.
- `CONFIRMADO` — a consulta Delphi calcula `total` da linha como `quantidade * precovenda - coalesce(valordescontoitem,0)` e ordena por `pc.numero`: `dmcadastrocontratos.dfm:483-830`.
- `CONFIRMADO` — antes de gravar a linha, o Delphi repete o cálculo com `Truncar(...,2)`: `dmcadastrocontratos.pas:17150-17169`. Quantidade deve ser maior que zero e preço deve ser maior que zero: `fmcadastroprodutoscontrato.pas:568-625`; `dmcadastrocontratos.pas:8494-8555`.
- `CONFIRMADO` — o agregado de produtos soma `quantidade * preço` das linhas não-brinde, arredonda o subtotal a duas casas e subtrai a soma dos descontos por item; produtos brinde são acumulados separadamente e não entram em quantidade/subtotal comercial: `dmcadastrocontratos.pas:3764-3858`.
- `CONFIRMADO` — serviços são somados como `quantidade * valorservico`; não participam dos rateios de desconto de produto: `dmcadastrocontratos.pas:3945-3980`.
- `CONFIRMADO` — foram comparados os serviços Laravel `OrcamentoTotaisCalculator`, `OrcamentoRateioDescontoCalculator`, `OrcamentoDescontoGlobalService`, `OrcamentoDescontoItemSync`, `OrcamentoCupomAplicacaoService`, `OrcamentoProdutoInclusaoService` e seus testes unitários. Nenhum código foi executado ou alterado nos checkouts somente leitura.

### Identidade e operação sobre a linha

- `CONFIRMADO` — a chave funcional de coincidência do produto no editor legado é `(produto, filial)`. Com gravação automática desligada, os pares já presentes são retirados das consultas por `FiltrarProdutosEFiliaisContratos`: `dmcadastrocontratos.pas:6161-6201`.
- `CONFIRMADO` — alterar uma linha conserva sua identidade operacional `numero`; produto e filial originais são guardados para compensações de estoque: `dmcadastrocontratos.dfm:729-731`; `dmcadastrocontratos.pas:17875-17890`.
- `CONFIRMADO` — importações/cópias específicas localizam `(produto, filial)` e incrementam a quantidade existente, em vez de criar outra linha: `dmcadastrocontratos.pas:15966-16005`, `:17332-17336`.
- `DÚVIDA` — quando `GravarProdutoContratoAutomaticamente` está ativo, o Delphi deixa de filtrar duplicidades na pesquisa. Não foi localizada, no fluxo interativo, uma rotina única e explícita que determine se um novo bipe incrementa ou tenta inserir outro registro; portanto esse desvio de interface não é adotado como regra do motor.
- `DIVERGENTE` — `OrcamentoProdutoInclusaoService` também relaxa a rejeição de duplicidade quando esse parâmetro está ativo, mas não expõe uma operação atômica explícita de incremento. A semântica fica dependente do chamador.
- `DECISÃO NOVA` — o motor compartilhado recebe uma intenção explícita: `incluir`, `substituir` ou `incrementar`. `incluir` rejeita `(documento, produto, filial)` já existente; `substituir` exige `lineId` e troca os dados daquela linha; `incrementar` exige `lineId` ou resolve exatamente uma linha por `(produto, filial)` e soma o delta. Bipe repetido usa `incrementar(+1)`; edição de quantidade usa `substituir(valor absoluto)`. Nenhum endpoint infere incremento a partir de um erro de chave.
- `DECISÃO NOVA` — serviços usam identidade própria da linha. Repetir o mesmo código de serviço não deve ser fundido automaticamente, pois complemento, equipamento e vínculo com produto podem distinguir ocorrências.

### Ordem canônica dos cálculos

1. Validar quantidade/preço e resolver desconto do item.
2. Calcular a base da linha: `trunc2(quantidade × preço − descontoItem)`.
3. Recalcular subtotal e total dos produtos não-brinde.
4. Ratear desconto geral e cashback somente entre linhas comerciais elegíveis, na ordem canônica `numero`/`lineSequence`.
5. Revalidar e ratear o cupom somente entre suas linhas elegíveis, sobre a base já reduzida por desconto do item, geral e cashback.
6. Somar serviços separadamente.
7. Compor o total líquido e invalidar a assinatura dos planos/parcelas quando qualquer componente comercial mudar.

`DECISÃO NOVA` — o cálculo inteiro usa valores decimais, nunca `float` binário como contrato público. Quantidade respeita a escala parametrizada; dinheiro é truncado em cada fronteira indicada e serializado com duas casas.

### Matriz dourada de produtos e serviços

| Caso | Entrada | Saída obrigatória |
|---|---|---|
| produto simples | `q=2`, `preço=50,00`, `descItem=5,00` | base/total da linha `95,00`; subtotal bruto `100,00`; desconto de item agregado `5,00` |
| quantidade fracionária | `q=0,333`, `preço=100,00`, sem desconto | linha `33,30`; quantidade permanece `0,333`, sem conversão para inteiro |
| desconto percentual do item | base `1.584,50`, percentual `10%` | desconto `158,45`; linha líquida `1.426,05` |
| desconto em reais | base `100,67`, desconto digitado `15,00` | preservar `15,00`; percentual informativo `14,90%`; não recalcular os reais pelo percentual derivado |
| desconto acima da linha | base `100,00`, desconto `100,01` | rejeitar antes de totalizar |
| dois serviços | `2 × 75,00` e `3 × 10,00` | totais `150,00` e `30,00`; agregado de serviços `180,00`; nenhum rateio de desconto de produto |
| desconto geral exato | bases `[60,00; 40,00]`, desconto `10,00` | rateios `[6,00; 4,00]`; soma `10,00` |
| resíduo | bases em sequência `[33,33; 33,33; 33,34]`, desconto `10,00` | `[3,33; 3,33; 3,34]`; a última linha canônica recebe o resíduo |
| cashback | mesmas bases e cashback `1,00` | `[0,33; 0,33; 0,34]`; campo distinto do desconto geral, mesma política de resíduo |
| cupom percentual | duas linhas elegíveis de `100,00`, cupom `10%` | `[10,00; 10,00]`; cabeçalho `20,00` |
| cupom percentual com fração | linha elegível líquida `33,33`, cupom `10%` | `3,33`, por truncamento, não `3,34` |
| cupom fixo seletivo | bases elegíveis `[60,00; 40,00]`, uma terceira linha não elegível, cupom `10,00` | `[6,00; 4,00; 0,00]`; resíduo apenas no último elegível |
| brinde misto | normal `2 × 50,00`; brinde `1 × 30,00`; desconto geral `10,00` | subtotal/total comercial antes do desconto `100,00`; brinde informado separadamente `30,00`; todo desconto `10,00` fica na linha normal; brinde recebe zero |
| somente brindes | brindes `1 × 30,00` e `2 × 10,00` | total comercial e quantidade comercial zero; total informativo de brindes `50,00`; plano/parcelas precisam ser revistos, sem fabricar venda negativa |
| excluir última linha normal | normal `49,00`, desconto geral anterior `50,00`, depois exclusão | descontos geral/cashback/cupom são recalculados/zerados conforme elegibilidade; total líquido não pode permanecer `-1,00` |

### Resíduo e reordenação

- `CONFIRMADO` — desconto geral e cashback são calculados após `SortByField('numero')`; todas as linhas anteriores recebem rateio proporcional e a última recebe `total do desconto − soma anterior`: `dmcadastrocontratos.pas:18745-18822`.
- `CONFIRMADO` — logo, no Delphi, renumerar/reordenar linhas pode mudar qual produto recebe o centavo residual, embora o agregado permaneça igual.
- `DECISÃO NOVA` — `lineSequence` é parte da entrada determinística do rateio. Reordenar deliberadamente recalcula e pode mover o resíduo; apenas mudar a ordenação visual do grid não altera `lineSequence` nem valores persistidos.
- `DIVERGENTE` — o Laravel atual corrige o resíduo na última posição do array recebido, mas não garante internamente a ordenação por sequência. O serviço compartilhado deve ordenar explicitamente e devolver os rateios associados a `lineId`, nunca apenas por posição.

### Desconto geral, cashback e cupom

- `CONFIRMADO` — desconto geral e cashback são rateios separados, mas usam a mesma base `qryProdutosContratostotal` e a mesma política de resíduo: `dmcadastrocontratos.pas:18775-18815`.
- `CONFIRMADO` — o cupom primeiro valida código, produtos, valor do pedido, quantidade e pessoa. Percentual é truncado por item; valor fixo é proporcional entre elegíveis e o último registro absorve a diferença: `dmcadastrocontratos.pas:18192-18288`.
- `DIVERGENTE` — `OrcamentoCupomAplicacaoService::aplicarPercentual` usa `round`, enquanto o Delphi usa `Truncar`. O caso `33,33 × 10%` fixa `3,33` como paridade.
- `DIVERGENTE` — o Laravel calcula a base do cupom descontando o rateio geral, mas não desconta cashback em `totalItemLiquidoDescontoGeral`; o Delphi desconta ambos. O motor compartilhado deve usar `base − descontoGeralLinha − cashbackLinha`.
- `DIVERGENTE` — o cupom Delphi localiza apenas por `produto`; duplicidades do mesmo produto em filiais diferentes tornam a atribuição ambígua. O novo motor aplica elegibilidade a `lineId`/`(produto,filial)` e nunca usa apenas o código do produto para escolher a linha.
- `DECISÃO NOVA` — qualquer mudança em linhas, quantidades, preços, descontos ou ordem canônica reaplica desconto geral, cashback e cupom na mesma transação. Cupom que deixa de ser válido é removido com aviso e invalida os planos; não conserva rateio antigo.

### Brindes

- `CONFIRMADO` — a UI só permite alterar `brinde` quando `PermitirAlterarBrindenoContrato` está ativo: `fmcadastroprodutoscontrato.pas:373-374` e DFM `:2382-2400`.
- `CONFIRMADO` — brindes não entram no subtotal, quantidade comercial nem desconto por item agregado, mas seu valor bruto é mantido em `FTotalBrinde`; contrato somente com brindes força revisão das parcelas.
- `POSSÍVEL BUG LEGADO` — `CalcularRateioDescontoProdutos` percorre todas as linhas sem excluir explicitamente brindes, embora o denominador `totalprodutos` os exclua. Isso pode atribuir desconto a uma base que não pertence ao total comercial.
- `DECISÃO NOVA` — não reproduzir essa inconsistência: brindes têm preço de referência e total informativo, mas base comercial zero para desconto geral, cashback, cupom e financiamento. Marcar/desmarcar brinde recalcula tudo e exige autorização/capability parametrizada.

### Compatibilidade Laravel e fronteira de spec

- `CONFIRMADO` — os calculators do Orçamento já oferecem boa base reutilizável: truncamento de item, sincronização R$/%, rateio proporcional com resíduo e serviços separados.
- `DIVERGENTE` — ainda estão nomeados e acoplados ao Orçamento, usam `float`, recebem arrays posicionais, não modelam intenção de linha e não excluem brindes de forma explícita.
- `DECISÃO NOVA` — extrair um motor comercial compartilhado por Orçamento e Contrato, preservando os adapters atuais. O resultado retorna linhas por identidade, totais, rateios, avisos e uma assinatura comercial para invalidar planos.
- Esta fatia **deve receber `$to-spec` próprio** para o motor comercial compartilhado. Inclusão/edição de Produtos e Serviços pode ser um spec consumidor separado, mas deve usar estes casos como contrato de aceitação. O ticket “Confirmar casos dourados do financiamento” está agora desbloqueado e deve consumir a assinatura/totais produzidos aqui.
