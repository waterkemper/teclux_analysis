inherited frmLiberacaoMaquinas: TfrmLiberacaoMaquinas
  Left = 299
  Top = 146
  ActiveControl = dbgMaquinasBloqueadas
  Caption = 'Libera'#231#227'o de M'#225'quinas Bloqueadas'
  ClientHeight = 466
  ClientWidth = 1231
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBarra: TPanel
    Left = 0
    Top = 40
    Width = 1231
    Height = 398
    Align = alClient
    Visible = True
    inherited bvlBotoesEd: TBevel
      Left = 1
      Top = 397
      Width = 1229
      Height = 0
      Align = alBottom
    end
    object gbxMaquina: TGroupBox
      Left = 13
      Top = 8
      Width = 185
      Height = 12
      Caption = ' M'#193'QUINA '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object gbxParada: TGroupBox
      Left = 814
      Top = 8
      Width = 328
      Height = 12
      Caption = ' DETALHES DA PARADA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object gbxOSP: TGroupBox
      Left = 197
      Top = 8
      Width = 81
      Height = 12
      Caption = ' O.S.P. '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object gbxOperacao: TGroupBox
      Left = 277
      Top = 8
      Width = 132
      Height = 12
      Caption = ' OPERA'#199#195'O'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object gbxInicioOperacao: TGroupBox
      Left = 560
      Top = 8
      Width = 129
      Height = 12
      Caption = ' IN'#205'CIO OPERA'#199#195'O '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object gbxTerminoOperacao: TGroupBox
      Left = 688
      Top = 8
      Width = 128
      Height = 12
      Caption = ' T'#201'RMINO OPERA'#199#195'O '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object gbxUsuario: TGroupBox
      Left = 407
      Top = 8
      Width = 154
      Height = 12
      Caption = ' USU'#193'RIO '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 6
    end
  end
  inherited pnlTopMenu: TPanel
    Width = 1231
    inherited tblBarra: TToolBar
      Left = 300
      Width = 931
      inherited sbnProcurar: TSpeedButton
        Visible = False
      end
    end
    inherited tblBarraCadastro: TToolBar
      Width = 300
      inherited sbnIncluir: TSpeedButton
        Visible = False
      end
      inherited sbnExcluir: TSpeedButton
        Visible = False
      end
      object sbnGerar: TSpeedButton
        Left = 225
        Top = 2
        Width = 75
        Height = 35
        Hint = 'Selecionar duplicatas'
        Caption = 'Gerar F6'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
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
        ParentFont = False
        Spacing = 0
        OnClick = sbnGerarClick
      end
    end
  end
  object dbgMaquinasBloqueadas: TtecDBGrid
    Left = 0
    Top = 58
    Width = 1197
    Height = 378
    DataSource = dtmLiberacaoMaquinas.dsrMaquinasBloqueadas
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -9
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Pitch = fpVariable
    TitleFont.Style = []
    OnDrawColumnCell = dbgMaquinasBloqueadasDrawColumnCell
    OnDblClick = dbgMaquinasBloqueadasDblClick
    OnKeyDown = dbgMaquinasBloqueadasKeyDown
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
        Title.Font.Color = clWindowText
        Title.Font.Height = -9
        Title.Font.Name = 'Helvetica'
        Title.Font.Pitch = fpVariable
        Title.Font.Style = []
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descricaomaquina'
        Title.Alignment = taCenter
        Title.Caption = 'DESCRI'#199#195'O'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -9
        Title.Font.Name = 'Helvetica'
        Title.Font.Pitch = fpVariable
        Title.Font.Style = []
        Width = 142
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'osp'
        Title.Alignment = taCenter
        Title.Caption = 'N'#218'MERO'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -9
        Title.Font.Name = 'Helvetica'
        Title.Font.Pitch = fpVariable
        Title.Font.Style = []
        Width = 47
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'lote'
        Title.Alignment = taCenter
        Title.Caption = 'LOTE'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -9
        Title.Font.Name = 'Helvetica'
        Title.Font.Pitch = fpVariable
        Title.Font.Style = []
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nomeoperacao'
        Title.Alignment = taCenter
        Title.Caption = 'NOME'
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
        FieldName = 'c01'
        Title.Alignment = taCenter
        Title.Caption = 'C1'
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
        FieldName = 'c02'
        Title.Alignment = taCenter
        Title.Caption = 'C2'
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
        FieldName = 'c03'
        Title.Alignment = taCenter
        Title.Caption = 'C3'
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
        FieldName = 'usuario'
        Title.Alignment = taCenter
        Title.Caption = 'C'#211'DIGO'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -9
        Title.Font.Name = 'Helvetica'
        Title.Font.Pitch = fpVariable
        Title.Font.Style = []
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nomeusuario'
        Title.Alignment = taCenter
        Title.Caption = 'N O M E'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -9
        Title.Font.Name = 'Helvetica'
        Title.Font.Pitch = fpVariable
        Title.Font.Style = []
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'data'
        Title.Alignment = taCenter
        Title.Caption = 'DATA'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -9
        Title.Font.Name = 'Helvetica'
        Title.Font.Pitch = fpVariable
        Title.Font.Style = []
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'inicio'
        Title.Alignment = taCenter
        Title.Caption = 'HORA'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -9
        Title.Font.Name = 'Helvetica'
        Title.Font.Pitch = fpVariable
        Title.Font.Style = []
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'datatermino'
        Title.Alignment = taCenter
        Title.Caption = 'DATA'
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
        FieldName = 'termino'
        Title.Alignment = taCenter
        Title.Caption = 'HORA'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -9
        Title.Font.Name = 'Helvetica'
        Title.Font.Pitch = fpVariable
        Title.Font.Style = []
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'inicioparada'
        Title.Alignment = taCenter
        Title.Caption = 'IN'#205'CIO'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -9
        Title.Font.Name = 'Helvetica'
        Title.Font.Pitch = fpVariable
        Title.Font.Style = []
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'codigoparada'
        Title.Alignment = taCenter
        Title.Caption = 'C'#211'DIGO'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -9
        Title.Font.Name = 'Helvetica'
        Title.Font.Pitch = fpVariable
        Title.Font.Style = []
        Width = 44
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descricaoparada'
        Title.Alignment = taCenter
        Title.Caption = 'DESCRI'#199#195'O'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -9
        Title.Font.Name = 'Helvetica'
        Title.Font.Pitch = fpVariable
        Title.Font.Style = []
        Width = 180
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'liberar'
        Title.Alignment = taCenter
        Title.Caption = 'OK'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -9
        Title.Font.Name = 'Helvetica'
        Title.Font.Pitch = fpVariable
        Title.Font.Style = []
        Width = 27
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 438
    Width = 1231
    Height = 28
    Align = alBottom
    TabOrder = 3
    object lblLegenda: TLabel
      Left = 12
      Top = 7
      Width = 198
      Height = 13
      Alignment = taCenter
      Caption = '<Ctrl Barra de Espa'#231'o>Marcar/Desmarcar'
    end
    object ckbMarcarTodos: TCheckBox
      Left = 906
      Top = 8
      Width = 168
      Height = 13
      Caption = 'Marcar todas as m'#225'quinas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = ckbMarcarTodosClick
    end
  end
end
