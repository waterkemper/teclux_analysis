inherited frmOpcaoLeituraMemoriaFiscalMenuFiscal: TfrmOpcaoLeituraMemoriaFiscalMenuFiscal
  Left = 727
  Top = 179
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Leitura Mem'#243'ria Fiscal'
  ClientHeight = 256
  ClientWidth = 563
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  KeyPreview = False
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object rgpFonteDados: TRadioGroup
    Left = 5
    Top = 2
    Width = 132
    Height = 71
    Caption = 'DADOS'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    ItemIndex = 0
    Items.Strings = (
      'PER'#205'ODO'
      'CRZ')
    ParentFont = False
    TabOrder = 0
    OnClick = rgpFonteDadosClick
  end
  object gbxFaixas: TGroupBox
    Left = 5
    Top = 89
    Width = 132
    Height = 73
    Caption = 'PER'#205'ODOs'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object lblDe: TLabel
      Left = 8
      Top = 23
      Width = 14
      Height = 15
      Caption = 'de'
    end
    object lblAte: TLabel
      Left = 8
      Top = 47
      Width = 17
      Height = 15
      Caption = 'at'#233
    end
    object pnlCupons: TPanel
      Left = 34
      Top = 15
      Width = 86
      Height = 53
      BevelOuter = bvNone
      TabOrder = 1
      object edtCupomInicial: TEditNumero
        Left = 2
        Top = 2
        Width = 80
        Height = 23
        MaxLength = -1
        TabOrder = 0
        Mascara = True
        Alignment = taLeftJustify
        TipoMascara = tmGERAL
        NrDecimal = 0
        Decimais = False
        Negativo = False
        Tamanho = 9
      end
      object edtCupomFinal: TEditNumero
        Left = 2
        Top = 27
        Width = 80
        Height = 23
        MaxLength = -1
        TabOrder = 1
        Mascara = True
        Alignment = taLeftJustify
        TipoMascara = tmGERAL
        NrDecimal = 0
        Decimais = False
        Negativo = False
        Tamanho = 9
      end
    end
    object pnlDatas: TPanel
      Left = 33
      Top = 15
      Width = 86
      Height = 53
      BevelOuter = bvNone
      TabOrder = 0
      object edtPeriodoInicial: TEditData
        Left = 2
        Top = 2
        Width = 80
        Height = 23
        TabOrder = 0
        Minimo = 37353
        Maximo = 0
      end
      object edtPeriodoFinal: TEditData
        Left = 2
        Top = 27
        Width = 80
        Height = 23
        TabOrder = 1
        Minimo = 37353
        Maximo = 0
      end
    end
  end
  object rgpDestino: TRadioGroup
    Left = 5
    Top = 180
    Width = 131
    Height = 65
    Caption = 'SA'#205'DA'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    ItemIndex = 0
    Items.Strings = (
      'ECF'
      'ARQUIVO')
    ParentFont = False
    TabOrder = 2
  end
  object btnLMFS: TButton
    Left = 151
    Top = 41
    Width = 239
    Height = 25
    Caption = 'Leitura Mem'#243'ria Fiscal Simplificada'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Helvetica'
    Font.Pitch = fpVariable
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = btnLMFSClick
  end
  object btnLMFC: TButton
    Left = 151
    Top = 8
    Width = 238
    Height = 25
    Caption = 'Leitura Mem'#243'ria Fiscal Completa'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Helvetica'
    Font.Pitch = fpVariable
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = btnLMFCClick
  end
  object gbxArquivoSaida: TGroupBox
    Left = 137
    Top = 181
    Width = 417
    Height = 65
    Caption = 'Arquivo Sa'#237'da'
    TabOrder = 5
    object lblArquivoSaida: TLabel
      Left = 12
      Top = 17
      Width = 396
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
    end
  end
end
