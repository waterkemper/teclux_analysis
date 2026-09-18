# Pesquisa da interface e do fluxo Delphi — Controle de Recebimentos

## Escopo e autoridade da evidência

Este artefato registra somente a investigação do ticket “Inventariar interface e fluxo Delphi do Controle de Recebimentos”. A evidência primária é:

- `C:/projetos.vcl/apps/caixa/fmcontrolerecebimentos.pas` e `.dfm` — formulário, controles e eventos.
- `C:/projetos.vcl/apps/caixa/dmcontrolerecebimentos.pas` e `.dfm` — DataModule, datasets, SQL, filtros e mutações.

Foram consultadas apenas as units ancestrais/referenciadas necessárias para interpretar a interface e o fluxo:

- `C:/projetos.vcl/repositorio/fmajudabt.pas` e `fmnavcontroles.pas` — command bar, F9, Enter e Esc herdados.
- `C:/projetos.vcl/repositorio/frconsultacodigo.pas` — frame/modal de pesquisa de cliente.
- `C:/projetos.vcl/repositorio/frlistafiliais.pas` — seleção de filiais e restrição a filiais autorizadas.
- `C:/projetos.vcl/repositorio/frlistatiposderecebimentos.pas` — seleção de tipos de recebimento.
- `C:/projetos.vcl/repositorio/dmbasico.pas` e `C:/projetos.vcl/biblio/clparametrossistema.pas` — integração bancária e parâmetro do sistema.

Não foi feita implementação, alteração de ticket/mapa ou inspeção de Laravel. As referências estão no formato `arquivo:linha`.

## Classificação usada

- **CONFIRMADO** — declarado ou executado diretamente por uma fonte consultada.
- **INFERIDO** — consequência razoável da ligação entre fontes, mas não uma regra isolada explícita.
- **DÚVIDA** — o código não permite determinar o comportamento com segurança.
- **NÃO LOCALIZADO** — não há ocorrência/configuração nas fontes consultadas.
- **DIVERGENTE** — partes da interface/configuração não coincidem entre si.
- **POSSÍVEL BUG LEGADO** — comportamento suspeito ou frágil observado, sem corrigi-lo nesta pesquisa.

## Identidade e composição da tela

| Elemento | Evidência | Classificação | Comportamento observado |
|---|---|---|---|
| Formulário | `fmcontrolerecebimentos.dfm:1-11` | **CONFIRMADO** | `TfrmControleRecebimentos`, caption “Controle de Recebimentos”, MDI child, 1076×580, visível. O foco inicial do DFM é `fraListaFiliais1.clbFiliais`. |
| Herança | `fmcontrolerecebimentos.pas:14-120` | **CONFIRMADO** | Herda `TfrmAjudaBt`; recebe command bar, navegação e pesquisa herdadas. |
| Command bar | `fmcontrolerecebimentos.dfm:12-178` | **CONFIRMADO** | `sbnProcurar` herdado fica invisível (`:19-20`); a tela adiciona `sbnConfirma`, `sbnGerar` e `sbnConsulaPIX`. |
| Abas | `fmcontrolerecebimentos.dfm:179-195`, `:738-740` | **CONFIRMADO** | `TtecPageControl` com `tstParametros` (“1 - Parâmetros”) e `tstSelecionados` (“2 - Registros Selecionados”). Inicia em `tstParametros`. |
| DataModule | `fmcontrolerecebimentos.pas:158-166` | **CONFIRMADO** | O construtor cria `TdtmControleRecebimentos` e conecta `OnRecebimentosChange` e `OnRecebimentoscodigotiporecebimento`. |
| Relatório | fontes autorizadas | **NÃO LOCALIZADO** | Não há `TfrxReport`, preview, banda, rotina de impressão ou outro componente de relatório no formulário/DataModule. O grid é a saída visível da consulta. |
| Menu/acessos | fontes autorizadas | **NÃO LOCALIZADO** | Não há definição de menu, caminho “Caixa → Controle de Recebimentos”, `acessosmodulos` ou grant nessas units. |
| Chave NF-e | fontes autorizadas | **NÃO LOCALIZADO** | Não há controle/campo/máscara de chave de NF-e nesta tela. |

## Controles e frames da aba Parâmetros

### Filiais

`fraListaFiliais1` é um `TfraListaFiliais` embutido, dentro de `tstParametros`, com lista, botão de marcar e botão de desmarcar (`fmcontrolerecebimentos.dfm:204-236`). A tela altera o caption para “FILIAIS” e aplica fonte em negrito (`fmcontrolerecebimentos.pas:178-180`).

O frame carrega a lista no construtor e, para usuário não administrador, marca a filial base (`frlistafiliais.pas:50-64`). `ListaSelecionada` retorna os códigos marcados como uma lista textual entre aspas; se nenhum estiver marcado e `ParSistema.RelatorioSomenteFiliaisAutorizadas` estiver ativo, retorna a lista de filiais liberadas (`frlistafiliais.pas:101-116`).

