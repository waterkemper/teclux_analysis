inherited frmTransferenciaLongoPrazo: TfrmTransferenciaLongoPrazo
  Left = 626
  Top = 216
  Caption = 'Transfer'#234'ncia do Longo Prazo'
  ClientHeight = 126
  ClientWidth = 402
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBarra: TPanel
    TabOrder = 2
  end
  inherited pnlTopMenu: TPanel
    Width = 402
    TabOrder = 3
    inherited tblBarra: TToolBar
      Width = 401
      inherited sbnProcurar: TSpeedButton
        Visible = False
      end
      object sbnImprimir: TSpeedButton
        Left = 84
        Top = 2
        Width = 75
        Height = 39
        Hint = 
          'Imprimir os contratos cujos valores de longo prazo foram transfe' +
          'ridos'
        Caption = 'Imprimir F7'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        Glyph.Data = {
          F6030000424DF603000000000000360000002800000013000000100000000100
          180000000000C0030000120B0000120B00000000000000000000DCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC000000DCDCDCDCDCDCDCDCDC00
          0000000000000000000000000000000000000000000000000000000000000000
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC000000DCDCDCDCDCDC000000C0C7C0C0C7
          C0C0C7C0C0C7C0C0C7C0C0C7C0C0C7C0C0C7C0C0C7C0000000C0C7C0000000DC
          DCDCDCDCDCDCDCDCDCDCDC000000DCDCDC000000000000000000000000000000
          000000000000000000000000000000000000000000000000C0C7C0000000DCDC
          DCDCDCDCDCDCDC000000DCDCDC000000C0C7C0C0C7C0C0C7C0C0C7C0C0C7C0C0
          C7C000FFFF00FFFF00FFFFC0C7C0C0C7C0000000000000000000DCDCDCDCDCDC
          DCDCDC000000DCDCDC000000C0C7C0C0C7C0C0C7C0C0C7C0C0C7C0C0C7C08087
          80808780808780C0C7C0C0C7C0000000C0C7C0000000DCDCDCDCDCDCDCDCDC00
          0000DCDCDC000000000000000000000000000000000000000000000000000000
          000000000000000000000000C0C7C0C0C7C0000000DCDCDCDCDCDC000000DCDC
          DC000000C0C7C0C0C7C0C0C7C0C0C7C0C0C7C0C0C7C0C0C7C0C0C7C0C0C7C0C0
          C7C0000000C0C7C0000000C0C7C0000000DCDCDCDCDCDC000000DCDCDCDCDCDC
          000000000000000000000000000000000000000000000000000000000000C0C7
          C0000000C0C7C0000000000000DCDCDCDCDCDC000000DCDCDCDCDCDCDCDCDC00
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000C0C7C0
          000000C0C7C0000000DCDCDCDCDCDC000000DCDCDCDCDCDCDCDCDCDCDCDC0000
          00FFFFFF000000000000000000000000000000FFFFFF00000000000000000000
          0000DCDCDCDCDCDCDCDCDC000000DCDCDCDCDCDCDCDCDCDCDCDC000000FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000DCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDC000000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC000000FFFFFF00
          0000000000000000000000000000FFFFFF000000DCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDC000000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC000000FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000DCDCDCDCDCDCDCDCDCDCDCDC00
          0000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC000000000000000000000000
          000000000000000000000000000000DCDCDCDCDCDCDCDCDCDCDCDC000000DCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC000000}
        Layout = blGlyphTop
        ParentFont = False
        Spacing = 0
        OnClick = sbnImprimirClick
      end
      object sbnGerar: TSpeedButton
        Left = 159
        Top = 2
        Width = 75
        Height = 39
        Hint = 'Gerar os lan'#231'amentos de transfer'#234'ncia'
        Caption = 'Gerar F8'
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
  object rgpTransferenciaLongoPrazo: TRadioGroup
    Left = 8
    Top = 48
    Width = 166
    Height = 65
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    ItemIndex = 0
    Items.Strings = (
      'Efetuar transfer'#234'ncias'
      'Desfazer transfer'#234'ncias')
    ParentFont = False
    TabOrder = 0
  end
  object gbxExercicio: TGroupBox
    Left = 184
    Top = 54
    Width = 92
    Height = 53
    Caption = 'EXERC'#205'CIO ATUAL'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -9
    Font.Name = 'helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object edtExercicio: TEditNumero
      Left = 9
      Top = 12
      Width = 72
      Height = 37
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -24
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = [fsBold]
      MaxLength = 8
      ParentFont = False
      TabOrder = 0
      Mascara = False
      Alignment = taCenter
      TipoMascara = tmGERAL
      NrDecimal = 0
      Decimais = False
      Negativo = False
      Tamanho = 8
    end
  end
  object AdvSmoothProgressBar1: TAdvSmoothProgressBar
    Left = 0
    Top = 115
    Width = 402
    Height = 11
    Step = 10.000000000000000000
    Maximum = 100.000000000000000000
    Appearance.BackGroundFill.Color = 16765615
    Appearance.BackGroundFill.ColorTo = 16765615
    Appearance.BackGroundFill.ColorMirror = clNone
    Appearance.BackGroundFill.ColorMirrorTo = clNone
    Appearance.BackGroundFill.GradientType = gtVertical
    Appearance.BackGroundFill.GradientMirrorType = gtSolid
    Appearance.BackGroundFill.BorderColor = clSilver
    Appearance.BackGroundFill.Rounding = 0
    Appearance.BackGroundFill.ShadowOffset = 0
    Appearance.BackGroundFill.Glow = gmNone
    Appearance.ProgressFill.Color = 16773091
    Appearance.ProgressFill.ColorTo = 16768452
    Appearance.ProgressFill.ColorMirror = 16765357
    Appearance.ProgressFill.ColorMirrorTo = 16767936
    Appearance.ProgressFill.GradientType = gtVertical
    Appearance.ProgressFill.GradientMirrorType = gtVertical
    Appearance.ProgressFill.BorderColor = 16765357
    Appearance.ProgressFill.Rounding = 0
    Appearance.ProgressFill.ShadowOffset = 0
    Appearance.ProgressFill.Glow = gmNone
    Appearance.Font.Charset = DEFAULT_CHARSET
    Appearance.Font.Color = clWindowText
    Appearance.Font.Height = -11
    Appearance.Font.Name = 'Tahoma'
    Appearance.Font.Style = []
    Appearance.ProgressFont.Charset = DEFAULT_CHARSET
    Appearance.ProgressFont.Color = clWindowText
    Appearance.ProgressFont.Height = -11
    Appearance.ProgressFont.Name = 'Tahoma'
    Appearance.ProgressFont.Style = []
    Appearance.ValueFormat = '%.0f%%'
    Appearance.ValueVisible = True
    Version = '1.7.0.0'
    Align = alBottom
    TabStop = False
  end
  object StaticText1: TStaticText
    Left = 16
    Top = 49
    Width = 49
    Height = 16
    Caption = ' FUN'#199#195'O '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
    TabOrder = 5
  end
  object qryTransferirLongoParaCurtoPrazo: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    OnProgress = qryTransferirLongoParaCurtoPrazoProgress
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'SELECT TransferirLongoParaCurtoPrazo(:exercicio)')
    RequestLive = False
    Left = 265
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'exercicio'
        ParamType = ptInput
        Value = '2016'
      end>
  end
  object qryDesfazerTransferenciasLongoPrazo: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    OnProgress = qryDesfazerTransferenciasLongoPrazoProgress
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'SELECT DesfazerTransferenciasLongoPrazo(:exercicio)')
    RequestLive = False
    Left = 297
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'exercicio'
        ParamType = ptInput
      end>
  end
  object qryTransferenciaLongoParaCurtoPrazo: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'SET DateStyle TO '#39'ISO, European'#39';'
      ''
      'SELECT l.NrOrigem / 100000000 AS Contrato,'
      '       l.Valor,'
      ''
      '      (SELECT vf.Codigo'
      '          FROM vFornecedores vf'
      '          JOIN Compradores co ON co.Cliente     = vf.codigo AND'
      '                                 co.TipoCliente = vf.Tipo   AND'
      
        '                                 co.Contrato    = l.NrOrigem / 1' +
        '00000000'
      ''
      '          WHERE co.Cliente     = vf.codigo AND'
      '                co.TipoCliente = vf.Tipo   AND'
      
        '                co.Contrato    = l.NrOrigem / 100000000 AND co.P' +
        'rincipal) AS CodigoCliente,'
      ''
      '      (SELECT vf.Nome'
      '          FROM vFornecedores vf'
      '          JOIN Compradores co ON co.Cliente     = vf.codigo AND'
      '                                 co.TipoCliente = vf.Tipo   AND'
      
        '                                 co.Contrato    = l.NrOrigem / 1' +
        '00000000'
      ''
      '          WHERE co.Cliente     = vf.codigo AND'
      '                co.TipoCliente = vf.Tipo   AND'
      
        '                co.Contrato    = l.NrOrigem / 100000000 AND co.P' +
        'rincipal) AS NomeCliente'
      ''
      '   FROM Lancamentos l'
      '   WHERE l.Data = :Data AND'
      '         l.Origem = '#39'G'#39'  AND'
      '        mod((l.NrOrigem / 1000000),100) = 60'
      ''
      'order by l.NrOrigem / 100000000')
    RequestLive = False
    Active = True
    Left = 280
    Top = 64
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'Data'
        ParamType = ptUnknown
        Value = #39'2016-12-31'#39
      end>
    object qryTransferenciaLongoParaCurtoPrazocontrato: TLargeintField
      FieldName = 'contrato'
    end
    object qryTransferenciaLongoParaCurtoPrazovalor: TFloatField
      FieldName = 'valor'
      DisplayFormat = '0.00'
    end
    object qryTransferenciaLongoParaCurtoPrazocodigocliente: TIntegerField
      FieldName = 'codigocliente'
      DisplayFormat = '0'
    end
    object qryTransferenciaLongoParaCurtoPrazonomecliente: TStringField
      FieldName = 'nomecliente'
      Size = 50
    end
  end
  object frxDBTransferenciaLongoParaCurtoPrazo: TfrxDBDataset
    UserName = 'frxDBTransferenciaLongoParaCurtoPrazo'
    CloseDataSource = False
    FieldAliases.Strings = (
      'contrato=contrato'
      'valor=valor'
      'codigocliente=codigocliente'
      'nomecliente=nomecliente')
    OpenDataSource = False
    DataSet = qryTransferenciaLongoParaCurtoPrazo
    Left = 312
    Top = 88
  end
  object frxDBTransferenciaLongoParaCurtoPrazo_: TfrxDBDataset
    UserName = 'frxDBTransferenciaLongoParaCurtoPrazo_'
    CloseDataSource = False
    FieldAliases.Strings = (
      'contrato=contrato'
      'valor=valor'
      'codigocliente=codigocliente'
      'nomecliente=nomecliente')
    OpenDataSource = False
    DataSet = qryTransferenciaLongoParaCurtoPrazo
    Left = 360
    Top = 72
  end
  object frxTransferenciaLongoParaCurtoPrazo: TfrxReport
    Version = '4.0.11'
    DataSet = frxDBTransferenciaLongoParaCurtoPrazo_
    DataSetName = 'frxDBTransferenciaLongoParaCurtoPrazo_'
    DotMatrixReport = False
    EngineOptions.DoublePass = True
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42340.700718275500000000
    ReportOptions.LastChange = 43007.469246759300000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var'
      ' vZebrar : boolean;'
      ''
      'procedure MasterData1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if vZebrar then'
      '  begin'
      '    if <CordoZebrado> <> null then'
      '      mmoZebrado.color := <CordoZebrado>;'
      '    vZebrar := false;'
      '  end'
      '  else'
      '  begin'
      '    mmoZebrado.color := clwhite;'
      '    vZebrar := true;'
      '  end;'
      'end;'
      ''
      ''
      'begin'
      ''
      'end.')
    OnGetValue = frxTransferenciaLongoParaCurtoPrazoGetValue
    Left = 320
    Top = 48
    Datasets = <
      item
        DataSet = frxDBTransferenciaLongoParaCurtoPrazo
        DataSetName = 'frxDBTransferenciaLongoParaCurtoPrazo'
      end>
    Variables = <
      item
        Name = ' Relatorio'
        Value = Null
      end
      item
        Name = 'ENDERECO_BAIRRO'
        Value = Null
      end
      item
        Name = 'RAZAOFILIALBASE'
        Value = Null
      end
      item
        Name = 'CEP_CIDADE_UF'
        Value = Null
      end
      item
        Name = 'TITULO'
        Value = #39'SITUA'#199#195'O DOS RECEBIMENTOS EM 30/04/2015 DESDE 01/04/2015'#39
      end
      item
        Name = 'SUBTITULO'
        Value = Null
      end
      item
        Name = 'OUTRAS'
        Value = #39'FILIAIS: 1,2,3,4,5,6,7,8,9,10 '#39
      end
      item
        Name = 'DATA'
        Value = Null
      end
      item
        Name = 'CordoZebrado'
        Value = Null
      end
      item
        Name = 'AgruparGrupoFilial'
        Value = 'False'
      end
      item
        Name = 'AgruparFilial'
        Value = 'False'
      end
      item
        Name = 'AgruparFornecedor'
        Value = Null
      end
      item
        Name = 'AgruparLocalizacao'
        Value = Null
      end
      item
        Name = 'AgruparClasseProduto'
        Value = Null
      end
      item
        Name = 'AgruparGrupoProduto'
        Value = Null
      end
      item
        Name = 'DATASITUACAO'
        Value = #39'30/04/2015'#39
      end
      item
        Name = 'QuebrarPaginaporCliente'
        Value = 'False'
      end
      item
        Name = 'Pagina1'
        Value = Null
      end
      item
        Name = 'Pagina2'
        Value = Null
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      OnAfterPrint = 'Page1OnAfterPrint'
      OnBeforePrint = 'Page1OnBeforePrint'
      object PageHeader1: TfrxPageHeader
        Height = 90.708720000000000000
        Top = 18.897650000000000000
        Width = 793.701300000000000000
        object Memo6: TfrxMemoView
          Left = 699.213050000000000000
          Top = 18.897650000000000000
          Width = 52.913420000000000000
          Height = 11.338590000000000000
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[Page]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo4: TfrxMemoView
          Left = 650.079160000000000000
          Top = 18.897650000000000000
          Width = 45.354360000000000000
          Height = 11.338590000000000000
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            'P'#195#129'G.:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Left = 650.079160000000000000
          Top = 3.779530000000000000
          Width = 45.354360000000000000
          Height = 11.338590000000000000
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            'DATA:')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Left = 699.213050000000000000
          Top = 3.779530000000000000
          Width = 52.913420000000000000
          Height = 11.338582680000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[Date]')
          ParentFont = False
          VAlign = vaCenter
        end
        object mmoTitulo: TfrxMemoView
          ShiftMode = smDontShift
          Left = 377.953000000000000000
          Top = 3.779530000000000000
          Width = 260.787570000000000000
          Height = 37.795300000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '[TITULO]')
          ParentFont = False
        end
        object fmvRua: TfrxMemoView
          Left = 143.622140000000000000
          Top = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 11.338590000000000000
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[RAZAOFILIALBASE]')
          ParentFont = False
        end
        object fmvBairro: TfrxMemoView
          Left = 143.622140000000000000
          Top = 15.118120000000000000
          Width = 94.488250000000000000
          Height = 11.338590000000000000
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[ENDERECO_BAIRRO]')
          ParentFont = False
        end
        object fmvCidade: TfrxMemoView
          Left = 143.622140000000000000
          Top = 26.456710000000000000
          Width = 94.488250000000000000
          Height = 11.338590000000000000
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[CEP_CIDADE_UF]')
          ParentFont = False
        end
        object fpvLogo: TfrxPictureView
          Left = 18.897650000000000000
          Top = 7.559060000000000000
          Width = 120.944960000000000000
          Height = 45.354360000000000000
          Picture.Data = {
            07544269746D617016110000424D161100000000000036000000280000004800
            0000140000000100180000000000E0100000C40E0000C40E0000000000000000
            0000FFFFFFFFFFFFFCFCFCCECDCDFFFFFFE3E3E3CFCFD0FFFFFFF1F1F1CDCDCD
            FAFAFADDDDDDFFFFFFE4E3E3FFFFFFE4E4E4DBDCDCFFFFFFECECECFBFBFBFCFC
            FCCECECDF9F9F9FFFFFFB5B5B58D8D8E9E9E9DF8F8F8F4F4F4FAFAFAD0D0D0D3
            D3D4FEFEFEFFFFFFFFFFFFD7D7D8DBDADAFDFDFDF2F2F2DDDDDDFEFEFEE9E9E9
            FFFFFFFEFEFECFCFD0CFCFCFFAFAFAF0F0F1FAFAFADADADACECECEEEEEEEFFFF
            FFE7E7E7ECECECFEFEFED0D0D1E9E9E9F1F1F1FBFBFBE1E1E1FBFBFBF4F4F4FA
            FAFACFCFCFD4D4D5FFFFFFCECECECECECEFAFAFAFFFFFFFFFFFFFFFFFFFFFFFF
            A9A8A8D2D2D2DCDCDC999999DFDFDFF7F7F7585859F1F1F1FDFDFD3C3A3AFFFF
            FF545453ECECEC969696C7C7C7B2B2B2999A9AEBEBEB424140EDEDED414141FA
            FAF9585757E7E7E7868686D9D9D9C0C0C06F6F6FDDDDDD696969F9F9F9FFFFFF
            929394D0D0D0E7E7E7EFEFEFB3B3B23E3E3FF9F9F97B7B7AFFFFFFFFFFFFE0E0
            E0C7C7C68C8C8CAFAEAEDFDFDFECECECD8D7D73F3F3FFEFEFE4C4D4EF9F9F946
            4646DFDFDFF1F1F1A8A7A7E7E7E7484747DEDEDEBCBCBC545352E1E1E15A5A5A
            FFFFFFE0E0E0D3D3D37E7D7EFFFFFFFFFFFFFFFFFFFFFFFFABABABE2E2E1DADA
            DA7A7A79B9B9B9F6F6F668686AFEFEFEFFFFFF3E3D3DFEFEFE565658E8E8E8B0
            B0AFD8D8D8A5A5A4999A9AEBEBEB403F3EFCFCFB464646F8F8F8616161F2F2F2
            868686D9D9D9C0C0C0F3F3F3B3B3B3484949FAFAFAFFFFFF8E8F90AAAAA9C9C9
            C8EFEFEFB7B7B73E4043F1F1F1848485FFFFFFF9F9F94D4D4DC5C5C5F6F6F6B1
            B0B0DFDFDF4B4B4DC3C3C3E4E4E4FDFDFD555656FEFEFE40403FB9B9B9E1E1E1
            A8A8A8E6E6E64B4A4ADADADAC0C1C2F2F2F2B3B3B33F3F3FFFFFFF404040C4C4
            C4F5F5F5FFFFFFFFFFFFFFFFFFFFFFFF7474749C9B9AFFFFFFE2E2E2AFAFB0FE
            FEFEF0F0F0AEAEADF5F6F6C0BFBEB3B3B2FCFCFCFFFFFFD7D7D8C6C6C6FFFFFF
            989999EAEBEBFCFCFCAFAFAFF6F6F6FFFFFFEDEDEDB0B0AFE1E1E0F0F0F0E7E7
            E7D9D9D9AFAEAEDCDDDDFFFFFFFFFFFFFFFFFFC9C9C9C2C2C2FCFCFCB0B0AFB7
            B7B7B7B6B5FCFCFCFFFFFFFFFFFFD6D7D7AEAEADE7E7E5E0E0E0F2F2F2F2F2F2
            B0AFAFC2C2C2E6E6E63B3A3ADDDEDEFFFFFFB6B6B6DDDDDDE9E9E9B0AFAFB7B7
            B7BEBEBEFFFFFFD1D1D1AFAEAEE0E0E0FFFFFFDADADAAFAEAEE1E1E1FFFFFFFF
            FFFFFFFFFFFFFFFFEAEAEAF8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E9E9FAFAF9FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F5F3DDDAB6ECE9C4ECE9C4FD
            FDF9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAEAEAF7F7F7FFFFFFFFFFFFFFFFFFFFFF
            FFD6D6D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFEFEFECDCDCEB2B2B1ADAEB0BABCBDFFFFFFFFFFFFFFFFFFF8F8F9CACB
            CCB3B4B4ADAEB0ADAEB0ADAEB0C6C7C8FFFFFFFFFFFFFFFFFFFEFEFED1D2D3B7
            B7B7B6B7B8FFFFFFFFFFFFFCFCF6ACA205ADA400ADA400F6F5E5FFFFFFFFFFFF
            EAE7BFE3DFA6E3DFA6E3DFA6E3DFA6E3DFA6E3DFA6E3DFA6E5E1AEECE9C5FCFC
            F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFDECEBC6E4E0ABECE9C3FDFCF9FF
            FFFFFFFFFFFFFFFFFFFFFFFEFEFCE6E3B1E6E3B1EDEAC7FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFF7F6E6E8E7BAE6E3B1E6E3B1FFFFFFFFFFFFF3F3F41B1E231619
            20171A20171A203F4045FFFFFFFDFDFD8183850F1218161920171A20171A2017
            1A20171A205C5D61FFFFFFFFFFFF9FA0A10F1218161920171A20313337FFFFFF
            FFFFFFFCFCF6ACA205ADA400ADA400F6F5E5FFFFFFFFFFFFC2BA43ADA400ADA4
            00ADA400ADA400ADA400ADA400ADA400ADA400ADA400ABA104F9F8EFFFFFFFFF
            FFFFFFFEFCCDC869ACA104ADA400ADA400ADA400ACA103C8C156FEFEFBFFFFFF
            FFFFFFFAFAEFABA100ADA400C2BA45FFFFFFFFFFFFFFFFFFFFFFFFC1B944ACA3
            00ADA400ADA400ADA400FFFFFFFFFFFF838586171A20181B2111151B3C3E4160
            6265FFFFFF71737616191F181B210F13193034383D3F443D40443D4044797A7B
            FFFFFFBEBFC113161C181B2114181D1C20244D4F4CEEECCBEEECCBEDEAC7BCB5
            36BCB635BCB635E5E2B0E8E6BBE8E6BBC8C45ABDB63FBDB63FBDB63FBDB63FBD
            B63FBDB63FBDB640BBB438ADA400ADA400B9AF26FFFFFFFEFEFDBCB334ADA400
            ADA400ABA101AEA404ABA101ADA400ADA400B7AE26FEFEFAFFFFFFFAFAEFABA1
            00ADA400C2BA45FFFFFFFFFFFFFFFFFFF4F1DCACA300ADA400ADA400B0A608B1
            A811FFFFFFFFFFFF35383C181B2111151AE8E8E8FFFFFFFFFFFFF7F7F70E1217
            181B211C1F24F8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFD1F2227181B
            2115181EB6B7B9FFFFFFF2EFD4ACA300ADA400AFA409FEFDFAFFFFFFFFFFFFB1
            A810ADA400ADA400E5E2AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFB0A611ADA400AEA504FDFDF8D3CD78ACA300ADA400DCD791FFFFFFFFFF
            FFFFFFFFDFDC9EACA202ADA400CAC35BFFFFFFFAFAEFABA100ADA400C2BA45FF
            FFFFFFFFFFFFFFFFD4D07BADA400ADA400D3CD77FFFFFFFFFFFFFFFFFFFFFFFF
            282A2C181B2112151BF0F1F1FFFFFFFFFFFFB6B7B8181B21181B212F32368081
            857F80857F80857F80857F8085A6A7A8E6E6E613161C181B2124272CFFFFFFFF
            FFFFF2EFD4ACA300ADA400B0A709FEFDFAFFFFFFFFFFFFB1A810ADA400ADA400
            E5E2AFFFFFFFFFFFFFFEFEFEFDFDFBFBFAF3FBFAF3F9F9F0E9E6BCADA403ADA4
            00B0A707FEFDF9ACA202ADA400CDC767FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD4
            CF7BADA400ABA100FFFFFFFAFAEFABA100ADA400C2BA45FFFFFFFFFFFFFFFFFF
            CEC763ADA400ADA400E4E1ABFFFFFFFFFFFFFFFFFFFFFFFF292C31181B211216
            1BF1F1F2FFFFFFFFFFFF9A9C9E181B21181B21181B21181B21181B21181B2118
            1B21181B215D5E62DBDCDC11141A181B21494B4EFFFFFFFFFFFFF3F2DBB9B02A
            B9B02BBAB230D7D7D7D7D7D7D7D7D7BDB53EBEB53BBEB53BEBE8BEFFFFFFECE9
            C5ADA307ACA200ADA400ADA400ADA400ADA400ADA400ADA400CCC661FFFFFFAB
            A100ADA400EEECC9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F5E5ACA300ADA400
            FBFAF2FAFAEFABA100ADA400C2BA45FFFFFFFFFFFFFFFFFFCEC762ADA400ADA4
            00E7E4B5FFFFFFFFFFFFFFFFFFFFFFFF292C31181B2112161BF1F1F2FFFFFFFF
            FFFFABABAB181B21181B21171A2014171C14171C14171C14171C14171C5C5E62
            E2E3E313161C181B21373A3EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7171A
            1F13161B13161BE7E8EAFFFFFFFFFFFFFFFFFFFFFFFEA99E02ADA400ADA400B1
            A610B3A918B3A919B3A91ABBB32EE5E2AFFFFFFFFFFFFFABA100ADA400E5E1AD
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDEBCAADA400ABA000FFFFFEFAFAEFABA1
            00ADA400C2BA45FFFFFFFFFFFFFFFFFFCEC762ADA400ADA400E7E4B5FFFFFFFF
            FFFFFFFFFFFFFFFF292C31181B2112161BF1F1F2FFFFFFFFFFFFDFDFDF14171D
            181B213C3E42F1F1F2F0F0F1F0F0F1F0F0F1F0F0F1F5F5F5F8F8F8171A1F181B
            210C0F15FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7171A1F181B21181B21E7
            E8E9FFFFFFFFFFFFFFFFFFF3F1D7ADA400ADA400B8B023FEFEFDFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB3AA15ADA400B8B023FEFEFBFFFFFFFFFF
            FFFFFFFFFFFFFFBCB330ADA400AFA405FFFFFFFAFAEFABA100ADA400C2BA45FF
            FFFFFFFFFFFFFFFFCEC762ADA400ADA400E7E4B5FFFFFFFFFFFFEEEEEEE8E8E8
            272A2F181B2113171CDFDFDFE8E8E8ECECECFFFFFF111319181B21171A20ADAE
            B0E2E2E3E8E8E8E8E8E8E8E8E8EFEFEFFFFFFF4D4F52181B21181B2147494ECF
            D0D1E3E3E4E4E4E5E4E4E5DEDFDF27292D272B2F272B2FDADADAE6E7E7E6E7E7
            F5F5F5F5F3E0ADA400ADA400B0A70FF1EFD4F2F0D6F2F0D6F1F0D4F1F0D4F1F0
            D4F7F5E5FFFFFFF1EFD3ACA202ADA400AEA503DED999EDEAC5E1DEA1B0A70AAD
            A400ACA300E8E5B7F1EFD4EEEDCCACA200ADA400BFB73BF1EFD4F1EFD4FAF9EE
            CEC762ADA400ADA400DDD996F1EFD4F1EFD4595B5E15181E181B21181B21181B
            2115181E15181E3D3E43FFFFFFC7C7C90E1117181B2115191E15181E15181E15
            181E15181E5B5C5FFFFFFFF0F0F10A0E13181B21181B2115181E15181E15181E
            15181E16191EFAFAFAFFFFFFFFFFFF25292D15181E15181E9D9EA0FFFFFFABA0
            00ADA400ADA400ACA300ACA300ACA300ACA300ACA300ACA300CAC55CFFFFFFFF
            FFFFE4E1ADABA200ADA400ADA400ACA300ADA400ADA400ABA200DEDA99D2CD73
            ACA300ACA300ADA400ADA400ADA400ACA300ACA300E0DD9ECEC762ADA400ADA4
            00ADA400ACA300ACA3005A5D6015181D181B21181B21181B2116191E15181D3E
            4044FFFFFFFFFFFFE0E0E1494C4F212429171A1F15181D15181D15181D5C5F62
            FFFFFFFFFFFFF0F1F16B6D70282C301B1E2215181D15181D15181D161A1FF9F9
            F9FFFFFFFFFFFF272B2F181B21181B219E9FA2FFFFFFF9F9EDBEB83DAFA60BAD
            A403ADA403ADA403ADA403ADA403ADA403CBC55EFFFFFFFFFFFFFFFFFFFAF9EF
            CDC865B5AB1BAEA406B3AA18CBC562F9F7E9FFFFFFD2CD75AFA605AFA605ADA4
            00ADA400ADA400AFA605AFA605E0DCA0CEC762ADA400ADA400AEA502AFA605AF
            A605FDFDFDFCFCFC292C31181B2112161BF0F0F0FCFCFCFDFDFDFFFFFFFFFFFF
            FFFFFFFFFFFFFEFEFEFCFCFCFCFCFCFCFCFCFCFCFCFDFDFDFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFDFDFDFCFCFCFCFCFCFCFCFCFCFCFCFFFFFFFFFFFFFFFFFF2A
            2C2F15191E15191EA0A0A0FFFFFFFFFFFFFFFFFFFEFEFDFEFEFCFEFEFCFEFEFC
            FEFEFCFEFEFCFEFEFCFEFEFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE
            FDFFFFFEFFFFFFFFFFFFFFFFFFFFFEFEFEFEFDFBFBF3ABA100ADA400BEB639FE
            FEFDFEFEFDFFFFFECEC762ADA400ADA400E6E3B3FEFEFDFEFEFDFFFFFFFFFFFF
            292C31181B2112161BF1F1F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFDFDF8AAA000ADA400ADA400C4BC4BC7C152ECE9C1
            CEC762ADA400ADA400E7E4B5FFFFFFFFFFFFFFFFFFFFFFFF292C31181B211216
            1BF1F1F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFBFB740ACA200ADA400ADA400ADA400E2DEA3CEC762ADA400ADA4
            00E7E4B5FFFFFFFFFFFFFFFFFFFFFFFF67696B5A5C60585A5EF5F5F5FFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE
            FCE6E3B1CBC55DC5C34EC5C34EEAE7BEDDD893C5C34EC5C34EEEECCAFFFFFFFF
            FFFF}
        end
        object Memo15: TfrxMemoView
          Left = 147.401670000000000000
          Top = 75.590600000000000000
          Width = 385.512060000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'CLIENTE')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 532.913730000000000000
          Top = 75.590600000000000000
          Width = 132.283550000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'VALOR TRANSFERIDO')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo56: TfrxMemoView
          Left = 64.252010000000000000
          Top = 75.590600000000000000
          Width = 83.149660000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'CONTRATO')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo71: TfrxMemoView
          Left = 684.094930000000000000
          Top = 75.590600000000000000
          Width = 64.252010000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[SUBTITULO]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Height = 18.897650000000000000
        ParentFont = False
        Top = 170.078850000000000000
        Width = 793.701300000000000000
        OnBeforePrint = 'MasterData1OnBeforePrint'
        DataSet = frxDBTransferenciaLongoParaCurtoPrazo
        DataSetName = 'frxDBTransferenciaLongoParaCurtoPrazo'
        RowCount = 0
        object mmoZebrado: TfrxMemoView
          Left = 64.252010000000000000
          Width = 600.945270000000000000
          Height = 15.118120000000000000
          Color = clBtnFace
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Style = 'Style1'
        end
        object Memo1: TfrxMemoView
          Left = 64.252010000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          DataField = 'contrato'
          DataSet = frxDBTransferenciaLongoParaCurtoPrazo
          DataSetName = 'frxDBTransferenciaLongoParaCurtoPrazo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBTransferenciaLongoParaCurtoPrazo."contrato"]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 147.401670000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          DataField = 'codigocliente'
          DataSet = frxDBTransferenciaLongoParaCurtoPrazo
          DataSetName = 'frxDBTransferenciaLongoParaCurtoPrazo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBTransferenciaLongoParaCurtoPrazo."codigocliente"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 207.874150000000000000
          Width = 328.819110000000000000
          Height = 18.897650000000000000
          DataField = 'nomecliente'
          DataSet = frxDBTransferenciaLongoParaCurtoPrazo
          DataSetName = 'frxDBTransferenciaLongoParaCurtoPrazo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBTransferenciaLongoParaCurtoPrazo."nomecliente"]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 536.693260000000000000
          Top = 0.063080000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          DataSet = frxDBTransferenciaLongoParaCurtoPrazo
          DataSetName = 'frxDBTransferenciaLongoParaCurtoPrazo'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBTransferenciaLongoParaCurtoPrazo."valor"]')
          ParentFont = False
        end
      end
      object FooterDataSituacao: TfrxFooter
        Height = 22.677180000000000000
        Top = 211.653680000000000000
        Width = 793.701300000000000000
        object Memo65: TfrxMemoView
          Left = 351.496290000000000000
          Top = 3.779530000000000000
          Width = 181.417440000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            'TOTAIS EM [DATASITUACAO]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo66: TfrxMemoView
          Left = 540.472790000000000000
          Top = 3.779530000000000000
          Width = 124.724490000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[SUM(<frxDBTransferenciaLongoParaCurtoPrazo."valor">,MasterData1' +
              ',1)]')
          ParentFont = False
        end
      end
    end
  end
end
