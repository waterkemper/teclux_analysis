
inherited frmSituacaoCarta: TfrmSituacaoCarta
  Left = 288
  Top = 181
  ActiveControl = edtDevolvida
  Caption = 'Situação da Carta'
  ClientHeight = 147
  ClientWidth = 456
  Scaled = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBarra: TPanel
    Top = 40
    Width = 264
    Height = 1
    inherited bvlBotoesEd: TBevel
      Left = 58
    end
  end
  object pnlFundoJanela: TPanel [1]
    Left = 0
    Top = 53
    Width = 456
    Height = 94
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 3
    TabOrder = 2
    object gbxSituacaoCarta: TGroupBox
      Left = 3
      Top = 3
      Width = 450
      Height = 88
      Align = alClient
      TabOrder = 0
      object lblDevolvida: TLabel
        Left = 12
        Top = 11
        Width = 47
        Height = 13
        Caption = 'Devolvida'
      end
      object lblConfirmada: TLabel
        Left = 7
        Top = 33
        Width = 55
        Height = 13
        Caption = 'Confirmada'
      end
      object edtDevolvida: TDBEditData
        Left = 62
        Top = 7
        Width = 69
        Height = 21
        DataField = 'voltou'
        DataSource = dtmAviso.dsrCartas
        Maximo = 0
        Minimo = 37353
        Adicional = 0
        TabOrder = 0
        Opcional = True
      end
      object edtConfirmada: TDBEditData
        Left = 62
        Top = 29
        Width = 69
        Height = 21
        DataField = 'confirmacao'
        DataSource = dtmAviso.dsrCartas
        Maximo = 0
        Minimo = 37353
        Adicional = 0
        TabOrder = 3
        OnKeyDown = edtConfirmadaKeyDown
        Opcional = True
      end
      object ckbMarcar: TDBCheckBox
        Left = 140
        Top = 11
        Width = 57
        Height = 15
        Caption = 'Marcar'
        DataField = 'marcar'
        DataSource = dtmAviso.dsrCartas
        TabOrder = 1
        ValueChecked = 'True'
        ValueUnchecked = 'False'
        OnClick = ckbMarcarClick
      end
      object ckbConfirmarTodasCartas: TCheckBox
        Left = 7
        Top = 49
        Width = 280
        Height = 22
        Caption = 'Confirmar todas as cartas enviadas e não confirmadas'
        TabOrder = 2
      end
    end
  end
  inherited pnlTopMenu: TPanel
    Width = 456
    inherited tblBarra: TToolBar
      Left = 240
      Width = 216
      inherited sbnProcurar: TSpeedButton
        Width = 73
        Visible = False
      end
      inherited tbnDivisor: TToolButton
        Left = 73
      end
      inherited sbnAjuda: TSpeedButton
        Left = 81
      end
    end
    inherited tblBarraCadastro: TToolBar
      Width = 240
      inherited sbnSalvar: TSpeedButton [0]
        Left = 0
        Enabled = True
      end
      inherited sbnIncluir: TSpeedButton [1]
        Left = 75
        Width = 86
        Visible = False
      end
      inherited sbnExcluir: TSpeedButton
        Left = 161
        Visible = False
      end
    end
  end
end