- **CONFIRMADO:** o valor entregue à consulta é `fraListaFiliais1.ListaSelecionada` (`fmcontrolerecebimentos.pas:131-142`).
- **INFERIDO:** a filial base tende a ser a seleção inicial para usuário não administrador.
- **DÚVIDA:** a fonte consultada não mostra a população de `ListaFiliais`, nem a lista efetiva de filiais liberadas por usuário.

### Cliente

`gbxClientes` contém o frame `fraConsultaClientes: TfraConsultaCodigo` (`fmcontrolerecebimentos.dfm:238-286`). O campo de código é `TtecDBFindLookup`, `DataField = codigo`, `Operacao = opPESQUISA`, `MaxLength = 8`, sem inclusão (`DenyInsert = True`); a descrição é `dtxDescricao`/campo `nome` (`fmcontrolerecebimentos.dfm:268-285`).

O construtor configura `TipoPesquisa := pesCLIENTES` e, quando o tipo está vazio, define `TipoCliente := 'C'` (`fmcontrolerecebimentos.pas:172-175`). A chamada da consulta envia tipo e código do cliente (`fmcontrolerecebimentos.pas:135-138`).

O frame de código abre a tabela/modal de consulta de acordo com `TipoPesquisa` e delega a janela ao modal padrão (`frconsultacodigo.pas:95-121`, `:866-911`). A seleção de cliente deve ser tratada como pesquisa por código com modal padrão; a tela não implementa um modal próprio.

### Datas

Há três grupos de intervalo, cada um com data inicial, literal “a” e data final:

| Grupo | Controles | Evidência DFM | Default atribuído pelo formulário |
|---|---|---|---|
| Período de emissão | `edtDataInicialEmissao`, `edtDataFinalEmissao` | `fmcontrolerecebimentos.dfm:288-350` | Ambos `DataLocal` no construtor (`fmcontrolerecebimentos.pas:169-170`). |
| Vencimentos | `edtDataInicialVencto`, `edtDataFinalVencto` | `fmcontrolerecebimentos.dfm:468-530` | Normalmente vazio; em confirmar, ambos recebem `DataLocal - 1` se vazios (`fmcontrolerecebimentos.pas:364-370`). |
| Recebimentos | `edtDataInicialRecebimento`, `edtDataFinalRecebimento` | `fmcontrolerecebimentos.dfm:629-691` | Normalmente vazio; em estornar, ambos recebem `DataLocal` se vazios (`fmcontrolerecebimentos.pas:377-387`). |

Os três pares são `TEditData`, `MaxLength = 10`, com `Minimo = 37353` e `Maximo = 37353` no DFM (`fmcontrolerecebimentos.dfm:316-349`, `:496-528`, `:657-689`). O construtor também define `edtDataConfirmacao := DataLocal` (`fmcontrolerecebimentos.pas:189`). O significado atual desses limites numéricos não está documentado no formulário.

- **CONFIRMADO:** o DataModule aceita intervalo aberto em qualquer extremidade: inicial somente gera `>=`, final somente gera `<=`, ambos geram `between`, e ambos vazios removem o predicado (`dmcontrolerecebimentos.pas:250-301`).
- **DÚVIDA:** não há validação local explícita de “inicial menor ou igual à final” antes do `Open`; a validação intrínseca de `TEditData` não foi determinada nas fontes consultadas.
- **POSSÍVEL BUG LEGADO:** `Minimo`/`Maximo` aparecem com valores idênticos e pouco legíveis no DFM, enquanto o código atribui datas atuais dinamicamente.

### Tipos de recebimento

`fraListaTiposdeRecebimentos1` é um `TfraListaTiposdeRecebimentos` embutido (`fmcontrolerecebimentos.dfm:551-613`). Tem `TCheckListBox` e botões para marcar/desmarcar; a tela altera o caption para “TIPOS DE RECEBIMENTOS” (`fmcontrolerecebimentos.pas:182-186`). O frame carrega tipos ativos e ordena por código na consulta configurada no DFM (`fmcontrolerecebimentos.dfm:596-612`); seu `ListaSelecionada` retorna os códigos marcados (`frlistatiposderecebimentos.pas:57-81`, `:94-107`).

- **CONFIRMADO:** o filtro enviado é a lista retornada por `ListaSelecionada` (`fmcontrolerecebimentos.pas:135-136`).
- **NÃO LOCALIZADO:** não há marcação inicial explícita para tipos no construtor da tela ou no trecho do frame consultado; não assumir que todos estejam selecionados.

### Meios de pagamento

