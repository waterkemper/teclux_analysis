# Dados, cálculos e layout do Relatório de Situação dos Fornecedores no Delphi

## Fontes e estrutura

Fontes primárias investigadas:

- `C:/projetos.vcl/apps/contaspagar/dmrelatoriosituacaofornecedores.pas`;
- `C:/projetos.vcl/apps/contaspagar/dmrelatoriosituacaofornecedores.dfm`.

O relatório usa uma relação mestre–detalhe:

- `qryNotasPag` produz uma linha de cabeçalho por Documento e os totais históricos na Data de Situação (`.dfm:1110-1473`);
- `qryDuplicatas` é ligada ao mestre por `codigo` e `tipo`, e produz as parcelas/vencimentos daquele Documento (`.dfm:116-125`, `.dfm:199-342`);
- `fdsNotasEntrada` expõe o mestre ao template, enquanto `fdsDuplicatas` alimenta o sub-relatório de vencimentos (`.dfm:1104-1109`, `.dfm:1477-1486`).

As duas consultas são reabertas antes da impressão; o retorno considera sucesso quando o mestre possui linhas (`.pas:443-448`).

## Universo de Documentos

As consultas unem dois ramos com identidade explícita:

1. `NP`: registros de `notaspag`, associados ao Documento por `np.documentopag`;
2. `DP`: registros de `documentospag` que **não** possuem `notaspag` correspondente.

Isso evita duplicar um Documento que tenha nota e, ao mesmo tempo, permite listar Documentos sem nota (`.dfm:1205-1286`, `.dfm:1287-1367`; no detalhe, `.dfm:203-240` e `.dfm:241-281`).

No ramo `NP`, a Filial, série, número fiscal, CFOP/natureza, datas e valor vêm da nota; `numero` usa `coalesce(np.numero,np.documentopag)`. No ramo `DP`, não há série nem código fiscal, a “data” é `datalancto`, e `valornota` é `dp.valor` (`.dfm:1206-1229`, `.dfm:1288-1315`).

O fornecedor é identificado por código + `tipofornecedor`, com nome/razão e CPF/CNPJ vindos de `vfornecedores`; o Documento carrega Filial e grupo de Filial (`.dfm:1208-1223`, `.dfm:1290-1305`).

## Janela temporal

`DataInicial` e `DataSituacao` são aplicadas às duas queries. Se a Data de Situação for informada sem início, o início assume a própria Data de Situação; se ela vier vazia, assume o início. O cabeçalho registra somente `A partir de: <DataInicial>` (`.pas:224-240`).

Na SQL efetiva:

- notas usam `np.data between :DataInicial and :DataSituacao`;
- Documentos sem nota usam `dp.datalancto between :DataInicial and :DataSituacao`.

Isso ocorre no mestre (`.dfm:1275`, `.dfm:1354`) e no detalhe (`.dfm:227-229`, `.dfm:265-267`). Os limites são inclusivos.

Existe um setter `TipodeData` que tenta alternar nota entre `np.data` e `np.emissao`, mas nenhuma das queries declara/usa a macro `TipodeData`; as SQLs permanecem fixas em `np.data` e `dp.datalancto` (`.pas:325-338`; listas de macros em `.dfm:128-198` e `.dfm:1120-1200`). Portanto, emissão **não é um critério temporal efetivo** nesta unit; ela é somente campo exibido. Uma nova especificação deve decidir se preserva o comportamento real ou corrige essa intenção abandonada.

## Fotografia histórica na Data de Situação

### Saldo Devedor

Para cada Documento, o Saldo Devedor é:

```text
SUM(valorvencto das parcelas cuja datapagto é nula ou posterior à DataSituacao)
```

A mesma fórmula existe nos dois ramos (`.dfm:1239-1244`, `.dfm:1321-1326`). Pagamentos ocorridos depois da data de corte são tratados como ainda não pagos. O cálculo não usa `valorpagto`, desconto ou juros: soma integralmente `valorvencto` das parcelas abertas naquela data.

Quando “somente Duplicatas em aberto” está ativo, o mestre é filtrado por `saldodevedor > 0`, e o detalhe mantém apenas parcelas não pagas ou pagas depois da data de corte (`.pas:480-494`).

