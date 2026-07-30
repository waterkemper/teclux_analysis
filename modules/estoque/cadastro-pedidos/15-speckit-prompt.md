# Prompt para /speckit.specify

```text
/speckit.specify

Crie uma especificação funcional e técnica detalhada para expandir o formulário de item do Cadastro de Pedidos de Compra (`PedidoCompraItemForm.tsx`), hoje limitado a 4 campos editáveis (Produto, Quantidade, Preço Unitário, Descrição/Qtd. Entregue somente leitura), para a superfície completa confirmada no legado: ~40 campos em 2 abas fiscais mais um painel de totais calculados. Esta é a décima quinta e maior fatia de paridade do Cadastro de Pedidos de Compra — **não introduz nenhum cálculo novo**, só expõe o que o Motor de Custo/Impostos (specs 01-05) já especifica.

Não implemente nesta etapa. Você não possui acesso ao código Delphi. Considere a seção `Evidência Delphi confirmada` como requisito legado autoritativo, e a seção `Evidência Laravel confirmada` como o estado já mapeado — mas **reconfirme por inspeção direta antes de alterar qualquer coisa**, pois pode estar defasado. Classifique descobertas Laravel como CONFIRMADO, INFERIDO, DÚVIDA, NÃO LOCALIZADO ou DIVERGENTE.

## Limite desta entrega

A entrega termina quando o formulário de item cobrir, por grupo:

1. **Checkboxes de contexto**: "Selecionar produtos por fornecedor" (afeta o universo de busca do lookup de produto); "Atualizar o preço de venda deste produto a partir deste pedido" (mesma flag `permitiratualizardigitado` já usada em lote na spec 13).
2. **Natureza da Operação / CFOP**: um lookup de Natureza da Operação que resolve e exibe o CFOP correspondente (2 linhas de exibição: CFOP resolvido + Natureza subjacente — **não são dois CFOPs independentes**, ver evidência).
3. **Identificação do produto**: código+lookup+descrição (já existe), CST do produto, NCM, Descrição do Preço (coluna de preço).
4. **Campos monetários**: Quantidade, Preço Unitário (já existem), Valor Total, Desc. Geral, Desc. Item, Valor Líquido, Frete, Valor Total + IPI.
5. **Unidade/conversão/entrega**: Unidade da NF (com lookup), Unidade do Estoque, Fator Conversão, Qtde Estoque, Data Entrega.
6. **Aba "Impostos da NF"**: ICMS Próprio (CST empresa, CST nota, %Red., Valor Reduzido, Base de Cálculo, %ICMS, Valor, %SN, Valor SN), ICMS Substituição Tributária (MVA, %Red., Valor Redução, Base de Cálculo, %ICMS, Valor), IPI (CST IPI na empresa, Base de Cálculo, %IPI, Valor do IPI) — todos consumindo os valores já calculados pelas specs 02-03, edição habilitada só onde as specs 02-04 confirmam que é editável.
7. **Aba "Pis/Cofins"**: campos correspondentes já especificados na spec 04.
8. **Painel "Total Calculado"** (somente leitura): Base Cálculo ICMS, Base Substituição, Base ST Ret Ant, Total Produtos, Valor do ICMS, ICMS Substituição, ICMS ST Ret Ant, Valor IPI, Total do Pedido.

Não inclua nesta entrega: qualquer fórmula de cálculo nova (specs 01-05 já são a fonte da verdade); a grade/matriz (spec 13); os botões "Gerar Total X" (direção já registrada como DÚVIDA nas specs 04-05, não resolvida aqui).

## Fronteira de acesso às fontes

- Não tente localizar, abrir ou solicitar arquivos PAS, DFM, data modules, queries ou qualquer outra fonte Delphi.
- As evidências Delphi abaixo já foram extraídas no workspace de análise a partir de `apps/estoque/fmcadastroprodutospedidos_.pas`/`.dfm`.
- Inspecione o checkout Laravel para confirmar o estado atual de `PedidoCompraItemForm.tsx`, `PedidoCompraItemProdutoResolveService.php` e do restante do backend de itens — pode ter mudado desde esta análise.
- Se uma decisão depender de informação Delphi ausente, registre a pergunta exata para o workspace de análise — não infira.

## Investigação Laravel obrigatória

- `resources/js/Pages/Cadastros/Estoque/PedidosCompra/components/PedidoCompraItemForm.tsx` e `types.ts` (`PedidoCompraItem`/`PedidoCompraItemFiscal`) — estado atual (4 campos editáveis, objeto `fiscal` tipado como `Record<string, string|boolean|null>`, nunca renderizado);
- `app/Services/Estoque/PedidoCompra/PedidoCompraItemProdutoResolveService.php` — confirmar se os campos `ncm`/`cfop`/`cst` continuam `null` (placeholders) ou já foram populados desde esta análise; se ainda placeholders, esta spec precisa **também** fechar essa lacuna de backend, não só a de UI;
- os serviços que já implementam as specs 01-05 (Motor de Custo/Impostos) — confirmar os métodos/campos exatos a consumir para preencher cada grupo de campos fiscais do formulário, em vez de recalcular no frontend;
- se já existe lookup de Unidade de Medida e de Natureza da Operação/CFOP em outras telas já migradas, para reaproveitar o componente.

## Evidência Delphi confirmada

### Estrutura geral do modal (CONFIRMADO, `tela_inclusao_produtos.png`, `fmcadastroprodutospedidos_.pas`/`.dfm`)

Checkbox "Selecionar produtos por fornecedor" restringe o universo de busca do lookup de produto ao catálogo do fornecedor do pedido. Checkbox "Atualizar o preço de venda deste produto a partir deste pedido" é a mesma flag `permitiratualizardigitado` já usada em lote na spec 13 (checkbox "Marcar/Desmarcar Todos" da grade).

### Natureza da Operação / CFOP (CONFIRMADO, `fmcadastroprodutospedidos_.pas:746-1090`)

```pascal
fraConsultaNatureza.CondicoesdaConsulta := CondicoesdaConsultaNaturezasCFOP_NF;
fraConsultaNatureza.onFound := AtribuirDadosNATUREZASCFOP_NF;
// AtribuirDadosNATUREZASCFOP_NF:
qryProdutosPedidosnatureza.asinteger := fraConsultaNatureza.qryProcuraNaturezasCFOP_NFcodigo.AsInteger;
qryProdutosPedidoscodigofiscal.asinteger := fraConsultaNatureza.qryProcuraNaturezasCFOP_NFcodigofiscal.AsInteger;
```

**Confirmado**: é um único lookup de Natureza da Operação que resolve o CFOP (`codigofiscal`) correspondente — a tela mostra as duas metades da resolução (CFOP resolvido em cima, Natureza subjacente embaixo), **não são dois campos CFOP independentes**. Especificar como um único campo de busca "Natureza da Operação", exibindo o CFOP resolvido.

### Campos fiscais e painel de totais (CONFIRMADO por leitura da imagem, cruzado com as fórmulas já especificadas)

Todos os campos das abas "Impostos da NF"/"Pis/Cofins" e do painel "Total Calculado" correspondem diretamente aos componentes de fórmula já especificados: base/alíquota/valor de ICMS (spec 02), ICMS-ST (spec 03), IPI e PIS/COFINS (spec 04) — **nenhuma fórmula nova aqui**, só a superfície de exibição/edição desses valores já calculados pelo motor. A edição de cada campo deve respeitar exatamente as regras de "editável/travado" já confirmadas nessas specs (ex.: IPI editável por padrão exceto transferência/documento eletrônico vinculado — spec 04).

## Evidência Laravel confirmada

### Formulário atual é mínimo (CONFIRMADO, `PedidoCompraItemForm.tsx:118-198`)

4 campos editáveis (Produto, Quantidade, Preço Unitário) + 2 somente leitura (Descrição, Qtd. Entregue). Nenhum campo fiscal, nenhuma aba, nenhum painel de totais.

### Backend ainda não popula os valores fiscais reais (CONFIRMADO, `PedidoCompraItemProdutoResolveService.php:45-53`)

```php
'fiscal' => [
    'ncm' => null,
    'cfop' => null,
    'cst' => null,
    'alteracao_manual_icms' => false,
    'alteracao_manual_ipi' => false,
    'alteracao_manual_pis' => false,
    'alteracao_manual_cofins' => false,
    // ...
],
```

**Achado importante**: o backend já tem a *estrutura* do objeto fiscal (incluindo as flags "digitado"/`alteracao_manual_*`, equivalentes às flags das specs 02-05), mas `ncm`/`cfop`/`cst` ainda são placeholders `null`. Esta entrega provavelmente precisa **popular esses valores reais** a partir do motor de impostos já especificado (specs 01-05), não só adicionar campos na UI — verificar o estado atual antes de assumir que é só um gap de frontend.

## Decisões obrigatórias

1. Nenhum cálculo novo é introduzido — todo valor fiscal exibido vem dos serviços que já implementam as specs 01-05.
2. Natureza da Operação/CFOP é um único campo de busca (não dois CFOPs), exibindo CFOP resolvido + Natureza subjacente.
3. Checkbox de atualização de preço de venda reaproveita a mesma flag já usada em lote na spec 13.
4. Se o backend ainda não popula `ncm`/`cfop`/`cst` reais, esta entrega fecha essa lacuna também (não só adicionar inputs vazios na UI).
5. Cada campo fiscal respeita exatamente as regras de edição (travado/editável) já confirmadas nas specs 02-04 — não inventar uma trava nova nem remover uma já especificada.

## Critérios de aceite

- [ ] Formulário de item cobre todos os grupos de campos listados no "Limite desta entrega".
- [ ] Checkboxes de contexto funcionam conforme especificado (filtro de busca por fornecedor; flag de atualização de preço).
- [ ] Campo de Natureza da Operação resolve e exibe o CFOP correspondente corretamente.
- [ ] Campos fiscais (ICMS/ICMS-ST/IPI/PIS-COFINS) exibem os valores já calculados pelo motor (specs 01-05), com edição habilitada/travada exatamente conforme essas specs.
- [ ] Painel "Total Calculado" exibe os 9 totais confirmados, atualizados conforme o item muda.
- [ ] Backend popula `ncm`/`cfop`/`cst` reais (não mais placeholders `null`), se confirmado que ainda estavam vazios.

## Matriz mínima de testes

- **Campos fiscais refletem o motor**: item com ICMS/ICMS-ST/IPI calculados pelas specs 02-04 → valores exibidos no formulário batem exatamente com o que o motor calculou.
- **Edição manual marca "digitado"**: editar manualmente um valor de ICMS → flag `alteracao_manual_icms` correspondente é marcada, e o motor não recalcula por cima (mesma regra das specs 02-05).
- **Natureza/CFOP**: buscar uma Natureza da Operação → CFOP resolvido é exibido junto com a descrição da Natureza.
- **Checkbox "Atualizar preço de venda"**: marcar no item individual → mesmo efeito da marcação em lote da spec 13 (consistência entre os dois pontos de UI).
- **Painel de totais**: alterar quantidade/preço de um item → os 9 totais do painel recalculam corretamente.

## Saída esperada do SpecKit

Produza uma especificação executável e um plano que:

- listem os requisitos funcionais de todos os grupos de campos acima;
- identifiquem os arquivos exatos a editar (frontend `PedidoCompraItemForm.tsx`, backend `PedidoCompraItemProdutoResolveService.php` e o que mais for necessário), após inspecioná-los;
- confirmem e, se necessário, fechem a lacuna de backend (`ncm`/`cfop`/`cst` reais);
- detalhem os grupos de campos e o painel de totais acima, mapeando cada um para a fórmula já especificada nas specs 01-05;
- incluam os critérios de aceite e a matriz de testes acima;
- declarem explicitamente que nenhuma fórmula nova é introduzida.

## Fora de escopo

- implementar durante `/speckit.specify` além do que os critérios acima descrevem;
- qualquer fórmula de cálculo nova — specs 01-05 são a fonte da verdade;
- a grade/matriz (spec 13);
- a direção exata dos botões "Gerar Total X" (dúvida já registrada nas specs 04-05, não resolvida aqui);
- alterar o schema Delphi ou desativar qualquer tela Delphi.
```