`gbxTipoRecebimentos` apresenta seis checkboxes, todos marcados no DFM (`fmcontrolerecebimentos.dfm:351-467`): Dinheiro (`D`), Cheque (`H`), Cartão de débito (`B`), Cartão de crédito (`C`), PIX (`P`) e Crédito de Troca (`T`). O DataModule concatena as letras selecionadas; vazio ou o conjunto completo `DHBCPT` não filtra, enquanto subconjunto gera uma condição por posição no código do tipo (`dmcontrolerecebimentos.pas:337-359`).

`gbxMeiosdePagamento` tem `ckbTEF` e `ckbPOS`, sem `Checked = True` no DFM (`fmcontrolerecebimentos.dfm:692-736`). A lógica efetiva é:

- somente TEF: `r.tef is not null`;
- somente POS: `r.tef is null`;
- ambos ou nenhum: sem filtro (`dmcontrolerecebimentos.pas:322-328`).

**DÚVIDA:** o código usa nulidade de `r.tef` como distinção TEF/POS; não comprova que esse campo seja uma classificação suficiente para todas as transações.

### Operação

`rgbOperacaoes` é um `TRadioGroup` com `ItemIndex = 0` e três opções (`fmcontrolerecebimentos.dfm:531-550`):

1. `Alterar tipos de recebimentos`;
2. `Confirmar recebimentos`;
3. `Estornar recebimentos`.

`rgbOperacaoesClick` sincroniza o índice com `dtmControleRecebimentos.Operacao` (`fmcontrolerecebimentos.pas:334-411`) e também altera defaults, foco, visibilidade e editabilidade:

| Índice | Filtro/estado | Defaults ao clicar | Campos editáveis no grid |
|---:|---|---|---|
| 0 | `not r.confirmado`; mostra indicador de confirmações em outros vencimentos | emissão = hoje se vazia; limpa vencimento e recebimento | `tiporec`; os demais campos de confirmação ficam somente leitura pela regra dinâmica |
| 1 | `not r.confirmado` | limpa emissão; vencimento = ontem se vazio; limpa recebimento | `data_confirmacao`, `valor_confirmacao`, `pdesagio`, `VlrDesagio`; `tiporec` somente leitura |
| 2 | `r.confirmado` | limpa emissão e vencimento; recebimento = hoje se vazio | confirmação/percentual/tipo ficam somente leitura pela regra dinâmica |

As colunas são atualizadas nas linhas `fmcontrolerecebimentos.pas:337-342`; o predicado de operação está em `dmcontrolerecebimentos.pas:331-335`.

## Fluxo temporal da tela

1. **Criação:** cria DataModule, registra callbacks, ativa Parâmetros, define emissão hoje, cliente como pesquisa de clientes/tipo `C` e confirmação hoje (`fmcontrolerecebimentos.pas:158-193`).
2. **Gerar:** `sbnGerarClick` limpa “Confirmar todos”, reaplica a operação, chama `ConsultarRecebimentos` e muda o caption do total marcado conforme a operação (`fmcontrolerecebimentos.pas:195-206`).
3. **Consulta com registros:** passa os oito filtros ao DataModule; se houver resultado, ativa Registros Selecionados, atualiza contadores e foca o grid (`fmcontrolerecebimentos.pas:129-148`).
4. **Consulta vazia:** mostra `MensagemAviso(format(ctNENHUMREGISTROENCONTRADO,['registro']))`, retorna à aba de parâmetros e foca a data inicial de emissão (`fmcontrolerecebimentos.pas:149-155`).
5. **Seleção:** duplo clique, `Ctrl+Space` ou “Confirmar todos” altera a marcação pela rotina comum (`fmcontrolerecebimentos.pas:229-249`, `:322-326`).
6. **Gravação:** F5/botão chama `GravarRecebimentos`; em sucesso, executa nova consulta (`fmcontrolerecebimentos.pas:208-220`).
7. **Retorno:** Esc na aba de resultados retorna aos parâmetros; a troca de aba habilita/desabilita Gerar e Confirma (`fmcontrolerecebimentos.pas:251-267`, `:269-284`).

## Atalhos, Enter, Esc e botões

