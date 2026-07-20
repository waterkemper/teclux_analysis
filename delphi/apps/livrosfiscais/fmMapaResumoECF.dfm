inherited frmMapaResumoECF: TfrmMapaResumoECF
  Left = 467
  Top = 217
  Caption = 'Mapa resumo ECF'
  ClientHeight = 86
  ClientWidth = 249
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBarra: TToolBar
    Width = 249
  end
  inherited pnlFundoJanela: TPanel
    Top = 84
    Width = 249
    Height = 2
  end
  inline fraIntervaloDatas1: TfraIntervaloDatas
    Left = 4
    Top = 43
    Width = 162
    Height = 36
    Constraints.MaxHeight = 36
    Constraints.MaxWidth = 162
    Constraints.MinHeight = 36
    Constraints.MinWidth = 162
    TabOrder = 2
  end
  object ecvValida: TtecEditionControlValidation
    EditionControl = <
      item
        Control = fraIntervaloDatas1.edtDataFinal
      end
      item
        Control = fraIntervaloDatas1.edtDataInicial
      end>
    Left = 168
    Top = 8
  end
end
