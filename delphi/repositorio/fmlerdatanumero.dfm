inherited frmLerDataNumero: TfrmLerDataNumero
  Left = 303
  ActiveControl = edtNumero
  ClientHeight = 134
  ClientWidth = 217
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlFundoJanela: TPanel
    Width = 217
    Height = 134
    inherited gbxFundoJanela: TGroupBox
      Width = 211
      Height = 128
      object lblNumero: TLabel [0]
        Left = 16
        Top = 57
        Width = 45
        Height = 16
        Alignment = taRightJustify
        Caption = 'N'#250'mero'
      end
      inherited bbnCancelar: TBitBtn
        Left = 111
        Top = 84
        TabOrder = 3
      end
      inherited bbnOK: TBitBtn
        Left = 23
        Top = 84
      end
      inherited gbxData: TGroupBox
        Left = 59
        Width = 83
        Height = 37
        inherited edtData: TEditData
          Left = 3
          Top = 12
        end
      end
      object edtNumero: TEditNumero
        Left = 67
        Top = 55
        Width = 70
        Height = 24
        MaxLength = -1
        TabOrder = 1
        Mascara = True
        Alignment = taLeftJustify
        TipoMascara = tmGERAL
        NrDecimal = 2
        Decimais = False
        Negativo = False
        Tamanho = 9
      end
    end
  end
end
