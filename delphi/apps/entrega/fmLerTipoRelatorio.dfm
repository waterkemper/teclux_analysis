inherited frmLerTipoRelatorio: TfrmLerTipoRelatorio
  Left = 581
  Top = 289
  Width = 216
  Height = 188
  HorzScrollBar.Range = 193
  HorzScrollBar.Visible = False
  VertScrollBar.Range = 113
  VertScrollBar.Visible = False
  Caption = ''
  PixelsPerInch = 96
  TextHeight = 16
  object pnlFundoJanela: TPanel
    Left = 0
    Top = 0
    Width = 196
    Height = 146
    Align = alClient
    BorderWidth = 3
    TabOrder = 0
    object lblRelatorio: TLabel
      Left = 19
      Top = 2
      Width = 49
      Height = 12
      Caption = ' IMPRIMIR '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
    end
    object bbnCancelar: TBitBtn
      Left = 101
      Top = 111
      Width = 80
      Height = 25
      Caption = '&Cancelar'
      TabOrder = 0
      TabStop = False
      Kind = bkCancel
    end
    object rgpTipodeRelatorio: TRadioGroup
      Left = 10
      Top = 12
      Width = 174
      Height = 64
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        'Notas do Romaneio'
        'Produtos do Romaneio')
      ParentFont = False
      TabOrder = 1
    end
    object ckbInclurCancelados: TCheckBox
      Left = 55
      Top = 79
      Width = 129
      Height = 18
      Caption = 'INCLUIR CANCELADOS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object bbnOK: TBitBtn
      Left = 10
      Top = 111
      Width = 79
      Height = 25
      Caption = '&OK'
      TabOrder = 2
      TabStop = False
      Kind = bkOK
    end
  end
end
