# Pesquisa da interface Delphi — Transferência de Requisição para Exposição

## Escopo e fontes

Investigação somente de fontes Delphi e dependências imediatas necessárias para interpretar a interface:

- `C:\projetos.vcl\apps\interlojas\fmtransferenciarequisicaoexposicao.pas` — regras da tela e eventos.
- `C:\projetos.vcl\apps\interlojas\fmtransferenciarequisicaoexposicao.dfm` — controles, captions, colunas e ligações de eventos.
- `C:\projetos.vcl\apps\interlojas\dmtransferenciarequisicaoexposicao.pas` — propriedades e operações usadas diretamente pela tela.
- `C:\projetos.vcl\biblio\componentes\cpdbradiogroup.pas` e `cpdbgrid.pas` — semântica necessária de `ItemIndex` e `ColumnByName`.
- `C:\projetos.vcl\repositorio\fmcadastropadrao.dfm` — botões herdados da barra padrão.

Não foram alterados fontes Delphi, Laravel ou arquivos de issue.

## Confirmado

### Filtros e parâmetros

- A tela é intitulada “Transferência de Requisição para Exposição” e inicia com a grade de produtos/filiais como controle ativo. O botão padrão de procurar é ocultado, e o botão de incluir também é ocultado (`fmtransferenciarequisicaoexposicao.dfm:L1-L24`, `L290-L296`).
- A filial requisitada é apenas informativa: código e descrição são preenchidos a partir de `FilialBase`/`NomeFilialBase` no construtor e os edits são somente leitura (`fmtransferenciarequisicaoexposicao.pas:L219-L239`; `fmtransferenciarequisicaoexposicao.dfm:L467-L514`).
- O filtro **REQUISITANTE** aceita código de até três caracteres, não permite zero/nulo nem inclusão, possui botão de pesquisa e exibe a descrição encontrada (`fmtransferenciarequisicaoexposicao.dfm:L330-L465`). O botão abre consulta interativa de filiais; se não encontrar, o código é limpo (`fmtransferenciarequisicaoexposicao.pas:L387-L398`, `L576-L587`; `L460-L465`).
- Alterar o requisitante fecha a consulta atual (`fmtransferenciarequisicaoexposicao.pas:L603-L607`). Ao gerar, o valor só é aplicado ao macro de requisitante quando preenchido; vazio significa ausência desse filtro (`dmtransferenciarequisicaoexposicao.pas:L2629-L2634`).
- **SITUAÇÃO** oferece Aberta, Fechada, Confirmada e Cancelada; Aberta é o padrão (`fmtransferenciarequisicaoexposicao.dfm:L516-L592`). O componente calcula `ItemIndex` pelo `TabOrder`, não pela ordem textual dos objetos (`cpdbradiogroup.pas:L314-L326`); assim, o mapeamento efetivo é 0=A, 1=F, 2=D e 3=C (`dmtransferenciarequisicaoexposicao.pas:L2636-L2644`).
- **CURVA ABC** oferece A, B, C e Não Definido, todos marcados inicialmente (`fmtransferenciarequisicaoexposicao.dfm:L594-L675`). A tela copia os quatro estados para o data module antes de gerar, e a consulta monta a condição OR correspondente (`fmtransferenciarequisicaoexposicao.pas:L547-L570`; `dmtransferenciarequisicaoexposicao.pas:L1195-L1226`).
- **PERÍODO** contém data inicial, data final e “Nº DIAS” (`fmtransferenciarequisicaoexposicao.dfm:L677-L769`). O construtor usa, por padrão, 180 dias até a data do servidor; se o campo de dias tiver valor salvo, usa esse valor (`fmtransferenciarequisicaoexposicao.pas:L229-L250`).
- Ao sair da data inicial, o limite mínimo da data final é recalculado; ao sair de qualquer data, o número de dias é recalculado (`fmtransferenciarequisicaoexposicao.pas:L648-L709`). As mensagens validam data contábil e limite retroativo (`fmtransferenciarequisicaoexposicao.pas:L625-L646`). O data module transforma uma ou duas datas em filtro de igualdade ou intervalo sobre `pf.data` (`dmtransferenciarequisicaoexposicao.pas:L2427-L2442`).
- O campo de código de barras só fica visível quando `ParSistema.ExibirLocalizaporCodigoBarrasnasTransferencias` está ativo (`fmtransferenciarequisicaoexposicao.pas:L283-L286`). Enter localiza o produto por código de barras ou por produto, conforme o modo atual (`fmtransferenciarequisicaoexposicao.pas:L660-L674`; `dmtransferenciarequisicaoexposicao.pas:L2780-L2878`).
- **FILTRAR LOTE** é uma grade pequena com as colunas Lote e Selecionar; a coluna Selecionar é checkbox (`fmtransferenciarequisicaoexposicao.dfm:L807-L1012`). Ao marcar/desmarcar, a grade principal é re-filtrada (`fmtransferenciarequisicaoexposicao.pas:L745-L758`). Quando há lotes selecionados, o `FilterRecord` aceita somente linhas cujo lote esteja na lista selecionada; sem seleção, o trecho de lote não restringe as linhas (`dmtransferenciarequisicaoexposicao.pas:L2729-L2767`).
- O botão **Marcar/Desmarcar Lotes** aplica o valor do checkbox à lista de lotes selecionável (`fmtransferenciarequisicaoexposicao.pas:L847-L853`; `dmtransferenciarequisicaoexposicao.pas:L3784-L3792`).
- O painel de detalhes contém “Número dias de vendas”, “Estoque para dias” e “Proporcional para dias”, além de três opções: “Usar Tabela Redutora”, “Não Considerar Pedidos de Compra” e “Incluir Pedidos entre filiais” (`fmtransferenciarequisicaoexposicao.dfm:L1048-L1197`). Esses valores são lidos pelo data module ao abrir/atualizar os dados de compras (`dmtransferenciarequisicaoexposicao.pas:L3495-L3553`).

