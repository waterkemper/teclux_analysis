# Pesquisa: semântica Delphi da Curva ABC e gravação

Data da coleta: 2026-09-09  
Ticket: `.scratch/relatorio-curva-abc-wayfinder/issues/01-inventariar-semantica-delphi-e-gravacao.md`  
Status durante a pesquisa: `claimed`  
Escopo: quatro fontes Delphi solicitadas e dependências de código diretamente alcançáveis. Não houve implementação Laravel/Delphi e o ticket não foi fechado.

## Classificações

- **CONFIRMADO** — comportamento explícito na fonte.
- **INFERIDO** — conclusão derivada do uso, sem definição completa da dependência.
- **DÚVIDA** — a fonte não permite concluir com segurança.
- **NÃO LOCALIZADO** — definição procurada no código alcançável e não encontrada.
- **DIVERGENTE** — tela, código ou artefatos não concordam.
- **POSSÍVEL BUG LEGADO** — comportamento suspeito, documentado sem correção.

## Fontes consultadas

Primárias pedidas:

- `delphi/apps/estoque/dmrelatoriocurvaabc.pas`
- `delphi/apps/estoque/dmrelatoriocurvaabc.dfm`
- `delphi/apps/estoque/fmrelatoriocurvaabc.pas`
- `delphi/apps/estoque/fmrelatoriocurvaabc.dfm`

Dependências diretamente necessárias:

- `delphi/repositorio/dmbasico.pas`
- `delphi/repositorio/fmrelatoriopadrao.pas`
- `delphi/biblio/clparametrossistema.pas`
- `delphi/repositorio/frlistafiliais.pas`
- `delphi/repositorio/frlistagruposfiliais.pas`

As definições de banco de `abc_prod`, `codigobarras`, `estoques_produtoforalinha`, `estoques_produtoinativo` e do trigger/rotina relacionado a `veiodatriggercaracteristicas` não foram encontradas no código-fonte alcançável pesquisado. Isso limita a confirmação do cálculo ABC e do marcador técnico de trigger.

## Resumo factual

1. **CONFIRMADO:** a tela inicia com hoje/hoje, percentuais 20/30/50, quantidade 100, Vendas, “Lucro por Produto”, “Todos”, Em Linha, Ativo, Com Montagem, Sem Montagem, Brinde e Não Brinde conforme os defaults Delphi/DFM.
2. **CONFIRMADO:** F6 gera; F5 grava somente quando Gravar está habilitado.
3. **CONFIRMADO:** a consulta chama `abc_prod` com percentuais, modalidades, quantidade, filtros, ordenação, período e escopos de filial.
4. **NÃO LOCALIZADO / DÚVIDA:** a fórmula, cortes A/B/C, desempates, agregações e significado exato de Quantidade estão na função de banco não localizada.
5. **CONFIRMADO:** Gravar limpa `produtos.resultadocurvaabc` globalmente e depois persiste o `tipo` das linhas carregadas, marcando `veiodatriggercaracteristicas = true`, executando e commitando.
6. **DIVERGENTE / POSSÍVEL BUG LEGADO:** “Compras” aparece na tela, mas o ramo `TipoAnalise = 1` está vazio.
7. **POSSÍVEL BUG LEGADO:** o filtro somente Inativo tem um parêntese excedente na string montada.
8. **CONFIRMADO:** Excel é COM no Windows; fora do Windows o caminho é preview/impressão.

## Parâmetros e estados da tela

### Entrada de AbrirConsulta

A assinatura recebe, nesta ordem, `TipoAnalise`, `TipoCurvaABC`, `TipoFiltroProdutos`, `Quantidade`; `DataInicial`, `DataFinal`; `Perc_A`, `Perc_B`, `Perc_C`; oito flags (EmLinha, ForadeLinha, Ativo, Inativo, ComMontagem, SemMontagem, Brinde, NaoBrinde); e Produto, Grupo, Classe, Marca, Filiais, GrupoFiliais. **CONFIRMADO:** `dmrelatoriocurvaabc.pas:97-105`.

