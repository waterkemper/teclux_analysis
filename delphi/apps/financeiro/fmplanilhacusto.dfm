inherited frmPlanilhaCusto: TfrmPlanilhaCusto
  Left = 311
  Top = 102
  ActiveControl = edtDataInicial
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Planilha de Custos'
  ClientHeight = 410
  ClientWidth = 845
  Constraints.MaxHeight = 452
  Constraints.MaxWidth = 865
  Constraints.MinHeight = 410
  Constraints.MinWidth = 845
  Font.Height = -12
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 15
  inherited pnlBarra: TPanel
    Left = 0
    Top = 45
    Width = 845
    Height = 365
    Align = alClient
    Visible = True
    inherited bvlBotoesEd: TBevel
      Left = 1
      Top = 364
      Width = 843
      Height = 0
      Align = alBottom
      Visible = False
    end
    object pgcFilialGrupoFilial: TtecPageControl
      Left = 4
      Top = 64
      Width = 219
      Height = 292
      ActivePage = tstFilial
      TabOrder = 2
      TabWidth = 90
      object tstFilial: TTabSheet
        Caption = '  Filia&l'
        inline fraListaFiliais1: TfraListaFiliais
          Left = 0
          Top = 0
          Width = 211
          Height = 262
          Align = alClient
          TabOrder = 0
          inherited gbxFiliais: TGroupBox
            Width = 211
            Height = 262
            Caption = ' &FILIAIS '
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = [fsBold]
            ParentFont = False
            inherited sbnMarcarFiliais: TSpeedButton
              Left = 162
              Top = 235
              OnClick = fraListaFiliais1sbnMarcarFiliaisClick
            end
            inherited sbnDesmarcarFiliais: TSpeedButton
              Left = 186
              Top = 235
              OnClick = fraListaFiliais1sbnDesmarcarFiliaisClick
            end
            inherited clbFiliais: TCheckListBox
              Left = 2
              Width = 207
              Height = 215
              Align = alTop
              Font.Height = -12
              Font.Name = 'Arial'
            end
          end
        end
      end
      object tstGrupoFilial: TTabSheet
        Caption = '  &Grupo Filial'
        ImageIndex = 1
        inline fraListaGruposFiliais1: TfraListaGruposFiliais
          Left = 0
          Top = 0
          Width = 211
          Height = 262
          Align = alClient
          TabOrder = 0
          inherited gbxGrupodeFiliais: TGroupBox
            Width = 211
            Height = 262
            Caption = ' GRU&PO DE FILIAIS '
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = [fsBold]
            ParentFont = False
            inherited sbnmarcarGrupodeFiliais: TSpeedButton
              Left = 163
              Top = 235
              OnClick = fraListaGruposFiliais1sbnmarcarGrupodeFiliaisClick
            end
            inherited sbnDesmarcarGrupodeFiliais: TSpeedButton
              Left = 187
              Top = 235
              OnClick = fraListaGruposFiliais1sbnDesmarcarGrupodeFiliaisClick
            end
            inherited clbGrupodeFiliais: TCheckListBox
              Left = 2
              Width = 207
              Height = 215
              Align = alTop
              Font.Height = -12
              Font.Name = 'Arial'
            end
          end
        end
      end
    end
    object gbxPeriodo: TGroupBox
      Left = 10
      Top = 10
      Width = 170
      Height = 36
      Caption = ' PER'#205'ODO DE VENDAS '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object lblAPeriodo: TLabel
        Left = 80
        Top = 16
        Width = 7
        Height = 15
        Caption = 'a'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
      end
      object edtDataInicial: TEditData
        Left = 2
        Top = 10
        Width = 75
        Height = 23
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        MaxLength = 10
        ParentFont = False
        TabOrder = 1
        Minimo = 37353
        Maximo = 0
      end
      object edtDataFinal: TEditData
        Left = 92
        Top = 10
        Width = 75
        Height = 23
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        MaxLength = 10
        ParentFont = False
        TabOrder = 0
        Minimo = 37353
        Maximo = 0
      end
    end
    object gbxDevolucoes: TGroupBox
      Left = 192
      Top = 10
      Width = 256
      Height = 36
      Caption = ' DEVOLU'#199#213'ES DE VENDAS '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object ckbDevolucoesPeriodoSelecionado: TCheckBox
        Left = 8
        Top = 14
        Width = 100
        Height = 18
        Caption = 'S'#243' do per'#237'odo'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        State = cbChecked
        TabOrder = 0
      end
      object ckbDevolucoesPeriodoAnterior: TCheckBox
        Left = 120
        Top = 14
        Width = 131
        Height = 18
        Caption = 'Per'#237'odos anteriores'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        State = cbChecked
        TabOrder = 1
      end
    end
    inline fraListaGrupoProdutos1: TfraListaGrupoProdutos
      Left = 228
      Top = 67
      Width = 341
      Height = 291
      TabOrder = 3
      inherited gbx: TGroupBox
        Width = 341
        Height = 291
        Caption = ' &GRUPO DE PRODUTOS '
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = [fsBold]
        ParentFont = False
        inherited Bevel1: TBevel
          Top = 17
          Width = 337
        end
        inherited clbgrupoprodutos: TCheckListBox
          Top = 23
          Width = 311
          Height = 266
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          ParentFont = False
        end
        inherited pnldireito: TPanel
          Left = 313
          Top = 23
          Height = 266
        end
      end
      inherited qryGruposProdutos: TtecQuery
        Left = 16
      end
    end
    inline fraListaEventos1: TfraListaEventos
      Left = 573
      Top = 67
      Width = 264
      Height = 291
      TabOrder = 4
      inherited gbx: TGroupBox
        Width = 264
        Height = 291
        Caption = ' &EVENTOS '
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = [fsBold]
        ParentFont = False
        inherited Bevel1: TBevel
          Top = 17
          Width = 260
        end
        inherited clbEventos: TCheckListBox
          Top = 23
          Width = 234
          Height = 266
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          ParentFont = False
        end
        inherited pnldireito: TPanel
          Left = 236
          Top = 23
          Height = 266
        end
      end
      inherited qryEventos: TtecQuery
        Left = 8
        Top = 32
      end
    end
  end
  inherited pnlTopMenu: TPanel
    Width = 845
    inherited tblBarra: TToolBar
      Left = 75
      Width = 770
      inherited sbnProcurar: TSpeedButton
        Visible = False
      end
    end
    inherited tblBarraCadastro: TToolBar
      Width = 75
      object sbnGerar: TSpeedButton
        Left = 0
        Top = 2
        Width = 75
        Height = 35
        Hint = 'Gerar consulta de requisi'#231#227'o(s)'
        Caption = 'Gerar F6'
        Flat = True
        Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000120B0000120B00000000000000000000DCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDC808080000000808080DCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A058
          5858A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDC80808000000080808000000000FFFF000000808080000000808080DCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A0585858A0A0A0585858FF
          FFFF585858A0A0A0585858A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDC00000000FFFF80808000000000FFFF00000080808000FFFF000000DCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC585858DCDCDCA0A0A0585858DC
          DCDC585858A0A0A0DCDCDC585858FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDC80808080808000FFFF00FFFF00FFFF00FFFF00FFFF808080808080DCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A0A0A0A0DCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCA0A0A0A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          80808000000000000000FFFF80808000000080808000FFFF0000000000008080
          80DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A0585858585858DCDCDCA0A0A058
          5858A0A0A0DCDCDC585858585858A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
          00000000FFFF00FFFF00FFFF000000DCDCDC00000000FFFF00FFFF00FFFF0000
          00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC585858DCDCDCDCDCDCDCDCDC585858DC
          DCDC585858FFFFFFDCDCDCDCDCDC585858FFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
          80808000000000000000FFFF80808000000080808000FFFF0000000000008080
          80DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A0585858585858DCDCDCA0A0A058
          5858A0A0A0DCDCDC585858585858A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDC80808080808000FFFF00FFFF00FFFF00FFFF00FFFF808080808080DCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A0A0A0A0DCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCA0A0A0A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDC00000000FFFF80808000000000FFFF00000080808000FFFF000000DCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC585858DCDCDCA0A0A0585858DC
          DCDC585858A0A0A0DCDCDC585858FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDC80808000000080808000000000FFFF000000808080000000808080DCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A0585858A0A0A0585858FF
          FFFF585858A0A0A0585858A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDC808080000000808080DCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A058
          5858A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC}
        Layout = blGlyphTop
        NumGlyphs = 2
        Spacing = 0
        OnClick = sbnGerarClick
      end
    end
  end
  object qryVendaGrupoProdutos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    OnCalcFields = qryVendaGrupoProdutosCalcFields
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'WhereFiliais'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WhereGrupos'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WhereDevolucao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'iniciodevolucoes'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'finaldevolucoes'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      #9'select codigogrupo,'
      '       nomegrupo,'
      '       sum(quantidade) as quantidade,'
      '       sum(custototal) as custototal,'
      
        '       sum(ValorBrutodoProduto - ValorDescontodoProduto + ValorA' +
        'crescProduto) as Total'
      'from'
      '('
      '('
      '/* VENDAS NOTAS FISCAIS NAO COMPOSTOS*/'
      '   SELECT produtos.quantidade,'
      '          produtos.custototal,'
      '          produtos.codigogrupo,'
      '          produtos.nomegrupo,'
      '         ((produtos.quantidade*precovenda) +'
      
        '         (((coalesce(frete,0)+coalesce(seguro,0))*(produtos.quan' +
        'tidade*precovenda)) /'
      
        '         ((vvalorvista+coalesce(desconto,0)-coalesce(frete,0)-co' +
        'alesce(seguro,0)) -'
      '           totalservico))) AS ValorBrutodoProduto,'
      
        '         ((coalesce(desconto,0)*(produtos.quantidade*precovenda)' +
        ') /'
      
        '         ((vvalorvista+coalesce(desconto,0)-coalesce(frete,0)-co' +
        'alesce(seguro,0)) -'
      '          totalservico)) as ValorDescontodoProduto,'
      
        '         (((vValorPrazo-vValorVista)*(produtos.quantidade*precov' +
        'enda)) /'
      
        '         ((vvalorvista+coalesce(desconto,0)-coalesce(frete,0)-co' +
        'alesce(seguro,0)) -'
      '         TotalServico)) as ValorAcrescProduto'
      'from'
      '('
      'select produtos.*, coalesce(totalservico,0) as totalservico'
      'from'
      '('
      ' select df.numero,'
      '        df.data,'
      
        '        df.valortotal-coalesce(df.totalvaloricmssubstituicao,0) ' +
        'as vvalorprazo,'
      
        '        df.valorvista-coalesce(df.totalvaloricmssubstituicao,0) ' +
        'as vvalorvista,'
      '        df.desconto,'
      '        df.valorfrete as frete,'
      '        df.seguro,'
      '        pdf.quantidade,'
      '        pdf.precovenda,'
      
        '        abs(m.valor) + (coalesce(c.custoadicionalproduto,0)*pdf.' +
        'quantidade) as custototal,'
      '        g.codigo as codigogrupo,'
      '        g.descricao as nomegrupo,'
      '        df.contrato as vcontrato'
      ' from ((dadosfiscais df'
      '       join contratos ct on ct.numero = df.contrato)'
      '       join ((produtosdadosfiscais pdf'
      '               join movimentos m on pdf.movimento = m.numero)'
      '               join (produtos p'
      
        '                      join ((caracteristicas c join classes cl o' +
        'n c.classe=cl.codigo)'
      
        '                                               join grupos g on ' +
        'g.codigo=c.grupo)'
      '                                on p.caracteristica=c.codigo)'
      '                               on pdf.produto=p.codigo)'
      '                             on df.numero = pdf.dadofiscal)'
      ' WHERE ct.faturamento BETWEEN(:DataInicial) and (:DataFinal)'
      '   and g.planilhacustos'
      '   and not coalesce(pdf.composto,false)'
      '   and NOT (select pc.brinde'
      '            from produtoscontratos pc'
      #9'    where pc.contrato = df.contrato'
      #9'      and pc.produto = pdf.produto'
      #9'      and pc.filial = pdf.filial)'
      '   AND (coalesce(ct.valorvista,0)<>0)'
      '   and ct.origem IS NULL'
      '   and df.situacao = '#39'N'#39
      '   %WhereFiliais'
      '   %WhereGrupos'
      ') as produtos left join (SELECT sc.contrato,'
      
        '                                coalesce(SUM(sc.quantidade*sc.va' +
        'lorservico),0) as totalservico'
      '                         FROM contratos ct, servicoscontratos sc'
      '                         WHERE sc.contrato = ct.numero'
      #9#9#9'   AND ct.faturamento BETWEEN(:DataInicial) and (:DataFinal)'
      '                           AND (coalesce(ct.valorvista,0)<>0)'
      '                           and ct.origem IS NULL'
      '                           %WhereFiliais'
      
        #9#9#9' group by sc.contrato) as sc on sc.contrato = produtos.vcontr' +
        'ato'
      ') as produtos'
      ')'
      'union all'
      '('
      '/*VENDAS NOTAS FISCAIS COMPOSTOS */'
      '   SELECT produtos.quantidade,'
      '          produtos.custototal,'
      '          produtos.codigogrupo,'
      '          produtos.nomegrupo,'
      '         ((produtos.quantidade*precovenda) +'
      
        '         (((coalesce(frete,0)+coalesce(seguro,0))*(produtos.quan' +
        'tidade*precovenda)) /'
      
        '         ((vvalorvista+coalesce(desconto,0)-coalesce(frete,0)-co' +
        'alesce(seguro,0)) -'
      '           totalservico))) AS ValorBrutodoProduto,'
      
        '         ((coalesce(desconto,0)*(produtos.quantidade*precovenda)' +
        ') /'
      
        '         ((vvalorvista+coalesce(desconto,0)-coalesce(frete,0)-co' +
        'alesce(seguro,0)) -'
      '          totalservico)) as ValorDescontodoProduto,'
      
        '         (((vValorPrazo-vValorVista)*(produtos.quantidade*precov' +
        'enda)) /'
      
        '         ((vvalorvista+coalesce(desconto,0)-coalesce(frete,0)-co' +
        'alesce(seguro,0)) -'
      '         TotalServico)) as ValorAcrescProduto'
      'from'
      '('
      
        'select produtos.*,  abs(m.valor)+(coalesce(custoadicionalproduto' +
        ',0) * produtos.quantidade) as custototal'
      'from'
      '('
      'select produtos.*, coalesce(totalservico,0) as totalservico'
      'from'
      '('
      ' select df.numero,'
      '        df.data,'
      
        '        df.valortotal-coalesce(df.totalvaloricmssubstituicao,0) ' +
        'as vvalorprazo,'
      
        '        df.valorvista-coalesce(df.totalvaloricmssubstituicao,0) ' +
        'as vvalorvista,'
      '        df.desconto,'
      '        df.valorfrete as frete,'
      '        df.seguro,'
      '        pdfc.quantidade,'
      '        pdfc.precovenda,'
      '        g.codigo as codigogrupo,'
      '        g.descricao as nomegrupo,'
      '        df.contrato as vcontrato,'
      '        pdf.movimento,'
      '        pdfc.componente,'
      '        pdfc.filial,'
      '        c.custoadicionalproduto'
      ' from ((dadosfiscais df'
      '       join contratos ct on ct.numero = df.contrato)'
      '       join ((produtosdadosfiscais pdf'
      
        '                  join produtosdadosfiscaiscompostos pdfc on pdf' +
        '.dadofiscal = pdfc.dadofiscal and'
      
        '                                                             pdf' +
        '.produto = pdfc.composto)'
      '               join (produtos p'
      
        '                      join ((caracteristicas c join classes cl o' +
        'n c.classe=cl.codigo)'
      
        '                                               join grupos g on ' +
        'g.codigo=c.grupo)'
      '                                on p.caracteristica=c.codigo)'
      '                               on pdfc.componente=p.codigo)'
      '                             on df.numero = pdf.dadofiscal)'
      ' WHERE ct.faturamento BETWEEN(:DataInicial) and (:DataFinal)'
      '   and g.planilhacustos'
      '   and coalesce(pdf.composto,false)'
      '   and NOT (select pc.brinde'
      '            from produtoscontratos pc'
      #9'    where pc.contrato = df.contrato'
      #9'      and pc.produto = pdf.produto'
      #9'      and pc.filial = pdf.filial)'
      '   AND (coalesce(ct.valorvista,0)<>0)'
      '   and ct.origem IS NULL'
      '   and df.situacao = '#39'N'#39
      '   %WhereFiliais'
      '   %WhereGrupos'
      ') as produtos left join (SELECT sc.contrato,'
      
        '                                coalesce(SUM(sc.quantidade*sc.va' +
        'lorservico),0) as totalservico'
      '                         FROM contratos ct, servicoscontratos sc'
      '                         WHERE sc.contrato = ct.numero'
      #9#9#9'   AND ct.faturamento BETWEEN(:DataInicial) and (:DataFinal)'
      '                           AND (coalesce(ct.valorvista,0)<>0)'
      '                           and ct.origem IS NULL'
      '                          %WhereFiliais'
      
        #9#9#9' group by sc.contrato) as sc on sc.contrato = produtos.vcontr' +
        'ato'
      
        ') as produtos join movimentos m on m.cmpmovimento = produtos.mov' +
        'imento and'
      
        '                                   m.produto = produtos.componen' +
        'te and'
      '                                   m.filial = produtos.filial'
      ') as produtos'
      ')'
      'union all'
      '('
      ' /* VENDAS FATURADAS */'
      '   SELECT produtos.qtfaturada as quantidade,'
      '          abs((CASE WHEN coalesce((EmEstoque + Reservado    +'
      '                               Transito  + Demonstracao +'
      '                               Conserto  + Danificada   +'
      '                                ReservaPrevia),0)=0 THEN 0'
      '           ELSE (financeiro/(EmEstoque + Reservado    +'
      '                               Transito  + Demonstracao +'
      '                               Conserto  + Danificada   +'
      '                                ReservaPrevia))*qtfaturada '
      
        '           END)) + (qtfaturada * coalesce(custoadicionalproduto,' +
        '0)) as custototal,'
      '          produtos.codigogrupo,'
      '          produtos.nomegrupo,'
      '         ((qtfaturada*precovenda) +'
      
        '         (((coalesce(frete,0)+coalesce(seguro,0))*(qtfaturada*pr' +
        'ecovenda)) /'
      
        '         ((vvalorvista+coalesce(desconto,0)-coalesce(frete,0)-co' +
        'alesce(seguro,0)) -'
      '           totalservico))) AS ValorBrutodoProduto,'
      '         ((coalesce(desconto,0)*(qtfaturada*precovenda)) /'
      
        '         ((vvalorvista+coalesce(desconto,0)-coalesce(frete,0)-co' +
        'alesce(seguro,0)) -'
      '          totalservico)) as ValorDescontodoProduto,'
      '         (((vValorPrazo-vValorVista)*(qtfaturada*precovenda)) /'
      
        '         ((vvalorvista+coalesce(desconto,0)-coalesce(frete,0)-co' +
        'alesce(seguro,0)) -'
      '         TotalServico)) as ValorAcrescProduto'
      'from'
      '('
      'select produtos.*, coalesce(totalservico,0) as totalservico'
      ' from'
      '('
      'select produtos.*,'
      
        '       (produtos.quantidade - coalesce(pd.quantidade,0)) as qtfa' +
        'turada'
      'from'
      '('
      ' select pc.contrato as vcontrato,'
      '        pc.produto as vproduto,'
      '        pc.filial as vfilial,'
      
        '        ct.valorprazo-(coalesce(ct.valoricmssubstituicao,0)) as ' +
        'vvalorprazo,'
      
        '        ct.valorvista-(coalesce(ct.valoricmssubstituicao,0)) as ' +
        'vvalorvista,'
      '        ct.faturamento as vfaturamento,'
      '        ct.filialvenda as filial,'
      '        pc.quantidade,'
      '        g.codigo as codigogrupo,'
      '        g.descricao as nomegrupo,'
      #9'pc.precovenda,'
      #9'ct.frete,'
      #9'ct.seguro,'
      #9'ct.desconto,'
      '        ct.situacao,'
      '        c.custoadicionalproduto  '
      ' from (contratos ct'
      '       join (produtoscontratos pc'
      '               join (produtos p'
      
        '                      join ((caracteristicas c join classes cl o' +
        'n c.classe=cl.codigo)'
      
        '                                               join grupos g on ' +
        'g.codigo=c.grupo)'
      '                                on p.caracteristica=c.codigo)'
      '                               on pc.produto=p.codigo)'
      '                            on ct.numero = pc.contrato)'
      ' WHERE ct.faturamento BETWEEN(:DataInicial) and (:DataFinal)'
      '   and g.planilhacustos'
      '   and NOT pc.brinde'
      '   AND (coalesce(ct.valorvista,0)<>0)'
      '   and ct.origem IS NULL'
      '   and ((ct.situacao <> '#39'N'#39') or'
      '        (ct.situacao = '#39'N'#39
      '         and exists (select cd.contrato'
      '                     from contratosdevolvidos cd'
      ' '#9'             where cd.contrato = ct.numero'
      #9'  '#9'       and cd.produto = pc.produto'
      #9#9'       and cd.filial = pc.filial'
      #9#9'       and cd.tipo='#39'D'#39
      #9#9'       and cd.situacao = '#39'F'#39')))'
      '   %WhereFiliais'
      '   %WhereGrupos'
      'order by pc.contrato, pc.produto, pc.filial'
      ') as produtos left join (select df.contrato,'
      '                                pdf.produto,'
      '                                pdf.filial,'
      
        '                                coalesce(sum(pdf.quantidade),0) ' +
        'as quantidade'
      '                         from ((dadosfiscais df'
      
        '                                  join contratos ct on ct.numero' +
        ' = df.contrato)'
      
        '                                  join ((produtosdadosfiscais pd' +
        'f'
      
        '                                              join movimentos m ' +
        'on pdf.movimento = m.numero)'
      '                                              join (produtos p'
      
        '                                                       join ((ca' +
        'racteristicas c join classes cl on c.classe=cl.codigo)'
      
        '                                                                ' +
        '                join grupos g on g.codigo=c.grupo)'
      
        '                                                       on p.cara' +
        'cteristica=c.codigo)'
      
        '                                              on pdf.produto=p.c' +
        'odigo)'
      
        '                                   on df.numero = pdf.dadofiscal' +
        '),'
      '                                 produtoscontratos pc'
      '                         WHERE  pc.contrato = ct.numero'
      #9#9#9'    and pc.produto = pdf.produto'
      #9#9#9'    and pc.filial = pdf.filial'
      #9#9#9'    and ct.faturamento BETWEEN(:DataInicial) and (:DataFinal)'
      '                            and g.planilhacustos'
      '                            and NOT pc.brinde'
      '                            AND (coalesce(ct.valorvista,0)<>0)'
      '                            and ct.origem IS NULL'
      '                           %WhereFiliais'
      '                           %WhereGrupos'
      '                           %WhereDevolucao'
      
        '                         group by df.contrato, pdf.produto, pdf.' +
        'filial'
      '                       ) pd on produtos.vcontrato = pd.contrato'
      '                           and produtos.vproduto = pd.produto'
      '                           and produtos.vfilial = pd.filial'
      ') as produtos left join (SELECT sc.contrato,'
      
        '                                coalesce(SUM(sc.quantidade*sc.va' +
        'lorservico),0) as totalservico'
      '                         FROM contratos ct, servicoscontratos sc'
      '                         WHERE sc.contrato = ct.numero'
      #9#9#9'   AND ct.faturamento BETWEEN(:DataInicial) and (:DataFinal)'
      '                           AND (coalesce(ct.valorvista,0)<>0)'
      '                           and ct.origem IS NULL'
      '                           %WhereFiliais'
      
        #9#9#9' group by sc.contrato) as sc on sc.contrato = produtos.vcontr' +
        'ato'
      'where qtfaturada<>0'
      ') as produtos, movimentos'
      '  WHERE numero = (coalesce((SELECT max(numero)'
      '                            FROM movimentos'
      '                            WHERE produto = vProduto'
      '                              AND filial = vFilial'
      
        '                              AND cast(data as date)=vfaturament' +
        'o),'
      '                           (SELECT max(numero)'
      '                            FROM movimentos'
      '                            WHERE produto = vProduto'
      '                              AND filial = vFilial)))'
      ')'
      'union all'
      '('
      ' /* VENDAS SERVICOS */'
      ' select'
      ' (coalesce(sc.quantidade,0)) as quantidade,'
      ' cast(0 as numeric) as custototal,'
      ' cast('#39'SERV'#39' as varchar) as codigogrupo,'
      ' cast('#39'SERVICOS'#39' AS VARCHAR) AS nomegrupo,'
      
        ' (coalesce(sc.quantidade,0)*coalesce(sc.valorservico,0)) as valo' +
        'rBrutodoProduto,'
      ' cast(0 as numeric) as valordescontodoProduto,'
      ' cast(0 as numeric) as ValorAcrescProduto'
      ' from (contratos ct'
      ' join servicoscontratos sc'
      ' on ct.numero = sc.contrato)'
      ' where ct.faturamento BETWEEN(:DataInicial) and (:DataFinal)'
      '   %WhereFiliais'
      ')'
      'union all'
      '/*'
      '  1 - DEVOLU'#199#213'ES NOTA FISCAL'
      '  2 - DEVOLU'#199#213'ES FATURADOS'
      '  3 - DEVOLUCOES CANCELADOS'
      '*/'
      '%iniciodevolucoes'
      '('
      '   select - devolucoes.quantidade AS quantidade,'
      
        '          - (abs(m.valor) + (devolucoes.quantidade * coalesce(cu' +
        'stoadicionalproduto,0))) as custototal,'
      '          codigogrupo,'
      '          nomegrupo,'
      '          - valorbrutodoproduto as valorbrutodoproduto,'
      '          - Valordescontodoproduto as valordescontodoproduto,'
      '          - valoracrescproduto as valoracrescproduto'
      '   from'
      '    ('
      '     select cd.quantidade,'
      '            c.grupo as codigogrupo,'
      '            g.descricao as nomegrupo,'
      
        '            (cd.valorvista + cd.desconto) as ValorBrutodoproduto' +
        ','
      '            cd.desconto as ValorDescontodoProduto,'
      '            (cd.ValorPrazo-cd.ValorVista) as ValorAcrescProduto,'
      '            np.codigo as vcodigonota,'
      '            cd.produto as vproduto,'
      '            cd.filial as vfilial,'
      #9'    c.custoadicionalproduto'#9
      
        '     from (((contratosdevolvidos cd join (contratos ct join nota' +
        'spag np on ct.numero = np.contrato)'
      
        '                                          on cd.contrato=ct.nume' +
        'ro)'
      
        '                                    join produtoscontratos pc on' +
        ' cd.contrato = pc.contrato and'
      
        '                                                                ' +
        ' cd.produto = pc.produto and'
      
        '                                                                ' +
        ' cd.filial = pc.filial)'
      
        '                                    join (produtos p join ((cara' +
        'cteristicas c join classes cl on c.classe=cl.codigo)'
      
        '                                                                ' +
        '              join grupos g on g.codigo=c.grupo)'
      
        '                                                            on p' +
        '.caracteristica=c.codigo)'
      
        '                                          on cd.produto=p.codigo' +
        ')'
      '     where cd.devolucao BETWEEN(:DataInicial) and (:DataFinal)'
      '       and cd.situacao = '#39'N'#39
      '       and cd.tipo='#39'D'#39
      '       and g.planilhacustos'
      '    %WhereFiliais'
      '    %WhereGrupos'
      '    %WhereDevolucao'
      
        '    ) as devolucoes join movimentos m on m.codigonota = devoluco' +
        'es.vcodigonota'
      
        '                                     and m.produto = devolucoes.' +
        'vproduto'
      
        '                                     and m.filial = devolucoes.v' +
        'filial'
      ')'
      '  union all'
      '('
      '   select - devolucoes.quantidade as quantidade,'
      '          - (abs((CASE WHEN coalesce((EmEstoque + Reservado    +'
      '                                     Transito  + Demonstracao +'
      '                                     Conserto  + Danificada   +'
      '                                     ReservaPrevia),0)=0 THEN 0'
      '                  ELSE (financeiro/(EmEstoque + Reservado    +'
      '                                    Transito  + Demonstracao +'
      '                                    Conserto  + Danificada   +'
      
        '                                     ReservaPrevia)) * devolucoe' +
        's.quantidade'
      
        '          END)) + (devolucoes.quantidade*coalesce(custoadicional' +
        'produto,0))) as custototal,'
      '          codigogrupo,'
      '          nomegrupo,'
      '          - valorbrutodoproduto as valorbrutodoproduto,'
      '          - Valordescontodoproduto as valordescontodoproduto,'
      '          - valoracrescproduto as valoracrescproduto'
      ' from'
      ' ('
      '   select cd.quantidade,'
      '          c.grupo as codigogrupo,'
      '          g.descricao as nomegrupo,'
      '          (cd.valorvista + cd.desconto) as ValorBrutodoproduto,'
      '          cd.desconto as ValorDescontodoProduto,'
      '          (cd.ValorPrazo-cd.ValorVista) as ValorAcrescProduto,'
      '          cd.devolucao as vfaturamento,'
      '          cd.produto as vproduto,'
      '          cd.filial as vfilial,'
      '          c.custoadicionalproduto '
      
        '   from (((contratosdevolvidos cd join contratos ct on cd.contra' +
        'to=ct.numero)'
      
        '                                  join produtoscontratos pc on c' +
        'd.contrato = pc.contrato and'
      
        '                                                               c' +
        'd.produto = pc.produto and'
      
        '                                                               c' +
        'd.filial = pc.filial)'
      
        '                                  join (produtos p join ((caract' +
        'eristicas c join classes cl on c.classe=cl.codigo)'
      
        '                                                                ' +
        '            join grupos g on g.codigo=c.grupo)'
      
        '                                                          on p.c' +
        'aracteristica=c.codigo)'
      '                                        on cd.produto=p.codigo)'
      ' where cd.devolucao BETWEEN(:DataInicial) and (:DataFinal)'
      '   and cd.situacao = '#39'F'#39
      '   and cd.tipo='#39'D'#39
      '   and g.planilhacustos'
      '    %WhereFiliais'
      '    %WhereGrupos'
      '    %WhereDevolucao'
      ') as devolucoes, movimentos'
      '  WHERE numero = (coalesce((SELECT max(numero)'
      '                            FROM movimentos'
      '                            WHERE produto = vProduto'
      '                              AND filial = vFilial'
      
        '                              AND cast(data as date)=vfaturament' +
        'o),'
      '                           (SELECT max(numero)'
      '                            FROM movimentos'
      '                            WHERE produto = vProduto'
      '                              AND filial = vFilial)))'
      ')'
      'union all'
      '('
      '   SELECT - produtos.quantidade as quantidade,'
      '          - abs((CASE WHEN coalesce((EmEstoque + Reservado    +'
      '                               Transito  + Demonstracao +'
      '                               Conserto  + Danificada   +'
      '                                ReservaPrevia),0)=0 THEN 0'
      '                 ELSE (financeiro/(EmEstoque + Reservado    +'
      '                               Transito  + Demonstracao +'
      '                               Conserto  + Danificada   +'
      
        '                                ReservaPrevia))*produtos.quantid' +
        'ade'
      
        '                 END))+(produtos.quantidade*coalesce(custoadicio' +
        'nalproduto,0)) as custototal,'
      '          produtos.codigogrupo,'
      '          produtos.nomegrupo,'
      '          - ((produtos.quantidade*precovenda) +'
      
        '          (((coalesce(frete,0)+coalesce(seguro,0))*(produtos.qua' +
        'ntidade*precovenda)) /'
      
        '          ((vvalorvista+coalesce(desconto,0)-coalesce(frete,0)-c' +
        'oalesce(seguro,0)) -'
      '            totalservico))) AS ValorBrutodoProduto,'
      
        '          - ((coalesce(desconto,0)*(produtos.quantidade*precoven' +
        'da)) /'
      
        '          ((vvalorvista+coalesce(desconto,0)-coalesce(frete,0)-c' +
        'oalesce(seguro,0)) -'
      '           totalservico)) as ValorDescontodoProduto,'
      
        '          - (((vValorPrazo-vValorVista)*(produtos.quantidade*pre' +
        'covenda)) /'
      
        '          ((vvalorvista+coalesce(desconto,0)-coalesce(frete,0)-c' +
        'oalesce(seguro,0)) -'
      '          TotalServico)) as ValorAcrescProduto'
      '   from'
      '   ('
      '    select produtos.*, coalesce(totalservico,0) as totalservico'
      '    from'
      '    ('
      '     select pc.contrato as vcontrato,'
      '            pc.produto as vproduto,'
      '            pc.filial as vfilial,'
      
        '            ct.valorprazo-(coalesce(ct.valoricmssubstituicao,0))' +
        ' as vvalorprazo,'
      
        '            ct.valorvista-(coalesce(ct.valoricmssubstituicao,0))' +
        ' as vvalorvista,'
      '            ct.faturamento as vfaturamento,'
      '            ct.filialvenda as filial,'
      '            pc.quantidade,'
      '            g.codigo as codigogrupo,'
      '            g.descricao as nomegrupo,'
      '   '#9'    pc.precovenda,'
      #9'    ct.frete,'
      #9'    ct.seguro,'
      #9'    ct.desconto,'
      '            c.custoadicionalproduto'
      '     from'
      '      ('
      '       select distinct p.*'
      '       from (select p.contrato,'
      '                    p.datapagto'
      '             from parcelas p'
      
        '             where p.datapagto BETWEEN(:DataInicial) and (:DataF' +
        'inal)'
      
        '               and p.tipopagto='#39'E'#39') as p join contratos ct on p.' +
        'contrato = ct.numero'
      '       where ct.situacao='#39'C'#39
      '         AND (coalesce(ct.valorvista,0)<>0)'
      '         and ct.origem is NULL'
      '         and not exists (select cd.contrato'
      '                         from contratosdevolvidos cd'
      '                         where cd.contrato = ct.numero'
      '                           and cd.tipo='#39'D'#39')'
      
        '    ) as cancelados, (contratos ct join (produtoscontratos pc  j' +
        'oin (produtos p'#9'join ((caracteristicas c join classes cl on c.cl' +
        'asse = cl.codigo)'
      
        '                                                                ' +
        '                                         join grupos g on g.codi' +
        'go=c.grupo)'
      
        #9#9#9#9#9'                                               on p.caracte' +
        'ristica = c.codigo)'
      #9#9#9#9'                                     on pc.produto=p.codigo)'
      #9#9#9'                 on pc.contrato = ct.numero)'
      '   where cancelados.contrato = ct.numero'
      '     and g.planilhacustos'
      '    %WhereFiliais'
      '    %WhereGrupos'
      '    %WhereDevolucao'
      '  order by pc.contrato, pc.produto, pc.filial'
      '  ) as produtos left join (SELECT sc.contrato,'
      
        '                                  coalesce(SUM(sc.quantidade*sc.' +
        'valorservico),0) as totalservico'
      
        '                           FROM contratos ct, servicoscontratos ' +
        'sc'
      '                           WHERE sc.contrato = ct.numero'
      
        #9'  '#9#9'     AND ct.faturamento BETWEEN(:DataInicial) and (:DataFin' +
        'al)'
      '                             AND (coalesce(ct.valorvista,0)<>0)'
      '                             and ct.origem IS NULL'
      '                           %WhereFiliais'
      
        #9#9#9'   group by sc.contrato) as sc on sc.contrato = produtos.vcon' +
        'trato'
      ') as produtos, movimentos'
      '  WHERE numero = (coalesce((SELECT max(numero)'
      '                            FROM movimentos'
      '                            WHERE produto = vProduto'
      '                              AND filial = vFilial'
      
        '                              AND cast(data as date)=vfaturament' +
        'o),'
      '                           (SELECT max(numero)'
      '                            FROM movimentos'
      '                            WHERE produto = vProduto'
      '                              AND filial = vFilial)))'
      ')'
      '%finaldevolucoes'
      ') as custo'
      'group by codigogrupo, nomegrupo'
      'order by nomegrupo')
    RequestLive = False
    Left = 616
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DataInicial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataFinal'
        ParamType = ptUnknown
      end>
    object qryVendaGrupoProdutosnomegrupo: TStringField
      DisplayLabel = 'GRUPO'
      DisplayWidth = 35
      FieldName = 'nomegrupo'
    end
    object qryVendaGrupoProdutosquantidade: TFloatField
      DisplayLabel = 'QTDADE'
      DisplayWidth = 10
      FieldName = 'quantidade'
    end
    object qryVendaGrupoProdutosunitario: TCurrencyField
      DisplayLabel = 'UNIT'#193'RIO'
      DisplayWidth = 14
      FieldKind = fkCalculated
      FieldName = 'unitario'
      DisplayFormat = '###.###.##0,00'
      Calculated = True
    end
    object qryVendaGrupoProdutostotal: TFloatField
      DisplayLabel = 'TOTAL'
      DisplayWidth = 14
      FieldName = 'total'
      DisplayFormat = '###.###.##0,00'
      currency = True
    end
    object qryVendaGrupoProdutosCustoUnitario: TCurrencyField
      DisplayLabel = 'UNIT'#193'RIO'
      FieldKind = fkCalculated
      FieldName = 'CustoUnitario'
      Calculated = True
    end
    object qryVendaGrupoProdutoscustototal: TFloatField
      DisplayLabel = 'CUSTO TOTAL'
      DisplayWidth = 14
      FieldName = 'custototal'
    end
    object qryVendaGrupoProdutosLucroBruto: TCurrencyField
      DisplayLabel = 'TOTAL'
      DisplayWidth = 14
      FieldKind = fkCalculated
      FieldName = 'LucroBruto'
      Calculated = True
    end
  end
  object qryValoresEventos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'WhereFiliais'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WhereEventos'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      ';'
      'select evento,'
      
        '       cast(repeat('#39' '#39', length(btrim(classificacao)))||descricao' +
        ' as varchar) as Descricao,'
      '       classificacao,'
      '       valorpagto'
      'from'
      ' ('
      '  select mb.evento,'
      '         e.descricao,'
      '         e.classificacao,'
      '         sum(mb.valor) as valorpagto'
      '  from ((movtosbancos mb join eventos e on mb.evento = e.codigo)'
      '                         join contas c on mb.conta = c.conta)'
      '  where mb.data between :datainicial and :datafinal'
      '    and e.planilhacustos'
      '    and mb.tipo='#39'S'#39
      '    %WhereFiliais'
      '    %WhereEventos'
      '  group by mb.evento, e.classificacao, e.descricao'
      '  order by e.classificacao, e.descricao'
      ' ) as eventos'
      'order by classificacao ')
    RequestLive = True
    Left = 656
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'datainicial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datafinal'
        ParamType = ptUnknown
      end>
    object qryValoresEventosdescricao: TStringField
      FieldName = 'descricao'
      Size = 50
    end
    object qryValoresEventosvalorpagto: TFloatField
      DisplayWidth = 14
      FieldName = 'valorpagto'
      DisplayFormat = '0.00'
    end
    object qryValoresEventosclassificacao: TStringField
      FieldName = 'classificacao'
    end
  end
  object qryEventosSinteticos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      
        'select cast(repeat('#39' '#39', length(btrim(classificacao)))||descricao' +
        ' as varchar) as Descricao,'
      '       classificacao'
      'from eventos'
      'where tipo = '#39'S'#39
      '  and (classificacao is not null)'
      '  and (classificacao<>'#39#39')'
      'order by classificacao desc, descricao')
    RequestLive = False
    Left = 696
    Top = 8
    object qryEventosSinteticosdescricao: TStringField
      FieldName = 'descricao'
      Required = True
      Size = 50
    end
    object qryEventosSinteticosclassificacao: TStringField
      FieldName = 'classificacao'
    end
  end
end
