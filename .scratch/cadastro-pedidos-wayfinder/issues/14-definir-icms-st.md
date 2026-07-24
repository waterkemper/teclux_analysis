# Definir o motor de Impostos — ICMS-ST (substituição tributária)

Type: grilling
Status: resolved
Blocked by: 05, 13

## Question

Dentro de `TdtmBasico.CalcularImpostos_` (`repositorio/dmbasico.pas:20573-26694`), documentar a lógica de substituição tributária: base de cálculo ST (`icmsbasecalculost`/`icmsbasecalculost_custo`, `dmbasico.pas:21793-21916`), redução de base ST (`ReducaoBaseST`/`ReducaoBaseST_Custo`, `:21917-21929`), valor ST (`IcmsValorST`/`IcmsValorST_Custo`, `:21930-21948`), fator de substituição/MVA (`FatorSubstituicao`, `:21594-21621`; `PercReducaoMVA`, `:21622-21672`), alíquota ST (`AliquotaICMSST`, `:21673-21698`, duas sobrecargas), FCP-ST (`IcmsValorfcpst`/`IcmsValorfcpstRet`, `:21520-21533`), base dupla (`BaseDupla`, `:20761-20784`), e a rotina de retenção (`AtribuirValoresRetidosST`, `:21975-22231`, ~256 linhas — provavelmente o maior helper local, merece leitura própria). Confirma a relação com os campos editáveis já mapeados no ticket 05 (`pMVAST`, `fatorsubstituicao`, `predbcst`, `reducaobasest`, `icmsbasecalculost`, `aliquotaicmsst`, `icmsvalorst`, flag `valoricmsstdigitado`) — qual o efeito exato de cada edição manual sobre o recálculo?

## Answer

### `BaseDupla` — achado que restringe o escopo prático (CONFIRMADO, `dmbasico.pas:20761-20782`)

`BaseDupla` só pode ser `true` quando `saida = true` (venda/saída) — para qualquer entrada (`saida = false`, que é sempre o caso de um Pedido de Compra), **retorna `false` incondicionalmente**. Isso significa: das duas ramificações que `icmsbasecalculost`/`IcmsValorST` têm (uma para `BaseDupla`, outra para não), **Cadastro de Pedidos só exercita o ramo "não `BaseDupla`"** — o método alternativo de cálculo por "base dupla" (usado por alguns estados, configurado em `estados.basedupla`) nunca se aplica a Pedidos de Compra. Documentar a existência do método para fidelidade ao motor, mas não é preciso ele funcionar corretamente nesta fatia.

### Base de cálculo ST (CONFIRMADO, `icmsbasecalculost`, `dmbasico.pas:21793-21872`, ramo relevante a Pedidos = `not BaseDupla`)

```
baseST = (baseICMS + valorIPI) × [(1 + (fatorSubstituicao − 1) × ajusteMVA) × equalizacao]
```

- `fatorSubstituicao` vem do **campo do item** (`produtos.fatorsubstituicao`), não de uma função — confirma o achado do ticket 05: é o campo editável (`pMVAST`/`fatorsubstituicao`, com a flag `valoricmsstdigitado`) que efetivamente alimenta o cálculo, não uma consulta a uma tabela dentro do motor.
- `ajusteMVA = 1`, exceto se o regime tributário for Simples Nacional (`crt in [1,4]`) e houver `PercReducaoMVA` configurado — nesse caso `ajusteMVA = 1 − PercReducaoMVA/100` (reduz o MVA para empresas do Simples, por regra estadual).
- `equalizacao = 1` quando a nota é do mesmo estado da filial base, ou quando o regime é Simples (`crt in [1,4]`, tanto em entrada quanto em saída) — senão, `equalizacao = (1 − aliquotaICMS/100) / (1 − aliquotaICMSST/100)` (compensa a diferença entre a alíquota própria e a de substituição quando os estados/regimes divergem). **Achado histórico relevante**: um comentário no código (`:21846-21849`, datado de 23/05/2018, "a pedido da Infotec") documenta que uma segunda condição de equalização foi removida a pedido da contabilidade após um contrato real (300020896) calcular errado — ou seja, esta fórmula já passou por correção validada pela contabilidade do cliente, não é uma suposição a questionar.
- Uma variante `icmsbasecalculost_custo` (`:21874-21915`) replica a mesma fórmula usando o conjunto de campos `_custo` (base/alíquota/fator de substituição próprios para custo) — mesmo padrão de par oficial/custo já visto no ICMS normal (ticket 13).

### Redução de base ST e Valor ST (CONFIRMADO, `dmbasico.pas:21917-21947`)

- `ReducaoBaseST`/`ReducaoBaseST_Custo` = `baseST × pRedBCST(_custo) / 100` — mesmo padrão simples de percentual sobre a base.
- `IcmsValorST` (ramo `not BaseDupla`, relevante a Pedidos) = `ICMSBaseCalculoST × aliquotaicmsst / 100`. O ramo `BaseDupla` (irrelevante aqui, só saída) calcularia como a diferença entre as duas alíquotas em vez do valor cheio — documentado só por completude.
- `IcmsValorST_Custo` = `ICMSBaseCalculoSTCusto × aliquotaicmsst_custo / 100` — mesma fórmula, campos de custo.

### FCP-ST e alíquota ST (CONFIRMADO)

`IcmsValorfcpst`/`IcmsValorfcpstRet` já documentados no ticket 13 (mesma mecânica, bases diferentes). `AliquotaICMSST(EstadoSubstituicao)` (`:21684-21694`) consulta uma tabela parametrizada por produto + UF + tipo de pessoa + contribuinte origem/destino + venda a consumidor final — mesmo padrão evolutivo do `AliquotaICMS` (ticket 13): existe uma versão anterior mais simples **comentada/morta** (`:21672-21682`) sem os parâmetros de contribuinte, não usar como referência.

### Achados — código morto (não replicar)

- `FatorSubstituicao(EstadoSubstituicao)` (`:21594-21619`) está **inteiramente comentado** — a função que buscaria o fator de substituição numa tabela (`qryFatorSubstituicao`) não está em uso; confirma que o fator vem sempre do campo do item, nunca desta função.
- `AtribuirValoresRetidosST` (`:21975-22231`, ~256 linhas) só executa quando `OrigemCalculo = NotaAvulsa` **e** a nota é especificamente uma devolução de compra (`eHNotaFiscalSaidaDevolucao`) — **não se aplica a `OrigemCalculo = CadastroPedidos`**. Confirmado pela guarda condicional logo no início da rotina; não foi necessário ler o restante das 256 linhas — documentar como existente no motor compartilhado, mas fora do caminho de execução de Pedidos.

### Decisão

Especificar ICMS-ST como: base = `(baseICMS + IPI) × fator ajustado por MVA × equalização`, com o fator de substituição vindo sempre do campo do item (nunca recalculado por engine), a fórmula de equalização com a correção histórica validada pela contabilidade preservada tal como está, alíquota ST resolvida por tabela com os mesmos parâmetros de contribuinte/consumidor-final do ICMS normal, e os pares oficial/custo em paralelo (mesmo padrão do ticket 13). **Não implementar** o ramo `BaseDupla` com fidelidade total (nunca é exercitado por Pedidos, `saida` é sempre falso) nem `AtribuirValoresRetidosST` (exclusivo de devolução de compra via Nota Avulsa) — documentar a existência de ambos, sem aprofundar.
