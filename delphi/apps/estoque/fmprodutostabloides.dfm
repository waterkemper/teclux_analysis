
inherited frmProdutosTabloides: TfrmProdutosTabloides
  Left = 131
  Top = 94
  ActiveControl = flkCodigoProduto
  Caption = 'Cadastro de Produtos Tabloide'
  ClientHeight = 377
  ClientWidth = 696
  Color = clBtnFace
  PixelsPerInch = 96
  TextHeight = 13
  inherited tblBarra: TToolBar
    Width = 696
    inherited sbnProcurar: TSpeedButton
      Visible = False
    end
  end
  object pnlFundoJanela: TPanel
    Left = 0
    Top = 53
    Width = 696
    Height = 324
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object gbxFundoJanela: TGroupBox
      Left = 2
      Top = 3
      Width = 692
      Height = 327
      TabOrder = 0
      object sbnConsultaProduto: TSpeedButton
        Left = 308
        Top = 6
        Width = 23
        Height = 23
        Hint = 'Procura produto'
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
      object sbnConsultaPlano: TSpeedButton
        Left = 296
        Top = 82
        Width = 23
        Height = 23
        Hint = 'Procura produto'
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
        OnClick = sbnConsultaPlanoClick
      end
      object lblItemProduto: TLabel
        Left = 27
        Top = 9
        Width = 76
        Height = 13
        Alignment = taRightJustify
        Caption = 'Item de Produto'
      end
      object lblPrecoPauta: TLabel
        Left = 30
        Top = 85
        Width = 73
        Height = 13
        Alignment = taRightJustify
        Caption = 'Preço de Pauta'
      end
      object lblPrecoSugestao: TLabel
        Left = 29
        Top = 111
        Width = 74
        Height = 13
        Alignment = taRightJustify
        Caption = 'Preço Sugestão'
      end
      object lblPreco: TLabel
        Left = 27
        Top = 137
        Width = 76
        Height = 13
        Alignment = taRightJustify
        Caption = 'Preço de Venda'
      end
      object lblPlano: TLabel
        Left = 228
        Top = 85
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Plano'
      end
      object lblTotal: TLabel
        Left = 395
        Top = 137
        Width = 25
        Height = 13
        Alignment = taRightJustify
        Caption = 'Total'
      end
      object lblPrestacao: TLabel
        Left = 374
        Top = 111
        Width = 46
        Height = 13
        Alignment = taRightJustify
        Caption = 'Prestação'
      end
      object lblPosicao: TLabel
        Left = 66
        Top = 163
        Width = 37
        Height = 13
        Alignment = taRightJustify
        Caption = 'Posição'
      end
      object lblFoto: TLabel
        Left = 255
        Top = 163
        Width = 21
        Height = 13
        Caption = 'Foto'
      end
      object lblDescricaoProduto: TLabel
        Left = 35
        Top = 59
        Width = 68
        Height = 13
        Alignment = taRightJustify
        Caption = 'Descr. Produto'
      end
      object flkCodigoProduto: TtecDBFindLookup
        Left = 107
        Top = 6
        Width = 200
        Height = 21
        DataField = 'produto'
        DataSource = dtmCadastroMercadoriasAnuncio.dsrProdutosTabloide
        MaxLength = 18
        Maximo = 0
        Minimo = 37353
        Adicional = 0
        Opcional = True
        TabOrder = 0
        PermitirZero = False
        PermitirNulo = False
        Operacao = opATRIBUICAO
        LookupField = 'codigo'
        LookupSource = dtmCadastroMercadoriasAnuncio.dsrProduto
        Parameter = ' '
        ActiveSetControls = False
        DenyInsert = True
        NoSetControls = <>
        SetControls = <>
        LookupParameter = 'codigo'
      end
      object dtxDescricaoProduto: TtecDBText
        Left = 108
        Top = 30
        Width = 421
        Height = 23
        TabStop = False
        BorderStyle = bsSingle
        Color = clBtnFace
        DataField = 'descricao'
        DataSource = dtmCadastroMercadoriasAnuncio.dsrProduto
        ReadOnly = True
        TabOrder = 8
      end
      object dtxPrecoPauta: TtecDBText
        Left = 107
        Top = 82
        Width = 105
        Height = 23
        TabStop = False
        BorderStyle = bsSingle
        Color = clBtnFace
        DataField = 'precopauta'
        DataSource = dtmCadastroMercadoriasAnuncio.dsrProdutosTabloide
        ReadOnly = True
        TabOrder = 9
      end
      object dtxPrecoSugestao: TtecDBText
        Left = 107
        Top = 108
        Width = 105
        Height = 23
        TabStop = False
        BorderStyle = bsSingle
        Color = clBtnFace
        DataField = 'precosugestao'
        DataSource = dtmCadastroMercadoriasAnuncio.dsrProdutosTabloide
        ReadOnly = True
        TabOrder = 10
      end
      object dtxTotal: TtecDBText
        Left = 424
        Top = 134
        Width = 105
        Height = 23
        TabStop = False
        BorderStyle = bsSingle
        Color = clBtnFace
        DataField = 'total'
        DataSource = dtmCadastroMercadoriasAnuncio.dsrProdutosTabloide
        ReadOnly = True
        TabOrder = 11
      end
      object dtxDescricaoPlano: TtecDBText
        Left = 320
        Top = 82
        Width = 209
        Height = 23
        TabStop = False
        BorderStyle = bsSingle
        Color = clBtnFace
        DataField = 'descricao'
        DataSource = dtmCadastroMercadoriasAnuncio.dsrPlano
        ReadOnly = True
        TabOrder = 12
      end
      object gbxObservacoes: TGroupBox
        Left = 5
        Top = 179
        Width = 680
        Height = 143
        Caption = 'Observações'
        TabOrder = 6
        object mmoObservacao: TtecDBMemo
          Left = 5
          Top = 16
          Width = 668
          Height = 121
          DataField = 'observacao'
          DataSource = dtmCadastroMercadoriasAnuncio.dsrProdutosTabloide
          TabOrder = 0
        end
      end
      object dtxPrestacao: TtecDBText
        Left = 424
        Top = 108
        Width = 105
        Height = 23
        TabStop = False
        BorderStyle = bsSingle
        Color = clBtnFace
        DataField = 'prestacao'
        DataSource = dtmCadastroMercadoriasAnuncio.dsrProdutosTabloide
        ReadOnly = True
        TabOrder = 13
      end
      object edtPrecoVenda: TDBEditNumero
        Left = 107
        Top = 134
        Width = 105
        Height = 21
        MaxLength = -1
        TabOrder = 3
        Mascara = True
        TipoMascara = tmGERAL
        NrDecimal = 2
        Decimais = True
        Negativo = False
        Tamanho = 9
        DataField = 'precovenda'
        DataSource = dtmCadastroMercadoriasAnuncio.dsrProdutosTabloide
      end
      object gbxTaxas: TGroupBox
        Left = 533
        Top = 104
        Width = 152
        Height = 58
        Caption = 'Taxa de juros'
        TabOrder = 14
        object dbgTaxas: TtecDBGrid
          Left = 4
          Top = 18
          Width = 145
          Height = 38
          TabStop = False
          BorderStyle = bsSingle
          DataSource = dtmCadastroMercadoriasAnuncio.dsrPlano
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          font.height = -12
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = []
          Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlack
          Titlefont.height = -12
          TitleFont.Name = 'Arial'
          TitleFont.Pitch = fpVariable
          TitleFont.Style = []
          RowWrap = 60
          Large = False
          DoubleRowColor = False
          TitleMinHeight = 100
          CellHeights = 90
          StrippedColor = 16054260
          CanDelete = False
          PostOnEnter = False
          DenySort = False
          Columns = <
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'taxamensaljuros'
              Title.Alignment = taCenter
              Title.Caption = 'Mensal'
              Width = 72
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'taxajurosanual'
              Title.Alignment = taCenter
              Title.Caption = 'Anual'
              Width = 71
              Visible = True
            end>
        end
      end
      object gbxEstoques: TGroupBox
        Left = 533
        Top = 3
        Width = 153
        Height = 87
        Caption = 'Estoques'
        TabOrder = 7
        object Label1: TLabel
          Left = 8
          Top = 16
          Width = 41
          Height = 13
          Caption = 'Depósito'
        end
        object Label2: TLabel
          Left = 8
          Top = 40
          Width = 21
          Height = 13
          Caption = 'Loja'
        end
        object Label3: TLabel
          Left = 8
          Top = 64
          Width = 34
          Height = 13
          Caption = 'Pedido'
        end
        object dtxDeposito: TtecDBText
          Left = 96
          Top = 16
          Width = 50
          Height = 21
          TabStop = False
          Color = clBtnFace
          DataField = 'deposito'
          DataSource = dtmCadastroMercadoriasAnuncio.dsrEstoques
          ReadOnly = True
          TabOrder = 0
        end
        object dtxLoja: TtecDBText
          Left = 96
          Top = 40
          Width = 50
          Height = 21
          TabStop = False
          Color = clBtnFace
          DataField = 'loja'
          DataSource = dtmCadastroMercadoriasAnuncio.dsrEstoques
          ReadOnly = True
          TabOrder = 1
        end
        object dtxPedido: TtecDBText
          Left = 96
          Top = 64
          Width = 50
          Height = 21
          TabStop = False
          Color = clBtnFace
          DataField = 'pedido'
          DataSource = dtmCadastroMercadoriasAnuncio.dsrEstoques
          ReadOnly = True
          TabOrder = 2
        end
      end
      object edtPosicao: TDBEditTexto
        Left = 107
        Top = 160
        Width = 142
        Height = 21
        CharCase = ecUpperCase
        DataField = 'posicao'
        DataSource = dtmCadastroMercadoriasAnuncio.dsrProdutosTabloide
        TabOrder = 4
        CharCasenoDefault = False
      end
      object edtFoto: TDBEditTexto
        Left = 285
        Top = 160
        Width = 157
        Height = 21
        CharCase = ecUpperCase
        DataField = 'foto'
        DataSource = dtmCadastroMercadoriasAnuncio.dsrProdutosTabloide
        TabOrder = 5
        CharCasenoDefault = False
      end
      object flkCodigoPlano: TtecDBFindLookup
        Left = 260
        Top = 82
        Width = 35
        Height = 21
        DataField = 'plano'
        DataSource = dtmCadastroMercadoriasAnuncio.dsrProdutosTabloide
        MaxLength = 3
        Maximo = 0
        Minimo = 37353
        Adicional = 0
        Opcional = True
        TabOrder = 2
        PermitirZero = False
        PermitirNulo = False
        Operacao = opATRIBUICAO
        LookupField = 'codigo'
        LookupSource = dtmCadastroMercadoriasAnuncio.dsrPlano
        Parameter = ' '
        ActiveSetControls = False
        DenyInsert = False
        NoSetControls = <>
        SetControls = <>
        LookupParameter = 'codigo'
      end
      object edtDescricaoProduto: TDBEditTexto
        Left = 107
        Top = 56
        Width = 422
        Height = 21
        CharCase = ecUpperCase
        DataField = 'descricaoproduto'
        DataSource = dtmCadastroMercadoriasAnuncio.dsrProdutosTabloide
        TabOrder = 1
        CharCasenoDefault = False
      end
    end
  end
end
