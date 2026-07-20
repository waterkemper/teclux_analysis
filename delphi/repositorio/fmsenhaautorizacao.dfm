object frmSenhaAutorizacao: TfrmSenhaAutorizacao
  Left = 352
  Top = 257
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  ActiveControl = edtSenha
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'tecSOFT'
  ClientHeight = 79
  ClientWidth = 264
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -13
  Font.Name = 'helvetica'
  Font.Pitch = fpVariable
  Font.Style = []
  OldCreateOrder = True
  Position = poDesktopCenter
  Scaled = False
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 16
  object gbxSenhaAutorizacao: TGroupBox
    Left = 0
    Top = 0
    Width = 264
    Height = 79
    Align = alClient
    TabOrder = 0
    object lblDescricao: TLabel
      Left = 9
      Top = 12
      Width = 110
      Height = 16
      Caption = 'Informe sua senha.'
    end
    object edtSenha: TEdit
      Left = 11
      Top = 29
      Width = 124
      Height = 24
      PasswordChar = '*'
      TabOrder = 0
      OnKeyDown = edtSenhaKeyDown
    end
    object bbnOK: TBitBtn
      Left = 159
      Top = 12
      Width = 89
      Height = 25
      Caption = '&OK'
      TabOrder = 1
      Kind = bkOK
    end
    object bbnCancelar: TBitBtn
      Left = 159
      Top = 36
      Width = 89
      Height = 25
      Caption = '&Cancelar'
      TabOrder = 2
      Kind = bkCancel
    end
    object pnlSeparador: TPanel
      Left = 145
      Top = 2
      Width = 3
      Height = 68
      BevelOuter = bvLowered
      TabOrder = 3
    end
  end
end
