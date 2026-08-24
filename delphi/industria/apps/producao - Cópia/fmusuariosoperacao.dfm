inherited frmUsuariosOperacao: TfrmUsuariosOperacao
  Left = 598
  Top = 277
  Width = 572
  Height = 230
  HorzScrollBar.Range = 545
  VertScrollBar.Range = 185
  ActiveControl = edfUsuarioOperacao
  AutoScroll = False
  Caption = 'Usu'#225'rio da Opera'#231#227'o'
  KeyPreview = False
  OnClose = nil
  PixelsPerInch = 96
  TextHeight = 16
  object btnOK: TBitBtn
    Left = 200
    Top = 149
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 2
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
  object btncancelar: TBitBtn
    Left = 288
    Top = 149
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
    TabOrder = 3
    Kind = bkCancel
  end
  object gbxCodigoUsuario: TGroupBox
    Left = 16
    Top = 16
    Width = 529
    Height = 50
    Caption = ' OPERADOR '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -9
    Font.Name = 'helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object edfUsuarioOperacao: TtecDbEditFind
      Left = 4
      Top = 10
      Width = 101
      Height = 36
      Alignment = taLeftJustify
      Constraints.MinHeight = 36
      DataField = 'codigo'
      DataSource = dtmOperacoesOSP.dsrUsuarios
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -25
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      Group = 'usuario'
      MaxLength = 6
      Maximo = 0
      Minimo = 37353
      Adicional = 0
      Opcional = True
      OnFound = edfUsuarioOperacaoFound
      OnKeyDown = edfUsuarioOperacaoKeyDown
      OnMessage = edfUsuarioOperacaoMessage
      ParentFont = False
      TabOrder = 0
      PermitirZero = False
      PermitirNulo = False
      Operacao = opPESQUISA
      Parameter = 'codigo'
      ActiveSetControls = True
      DenyInsert = True
      NoSetControls = <>
      SetControls = <>
    end
    object dtxNomeUsuario: TtecDBText
      Left = 104
      Top = 10
      Width = 421
      Height = 36
      TabStop = False
      Color = clBtnFace
      Constraints.MinHeight = 36
      DataField = 'nome'
      DataSource = dtmOperacoesOSP.dsrUsuarios
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -25
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      Alignment = taLeftJustify
    end
  end
  object gbxNumero: TGroupBox
    Left = 17
    Top = 81
    Width = 168
    Height = 50
    Caption = ' N'#186' OSP '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -9
    Font.Name = 'helvetica'
    Font.Pitch = fpVariable
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object Label5: TLabel
      Left = 107
      Top = 18
      Width = 5
      Height = 19
      Caption = '-'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblLote: TLabel
      Left = 119
      Top = 0
      Width = 30
      Height = 11
      Caption = ' LOTE '
    end
    object edfOSP_2: TtecDbEditFind
      Left = 4
      Top = 11
      Width = 101
      Height = 36
      Alignment = taLeftJustify
      Constraints.MinHeight = 36
      DataField = 'osp'
      DataSource = dtmOperacoesOSP.dsrOSPLotes
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -25
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      Group = 'loginosp'
      MaxLength = 7
      Maximo = 0
      Minimo = 37353
      Adicional = 0
      Opcional = True
      OnEnter = edfOSP_2Enter
      OnExit = edfOSP_2Exit
      OnKeyDown = edfOSP_2KeyDown
      ParentFont = False
      TabOrder = 0
      PermitirZero = False
      PermitirNulo = False
      Operacao = opPESQUISA
      Parameter = 'osp'
      ActiveSetControls = False
      DenyInsert = True
      NoSetControls = <>
      SetControls = <>
    end
    object edfLote_2: TtecDbEditFind
      Left = 116
      Top = 11
      Width = 48
      Height = 36
      Alignment = taLeftJustify
      Constraints.MinHeight = 36
      DataField = 'numero'
      DataSource = dtmOperacoesOSP.dsrOSPLotes
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -25
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      Group = 'loginosp'
      MaxLength = 3
      Maximo = 0
      Minimo = 37353
      Adicional = 0
      Opcional = True
      OnEnter = edfLote_2Enter
      OnExit = edfLote_2Exit
      OnKeyDown = edfLote_2KeyDown
      ParentFont = False
      TabOrder = 1
      PermitirZero = False
      PermitirNulo = False
      Operacao = opPESQUISA
      Parameter = 'numero'
    end
  end
end
