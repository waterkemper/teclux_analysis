inherited frmCadastroComissoesVendasUsuarios: TfrmCadastroComissoesVendasUsuarios
  Left = 612
  Top = 262
  ActiveControl = edtLimite
  Caption = 'Cadastro de Comiss'#245'es Usu'#225'rios'
  ClientHeight = 183
  ClientWidth = 405
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBarra: TPanel
    Left = 408
    Top = 2
    Width = 265
  end
  inherited pnlTopMenu: TPanel
    Width = 405
    inherited tblBarra: TToolBar
      Width = 180
      inherited sbnProcurar: TSpeedButton
        Visible = False
      end
    end
  end
  object pnlFundoJanela: TPanel
    Left = 0
    Top = 40
    Width = 405
    Height = 143
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 3
    TabOrder = 2
    object gbxComissoesUsuarios: TGroupBox
      Left = 3
      Top = 3
      Width = 399
      Height = 137
      Align = alClient
      TabOrder = 0
      object lblLimite: TLabel
        Left = 8
        Top = 13
        Width = 68
        Height = 16
        Alignment = taRightJustify
        Caption = 'Limite Valor'
      end
      object lblPrazo: TLabel
        Left = 18
        Top = 40
        Width = 58
        Height = 16
        Alignment = taRightJustify
        Caption = '(%) Prazo'
      end
      object lblEntrada: TLabel
        Left = 7
        Top = 67
        Width = 69
        Height = 16
        Alignment = taRightJustify
        Caption = '(%) Entrada'
      end
      object lblVista: TLabel
        Left = 22
        Top = 94
        Width = 54
        Height = 16
        Alignment = taRightJustify
        Caption = '(%) Vista'
      end
      object edtLimite: TDBEditNumero
        Left = 81
        Top = 9
        Width = 110
        Height = 24
        MaxLength = -1
        TabOrder = 0
        Mascara = True
        Alignment = taLeftJustify
        TipoMascara = tmGERAL
        NrDecimal = 2
        Decimais = True
        Negativo = False
        Tamanho = 9
        DataField = 'limite'
        DataSource = dtmCadastrosInternos.dsrComissoesUsuarios
      end
      object edtPrazo: TDBEditNumero
        Left = 81
        Top = 36
        Width = 70
        Height = 24
        MaxLength = -1
        TabOrder = 1
        OnExit = edtPrazoExit
        Mascara = True
        Alignment = taLeftJustify
        TipoMascara = tmGERAL
        NrDecimal = 2
        Decimais = True
        Negativo = False
        Tamanho = 3
        DataField = 'percprazo'
        DataSource = dtmCadastrosInternos.dsrComissoesUsuarios
      end
      object edtEntrada: TDBEditNumero
        Left = 81
        Top = 63
        Width = 70
        Height = 24
        MaxLength = -1
        TabOrder = 2
        OnExit = edtEntradaExit
        Mascara = True
        Alignment = taLeftJustify
        TipoMascara = tmGERAL
        NrDecimal = 2
        Decimais = True
        Negativo = False
        Tamanho = 3
        DataField = 'percentrada'
        DataSource = dtmCadastrosInternos.dsrComissoesUsuarios
      end
      object edtVista: TDBEditNumero
        Left = 81
        Top = 90
        Width = 70
        Height = 24
        MaxLength = -1
        TabOrder = 3
        OnExit = edtVistaExit
        Mascara = True
        Alignment = taLeftJustify
        TipoMascara = tmGERAL
        NrDecimal = 2
        Decimais = True
        Negativo = False
        Tamanho = 3
        DataField = 'percvista'
        DataSource = dtmCadastrosInternos.dsrComissoesUsuarios
      end
    end
  end
end
