object Form1: TForm1
  Left = 196
  Top = 179
  Width = 742
  Height = 576
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 8
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Build test file'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 168
    Top = 48
    Width = 561
    Height = 497
    Anchors = [akLeft, akTop, akRight, akBottom]
    Lines.Strings = (
      'Memo1')
    TabOrder = 1
  end
  object Button2: TButton
    Left = 88
    Top = 16
    Width = 129
    Height = 25
    Caption = 'Load test file and re-save'
    TabOrder = 2
    OnClick = Button2Click
  end
  object TreeView1: TTreeView
    Left = 8
    Top = 48
    Width = 153
    Height = 297
    Indent = 19
    TabOrder = 3
    OnChange = TreeView1Change
  end
  object Edit1: TEdit
    Left = 8
    Top = 520
    Width = 153
    Height = 21
    Enabled = False
    TabOrder = 4
    Text = 'Edit1'
  end
  object Memo2: TMemo
    Left = 8
    Top = 352
    Width = 153
    Height = 161
    Enabled = False
    Lines.Strings = (
      'Memo2')
    TabOrder = 5
  end
  object XML: TECXMLParser
    Left = 224
    Top = 16
  end
end