A tela repassa esses valores, inclusive os códigos dos componentes de consulta e as listas de filiais. **CONFIRMADO:** `fmrelatoriocurvaabc.pas:118-145`.

O construtor cria `TdtmRelatorioCurvaABC`, define datas com Date(), A/B/C = 20/30/50, Quantidade = 100, e desabilita Imprimir e Gravar. **CONFIRMADO:** `fmrelatoriocurvaabc.pas:84-108`.

O DFM inicia:

- `rbnAnalisar`: Vendas/Compras, ItemIndex 0, invisível;
- `rbnCurvaABC`: seis itens, ItemIndex 0;
- `rbnAnalizarProdutos`: Todos/Especificados, ItemIndex 0;
- Em Linha e Ativo marcados;
- Com Montagem e Sem Montagem marcados;
- Brinde e Não Brinde marcados.

**CONFIRMADO:** `fmrelatoriocurvaabc.dfm:250-340`, `:386-450`. A aba Parâmetros é ativa e a aba Dados recebe o grid ligado ao datasource. **CONFIRMADO:** `fmrelatoriocurvaabc.dfm:163-172`, `:544-585`.

**DÚVIDA:** os booleanos iniciais vêm do estado persistido no DFM; o construtor não os normaliza explicitamente.

### Validação

`ValidarCamposSelecao` chama `ecvValida.Verify`, verifica datas válidas, exige inicial <= final quando ambas existem, exige ao menos uma data e exige A+B+C exatamente igual a 100. A mensagem de soma é “Os percentuais A, B e C devem fechar em 100%”. **CONFIRMADO:** `fmrelatoriocurvaabc.pas:161-198`.

Os campos percentuais têm `Decimais = False`, `Negativo = False`, `Tamanho = 5`; Quantidade também é inteiro sem negativo. Não há regra explícita de máximo/mínimo de quantidade ou de percentual individual no código da tela. **CONFIRMADO:** `fmrelatoriocurvaabc.dfm:201-248`, `:422-436`. **DÚVIDA:** a política adicional de `TtecEditionControlValidation.Verify` não está nestas fontes.

### Opções

**CONFIRMADO:** a curva expõe:

| Item | Rótulo | Ordenação |
|---:|---|---|
| 0 | Lucro por Produto | lucrobruto desc |
| 1 | Quantidade | quantidade desc |
| 2 | Faturamento | faturamento desc |
| 3 | Fornecedor | lucrobruto desc |
| 4 | Lucros por Grupo/Classe/Marca | lucrobruto desc |
| 5 | Lucros por Marca | lucrobruto desc |

Rótulos: `fmrelatoriocurvaabc.dfm:399-414`; ordenações e visibilidade: `dmrelatoriocurvaabc.pas:188-298`.

A análise de produtos “Especificados” é o valor 1; somente nesse caso o código monta restrições de Produto/Grupo/Classe/Marca. **CONFIRMADO:** `fmrelatoriocurvaabc.dfm:439-450`; `dmrelatoriocurvaabc.pas:336-350`.

**DIVERGENTE:** “Compras” é visível na definição do radio group, mas o código só implementa o caso 0 (Vendas); o caso 1 é vazio. **CONFIRMADO:** `fmrelatoriocurvaabc.dfm:386-398`; **DIVERGENTE:** `dmrelatoriocurvaabc.pas:147-386`.

### Checkboxes

Cada par tem um evento que impede deixar os dois desmarcados: Em/Fora de Linha, Ativo/Inativo, Com/Sem Montagem, Brinde/Não Brinde. **CONFIRMADO:** `fmrelatoriocurvaabc.pas:200-273`.

Se os dois itens estão marcados, nenhum fragmento daquele filtro é enviado; se exatamente um está marcado, o fragmento é enviado. **CONFIRMADO:** `dmrelatoriocurvaabc.pas:351-377`.