| Ação | Evidência | Resultado |
|---|---|---|
| F6 | `fmcontrolerecebimentos.pas:269-278`; DFM `:87-150` | Se Gerar estiver habilitado e não houver Ctrl, chama `ConsultarRecebimentos`. O botão é “Gerar F6”. |
| F5 | `fmcontrolerecebimentos.pas:269-276`; DFM `:22-85` | Se Confirma estiver habilitado e não houver Ctrl, chama `GravarRecebimentos`. O botão é “Confirma F5” e inicia desabilitado. |
| Esc | `fmcontrolerecebimentos.pas:278-282` | Na aba de resultados volta para Parâmetros. Fora desse caso, a herança assume o tratamento. |
| Enter | `fmcontrolerecebimentos.pas:269-284`; `fmnavcontroles.pas:165-200` | Não há handler local. A herança navega para o próximo controle; com Ctrl navega para o anterior em grid editável. `PostOnEnter = False` no grid (`fmcontrolerecebimentos.dfm:741-781`). |
| F9 | `fmajudabt.pas:45-69`; `fmnavcontroles.pas:94-160` | É herdado: chama `InternoPesquisar` sem modificador ou com Ctrl, usando `JanelaPesquisa`/`TfrmConsultaBasica`. Este formulário não sobrescreve `JanelaPesquisa`, `TabelaDePesquisa` ou `InternoPesquisar`; a implementação-base de `JanelaPesquisa` retorna `nil` (`fmnavcontroles.pas:143-160`). |
| Pesquisa de cliente | `fmcontrolerecebimentos.pas:172-175`; `frconsultacodigo.pas:95-121`, `:866-911` | O frame do cliente usa `pesCLIENTES` e seu modal padrão de pesquisa; não há modal específico implementado na tela. |
| Consulta PIX | `fmcontrolerecebimentos.dfm:151-160`; `fmcontrolerecebimentos.pas:422-428` | Chama `tefpadrao.ConsultaPIX(valorvencto, tef)` da linha corrente. |

- **CONFIRMADO:** F6 e F5 existem tanto como caption/atalho do botão quanto como tratamento local de teclado.
- **NÃO LOCALIZADO:** botão Cancelar durante o `qryRecebimentos.Open`, sinal de cancelamento de consulta ou chamada para interromper backend/PostgreSQL.
- **POSSÍVEL BUG LEGADO:** “Confirma F5” fica habilitado por `edtTotalMarcadosChange` quando há total marcado ou quando a operação é 1/2 (`fmcontrolerecebimentos.pas:328-332`), mas a rotina de gravação só processa registros confirmados quando `Operacao <> 0` (`dmcontrolerecebimentos.pas:717-723`). A semântica de F5 na operação 0 não é clara.

## Aba Registros Selecionados e grid

### Configuração

`dbgDetalhado` é `TtecDBGrid` ligado a `dtmControleRecebimentos.dsrRecebimentos` (`fmcontrolerecebimentos.dfm:741-765`). Está alinhado ao cliente, tem edição, títulos, indicador, resize, linhas e cancelamento de edição; permite ordenação (`DenySort = False`), não permite exclusão (`CanDelete = False`) e não cria registros pelo grid (`fmcontrolerecebimentos.dfm:766-781`). A cor zebrada configurada é `StrippedColor = 16054260` (`:771`).

### Colunas visíveis

| Ordem | Campo | Título | Estado/configuração |
|---:|---|---|---|
| 1 | `filial` | FILIAL | somente leitura; centralizado |
| 2 | `datalancto` | LANÇTO | somente leitura |
| 3 | `valorlancto` | VALOR | coluna editável no DFM, mas field `ReadOnly = True` no DataModule |
| 4 | `datavencto` | VENCIMENTO | somente leitura |
| 5 | `valorvencto` | VALOR | somente leitura |
| 6 | `data_confirmacao` | RECEBIMENTO | editável apenas na operação 1 |
| 7 | `valor_confirmacao` | VALOR | editável apenas na operação 1 |
| 8 | `tiporec` | TIPO RECEBIMENTO | lookup por `codigotiporecebimento`; editável apenas na operação 0 |
| 9 | `pdesagio` | % DESÁG | editável apenas na operação 1 |
| 10 | `VlrDesagio` | VLR DESÁGIO | calculado; editável visualmente apenas conforme regra dinâmica da operação 1 |
| 11 | `cliente` | CLIENTE | somente leitura na coluna |
| 12 | `nomecliente` | NOME DO CLIENTE | somente leitura |
| 13 | `listacontratos` | CONTRATOS | coluna configurada sem `ReadOnly` explícito |
| 14 | `ListaOrcamentos` | ORÇAMENTOS | coluna configurada sem `ReadOnly` explícito |
| 15 | `confirmado` | OK | coluna configurada sem `ReadOnly` explícito; usada para seleção |

Evidência dos títulos, largura, visibilidade e `ReadOnly`: `fmcontrolerecebimentos.dfm:782-909`. Evidência dos fields, lookups e formatos: `dmcontrolerecebimentos.dfm:221-418`.

Há divergência entre coluna e field em `valorlancto`: a coluna não declara `ReadOnly`, mas o field declara `ReadOnly = True` (`fmcontrolerecebimentos.dfm:801-808`; `dmcontrolerecebimentos.dfm:234-238`).

### Seleção e totalizadores

- Duplo clique na linha chama `MarcarSelecionado` se `confirmado` não estiver somente leitura (`fmcontrolerecebimentos.pas:244-249`).
- `Ctrl+Space` faz a mesma operação (`fmcontrolerecebimentos.pas:229-236`).
- “Confirmar todos” percorre o dataset inteiro e marca/desmarca conforme o booleano (`fmcontrolerecebimentos.pas:322-326`; `dmcontrolerecebimentos.pas:1316-1418`).
- Na operação 0, a seleção visual pode propagar o valor de `confirmado` a outras linhas do mesmo `controlerecebimento` (`dmcontrolerecebimentos.pas:1279-1305`).
- Nas operações 1/2, marcar também preenche/limpa data e valor de confirmação (`dmcontrolerecebimentos.pas:1238-1277`, `:1326-1375`).

