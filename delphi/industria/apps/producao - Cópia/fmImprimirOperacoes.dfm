inherited frmImprimiroperacoes: TfrmImprimiroperacoes
  Left = 626
  Top = 288
  Caption = 'Impress'#227'o Opera'#231#245'es'
  ClientHeight = 265
  ClientWidth = 421
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  KeyPreview = False
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object gbxAlteracoes: TGroupBox
    Left = 256
    Top = 183
    Width = 160
    Height = 36
    Caption = 'ALTERADAS ENTRE '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -9
    Font.Name = 'helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    object Label1: TLabel
      Left = 76
      Top = 16
      Width = 7
      Height = 15
      Caption = 'e'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
    end
    object edtDataInicialAlteracao: TEditData
      Left = 2
      Top = 10
      Width = 70
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 0
      OnKeyDown = edtDataInicialAlteracaoKeyDown
      Minimo = 37353
      Maximo = 37353
    end
    object edtDataFinalAlteracao: TEditData
      Left = 87
      Top = 10
      Width = 70
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 1
      Minimo = 37353
      Maximo = 37353
    end
  end
  object bbnCancelar: TBitBtn
    Left = 232
    Top = 233
    Width = 85
    Height = 26
    Cancel = True
    Caption = '&Cancelar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    OnClick = bbnCancelarClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333333333000033338833333333333333333F333333333333
      0000333911833333983333333388F333333F3333000033391118333911833333
      38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
      911118111118333338F3338F833338F3000033333911111111833333338F3338
      3333F8330000333333911111183333333338F333333F83330000333333311111
      8333333333338F3333383333000033333339111183333333333338F333833333
      00003333339111118333333333333833338F3333000033333911181118333333
      33338333338F333300003333911183911183333333383338F338F33300003333
      9118333911183333338F33838F338F33000033333913333391113333338FF833
      38F338F300003333333333333919333333388333338FFF830000333333333333
      3333333333333333333888330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object rgpRelatorio: TRadioGroup
    Left = 8
    Top = 8
    Width = 165
    Height = 83
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    ItemIndex = 0
    Items.Strings = (
      'Vers'#227'o sint'#233'tica'
      'Sem m'#225'quinas e falhas'
      'Com m'#225'quinas e falhas'
      'S'#243' m'#225'quinas e falhas')
    ParentFont = False
    TabOrder = 0
    TabStop = True
  end
  object gbxListar: TGroupBox
    Left = 8
    Top = 146
    Width = 241
    Height = 73
    Hint = 'Para listar todas as opera'#231#245'es deixe os campos desmarcados'
    Caption = 'LISTAR '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -9
    Font.Name = 'helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    object ckbListarSetupSim: TCheckBox
      Left = 139
      Top = 11
      Width = 40
      Height = 18
      Caption = 'Sim'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = ckbListarSetupSimClick
      OnKeyDown = ckbListarSetupSimKeyDown
    end
    object lblSetup: TStaticText
      Left = 10
      Top = 15
      Width = 40
      Height = 19
      Alignment = taRightJustify
      Caption = 'Set-up'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 6
    end
    object lblPlano: TStaticText
      Left = 9
      Top = 33
      Width = 100
      Height = 19
      Alignment = taRightJustify
      Caption = 'Plano de controle'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 7
    end
    object lblBloqueia: TStaticText
      Left = 9
      Top = 53
      Width = 123
      Height = 19
      Alignment = taRightJustify
      Caption = 'N'#227'o bloqueia usu'#225'rio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 8
    end
    object ckbListarPlanoSim: TCheckBox
      Left = 139
      Top = 29
      Width = 40
      Height = 18
      Caption = 'Sim'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = ckbListarPlanoSimClick
      OnKeyDown = ckbListarSetupSimKeyDown
    end
    object ckbListarBloqueioSim: TCheckBox
      Left = 139
      Top = 49
      Width = 40
      Height = 18
      Caption = 'Sim'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = ckbListarBloqueioSimClick
      OnKeyDown = ckbListarSetupSimKeyDown
    end
    object ckbListarSetupNao: TCheckBox
      Left = 192
      Top = 11
      Width = 40
      Height = 18
      Caption = 'N'#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = ckbListarSetupNaoClick
      OnKeyDown = ckbListarSetupSimKeyDown
    end
    object ckbListarPlanoNao: TCheckBox
      Left = 192
      Top = 29
      Width = 40
      Height = 18
      Caption = 'N'#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = ckbListarPlanoNaoClick
      OnKeyDown = ckbListarSetupSimKeyDown
    end
    object ckbListarBloqueioNao: TCheckBox
      Left = 192
      Top = 49
      Width = 40
      Height = 18
      Caption = 'N'#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnClick = ckbListarBloqueioNaoClick
      OnKeyDown = ckbListarSetupSimKeyDown
    end
  end
  object gbxInclusoes: TGroupBox
    Left = 256
    Top = 146
    Width = 160
    Height = 36
    Caption = 'INCLU'#205'DAS ENTRE '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -9
    Font.Name = 'helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    object lblACadastro: TLabel
      Left = 76
      Top = 16
      Width = 7
      Height = 15
      Caption = 'e'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
    end
    object edtDataFinaInclusao: TEditData
      Left = 87
      Top = 10
      Width = 70
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 1
      OnKeyDown = edtDataFinaInclusaoKeyDown
      Minimo = 37353
      Maximo = 37353
    end
    object edtDataInicialInclusao: TEditData
      Left = 2
      Top = 10
      Width = 70
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 0
      OnKeyDown = edtDataInicialInclusaoKeyDown
      Minimo = 37353
      Maximo = 37353
    end
  end
  object btnOK: TBitBtn
    Left = 156
    Top = 233
    Width = 75
    Height = 26
    Caption = 'OK'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnClick = btnOKClick
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
  object lblRelatorio: TStaticText
    Left = 15
    Top = 10
    Width = 57
    Height = 16
    Caption = 'RELAT'#211'RIO'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
    TabOrder = 8
  end
  object ckbSomenteOperacaoAtual: TCheckBox
    Left = 189
    Top = 16
    Width = 220
    Height = 17
    Caption = 'Imprimir somente a opera'#231#227'o atual'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = ckbSomenteOperacaoAtualClick
  end
  object gbxFluxograma: TGroupBox
    Left = 7
    Top = 99
    Width = 408
    Height = 36
    Caption = 'FLUXOGRAMA'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -9
    Font.Name = 'helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    inline fraConsultaFluxograma: TfraConsultaCodigo
      Left = 3
      Top = 10
      Width = 505
      Height = 24
      HorzScrollBar.Range = 504
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
      inherited sbnProcura: TSpeedButton
        Top = -1
      end
      inherited dtxDescricao: TtecDBText
        Top = -1
        Width = 314
        DataField = 'descricao'
        DataSource = fraConsultaFluxograma.dsrProcuraFluxogramas
      end
      inherited edfCodigo: TtecDBFindLookup
        Top = -1
        DataField = 'codigo'
        DataSource = fraConsultaFluxograma.dsrProcuraFluxogramas
        Group = 'fluxograma'
        MaxLength = 6
        OnFound = nil
        Operacao = opPESQUISA
        Parameter = 'codigo'
        ActiveSetControls = False
        DenyInsert = True
        NoSetControls = <>
        SetControls = <>
      end
      inherited qryProcuraFluxogramas: TtecQuery
        inherited qryProcuraFluxogramascodigo: TIntegerField
          DisplayFormat = '0'
        end
      end
      inherited qryProcuraCobrador: TtecQuery
        Left = 352
      end
      inherited dsrProcuraCobrador: TtecDataSource
        Left = 408
        Top = 8
      end
    end
  end
end
