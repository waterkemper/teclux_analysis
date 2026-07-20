inherited frmCadastroProdutoComposto: TfrmCadastroProdutoComposto
  Left = 474
  Top = 132
  Caption = 'Cadastro de Produto Composto'
  ClientHeight = 278
  ClientWidth = 734
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBarra: TPanel
    Width = 596
    inherited bvlBotoesEd: TBevel
      Left = 135
    end
  end
  inherited pnlTopMenu: TPanel
    Width = 734
    TabOrder = 2
    inherited tblBarra: TToolBar
      Width = 509
      inherited sbnProcurar: TSpeedButton
        Visible = False
      end
    end
    inherited tblBarraCadastro: TToolBar
      inherited sbnIncluir: TSpeedButton
        Enabled = False
      end
    end
  end
  object pnlFundoJanela: TPanel
    Left = 0
    Top = 40
    Width = 734
    Height = 238
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object gbxComposto: TGroupBox
      Left = -1
      Top = 0
      Width = 722
      Height = 36
      Caption = ' COMPOSTO '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object dtxProduto: TtecDBText
        Left = 234
        Top = 10
        Width = 485
        Height = 23
        TabStop = False
        Color = clBtnFace
        DataField = 'descricaolc'
        DataSource = dtmCadastroProdutos.dsrProdutos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        Alignment = taLeftJustify
      end
      object dtxCodigoProduto: TtecDBText
        Left = 2
        Top = 10
        Width = 230
        Height = 23
        TabStop = False
        Color = clBtnFace
        DataField = 'codigovisual'
        DataSource = dtmCadastroProdutos.dsrProdutos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        Alignment = taLeftJustify
      end
    end
    object gbxComponente: TGroupBox
      Left = 2
      Top = 48
      Width = 722
      Height = 36
      Caption = ' COMPONENTE '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object sbnConsultaProduto: TSpeedButton
        Left = 209
        Top = 11
        Width = 23
        Height = 23
        Hint = 'Procura produto a ser vendido'
        Flat = True
        Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000120B0000120B00000000000000000000DCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDC800000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFF7F7F7FFFFFFFDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DC800000800000800000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFF7F7F7F7F7F7F7F7F7FDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC8000
          00800000800000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCFFFFFF7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC8000008000
          00800000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCFFFFFF7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC8000008000008000
          00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFFFFFFFFFF
          FFFFDCDCDCFFFFFF7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCFFA858800000800000800000FFA858DCDCDC0000FF800000800000DCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFF7F7F7F7F7F7F7F7F7FDC
          DCDCFFFFFF7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          800000FFA858FFA858FFA858FFA858FFA8588000008000000000FFDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FDCDCDCDCDCDCDCDCDC7F
          7F7F7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC800000
          FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFA858FFA858
          FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858DCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDC7F7F7FDCDCDCFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC800000FFA858
          FFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFA858800000DCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC800000FFA858
          FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC800000FFA858
          FFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFA858800000DCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDC7F7F7FDCDCDCFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDC7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFA858FFA858
          FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858DCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC800000
          FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FDCDCDCFFFFFFFFFFFFDCDCDCDCDCDCDC
          DCDCFFFFFF7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          800000FFA858FFA858FFA858FFA858FFA858800000DCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FDCDCDCFFFFFFFFFFFF7F
          7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCFFA858800000800000800000FFA858DCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7FDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC}
        NumGlyphs = 2
        OnClick = sbnConsultaProdutoClick
      end
      object flkCodigoProduto: TtecDBFindLookup
        Left = 2
        Top = 11
        Width = 205
        Height = 23
        Alignment = taLeftJustify
        DataField = 'componentevisual'
        DataSource = dtmCadastroProdutos.dsrProdutoComposto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        MaxLength = 30
        Maximo = 0
        Minimo = 37353
        Adicional = 0
        Opcional = True
        ParentFont = False
        TabOrder = 0
        PermitirZero = False
        PermitirNulo = False
        Operacao = opATRIBUICAO
        LookupField = 'codigovisual'
        LookupSource = dtmCadastroProdutos.dsrProcuraProdutosCompostos
        Parameter = ' '
        ActiveSetControls = False
        DenyInsert = True
        NoSetControls = <>
        SetControls = <>
        LookupParameter = 'codigovisual'
      end
      object dtxDescricaoProduto: TtecDBText
        Left = 234
        Top = 10
        Width = 485
        Height = 23
        TabStop = False
        Color = clBtnFace
        DataField = 'descricao'
        DataSource = dtmCadastroProdutos.dsrProcuraProdutosCompostos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        Alignment = taLeftJustify
      end
    end
    object gbxQuantidade: TGroupBox
      Left = 0
      Top = 95
      Width = 140
      Height = 36
      Caption = ' QUANTIDADE '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      object edtQuantidade: TDBEditNumero
        Left = 2
        Top = 10
        Width = 135
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
        Text = 'edtQuantidade'
        Mascara = True
        Alignment = taLeftJustify
        TipoMascara = tmGERAL
        NrDecimal = 6
        Decimais = True
        Negativo = False
        Tamanho = 13
        DataField = 'quantidade'
        DataSource = dtmCadastroProdutos.dsrProdutoComposto
      end
    end
    object gbxPreco: TGroupBox
      Left = 544
      Top = 95
      Width = 125
      Height = 36
      Caption = ' PRE'#199'O '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      object edtPreco: TDBEditNumero
        Left = 2
        Top = 10
        Width = 119
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
        Text = 'edtPreco'
        Mascara = False
        Alignment = taLeftJustify
        TipoMascara = tmGERAL
        NrDecimal = 2
        Decimais = True
        Negativo = False
        Tamanho = 12
        DataField = 'preco'
        DataSource = dtmCadastroProdutos.dsrProdutoComposto
      end
    end
    object gbxTotalComponentes: TGroupBox
      Left = 544
      Top = 135
      Width = 121
      Height = 36
      Caption = 'TOTAL COMPONENTES'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 14
      object lblTotalComponentesValor: TLabel
        Left = 2
        Top = 10
        Width = 117
        Height = 23
        Alignment = taRightJustify
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
      end
    end
    object ckbFrete: TDBCheckBox
      Left = 1
      Top = 153
      Width = 160
      Height = 17
      Caption = 'Possui custo de frete'
      DataField = 'possuicustofrete'
      DataSource = dtmCadastroProdutos.dsrProdutoComposto
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
    object ckbQueima: TDBCheckBox
      Left = 1
      Top = 169
      Width = 160
      Height = 17
      Caption = 'Possui custo de queima'
      DataField = 'queima'
      DataSource = dtmCadastroProdutos.dsrProdutoComposto
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 8
      ValueChecked = 'True'
      ValueUnchecked = 'False'
      OnClick = ckbQueimaClick
    end
    object ckbimprimirosp: TDBCheckBox
      Left = 1
      Top = 185
      Width = 160
      Height = 17
      Caption = 'Imprimir na OSP'
      DataField = 'imprimirosp'
      DataSource = dtmCadastroProdutos.dsrProdutoComposto
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 9
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
    object gbxQtdadeCeramicaCarga: TGroupBox
      Left = 256
      Top = 134
      Width = 145
      Height = 36
      Caption = 'QTDE CER'#194'MICA / CARGA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 13
      object edtQtdadeCeramicaCarga: TDBEditNumero
        Left = 2
        Top = 10
        Width = 140
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
        Text = 'edtQtdadeCeramicaCarga'
        Mascara = False
        Alignment = taLeftJustify
        TipoMascara = tmGERAL
        NrDecimal = 0
        Decimais = False
        Negativo = False
        Tamanho = 13
        DataField = 'qtceramicacarga'
        DataSource = dtmCadastroProdutos.dsrProdutoComposto
      end
    end
    object gbxpercperda: TGroupBox
      Left = 176
      Top = 134
      Width = 70
      Height = 36
      Caption = ' % PERDA '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 12
      object edtpercperdaqueima: TDBEditNumero
        Left = 2
        Top = 10
        Width = 65
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
        Text = 'edtpercperdaqueima'
        Mascara = True
        Alignment = taLeftJustify
        TipoMascara = tmGERAL
        NrDecimal = 2
        Decimais = True
        Negativo = False
        Tamanho = 13
        DataField = 'percperda'
        DataSource = dtmCadastroProdutos.dsrProdutoComposto
      end
    end
    object ckbConsiderarCusto: TDBCheckBox
      Left = 1
      Top = 137
      Width = 160
      Height = 17
      Caption = 'Desconsiderar no custo'
      DataField = 'desconsiderarcusto'
      DataSource = dtmCadastroProdutos.dsrProdutoComposto
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
    object GroupBox1: TGroupBox
      Left = 146
      Top = 95
      Width = 255
      Height = 36
      Caption = ' UNIDADE '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      inline fraConsultaUnidade: TfraConsultaCodigo
        Left = 2
        Top = 9
        Width = 250
        Height = 25
        HorzScrollBar.Range = 497
        HorzScrollBar.Visible = False
        VertScrollBar.Range = 23
        VertScrollBar.Visible = False
        AutoScroll = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        inherited dtxDescricao: TtecDBText
          Width = 162
          DataField = 'descricao'
          DataSource = fraConsultaUnidade.dsrProcuraUnidades
        end
        inherited edfCodigo: TtecDBFindLookup
          DataField = 'unidade'
          DataSource = dtmCadastroProdutos.dsrProdutoComposto
          MaxLength = 8
          LookupField = 'codigo'
          LookupSource = fraConsultaUnidade.dsrProcuraUnidades
          Parameter = ' '
          ActiveSetControls = False
          DenyInsert = False
          NoSetControls = <>
          SetControls = <>
          LookupParameter = 'codigo'
        end
      end
    end
    object gbxFatorConversao: TGroupBox
      Left = 408
      Top = 95
      Width = 125
      Height = 36
      Caption = 'FATOR DE CONVERS'#195'O'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      object edtFatorConversao: TDBEditNumero
        Left = 2
        Top = 10
        Width = 120
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
        Text = 'edtFatorConversao'
        Mascara = False
        Alignment = taLeftJustify
        TipoMascara = tmGERAL
        NrDecimal = 3
        Decimais = True
        Negativo = False
        Tamanho = 12
        DataField = 'fatorconversao'
        DataSource = dtmCadastroProdutos.dsrProdutoComposto
      end
    end
    object ckbExibirFluxogramaPlanilhaCusto: TDBCheckBox
      Left = 1
      Top = 201
      Width = 270
      Height = 17
      Caption = 'Exibir fluxograma na Planilidade de Custos'
      DataField = 'exibirfluxogramaplanilhacusto'
      DataSource = dtmCadastroProdutos.dsrProdutoComposto
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 10
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
    object ckbQuantidadeehSomatoriodosComponentes: TDBCheckBox
      Left = 1
      Top = 217
      Width = 270
      Height = 17
      Caption = 'Quantidade '#233' o somat'#243'rio dos componentes'
      DataField = 'quantidadeehsomatoriodoscomponentes'
      DataSource = dtmCadastroProdutos.dsrProdutoComposto
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 11
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
  end
end
