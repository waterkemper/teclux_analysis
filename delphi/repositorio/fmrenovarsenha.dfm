object frmRenovarSenha: TfrmRenovarSenha
  Left = 358
  Top = 197
  Width = 242
  Height = 134
  ActiveControl = edtSenha
  Caption = 'Renovar Senha'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -13
  Font.Name = 'Microsoft Sans Serif'
  Font.Pitch = fpVariable
  Font.Style = []
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    0000000080000080000000808000800000008000800080800000C0C0C0008080
    80000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000087888800000000000000000000000
    0000088887800000000000000000000000000000877780000000000000000000
    0000000000877880000000000000000000000000800077888000000000000000
    0000000000884877888000000000000000000000000087777888000000000000
    0000000000000087778800000000000000000877888780007778800000000000
    00008F7788877000087788000000000000007F77880000000877780000000000
    00007F7780008877777778000000000000008F77880877788000000000000000
    0000077788007778000000000000000000000777880007778000000000000000
    000000F778800087778000000000000000000077788000087778000000000000
    000000877880000008777000000000000000000F778800000008F00000000000
    0000000777880000000000000000000000000008778880000000000000000000
    000008FFF77888877800000000000000000000777F7778887800000000000000
    0000000007F77800000000000000000000000000007F77000000000000000000
    000000000007F70000000000000000000000000000007F800000000000000000
    000000000000000000000000000000000000000000000000000000000000FFFF
    FFFFFFFFFFFFFE0FFFFFFC01FFFFFE007FFFFF801FFFFFF007FFFFF101FFFFFC
    00FFFFFC007FFF80007FFF00003FFE00301FFE00001FFE02001FFE00003FFF00
    07FFFF0101FFFF8080FFFF80C07FFF80E03FFFC0783FFFC07E7FFF8003FFFF00
    01FFFF8001FFFFC003FFFFF81FFFFFFC1FFFFFFE0FFFFFFF1FFFFFFFFFFF}
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 226
    Height = 96
    Align = alClient
    TabOrder = 0
    object lblSenha: TLabel
      Left = 55
      Top = 14
      Width = 37
      Height = 16
      Alignment = taRightJustify
      Caption = 'Senha'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
    end
    object lblConfirmarSenha: TLabel
      Left = 20
      Top = 39
      Width = 72
      Height = 16
      Alignment = taRightJustify
      Caption = 'Confirma'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
    end
    object edtSenha: TEdit
      Left = 95
      Top = 10
      Width = 120
      Height = 22
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 1
      OnKeyDown = edtSenhaKeyDown
    end
    object edtConfirmarSenha: TEdit
      Left = 95
      Top = 34
      Width = 120
      Height = 22
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 3
      OnKeyDown = edtConfirmarSenhaKeyDown
    end
    object btnOk: TButton
      Left = 59
      Top = 64
      Width = 65
      Height = 23
      Caption = 'O&K'
      TabOrder = 0
      OnClick = btnOkClick
    end
    object btnCancelar: TButton
      Left = 126
      Top = 64
      Width = 65
      Height = 23
      Caption = '&Cancelar'
      TabOrder = 2
      OnClick = btnCancelarClick
    end
  end
end
