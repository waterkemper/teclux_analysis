# Prompt para /speckit.specify

```text
/speckit.specify

Crie uma especificação funcional e técnica detalhada para construir, no Laravel, a família **ICMS-ST (substituição tributária)** do Motor de Impostos, construída sobre o núcleo de orquestração e o ICMS normal já especificados (`modules/estoque/cadastro-pedidos/02-speckit-prompt.md`). Esta é a terceira de 8 fatias do Cadastro de Pedidos de Compra.

Não implemente nesta etapa. Você não possui acesso ao código Delphi. Considere as seções `Evidência Delphi confirmada` deste prompt como o pacote funcional legado autoritativo. Inspecione somente o checkout Laravel, incluindo o que a spec 02 já deve ter entregado. Corrija hipóteses sobre o estado Laravel quando forem contrariadas pelo código acessível e cite evidência concreta do checkout. Classifique descobertas Laravel como CONFIRMADO, INFERIDO, DÚVIDA, NÃO LOCALIZADO ou DIVERGENTE; preserve as classificações POSSÍVEL BUG LEGADO e DECISÃO NOVA já fornecidas.

## Limite desta entrega

A entrega termina quando existir o cálculo completo de ICMS-ST por item: base de cálculo (com o fator de substituição/MVA ajustado e a equalização), redução de base ST, valor ST, FCP-ST, e os pares oficial/custo em paralelo — restrito ao ramo de fórmula que Cadastro de Pedidos efetivamente exercita (`BaseDupla = false`, ver evidência).

Não inclua nesta entrega: ICMS normal (já especificado na spec 02, consumido aqui como entrada); IPI/PIS-COFINS/Simples (spec 04); rateio (spec 05); nenhuma tela do Cadastro de Pedidos (specs 06-08); o ramo `BaseDupla = true` (só se aplica a saída, nunca exercitado por Pedidos — documentar a existência, não implementar); `AtribuirValoresRetidosST` (exclusivo de devolução de compra via Nota Avulsa, não se aplica a Pedidos).

## Fronteira de acesso às fontes

- Não tente localizar, abrir ou solicitar arquivos PAS, DFM, data modules, queries ou qualquer outra fonte Delphi.
- As evidências Delphi abaixo já foram extraídas no workspace de análise a partir de `repositorio/dmbasico.pas` (`TdtmBasico.CalcularImpostos_`).
- Use essas evidências como requisitos legados de entrada, preservando suas classificações.
- Inspecione o checkout Laravel para confirmar o estado atual, incluindo o que a spec 02 já deve ter entregado.
- Se uma decisão depender de informação Delphi ausente, registre a pergunta exata para o workspace de análise — não infira.

## Investigação Laravel obrigatória

- os artefatos entregues pela spec 02: orquestração principal, classificação fiscal efetiva (`crt`, CSOSN/CST `_nf`), tabela de alíquota de ICMS — o ICMS-ST reaproveita a mesma tabela de alíquota (parametrizada por UF de substituição) e a mesma classificação de regime;
- o campo de fator de substituição/MVA no cadastro de item do pedido (`pMVAST`/`fatorsubstituicao` no Delphi) — confirmar o campo equivalente no Laravel, incluindo a flag de "digitado manualmente".

## Evidência Delphi confirmada

### `BaseDupla` — restringe o escopo prático (CONFIRMADO, `dmbasico.pas:20761-20782`)

`BaseDupla` só pode ser `true` quando `saida = true`; para qualquer entrada (sempre o caso de Cadastro de Pedidos), retorna `false` incondicionalmente. Das duas ramificações que a base/valor ST têm, **Cadastro de Pedidos só exercita o ramo "não `BaseDupla`"** — documentar a existência do método alternativo para fidelidade ao motor, mas não implementá-lo com profundidade.

### Base de cálculo ST (CONFIRMADO, `dmbasico.pas:21793-21916`, ramo `not BaseDupla`)

```
baseST = (baseICMS + valorIPI) × [(1 + (fatorSubstituicao − 1) × ajusteMVA) × equalizacao]
```

- `fatorSubstituicao` vem sempre do **campo do item** (nunca recalculado por uma função/tabela interna do motor).
- `ajusteMVA = 1`, exceto se o regime for Simples Nacional e houver um percentual de redução de MVA configurado — nesse caso `ajusteMVA = 1 − PercReducaoMVA/100`.
- `equalizacao = 1` quando a nota é do mesmo estado da filial base, ou quando o regime é Simples (entrada ou saída) — senão, `equalizacao = (1 − aliquotaICMS/100) / (1 − aliquotaICMSST/100)`. **Esta fórmula já foi corrigida e validada pela contabilidade do cliente** (registro histórico de 2018, após um caso real de cálculo errado) — preservar exatamente como está, não questionar ou "simplificar".
- Uma variante `_custo` replica a mesma fórmula usando o conjunto de campos de custo (base/alíquota/fator de substituição próprios) — mesmo padrão de par oficial/custo do ICMS normal (spec 02). Replicar os dois pares.

### Redução de base ST e valor ST (CONFIRMADO, `dmbasico.pas:21917-21947`)

```
ReducaoBaseST(_custo) = baseST(_custo) × pRedBCST(_custo) / 100
IcmsValorST = ICMSBaseCalculoST × aliquotaicmsst / 100          (ramo not BaseDupla)
IcmsValorST_Custo = ICMSBaseCalculoSTCusto × aliquotaicmsst_custo / 100
```

### FCP-ST e alíquota ST (CONFIRMADO)

FCP-ST/FCP-ST-retido usam a mesma mecânica do FCP normal (spec 02), só a base e a alíquota mudam. `AliquotaICMSST` consulta uma tabela parametrizada por produto + UF + tipo de pessoa + contribuinte origem/destino + venda a consumidor final — mesmo padrão evolutivo do `AliquotaICMS`.

### Achados a não replicar

- `FatorSubstituicao(EstadoSubstituicao)` — inteiramente comentado; confirma que o fator vem sempre do campo do item, nunca desta função.
- Versão anterior mais simples de `AliquotaICMSST` (sem parâmetros de contribuinte/consumidor final) — comentada, superada.
- `AtribuirValoresRetidosST` (~256 linhas) — só executa para `OrigemCalculo = NotaAvulsa` em devolução de compra; **nunca** para `OrigemCalculo = CadastroPedidos`. Não implementar nesta entrega.

## Decisões obrigatórias

1. Implementar somente o ramo `not BaseDupla` com fidelidade total; documentar a existência de `BaseDupla` sem implementar o ramo alternativo.
2. Fator de substituição sempre lido do campo do item (nunca recalculado por engine).
3. Fórmula de equalização preservada exatamente como corrigida/validada pela contabilidade — não simplificar nem "corrigir" mais.
4. Pares oficial/custo em paralelo (base, alíquota, valor) — replicar ambos, mesmo padrão do ICMS normal.
5. `AtribuirValoresRetidosST` não é implementado — fora do caminho de execução de Pedidos.

## Critérios de aceite

- [ ] `BaseDupla` é sempre tratado como falso para o fluxo de Pedidos.
- [ ] Base ST = `(baseICMS+IPI) × fator MVA ajustado × equalização`, com o fator de substituição vindo sempre do campo do item.
- [ ] Fórmula de equalização replicada exatamente (incluindo a correção histórica), sem alteração.
- [ ] Par oficial/custo (base, alíquota, valor de ST) calculado em paralelo, sem unificação.
- [ ] Alíquota ST resolvida por tabela com os mesmos parâmetros de contribuinte/consumidor-final do ICMS normal.
- [ ] `AtribuirValoresRetidosST` não é acionado em nenhum fluxo de Pedidos.

## Matriz mínima de testes

- **ICMS-ST — caso dourado**: item com fator de substituição do cadastro, MVA ajustado e equalização por diferença de estado → valor ST bate com a fórmula documentada.
- **Simples Nacional com redução de MVA**: fornecedor do Simples com `PercReducaoMVA` configurado → `ajusteMVA` reduzido corretamente.
- **Equalização — mesmo estado vs. estados diferentes**: comparar o cálculo com filial e fornecedor no mesmo estado (equalização = 1) contra estados diferentes (fórmula completa).
- **Pares oficial/custo**: item com base/alíquota/fator de substituição "_custo" diferentes dos oficiais → os dois valores de ST calculados independentemente.
- **Ausência de `BaseDupla`**: nenhum cenário de Pedido deve acionar o ramo `BaseDupla = true`.

## Saída esperada do SpecKit

Produza uma especificação executável e um plano que:

- listem os requisitos funcionais da família ICMS-ST, restrita ao ramo exercitado por Pedidos;
- identifiquem os repositórios/serviços Laravel atuais a estender, após inspecioná-los (incluindo o que a spec 02 entregou);
- detalhem as fórmulas de base, redução, valor e FCP-ST acima, preservando a correção histórica de equalização;
- incluam os critérios de aceite e a matriz de testes acima;
- declarem explicitamente que `BaseDupla=true` e `AtribuirValoresRetidosST` **não fazem parte** desta entrega;
- não mandem investigar Delphi, nem inventem lógica das demais famílias fiscais.

## Fora de escopo

- implementar durante `/speckit.specify`;
- ICMS normal (já especificado na spec 02);
- IPI, PIS/COFINS, Simples Nacional/CSOSN (spec 04);
- rateio de frete/desconto/despesas acessórias e produtos compostos (spec 05);
- o ramo `BaseDupla = true` — só se aplica a saída, nunca exercitado por Pedidos;
- `AtribuirValoresRetidosST` — exclusivo de devolução de compra via Nota Avulsa;
- qualquer tela do Cadastro de Pedidos de Compra (specs 06-08);
- alterar o schema Delphi ou desativar qualquer tela Delphi.
```
