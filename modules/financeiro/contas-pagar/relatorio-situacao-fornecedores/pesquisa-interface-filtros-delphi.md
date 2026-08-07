# Interface e filtros do Relatório de Situação dos Fornecedores no Delphi

## Fontes primárias e escopo

Este inventário usa `C:/projetos.vcl/apps/contaspagar/fmrelatoriosituacaofornecedores.pas`, seu `.dfm` e, somente para esclarecer a semântica diretamente acionada pelo formulário, `dmrelatoriosituacaofornecedores.pas/.dfm`.

## Jornada e valores iniciais

A janela se chama **Relatório de Situação dos Fornecedores** (`fmrelatoriosituacaofornecedores.dfm:1-4`). Ao construir a tela, o sistema toma a data do servidor, define **Situação em** como o último dia do mês anterior e **Pesquisar desde** como 90 dias antes do primeiro dia do mês corrente. Exemplo: em 15/08, Situação em = 31/07 e Pesquisar desde = 03/05, não “hoje menos 90 dias” (`fmrelatoriosituacaofornecedores.pas:91-103`). Também carrega Filiais, Grupos de Filiais e Naturezas e configura a busca para aceitar somente fornecedores (`fmrelatoriosituacaofornecedores.pas:104-111`).

Na impressão, o formulário limpa o cabeçalho, transfere datas e filtros ao data module, define a ordenação, abre as consultas e mostra o preview se houver resultado; conjunto vazio gera aviso de nenhum registro selecionado (`fmrelatoriosituacaofornecedores.pas:122-154`). O preview é modal, inicia em zoom 125% e combina detalhe e/ou resumo conforme a escolha (`dmrelatoriosituacaofornecedores.pas:176-219`).

## Dimensão temporal

- **Pesquisar desde / Data inicial** é o limite inferior da **data de entrada/lançamento do documento**, não vencimento nem pagamento. A consulta de notas usa `np.data between :DataInicial and :DataSituacao`; a união de documentos usa `dp.datalancto between :DataInicial and :DataSituacao` (`dmrelatoriosituacaofornecedores.dfm:1275,1309,1354`).
- **Situação em / Data de situação** é simultaneamente o limite superior de entrada/lançamento e a **data de corte da posição financeira**. Pagamentos posteriores ao corte são tratados como ainda em aberto, pagamentos até o corte compõem o total pago, e atraso é calculado contra o corte ou a data efetiva de pagamento (`dmrelatoriosituacaofornecedores.dfm:211-225,1243,1253-1260,1325,1335-1342`).
- O título confirma a semântica de fotografia: `SITUAÇÃO DOS FORNECEDORES EM dd/mm/aa`; o cabeçalho adicional registra `A partir de: <DataInicial>` (`dmrelatoriosituacaofornecedores.pas:185-190,224-240`).

## Filtros, opções e padrões

| Área | Opções | Padrão / comportamento |
|---|---|---|
| Fornecedor | lookup por código e nome | vazio = todos; quando preenchido deve existir; busca restrita a fornecedor (`fmrelatoriosituacaofornecedores.dfm:940-991`; `.pas:108-111,131`) |
| Filiais / Grupos | listas em abas, marcar/desmarcar | listas carregadas na abertura; marcar todas as Filiais desmarca Grupos e vice-versa (`.dfm:65-80,81-87,141,148,202,215,222,276,283,337`; `.pas:104-106,196-223`) |
| Naturezas de operação | checklist, marcar/desmarcar | carregado na abertura; seleção independente (`.dfm:755-768,769-774,828,830-835,889,891-905`; `.pas:104-106,225-238`) |
| Agrupar por | Grupo Filial; Filial | ambos desmarcados (`.dfm:20-63`) |
| Ordenação | Nº da nota; Data de lançamento | Nº da nota marcado (`.dfm:382-428`) |
| Resumo | Com resumo; Sem resumo; Só resumo | Com resumo marcado (`.dfm:430-491`) |
| Previsão | Com; Sem; Só previsões | Sem previsões marcado (`.dfm:493-554`) |
| Só notas | Com duplicatas; Sem duplicatas; Ambas situações | Com duplicatas marcado (`.dfm:556-617`) |
| Tipo fornecedor | Produto; Transporte; Montagem | checkboxes independentes, todos desmarcados (`.dfm:619-677`) |
| Opções | só duplicatas em aberto; quebrar página por fornecedor; listar notas de clientes; somente documentos com notas | todas desmarcadas; “listar notas de clientes” existe, mas fica invisível (`.dfm:679-753`) |