### Jornada e ações

1. A tela inicia com a filial requisitada preenchida, período padrão e situação Aberta (`fmtransferenciarequisicaoexposicao.pas:L219-L250`; `fmtransferenciarequisicaoexposicao.dfm:L531-L562`).
2. O usuário pode informar a filial requisitante, selecionar situação/curva/período e pressionar **Gerar F7**. A tela valida período e filial, copia os parâmetros para o data module, abre a consulta e foca a grade principal (`fmtransferenciarequisicaoexposicao.pas:L547-L574`, `L589-L593`).
3. Se a consulta não retornar registros, é exibido aviso e o foco volta para a data inicial (`fmtransferenciarequisicaoexposicao.pas:L564-L570`).
4. Na grade principal, o usuário pode editar quantidades/observação e marcar produtos para lote; a conferência e a geração de lote atuam sobre os itens marcados. **Conferir** chama a conferência de produtos para o lote corrente; **Gerar lote** chama `GerarLoteTransferencia` (`fmtransferenciarequisicaoexposicao.pas:L711-L765`).
5. **Confirmar F8** tenta atualizar as quantidades e confirmar; se encontrar diferenças, abre uma grade modal de diferenças e reprocessa a consulta (`fmtransferenciarequisicaoexposicao.pas:L535-L545`, `L767-L777`).
6. **Visualizar Detalhes** alterna o painel inferior, altera o caption para “Ocultar Detalhes”/“Visualizar Detalhes”, mostra o botão de atualização e abre os dados de compras (`fmtransferenciarequisicaoexposicao.pas:L785-L805`).
7. **Atualizar Registro** preserva a posição das três grades, reconsulta o produto corrente e restaura as posições (`fmtransferenciarequisicaoexposicao.pas:L814-L836`).
8. **Imprimir F12** atualiza quantidades e chama a impressão das requisições (`fmtransferenciarequisicaoexposicao.pas:L596-L601`). **Visualizar foto** abre a imagem do produto corrente (`fmtransferenciarequisicaoexposicao.pas:L807-L812`).

### Botões e habilitação