### Estado histórico de cada parcela

No detalhe, se `datapagto` é nula ou posterior à Data de Situação:

- `datapagto` histórica = nula;
- `valorpagto` histórico = `0`;
- `valorjurosdesconto` = `0`;
- `ndias = datavencto - DataSituacao`.

Se o pagamento ocorreu até a data de corte:

- preserva `datapagto` e `valorpagto`;
- `valorjurosdesconto = valorvencto - valorpagto`;
- `ndias = datavencto - datapagto`.

As fórmulas estão duplicadas para notas e Documentos sem nota (`.dfm:204-225`, `.dfm:242-263`). `ndias` positivo indica pagamento/corte antes do vencimento; negativo indica atraso. O nome “juros/desconto” conserva o sinal: pagamento maior que vencimento gera valor negativo, pagamento menor gera positivo.

### Totais do Documento

- `totalvalorvencto`: soma de `valorvencto` de **todas** as parcelas, sem corte temporal (`.dfm:1246-1248`, `.dfm:1328-1330`).
- `totalvalorpagto`: apesar do nome, soma `valorvencto`, não `valorpagto`, para parcelas pagas até a Data de Situação (`.dfm:1250-1254`, `.dfm:1332-1336`). No layout, isso representa valor nominal “pago”.
- `totalvalorjurosdesconto`: soma `valorvencto - valorpagto` das parcelas pagas até a data de corte (`.dfm:1256-1260`, `.dfm:1338-1342`).
- `impostosretidos`: soma no Documento de IR, INSS, ISS, COFINS, PIS e CSLL retidos (`.dfm:1231-1233`, `.dfm:1313-1315`).
- `existeduplicata`: existência de qualquer parcela para o Documento (`.dfm:1234-1238`, `.dfm:1316-1320`).

O “valor total do Documento” possui duas medidas legadas distintas: `valornota` (valor cadastrado da nota/Documento) e `totalvalorvencto` (soma nominal das parcelas). Ambas aparecem no detalhado; o resumo chama `valornota` de faturado e não mostra `totalvalorvencto` como coluna principal.

## Filtros efetivos

Todos os filtros relevantes, salvo natureza, são aplicados simetricamente às duas queries e aos ramos `NP`/`DP`:

- fornecedor específico por código (`.pas:340-361`);
- múltiplas Filiais (`np.filial` / `dp.filialemissao`) (`.pas:363-390`);
- múltiplos grupos de Filiais via `filiaisgruposfiliais` (`.pas:392-425`);
- previsões: com, sem ou somente Documentos marcados como previsão (`.pas:450-478`);
- situação do Documento: com Duplicatas, sem Duplicatas ou ambos (`.pas:496-524`);
- tipos de fornecimento Produto/Transporte/Montagem via `listatipofornecimento` (`.pas:644-711`);
- exclusão de fornecedor tipo cliente (`C`) quando a opção correspondente não está habilitada (`.pas:620-642`). Há inconsistência no texto de cabeçalho: ao excluir clientes, acrescenta `Lista Clientes: Sim` (`.pas:627-634`).
- somente Documentos com nota: elimina o ramo `DP` injetando `and FALSE` (`.pas:714-728`).

Natureza/CFOP é aplicada somente ao ramo de `notaspag`, em `np.codigonatureza`; não se aplica a Documentos sem nota (`.pas:584-600`; macro no mestre em `.dfm:1146-1150`).

Os filtros são montados por concatenação de strings/macros. A nova implementação deve usar entradas tipadas e parâmetros, sem transportar esse mecanismo.

## Ordenação e agrupamentos

A ordem mestre é composta por:

1. nome/código do grupo de Filial, se agrupado;
2. nome/código da Filial, se agrupada;
3. sempre fornecedor por nome, código e tipo;
4. então Documento + data (`TipoOrdenacao = 0`) ou data + Documento (`TipoOrdenacao = 1`).

Fonte: `.pas:427-441`. O detalhe é sempre ordenado por Documento, vencimento e número da parcela (`.dfm:281-282`).

