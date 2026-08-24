inherited frmFechamentoOperacoesUsuario: TfrmFechamentoOperacoesUsuario
  Left = 858
  Top = 190
  Width = 637
  Height = 586
  HorzScrollBar.Range = 601
  VertScrollBar.Range = 353
  ActiveControl = edtQuantidade
  Caption = 'Fechamento de Opera'#231#245'es'
  KeyPreview = False
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 120
    Top = 8
    Width = 381
    Height = 16
    Caption = 
      'Informe a quantidade produzida e as respectivas falhas e paradas' +
      ':'
  end
  object dbgOPeracoesOSPUsuarioFalhas: TtecDBGrid
    Left = 8
    Top = 96
    Width = 606
    Height = 193
    DataSource = dtmOperacoesOSP.dsrListaFalhas
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clBlack
    TitleFont.Height = -9
    TitleFont.Name = 'helvetica'
    TitleFont.Pitch = fpVariable
    TitleFont.Style = []
    OnDblClick = dbgOPeracoesOSPUsuarioFalhasDblClick
    OnKeyDown = dbgOPeracoesOSPUsuarioFalhasKeyDown
    RowWrap = 60
    Large = False
    DoubleRowColor = False
    MsgDelete = 'desta falha'
    TitleMinHeight = 100
    CellHeights = 100
    StrippedColor = 16054260
    CanDelete = True
    CanNotInsertFromGrid = False
    PostOnEnter = False
    PostOnSetUpDown = False
    DenySort = False
    DefaultRowHeight = 19
    ExibirNumerodaLinha = False
    NaoAtribuirDadosaTabelaaoDigitar = False
    ShowWhenFieldInvisible = False
    CanClickWhenEditing = False
    Columns = <
      item
        Expanded = False
        FieldName = 'codigo'
        Title.Alignment = taCenter
        Title.Caption = 'C'#211'DIGO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descricao'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = 'DESCRI'#199#195'O DA FALHA'
        Width = 340
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'perdatotal'
        Title.Alignment = taCenter
        Title.Caption = 'PERDA TOTAL'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'quantidade'
        Title.Alignment = taCenter
        Title.Caption = 'QUANTIDADE'
        Width = 75
        Visible = True
      end>
  end
  object gbxHoraTermino: TGroupBox
    Left = 128
    Top = 32
    Width = 129
    Height = 57
    Caption = 'HORA T'#201'RMINO'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -9
    Font.Name = 'helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object lblHoraTermino: TLabel
      Left = 13
      Top = 20
      Width = 7
      Height = 28
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -25
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
    end
  end
  object gbxQtidadeProduzida: TGroupBox
    Left = 264
    Top = 32
    Width = 161
    Height = 57
    Caption = 'QUANTIDADE PRODUZIDA'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -9
    Font.Name = 'helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object edtQuantidade: TDBEditNumero
      Left = 7
      Top = 14
      Width = 148
      Height = 36
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -25
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      MaxLength = -1
      ParentFont = False
      TabOrder = 0
      Text = '1.000'
      OnKeyDown = edtQuantidadeKeyDown
      Mascara = False
      TipoMascara = tmGERAL
      NrDecimal = 0
      Decimais = False
      Negativo = False
      Tamanho = 9
      DataField = 'quantidade'
      DataSource = dtmOperacoesOSP.dsrOperacoesOSPUsuario
    end
  end
  object bbnOK: TBitBtn
    Left = 180
    Top = 518
    Width = 88
    Height = 25
    Caption = '&OK'
    TabOrder = 4
    OnClick = bbnOKClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      04000000000068010000120B0000120B00001000000010000000000000000000
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
    Left = 278
    Top = 518
    Width = 88
    Height = 25
    Caption = '&Cancelar'
    TabOrder = 3
    Kind = bkCancel
  end
  object dbgOPeracoesOSPUsuarioParadas: TtecDBGrid
    Left = 8
    Top = 296
    Width = 609
    Height = 212
    DataSource = dtmOperacoesOSP.dsrOperacoesOSPUsuarioParadas
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clBlack
    TitleFont.Height = -9
    TitleFont.Name = 'helvetica'
    TitleFont.Pitch = fpVariable
    TitleFont.Style = []
    OnDblClick = dbgOPeracoesOSPUsuarioParadasDblClick
    OnKeyDown = dbgOPeracoesOSPUsuarioParadasKeyDown
    RowWrap = 60
    Large = False
    DoubleRowColor = False
    TitleMinHeight = 100
    CellHeights = 100
    StrippedColor = 16054260
    CanDelete = True
    CanNotInsertFromGrid = False
    PostOnEnter = False
    PostOnSetUpDown = False
    DenySort = True
    DefaultRowHeight = 19
    ExibirNumerodaLinha = False
    NaoAtribuirDadosaTabelaaoDigitar = False
    ShowWhenFieldInvisible = False
    CanClickWhenEditing = False
    Columns = <
      item
        Expanded = False
        FieldName = 'codigoparada'
        Title.Alignment = taCenter
        Title.Caption = 'PARADA'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descricao'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = 'DESCRI'#199#195'O DA PARADA'
        Width = 365
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bloqueiamaquina'
        ReadOnly = True
        Title.Caption = 'BLOQUEIA A M'#193'QUINA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tempoparada'
        Title.Alignment = taCenter
        Title.Caption = 'TEMPO'
        Width = 50
        Visible = True
      end>
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 56
    Top = 48
  end
end
