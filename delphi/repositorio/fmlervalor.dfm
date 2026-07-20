inherited frmLerValor: TfrmLerValor
  ClientHeight = 94
  ClientWidth = 258
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundoJanela: TPanel
    Width = 258
    Height = 94
    inherited gbxFundoJanela: TGroupBox
      Width = 252
      Height = 88
      inherited lblNumero: TLabel
        Left = 11
        Width = 72
        Caption = 'Valor Recebido'
      end
      inherited edtNumero: TEditNumero
        Left = 10
        Width = 116
        Alignment = taLeftJustify
        Decimais = True
      end
    end
  end
end