Os totalizadores são:

| Indicador | Fonte/cálculo | Evidência |
|---|---|---|
| Qtde selecionados | `qryRecebimentos.RecordCount` | `dmcontrolerecebimentos.pas:1170-1173` |
| Total vencimentos | soma de `valorvencto` | `dmcontrolerecebimentos.pas:1175-1186` |
| Total lançamentos | soma de `valorlancto` | `dmcontrolerecebimentos.pas:1606-1616` |
| Qtde marcados | contador `FQtdeMarcados` | `dmcontrolerecebimentos.pas:1425-1428` |
| Total marcado | `FTotalMarcados`; operação 0 usa `valorvencto`, operações 1/2 usam `valor_confirmacao` | `dmcontrolerecebimentos.pas:1199-1227` |
| Exibição | campos read-only no painel inferior | `fmcontrolerecebimentos.pas:303-315`; `fmcontrolerecebimentos.dfm:954-1172` |

### Edição e validações

1. **Data de confirmação:** deve ser igual ou posterior à data de lançamento e não pode ser posterior a `dataservidor`; em erro, mostra aviso e restaura `OldValue` ou limpa (`dmcontrolerecebimentos.pas:1117-1145`).
2. **Valor de confirmação:** alterar `valor_confirmacao` recalcula `FTotalMarcados` quando o registro está confirmado (`dmcontrolerecebimentos.pas:1033-1049`).
3. **Percentual de deságio:** se confirmado, `valor_confirmacao = valorlancto - valorlancto * pdesagio / 100` (`dmcontrolerecebimentos.pas:1077-1081`).
4. **Tipo de recebimento:** ao alterar o lookup, consulta conta/evento para filial e tipo; com integração bancária ativa e conta/evento ausentes, exibe aviso e restaura o código auxiliar (`dmcontrolerecebimentos.pas:1051-1074`). Caso contrário, chama `RecalcularRecebimentos`.
5. **Alteração de tipo:** pede confirmação “As alterações serão gravados. Confirma a alteração do tipo de recebimento?”, pede autorização e recria/rateia recebimentos conforme `numerorecebimentos` (`dmcontrolerecebimentos.pas:1444-1562`). O rateio arredonda parcelas intermediárias para centavos e atribui o saldo à última (`:1521-1547`).
6. **Confirmação:** mudar `confirmado` atualiza `quantidadeconfirmacoes` por `IncDecCampoTabela`; com integração bancária ativa, conta/evento obrigatórios são verificados (`dmcontrolerecebimentos.pas:1083-1114`).
7. **Inserção/exclusão:** `BeforeInsert` e `BeforeDelete` executam `Abort` (`dmcontrolerecebimentos.pas:1156-1168`). Portanto, este grid é consulta/edição controlada, não cadastro livre.
8. **AfterScroll:** torna `tiporec` somente leitura quando `quantidadeconfirmacoes <> 0` (`dmcontrolerecebimentos.pas:1437-1442`).

### Cores, estados e informações auxiliares

`dbgDetalhadoDrawColumnCell` pinta linhas confirmadas com `clInfoBk` e fonte preta; na operação 0, linhas não confirmadas com confirmações em outros vencimentos recebem fonte vermelha (`fmcontrolerecebimentos.pas:286-301`). O painel de cheques exibe a legenda “Possui confirmações em outros vencimentos” e um `TShape` de cor 22015, ambos visíveis somente na operação 0 (`fmcontrolerecebimentos.pas:346-348`; `fmcontrolerecebimentos.dfm:1325-1347`).

O painel inferior mostra transação, quantidade, total de vencimentos, total de lançamentos, quantidade/valor marcados, rede TEF, data de confirmação e legenda variável (`fmcontrolerecebimentos.dfm:911-1300`). Quando a linha corrente contém cheque, exibe cliente/código, titular, vencimento, número, conta, agência e banco, todos como `TtecDBText` somente leitura (`fmcontrolerecebimentos.dfm:1302-1610`).

## Dataset principal e projeção

`qryRecebimentos` é `TtecQuery`, `CachedUpdates = True`, `RequestLive = True`, ligado a `dsrRecebimentos`; possui BeforeInsert, BeforeDelete, AfterScroll e OnCalcFields (`dmcontrolerecebimentos.dfm:7-20`, `:420-424`). O SQL projeta, entre outros:

