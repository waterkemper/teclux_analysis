inherited frmListaOperacoesUsuario: TfrmListaOperacoesUsuario
<<<<<<< fmlistaoperacoesusuario.dfm
  Left = 250
  Top = 160
  Width = 1040
  Height = 361
=======
  Left = 241
  Top = 182
  Width = 1039
  Height = 348
>>>>>>> 1.8
  HorzScrollBar.Range = 439
  VertScrollBar.Range = 185
  ActiveControl = dbgListaOperacaoMaquinaUtilizada
  AutoScroll = False
  Caption = 'Lista de Opera'#231#245'es'
  PixelsPerInch = 96
  TextHeight = 16
  object btnOK: TBitBtn
    Left = 418
    Top = 285
    Width = 75
    Height = 25
    Caption = 'OK'
<<<<<<< fmlistaoperacoesusuario.dfm
    TabOrder = 5
    OnClick = btnOKClick
=======
    TabOrder = 1
>>>>>>> 1.8
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
  object btncancelar: TBitBtn
    Left = 506
    Top = 285
    Width = 89
    Height = 25
    Caption = 'Cancelar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Pitch = fpVariable
    Font.Style = [fsBold]
    ParentFont = False
<<<<<<< fmlistaoperacoesusuario.dfm
    TabOrder = 4
=======
    TabOrder = 0
>>>>>>> 1.8
    Kind = bkCancel
  end
  object StaticText1: TStaticText
    Left = 4
    Top = 0
    Width = 221
    Height = 20
<<<<<<< fmlistaoperacoesusuario.dfm
    Caption = 
      'Selecione a opera'#231#227'o em andamento e liberada ao usu'#225'rio da lista' +
      ' abaixo:'
    TabOrder = 0
  end
  object dbgOperacoes: TtecDBGrid
    Left = 3
    Top = 21
    Width = 345
    Height = 252
    DataSource = dtmOperacoesOSP.dsrListaOperacaoLiberada
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'helvetica'
    Font.Pitch = fpVariable
    Font.Style = [fsBold]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clBlack
    TitleFont.Height = -13
    TitleFont.Name = 'helvetica'
    TitleFont.Pitch = fpVariable
    TitleFont.Style = []
    OnDrawColumnCell = dbgOperacoesDrawColumnCell
    OnKeyDown = dbgOperacoesKeyDown
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
        Title.Font.Height = -11
        Title.Font.Name = 'helvetica'
        Title.Font.Pitch = fpVariable
        Title.Font.Style = []
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'c1'
        Title.Alignment = taCenter
        Title.Caption = 'C1'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -11
        Title.Font.Name = 'helvetica'
        Title.Font.Pitch = fpVariable
        Title.Font.Style = []
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'c2'
        Title.Alignment = taCenter
        Title.Caption = 'C2'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -11
        Title.Font.Name = 'helvetica'
        Title.Font.Pitch = fpVariable
        Title.Font.Style = []
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'c3'
        Title.Alignment = taCenter
        Title.Caption = 'C3'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -11
        Title.Font.Name = 'helvetica'
        Title.Font.Pitch = fpVariable
        Title.Font.Style = []
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tipooperacao'
        Title.Alignment = taCenter
        Title.Caption = 'TIPO'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -9
        Title.Font.Name = 'helvetica'
        Title.Font.Pitch = fpVariable
        Title.Font.Style = []
        Width = 110
        Visible = True
      end>
=======
    Caption = 'Selecione a opera'#231#227'o da lista abaixo:'
    TabOrder = 2
>>>>>>> 1.8
  end
  object gbxListaOperacaoMaquinaLiberada: TGroupBox
    Left = 352
    Top = 20
    Width = 667
    Height = 134
    Caption = ' M'#193'QUINAS DISPON'#205'VEIS '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'helvetica'
    Font.Pitch = fpVariable
    Font.Style = [fsBold]
    ParentFont = False
<<<<<<< fmlistaoperacoesusuario.dfm
    TabOrder = 2
=======
    TabOrder = 3
