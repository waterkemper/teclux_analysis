object frmselecionarquantidades: Tfrmselecionarquantidades
  Left = 448
  Top = 272
  Width = 276
  Height = 203
  ActiveControl = rgpquantidade
  BorderIcons = [biMaximize]
  Caption = 'Usar quantidade'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = True
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object pnlFundo: TPanel
    Left = 0
    Top = 0
    Width = 260
    Height = 165
    Align = alClient
    TabOrder = 0
    object rgpquantidade: TRadioGroup
      Left = 8
      Top = 8
      Width = 241
      Height = 101
      Caption = 'Quantidade pela:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Pitch = fpVariable
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        'M'#233'dia de vendas'
        'Estoque m'#237'nimo'
        'Estoque m'#225'ximo')
      ParentFont = False
      TabOrder = 0
    end
    object btnSelecionar: TBitBtn
      Left = 64
      Top = 111
      Width = 113
      Height = 28
      Caption = '&Selecionar'
      TabOrder = 1
      OnClick = btnSelecionarClick
      Kind = bkOK
    end
  end
end
