# Interface e parâmetros do Relatório de Contas a Pagar no Delphi

## Escopo e fontes

Inventário de `fmrelatorioduplicatas.pas/.dfm`, complementado pelo data module diretamente acionado pelo formulário. Fontes primárias: `C:/projetos.vcl/apps/contaspagar/fmrelatorioduplicatas.dfm`, `fmrelatorioduplicatas.pas` e `dmrelatorioduplicatas.pas`.

## Modalidades

Há uma única tela, **Relatório de Duplicatas a Pagar**, com três modalidades no mesmo `TRadioGroup` (padrão: índice 0): **Contas a pagar**, **Contas por data de Competência** e **Pagamentos efetuados** (`fmrelatorioduplicatas.dfm:1-4,799-817`). O índice é transferido para `TipoRelatorio` (`fmrelatorioduplicatas.pas:376-389`).

| Índice | Modalidade | Regra | Período principal | Controles condicionais |
|---|---|---|---|---|
| 0 | Contas a pagar | `datapagto is null` | Vencimentos | Previsões e Autorizadas habilitados; Adiantamentos = Sem e desabilitado |
| 1 | Contas por data de Competência | sem filtro de pagamento | Lançamentos | Tipo de pagamento habilitado; previsões/autorizadas desabilitados; Sem adiantamentos selecionado |
| 2 | Pagamentos efetuados | `datapagto is not null` | Pagamentos | Tipo de pagamento e Adiantamentos habilitados; previsões/autorizadas desabilitados |

Evidências: `fmrelatorioduplicatas.pas:144-159,280-315`; `dmrelatorioduplicatas.pas:890-903`. O rótulo literal legado da segunda opção é “Contas por data de Competência”, não “todas as Duplicatas”.

## Filtros e padrões

- **Período principal (de/até)**: vencimento, lançamento ou pagamento conforme modalidade; começa na data do servidor (`fmrelatorioduplicatas.pas:163-172,280-300`; `fmrelatorioduplicatas.dfm:253-314`).
- **Período de emissão (de/até)**: segundo intervalo, inicialmente vazio (`fmrelatorioduplicatas.dfm:1713-1770`; `fmrelatorioduplicatas.pas:391-395`).
- **Fornecedor ou Grupo de Fornecedor**: abas mutuamente exclusivas; trocar limpa a outra. O título pode ser Fornecedor, Cliente fornecedor ou Filial fornecedor (`fmrelatorioduplicatas.dfm:376-393`; `fmrelatorioduplicatas.pas:144-153,267-277`).
- **Tipo de fornecimento**: checkboxes Montagem, Produto e Transporte, desmarcados por padrão; codificados como `M`, `P`, `T` (`fmrelatorioduplicatas.dfm:316-374`; `fmrelatorioduplicatas.pas:424-434`).
- **Banco e Conta**: pesquisas vinculadas; conta preenche banco e banco incompatível limpa conta (`fmrelatorioduplicatas.dfm:118-131,1400-1507`; `fmrelatorioduplicatas.pas:494-506`).
- **Tipo de pagamento**: lookup habilitado apenas nas modalidades 1 e 2 (`fmrelatorioduplicatas.dfm:849-862`; `fmrelatorioduplicatas.pas:156-159,405`).
- **Previsões**: Com / Sem / Só; padrão **Sem**, só habilitado em Contas a pagar (`fmrelatorioduplicatas.dfm:673-734`; `fmrelatorioduplicatas.pas:156-157`).
- **Autorizadas**: Sim / Não / Ambas; padrão **Sim**, só habilitado em Contas a pagar (`fmrelatorioduplicatas.dfm:615-671`; `fmrelatorioduplicatas.pas:156-157`). Semântica true/false/sem filtro em `dmrelatorioduplicatas.pas:1012-1021`.
- **Adiantamentos**: Com / Sem / Só; padrão **Sem**. Em Contas a pagar é forçado/desabilitado; em Pagamentos é habilitado. Competência seleciona Sem, mas só habilita explicitamente o primeiro radio, assimetria a não copiar sem decisão (`fmrelatorioduplicatas.dfm:983-1044`; `fmrelatorioduplicatas.pas:280-300`). A semântica é duplicatas+adiantamentos / só duplicatas / só adiantamentos (`dmrelatorioduplicatas.pas:1280-1299`).
- **DDA**: Sim / Não / Ambas; padrão **Ambas** (`fmrelatorioduplicatas.dfm:1046-1110`), significando somente DDA / sem DDA / sem filtro (`dmrelatorioduplicatas.pas:1262-1275`).
- **Filiais e Grupos de Filiais**: abas com listas e marcar/desmarcar. Marcar todas de um lado desmarca o outro (`fmrelatorioduplicatas.dfm:1112-1129,1130-1135,1196,1271,1332`; `fmrelatorioduplicatas.pas:461-491`). Listas carregadas em `fmrelatorioduplicatas.pas:171-172`.
- **Eventos**: condições sobre código/descrição com `=`, `<>`, `>=`, `<=`, `>`, `<`, contém, não contém, contido/não contido em lista e lógica `e/ou`; pesquisa limitada a evento tipo `A`, movimentação `S`, ativo (`fmrelatorioduplicatas.dfm:1509-1611`; `fmrelatorioduplicatas.pas:183-184,509-515`).
- **Documentos**: construtor análogo sobre número ou nome do fornecedor/cliente (`fmrelatorioduplicatas.dfm:1613-1711`).