O template detalhado possui grupos por grupo de Filial, Filial e fornecedor; grupo/Filial são opcionais, fornecedor é sempre visível. Pode iniciar nova página a cada fornecedor (`.dfm:352-1102`, especialmente o script serializado iniciado em `.dfm:356`; variáveis no fim do blob em `.dfm:1095-1101`).

O resumo oculta a banda mestre dos Documentos, oculta o cabeçalho do fornecedor e mantém seu rodapé, produzindo uma linha consolidada por fornecedor; grupo e Filial continuam opcionais (`.dfm:1497-2111`, script em `.dfm:1501-1510`, variáveis em `.dfm:2101-2110`).

## Layout detalhado

O relatório detalhado apresenta:

- cabeçalho com razão/endereço da Filial-base, título `SITUAÇÃO DOS FORNECEDORES EM dd/mm/aa`, filtros, data/hora e página (`.pas:176-190`; template `.dfm:352-1102`);
- identificação de grupo de Filial, Filial e fornecedor/CPF-CNPJ;
- cabeçalho do Documento: Filial, série, número, data, emissão, valor da nota, impostos retidos e Saldo Devedor;
- sub-relatório de Duplicatas: número, vencimento, valor, pagamento (data/valor), juros/desconto e dias;
- subtotais do fornecedor, Filial, grupo de Filial e total geral.

Os totais de cada nível somam:

- `valornota` **somente quando `ExisteDuplicata = true`**;
- `totalvalorvencto`;
- `totalvalorpagto`;
- `totalvalorjurosdesconto`;
- `saldodevedor`;
- `impostosretidos` somente quando existem Duplicatas.

Essas expressões estão serializadas no `ReportForm` detalhado (`.dfm:352-1102`). O detalhe alterna cores entre Documento e sublinhas de Duplicatas, preservando continuidade por `LINHA`/`LINHASUB` (`.pas:526-562`).

Há uma anomalia de template: o campo de juros/desconto da parcela é ocultado apenas quando seu valor é exatamente `1`, em vez de quando é `0`; isso está no script serializado do `Memo56` dentro de `.dfm:352-1102`. A especificação nova deve corrigi-lo para a semântica pretendida, não reproduzir o literal `<> 1`.

## Layout resumo

O resumo gera uma linha por fornecedor com colunas:

- fornecedor e CPF/CNPJ;
- valores faturados (`SUM(valornota)` somente com Duplicata);
- valores pagos (`SUM(totalvalorpagto)`);
- juros/descontos (`SUM(totalvalorjurosdesconto)`);
- Saldo Devedor (`SUM(saldodevedor)`);
- impostos retidos (`SUM(impostosretidos)` somente com Duplicata).

Também oferece subtotais por Filial, grupo de Filial e total na Data de Situação. As expressões estão no `ReportForm` resumo (`.dfm:1497-2111`). A zebra é alternada por linha consolidada (`.pas:564-582`).

## Seleção de saída e cabeçalho

`Resumo` controla a composição do preview:

- `0`: detalhado seguido do resumo;
- `1`: somente detalhado;
- `2`: somente resumo.

Fonte: `.pas:194-213`. O mesmo conjunto aberto de queries alimenta ambas as partes, mas o legado não cria fotografia imutável: mudanças concorrentes entre abertura e renderização não são protegidas.

O logo é carregado da Filial-base quando disponível; a cor zebrada vem dos parâmetros do sistema (`.pas:526-580`).

## Pontos que exigem decisão/correção na especificação

1. Definir `DataInicial` como limite de inclusão de Documentos e `DataSituacao` como data de corte financeira, pois são papéis diferentes.
2. Preservar a fórmula histórica do Saldo Devedor baseada em `valorvencto`, explicitando que descontos/juros não alteram esse saldo.
3. Preservar a diferença entre `valornota` e soma das parcelas (`totalvalorvencto`).
4. Decidir conscientemente sobre o seletor de tipo de data, hoje inoperante.
5. Corrigir o campo juros/desconto ocultado em `1`, a legenda invertida de clientes e o uso de SQL concatenada.
6. Tratar nulos de somas de Documentos sem Duplicatas de forma explícita e consistente no novo contrato.
7. Gerar detalhe e resumo da mesma fotografia para assegurar igualdade entre preview, PDF e impressão.