- Botões visíveis no topo: **Gerar F7**, **Confirmar F8**, **Imprimir F12** e **Visualizar foto** (`fmtransferenciarequisicaoexposicao.dfm:L25-L32`, `L72-L80`, `L127-L135`, `L174-L180`).
- O botão herdado de exclusão é renomeado para **Cancelar F6**; quando o registro corrente está cancelado, passa a **Re-abrir F6** (`fmtransferenciarequisicaoexposicao.dfm:L290-L296`; `fmtransferenciarequisicaoexposicao.pas:L205-L216`).
- Na barra padrão, o botão herdado de gravação é **Gravar F5** e inicia desabilitado; incluir é **Incluir F3**, mas está oculto nesta tela (`fmcadastropadrao.dfm:L34-L44`, `L109-L120`; `fmtransferenciarequisicaoexposicao.dfm:L290-L293`).
- A ação da tela habilita Cancelar somente quando há dados e a requisição não está fechada; Gerar quando não está salvando; Confirmar somente em situação aberta, com dados e quantidade confirmada marcada diferente de zero; Imprimir quando há dados (`fmtransferenciarequisicaoexposicao.pas:L173-L187`).
- **Conferir** e **Gerar lote** dependem de o registro corrente estar marcado e de haver requisitante informado (`fmtransferenciarequisicaoexposicao.pas:L192-L193`). Os botões ficam na faixa lateral da grade principal, com hints “Conferir as quantidades dos produtos” e “Gerar lote para pedidos marcados” (`fmtransferenciarequisicaoexposicao.dfm:L2564-L2684`).

### Grids e apresentação

- A grade principal (`dbgTransferenciaRequisicao`) usa `dsrPedidosFiliais`, permite ordenação por título e desenho customizado de células; não permite inserir/excluir pela grade (`fmtransferenciarequisicaoexposicao.dfm:L2075-L2113`).
- Colunas principais confirmadas: produto, descrição, referência, CST/CSOSN/PIS/COFINS, localização, ABC, data, filial, estoques, reserva prévia, mínimo/máximo, pedida, confirmada, lote, marcar, observação, promoção e descrição da promoção (`fmtransferenciarequisicaoexposicao.dfm:L2114-L2562`). Linha e coluna de grade (`valorgrade1`/`valorgrade2`) existem, mas começam invisíveis e só aparecem se `ParSistema.UsarGradesProdutos` estiver ativo (`fmtransferenciarequisicaoexposicao.dfm:L2252-L2289`; `fmtransferenciarequisicaoexposicao.pas:L252-L255`). O estoque do requisitante também pode ser ocultado por parâmetro (`fmtransferenciarequisicaoexposicao.pas:L255-L266`).
- A grade principal colore linhas sem foco conforme estado: parcialmente recebida, cancelada, fechada ou confirmada; pedidos com `codigoorigem` ficam com fonte laranja e negrito (`fmtransferenciarequisicaoexposicao.pas:L293-L329`). Há legenda inferior para “Parcialmente atendidos” (`fmtransferenciarequisicaoexposicao.dfm:L2750-L2772`).
- `dbgProdutosGrupos` exibe dados agregados de produtos dos grupos das filiais, incluindo estoque, trânsito, reservas, pedidos, vendas, dias de estoque, sugestões, mínimos/máximos, últimas datas e percentual de estoque (`fmtransferenciarequisicaoexposicao.dfm:L1228-L1255`, `L1256-L1655`). É somente leitura (`fmtransferenciarequisicaoexposicao.dfm:L1263-L1288`).
- `dbgProdutosFiliais` exibe os mesmos indicadores por filial, acrescidos de preço de venda, previsão, quantidade de pedido de compra e emissão (`fmtransferenciarequisicaoexposicao.dfm:L1681-L2053`). Também é somente leitura (`fmtransferenciarequisicaoexposicao.dfm:L1688-L1713`).
- O painel inferior inicia oculto no construtor, embora contenha as grades de detalhes, observação e totais (`fmtransferenciarequisicaoexposicao.pas:L277-L282`; `fmtransferenciarequisicaoexposicao.dfm:L1220-L1234`, `L2694-L2865`).
- A grade de lotes aplica `N`/`Y` como valores de checkbox e possui coluna de lote somente leitura e coluna Selecionar editável por checkbox (`fmtransferenciarequisicaoexposicao.dfm:L920-L1012`).

