# Dados, layouts e cálculos do Relatório de Contas a Pagar no Delphi

## Escopo e fontes primárias

Inventário do data module legado `dmrelatorioduplicatas`, com foco na consulta, macros, campos derivados e templates que efetivamente alimentam a impressão. As referências abaixo apontam para:

- `C:/projetos.vcl/apps/contaspagar/dmrelatorioduplicatas.pas`;
- `C:/projetos.vcl/apps/contaspagar/dmrelatorioduplicatas.dfm`.

O módulo possui três modalidades (`TipoRelatorio`): **0 — contas/duplicatas a pagar**, **1 — contas por data de competência** e **2 — pagamentos efetuados**. Isso é comprovado tanto pela semântica do período quanto pela seleção dos templates; o comentário antigo que chama `1` de “quitadas” está desatualizado em relação ao código executado (`.pas:672-688`, `.pas:894-903`, `.pas:549-645`).

## Modelo de dados comum

Uma única `qryDuplicatas` alimenta todas as modalidades. A consulta é a união de dois ramos (`.dfm:265-580`):

1. **Duplicatas comuns** — `duplicatas t`, `documentospag d`, nota opcional, Filial/grupo, Evento e `vfornecedores` (`.dfm:324-447`).
2. **Adiantamentos** — Documento marcado `adiantamento`, projetado como uma parcela sintética (`numero = 1`), com lançamento usado também como vencimento e pagamento, e valor do Documento usado como vencimento/pagamento (`.dfm:450-576`).

Parâmetros booleanos decidem se entram duplicatas e/ou adiantamentos; a opção oferece **com adiantamentos**, **sem adiantamentos** e **somente adiantamentos** (`.pas:1280-1301`; `.dfm:584-599`).

### Campos projetados

A linha traz identidade do Documento e parcela, Filial/CNPJ e grupo, nota/série, complementos do Documento e da Duplicata, Parte Fornecedora/tipo/nome/CPF-CNPJ, emissão, lançamento/competência, previsão, banco de cobrança, vencimento, valor de vencimento, desconto, data/valor/conta/banco do pagamento, observação, indicador de adiantamento, DDA, regime de caixa, Evento e usuários de lançamento/pagamento (`.dfm:324-405`, `.dfm:454-535`, `.dfm:600-804`).

O usuário de lançamento/pagamento das duplicatas é obtido de `duplicatas_log`; para adiantamentos, de `documentospag_log` (`.dfm:374-397`, `.dfm:510-531`).

### Campos e fórmulas derivados

- `mesAno = to_char(datalancto, 'MM/YYYY')` (`.dfm:266-268`).
- `valorliquido = coalesce(valorvencto,0) - coalesce(valordesconto,0)` (`.dfm:315-317`).
- `documento`: `serie + ' / ' + nota` quando ambos existem; caso contrário, complemento do Documento (`.pas:1052-1062`).
- `ValorJurosPagos`: somente quando `valorpagto > valorvencto`, diferença entre os dois (`.pas:1063-1067`).
- `ValorDescReceb`: quando há pagamento não zero inferior ao vencimento, diferença entre vencimento e pagamento (`.pas:1069-1073`). Este “desconto recebido” é diferente do campo persistido `valordesconto`.
- `EventoDescricao = evento + ' - ' + descricao_evento` (`.pas:1076-1078`).
- `obs` das duplicatas é a distância absoluta, em dias, entre vencimento e data corrente, no formato `N - D`; adiantamento deixa esse campo nulo (`.dfm:360-363`, `.dfm:497-498`).
- Em regime de caixa, `datalancto` exibida/filtrada como competência passa a ser `datavencto`, e `valor` passa a ser `valorvencto`; fora dele são `datalancto` e valor do Documento (`.dfm:340-344`, `.dfm:399-404`).

Há ainda agregados por Documento. Para Documentos fora do regime de caixa, `TotalValorPagto`, `TotalValorJurosPagos`, `TotalValorDescReceb` e `QtParcelas` são calculados sobre todas as parcelas; se a soma/contagem resultar zero, usa-se a linha atual. Em regime de caixa, o fallback por linha evita agregar o Documento (`.dfm:269-313`).

## Modalidades e período efetivo

### Contas a pagar (`TipoRelatorio = 0`)

