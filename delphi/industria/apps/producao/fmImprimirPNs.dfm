inherited frmImprimirPNs: TfrmImprimirPNs
  Left = 174
  Top = 163
  ActiveControl = tecDBGrid1
  Caption = 'Impress'#227'o de PN'#180's'
  ClientHeight = 472
  ClientWidth = 1410
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBarra: TToolBar
    Width = 1410
    Height = 45
    ButtonHeight = 38
    Caption = #39
    Constraints.MaxHeight = 45
    Constraints.MinHeight = 45
    inherited sbnImprimir: TSpeedButton
      Height = 38
      Caption = 'Excell F7'
    end
    inherited sbnAjuda: TSpeedButton
      Height = 38
      Constraints.MaxHeight = 0
      Constraints.MinHeight = 0
    end
    inherited bvlBotoes: TBevel
      Height = 38
    end
    object gbxSelecionar: TGroupBox
      Left = 153
      Top = 2
      Width = 121
      Height = 38
      Caption = 'SELECIONAR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Helvetica'
      Font.Pitch = fpVariable
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object cbbOpcao: TComboBox
        Left = 4
        Top = 13
        Width = 113
        Height = 23
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ItemHeight = 15
        ParentFont = False
        TabOrder = 0
        Text = 'ATIVOS'
        OnSelect = cbbOpcaoSelect
        Items.Strings = (
          'ATIVOS'
          'INATIVOS'
          'AMBOS')
      end
    end
  end
  inherited pnlFundoJanela: TPanel
    Top = 472
    Width = 1410
    Height = 0
  end
  object tecDBGrid1: TtecDBGrid
    Left = 0
    Top = 45
    Width = 1410
    Height = 427
    Align = alClient
    DataSource = dsrImprimirPNs
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -9
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Pitch = fpVariable
    TitleFont.Style = []
    RowWrap = 60
    Large = False
    DoubleRowColor = False
    TitleMinHeight = 100
    CellHeights = 100
    StrippedColor = 16054260
    CanDelete = False
    PostOnEnter = False
    DenySort = False
    DefaultRowHeight = 19
    Columns = <
      item
        Expanded = False
        FieldName = 'pn'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -9
        Title.Font.Name = 'Helvetica'
        Title.Font.Pitch = fpVariable
        Title.Font.Style = []
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'origem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -9
        Title.Font.Name = 'Helvetica'
        Title.Font.Pitch = fpVariable
        Title.Font.Style = []
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'revisao'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -9
        Title.Font.Name = 'Helvetica'
        Title.Font.Pitch = fpVariable
        Title.Font.Style = []
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'codigovisual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -9
        Title.Font.Name = 'Helvetica'
        Title.Font.Pitch = fpVariable
        Title.Font.Style = []
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descricaoproduto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = 'DESCRI'#199#195'O'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -9
        Title.Font.Name = 'Helvetica'
        Title.Font.Pitch = fpVariable
        Title.Font.Style = []
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -9
        Title.Font.Name = 'Helvetica'
        Title.Font.Pitch = fpVariable
        Title.Font.Style = []
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'produto_cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -9
        Title.Font.Name = 'Helvetica'
        Title.Font.Pitch = fpVariable
        Title.Font.Style = []
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'finalidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -9
        Title.Font.Name = 'Helvetica'
        Title.Font.Pitch = fpVariable
        Title.Font.Style = []
        Width = 123
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'fluxograma'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -9
        Title.Font.Name = 'Helvetica'
        Title.Font.Pitch = fpVariable
        Title.Font.Style = []
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'inativo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -9
        Title.Font.Name = 'Helvetica'
        Title.Font.Pitch = fpVariable
        Title.Font.Style = []
        Visible = True
      end>
  end
  object GroupBox1: TGroupBox
    Left = 416
    Top = 8
    Width = 1
    Height = 49
    Caption = 'GroupBox1'
    TabOrder = 3
  end
  object qryImprimirPNs: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    OnFilterRecord = qryImprimirPNsFilterRecord
    Filtered = True
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      
        'SELECT cp.PN, cp.Origem, cp.Revisao, p.CodigoVisual, p.descricao' +
        ' as descricaoproduto,'
      '       CAST(CASE WHEN vf.Tipo = '#39'L'#39
      '                 THEN '#39'KRAH-ICE-BRASIL'#39
      '                 ELSE vf.Nome'
      '            END AS VARCHAR(20)) AS Cliente,'
      '       cp.Produto_Cliente,'
      '       cp.Finalidade,'
      '       cp.Fluxograma,'
      '       p.inativo'
      ''
      'FROM ClientesProdutos cp'
      
        '     JOIN vFornecedores vf ON cp.Cliente = vf.Codigo AND cp.Tipo' +
        'Cliente = vf.Tipo'
      '     JOIN Produtos p       ON cp.Produto = p.Codigo'
      ''
      'WHERE cp.PN IS NOT NULL'
      ''
      'ORDER BY cp.PN'
      '')
    RequestLive = False
    Left = 232
    Top = 40
    object qryImprimirPNspn: TStringField
      Alignment = taCenter
      DisplayLabel = 'PN'
      DisplayWidth = 6
      FieldName = 'pn'
      Size = 10
    end
    object qryImprimirPNsorigem: TStringField
      Alignment = taCenter
      DisplayLabel = 'ORIGEM'
      FieldName = 'origem'
      Size = 1
    end
    object qryImprimirPNsrevisao: TStringField
      Alignment = taCenter
      DisplayLabel = 'REVIS'#195'O'
      DisplayWidth = 5
      FieldName = 'revisao'
      Size = 5
    end
    object qryImprimirPNscodigovisual: TStringField
      DisplayLabel = 'C'#211'DIGO PRODUTO'
      FieldName = 'codigovisual'
      Size = 30
    end
    object qryImprimirPNsdescricaoproduto: TStringField
      FieldName = 'descricaoproduto'
      Size = 50
    end
    object qryImprimirPNscliente: TStringField
      DisplayLabel = 'CLIENTE'
      DisplayWidth = 25
      FieldName = 'cliente'
      Size = 25
    end
    object qryImprimirPNsproduto_cliente: TStringField
      DisplayLabel = 'C'#211'D. PRODUTO CLIENTE'
      FieldName = 'produto_cliente'
      Size = 30
    end
    object qryImprimirPNsfinalidade: TStringField
      DisplayLabel = 'FINALIDADE'
      FieldName = 'finalidade'
      Size = 30
    end
    object qryImprimirPNsfluxograma: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'FLUXOGRAMA'
      DisplayWidth = 4
      FieldName = 'fluxograma'
    end
    object qryImprimirPNsinativo: TDateField
      DisplayLabel = 'INATIVO'
      FieldName = 'inativo'
    end
  end
  object dsrImprimirPNs: TtecDataSource
    DataSet = qryImprimirPNs
    Left = 280
    Top = 24
  end
  object ExcelExport1: TExcelExport
    FontTitles.Charset = DEFAULT_CHARSET
    FontTitles.Color = clWindowText
    FontTitles.Height = -11
    FontTitles.Name = 'MS Sans Serif'
    FontTitles.Style = []
    OrientationTitles = 0
    FontData.Charset = DEFAULT_CHARSET
    FontData.Color = clWindowText
    FontData.Height = -11
    FontData.Name = 'MS Sans Serif'
    FontData.Style = []
    StyleColumnWidth = cwAutoFit
    ColumnWidth = 0
    WorksheetName = 'PNS'
    Dataset = qryImprimirPNs
    Left = 368
    Top = 16
  end
end
