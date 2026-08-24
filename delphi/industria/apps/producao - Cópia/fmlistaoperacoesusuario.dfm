inherited frmListaOperacoesUsuario: TfrmListaOperacoesUsuario
  Left = 655
  Top = 189
  Width = 1039
  Height = 440
  HorzScrollBar.Range = 439
  VertScrollBar.Range = 185
  ActiveControl = dbgOperacoes
  AutoScroll = False
  Caption = 'Lista de Opera'#231#245'es'
  PixelsPerInch = 96
  TextHeight = 16
  object btnOK: TBitBtn
    Left = 410
    Top = 365
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 3
    OnClick = btnOKClick
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
    Left = 490
    Top = 365
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
    TabOrder = 2
    Kind = bkCancel
  end
  object StaticText1: TStaticText
    Left = 4
    Top = 0
    Width = 443
    Height = 20
    Caption = 
      'Selecione a opera'#231#227'o em andamento e liberada ao operador da list' +
      'a abaixo:'
    TabOrder = 0
  end
  object dbgOperacoes: TtecDBGrid
    Left = 3
    Top = 21
    Width = 345
    Height = 332
    DataSource = dtmOperacoesOSP.dsrListaOperacaoLiberada
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
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
  object gbxMaquinas: TGroupBox
    Left = 351
    Top = 15
    Width = 657
    Height = 340
    Caption = 'M'#193'QUINAS'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'helvetica'
    Font.Pitch = fpVariable
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    object pgcMaquinas: TPageControl
      Left = 2
      Top = 16
      Width = 653
      Height = 322
      ActivePage = tstMaquinasDisponiveis
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object tstMaquinasDisponiveis: TTabSheet
        Caption = 'Dispon'#237'veis'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        object dbgListaOperacaoMaquinaLiberada: TtecDBGrid
          Left = 0
          Top = 0
          Width = 645
          Height = 292
          Align = alClient
          DataSource = dtmOperacoesOSP.dsrListaOperacaoMaquinaLiberada
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
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
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = 'M'#193'QUINA'
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
              FieldName = 'descricaomaquina'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = 'DESCRI'#199#195'O'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'helvetica'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Width = 503
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'naobloqueiausuario'
              Title.Alignment = taCenter
              Title.Caption = 'NB'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'helvetica'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Visible = True
            end>
        end
      end
      object tstMaquinasEmUso: TTabSheet
        Caption = 'Em uso'
        ImageIndex = 1
        object dbgListaOperacaoMaquinaUtilizada: TtecDBGrid
          Left = 0
          Top = 0
          Width = 645
          Height = 292
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
              Title.Caption = 'M'#193'QUINA'
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
              FieldName = 'descricaomaquina'
              Title.Alignment = taCenter
              Title.Caption = 'DESCRI'#199#195'O'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'helvetica'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Width = 224
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
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'lote'
              Title.Alignment = taCenter
              Title.Caption = 'LOTE'
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
              Width = 45
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
              Width = 205
              Visible = True
            end>
        end
      end
      object tstMaquinasBloqueadas: TTabSheet
        Caption = 'Bloqueadas'
        ImageIndex = 2
        TabVisible = False
        object dbgListaOperacaoMaquinaBloqueada: TtecDBGrid
          Left = 0
          Top = 0
          Width = 645
          Height = 292
          TabStop = False
          Align = alClient
          DataSource = dtmOperacoesOSP.dsrListaOperacaoMaquinaBloqueada
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
              Title.Caption = 'M'#193'QUINA'
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
              FieldName = 'descricaomaquina'
              Title.Alignment = taCenter
              Title.Caption = 'DESCRI'#199#195'O'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'helvetica'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Width = 223
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
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'lote'
              Title.Alignment = taCenter
              Title.Caption = 'LOTE'
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
              Width = 45
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
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'codigoparada'
              Title.Alignment = taCenter
              Title.Caption = 'C'#211'D.'
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
              Expanded = False
              FieldName = 'descricaoparada'
              Title.Alignment = taCenter
              Title.Caption = 'MOTIVO PARADA'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'helvetica'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Width = 104
              Visible = True
            end>
        end
      end
    end
  end
end
