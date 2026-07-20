object frmImportarContasECF: TfrmImportarContasECF
  Left = 659
  Top = 322
  Width = 347
  Height = 195
  Caption = 'Importar Contas de Outros Periodos'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object gbxExercicio: TGroupBox
    Left = 118
    Top = 5
    Width = 83
    Height = 48
    Caption = ' EXERC'#205'CIO'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -9
    Font.Name = 'helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object edtAnoExercicio: TSpinEdit
      Left = 3
      Top = 10
      Width = 78
      Height = 34
      TabStop = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      MaxValue = 0
      MinValue = 0
      ParentFont = False
      TabOrder = 0
      Value = 2008
    end
  end
  object rbnOpcao: TRadioGroup
    Left = 72
    Top = 64
    Width = 185
    Height = 49
    Caption = 'Op'#231#227'o de importa'#231#227'o'
    ItemIndex = 0
    Items.Strings = (
      'Todas as contas deste quadro'
      'Somente conta atual')
    TabOrder = 1
  end
  object bbnOK: TBitBtn
    Left = 71
    Top = 124
    Width = 89
    Height = 25
    Caption = '&OK'
    TabOrder = 2
    Kind = bkOK
  end
  object bbnCancelar: TBitBtn
    Left = 167
    Top = 124
    Width = 89
    Height = 25
    Caption = '&Cancelar'
    TabOrder = 3
    Kind = bkCancel
  end
end
