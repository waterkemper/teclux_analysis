inherited frmProcessando: TfrmProcessando
  Left = 334
  Top = 324
  Width = 403
  Height = 100
  BorderIcons = [biSystemMenu]
  Caption = 'Mensagem de aviso'
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 16
  object pnlFundoJanela: TPanel
    Left = 0
    Top = 0
    Width = 383
    Height = 58
    Align = alClient
    BevelWidth = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Pitch = fpVariable
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object lblProcessando: TLabel
      Left = 2
      Top = 2
      Width = 379
      Height = 54
      Align = alClient
      Alignment = taCenter
      AutoSize = False
      Caption = 'Aguarde... Processando.'
      Layout = tlCenter
    end
    object lblMensagem: TLabel
      Left = 2
      Top = 56
      Width = 379
      Height = 0
      Align = alBottom
      Alignment = taCenter
      AutoSize = False
      Layout = tlCenter
    end
  end
end
