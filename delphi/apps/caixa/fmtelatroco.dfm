inherited frmtelatroco: Tfrmtelatroco
  Left = 560
  Top = 350
  ActiveControl = sbnconfirma
  BorderIcons = [biSystemMenu]
  Caption = 'Troco'
  ClientHeight = 130
  ClientWidth = 239
  PixelsPerInch = 96
  TextHeight = 16
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 239
    Height = 130
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 2
      Top = 18
      Width = 235
      Height = 30
      Align = alTop
      Alignment = taCenter
      Caption = 'TROCO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -21
      Font.Name = 'Arial Black'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
    end
    object lblTroco: TLabel
      Left = 0
      Top = 40
      Width = 239
      Height = 48
      Alignment = taCenter
      AutoSize = False
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -37
      Font.Name = 'Arial Black'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object sbnconfirma: TBitBtn
      Left = 80
      Top = 96
      Width = 75
      Height = 25
      TabOrder = 0
      OnClick = sbnconfirmaClick
      Kind = bkOK
    end
  end
  object Timer: TTimer
    Interval = 300
    OnTimer = TimerTimer
    Left = 184
    Top = 8
  end
end
