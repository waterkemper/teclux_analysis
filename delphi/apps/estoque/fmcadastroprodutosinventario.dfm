inherited frmCadastroProdutosInventario: TfrmCadastroProdutosInventario
  Left = 309
  Top = 104
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  Caption = 'Produtos do Invent'#225'rio'
  ClientHeight = 649
  ClientWidth = 947
  PixelsPerInch = 96
  TextHeight = 16
  object Splitter1: TSplitter [0]
    Left = 0
    Top = 296
    Width = 947
    Height = 4
    Cursor = crVSplit
    Align = alTop
    Color = clSkyBlue
    Constraints.MaxHeight = 4
    Constraints.MinHeight = 4
    ParentColor = False
    ResizeStyle = rsLine
  end
  inherited pnlBarra: TPanel
    Left = 0
    Top = 45
    Width = 947
    Height = 92
    Align = alTop
    BevelOuter = bvNone
    ParentFont = False
    Visible = True
    inherited bvlBotoesEd: TBevel
      Left = 0
      Top = 92
      Width = 947
      Height = 0
      Align = alBottom
      Visible = False
    end
    inherited bvlBotoesNavegacao: TBevel
      Left = 0
      Top = 92
      Width = 947
      Height = 0
      Align = alBottom
    end
    object gbxQuantidades: TGroupBox
      Left = 0
      Top = 0
      Width = 947
      Height = 92
      Align = alTop
      Caption = 'QUANTIDADES'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object gbxReserva: TGroupBox
        Left = 289
        Top = 55
        Width = 77
        Height = 36
        Caption = 'RESERVADA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object dtxReserva: TtecDBText
          Tag = 12
          Left = 2
          Top = 10
          Width = 73
          Height = 23
          TabStop = False
          Color = clBtnFace
          DataField = 'reservado'
          DataSource = dtmCadastroInventario.dsrInventarioProduto
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
      end
      object gbxEstoque: TGroupBox
        Left = 213
        Top = 55
        Width = 77
        Height = 36
        Caption = 'ESTOQUE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object dtxEmEstoque: TtecDBText
          Tag = 12
          Left = 2
          Top = 10
          Width = 73
          Height = 23
          TabStop = False
          Color = clBtnFace
          DataField = 'emestoque'
          DataSource = dtmCadastroInventario.dsrInventarioProduto
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
      end
      object gbxTransito: TGroupBox
        Left = 364
        Top = 55
        Width = 77
        Height = 36
        Caption = 'TR'#194'NSITO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        object dtxTransito: TtecDBText
          Tag = 12
          Left = 2
          Top = 10
          Width = 73
          Height = 23
          TabStop = False
          Color = clBtnFace
          DataField = 'transito'
          DataSource = dtmCadastroInventario.dsrInventarioProduto
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
      end
      object gbxDiferenca: TGroupBox
        Left = 515
        Top = 55
        Width = 77
        Height = 36
        Caption = 'DIFEREN'#199'A'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        object dtxDiferenca: TtecDBText
          Tag = 12
          Left = 2
          Top = 10
          Width = 73
          Height = 23
          TabStop = False
          Color = clBtnFace
          DataField = 'diferenca'
          DataSource = dtmCadastroInventario.dsrInventarioProduto
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          Alignment = taLeftJustify
        end
      end
      object gbxDemonstracao: TGroupBox
        Left = 590
        Top = 55
        Width = 77
        Height = 36
        Caption = 'DEMONSTRA'#199
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        object dtxDemonstracao: TtecDBText
          Tag = 12
          Left = 2
          Top = 10
          Width = 73
          Height = 23
          TabStop = False
          Color = clBtnFace
          DataField = 'demonstracao'
          DataSource = dtmCadastroInventario.dsrInventarioProduto
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
      end
      object gbxConserto: TGroupBox
        Left = 665
        Top = 55
        Width = 77
        Height = 36
        Caption = 'CONSERTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        object dtxConserto: TtecDBText
          Tag = 12
          Left = 2
          Top = 10
          Width = 73
          Height = 23
          TabStop = False
          Color = clBtnFace
          DataField = 'conserto'
          DataSource = dtmCadastroInventario.dsrInventarioProduto
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
      end
      object gbxDanificada: TGroupBox
        Left = 740
        Top = 55
        Width = 77
        Height = 36
        Caption = 'DANIFICADA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        object dtxDanificada: TtecDBText
          Tag = 12
          Left = 2
          Top = 10
          Width = 73
          Height = 23
          TabStop = False
          Color = clBtnFace
          DataField = 'danificada'
          DataSource = dtmCadastroInventario.dsrInventarioProduto
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
      end
      object gbxReservaPrevia: TGroupBox
        Left = 815
        Top = 55
        Width = 77
        Height = 36
        Caption = 'RES. PR'#201'VIA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        object dtxReservaPrevia: TtecDBText
          Tag = 12
          Left = 2
          Top = 10
          Width = 73
          Height = 23
          TabStop = False
          Color = clBtnFace
          DataField = 'reservaprevia'
          DataSource = dtmCadastroInventario.dsrInventarioProduto
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
      end
      object GroupBox1: TGroupBox
        Left = 439
        Top = 55
        Width = 77
        Height = 36
        Caption = 'MOVIMENTADO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 8
        object dtxMovimentado: TtecDBText
          Tag = 12
          Left = 2
          Top = 10
          Width = 73
          Height = 23
          TabStop = False
          Color = clBtnFace
          DataField = 'movimentado'
          DataSource = dtmCadastroInventario.dsrInventarioProduto
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
      end
      object gbxQuantidade: TGroupBox
        Left = 137
        Top = 55
        Width = 77
        Height = 36
        Caption = 'INVENT'#193'RIO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 9
        object edtQuantidade: TDBEditNumero
          Tag = 12
          Left = 2
          Top = 10
          Width = 73
          Height = 23
          Hint = 'Quantidade inventariada'
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
          OnKeyDown = edtQuantidadeKeyDown
          Mascara = False
          Alignment = taLeftJustify
          TipoMascara = tmQUANTIDADE
          NrDecimal = 0
          Decimais = False
          Negativo = False
          Tamanho = 0
          DataField = 'quantidade'
          DataSource = dtmCadastroInventario.dsrInventarioProduto
        end
      end
      object gbxProdutos: TGroupBox
        Left = 91
        Top = 14
        Width = 854
        Height = 37
        Caption = 'PRODUTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 10
        inline fraConsultaProduto: TfraConsultaCodigo
          Left = 3
          Top = 10
          Width = 846
          Height = 23
          HorzScrollBar.Range = 669
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
            Tag = 12
            Left = 136
            Hint = 'Procurar produto'
          end
          inherited dtxDescricao: TtecDBText
            Tag = 12
            Left = 160
            Width = 684
            Hint = 'Descri'#231#227'o do produto'
            DataField = 'descricaolc'
            DataSource = fraConsultaProduto.dsrProcuraItemProdutos
          end
          inherited edfCodigo: TtecDBFindLookup
            Tag = 12
            Width = 135
            Hint = 'C'#243'digo do produto'
            DataaFieldInterno = 'produto'
            DataaFieldVisual = 'produtovisual'
            DataField = 'produtodigitado'
            DataSource = dtmCadastroInventario.dsrInventarioProduto
            MaxLength = 30
            OnKeyDown = fraConsultaProdutoedfCodigoKeyDown
            OnMessage = fraConsultaProdutoedfCodigoMessage
            DataFieldTotal = 'quantidade'
            LookupaFieldinterno = 'produto'
            LookupaFieldVisual = 'produtovisual'
            LookupField = 'produtovisual'
            LookupSource = fraConsultaProduto.dsrProcuraItemProdutos
            LookupQueryParameter = 'produtovisual'
            LookupParametersLabel = 'produtovisual'
            LookupParameters = 'produtovisual'
            LocateParameters = 'produtovisual'
            Parameter = ' '
            ActiveSetControls = False
            DenyInsert = False
            NoSetControls = <>
            SetControls = <>
            LookupParameter = 'produtovisual'
          end
          inherited qryProcuraItemProdutos: TtecQuery
            inherited qryProcuraItemProdutosreferencia: TStringField
              Size = 30
            end
            inherited qryProcuraItemProdutosdescricaogrupo: TStringField
              Size = 100
            end
          end
        end
      end
      object gbxSequencia: TGroupBox
        Left = 6
        Top = 14
        Width = 83
        Height = 36
        Caption = 'SEQ'#220#202'NCIA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 11
        object dtxSequencia: TtecDBText
          Tag = 12
          Left = 2
          Top = 10
          Width = 76
          Height = 23
          Hint = 'N'#186' de seq'#252#234'ncia'
          TabStop = False
          Color = clBtnFace
          DataField = 'sequencia'
          DataSource = dtmCadastroInventario.dsrInventarioProduto
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
      end
      object DBAdvOfficeCheckBox1: TDBAdvOfficeCheckBox
        Left = 6
        Top = 56
        Width = 97
        Height = 20
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 12
        Alignment = taLeftJustify
        Caption = 'Gerencia Lote'
        ReturnIsTab = False
        Version = '1.0.0.7'
        DataField = 'gerenciarloteevalidade'
        DataSource = dtmCadastroInventario.dsrInventarioProduto
        ReadOnly = True
        ValueChecked = 'True'
        ValueUnchecked = 'False'
      end
    end
  end
  inherited pnlTopMenu: TPanel
    Width = 947
    AutoSize = False
    inherited tblBarra: TToolBar
      Width = 722
      AutoSize = False
      inherited sbnProcurar: TSpeedButton
        Visible = False
      end
      object sbnVisualizarFoto: TSpeedButton
        Left = 284
        Top = 2
        Width = 62
        Height = 39
        Hint = 'Visualizar a imagem relacionada no site da empresa'
        Constraints.MinHeight = 36
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        Glyph.Data = {
          360C0000424D360C000000000000360000002800000020000000200000000100
          180000000000000C000000000000000000000000000000000000007F7F007F7F
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF007F7F007F7F007F7F007F7F007F7F007F
          7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF007F7F007F7F007F7F007F7F007F7F00
          7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF007F7F007F7F007F7F007F7F
          007F7F007F7F000000000000007F7F007F7F007F7F007F7F007F7F007F7F007F
          7F007F7F000000000000000000007F7F007F7F007F7F007F7F007F7F007F7F00
          7F7F007F7F000000000000007F7F007F7F007F7F007F7F007F7F007F7F007F7F
          007F7F007F7F000000000000000000007F7F007F7F007F7F007F7F007F7F007F
          7F007F7F000000000000000000007F7F007F7F007F7F007F7F007F7F007F7F00
          7F7F000000000000000000007F7F007F7F007F7F007F7F007F7F007F7F007F7F
          007F7F007F7F007F7F000000000000000000007F7F007F7F007F7F007F7F007F
          7F007F7F000000000000000000007F7F007F7F007F7F007F7F007F7F007F7F00
          0000000000000000007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
          007F7F007F7F007F7F007F7F000000000000000000007F7F007F7F007F7F007F
          7F007F7F000000000000000000007F7F007F7F007F7F007F7F007F7F00000000
          0000000000007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
          007F7F007F7F007F7F007F7F007F7F000000000000000000007F7F007F7F007F
          7F007F7F000000000000000000007F7F007F7F007F7F007F7F00000000000000
          0000007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
          007F7F007F7F007F7F007F7F007F7F007F7F000000000000000000007F7F007F
          7F007F7F000000000000000000007F7F007F7F007F7F00000000000000000000
          7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
          007F7F007F7F007F7F007F7F007F7F007F7F007F7F000000000000000000007F
          7F007F7F000000000000000000007F7F007F7F000000000000000000007F7F00
          7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
          007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F0000000000000000
          00007F7F000000000000000000007F7F000000000000000000007F7F007F7F00
          7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
          007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F0000000000
          00000000000000000000000000000000000000000000007F7F007F7F007F7F00
          7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
          007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F0000
          00000000000000000000000000000000000000007F7F007F7F007F7F007F7F00
          7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
          007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
          7F000000000000000000000000000000007F7F007F7F007F7F007F7F007F7F00
          7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000007F7F007F7F007F7F007F7F007F7F000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000007F7F007F7F007F7F007F7F000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000007F7F007F7F007F7F007F7F000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000007F7F7F7F7F7F7F7F7F7F7F7F7F7F7F00000000000000000000000000
          0000000000000000000000000000000000007F7F007F7F007F7F007F7F000000
          0000000000000000000000000000000000000000000000000000000000000000
          007F7F7F7F7F7F0000000000000000007F7F7F7F7F7F00000000000000000000
          0000000000000000000000000000000000007F7F007F7F007F7F007F7F000000
          0000000000000000000000000000000000000000000000000000000000007F7F
          7F7F7F7F000000FFFFFFFFFFFFFFFFFF0000007F7F7F7F7F7F00000000000000
          0000000000000000000000000000000000007F7F007F7F007F7F007F7F000000
          000000000000000000BFBFBFBFBFBF0000000000000000000000000000007F7F
          7F000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000007F7F7F00000000000000
          0000000000000000000000000000000000007F7F007F7F007F7F007F7F000000
          000000000000000000BFBFBFBFBFBF0000000000000000000000000000007F7F
          7F000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000007F7F7F00000000000000
          0000000000000000000000000000000000007F7F007F7F007F7F007F7F000000
          000000000000000000BFBFBFBFBFBF0000000000000000000000000000007F7F
          7F7F7F7F000000FFFFFFFFFFFFFFFFFF0000007F7F7F7F7F7F00000000000000
          0000000000000000000000000000000000007F7F007F7F007F7F007F7F000000
          0000000000000000000000000000000000000000000000000000000000000000
          007F7F7F7F7F7F0000000000000000007F7F7F7F7F7F00000000000000000000
          0000000000000000000000000000000000007F7F007F7F007F7F007F7F000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000007F7F7F7F7F7F7F7F7F7F7F7F7F7F7F00000000000000000000000000
          0000000000000000000000000000000000007F7F007F7F007F7F007F7F000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000007F7F007F7F007F7F007F7F000000
          0000000000000000000000000000000000000000000000000000000000000000
          00BFBFBF000000000000000000000000000000BFBFBF00000000000000000000
          0000000000000000000000000000000000007F7F007F7F007F7F007F7F000000
          000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
          BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
          BFBFBFBFBFBFBFBFBFBFBF000000000000007F7F007F7F007F7F007F7F007F7F
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000007F7F007F7F007F7F007F7F007F7F000000
          000000000000000000000000000000007F7F000000000000007F7F0000000000
          00BFBFBF000000000000000000000000000000BFBFBF000000000000007F7F00
          0000000000000000000000007F7F007F7F007F7F007F7F007F7F007F7F000000
          000000000000000000000000000000007F7F000000000000007F7F007F7F0000
          00000000BFBFBF000000000000000000BFBFBF000000000000007F7F007F7F00
          0000000000000000000000007F7F007F7F007F7F007F7F007F7F007F7F007F7F
          007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
          7F000000000000BFBFBFBFBFBFBFBFBF000000000000007F7F007F7F007F7F00
          7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
          007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
          7F007F7F000000000000000000000000000000007F7F007F7F007F7F007F7F00
          7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
          007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
          7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
          7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F}
        ParentFont = False
        OnClick = sbnVisualizarFotoClick
      end
    end
    inherited tblBarraCadastro: TToolBar
      AutoSize = False
    end
  end
  inline fraVisualizarImageURL1: TfraVisualizarImageURL
    Left = 0
    Top = 300
    Width = 947
    Height = 349
    Align = alClient
    TabOrder = 2
    inherited Splitter2: TSplitter
      Height = 253
    end
    inherited SplitterBottom: TSplitter
      Top = 253
      Width = 947
    end
    inherited pnlInformacoesProduto: TPanel
      Top = 317
      Width = 947
      inherited lblProduto: TLabel
        Width = 947
        Font.Pitch = fpVariable
      end
    end
    inherited ToolBar1: TToolBar
      Top = 253
      Width = 947
      Height = 64
    end
    inherited ScrollBox1: TScrollBox
      Width = 947
      Height = 253
      inherited imgVisualFormURL: TImage
        Width = 943
        Height = 249
      end
    end
    inherited Panel1: TPanel
      Height = 253
    end
  end
  object gbxLotesdoProduto: TGroupBox
    Left = 0
    Top = 137
    Width = 947
    Height = 159
    Align = alTop
    Caption = 'LOTES DO PRODUTO'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -9
    Font.Name = 'helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    object GroupBox5: TGroupBox
      Left = 915
      Top = 14
      Width = 30
      Height = 121
      Align = alRight
      TabOrder = 1
      object sbnExcluirLotes: TSpeedButton
        Left = 3
        Top = 39
        Width = 23
        Height = 22
        Hint = 'Excluir Lotes'
        Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000120B0000120B00000000000000000000DCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          A0A0A00000FF0000FF000000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDC0000FFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FFFFFFFFF
          FFFFDCDCDCDCDCDCDCDCDCDCDCDCFFFFFFFFFFFF808080DCDCDCDCDCDCDCDCDC
          0000FF0000FF0000FF000000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DC0000000000FFDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7F7F7F7FFF
          FFFFDCDCDCDCDCDCDCDCDCDCDCDCFFFFFF808080DCDCDCDCDCDCDCDCDCDCDCDC
          0000FF0000FF0000FF0000FF000000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC0000
          000000FF808080DCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7F7F7F7FFF
          FFFFFFFFFFDCDCDCDCDCDCFFFFFF808080808080DCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDC0000FF0000FF0000FF0000FF000000DCDCDCDCDCDCDCDCDC0000000000
          FF808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7F7F
          7F7FFFFFFFDCDCDCFFFFFF808080808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDC0000FF0000FF0000FF000000DCDCDCDCDCDC0000000000FF0000
          FF808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7F7F
          7F7FFFFFFFFFFFFF808080808080808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDC0000FF0000FF0000FF0000000000000000FF0000FF8080
          80DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F
          7F7F7F7F7F808080808080808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDC0000FF0000FF0000FF0000FF0000FF808080DCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F80
          80807F7F7F808080808080808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDC0000000000FF0000FF0000FF0000FFDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFF7F7F7F7F
          7F7F7F7F7F7F7F7F808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDC0000000000000000FF0000FF0000FF000000DCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFFFFFFFF8080808080807F
          7F7F7F7F7F7F7F7FFFFFFFFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDC0000000000FF0000FF0000FF0000FF0000FF0000FF000000DCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFFFFFFFF80808080808080808080
          80807F7F7F7F7F7F7F7F7FFFFFFFFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC0000FF
          0000FF0000FF0000FF0000FF0000FF808080DCDCDC7F7F7F0000FF000000DCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFF808080808080808080808080808080DC
          DCDCDCDCDC7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFDCDCDCDCDCDCDCDCDC0000FF
          0000FF0000FF0000FF0000FF808080DCDCDCDCDCDCDCDCDC8080800000FF0000
          00DCDCDCDCDCDCDCDCDCDCDCDC808080808080808080808080808080DCDCDCDC
          DCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFDCDCDCDCDCDCA0A0A0
          0000FF0000FF808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC0000
          FF0000FF000000DCDCDCDCDCDC808080808080808080808080DCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC}
        NumGlyphs = 2
        OnClick = sbnExcluirLotesClick
      end
      object sbnIncluirLotes: TSpeedButton
        Left = 3
        Top = 9
        Width = 23
        Height = 22
        Hint = 'Incluir Lotes'
        Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000120B0000120B00000000000000000000C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C37F7F7F7F7F7F7F7F7F8080808080807F7F7F7F7F7F7F7F7F7F7F
          7F808080C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3
          C3C3C30000000000000000000000000000000000000000000000000000000000
          00808080C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
          007F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
          007F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
          007F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
          007F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
          00808080C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
          00C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3
          C3C3C3C3C3FFFFFFFFFFFFFFFFFF7F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
          00C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3
          C3C37F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF000000C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3
          C3C37F7F7FFFFFFFC3C3C37F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF000000C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3
          C3C37F7F7FFFFFFF7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3000000FFFFFFFFFFFFFFFFFFFFFFFF000000000000C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFFFFFFFFFFFFFFF
          FFFF7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3000000000000000000000000000000000000C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3}
        NumGlyphs = 2
        OnClick = sbnIncluirLotesClick
      end
      object sbnSugerirQuantidadeLotes: TSpeedButton
        Left = 2
        Top = 64
        Width = 23
        Height = 21
        Hint = 'Incluir todos os lotes'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000120B0000120B00000000000000000000DCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDC808080000000808080DCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A058
          5858A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDC80808000000080808000000000FFFF000000808080000000808080DCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A0585858A0A0A0585858FF
          FFFF585858A0A0A0585858A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDC00000000FFFF80808000000000FFFF00000080808000FFFF000000DCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC585858DCDCDCA0A0A0585858DC
          DCDC585858A0A0A0DCDCDC585858FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDC80808080808000FFFF00FFFF00FFFF00FFFF00FFFF808080808080DCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A0A0A0A0DCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCA0A0A0A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          80808000000000000000FFFF80808000000080808000FFFF0000000000008080
          80DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A0585858585858DCDCDCA0A0A058
          5858A0A0A0DCDCDC585858585858A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
          00000000FFFF00FFFF00FFFF000000DCDCDC00000000FFFF00FFFF00FFFF0000
          00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC585858DCDCDCDCDCDCDCDCDC585858DC
          DCDC585858FFFFFFDCDCDCDCDCDC585858FFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
          80808000000000000000FFFF80808000000080808000FFFF0000000000008080
          80DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A0585858585858DCDCDCA0A0A058
          5858A0A0A0DCDCDC585858585858A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDC80808080808000FFFF00FFFF00FFFF00FFFF00FFFF808080808080DCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A0A0A0A0DCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCA0A0A0A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDC00000000FFFF80808000000000FFFF00000080808000FFFF000000DCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC585858DCDCDCA0A0A0585858DC
          DCDC585858A0A0A0DCDCDC585858FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDC80808000000080808000000000FFFF000000808080000000808080DCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A0585858A0A0A0585858FF
          FFFF585858A0A0A0585858A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDC808080000000808080DCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0A0A058
          5858A0A0A0FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC}
        NumGlyphs = 2
        ParentFont = False
        OnClick = sbnSugerirQuantidadeLotesClick
      end
    end
    object DBAdvGridLotesTotais: TDBAdvGrid
      Left = 2
      Top = 135
      Width = 943
      Height = 22
      Cursor = crDefault
      Align = alBottom
      ColCount = 12
      RowCount = 1
      FixedRows = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Pitch = fpVariable
      Font.Style = [fsBold]
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing]
      ParentFont = False
      ScrollBars = ssNone
      TabOrder = 2
      ActiveRowShow = True
      OnGetFloatFormat = DBAdvGridLotesTotaisGetFloatFormat
      ActiveCellShow = True
      ActiveCellFont.Charset = DEFAULT_CHARSET
      ActiveCellFont.Color = clWindowText
      ActiveCellFont.Height = -11
      ActiveCellFont.Name = 'Tahoma'
      ActiveCellFont.Style = [fsBold]
      ColumnHeaders.Strings = (
        ''
        'N'#186' LOTE'
        'QUANTIDADE'
        'DEVOLVIDA'
        'TROCADA')
      ControlLook.FixedGradientHoverFrom = clGray
      ControlLook.FixedGradientHoverTo = clWhite
      ControlLook.FixedGradientDownFrom = clGray
      ControlLook.FixedGradientDownTo = clSilver
      ControlLook.DropDownHeader.Font.Charset = DEFAULT_CHARSET
      ControlLook.DropDownHeader.Font.Color = clWindowText
      ControlLook.DropDownHeader.Font.Height = -11
      ControlLook.DropDownHeader.Font.Name = 'Tahoma'
      ControlLook.DropDownHeader.Font.Style = []
      ControlLook.DropDownHeader.Visible = True
      ControlLook.DropDownHeader.Buttons = <>
      ControlLook.DropDownFooter.Font.Charset = DEFAULT_CHARSET
      ControlLook.DropDownFooter.Font.Color = clWindowText
      ControlLook.DropDownFooter.Font.Height = -11
      ControlLook.DropDownFooter.Font.Name = 'MS Sans Serif'
      ControlLook.DropDownFooter.Font.Style = []
      ControlLook.DropDownFooter.Visible = True
      ControlLook.DropDownFooter.Buttons = <>
      Filter = <>
      FilterDropDown.Font.Charset = DEFAULT_CHARSET
      FilterDropDown.Font.Color = clWindowText
      FilterDropDown.Font.Height = -11
      FilterDropDown.Font.Name = 'MS Sans Serif'
      FilterDropDown.Font.Style = []
      FilterDropDownClear = '(All)'
      FixedFooters = 1
      FixedColWidth = 20
      FixedRowHeight = 22
      FixedFont.Charset = DEFAULT_CHARSET
      FixedFont.Color = clWindowText
      FixedFont.Height = -11
      FixedFont.Name = 'Tahoma'
      FixedFont.Style = [fsBold]
      FloatFormat = '%.2f'
      FloatingFooter.Visible = True
      Navigation.AdvanceInsert = True
      Navigation.AppendOnArrowDown = True
      PrintSettings.DateFormat = 'dd/mm/yyyy'
      PrintSettings.Font.Charset = DEFAULT_CHARSET
      PrintSettings.Font.Color = clWindowText
      PrintSettings.Font.Height = -11
      PrintSettings.Font.Name = 'MS Sans Serif'
      PrintSettings.Font.Style = []
      PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
      PrintSettings.FixedFont.Color = clWindowText
      PrintSettings.FixedFont.Height = -11
      PrintSettings.FixedFont.Name = 'MS Sans Serif'
      PrintSettings.FixedFont.Style = []
      PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
      PrintSettings.HeaderFont.Color = clWindowText
      PrintSettings.HeaderFont.Height = -11
      PrintSettings.HeaderFont.Name = 'MS Sans Serif'
      PrintSettings.HeaderFont.Style = []
      PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
      PrintSettings.FooterFont.Color = clWindowText
      PrintSettings.FooterFont.Height = -11
      PrintSettings.FooterFont.Name = 'MS Sans Serif'
      PrintSettings.FooterFont.Style = []
      PrintSettings.PageNumSep = '/'
      SearchFooter.FindNextCaption = 'Find &next'
      SearchFooter.FindPrevCaption = 'Find &previous'
      SearchFooter.Font.Charset = DEFAULT_CHARSET
      SearchFooter.Font.Color = clWindowText
      SearchFooter.Font.Height = -11
      SearchFooter.Font.Name = 'MS Sans Serif'
      SearchFooter.Font.Style = []
      SearchFooter.HighLightCaption = 'Highlight'
      SearchFooter.HintClose = 'Close'
      SearchFooter.HintFindNext = 'Find next occurrence'
      SearchFooter.HintFindPrev = 'Find previous occurrence'
      SearchFooter.HintHighlight = 'Highlight occurrences'
      SearchFooter.MatchCaseCaption = 'Match case'
      Version = '2.3.2.2'
      AutoCreateColumns = False
      AutoRemoveColumns = False
      Columns = <
        item
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          Fixed = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Pitch = fpVariable
          Font.Style = []
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clWindowText
          HeaderFont.Height = -11
          HeaderFont.Name = 'Tahoma'
          HeaderFont.Pitch = fpVariable
          HeaderFont.Style = []
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clWindowText
          PrintFont.Height = -11
          PrintFont.Name = 'MS Sans Serif'
          PrintFont.Pitch = fpVariable
          PrintFont.Style = []
          Width = 20
        end
        item
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          EditLength = 20
          FieldName = 'nrlote'
          Fixed = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Pitch = fpVariable
          Font.Style = []
          Header = 'N'#186' LOTE'
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clWindowText
          HeaderFont.Height = -7
          HeaderFont.Name = 'Tahoma'
          HeaderFont.Pitch = fpVariable
          HeaderFont.Style = []
          HeaderAlignment = taCenter
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clWindowText
          PrintFont.Height = -11
          PrintFont.Name = 'MS Sans Serif'
          PrintFont.Pitch = fpVariable
          PrintFont.Style = []
          Width = 117
        end
        item
          Alignment = taRightJustify
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'quantidade'
          FloatFormat = '%.3n'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Pitch = fpVariable
          Font.Style = []
          Header = 'QUANTIDADE'
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clBlack
          HeaderFont.Height = -7
          HeaderFont.Name = 'Tahoma'
          HeaderFont.Pitch = fpVariable
          HeaderFont.Style = []
          HeaderAlignment = taCenter
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clBlack
          PrintFont.Height = -13
          PrintFont.Name = 'Tahoma'
          PrintFont.Pitch = fpVariable
          PrintFont.Style = []
          Width = 75
        end
        item
          Alignment = taRightJustify
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'emestoque'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clBlack
          HeaderFont.Height = -7
          HeaderFont.Name = 'Tahoma'
          HeaderFont.Pitch = fpVariable
          HeaderFont.Style = [fsBold]
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clBlack
          PrintFont.Height = -11
          PrintFont.Name = 'Tahoma'
          PrintFont.Pitch = fpVariable
          PrintFont.Style = [fsBold]
          Width = 75
        end
        item
          Alignment = taRightJustify
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'reservado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clBlack
          HeaderFont.Height = -7
          HeaderFont.Name = 'Tahoma'
          HeaderFont.Pitch = fpVariable
          HeaderFont.Style = [fsBold]
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clBlack
          PrintFont.Height = -11
          PrintFont.Name = 'Tahoma'
          PrintFont.Pitch = fpVariable
          PrintFont.Style = [fsBold]
          Width = 75
        end
        item
          Alignment = taRightJustify
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'transito'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clBlack
          HeaderFont.Height = -7
          HeaderFont.Name = 'Tahoma'
          HeaderFont.Pitch = fpVariable
          HeaderFont.Style = [fsBold]
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clBlack
          PrintFont.Height = -11
          PrintFont.Name = 'Tahoma'
          PrintFont.Pitch = fpVariable
          PrintFont.Style = [fsBold]
          Width = 75
        end
        item
          Alignment = taRightJustify
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'movimentado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clBlack
          HeaderFont.Height = -7
          HeaderFont.Name = 'Tahoma'
          HeaderFont.Pitch = fpVariable
          HeaderFont.Style = [fsBold]
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clBlack
          PrintFont.Height = -11
          PrintFont.Name = 'Tahoma'
          PrintFont.Pitch = fpVariable
          PrintFont.Style = [fsBold]
          Width = 75
        end
        item
          Alignment = taRightJustify
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'diferenca'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clBlack
          HeaderFont.Height = -7
          HeaderFont.Name = 'Tahoma'
          HeaderFont.Pitch = fpVariable
          HeaderFont.Style = [fsBold]
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clBlack
          PrintFont.Height = -11
          PrintFont.Name = 'Tahoma'
          PrintFont.Pitch = fpVariable
          PrintFont.Style = [fsBold]
          Width = 75
        end
        item
          Alignment = taRightJustify
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'demonstracao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clBlack
          HeaderFont.Height = -7
          HeaderFont.Name = 'Tahoma'
          HeaderFont.Pitch = fpVariable
          HeaderFont.Style = [fsBold]
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clBlack
          PrintFont.Height = -11
          PrintFont.Name = 'Tahoma'
          PrintFont.Pitch = fpVariable
          PrintFont.Style = [fsBold]
          Width = 75
        end
        item
          Alignment = taRightJustify
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'conserto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clBlack
          HeaderFont.Height = -7
          HeaderFont.Name = 'Tahoma'
          HeaderFont.Pitch = fpVariable
          HeaderFont.Style = [fsBold]
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clBlack
          PrintFont.Height = -11
          PrintFont.Name = 'Tahoma'
          PrintFont.Pitch = fpVariable
          PrintFont.Style = [fsBold]
          Width = 75
        end
        item
          Alignment = taRightJustify
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'danificada'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clBlack
          HeaderFont.Height = -7
          HeaderFont.Name = 'Tahoma'
          HeaderFont.Pitch = fpVariable
          HeaderFont.Style = [fsBold]
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clBlack
          PrintFont.Height = -11
          PrintFont.Name = 'Tahoma'
          PrintFont.Pitch = fpVariable
          PrintFont.Style = [fsBold]
          Width = 75
        end
        item
          Alignment = taRightJustify
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'reservaprevia'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clBlack
          HeaderFont.Height = -7
          HeaderFont.Name = 'Tahoma'
          HeaderFont.Pitch = fpVariable
          HeaderFont.Style = [fsBold]
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clBlack
          PrintFont.Height = -11
          PrintFont.Name = 'Tahoma'
          PrintFont.Pitch = fpVariable
          PrintFont.Style = [fsBold]
          Width = 75
        end>
      DataSource = dtmCadastroInventario.dsrInventarioProdutoLotes
      PageMode = False
      InvalidPicture.Data = {
        055449636F6E0000010001002020040000000000E80200001600000028000000
        2000000040000000010004000000000000020000000000000000000000000000
        0000000000000000000080000080000000808000800000008000800080800000
        80808000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000
        FFFFFF000000000000777777777777000000000000000000777788FFFF887777
        000000000000007778F8887117788F877700000000000778F87111111111178F
        877000000000778871111111111999178877000000077F811111111111199999
        18F7700000778811111111111119999991887700007881111111111111119199
        99188700077F711111811111111198719997F7700788111118FF111111118FF7
        1991887077F71111888FF1111118FFFF19997F77778111118888FF1111888FF8
        911918777881111118888FF1188888811111188778811111118888FF88888811
        111117877F7111111118888888888111111117F77F7999111111888888881111
        111111F77F7999991111788888F71111111111F77F7999999917888888FF7111
        111117F778879999917FFF88888FF111111117877887999997FFFFF88888FF11
        11111887778799997FFFFFF798888FF11111187777F87997FFFFFF71178F88FF
        71117F7707887997FFFFF7999978F88871118870077F87997FFF799999978F87
        1117F77000788879978799999999787111188700007788879999999999999999
        1188770000077F88799999999999999778F77000000077888879999999999778
        8877000000000778F88877799777788F877000000000007778F8888878888F87
        7700000000000000777788FFFF88777700000000000000000077777777777700
        00000000FFC003FFFF0000FFFC00003FF800001FF000000FE0000007C0000003
        C000000380000001800000010000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000080000001
        80000001C0000003C0000003E0000007F000000FF800001FFC00003FFF0000FF
        FFC003FF}
      ShowUnicode = False
      PostOnEnter = False
      ColWidths = (
        20
        117
        75
        75
        75
        75
        75
        75
        75
        75
        75
        75)
      RowHeights = (
        22)
    end
    object DBAdvGridLotes: TDBAdvGrid
      Left = 2
      Top = 14
      Width = 913
      Height = 121
      Cursor = crDefault
      Align = alClient
      ColCount = 13
      RowCount = 2
      FixedRows = 1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Pitch = fpVariable
      Font.Style = []
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing]
      ParentFont = False
      ScrollBars = ssBoth
      TabOrder = 0
      OnEnter = DBAdvGridLotesEnter
      OnKeyDown = DBAdvGridLotesKeyDown
      ActiveRowShow = True
      OnRowChanging = DBAdvGridLotesRowChanging
      OnCanAddRow = DBAdvGridLotesCanAddRow
      OnAutoAddRow = DBAdvGridLotesAutoAddRow
      OnGetEditorType = DBAdvGridLotesGetEditorType
      ActiveCellShow = True
      ActiveCellFont.Charset = DEFAULT_CHARSET
      ActiveCellFont.Color = clWindowText
      ActiveCellFont.Height = -11
      ActiveCellFont.Name = 'Tahoma'
      ActiveCellFont.Style = [fsBold]
      ColumnHeaders.Strings = (
        ''
        'N'#186' LOTE'
        'QUANTIDADE'
        'DEVOLVIDA'
        'TROCADA')
      ControlLook.FixedGradientHoverFrom = clGray
      ControlLook.FixedGradientHoverTo = clWhite
      ControlLook.FixedGradientDownFrom = clGray
      ControlLook.FixedGradientDownTo = clSilver
      ControlLook.DropDownHeader.Font.Charset = DEFAULT_CHARSET
      ControlLook.DropDownHeader.Font.Color = clWindowText
      ControlLook.DropDownHeader.Font.Height = -11
      ControlLook.DropDownHeader.Font.Name = 'Tahoma'
      ControlLook.DropDownHeader.Font.Style = []
      ControlLook.DropDownHeader.Visible = True
      ControlLook.DropDownHeader.Buttons = <>
      ControlLook.DropDownFooter.Font.Charset = DEFAULT_CHARSET
      ControlLook.DropDownFooter.Font.Color = clWindowText
      ControlLook.DropDownFooter.Font.Height = -11
      ControlLook.DropDownFooter.Font.Name = 'MS Sans Serif'
      ControlLook.DropDownFooter.Font.Style = []
      ControlLook.DropDownFooter.Visible = True
      ControlLook.DropDownFooter.Buttons = <>
      Filter = <>
      FilterDropDown.Font.Charset = DEFAULT_CHARSET
      FilterDropDown.Font.Color = clWindowText
      FilterDropDown.Font.Height = -11
      FilterDropDown.Font.Name = 'MS Sans Serif'
      FilterDropDown.Font.Style = []
      FilterDropDownClear = '(All)'
      FixedColWidth = 20
      FixedRowHeight = 22
      FixedFont.Charset = DEFAULT_CHARSET
      FixedFont.Color = clWindowText
      FixedFont.Height = -11
      FixedFont.Name = 'Tahoma'
      FixedFont.Style = [fsBold]
      FloatFormat = '%.2f'
      Navigation.AppendOnArrowDown = True
      PrintSettings.DateFormat = 'dd/mm/yyyy'
      PrintSettings.Font.Charset = DEFAULT_CHARSET
      PrintSettings.Font.Color = clWindowText
      PrintSettings.Font.Height = -11
      PrintSettings.Font.Name = 'MS Sans Serif'
      PrintSettings.Font.Style = []
      PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
      PrintSettings.FixedFont.Color = clWindowText
      PrintSettings.FixedFont.Height = -11
      PrintSettings.FixedFont.Name = 'MS Sans Serif'
      PrintSettings.FixedFont.Style = []
      PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
      PrintSettings.HeaderFont.Color = clWindowText
      PrintSettings.HeaderFont.Height = -11
      PrintSettings.HeaderFont.Name = 'MS Sans Serif'
      PrintSettings.HeaderFont.Style = []
      PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
      PrintSettings.FooterFont.Color = clWindowText
      PrintSettings.FooterFont.Height = -11
      PrintSettings.FooterFont.Name = 'MS Sans Serif'
      PrintSettings.FooterFont.Style = []
      PrintSettings.PageNumSep = '/'
      SearchFooter.FindNextCaption = 'Find &next'
      SearchFooter.FindPrevCaption = 'Find &previous'
      SearchFooter.Font.Charset = DEFAULT_CHARSET
      SearchFooter.Font.Color = clWindowText
      SearchFooter.Font.Height = -11
      SearchFooter.Font.Name = 'MS Sans Serif'
      SearchFooter.Font.Style = []
      SearchFooter.HighLightCaption = 'Highlight'
      SearchFooter.HintClose = 'Close'
      SearchFooter.HintFindNext = 'Find next occurrence'
      SearchFooter.HintFindPrev = 'Find previous occurrence'
      SearchFooter.HintHighlight = 'Highlight occurrences'
      SearchFooter.MatchCaseCaption = 'Match case'
      SyncGrid.SelectionColumn = True
      Version = '2.3.2.2'
      AutoCreateColumns = False
      AutoRemoveColumns = False
      Columns = <
        item
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Pitch = fpVariable
          Font.Style = []
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clWindowText
          HeaderFont.Height = -9
          HeaderFont.Name = 'HELVETICA'
          HeaderFont.Pitch = fpVariable
          HeaderFont.Style = []
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clWindowText
          PrintFont.Height = -11
          PrintFont.Name = 'MS Sans Serif'
          PrintFont.Pitch = fpVariable
          PrintFont.Style = []
          Width = 20
        end
        item
          Alignment = taRightJustify
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          EditLink = FormControlEditLink1
          Editor = edCustom
          FieldName = 'nrlote'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Pitch = fpVariable
          Font.Style = []
          Header = 'N'#186' LOTE'
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clWindowText
          HeaderFont.Height = -9
          HeaderFont.Name = 'HELVETICA'
          HeaderFont.Pitch = fpVariable
          HeaderFont.Style = []
          HeaderAlignment = taCenter
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clWindowText
          PrintFont.Height = -11
          PrintFont.Name = 'MS Sans Serif'
          PrintFont.Pitch = fpVariable
          PrintFont.Style = []
          Width = 116
        end
        item
          Alignment = taRightJustify
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          EditLink = FormControlEditLink1
          Editor = edCustom
          FieldName = 'quantidade'
          FloatFormat = '%.3n'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Pitch = fpVariable
          Font.Style = []
          Header = 'INVENT'#193'RIO'
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clBlack
          HeaderFont.Height = -9
          HeaderFont.Name = 'HELVETICA'
          HeaderFont.Pitch = fpVariable
          HeaderFont.Style = []
          HeaderAlignment = taCenter
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clBlack
          PrintFont.Height = -13
          PrintFont.Name = 'Tahoma'
          PrintFont.Pitch = fpVariable
          PrintFont.Style = []
          Width = 75
        end
        item
          Alignment = taRightJustify
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'emestoque'
          FloatFormat = '%.3n'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Pitch = fpVariable
          Font.Style = []
          Header = 'ESTOQUE'
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clBlack
          HeaderFont.Height = -9
          HeaderFont.Name = 'HELVETICA'
          HeaderFont.Pitch = fpVariable
          HeaderFont.Style = []
          HeaderAlignment = taCenter
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clBlack
          PrintFont.Height = -13
          PrintFont.Name = 'Tahoma'
          PrintFont.Pitch = fpVariable
          PrintFont.Style = []
          ReadOnly = True
          Width = 76
        end
        item
          Alignment = taRightJustify
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'reservado'
          FloatFormat = '%.3n'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Pitch = fpVariable
          Font.Style = []
          Header = 'RESERVADA'
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clBlack
          HeaderFont.Height = -9
          HeaderFont.Name = 'HELVETICA'
          HeaderFont.Pitch = fpVariable
          HeaderFont.Style = []
          HeaderAlignment = taCenter
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clBlack
          PrintFont.Height = -13
          PrintFont.Name = 'Tahoma'
          PrintFont.Pitch = fpVariable
          PrintFont.Style = []
          ReadOnly = True
          Width = 75
        end
        item
          Alignment = taRightJustify
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'transito'
          FloatFormat = '%.3n'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Pitch = fpVariable
          Font.Style = []
          Header = 'TR'#194'NSITO'
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clBlack
          HeaderFont.Height = -9
          HeaderFont.Name = 'HELVETICA'
          HeaderFont.Pitch = fpVariable
          HeaderFont.Style = []
          HeaderAlignment = taCenter
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clBlack
          PrintFont.Height = -11
          PrintFont.Name = 'Tahoma'
          PrintFont.Pitch = fpVariable
          PrintFont.Style = []
          ReadOnly = True
          Width = 76
        end
        item
          Alignment = taRightJustify
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'movimentado'
          FloatFormat = '%.3n'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Pitch = fpVariable
          Font.Style = []
          Header = 'MOVIMENTADO'
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clBlack
          HeaderFont.Height = -9
          HeaderFont.Name = 'HELVETICA'
          HeaderFont.Pitch = fpVariable
          HeaderFont.Style = []
          HeaderAlignment = taCenter
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clBlack
          PrintFont.Height = -11
          PrintFont.Name = 'Tahoma'
          PrintFont.Pitch = fpVariable
          PrintFont.Style = []
          ReadOnly = True
          Width = 75
        end
        item
          Alignment = taRightJustify
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'diferenca'
          FloatFormat = '%.3n'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Pitch = fpVariable
          Font.Style = []
          Header = 'DIFEREN'#199'A'
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clBlack
          HeaderFont.Height = -9
          HeaderFont.Name = 'HELVETICA'
          HeaderFont.Pitch = fpVariable
          HeaderFont.Style = []
          HeaderAlignment = taCenter
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clBlack
          PrintFont.Height = -11
          PrintFont.Name = 'Tahoma'
          PrintFont.Pitch = fpVariable
          PrintFont.Style = []
          ReadOnly = True
          Width = 72
        end
        item
          Alignment = taRightJustify
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'demonstracao'
          FloatFormat = '%.3n'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Pitch = fpVariable
          Font.Style = []
          Header = 'DEMONSTRA'#199#195'O'
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clBlack
          HeaderFont.Height = -9
          HeaderFont.Name = 'HELVETICA'
          HeaderFont.Pitch = fpVariable
          HeaderFont.Style = []
          HeaderAlignment = taCenter
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clBlack
          PrintFont.Height = -11
          PrintFont.Name = 'Tahoma'
          PrintFont.Pitch = fpVariable
          PrintFont.Style = []
          ReadOnly = True
          Width = 78
        end
        item
          Alignment = taRightJustify
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'conserto'
          FloatFormat = '%.3n'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Pitch = fpVariable
          Font.Style = []
          Header = 'CONSERTO'
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clBlack
          HeaderFont.Height = -9
          HeaderFont.Name = 'HELVETICA'
          HeaderFont.Pitch = fpVariable
          HeaderFont.Style = []
          HeaderAlignment = taCenter
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clBlack
          PrintFont.Height = -11
          PrintFont.Name = 'Tahoma'
          PrintFont.Pitch = fpVariable
          PrintFont.Style = []
          ReadOnly = True
          Width = 75
        end
        item
          Alignment = taRightJustify
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'danificada'
          FloatFormat = '%.3n'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Pitch = fpVariable
          Font.Style = []
          Header = 'DANIFICADA'
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clBlack
          HeaderFont.Height = -9
          HeaderFont.Name = 'HELVETICA'
          HeaderFont.Pitch = fpVariable
          HeaderFont.Style = []
          HeaderAlignment = taCenter
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clBlack
          PrintFont.Height = -11
          PrintFont.Name = 'Tahoma'
          PrintFont.Pitch = fpVariable
          PrintFont.Style = []
          ReadOnly = True
          Width = 76
        end
        item
          Alignment = taRightJustify
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'reservaprevia'
          FloatFormat = '%.3n'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Pitch = fpVariable
          Font.Style = []
          Header = 'RES.PR'#201'VIA'
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clBlack
          HeaderFont.Height = -9
          HeaderFont.Name = 'HELVETICA'
          HeaderFont.Pitch = fpVariable
          HeaderFont.Style = []
          HeaderAlignment = taCenter
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clBlack
          PrintFont.Height = -11
          PrintFont.Name = 'Tahoma'
          PrintFont.Pitch = fpVariable
          PrintFont.Style = []
          ReadOnly = True
          Width = 74
        end
        item
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'inicio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Pitch = fpVariable
          Font.Style = []
          Header = 'DT INICIAL'
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clBlack
          HeaderFont.Height = -9
          HeaderFont.Name = 'HELVETICA'
          HeaderFont.Pitch = fpVariable
          HeaderFont.Style = []
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clBlack
          PrintFont.Height = -11
          PrintFont.Name = 'Tahoma'
          PrintFont.Pitch = fpVariable
          PrintFont.Style = []
          Width = 76
        end>
      DataSource = dtmCadastroInventario.dsrInventarioProdutoLotes
      EditPostMode = epRow
      InvalidPicture.Data = {
        055449636F6E0000010001002020040000000000E80200001600000028000000
        2000000040000000010004000000000000020000000000000000000000000000
        0000000000000000000080000080000000808000800000008000800080800000
        80808000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000
        FFFFFF000000000000777777777777000000000000000000777788FFFF887777
        000000000000007778F8887117788F877700000000000778F87111111111178F
        877000000000778871111111111999178877000000077F811111111111199999
        18F7700000778811111111111119999991887700007881111111111111119199
        99188700077F711111811111111198719997F7700788111118FF111111118FF7
        1991887077F71111888FF1111118FFFF19997F77778111118888FF1111888FF8
        911918777881111118888FF1188888811111188778811111118888FF88888811
        111117877F7111111118888888888111111117F77F7999111111888888881111
        111111F77F7999991111788888F71111111111F77F7999999917888888FF7111
        111117F778879999917FFF88888FF111111117877887999997FFFFF88888FF11
        11111887778799997FFFFFF798888FF11111187777F87997FFFFFF71178F88FF
        71117F7707887997FFFFF7999978F88871118870077F87997FFF799999978F87
        1117F77000788879978799999999787111188700007788879999999999999999
        1188770000077F88799999999999999778F77000000077888879999999999778
        8877000000000778F88877799777788F877000000000007778F8888878888F87
        7700000000000000777788FFFF88777700000000000000000077777777777700
        00000000FFC003FFFF0000FFFC00003FF800001FF000000FE0000007C0000003
        C000000380000001800000010000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000080000001
        80000001C0000003C0000003E0000007F000000FF800001FFC00003FFF0000FF
        FFC003FF}
      ShowUnicode = False
      PostOnEnter = True
      OnCheckRequiredFields = DBAdvGridLotesCheckRequiredFields
      ColWidths = (
        20
        116
        75
        76
        75
        76
        75
        72
        78
        75
        76
        74
        76)
      RowHeights = (
        22
        22)
      object pnlEdicaoDados: TPanel
        Left = 358
        Top = 10
        Width = 551
        Height = 24
        AutoSize = True
        TabOrder = 4
        inline fraConsultaContabil: TfraConsultaCodigoContabil
          Left = 60
          Top = 1
          Width = 73
          Height = 21
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
          TabOrder = 1
          Visible = False
          inherited sbnProcura: TSpeedButton
            Left = 50
            Height = 21
          end
          inherited dtxDescricao: TtecDBText
            Left = 62
            Width = 0
          end
          inherited edfCodigo: TtecDBFindLookup
            Width = 50
            PermitirZero = True
            PermitirNulo = True
            Parameter = ' '
            ActiveSetControls = False
            DenyInsert = False
            NoSetControls = <>
            SetControls = <>
            LookupParameter = ' '
          end
        end
        object PlannerDBDatePicker1: TPlannerDBDatePicker
          Left = 170
          Top = 2
          Width = 78
          Height = 21
          Hint = 'Informe a data'
          AllowNumericNullValue = True
          AutoFocus = True
          Flat = False
          ShowModified = True
          ReturnIsTab = True
          LabelFont.Charset = DEFAULT_CHARSET
          LabelFont.Color = clWindowText
          LabelFont.Height = -11
          LabelFont.Name = 'MS Sans Serif'
          LabelFont.Style = []
          Lookup.Separator = ';'
          Color = clWindow
          TabOrder = 2
          Visible = False
          Version = '1.8.1.0'
          ButtonStyle = bsDropDown
          ButtonWidth = 16
          Etched = False
          Glyph.Data = {
            DA020000424DDA0200000000000036000000280000000D0000000D0000000100
            200000000000A402000000000000000000000000000000000000F0F0F000F0F0
            F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
            F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
            F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
            F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
            F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
            F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
            F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
            F00000000000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
            F000F0F0F000F0F0F000F0F0F000F0F0F000000000000000000000000000F0F0
            F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
            F0000000000000000000000000000000000000000000F0F0F000F0F0F000F0F0
            F000F0F0F000F0F0F000F0F0F000F0F0F0000000000000000000000000000000
            0000000000000000000000000000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
            F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
            F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
            F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
            F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
            F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
            F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
            F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
            F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000}
          Calendar = cal18_.Owner
          HideCalendarAfterSelection = True
          object cal18_: TPlannerCalendar
            Left = 0
            Top = 0
            Width = 180
            Height = 180
            EventDayColor = clBlack
            EventMarkerColor = clYellow
            EventMarkerShape = evsCircle
            BackgroundPosition = bpTiled
            BevelOuter = bvNone
            BorderWidth = 1
            Look = lookFlat
            DateDownColor = clNone
            DateHoverColor = clNone
            DayFont.Charset = DEFAULT_CHARSET
            DayFont.Color = clWindowText
            DayFont.Height = -11
            DayFont.Name = 'MS Sans Serif'
            DayFont.Style = []
            WeekFont.Charset = DEFAULT_CHARSET
            WeekFont.Color = clWindowText
            WeekFont.Height = -11
            WeekFont.Name = 'MS Sans Serif'
            WeekFont.Style = []
            WeekName = 'Wk'
            TextColor = clBlack
            SelectColor = clTeal
            SelectFontColor = clWhite
            InActiveColor = clGray
            HeaderColor = clNone
            FocusColor = clHighlight
            InversColor = clTeal
            WeekendColor = clRed
            NameOfDays.Monday = 'seg'
            NameOfDays.Tuesday = 'ter'
            NameOfDays.Wednesday = 'qua'
            NameOfDays.Thursday = 'qui'
            NameOfDays.Friday = 'sex'
            NameOfDays.Saturday = 's'#225'b'
            NameOfDays.Sunday = 'dom'
            NameOfMonths.January = 'jan'
            NameOfMonths.February = 'fev'
            NameOfMonths.March = 'mar'
            NameOfMonths.April = 'abr'
            NameOfMonths.May = 'mai'
            NameOfMonths.June = 'jun'
            NameOfMonths.July = 'jul'
            NameOfMonths.August = 'ago'
            NameOfMonths.September = 'set'
            NameOfMonths.October = 'out'
            NameOfMonths.November = 'nov'
            NameOfMonths.December = 'dez'
            NameOfMonths.UseIntlNames = True
            StartDay = 7
            TodayFormat = '"Today" DDD/mm, YYYY'
            Day = 9
            Month = 12
            Year = 1899
            TabOrder = 0
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            CaptionColor = clNone
            CaptionTextColor = clBlack
            LineColor = clGray
            Line3D = True
            GradientStartColor = clWhite
            GradientEndColor = clBtnFace
            GradientDirection = gdVertical
            MonthGradientStartColor = clNone
            MonthGradientEndColor = clNone
            MonthGradientDirection = gdHorizontal
            HintPrevYear = 'Previous Year'
            HintPrevMonth = 'Previous Month'
            HintNextMonth = 'Next Month'
            HintNextYear = 'Next Year'
            Version = '1.9.2.1'
          end
        end
        object DBAdvEdit: TDBAdvEdit
          Left = 249
          Top = 2
          Width = 90
          Height = 21
          ReturnIsTab = True
          Precision = 2
          LabelFont.Charset = DEFAULT_CHARSET
          LabelFont.Color = clWindowText
          LabelFont.Height = -11
          LabelFont.Name = 'MS Sans Serif'
          LabelFont.Style = []
          Lookup.Separator = ';'
          Color = clWindow
          TabOrder = 4
          Text = '0,00'
          Visible = False
          Version = '2.9.3.1'
        end
        object DBAdvEditFloat: TDBAdvMaskEdit
          Left = 429
          Top = 2
          Width = 121
          Height = 21
          Color = clWindow
          Enabled = True
          TabOrder = 5
          Visible = False
          OnKeyDown = DBAdvEditFloatKeyDown
          AutoFocus = False
          CanUndo = True
          Flat = False
          FlatLineColor = clBlack
          FlatParentColor = True
          ShowModified = False
          FocusColor = clWindow
          FocusBorder = False
          FocusFontColor = clBlack
          LabelAlwaysEnabled = False
          LabelPosition = lpLeftTop
          LabelMargin = 4
          LabelTransparent = False
          LabelFont.Charset = DEFAULT_CHARSET
          LabelFont.Color = clWindowText
          LabelFont.Height = -11
          LabelFont.Name = 'MS Sans Serif'
          LabelFont.Style = []
          ModifiedColor = clRed
          Alignment = taRightJustify
          SelectFirstChar = False
          Version = '2.9.3.1'
          DataField = 'quantidade'
          DataSource = dtmCadastroInventario.dsrInventarioProdutoLotes
        end
        object DBCheckBoxBoolean: TDBCheckBox
          Left = 1
          Top = 4
          Width = 16
          Height = 17
          TabOrder = 0
          ValueChecked = 'True'
          ValueUnchecked = 'False'
          Visible = False
        end
        object DBMaplistCombobox1: TDBMaplistCombobox
          Left = 340
          Top = 2
          Width = 89
          Height = 21
          ItemHeight = 13
          Items.Strings = (
            'C - Com composi'#231#227'o'
            'N - Sem composi'#231#227'o'
            'S - S'#243' composi'#231#227'o'
            '')
          TabOrder = 6
          Visible = False
          ItemValues.Strings = (
            'C'
            'N'
            'S'
            '')
        end
        inline fraConsulta_: TfraConsultaCodigo
          Left = 171
          Top = 1
          Width = 73
          Height = 22
          HorzScrollBar.Range = 249
          HorzScrollBar.Visible = False
          VertScrollBar.Range = 23
          VertScrollBar.Visible = False
          AutoScroll = False
          BiDiMode = bdLeftToRight
          Ctl3D = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentBiDiMode = False
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 3
          Visible = False
          inherited sbnProcura: TSpeedButton
            Left = 50
            Height = 21
            Hint = 'Procura produto'
          end
          inherited dtxDescricao: TtecDBText
            Left = 58
            Width = 0
            DataField = 'descricao'
            DataSource = fraConsulta_.dsrProcuraTipoProduto
          end
          inherited edfCodigo: TtecDBFindLookup
            Width = 50
            DataaFieldInterno = 'lote'
            DataaFieldVisual = 'nrlote'
            DataField = 'nrlote'
            DataSource = dtmCadastroInventario.dsrInventarioProdutoLotes
            MaxLength = 20
            PermitirZero = True
            PermitirNulo = True
            LookupaFieldinterno = 'lote'
            LookupaFieldVisual = 'nrlote'
            LookupField = 'nrlote'
            LookupSource = fraConsulta_.dsrProcuraEstoquesLotesProdutos
            LookupQueryParameter = 'nrlote'
            Parameter = ' '
            ActiveSetControls = False
            DenyInsert = False
            NoSetControls = <>
            SetControls = <>
            LookupParameter = 'nrlote'
          end
          inherited qryProcuraTipoProduto: TtecQuery
            Options = [doAutoFillDefs]
            ParamData = <
              item
                DataType = ftString
                Name = 'codigo'
                ParamType = ptUnknown
                Value = ''
              end>
          end
          inherited qryProcuraEstoquesLotesProdutos: TtecQuery
            ParamData = <
              item
                DataType = ftString
                Name = 'contrato'
                ParamType = ptInput
                Value = ''
              end
              item
                DataType = ftInteger
                Name = 'inventario'
                ParamType = ptInput
                Value = 0
              end
              item
                DataType = ftLargeint
                Name = 'produto'
                ParamType = ptInput
              end
              item
                DataType = ftString
                Name = 'nrlote'
                ParamType = ptInput
                Value = ''
              end
              item
                DataType = ftInteger
                Name = 'filial'
                ParamType = ptInput
                Value = 0
              end>
            inherited qryProcuraEstoquesLotesProdutosvalidade: TDateField
              Alignment = taCenter
              EditMask = '99/99/9999;1; '
            end
            inherited qryProcuraEstoquesLotesProdutosfabricacao: TDateField
              Alignment = taCenter
              EditMask = '99/99/9999;1; '
            end
            inherited qryProcuraEstoquesLotesProdutosinativo: TDateField
              Alignment = taCenter
              EditMask = '99/99/9999;1; '
            end
            inherited qryProcuraEstoquesLotesProdutosforalinha: TDateField
              Alignment = taCenter
              EditMask = '99/99/9999;1; '
            end
            inherited qryProcuraEstoquesLotesProdutosemestoque: TFloatField
              DisplayFormat = '0.00'
            end
            inherited qryProcuraEstoquesLotesProdutosreservado: TFloatField
              DisplayFormat = '0.00'
            end
            inherited qryProcuraEstoquesLotesProdutosqtjaprocessada: TFloatField
              DisplayFormat = '0.00'
            end
            inherited qryProcuraEstoquesLotesProdutosSaldoEstoque: TFloatField
              DisplayFormat = '0.00'
            end
          end
        end
      end
    end
  end
  object FormControlEditLink1: TFormControlEditLink
    Tag = 0
    AutoPopupWidth = False
    EditStyle = esInplace
    PopupWidth = 0
    PopupHeight = 0
    WantKeyLeftRight = False
    WantKeyUpDown = False
    WantKeyHomeEnd = False
    WantKeyPriorNext = False
    WantKeyReturn = True
    WantKeyEscape = True
    Control = pnlEdicaoDados
    OnSetEditorFocus = FormControlEditLink1SetEditorFocus
    Left = 492
    Top = 198
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 618
    Top = 207
  end
end