### Semântica condicional

- **Previsão**: Com remove o filtro; Sem exige `previsao=false`; Só exige `previsao=true` (`dmrelatoriosituacaofornecedores.pas:450-476`).
- **Só notas**: Com duplicatas exige existência de duplicata; Sem duplicatas exige inexistência; Ambas não filtra (`dmrelatoriosituacaofornecedores.pas:496-522`). O título do grupo é pouco claro, mas sua semântica é a relação documento–duplicata.
- **Só duplicatas em aberto** considera aberta na data de corte a duplicata sem pagamento ou paga depois de `DataSituacao`; no agregado, exige saldo devedor positivo (`dmrelatoriosituacaofornecedores.pas:480-493`).
- **Somente documentos com notas** atualmente injeta `and FALSE` nas duas consultas, portanto selecioná-lo zera o resultado. É comportamento aparente de bug/incompletude do legado, não uma regra funcional a reproduzir (`dmrelatoriosituacaofornecedores.pas:714-727`).
- **Tipo fornecedor** monta os tipos Produto, Transporte e Montagem; o cabeçalho só é acrescentado quando algum é selecionado (`dmrelatoriosituacaofornecedores.pas:644-702`).
- **Ordenação** sempre começa por Grupo/Filial quando agrupados e depois fornecedor; Nº da nota usa `numero,data`, enquanto Data de lançamento usa `data,numero` (`dmrelatoriosituacaofornecedores.pas:427-441`).
- **Resumo** escolhe detalhe+resumo, só detalhe ou só resumo (`dmrelatoriosituacaofornecedores.pas:194-213`).

## Validações

As duas datas precisam ser válidas. Se ambas estão preenchidas, a inicial deve ser menor ou igual à situação; pelo menos uma deve estar preenchida. Fornecedor informado precisa existir. Data inválida e período invertido geram mensagens específicas e devolvem foco à Data inicial (`fmrelatoriosituacaofornecedores.pas:159-184`). Há uma particularidade: o código aceita uma data em branco se o componente ainda a considerar válida; ao atribuir `DataSituacao`, o data module substitui corte vazio pela inicial ou inicial vazia pelo corte (`dmrelatoriosituacaofornecedores.pas:224-240`). A especificação deve preferir contrato explícito, sem depender dessa tolerância.

## Títulos e parâmetros impressos

O preview recebe razão social e endereço da Filial-base, o título `SITUAÇÃO DOS FORNECEDORES EM <corte>`, a data de corte, flags de agrupamento e quebra de página, além de `Outras` com a descrição dos filtros (`dmrelatoriosituacaofornecedores.pas:181-190`). Esse cabeçalho começa em `A partir de: <inicial>` e agrega, quando aplicáveis: Fornecedor, Filiais, Grupos de Filiais, Previsão, situação Com/Sem duplicatas, tipos de fornecimento e outros filtros montados pelo data module (`dmrelatoriosituacaofornecedores.pas:239,340-352,363-416,450-520,644-702`).

## Atalhos

Não há propriedade `ShortCut` nem tratamento de teclado na unit concreta. Os ampersands dos captions fornecem aceleradores de acesso do Windows: `N`/`D` na ordenação, `C`/`S`/`A` em Só notas e `L`/`G` nas abas de Filiais/Grupos (`fmrelatoriosituacaofornecedores.dfm:81,215,402,419,576,593,608`). A ação de imprimir/fechar pertence ao formulário-base herdado; não é possível atribuir teclas específicas a partir destas units.

## Decisões que a nova especificação deve explicitar

- Nomear Data inicial como início do período de entrada/lançamento e Data de situação como data de corte.
- Não reproduzir silenciosamente o filtro “Somente documentos com notas” que retorna zero; definir sua intenção antes da implementação.
- Preservar a diferença entre posição histórica no corte e estado atual, sobretudo para pagamentos posteriores.
- Preview, PDF e impressão devem partir da mesma fotografia; o legado apenas prepara e abre um preview modal, sem provar imutabilidade.
