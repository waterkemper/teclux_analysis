inherited frrmLerProdutosArquivo: TfrrmLerProdutosArquivo
  Left = 251
  Top = 145
  ActiveControl = fraConsultaVendedor.edfCodigo
  Caption = 'Leitura de produtos a partir de um arquivo'
  ClientHeight = 602
  ClientWidth = 1027
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  OldCreateOrder = False
  OnKeyUp = FormKeyUp
  PixelsPerInch = 96
  TextHeight = 13
  object pnlBottom: TPanel
    Left = 0
    Top = 569
    Width = 1027
    Height = 33
    Align = alBottom
    TabOrder = 2
    object bbnOK: TBitBtn
      Left = 455
      Top = 4
      Width = 80
      Height = 25
      Caption = '&OK'
      TabOrder = 0
      TabStop = False
      OnClick = bbnOKClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object bbnCancelar: TBitBtn
      Left = 542
      Top = 4
      Width = 80
      Height = 25
      Caption = '&Cancelar'
      TabOrder = 1
      TabStop = False
      Kind = bkCancel
    end
  end
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 1027
    Height = 153
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object gbxNomedoArquivo: TGroupBox
      Left = 0
      Top = 74
      Width = 1027
      Height = 42
      Align = alTop
      Caption = 'NOME DO ARQUIVO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'HELVETICA'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      object sbnNomedoArquivo: TSpeedButton
        Left = 759
        Top = 13
        Width = 123
        Height = 24
        Hint = 'Selecione a planilha contendo Produto, Descri'#231#227'o e Quantidade'
        Caption = '&Planilha XLS'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          55555555FFFFFFFFFF55555000000000055555577777777775F55500B8B8B8B8
          B05555775F555555575F550F0B8B8B8B8B05557F75F555555575550BF0B8B8B8
          B8B0557F575FFFFFFFF7550FBF0000000000557F557777777777500BFBFBFBFB
          0555577F555555557F550B0FBFBFBFBF05557F7F555555FF75550F0BFBFBF000
          55557F75F555577755550BF0BFBF0B0555557F575FFF757F55550FB700007F05
          55557F557777557F55550BFBFBFBFB0555557F555555557F55550FBFBFBFBF05
          55557FFFFFFFFF7555550000000000555555777777777755555550FBFB055555
          5555575FFF755555555557000075555555555577775555555555}
        NumGlyphs = 2
        ParentFont = False
        OnClick = sbnNomedoArquivoClick
      end
      object edtNomedoArquivo: TEditTexto
        Left = 3
        Top = 15
        Width = 750
        Height = 22
        MaxLength = -1
        ReadOnly = True
        TabOrder = 0
        CharCasenoDefault = False
        Alignment = taLeftJustify
      end
    end
    object gbxVendedor: TGroupBox
      Left = 0
      Top = 0
      Width = 1027
      Height = 36
      Align = alTop
      Caption = ' VENDEDOR '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      inline fraConsultaVendedor: TfraConsultaCodigo
        Left = 2
        Top = 10
        Width = 572
        Height = 23
        HorzScrollBar.Range = 350
        VertScrollBar.Range = 23
        AutoScroll = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        inherited dtxDescricao: TtecDBText
          Width = 483
          DataField = 'nome'
          DataSource = fraConsultaVendedor.dsrProcuraVendedores
        end
        inherited edfCodigo: TtecDBFindLookup
          DataField = 'Codigo'
          DataSource = fraConsultaVendedor.dsrProcuraVendedores
          Group = 'BAnco'
          MaxLength = 8
          OnFound = nil
          Operacao = opPESQUISA
          Parameter = 'codigo'
          ActiveSetControls = False
          DenyInsert = True
          NoSetControls = <>
          SetControls = <>
        end
      end
    end
    object gbxCliente: TGroupBox
      Left = 0
      Top = 36
      Width = 1027
      Height = 38
      Align = alTop
      Caption = ' CLIENTE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      inline fraConsultaCliente: TfraConsultaCodigo
        Left = 2
        Top = 10
        Width = 573
        Height = 21
        HorzScrollBar.Range = 504
        HorzScrollBar.Visible = False
        VertScrollBar.Range = 23
        VertScrollBar.Visible = False
        AutoScroll = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        inherited dtxDescricao: TtecDBText
          Width = 484
          DataField = 'nome'
          DataSource = fraConsultaCliente.dsrProcuraCliente
        end
        inherited edfCodigo: TtecDBFindLookup
          DataField = 'codigo'
          DataSource = fraConsultaCliente.dsrProcuraCliente
          Group = 'Cliente'
          MaxLength = 9
          OnFound = nil
          Operacao = opPESQUISA
          Parameter = 'codigo'
          ActiveSetControls = False
          DenyInsert = True
          NoSetControls = <>
          SetControls = <>
        end
      end
    end
  end
  object pnlLeft: TPanel
    Left = 0
    Top = 153
    Width = 281
    Height = 416
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 1
    object dbgDocumentos: TtecDBGrid
      Left = 0
      Top = 0
      Width = 281
      Height = 311
      Align = alClient
      DataSource = dsrDocumento
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Pitch = fpVariable
      TitleFont.Style = []
      OnDblClick = dbgListaProdutosdoClienteDblClick
      OnKeyDown = dbgListaProdutosdoClienteKeyDown
      RowWrap = 60
      Large = False
      DoubleRowColor = False
      TitleMinHeight = 100
      CellHeights = 100
      StrippedColor = 16054260
      CanDelete = False
      CanNotInsertFromGrid = True
      PostOnEnter = False
      PostOnSetUpDown = False
      DenySort = False
      DefaultRowHeight = 17
      ExibirNumerodaLinha = False
      NaoAtribuirDadosaTabelaaoDigitar = False
      ShowWhenFieldInvisible = False
      CanClickWhenEditing = False
      Columns = <
        item
          Expanded = False
          FieldName = 'documento'
          Title.Alignment = taCenter
          Title.Caption = 'ORDEM DE COMPRA'
          Width = 117
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cliente'
          Title.Alignment = taCenter
          Title.Caption = 'CLIENTE'
          Width = 124
          Visible = True
        end>
    end
    object gbxObservacoes: TGroupBox
      Left = 0
      Top = 311
      Width = 281
      Height = 105
      Align = alBottom
      Caption = 'OBSERVA'#199#213'ES'
      TabOrder = 1
      object mmoObservacoes: TtecDBMemo
        Left = 2
        Top = 15
        Width = 277
        Height = 88
        Align = alClient
        DataField = 'observacoes'
        DataSource = dsrDocumento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
    end
  end
  object pnlListaProdutosdoCliente: TPanel
    Left = 281
    Top = 153
    Width = 746
    Height = 416
    Align = alClient
    TabOrder = 3
    object pnBootomlListaProdutosdoCliente: TPanel
      Left = 1
      Top = 399
      Width = 744
      Height = 16
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 0
    end
    object dbgListaProdutosdoCliente: TtecDBGrid
      Left = 1
      Top = 1
      Width = 744
      Height = 398
      Align = alClient
      DataSource = dsrProdutos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Pitch = fpVariable
      TitleFont.Style = []
      OnDblClick = dbgListaProdutosdoClienteDblClick
      OnKeyDown = dbgListaProdutosdoClienteKeyDown
      RowWrap = 60
      Large = False
      DoubleRowColor = False
      TitleMinHeight = 100
      CellHeights = 100
      StrippedColor = 16054260
      CanDelete = False
      CanNotInsertFromGrid = True
      PostOnEnter = False
      PostOnSetUpDown = False
      DenySort = False
      DefaultRowHeight = 17
      ExibirNumerodaLinha = False
      NaoAtribuirDadosaTabelaaoDigitar = False
      ShowWhenFieldInvisible = False
      CanClickWhenEditing = False
      Columns = <
        item
          Expanded = False
          FieldName = 'produtovisual'
          Title.Alignment = taCenter
          Title.Caption = 'PRODUTO'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -7
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Pitch = fpVariable
          Title.Font.Style = []
          Width = 156
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'produtocliente'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'PRODUTO NO CLIENTE'
          Width = 133
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'descricaoprodutocliente'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'DESCRI'#199#195'O'
          Width = 337
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'quantidadeprodutocliente'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'QUANTIDADE'
          Width = 79
          Visible = True
        end>
    end
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '*.xls;*.xlsx'
    Left = 664
    Top = 120
  end
  object dsrProdutos: TtecDataSource
    DataSet = qryProdutos
    Left = 544
    Top = 120
  end
  object qryProdutos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkFields = 'documento=documento'
    LinkOptions = [loAlwaysResync]
    MasterSource = dsrDocumento
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select cast(null as varchar(30)) as documento,'
      '       cast(null as bigint) as produto,'
      '       cast(null as varchar(30)) as produtovisual,'
      '       cast(null as varchar(100)) as produtocliente,'
      '       cast(null as varchar(200)) as descricaoprodutocliente,'
      '       cast(null as numeric(11,3)) as quantidadeprodutocliente')
    RequestLive = True
    Left = 592
    Top = 120
    object qryProdutosdocumento: TStringField
      FieldName = 'documento'
      Size = 30
    end
    object qryProdutosproduto: TLargeintField
      DisplayLabel = 'Produto'
      FieldName = 'produto'
      Required = True
    end
    object qryProdutosprodutovisual: TStringField
      DisplayLabel = 'Produto Visual'
      FieldName = 'produtovisual'
      Required = True
      Size = 30
    end
    object qryProdutosprodutocliente: TStringField
      FieldName = 'produtocliente'
      Size = 100
    end
    object qryProdutosdescricaoprodutocliente: TStringField
      FieldName = 'descricaoprodutocliente'
      Size = 200
    end
    object qryProdutosquantidadeprodutocliente: TFloatField
      FieldName = 'quantidadeprodutocliente'
    end
  end
  object qryClientesProdutos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'ListadeProdutos'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'select cp.cliente,'
      '       cp.tipocliente,'
      '       cp.produto,'
      '       p.codigovisual as produtovisual,'
      '       cp.produto_cliente,'
      '       cp.processamento'
      ''
      'from clientesprodutos cp'
      '     join produtos p'
      '     on cp.produto = p.codigo'
      ''
      'where cp.cliente = :cliente'
      '  and cp.tipocliente = :tipocliente'
      '  %ListadeProdutos'
      'order by (cp.processamento is NULL), cp.processamento desc'
      ''
      ''
      ''
      ''
      '/*'
      ''
      ':FilialBase'
      ''
      '*/'
      ''
      '')
    RequestLive = True
    Left = 592
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cliente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tipocliente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FilialBase'
        ParamType = ptUnknown
      end>
    object qryClientesProdutoscliente: TIntegerField
      FieldName = 'cliente'
      Required = True
      DisplayFormat = '0'
    end
    object qryClientesProdutostipocliente: TStringField
      FieldName = 'tipocliente'
      Required = True
      Size = 1
    end
    object qryClientesProdutosproduto: TLargeintField
      FieldName = 'produto'
      Required = True
    end
    object qryClientesProdutosproduto_cliente: TStringField
      FieldName = 'produto_cliente'
      Size = 30
    end
    object qryClientesProdutosprodutovisual: TStringField
      FieldName = 'produtovisual'
      Size = 30
    end
    object qryClientesProdutosprocessamento: TDateTimeField
      FieldName = 'processamento'
    end
  end
  object dsrDocumento: TtecDataSource
    DataSet = qryDocumento
    Left = 784
    Top = 128
  end
  object qryDocumento: TtecQuery
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
      'select cast(null as varchar(30)) as documento,'
      '       cast(null as varchar(100)) as cliente,'
      '       /*'
      '       CAST(null as varchar(100)) as rua,'
      '       cast(null as varchar(100)) as complemento,'
      '       cast(null as integer) as numero,'
      '       cast(null as integer) as bairro,'
      '       cast(null as integer) as cidade,'
      '       cast(null as varchar(2)) as estado,'
      '       cast(null as integer) as cep'
      '       */'
      '       cast(null as varchar(300)) as observacoes'
      ''
      ''
      '')
    RequestLive = True
    Left = 832
    Top = 128
    object qryDocumentodocumento: TStringField
      FieldName = 'documento'
      Size = 30
    end
    object qryDocumentocliente: TStringField
      FieldName = 'cliente'
      Size = 100
    end
    object qryDocumentoobservacoes: TStringField
      FieldName = 'observacoes'
      Size = 300
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 936
    Top = 34
  end
end