- `recebimentos r` e seus códigos/valores/datas/situação;
- tipo de recebimento (`tr`), filial (`f`), cheque (`ch`), conta/evento por tipo (`ctr`);
- cliente/nome por contrato ou autenticação;
- decomposição textual de cheque (`cheque_banco`, `cheque_agencia`, `cheque_cheque`, `cheque_conta`);
- rede TEF;
- quantidade de confirmações do mesmo `controlerecebimento`;
- fornecedor/evento de documento a pagar;
- listas de contratos e orçamentos.

Evidência da projeção e relações: `dmcontrolerecebimentos.dfm:67-205`. A ordenação fixa é filial, data de lançamento, transação, valor de vencimento, código, tipo de recebimento e data de vencimento (`dmcontrolerecebimentos.dfm:208-209`).

As relações escritas são:

- `JOIN tiposrecebimentos tr` por tipo;
- `JOIN filiais f` por filial;
- `LEFT JOIN cheques ch` por número;
- `LEFT JOIN contastiposrecebimentos ctr` por filial/tipo;
- `LEFT JOIN (contratos ct JOIN vfornecedores vf ...)` por contrato.

**DÚVIDA:** o Delphi não contém nulabilidade/cardinalidade do banco. No destino, uma relação comprovadamente obrigatória com chaves `NOT NULL` deve ser modelada como `INNER JOIN`; `LEFT JOIN` deve permanecer somente quando a ausência for funcionalmente válida. Não é possível resolver essa classificação apenas com o DFM.

**POSSÍVEL BUG LEGADO:** o SQL contém tanto a relação explícita `JOIN` quanto predicados redundantes `where r.tiporecebimento = tr.codigo` e `r.filial = f.codigo` (`dmcontrolerecebimentos.dfm:166-182`). O código também mantém uma subconsulta comentada com `datalacnto` grafado diferente (`:252-254`); não há evidência de execução dessa variante.

## Filtros e SQL gerado

### Filtros da consulta

`ConsultarRecebimentos` recebe seis datas/textos, filial, tipo, tipo de cliente, cliente e oito booleanos (`dmcontrolerecebimentos.pas:234-240`; chamada em `fmcontrolerecebimentos.pas:129-142`). As macros do SQL principal são declaradas em `dmcontrolerecebimentos.dfm:21-66`.

| Filtro | Condição gerada | Evidência |
|---|---|---|
| Emissão | `cast(r.datalancto as date) >=`, `<=`, `between` ou vazio | `dmcontrolerecebimentos.pas:250-266` |
| Vencimento | `r.datavencto >=`, `<=`, `between` ou vazio | `dmcontrolerecebimentos.pas:268-284` |
| Recebimento | `r.data_confirmacao >=`, `<=`, `between` ou vazio | `dmcontrolerecebimentos.pas:286-302` |
| Filial | `and r.filial in (<lista>)` | `dmcontrolerecebimentos.pas:305-308` |
| Tipo | `and r.tiporecebimento in (<lista>)` | `dmcontrolerecebimentos.pas:310-313` |
| Cliente | `ct.cliente = <cliente>` e `ct.tipocliente = <tipo>` | `dmcontrolerecebimentos.pas:315-319` |
| Situação/operacão | índice 0/1: `not r.confirmado`; índice 2: `r.confirmado` | `dmcontrolerecebimentos.pas:331-335` |
| Forma de recebimento | posição em `DHBCPT`, omitida para nenhum/todos | `dmcontrolerecebimentos.pas:337-359` |
| TEF/POS | nulidade de `r.tef`, ou nenhum predicado | `dmcontrolerecebimentos.pas:322-328` |
| Situação fixa | `r.situacao = 'N'` | `dmcontrolerecebimentos.dfm:185-195` |

As datas são convertidas por `StrToDateTime` e interpoladas em macros SQL (`dmcontrolerecebimentos.pas:253-299`). Isso é comportamento legado observado; uma especificação Laravel deve usar bindings e listas tipadas, não concatenar valores de usuário. Quando filtros forem listas de ids, a implementação futura deve usar uma única consulta set-based com `IN`, `= ANY(array)` ou equivalente, evitando N+1.

### Datasets auxiliares

