inherited frmAlteracoes: TfrmAlteracoes
  Left = 956
  Top = 205
  Width = 255
  Height = 224
  HorzScrollBar.Range = 809
  HorzScrollBar.Visible = False
  VertScrollBar.Range = 656
  VertScrollBar.Visible = False
  ActiveControl = bbnOK
  AutoSize = False
  Caption = 'Altera'#231#245'es'
  PixelsPerInch = 96
  TextHeight = 16
  object rgpSelecionar: TtecDBRadioGroup
    Left = 10
    Top = 1
    Width = 127
    Height = 119
    Caption = 'ALTERA'#199#195'O'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -9
    Font.Name = 'Arial'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    TabStop = False
    object rbnQuitacao: TtecRadioButton
      Left = 8
      Top = 17
      Width = 78
      Height = 17
      Caption = 'Quita'#231#227'o'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TabStop = True
      Value = 'Q'
    end
    object rbnRescisao: TtecRadioButton
      Left = 8
      Top = 41
      Width = 78
      Height = 17
      Caption = 'Rescis'#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Value = 'R'
    end
    object rbnTransferencia: TtecRadioButton
      Left = 8
      Top = 65
      Width = 105
      Height = 17
      Caption = 'Transfer'#234'ncia'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Value = 'T'
    end
    object rbnRenegociacao: TtecRadioButton
      Left = 8
      Top = 91
      Width = 105
      Height = 17
      Caption = 'Renegocia'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      Value = 'G'
    end
  end
  object gbxData: TGroupBox
    Left = 141
    Top = 0
    Width = 80
    Height = 36
    Caption = 'NA DATA'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -9
    Font.Name = 'Microsoft Sans Serif'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object edtData: TEditData
      Left = 2
      Top = 10
      Width = 75
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Minimo = 37353
      Maximo = 0
    end
  end
  object bbnOK: TBitBtn
    Left = 20
    Top = 141
    Width = 85
    Height = 26
    Caption = '&OK'
    Default = True
    TabOrder = 2
    OnClick = bbnOKClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      04000000000068010000120B0000120B00001000000010000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object bbnCancelar: TBitBtn
    Left = 128
    Top = 141
    Width = 85
    Height = 26
    Caption = '&Cancelar'
    TabOrder = 3
    Kind = bkCancel
  end
  object pnlHorizontal: TPanel
    Left = 0
    Top = 131
    Width = 225
    Height = 1
    BevelOuter = bvLowered
    TabOrder = 4
  end
end
