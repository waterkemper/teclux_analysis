inherited frmCadastroChequesRepassados: TfrmCadastroChequesRepassados
  Left = 471
  Top = 220
  ActiveControl = fraCMC71
  Caption = 'Cadastro de cheques repassados'
  ClientHeight = 190
  ClientWidth = 341
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBarra: TPanel
    Left = 0
    Top = 40
    Width = 341
    Height = 150
    Align = alClient
    Visible = True
    inherited bvlBotoesEd: TBevel
      Left = 1
      Top = 149
      Width = 339
      Height = 0
      Align = alBottom
    end
    inline fraCMC71: TfraCMC7
      Left = 6
      Top = 3
      Width = 328
      Height = 139
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
  end
  inherited pnlTopMenu: TPanel
    Width = 341
    inherited tblBarra: TToolBar
      Width = 116
      inherited sbnProcurar: TSpeedButton
        Visible = False
      end
    end
  end
end
