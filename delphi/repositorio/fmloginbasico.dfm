object frmLoginBasico: TfrmLoginBasico
  Left = 442
  Top = 226
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  ActiveControl = edtUsuario
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'tecLUX - Login'
  ClientHeight = 104
  ClientWidth = 294
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -13
  Font.Name = 'helvetica'
  Font.Pitch = fpVariable
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = True
  Position = poScreenCenter
  Scaled = False
  Visible = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object pnlLogin: TPanel
    Left = 0
    Top = 0
    Width = 294
    Height = 104
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object lblUsuario: TLabel
      Left = 130
      Top = 17
      Width = 44
      Height = 16
      Caption = '&Usu'#225'rio'
      FocusControl = edtUsuario
    end
    object lblSenha: TLabel
      Left = 137
      Top = 44
      Width = 37
      Height = 16
      Caption = '&Senha'
      FocusControl = edtSenha
    end
    object edtUsuario: TEdit
      Left = 178
      Top = 14
      Width = 100
      Height = 24
      CharCase = ecLowerCase
      TabOrder = 0
      OnKeyDown = edtUsuarioKeyDown
    end
    object edtSenha: TEdit
      Left = 178
      Top = 41
      Width = 100
      Height = 24
      CharCase = ecLowerCase
      PasswordChar = '*'
      TabOrder = 1
      OnKeyDown = edtSenhaKeyDown
    end
    object btnOk: TButton
      Left = 149
      Top = 72
      Width = 65
      Height = 23
      Caption = 'O&K'
      TabOrder = 2
      OnClick = btnOkClick
    end
    object btnCancelar: TButton
      Left = 216
      Top = 72
      Width = 65
      Height = 23
      Caption = '&Cancelar'
      TabOrder = 3
      OnClick = btnCancelarClick
    end
  end
end
