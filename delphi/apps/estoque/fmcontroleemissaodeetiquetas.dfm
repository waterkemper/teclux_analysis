inherited frmControleEmissaodeEtiquetas: TfrmControleEmissaodeEtiquetas
  Left = 481
  Top = 260
  Caption = 'Controle de Emiss'#227'o de Etiquetas'
  ClientHeight = 371
  ClientWidth = 323
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBarra: TToolBar
    Width = 323
    ButtonHeight = 33
    inherited sbnImprimir: TSpeedButton
      Height = 33
    end
    inherited sbnAjuda: TSpeedButton
      Top = 18
    end
    inherited bvlBotoes: TBevel
      Height = 33
    end
  end
  inherited pnlFundoJanela: TPanel
    Top = 369
    Width = 323
    Height = 2
  end
  inline fraIntervaloDatas: TfraIntervaloDatas
    Left = 0
    Top = 40
    Width = 162
    Height = 36
    Align = alTop
    Constraints.MaxHeight = 36
    Constraints.MaxWidth = 162
    Constraints.MinHeight = 36
    Constraints.MinWidth = 162
    TabOrder = 2
  end
  inline fraListaFiliais: TfraListaFiliais
    Left = 0
    Top = 76
    Width = 323
    Height = 293
    Align = alClient
    TabOrder = 3
    inherited gbxFiliais: TGroupBox
      Width = 323
      Height = 293
      inherited sbnMarcarFiliais: TSpeedButton
        Left = 292
      end
      inherited sbnDesmarcarFiliais: TSpeedButton
        Left = 292
      end
      inherited clbFiliais: TCheckListBox
        Left = 2
        Top = 15
        Height = 276
        Align = alLeft
      end
    end
  end
end
