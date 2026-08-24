inherited frmComandosECF: TfrmComandosECF
  Left = 437
  Top = 189
  ActiveControl = sbnAberturaGaveta
  BorderIcons = []
  Caption = 'Comandos ECF'
  ClientHeight = 222
  ClientWidth = 255
  ParentFont = True
  Position = poScreenCenter
  Scaled = True
  PixelsPerInch = 96
  TextHeight = 16
  object pnlFundoJanela: TPanel
    Left = 0
    Top = 0
    Width = 255
    Height = 222
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object btnReducaoZ: TButton
      Left = 0
      Top = 30
      Width = 246
      Height = 30
      Caption = 'Redu'#231#227'o &Z'
      TabOrder = 1
      OnClick = btnReducaoZClick
    end
    object btnLeituraX: TButton
      Left = 0
      Top = 60
      Width = 246
      Height = 31
      Caption = 'Leitura &X'
      TabOrder = 2
      OnClick = btnLeituraXClick
    end
    object btnCancelarCupom: TButton
      Left = 0
      Top = 91
      Width = 246
      Height = 31
      Caption = '&Cancelar Cupom'
      TabOrder = 3
      OnClick = btnCancelarCupomClick
    end
    object btnFinalizarVinculado: TButton
      Left = 0
      Top = 122
      Width = 246
      Height = 31
      Caption = 'Finalizar &Vinculado'
      TabOrder = 4
      OnClick = btnFinalizarVinculadoClick
    end
    object btnLeituraMemoriaFiscalData: TButton
      Left = 0
      Top = 153
      Width = 246
      Height = 30
      Caption = 'Leitura da Mem'#243'ria Fiscal por &Data'
      TabOrder = 5
      OnClick = btnLeituraMemoriaFiscalDataClick
    end
    object btnLeituraMemoriaFiscalReducao: TButton
      Left = 0
      Top = 183
      Width = 246
      Height = 31
      Caption = 'Leitura da Mem'#243'ria Fiscal por &Redu'#231#227'o'
      TabOrder = 6
      OnClick = btnLeituraMemoriaFiscalReducaoClick
    end
    object sbnAberturaGaveta: TButton
      Left = 0
      Top = 0
      Width = 246
      Height = 31
      Caption = 'Abertura &Gaveta'
      TabOrder = 0
      OnClick = sbnAberturaGavetaClick
    end
  end
end