### Atalhos e navegação

- F3/F5 vêm da barra herdada; F6 cancela/reabre; F7 gera; F8 confirma; F12 imprime (`fmcadastropadrao.dfm:L34-L44`, `L109-L120`, `L185-L196`; `fmtransferenciarequisicaoexposicao.pas:L467-L503`).
- Esc, quando não está salvando e a situação é Fechada (`ItemIndex = 1`), fecha a tabela e devolve o foco ao requisitante (`fmtransferenciarequisicaoexposicao.pas:L476-L479`).
- Enter na data final valida a data, gera a consulta e foca a grade quando há registro; com data inválida mantém o foco na data final (`fmtransferenciarequisicaoexposicao.pas:L481-L491`).
- F11 alterna o caption do grupo entre “CÓDIGO DE BARRAS” e “PRODUTO”; o Enter do campo usa esse caption para escolher o tipo de busca (`fmtransferenciarequisicaoexposicao.pas:L492-L497`, `L660-L674`). Delete é consumido (`Key := 0`) e não executa exclusão direta (`fmtransferenciarequisicaoexposicao.pas:L480-L480`).
- Alt + clique no título da grade alterna o modo de título entre data e nota/série (`fmtransferenciarequisicaoexposicao.pas:L354-L377`).

## Inferido

- A jornada operacional provável é: selecionar parâmetros → gerar requisições abertas → marcar linhas/quantidades → gerar e conferir lote → confirmar → imprimir. Isso decorre da sequência de habilitação e dos handlers, mas não há uma especificação de usuário no escopo pesquisado (`fmtransferenciarequisicaoexposicao.pas:L173-L196`, `L535-L601`, `L711-L765`).
- A filtragem de lote parece ser um filtro de visualização local sobre a consulta já aberta, porque o handler alterna `Filtered` da `qryPedidosFiliais` e o `FilterRecord` compara o lote selecionado (`fmtransferenciarequisicaoexposicao.pas:L745-L758`; `dmtransferenciarequisicaoexposicao.pas:L2729-L2767`).
- Os parâmetros do painel inferior parecem afetar apenas as grades de compras/detalhes, não a consulta principal de requisições: são passados a `qryComprasGruposFiliais`/`qryComprasFiliaisGrupo` em `AbrirDadosComprasFiliais` (`dmtransferenciarequisicaoexposicao.pas:L3506-L3553`).
- A ação de gerar lote percorre o conjunto de linhas marcadas, não apenas a linha corrente (`dmtransferenciarequisicaoexposicao.pas:L3298-L3323`); a exigência da linha corrente marcada para habilitar o botão pode ser uma convenção de uso ou uma restrição acidental.

## Dúvidas / pontos a validar no produto

- Não foi possível confirmar, somente pelos fontes, se o usuário espera que a seleção vazia em **FILTRAR LOTE** signifique “todos os lotes” ou “nenhum lote”; o código atual deixa todas as linhas aceitas quando não há lote selecionado (`dmtransferenciarequisicaoexposicao.pas:L2744-L2767`).
- O DFM declara `ActiveControl = dbgProdutosFiliais`, mas o construtor oculta o painel inferior que contém essa grade. A VCL pode resolver o foco automaticamente, mas o comportamento inicial efetivo precisa ser validado em execução (`fmtransferenciarequisicaoexposicao.dfm:L1-L5`; `fmtransferenciarequisicaoexposicao.pas:L279-L282`).
- O comportamento visual exato das colunas booleanas na `TtecDBGrid` depende do componente customizado; o DFM confirma o campo `marcarlotetransferencia`, mas não declara um editor explícito nessa coluna (`fmtransferenciarequisicaoexposicao.dfm:L2492-L2503`).
- Não há evidência nesta investigação sobre permissões, mensagens de confirmação e efeitos transacionais internos do data module além dos handlers chamados pela tela.

