inherited frmCopiarProdutosPedidos: TfrmCopiarProdutosPedidos
  Left = 436
  Top = 166
  Caption = 'Copiar Produtos Pedidos'
  ClientHeight = 356
  ClientWidth = 696
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlTopMenu: TPanel
    Width = 696
    inherited tblBarra: TToolBar
      Width = 471
    end
  end
  object pnlcomando: TPanel
    Left = 0
    Top = 45
    Width = 696
    Height = 82
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object gbxpedido: TGroupBox
      Left = 8
      Top = 2
      Width = 134
      Height = 38
      Caption = 'PEDIDO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object edfPesquisaPedido: TtecDbEditFind
        Left = 5
        Top = 12
        Width = 121
        Height = 24
        Alignment = taLeftJustify
        DataField = 'numero'
        DataSource = dtmCadastroPedidos.dsrPedidosCopia
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        Group = 'Pedidos'
        MaxLength = 20
        Maximo = 0
        Minimo = 37353
        Adicional = 0
        Opcional = True
        OnFound = edfPesquisaPedidoFound
        ParentFont = False
        TabOrder = 0
        PermitirZero = False
        PermitirNulo = False
        Operacao = opATRIBUICAO
        Parameter = 'numero'
        ActiveSetControls = True
        DenyInsert = True
        NoSetControls = <>
        SetControls = <>
      end
    end
    object gbxsituacao: TGroupBox
      Left = 149
      Top = 2
      Width = 123
      Height = 38
      Caption = 'SITUA'#199#195'O'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object dtxSituacao: TtecDBText
        Left = 4
        Top = 12
        Width = 114
        Height = 23
        TabStop = False
        Color = clBtnFace
        DataField = 'descricaosituacao'
        DataSource = dtmCadastroPedidos.dsrPedidosCopia
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        Alignment = taLeftJustify
      end
    end
    object Gbxemissao: TGroupBox
      Left = 280
      Top = 2
      Width = 111
      Height = 38
      Caption = 'EMISS'#195'O'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      object dtxEmissao: TtecDBText
        Left = 4
        Top = 11
        Width = 102
        Height = 23
        TabStop = False
        Color = clBtnFace
        DataField = 'emissao'
        DataSource = dtmCadastroPedidos.dsrPedidosCopia
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        Alignment = taLeftJustify
      end
    end
    object Gbxconcluido: TGroupBox
      Left = 399
      Top = 2
      Width = 123
      Height = 38
      Caption = 'CONCLU'#205'DO EM'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      object dtxConcluido: TtecDBText
        Left = 4
        Top = 12
        Width = 114
        Height = 23
        TabStop = False
        Color = clBtnFace
        DataField = 'concluido'
        DataSource = dtmCadastroPedidos.dsrPedidosCopia
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        Alignment = taLeftJustify
      end
    end
    object Gbxfornecedor: TGroupBox
      Left = 8
      Top = 45
      Width = 377
      Height = 38
      Caption = 'FORNECEDOR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      object dtxFornecedor: TtecDBText
        Left = 4
        Top = 11
        Width = 367
        Height = 23
        TabStop = False
        Color = clBtnFace
        DataField = 'nomefornecedor'
        DataSource = dtmCadastroPedidos.dsrPedidosCopia
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        Alignment = taLeftJustify
      end
    end
    object Gbxcnpj: TGroupBox
      Left = 393
      Top = 45
      Width = 169
      Height = 38
      Caption = 'CNPJ'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      object dtxCNPJ: TtecDBText
        Left = 4
        Top = 12
        Width = 161
        Height = 23
        TabStop = False
        Color = clBtnFace
        DataField = 'pessoanumero'
        DataSource = dtmCadastroPedidos.dsrPedidosCopia
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        Alignment = taLeftJustify
      end
    end
  end
  object pnlfundogrid: TPanel
    Left = 0
    Top = 127
    Width = 696
    Height = 229
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 3
    object gbxprodutospedidos: TGroupBox
      Left = 0
      Top = 0
      Width = 696
      Height = 229
      Align = alClient
      Caption = 'Produtos'
      TabOrder = 0
      object pnlbotaodireita: TPanel
        Left = 666
        Top = 18
        Width = 28
        Height = 186
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 0
        object sbnAlterarPrecoSugestao: TSpeedButton
          Left = 3
          Top = 3
          Width = 23
          Height = 23
          Hint = 'Alterar Pre'#231'o Sugest'#227'o <Ctrl + P>'
          Flat = True
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000010000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            33333333FF33333333FF333993333333300033377F3333333777333993333333
            300033F77FFF3333377739999993333333333777777F3333333F399999933333
            33003777777333333377333993333333330033377F3333333377333993333333
            3333333773333333333F333333333333330033333333F33333773333333C3333
            330033333337FF3333773333333CC333333333FFFFF77FFF3FF33CCCCCCCCCC3
            993337777777777F77F33CCCCCCCCCC3993337777777777377333333333CC333
            333333333337733333FF3333333C333330003333333733333777333333333333
            3000333333333333377733333333333333333333333333333333}
          NumGlyphs = 2
          OnClick = sbnAlterarPrecoSugestaoClick
        end
      end
      object pnlabaixo: TPanel
        Left = 2
        Top = 204
        Width = 692
        Height = 23
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        object ckbselecionartodos: TCheckBox
          Left = 467
          Top = 2
          Width = 201
          Height = 19
          Caption = 'Selecionar Todos os Produtos'
          TabOrder = 0
          OnClick = ckbselecionartodosClick
        end
      end
      object dbgprodutospedidos: TtecDBGrid
        Left = 2
        Top = 18
        Width = 664
        Height = 186
        Align = alClient
        DataSource = dtmCadastroPedidos.dsrProdutosPedidosCopia
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -13
        TitleFont.Name = 'helvetica'
        TitleFont.Pitch = fpVariable
        TitleFont.Style = []
        OnDrawColumnCell = dbgprodutospedidosDrawColumnCell
        OnDblClick = dbgprodutospedidosDblClick
        OnKeyDown = dbgprodutospedidosKeyDown
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
        ShowWhenFieldInvisible = False
        CanClickWhenEditing = False
        Columns = <
          item
            Expanded = False
            FieldName = 'produtovisual'
            Title.Caption = 'Produto'
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'descricaoproduto'
            Title.Caption = 'Descri'#231#227'o'
            Width = 250
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'valorgrade1'
            Title.Caption = 'Linha'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'valorgrade2'
            Title.Caption = 'Coluna'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'quantidade'
            Title.Caption = 'Qtde'
            Width = 45
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'totalrecebido_'
            Title.Caption = 'Receb.'
            Width = 45
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'preco'
            Title.Caption = 'Pre'#231'o'
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'precosugerido'
            Title.Caption = 'Sugerido'
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'selecionar'
            Title.Caption = 'Sel.'
            Visible = True
          end>
      end
    end
  end
end
