inherited frmprodutosadevolver: Tfrmprodutosadevolver
  Left = 582
  Top = 237
  ActiveControl = edtPesquisaProduto
  Caption = 'frmprodutosadevolver'
  ClientHeight = 333
  ClientWidth = 621
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlTopMenu: TPanel
    Width = 621
    inherited tblBarra: TToolBar
      Width = 396
      inherited sbnProcurar: TSpeedButton
        Visible = False
      end
    end
    inherited tblBarraCadastro: TToolBar
      inherited sbnIncluir: TSpeedButton
        Visible = False
      end
      inherited sbnExcluir: TSpeedButton
        Visible = False
      end
    end
  end
  object pnlPesquisa: TPanel
    Left = 0
    Top = 45
    Width = 621
    Height = 51
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object gbxProduto: TGroupBox
      Left = 3
      Top = 5
      Width = 185
      Height = 43
      Caption = 'PRODUTO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object edtPesquisaProduto: TEditNumero
        Left = 4
        Top = 14
        Width = 173
        Height = 22
        MaxLength = 20
        TabOrder = 0
        OnExit = edtPesquisaProdutoExit
        Mascara = True
        Alignment = taLeftJustify
        TipoMascara = tmGERAL
        NrDecimal = 2
        Decimais = False
        Negativo = False
        Tamanho = 9
      end
    end
  end
  object pnlStatus: TPanel
    Left = 0
    Top = 310
    Width = 621
    Height = 23
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    object ckbMarcartotodos: TCheckBox
      Left = 447
      Top = 2
      Width = 175
      Height = 19
      Caption = 'Marcar Todos os Produtos'
      TabOrder = 0
      OnClick = ckbMarcartotodosClick
    end
  end
  object pnlProdutos: TPanel
    Left = 0
    Top = 96
    Width = 621
    Height = 214
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 4
    object dbgProdutos: TtecDBGrid
      Left = 0
      Top = 0
      Width = 621
      Height = 214
      Align = alClient
      DataSource = dtmCadastroContratos.dsrProdutosContratos
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
      TitleFont.Height = -13
      TitleFont.Name = 'helvetica'
      TitleFont.Pitch = fpVariable
      TitleFont.Style = []
      OnDrawColumnCell = dbgProdutosDrawColumnCell
      OnDblClick = dbgProdutosDblClick
      OnKeyDown = dbgProdutosKeyDown
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
          Title.Caption = 'N'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'Arial'
          Title.Font.Pitch = fpVariable
          Title.Font.Style = []
          Width = 25
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'produto'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'ITEM'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'Arial'
          Title.Font.Pitch = fpVariable
          Title.Font.Style = []
          Width = 110
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
          Title.Font.Height = -11
          Title.Font.Name = 'Arial'
          Title.Font.Pitch = fpVariable
          Title.Font.Style = []
          Width = 285
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'quantidade'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'QTDE'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'Arial'
          Title.Font.Pitch = fpVariable
          Title.Font.Style = []
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'adevolver'
          Title.Alignment = taCenter
          Title.Caption = 'DEVOLVER'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'Arial'
          Title.Font.Pitch = fpVariable
          Title.Font.Style = []
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'selecionar'
          Title.Alignment = taCenter
          Title.Caption = 'SEL'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'Arial'
          Title.Font.Pitch = fpVariable
          Title.Font.Style = []
          Width = 26
          Visible = True
        end>
    end
  end
end