| Dataset | SQL/finalidade | Evidência |
|---|---|---|
| `qryTiposRecebimentos` | tipos ativos, mais linha vazia, ordenados por descrição | `dmcontrolerecebimentos.dfm:426-469` |
| `qrySituacaoRecebimentos` | lookup `N - NORMAL` e `C - CANCELADO` | `dmcontrolerecebimentos.dfm:470-499` |
| `qryTipoRecebimento` | número de recebimentos e conta/evento da filial para um tipo | `dmcontrolerecebimentos.dfm:500-543` |
| `qryAtualizarRecebimentos` | `recebimentos` pelos códigos selecionados | `dmcontrolerecebimentos.dfm:544-569` |
| `qryAtualizarRecebimentos_Aux` | linhas-base para rateio por `codigo` | `dmcontrolerecebimentos.dfm:1164-1189` |
| `qryMovtosBancos` | movimentos bancários de origem `X` para pares conta/data | `dmcontrolerecebimentos.dfm:570-592` |
| `qryMovtosBancosEventos` | eventos bancários dos movimentos encontrados | `dmcontrolerecebimentos.dfm:653-661` |
| `qryAutenticacoes` | contratos/cupons da transação para observação bancária | `dmcontrolerecebimentos.dfm:798-846`; uso em `dmcontrolerecebimentos.pas:520-555` |
| `qryDocumentosPag` | documentos a pagar por lista de números | `dmcontrolerecebimentos.dfm:867-889` |
| `qryDuplicatas` | duplicatas por tupla documento/data/número | `dmcontrolerecebimentos.dfm:1047-1070` |
| `qryMovtosBancosProximaSequencia` | `MAX(sequencia)` por conta/data | `dmcontrolerecebimentos.dfm:707-723` |
| `qryMovtosBancosProximaSequenciaEvento` | `MAX(sequenciaevento)` por movimento/evento | `dmcontrolerecebimentos.dfm:741-760` |
| `spcRecebimentosProximo` | função `recebimentos_proximocodigo()` | `dmcontrolerecebimentos.dfm:847-860` |
| `spcDocumentosPagProximo` | função `documentospag_proximonumero()` | `dmcontrolerecebimentos.dfm:1190-1203` |

## Gravação, confirmação, estorno e autorização

### Autorização

`ObterAutorizacaoPagamento` cria/obtém um usuário autorizado. Se o usuário atual for analista de crédito, solicita senha; caso contrário, solicita login com os tipos `ctANALISTACREDITO` e `ctAUTORIZADO`. Só retorna sucesso quando o usuário obtido tem `analistacredito`; caso contrário mostra `ctUSUARIONAOAUTORIZADO` (`dmcontrolerecebimentos.pas:1567-1587`).

### F5/GravarRecebimentos

`GravarRecebimentos` exige autorização antes de processar (`dmcontrolerecebimentos.pas:699-706`). Percorre as linhas e agrega listas de recebimentos, documentos, duplicatas e movimentos bancários (`:707-824`). Para operação diferente de 0, somente linhas com `confirmado = True` entram na lista (`:714-723`).

- **Confirmar (operação 1):** grava data/valor de confirmação e `confirmado = true`; atualiza/cria documento a pagar e duplicata quando há fornecedor, evento, deságio, data e demais dados necessários (`dmcontrolerecebimentos.pas:838-854`, `:648-696`). Se a integração bancária estiver ativa, cria ou atualiza movimento/evento bancário e registra observação de contratos/cupons (`:856-983`).
- **Estornar (operação 2):** remove confirmação/data, desfaz documento/duplicata e, quando aplicável, movimento/evento bancário (`dmcontrolerecebimentos.pas:985-1000`).
- **Persistência:** só ao final executa `Perpetrar` sobre documentos, duplicatas, movimentos e recebimentos; em exceção retorna `False` (`dmcontrolerecebimentos.pas:1003-1021`).

Alterar tipo (operação 0) segue principalmente `RecalcularRecebimentos`: pede confirmação, autorização, consulta linhas relacionadas por `controlerecebimento`, cria N linhas conforme `numerorecebimentos`, define conta/evento, rateia valor e persiste (`dmcontrolerecebimentos.pas:1470-1561`).

### Parâmetro de integração bancária

`IntegracaocomBancos` só é verdadeiro quando `DataServidor >= ParSistema.InicioIntegracaoBancos` e a data configurada é posterior a 01/01/1980 (`dmbasico.pas:17225-17230`). A propriedade específica `ParSistema.RecebimentosIntegradoComBancos` é definida por `ctRecebimentosIntegradoComBancos` (`clparametrossistema.pas:5792-5800`, `:1650`, `:2270`). O carregamento geral usa `ParametrosSistemasSQL`, derivado de `parametrosfiliais` e `parametros` (`clparametrossistema.pas:1889-1909`).

- **CONFIRMADO:** a tela/DataModule não chama `parametros_valor('', '')`; lê `parsistema.RecebimentosIntegradoComBancos` e o gate de data herdado.
- **NÃO LOCALIZADO:** chave/valor exato de uma API Laravel equivalente ou outros parâmetros específicos da tela.

## Mensagens observadas

