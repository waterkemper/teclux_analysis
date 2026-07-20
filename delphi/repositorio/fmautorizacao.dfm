inherited frmAutorizacao: TfrmAutorizacao
  Caption = 'tecLUX - Autoriza'#231#227'o'
  ClientHeight = 107
  ClientWidth = 343
  Constraints.MaxWidth = 359
  Constraints.MinHeight = 103
  Constraints.MinWidth = 343
  Visible = False
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlLogin: TPanel
    Width = 343
    Height = 107
    inherited lblUsuario: TLabel
      Left = 10
      Alignment = taRightJustify
    end
    inherited lblSenha: TLabel
      Left = 12
      Alignment = taRightJustify
    end
    inherited edtUsuario: TEdit
      Left = 59
      Width = 80
    end
    inherited edtSenha: TEdit
      Left = 59
      Width = 80
    end
    inherited btnOk: TButton
      Left = 10
      Top = 75
      Anchors = [akLeft, akBottom]
    end
    inherited btnCancelar: TButton
      Left = 74
      Top = 75
      Anchors = [akLeft, akBottom]
    end
    object mmoMensagem: TMemo
      Left = 146
      Top = 6
      Width = 190
      Height = 92
      TabStop = False
      Anchors = [akLeft, akTop, akRight, akBottom]
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 4
    end
  end
end
