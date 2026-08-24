inherited frmdre: Tfrmdre
  Left = 969
  Top = 252
  Caption = 'Demonstrativo de Resultados - DRE'
<<<<<<< fmdre.dfm
  ClientHeight = 146
  ClientWidth = 603
=======
  ClientHeight = 156
  ClientWidth = 457
>>>>>>> 1.6
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBarra: TToolBar
<<<<<<< fmdre.dfm
    Width = 603
=======
    Width = 457
>>>>>>> 1.6
  end
  inherited pnlFundoJanela: TPanel
<<<<<<< fmdre.dfm
    Top = 39
    Width = 603
    Height = 107
    object rgpRegime: TRadioGroup
      Left = 180
      Top = 4
      Width = 240
      Height = 89
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ItemIndex = 1
      Items.Strings = (
        'Regime de Caixa'
        'Regime de Compet'#234'ncia')
      ParentFont = False
      TabOrder = 4
    end
=======
    Top = 49
    Width = 457
    Height = 107
>>>>>>> 1.6
    object gbxPeriodo: TGroupBox
      Left = 10
      Top = 6
      Width = 162
      Height = 36
      Caption = ' PER'#205'ODO DO DRE '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object lblA: TLabel
        Left = 77
        Top = 15
        Width = 7
        Height = 15
        Caption = 'a'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
      end
      object edtDataInicial: TEditData
        Left = 2
        Top = 10
        Width = 70
        Height = 23
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        MaxLength = 10
        ParentFont = False
        TabOrder = 0
        Minimo = 37353
        Maximo = 0
      end
      object edtDataFinal: TEditData
        Left = 89
        Top = 10
        Width = 70
        Height = 23
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        MaxLength = 10
        ParentFont = False
        TabOrder = 1
        Minimo = 37353
        Maximo = 0
      end
    end
    object rgpAgrupamento: TRadioGroup
      Left = 428
      Top = 4
      Width = 125
      Height = 89
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        'por Grupos'
        'por Classes'
        'Somente Totais')
      ParentFont = False
      TabOrder = 1
    end
<<<<<<< fmdre.dfm
    object StaticText1: TStaticText
      Left = 434
      Top = 4
=======
    object stxResumo: TStaticText
      Left = 194
      Top = 5
>>>>>>> 1.6
      Width = 47
      Height = 16
      Caption = ' RESUMO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
<<<<<<< fmdre.dfm
    object StaticText2: TStaticText
      Left = 185
      Top = 4
      Width = 96
      Height = 16
      Caption = ' FORMA DO REGIME'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
=======
    object rdpRegime: TRadioGroup
      Left = 323
      Top = 4
      Width = 121
      Height = 61
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        'Caixa'
        'Compet'#234'ncia')
      ParentFont = False
      TabOrder = 4
    end
    object stxRegime: TStaticText
      Left = 332
      Top = 5
      Width = 62
      Height = 16
      Caption = ' REGIME DE '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
>>>>>>> 1.6
  end
end
