inherited frmVisualizarImageURL: TfrmVisualizarImageURL
  Left = 483
  Top = 99
  Caption = 'Visualizar Imagens'
  ClientHeight = 602
  ClientWidth = 999
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 531
    Top = 0
    Width = 5
    Height = 552
    Align = alRight
    Color = clSkyBlue
    ParentColor = False
    ResizeStyle = rsLine
  end
  inline fraVisualizarImageURL1: TfraVisualizarImageURL
    Left = 0
    Top = 0
    Width = 531
    Height = 552
    Align = alClient
    TabOrder = 0
    inherited Splitter2: TSplitter
      Height = 338
    end
    inherited SplitterBottom: TSplitter
      Top = 338
      Width = 531
    end
    inherited pnlInformacoesProduto: TPanel
      Top = 520
      Width = 531
      inherited lblProduto: TLabel
        Width = 531
        Font.Pitch = fpVariable
        Visible = False
      end
    end
    inherited ToolBar1: TToolBar
      Top = 338
      Width = 531
    end
    inherited ScrollBox1: TScrollBox
      Width = 531
      Height = 338
      inherited imgVisualFormURL: TImage
        Width = 527
        Height = 334
        AutoSize = False
        Stretch = True
      end
    end
    inherited Panel1: TPanel
      Height = 338
    end
    inherited qryFotosProdutos: TtecQuery
      Left = 520
    end
  end
  object pnlDetalhes: TPanel
    Left = 536
    Top = 0
    Width = 463
    Height = 552
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 1
    object Splitter2: TSplitter
      Left = 0
      Top = 460
      Width = 463
      Height = 4
      Cursor = crVSplit
      Align = alTop
      Color = clSkyBlue
      ParentColor = False
      ResizeStyle = rsLine
    end
    object Splitter3: TSplitter
      Left = 0
      Top = 205
      Width = 463
      Height = 4
      Cursor = crVSplit
      Align = alTop
      Color = clSkyBlue
      ParentColor = False
      ResizeStyle = rsLine
    end
    object StaticText1: TStaticText
      Left = 0
      Top = 209
      Width = 463
      Height = 20
      Align = alTop
      Alignment = taCenter
      Caption = 'Caracter'#237'sticas'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Pitch = fpVariable
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 0
    end
    object HTMLViewerDescricaoComplementar: THtmlViewer
      Left = 0
      Top = 20
      Width = 463
      Height = 185
      BorderStyle = htNone
      DefBackground = clWindow
      DefFontColor = clWindowText
      DefFontName = 'Times New Roman'
      DefOverLinkColor = clFuchsia
      DefPreFontName = 'Courier New'
      HistoryMaxCount = 6
      ImageCacheCount = 6
      NoSelect = False
      PrintMarginBottom = 2.000000000000000000
      PrintMarginLeft = 2.000000000000000000
      PrintMarginRight = 2.000000000000000000
      PrintMarginTop = 2.000000000000000000
      PrintScale = 1.000000000000000000
      Align = alTop
      TabOrder = 1
      TabStop = True
    end
    object StaticText2: TStaticText
      Left = 0
      Top = 0
      Width = 463
      Height = 20
      Align = alTop
      Alignment = taCenter
      Caption = 'Descri'#231#227'o'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Pitch = fpVariable
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 2
    end
    object HTMLViewerCaracteristicas: THtmlViewer
      Left = 0
      Top = 229
      Width = 463
      Height = 231
      BorderStyle = htNone
      DefBackground = clWindow
      DefFontColor = clWindowText
      DefFontName = 'Times New Roman'
      DefOverLinkColor = clFuchsia
      DefPreFontName = 'Courier New'
      HistoryMaxCount = 6
      ImageCacheCount = 6
      NoSelect = False
      PrintMarginBottom = 2.000000000000000000
      PrintMarginLeft = 2.000000000000000000
      PrintMarginRight = 2.000000000000000000
      PrintMarginTop = 2.000000000000000000
      PrintScale = 1.000000000000000000
      Align = alTop
      TabOrder = 3
      TabStop = True
    end
    object StaticText3: TStaticText
      Left = 0
      Top = 464
      Width = 463
      Height = 20
      Align = alTop
      Alignment = taCenter
      Caption = 'Atributos'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Pitch = fpVariable
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 4
    end
    object DBAdvGridProdutos_Atributos: TDBAdvGrid
      Left = 0
      Top = 484
      Width = 463
      Height = 68
      Cursor = crDefault
      Align = alClient
      ColCount = 3
      RowCount = 2
      FixedRows = 1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Pitch = fpVariable
      Font.Style = []
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
      ParentFont = False
      ScrollBars = ssBoth
      TabOrder = 5
      ActiveRowShow = True
      ActiveRowColor = 16772055
      ActiveCellShow = True
      ActiveCellFont.Charset = DEFAULT_CHARSET
      ActiveCellFont.Color = clWindowText
      ActiveCellFont.Height = -11
      ActiveCellFont.Name = 'Tahoma'
      ActiveCellFont.Style = [fsBold]
      ControlLook.FixedGradientHoverFrom = clGray
      ControlLook.FixedGradientHoverTo = clWhite
      ControlLook.FixedGradientDownFrom = clGray
      ControlLook.FixedGradientDownTo = clSilver
      ControlLook.DropDownHeader.Font.Charset = DEFAULT_CHARSET
      ControlLook.DropDownHeader.Font.Color = clWindowText
      ControlLook.DropDownHeader.Font.Height = -11
      ControlLook.DropDownHeader.Font.Name = 'Tahoma'
      ControlLook.DropDownHeader.Font.Style = []
      ControlLook.DropDownHeader.Visible = True
      ControlLook.DropDownHeader.Buttons = <>
      ControlLook.DropDownFooter.Font.Charset = DEFAULT_CHARSET
      ControlLook.DropDownFooter.Font.Color = clWindowText
      ControlLook.DropDownFooter.Font.Height = -11
      ControlLook.DropDownFooter.Font.Name = 'MS Sans Serif'
      ControlLook.DropDownFooter.Font.Style = []
      ControlLook.DropDownFooter.Visible = True
      ControlLook.DropDownFooter.Buttons = <>
      Filter = <>
      FilterDropDown.Font.Charset = DEFAULT_CHARSET
      FilterDropDown.Font.Color = clWindowText
      FilterDropDown.Font.Height = -11
      FilterDropDown.Font.Name = 'MS Sans Serif'
      FilterDropDown.Font.Style = []
      FilterDropDownClear = '(All)'
      FixedColWidth = 20
      FixedRowHeight = 22
      FixedFont.Charset = DEFAULT_CHARSET
      FixedFont.Color = clWindowText
      FixedFont.Height = -11
      FixedFont.Name = 'Tahoma'
      FixedFont.Style = [fsBold]
      FloatFormat = '%.2f'
      PrintSettings.DateFormat = 'dd/mm/yyyy'
      PrintSettings.Font.Charset = DEFAULT_CHARSET
      PrintSettings.Font.Color = clWindowText
      PrintSettings.Font.Height = -11
      PrintSettings.Font.Name = 'MS Sans Serif'
      PrintSettings.Font.Style = []
      PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
      PrintSettings.FixedFont.Color = clWindowText
      PrintSettings.FixedFont.Height = -11
      PrintSettings.FixedFont.Name = 'MS Sans Serif'
      PrintSettings.FixedFont.Style = []
      PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
      PrintSettings.HeaderFont.Color = clWindowText
      PrintSettings.HeaderFont.Height = -11
      PrintSettings.HeaderFont.Name = 'MS Sans Serif'
      PrintSettings.HeaderFont.Style = []
      PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
      PrintSettings.FooterFont.Color = clWindowText
      PrintSettings.FooterFont.Height = -11
      PrintSettings.FooterFont.Name = 'MS Sans Serif'
      PrintSettings.FooterFont.Style = []
      PrintSettings.PageNumSep = '/'
      SearchFooter.FindNextCaption = 'Find &next'
      SearchFooter.FindPrevCaption = 'Find &previous'
      SearchFooter.Font.Charset = DEFAULT_CHARSET
      SearchFooter.Font.Color = clWindowText
      SearchFooter.Font.Height = -11
      SearchFooter.Font.Name = 'MS Sans Serif'
      SearchFooter.Font.Style = []
      SearchFooter.HighLightCaption = 'Highlight'
      SearchFooter.HintClose = 'Close'
      SearchFooter.HintFindNext = 'Find next occurrence'
      SearchFooter.HintFindPrev = 'Find previous occurrence'
      SearchFooter.HintHighlight = 'Highlight occurrences'
      SearchFooter.MatchCaseCaption = 'Match case'
      Version = '2.3.2.2'
      AutoCreateColumns = False
      AutoRemoveColumns = False
      Columns = <
        item
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Pitch = fpVariable
          Font.Style = []
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clWindowText
          HeaderFont.Height = -11
          HeaderFont.Name = 'MS Sans Serif'
          HeaderFont.Pitch = fpVariable
          HeaderFont.Style = []
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clWindowText
          PrintFont.Height = -11
          PrintFont.Name = 'MS Sans Serif'
          PrintFont.Pitch = fpVariable
          PrintFont.Style = []
          Width = 20
        end
        item
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'nome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Pitch = fpVariable
          Font.Style = []
          Header = 'Atributo'
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clWindowText
          HeaderFont.Height = -11
          HeaderFont.Name = 'MS Sans Serif'
          HeaderFont.Pitch = fpVariable
          HeaderFont.Style = []
          HeaderAlignment = taCenter
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clWindowText
          PrintFont.Height = -11
          PrintFont.Name = 'MS Sans Serif'
          PrintFont.Pitch = fpVariable
          PrintFont.Style = []
          ReadOnly = True
          Width = 254
        end
        item
          Alignment = taCenter
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'S'
          Color = clWindow
          Editor = edCustom
          FieldName = 'valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Pitch = fpVariable
          Font.Style = []
          Header = 'Valor'
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clWindowText
          HeaderFont.Height = -11
          HeaderFont.Name = 'MS Sans Serif'
          HeaderFont.Pitch = fpVariable
          HeaderFont.Style = []
          HeaderAlignment = taCenter
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clWindowText
          PrintFont.Height = -11
          PrintFont.Name = 'MS Sans Serif'
          PrintFont.Pitch = fpVariable
          PrintFont.Style = []
          Width = 163
        end>
      DataSource = dsrProdutos_Atributos
      PageMode = False
      InvalidPicture.Data = {
        055449636F6E0000010001002020040000000000E80200001600000028000000
        2000000040000000010004000000000000020000000000000000000000000000
        0000000000000000000080000080000000808000800000008000800080800000
        80808000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000
        FFFFFF000000000000777777777777000000000000000000777788FFFF887777
        000000000000007778F8887117788F877700000000000778F87111111111178F
        877000000000778871111111111999178877000000077F811111111111199999
        18F7700000778811111111111119999991887700007881111111111111119199
        99188700077F711111811111111198719997F7700788111118FF111111118FF7
        1991887077F71111888FF1111118FFFF19997F77778111118888FF1111888FF8
        911918777881111118888FF1188888811111188778811111118888FF88888811
        111117877F7111111118888888888111111117F77F7999111111888888881111
        111111F77F7999991111788888F71111111111F77F7999999917888888FF7111
        111117F778879999917FFF88888FF111111117877887999997FFFFF88888FF11
        11111887778799997FFFFFF798888FF11111187777F87997FFFFFF71178F88FF
        71117F7707887997FFFFF7999978F88871118870077F87997FFF799999978F87
        1117F77000788879978799999999787111188700007788879999999999999999
        1188770000077F88799999999999999778F77000000077888879999999999778
        8877000000000778F88877799777788F877000000000007778F8888878888F87
        7700000000000000777788FFFF88777700000000000000000077777777777700
        00000000FFC003FFFF0000FFFC00003FF800001FF000000FE0000007C0000003
        C000000380000001800000010000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000080000001
        80000001C0000003C0000003E0000007F000000FF800001FFC00003FFF0000FF
        FFC003FF}
      ShowBooleanFields = True
      ShowUnicode = False
      PostOnEnter = False
      ColWidths = (
        20
        254
        163)
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 552
    Width = 999
    Height = 50
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object lblProduto: TLabel
      Left = 0
      Top = 0
      Width = 999
      Height = 50
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
    end
  end
  object qryProdutos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterOpen = qryProdutosAfterOpen
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select p.codigo,'
      '       p.codigovisual,'
      '       p.descricao,'
      '       p.descricaocomplementar,'
      '       p.caracteristicas'
      'from produtos p'
      'where p.codigo = :produto')
    RequestLive = False
    Left = 676
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'produto'
        ParamType = ptUnknown
        Value = '1136700'
      end>
    object qryProdutoscodigo: TLargeintField
      FieldName = 'codigo'
      Required = True
    end
    object qryProdutoscodigovisual: TStringField
      FieldName = 'codigovisual'
      Required = True
      Size = 30
    end
    object qryProdutosdescricao: TStringField
      FieldName = 'descricao'
      Size = 100
    end
    object qryProdutosdescricaocomplementar: TStringField
      FieldName = 'descricaocomplementar'
      Size = 3000
    end
    object qryProdutoscaracteristicas: TStringField
      FieldName = 'caracteristicas'
      Size = 100000
    end
  end
  object dsrProdutos: TtecDataSource
    DataSet = qryProdutos
    Left = 716
    Top = 32
  end
  object qryProdutos_Atributos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      ';'
      'select a_p.nome,'
      ''
      '       cast(case when a_p.tipo = '#39'Sim/N'#227'o'#39' then'
      
        '         case when p.value = '#39'true'#39' then Cast('#39'Sim'#39' as Varchar(2' +
        '00))'
      
        '              when p.value = '#39'false'#39' then Cast('#39'N'#227'o'#39' as Varchar(' +
        '200))'
      '         else Cast(null as Varchar(200)) end'
      ''
      '            when a_p.tipo = '#39'Num'#233'rico'#39' then'
      '              replace(p.value,'#39'.'#39','#39','#39')'
      ''
      '       else'
      '         cast(p.value as varchar(200))'
      '       end as varchar(200)) as valor,'
      ''
      '       a_p.descricao, a_p.tipo, False as Todos'
      'from'
      '('
      'select '
      '        a_p.*  '
      'from'
      'json_to_recordset('
      ' '
      ' (select  cast(a_p.atributos as json)'
      
        '  from atributos_produtos a_p where a_p.codigo = (select p.atrib' +
        'utos from produtos p where p.codigo = :produto))'
      ''
      
        ') as a_p(nome varchar(100), descricao varchar(200), tipo varchar' +
        '(20))'
      ''
      ') as a_p'
      ''
      'left join'
      ''
      '('
      'select p.*'
      'from json_each_text('
      ''
      '(select  cast(p.atributos_valores as json)'
      '  from produtos p '
      '  where p.codigo = :produto)'
      ') as p'
      ') as p'
      ''
      'on a_p.nome = p.key')
    RequestLive = True
    Left = 632
    Top = 256
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'produto'
        ParamType = ptUnknown
      end>
    object qryProdutos_Atributosnome: TStringField
      FieldName = 'nome'
      Size = 100
    end
    object qryProdutos_Atributosvalor: TStringField
      FieldName = 'valor'
      Size = 200
    end
    object qryProdutos_Atributosdescricao: TStringField
      FieldName = 'descricao'
      Size = 200
    end
    object qryProdutos_Atributostipo: TStringField
      FieldName = 'tipo'
    end
    object qryProdutos_Atributostodos: TBooleanField
      FieldName = 'todos'
    end
  end
  object dsrProdutos_Atributos: TtecDataSource
    DataSet = qryProdutos_Atributos
    Left = 632
    Top = 304
  end
end