- Inclui somente parcelas com `datapagto is null` (`.pas:899-903`).
- O período principal filtra `t.datavencto`; o período de emissão filtra `d.emissao` (`.pas:672-677`, `.pas:691-745`).
- A previsão é aplicável somente aqui: todas, sem previsão (`d.previsao = false`) ou somente previsão (`true`) (`.pas:865-886`).
- Autorização pode filtrar autorizadas, não autorizadas ou todas (`.pas:1012-1021`).
- Usa `frpDuplicatasPagar` e/ou `frpResumoDuplicatasPagar`, conforme o modo de saída (`.pas:549-561`, `.pas:610-615`, `.pas:628-633`).

### Contas por data de competência (`TipoRelatorio = 1`)

- Não filtra por situação de pagamento (`TipoRelatorio` vazio), portanto inclui abertas e pagas (`.pas:899-903`).
- O período principal é `case when regimedecaixa then datavencto else datalancto end` (`.pas:679-682`).
- Usa os templates FastReport `frxDuplicatasporCompetencia` e `frxResumoDuplicatasporCompetencia`; quando a saída é “ambos”, prepara o detalhado e anexa o resumo ao mesmo preview (`.pas:563-590`, `.pas:617-619`, `.pas:635-637`).
- Pode carregar overrides externos `frxDuplicatasporCompetencia.fr3` e `frxResumoDuplicatasporCompetencia.fr3` ao lado do executável, substituindo os templates embarcados (`.pas:475-481`). Logo, a implementação nova deve tratar o DFM como baseline, não garantir paridade com customizações locais desconhecidas.

### Pagamentos efetuados (`TipoRelatorio = 2`)

- Inclui somente parcelas com `datapagto is not null` (`.pas:899-903`).
- O período principal filtra `t.datapagto` (`.pas:684-688`).
- O filtro de autorização é deliberadamente ignorado (`.pas:1012-1016`).
- Usa `frpPagamentosEfetuados` e/ou `frpResumoPagamentosEfetuados` (`.pas:592-607`, `.pas:622-626`, `.pas:640-643`).

Para adiantamentos, o período principal usa sempre `d.datalancto`, independentemente da modalidade (`.pas:665-666`, `.pas:691-720`).

## Filtros SQL efetivos

- **Período principal** e **período de emissão**: uma data isolada quando só uma extremidade é preenchida; intervalo inclusivo quando ambas são preenchidas (`.pas:691-745`).
- **Filiais**: múltiplos códigos em `d.filialemissao in (...)` (`.pas:1337-1355`).
- **Grupos de Filiais**: Filiais pertencentes a qualquer grupo selecionado (`.pas:1358-1382`).
- **Parte Fornecedora**: código + tipo da Parte (`.pas:820-832`).
- **Grupo de fornecedores**: código presente em `fornecedores.grupofornecedor` (`.pas:836-849`).
- **Tipo de fornecimento**: interseção com `listatipofornecimento(f.tipofornecimento)`; aplica-se ao tipo `F` (`.pas:1024-1043`).
- **Banco**: banco de cobrança nas contas a pagar/competência; banco da Conta de pagamento nos pagamentos efetuados; adiantamentos sempre derivam o banco de `d.contapagto` (`.pas:771-802`).
- **Conta de pagamento**: `t.contapagto` nas duplicatas e `d.contapagto` nos adiantamentos (`.pas:1404-1417`).
- **Evento**: expressão condicional recebida da interface, injetada como `and (<expressão>)` (`.pas:851-861`).
- **Documentos**: expressão condicional recebida, com alias `dp.` trocado por `d.` (`.pas:1427-1439`).
- **Tipo de pagamento**: `t.tipopagamento` ou `d.tipopagamento`, apenas nas modalidades 1 e 2 (`.pas:1108-1122`).
- **DDA**: somente DDA, sem DDA ou ambos; é aplicado somente no ramo de duplicatas (`.pas:1255-1275`; `.dfm:446`, `.dfm:533-575`).
- **Visibilidade administrativa**: para usuário que não seja Administrador/Suporte, exclui `d.administrador`; a macro não é explicitamente limpa para os privilegiados, o que merece correção defensiva no novo contrato (`.pas:1255-1261`).

## Ordenação e agrupamentos

