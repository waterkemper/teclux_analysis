# Prompt para /speckit.specify

```text
/speckit.specify

Crie uma especificação funcional e técnica detalhada para construir, no Laravel, o Motor de Sugestão de Compras (Estoque → Compras → Consultas) — velocidade de vendas, estoque disponível, curva ABC, Tabela Redutora, a fórmula final da sugestão, e as abas de resultado Produtos Total, Produtos Similares, Produtos Grades e Detalhamento de Compra —, construído sobre a Fundação/Parâmetros já especificada em `modules/estoque/consulta-compras/01-speckit-prompt.md`.

Não implemente nesta etapa. Você não possui acesso ao código Delphi. Considere as seções `Evidência Delphi confirmada` deste prompt como o pacote funcional legado autoritativo, incluindo a matriz dourada da fórmula — trate-a como contrato de aceitação, não como sugestão. Inspecione somente o checkout Laravel, incluindo o que a Fundação/Parâmetros (spec 01) já deve ter entregado. Corrija hipóteses sobre o estado Laravel quando forem contrariadas pelo código acessível e cite evidência concreta do checkout. Não altere, complete ou descarte regras Delphi por inferência. Classifique descobertas Laravel como CONFIRMADO, INFERIDO, DÚVIDA, NÃO LOCALIZADO ou DIVERGENTE; preserve as classificações POSSÍVEL BUG LEGADO e DECISÃO NOVA já fornecidas.

## Limite desta entrega

A entrega termina quando existir:

- o cálculo de velocidade de vendas (três fontes: saídas de movimento+fiscal, produtos de contratos faturados menos devoluções, entradas de devolução ao fornecedor abatidas), agregado por produto/mês, com variantes por Filial e por Grupo de Filiais e comparação com o período anterior;
- o cálculo de estoque disponível a partir da expressão configurável de 7 categorias de status (Fundação, spec 01);
- a Curva ABC como filtro sobre `resultadocurvaabc` (sem recalculá-la) e a Tabela Redutora como lookup dinâmico (curva de retornos decrescentes por cobertura atual);
- a fórmula final da sugestão (`ROUND(velocidade_diária × sugestaopara) − estoque − pedidos + futuro`), incluindo os filtros de inclusão (% acima do mínimo, sugestão zero, produtos marcados para pedido) e os agrupamentos por Filial/Grupo de Filiais;
- as abas Produtos Similares e Produtos Grades (cálculo independente por variante/substituto + rollup agregado);
- o Detalhamento de Compra (custo: `customedio`, `precocomicms`, `valorultimacompra`, `markup`; venda: `valornormal`/`valorpromocao`, informativo).

Não inclua nesta entrega: nenhuma parte da Fundação/Parâmetros (já especificada na spec 01, só consuma); a Requisição entre Filiais e a integração com Pedido de Compra (spec `03-speckit-prompt.md`); o Cadastro de Pedidos de Compra em si.

## Fronteira de acesso às fontes

- Não tente localizar, abrir ou solicitar arquivos PAS, DFM, data modules, queries ou qualquer outra fonte Delphi.
- As evidências Delphi abaixo já foram extraídas no workspace de análise a partir de `apps/estoque/dmconsultacompras.pas/.dfm`.
- Use essas evidências como requisitos legados de entrada, preservando suas classificações.
- Inspecione o checkout Laravel para confirmar o estado atual, incluindo o que a Fundação/Parâmetros (spec 01) já deve ter entregado.
- Se uma decisão depender de informação Delphi ausente, registre a pergunta exata para o workspace de análise.

## Investigação Laravel obrigatória

- os artefatos entregues pela Fundação/Parâmetros (spec 01): Filial/Grupo Filial, filtro de produtos, período de vendas, expressão de estoque configurável;
- `App\Domain\Vendas\Comercial\MoneyDecimal` (convenção de dinheiro decimal, nunca float) — avaliar se o cálculo desta sugestão (que envolve quantidades e valores) deve seguir a mesma convenção;
- repositórios já existentes que leem `movimentos`, `dadosfiscais`, `produtosdadosfiscais`, `produtoscontratos`, `contratos`, `notaspag`/`produtosnotaspag`, `estoques`, `produtos_similares` — reaproveitar antes de criar novos.

## Evidência Delphi confirmada

### Velocidade de vendas — três fontes (CONFIRMADO, `qryVVendas`, `dmconsultacompras.dfm:1498-2024`)

Por produto e mês (`YYYY/mm`), soma três fontes via `UNION ALL`:

1. **Saídas de movimento** (`movimentos` onde `substr(operacao,13,1)='+'`) juntado com `dadosfiscais`/`produtosdadosfiscais`.
2. **Produtos de Contratos faturados** (`produtoscontratos` join `contratos` onde `situacao in ('F','P')` e `contratos_atual()`, com `HAVING quantidade − cancelado > devolvido`).
3. **Entradas de movimento** (`substr(operacao,13,1)='-'`) juntado com `notaspag`/`produtosnotaspag` — devoluções ao fornecedor, subtraídas.

Classificação Internet vs. Loja via `pedidos_site.contrato` — **CONFIRMADO só informativo**: nenhuma referência a `totalinternet`/`totalloja` em lógica de cálculo, só em display. A fórmula usa exclusivamente `totalvendas` (total combinado).

Variantes `_porFilial`/`_porGrupo` seguem a mesma fórmula com dimensão adicional no agrupamento (campos confirmados por comparação); pares `_Anterior` usam a mesma fórmula com a janela de datas deslocada para o período anterior equivalente; pares `_Similares` trocam a lista de produtos pela lista de substitutos. Estas variantes não foram lidas linha a linha — confirme a fórmula exata de cada uma ao implementar, citando evidência do Laravel/banco.

### Curva ABC e Tabela Redutora (CONFIRMADO, `dmconsultacompras.pas:1762-1802`)

Curva ABC: filtro `OR` sobre `produtos.resultadocurvaabc` (`'A'`/`'B'`/`'C'`/vazio para "Não Definido") — **não calculada aqui**, é uma classificação pré-existente.

Tabela Redutora: `reducaoconsultacompras` (`estoquepara`→`sugestaopara`), tabela de referência **global** (sem escopo por Filial/Usuário), editada inline nesta mesma Consulta (Incluir/Excluir simples, sem autorização especial). **DECISÃO DO USUÁRIO**: manter a edição inline, sem isolar como Cadastro/lookup separado.

### Fórmula final da sugestão (CONFIRMADO, `dmconsultacompras.dfm:150-370`)

Camada por camada:

1. `sugestaominimo = MAX(0, minimo − saldo)`; `sugestaomaximo = MAX(0, maximo − saldo)`.
2. `periodo` = dias da janela consultada, exceto para produtos cadastrados dentro da janela (`periodo` = dias desde o cadastro).
3. `diasestoque_geral` = cobertura atual em dias — agregada entre filiais (`estoque_filiais`/`vendido_filiais`) quando `UsarTabelaRedutora` está ativo, senão por filial isolada.
4. `sugestaopara` = lookup na Tabela Redutora: maior `estoquepara` ≤ `diasestoque_geral` → seu `sugestaopara`; senão fallback para `:diasproporcional`.
5. **`sugestao = ROUND((total_vendido/periodo) × sugestaopara) − total_estoque − total_pedido + futuro`**.

**Filtros de inclusão** (não fazem parte do valor):
- "Incluir com sugestão zero": remove o filtro `sugestao > 0 OR sugestaominimo > 0 OR sugestaomaximo > 0`.
- "Produtos marcados para pedido": adiciona `OR lembrarpedido` ao filtro.
- **"% acima do mínimo"** (`dmconsultacompras.pas:1810-1814`): filtro **separado**, com fórmula **fixa** somando sempre as 7 categorias de estoque (`emestoque+reservado+transito+demonstracao+conserto+danificada+reservaprevia`+pedidos pendentes−futuro) ≤ `minimo + minimo×percentual/100`. **DIVERGENTE confirmado e mantido por decisão do usuário**: esta soma é sempre fixa, diferente da expressão configurável pelos 7 checkboxes usada no cálculo da sugestão em si (spec 01) — duas definições de "estoque" coexistem, replicadas sem unificação.
- "Pedidos entre Filiais"/"Não Considerar Pedidos de Compra": parâmetros que ligam/desligam se `total_pedido`/`total_pedido_filiais` entram na fórmula.

### Produtos Similares e Grades (CONFIRMADO, `dmconsultacompras.dfm:11367+`, `19251+`)

Cada similar/variante de grade calcula sua **própria** sugestão de forma independente, usando a fórmula idêntica acima. `qryTotalProdutosSimilares`/`qryTotalProdutosGrades` fazem só **rollup agregado** (soma dos campos já calculados) numa linha `'TOTAL'`, com `diasestoque` recalculado a partir das somas agregadas. "Quem é similar de quem" vem de `produtos_similares`, ampliado por regra de agrupamento por grade (`agrupamentosimilares = 'L'` por linha/`valorgrade1`, `'C'` por coluna/`valorgrade2`). A aba Similares só fica visível quando `ExisteSimilar` é verdadeiro; a aba Grades **não** é condicionalmente ocultada — as duas são independentes, sem lógica cruzada.

### Detalhamento de Compra (CONFIRMADO, `dmconsultacompras.dfm:2081-2282`, `12941+`)

`qryDetalhesCompra` (custo): por produto+filial, seleciona a linha de `estoques` mais recente com compra válida, expondo `precocomicms`/`precosemicms`/`qtdecompra`/`aliquotaipi`/`valorultimacompra`/`datacompra`; calcula `customedio` (média ponderada entre todas as filiais do produto) e `markup` (percentual do preço normal sobre o custo). Esta é a fonte exata da precedência **`precocomicms` → `valorultimacompra` → `customedio`** usada para pré-popular valor unitário ao gerar Pedido (spec 03). `qryDetalhesPrecos` (venda): `valornormal`/`valorpromocao` com fator por filial — só informativo, não entra na precedência.

## Decisões obrigatórias

1. Velocidade de vendas replica as três fontes fielmente; Internet/Loja é só exibição.
2. Curva ABC é só filtro; não recalcular.
3. Tabela Redutora mantida como edição inline nesta Consulta, tabela global sem escopo.
4. Fórmula final da sugestão replicada exatamente, incluindo a divergência do "% acima do mínimo" (fórmula fixa, não a configurável).
5. Similares/Grades: cálculo independente por variante + rollup — sem distribuição/rateio.
6. Detalhamento de Compra é a fonte de valor consumida pela integração com Pedido de Compra (spec 03).

## Critérios de aceite

- [ ] Velocidade de vendas soma corretamente as três fontes; Internet/Loja exibido mas não usado no cálculo.
- [ ] Curva ABC filtra por `resultadocurvaabc` sem recalculá-la.
- [ ] Tabela Redutora aplica o lookup correto, com fallback para `diasproporcional`.
- [ ] Fórmula final bate com a fórmula confirmada.
- [ ] Produtos Similares e Grades calculam cada variante/substituto independentemente, com rollup correto.
- [ ] Detalhamento de Compra calcula `customedio`/`precocomicms`/`valorultimacompra`/`markup` corretamente.
- [ ] "% acima do mínimo" usa a expressão fixa, diferente da configurável.

## Matriz mínima de testes

- Velocidade de vendas: uma venda de cada uma das três fontes no mesmo produto/período → total combinado correto.
- Produto novo (cadastrado dentro da janela): `periodo` usa dias desde o cadastro.
- Tabela Redutora: cobertura atual acima/abaixo de um `estoquepara` cadastrado → `sugestaopara` correto em cada caso; tabela vazia/desligada → cai para `diasproporcional`.
- Fórmula final: caso dourado combinando velocidade, estoque, pedidos pendentes e `futuro`.
- "% acima do mínimo" vs. checkboxes de estoque configurados de forma diferente → filtro usa a expressão fixa.
- Similares/Grades: grupo com 3 substitutos/variantes → cada um calcula independente; TOTAL bate com a soma.
- Detalhamento de Compra: produto com preço com ICMS, sem última compra, só custo médio → `DefinirValorProduto` (spec 03) escolhe corretamente conforme a precedência.

## Saída esperada do SpecKit

Produza uma especificação executável e um plano que:

- listem os requisitos funcionais desta fatia (Motor de Sugestão), consumindo a Fundação/Parâmetros (spec 01) sem reespecificá-la;
- identifiquem os repositórios/serviços Laravel atuais a estender, após inspecioná-los;
- detalhem a matriz dourada da fórmula de sugestão, incluindo a divergência do "% acima do mínimo";
- incluam os critérios de aceite e a matriz de testes acima;
- declarem explicitamente que a Requisição entre Filiais, a integração com Pedido de Compra e o Cadastro de Pedidos de Compra **não fazem parte** desta entrega;
- não mandem investigar Delphi.

## Fora de escopo

- implementar durante `/speckit.specify`;
- qualquer parte da Fundação/Parâmetros — já especificada em `01-speckit-prompt.md`;
- Requisição entre Filiais e integração com Pedido de Compra — ver spec `03-speckit-prompt.md`;
- o Cadastro de Pedidos de Compra completo;
- unificar as duas definições de estoque (checkboxes vs. "% acima do mínimo") — divergência mantida por decisão;
- alterar o schema Delphi ou desativar qualquer tela Delphi.
```
