inherited frmProdutosRequisicaoOS: TfrmProdutosRequisicaoOS
  Left = 656
  Top = 232
  ActiveControl = dbgProdutosEquipamentosOS
  Caption = 'Produtos Requisi'#231#227'o para Impress'#227'o'
  ClientHeight = 290
  ClientWidth = 543
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBarra: TToolBar
    Width = 543
  end
  inherited pnlFundoJanela: TPanel
    Top = 55
    Width = 543
    Height = 235
    object Shape1: TShape
      Left = 2
      Top = 221
      Width = 11
      Height = 11
      Brush.Color = clBlue
      Pen.Width = 0
    end
    object lblIncluido: TLabel
      Left = 17
      Top = 218
      Width = 93
      Height = 16
      Caption = 'Produto inclu'#237'do'
    end
    object dbgProdutosEquipamentosOS: TtecDBGrid
      Left = 0
      Top = -1
      Width = 525
      Height = 218
      DataSource = dtmordemservico.dsrProdutosEquipamentosOS
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Pitch = fpVariable
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clBlack
      TitleFont.Height = -13
      TitleFont.Name = 'helvetica'
      TitleFont.Pitch = fpVariable
      TitleFont.Style = []
      OnDrawColumnCell = dbgProdutosEquipamentosOSDrawColumnCell
      OnDblClick = dbgProdutosEquipamentosOSDblClick
      OnKeyDown = dbgProdutosEquipamentosOSKeyDown
      RowWrap = 60
      Large = False
      DoubleRowColor = False
      TitleMinHeight = 100
      CellHeights = 100
      StrippedColor = 16054260
      CanDelete = False
      PostOnEnter = False
      DenySort = False
      DefaultRowHeight = 18
      ExibirNumerodaLinha = False
      NaoAtribuirDadosaTabelaaoDigitar = False
      Columns = <
        item
          Expanded = False
          FieldName = 'produto'
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'digo'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'descricao'
          Title.Alignment = taCenter
          Title.Caption = 'Descri'#231#227'o'
          Width = 240
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'quantidade'
          Title.Alignment = taCenter
          Title.Caption = 'Qtd.'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'valorgrade1'
          Title.Alignment = taCenter
          Title.Caption = 'Linha'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'valorgrade2'
          Title.Alignment = taCenter
          Title.Caption = 'Coluna'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'emestoque'
          Title.Alignment = taCenter
          Title.Caption = 'Estoque'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'selecionado'
          Title.Alignment = taRightJustify
          Title.Caption = 'Sel.'
          Width = 30
          Visible = True
        end>
    end
  end
end
