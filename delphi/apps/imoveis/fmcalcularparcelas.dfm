inherited frmCalcularParcelas: TfrmCalcularParcelas
  Left = 286
  Top = 218
  Caption = 'Calcular Parcelas'
  ClientHeight = 165
  ClientWidth = 502
  Color = clBtnFace
  PixelsPerInch = 96
  object gbxParametros: TGroupBox
    Left = 0
    Top = 0
    Width = 502
    Height = 165
    Align = alClient
    TabOrder = 0
    object sbnGerarParcelas: TSpeedButton
      Left = 420
      Top = 13
      Width = 75
      Height = 45
      Hint = 'Gerar duplicatas'
      Caption = 'Gerar F11'
      Glyph.Data = {
        E2030000424DDE03000000000000360000002800000011000000120000000100
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
    end
    object gbxNrParcelas: TGroupBox
      Left = 10
      Top = 54
      Width = 79
      Height = 40
      Alignment = taCenter
      Caption = 'N'#186' PARCELAS'
      Font.Color = clBlack
      font.height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      Font.Weight = 40
      ParentFont = False
      TabOrder = 1
      object edtNrParcelas: TEditNumero
        Left = 4
        Top = 12
        Width = 69
        Height = 24
        Alignment = taRightJustify
        Font.Color = clBlack
        font.height = -13
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        Font.Weight = 40
        ParentFont = False
        TabOrder = 0
        Mascara = False
        TipoMascara = tmGERAL
        NrDecimal = 2
        Decimais = False
        Negativo = False
        Tamanho = 2
      end
    end
    object gbxVencto: TGroupBox
      Left = 98
      Top = 6
      Width = 83
      Height = 40
      Alignment = taCenter
      Caption = '1'#186' VENCIMENTO'
      Font.Color = clBlack
      font.height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      Font.Weight = 40
      ParentFont = False
      TabOrder = 2
      object edtVencimento: TEditData
        Left = 3
        Top = 12
        Width = 75
        Height = 23
        Font.Color = clBlack
        font.height = -13
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        Font.Weight = 40
        ParentFont = False
        TabOrder = 0
        Minimo = 37353
        Maximo = 3650
      end
    end
    object gbxIntervalo: TGroupBox
      Left = 98
      Top = 54
      Width = 83
      Height = 40
      Alignment = taCenter
      Caption = 'INTERVALO'
      Font.Color = clBlack
      font.height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      Font.Weight = 40
      ParentFont = False
      TabOrder = 3
      object Label1: TLabel
        Left = 57
        Top = 15
        Width = 24
        Height = 16
        Caption = 'dias'
        Font.Color = clBlack
        font.height = -13
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        Font.Weight = 40
        ParentFont = False
      end
      object edtIntervalo: TEditNumero
        Left = 3
        Top = 12
        Width = 51
        Height = 24
        Alignment = taRightJustify
        Font.Color = clBlack
        font.height = -13
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        Font.Weight = 40
        ParentFont = False
        TabOrder = 1
        Mascara = False
        TipoMascara = tmGERAL
        NrDecimal = 0
        Decimais = False
        Negativo = False
        Tamanho = 2
      end
    end
    object gbxTipoParcela: TGroupBox
      Left = 10
      Top = 6
      Width = 79
      Height = 40
      Alignment = taCenter
      Caption = 'TIPO PARCELA'
      Font.Color = clBlack
      font.height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      Font.Weight = 40
      ParentFont = False
      TabOrder = 0
      object edtTipoParcela: TEditTexto
        Left = 4
        Top = 12
        Width = 69
        Height = 24
        Alignment = taCenter
        Font.Color = clBlack
        font.height = -13
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        Font.Weight = 40
        MaxLength = 2
        ParentFont = False
        TabOrder = 0
        CharCasenoDefault = False
      end
    end
    object gbxDataBase: TGroupBox
      Left = 186
      Top = 6
      Width = 83
      Height = 40
      Alignment = taCenter
      Caption = 'DATA BASE'
      Font.Color = clBlack
      font.height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      Font.Weight = 40
      ParentFont = False
      TabOrder = 4
      object EditData1: TEditData
        Left = 3
        Top = 12
        Width = 75
        Height = 23
        Font.Color = clBlack
        font.height = -13
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        Font.Weight = 40
        ParentFont = False
        TabOrder = 0
        Minimo = 37353
        Maximo = 3650
      end
    end
    object gbxJuros: TGroupBox
      Left = 10
      Top = 102
      Width = 170
      Height = 54
      Caption = 'JUROS'
      Font.Color = clBlack
      font.height = -11
      Font.Name = 'Arial'
      Font.Pitch = fpVariable
      Font.Style = []
      Font.Weight = 40
      ParentFont = False
      TabOrder = 6
      object gbxTaxaJuros: TGroupBox
        Left = 87
        Top = 12
        Width = 79
        Height = 40
        Caption = 'TAXA'
        Font.Color = clBlack
        font.height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        Font.Weight = 40
        ParentFont = False
        TabOrder = 0
        object EditNumero1: TEditNumero
          Left = 4
          Top = 12
          Width = 69
          Height = 24
          Alignment = taRightJustify
          Font.Color = clBlack
          font.height = -13
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          Font.Weight = 40
          ParentFont = False
          TabOrder = 0
          Mascara = False
          TipoMascara = tmGERAL
          NrDecimal = 2
          Decimais = False
          Negativo = False
          Tamanho = 2
        end
      end
      object gbxDataJuros: TGroupBox
        Left = 3
        Top = 12
        Width = 83
        Height = 40
        Caption = 'DATA'
        Font.Color = clBlack
        font.height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        Font.Weight = 40
        ParentFont = False
        TabOrder = 1
        object EditData2: TEditData
          Left = 3
          Top = 12
          Width = 75
          Height = 23
          Font.Color = clBlack
          font.height = -13
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          Font.Weight = 40
          ParentFont = False
          TabOrder = 0
          Minimo = 37353
          Maximo = 3650
        end
      end
    end
    object gbxMoeda: TGroupBox
      Left = 186
      Top = 54
      Width = 223
      Height = 40
      Caption = 'MOEDA'
      Font.Color = clBlack
      font.height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      Font.Weight = 40
      ParentFont = False
      TabOrder = 5
      inline fraConsultaMOeda: TfraConsultaCodigo
        Left = 2
        Top = 12
        Width = 215
        Height = 26
        VertScrollBar.Range = 23
        HorzScrollBar.Range = 215
        Font.Color = clBlack
        font.height = -11
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        Font.Weight = 40
        ParentFont = False
        TabOrder = 0
        inherited dtxDescricao: TtecDBText
          Width = 127
        end
        inherited edfCodigo: TtecDBFindLookup
          Parameter = ' '
          ActiveSetControls = False
          DenyInsert = False
          NoSetControls = <>
          SetControls = <>
          LookupParameter = ' '
        end
      end
    end
  end
  object ecvDuplicatas: TtecEditionControlValidation
    EditionControl = <
      item
        Control = edtIntervalo
      end
      item
        Control = edtNrParcelas
      end
      item
        Control = edtVencimento
      end>
    Left = 420
    Top = 66
  end
end
