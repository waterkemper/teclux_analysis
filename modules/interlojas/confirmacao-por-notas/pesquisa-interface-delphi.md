# Pesquisa da interface Delphi — Confirmação por Notas

## Escopo e estado inicial

Fontes primárias lidas integralmente: `fmconfirmarnotastransferencia.pas` (359 linhas) e `.dfm` (922 linhas). Suportes herdados consultados: `fmajudabt`, `cpeditioncontrolvalidation`, `cpdata` e `cpdbgrid`.

- Janela MDI, título “Confirmação de Notas de Transferência”, `dbgNotas` ativo e Procurar herdado invisível. [DFM:1](C:/projetos.vcl/apps/interlojas/fmconfirmarnotastransferencia.dfm#L1) [DFM:5](C:/projetos.vcl/apps/interlojas/fmconfirmarnotastransferencia.dfm#L5) [DFM:20](C:/projetos.vcl/apps/interlojas/fmconfirmarnotastransferencia.dfm#L20)
- Datas começam na data do servidor; requisitante mostra filial-base (código com 3 dígitos e nome), somente leitura. Tab inicial: Notas. [PAS:111](C:/projetos.vcl/apps/interlojas/fmconfirmarnotastransferencia.pas#L111) [DFM:688](C:/projetos.vcl/apps/interlojas/fmconfirmarnotastransferencia.dfm#L688)
- Tabs “No&tas” (Alt+T) e “Pro&dutos” (Alt+D). Produtos e buscas só habilitam com registros; Confirmar só com `QtdeMarcados>0`. [DFM:150](C:/projetos.vcl/apps/interlojas/fmconfirmarnotastransferencia.dfm#L150) [DFM:167](C:/projetos.vcl/apps/interlojas/fmconfirmarnotastransferencia.dfm#L167) [PAS:94](C:/projetos.vcl/apps/interlojas/fmconfirmarnotastransferencia.pas#L94)

## Filtros, validação e foco

- Período obrigatório (`ecvValida`, ordem final/inicial). A herança exige data preenchida/válida, avisa e foca a primeira inválida. [DFM:903](C:/projetos.vcl/apps/interlojas/fmconfirmarnotastransferencia.dfm#L903) [cpeditioncontrolvalidation.pas:129](C:/projetos.vcl/biblio/componentes/cpeditioncontrolvalidation.pas#L129)
- `TEditData` rejeita data inválida/texto menor que 8 e aplica limites. Inicial usa `NDiasLimiteEmissao`; saída da inicial recalcula mínimo final; entrada na final usa distância servidor/inicial. [cpdata.pas:181](C:/projetos.vcl/biblio/componentes/cpdata.pas#L181) [PAS:129](C:/projetos.vcl/apps/interlojas/fmconfirmarnotastransferencia.pas#L129) [PAS:183](C:/projetos.vcl/apps/interlojas/fmconfirmarnotastransferencia.pas#L183) [PAS:284](C:/projetos.vcl/apps/interlojas/fmconfirmarnotastransferencia.pas#L284)
- Mensagens cobrem datas <= contábil, inicial anterior ao limite e final anterior à inicial. Gerar valida e consulta; sem registros avisa/foca inicial, senão ativa Notas/foca grid. [PAS:191](C:/projetos.vcl/apps/interlojas/fmconfirmarnotastransferencia.pas#L191) [PAS:202](C:/projetos.vcl/apps/interlojas/fmconfirmarnotastransferencia.pas#L202) [PAS:260](C:/projetos.vcl/apps/interlojas/fmconfirmarnotastransferencia.pas#L260)

## Chave NF-e e buscas

- Máscara exata: `99\-9999\-99999999999999\-99\-999\-999999999\-9\-99999999\-9;1;_`; `MaxLength=52`. São 44 dígitos nos grupos 2-4-14-2-3-9-1-8-1, com hífens armazenados. [DFM:800](C:/projetos.vcl/apps/interlojas/fmconfirmarnotastransferencia.dfm#L800) [DFM:819](C:/projetos.vcl/apps/interlojas/fmconfirmarnotastransferencia.dfm#L819)
- Enter procura `chv_nfe` com `somentenumero(edtNFE.Text)`, sem teste local de completude. Sucesso foca grid, coluna chave e alterna seleção; falha mostra “NFE não encontrada”, foca e seleciona tudo. [PAS:311](C:/projetos.vcl/apps/interlojas/fmconfirmarnotastransferencia.pas#L311)
- Busca por número mostra FILIAL e NÚMERO, sem máscaras locais. Enter tenta `serie;numero` e depois `numero`; sucesso alterna seleção, falha usa a mesma mensagem. FILIAL versus `serie` é ambíguo. [DFM:833](C:/projetos.vcl/apps/interlojas/fmconfirmarnotastransferencia.dfm#L833) [PAS:334](C:/projetos.vcl/apps/interlojas/fmconfirmarnotastransferencia.pas#L334)

## Grids, seleção e cores

- Notas: somente leitura, seleção por linha, títulos, indicador, redimensionamento, linhas, Tab, listras, número de linha e ordenação. Colunas: código/`filialemissao`, nome, série, número, chave NF-e, emissão, valor, OK/`selecionar`, romaneio e as duas situações. [DFM:168](C:/projetos.vcl/apps/interlojas/fmconfirmarnotastransferencia.dfm#L168) [DFM:209](C:/projetos.vcl/apps/interlojas/fmconfirmarnotastransferencia.dfm#L209)
- Duplo clique com grid focado e Ctrl+Espaço chamam `SelecionarRegistros`; localizar também alterna seleção, não apenas posiciona. [PAS:137](C:/projetos.vcl/apps/interlojas/fmconfirmarnotastransferencia.pas#L137) [PAS:214](C:/projetos.vcl/apps/interlojas/fmconfirmarnotastransferencia.pas#L214)
- Marcada e não focada: fundo `clInfoBk`, fonte preta. Com romaneio “EM TRÂNSITO”: “NÃO CONFIRMADA” verde `$00006600`; “CONFIRMADA” `$000049E1`; “CONFIRMADA PARCIAL” vermelha. A legenda repete 26112, 18913 e vermelho. [PAS:144](C:/projetos.vcl/apps/interlojas/fmconfirmarnotastransferencia.pas#L144) [DFM:405](C:/projetos.vcl/apps/interlojas/fmconfirmarnotastransferencia.dfm#L405)
- Produtos: somente leitura/seleção de linha, ordenável, sem número de linha/dupla coloração. Colunas: número, produto, descrição, linha, coluna, quantidade e preço. Linha/coluna seguem `ParSistema.UsarGradesProdutos`; títulos são dinâmicos; quantidade usa largura `max(65, Length(MascaraQuantidade)*7)`. [DFM:470](C:/projetos.vcl/apps/interlojas/fmconfirmarnotastransferencia.dfm#L470) [DFM:505](C:/projetos.vcl/apps/interlojas/fmconfirmarnotastransferencia.dfm#L505) [PAS:104](C:/projetos.vcl/apps/interlojas/fmconfirmarnotastransferencia.pas#L104)
- O grid herdado ordena por título quando `DenySort=False` e abre personalização de campos com clique direito. [cpdbgrid.pas:1567](C:/projetos.vcl/biblio/componentes/cpdbgrid.pas#L1567) [cpdbgrid.pas:1771](C:/projetos.vcl/biblio/componentes/cpdbgrid.pas#L1771) [cpdbgrid.pas:2746](C:/projetos.vcl/biblio/componentes/cpdbgrid.pas#L2746)

## Operações, estados e atalhos

- Gerar tem ícone/hint/caption “Gerar F6”; F6 sem modificadores. Confirmar tem ícone/hint/“Confirmar F5”; F5 sem modificadores e habilitação por seleção. [DFM:23](C:/projetos.vcl/apps/interlojas/fmconfirmarnotastransferencia.dfm#L23) [DFM:68](C:/projetos.vcl/apps/interlojas/fmconfirmarnotastransferencia.dfm#L68) [PAS:214](C:/projetos.vcl/apps/interlojas/fmconfirmarnotastransferencia.pas#L214)
- Enter na data final gera se válida; com registros ativa Notas/foca grid, senão mantém foco. [PAS:221](C:/projetos.vcl/apps/interlojas/fmconfirmarnotastransferencia.pas#L221)
- Conferir é botão lateral com ícone/hint, sem caption/atalho, e chama `ConferirProdutos` com nota, produtos, grades e tipo `NST`. [DFM:608](C:/projetos.vcl/apps/interlojas/fmconfirmarnotastransferencia.dfm#L608) [PAS:292](C:/projetos.vcl/apps/interlojas/fmconfirmarnotastransferencia.pas#L292)
- Confirmar solicita senha ou login/autorização conforme `TransferenciaPorItem`; só confirma quando há usuário e `not User.TransferenciaPorItem`, senão avisa não autorizado. Condição contraintuitiva. [PAS:236](C:/projetos.vcl/apps/interlojas/fmconfirmarnotastransferencia.pas#L236)
- F1 herdado abre ajuda. F9 pertence ao Procurar herdado, oculto nesta tela. [fmajudabt.pas:45](C:/projetos.vcl/repositorio/fmajudabt.pas#L45)

## Ambiguidades e limites

- `$000049E1` é `TColor`/BGR; a web deve reproduzir a cor percebida. Cores de situação só se aplicam à linha não focada.
- Não há validação explícita de 44 dígitos/dígito verificador; a única normalização comprovada é `somentenumero` antes do `Locate`.
- Não há exportação, paginação, seleção em massa, loading, modal pré-confirmação, atalho de Conferir ou tratamento local de falha técnica. Exportação será requisito Laravel, não equivalência observada.
- Semântica interna de consulta, seleção, conferência e confirmação pertence a outros módulos e está fora deste ticket.