**DIVERGENTE:** chamada programática pode enviar ambos falsos e, então, obter a mesma ausência de filtro dos dois marcados; a tela evita isso apenas via eventos. O contrato Laravel deve decidir aceitar, normalizar ou rejeitar o estado.

## Consulta e filtros

### SQL e dependências de banco

`qryVendas` executa `select abc.*, codigobarras(produtos.codigo) as codigo_barras from abc_prod(... ) as abc left join produtos on (abc.codigo=produtos.codigo)`. A função recebe percentuais, tipos, quantidade, códigos, ordenação, datas, escopos de filial e strings de filtro. **CONFIRMADO:** `dmrelatoriocurvaabc.dfm:7-50`.

O dataset usa `dtmTecSoft.dbaTecSoft`/`tstTecSoft`, CachedUpdates False, e `AbrirConsulta` abre e retorna `not qryVendas.IsEmpty`. **CONFIRMADO:** `dmrelatoriocurvaabc.dfm:7-16`; `dmrelatoriocurvaabc.pas:379-380`.

A constante `FiltroData` existe, mas o Pascal não a usa; as datas são passadas como `datainicial`/`datafinal` para `abc_prod`. **CONFIRMADO:** `dmrelatoriocurvaabc.pas:107-124`, `:300-302`. **DÚVIDA:** a constante parece resíduo de implementação anterior.

**NÃO LOCALIZADO:** a definição de `abc_prod` não foi encontrada no conjunto de fontes acessível. Portanto, não estão confirmados nesta pesquisa: fórmula do valor econômico, regra de acumulação, cortes inclusivos/exclusivos, tratamento de empates/zero/negativos, agregações e limite de Quantidade. **INFERIDO:** `tipo`, `percentual`, `participacao` e `acumulado` são resultados calculados por essa função.

### Produto, grupo, classe e marca

Para TipoFiltroProdutos = 1, `SQL_Produtos` concatena:

- `and c.codigo = 'Produto'`;
- `and c.grupo = 'Grupo'`;
- `and c.classe = 'Classe'`;
- `and c.marca = 'Marca'`;

somente para códigos não vazios. **CONFIRMADO:** `dmrelatoriocurvaabc.pas:336-350`.

**INFERIDO:** `abc_prod` aplica esses trechos usando o alias `c`; a função não foi localizada para confirmar a composição.

### Filiais

Há três strings separadas:

- vendas: `df.filialvenda`;
- estoque: `e.filial`;
- movimento: `m.filial`.

Lista direta usa `IN (%s)`; grupo usa subconsulta em `filiaisgruposfiliais`. **CONFIRMADO:** `dmrelatoriocurvaabc.pas:107-124`.

Quando GrupoFiliais existe, ele tem prioridade para o escopo de vendas. Se `ParSistema.RelatorioSomenteFiliaisAutorizadas` for verdadeiro, vendas recebe a combinação da lista Filiais com o grupo; estoque/movimento recebem o grupo. Sem grupo, uma lista direta preenche os três escopos. **CONFIRMADO:** `dmrelatoriocurvaabc.pas:304-334`.

Se nenhuma filial for marcada e a regra de autorizadas estiver ativa, `TfraListaFiliais.GetListaSelecionada` retorna `ListaFiliaisLiberada`; com marcações, serializa os códigos marcados entre aspas. **CONFIRMADO:** `delphi/repositorio/frlistafiliais.pas:101-117`.

A regra de autorizadas só vale para usuário que não seja Administrador nem Suporte. **CONFIRMADO:** `delphi/biblio/clparametrossistema.pas:7945-7949`. Grupo de filiais não tem fallback próprio para lista liberada. **CONFIRMADO:** `delphi/repositorio/frlistagruposfiliais.pas:67-80`.

### Filtros de produto

**CONFIRMADO:** o código gera:

