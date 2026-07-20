inherited frmCadastroPedidosSaidas: TfrmCadastroPedidosSaidas
  Left = 354
  Top = 204
  ActiveControl = edfPedido
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  Caption = 'Cadastro de pedidos'
  ClientHeight = 535
  ClientWidth = 843
  Font.Height = -11
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlBarra: TPanel
    Left = 0
    Top = 534
    Width = 843
    Height = 1
    Align = alBottom
    BevelOuter = bvNone
  end
  inherited pnlTopMenu: TPanel
    Width = 843
    inherited tblBarra: TToolBar
      Width = 618
    end
  end
  object pnlTop: TPanel
    Left = 0
    Top = 45
    Width = 843
    Height = 84
    Align = alTop
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object gbxNumero: TGroupBox
      Left = 4
      Top = 3
      Width = 90
      Height = 39
      Caption = 'N'#186' PEDIDO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object edfPedido: TtecDBFindLookup
        Left = 4
        Top = 12
        Width = 81
        Height = 23
        Alignment = taLeftJustify
        DataField = 'numero'
        DataSource = dtmCadastroPedidosSaidas.dsrPedidosSaida
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        Group = 'numero'
        MaxLength = 6
        Maximo = 0
        Minimo = 37353
        Adicional = 0
        Opcional = True
        ParentFont = False
        TabOrder = 0
        PermitirZero = False
        PermitirNulo = False
        Operacao = opPESQUISA
        Parameter = 'numero'
        ActiveSetControls = True
        DenyInsert = True
        NoSetControls = <
          item
            Control = gbxNumero
          end>
        SetControls = <
          item
            Control = gbxNrClientes
          end
          item
            Control = gbxData
          end
          item
            Control = gbxNrNoCliente
          end
          item
            Control = gbxProdutos
          end>
      end
    end
    object gbxNrClientes: TGroupBox
      Left = 4
      Top = 43
      Width = 506
      Height = 39
      Caption = 'CLIENTE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      inline fraConsultaCliente: TfraConsultaCodigo
        Left = 4
        Top = 12
        Width = 499
        Height = 24
        HorzScrollBar.Range = 497
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
        inherited dtxDescricao: TtecDBText
          DataField = 'nome'
          DataSource = fraConsultaCliente.dsrProcuraCliente
        end
        inherited edfCodigo: TtecDBFindLookup
          DataField = 'cliente'
          DataSource = dtmCadastroPedidosSaidas.dsrPedidosSaida
          MaxLength = 6
          LookupField = 'codigo'
          LookupSource = fraConsultaCliente.dsrProcuraCliente
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
    object gbxData: TGroupBox
      Left = 261
      Top = 4
      Width = 89
      Height = 38
      Caption = 'DATA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      object edtDataPedido: TDBEditData
        Left = 5
        Top = 11
        Width = 79
        Height = 23
        Alignment = taLeftJustify
        DataField = 'data'
        DataSource = dtmCadastroPedidosSaidas.dsrPedidosSaida
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        Maximo = 0
        Minimo = 37353
        Adicional = 0
        ParentFont = False
        TabOrder = 0
        Opcional = True
      end
    end
    object gbxNrNoCliente: TGroupBox
      Left = 98
      Top = 3
      Width = 159
      Height = 39
      Caption = 'N'#186' PEDIDO NO CLIENTE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object edtNrNoCliente: TDBEditTexto
        Left = 4
        Top = 12
        Width = 150
        Height = 23
        DataField = 'pedidocliente'
        DataSource = dtmCadastroPedidosSaidas.dsrPedidosSaida
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        MaxLength = 20
        ParentFont = False
        TabOrder = 0
        CharCasenoDefault = False
        Alignment = taLeftJustify
      end
    end
  end
  object gbxProdutos: TGroupBox
    Left = 0
    Top = 129
    Width = 843
    Height = 405
    Align = alClient
    Caption = 'PRODUTOS'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -9
    Font.Name = 'helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 3
    object Bevel1: TBevel
      Left = 2
      Top = 14
      Width = 839
      Height = 5
      Align = alTop
      Shape = bsSpacer
    end
    object dbgProdutosPedidos: TtecDBGrid
      Left = 2
      Top = 19
      Width = 839
      Height = 365
      Align = alClient
      DataSource = dtmCadastroPedidosSaidas.dsrProdutosPedidosSaida
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
      OnDrawColumnCell = dbgProdutosPedidosDrawColumnCell
      OnDblClick = dbgProdutosPedidosDblClick
      OnKeyDown = dbgProdutosPedidosKeyDown
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
          FieldName = 'numero'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'N'#186
          Width = 20
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'osp'
          ReadOnly = True
          Title.Alignment = taCenter
          Width = 45
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'produtovisual'
          Title.Alignment = taCenter
          Title.Caption = 'PRODUTO'
          Width = 160
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'descricao'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'DESCRI'#199#195'O'
          Width = 265
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'unidade'
          ReadOnly = True
          Title.Alignment = taCenter
          Width = 25
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'quantidade'
          Title.Alignment = taCenter
          Title.Caption = 'QT PEDIDA'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'qtdeentregue'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'QT ENTREGUE'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'saldo'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'SALDO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'preco'
          Title.Alignment = taCenter
          Title.Caption = 'PRE'#199'O'
          Width = 70
          Visible = True
        end>
    end
    object pnlLegenda: TPanel
      Left = 2
      Top = 384
      Width = 839
      Height = 19
      Align = alBottom
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object shIncluirNaNota: TShape
        Left = 5
        Top = 4
        Width = 11
        Height = 11
        Brush.Color = clBlue
        Pen.Width = 0
      end
      object lblInventarioProdutosGerados: TLabel
        Left = 24
        Top = 4
        Width = 148
        Height = 12
        Caption = 'PRODUTO PERTENCENTE A OSP'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
    end
  end
end
