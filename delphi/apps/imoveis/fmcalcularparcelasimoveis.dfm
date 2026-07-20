inherited frmCalcularParcelasImoveis: TfrmCalcularParcelasImoveis
  Left = 429
  Top = 251
  ActiveControl = edtTipoParcela
  Caption = 'Calcular Parcelas'
  ClientHeight = 111
  ClientWidth = 560
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 16
  object gbxParametros: TGroupBox
    Left = 0
    Top = 0
    Width = 560
    Height = 111
    Align = alClient
    TabOrder = 0
    object sbnGerarParcelas: TSpeedButton
      Left = 475
      Top = 12
      Width = 75
      Height = 45
      Hint = 'Gerar duplicatas'
      Caption = 'Gerar F11'
      Glyph.Data = {
        DE030000424DDE03000000000000360000002800000011000000120000000100
        180000000000A8030000120B0000120B00000000000000000000DCDCDCDCDCDC
        DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
        DCDCDCDCDCDCDCDCDCDCDCDCDC00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
        DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
        DC00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
        DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC00DCDCDCDCDCDCDCDCDCDC
        DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
        DCDCDCDCDCDCDCDCDC00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC80878000
        0000808780DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC00DCDC
        DCDCDCDCDCDCDC80878000000080878000000000FFFF00000080878000000080
        8780DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC00DCDCDCDCDCDCDCDCDC00000000FF
        FF80878000000000FFFF00000080878000FFFF000000DCDCDCDCDCDCDCDCDCDC
        DCDCDCDCDC00DCDCDCDCDCDC00000080878080878000FFFF00FFFF00FFFF00FF
        FF00FFFF808780808780000000DCDCDCDCDCDCDCDCDCDCDCDC00DCDCDCDCDCDC
        80878000000000000000FFFF80878000000080878000FFFF0000000000008087
        80DCDCDCDCDCDCDCDCDCDCDCDC00DCDCDCDCDCDC00000000FFFF00FFFF00FFFF
        000000FFFFFF00000000FFFF00FFFF00FFFF000000DCDCDCDCDCDCDCDCDCDCDC
        DC00DCDCDCDCDCDC80878000000000000000FFFF80878000000080878000FFFF
        000000000000808780DCDCDCDCDCDCDCDCDCDCDCDC00DCDCDCDCDCDCDCDCDC80
        878080878000FFFF00FFFF00FFFF00FFFF00FFFF808780808780DCDCDCDCDCDC
        DCDCDCDCDCDCDCDCDC00DCDCDCDCDCDCDCDCDC00000000FFFF80878000000000
        FFFF00000080878000FFFF000000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC00DCDC
        DCDCDCDCDCDCDC80878000000080878000000000FFFF00000080878000000080
        8780DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC00DCDCDCDCDCDCDCDCDCDCDCDCDCDC
        DCDCDCDC808780000000808780DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
        DCDCDCDCDC00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
        DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC00DCDCDCDCDCDC
        DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
        DCDCDCDCDCDCDCDCDCDCDCDCDC00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
        DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
        DC00}
      Layout = blGlyphTop
      Spacing = 0
      OnClick = sbnGerarParcelasClick
    end
    object gbxNrParcelas: TGroupBox
      Left = 48
      Top = 19
      Width = 72
      Height = 36
      Caption = 'N'#186' PARCELAS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object edtNrParcelas: TEditNumero
        Left = 2
        Top = 10
        Width = 66
        Height = 23
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        MaxLength = 3
        ParentFont = False
        TabOrder = 0
        Mascara = False
        Alignment = taLeftJustify
        TipoMascara = tmGERAL
        NrDecimal = 2
        Decimais = False
        Negativo = False
        Tamanho = 3
      end
    end
    object gbxVencto: TGroupBox
      Left = 127
      Top = 19
      Width = 80
      Height = 36
      Caption = '1'#186' VENCTO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      object edtVencimento: TEditData
        Left = 2
        Top = 10
        Width = 75
        Height = 23
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Minimo = 37353
        Maximo = 9999
      end
    end
    object gbxIntervalo: TGroupBox
      Left = 215
      Top = 19
      Width = 79
      Height = 36
      Caption = 'INTERVALO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      object Label1: TLabel
        Left = 51
        Top = 15
        Width = 24
        Height = 16
        Caption = 'dias'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
      end
      object edtIntervalo: TEditNumero
        Left = 2
        Top = 10
        Width = 46
        Height = 23
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        MaxLength = 3
        ParentFont = False
        TabOrder = 0
        Mascara = False
        Alignment = taLeftJustify
        TipoMascara = tmGERAL
        NrDecimal = 0
        Decimais = False
        Negativo = False
        Tamanho = 3
      end
    end
    object gbxTipoParcela: TGroupBox
      Left = 10
      Top = 19
      Width = 31
      Height = 36
      Caption = 'TIPO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object edtTipoParcela: TEditTexto
        Left = 2
        Top = 10
        Width = 26
        Height = 23
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        MaxLength = 1
        ParentFont = False
        TabOrder = 0
        OnKeyDown = edtTipoParcelaKeyDown
        CharCasenoDefault = False
        Alignment = taLeftJustify
        CharValidos = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz'
      end
    end
    object gbxDataBase: TGroupBox
      Left = 216
      Top = 64
      Width = 80
      Height = 36
      Caption = 'DATA BASE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      object edtDataBase: TEditData
        Left = 2
        Top = 10
        Width = 75
        Height = 23
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Minimo = 37353
        Maximo = 60
      end
    end
    object gbxMoeda: TGroupBox
      Left = 10
      Top = 64
      Width = 197
      Height = 36
      Caption = 'MOEDA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      inline fraConsultaMOeda: TfraConsultaCodigo
        Left = 2
        Top = 10
        Width = 194
        Height = 24
        HorzScrollBar.Range = 192
        VertScrollBar.Range = 23
        AutoScroll = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        inherited sbnProcura: TSpeedButton
          Left = 41
        end
        inherited dtxDescricao: TtecDBText
          Left = 65
          Width = 127
          DataField = 'descricao'
          DataSource = fraConsultaMOeda.dsrProcuraMoedas
        end
        inherited edfCodigo: TtecDBFindLookup
          Width = 40
          DataField = 'codigo'
          DataSource = fraConsultaMOeda.dsrProcuraMoedas
          Group = 'Moedas'
          MaxLength = 10
          OnFound = nil
          Operacao = opPESQUISA
          Parameter = 'codigo'
          ActiveSetControls = False
          DenyInsert = True
          NoSetControls = <>
          SetControls = <>
        end
      end
    end
    object gbxValorParcela: TGroupBox
      Left = 301
      Top = 6
      Width = 164
      Height = 49
      Caption = 'VALOR DA PARCELA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      object edtValorParcela: TEditNumero
        Left = 2
        Top = 11
        Width = 159
        Height = 35
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        MaxLength = 10
        ParentFont = False
        TabOrder = 0
        Mascara = True
        Alignment = taLeftJustify
        TipoMascara = tmGERAL
        NrDecimal = 2
        Decimais = True
        Negativo = False
        Tamanho = 15
      end
    end
    object gbxTaxaJuros: TGroupBox
      Left = 304
      Top = 64
      Width = 66
      Height = 36
      Caption = 'TAXA JUROS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      object lblPercJuros: TLabel
        Left = 51
        Top = 15
        Width = 11
        Height = 15
        Caption = '%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
      end
      object edttaxaJuros: TEditNumero
        Left = 2
        Top = 10
        Width = 47
        Height = 23
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        MaxLength = -1
        ParentFont = False
        TabOrder = 0
        Mascara = False
        Alignment = taLeftJustify
        TipoMascara = tmGERAL
        NrDecimal = 4
        Decimais = True
        Negativo = False
        Tamanho = 10
      end
    end
    object gbxTipoJuros: TGroupBox
      Left = 378
      Top = 64
      Width = 92
      Height = 36
      Caption = 'TIPO DE JUROS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 8
      object ckbJurosCompostos: TCheckBox
        Left = 2
        Top = 11
        Width = 83
        Height = 21
        Caption = 'Compostos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
    end
  end
  object ecvValidacao: TtecEditionControlValidation
    EditionControl = <
      item
        Control = edtIntervalo
      end
      item
        Control = edtNrParcelas
      end
      item
        Control = edtTipoParcela
      end
      item
        Control = edtVencimento
      end>
    Left = 512
    Top = 75
  end
end
