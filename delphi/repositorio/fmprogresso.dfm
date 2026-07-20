inherited frmProgresso: TfrmProgresso
  Left = 247
  Top = 427
  ActiveControl = btnCancelar
  BorderIcons = [biSystemMenu]
  ClientHeight = 63
  ClientWidth = 449
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnlFundoJanela: TPanel
    Left = 0
    Top = 0
    Width = 449
    Height = 63
    Align = alClient
    BevelWidth = 2
    TabOrder = 0
    object lblProcessando: TLabel
      Left = 2
      Top = 2
      Width = 445
      Height = 31
      Align = alTop
      Alignment = taCenter
      AutoSize = False
      Caption = 'Aguarde... Processando.'
      Layout = tlCenter
    end
    object pgbAndamento: TProgressBar
      Left = 6
      Top = 31
      Width = 250
      Height = 23
      Min = 0
      Max = 100
      TabOrder = 1
    end
    object btnCancelar: TButton
      Left = 259
      Top = 31
      Width = 76
      Height = 23
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 0
    end
  end
end
