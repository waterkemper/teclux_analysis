inherited frmConsultaPorCampo: TfrmConsultaPorCampo
  Left = 483
  Top = 226
  ActiveControl = sbxItensConsulta
  Caption = 'Procurar'
  PixelsPerInch = 96
  TextHeight = 16
  inherited sptConsulta: TSplitter
    Top = 73
  end
  inherited dbgConsulta: TtecDBGrid
    Top = 73
    Height = 251
  end
  inherited pnlCabecalho: TPanel
    Height = 73
    inherited sbxItensConsulta: TScrollBox
      Height = 73
      inherited pnlBotoes: TPanel
        Height = 73
      end
      inherited gbxSelecionar: TGroupBox
        inherited cbbOpcao: TComboBox
          Width = 105
        end
      end
    end
  end
end
