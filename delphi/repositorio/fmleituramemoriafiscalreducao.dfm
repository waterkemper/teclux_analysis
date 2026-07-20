inherited frmLeituraMemoriaFiscalReducao: TfrmLeituraMemoriaFiscalReducao
  Left = 473
  Top = 310
  ActiveControl = edtReducaoInicial
  Caption = 'Leitura da Mem'#243'ria Fiscal por Reducao'
  ClientHeight = 70
  ClientWidth = 258
  Font.Name = 'Arial'
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 16
  object pnlFundoJanela: TPanel
    Left = 0
    Top = 0
    Width = 258
    Height = 70
    Align = alClient
    TabOrder = 0
    object gbxFundoJanela: TGroupBox
      Left = 1
      Top = 1
      Width = 256
      Height = 68
      Align = alClient
      TabOrder = 0
      object lblReducaoInicial: TLabel
        Left = 7
        Top = 10
        Width = 88
        Height = 16
        Alignment = taRightJustify
        Caption = 'Redu'#231#227'o Inicial'
      end
      object lblReducaoFinal: TLabel
        Left = 12
        Top = 36
        Width = 83
        Height = 16
        Alignment = taRightJustify
        Caption = 'Redu'#231#227'o Final'
      end
      object TPanel
        Left = 158
        Top = 4
        Width = 2
        Height = 52
        BevelOuter = bvLowered
        TabOrder = 4
      end
      object edtReducaoInicial: TEditNumero
        Left = 100
        Top = 5
        Width = 50
        Height = 24
        MaxLength = 4
        TabOrder = 0
        OnKeyDown = edtReducaoInicialKeyDown
        Mascara = False
        Alignment = taLeftJustify
        TipoMascara = tmGERAL
        NrDecimal = 0
        Decimais = False
        Negativo = False
        Tamanho = 4
      end
      object edtReducaoFinal: TEditNumero
        Left = 100
        Top = 32
        Width = 50
        Height = 24
        MaxLength = 4
        TabOrder = 1
        OnKeyDown = edtReducaoFinalKeyDown
        Mascara = False
        Alignment = taLeftJustify
        TipoMascara = tmGERAL
        NrDecimal = 0
        Decimais = False
        Negativo = False
        Tamanho = 4
      end
      object btnOK: TButton
        Left = 168
        Top = 5
        Width = 75
        Height = 25
        Caption = '&OK'
        TabOrder = 2
        OnClick = btnOKClick
      end
      object btnCancelar: TButton
        Left = 168
        Top = 30
        Width = 75
        Height = 25
        Caption = '&Cancelar'
        TabOrder = 3
      end
    end
  end
end
