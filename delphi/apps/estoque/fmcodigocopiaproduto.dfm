object frmCodigoCopiaProduto: TfrmCodigoCopiaProduto
  Left = 535
  Top = 181
  Width = 286
  Height = 139
  BiDiMode = bdLeftToRight
  Caption = 'C'#243'digo do Novo Produto'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  ParentBiDiMode = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 40
    Top = 8
    Width = 188
    Height = 13
    Caption = 'Digite o C'#243'digo do Novo Produto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object BitBtn1: TBitBtn
    Left = 40
    Top = 56
    Width = 75
    Height = 25
    Caption = 'Gravar'
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 153
    Top = 56
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 1
    OnClick = BitBtn2Click
  end
  object edCodigoProduto: TMaskEdit
    Left = 40
    Top = 24
    Width = 186
    Height = 21
    EditMask = '999999999999999999;1;_'
    MaxLength = 18
    TabOrder = 2
    Text = '                  '
  end
end
