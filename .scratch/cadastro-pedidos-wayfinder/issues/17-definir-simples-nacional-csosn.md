# Definir o motor de Impostos — Simples Nacional, CSOSN/CST e regime tributário

Type: grilling
Status: resolved
Blocked by: 05

## Question

Dentro de `TdtmBasico.CalcularImpostos_` (`repositorio/dmbasico.pas:20573-26694`), documentar a determinação de regime tributário e classificação fiscal: `RegimeTributario_`/`crt` (`dmbasico.pas:20701-20708,20941-20951` — retorna 1-Simples/2-Simples com excesso/3-Normal), `csosn_nf`/`cst_nf`/`csosn_empresa`/`csosn_produto`/`cst_empresa`/`cst_produto`/`ipicst` (`:20952-21004` — como o CSOSN ou CST efetivo é decidido: por produto, por empresa, ou por natureza da operação — qual tem precedência), e como isso se conecta ao seletor `fraConsultaCSOSN_OU_CST_NF` já identificado em `fmcadastroprodutospedidos_.pas:525` (ticket 01) e à função `CondicaoCSOSN` de `dmcadastropedidos.pas:5013-5018`. Este é o ponto de entrada que decide **qual conjunto de regras fiscais** (Simples vs. Normal, CSOSN vs. CST) se aplica ao restante do cálculo (tickets 13-16) — resolver antes ou em conjunto com eles ajuda a interpretar as ramificações condicionais que esses tickets vão encontrar.

## Answer

### `crt` — de quem é o regime que vale (CONFIRMADO, `dmbasico.pas:20941-20950`)

```
crt = 1 (Simples) | 2 (Simples com excesso) | 3 (Normal)
```

Se `NFSaidaouEntradaPelaEmpresa` (o documento pertence à própria empresa — ela é quem emite/é dona da operação), usa o **regime tributário da própria filial** (`regimetributario_`); senão, usa o `crt` declarado no documento da contraparte (`notas.crt`) se existir, ou assume `3` (Normal) por padrão.

### CSOSN vs. CST — qual campo é o "efetivo" (CONFIRMADO, `dmbasico.pas:20952-21002`)

Existem **3 fontes** de classificação fiscal, cada uma com propósito diferente:

- **`csosn_empresa`/`cst_empresa`** (`:20977-21002`) — sempre lê os campos próprios do item (`csosn`/`incidencia`), independente de contexto. É "como o produto está classificado no cadastro/no pedido", fixo.
- **`csosn_nf`/`cst_nf`** (`:20961-20975`) — o valor **efetivo a usar no cálculo**: se `NFSaidaouEntradaPelaEmpresa`, usa os mesmos campos de `csosn_empresa`/`cst_empresa`; senão, usa campos alternativos `csosn_nf`/`cst_nf` (a classificação declarada pela contraparte no documento dela). É esta versão (`_nf`) que efetivamente pilota as ramificações condicionais usadas nos tickets 13-16 (ex.: `NotaSubstituicao(csosn ou incidencia)` no motor de custo, ticket 06).
- **`csosn_produto`/`cst_produto`** (`:20983-20997`) — lê campos específicos só presentes em alguns datasets (`FindField`, retorna `''` se não existir); é a classificação **padrão do produto no cadastro geral**, usada como referência/fallback, não como valor operante do cálculo.

### Qual campo o usuário vê/edita — `CondicaoCSOSN` (CONFIRMADO, `dmcadastropedidos.pas:5013-5017`)

Em Cadastro de Pedidos, `CondicaoCSOSN = (crt do fornecedor selecionado = 1)` — ou seja, **é o regime tributário do fornecedor** (não da própria filial) que decide se o seletor `fraConsultaCSOSN_OU_CST_NF` (ticket 01) mostra o campo CSOSN (fornecedor no Simples) ou CST (fornecedor no regime Normal). Faz sentido para uma compra: o campo relevante é o que o fornecedor efetivamente vai declarar na nota fiscal dele.

### Decisão

Especificar: (1) o regime tributário efetivo (`crt`) vem da filial própria quando a operação é nossa, ou do documento da contraparte quando não é — para Pedidos, na prática, normalmente é o regime da própria filial; (2) três campos de classificação fiscal com propósitos distintos (própria/efetiva/produto), sendo a "efetiva" (`_nf`) a que pilota o cálculo; (3) a escolha do campo mostrado ao usuário (CSOSN vs. CST) depende do regime do **fornecedor**, não da filial — replicar essa regra específica, não generalizar para "sempre olhar o próprio regime".