- Em Linha apenas: sem marcação de fora de linha e `not estoques_produtoforalinha(p.codigo)`;
- Fora de Linha apenas: marcação ou `estoques_produtoforalinha(p.codigo)`;
- Ativo apenas: sem marcação de inativo e `not estoques_produtoinativo(p.codigo)`;
- Inativo apenas: marcação ou `estoques_produtoinativo(p.codigo)`;
- Com Montagem: `c.montagem`;
- Sem Montagem: `not (c.montagem)`;
- Brinde: `pdf.brinde`;
- Não Brinde: `not (pdf.brinde)`.

Referência: `dmrelatoriocurvaabc.pas:351-377`.

**POSSÍVEL BUG LEGADO:** no ramo somente Inativo, a string termina `and estoques_produtoinativo(p.codigo))`. A função já fecha seu parêntese e a expressão externa já foi fechada antes, deixando um parêntese excedente visível em `dmrelatoriocurvaabc.pas:358-364`. Não foi corrigido.

**NÃO LOCALIZADO:** as definições das duas funções `estoques_produto...` não foram encontradas; não é possível confirmar nesta pesquisa como elas resolvem flags nulas/herdadas.

## Resultado, colunas e classificação

O dataset declara ordem, código, código de barras, descrição, referência, fornecedor/nome, grupo/descrição, classe, marca/descrição, faturamento, quantidade, adquirido, estoque total, custo/venda em estoque, produtos em pedido, custo, lucro bruto, participação, percentual, acumulado e tipo ABC. **CONFIRMADO:** `dmrelatoriocurvaabc.pas:15-48`; `dmrelatoriocurvaabc.dfm:174-300`.

`tipo` é texto de tamanho 1 e rótulo ABC; `ordem` é inteiro. **CONFIRMADO:** `dmrelatoriocurvaabc.dfm:174-179`, `:296-300`.

Visibilidade por curva:

- 0/1/2: código, barras, descrição, referência e quantidade;
- 3: fornecedor e nome;
- 4: grupo, descrição, classe, marca e descrição da marca;
- 5: marca e descrição da marca.

**CONFIRMADO:** `dmrelatoriocurvaabc.pas:188-298`.

No item 1 o formato de acumulado é a máscara de quantidade; nos demais é `###,##0.00`. **CONFIRMADO:** `dmrelatoriocurvaabc.pas:205-223`, `:241-297`.

**DIVERGENTE:** o item 4 é rotulado “Lucros por Grupo/Classe/Marca”, mas o título interno é “LUCROS POR GRUPO”, embora as três dimensões fiquem visíveis. **CONFIRMADO:** `fmrelatoriocurvaabc.dfm:406-412`; `dmrelatoriocurvaabc.pas:262-278`.

**NÃO LOCALIZADO:** a fórmula de todos os campos calculados e da letra ABC não está no Delphi; vem da função de banco.

## Ordem do fluxo, F6, F5 e mensagens

A sequência é:

1. construtor cria o data module e aplica defaults;
2. usuário altera parâmetros;
3. F6/botão Gerar valida;
4. `AbrirConsulta` salva flags/título, configura parâmetros, filtros e ordenação, abre a query;
5. com registros, muda para Dados e habilita Imprimir/Gravar; sem registros, exibe aviso e desabilita ambos;
6. impressão passa pelo gate padrão;
7. F5/Gravar desabilita Gravar e chama atualização.

**CONFIRMADO:** `fmrelatoriocurvaabc.pas:84-108`, `:118-159`, `:297-313`; `delphi/repositorio/fmrelatoriopadrao.pas:63-97`.

A mensagem sem resultado é `ctNENHUMREGISTROENCONTRADO` formatada com “registro”. **CONFIRMADO:** `fmrelatoriocurvaabc.pas:151-156`.

F5 chama Gravar somente se habilitado; F6 sempre chama Gerar. **CONFIRMADO:** `fmrelatoriocurvaabc.pas:297-304`. A classe padrão trata F7 como impressão e desabilita/reabilita o botão em `try/finally`. **CONFIRMADO:** `delphi/repositorio/fmrelatoriopadrao.pas:46-54`, `:63-97`.

