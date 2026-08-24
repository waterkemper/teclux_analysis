inherited frmListaOperacoes: TfrmListaOperacoes
  Left = 554
  Top = 214
  ActiveControl = dbgListaOperacoes
  Caption = 'Lista de Opera'#231#245'es'
  ClientHeight = 310
  ClientWidth = 435
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 16
  object dbgListaOperacoes: TtecDBGrid
    Left = 0
    Top = 0
    Width = 435
    Height = 281
    Align = alTop
    DataSource = dsrListaOperacoes
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clBlack
    TitleFont.Height = -13
    TitleFont.Name = 'helvetica'
    TitleFont.Pitch = fpVariable
    TitleFont.Style = []
    OnDblClick = dbgListaOperacoesDblClick
    OnKeyDown = dbgListaOperacoesKeyDown
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
        FieldName = 'nome'
        Title.Alignment = taCenter
        Title.Caption = 'OPERA'#199#195'O'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -12
        Title.Font.Name = 'helvetica'
        Title.Font.Pitch = fpVariable
        Title.Font.Style = []
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'c01'
        Title.Alignment = taCenter
        Title.Caption = 'C01'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -12
        Title.Font.Name = 'helvetica'
        Title.Font.Pitch = fpVariable
        Title.Font.Style = []
        Width = 35
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'c02'
        Title.Alignment = taCenter
        Title.Caption = 'C02'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -12
        Title.Font.Name = 'helvetica'
        Title.Font.Pitch = fpVariable
        Title.Font.Style = []
        Width = 35
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'c03'
        Title.Alignment = taCenter
        Title.Caption = 'C03'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -12
        Title.Font.Name = 'helvetica'
        Title.Font.Pitch = fpVariable
        Title.Font.Style = []
        Width = 35
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'selecionar'
        Title.Alignment = taCenter
        Title.Caption = 'SELECIONAR'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -12
        Title.Font.Name = 'helvetica'
        Title.Font.Pitch = fpVariable
        Title.Font.Style = []
        Width = 90
        Visible = True
      end>
  end
  object bbnOK: TBitBtn
    Left = 120
    Top = 284
    Width = 81
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 2
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
    Left = 200
    Top = 284
    Width = 81
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 1
    Kind = bkCancel
  end
  object dsrListaOperacoes: TtecDataSource
    DataSet = dtmImprimeOsp.qryOperacoesSetup
    Left = 64
    Top = 32
  end
end
