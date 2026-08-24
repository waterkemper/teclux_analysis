object Form1: TForm1
  Left = 335
  Top = 136
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'TFormRoller Demo'
  ClientHeight = 453
  ClientWidth = 340
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 120
    Top = 32
    Width = 86
    Height = 13
    Caption = 'Press Exit to close'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 8
    Top = 72
    Width = 321
    Height = 201
    BevelOuter = bvLowered
    Color = clInfoBk
    TabOrder = 0
    object Label2: TLabel
      Left = 8
      Top = 8
      Width = 122
      Height = 13
      Caption = '_GetDisappeared(TForm):'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label3: TLabel
      Left = 136
      Top = 8
      Width = 167
      Height = 13
      Caption = 'Close the form with animation'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label4: TLabel
      Left = 50
      Top = 24
      Width = 80
      Height = 13
      Caption = 'ddLeaveToRight'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label5: TLabel
      Left = 136
      Top = 24
      Width = 157
      Height = 13
      Caption = 'Roll TForm from Left to Right side'
      Transparent = True
    end
    object Label6: TLabel
      Left = 57
      Top = 40
      Width = 73
      Height = 13
      Caption = 'ddLeaveToLeft'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label7: TLabel
      Left = 136
      Top = 40
      Width = 157
      Height = 13
      Caption = 'Roll TForm from Right to Left side'
      Transparent = True
    end
    object Label8: TLabel
      Left = 42
      Top = 56
      Width = 88
      Height = 13
      Caption = 'ddLeaveToBottom'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label9: TLabel
      Left = 56
      Top = 72
      Width = 74
      Height = 13
      Caption = 'ddLeaveToTop'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label10: TLabel
      Left = 136
      Top = 56
      Width = 169
      Height = 13
      Caption = 'Roll TForm from  Top to Bottom side'
      Transparent = True
    end
    object Label11: TLabel
      Left = 136
      Top = 72
      Width = 166
      Height = 13
      Caption = 'Roll TForm from Bottom to Top side'
      Transparent = True
    end
    object Label12: TLabel
      Left = 22
      Top = 112
      Width = 108
      Height = 13
      Caption = '_GetAppeared(TForm):'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label13: TLabel
      Left = 136
      Top = 112
      Width = 171
      Height = 13
      Caption = 'Show the form with animation.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label14: TLabel
      Left = 77
      Top = 130
      Width = 53
      Height = 13
      Caption = 'adFromLeft'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label15: TLabel
      Left = 136
      Top = 130
      Width = 157
      Height = 13
      Caption = 'Roll TForm from Left to Right side'
      Transparent = True
    end
    object Label16: TLabel
      Left = 136
      Top = 146
      Width = 157
      Height = 13
      Caption = 'Roll TForm from Right to Left side'
      Transparent = True
    end
    object Label17: TLabel
      Left = 70
      Top = 146
      Width = 60
      Height = 13
      Caption = 'adFromRight'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label18: TLabel
      Left = 76
      Top = 162
      Width = 54
      Height = 13
      Caption = 'adFromTop'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label19: TLabel
      Left = 136
      Top = 162
      Width = 169
      Height = 13
      Caption = 'Roll TForm from  Top to Bottom side'
      Transparent = True
    end
    object Label20: TLabel
      Left = 136
      Top = 178
      Width = 166
      Height = 13
      Caption = 'Roll TForm from Bottom to Top side'
      Transparent = True
    end
    object Label21: TLabel
      Left = 62
      Top = 178
      Width = 68
      Height = 13
      Caption = 'adFromBottom'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
  end
  object Button1: TButton
    Left = 16
    Top = 336
    Width = 75
    Height = 25
    Caption = '>>'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 256
    Top = 336
    Width = 75
    Height = 25
    Caption = '<<'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 128
    Top = 408
    Width = 75
    Height = 25
    Caption = 'Bottom'
    TabOrder = 3
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 128
    Top = 280
    Width = 75
    Height = 25
    Caption = 'Top'
    TabOrder = 4
    OnClick = Button4Click
  end
  object mainRoller: TRollForms
    DesappearTo = ddLeaveToRight
    AppearFrom = adFromLeft
    CollapsForm = False
    PlaySound = True
    LeaveSound = '_leave.wav'
    Left = 240
    Top = 24
  end
  object topr: TRollForms
    DesappearTo = ddLeaveToRight
    AppearFrom = adFromTop
    CollapsForm = False
    PlaySound = True
    EnterSound = '_enter.wav'
    Left = 152
    Top = 304
  end
  object leftr: TRollForms
    DesappearTo = ddLeaveToRight
    AppearFrom = adFromLeft
    CollapsForm = False
    PlaySound = True
    EnterSound = '_enter.wav'
    Left = 88
    Top = 336
  end
  object rightr: TRollForms
    DesappearTo = ddLeaveToRight
    AppearFrom = adFromRight
    CollapsForm = False
    PlaySound = True
    EnterSound = '_enter.wav'
    Left = 224
    Top = 336
  end
  object botr: TRollForms
    DesappearTo = ddLeaveToRight
    AppearFrom = adFromBottom
    CollapsForm = False
    PlaySound = True
    EnterSound = '_enter.wav'
    Left = 152
    Top = 376
  end
end
