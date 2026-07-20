inherited frmTrocaSenha: TfrmTrocaSenha
  Left = 272
  Top = 137
  ActiveControl = edtAtual
  Caption = 'Trocar senha do usu'#225'rio'
  ClientHeight = 161
  ClientWidth = 293
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 16
  object pnlFundoJanela: TPanel
    Left = 0
    Top = 0
    Width = 293
    Height = 161
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 3
    TabOrder = 0
    object gbxFundoJanela: TGroupBox
      Left = 3
      Top = 3
      Width = 287
      Height = 155
      Align = alClient
      TabOrder = 0
      object lblAtual: TLabel
        Left = 58
        Top = 18
        Width = 69
        Height = 16
        Alignment = taRightJustify
        Caption = 'Senha atual'
      end
      object lblNova: TLabel
        Left = 60
        Top = 45
        Width = 67
        Height = 16
        Alignment = taRightJustify
        Caption = 'Nova senha'
      end
      object lblConfirma: TLabel
        Left = 3
        Top = 72
        Width = 124
        Height = 16
        Alignment = taRightJustify
        Caption = 'Confirmar nova senha'
      end
      object edtAtual: TEdit
        Left = 132
        Top = 15
        Width = 120
        Height = 24
        PasswordChar = '*'
        TabOrder = 0
      end
      object edtNova: TEdit
        Left = 132
        Top = 42
        Width = 120
        Height = 24
        PasswordChar = '*'
        TabOrder = 1
      end
      object edtConfirma: TEdit
        Left = 132
        Top = 69
        Width = 120
        Height = 24
        PasswordChar = '*'
        TabOrder = 2
      end
      object bbnOK: TBitBtn
        Left = 56
        Top = 108
        Width = 75
        Height = 25
        Caption = 'OK'
        ModalResult = 1
        TabOrder = 4
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
        Left = 141
        Top = 108
        Width = 75
        Height = 25
        Caption = 'Cancelar'
        TabOrder = 3
        Kind = bkCancel
      end
    end
  end
end
