inherited frmAlteraRemessa: TfrmAlteraRemessa
  ActiveControl = edtNumero
  ClientHeight = 134
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlFundoJanela: TPanel
    Height = 134
    inherited gbxFundoJanela: TGroupBox
      Height = 128
      object lblNumero: TLabel [0]
        Left = 9
        Top = 55
        Width = 45
        Height = 16
        Alignment = taRightJustify
        Caption = 'N'#250'mero'
      end
      inherited bbnCancelar: TBitBtn
        Top = 82
        TabOrder = 2
      end
      inherited bbnOK: TBitBtn
        Top = 82
      end
      object edtNumero: TEditNumero [3]
        Left = 57
        Top = 51
        Width = 75
        Height = 24
        MaxLength = -1
        TabOrder = 1
        Mascara = True
        TipoMascara = tmGERAL
        NrDecimal = 2
        Decimais = False
        Negativo = False
        Tamanho = 6
      end
      inherited gbxData: TGroupBox
        Left = 55
        TabOrder = 3
      end
    end
  end
end
