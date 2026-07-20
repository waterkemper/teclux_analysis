inherited frmConfiguracoesECF: TfrmConfiguracoesECF
  Left = 265
  Top = 210
  ActiveControl = tecPageControl1
  Caption = 'Configura'#231#245'es de ECF'
  ClientHeight = 185
  ClientWidth = 453
  FormStyle = fsMDIChild
  PixelsPerInch = 75
  object pnlFundoJanela: TPanel
    Left = 0
    Top = 0
    Width = 453
    Height = 185
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 3
    TabOrder = 0
    object gbxFundoJanela: TGroupBox
      Left = 3
      Top = 3
      Width = 447
      Height = 179
      Align = alClient
      TabOrder = 0
      object tecPageControl1: TtecPageControl
        Left = 2
        Top = 2
        Width = 443
        Height = 175
        ActivePage = tstECF
        Align = alClient
        TabOrder = 0
        object tstECF: TTabSheet
          Caption = '&ECF'
          object sbnProcurarECF: TSpeedButton
            Left = 300
            Top = 1
            Width = 131
            Height = 22
            Caption = '&Procurar ECF Local'
            Flat = True
            OnClick = sbnProcurarECFClick
          end
          object sbnSalvar: TSpeedButton
            Left = 300
            Top = 23
            Width = 131
            Height = 22
            Caption = '&Salvar'
            Flat = True
            OnClick = sbnSalvarClick
          end
          object sbnApagar: TSpeedButton
            Left = 300
            Top = 45
            Width = 131
            Height = 22
            Caption = '&Apagar ECF'
            Flat = True
            OnClick = sbnApagarClick
          end
          object lblSerieECF: TLabel
            Left = 76
            Top = 45
            Width = 29
            Height = 15
            Alignment = taRightJustify
            Caption = 'S'#233'rie'
          end
          object lblNumeroECF: TLabel
            Left = 62
            Top = 71
            Width = 43
            Height = 15
            Alignment = taRightJustify
            Caption = 'N'#250'mero'
          end
          object lblSerieECF1: TLabel
            Left = 110
            Top = 41
            Width = 132
            Height = 23
            Alignment = taRightJustify
            AutoSize = False
            BorderStyle = bsSunkenPanel
          end
          object lblNumeroECF1: TLabel
            Left = 110
            Top = 67
            Width = 132
            Height = 23
            Alignment = taRightJustify
            AutoSize = False
            BorderStyle = bsSunkenPanel
          end
          object lblMarca: TLabel
            Left = 69
            Top = 19
            Width = 36
            Height = 15
            Alignment = taRightJustify
            Caption = 'Marca'
          end
          object lblMarca1: TLabel
            Left = 110
            Top = 15
            Width = 132
            Height = 23
            Alignment = taRightJustify
            AutoSize = False
            BorderStyle = bsSunkenPanel
          end
          object TPanel
            Left = 288
            Top = 0
            Width = 3
            Height = 200
            BevelOuter = bvLowered
            TabOrder = 6
          end
          object lblProcurando: TLabel
            Left = 35
            Top = 107
            Width = 215
            Height = 23
            Alignment = taCenter
            AutoSize = False
            BorderStyle = bsSunkenPanel
            Caption = 'Por Favor! Aguarde um momento.'
            Color = clButton
            ParentColor = False
            Visible = False
          end
        end
      end
    end
  end
end
