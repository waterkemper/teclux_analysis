object frmVendasAnteriores: TfrmVendasAnteriores
  Left = 260
  Top = 248
  Width = 980
  Height = 488
  Caption = 'Vendas Anteriores'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  inline fraVendasAnteriores1: TfraVendasAnteriores
    Left = 0
    Top = 0
    Width = 964
    Height = 450
    Align = alClient
    TabOrder = 0
    inherited DBAdvGridProdutosporCliente: TDBAdvGrid
      Width = 964
      Height = 450
    end
  end
end