A ordem é montada, nesta sequência: grupo de Filial (se ativo), Filial (se ativa), Documento (se ativo) e a ordenação específica da modalidade (`.pas:921-1008`):

- contas a pagar: por vencimento + fornecedor, ou fornecedor + vencimento;
- competência: por lançamento/competência + Documento/vencimento + fornecedor, ou fornecedor + lançamento/Documento/vencimento;
- pagamentos: por data de pagamento + fornecedor, ou fornecedor + data de pagamento.

`FOrdenacaoDuplicatas` inicia em `N` (nome do fornecedor); a alternativa reconhecida é `D` (data) (`.pas:1083-1088`, `.pas:934-1004`).

Os templates suportam agrupamentos independentes por grupo de Filial, Filial, fornecedor, data e Documento. O script mostra/oculta cabeçalho e rodapé conforme as flags e cria outline para grupo/Filial (`.dfm:2684-2732`, `.dfm:2778-2800`). Quando agrupado por data, um pós-processamento marca linhas repetidas por vencimento (tipo 0), lançamento/competência (tipo 1) ou pagamento (tipo 2), respeitando também os demais grupos (`.pas:1131-1247`).

## Conteúdo e totais dos layouts

Os templates de competência detalhados exibem, na linha/parcela, vencimento, valor de vencimento, desconto persistido, data/valor de pagamento, juros calculados, desconto recebido calculado, observação, DDA, número da parcela, Evento, usuários de lançamento/pagamento e complemento (`.dfm:2881-3151`).

Quando agrupado por Documento, o cabeçalho apresenta Documento, complemento, competência, Parte Fornecedora, valor do Documento, Filial, total pago, juros/desconto recebidos agregados, desconto persistido, quantidade de parcelas e indicadores condensados (`.dfm:3381-3729`).

Rodapés de data/mês, grupo de Filial, Filial e fornecedor, além do total geral, somam cinco medidas: `valorvencto`, `valordesconto`, `valorpagto`, `ValorJurosPagos` e `ValorDescReceb` (`.dfm:3152-3377`, `.dfm:4495-5052`). O template resumo preserva esses mesmos níveis e medidas, omitindo o detalhe de parcelas (`.dfm:5603-7674`).

Os relatórios clássicos de contas a pagar/pagamentos efetuados usam o mesmo dataset e campos; seus templates estão serializados nos componentes `frpDuplicatasPagar`, `frpResumoDuplicatasPagar`, `frpPagamentosEfetuados` e `frpResumoPagamentosEfetuados` (`.dfm:931`, `.dfm:1670`, `.dfm:10107`, `.dfm:10900`). A seleção detalhe/resumo/ambos é `FResumo`: `0` combina detalhado + resumo, `1` somente detalhado, `2` somente resumo (`.pas:549-645`).

O cabeçalho recebe razão/endereço da Filial-base, título, subtítulo com os filtros, e flags de agrupamento; os templates de competência também recebem logo e máscara/cor de zebra do sistema (`.pas:484-539`, `.pas:1385-1401`).

## Regras que a especificação deve preservar ou corrigir explicitamente

1. Preservar a distinção entre desconto persistido (`valordesconto`) e desconto inferido do pagamento (`ValorDescReceb`).
2. Preservar o tratamento de regime de caixa na competência e nos agregados por Documento.
3. Preservar adiantamentos como ramo sem parcela real, deixando claro que sua data/valor são sintetizados.
4. Definir claramente se “todas as duplicatas” é o nome de negócio da modalidade de competência: tecnicamente ela não filtra situação, mas seu período não é genérico; é competência.
5. Corrigir duas fragilidades legadas: macro administrativa potencialmente residual e macro `Autorizado_Adiantamento_nonononon`, que existe no SQL mas não recebe valor em `SetAutorizadas` (`.dfm:250-258`, `.pas:1012-1021`).
6. Não copiar SQL por concatenação: vários filtros recebem strings prontas. O novo relatório deve representar escolhas tipadas e parametrizadas.
7. A fotografia imutável acordada para preview/PDF/impressão não existe no legado: `GerarRelatorio` apenas reabre a consulta e a impressão consome o dataset corrente (`.pas:421-425`, `.pas:464-647`). Ela é requisito novo.

