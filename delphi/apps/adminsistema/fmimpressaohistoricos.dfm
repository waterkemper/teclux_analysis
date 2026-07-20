inherited frmImpressaoHistoricos: TfrmImpressaoHistoricos
  Left = 393
  Top = 245
  Width = 360
  Height = 181
  HorzScrollBar.Range = 393
  HorzScrollBar.Visible = False
  VertScrollBar.Range = 105
  VertScrollBar.Visible = False
  ActiveControl = rgpOrdenacao
  BorderStyle = bsSingle
  Caption = 'Impress'#227'o de hist'#243'ricos'
  PixelsPerInch = 96
  TextHeight = 16
  object rgpOrdenacao: TRadioGroup
    Left = 6
    Top = 0
    Width = 98
    Height = 95
    Caption = 'Ordena'#231#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    ItemIndex = 1
    Items.Strings = (
      'C'#243'digo'
      'Descri'#231#227'o'
      'Inatividade')
    ParentFont = False
    TabOrder = 0
  end
  object rgpInativos: TRadioGroup
    Left = 115
    Top = 0
    Width = 65
    Height = 65
    Caption = 'Inativos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    ItemIndex = 1
    Items.Strings = (
      'Sim'
      'N'#227'o')
    ParentFont = False
    TabOrder = 1
  end
  object gbxOpcoes: TGroupBox
    Left = 191
    Top = 0
    Width = 132
    Height = 95
    Caption = 'Usado em'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object ckbCaixa: TCheckBox
      Left = 8
      Top = 16
      Width = 117
      Height = 25
      Caption = 'Caixa'
      Checked = True
      State = cbChecked
      TabOrder = 0
    end
    object ckbContasapagar: TCheckBox
      Left = 8
      Top = 40
      Width = 117
      Height = 25
      Caption = 'Contas a pagar'
      Checked = True
      State = cbChecked
      TabOrder = 1
    end
    object ckbContabilidade: TCheckBox
      Left = 8
      Top = 64
      Width = 117
      Height = 25
      Caption = 'Contabilidade'
      Checked = True
      State = cbChecked
      TabOrder = 2
    end
  end
  object pnlsepara: TPanel
    Left = -37
    Top = 97
    Width = 361
    Height = 11
    BevelOuter = bvLowered
    TabOrder = 3
  end
  object bbnOK: TBitBtn
    Left = 83
    Top = 109
    Width = 85
    Height = 23
    Caption = '&OK'
    TabOrder = 4
    Kind = bkOK
  end
  object bbnCancelar: TBitBtn
    Left = 183
    Top = 109
    Width = 85
    Height = 23
    Caption = '&Cancelar'
    TabOrder = 5
    Kind = bkCancel
  end
end