## Preview, impressão e exportação

`ImprimirRelatorio` publica título/subtítulo/outras e seis flags, cria `TfrmPreviewPadrao`, preserva bookmark, desliga controles, escolhe relatório composto por ItemIndex, mostra e abre o preview modal, restaurando o bookmark no final. Mapeamento: 0/1/2 = Lucros; 3 = Fornecedores; 4 = Grupos; 5 = Marcas. **CONFIRMADO:** `dmrelatoriocurvaabc.pas:398-466`.

Os `TfrReport` antigos usam `fdsVendas`, são armazenados no DFM e têm preview com zoom/load/save/print/find/help/exit. **CONFIRMADO:** `dmrelatoriocurvaabc.dfm:308-319`, `:1423-1434`, `:2011-2017`.

**DIVERGENTE:** existe `frxReport1: TfrxReport` com `pbExport`, mas o runtime seleciona somente os quatro `TfrReport`; chamadas de design do `frxReport1` estão comentadas. **CONFIRMADO:** `dmrelatoriocurvaabc.pas:421-433`; `dmrelatoriocurvaabc.dfm:2566-2586`.

No Windows, a tela pergunta “Deseja Exportar para o Excel”; somente `mryes` exporta. Se o usuário escolher não ou cancelar a pergunta, o fluxo imprime. O SaveDialog usa `.xls` e o título de exportação da Curva ABC. Fora do Windows, imprime diretamente. **CONFIRMADO:** `fmrelatoriocurvaabc.pas:275-294`; `fmrelatoriocurvaabc.dfm:612-618`.

### Excel

`GravarExcel` cria Excel.Application via COM, workbook/sheet, escreve cabeçalho da filial base, data/hora, filtros e dados a partir da linha 13. **CONFIRMADO:** `dmrelatoriocurvaabc.pas:506-577`.

Os layouts são:

- 0/1/2: ordem, código, descrição, referência, quantidade, adquirido, estoque total, totais de estoque/pedido, faturamento, custo, lucro, participação, percentual, acumulado, tipo;
- 3: ordem, fornecedor, nome e os campos numéricos correspondentes;
- 4: ordem, grupo, descrição do grupo e os campos numéricos correspondentes;
- 5: ordem, marca, descrição da marca e os campos numéricos correspondentes.

**CONFIRMADO:** `dmrelatoriocurvaabc.pas:577-679`.

Percorre do primeiro ao EOF, desabilita controles, restaura bookmark, salva em `LocalGravacao`, reabre e torna Excel visível. **CONFIRMADO:** `dmrelatoriocurvaabc.pas:577-605`, `:609-629`, `:632-652`, `:655-687`.

**POSSÍVEL BUG LEGADO:** `QtdeLinhas := 64` não é usada; `NumeroLinhas` apenas incrementa; e uma linha é inserida depois de `Next`, inclusive na última iteração. O efeito visual deve ser testado, não copiado automaticamente.

**POSSÍVEL BUG LEGADO:** o bloco comentado de templates cobre 0 a 4, não 5, e o código ativo usa workbook vazio. **CONFIRMADO:** `dmrelatoriocurvaabc.pas:520-526`.

**DÚVIDA:** não há tratamento local de falha de Excel/SaveAs nem liberação COM em finally; isso não define o contrato desejado para o Laravel.

## AtualizarResultadoCurvaABC e gravação

### Sequência

**CONFIRMADO:** Gravar executa:

1. limpa o SQL de atualização;
2. acrescenta `update produtos set resultadocurvaabc = null, veiodatriggercaracteristicas = true where resultadocurvaabc is not null;`;
3. guarda bookmark e desliga controles;
4. percorre todos os registros carregados;
5. acrescenta, para cada linha, `update produtos set resultadocurvaabc = <tipo>, veiodatriggercaracteristicas = true where codigo = <codigo>;`;
6. restaura bookmark;
7. executa o SQL acumulado;
8. chama `perpetrar([])`.