## Bugs / riscos evidenciados

### 1. Checkboxes de parâmetros de detalhes usam o handler de marcar lotes

`ckbUsarTabelaRedutora`, `ckbNaoConsiderarPedidosCompra` e `ckbPedidosEntreFiliais` estão todos ligados a `AdvOfficeCheckBoxMarcarDesmarcarLotesClick` (`fmtransferenciarequisicaoexposicao.dfm:L1134-L1197`). Esse handler ignora o remetente e chama `MarcarDesmarcarListadeLotes(Sender.Checked)` (`fmtransferenciarequisicaoexposicao.pas:L847-L853`), que altera a seleção de lotes (`dmtransferenciarequisicaoexposicao.pas:L3784-L3792`).

Isso é um bug confirmado de ligação de evento: alternar qualquer parâmetro de compras também marca/desmarca a lista de lotes, além de não chamar diretamente `AbrirDadosComprasFiliais`. O impacto funcional é inferido a partir dos métodos chamados; a correção não faz parte desta pesquisa.

### 2. Campo “Número dias de vendas” usa evento que altera o período principal

O DFM liga `edtNumero_dias_de_Vendas.OnExit` ao handler `edtNumerodediasExit` (`fmtransferenciarequisicaoexposicao.dfm:L1085-L1094`). Esse handler, porém, lê e altera `edtNumerodedias`, `edtDataInicial` e `edtDataFinal`, que pertencem ao filtro principal (`fmtransferenciarequisicaoexposicao.pas:L686-L701`).

É um bug confirmado de wiring/nome: sair do campo de dias de vendas do painel de detalhes executa a rotina do “Nº DIAS” do período principal. O efeito esperado provavelmente seria recalcular somente os parâmetros de detalhes, mas isso precisa ser validado com o comportamento desejado.

### 3. Alt + clique pode tentar acessar coluna `nota_serie` ausente da grade

O handler de título chama `ColumnByName('nota_serie')` no segundo modo (`fmtransferenciarequisicaoexposicao.pas:L354-L375`). A lista de colunas declarada para `dbgTransferenciaRequisicao` contém `data`, mas não contém `nota_serie` (`fmtransferenciarequisicaoexposicao.dfm:L2306-L2325`, e a lista completa termina em `L2562`). O data module possui o campo `qryPedidosFiliaisnota_serie` (`dmtransferenciarequisicaoexposicao.pas:L57-L59`).

`TtecDBGrid.ColumnByName` procura a coluna entre as colunas configuradas e aborta quando não a encontra (`cpdbgrid.pas:L2149-L2224`). Portanto, o segundo uso do modo Alt é um bug confirmado/provável em execução, condicionado a `AltOn`: a tela pode abortar em vez de alternar para nota/série, salvo se algum mecanismo externo adicionar a coluna em runtime — mecanismo que não foi evidenciado nos fontes consultados.

### 4. Habilitação de lote depende somente da linha corrente

`sbnConferir` e `sbnGerarLotes` são habilitados somente quando `qryPedidosFiliaismarcarlotetransferencia` da linha corrente é verdadeiro (`fmtransferenciarequisicaoexposicao.pas:L192-L193`). Já `GerarLoteTransferencia` percorre todas as linhas e processa as que estão marcadas (`dmtransferenciarequisicaoexposicao.pas:L3298-L3323`).

Classificação: risco/bug de UX a validar. Se houver linhas marcadas fora da linha corrente, o usuário pode ter itens elegíveis, mas não conseguir acionar a ação até navegar para uma linha marcada.

## Resumo para a próxima etapa

A interface expõe cinco dimensões principais de seleção — requisitante, situação, período, curva ABC e lote — e uma consulta central editável por produto/filial. A jornada é orientada por F7/F8/F12, com F6 para cancelar/reabrir e operações de lote na lateral da grade. Os três riscos prioritários para qualquer reimplementação fiel são: wiring incorreto dos checkboxes de detalhes, evento incorreto de “Número dias de vendas” e atalho Alt que referencia `nota_serie` sem coluna declarada.
