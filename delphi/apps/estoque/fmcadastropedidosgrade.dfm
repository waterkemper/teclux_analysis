inherited frmCadastroPedidosGrade: TfrmCadastroPedidosGrade
  Left = 157
  Top = 98
  Width = 915
  Height = 622
  HorzScrollBar.Range = 720
  VertScrollBar.Range = 523
  ActiveControl = dbgGrades
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  Caption = 'Cadastro de Pedidos - Grade'
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlTopMenu: TPanel [0]
    Width = 895
    inherited tblBarra: TToolBar
      Left = 152
      Width = 743
      ButtonHeight = 55
      inherited sbnProcurar: TSpeedButton
        Top = 10
        Width = 12
        Visible = False
      end
      inherited sbnAjuda: TSpeedButton
        Left = 12
        Top = 29
      end
      inherited tbnDivisor: TToolButton
        Left = 0
        Width = 10
        Wrap = True
      end
      object pnlseparar: TPanel
        Left = 0
        Top = 63
        Width = 565
        Height = 55
        Align = alCustom
        Alignment = taRightJustify
        BevelOuter = bvNone
        TabOrder = 0
        object sbnTrocarLInhaColuna: TSpeedButton
          Left = 518
          Top = 8
          Width = 29
          Height = 30
          Hint = 'Trocar a Visualiza'#231#227'o de Linha e Coluna'
          Caption = '#'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          NumGlyphs = 2
          ParentFont = False
          OnClick = sbnTrocarLInhaColunaClick
        end
        object gbxDescricao: TGroupBox
          Left = 0
          Top = 0
          Width = 513
          Height = 39
          Caption = 'Produto'
          TabOrder = 0
          object dtxproduto: TtecDBText
            Left = 8
            Top = 14
            Width = 129
            Height = 23
            TabStop = False
            Color = clBtnFace
            DataField = 'caracteristica'
            DataSource = dtmCadastroPedidos.dsrProdutosPedidos
            ReadOnly = True
            TabOrder = 0
            Alignment = taLeftJustify
          end
          object dtxProdutoDescricao: TtecDBText
            Left = 134
            Top = 14
            Width = 371
            Height = 23
            TabStop = False
            Color = clBtnFace
            DataField = 'descricaocaracteristica'
            DataSource = dtmCadastroPedidos.dsrProdutosPedidos
            ReadOnly = True
            TabOrder = 1
            Alignment = taLeftJustify
          end
        end
      end
    end
    inherited tblBarraCadastro: TToolBar
      Width = 152
      inherited sbnIncluir: TSpeedButton
        Width = 62
        Visible = False
      end
      inherited sbnSalvar: TSpeedButton
        Left = 62
      end
      inherited sbnExcluir: TSpeedButton
        Left = 137
        Width = 15
        Visible = False
      end
    end
  end
  inherited pnlBarra: TPanel [1]
  end
  object pnlSituacaoProdutos: TPanel
    Left = 0
    Top = 555
    Width = 895
    Height = 25
    Align = alBottom
    TabOrder = 2
    object shpProdutonaoCadastradonoEstoque: TShape
      Left = 13
      Top = 6
      Width = 11
      Height = 11
      Pen.Width = 0
    end
    object lblProdutoNaoCadastradoNoEstoque: TLabel
      Left = 29
      Top = 4
      Width = 206
      Height = 16
      Caption = 'Produto n'#227'o cadastrado no estoque'
    end
  end
  object dbgGrades: TtecDBGrid
    Left = 0
    Top = 45
    Width = 895
    Height = 510
    Align = alClient
    DataSource = dtmCadastroPedidos.dsrGrade
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    Options = [dgEditing, dgTitles, dgColLines, dgRowLines, dgCancelOnExit]
    ParentFont = False
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clBlack
    TitleFont.Height = -13
    TitleFont.Name = 'helvetica'
    TitleFont.Pitch = fpVariable
    TitleFont.Style = []
    OnDrawColumnCell = dbgGradesDrawColumnCell
    OnDblClick = dbgGradesDblClick
    OnKeyDown = dbgGradesKeyDown
    OnKeyPress = dbgGradesKeyPress
    FixedCols = 1
    RowWrap = 60
    Large = True
    DoubleRowColor = False
    TitleMinHeight = 60
    CellHeights = 110
    StrippedColor = 16054260
    CanDelete = False
    CanNotInsertFromGrid = False
    PostOnEnter = False
    PostOnSetUpDown = False
    DenySort = False
    DefaultRowHeight = 22
    ExibirNumerodaLinha = False
    NaoAtribuirDadosaTabelaaoDigitar = False
    ShowWhenFieldInvisible = False
    CanClickWhenEditing = False
  end
end