**CONFIRMADO:** `dmrelatoriocurvaabc.pas:690-707`.

O botão é desabilitado antes e não é reabilitado pelo método local. **CONFIRMADO:** `fmrelatoriocurvaabc.pas:308-313`.

`qryAtualizarProdutos` usa a mesma base/transação, CachedUpdates True e RequestLive True. **CONFIRMADO:** `dmrelatoriocurvaabc.dfm:1996-2010`.

`Perpetrar([])` aplica updates pendentes e faz commit da transação TecSoft no fluxo simples/SomenteGravacao. **CONFIRMADO:** `delphi/repositorio/dmbasico.pas:1530-1585`. O array vazio não fornece datasets adicionais para aplicar.

### Escopo e autoridade

**CONFIRMADO:** a limpeza é global: todo produto com resultado anterior não nulo é zerado, sem respeitar período, filial, curva ou filtros da consulta. Em seguida, somente produtos presentes no resultado atual recebem seu `tipo`. **CONFIRMADO:** `dmrelatoriocurvaabc.pas:690-704`.

**INFERIDO:** a intenção legada é substituir uma classificação global anterior pelo snapshot da consulta atual.

**DÚVIDA / NÃO LOCALIZADO:** não foi encontrada a definição de `resultadocurvaabc`, `veiodatriggercaracteristicas` nem do trigger correspondente. O nome sugere integração com trigger, mas não confirma se o valor habilita, suprime ou marca processamento.

**POSSÍVEL BUG LEGADO:** a rotina concatena um SQL grande com valores interpolados e não mostra rollback local; a atomicidade efetiva depende do componente/transação. O Laravel não deve copiar isso sem contrato explícito de transação, concorrência e auditoria.

## Decisões que o próximo contrato/spec precisa resolver

1. Obter a definição oficial de `abc_prod` e documentar fórmula, cortes, empates, zero/negativos e Quantidade.
2. Decidir se persistência é global como no legado ou snapshot identificado por período, filial, filtros e usuário.
3. Definir concorrência/idempotência quando dois usuários gravam resultados sobrepostos.
4. Remover, implementar ou desabilitar explicitamente “Compras”.
5. Definir autorização server-side para filiais e grupos.
6. Corrigir conceitualmente o caso somente Inativo sem reproduzir o parêntese excedente.
7. Separar dados calculados de apresentação e decidir colunas para cada modalidade.
8. Registrar Ativo/Inativo nos metadados do resultado, pois o legado aplica esses filtros sem exportá-los.
9. Definir preview/exportação atual; `frxReport1` não prova que FastReport é o runtime legado.
10. Definir valores permitidos para ABC, limpeza, auditoria, rollback e autoridade persistente.
11. Só depois fatiar prompts para `speckit.specify`; este artefato inventaria evidências e lacunas, não implementa nem gera a especificação.

## Limitações

Não houve consulta/execução do banco, execução do Delphi, inspeção de trigger em instância, auditoria heavy-reports ou implementação Laravel. A ausência de `abc_prod`/triggers no código acessível impede afirmar a fórmula e o efeito técnico de `veiodatriggercaracteristicas`.

## Referências primárias

`delphi/apps/estoque/dmrelatoriocurvaabc.pas`  
`delphi/apps/estoque/dmrelatoriocurvaabc.dfm`  
`delphi/apps/estoque/fmrelatoriocurvaabc.pas`  
`delphi/apps/estoque/fmrelatoriocurvaabc.dfm`  
`delphi/repositorio/dmbasico.pas`  
`delphi/repositorio/fmrelatoriopadrao.pas`  
`delphi/biblio/clparametrossistema.pas`  
`delphi/repositorio/frlistafiliais.pas`  
`delphi/repositorio/frlistagruposfiliais.pas`