>>>>>>> 1.8
    object dbgListaOperacaoMaquinaLiberada: TtecDBGrid
      Left = 2
      Top = 16
      Width = 663
      Height = 116
      Align = alClient
      DataSource = dtmOperacoesOSP.dsrListaOperacaoMaquinaLiberada
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = [fsBold]
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clBlack
      TitleFont.Height = -13
      TitleFont.Name = 'helvetica'
      TitleFont.Pitch = fpVariable
      TitleFont.Style = []
      OnDrawColumnCell = dbgListaOperacaoMaquinaLiberadaDrawColumnCell
      OnKeyDown = dbgListaOperacaoMaquinaLiberadaKeyDown
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
          FieldName = 'maquina'
          Title.Alignment = taCenter
          Title.Caption = 'C'#211'DIGO'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -9
          Title.Font.Name = 'helvetica'
          Title.Font.Pitch = fpVariable
          Title.Font.Style = []
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'descricaomaquina'
          Title.Alignment = taCenter
          Title.Caption = 'DESCRI'#199#195'O'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -9
          Title.Font.Name = 'helvetica'
          Title.Font.Pitch = fpVariable
          Title.Font.Style = []
          Width = 565
          Visible = True
        end>
    end
  end
  object gbxListaOperacaoMaquinaUtilizada: TGroupBox
    Left = 352
    Top = 156
    Width = 666
    Height = 121
    Caption = ' M'#193'QUINAS EM USO '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'helvetica'
    Font.Pitch = fpVariable
    Font.Style = [fsBold]
    ParentFont = False
<<<<<<< fmlistaoperacoesusuario.dfm
    TabOrder = 3
=======
    TabOrder = 4
>>>>>>> 1.8
    object dbgListaOperacaoMaquinaUtilizada: TtecDBGrid
      Left = 2
      Top = 16
      Width = 662
      Height = 103
      TabStop = False
      Align = alClient
      DataSource = dtmOperacoesOSP.dsrListaOperacaoMaquinaUtilizada
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clBlack
      TitleFont.Height = -13
      TitleFont.Name = 'helvetica'
      TitleFont.Pitch = fpVariable
      TitleFont.Style = []
      OnKeyDown = dbgOperacoesKeyDown
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
          FieldName = 'maquina'
          Title.Alignment = taCenter
          Title.Caption = 'C'#211'DIGO'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -9
          Title.Font.Name = 'helvetica'
          Title.Font.Pitch = fpVariable
          Title.Font.Style = []
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'descricaomaquina'
          Title.Alignment = taCenter
          Title.Caption = 'DESCRI'#199#195'O'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -9
          Title.Font.Name = 'helvetica'
          Title.Font.Pitch = fpVariable
          Title.Font.Style = []
          Width = 242
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'osp'
          Title.Alignment = taCenter
          Title.Caption = 'OSP'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -9
          Title.Font.Name = 'helvetica'
          Title.Font.Pitch = fpVariable
          Title.Font.Style = []
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'usuario'
          Title.Alignment = taCenter
          Title.Caption = 'USU'#193'RIO'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -9
          Title.Font.Name = 'helvetica'
          Title.Font.Pitch = fpVariable
          Title.Font.Style = []
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nomeusuario'
          Title.Alignment = taCenter
          Title.Caption = 'NOME'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -9
          Title.Font.Name = 'helvetica'
          Title.Font.Pitch = fpVariable
          Title.Font.Style = []
          Width = 200
          Visible = True
        end>
    end
  end
  object gbxOperacoes: TGroupBox
    Left = 3
    Top = 20
    Width = 344
    Height = 258
    Caption = ' OPERA'#199#213'ES HABILITADAS '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'helvetica'
    Font.Pitch = fpVariable
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    object dbgOperacoes: TtecDBGrid
      Left = 2
      Top = 16
      Width = 340
      Height = 240
      Align = alClient
      DataSource = dtmOperacoesOSP.dsrListaOperacaoLiberada
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clBlack
      TitleFont.Height = -13
      TitleFont.Name = 'helvetica'
      TitleFont.Pitch = fpVariable
      TitleFont.Style = []
      OnKeyDown = dbgOperacoesKeyDown
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
          Title.Caption = 'NOME'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -9
          Title.Font.Name = 'helvetica'
          Title.Font.Pitch = fpVariable
          Title.Font.Style = []
          Width = 100
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'c1'
          Title.Alignment = taCenter
          Title.Caption = 'C1'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -9
          Title.Font.Name = 'helvetica'
          Title.Font.Pitch = fpVariable
          Title.Font.Style = []
          Width = 30
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'c2'
          Title.Alignment = taCenter
          Title.Caption = 'C2'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -9
          Title.Font.Name = 'helvetica'
          Title.Font.Pitch = fpVariable
          Title.Font.Style = []
          Width = 30
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'c3'
          Title.Alignment = taCenter
          Title.Caption = 'C3'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -9
          Title.Font.Name = 'helvetica'
          Title.Font.Pitch = fpVariable
          Title.Font.Style = []
          Width = 30
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'tipooperacao'
          Title.Alignment = taCenter
          Title.Caption = 'TIPO'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -9
          Title.Font.Name = 'helvetica'
          Title.Font.Pitch = fpVariable
          Title.Font.Style = []
          Width = 110
          Visible = True
        end>
    end
  end
end
