inherited frmCadastroProdutosTroca: TfrmCadastroProdutosTroca
  Left = 737
  Top = 208
  ActiveControl = flkCodigoProduto
  Caption = 'Cadastro de Produtos a Trocar'
  ClientHeight = 241
  ClientWidth = 709
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBarra: TPanel
    Width = 485
    inherited bvlBotoesEd: TBevel
      Left = 201
    end
  end
  inherited pnlTopMenu: TPanel
    Width = 709
    TabOrder = 2
    inherited tblBarra: TToolBar
      Width = 484
      inherited sbnProcurar: TSpeedButton
        Visible = False
      end
    end
  end
  object pnlFundoJanela: TPanel
    Left = 0
    Top = 45
    Width = 709
    Height = 196
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 3
    TabOrder = 1
    object gbxFundoJanela: TGroupBox
      Left = 3
      Top = 3
      Width = 703
      Height = 190
      Align = alClient
      TabOrder = 0
      object sbnConsultaProduto: TSpeedButton
        Left = 252
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
      object lblCodigoProduto: TLabel
        Left = 21
        Top = 15
        Width = 90
        Height = 16
        Alignment = taRightJustify
        Caption = 'Item de produto'
      end
      object lblQuantidade: TLabel
        Left = 45
        Top = 68
        Width = 66
        Height = 16
        Alignment = taRightJustify
        Caption = 'Quantidade'
      end
      object lblPrecoAvaliado: TLabel
        Left = 26
        Top = 168
        Width = 85
        Height = 16
        Alignment = taRightJustify
        Caption = 'Pre'#231'o Avaliado'
      end
      object lblPrecoTabela: TLabel
        Left = 18
        Top = 94
        Width = 93
        Height = 16
        Caption = 'Pre'#231'o de Tabela'
      end
      object lblPrecoVendido: TLabel
        Left = 19
        Top = 119
        Width = 92
        Height = 16
        Caption = 'Pre'#231'o de Venda'
      end
      object lblDescontoUnitario: TLabel
        Left = 9
        Top = 143
        Width = 102
        Height = 16
        Caption = 'Desconto do Item'
      end
      object lblFilialSaida: TLabel
        Left = 84
        Top = 40
        Width = 27
        Height = 16
        Alignment = taRightJustify
        Caption = 'Filial'
      end
      object sbnConsultaFilial: TSpeedButton
        Left = 152
        Top = 37
        Width = 23
        Height = 23
        Hint = 'Procurar filial de despacho do produto'
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
        OnClick = sbnConsultaFilialClick
      end
      object flkCodigoProduto: TtecDBFindLookup
        Left = 116
        Top = 11
        Width = 135
        Height = 24
        Alignment = taLeftJustify
        DataaFieldInterno = 'produto'
        DataaFieldVisual = 'produtovisual'
        DataField = 'produtovisual'
        DataSource = dtmTrocaMercadorias.dsrProdutosTrocados
        MaxLength = 100
        Maximo = 0
        Minimo = 37353
        Adicional = 0
        Opcional = True
        OnEnter = flkCodigoProdutoEnter
        OnKeyDown = flkCodigoProdutoKeyDown
        TabOrder = 0
        PermitirZero = False
        PermitirNulo = False
        Operacao = opATRIBUICAO
        LookupaFieldinterno = 'produto'
        LookupaFieldVisual = 'produtovisual'
        LookupField = 'produtovisual'
        LookupSource = dtmTrocaMercadorias.dsrProcuraProduto
        LookupQueryParameter = 'produtovisual'
        Parameter = ' '
        ActiveSetControls = False
        DenyInsert = False
        NoSetControls = <>
        SetControls = <>
        LookupParameter = 'produtovisual'
      end
      object edtQuantidade: TDBEditNumero
        Left = 116
        Top = 63
        Width = 69
        Height = 24
        MaxLength = -1
        TabOrder = 2
        Mascara = False
        Alignment = taLeftJustify
        TipoMascara = tmQUANTIDADE
        NrDecimal = 0
        Decimais = False
        Negativo = False
        Tamanho = 0
        DataField = 'quantidade'
        DataSource = dtmTrocaMercadorias.dsrProdutosTrocados
      end
      object dtxUnidade: TtecDBText
        Left = 192
        Top = 63
        Width = 65
        Height = 24
        TabStop = False
        Color = clBtnFace
        DataField = 'unidade'
        DataSource = dtmTrocaMercadorias.dsrProdutosContratos
        ReadOnly = True
        TabOrder = 4
        Alignment = taLeftJustify
      end
      object dtxDescricaoProduto: TtecDBText
        Left = 277
        Top = 11
        Width = 417
        Height = 24
        TabStop = False
        Color = clBtnFace
        DataField = 'descricaolc'
        DataSource = dtmTrocaMercadorias.dsrProcuraProduto
        ReadOnly = True
        TabOrder = 5
        Alignment = taLeftJustify
      end
      object edtPrecoAvaliado: TDBEditNumero
        Left = 116
        Top = 164
        Width = 105
        Height = 24
        MaxLength = -1
        TabOrder = 3
        Mascara = True
        Alignment = taLeftJustify
        TipoMascara = tmGERAL
        NrDecimal = 2
        Decimais = True
        Negativo = False
        Tamanho = 9
        DataField = 'precoavaliado'
        DataSource = dtmTrocaMercadorias.dsrProdutosTrocados
      end
      object edtPrecoTabela: TDBEditNumero
        Left = 116
        Top = 90
        Width = 105
        Height = 24
        TabStop = False
        Color = clBtnFace
        MaxLength = -1
        ReadOnly = True
        TabOrder = 6
        Mascara = True
        Alignment = taLeftJustify
        TipoMascara = tmGERAL
        NrDecimal = 2
        Decimais = True
        Negativo = False
        Tamanho = 9
        DataField = 'precotabela'
        DataSource = dtmTrocaMercadorias.dsrProdutosTrocados
      end
      object edtPrecoVendido: TDBEditNumero
        Left = 116
        Top = 115
        Width = 105
        Height = 24
        TabStop = False
        Color = clBtnFace
        MaxLength = -1
        ReadOnly = True
        TabOrder = 7
        Mascara = True
        Alignment = taLeftJustify
        TipoMascara = tmGERAL
        NrDecimal = 2
        Decimais = True
        Negativo = False
        Tamanho = 9
        DataField = 'precovenda'
        DataSource = dtmTrocaMercadorias.dsrProdutosTrocados
      end
      object DBEditNumero1: TDBEditNumero
        Left = 116
        Top = 139
        Width = 105
        Height = 24
        TabStop = False
        Color = clBtnFace
        MaxLength = -1
        ReadOnly = True
        TabOrder = 8
        Mascara = True
        Alignment = taLeftJustify
        TipoMascara = tmGERAL
        NrDecimal = 2
        Decimais = True
        Negativo = False
        Tamanho = 9
        DataField = 'descontototal'
        DataSource = dtmTrocaMercadorias.dsrProdutosTrocados
      end
      object flkFilial: TtecDBFindLookup
        Left = 116
        Top = 37
        Width = 35
        Height = 24
        Alignment = taLeftJustify
        DataField = 'filial'
        DataSource = dtmTrocaMercadorias.dsrProdutosTrocados
        MaxLength = 3
        Maximo = 0
        Minimo = 37353
        Adicional = 0
        Opcional = True
        OnEnter = flkFilialEnter
        TabOrder = 1
        PermitirZero = False
        PermitirNulo = False
        Operacao = opATRIBUICAO
        LookupField = 'codigo'
        LookupSource = dtmTrocaMercadorias.dsrProcuraFilialProduto
        LookupQueryParameter = 'codigo'
        Parameter = ' '
        ActiveSetControls = False
        DenyInsert = False
        NoSetControls = <>
        SetControls = <>
        LookupParameter = 'codigo'
      end
      object dtxNomeFilial: TtecDBText
        Left = 184
        Top = 37
        Width = 270
        Height = 24
        TabStop = False
        Color = clBtnFace
        DataField = 'nome'
        DataSource = dtmTrocaMercadorias.dsrProcuraFilialProduto
        ReadOnly = True
        TabOrder = 9
        Alignment = taLeftJustify
      end
    end
  end
end
