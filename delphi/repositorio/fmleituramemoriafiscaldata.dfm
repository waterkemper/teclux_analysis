inherited frmLeituraMemoriaFiscalData: TfrmLeituraMemoriaFiscalData
  Left = 364
  Top = 264
  ActiveControl = edtDataInicial
  Caption = 'Leitura da Mem'#243'ria Fiscal por Data'
  ClientHeight = 73
  ClientWidth = 266
  Font.Name = 'Arial'
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 16
  object pnlFundoJanela: TPanel
    Left = 0
    Top = 0
    Width = 266
    Height = 73
    Align = alClient
    TabOrder = 0
    object gbxFundoJanela: TGroupBox
      Left = 1
      Top = 1
      Width = 264
      Height = 71
      Align = alClient
      TabOrder = 0
      object lblDataInicial: TLabel
        Left = 11
        Top = 10
        Width = 64
        Height = 16
        Alignment = taRightJustify
        Caption = 'Data Inicial'
      end
      object lblDataFinal: TLabel
        Left = 16
        Top = 36
        Width = 59
        Height = 16
        Alignment = taRightJustify
        Caption = 'Data Final'
      end
      object edtDataInicial: TEditData
        Left = 79
        Top = 5
        Width = 77
        Height = 24
        TabOrder = 0
        OnKeyDown = edtDataInicialKeyDown
        Minimo = 37353
        Maximo = 0
      end
      object edtDataFinal: TEditData
        Left = 79
        Top = 32
        Width = 77
        Height = 24
        TabOrder = 1
        OnKeyDown = edtDataFinalKeyDown
        Minimo = 37353
        Maximo = 0
      end
      object TPanel
        Left = 163
        Top = 4
        Width = 2
        Height = 52
        BevelOuter = bvLowered
        TabOrder = 4
      end
      object btnOK: TButton
        Left = 170
        Top = 5
        Width = 75
        Height = 25
        Caption = '&OK'
        TabOrder = 2
        OnClick = btnOKClick
      end
      object btnCancelar: TButton
        Left = 170
        Top = 30
        Width = 75
        Height = 25
        Caption = '&Cancelar'
        TabOrder = 3
        OnClick = btnCancelarClick
      end
    end
  end
end
