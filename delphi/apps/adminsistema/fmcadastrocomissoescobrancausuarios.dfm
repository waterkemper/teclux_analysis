inherited frmCadastroComissoesCobrancaUsuarios: TfrmCadastroComissoesCobrancaUsuarios
  Left = 305
  Top = 227
  ActiveControl = edtFaixa1
  Caption = 'Cadastro Comiss'#245'es Cobran'#231'a Usu'#225'rios'
  ClientHeight = 208
  ClientWidth = 402
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBarra: TPanel
    TabOrder = 2
  end
  inherited pnlTopMenu: TPanel
    Width = 402
    inherited tblBarra: TToolBar
      Width = 177
      inherited sbnProcurar: TSpeedButton
        Visible = False
      end
    end
    inherited tblBarraCadastro: TToolBar
      inherited sbnIncluir: TSpeedButton
        Visible = False
      end
      inherited sbnExcluir: TSpeedButton
        Visible = False
      end
    end
  end
  object pnlFundoJanela: TPanel
    Left = 0
    Top = 40
    Width = 402
    Height = 168
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 3
    TabOrder = 0
    object gbxComissoesCobranca: TGroupBox
      Left = 3
      Top = 3
      Width = 396
      Height = 162
      Align = alClient
      TabOrder = 0
      object lblEvento: TLabel
        Left = 21
        Top = 12
        Width = 39
        Height = 16
        Caption = 'Evento'
      end
      object lblFaixa1: TLabel
        Left = 18
        Top = 41
        Width = 43
        Height = 16
        Caption = 'Faixa 1'
      end
      object lblFaixa2: TLabel
        Left = 18
        Top = 68
        Width = 43
        Height = 16
        Caption = 'Faixa 2'
      end
      object lblFaixa3: TLabel
        Left = 18
        Top = 95
        Width = 43
        Height = 16
        Caption = 'Faixa 3'
      end
      object lblFaixa4: TLabel
        Left = 18
        Top = 122
        Width = 43
        Height = 16
        Caption = 'Faixa 4'
      end
      object lblPerc1: TLabel
        Left = 128
        Top = 41
        Width = 12
        Height = 16
        Caption = '%'
      end
      object lblPerc2: TLabel
        Left = 128
        Top = 68
        Width = 12
        Height = 16
        Caption = '%'
      end
      object lblPerc3: TLabel
        Left = 128
        Top = 95
        Width = 12
        Height = 16
        Caption = '%'
      end
      object lblPerc4: TLabel
        Left = 128
        Top = 122
        Width = 12
        Height = 16
        Caption = '%'
      end
      object dtxEvento: TtecDBText
        Left = 64
        Top = 9
        Width = 257
        Height = 24
        TabStop = False
        Color = clBtnFace
        DataField = 'descricao'
        DataSource = dtmCadastrosInternos.dsrComissoesCobranca
        ReadOnly = True
        TabOrder = 0
        Alignment = taLeftJustify
      end
      object edtFaixa1: TDBEditNumero
        Left = 64
        Top = 37
        Width = 60
        Height = 24
        MaxLength = -1
        TabOrder = 3
        OnExit = edtFaixa1Exit
        Mascara = True
        Alignment = taLeftJustify
        TipoMascara = tmGERAL
        NrDecimal = 2
        Decimais = True
        Negativo = False
        Tamanho = 3
        DataField = 'percfaixa_1'
        DataSource = dtmCadastrosInternos.dsrComissoesCobranca
      end
      object edtFaixa2: TDBEditNumero
        Left = 64
        Top = 64
        Width = 60
        Height = 24
        MaxLength = -1
        TabOrder = 1
        OnExit = edtFaixa2Exit
        Mascara = True
        Alignment = taLeftJustify
        TipoMascara = tmGERAL
        NrDecimal = 2
        Decimais = True
        Negativo = False
        Tamanho = 3
        DataField = 'percfaixa_2'
        DataSource = dtmCadastrosInternos.dsrComissoesCobranca
      end
      object edtFaixa3: TDBEditNumero
        Left = 64
        Top = 91
        Width = 60
        Height = 24
        MaxLength = -1
        TabOrder = 2
        OnExit = edtFaixa3Exit
        Mascara = True
        Alignment = taLeftJustify
        TipoMascara = tmGERAL
        NrDecimal = 2
        Decimais = True
        Negativo = False
        Tamanho = 3
        DataField = 'percfaixa_3'
        DataSource = dtmCadastrosInternos.dsrComissoesCobranca
      end
      object edtFaixa4: TDBEditNumero
        Left = 64
        Top = 118
        Width = 60
        Height = 24
        MaxLength = -1
        TabOrder = 4
        OnExit = edtFaixa4Exit
        Mascara = True
        Alignment = taLeftJustify
        TipoMascara = tmGERAL
        NrDecimal = 2
        Decimais = True
        Negativo = False
        Tamanho = 3
        DataField = 'percfaixa_4'
        DataSource = dtmCadastrosInternos.dsrComissoesCobranca
      end
    end
  end
end
