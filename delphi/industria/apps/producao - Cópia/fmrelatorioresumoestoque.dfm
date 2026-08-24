inherited frmRelatorioResumoEstoque: TfrmRelatorioResumoEstoque
  Left = 437
  Top = 92
  ActiveControl = edfDataInicial
  Caption = 'Relatorio Resumo do Estoque'
  ClientHeight = 655
  ClientWidth = 466
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBarra: TPanel
    Left = 0
    Top = 40
    Width = 466
    Height = 615
    Align = alClient
    Visible = True
    inherited bvlBotoesEd: TBevel
      Left = 1
      Top = 614
      Width = 464
      Height = 0
      Align = alBottom
      Visible = False
    end
    object gbxconsumomateriais: TGroupBox
      Left = 10
      Top = 55
      Width = 397
      Height = 106
      Caption = 'CONSUMO DE MATERIAIS NO PER'#205'ODO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object gbxConsumoTotal: TGroupBox
        Left = 0
        Top = 76
        Width = 397
        Height = 30
        TabOrder = 3
        object lblConsumoTotal: TLabel
          Left = 10
          Top = 11
          Width = 37
          Height = 15
          Caption = 'TOTAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edtConsumoTotal: TDBEditNumero
          Left = 293
          Top = 7
          Width = 101
          Height = 23
          TabStop = False
          BevelInner = bvNone
          BevelOuter = bvNone
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          MaxLength = -1
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          Text = '0,00'
          Mascara = True
          TipoMascara = tmGERAL
          NrDecimal = 2
          Decimais = True
          Negativo = False
          Tamanho = 9
          DataField = 'TOTAL_CONSUMO'
          DataSource = dtmRelatorioResumoEstoque.dsrResumoEstoqueKrahIce
        end
      end
      object gbxConsumoEmbalagem: TGroupBox
        Left = 0
        Top = 55
        Width = 397
        Height = 30
        TabOrder = 2
        object lblConsumoEmbalagem: TLabel
          Left = 10
          Top = 11
          Width = 131
          Height = 15
          Caption = 'Material de Embalagem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
        end
        object edtConsumoEmbalagem: TDBEditNumero
          Left = 293
          Top = 7
          Width = 101
          Height = 23
          TabStop = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = -1
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          Text = '0,00'
          Mascara = True
          TipoMascara = tmGERAL
          NrDecimal = 2
          Decimais = True
          Negativo = False
          Tamanho = 9
          DataField = 'consumo_embalagem'
          DataSource = dtmRelatorioResumoEstoque.dsrResumoEstoqueKrahIce
        end
      end
      object gbxConsumoPorcelana: TGroupBox
        Left = 0
        Top = 34
        Width = 397
        Height = 30
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object lblConsumoPorcelana: TLabel
          Left = 10
          Top = 11
          Width = 56
          Height = 15
          Caption = 'Porcelana'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
        end
        object edtConsumoPorcelana: TDBEditNumero
          Left = 293
          Top = 7
          Width = 101
          Height = 23
          TabStop = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = -1
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          Text = '0,00'
          Mascara = True
          TipoMascara = tmGERAL
          NrDecimal = 2
          Decimais = True
          Negativo = False
          Tamanho = 9
          DataField = 'consumo_porcelana'
          DataSource = dtmRelatorioResumoEstoque.dsrResumoEstoqueKrahIce
        end
      end
      object gbxConsumoMateriaPrima: TGroupBox
        Left = 0
        Top = 13
        Width = 397
        Height = 30
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object lblConsumoMateriaPrima: TLabel
          Left = 10
          Top = 11
          Width = 76
          Height = 15
          Caption = 'Mat'#233'ria-prima'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
        end
        object edtConsumoMateriaPrima: TDBEditNumero
          Left = 293
          Top = 7
          Width = 101
          Height = 23
          TabStop = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = -1
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          Text = '0,00'
          Mascara = True
          TipoMascara = tmGERAL
          NrDecimal = 2
          Decimais = True
          Negativo = False
          Tamanho = 9
          DataField = 'consumo_materiaprima'
          DataSource = dtmRelatorioResumoEstoque.dsrResumoEstoqueKrahIce
        end
      end
    end
    object gbxMateriaisFabricados: TGroupBox
      Left = 10
      Top = 176
      Width = 397
      Height = 64
      Caption = 'MATERIAIS FABRICADOS PELA KRAH-ICE EM 31/08/2010'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      object gbxFabricadolEstoque: TGroupBox
        Left = 0
        Top = 34
        Width = 397
        Height = 30
        TabOrder = 1
        object lbFabricadolEstoque: TLabel
          Left = 10
          Top = 11
          Width = 46
          Height = 15
          Caption = 'Estoque'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
        end
        object edtFabricadolEstoque: TDBEditNumero
          Left = 293
          Top = 7
          Width = 101
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
          Text = '0,00'
          Mascara = True
          TipoMascara = tmGERAL
          NrDecimal = 2
          Decimais = True
          Negativo = False
          Tamanho = 9
          DataField = 'fabricados_estoque'
          DataSource = dtmRelatorioResumoEstoque.dsrResumoEstoqueKrahIce
        end
      end
      object gbxFabricadolConsumo: TGroupBox
        Left = 0
        Top = 13
        Width = 397
        Height = 30
        TabOrder = 0
        object lbFabricadolConsumo: TLabel
          Left = 10
          Top = 11
          Width = 55
          Height = 15
          Caption = 'Consumo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
        end
        object edtabricadolConsumo: TDBEditNumero
          Left = 293
          Top = 7
          Width = 101
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
          Text = '0,00'
          Mascara = True
          TipoMascara = tmGERAL
          NrDecimal = 2
          Decimais = True
          Negativo = False
          Tamanho = 9
          DataField = 'fabricados_consumo'
          DataSource = dtmRelatorioResumoEstoque.dsrResumoEstoqueKrahIce
        end
      end
    end
    object gbxEstoqueResistores: TGroupBox
      Left = 10
      Top = 257
      Width = 397
      Height = 85
      Caption = 'ESTOQUE DE RESISTORES EM TR'#194'NSITO 31/08/2010'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      object gbxResistoresTotal: TGroupBox
        Left = 0
        Top = 55
        Width = 397
        Height = 30
        TabOrder = 2
        object lblResistoresTotal: TLabel
          Left = 10
          Top = 11
          Width = 37
          Height = 15
          Caption = 'TOTAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edtResistoresTotal: TDBEditNumero
          Left = 293
          Top = 7
          Width = 101
          Height = 23
          TabStop = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          MaxLength = -1
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          Text = '0,00'
          Mascara = True
          TipoMascara = tmGERAL
          NrDecimal = 2
          Decimais = True
          Negativo = False
          Tamanho = 9
          DataField = 'TOTAL_ESTOQUERESISTORES'
          DataSource = dtmRelatorioResumoEstoque.dsrResumoEstoqueKrahIce
        end
      end
      object gbxResistoresSemiAcabados: TGroupBox
        Left = 0
        Top = 34
        Width = 397
        Height = 30
        TabOrder = 1
        object lblResistoresSemiAcabados: TLabel
          Left = 10
          Top = 11
          Width = 152
          Height = 15
          Caption = 'Resistores Semi-acabados'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
        end
        object edtResistoresSemiAcabados: TDBEditNumero
          Left = 293
          Top = 7
          Width = 101
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
          Text = '0,00'
          Mascara = True
          TipoMascara = tmGERAL
          NrDecimal = 2
          Decimais = True
          Negativo = False
          Tamanho = 9
          DataField = 'estoque_resistores_semiacabados'
          DataSource = dtmRelatorioResumoEstoque.dsrResumoEstoqueKrahIce
        end
      end
      object gbxResistoresAcabados: TGroupBox
        Left = 0
        Top = 13
        Width = 397
        Height = 30
        TabOrder = 0
        object lblResistoresAcabados: TLabel
          Left = 10
          Top = 11
          Width = 118
          Height = 15
          Caption = 'Resistores Acabados'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
        end
        object edtResistoresAcabados: TDBEditNumero
          Left = 293
          Top = 7
          Width = 101
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
          Text = '0,00'
          Mascara = True
          TipoMascara = tmGERAL
          NrDecimal = 2
          Decimais = True
          Negativo = False
          Tamanho = 9
          DataField = 'estoque_resistores_acabados'
          DataSource = dtmRelatorioResumoEstoque.dsrResumoEstoqueKrahIce
        end
      end
    end
    object gbxResumo: TGroupBox
      Left = 10
      Top = 481
      Width = 397
      Height = 127
      Caption = 'R E S U M O'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      object gbxTotalMateriaPrima: TGroupBox
        Left = 0
        Top = 97
        Width = 397
        Height = 30
        TabOrder = 4
        object edtTotalMateriaPrima: TDBEditNumero
          Left = 293
          Top = 7
          Width = 101
          Height = 23
          TabStop = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          MaxLength = -1
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          Text = '0,00'
          Mascara = True
          TipoMascara = tmGERAL
          NrDecimal = 2
          Decimais = True
          Negativo = False
          Tamanho = 9
          DataField = 'TOTAL_RESUMO'
          DataSource = dtmRelatorioResumoEstoque.dsrResumoEstoqueKrahIce
        end
        object lblTotalMateriaPrima: TPanel
          Left = 10
          Top = 11
          Width = 236
          Height = 15
          BevelOuter = bvNone
          Caption = 'TOTAL DE MAT'#201'RIA-PRIMA EM 31/08/2010'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
      end
      object gbxRetornoMateriaPrima: TGroupBox
        Left = 0
        Top = 76
        Width = 397
        Height = 30
        TabOrder = 3
        object lblRetornoMateriaPrima: TLabel
          Left = 10
          Top = 11
          Width = 231
          Height = 15
          Caption = '(+) Retorno de Mat'#233'ria-prima da Produ'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
        end
        object edtRetornoMateriaPrima: TDBEditNumero
          Left = 293
          Top = 7
          Width = 101
          Height = 23
          TabStop = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = -1
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          Text = '0,00'
          Mascara = True
          TipoMascara = tmGERAL
          NrDecimal = 2
          Decimais = True
          Negativo = False
          Tamanho = 9
          DataField = 'retorno_materiaprima'
          DataSource = dtmRelatorioResumoEstoque.dsrResumoEstoqueKrahIce
        end
      end
      object gbxConsumo_MateriaPrima: TGroupBox
        Left = 0
        Top = 55
        Width = 397
        Height = 30
        TabOrder = 2
        object lblConsumo_MateriaPrima: TLabel
          Left = 10
          Top = 11
          Width = 229
          Height = 15
          Caption = '(-) Consumo de Mat'#233'ria-prima no Per'#237'odo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
        end
        object edtConsumo_MateriaPrima: TDBEditNumero
          Left = 293
          Top = 7
          Width = 101
          Height = 23
          TabStop = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = -1
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          Text = '0,00'
          Mascara = True
          TipoMascara = tmGERAL
          NrDecimal = 2
          Decimais = True
          Negativo = False
          Tamanho = 9
          DataField = 'consumo_materiaprima'
          DataSource = dtmRelatorioResumoEstoque.dsrResumoEstoqueKrahIce
        end
      end
      object gbxCompraMateriaPrima: TGroupBox
        Left = 0
        Top = 34
        Width = 397
        Height = 30
        TabOrder = 1
        object lblCompraMateriaPrima: TLabel
          Left = 10
          Top = 11
          Width = 222
          Height = 15
          Caption = '(+) Compra de Mat'#233'ria-prima no Per'#237'odo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
        end
        object edtCompraMateriaPrima: TDBEditNumero
          Left = 293
          Top = 7
          Width = 101
          Height = 23
          TabStop = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = -1
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          Text = '0,00'
          Mascara = True
          TipoMascara = tmGERAL
          NrDecimal = 2
          Decimais = True
          Negativo = False
          Tamanho = 9
          DataField = 'compra_materiaprima'
          DataSource = dtmRelatorioResumoEstoque.dsrResumoEstoqueKrahIce
        end
      end
      object gbxMateriaPrimaFinal: TGroupBox
        Left = 0
        Top = 13
        Width = 397
        Height = 30
        TabOrder = 0
        object lblMateriaPrimaFinal: TLabel
          Left = 10
          Top = 11
          Width = 228
          Height = 15
          Caption = 'Estoque de Mat'#233'ria-prima em 31/07/2010'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
        end
        object edtMateriaPrimaFinal: TDBEditNumero
          Left = 293
          Top = 7
          Width = 101
          Height = 23
          TabStop = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = -1
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          Text = '0,00'
          Mascara = True
          TipoMascara = tmGERAL
          NrDecimal = 2
          Decimais = True
          Negativo = False
          Tamanho = 9
          DataField = 'estoque_materia_prima_anterior'
          DataSource = dtmRelatorioResumoEstoque.dsrResumoEstoqueKrahIce
        end
      end
    end
    object gbxPeriodo: TGroupBox
      Left = 10
      Top = 10
      Width = 170
      Height = 36
      Caption = ' PER'#205'ODO '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object lblA: TLabel
        Left = 82
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
      object edfDataInicial: TtecDbEditFind
        Left = 2
        Top = 10
        Width = 75
        Height = 23
        Alignment = taLeftJustify
        DataField = 'datainicial'
        DataSource = dtmRelatorioResumoEstoque.dsrResumoEstoqueKrahIce
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        Group = 'PERIODO'
        MaxLength = 8
        Maximo = 0
        Minimo = 37353
        Adicional = 0
        Opcional = True
        OnFound = edfDataFinalFound
        OnKeyDown = edfDataInicialKeyDown
        ParentFont = False
        TabOrder = 0
        PermitirZero = False
        PermitirNulo = False
        Operacao = opPESQUISA
        Parameter = 'datainicial'
        ActiveSetControls = True
        DenyInsert = False
        NoSetControls = <
          item
            Control = gbxPeriodo
          end>
        SetControls = <
          item
            Control = gbxconsumomateriais
          end
          item
            Control = gbxMateriaisFabricados
          end
          item
            Control = gbxEstoqueResistores
          end
          item
            Control = gbxResumo
          end
          item
            Control = gbxEstoqueMateriais
          end>
      end
      object edfDataFinal: TtecDbEditFind
        Left = 92
        Top = 10
        Width = 75
        Height = 23
        Alignment = taLeftJustify
        DataField = 'datafinal'
        DataSource = dtmRelatorioResumoEstoque.dsrResumoEstoqueKrahIce
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        Group = 'PERIODO'
        MaxLength = 8
        Maximo = 0
        Minimo = 37353
        Adicional = 0
        Opcional = True
        OnFound = edfDataFinalFound
        ParentFont = False
        TabOrder = 1
        PermitirZero = False
        PermitirNulo = False
        Operacao = opPESQUISA
        Parameter = 'datafinal'
      end
    end
    object gbxEstoqueMateriais: TGroupBox
      Left = 10
      Top = 359
      Width = 397
      Height = 106
      Caption = 'ESTOQUE DE MATERIAIS EM 31/08/2010'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      object gbxEstoqueTotal: TGroupBox
        Left = 0
        Top = 76
        Width = 397
        Height = 30
        TabOrder = 3
        object lblEstoqueTotal: TLabel
          Left = 10
          Top = 11
          Width = 37
          Height = 15
          Caption = 'TOTAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edtEstoqueTotal: TDBEditNumero
          Left = 293
          Top = 7
          Width = 101
          Height = 23
          TabStop = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          MaxLength = -1
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          Text = '0,00'
          Mascara = True
          TipoMascara = tmGERAL
          NrDecimal = 2
          Decimais = True
          Negativo = False
          Tamanho = 9
          DataField = 'TOTAL_ESTOQUE'
          DataSource = dtmRelatorioResumoEstoque.dsrResumoEstoqueKrahIce
        end
      end
      object gbxEstoqueEmbalagem: TGroupBox
        Left = 0
        Top = 55
        Width = 397
        Height = 30
        TabOrder = 2
        object lblEstoqueEmbalagem: TLabel
          Left = 10
          Top = 11
          Width = 131
          Height = 15
          Caption = 'Material de Embalagem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
        end
        object edtEstoqueEmbalagem: TDBEditNumero
          Left = 293
          Top = 7
          Width = 101
          Height = 23
          TabStop = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = -1
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          Text = '0,00'
          Mascara = True
          TipoMascara = tmGERAL
          NrDecimal = 2
          Decimais = True
          Negativo = False
          Tamanho = 9
          DataField = 'estoque_embalagem'
          DataSource = dtmRelatorioResumoEstoque.dsrResumoEstoqueKrahIce
        end
      end
      object gbxEstoquePorcelana: TGroupBox
        Left = 0
        Top = 34
        Width = 397
        Height = 30
        TabOrder = 1
        object lblEstoquePorcelana: TLabel
          Left = 10
          Top = 11
          Width = 56
          Height = 15
          Caption = 'Porcelana'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
        end
        object edtEstoquePorcelana: TDBEditNumero
          Left = 293
          Top = 7
          Width = 101
          Height = 23
          TabStop = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = -1
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          Text = '0,00'
          Mascara = True
          TipoMascara = tmGERAL
          NrDecimal = 2
          Decimais = True
          Negativo = False
          Tamanho = 9
          DataField = 'estoque_porcelana'
          DataSource = dtmRelatorioResumoEstoque.dsrResumoEstoqueKrahIce
        end
      end
      object gbxEstoqueMateriaPrima: TGroupBox
        Left = 0
        Top = 13
        Width = 397
        Height = 30
        TabOrder = 0
        object lblEstoqueMateriaPrima: TLabel
          Left = 10
          Top = 11
          Width = 76
          Height = 15
          Caption = 'Mat'#233'ria-prima'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
        end
        object edtEstoqueMateriaPrima: TDBEditNumero
          Left = 293
          Top = 7
          Width = 101
          Height = 23
          TabStop = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = -1
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          Text = '0,00'
          Mascara = True
          TipoMascara = tmGERAL
          NrDecimal = 2
          Decimais = True
          Negativo = False
          Tamanho = 9
          DataField = 'estoque_materia_prima'
          DataSource = dtmRelatorioResumoEstoque.dsrResumoEstoqueKrahIce
        end
      end
    end
  end
  inherited pnlTopMenu: TPanel
    Width = 466
    inherited tblBarra: TToolBar
      Left = 300
      Width = 166
      inherited sbnProcurar: TSpeedButton
        Visible = False
      end
      inherited sbnAjuda: TSpeedButton
        Action = Action1
      end
    end
    inherited tblBarraCadastro: TToolBar
      Width = 300
      inherited sbnIncluir: TSpeedButton
        Visible = False
      end
      object sbnImprimir: TSpeedButton
        Left = 225
        Top = 2
        Width = 75
        Height = 35
        Hint = 'Visualizar como o relat'#243'rio ser'#225' impresso'
        Caption = 'Imprimir F7'
        Flat = True
        Glyph.Data = {
          F6030000424DF603000000000000360000002800000013000000100000000100
          180000000000C0030000120B0000120B00000000000000000000DCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC000000DCDCDCDCDCDCDCDCDC00
          0000000000000000000000000000000000000000000000000000000000000000
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC000000DCDCDCDCDCDC000000C0C7C0C0C7
          C0C0C7C0C0C7C0C0C7C0C0C7C0C0C7C0C0C7C0C0C7C0000000C0C7C0000000DC
          DCDCDCDCDCDCDCDCDCDCDC000000DCDCDC000000000000000000000000000000
          000000000000000000000000000000000000000000000000C0C7C0000000DCDC
          DCDCDCDCDCDCDC000000DCDCDC000000C0C7C0C0C7C0C0C7C0C0C7C0C0C7C0C0
          C7C000FFFF00FFFF00FFFFC0C7C0C0C7C0000000000000000000DCDCDCDCDCDC
          DCDCDC000000DCDCDC000000C0C7C0C0C7C0C0C7C0C0C7C0C0C7C0C0C7C08087
          80808780808780C0C7C0C0C7C0000000C0C7C0000000DCDCDCDCDCDCDCDCDC00
          0000DCDCDC000000000000000000000000000000000000000000000000000000
          000000000000000000000000C0C7C0C0C7C0000000DCDCDCDCDCDC000000DCDC
          DC000000C0C7C0C0C7C0C0C7C0C0C7C0C0C7C0C0C7C0C0C7C0C0C7C0C0C7C0C0
          C7C0000000C0C7C0000000C0C7C0000000DCDCDCDCDCDC000000DCDCDCDCDCDC
          000000000000000000000000000000000000000000000000000000000000C0C7
          C0000000C0C7C0000000000000DCDCDCDCDCDC000000DCDCDCDCDCDCDCDCDC00
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000C0C7C0
          000000C0C7C0000000DCDCDCDCDCDC000000DCDCDCDCDCDCDCDCDCDCDCDC0000
          00FFFFFF000000000000000000000000000000FFFFFF00000000000000000000
          0000DCDCDCDCDCDCDCDCDC000000DCDCDCDCDCDCDCDCDCDCDCDC000000FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000DCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDC000000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC000000FFFFFF00
          0000000000000000000000000000FFFFFF000000DCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDC000000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC000000FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000DCDCDCDCDCDCDCDCDCDCDCDC00
          0000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC000000000000000000000000
          000000000000000000000000000000DCDCDCDCDCDCDCDCDCDCDCDC000000DCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC000000}
        Layout = blGlyphTop
        Spacing = 0
        OnClick = sbnImprimirClick
      end
    end
  end
  object ActionList1: TActionList
    Left = 320
    Top = 16
    object Action1: TAction
      Caption = 'Action1'
      OnUpdate = Action1Update
    end
  end
end