## Validações

Exige pelo menos um intervalo (principal ou emissão). Se usado, ambos os campos precisam ser datas válidas. Banco, Grupo de Fornecedor e Tipo de Pagamento preenchidos precisam existir; não há validação explícita ali de fornecedor, conta, eventos ou documentos (`fmrelatorioduplicatas.pas:357-374`). Entrar na data final ajusta seu mínimo pela inicial (`fmrelatorioduplicatas.pas:195-200`). Falha mostra “Verifique se os parâmetros atendem ao relatório solicitado.” (`fmrelatorioduplicatas.pas:376-383`).

## Agrupamentos, ordenação e resumo

Agrupamentos independentes: **Grupo de Filiais**, **Filial**, **Fornecedor**, **Data** (marcado por padrão) e **Documento** (`fmrelatorioduplicatas.dfm:26-116`). A base é Data; marcar Fornecedor muda para Nome (`fmrelatorioduplicatas.pas:411-422`). A ordenação antepõe Grupo, Filial e Documento quando marcados, depois vencimento/lançamento/pagamento; agrupar Fornecedor muda a precedência para fornecedor (`dmrelatorioduplicatas.pas:921-1008`).

Resumo: **Com resumo** (padrão), **Sem resumo**, **Só resumo** (`fmrelatorioduplicatas.dfm:736-797`), selecionando detalhe+resumo, só detalhe ou só resumo em cada modalidade (`dmrelatorioduplicatas.pas:549-644`).

## Jornada de preview/impressão

1. Abre com foco no período; datas principais hoje; Contas a pagar; Data agrupada; Sem previsões; Autorizadas=Sim; Sem adiantamentos; DDA=Ambas; Com resumo (`fmrelatorioduplicatas.pas:163-181,455-459` e defaults DFM acima).
2. Lupas consultam banco, fornecedor, grupo e tipo de pagamento (`fmrelatorioduplicatas.pas:216-252,318-341,446-452`).
3. A ação herdada chama `internoimpressao`, valida, transfere parâmetros e ordena (`fmrelatorioduplicatas.pas:376-434`).
4. `GerarRelatorio` consulta; vazio gera aviso e foco inicial; havendo dados, chama `ImprimirRelatorio` (`fmrelatorioduplicatas.pas:436-441`; `dmrelatorioduplicatas.pas:421-425`).
5. O FastReport abre o relatório preparado/preview conforme modalidade e resumo (`dmrelatorioduplicatas.pas:549-644`). O formulário concreto **não declara atalho próprio, botão separado de PDF ou impressão direta**; isso pertence ao formulário/visualizador herdado. Não há evidência nestas units para atribuir teclas específicas.

## Implicações

- Preservar três modalidades numa página e explicitar a dimensão temporal variável.
- Resolver deliberadamente a assimetria de Adiantamentos em Competência.
- Preview, PDF e impressão da mesma fotografia são requisito novo, não garantia do legado.
- Imprimir os filtros aplicados: o legado acumula `ParametroCabecalho` (`fmrelatorioduplicatas.pas:387-406`; períodos em `dmrelatorioduplicatas.pas:691-745`).