| Mensagem/condição | Classificação | Evidência |
|---|---|---|
| Nenhum registro encontrado | **CONFIRMADO** | `fmcontrolerecebimentos.pas:149-155` |
| Tipo sem conta/evento da filial | **CONFIRMADO** | `dmcontrolerecebimentos.pas:1056-1063`, `:1089-1095` |
| Data de confirmação anterior ao lançamento | **CONFIRMADO** | `dmcontrolerecebimentos.pas:1121-1125` |
| Data de confirmação posterior à data atual | **CONFIRMADO** | `dmcontrolerecebimentos.pas:1127-1131` |
| Duplicata/documento a pagar não encontrado | **CONFIRMADO** | `dmcontrolerecebimentos.pas:382-403` |
| Movimento bancário/evento não encontrado | **CONFIRMADO** | `dmcontrolerecebimentos.pas:405-438` |
| Alteração de tipo será gravada / confirmação | **CONFIRMADO** | `dmcontrolerecebimentos.pas:1473-1485` |
| Usuário não autorizado a autorizar recebimento | **CONFIRMADO** | `dmcontrolerecebimentos.pas:1579-1586` |
| Falha genérica de gravação | **DÚVIDA** | `GravarRecebimentos` captura exceção e apenas retorna `False` (`dmcontrolerecebimentos.pas:1018-1020`); não há mensagem local para esse caminho. |

## Lacunas e divergências que o próximo prompt deve preservar

1. **NÃO LOCALIZADO — relatório:** não há relatório Delphi associado; a saída observável é o grid. Qualquer relatório Laravel com F6 e leiaute equivalente é requisito novo.
2. **NÃO LOCALIZADO — Cancelar:** F6 não desabilita o botão, não exibe Cancelar e não mata `Open` no banco. O requisito de cancelamento real do PostgreSQL não pode ser atribuído ao legado.
3. **DÚVIDA — F9:** F9 é herdado, mas a base deste formulário não fornece janela de pesquisa própria; somente o frame de cliente tem configuração de `pesCLIENTES`. O destino deve usar explicitamente o modal padrão de pesquisa do Laravel.
4. **DIVERGENTE — editabilidade:** `dbgDetalhado` aceita edição, algumas colunas não têm `ReadOnly` no DFM, mas fields e eventos restringem a edição por operação e estado. O contrato Laravel deve declarar editabilidade por campo, não apenas por grid.
5. **POSSÍVEL BUG LEGADO — `valorlancto`:** coluna aparentemente editável versus field somente leitura (`fmcontrolerecebimentos.dfm:801-808`; `dmcontrolerecebimentos.dfm:234-238`).
6. **POSSÍVEL BUG LEGADO — operação 0/F5:** F5 pode ser habilitado por total marcado, enquanto `GravarRecebimentos` filtra confirmação com `operacao <> 0`; alteração de tipo salva por outra rotina.
7. **DÚVIDA — tipos inicialmente marcados:** o DFM do frame possui a lista, mas não há marcação inicial confirmada nas fontes consultadas.
8. **DÚVIDA — TEF/POS:** o comportamento depende de `r.tef IS NULL`, sem prova de que nulidade seja a semântica completa de POS.
9. **NÃO LOCALIZADO — schema:** os DFM declaram tabelas/campos, mas não snapshot de tipos, chaves, nulabilidade, índices ou cardinalidade. O destino deve versionar um schema autoritativo; não fazer introspecção condicional em runtime, não testar driver e não usar `hasTable`/`Schema::has*`.
10. **NÃO LOCALIZADO — menu/autorizações de acesso:** a autorização de negócio de analista de crédito foi encontrada, mas não o acesso ao módulo/menu ou registros `acessosmodulos`.
11. **NÃO LOCALIZADO — máscara NF-e:** nenhuma chave NF-e ocorre no fluxo; a máscara deve ser definida como componente compartilhado do restante do sistema, não inventada nesta pesquisa.
12. **INFERIDO — N+1:** o SQL principal contém subconsultas correlacionadas e a gravação faz `Locate`/consultas auxiliares por linha. A especificação Laravel deve manter consultas set-based, pré-agregação quando possível e `IN`/`= ANY(array)`/`unnest` quando a semântica for de lista, sem N+1.

## Handoff para prompts SpecKit

Os prompts futuros podem citar este artefato, sem pedir a reabertura dos fontes Delphi. Devem inspecionar somente o checkout Laravel atual para:

- adaptar F6, F5, Esc e o modal padrão de pesquisa/F9;
- modelar consulta e gravação com bindings, schema versionado e uma única consulta set-based quando aplicável;
- aplicar `INNER JOIN` quando relações/colunas obrigatórias forem confirmadas `NOT NULL`, reservando `LEFT JOIN` para relações opcionais;
- declarar catálogo de colunas, ordenação, personalização, exportação, edição, seleção, cores/estados e totalizadores;
- entregar Cancelar imediatamente ao iniciar F6 e efetivamente cancelar a consulta PostgreSQL;
- usar o mesmo dataset/contrato para grid e eventual relatório;
- reproduzir autorização de analista de crédito/senha em policy/fluxo Laravel e decidir separadamente acesso de menu e `acessosmodulos`;
- reutilizar o componente compartilhado de máscara de chave NF-e, se aplicável;
- incluir breadcrumb padrão e radio buttons onde o padrão do sistema os exigir.

Esses itens são instruções de handoff e não decisões sobre o contrato Laravel.
