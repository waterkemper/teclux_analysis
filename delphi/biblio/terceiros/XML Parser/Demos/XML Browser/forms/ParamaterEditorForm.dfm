object frmEditParam: TfrmEditParam
  Left = 196
  Top = 179
  BorderStyle = bsDialog
  Caption = 'New/Edit Paramater'
  ClientHeight = 115
  ClientWidth = 236
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 31
    Height = 13
    Caption = 'Name:'
  end
  object Label2: TLabel
    Left = 8
    Top = 48
    Width = 30
    Height = 13
    Caption = 'Value:'
  end
  object edName: TEdit
    Left = 16
    Top = 24
    Width = 209
    Height = 21
    TabOrder = 0
    Text = 'edName'
    OnChange = edNameChange
    OnKeyPress = edNameKeyPress
  end
  object edValue: TEdit
    Left = 16
    Top = 64
    Width = 209
    Height = 21
    TabOrder = 1
    Text = 'edValue'
    OnChange = edNameChange
  end
  object btnCancel: TButton
    Left = 152
    Top = 88
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
  end
  object btnOk: TButton
    Left = 72
    Top = 88
    Width = 75
    Height = 25
    Caption = 'Ok'
    Enabled = False
    ModalResult = 1
    TabOrder = 3
  end
end
