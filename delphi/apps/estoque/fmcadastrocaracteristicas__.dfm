inherited frmCadastroCaracteristicas: TfrmCadastroCaracteristicas
  Left = 269
  Top = 75
  Caption = 'Cadastro de Produtos'
  ClientHeight = 733
  ClientWidth = 1011
  TransparentColorValue = clBtnFace
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBarra: TPanel
    Width = 720
  end
  inherited pnlTopMenu: TPanel
    Width = 1011
    TabOrder = 2
    inherited tblBarra: TToolBar
      Left = 300
      Width = 711
      inherited sbnAjuda: TSpeedButton
        Action = actHabilitarABAs
      end
    end
    inherited tblBarraCadastro: TToolBar
      Width = 300
      object sbnCopiar: TSpeedButton
        Left = 225
        Top = 2
        Width = 75
        Height = 35
        Hint = 'Copiar produtos de outro produto'
        Caption = 'Copiar F4'
        Flat = True
        Glyph.Data = {
          46020000424D460200000000000036000000280000000E0000000C0000000100
          1800000000001002000000000000000000000000000000000000DCDCDCDCDCDC
          DCDCDCDCDCDCE0E7E7B888887600007E00008000008000008000008000007C00
          007E00000000E2E2E2E2E2E2E2E2E2E2E2E2E6EDEDB57E7EBC7474FFFFFFF2FF
          FFF5FFFFF5FFFFF0FFFFFFFFFF7A00000000B7B7B7AEAEAEAEAEAEAEAEAEB0B6
          B6955D5DC375758A93930D0D0D181818181818030303FFFFFF7C000000000000
          00373737393939393939363D3D4C1515C27474EAF2F2C4C4C4C9C9C9C9C9C9C0
          C0C0FFFFFF7A00000000000000FFFFFFA1A1A1ABABABADB3B3935C5CC27373AA
          B3B34A4A4A4A4A4A4A4F4F3A4242FFFFFF7C00000000000000FFFFFF61616170
          70707076766E3737C27373CAD2D27E7E7EE2E8E8E5B7B7D08E8ECF9C9C760000
          0000000000FFFFFF6161617070707076766E3737C27373BFC8C86B6B6BD5E1E1
          8E1B1BC07F7F710000B279790000000000FFFFFFA0A0A0A5A5A59EA4A4935C5C
          BC7373FFFFFFFFFFFFFFFFFF993131A23F3FB78282E3ECEC0000000000FFFFFF
          1C1C1C6B6B6BE1E7E74A1313910B0BA43C3C982D2D9B3434770000B07575E0E6
          E6DCDDDD0000000000FFFFFFC3C3C3E0E0E0ABACAC534B4B8F75755B4141D1B8
          B8C8AEAEC9B0B0DDDFDFDCDEDEDCDCDC0000000000FFFFFFFFFFFFFFFFFFC6C6
          C60000005B5F5FDEE2E2E0E4E4DEE2E2DEE2E2DCDDDDDCDCDCDCDCDC00000000
          00000000000000000000000000515151EEEEEEDFDFDFDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDC0000}
        Layout = blGlyphTop
        OnClick = sbnCopiarClick
      end
    end
  end
  object pnlFundoJanela: TPanel
    Left = 0
    Top = 40
    Width = 1011
    Height = 693
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object pgcCaracteristicas: TtecPageControl
      Left = 0
      Top = 157
      Width = 1011
      Height = 301
      ActivePage = tstParametros
      Align = alTop
      MultiLine = True
      TabOrder = 1
      OnChange = pgcCaracteristicasChange
      OnChanging = pgcCaracteristicasChanging
      object tstParametros: TTabSheet
        Caption = ' &1 - Par'#226'metros'
        inline fraComissaoVendedores: TfraComissao
          Left = 381
          Top = 3
          Width = 140
          Height = 63
          HorzScrollBar.Range = 143
          HorzScrollBar.Visible = False
          VertScrollBar.Range = 74
          VertScrollBar.Visible = False
          AutoScroll = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          inherited gbxComissao: TGroupBox
            Top = 1
            Width = 131
            Height = 63
            Caption = 'COMISS'#195'O VENDEDORES'
            inherited lblComissao: TLabel
              Left = 64
              Top = 23
            end
            inherited dtxComissao: TDBEditNumero
              Left = 63
              Top = 36
              Width = 62
              Height = 23
              Font.Height = -12
              Text = 'dtxComissao'
            end
            inherited rgpTipoComissao: TtecDBRadioGroup
              Left = 4
              Top = 12
              Width = 54
              Height = 48
              inherited rbnPercentual: TtecRadioButton
                Left = 8
                Top = 13
                Height = 15
              end
              inherited rbnValor: TtecRadioButton
                Left = 8
                Top = 28
                Width = 39
              end
            end
          end
        end
        object rgpVendaNegativa: TtecDBRadioGroup
          Left = 200
          Top = 2
          Width = 128
          Height = 32
          Caption = 'VENDA SEM ESTOQUE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          TabStop = False
          DataField = 'vendanegativa'
          DataSource = dtmCadastroProdutos.dsrCaracteristicas
          object rbnSim: TtecRadioButton
            Left = 8
            Top = 13
            Width = 48
            Height = 15
            Caption = 'Sim'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            Value = 'S'
          end
          object rbnNao: TtecRadioButton
            Left = 64
            Top = 14
            Width = 45
            Height = 15
            Caption = 'N'#227'o'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            Value = 'N'
          end
        end
        object gbxOpcoes: TGroupBox
          Left = 6
          Top = 0
          Width = 187
          Height = 126
          TabOrder = 0
          object ckbBrinde: TDBCheckBox
            Left = 8
            Top = 48
            Width = 145
            Height = 20
            Caption = 'Produto '#233' brinde'
            DataField = 'brinde'
            DataSource = dtmCadastroProdutos.dsrCaracteristicas
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object ckbEmiteComplemento: TDBCheckBox
            Left = 8
            Top = 67
            Width = 145
            Height = 20
            Caption = 'Imprimir complemento'
            DataField = 'emitecomplemento'
            DataSource = dtmCadastroProdutos.dsrCaracteristicas
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object ckbEmiteEtiqueta: TDBCheckBox
            Left = 8
            Top = 29
            Width = 145
            Height = 20
            Caption = 'Emitir Etiqueta'
            DataField = 'emiteetiqueta'
            DataSource = dtmCadastroProdutos.dsrCaracteristicas
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object ckbMontagem: TDBCheckBox
            Left = 8
            Top = 11
            Width = 145
            Height = 20
            Caption = 'Requer montagem'
            DataField = 'montagem'
            DataSource = dtmCadastroProdutos.dsrCaracteristicas
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object ckbExigirNumeroSerieaoFaturar: TDBCheckBox
            Left = 8
            Top = 86
            Width = 145
            Height = 20
            Caption = 'Exige n'#250'mero de s'#233'rie'
            DataField = 'exigenumeroserie'
            DataSource = dtmCadastroProdutos.dsrCaracteristicas
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object ckbControlarLote_: TDBIntCheckBox
            Left = 8
            Top = 106
            Width = 177
            Height = 17
            Caption = 'Gerenciar lote e validade'
            TabOrder = 5
            DataField = 'gerenciarloteevalidade'
            DataSource = dtmCadastroProdutos.dsrCaracteristicas
          end
        end
        object gbxMarkUp: TGroupBox
          Left = 197
          Top = 36
          Width = 65
          Height = 36
          Caption = 'MARK-UP'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          object edtMarkup: TDBEditNumero
            Left = 2
            Top = 10
            Width = 60
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
            Text = 'edtMarkup'
            Mascara = True
            Alignment = taLeftJustify
            TipoMascara = tmGERAL
            NrDecimal = 2
            Decimais = True
            Negativo = False
            Tamanho = 3
            DataField = 'markup'
            DataSource = dtmCadastroProdutos.dsrCaracteristicas
          end
        end
        object gbxComposto: TGroupBox
          Left = 6
          Top = 131
          Width = 425
          Height = 97
          Caption = 'PRODUTO COMPOSTO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 9
          object rgpDiscriminarComposto: TtecDBRadioGroup
            Left = 6
            Top = 55
            Width = 411
            Height = 33
            Caption = 'DISCRIMINA'#199#195'O'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            TabStop = False
            DataField = 'discriminarcomposto'
            DataSource = dtmCadastroProdutos.dsrCaracteristicas
            object rbnSemComposicao: TtecRadioButton
              Left = 4
              Top = 13
              Width = 120
              Height = 17
              Caption = 'Sem composi'#231#227'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              Value = 'N'
            end
            object rbnComComposicao: TtecRadioButton
              Left = 143
              Top = 13
              Width = 120
              Height = 17
              Caption = 'Com composi'#231#227'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              Value = 'C'
            end
            object rbnSomenteComposicao: TtecRadioButton
              Left = 291
              Top = 13
              Width = 109
              Height = 17
              Caption = 'S'#243' composi'#231#227'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              Value = 'S'
            end
          end
          object ckbProdutoComposto: TDBCheckBox
            Left = 11
            Top = 15
            Width = 90
            Height = 20
            Caption = 'Conjunto'
            DataField = 'composto'
            DataSource = dtmCadastroProdutos.dsrCaracteristicas
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            Visible = False
            OnClick = ckbProdutoCompostoClick
          end
          object ckbDiscriminarPreco: TDBCheckBox
            Left = 147
            Top = 15
            Width = 125
            Height = 20
            Caption = 'Discriminar pre'#231'o'
            DataField = 'discriminarpreco'
            DataSource = dtmCadastroProdutos.dsrCaracteristicas
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            Visible = False
            OnClick = ckbProdutoCompostoClick
          end
          object ckbProdutoComposto2: TDBCheckBox
            Left = 11
            Top = 34
            Width = 90
            Height = 20
            Caption = 'Composto'
            DataField = 'composto2'
            DataSource = dtmCadastroProdutos.dsrCaracteristicas
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            Visible = False
            OnClick = ckbProdutoComposto2Click
          end
          object ckbDesmembrarComponentes: TDBCheckBox
            Left = 147
            Top = 34
            Width = 206
            Height = 20
            Caption = 'Desmembrar componentes'
            DataField = 'desmembrarcomponente'
            DataSource = dtmCadastroProdutos.dsrCaracteristicas
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = ckbProdutoCompostoClick
          end
        end
        object gbxCustoAdicionalProduto: TGroupBox
          Left = 271
          Top = 36
          Width = 103
          Height = 36
          Caption = 'CUSTO ADICIONAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          object edtCustoAdicionalProduto: TDBEditNumero
            Left = 2
            Top = 10
            Width = 98
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
            Text = 'edtCustoAdicionalProduto'
            Mascara = True
            Alignment = taLeftJustify
            TipoMascara = tmGERAL
            NrDecimal = 2
            Decimais = True
            Negativo = False
            Tamanho = 3
            DataField = 'custoadicionalproduto'
            DataSource = dtmCadastroProdutos.dsrCaracteristicas
          end
        end
        object gbxMarca: TGroupBox
          Left = 668
          Top = -1
          Width = 304
          Height = 36
          Caption = 'MARCA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 10
          object sbnProcurarMarcas: TSpeedButton
            Left = 53
            Top = 10
            Width = 23
            Height = 23
            Hint = 'Procurar Marca'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Glyph.Data = {
              36060000424D3606000000000000360000002800000020000000100000000100
              18000000000000060000120B0000120B00000000000000000000C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7FFFFFFFC3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3800000800000800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C38000
              00800000800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C38000008000
              00800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C38000008000008000
              00C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFFFFFFFFFF
              FFFFC3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3FFA858800000800000800000FFA858C3C3C30000FF800000800000C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3
              C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              800000FFA858FFA858FFA858FFA858FFA8588000008000000000FFC3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7FC3C3C3C3C3C3C3C3C37F
              7F7F7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3800000
              FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFA858FFA858
              FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C37F7F7FC3C3C3FFFFFFC3C3C3C3C3C3C3C3C3C3C3C3800000FFA858
              FFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFA858800000C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3800000FFA858
              FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3800000FFA858
              FFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFA858800000C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C37F7F7FC3C3C3FFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C37F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFA858FFA858
              FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3800000
              FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FC3C3C3FFFFFFFFFFFFC3C3C3C3C3C3C3
              C3C3FFFFFF7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              800000FFA858FFA858FFA858FFA858FFA858800000C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7FC3C3C3FFFFFFFFFFFF7F
              7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3FFA858800000800000800000FFA858C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7F7F7F7FC3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3}
            NumGlyphs = 2
            ParentFont = False
            OnClick = sbnProcurarMarcasClick
          end
          object flkMarca: TtecDBFindLookup
            Left = 2
            Top = 10
            Width = 50
            Height = 23
            Alignment = taLeftJustify
            DataField = 'marca'
            DataSource = dtmCadastroProdutos.dsrCaracteristicas
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            MaxLength = 4
            Maximo = 0
            Minimo = 37353
            Adicional = 0
            Opcional = True
            ParentFont = False
            TabOrder = 0
            PermitirZero = False
            PermitirNulo = False
            Operacao = opATRIBUICAO
            LookupField = 'codigo'
            LookupSource = dtmCadastroProdutos.dsrProcuraMarcas
            LookupQueryParameter = 'codigo'
            Parameter = ' '
            ActiveSetControls = False
            DenyInsert = True
            NoSetControls = <>
            SetControls = <>
            LookupParameter = 'codigo'
          end
          object dtxMarca: TtecDBText
            Left = 77
            Top = 10
            Width = 224
            Height = 23
            TabStop = False
            Color = clBtnFace
            DataField = 'descricao'
            DataSource = dtmCadastroProdutos.dsrProcuraMarcas
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
        object gbxGrupo: TGroupBox
          Left = 668
          Top = 35
          Width = 304
          Height = 36
          Caption = 'GRUPO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 11
          object sbnProcurarGrupos: TSpeedButton
            Left = 53
            Top = 10
            Width = 23
            Height = 23
            Hint = 'Procurar Grupo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Glyph.Data = {
              36060000424D3606000000000000360000002800000020000000100000000100
              18000000000000060000120B0000120B00000000000000000000C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7FFFFFFFC3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3800000800000800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C38000
              00800000800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C38000008000
              00800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C38000008000008000
              00C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFFFFFFFFFF
              FFFFC3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3FFA858800000800000800000FFA858C3C3C30000FF800000800000C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3
              C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              800000FFA858FFA858FFA858FFA858FFA8588000008000000000FFC3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7FC3C3C3C3C3C3C3C3C37F
              7F7F7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3800000
              FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFA858FFA858
              FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C37F7F7FC3C3C3FFFFFFC3C3C3C3C3C3C3C3C3C3C3C3800000FFA858
              FFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFA858800000C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3800000FFA858
              FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3800000FFA858
              FFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFA858800000C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C37F7F7FC3C3C3FFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C37F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFA858FFA858
              FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3800000
              FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FC3C3C3FFFFFFFFFFFFC3C3C3C3C3C3C3
              C3C3FFFFFF7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              800000FFA858FFA858FFA858FFA858FFA858800000C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7FC3C3C3FFFFFFFFFFFF7F
              7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3FFA858800000800000800000FFA858C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7F7F7F7FC3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3}
            NumGlyphs = 2
            ParentFont = False
            OnClick = sbnProcurarGruposClick
          end
          object flkGrupo: TtecDBFindLookup
            Left = 2
            Top = 10
            Width = 50
            Height = 23
            Alignment = taLeftJustify
            CharCase = ecUpperCase
            DataField = 'grupo'
            DataSource = dtmCadastroProdutos.dsrCaracteristicas
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            MaxLength = 4
            Maximo = 0
            Minimo = 37353
            Adicional = 0
            Opcional = True
            ParentFont = False
            TabOrder = 0
            PermitirZero = False
            PermitirNulo = False
            Operacao = opATRIBUICAO
            LookupField = 'codigo'
            LookupSource = dtmCadastroProdutos.dsrProcuraGrupos
            LookupQueryParameter = 'codigo'
            Parameter = ' '
            ActiveSetControls = False
            DenyInsert = True
            NoSetControls = <>
            SetControls = <>
            LookupParameter = 'codigo'
          end
          object dtxGrupo: TtecDBText
            Left = 77
            Top = 10
            Width = 224
            Height = 23
            TabStop = False
            Color = clBtnFace
            DataField = 'descricao'
            DataSource = dtmCadastroProdutos.dsrProcuraGrupos
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
        object gbxClasse: TGroupBox
          Left = 668
          Top = 71
          Width = 305
          Height = 36
          Caption = 'CLASSE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 12
          object sbnClasse: TSpeedButton
            Left = 53
            Top = 10
            Width = 23
            Height = 23
            Hint = 'Procurar Classe'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Glyph.Data = {
              36060000424D3606000000000000360000002800000020000000100000000100
              18000000000000060000120B0000120B00000000000000000000C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7FFFFFFFC3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3800000800000800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C38000
              00800000800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C38000008000
              00800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C38000008000008000
              00C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFFFFFFFFFF
              FFFFC3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3FFA858800000800000800000FFA858C3C3C30000FF800000800000C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3
              C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              800000FFA858FFA858FFA858FFA858FFA8588000008000000000FFC3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7FC3C3C3C3C3C3C3C3C37F
              7F7F7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3800000
              FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFA858FFA858
              FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C37F7F7FC3C3C3FFFFFFC3C3C3C3C3C3C3C3C3C3C3C3800000FFA858
              FFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFA858800000C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3800000FFA858
              FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3800000FFA858
              FFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFA858800000C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C37F7F7FC3C3C3FFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C37F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFA858FFA858
              FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3800000
              FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FC3C3C3FFFFFFFFFFFFC3C3C3C3C3C3C3
              C3C3FFFFFF7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              800000FFA858FFA858FFA858FFA858FFA858800000C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7FC3C3C3FFFFFFFFFFFF7F
              7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3FFA858800000800000800000FFA858C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7F7F7F7FC3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3}
            NumGlyphs = 2
            ParentFont = False
            OnClick = sbnClasseClick
          end
          object flkClasse: TtecDBFindLookup
            Left = 2
            Top = 10
            Width = 50
            Height = 23
            Alignment = taLeftJustify
            CharCase = ecUpperCase
            DataField = 'classe'
            DataSource = dtmCadastroProdutos.dsrCaracteristicas
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            MaxLength = 2
            Maximo = 0
            Minimo = 37353
            Adicional = 0
            Opcional = True
            ParentFont = False
            TabOrder = 0
            PermitirZero = False
            PermitirNulo = False
            Operacao = opATRIBUICAO
            LookupField = 'codigo'
            LookupSource = dtmCadastroProdutos.dsrProcuraClasses
            LookupQueryParameter = 'codigo'
            Parameter = ' '
            ActiveSetControls = False
            DenyInsert = True
            NoSetControls = <>
            SetControls = <>
            LookupParameter = 'codigo'
          end
          object dtxClasse: TtecDBText
            Left = 77
            Top = 10
            Width = 224
            Height = 23
            TabStop = False
            Color = clBtnFace
            DataField = 'descricao'
            DataSource = dtmCadastroProdutos.dsrProcuraClasses
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
        object gbxUnidade: TGroupBox
          Left = 668
          Top = 107
          Width = 305
          Height = 36
          Caption = 'UNIDADE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 13
          object sbnProcurarUnidades: TSpeedButton
            Left = 53
            Top = 10
            Width = 23
            Height = 23
            Hint = 'Procurar Unidade'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Glyph.Data = {
              36060000424D3606000000000000360000002800000020000000100000000100
              18000000000000060000120B0000120B00000000000000000000C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7FFFFFFFC3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3800000800000800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C38000
              00800000800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C38000008000
              00800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C38000008000008000
              00C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFFFFFFFFFF
              FFFFC3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3FFA858800000800000800000FFA858C3C3C30000FF800000800000C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3
              C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              800000FFA858FFA858FFA858FFA858FFA8588000008000000000FFC3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7FC3C3C3C3C3C3C3C3C37F
              7F7F7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3800000
              FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFA858FFA858
              FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C37F7F7FC3C3C3FFFFFFC3C3C3C3C3C3C3C3C3C3C3C3800000FFA858
              FFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFA858800000C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3800000FFA858
              FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3800000FFA858
              FFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFA858800000C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C37F7F7FC3C3C3FFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C37F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFA858FFA858
              FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3800000
              FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FC3C3C3FFFFFFFFFFFFC3C3C3C3C3C3C3
              C3C3FFFFFF7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              800000FFA858FFA858FFA858FFA858FFA858800000C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7FC3C3C3FFFFFFFFFFFF7F
              7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3FFA858800000800000800000FFA858C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7F7F7F7FC3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3}
            NumGlyphs = 2
            ParentFont = False
            OnClick = sbnProcurarUnidadesClick
          end
          object flkUnidade: TtecDBFindLookup
            Left = 2
            Top = 10
            Width = 50
            Height = 23
            Alignment = taLeftJustify
            CharCase = ecUpperCase
            DataField = 'unidade'
            DataSource = dtmCadastroProdutos.dsrCaracteristicas
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            MaxLength = 8
            Maximo = 0
            Minimo = 37353
            Adicional = 0
            Opcional = True
            ParentFont = False
            TabOrder = 0
            PermitirZero = False
            PermitirNulo = False
            Operacao = opATRIBUICAO
            LookupField = 'codigo'
            LookupSource = dtmCadastroProdutos.dsrProcuraUnidades
            LookupQueryParameter = 'codigo'
            Parameter = ' '
            ActiveSetControls = False
            DenyInsert = True
            NoSetControls = <>
            SetControls = <>
            LookupParameter = 'codigo'
          end
          object dtxUnidade: TtecDBText
            Left = 77
            Top = 10
            Width = 224
            Height = 23
            TabStop = False
            Color = clBtnFace
            DataField = 'descricao'
            DataSource = dtmCadastroProdutos.dsrProcuraUnidades
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
        object gbxMoeda: TGroupBox
          Left = 668
          Top = 144
          Width = 305
          Height = 36
          Caption = 'MOEDA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 14
          object sbnFator: TSpeedButton
            Left = 53
            Top = 10
            Width = 23
            Height = 23
            Hint = 'Procurar Fatores Pre'#231'o'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Glyph.Data = {
              36060000424D3606000000000000360000002800000020000000100000000100
              18000000000000060000120B0000120B00000000000000000000C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7FFFFFFFC3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3800000800000800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C38000
              00800000800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C38000008000
              00800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C38000008000008000
              00C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFFFFFFFFFF
              FFFFC3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3FFA858800000800000800000FFA858C3C3C30000FF800000800000C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3
              C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              800000FFA858FFA858FFA858FFA858FFA8588000008000000000FFC3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7FC3C3C3C3C3C3C3C3C37F
              7F7F7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3800000
              FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFA858FFA858
              FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C37F7F7FC3C3C3FFFFFFC3C3C3C3C3C3C3C3C3C3C3C3800000FFA858
              FFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFA858800000C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3800000FFA858
              FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3800000FFA858
              FFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFA858800000C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C37F7F7FC3C3C3FFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C37F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFA858FFA858
              FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3800000
              FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FC3C3C3FFFFFFFFFFFFC3C3C3C3C3C3C3
              C3C3FFFFFF7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              800000FFA858FFA858FFA858FFA858FFA858800000C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7FC3C3C3FFFFFFFFFFFF7F
              7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3FFA858800000800000800000FFA858C3C3C3C3C3C3C3C3C3C3C3C3C3C3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7F7F7F7FC3
              C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3}
            NumGlyphs = 2
            ParentFont = False
            OnClick = sbnFatorClick
          end
          object flkFator: TtecDBFindLookup
            Left = 2
            Top = 10
            Width = 50
            Height = 23
            Alignment = taLeftJustify
            CharCase = ecUpperCase
            DataField = 'fatorpreco'
            DataSource = dtmCadastroProdutos.dsrCaracteristicas
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            MaxLength = 4
            Maximo = 0
            Minimo = 37353
            Adicional = 0
            Opcional = True
            ParentFont = False
            TabOrder = 0
            PermitirZero = False
            PermitirNulo = False
            Operacao = opATRIBUICAO
            LookupField = 'codigo'
            LookupSource = dtmCadastroProdutos.dsrProcuraFatoresPreco
            LookupQueryParameter = 'codigo'
            Parameter = ' '
            ActiveSetControls = False
            DenyInsert = True
            NoSetControls = <>
            SetControls = <>
            LookupParameter = 'codigo'
          end
          object dtxFator: TtecDBText
            Left = 77
            Top = 10
            Width = 224
            Height = 23
            TabStop = False
            Color = clBtnFace
            DataField = 'descricao'
            DataSource = dtmCadastroProdutos.dsrProcuraFatoresPreco
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
        object gbxSetorProducao: TGroupBox
          Left = 668
          Top = 180
          Width = 306
          Height = 38
          Caption = 'SETOR DE PRODU'#199#195'O'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 15
          inline fraConsultaSetoresProducao: TfraConsultaCodigo
            Left = 3
            Top = 11
            Width = 300
            Height = 23
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
            TabOrder = 0
            inherited sbnProcura: TSpeedButton
              Left = 43
              Height = 23
            end
            inherited dtxDescricao: TtecDBText
              Left = 67
              Width = 232
              DataField = 'descricao'
              DataSource = fraConsultaSetoresProducao.dsrProcuraSetoresProducao
            end
            inherited edfCodigo: TtecDBFindLookup
              Width = 44
              DataField = 'setorproducao'
              MaxLength = 4
              LookupField = 'codigo'
              LookupSource = fraConsultaSetoresProducao.dsrProcuraSetoresProducao
              LookupQueryParameter = 'codigo'
              Parameter = ' '
              ActiveSetControls = False
              DenyInsert = True
              NoSetControls = <>
              SetControls = <>
              LookupParameter = 'codigo'
            end
          end
        end
        object pgcFiosFitas: TPageControl
          Left = 518
          Top = 2
          Width = 126
          Height = 143
          ActivePage = tstFiosProdutos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          Style = tsFlatButtons
          TabHeight = 1
          TabOrder = 8
          TabWidth = 1
          object tstFiosProdutos: TTabSheet
            Caption = #39
            object gbxFiosProdutos: TGroupBox
              Left = 0
              Top = 0
              Width = 118
              Height = 132
              Align = alClient
              Caption = ' FIOS '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
              object gbxBitola_fio: TGroupBox
                Left = 0
                Top = 16
                Width = 75
                Height = 35
                Caption = ' BITOLA '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                object edtBitola_fio: TDBEditTexto
                  Left = 2
                  Top = 10
                  Width = 70
                  Height = 23
                  DataField = 'bitola'
                  DataSource = dtmCadastroProdutos.dsrCaracteristicas
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  MaxLength = -1
                  ParentFont = False
                  TabOrder = 0
                  CharCasenoDefault = False
                  Alignment = taLeftJustify
                end
              end
              object gbxLiga_fio: TGroupBox
                Left = 73
                Top = 16
                Width = 45
                Height = 36
                Caption = ' LIGA '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 1
                object edtLiga_fio: TDBEditTexto
                  Left = 2
                  Top = 10
                  Width = 40
                  Height = 23
                  DataField = 'liga'
                  DataSource = dtmCadastroProdutos.dsrCaracteristicas
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  MaxLength = -1
                  ParentFont = False
                  TabOrder = 0
                  CharCasenoDefault = False
                  Alignment = taLeftJustify
                end
              end
              object gbxResistividade_fio: TGroupBox
                Left = 0
                Top = 96
                Width = 90
                Height = 36
                Caption = ' OHMs / m '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 3
                object edtResistividade_fio: TDBEditNumero
                  Left = 2
                  Top = 10
                  Width = 85
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
                  Text = 'edtResistividade_fio'
                  Mascara = True
                  Alignment = taLeftJustify
                  TipoMascara = tmGERAL
                  NrDecimal = 3
                  Decimais = True
                  Negativo = False
                  Tamanho = 8
                  DataField = 'resistividade'
                  DataSource = dtmCadastroProdutos.dsrCaracteristicas
                end
              end
              object gbxTolerancia_fio: TGroupBox
                Left = 0
                Top = 56
                Width = 57
                Height = 36
                Caption = ' TOL. % '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 2
                object edtTolerancia_fio: TDBEditNumero
                  Left = 2
                  Top = 10
                  Width = 52
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
                  Text = 'edtTolerancia_fio'
                  Mascara = False
                  Alignment = taLeftJustify
                  TipoMascara = tmGERAL
                  NrDecimal = 0
                  Decimais = False
                  Negativo = False
                  Tamanho = 9
                  DataField = 'tolerancia'
                  DataSource = dtmCadastroProdutos.dsrCaracteristicas
                end
              end
            end
          end
          object tstFitasProdutos: TTabSheet
            Caption = 'FITAS'
            ImageIndex = 1
            object gbxFitasProdutos: TGroupBox
              Left = 0
              Top = 0
              Width = 118
              Height = 132
              Align = alClient
              Caption = 'FITAS'
              TabOrder = 0
              object gbxEspessura_fita: TGroupBox
                Left = 7
                Top = 20
                Width = 85
                Height = 35
                Caption = 'ESPESSURA'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                object edtEspessura_fita: TDBEditTexto
                  Left = 4
                  Top = 10
                  Width = 76
                  Height = 23
                  DataField = 'bitola'
                  DataSource = dtmCadastroProdutos.dsrCaracteristicas
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  MaxLength = -1
                  ParentFont = False
                  TabOrder = 0
                  CharCasenoDefault = False
                  Alignment = taLeftJustify
                end
              end
              object gbxLargura_fita: TGroupBox
                Left = 7
                Top = 60
                Width = 85
                Height = 35
                Caption = 'LARGURA'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 1
                object edtLargura_fita: TDBEditTexto
                  Left = 4
                  Top = 10
                  Width = 76
                  Height = 23
                  DataField = 'largura'
                  DataSource = dtmCadastroProdutos.dsrCaracteristicas
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  MaxLength = -1
                  ParentFont = False
                  TabOrder = 0
                  CharCasenoDefault = False
                  Alignment = taLeftJustify
                end
              end
              object gbxLiga_fita: TGroupBox
                Left = 7
                Top = 101
                Width = 45
                Height = 36
                Caption = 'LIGA'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 2
                object edtLiga_fita: TDBEditTexto
                  Left = 2
                  Top = 10
                  Width = 39
                  Height = 23
                  DataField = 'liga'
                  DataSource = dtmCadastroProdutos.dsrCaracteristicas
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  MaxLength = -1
                  ParentFont = False
                  TabOrder = 0
                  CharCasenoDefault = False
                  Alignment = taLeftJustify
                end
              end
            end
          end
        end
        object gbxMultiplo: TGroupBox
          Left = 197
          Top = 72
          Width = 65
          Height = 39
          Caption = 'M'#218'LTIPLO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          object edtMultiploPreco: TDBEditNumero
            Left = 2
            Top = 10
            Width = 60
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
            Text = 'edtMultiploPreco'
            Mascara = True
            Alignment = taLeftJustify
            TipoMascara = tmGERAL
            NrDecimal = 2
            Decimais = True
            Negativo = False
            Tamanho = 3
            DataField = 'multiplo'
            DataSource = dtmCadastroProdutos.dsrCaracteristicas
          end
        end
        object gbxBonus: TGroupBox
          Left = 269
          Top = 74
          Width = 65
          Height = 36
          Caption = 'B'#212'NUS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          object edtBonus: TDBEditNumero
            Left = 2
            Top = 10
            Width = 60
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
            Text = 'edtBonus'
            Mascara = True
            Alignment = taLeftJustify
            TipoMascara = tmGERAL
            NrDecimal = 0
            Decimais = False
            Negativo = False
            Tamanho = 5
            DataField = 'bonus'
            DataSource = dtmCadastroProdutos.dsrCaracteristicas
          end
        end
        inline fraComissaoIndicadores: TfraComissao
          Left = 381
          Top = 67
          Width = 140
          Height = 63
          HorzScrollBar.Range = 143
          HorzScrollBar.Visible = False
          VertScrollBar.Range = 74
          VertScrollBar.Visible = False
          AutoScroll = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 7
          inherited gbxComissao: TGroupBox
            Top = 1
            Width = 131
            Height = 63
            Caption = 'COMISS'#195'O INDICADORES'
            inherited lblComissao: TLabel
              Left = 64
              Top = 23
            end
            inherited dtxComissao: TDBEditNumero
              Left = 63
              Top = 36
              Width = 62
              Height = 23
              Font.Height = -12
              Text = 'dtxComissao'
              DataField = 'comissaoindicador'
            end
            inherited rgpTipoComissao: TtecDBRadioGroup
              Left = 4
              Top = 12
              Width = 54
              Height = 48
              DataField = 'tipocomissaoindicador'
              inherited rbnPercentual: TtecRadioButton
                Left = 8
                Top = 13
                Height = 15
              end
              inherited rbnValor: TtecRadioButton
                Left = 8
                Top = 28
                Width = 39
              end
            end
          end
        end
      end
      object tstInformacoesFiscais: TTabSheet
        Caption = '&2 - Inform. Fiscais'
        ImageIndex = 2
        object pgcInformacoesFiscais: TtecPageControl
          Left = 0
          Top = 0
          Width = 1003
          Height = 270
          ActivePage = tstParametrosFiscais
          Align = alClient
          TabOrder = 0
          OnChange = pgcInformacoesFiscaisChange
          object tstParametrosFiscais: TTabSheet
            Caption = 'Par'#226'metros'
            object gbxSituacaoTributaria: TPanel
              Left = 0
              Top = 0
              Width = 506
              Height = 239
              Align = alLeft
              BevelOuter = bvNone
              TabOrder = 0
              object gbxCSOSN: TGroupBox
                Left = 0
                Top = 34
                Width = 506
                Height = 33
                Align = alTop
                Caption = 'CSOSN - COD. SIT. OP. SIMPLES NACIONAL'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 1
                inline fraConsultaCSOSN: TfraConsultaCodigoContabil
                  Left = 3
                  Top = 10
                  Width = 413
                  Height = 21
                  HorzScrollBar.Range = 396
                  HorzScrollBar.Visible = False
                  VertScrollBar.Range = 23
                  VertScrollBar.Visible = False
                  AutoScroll = False
                  Constraints.MaxHeight = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                  inherited sbnProcura: TSpeedButton
                    Left = 32
                    Height = 21
                    Constraints.MaxHeight = 21
                  end
                  inherited dtxDescricao: TtecDBText
                    Left = 54
                    Width = 358
                    Height = 21
                    Constraints.MaxHeight = 21
                    DataField = 'descricao'
                    DataSource = fraConsultaCSOSN.dsrProcuraCSOSN
                  end
                  inherited edfCodigo: TtecDBFindLookup
                    Width = 32
                    Height = 21
                    Constraints.MaxHeight = 21
                    DataField = 'csosn'
                    MaxLength = 3
                    LookupField = 'codigo'
                    LookupSource = fraConsultaCSOSN.dsrProcuraCSOSN
                    LookupQueryParameter = 'codigo'
                    Parameter = ' '
                    ActiveSetControls = False
                    DenyInsert = True
                    NoSetControls = <>
                    SetControls = <>
                    LookupParameter = 'codigo'
                  end
                end
                object gbxReducaoBase: TGroupBox
                  Left = 416
                  Top = 0
                  Width = 90
                  Height = 33
                  Caption = 'REDU'#199#195'O BASE '
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -9
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 1
                  object lblPercReducao: TLabel
                    Left = 74
                    Top = 13
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
                  object edtReducaoBase: TDBEditNumero
                    Left = 2
                    Top = 10
                    Width = 69
                    Height = 21
                    Constraints.MaxHeight = 21
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -12
                    Font.Name = 'helvetica'
                    Font.Pitch = fpVariable
                    Font.Style = []
                    MaxLength = -1
                    ParentFont = False
                    TabOrder = 0
                    Text = 'edtReducaoBase'
                    Mascara = True
                    Alignment = taLeftJustify
                    TipoMascara = tmGERAL
                    NrDecimal = 2
                    Decimais = True
                    Negativo = False
                    Tamanho = 3
                    DataField = 'percreducaobase'
                    DataSource = dtmCadastroProdutos.dsrCaracteristicas
                  end
                end
              end
              object gbxICMSCST: TGroupBox
                Left = 0
                Top = 0
                Width = 506
                Height = 34
                Align = alTop
                Caption = 'ICMS - C'#211'D. SITUA'#199#195'O TRIBUT'#193'RIA'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                object sbnProcurarIncidencia: TSpeedButton
                  Left = 35
                  Top = 11
                  Width = 23
                  Height = 21
                  Hint = 'Procurar Incid'#234'ncia'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  Glyph.Data = {
                    36060000424D3606000000000000360000002800000020000000100000000100
                    18000000000000060000120B0000120B00000000000000000000C3C3C3C3C3C3
                    C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                    C3C3C3C3800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                    C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7FFFFFFFC3C3C3C3C3C3
                    C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                    C3800000800000800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                    C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3
                    C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C38000
                    00800000800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                    C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3
                    C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C38000008000
                    00800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                    C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3
                    C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C38000008000008000
                    00C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFFFFFFFFFF
                    FFFFC3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                    C3C3C3FFA858800000800000800000FFA858C3C3C30000FF800000800000C3C3
                    C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3
                    C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                    800000FFA858FFA858FFA858FFA858FFA8588000008000000000FFC3C3C3C3C3
                    C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7FC3C3C3C3C3C3C3C3C37F
                    7F7F7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3800000
                    FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000C3C3C3C3C3C3C3C3
                    C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
                    C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFA858FFA858
                    FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858C3C3C3C3C3
                    C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                    C3C3C3C3C37F7F7FC3C3C3FFFFFFC3C3C3C3C3C3C3C3C3C3C3C3800000FFA858
                    FFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFA858800000C3C3C3C3C3
                    C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                    C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3800000FFA858
                    FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000C3C3C3C3C3
                    C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                    C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3800000FFA858
                    FFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFA858800000C3C3C3C3C3
                    C3C3C3C3C3C3C3C3C3C37F7F7FC3C3C3FFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
                    C3C3C3C3C3C3C3C37F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFA858FFA858
                    FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858C3C3C3C3C3
                    C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
                    C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3800000
                    FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000C3C3C3C3C3C3C3C3
                    C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FC3C3C3FFFFFFFFFFFFC3C3C3C3C3C3C3
                    C3C3FFFFFF7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                    800000FFA858FFA858FFA858FFA858FFA858800000C3C3C3C3C3C3C3C3C3C3C3
                    C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7FC3C3C3FFFFFFFFFFFF7F
                    7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                    C3C3C3FFA858800000800000800000FFA858C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                    C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7F7F7F7FC3
                    C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3}
                  NumGlyphs = 2
                  ParentFont = False
                  OnClick = sbnProcurarIncidenciaClick
                end
                object dtxIncidencia: TtecDBText
                  Left = 59
                  Top = 10
                  Width = 444
                  Height = 21
                  TabStop = False
                  Color = clBtnFace
                  Constraints.MaxHeight = 21
                  DataField = 'descricao'
                  DataSource = dtmCadastroProdutos.dsrProcuraIncidencias
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
                object flkIncidencia: TtecDBFindLookup
                  Left = 3
                  Top = 10
                  Width = 30
                  Height = 21
                  Alignment = taLeftJustify
                  Constraints.MaxHeight = 21
                  DataaFieldInterno = 'incidencia'
                  DataaFieldVisual = 'cst'
                  DataField = 'cst'
                  DataSource = dtmCadastroProdutos.dsrCaracteristicas
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  MaxLength = 2
                  Maximo = 0
                  Minimo = 37353
                  Adicional = 0
                  Opcional = True
                  OnEnter = flkIncidenciaEnter
                  ParentFont = False
                  TabOrder = 1
                  PermitirZero = False
                  PermitirNulo = False
                  Operacao = opATRIBUICAO
                  LookupaFieldinterno = 'codigo'
                  LookupaFieldVisual = 'valor'
                  LookupField = 'valor'
                  LookupSource = dtmCadastroProdutos.dsrProcuraIncidencias
                  LookupQueryParameter = 'cst'
                  Parameter = ' '
                  ActiveSetControls = False
                  DenyInsert = True
                  NoSetControls = <>
                  SetControls = <>
                  LookupParameter = 'cst'
                end
              end
              object gbxICMSBC: TGroupBox
                Left = 0
                Top = 67
                Width = 506
                Height = 33
                Align = alTop
                Caption = 'ICMS - MODALIDADE DA BASE DE C'#193'LCULO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 2
                inline fraConsultaBCICMS: TfraConsultaCodigo
                  Left = 3
                  Top = 10
                  Width = 414
                  Height = 21
                  HorzScrollBar.Range = 397
                  HorzScrollBar.Visible = False
                  VertScrollBar.Range = 23
                  VertScrollBar.Visible = False
                  AutoScroll = False
                  Constraints.MaxHeight = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                  inherited sbnProcura: TSpeedButton
                    Left = 31
                    Height = 21
                    Constraints.MaxHeight = 21
                  end
                  inherited dtxDescricao: TtecDBText
                    Left = 55
                    Width = 359
                    Height = 21
                    Constraints.MaxHeight = 21
                    DataField = 'descricao'
                    DataSource = fraConsultaBCICMS.dsrProcuraModalidadeBCICMS
                  end
                  inherited edfCodigo: TtecDBFindLookup
                    Left = -1
                    Width = 30
                    Height = 21
                    Constraints.MaxHeight = 21
                    DataField = 'icmsmodalidade'
                    MaxLength = 1
                    PermitirZero = True
                    PermitirNulo = True
                    LookupField = 'codigo'
                    LookupSource = fraConsultaBCICMS.dsrProcuraModalidadeBCICMS
                    LookupQueryParameter = 'codigo'
                    Parameter = ' '
                    ActiveSetControls = False
                    DenyInsert = True
                    NoSetControls = <>
                    SetControls = <>
                    LookupParameter = 'codigo'
                  end
                  inherited qryProcuraModalidadeBCICMS: TtecQuery
                    ParamData = <
                      item
                        DataType = ftInteger
                        Name = 'codigo'
                        ParamType = ptUnknown
                        Value = 0
                      end>
                    inherited qryProcuraModalidadeBCICMScodigo: TIntegerField
                      DisplayFormat = '0'
                    end
                  end
                end
                object gbxBaseICMS: TGroupBox
                  Left = 417
                  Top = 0
                  Width = 90
                  Height = 33
                  Caption = 'BASE ICMS'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -9
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 1
                  object edtBaseICMS: TDBEditNumero
                    Left = 2
                    Top = 10
                    Width = 86
                    Height = 21
                    Constraints.MaxHeight = 21
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -12
                    Font.Name = 'helvetica'
                    Font.Pitch = fpVariable
                    Font.Style = []
                    MaxLength = -1
                    ParentFont = False
                    TabOrder = 0
                    Text = 'edtBaseICMS'
                    Mascara = True
                    Alignment = taLeftJustify
                    TipoMascara = tmGERAL
                    NrDecimal = 2
                    Decimais = True
                    Negativo = False
                    Tamanho = 12
                    DataField = 'baseicms'
                    DataSource = dtmCadastroProdutos.dsrCaracteristicas
                  end
                end
              end
              object gbxAliquotaICMS: TGroupBox
                Left = 0
                Top = 100
                Width = 506
                Height = 35
                Align = alTop
                Caption = 'ICMS - AL'#205'QUOTA'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 3
                object sbnProcurarICMS: TSpeedButton
                  Left = 34
                  Top = 10
                  Width = 23
                  Height = 21
                  Hint = 'Procurar ICMS'
                  Constraints.MaxHeight = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  Glyph.Data = {
                    36060000424D3606000000000000360000002800000020000000100000000100
                    18000000000000060000120B0000120B00000000000000000000C3C3C3C3C3C3
                    C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                    C3C3C3C3800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                    C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7FFFFFFFC3C3C3C3C3C3
                    C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                    C3800000800000800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                    C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3
                    C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C38000
                    00800000800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                    C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3
                    C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C38000008000
                    00800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                    C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3
                    C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C38000008000008000
                    00C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFFFFFFFFFF
                    FFFFC3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                    C3C3C3FFA858800000800000800000FFA858C3C3C30000FF800000800000C3C3
                    C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3
                    C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                    800000FFA858FFA858FFA858FFA858FFA8588000008000000000FFC3C3C3C3C3
                    C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7FC3C3C3C3C3C3C3C3C37F
                    7F7F7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3800000
                    FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000C3C3C3C3C3C3C3C3
                    C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
                    C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFA858FFA858
                    FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858C3C3C3C3C3
                    C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                    C3C3C3C3C37F7F7FC3C3C3FFFFFFC3C3C3C3C3C3C3C3C3C3C3C3800000FFA858
                    FFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFA858800000C3C3C3C3C3
                    C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                    C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3800000FFA858
                    FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000C3C3C3C3C3
                    C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                    C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3800000FFA858
                    FFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFA858800000C3C3C3C3C3
                    C3C3C3C3C3C3C3C3C3C37F7F7FC3C3C3FFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
                    C3C3C3C3C3C3C3C37F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFA858FFA858
                    FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858C3C3C3C3C3
                    C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
                    C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3800000
                    FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000C3C3C3C3C3C3C3C3
                    C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FC3C3C3FFFFFFFFFFFFC3C3C3C3C3C3C3
                    C3C3FFFFFF7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                    800000FFA858FFA858FFA858FFA858FFA858800000C3C3C3C3C3C3C3C3C3C3C3
                    C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7FC3C3C3FFFFFFFFFFFF7F
                    7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                    C3C3C3FFA858800000800000800000FFA858C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                    C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7F7F7F7FC3
                    C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3}
                  NumGlyphs = 2
                  ParentFont = False
                  OnClick = sbnProcurarICMSClick
                end
                object flkICMS: TtecDBFindLookup
                  Left = 2
                  Top = 10
                  Width = 30
                  Height = 21
                  Alignment = taLeftJustify
                  Constraints.MaxHeight = 21
                  DataField = 'icms'
                  DataSource = dtmCadastroProdutos.dsrCaracteristicas
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  MaxLength = 4
                  Maximo = 0
                  Minimo = 37353
                  Adicional = 0
                  Opcional = True
                  ParentFont = False
                  TabOrder = 0
                  PermitirZero = False
                  PermitirNulo = False
                  Operacao = opATRIBUICAO
                  LookupField = 'codigo'
                  LookupSource = dtmCadastroProdutos.dsrProcuraICMS
                  LookupQueryParameter = 'codigo'
                  Parameter = ' '
                  ActiveSetControls = False
                  DenyInsert = True
                  NoSetControls = <>
                  SetControls = <>
                  LookupParameter = 'codigo'
                end
                object dtxICMS: TtecDBText
                  Left = 58
                  Top = 10
                  Width = 399
                  Height = 21
                  TabStop = False
                  Color = clBtnFace
                  Constraints.MaxHeight = 21
                  DataField = 'descricao'
                  DataSource = dtmCadastroProdutos.dsrProcuraICMS
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
                object gbxAliqICMS: TGroupBox
                  Left = 460
                  Top = 0
                  Width = 46
                  Height = 35
                  Caption = '% ICMS'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -9
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 2
                  object dtxAliquotaICMS: TtecDBText
                    Left = 2
                    Top = 10
                    Width = 40
                    Height = 21
                    TabStop = False
                    Color = clBtnFace
                    Constraints.MaxHeight = 21
                    DataField = 'aliquota'
                    DataSource = dtmCadastroProdutos.dsrProcuraICMS
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
              end
              object gbxICMSBCST: TGroupBox
                Left = 0
                Top = 135
                Width = 506
                Height = 33
                Align = alTop
                Caption = 'ICMS - MODALIDADE BASE DE C'#193'LCULO NA SUBSTITUI'#199#195'O TRIBUT'#193'RIA'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 4
                inline fraConsultaBCICMSST: TfraConsultaCodigo
                  Left = 2
                  Top = 10
                  Width = 415
                  Height = 21
                  HorzScrollBar.Range = 398
                  HorzScrollBar.Visible = False
                  VertScrollBar.Range = 23
                  VertScrollBar.Visible = False
                  AutoScroll = False
                  Constraints.MaxHeight = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                  inherited sbnProcura: TSpeedButton
                    Left = 32
                    Height = 21
                    Constraints.MaxHeight = 21
                  end
                  inherited dtxDescricao: TtecDBText
                    Left = 56
                    Width = 355
                    Height = 21
                    Constraints.MaxHeight = 21
                    DataField = 'descricao'
                    DataSource = fraConsultaBCICMSST.dsrProcuraModalidadeBCICMSST
                  end
                  inherited edfCodigo: TtecDBFindLookup
                    Width = 30
                    Height = 21
                    Constraints.MaxHeight = 21
                    DataField = 'icmsmodsubst'
                    MaxLength = 1
                    PermitirZero = True
                    LookupField = 'codigo'
                    LookupSource = fraConsultaBCICMSST.dsrProcuraModalidadeBCICMSST
                    LookupQueryParameter = 'codigo'
                    Parameter = ' '
                    ActiveSetControls = False
                    DenyInsert = True
                    NoSetControls = <>
                    SetControls = <>
                    LookupParameter = 'codigo'
                  end
                  inherited qryProcuraModalidadeBCICMSST: TtecQuery
                    inherited qryProcuraModalidadeBCICMSSTcodigo: TIntegerField
                      DisplayFormat = '0'
                    end
                  end
                end
                object gbxReducaoBaseST: TGroupBox
                  Left = 416
                  Top = 0
                  Width = 90
                  Height = 33
                  Caption = 'RED. BASE ST %'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -9
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 1
                  object Label1: TLabel
                    Left = 74
                    Top = 13
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
                  object edtReducaoBaseST: TDBEditNumero
                    Left = 2
                    Top = 10
                    Width = 69
                    Height = 21
                    Constraints.MaxHeight = 21
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -12
                    Font.Name = 'helvetica'
                    Font.Pitch = fpVariable
                    Font.Style = []
                    MaxLength = -1
                    ParentFont = False
                    TabOrder = 0
                    Text = 'edtReducaoBaseST'
                    Mascara = True
                    Alignment = taLeftJustify
                    TipoMascara = tmGERAL
                    NrDecimal = 2
                    Decimais = True
                    Negativo = False
                    Tamanho = 3
                    DataField = 'predbcst'
                    DataSource = dtmCadastroProdutos.dsrCaracteristicas
                  end
                end
              end
              object gbxOrigem: TGroupBox
                Left = 0
                Top = 168
                Width = 506
                Height = 35
                Align = alTop
                Caption = ' ORIGEM '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 5
                object sbnProcurarOrigem: TSpeedButton
                  Left = 33
                  Top = 10
                  Width = 23
                  Height = 22
                  Hint = 'Procurar Origem'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  Glyph.Data = {
                    36060000424D3606000000000000360000002800000020000000100000000100
                    18000000000000060000120B0000120B00000000000000000000C3C3C3C3C3C3
                    C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                    C3C3C3C3800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                    C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7FFFFFFFC3C3C3C3C3C3
                    C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                    C3800000800000800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                    C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3
                    C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C38000
                    00800000800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                    C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3
                    C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C38000008000
                    00800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                    C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3
                    C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C38000008000008000
                    00C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFFFFFFFFFF
                    FFFFC3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                    C3C3C3FFA858800000800000800000FFA858C3C3C30000FF800000800000C3C3
                    C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3
                    C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                    800000FFA858FFA858FFA858FFA858FFA8588000008000000000FFC3C3C3C3C3
                    C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7FC3C3C3C3C3C3C3C3C37F
                    7F7F7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3800000
                    FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000C3C3C3C3C3C3C3C3
                    C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
                    C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFA858FFA858
                    FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858C3C3C3C3C3
                    C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                    C3C3C3C3C37F7F7FC3C3C3FFFFFFC3C3C3C3C3C3C3C3C3C3C3C3800000FFA858
                    FFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFA858800000C3C3C3C3C3
                    C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                    C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3800000FFA858
                    FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000C3C3C3C3C3
                    C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                    C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3800000FFA858
                    FFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFA858800000C3C3C3C3C3
                    C3C3C3C3C3C3C3C3C3C37F7F7FC3C3C3FFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
                    C3C3C3C3C3C3C3C37F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFA858FFA858
                    FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858C3C3C3C3C3
                    C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
                    C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3800000
                    FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000C3C3C3C3C3C3C3C3
                    C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FC3C3C3FFFFFFFFFFFFC3C3C3C3C3C3C3
                    C3C3FFFFFF7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                    800000FFA858FFA858FFA858FFA858FFA858800000C3C3C3C3C3C3C3C3C3C3C3
                    C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7FC3C3C3FFFFFFFFFFFF7F
                    7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                    C3C3C3FFA858800000800000800000FFA858C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                    C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7F7F7F7FC3
                    C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3}
                  NumGlyphs = 2
                  ParentFont = False
                  OnClick = sbnProcurarOrigemClick
                end
                object dtxOrigem: TtecDBText
                  Left = 57
                  Top = 9
                  Width = 445
                  Height = 23
                  TabStop = False
                  Color = clBtnFace
                  DataField = 'descricao'
                  DataSource = dtmCadastroProdutos.dsrProcuraOrigens
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
                object flkOrigem: TtecDBFindLookup
                  Left = 2
                  Top = 9
                  Width = 30
                  Height = 23
                  Alignment = taLeftJustify
                  Constraints.MaxHeight = 23
                  DataField = 'origem'
                  DataSource = dtmCadastroProdutos.dsrCaracteristicas
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  MaxLength = 1
                  Maximo = 8
                  Minimo = 37353
                  Adicional = 0
                  Opcional = True
                  ParentFont = False
                  TabOrder = 1
                  PermitirZero = True
                  PermitirNulo = False
                  Operacao = opATRIBUICAO
                  LookupField = 'codigo'
                  LookupSource = dtmCadastroProdutos.dsrProcuraOrigens
                  LookupQueryParameter = 'codigo'
                  Parameter = ' '
                  ActiveSetControls = False
                  DenyInsert = True
                  NoSetControls = <>
                  SetControls = <>
                  LookupParameter = 'codigo'
                end
              end
              object gbxAnvisa: TGroupBox
                Left = 1
                Top = 202
                Width = 208
                Height = 37
                Caption = 'N'#176' ANVISA'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 6
                object edtAnvisa: TDBEditTexto
                  Left = 2
                  Top = 10
                  Width = 202
                  Height = 23
                  DataField = 'anvisa'
                  DataSource = dtmCadastroProdutos.dsrCaracteristicas
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  MaxLength = -1
                  ParentFont = False
                  TabOrder = 0
                  CharCasenoDefault = False
                  Alignment = taLeftJustify
                end
              end
            end
            object ckbProducaoPropria: TDBCheckBox
              Left = 514
              Top = 100
              Width = 185
              Height = 17
              Caption = 'PRODUTO DE PRODU'#199#195'O PR'#211'RIA'
              DataField = 'producaopropria'
              DataSource = dtmCadastroProdutos.dsrCaracteristicas
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 5
              ValueChecked = 'True'
              ValueUnchecked = 'False'
              OnClick = ckbProducaoPropriaClick
            end
            object gbxObsLegal: TGroupBox
              Left = 511
              Top = -1
              Width = 382
              Height = 33
              Caption = 'OBSERVA'#199#195'O LEGAL'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              object sbnProcurarObsLegais: TSpeedButton
                Left = 33
                Top = 10
                Width = 23
                Height = 21
                Hint = 'Procurar Observa'#231#227'o Legal'
                Constraints.MaxHeight = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                Glyph.Data = {
                  36060000424D3606000000000000360000002800000020000000100000000100
                  18000000000000060000120B0000120B00000000000000000000C3C3C3C3C3C3
                  C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                  C3C3C3C3800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                  C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7FFFFFFFC3C3C3C3C3C3
                  C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                  C3800000800000800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                  C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3
                  C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C38000
                  00800000800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                  C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3
                  C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C38000008000
                  00800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                  C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3
                  C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C38000008000008000
                  00C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFFFFFFFFFF
                  FFFFC3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                  C3C3C3FFA858800000800000800000FFA858C3C3C30000FF800000800000C3C3
                  C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3
                  C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                  800000FFA858FFA858FFA858FFA858FFA8588000008000000000FFC3C3C3C3C3
                  C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7FC3C3C3C3C3C3C3C3C37F
                  7F7F7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3800000
                  FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000C3C3C3C3C3C3C3C3
                  C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
                  C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFA858FFA858
                  FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858C3C3C3C3C3
                  C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                  C3C3C3C3C37F7F7FC3C3C3FFFFFFC3C3C3C3C3C3C3C3C3C3C3C3800000FFA858
                  FFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFA858800000C3C3C3C3C3
                  C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                  C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3800000FFA858
                  FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000C3C3C3C3C3
                  C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                  C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3800000FFA858
                  FFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFA858800000C3C3C3C3C3
                  C3C3C3C3C3C3C3C3C3C37F7F7FC3C3C3FFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
                  C3C3C3C3C3C3C3C37F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFA858FFA858
                  FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858C3C3C3C3C3
                  C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
                  C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3800000
                  FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000C3C3C3C3C3C3C3C3
                  C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FC3C3C3FFFFFFFFFFFFC3C3C3C3C3C3C3
                  C3C3FFFFFF7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                  800000FFA858FFA858FFA858FFA858FFA858800000C3C3C3C3C3C3C3C3C3C3C3
                  C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7FC3C3C3FFFFFFFFFFFF7F
                  7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                  C3C3C3FFA858800000800000800000FFA858C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                  C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7F7F7F7FC3
                  C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3}
                NumGlyphs = 2
                ParentFont = False
                OnClick = sbnProcurarObsLegaisClick
              end
              object dtxObsLegais: TtecDBText
                Left = 54
                Top = 10
                Width = 323
                Height = 21
                TabStop = False
                Color = clBtnFace
                Constraints.MaxHeight = 21
                DataField = 'descricao'
                DataSource = dtmCadastroProdutos.dsrProcuraObsLegais
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
              object flkObsLegal: TtecDBFindLookup
                Left = 2
                Top = 10
                Width = 30
                Height = 21
                Alignment = taLeftJustify
                Constraints.MaxHeight = 21
                DataField = 'obslegal'
                DataSource = dtmCadastroProdutos.dsrCaracteristicas
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                MaxLength = 4
                Maximo = 0
                Minimo = 37353
                Adicional = 0
                Opcional = True
                ParentFont = False
                TabOrder = 1
                PermitirZero = False
                PermitirNulo = False
                Operacao = opATRIBUICAO
                LookupField = 'codigo'
                LookupSource = dtmCadastroProdutos.dsrProcuraObsLegais
                LookupQueryParameter = 'codigo'
                Parameter = ' '
                ActiveSetControls = False
                DenyInsert = True
                NoSetControls = <>
                SetControls = <>
                LookupParameter = 'codigo'
              end
            end
            object gbxAliquotaIPI: TGroupBox
              Left = 511
              Top = 31
              Width = 474
              Height = 33
              Caption = 'IPI - NCM - NOMENCLATURA COMUM DO MERCOSUL'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 3
              object sbnProcurarIPI: TSpeedButton
                Left = 32
                Top = 10
                Width = 23
                Height = 21
                Hint = 'Procurar IPI'
                Constraints.MaxHeight = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                Glyph.Data = {
                  36060000424D3606000000000000360000002800000020000000100000000100
                  18000000000000060000120B0000120B00000000000000000000C3C3C3C3C3C3
                  C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                  C3C3C3C3800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                  C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7FFFFFFFC3C3C3C3C3C3
                  C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                  C3800000800000800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                  C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3
                  C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C38000
                  00800000800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                  C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3
                  C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C38000008000
                  00800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                  C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3
                  C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C38000008000008000
                  00C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFFFFFFFFFF
                  FFFFC3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                  C3C3C3FFA858800000800000800000FFA858C3C3C30000FF800000800000C3C3
                  C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3
                  C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                  800000FFA858FFA858FFA858FFA858FFA8588000008000000000FFC3C3C3C3C3
                  C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7FC3C3C3C3C3C3C3C3C37F
                  7F7F7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3800000
                  FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000C3C3C3C3C3C3C3C3
                  C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
                  C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFA858FFA858
                  FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858C3C3C3C3C3
                  C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                  C3C3C3C3C37F7F7FC3C3C3FFFFFFC3C3C3C3C3C3C3C3C3C3C3C3800000FFA858
                  FFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFA858800000C3C3C3C3C3
                  C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                  C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3800000FFA858
                  FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000C3C3C3C3C3
                  C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                  C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3800000FFA858
                  FFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFA858800000C3C3C3C3C3
                  C3C3C3C3C3C3C3C3C3C37F7F7FC3C3C3FFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
                  C3C3C3C3C3C3C3C37F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFA858FFA858
                  FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858C3C3C3C3C3
                  C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
                  C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3800000
                  FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000C3C3C3C3C3C3C3C3
                  C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FC3C3C3FFFFFFFFFFFFC3C3C3C3C3C3C3
                  C3C3FFFFFF7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                  800000FFA858FFA858FFA858FFA858FFA858800000C3C3C3C3C3C3C3C3C3C3C3
                  C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7FC3C3C3FFFFFFFFFFFF7F
                  7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                  C3C3C3FFA858800000800000800000FFA858C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                  C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7F7F7F7FC3
                  C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3}
                NumGlyphs = 2
                ParentFont = False
                OnClick = sbnProcurarIPIClick
              end
              object dtxClassificacaoFiscal: TtecDBText
                Left = 387
                Top = 10
                Width = 83
                Height = 21
                Hint = 'Classifica'#231#227'o Fiscal'
                TabStop = False
                Color = clBtnFace
                Constraints.MaxHeight = 21
                DataField = 'classificacaofiscal'
                DataSource = dtmCadastroProdutos.dsrProcuraIPI
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
              object dtxIPI: TtecDBText
                Left = 56
                Top = 10
                Width = 329
                Height = 21
                TabStop = False
                Color = clBtnFace
                Constraints.MaxHeight = 21
                DataField = 'descricao'
                DataSource = dtmCadastroProdutos.dsrProcuraIPI
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
              object flkIPI: TtecDBFindLookup
                Left = 2
                Top = 10
                Width = 30
                Height = 21
                Alignment = taLeftJustify
                Constraints.MaxHeight = 21
                DataField = 'ipi'
                DataSource = dtmCadastroProdutos.dsrCaracteristicas
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                MaxLength = 4
                Maximo = 0
                Minimo = 37353
                Adicional = 0
                Opcional = True
                ParentFont = False
                TabOrder = 2
                PermitirZero = False
                PermitirNulo = False
                Operacao = opATRIBUICAO
                LookupField = 'codigo'
                LookupSource = dtmCadastroProdutos.dsrProcuraIPI
                LookupQueryParameter = 'codigo'
                Parameter = ' '
                ActiveSetControls = False
                DenyInsert = True
                NoSetControls = <>
                SetControls = <>
                LookupParameter = 'codigo'
              end
            end
            object gbxIPICST: TGroupBox
              Left = 511
              Top = 63
              Width = 474
              Height = 35
              Caption = 'IPI - C'#211'D. SITUA'#199#195'O TRIBUT'#193'RIA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 4
              inline fraConsultaIPICST: TfraConsultaCodigo
                Left = 3
                Top = 10
                Width = 422
                Height = 23
                HorzScrollBar.Range = 354
                HorzScrollBar.Visible = False
                VertScrollBar.Range = 23
                VertScrollBar.Visible = False
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
                  Left = 32
                  Height = 21
                  Constraints.MaxHeight = 21
                end
                inherited dtxDescricao: TtecDBText
                  Left = 56
                  Width = 367
                  Height = 21
                  Constraints.MaxHeight = 21
                  DataField = 'descricao'
                  DataSource = fraConsultaIPICST.dsrProcuratributosipi
                end
                inherited edfCodigo: TtecDBFindLookup
                  Width = 30
                  Height = 21
                  Constraints.MaxHeight = 21
                  DataField = 'ipicst'
                  MaxLength = 2
                  LookupField = 'codigo'
                  LookupSource = fraConsultaIPICST.dsrProcuratributosipi
                  LookupQueryParameter = 'codigo'
                  Parameter = ' '
                  ActiveSetControls = False
                  DenyInsert = False
                  NoSetControls = <>
                  SetControls = <>
                  LookupParameter = 'codigo'
                end
              end
              object gbxAliqIPI: TGroupBox
                Left = 428
                Top = 0
                Width = 45
                Height = 35
                Caption = '% IPI'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 1
                object dtxAliquotaIPI: TtecDBText
                  Left = 2
                  Top = 11
                  Width = 40
                  Height = 21
                  TabStop = False
                  Color = clBtnFace
                  Constraints.MaxHeight = 21
                  DataField = 'aliquota'
                  DataSource = dtmCadastroProdutos.dsrProcuraIPI
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
            end
            object ckbSubstituicaoIPI: TDBCheckBox
              Left = 706
              Top = 100
              Width = 111
              Height = 18
              Caption = 'SUBSTITUI'#199#195'O IPI'
              DataField = 'substituicaoipi'
              DataSource = dtmCadastroProdutos.dsrCaracteristicas
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 6
              ValueChecked = 'True'
              ValueUnchecked = 'False'
            end
            object gbxCOFINSCST: TGroupBox
              Left = 511
              Top = 121
              Width = 474
              Height = 34
              Caption = 'COFINS - C'#211'D. SITUA'#199#195'O TRIBUT'#193'RIA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 8
              inline fraConsultaCOFINSCST: TfraConsultaCodigo
                Left = 3
                Top = 10
                Width = 425
                Height = 21
                HorzScrollBar.Range = 354
                HorzScrollBar.Visible = False
                VertScrollBar.Range = 23
                VertScrollBar.Visible = False
                AutoScroll = False
                Constraints.MaxHeight = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                inherited sbnProcura: TSpeedButton
                  Left = 32
                  Height = 21
                  Constraints.MaxHeight = 21
                end
                inherited dtxDescricao: TtecDBText
                  Left = 56
                  Width = 369
                  Height = 21
                  Constraints.MaxHeight = 21
                  DataField = 'descricao'
                  DataSource = fraConsultaCOFINSCST.dsrProcuratributoscofins
                end
                inherited edfCodigo: TtecDBFindLookup
                  Width = 30
                  Height = 21
                  Constraints.MaxHeight = 21
                  DataField = 'cofinscst'
                  MaxLength = 2
                  LookupField = 'codigo'
                  LookupSource = fraConsultaCOFINSCST.dsrProcuratributoscofins
                  LookupQueryParameter = 'codigo'
                  Parameter = ' '
                  ActiveSetControls = False
                  DenyInsert = False
                  NoSetControls = <>
                  SetControls = <>
                  LookupParameter = 'codigo'
                end
              end
              object gbxCofinsAliquota: TGroupBox
                Left = 429
                Top = 0
                Width = 45
                Height = 36
                Caption = 'COFINS'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 1
                object edtAliquotaCofins: TDBEditNumero
                  Left = 2
                  Top = 10
                  Width = 42
                  Height = 21
                  Constraints.MaxHeight = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  MaxLength = -1
                  ParentFont = False
                  TabOrder = 0
                  Text = 'edtAliquotaCofins'
                  Mascara = True
                  Alignment = taLeftJustify
                  TipoMascara = tmGERAL
                  NrDecimal = 2
                  Decimais = True
                  Negativo = False
                  Tamanho = 2
                  DataField = 'aliquotacofins'
                  DataSource = dtmCadastroProdutos.dsrCaracteristicas
                end
              end
            end
            object gbxSubConta: TGroupBox
              Left = 896
              Top = -1
              Width = 90
              Height = 33
              Caption = 'SUB-CONTA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              object edtSubConta: TDBEditNumero
                Left = 2
                Top = 10
                Width = 84
                Height = 21
                Constraints.MaxHeight = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                MaxLength = -1
                ParentFont = False
                TabOrder = 0
                Text = 'edtSubConta'
                Mascara = True
                Alignment = taLeftJustify
                TipoMascara = tmGERAL
                NrDecimal = 2
                Decimais = False
                Negativo = False
                Tamanho = 6
                DataField = 'subconta'
                DataSource = dtmCadastroProdutos.dsrCaracteristicas
              end
            end
            object gbxefd_t53: TGroupBox
              Left = 512
              Top = 188
              Width = 473
              Height = 33
              Caption = 'EFD - T53'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 10
              inline fraConsultaefd_t53: TfraConsultaCodigoContabil
                Left = 3
                Top = 9
                Width = 466
                Height = 21
                HorzScrollBar.Range = 354
                HorzScrollBar.Visible = False
                VertScrollBar.Range = 23
                VertScrollBar.Visible = False
                AutoScroll = False
                Constraints.MaxHeight = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                inherited sbnProcura: TSpeedButton
                  Left = 107
                  Top = -1
                  Height = 21
                  Constraints.MaxHeight = 21
                end
                inherited dtxDescricao: TtecDBText
                  Left = 129
                  Top = -1
                  Width = 337
                  Height = 21
                  Constraints.MaxHeight = 21
                  DataField = 'descricao'
                  DataSource = fraConsultaefd_t53.dsrProcuraefd_t53
                end
                inherited edfCodigo: TtecDBFindLookup
                  Width = 105
                  Height = 21
                  Constraints.MaxHeight = 21
                  DataField = 'codigo_efd_t53'
                  MaxLength = 10
                  LookupField = 'codigo'
                  LookupSource = fraConsultaefd_t53.dsrProcuraefd_t53
                  LookupQueryParameter = 'codigo'
                  Parameter = ' '
                  ActiveSetControls = False
                  DenyInsert = False
                  NoSetControls = <>
                  SetControls = <>
                  LookupParameter = 'codigo'
                end
                inherited qryProcuraefd_t53: TtecQuery
                  inherited qryProcuraefd_t53validodesde: TDateField
                    Alignment = taCenter
                    EditMask = '99/99/9999;1; '
                  end
                  inherited qryProcuraefd_t53validoate: TDateField
                    Alignment = taCenter
                    EditMask = '99/99/9999;1; '
                  end
                end
              end
            end
            object gbxCest: TGroupBox
              Left = 823
              Top = 95
              Width = 120
              Height = 33
              Caption = 'CEST'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 7
              object edtCest: TDBEditTexto
                Left = 3
                Top = 10
                Width = 111
                Height = 21
                Constraints.MaxHeight = 21
                DataField = 'cest'
                DataSource = dtmCadastroProdutos.dsrCaracteristicas
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                MaxLength = -1
                ParentFont = False
                TabOrder = 0
                OnKeyDown = edtDescricaonanfKeyDown
                CharCasenoDefault = False
                Alignment = taLeftJustify
              end
            end
            object gbxPISCST: TGroupBox
              Left = 511
              Top = 154
              Width = 474
              Height = 35
              Caption = 'PIS - C'#211'D. SITUA'#199#195'O TRIBUT'#193'RIA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 9
              inline fraConsultaPISCST: TfraConsultaCodigo
                Left = 3
                Top = 11
                Width = 424
                Height = 21
                HorzScrollBar.Range = 354
                HorzScrollBar.Visible = False
                VertScrollBar.Range = 23
                VertScrollBar.Visible = False
                AutoScroll = False
                Constraints.MaxHeight = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                inherited sbnProcura: TSpeedButton
                  Left = 32
                  Height = 21
                  Constraints.MaxHeight = 21
                end
                inherited dtxDescricao: TtecDBText
                  Left = 56
                  Width = 369
                  Height = 21
                  Constraints.MaxHeight = 21
                  DataField = 'descricao'
                  DataSource = fraConsultaPISCST.dsrProcuratributospis
                end
                inherited edfCodigo: TtecDBFindLookup
                  Width = 30
                  Height = 21
                  Constraints.MaxHeight = 21
                  DataField = 'piscst'
                  MaxLength = 2
                  LookupField = 'codigo'
                  LookupSource = fraConsultaPISCST.dsrProcuratributospis
                  LookupQueryParameter = 'codigo'
                  Parameter = ' '
                  ActiveSetControls = False
                  DenyInsert = False
                  NoSetControls = <>
                  SetControls = <>
                  LookupParameter = 'codigo'
                end
              end
              object gbxPisAliquota: TGroupBox
                Left = 429
                Top = 0
                Width = 45
                Height = 35
                Caption = '% PIS'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 1
                object edtAliquotaPIS: TDBEditNumero
                  Left = 2
                  Top = 10
                  Width = 42
                  Height = 21
                  Constraints.MaxHeight = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  MaxLength = -1
                  ParentFont = False
                  TabOrder = 0
                  Text = 'edtAliquotaPIS'
                  Mascara = True
                  Alignment = taLeftJustify
                  TipoMascara = tmGERAL
                  NrDecimal = 2
                  Decimais = True
                  Negativo = False
                  Tamanho = 2
                  DataField = 'aliquotapis'
                  DataSource = dtmCadastroProdutos.dsrCaracteristicas
                end
              end
            end
          end
          object tstFCP: TTabSheet
            Caption = 'FCP - Fundo de Comabate a Pobreza'
            ImageIndex = 1
            object dbgEstadosProdutos: TtecDBGrid
              Left = 0
              Top = 0
              Width = 273
              Height = 239
              Align = alLeft
              DataSource = dtmCadastroProdutos.dsrEstadosProdutos
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clBlack
              TitleFont.Height = -9
              TitleFont.Name = 'helvetica'
              TitleFont.Pitch = fpVariable
              TitleFont.Style = []
              RowWrap = 60
              Large = False
              DoubleRowColor = False
              TitleMinHeight = 100
              CellHeights = 100
              StrippedColor = 16054260
              CanDelete = False
              CanNotInsertFromGrid = False
              PostOnEnter = False
              PostOnSetUpDown = False
              DenySort = False
              DefaultRowHeight = 19
              ExibirNumerodaLinha = False
              NaoAtribuirDadosaTabelaaoDigitar = False
              Columns = <
                item
                  Expanded = False
                  FieldName = 'estado'
                  ReadOnly = True
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'percfcp'
                  ReadOnly = True
                  Title.Alignment = taCenter
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'indsuperfluo'
                  Visible = True
                end>
            end
          end
        end
      end
      object tstGrades: TTabSheet
        Caption = ' &3 - Grades'
        ImageIndex = 6
        object gbxGrade: TGroupBox
          Left = 0
          Top = 0
          Width = 1003
          Height = 270
          Align = alClient
          TabOrder = 0
          object sbnInverterLinhaColuna: TSpeedButton
            Left = 600
            Top = 16
            Width = 97
            Height = 29
            Caption = 'Inverter'
            Glyph.Data = {
              16070000424D160700000000000036000000280000001A000000160000000100
              180000000000E0060000C40E0000C40E00000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB3
              B3B3E9E8E8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFCFCFC000000111010FFFFFFFFFFFFD7D7D7A4A3
              A33536360B0B0B0000000000000000000D0D0D343434B0AFAFE0E0E0FFFFFFFF
              FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFDFDFDFFFFFFFFFFFFFFFFFF76767600
              00000000008C8C8C717171000000000000000000000000000000000000000000
              0000000000000000000000008F8F8FF8F8F8FFFFFFFFFFFF0000FFFFFFFFFFFF
              FCFCFCFFFFFFFFFFFFD6D6D60909090000000100000000000000000000000000
              000000000000000000002121213131314949495353533838382525250000004B
              4B4BEBEBEBFFFFFF0000FFFFFFFFFFFFFDFDFDFFFFFFFFFFFF35353500000002
              0000030101020000010000000000000000212121686868959595D4D4D4E7E7E7
              F5F5F5FAFAFAEEEEEEE2E2E28282820000003B3B3BFFFFFF0000FFFFFFFFFFFF
              FDFDFDFFFFFF9494940000000200000301010301010100000000002A2A2A8282
              82D5D5D5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBD
              BDBD000000D7D7D70000FFFFFFFFFFFFFEFEFEC6C6C600000000000002000003
              0101030101000000454646E7E7E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7272726162620000FFFFFFFFFFFF
              FFFFFFA7A4A40000000000000000000000000000000000005B5C5CFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFF0504040000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB0B0B07C7C7C1C
              1B1B000000000000000000A6A8A8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3536360000929191FFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3D1D10A0A0A898585FFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFF5D5A5A0000595B5BFFFFFFFFFFFFFBFBFBFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDEDED000000000000848484E2E2E2
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3D5D50000000000FFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFCACACA0101010000000000000000000000003436366666669F9F9FF5
              F5F5FFFFFFFFFFFF00001F1F1FE9E7E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF454545000000010000
              000000000000000000000000000000E1E0E0FFFFFFFFFFFF0000828383232424
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFEEEEEE8282820D0F0F000000030101030101030000010000000000AEAEAEFF
              FFFFFFFFFFFFFFFF0000EDEDED000000797979FBFBFBFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFAFBFBD4D4D49191913E3E3E000000000000020000030101
              030101010000000000757575FFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFF818080
              000000444444A1A1A1D1D1D1DFE0E0D6D6D6B7B6B68D8D8D5D5E5E1F1F1F0000
              00000000000000000000000000020000020000000000333333FFFFFFFFFFFFFF
              FFFFFFFFFFFEFEFE0000FFFFFFFFFFFF8C8C8C0707070000001515152A2B2B23
              23230E0D0D000000000000000000000000000000000000000000131313000000
              0000000A0A0ADBDBDBFFFFFFFDFDFDFFFFFFFFFFFFFCFCFC0000FFFFFFFFFFFF
              FFFFFFDDDDDD8484840000000000000000000000000000000000000000000000
              00161717888989B4B3B3D1D0D0000000000000A9A9A9FFFFFFFFFFFFFBFBFBFF
              FFFFFFFFFFFDFDFD0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE6E6E6CACACA96
              96967979796B6B6B808080A2A2A2CBCBCBEBEBEBFFFFFFFFFFFFFFFFFF000000
              404242FFFFFFFFFFFFFEFEFEFDFDFDFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFF9C9C9CFFFFFFFFFFFFFFFFFFFCFCFCFFFFFFFF
              FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000}
            OnClick = sbnInverterLinhaColunaClick
          end
          object pnlGradeProduto: TPanel
            Left = 2
            Top = 86
            Width = 999
            Height = 182
            Align = alBottom
            TabOrder = 0
            Visible = False
            object dbgGrades: TtecDBGrid
              Left = 1
              Top = 1
              Width = 997
              Height = 180
              Align = alClient
              DataSource = dtmCadastroProdutos.dsrGrade
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs]
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clBlack
              TitleFont.Height = -12
              TitleFont.Name = 'helvetica'
              TitleFont.Pitch = fpVariable
              TitleFont.Style = []
              OnDrawColumnCell = dbgGradesDrawColumnCell
              OnDblClick = dbgGradesDblClick
              OnKeyDown = dbgGradesKeyDown
              FixedCols = 1
              RowWrap = 62
              Large = True
              DoubleRowColor = True
              TitleMinHeight = 50
              CellHeights = 320
              StrippedColor = 16054260
              CanDelete = False
              CanNotInsertFromGrid = False
              PostOnEnter = False
              PostOnSetUpDown = False
              DenySort = False
              DefaultRowHeight = 60
              ExibirNumerodaLinha = False
              NaoAtribuirDadosaTabelaaoDigitar = False
            end
          end
          object gbxLinhaGrade: TGroupBox
            Left = 10
            Top = 10
            Width = 290
            Height = 36
            Caption = 'LINHA DA GRADE'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            object sbnProcuraLinhaGrade: TSpeedButton
              Left = 44
              Top = 10
              Width = 23
              Height = 23
              Hint = 'Procurar Linha da Grade'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              Glyph.Data = {
                36060000424D3606000000000000360000002800000020000000100000000100
                18000000000000060000120B0000120B00000000000000000000C3C3C3C3C3C3
                C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3C3800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7FFFFFFFC3C3C3C3C3C3
                C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                C3800000800000800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3
                C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C38000
                00800000800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3
                C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C38000008000
                00800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C38000008000008000
                00C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFFFFFFFFFF
                FFFFC3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3FFA858800000800000800000FFA858C3C3C30000FF800000800000C3C3
                C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3
                C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                800000FFA858FFA858FFA858FFA858FFA8588000008000000000FFC3C3C3C3C3
                C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7FC3C3C3C3C3C3C3C3C37F
                7F7F7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3800000
                FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000C3C3C3C3C3C3C3C3
                C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFA858FFA858
                FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858C3C3C3C3C3
                C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3C3C37F7F7FC3C3C3FFFFFFC3C3C3C3C3C3C3C3C3C3C3C3800000FFA858
                FFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFA858800000C3C3C3C3C3
                C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3800000FFA858
                FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000C3C3C3C3C3
                C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3800000FFA858
                FFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFA858800000C3C3C3C3C3
                C3C3C3C3C3C3C3C3C3C37F7F7FC3C3C3FFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3C3C3C3C3C37F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFA858FFA858
                FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858C3C3C3C3C3
                C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3800000
                FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000C3C3C3C3C3C3C3C3
                C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FC3C3C3FFFFFFFFFFFFC3C3C3C3C3C3C3
                C3C3FFFFFF7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                800000FFA858FFA858FFA858FFA858FFA858800000C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7FC3C3C3FFFFFFFFFFFF7F
                7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3FFA858800000800000800000FFA858C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7F7F7F7FC3
                C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3}
              NumGlyphs = 2
              ParentFont = False
              OnClick = sbnProcuraLinhaGradeClick
            end
            object flkLinhaGrade: TtecDBFindLookup
              Left = 2
              Top = 10
              Width = 40
              Height = 23
              Alignment = taLeftJustify
              DataField = 'grade1'
              DataSource = dtmCadastroProdutos.dsrCaracteristicas
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              MaxLength = 4
              Maximo = 0
              Minimo = 37353
              Adicional = 0
              Opcional = True
              OnFound = flkLinhaGradeFound
              OnMessage = flkLinhaGradeMessage
              ParentFont = False
              TabOrder = 0
              PermitirZero = False
              PermitirNulo = False
              Operacao = opATRIBUICAO
              LookupField = 'codigo'
              LookupSource = dtmCadastroProdutos.dsrProcuraLinhaGrade
              LookupQueryParameter = 'codigo'
              Parameter = ' '
              ActiveSetControls = False
              DenyInsert = True
              NoSetControls = <>
              SetControls = <>
              LookupParameter = 'codigo'
            end
            object dtxLinhaGrade: TtecDBText
              Left = 68
              Top = 10
              Width = 219
              Height = 23
              TabStop = False
              Color = clBtnFace
              DataField = 'descricao'
              DataSource = dtmCadastroProdutos.dsrProcuraLinhaGrade
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
          object gbxColunaGrade: TGroupBox
            Left = 310
            Top = 10
            Width = 290
            Height = 36
            Caption = 'COLUNA DA GRADE'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            object sbnProcuraColunaGrade: TSpeedButton
              Left = 44
              Top = 10
              Width = 23
              Height = 23
              Hint = 'Procurar Coluna da Grade'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              Glyph.Data = {
                36060000424D3606000000000000360000002800000020000000100000000100
                18000000000000060000120B0000120B00000000000000000000C3C3C3C3C3C3
                C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3C3800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7FFFFFFFC3C3C3C3C3C3
                C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                C3800000800000800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3
                C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C38000
                00800000800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3
                C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C38000008000
                00800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C38000008000008000
                00C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFFFFFFFFFF
                FFFFC3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3FFA858800000800000800000FFA858C3C3C30000FF800000800000C3C3
                C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3
                C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                800000FFA858FFA858FFA858FFA858FFA8588000008000000000FFC3C3C3C3C3
                C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7FC3C3C3C3C3C3C3C3C37F
                7F7F7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3800000
                FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000C3C3C3C3C3C3C3C3
                C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFA858FFA858
                FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858C3C3C3C3C3
                C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3C3C37F7F7FC3C3C3FFFFFFC3C3C3C3C3C3C3C3C3C3C3C3800000FFA858
                FFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFA858800000C3C3C3C3C3
                C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3800000FFA858
                FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000C3C3C3C3C3
                C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3800000FFA858
                FFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFA858800000C3C3C3C3C3
                C3C3C3C3C3C3C3C3C3C37F7F7FC3C3C3FFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3C3C3C3C3C37F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFA858FFA858
                FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858C3C3C3C3C3
                C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3800000
                FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000C3C3C3C3C3C3C3C3
                C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FC3C3C3FFFFFFFFFFFFC3C3C3C3C3C3C3
                C3C3FFFFFF7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                800000FFA858FFA858FFA858FFA858FFA858800000C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7FC3C3C3FFFFFFFFFFFF7F
                7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3FFA858800000800000800000FFA858C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7F7F7F7FC3
                C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3}
              NumGlyphs = 2
              ParentFont = False
              OnClick = sbnProcuraColunaGradeClick
            end
            object flkColunaGrade: TtecDBFindLookup
              Left = 2
              Top = 10
              Width = 40
              Height = 23
              Alignment = taLeftJustify
              CharCase = ecUpperCase
              DataField = 'grade2'
              DataSource = dtmCadastroProdutos.dsrCaracteristicas
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              MaxLength = 4
              Maximo = 0
              Minimo = 37353
              Adicional = 0
              Opcional = True
              OnFound = flkColunaGradeFound
              OnMessage = flkColunaGradeMessage
              ParentFont = False
              TabOrder = 0
              PermitirZero = False
              PermitirNulo = False
              Operacao = opATRIBUICAO
              LookupField = 'codigo'
              LookupSource = dtmCadastroProdutos.dsrProcuraColunaGrade
              LookupQueryParameter = 'codigo'
              Parameter = ' '
              ActiveSetControls = False
              DenyInsert = True
              NoSetControls = <>
              SetControls = <>
              LookupParameter = 'codigo'
            end
            object dtxColunaGrade: TtecDBText
              Left = 68
              Top = 10
              Width = 219
              Height = 23
              TabStop = False
              Color = clBtnFace
              DataField = 'descricao'
              DataSource = dtmCadastroProdutos.dsrProcuraColunaGrade
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
          object gbxAgrupamentoGrade: TGroupBox
            Left = 704
            Top = 10
            Width = 137
            Height = 36
            Caption = 'AGRUPAMENTO DA GRADE'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            object dbmAgrupamentoGrade: TDBMaplistCombobox
              Left = 4
              Top = 10
              Width = 123
              Height = 23
              DataField = 'agrupamentograde'
              DataSource = dtmCadastroProdutos.dsrCaracteristicas
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ItemHeight = 15
              Items.Strings = (
                'Linha'
                'Coluna')
              ParentFont = False
              TabOrder = 0
              ItemValues.Strings = (
                'L'
                'C')
            end
          end
        end
      end
      object tstObservacoes: TTabSheet
        Caption = ' &4 - Observa'#231#245'es'
        ImageIndex = 3
        object gbxObservaocoesProdutosGerais: TGroupBox
          Left = 0
          Top = 0
          Width = 1003
          Height = 129
          Align = alTop
          Caption = 'Observa'#231#245'es Gerais'
          TabOrder = 0
          object mmoObservacaoProdutosGerais: TtecDBMemo
            Left = 2
            Top = 18
            Width = 999
            Height = 109
            Align = alClient
            DataField = 'observacao'
            DataSource = dtmCadastroProdutos.dsrCaracteristicas
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
        object gbxObservaocoesProdutosVendas: TGroupBox
          Left = 0
          Top = 129
          Width = 1003
          Height = 141
          Align = alClient
          Caption = 'Observa'#231#245'es Vendas'
          TabOrder = 1
          object mmoObservacaoProdutosVendas: TtecDBMemo
            Left = 2
            Top = 18
            Width = 999
            Height = 121
            Align = alClient
            DataField = 'observacoesvenda'
            DataSource = dtmCadastroProdutos.dsrCaracteristicas
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
      object tstFornecedores: TTabSheet
        Caption = ' &5 - Fornecedores'
        ImageIndex = 5
        object gbxFornecedor: TGroupBox
          Left = 0
          Top = 0
          Width = 1003
          Height = 270
          Align = alClient
          TabOrder = 0
          object sbnIncluirFornecedor: TSpeedButton
            Left = 917
            Top = 28
            Width = 23
            Height = 22
            Hint = 'Incluir Fornecedor'
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
            OnClick = sbnIncluirFornecedorClick
          end
          object sbnExcluirFornecedor: TSpeedButton
            Left = 917
            Top = 50
            Width = 23
            Height = 22
            Hint = 'Excluir Fornecedor'
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
            OnClick = sbnExcluirFornecedorClick
          end
          object dbgFornecedor: TtecDBGrid
            Left = 2
            Top = 18
            Width = 911
            Height = 250
            Align = alLeft
            DataSource = dtmCadastroProdutos.dsrFornecedoresProdutos
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clBlack
            TitleFont.Height = -12
            TitleFont.Name = 'helvetica'
            TitleFont.Pitch = fpVariable
            TitleFont.Style = []
            OnDblClick = dbgFornecedorDblClick
            OnKeyDown = dbgFornecedorKeyDown
            RowWrap = 60
            Large = False
            DoubleRowColor = True
            MsgDelete = 'o FORNECEDOR'
            TitleMinHeight = 100
            CellHeights = 100
            StrippedColor = 16054260
            CanDelete = False
            CanNotInsertFromGrid = False
            PostOnEnter = False
            PostOnSetUpDown = False
            DenySort = False
            DefaultRowHeight = 19
            ExibirNumerodaLinha = False
            NaoAtribuirDadosaTabelaaoDigitar = False
            Columns = <
              item
                Expanded = False
                FieldName = 'fornecedor'
                Title.Alignment = taCenter
                Title.Caption = 'C'#211'DIGO'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'razao'
                Title.Alignment = taCenter
                Title.Caption = 'NOME OU RAZ'#195'O SOCIAL'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 230
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'referencia'
                Title.Alignment = taCenter
                Title.Caption = 'REFER'#202'NCIA'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'data'
                Title.Alignment = taCenter
                Title.Caption = 'DATA'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'preco'
                Title.Alignment = taCenter
                Title.Caption = 'PRE'#199'O'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ipi'
                Title.Alignment = taCenter
                Title.Caption = '% IPI'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 30
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'precocomipi'
                Title.Alignment = taCenter
                Title.Caption = 'PRE'#199'O + IPI'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'dataultimaentrada'
                Title.Alignment = taCenter
                Title.Caption = #218'LTIMA DATA'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'precoultimaentrada'
                Title.Alignment = taCenter
                Title.Caption = 'PRE'#199'O'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ipiultimaentrada'
                Title.Alignment = taCenter
                Title.Caption = '% IPI'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 30
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'precoipiultimaentrada'
                Title.Alignment = taCenter
                Title.Caption = 'PRE'#199'O + IPI'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 70
                Visible = True
              end>
          end
        end
      end
      object tstSimilares: TTabSheet
        Caption = ' &6 - Similares'
        ImageIndex = 4
        object gbxSimilares: TGroupBox
          Left = 0
          Top = 0
          Width = 1003
          Height = 270
          Align = alClient
          TabOrder = 0
          object sbnExcluirSimilar: TSpeedButton
            Left = 764
            Top = 50
            Width = 23
            Height = 22
            Hint = 'Excluir Similar'
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
            OnClick = sbnExcluirSimilarClick
          end
          object sbnIncluirSimilar: TSpeedButton
            Left = 764
            Top = 28
            Width = 23
            Height = 22
            Hint = 'Incluir Similar'
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
            OnClick = sbnIncluirSimilarClick
          end
          object dbgSimilares: TtecDBGrid
            Left = 5
            Top = 13
            Width = 756
            Height = 200
            DataSource = dtmCadastroProdutos.dsrSimilares
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clBlack
            TitleFont.Height = -12
            TitleFont.Name = 'helvetica'
            TitleFont.Pitch = fpVariable
            TitleFont.Style = []
            OnDblClick = dbgSimilaresDblClick
            OnKeyDown = dbgSimilaresKeyDown
            RowWrap = 60
            Large = False
            DoubleRowColor = True
            MsgDelete = 'o SIMILAR'
            TitleMinHeight = 100
            CellHeights = 100
            StrippedColor = 16054260
            CanDelete = False
            CanNotInsertFromGrid = False
            PostOnEnter = False
            PostOnSetUpDown = False
            DenySort = False
            DefaultRowHeight = 19
            ExibirNumerodaLinha = False
            NaoAtribuirDadosaTabelaaoDigitar = False
            Columns = <
              item
                Expanded = False
                FieldName = 'similarvisual'
                Title.Alignment = taCenter
                Title.Caption = 'C'#211'DIGO SIMILAR'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 120
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'descricao'
                Title.Alignment = taCenter
                Title.Caption = 'DESCRI'#199#195'O DO PRODUTO SIMILAR'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 590
                Visible = True
              end>
          end
        end
      end
      object tstPrecos: TTabSheet
        Caption = ' &7 - Pre'#231'os'
        ImageIndex = 5
        object gbxPrecos: TGroupBox
          Left = 0
          Top = 0
          Width = 247
          Height = 270
          Align = alLeft
          Caption = 'PRE'#199'OS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object sbnIncluirPreco: TSpeedButton
            Left = 2
            Top = 206
            Width = 23
            Height = 22
            Hint = 'Incluir Pre'#231'o'
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
            OnClick = sbnIncluirPrecoClick
          end
          object sbnExcluirPreco: TSpeedButton
            Left = 26
            Top = 206
            Width = 23
            Height = 22
            Hint = 'Excluir Pre'#231'o'
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
            OnClick = sbnExcluirPrecoClick
          end
          object dbgPrecos: TtecDBGrid
            Left = 4
            Top = 14
            Width = 239
            Height = 187
            DataSource = dtmCadastroProdutos.dsrPrecos
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clBlack
            TitleFont.Height = -11
            TitleFont.Name = 'helvetica'
            TitleFont.Pitch = fpVariable
            TitleFont.Style = [fsBold]
            OnDblClick = dbgPrecosDblClick
            OnKeyDown = dbgPrecosKeyDown
            RowWrap = 60
            Large = False
            DoubleRowColor = True
            MsgDelete = 'o PRE'#199'O'
            TitleMinHeight = 100
            CellHeights = 100
            StrippedColor = 16054260
            CanDelete = False
            CanNotInsertFromGrid = False
            PostOnEnter = False
            PostOnSetUpDown = False
            DenySort = False
            DefaultRowHeight = 19
            ExibirNumerodaLinha = False
            NaoAtribuirDadosaTabelaaoDigitar = False
            Columns = <
              item
                Expanded = False
                FieldName = 'codigo'
                Title.Alignment = taCenter
                Title.Caption = 'C'#211'DIGO'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 40
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'descricao'
                Title.Alignment = taCenter
                Title.Caption = 'DESCRI'#199#195'O'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 160
                Visible = True
              end>
          end
        end
        object gbxColunasPrecos: TGroupBox
          Left = 250
          Top = 0
          Width = 409
          Height = 242
          Align = alCustom
          Caption = 'COLUNAS DE PRE'#199'OS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          object sbnIncluirColunaPreco: TSpeedButton
            Left = 6
            Top = 206
            Width = 23
            Height = 22
            Hint = 'Incluir Coluna Pre'#231'o'
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
            OnClick = sbnIncluirColunaPrecoClick
          end
          object sbnExcluirColunaPreco: TSpeedButton
            Left = 30
            Top = 206
            Width = 23
            Height = 22
            Hint = 'Excluir Coluna Pre'#231'o'
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
            OnClick = sbnExcluirColunaPrecoClick
          end
          object dbgColunasPrecos: TtecDBGrid
            Left = 2
            Top = 14
            Width = 403
            Height = 187
            DataSource = dtmCadastroProdutos.dsrColunasPrecos
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clBlack
            TitleFont.Height = -11
            TitleFont.Name = 'helvetica'
            TitleFont.Pitch = fpVariable
            TitleFont.Style = [fsBold]
            OnDblClick = dbgColunasPrecosDblClick
            OnKeyDown = dbgColunasPrecosKeyDown
            RowWrap = 60
            Large = False
            DoubleRowColor = True
            MsgDelete = 'a COLUNA DE PRE'#199'OS'
            TitleMinHeight = 100
            CellHeights = 100
            StrippedColor = 16054260
            CanDelete = False
            CanNotInsertFromGrid = False
            PostOnEnter = False
            PostOnSetUpDown = False
            DenySort = False
            DefaultRowHeight = 19
            ExibirNumerodaLinha = False
            NaoAtribuirDadosaTabelaaoDigitar = False
            Columns = <
              item
                Expanded = False
                FieldName = 'colunasdescricao'
                Title.Alignment = taCenter
                Title.Caption = 'COLUNA'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 160
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'valor'
                Title.Alignment = taCenter
                Title.Caption = 'VALOR'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 80
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'validade'
                Title.Alignment = taCenter
                Title.Caption = 'VALIDADE'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'alteracao'
                Title.Alignment = taCenter
                Title.Caption = 'ALTERADO'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 60
                Visible = True
              end>
          end
        end
        object gbxModelos: TGroupBox
          Left = 722
          Top = 0
          Width = 281
          Height = 270
          Align = alRight
          Caption = 'MODELOS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          object mmoObservacaoModelo: TtecDBMemo
            Left = 2
            Top = 219
            Width = 277
            Height = 49
            Align = alBottom
            DataField = 'observacao'
            DataSource = dtmCadastroProdutos.dsrModelosCaracteristicas
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
          object dbgModelos: TtecDBGrid
            Left = 2
            Top = 16
            Width = 277
            Height = 203
            Hint = 'Pressione CTRL+F9 para selecionar modelos de uma lista'
            Align = alClient
            DataSource = dtmCadastroProdutos.dsrModelosCaracteristicas
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
            ParentFont = False
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clBlack
            TitleFont.Height = -12
            TitleFont.Name = 'helvetica'
            TitleFont.Pitch = fpVariable
            TitleFont.Style = []
            OnKeyDown = dbgModelosKeyDown
            RowWrap = 60
            Large = False
            DoubleRowColor = False
            TitleMinHeight = 100
            CellHeights = 100
            StrippedColor = 16054260
            CanDelete = True
            CanNotInsertFromGrid = False
            PostOnEnter = True
            PostOnSetUpDown = False
            DenySort = False
            DefaultRowHeight = 19
            ExibirNumerodaLinha = False
            NaoAtribuirDadosaTabelaaoDigitar = False
            Columns = <
              item
                Expanded = False
                FieldName = 'descricaomodelo'
                ReadOnly = True
                Title.Alignment = taCenter
                Title.Caption = 'MODELO'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 130
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'especificacao'
                Title.Alignment = taCenter
                Title.Caption = 'ESPECIFICA'#199#195'O'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 110
                Visible = True
              end>
          end
        end
      end
      object tstContabil: TTabSheet
        Caption = '   &8 - Cont'#225'bil'
        ImageIndex = 7
        object pgcContasContabeis: TPageControl
          Left = 0
          Top = 0
          Width = 1003
          Height = 270
          ActivePage = tstaVista
          Align = alClient
          TabHeight = 20
          TabOrder = 0
          TabWidth = 120
          object tstaVista: TTabSheet
            Caption = '1 - Venda a Vista'
            object gbxDebitarVendaaVista: TGroupBox
              Left = 6
              Top = 2
              Width = 700
              Height = 36
              Caption = 'DEBITAR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              object sbnConsultaDebitarVendaVista: TSpeedButton
                Left = 69
                Top = 10
                Width = 23
                Height = 23
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
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
                ParentFont = False
                OnClick = sbnConsultaDebitarVendaVistaClick
              end
              object dtxDebitarDescricaoVendaVista: TtecDBText
                Left = 93
                Top = 10
                Width = 436
                Height = 23
                TabStop = False
                Color = clBtnFace
                DataField = 'descricao'
                DataSource = dtmCadastroProdutos.dsrProcuraDebitaraVista
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
              object flkDebitarVendaaVista: TtecDBFindLookup
                Left = 2
                Top = 10
                Width = 65
                Height = 23
                Alignment = taLeftJustify
                DataField = 'debitarvendaavista'
                DataSource = dtmCadastroProdutos.dsrCaracteristicas
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                MaxLength = 6
                Maximo = 0
                Minimo = 37353
                Adicional = 0
                Opcional = True
                ParentFont = False
                TabOrder = 0
                PermitirZero = False
                PermitirNulo = False
                Operacao = opATRIBUICAO
                LookupField = 'codigo'
                LookupSource = dtmCadastroProdutos.dsrProcuraDebitaraVista
                LookupQueryParameter = 'codigo'
                Parameter = ' '
                ActiveSetControls = False
                DenyInsert = False
                NoSetControls = <>
                SetControls = <>
                LookupParameter = 'codigo'
              end
              object dtxDebitarClassificacaoVendaVista: TtecDBText
                Left = 531
                Top = 10
                Width = 166
                Height = 23
                TabStop = False
                Color = clBtnFace
                DataField = 'classificacao'
                DataSource = dtmCadastroProdutos.dsrProcuraDebitaraVista
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 2
                Alignment = taLeftJustify
              end
            end
            object gbxCreditarVendaVista: TGroupBox
              Left = 6
              Top = 46
              Width = 700
              Height = 36
              Caption = 'CREDITAR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              object sbnConsultaCreditarVendaVista: TSpeedButton
                Left = 69
                Top = 10
                Width = 23
                Height = 23
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
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
                ParentFont = False
                OnClick = sbnConsultaCreditarVendaVistaClick
              end
              object dtxCreditarDescricaoVendaVista: TtecDBText
                Left = 93
                Top = 10
                Width = 436
                Height = 23
                TabStop = False
                Color = clBtnFace
                DataField = 'descricao'
                DataSource = dtmCadastroProdutos.dsrProcuraCreditaraVista
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
              object flkCreditarVendaVista: TtecDBFindLookup
                Left = 2
                Top = 10
                Width = 65
                Height = 23
                Alignment = taLeftJustify
                DataField = 'creditarvendaavista'
                DataSource = dtmCadastroProdutos.dsrCaracteristicas
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                MaxLength = 6
                Maximo = 0
                Minimo = 37353
                Adicional = 0
                Opcional = True
                ParentFont = False
                TabOrder = 1
                PermitirZero = False
                PermitirNulo = False
                Operacao = opATRIBUICAO
                LookupField = 'codigo'
                LookupSource = dtmCadastroProdutos.dsrProcuraCreditaraVista
                LookupQueryParameter = 'codigo'
                Parameter = ' '
                ActiveSetControls = False
                DenyInsert = True
                NoSetControls = <>
                SetControls = <>
                LookupParameter = 'codigo'
              end
              object dtxCreditarClassificacaoVendaVista: TtecDBText
                Left = 531
                Top = 10
                Width = 166
                Height = 23
                TabStop = False
                Color = clBtnFace
                DataField = 'classificacao'
                DataSource = dtmCadastroProdutos.dsrProcuraCreditaraVista
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 2
                Alignment = taLeftJustify
              end
            end
            object gbxHistoricoVendaaVista: TGroupBox
              Left = 6
              Top = 90
              Width = 533
              Height = 36
              Caption = 'HIST'#211'RICO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              object sbnConsultaHistoricoVendaaVista: TSpeedButton
                Left = 69
                Top = 10
                Width = 23
                Height = 23
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
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
                ParentFont = False
                OnClick = sbnConsultaHistoricoVendaaVistaClick
              end
              object dtxHistoricoVendaaVista: TtecDBText
                Left = 93
                Top = 10
                Width = 436
                Height = 23
                TabStop = False
                Color = clBtnFace
                DataField = 'descricao'
                DataSource = dtmCadastroProdutos.dsrProcuraHistoricoVendaaVista
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
              object flkHistoricoVendaaVista: TtecDBFindLookup
                Left = 2
                Top = 10
                Width = 65
                Height = 23
                Alignment = taLeftJustify
                DataField = 'historicovendaavista'
                DataSource = dtmCadastroProdutos.dsrCaracteristicas
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                MaxLength = 3
                Maximo = 0
                Minimo = 37353
                Adicional = 0
                Opcional = True
                ParentFont = False
                TabOrder = 1
                PermitirZero = False
                PermitirNulo = False
                Operacao = opATRIBUICAO
                LookupField = 'codigo'
                LookupSource = dtmCadastroProdutos.dsrProcuraHistoricoVendaaVista
                LookupQueryParameter = 'codigo'
                Parameter = ' '
                ActiveSetControls = False
                DenyInsert = True
                NoSetControls = <>
                SetControls = <>
                LookupParameter = 'codigo'
              end
            end
          end
          object tstVendaaPrazo: TTabSheet
            Caption = '2 - Venda a Prazo'
            ImageIndex = 1
            object gbxDebitarVendaaPrazo: TGroupBox
              Left = 6
              Top = 2
              Width = 700
              Height = 36
              Caption = 'DEBITAR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              object sbnConsultaDebitarVendaPrazo: TSpeedButton
                Left = 69
                Top = 10
                Width = 23
                Height = 23
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
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
                ParentFont = False
                OnClick = sbnConsultaDebitarVendaPrazoClick
              end
              object dtxDebitarDescricaoVendaPrazo: TtecDBText
                Left = 93
                Top = 10
                Width = 436
                Height = 23
                TabStop = False
                Color = clBtnFace
                DataField = 'descricao'
                DataSource = dtmCadastroProdutos.dsrProcuraDebitaraPrazo
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
              object flkDebitarVendaaPrazo: TtecDBFindLookup
                Left = 2
                Top = 10
                Width = 65
                Height = 23
                Alignment = taLeftJustify
                DataField = 'debitarvendaaprazo'
                DataSource = dtmCadastroProdutos.dsrCaracteristicas
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                MaxLength = 6
                Maximo = 0
                Minimo = 37353
                Adicional = 0
                Opcional = True
                ParentFont = False
                TabOrder = 0
                PermitirZero = False
                PermitirNulo = False
                Operacao = opATRIBUICAO
                LookupField = 'codigo'
                LookupSource = dtmCadastroProdutos.dsrProcuraDebitaraPrazo
                LookupQueryParameter = 'codigo'
                Parameter = ' '
                ActiveSetControls = False
                DenyInsert = False
                NoSetControls = <>
                SetControls = <>
                LookupParameter = 'codigo'
              end
              object dtxDebitarClassificacaoVendaPrazo: TtecDBText
                Left = 531
                Top = 10
                Width = 166
                Height = 23
                TabStop = False
                Color = clBtnFace
                DataField = 'classificacao'
                DataSource = dtmCadastroProdutos.dsrProcuraDebitaraPrazo
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 2
                Alignment = taLeftJustify
              end
            end
            object gbxCreditarVendaPrazo: TGroupBox
              Left = 6
              Top = 46
              Width = 700
              Height = 36
              Caption = 'CREDITAR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              object sbnConsultaCreditarVendaPrazo: TSpeedButton
                Left = 69
                Top = 10
                Width = 23
                Height = 23
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
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
                ParentFont = False
                OnClick = sbnConsultaCreditarVendaPrazoClick
              end
              object dtxCreditarDescricaoVendaPrazo: TtecDBText
                Left = 93
                Top = 10
                Width = 436
                Height = 23
                TabStop = False
                Color = clBtnFace
                DataField = 'descricao'
                DataSource = dtmCadastroProdutos.dsrProcuraCreditaraPrazo
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
              object flkCreditarVendaPrazo: TtecDBFindLookup
                Left = 2
                Top = 10
                Width = 65
                Height = 23
                Alignment = taLeftJustify
                DataField = 'creditarvendaaprazo'
                DataSource = dtmCadastroProdutos.dsrCaracteristicas
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                MaxLength = 6
                Maximo = 0
                Minimo = 37353
                Adicional = 0
                Opcional = True
                ParentFont = False
                TabOrder = 1
                PermitirZero = False
                PermitirNulo = False
                Operacao = opATRIBUICAO
                LookupField = 'codigo'
                LookupSource = dtmCadastroProdutos.dsrProcuraCreditaraPrazo
                LookupQueryParameter = 'codigo'
                Parameter = ' '
                ActiveSetControls = False
                DenyInsert = True
                NoSetControls = <>
                SetControls = <>
                LookupParameter = 'codigo'
              end
              object dtxCreditarClassificacaoVendaPrazo: TtecDBText
                Left = 531
                Top = 10
                Width = 166
                Height = 23
                TabStop = False
                Color = clBtnFace
                DataField = 'classificacao'
                DataSource = dtmCadastroProdutos.dsrProcuraCreditaraPrazo
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 2
                Alignment = taLeftJustify
              end
            end
            object gbxHistoricoVendaaPrazo: TGroupBox
              Left = 6
              Top = 90
              Width = 533
              Height = 36
              Caption = 'HIST'#211'RICO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              object sbnConsultaHistoricoVendaaPrazo: TSpeedButton
                Left = 69
                Top = 10
                Width = 23
                Height = 23
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
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
                ParentFont = False
                OnClick = sbnConsultaHistoricoVendaaPrazoClick
              end
              object dtxHistoricoVendaaPrazo: TtecDBText
                Left = 93
                Top = 10
                Width = 436
                Height = 23
                TabStop = False
                Color = clBtnFace
                DataField = 'descricao'
                DataSource = dtmCadastroProdutos.dsrProcuraHistoricoVendaaPrazo
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
              object flkHistoricoVendaaPrazo: TtecDBFindLookup
                Left = 2
                Top = 10
                Width = 65
                Height = 23
                Alignment = taLeftJustify
                DataField = 'historicovendaaprazo'
                DataSource = dtmCadastroProdutos.dsrCaracteristicas
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                MaxLength = 3
                Maximo = 0
                Minimo = 37353
                Adicional = 0
                Opcional = True
                ParentFont = False
                TabOrder = 1
                PermitirZero = False
                PermitirNulo = False
                Operacao = opATRIBUICAO
                LookupField = 'codigo'
                LookupSource = dtmCadastroProdutos.dsrProcuraHistoricoVendaaPrazo
                LookupQueryParameter = 'codigo'
                Parameter = ' '
                ActiveSetControls = False
                DenyInsert = True
                NoSetControls = <>
                SetControls = <>
                LookupParameter = 'codigo'
              end
            end
          end
          object tstAbatimentos: TTabSheet
            Caption = '3 - Abatimentos'
            ImageIndex = 2
            object gbxDebitarAbatimentos: TGroupBox
              Left = 4
              Top = 2
              Width = 700
              Height = 36
              Caption = 'DEBITAR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              object sbnConsultaDebitarAbatimentos: TSpeedButton
                Left = 69
                Top = 10
                Width = 23
                Height = 23
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
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
                ParentFont = False
                OnClick = sbnConsultaDebitarAbatimentosClick
              end
              object dtxDebitarDescricaoAbatimentos: TtecDBText
                Left = 93
                Top = 10
                Width = 436
                Height = 23
                TabStop = False
                Color = clBtnFace
                DataField = 'descricao'
                DataSource = dtmCadastroProdutos.dsrProcuraDebitarAbatimentos
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
              object flkDebitarAbatimentos: TtecDBFindLookup
                Left = 2
                Top = 10
                Width = 65
                Height = 23
                Alignment = taLeftJustify
                DataField = 'debitarabatimentos'
                DataSource = dtmCadastroProdutos.dsrCaracteristicas
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                MaxLength = 6
                Maximo = 0
                Minimo = 37353
                Adicional = 0
                Opcional = True
                ParentFont = False
                TabOrder = 0
                PermitirZero = False
                PermitirNulo = False
                Operacao = opATRIBUICAO
                LookupField = 'codigo'
                LookupSource = dtmCadastroProdutos.dsrProcuraDebitarAbatimentos
                LookupQueryParameter = 'codigo'
                Parameter = ' '
                ActiveSetControls = False
                DenyInsert = False
                NoSetControls = <>
                SetControls = <>
                LookupParameter = 'codigo'
              end
              object dtxDebitarClassificacaoAbatimentos: TtecDBText
                Left = 531
                Top = 10
                Width = 166
                Height = 23
                TabStop = False
                Color = clBtnFace
                DataField = 'classificacao'
                DataSource = dtmCadastroProdutos.dsrProcuraDebitarAbatimentos
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 2
                Alignment = taLeftJustify
              end
            end
            object gbxCreditarAbatimentos: TGroupBox
              Left = 4
              Top = 46
              Width = 700
              Height = 36
              Caption = 'CREDITAR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              object sbnConsultaCreditarAbatimentos: TSpeedButton
                Left = 69
                Top = 10
                Width = 23
                Height = 23
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
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
                ParentFont = False
                OnClick = sbnConsultaCreditarAbatimentosClick
              end
              object dtxCreditarDescricaoAbatimentos: TtecDBText
                Left = 93
                Top = 10
                Width = 436
                Height = 23
                TabStop = False
                Color = clBtnFace
                DataField = 'descricao'
                DataSource = dtmCadastroProdutos.dsrProcuraCreditarAbatimentos
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
              object flkCreditarAbatimentos: TtecDBFindLookup
                Left = 2
                Top = 10
                Width = 65
                Height = 23
                Alignment = taLeftJustify
                DataField = 'creditarabatimentos'
                DataSource = dtmCadastroProdutos.dsrCaracteristicas
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                MaxLength = 6
                Maximo = 0
                Minimo = 37353
                Adicional = 0
                Opcional = True
                ParentFont = False
                TabOrder = 1
                PermitirZero = False
                PermitirNulo = False
                Operacao = opATRIBUICAO
                LookupField = 'codigo'
                LookupSource = dtmCadastroProdutos.dsrProcuraCreditarAbatimentos
                LookupQueryParameter = 'codigo'
                Parameter = ' '
                ActiveSetControls = False
                DenyInsert = True
                NoSetControls = <>
                SetControls = <>
                LookupParameter = 'codigo'
              end
              object dtxCreditarClassificacaoAbatimentos: TtecDBText
                Left = 531
                Top = 10
                Width = 166
                Height = 23
                TabStop = False
                Color = clBtnFace
                DataField = 'classificacao'
                DataSource = dtmCadastroProdutos.dsrProcuraCreditarAbatimentos
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 2
                Alignment = taLeftJustify
              end
            end
            object gbxHistoricoAbatimentos: TGroupBox
              Left = 4
              Top = 90
              Width = 533
              Height = 36
              Caption = 'HIST'#211'RICO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              object sbnConsultaHistoricoAbatimentos: TSpeedButton
                Left = 69
                Top = 10
                Width = 23
                Height = 23
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
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
                ParentFont = False
                OnClick = sbnConsultaHistoricoAbatimentosClick
              end
              object dtxHistoricoAbatimentos: TtecDBText
                Left = 93
                Top = 10
                Width = 436
                Height = 23
                TabStop = False
                Color = clBtnFace
                DataField = 'descricao'
                DataSource = dtmCadastroProdutos.dsrProcuraHistoricoAbatimentos
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
              object flkHistoricoAbatimentos: TtecDBFindLookup
                Left = 2
                Top = 10
                Width = 65
                Height = 23
                Alignment = taLeftJustify
                DataField = 'historicoabatimentos'
                DataSource = dtmCadastroProdutos.dsrCaracteristicas
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                MaxLength = 3
                Maximo = 0
                Minimo = 37353
                Adicional = 0
                Opcional = True
                ParentFont = False
                TabOrder = 1
                PermitirZero = False
                PermitirNulo = False
                Operacao = opATRIBUICAO
                LookupField = 'codigo'
                LookupSource = dtmCadastroProdutos.dsrProcuraHistoricoAbatimentos
                LookupQueryParameter = 'codigo'
                Parameter = ' '
                ActiveSetControls = False
                DenyInsert = True
                NoSetControls = <>
                SetControls = <>
                LookupParameter = 'codigo'
              end
            end
          end
          object tstDevolucoes: TTabSheet
            Caption = '4 - Devolu'#231#245'es'
            ImageIndex = 3
            object gbxDebitarDevolucoes: TGroupBox
              Left = 4
              Top = 2
              Width = 700
              Height = 36
              Caption = 'DEBITAR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              object sbnConsultaDebitarDevolucoes: TSpeedButton
                Left = 69
                Top = 10
                Width = 23
                Height = 23
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
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
                ParentFont = False
                OnClick = sbnConsultaDebitarDevolucoesClick
              end
              object dtxDebitarDescricaoDevolucoes: TtecDBText
                Left = 93
                Top = 10
                Width = 436
                Height = 23
                TabStop = False
                Color = clBtnFace
                DataField = 'descricao'
                DataSource = dtmCadastroProdutos.dsrProcuraDebitarDevolucoes
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
              object flkDebitarDevolucoes: TtecDBFindLookup
                Left = 2
                Top = 10
                Width = 65
                Height = 23
                Alignment = taLeftJustify
                DataField = 'debitardevolucoes'
                DataSource = dtmCadastroProdutos.dsrCaracteristicas
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                MaxLength = 6
                Maximo = 0
                Minimo = 37353
                Adicional = 0
                Opcional = True
                ParentFont = False
                TabOrder = 0
                PermitirZero = False
                PermitirNulo = False
                Operacao = opATRIBUICAO
                LookupField = 'codigo'
                LookupSource = dtmCadastroProdutos.dsrProcuraDebitarDevolucoes
                LookupQueryParameter = 'codigo'
                Parameter = ' '
                ActiveSetControls = False
                DenyInsert = False
                NoSetControls = <>
                SetControls = <>
                LookupParameter = 'codigo'
              end
              object dtxDebitarClassificacaoDevolucoes: TtecDBText
                Left = 531
                Top = 10
                Width = 166
                Height = 23
                TabStop = False
                Color = clBtnFace
                DataField = 'classificacao'
                DataSource = dtmCadastroProdutos.dsrProcuraDebitarDevolucoes
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 2
                Alignment = taLeftJustify
              end
            end
            object gbxCreditarDevolucoes: TGroupBox
              Left = 4
              Top = 44
              Width = 700
              Height = 36
              Caption = 'CREDITAR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              object sbnConsultaCreditarDevolucoes: TSpeedButton
                Left = 69
                Top = 10
                Width = 23
                Height = 23
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
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
                ParentFont = False
                OnClick = sbnConsultaCreditarDevolucoesClick
              end
              object dtxCreditarDescricaoDevolucoes: TtecDBText
                Left = 93
                Top = 10
                Width = 436
                Height = 23
                TabStop = False
                Color = clBtnFace
                DataField = 'descricao'
                DataSource = dtmCadastroProdutos.dsrProcuraCreditarDevolucoes
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
              object flkCreditarDevolucoes: TtecDBFindLookup
                Left = 2
                Top = 10
                Width = 65
                Height = 23
                Alignment = taLeftJustify
                DataField = 'creditardevolucoes'
                DataSource = dtmCadastroProdutos.dsrCaracteristicas
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                MaxLength = 6
                Maximo = 0
                Minimo = 37353
                Adicional = 0
                Opcional = True
                ParentFont = False
                TabOrder = 1
                PermitirZero = False
                PermitirNulo = False
                Operacao = opATRIBUICAO
                LookupField = 'codigo'
                LookupSource = dtmCadastroProdutos.dsrProcuraCreditarDevolucoes
                LookupQueryParameter = 'codigo'
                Parameter = ' '
                ActiveSetControls = False
                DenyInsert = True
                NoSetControls = <>
                SetControls = <>
                LookupParameter = 'codigo'
              end
              object dtxCreditarClassificacaoDevolucoes: TtecDBText
                Left = 531
                Top = 10
                Width = 166
                Height = 23
                TabStop = False
                Color = clBtnFace
                DataField = 'classificacao'
                DataSource = dtmCadastroProdutos.dsrProcuraCreditarDevolucoes
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 2
                Alignment = taLeftJustify
              end
            end
            object gbxHistoricoDevolucoes: TGroupBox
              Left = 4
              Top = 89
              Width = 533
              Height = 36
              Caption = 'HIST'#211'RICO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              object sbnConsultaHistoricoDevolucoes: TSpeedButton
                Left = 69
                Top = 10
                Width = 23
                Height = 23
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
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
                ParentFont = False
                OnClick = sbnConsultaHistoricoDevolucoesClick
              end
              object dtxHistoricoDevolucoes: TtecDBText
                Left = 93
                Top = 10
                Width = 436
                Height = 23
                TabStop = False
                Color = clBtnFace
                DataField = 'descricao'
                DataSource = dtmCadastroProdutos.dsrProcuraHistoricoDevolucoes
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
              object flkHistoricoDevolucoes: TtecDBFindLookup
                Left = 2
                Top = 10
                Width = 65
                Height = 23
                Alignment = taLeftJustify
                DataField = 'historicodevolucoes'
                DataSource = dtmCadastroProdutos.dsrCaracteristicas
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                MaxLength = 3
                Maximo = 0
                Minimo = 37353
                Adicional = 0
                Opcional = True
                ParentFont = False
                TabOrder = 1
                PermitirZero = False
                PermitirNulo = False
                Operacao = opATRIBUICAO
                LookupField = 'codigo'
                LookupSource = dtmCadastroProdutos.dsrProcuraHistoricoDevolucoes
                LookupQueryParameter = 'codigo'
                Parameter = ' '
                ActiveSetControls = False
                DenyInsert = True
                NoSetControls = <>
                SetControls = <>
                LookupParameter = 'codigo'
              end
            end
          end
        end
      end
      object tstProdutosCargos: TTabSheet
        Caption = ' &9 - Pre'#231'os Cargos '
        ImageIndex = 8
        object dbgProdutosCargos: TtecDBGrid
          Left = 0
          Top = 0
          Width = 974
          Height = 270
          Align = alClient
          DataSource = dtmCadastroProdutos.dsrprodutosCargo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlack
          TitleFont.Height = -9
          TitleFont.Name = 'helvetica'
          TitleFont.Pitch = fpVariable
          TitleFont.Style = []
          OnDblClick = dbgProdutosCargosDblClick
          OnKeyDown = dbgProdutosCargosKeyDown
          RowWrap = 60
          Large = False
          DoubleRowColor = False
          TitleMinHeight = 100
          CellHeights = 100
          StrippedColor = 16054260
          CanDelete = True
          CanNotInsertFromGrid = False
          PostOnEnter = False
          PostOnSetUpDown = False
          DenySort = False
          DefaultRowHeight = 19
          ExibirNumerodaLinha = False
          NaoAtribuirDadosaTabelaaoDigitar = False
          Columns = <
            item
              Expanded = False
              FieldName = 'cargo'
              Title.Alignment = taCenter
              Title.Caption = 'CARGO'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'descricaocargo'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'DESCRI'#199#195'O'
              Width = 400
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'markup'
              Title.Alignment = taCenter
              Title.Caption = 'MARKUP'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'valorproduto'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'VALOR DO PRODUTO'
              Width = 110
              Visible = True
            end>
        end
        object pnlProdutosCargos: TPanel
          Left = 974
          Top = 0
          Width = 29
          Height = 270
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 1
          object sbnIncluirCargosProdutos: TSpeedButton
            Left = 3
            Top = 40
            Width = 23
            Height = 22
            Hint = 'Incluir produtos por cargo'
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
            OnClick = sbnIncluirCargosProdutosClick
          end
          object sbnEcluirCargosProdutos: TSpeedButton
            Left = 3
            Top = 61
            Width = 23
            Height = 22
            Hint = 'Excluir produto por cargo'
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
            OnClick = sbnEcluirCargosProdutosClick
          end
          object sbnGerarCargosProdutos: TSpeedButton
            Left = 6
            Top = 10
            Width = 23
            Height = 22
            Hint = 'Incluir todos os cargos no produto'
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
            OnClick = sbnGerarCargosProdutosClick
          end
        end
      end
    end
    object gbxCodigos: TGroupBox
      Left = 0
      Top = 0
      Width = 1011
      Height = 157
      Align = alTop
      TabOrder = 0
      object gbxCodigo: TGroupBox
        Left = 6
        Top = 12
        Width = 235
        Height = 36
        Caption = ' C'#211'DIGO '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object edfCodigo: TtecDbEditFind
          Left = 2
          Top = 10
          Width = 230
          Height = 23
          Alignment = taLeftJustify
          DataField = 'codigovisual'
          DataSource = dtmCadastroProdutos.dsrCaracteristicas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          Group = 'caracteristicas'
          MaxLength = 30
          Maximo = 0
          Minimo = 37353
          Adicional = 0
          Opcional = True
          OnFound = edfCodigoFound
          ParentFont = False
          TabOrder = 0
          PermitirZero = False
          PermitirNulo = False
          Operacao = opPESQUISA
          Parameter = 'codigovisual'
          ActiveSetControls = True
          DenyInsert = False
          NoSetControls = <
            item
              Control = dbgProdutos
            end>
          SetControls = <
            item
              Control = pgcCaracteristicas
            end
            item
            end
            item
              Control = edtForaLinha
            end
            item
              Control = edtDescricao
            end
            item
              Control = edtInativo
            end
            item
              Control = edtVolumes
            end
            item
              Control = gbxTipoProduto
            end
            item
              Control = mmoComplemento
            end
            item
              Control = gbxPeso
            end
            item
              Control = gbxDescricaonanf
            end
            item
              Control = gbxGTIN
            end>
        end
      end
      object gbxNumerico: TGroupBox
        Left = 244
        Top = 10
        Width = 84
        Height = 38
        Caption = 'C'#211'D. INTERNO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 11
        object dtxCodigoCaracteristica: TtecDBText
          Left = 2
          Top = 12
          Width = 79
          Height = 23
          TabStop = False
          Color = clBtnFace
          DataField = 'codigo'
          DataSource = dtmCadastroProdutos.dsrCaracteristicas
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
      object gbxDescricao: TGroupBox
        Left = 6
        Top = 48
        Width = 587
        Height = 36
        Caption = ' DESCRI'#199#195'O '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        object edtDescricao: TDBEditTexto
          Left = 2
          Top = 10
          Width = 582
          Height = 23
          DataField = 'descricao'
          DataSource = dtmCadastroProdutos.dsrCaracteristicas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = -1
          ParentFont = False
          TabOrder = 0
          OnEnter = edtDescricaoEnter
          OnExit = edtDescricaoExit
          CharCasenoDefault = False
          Alignment = taLeftJustify
        end
      end
      object gbxComplemento: TGroupBox
        Left = 6
        Top = 84
        Width = 587
        Height = 70
        Caption = ' COMPLEMENTO '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        object mmoComplemento: TtecDBMemo
          Left = 2
          Top = 14
          Width = 583
          Height = 54
          Align = alClient
          DataField = 'complemento'
          DataSource = dtmCadastroProdutos.dsrCaracteristicas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = 360
          ParentFont = False
          ScrollBars = ssVertical
          TabOrder = 0
        end
      end
      object gbxTipoProduto: TGroupBox
        Left = 436
        Top = 11
        Width = 348
        Height = 37
        Caption = ' TIPO DE PRODUTO '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        inline fraConsultaTipoProduto: TfraConsultaCodigo
          Left = 3
          Top = 11
          Width = 342
          Height = 23
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
          TabOrder = 0
          inherited sbnProcura: TSpeedButton
            Left = 34
            Height = 23
          end
          inherited dtxDescricao: TtecDBText
            Left = 58
            Width = 283
            DataField = 'descricao'
            DataSource = fraConsultaTipoProduto.dsrProcuraTipoProduto
          end
          inherited edfCodigo: TtecDBFindLookup
            Width = 33
            DataField = 'tipoproduto'
            MaxLength = 2
            LookupField = 'codigo'
            LookupSource = fraConsultaTipoProduto.dsrProcuraTipoProduto
            LookupQueryParameter = 'codigo'
            Parameter = ' '
            ActiveSetControls = False
            DenyInsert = False
            NoSetControls = <>
            SetControls = <>
            LookupParameter = 'codigo'
          end
        end
      end
      object gbxInativo: TGroupBox
        Left = 870
        Top = 48
        Width = 80
        Height = 36
        Caption = ' INATIVO '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        object edtInativo: TDBEditData
          Left = 2
          Top = 10
          Width = 75
          Height = 23
          Alignment = taCenter
          DataField = 'inativo'
          DataSource = dtmCadastroProdutos.dsrCaracteristicas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = -1
          Maximo = 365
          Minimo = 37353
          Adicional = 0
          ParentFont = False
          TabOrder = 0
          OnExit = edtInativoExit
          Opcional = True
        end
      end
      object gbxForaLinha: TGroupBox
        Left = 787
        Top = 48
        Width = 80
        Height = 36
        Caption = ' FORA LINHA '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        object edtForaLinha: TDBEditData
          Left = 2
          Top = 10
          Width = 75
          Height = 23
          Alignment = taCenter
          DataField = 'foralinha'
          DataSource = dtmCadastroProdutos.dsrCaracteristicas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = -1
          Maximo = 35000
          Minimo = 37353
          Adicional = 0
          ParentFont = False
          TabOrder = 0
          Opcional = True
        end
      end
      object gbxVolumes: TGroupBox
        Left = 904
        Top = 12
        Width = 80
        Height = 36
        Caption = ' N'#186' VOLUMES '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        object edtVolumes: TDBEditNumero
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
          MaxLength = -1
          ParentFont = False
          TabOrder = 0
          Text = 'edtVolumes'
          Mascara = True
          Alignment = taLeftJustify
          TipoMascara = tmGERAL
          NrDecimal = 2
          Decimais = False
          Negativo = False
          Tamanho = 5
          DataField = 'volumes'
          DataSource = dtmCadastroProdutos.dsrCaracteristicas
        end
      end
      object ckbEspecial: TDBCheckBox
        Left = 923
        Top = 130
        Width = 70
        Height = 19
        Caption = 'ESPECIAL'
        DataField = 'especial'
        DataSource = dtmCadastroProdutos.dsrCaracteristicas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 10
        ValueChecked = 'True'
        ValueUnchecked = 'False'
        Visible = False
      end
      object gbxPeso: TGroupBox
        Left = 787
        Top = 12
        Width = 115
        Height = 36
        Caption = ' PESO '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        object edtpesoProduto: TDBEditNumero
          Left = 2
          Top = 10
          Width = 111
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
          Text = 'edtpesoProduto'
          Mascara = True
          Alignment = taLeftJustify
          TipoMascara = tmGERAL
          NrDecimal = 4
          Decimais = True
          Negativo = False
          Tamanho = 15
          DataField = 'peso'
          DataSource = dtmCadastroProdutos.dsrCaracteristicas
        end
      end
      object gbxDescricaonanf: TGroupBox
        Left = 595
        Top = 119
        Width = 323
        Height = 36
        Caption = ' DESCRI'#199#195'O NA NOTA FISCAL '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 9
        object sbnDescricaonanf: TSpeedButton
          Left = 296
          Top = 10
          Width = 23
          Height = 23
          Hint = 'Procurar Marca'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            18000000000000060000120B0000120B00000000000000000000C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7FFFFFFFC3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3800000800000800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C38000
            00800000800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C38000008000
            00800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C38000008000008000
            00C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFFFFFFFFFF
            FFFFC3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3FFA858800000800000800000FFA858C3C3C30000FF800000800000C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3
            C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            800000FFA858FFA858FFA858FFA858FFA8588000008000000000FFC3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7FC3C3C3C3C3C3C3C3C37F
            7F7F7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3800000
            FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFA858FFA858
            FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C37F7F7FC3C3C3FFFFFFC3C3C3C3C3C3C3C3C3C3C3C3800000FFA858
            FFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFA858800000C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3800000FFA858
            FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3800000FFA858
            FFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFA858800000C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C37F7F7FC3C3C3FFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C37F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFA858FFA858
            FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3800000
            FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FC3C3C3FFFFFFFFFFFFC3C3C3C3C3C3C3
            C3C3FFFFFF7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            800000FFA858FFA858FFA858FFA858FFA858800000C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7FC3C3C3FFFFFFFFFFFF7F
            7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3FFA858800000800000800000FFA858C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7F7F7F7FC3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3}
          NumGlyphs = 2
          ParentFont = False
          OnClick = sbnDescricaonanfClick
        end
        object edtDescricaonanf: TDBEditTexto
          Left = 2
          Top = 10
          Width = 293
          Height = 23
          DataField = 'descricaonanf'
          DataSource = dtmCadastroProdutos.dsrCaracteristicas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = 50
          ParentFont = False
          TabOrder = 0
          OnKeyDown = edtDescricaonanfKeyDown
          CharCasenoDefault = False
          Alignment = taLeftJustify
        end
      end
      object gbxGTIN: TGroupBox
        Left = 595
        Top = 84
        Width = 355
        Height = 36
        Caption = ' GTIN - N'#186' GLOBAL DE ITEM COMERCIAL '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 8
        object edtGTIN: TDBEditTexto
          Left = 2
          Top = 10
          Width = 351
          Height = 23
          DataField = 'gtin'
          DataSource = dtmCadastroProdutos.dsrCaracteristicas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = -1
          ParentFont = False
          TabOrder = 0
          CharCasenoDefault = False
          Alignment = taLeftJustify
        end
      end
      object GroupBox1: TGroupBox
        Left = 332
        Top = 10
        Width = 101
        Height = 38
        Caption = 'C'#211'D. VISUAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 12
        object dtxCodigoVisual: TtecDBText
          Left = 2
          Top = 12
          Width = 95
          Height = 23
          TabStop = False
          Color = clBtnFace
          DataField = 'codigovisual'
          DataSource = dtmCadastroProdutos.dsrCaracteristicas
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
      object gbxDataCadastroCaracteristica: TGroupBox
        Left = 692
        Top = 48
        Width = 93
        Height = 37
        Caption = 'ATUALIZADO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 13
        object dtxDataAtualizacaoCaracteristica: TtecDBText
          Left = 2
          Top = 11
          Width = 87
          Height = 23
          TabStop = False
          Color = clBtnFace
          DataField = 'data'
          DataSource = dtmCadastroProdutos.dsrCaracteristicas
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
      object gbxDataCadastro: TGroupBox
        Left = 596
        Top = 48
        Width = 93
        Height = 37
        Caption = 'DATA CADASTRO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 14
        object dtxDataCadastroCaracteristica: TtecDBText
          Left = 2
          Top = 11
          Width = 87
          Height = 23
          TabStop = False
          Color = clBtnFace
          DataField = 'datacadastro'
          DataSource = dtmCadastroProdutos.dsrCaracteristicas
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
    end
    object pgcItensProdutoEstoque: TtecPageControl
      Left = 0
      Top = 458
      Width = 1011
      Height = 220
      ActivePage = tstItensProdutos
      Align = alClient
      TabOrder = 2
      OnChange = pgcItensProdutoEstoqueChange
      object tstItensProdutos: TTabSheet
        Caption = ' 10 - Itens do produto'
        object gbxItensProduto: TGroupBox
          Left = 949
          Top = 0
          Width = 35
          Height = 189
          Align = alLeft
          TabOrder = 0
          object sbnExcluirProduto: TSpeedButton
            Left = 6
            Top = 54
            Width = 23
            Height = 22
            Hint = 'Excluir Produto'
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
            OnClick = sbnExcluirProdutoClick
          end
          object sbnIncluirProduto: TSpeedButton
            Left = 6
            Top = 32
            Width = 23
            Height = 22
            Hint = 'Incluir Produto'
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
            OnClick = sbnIncluirProdutoClick
          end
          object sbnGerarLinhasColunas: TSpeedButton
            Left = 6
            Top = 10
            Width = 23
            Height = 22
            Hint = 'Gerar Linhas e Colunas'
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
            OnClick = sbnGerarLinhasColunasClick
          end
          object sbnVisualizarGrade: TSpeedButton
            Left = 6
            Top = 87
            Width = 23
            Height = 22
            Hint = 'Visualizar Grade'
            Caption = '#'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -19
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            NumGlyphs = 2
            ParentFont = False
            OnClick = sbnVisualizarGradeClick
          end
        end
        object dbgProdutos: TtecDBGrid
          Left = 0
          Top = 0
          Width = 949
          Height = 189
          Align = alLeft
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
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlack
          TitleFont.Height = -12
          TitleFont.Name = 'helvetica'
          TitleFont.Pitch = fpVariable
          TitleFont.Style = []
          OnDrawColumnCell = dbgProdutosDrawColumnCell
          OnDblClick = dbgProdutosDblClick
          OnKeyDown = dbgProdutosKeyDown
          OnTitleClick = dbgProdutosTitleClick
          RowWrap = 60
          Large = False
          DoubleRowColor = True
          MsgDelete = 'o ITEM DO PRODUTO'
          TitleMinHeight = 100
          CellHeights = 100
          StrippedRows = 2
          StrippedColor = 16120053
          CanDelete = False
          CanNotInsertFromGrid = False
          PostOnEnter = False
          PostOnSetUpDown = False
          DenySort = False
          DefaultRowHeight = 19
          ExibirNumerodaLinha = False
          NaoAtribuirDadosaTabelaaoDigitar = False
          Columns = <
            item
              Expanded = False
              FieldName = 'codigovisual'
              Title.Alignment = taCenter
              Title.Caption = 'C'#211'DIGO'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'helvetica'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Width = 190
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'descricao'
              Title.Alignment = taCenter
              Title.Caption = 'DESCRI'#199#195'O'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'helvetica'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Width = 290
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'valorgrade1'
              Title.Caption = 'LINHA'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'helvetica'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'valorgrade2'
              Title.Caption = 'COLUNA'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'helvetica'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'preco'
              Title.Alignment = taCenter
              Title.Caption = 'PRE'#199'O'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'helvetica'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'referencia'
              Title.Alignment = taCenter
              Title.Caption = 'REFER'#202'NCIA'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'helvetica'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Width = 120
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'codigorecolha'
              Title.Caption = 'C'#211'DIGO RECOLHA...'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'helvetica'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'datacadastro'
              Title.Alignment = taCenter
              Title.Caption = 'CADASTRO'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'helvetica'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'data'
              Title.Alignment = taCenter
              Title.Caption = 'ATUALIZADO'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'helvetica'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Width = 83
              Visible = True
            end>
        end
      end
      object tstEstoque: TTabSheet
        Caption = ' 11 - Estoque'
        ImageIndex = 1
        object sbnExcluirEstoque: TSpeedButton
          Left = 904
          Top = 43
          Width = 23
          Height = 22
          Hint = 'Excluir Estoque'
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
          OnClick = sbnExcluirEstoqueClick
        end
        object sbnIncluirEstoque: TSpeedButton
          Left = 904
          Top = 22
          Width = 23
          Height = 22
          Hint = 'Incluir Estoque'
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
          OnClick = sbnIncluirEstoqueClick
        end
        object dbgEstoque: TtecDBGrid
          Left = 0
          Top = 0
          Width = 254
          Height = 189
          Align = alLeft
          DataSource = dtmCadastroProdutos.dsrEstoques
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlack
          TitleFont.Height = -12
          TitleFont.Name = 'helvetica'
          TitleFont.Pitch = fpVariable
          TitleFont.Style = []
          OnDblClick = dbgEstoqueDblClick
          OnKeyDown = dbgEstoqueKeyDown
          RowWrap = 60
          Large = False
          DoubleRowColor = True
          MsgDelete = 'o PRODUTO DA FILIAL'
          TitleMinHeight = 100
          CellHeights = 100
          StrippedColor = 16054260
          CanDelete = False
          CanNotInsertFromGrid = False
          PostOnEnter = False
          PostOnSetUpDown = False
          DenySort = False
          DefaultRowHeight = 19
          ExibirNumerodaLinha = False
          NaoAtribuirDadosaTabelaaoDigitar = False
          Columns = <
            item
              Expanded = False
              FieldName = 'filial'
              Title.Alignment = taCenter
              Title.Caption = 'FILIAL'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'helvetica'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'descricaofilial'
              Title.Alignment = taCenter
              Title.Caption = 'NOME DA FILIAL'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'helvetica'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Width = 172
              Visible = True
            end>
        end
        object dbgProdutos2: TtecDBGrid
          Left = 254
          Top = 0
          Width = 648
          Height = 189
          Align = alLeft
          DataSource = dtmCadastroProdutos.dsrProdutos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgCancelOnExit]
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlack
          TitleFont.Height = -12
          TitleFont.Name = 'helvetica'
          TitleFont.Pitch = fpVariable
          TitleFont.Style = []
          RowWrap = 60
          Large = False
          DoubleRowColor = True
          TitleMinHeight = 100
          CellHeights = 100
          StrippedColor = 16054260
          CanDelete = False
          CanNotInsertFromGrid = False
          PostOnEnter = False
          PostOnSetUpDown = False
          DenySort = False
          DefaultRowHeight = 19
          ExibirNumerodaLinha = False
          NaoAtribuirDadosaTabelaaoDigitar = False
          Columns = <
            item
              Expanded = False
              FieldName = 'codigovisual'
              Title.Alignment = taCenter
              Title.Caption = 'C'#211'DIGO'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'helvetica'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Width = 163
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'descricao'
              Title.Alignment = taCenter
              Title.Caption = 'DESCRI'#199#195'O'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'helvetica'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Width = 294
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'valorgrade1'
              Title.Caption = 'LINHA'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'helvetica'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'valorgrade2'
              Title.Caption = 'COLUNA'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'helvetica'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Visible = True
            end>
        end
      end
      object tstAgendamento: TTabSheet
        Caption = '12 - Agendamento'
        ImageIndex = 8
        object dbgProdutoAgendamento: TtecDBGrid
          Left = 0
          Top = 0
          Width = 229
          Height = 189
          Align = alLeft
          DataSource = dtmCadastroProdutos.dsrProdutos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgCancelOnExit]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlack
          TitleFont.Height = -12
          TitleFont.Name = 'helvetica'
          TitleFont.Pitch = fpVariable
          TitleFont.Style = []
          RowWrap = 60
          Large = False
          DoubleRowColor = True
          TitleMinHeight = 100
          CellHeights = 100
          StrippedColor = 16054260
          CanDelete = False
          CanNotInsertFromGrid = False
          PostOnEnter = False
          PostOnSetUpDown = False
          DenySort = False
          DefaultRowHeight = 19
          ExibirNumerodaLinha = False
          NaoAtribuirDadosaTabelaaoDigitar = False
          Columns = <
            item
              Expanded = False
              FieldName = 'codigovisual'
              Title.Alignment = taCenter
              Title.Caption = 'C'#211'DIGO'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'helvetica'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Width = 190
              Visible = True
            end>
        end
        object dbgAgendamentoProdutos: TtecDBGrid
          Left = 229
          Top = 0
          Width = 745
          Height = 189
          Align = alClient
          DataSource = dtmCadastroProdutos.dsrProdutosAgendamentos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgCancelOnExit]
          ParentFont = False
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlack
          TitleFont.Height = -12
          TitleFont.Name = 'helvetica'
          TitleFont.Pitch = fpVariable
          TitleFont.Style = []
          RowWrap = 60
          Large = False
          DoubleRowColor = True
          TitleMinHeight = 100
          CellHeights = 100
          StrippedColor = 16054260
          CanDelete = True
          CanNotInsertFromGrid = False
          PostOnEnter = True
          PostOnSetUpDown = True
          DenySort = False
          DefaultRowHeight = 19
          ExibirNumerodaLinha = False
          NaoAtribuirDadosaTabelaaoDigitar = False
          Columns = <
            item
              Expanded = False
              FieldName = 'dias'
              Title.Alignment = taCenter
              Title.Caption = 'DIAS'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'helvetica'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Width = 38
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'observacoes'
              Title.Alignment = taCenter
              Title.Caption = 'OBSERVA'#199#213'ES'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'helvetica'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Width = 654
              Visible = True
            end>
        end
        object pnlProdutosAgendamentosBotoes: TPanel
          Left = 974
          Top = 0
          Width = 29
          Height = 189
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 2
          object sbnExcluirProdutosAgendamentos: TSpeedButton
            Left = 2
            Top = 21
            Width = 23
            Height = 22
            Hint = 'Excluir produto'
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
            OnClick = sbnExcluirProdutosAgendamentosClick
          end
        end
      end
      object tstProdutosCodigoBarras: TTabSheet
        Caption = ' 13 - C'#243'digo de barras'
        ImageIndex = 2
        object sbnIncluirCodigoBarras: TSpeedButton
          Left = 910
          Top = 17
          Width = 23
          Height = 22
          Hint = 'Incluir C'#243'digo Barras'
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
          OnClick = sbnIncluirCodigoBarrasClick
        end
        object sbnExcluirCodigoBarras: TSpeedButton
          Left = 910
          Top = 38
          Width = 23
          Height = 22
          Hint = 'Excluir C'#243'digo Barras'
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
          OnClick = sbnExcluirCodigoBarrasClick
        end
        object dbgProdutos3: TtecDBGrid
          Left = 0
          Top = 0
          Width = 676
          Height = 189
          Align = alLeft
          DataSource = dtmCadastroProdutos.dsrProdutos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgCancelOnExit]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlack
          TitleFont.Height = -12
          TitleFont.Name = 'helvetica'
          TitleFont.Pitch = fpVariable
          TitleFont.Style = []
          RowWrap = 60
          Large = False
          DoubleRowColor = True
          TitleMinHeight = 100
          CellHeights = 100
          StrippedColor = 16054260
          CanDelete = False
          CanNotInsertFromGrid = False
          PostOnEnter = False
          PostOnSetUpDown = False
          DenySort = False
          DefaultRowHeight = 19
          ExibirNumerodaLinha = False
          NaoAtribuirDadosaTabelaaoDigitar = False
          Columns = <
            item
              Expanded = False
              FieldName = 'codigovisual'
              Title.Alignment = taCenter
              Title.Caption = 'C'#211'DIGO'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'helvetica'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Width = 190
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'descricao'
              Title.Alignment = taCenter
              Title.Caption = 'DESCRI'#199#195'O'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'helvetica'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Width = 294
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'valorgrade1'
              Title.Alignment = taCenter
              Title.Caption = 'LINHA'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'helvetica'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'valorgrade2'
              Title.Alignment = taCenter
              Title.Caption = 'COLUNA'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'helvetica'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Visible = True
            end>
        end
        object dbgProdutosCodigoBarras: TtecDBGrid
          Left = 676
          Top = 0
          Width = 232
          Height = 189
          Align = alLeft
          DataSource = dtmCadastroProdutos.dsrCodigoBarrasProduto
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlack
          TitleFont.Height = -12
          TitleFont.Name = 'helvetica'
          TitleFont.Pitch = fpVariable
          TitleFont.Style = []
          OnDblClick = dbgProdutosCodigoBarrasDblClick
          OnKeyDown = dbgProdutosCodigoBarrasKeyDown
          RowWrap = 60
          Large = False
          DoubleRowColor = True
          MsgDelete = 'o C'#211'DIGO DE BARRAS'
          TitleMinHeight = 100
          CellHeights = 100
          StrippedColor = 16054260
          CanDelete = False
          CanNotInsertFromGrid = False
          PostOnEnter = False
          PostOnSetUpDown = False
          DenySort = False
          DefaultRowHeight = 19
          ExibirNumerodaLinha = False
          NaoAtribuirDadosaTabelaaoDigitar = False
          Columns = <
            item
              Expanded = False
              FieldName = 'codigobarras'
              Title.Caption = 'C'#211'DIGO DE BARRAS'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'helvetica'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Visible = True
            end>
        end
      end
      object tstClientes: TTabSheet
        Caption = ' 14 - Clientes'
        ImageIndex = 4
        object sbnIncluirClienteProduto: TSpeedButton
          Left = 760
          Top = 24
          Width = 22
          Height = 22
          Hint = 'Incluir Estoque'
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
          OnClick = sbnIncluirClienteProdutoClick
        end
        object sbnExcluirClienteProduto: TSpeedButton
          Left = 759
          Top = 45
          Width = 23
          Height = 22
          Hint = 'Excluir Estoque'
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
          OnClick = sbnExcluirClienteProdutoClick
        end
        object dbgProdutosClientes: TtecDBGrid
          Left = 0
          Top = 0
          Width = 175
          Height = 189
          Align = alLeft
          DataSource = dtmCadastroProdutos.dsrProdutos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgCancelOnExit]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlack
          TitleFont.Height = -12
          TitleFont.Name = 'helvetica'
          TitleFont.Pitch = fpVariable
          TitleFont.Style = []
          RowWrap = 60
          Large = False
          DoubleRowColor = True
          TitleMinHeight = 100
          CellHeights = 100
          StrippedColor = 16054260
          CanDelete = False
          CanNotInsertFromGrid = False
          PostOnEnter = False
          PostOnSetUpDown = False
          DenySort = False
          DefaultRowHeight = 19
          ExibirNumerodaLinha = False
          NaoAtribuirDadosaTabelaaoDigitar = False
          Columns = <
            item
              Expanded = False
              FieldName = 'codigovisual'
              Title.Alignment = taCenter
              Title.Caption = 'C'#211'DIGO'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'helvetica'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Width = 135
              Visible = True
            end>
        end
        object dbgClientesProdutos: TtecDBGrid
          Left = 175
          Top = 0
          Width = 581
          Height = 189
          Align = alLeft
          DataSource = dtmCadastroProdutos.dsrClientesProdutos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlack
          TitleFont.Height = -12
          TitleFont.Name = 'helvetica'
          TitleFont.Pitch = fpVariable
          TitleFont.Style = []
          OnDblClick = dbgClientesProdutosDblClick
          OnKeyDown = dbgClientesProdutosKeyDown
          RowWrap = 60
          Large = False
          DoubleRowColor = True
          MsgDelete = 'a rela'#231#227'o PROUTO/CLIENTE'
          TitleMinHeight = 100
          CellHeights = 100
          StrippedColor = 16054260
          CanDelete = False
          CanNotInsertFromGrid = False
          PostOnEnter = False
          PostOnSetUpDown = False
          DenySort = False
          DefaultRowHeight = 19
          ExibirNumerodaLinha = False
          NaoAtribuirDadosaTabelaaoDigitar = False
          Columns = <
            item
              Expanded = False
              FieldName = 'produto_cliente'
              Title.Alignment = taCenter
              Title.Caption = 'PRODUTO NO CLIENTE'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'helvetica'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'cliente'
              Title.Alignment = taCenter
              Title.Caption = 'CLIENTE'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'helvetica'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'nome'
              Title.Alignment = taCenter
              Title.Caption = 'NOME OU RAZ'#195'O SOCIAL'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'helvetica'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Width = 315
              Visible = True
            end>
        end
      end
      object tstProdutosFornecedores: TTabSheet
        Caption = '15 - Fornecedores'
        ImageIndex = 5
        object pgcProdutos_Unidades_Fornecedores: TPageControl
          Left = 0
          Top = 0
          Width = 1003
          Height = 189
          ActivePage = tstProdutosNoFornecedor
          Align = alClient
          TabOrder = 0
          OnChange = pgcProdutos_Unidades_FornecedoresChange
          object tstProdutosNoFornecedor: TTabSheet
            Caption = 'Produtos'
            object dbgProdutosFornecedores: TtecDBGrid
              Left = 0
              Top = 0
              Width = 966
              Height = 158
              Align = alClient
              DataSource = dtmCadastroProdutos.dsrProdutosFornecedores
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clBlack
              TitleFont.Height = -9
              TitleFont.Name = 'helvetica'
              TitleFont.Pitch = fpVariable
              TitleFont.Style = []
              OnDblClick = dbgProdutosFornecedoresDblClick
              OnKeyDown = dbgProdutosFornecedoresKeyDown
              RowWrap = 60
              Large = False
              DoubleRowColor = False
              TitleMinHeight = 100
              CellHeights = 100
              StrippedColor = 16054260
              CanDelete = True
              CanNotInsertFromGrid = False
              PostOnEnter = False
              PostOnSetUpDown = False
              DenySort = False
              DefaultRowHeight = 19
              ExibirNumerodaLinha = False
              NaoAtribuirDadosaTabelaaoDigitar = False
              Columns = <
                item
                  Expanded = False
                  FieldName = 'produtovisual'
                  Title.Caption = 'PRODUTO'
                  Width = 180
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'fornecedor'
                  ReadOnly = True
                  Title.Caption = 'FORNEC.'
                  Width = 45
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'tipofornecedor'
                  ReadOnly = True
                  Title.Caption = 'T'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'nomefornecedor'
                  ReadOnly = True
                  Title.Caption = 'NOME DO FORNECEDOR'
                  Width = 150
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'produtonofornecedor'
                  ReadOnly = True
                  Title.Caption = 'PRODUTO NO FORNECEDOR'
                  Width = 200
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'descricaonofornecedor'
                  ReadOnly = True
                  Title.Caption = 'DESCRI'#199#195'O NO FORNECEDOR'
                  Width = 235
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'data'
                  ReadOnly = True
                  Title.Alignment = taCenter
                  Title.Caption = 'DATA'
                  Width = 100
                  Visible = True
                end>
            end
            object pnlProdutosFornecedoresBotoes: TPanel
              Left = 966
              Top = 0
              Width = 29
              Height = 158
              Align = alRight
              BevelOuter = bvNone
              TabOrder = 1
              object sbnExcluirProdutosFornecedores: TSpeedButton
                Left = 2
                Top = 21
                Width = 23
                Height = 22
                Hint = 'Excluir produto'
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
                OnClick = sbnExcluirProdutosFornecedoresClick
              end
            end
          end
          object tstProdutosFornecedoresUnidades: TTabSheet
            Caption = 'Unidades'
            ImageIndex = 1
            object dbgProdutosFornecedoresUnidades: TtecDBGrid
              Left = 0
              Top = 0
              Width = 966
              Height = 158
              Align = alClient
              DataSource = dtmCadastroProdutos.dsrProdutosFornecedoresUndades
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clBlack
              TitleFont.Height = -9
              TitleFont.Name = 'helvetica'
              TitleFont.Pitch = fpVariable
              TitleFont.Style = []
              OnDblClick = dbgProdutosFornecedoresUnidadesDblClick
              OnKeyDown = dbgProdutosFornecedoresUnidadesKeyDown
              RowWrap = 60
              Large = False
              DoubleRowColor = False
              TitleMinHeight = 100
              CellHeights = 100
              StrippedColor = 16054260
              CanDelete = True
              CanNotInsertFromGrid = False
              PostOnEnter = False
              PostOnSetUpDown = False
              DenySort = False
              DefaultRowHeight = 19
              ExibirNumerodaLinha = False
              NaoAtribuirDadosaTabelaaoDigitar = False
              Columns = <
                item
                  Expanded = False
                  FieldName = 'produtovisual'
                  ReadOnly = True
                  Width = 180
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'fornecedor'
                  Title.Caption = 'FORNEC.'
                  Width = 45
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'tipofornecedor'
                  Title.Caption = 'T'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'nomefornecedor'
                  ReadOnly = True
                  Width = 197
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'unidade'
                  Width = 54
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'descricaounidade'
                  ReadOnly = True
                  Width = 125
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'fatorconversao'
                  Title.Caption = 'FATOR DE CONVERS'#195'O'
                  Visible = True
                end>
            end
            object Panel4: TPanel
              Left = 966
              Top = 0
              Width = 29
              Height = 158
              Align = alRight
              BevelOuter = bvNone
              TabOrder = 1
              object btnExcluirProdutosFornecedoresUnidades: TSpeedButton
                Left = 2
                Top = 34
                Width = 23
                Height = 22
                Hint = 'Excluir produto'
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
                OnClick = btnExcluirProdutosFornecedoresUnidadesClick
              end
              object btnIncluirProdutosFornecedoresUnidades: TSpeedButton
                Left = 2
                Top = 8
                Width = 23
                Height = 22
                Hint = 'Incluir Produto'
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
                OnClick = btnIncluirProdutosFornecedoresUnidadesClick
              end
            end
          end
        end
      end
      object tstComposicao: TTabSheet
        Caption = ' 16 - Composi'#231#227'o'
        ImageIndex = 3
        object DBGridProdutosComponentes: TtecDBGrid
          Left = 209
          Top = 0
          Width = 717
          Height = 121
          DataSource = dtmCadastroProdutos.dsrProdutoComposto
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlack
          TitleFont.Height = -12
          TitleFont.Name = 'helvetica'
          TitleFont.Pitch = fpVariable
          TitleFont.Style = []
          OnDblClick = DBGridProdutosComponentesDblClick
          OnKeyDown = DBGridProdutosComponentesKeyDown
          RowWrap = 60
          Large = False
          DoubleRowColor = True
          MsgDelete = 'o PRODUTO COMPOSTO'
          TitleMinHeight = 100
          CellHeights = 100
          StrippedColor = 16054260
          CanDelete = True
          CanNotInsertFromGrid = False
          PostOnEnter = False
          PostOnSetUpDown = False
          DenySort = False
          DefaultRowHeight = 19
          ExibirNumerodaLinha = False
          NaoAtribuirDadosaTabelaaoDigitar = False
          Columns = <
            item
              Expanded = False
              FieldName = 'ordem'
              Title.Alignment = taCenter
              Title.Caption = 'N'#176
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'helvetica'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Width = 23
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'componentevisual'
              Title.Alignment = taCenter
              Title.Caption = 'PRODUTO'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'helvetica'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Width = 137
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'descricao'
              Title.Alignment = taCenter
              Title.Caption = 'DESCRI'#199#195'O'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'helvetica'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Width = 212
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'unidade'
              Title.Alignment = taCenter
              Title.Caption = 'UNIDADE'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'helvetica'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'quantidade'
              Title.Alignment = taCenter
              Title.Caption = 'QTDE'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'helvetica'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Width = 77
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'preco'
              Title.Alignment = taCenter
              Title.Caption = 'PRE'#199'O'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'helvetica'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'total'
              Title.Alignment = taCenter
              Title.Caption = 'TOTAL'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'helvetica'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Visible = True
            end>
        end
        object DBGridProdutos_Servicos: TtecDBGrid
          Left = 209
          Top = 120
          Width = 717
          Height = 68
          Align = alCustom
          DataSource = dtmCadastroProdutos.dsrProdutos_Servicos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = []
          Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          TabOrder = 2
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlack
          TitleFont.Height = -12
          TitleFont.Name = 'helvetica'
          TitleFont.Pitch = fpVariable
          TitleFont.Style = []
          OnDblClick = DBGridProdutos_ServicosDblClick
          OnKeyDown = DBGridProdutos_ServicosKeyDown
          RowWrap = 60
          Large = False
          DoubleRowColor = True
          MsgDelete = 'o SERVI'#199'O DO PRODUTO'
          TitleMinHeight = 100
          CellHeights = 100
          StrippedColor = 16054260
          CanDelete = True
          CanNotInsertFromGrid = False
          PostOnEnter = True
          PostOnSetUpDown = False
          DenySort = False
          DefaultRowHeight = 19
          ExibirNumerodaLinha = False
          NaoAtribuirDadosaTabelaaoDigitar = False
          Columns = <
            item
              Expanded = False
              FieldName = 'servico'
              Title.Alignment = taCenter
              Title.Caption = 'SERVI'#199'O'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'helvetica'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Width = 51
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'descricao'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'DESCRI'#199#195'O'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'helvetica'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Width = 384
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'quantidade'
              Title.Alignment = taCenter
              Title.Caption = 'QTDE'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'helvetica'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Width = 77
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'preco'
              Title.Alignment = taCenter
              Title.Caption = 'PRE'#199'O'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'helvetica'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'total'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'TOTAL'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'helvetica'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Visible = True
            end>
        end
        object pnlControles: TPanel
          Left = 920
          Top = 0
          Width = 83
          Height = 189
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 0
          object sbnDeslocarRegistroParaBaixo: TSpeedButton
            Left = 8
            Top = 79
            Width = 18
            Height = 21
            Hint = 'Alt+Down Deslocar registro para baixo'
            Glyph.Data = {
              2E0A0000424D2E0A00000000000036000000280000001D0000001D0000000100
              180000000000F8090000120B0000120B00000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000007F7F7F0000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000
              0000FFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF00000000000000FFFFFF7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7FFFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7FFFFFFF00000000000000FFFFFF7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFF7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              FFFFFF00000000000000FFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF0000000000
              0000FFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF00000000000000FFFFFF7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7FFFFFFF00000000000000FFFFFF7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              FFFFFF00000000000000FFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF0000000000
              0000FFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF00000000000000FFFFFF7F7F7F
              7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F
              7F7F7F7F7F7F7F7FFFFFFF00000000000000FFFFFF7F7F7F7F7F7F7F7F7FFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7F7F7F7F
              FFFFFF00000000000000FFFFFF7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFFFFFF0000000000
              0000FFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF00000000000000FFFFFF7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7FFFFFFF00000000000000FFFFFF7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              FFFFFF00000000000000FFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF0000000000
              0000FFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF00000000000000FFFFFF7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7FFFFFFF00000000000000FFFFFF7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              FFFFFF00000000000000FFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF0000000000
              0000FFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF00000000000000FFFFFF7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7FFFFFFF00000000000000FFFFFF7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              FFFFFF00000000000000FFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF0000000000
              0000FFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF00000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFF7F7F7F00000000}
            OnClick = sbnDeslocarRegistroParaBaixoClick
          end
          object sbnDeslocarParaCima: TSpeedButton
            Left = 8
            Top = 55
            Width = 18
            Height = 20
            Hint = 'Alt+Up Deslocar registro para cima'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Glyph.Data = {
              2E0A0000424D2E0A00000000000036000000280000001D0000001D0000000100
              180000000000F8090000120B0000120B00000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000007F7F7F0000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000
              0000FFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF00000000000000FFFFFF7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7FFFFFFF00000000000000FFFFFF7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              FFFFFF00000000000000FFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF0000000000
              0000FFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF00000000000000FFFFFF7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7FFFFFFF00000000000000FFFFFF7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              FFFFFF00000000000000FFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF0000000000
              0000FFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF00000000000000FFFFFF7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7FFFFFFF00000000000000FFFFFF7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              FFFFFF00000000000000FFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF0000000000
              0000FFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF00000000000000FFFFFF7F7F7F
              7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFF7F7F7F7F7F7FFFFFFF00000000000000FFFFFF7F7F7F7F7F7F7F7F7FFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7F7F7F7F
              FFFFFF00000000000000FFFFFF7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF0000000000
              0000FFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF00000000000000FFFFFF7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7FFFFFFF00000000000000FFFFFF7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              FFFFFF00000000000000FFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF0000000000
              0000FFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF00000000000000FFFFFF7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7FFFFFFF00000000000000FFFFFF7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFF7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              FFFFFF00000000000000FFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF0000000000
              0000FFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF00000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFF7F7F7F00000000}
            ParentFont = False
            OnClick = sbnDeslocarParaCimaClick
          end
          object sbnExcluirProdutoComposto: TSpeedButton
            Left = 5
            Top = 29
            Width = 23
            Height = 22
            Hint = 'Excluir produto ou servi'#231'o'
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
            OnClick = sbnExcluirProdutoCompostoClick
          end
          object sbnIncluirProdutoComposto: TSpeedButton
            Left = 5
            Top = 8
            Width = 23
            Height = 22
            Hint = 'Incluir produto ou servi'#231'o'
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
            OnClick = sbnIncluirProdutoCompostoClick
          end
          object gbxTotalComposto: TGroupBox
            Left = 0
            Top = 156
            Width = 83
            Height = 33
            Align = alBottom
            Caption = 'PRE'#199'O TOTAL'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object dtxtotalcomponentes: TDBEditNumero
              Left = 3
              Top = 10
              Width = 83
              Height = 22
              TabStop = False
              Color = clBtnFace
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              MaxLength = -1
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              Mascara = True
              Alignment = taLeftJustify
              TipoMascara = tmGERAL
              NrDecimal = 2
              Decimais = True
              Negativo = False
              Tamanho = 9
              DataField = 'totalcomponentes'
              DataSource = dtmCadastroProdutos.dsrProdutos
            end
          end
        end
        object pnlLeftComposicao: TPanel
          Left = 0
          Top = 0
          Width = 209
          Height = 189
          Align = alLeft
          TabOrder = 3
          object DBGridProdutosCompostos: TtecDBGrid
            Left = 1
            Top = 1
            Width = 209
            Height = 187
            Align = alLeft
            DataSource = dtmCadastroProdutos.dsrProdutos
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Pitch = fpVariable
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgCancelOnExit]
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clBlack
            TitleFont.Height = -12
            TitleFont.Name = 'helvetica'
            TitleFont.Pitch = fpVariable
            TitleFont.Style = []
            RowWrap = 60
            Large = False
            DoubleRowColor = True
            TitleMinHeight = 100
            CellHeights = 100
            StrippedColor = 16054260
            CanDelete = False
            CanNotInsertFromGrid = False
            PostOnEnter = False
            PostOnSetUpDown = False
            DenySort = False
            DefaultRowHeight = 19
            ExibirNumerodaLinha = False
            NaoAtribuirDadosaTabelaaoDigitar = False
            Columns = <
              item
                Expanded = False
                FieldName = 'codigovisual'
                Title.Alignment = taCenter
                Title.Caption = 'C'#211'DIGO'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 172
                Visible = True
              end>
          end
        end
      end
      object tstFios: TTabSheet
        Caption = ' 17 - Fios'
        ImageIndex = 5
        object DBGridProdutosFios: TtecDBGrid
          Left = 229
          Top = 0
          Width = 745
          Height = 189
          Align = alClient
          DataSource = dtmCadastroProdutos.dsrProdutoCompostoFios
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlack
          TitleFont.Height = -12
          TitleFont.Name = 'helvetica'
          TitleFont.Pitch = fpVariable
          TitleFont.Style = []
          OnDblClick = DBGridProdutosFiosDblClick
          OnKeyDown = DBGridProdutosFiosKeyDown
          RowWrap = 60
          Large = False
          DoubleRowColor = True
          MsgDelete = 'o PRODUTO COMPOSTO'
          TitleMinHeight = 100
          CellHeights = 100
          StrippedColor = 16054260
          CanDelete = True
          CanNotInsertFromGrid = False
          PostOnEnter = False
          PostOnSetUpDown = False
          DenySort = False
          DefaultRowHeight = 19
          ExibirNumerodaLinha = False
          NaoAtribuirDadosaTabelaaoDigitar = False
          Columns = <
            item
              Expanded = False
              FieldName = 'ordem'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'N'#176'.'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'helvetica'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'componente'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'C'#211'DIGO'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'helvetica'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Width = 190
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'bitola'
              Title.Alignment = taCenter
              Title.Caption = 'BITOLA'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'helvetica'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Width = 48
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'liga'
              Title.Alignment = taCenter
              Title.Caption = 'LIGA'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'helvetica'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Width = 45
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'nrvoltas'
              Title.Alignment = taCenter
              Title.Caption = 'VOLTAS'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'helvetica'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Width = 45
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'gramasporpeca'
              Title.Alignment = taCenter
              Title.Caption = 'QTD (g / pe'#231'a)'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'helvetica'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'resistividade'
              Title.Alignment = taCenter
              Title.Caption = 'OHMs / m'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'helvetica'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Width = 68
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'Tolerancia'
              Title.Alignment = taCenter
              Title.Caption = 'TOL %'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'helvetica'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Width = 45
              Visible = True
            end>
        end
        object Panel2: TPanel
          Left = 974
          Top = 0
          Width = 29
          Height = 189
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 1
          object sbnIncluirProdutoFioseFitas: TSpeedButton
            Left = 3
            Top = 0
            Width = 23
            Height = 22
            Hint = 'Incluir produto'
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
            Visible = False
            OnClick = sbnIncluirProdutoFioseFitasClick
          end
          object sbnExcluirProdutoFioseFitas: TSpeedButton
            Left = 3
            Top = 21
            Width = 23
            Height = 22
            Hint = 'Excluir produto'
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
            OnClick = sbnExcluirProdutoFioseFitasClick
          end
          object sbnDeslocarFioParaCima: TSpeedButton
            Left = 3
            Top = 52
            Width = 23
            Height = 23
            Hint = 'Alt+Up Deslocar registro para cima'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Glyph.Data = {
              2E0A0000424D2E0A00000000000036000000280000001D0000001D0000000100
              180000000000F8090000120B0000120B00000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000007F7F7F0000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000
              0000FFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF00000000000000FFFFFF7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7FFFFFFF00000000000000FFFFFF7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              FFFFFF00000000000000FFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF0000000000
              0000FFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF00000000000000FFFFFF7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7FFFFFFF00000000000000FFFFFF7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              FFFFFF00000000000000FFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF0000000000
              0000FFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF00000000000000FFFFFF7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7FFFFFFF00000000000000FFFFFF7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              FFFFFF00000000000000FFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF0000000000
              0000FFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF00000000000000FFFFFF7F7F7F
              7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFF7F7F7F7F7F7FFFFFFF00000000000000FFFFFF7F7F7F7F7F7F7F7F7FFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7F7F7F7F
              FFFFFF00000000000000FFFFFF7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF0000000000
              0000FFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF00000000000000FFFFFF7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7FFFFFFF00000000000000FFFFFF7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              FFFFFF00000000000000FFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF0000000000
              0000FFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF00000000000000FFFFFF7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7FFFFFFF00000000000000FFFFFF7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFF7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              FFFFFF00000000000000FFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF0000000000
              0000FFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF00000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFF7F7F7F00000000}
            ParentFont = False
            OnClick = sbnDeslocarFioParaCimaClick
          end
          object sbnDeslocarFioParaBaixo: TSpeedButton
            Left = 3
            Top = 79
            Width = 23
            Height = 23
            Hint = 'Alt+Down Deslocar registro para baixo'
            Glyph.Data = {
              2E0A0000424D2E0A00000000000036000000280000001D0000001D0000000100
              180000000000F8090000120B0000120B00000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000007F7F7F0000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000
              0000FFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF00000000000000FFFFFF7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7FFFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7FFFFFFF00000000000000FFFFFF7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFF7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              FFFFFF00000000000000FFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF0000000000
              0000FFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF00000000000000FFFFFF7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7FFFFFFF00000000000000FFFFFF7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              FFFFFF00000000000000FFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF0000000000
              0000FFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF00000000000000FFFFFF7F7F7F
              7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F
              7F7F7F7F7F7F7F7FFFFFFF00000000000000FFFFFF7F7F7F7F7F7F7F7F7FFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7F7F7F7F
              FFFFFF00000000000000FFFFFF7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFFFFFF0000000000
              0000FFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF00000000000000FFFFFF7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7FFFFFFF00000000000000FFFFFF7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              FFFFFF00000000000000FFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF0000000000
              0000FFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF00000000000000FFFFFF7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7FFFFFFF00000000000000FFFFFF7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              FFFFFF00000000000000FFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF0000000000
              0000FFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF00000000000000FFFFFF7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7FFFFFFF00000000000000FFFFFF7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              FFFFFF00000000000000FFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF0000000000
              0000FFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF00000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFF7F7F7F00000000}
            OnClick = sbnDeslocarFioParaBaixoClick
          end
        end
        object dbgProdutosFioseFitas: TtecDBGrid
          Left = 0
          Top = 0
          Width = 229
          Height = 189
          Align = alLeft
          DataSource = dtmCadastroProdutos.dsrProdutos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgCancelOnExit]
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlack
          TitleFont.Height = -12
          TitleFont.Name = 'helvetica'
          TitleFont.Pitch = fpVariable
          TitleFont.Style = []
          RowWrap = 60
          Large = False
          DoubleRowColor = True
          TitleMinHeight = 100
          CellHeights = 100
          StrippedColor = 16054260
          CanDelete = False
          CanNotInsertFromGrid = False
          PostOnEnter = False
          PostOnSetUpDown = False
          DenySort = False
          DefaultRowHeight = 19
          ExibirNumerodaLinha = False
          NaoAtribuirDadosaTabelaaoDigitar = False
          Columns = <
            item
              Expanded = False
              FieldName = 'codigovisual'
              Title.Alignment = taCenter
              Title.Caption = 'C'#211'DIGO'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'helvetica'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Width = 190
              Visible = True
            end>
        end
      end
      object tstFitas: TTabSheet
        Caption = ' 18 - Fitas'
        ImageIndex = 6
        object tecDBGrid1: TtecDBGrid
          Left = 0
          Top = 0
          Width = 229
          Height = 189
          Align = alLeft
          DataSource = dtmCadastroProdutos.dsrProdutos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgCancelOnExit]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlack
          TitleFont.Height = -12
          TitleFont.Name = 'helvetica'
          TitleFont.Pitch = fpVariable
          TitleFont.Style = []
          RowWrap = 60
          Large = False
          DoubleRowColor = True
          TitleMinHeight = 100
          CellHeights = 100
          StrippedColor = 16054260
          CanDelete = False
          CanNotInsertFromGrid = False
          PostOnEnter = False
          PostOnSetUpDown = False
          DenySort = False
          DefaultRowHeight = 19
          ExibirNumerodaLinha = False
          NaoAtribuirDadosaTabelaaoDigitar = False
          Columns = <
            item
              Expanded = False
              FieldName = 'codigovisual'
              Title.Alignment = taCenter
              Title.Caption = 'C'#211'DIGO'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'helvetica'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Width = 190
              Visible = True
            end>
        end
        object DBGridProdutosFitas: TtecDBGrid
          Left = 229
          Top = 0
          Width = 745
          Height = 189
          Align = alClient
          DataSource = dtmCadastroProdutos.dsrProdutoCompostoFitas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlack
          TitleFont.Height = -12
          TitleFont.Name = 'helvetica'
          TitleFont.Pitch = fpVariable
          TitleFont.Style = []
          OnDblClick = DBGridProdutosFitasDblClick
          OnKeyDown = DBGridProdutosFitasKeyDown
          RowWrap = 60
          Large = False
          DoubleRowColor = True
          MsgDelete = 'o PRODUTO COMPOSTO'
          TitleMinHeight = 100
          CellHeights = 100
          StrippedColor = 16054260
          CanDelete = True
          CanNotInsertFromGrid = False
          PostOnEnter = False
          PostOnSetUpDown = False
          DenySort = False
          DefaultRowHeight = 19
          ExibirNumerodaLinha = False
          NaoAtribuirDadosaTabelaaoDigitar = False
          Columns = <
            item
              Expanded = False
              FieldName = 'ordem'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'N'#176'.'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'helvetica'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'componente'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'C'#211'DIGO'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'helvetica'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Width = 190
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'espessura'
              Title.Alignment = taCenter
              Title.Caption = 'ESPESSURA'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'helvetica'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Width = 70
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'largura'
              Title.Alignment = taCenter
              Title.Caption = 'LARGURA'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'helvetica'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'liga'
              Title.Alignment = taCenter
              Title.Caption = 'LIGA'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'helvetica'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Width = 45
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'nrvoltas'
              Title.Alignment = taCenter
              Title.Caption = 'VOLTAS'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'helvetica'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Width = 45
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'gramasporpeca'
              Title.Caption = 'QTD (g / pe'#231'a)'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'helvetica'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Visible = True
            end>
        end
        object Panel3: TPanel
          Left = 974
          Top = 0
          Width = 29
          Height = 189
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 2
          object SpeedButton1: TSpeedButton
            Left = 3
            Top = 0
            Width = 23
            Height = 22
            Hint = 'Incluir produto'
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
            Visible = False
            OnClick = SpeedButton1Click
          end
          object SpeedButton2: TSpeedButton
            Left = 3
            Top = 21
            Width = 23
            Height = 22
            Hint = 'Excluir produto'
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
            OnClick = SpeedButton2Click
          end
          object sbnDeslocarFitaParaCima: TSpeedButton
            Left = 3
            Top = 53
            Width = 23
            Height = 23
            Hint = 'Alt+Up Deslocar registro para cima'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Glyph.Data = {
              2E0A0000424D2E0A00000000000036000000280000001D0000001D0000000100
              180000000000F8090000120B0000120B00000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000007F7F7F0000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000
              0000FFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF00000000000000FFFFFF7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7FFFFFFF00000000000000FFFFFF7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              FFFFFF00000000000000FFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF0000000000
              0000FFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF00000000000000FFFFFF7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7FFFFFFF00000000000000FFFFFF7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              FFFFFF00000000000000FFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF0000000000
              0000FFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF00000000000000FFFFFF7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7FFFFFFF00000000000000FFFFFF7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              FFFFFF00000000000000FFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF0000000000
              0000FFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF00000000000000FFFFFF7F7F7F
              7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFF7F7F7F7F7F7FFFFFFF00000000000000FFFFFF7F7F7F7F7F7F7F7F7FFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7F7F7F7F
              FFFFFF00000000000000FFFFFF7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF0000000000
              0000FFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF00000000000000FFFFFF7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7FFFFFFF00000000000000FFFFFF7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              FFFFFF00000000000000FFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF0000000000
              0000FFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF00000000000000FFFFFF7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7FFFFFFF00000000000000FFFFFF7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFF7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              FFFFFF00000000000000FFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF0000000000
              0000FFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF00000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFF7F7F7F00000000}
            ParentFont = False
            OnClick = sbnDeslocarFitaParaCimaClick
          end
          object sbnDeslocarFitaParaBaixo: TSpeedButton
            Left = 3
            Top = 80
            Width = 23
            Height = 23
            Hint = 'Alt+Down Deslocar registro para baixo'
            Glyph.Data = {
              2E0A0000424D2E0A00000000000036000000280000001D0000001D0000000100
              180000000000F8090000120B0000120B00000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000007F7F7F0000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000
              0000FFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF00000000000000FFFFFF7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7FFFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7FFFFFFF00000000000000FFFFFF7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFF7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              FFFFFF00000000000000FFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF0000000000
              0000FFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF00000000000000FFFFFF7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7FFFFFFF00000000000000FFFFFF7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              FFFFFF00000000000000FFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF0000000000
              0000FFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF00000000000000FFFFFF7F7F7F
              7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F
              7F7F7F7F7F7F7F7FFFFFFF00000000000000FFFFFF7F7F7F7F7F7F7F7F7FFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7F7F7F7F
              FFFFFF00000000000000FFFFFF7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFFFFFF0000000000
              0000FFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF00000000000000FFFFFF7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7FFFFFFF00000000000000FFFFFF7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              FFFFFF00000000000000FFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF0000000000
              0000FFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF00000000000000FFFFFF7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7FFFFFFF00000000000000FFFFFF7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              FFFFFF00000000000000FFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF0000000000
              0000FFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF00000000000000FFFFFF7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7FFFFFFF00000000000000FFFFFF7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              FFFFFF00000000000000FFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF0000000000
              0000FFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF00000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFF7F7F7F00000000}
            OnClick = sbnDeslocarFitaParaBaixoClick
          end
        end
      end
    end
    object pnlBottom: TPanel
      Left = 0
      Top = 678
      Width = 1011
      Height = 15
      Align = alBottom
      TabOrder = 3
      object Shape1: TShape
        Left = 167
        Top = 3
        Width = 11
        Height = 11
        Brush.Color = 16767396
        Pen.Width = 0
      end
      object Shape2: TShape
        Left = 8
        Top = 3
        Width = 11
        Height = 11
        Brush.Color = 8240895
        Pen.Width = 0
      end
      object lblForaLinhaIntaivo: TLabel
        Left = 23
        Top = 2
        Width = 118
        Height = 12
        Caption = 'FORA DE LINHA / INATIVO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
      end
      object lblAvariado: TLabel
        Left = 183
        Top = 2
        Width = 46
        Height = 12
        Caption = 'AVARIADO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
      end
    end
  end
  object aclHabilitar: TActionList
    Left = 416
    Top = 8
    object actHabilitarABAs: TAction
      OnUpdate = actHabilitarABAsUpdate
    end
  end
end
