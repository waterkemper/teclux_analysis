inherited frmCadastroParcelaDevolucao: TfrmCadastroParcelaDevolucao
  Left = 496
  ActiveControl = edtDataVencto
  Caption = 'Cadastro de Parcelas'
  ClientHeight = 131
  ClientWidth = 454
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBarra: TPanel
    Left = 328
    Top = 66
    Width = 177
  end
  inherited pnlTopMenu: TPanel
    Width = 454
    inherited tblBarra: TToolBar
      Width = 225
      inherited sbnProcurar: TSpeedButton
        Visible = False
      end
    end
  end
  object pnlFundoJanela: TPanel
    Left = 0
    Top = 53
    Width = 454
    Height = 78
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 3
    TabOrder = 2
    object gbxParcelasDevolucao: TGroupBox
      Left = 3
      Top = 3
      Width = 448
      Height = 72
      Align = alClient
      TabOrder = 0
      object lblDataVencto: TLabel
        Left = 5
        Top = 16
        Width = 68
        Height = 16
        Alignment = taRightJustify
        Caption = 'Vencimento'
      end
      object lblValorVencto: TLabel
        Left = 45
        Top = 43
        Width = 29
        Height = 16
        Alignment = taRightJustify
        Caption = 'Valor'
      end
      object edtDataVencto: TDBEditData
        Left = 79
        Top = 12
        Width = 75
        Height = 24
        DataField = 'datavencto'
        DataSource = dtmDevolucaoMercadorias.dsrParcelasContratos
        MaxLength = 10
        Maximo = 30
        Minimo = 0
        Adicional = 0
        TabOrder = 0
        Opcional = True
      end
      object edtValorVencto: TDBEditNumero
        Left = 79
        Top = 37
        Width = 105
        Height = 24
        MaxLength = -1
        TabOrder = 1
        Mascara = True
        Alignment = taLeftJustify
        TipoMascara = tmGERAL
        NrDecimal = 2
        Decimais = True
        Negativo = False
        Tamanho = 9
        DataField = 'valorvencto'
        DataSource = dtmDevolucaoMercadorias.dsrParcelasContratos
      end
    end
  end
end
