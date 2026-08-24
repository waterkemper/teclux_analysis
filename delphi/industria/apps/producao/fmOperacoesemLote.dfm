inherited frmOperacoesemLote: TfrmOperacoesemLote
  Left = 720
  Top = 167
  Width = 928
  Height = 382
  HorzScrollBar.Range = 439
  VertScrollBar.Range = 185
  ActiveControl = edfUsuarioOperacao
  Caption = 'Lista de M'#225'quina e Opera'#231#245'es n'#227'o bloqueantes'
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel [0]
    Left = 328
    Top = 327
    Width = 193
    Height = 15
    Caption = 'Opera'#231#245'es permitidas ao operador'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
  end
  object Shape1: TShape [1]
    Left = 313
    Top = 327
    Width = 11
    Height = 10
    Brush.Color = clGreen
    Pen.Width = 0
  end
  inherited pnlBarra: TPanel
    Left = 0
    Top = 351
    Width = 916
    Height = 0
    Align = alBottom
    TabOrder = 2
  end
  inherited pnlTopMenu: TPanel
    Width = 916
    TabOrder = 3
    inherited tblBarra: TToolBar
      Left = 300
      Width = 616
      inherited sbnProcurar: TSpeedButton
        Visible = False
      end
      inherited sbnAjuda: TSpeedButton
        Action = Action1
      end
    end
    inherited tblBarraCadastro: TToolBar
      Width = 300
      inherited sbnIncluir: TSpeedButton
        Visible = False
      end
      inherited sbnSalvar: TSpeedButton
        Hint = 'Fechar as opera'#231#245'es da m'#225'quina'
        Caption = 'Fechar F5'
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
  object gbxListaOperacaoMaquinaLiberada: TGroupBox
    Left = 308
    Top = 75
    Width = 596
    Height = 246
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'helvetica'
    Font.Pitch = fpVariable
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object dbgOperacoesaFechar: TtecDBGrid
      Left = 2
      Top = 16
      Width = 592
      Height = 228
      Align = alClient
      DataSource = dtmOperacoesOSP.dsrOperacaoesaFechar
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clBlack
      TitleFont.Height = -9
      TitleFont.Name = 'helvetica'
      TitleFont.Pitch = fpVariable
      TitleFont.Style = []
      OnDrawColumnCell = dbgOperacoesaFecharDrawColumnCell
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
          FieldName = 'osp'
          Title.Alignment = taCenter
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'lote'
          Title.Alignment = taCenter
          Title.Caption = 'LOTE'
          Width = 30
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nome'
          Title.Alignment = taCenter
          Title.Caption = 'OPERA'#199#195'O'
          Width = 60
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'c01'
          Title.Alignment = taCenter
          Title.Caption = 'C1'
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'c02'
          Title.Caption = 'C2'
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'c03'
          Title.Caption = 'C3'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'usuario'
          Title.Alignment = taCenter
          Title.Caption = 'OPERADOR'
          Width = 55
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nomeuusuario'
          Title.Caption = 'NOME DO OPERADOR'
          Width = 110
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'data'
          Title.Alignment = taCenter
          Title.Caption = 'DATA'
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'inicio'
          Title.Alignment = taCenter
          Title.Caption = 'IN'#205'CIO'
          Width = 55
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'quantidadeafechar'
          Title.Alignment = taCenter
          Title.Caption = 'QUANTIDADE'
          Width = 70
          Visible = True
        end>
    end
  end
  object gbxCodigoUsuario: TGroupBox
    Left = 0
    Top = 40
    Width = 529
    Height = 36
    Caption = 'OPERADOR'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -9
    Font.Name = 'helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object edfUsuarioOperacao: TtecDbEditFind
      Left = 4
      Top = 10
      Width = 101
      Height = 23
      Alignment = taLeftJustify
      Constraints.MinHeight = 23
      DataField = 'codigo'
      DataSource = dtmOperacoesOSP.dsrUsuarios
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      Group = 'usuario'
      MaxLength = 6
      Maximo = 0
      Minimo = 37353
      Adicional = 0
      Opcional = True
      ParentFont = False
      TabOrder = 0
      PermitirZero = False
      PermitirNulo = False
      Operacao = opPESQUISA
      Parameter = 'codigo'
      ActiveSetControls = False
      DenyInsert = True
      NoSetControls = <>
      SetControls = <>
    end
    object dtxNomeUsuario: TtecDBText
      Left = 104
      Top = 10
      Width = 421
      Height = 23
      TabStop = False
      AutoSize = False
      Color = clBtnFace
      Constraints.MinHeight = 23
      DataField = 'nome'
      DataSource = dtmOperacoesOSP.dsrUsuarios
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      Alignment = taLeftJustify
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 75
    Width = 308
    Height = 246
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'helvetica'
    Font.Pitch = fpVariable
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    object dbgMaquinasaFechar: TtecDBGrid
      Left = 2
      Top = 16
      Width = 304
      Height = 228
      Align = alClient
      DataSource = dtmOperacoesOSP.dsrMaquinasaFechar
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clBlack
      TitleFont.Height = -9
      TitleFont.Name = 'helvetica'
      TitleFont.Pitch = fpVariable
      TitleFont.Style = []
      OnDrawColumnCell = dbgMaquinasaFecharDrawColumnCell
      OnDblClick = dbgMaquinasaFecharDblClick
      OnKeyDown = dbgMaquinasaFecharKeyDown
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
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'descricaomaquina'
          Title.Caption = 'DESCRI'#199#195'O DA M'#193'QUINA'
          Visible = True
        end>
    end
  end
  object ActionList1: TActionList
    Left = 580
    Top = 8
    object Action1: TAction
      Caption = 'Action1'
      OnUpdate = Action1Update
    end
  end
end
