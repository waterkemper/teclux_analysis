inherited frmManutencaoObservacoesVenda: TfrmManutencaoObservacoesVenda
  Left = 221
  Top = 71
  Caption = 'Manuten'#231#227'o de Observa'#231#245'es de Venda'
  ClientHeight = 609
  ClientWidth = 1008
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  object pgcManutencaoObservacoesVenda: TPageControl [0]
    Left = 0
    Top = 73
    Width = 1008
    Height = 536
    ActivePage = tstDados
    Align = alClient
    TabOrder = 2
    object tstParametros: TTabSheet
      Caption = 'Par'#226'metros'
      inline fraMultiplaSelecaoAleatoria1: TfraMultiplaSelecaoAleatoria
        Left = 0
        Top = 57
        Width = 624
        Height = 451
        Align = alLeft
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        inherited pgcMultiplaSelecaoAleatoria: TtecPageControl
          Width = 624
          Height = 451
          Font.Pitch = fpVariable
          inherited tstItemdeProduto: TTabSheet
            Font.Pitch = fpVariable
            inherited fraSelecaoAleatoriaItemdeProdutos: TfraSelecaoAleatoriaItemdeProdutos
              inherited fraSelecaoAleatoriaItemdeProduto: TfraSelecaoAleatoria
                inherited pnlAbaixo: TPanel
                  Font.Pitch = fpVariable
                  inherited lblOrientacao: TLabel
                    Font.Pitch = fpVariable
                  end
                  inherited pnlAbaixoDireita: TPanel
                    Left = 585
                    Font.Pitch = fpVariable
                  end
                end
              end
              inherited pnlParametros: TPanel
                Font.Pitch = fpVariable
                inherited ckbProdutosComAgendamento: TCheckBox
                  Font.Pitch = fpVariable
                end
              end
            end
          end
          inherited tstProduto: TTabSheet
            inherited fraSelecaoAleatoriaprodutos: TfraSelecaoAleatoriaprodutos
              Width = 616
              Height = 421
              inherited fraSelecaoAleatoriaProduto: TfraSelecaoAleatoria
                Width = 616
                Height = 421
                inherited Splitter1: TSplitter
                  Left = 581
                  Height = 406
                end
                inherited dbgSelecaoAleatoria: TtecDBGrid
                  Width = 581
                  Height = 406
                end
                inherited pnlLabels: TPanel
                  Left = 584
                  Height = 406
                end
                inherited pnlAbaixo: TPanel
                  Top = 406
                  Width = 616
                  Font.Pitch = fpVariable
                  inherited lblOrientacao: TLabel
                    Font.Pitch = fpVariable
                  end
                  inherited pnlAbaixoDireita: TPanel
                    Left = 585
                    Font.Pitch = fpVariable
                  end
                end
              end
            end
          end
          inherited tstSelecaoAleatoriaGrupoProduto: TTabSheet
            inherited fraSelecaoaleatoriagruposprodutos: TfraSelecaoaleatoriagruposprodutos
              inherited fraSelecaoAleatoriaGrupoProduto: TfraSelecaoAleatoria
                inherited pnlAbaixo: TPanel
                  Font.Pitch = fpVariable
                  inherited lblOrientacao: TLabel
                    Font.Pitch = fpVariable
                  end
                  inherited pnlAbaixoDireita: TPanel
                    Left = 585
                    Font.Pitch = fpVariable
                  end
                end
              end
            end
          end
          inherited tstSelecaoAleatoriaClasseProduto: TTabSheet
            inherited fraSelecaoaleatoriaclassesprodutos: TfraSelecaoaleatoriaclassesprodutos
              inherited fraSelecaoAleatoriaClasseProduto: TfraSelecaoAleatoria
                inherited pnlAbaixo: TPanel
                  Font.Pitch = fpVariable
                  inherited lblOrientacao: TLabel
                    Font.Pitch = fpVariable
                  end
                  inherited pnlAbaixoDireita: TPanel
                    Left = 585
                    Font.Pitch = fpVariable
                  end
                end
              end
            end
          end
          inherited tstSelecaoAleatoriaMarcaProduto: TTabSheet
            inherited fraSelecaoAleatoriamarcasProdutos: TfraSelecaoAleatoriamarcasProdutos
              inherited fraSelecaoAleatoriamarcasProduto: TfraSelecaoAleatoria
                inherited pnlAbaixo: TPanel
                  Font.Pitch = fpVariable
                  inherited lblOrientacao: TLabel
                    Font.Pitch = fpVariable
                  end
                  inherited pnlAbaixoDireita: TPanel
                    Left = 585
                    Font.Pitch = fpVariable
                  end
                end
              end
            end
          end
          inherited tstSelecaoAleatoriamodelosProduto: TTabSheet
            inherited fraSelecaoAleatoriamodelosProdutos1: TfraSelecaoAleatoriamodelosProdutos
              inherited fraSelecaoAleatoriamodelosProduto: TfraSelecaoAleatoria
                inherited pnlAbaixo: TPanel
                  Font.Pitch = fpVariable
                  inherited lblOrientacao: TLabel
                    Font.Pitch = fpVariable
                  end
                  inherited pnlAbaixoDireita: TPanel
                    Font.Pitch = fpVariable
                  end
                end
              end
            end
          end
          inherited tstSelecaoAleatoriaespecificacoesmodelos: TTabSheet
            inherited fraSelecaoAleatoriaespecificacoesmodelos1: TfraSelecaoAleatoriaespecificacoesmodelos
              inherited fraSelecaoAleatoriaespecificacoesmodelos: TfraSelecaoAleatoria
                inherited pnlAbaixo: TPanel
                  Font.Pitch = fpVariable
                  inherited lblOrientacao: TLabel
                    Font.Pitch = fpVariable
                  end
                  inherited pnlAbaixoDireita: TPanel
                    Font.Pitch = fpVariable
                  end
                end
              end
            end
          end
          inherited tstSelecaoAleatoriaPromocoes: TTabSheet
            inherited fraSelecaoaleatoriapromocoes: TfraSelecaoaleatoriapromocoes
              inherited fraSelecaoAleatoriapromocoes: TfraSelecaoAleatoria
                inherited pnlAbaixo: TPanel
                  Font.Pitch = fpVariable
                  inherited lblOrientacao: TLabel
                    Font.Pitch = fpVariable
                  end
                  inherited pnlAbaixoDireita: TPanel
                    Left = 585
                    Font.Pitch = fpVariable
                  end
                end
              end
            end
          end
          inherited tstCST: TTabSheet
            inherited fraSelecaoAleatoriacst: TfraSelecaoAleatoriacst
              inherited fraSelecaoAleatoriacst: TfraSelecaoAleatoria
                inherited pnlAbaixo: TPanel
                  Font.Pitch = fpVariable
                  inherited lblOrientacao: TLabel
                    Font.Pitch = fpVariable
                  end
                  inherited pnlAbaixoDireita: TPanel
                    Font.Pitch = fpVariable
                  end
                end
              end
            end
          end
          inherited tstCSOSN: TTabSheet
            inherited fraSelecaoAleatoriacsosn: TfraSelecaoAleatoriacsosn
              inherited fraSelecaoAleatoriacsosn: TfraSelecaoAleatoria
                inherited pnlAbaixo: TPanel
                  Font.Pitch = fpVariable
                  inherited lblOrientacao: TLabel
                    Font.Pitch = fpVariable
                  end
                  inherited pnlAbaixoDireita: TPanel
                    Font.Pitch = fpVariable
                  end
                end
              end
            end
          end
          inherited tstListaPadronizada: TTabSheet
            inherited fraSelecaoaleatorialistaspadronizadas: TfraSelecaoaleatorialistaspadronizadas
              inherited fraSelecaoAleatoriaListasPadronizadas: TfraSelecaoAleatoria
                inherited pnlAbaixo: TPanel
                  Font.Pitch = fpVariable
                  inherited lblOrientacao: TLabel
                    Font.Pitch = fpVariable
                  end
                  inherited pnlAbaixoDireita: TPanel
                    Font.Pitch = fpVariable
                  end
                end
              end
            end
          end
          inherited tstSelecaoAleatoriaLocalizacoesEstoques: TTabSheet
            inherited fraSelecaoaleatorialocalizacaoestoque1: TfraSelecaoaleatorialocalizacaoestoque
              inherited fraSelecaoAleatoriaLocalizacaoEstoque: TfraSelecaoAleatoria
                inherited pnlAbaixo: TPanel
                  Font.Pitch = fpVariable
                  inherited lblOrientacao: TLabel
                    Font.Pitch = fpVariable
                  end
                  inherited pnlAbaixoDireita: TPanel
                    Left = 585
                    Font.Pitch = fpVariable
                  end
                end
              end
            end
          end
          inherited tstSelecaoAleatoriaLotes: TTabSheet
            inherited fraSelecaoAleatorialotes1: TfraSelecaoAleatorialotes
              inherited fraSelecaoAleatorialotes: TfraSelecaoAleatoria
                inherited pnlAbaixo: TPanel
                  Font.Pitch = fpVariable
                  inherited lblOrientacao: TLabel
                    Font.Pitch = fpVariable
                  end
                  inherited pnlAbaixoDireita: TPanel
                    Font.Pitch = fpVariable
                  end
                end
              end
            end
          end
          inherited tstSelecaoAleatoriaMarketPlace: TTabSheet
            inherited fraSelecaoaleatoriamarketplace1: TfraSelecaoaleatoriamarketplace
              inherited fraSelecaoAleatoriamarketplace: TfraSelecaoAleatoria
                inherited pnlAbaixo: TPanel
                  Font.Pitch = fpVariable
                  inherited lblOrientacao: TLabel
                    Font.Pitch = fpVariable
                  end
                  inherited pnlAbaixoDireita: TPanel
                    Left = 585
                    Font.Pitch = fpVariable
                  end
                end
              end
            end
          end
          inherited tstAtributos: TTabSheet
            inherited fraSelecaoAleatoriaatributos1: TfraSelecaoAleatoriaatributos
              inherited fraSelecaoAleatoriaatributos: TfraSelecaoAleatoria
                inherited pnlAbaixo: TPanel
                  Font.Pitch = fpVariable
                  inherited lblOrientacao: TLabel
                    Font.Pitch = fpVariable
                  end
                  inherited pnlAbaixoDireita: TPanel
                    Font.Pitch = fpVariable
                  end
                end
              end
            end
          end
          inherited tstSelecaoAleatoriaServicos: TTabSheet
            inherited fraSelecaoaleatoriaservicos1: TfraSelecaoaleatoriaservicos
              inherited fraSelecaoAleatoriaservicos: TfraSelecaoAleatoria
                inherited pnlAbaixo: TPanel
                  Font.Pitch = fpVariable
                  inherited lblOrientacao: TLabel
                    Font.Pitch = fpVariable
                  end
                  inherited pnlAbaixoDireita: TPanel
                    Left = 585
                    Font.Pitch = fpVariable
                  end
                end
              end
            end
          end
        end
      end
      object pnlTop: TPanel
        Left = 0
        Top = 0
        Width = 1000
        Height = 57
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object gbxSelecaoObservacoesVenda: TGroupBox
          Left = 0
          Top = 0
          Width = 185
          Height = 57
          Align = alLeft
          Caption = 'Com Observa'#231#245'es em'
          TabOrder = 0
          object ckbProdutosComObservacoesVenda: TCheckBox
            Left = 8
            Top = 20
            Width = 73
            Height = 17
            Caption = 'Produtos'
            Checked = True
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentColor = False
            ParentFont = False
            State = cbChecked
            TabOrder = 0
          end
          object ckbGruposComObservacoesVenda: TCheckBox
            Left = 8
            Top = 36
            Width = 65
            Height = 17
            Caption = 'Grupos'
            Checked = True
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentColor = False
            ParentFont = False
            State = cbChecked
            TabOrder = 1
          end
          object ckbClassesComObservacoesVenda: TCheckBox
            Left = 96
            Top = 20
            Width = 65
            Height = 17
            Caption = 'Classes'
            Checked = True
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentColor = False
            ParentFont = False
            State = cbChecked
            TabOrder = 2
          end
          object ckbMarcasComObservacoesVenda: TCheckBox
            Left = 96
            Top = 36
            Width = 65
            Height = 17
            Caption = 'Marcas'
            Checked = True
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentColor = False
            ParentFont = False
            State = cbChecked
            TabOrder = 3
          end
        end
      end
    end
    object tstDados: TTabSheet
      Caption = 'Dados Selecionados'
      ImageIndex = 1
      object Panel3: TPanel
        Left = 0
        Top = 493
        Width = 1000
        Height = 15
        Align = alBottom
        BevelOuter = bvNone
        Caption = 'CTRL X - Exportar | CTRL F Pesquisar | Bot'#227'o Direito - Menu'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object pgcDadosSelecinados: TPageControl
        Left = 0
        Top = 0
        Width = 1000
        Height = 493
        ActivePage = tstDadosSelecionadosObsVendas
        Align = alClient
        TabOrder = 1
        object tstDadosSelecionadosObsVendas: TTabSheet
          Caption = 'Observa'#231#245'es de Vendas'
          object pgcDadosSelecionados: TPageControl
            Left = 0
            Top = 0
            Width = 992
            Height = 465
            ActivePage = tstProdutos
            Align = alClient
            PopupMenu = AdvPopupMenu1
            TabOrder = 0
            object tstProdutos: TTabSheet
              Caption = 'Produtos'
              object dbgProdutosObservacoesVenda: TDBAdvGrid
                Left = 0
                Top = 0
                Width = 956
                Height = 437
                Cursor = crDefault
                Align = alClient
                ColCount = 8
                RowCount = 2
                FixedRows = 1
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Pitch = fpVariable
                Font.Style = []
                Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing]
                ParentFont = False
                PopupMenu = AdvPopupMenu1
                ScrollBars = ssBoth
                TabOrder = 0
                OnKeyDown = dbgProdutosObservacoesVendaKeyDown
                OnCanAddRow = dbgProdutosObservacoesVendaCanAddRow
                OnCanInsertRow = dbgProdutosObservacoesVendaCanInsertRow
                OnCanSort = dbgProdutosObservacoesVendaCanSort
                OnCanClickCell = dbgProdutosObservacoesVendaCanClickCell
                OnCellValidate = dbgProdutosObservacoesVendaCellValidate
                ActiveCellShow = True
                ActiveCellFont.Charset = DEFAULT_CHARSET
                ActiveCellFont.Color = clWindowText
                ActiveCellFont.Height = -11
                ActiveCellFont.Name = 'Tahoma'
                ActiveCellFont.Style = [fsBold]
                ActiveCellColor = 12164479
                ColumnHeaders.Strings = (
                  ''
                  'Produto'
                  'Descri'#231#227'o do Produto'
                  'Grupo'
                  'Classe'
                  'Marca'
                  'Origem'
                  'Observa'#231#245'es da Venda')
                ColumnSize.Stretch = True
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
                Multilinecells = True
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
                SortSettings.Column = 1
                SortSettings.Show = True
                Version = '2.3.2.2'
                AutoCreateColumns = True
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
                    Font.Name = 'MS Sans Serif'
                    Font.Pitch = fpVariable
                    Font.Style = []
                    HeaderFont.Charset = DEFAULT_CHARSET
                    HeaderFont.Color = clWindowText
                    HeaderFont.Height = -11
                    HeaderFont.Name = 'MS Sans Serif'
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
                    EditLength = 30
                    EditLink = FormControlEditLinkProduto
                    Editor = edCustom
                    FieldName = 'codigovisual'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Pitch = fpVariable
                    Font.Style = []
                    Header = 'Produto'
                    HeaderFont.Charset = DEFAULT_CHARSET
                    HeaderFont.Color = clWindowText
                    HeaderFont.Height = -11
                    HeaderFont.Name = 'MS Sans Serif'
                    HeaderFont.Pitch = fpVariable
                    HeaderFont.Style = []
                    PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
                    PrintFont.Charset = DEFAULT_CHARSET
                    PrintFont.Color = clWindowText
                    PrintFont.Height = -11
                    PrintFont.Name = 'MS Sans Serif'
                    PrintFont.Pitch = fpVariable
                    PrintFont.Style = []
                    Width = 146
                  end
                  item
                    Borders = []
                    BorderPen.Color = clSilver
                    CheckFalse = 'N'
                    CheckTrue = 'Y'
                    Color = clWindow
                    EditLength = 100
                    Editor = edNone
                    FieldName = 'descricao'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Pitch = fpVariable
                    Font.Style = []
                    Header = 'Descri'#231#227'o do Produto'
                    HeaderFont.Charset = DEFAULT_CHARSET
                    HeaderFont.Color = clWindowText
                    HeaderFont.Height = -11
                    HeaderFont.Name = 'MS Sans Serif'
                    HeaderFont.Pitch = fpVariable
                    HeaderFont.Style = []
                    PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
                    PrintFont.Charset = DEFAULT_CHARSET
                    PrintFont.Color = clWindowText
                    PrintFont.Height = -11
                    PrintFont.Name = 'MS Sans Serif'
                    PrintFont.Pitch = fpVariable
                    PrintFont.Style = []
                    Width = 243
                  end
                  item
                    Borders = []
                    BorderPen.Color = clSilver
                    CheckFalse = 'N'
                    CheckTrue = 'Y'
                    Color = clWindow
                    Editor = edNone
                    FieldName = 'grupo'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Pitch = fpVariable
                    Font.Style = []
                    Header = 'Grupo'
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
                    PrintFont.Name = 'Tahoma'
                    PrintFont.Pitch = fpVariable
                    PrintFont.Style = []
                    Width = 47
                  end
                  item
                    Borders = []
                    BorderPen.Color = clSilver
                    CheckFalse = 'N'
                    CheckTrue = 'Y'
                    Color = clWindow
                    Editor = edNone
                    FieldName = 'classe'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Pitch = fpVariable
                    Font.Style = []
                    Header = 'Classe'
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
                    PrintFont.Name = 'Tahoma'
                    PrintFont.Pitch = fpVariable
                    PrintFont.Style = []
                    Width = 49
                  end
                  item
                    Borders = []
                    BorderPen.Color = clSilver
                    CheckFalse = 'N'
                    CheckTrue = 'Y'
                    Color = clWindow
                    Editor = edNone
                    FieldName = 'marca'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Pitch = fpVariable
                    Font.Style = []
                    Header = 'Marca'
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
                    PrintFont.Name = 'Tahoma'
                    PrintFont.Pitch = fpVariable
                    PrintFont.Style = []
                    Width = 47
                  end
                  item
                    Borders = []
                    BorderPen.Color = clSilver
                    CheckFalse = 'N'
                    CheckTrue = 'Y'
                    Color = clWindow
                    EditLength = 10
                    Editor = edNone
                    FieldName = 'origem'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Pitch = fpVariable
                    Font.Style = []
                    Header = 'Origem'
                    HeaderFont.Charset = DEFAULT_CHARSET
                    HeaderFont.Color = clWindowText
                    HeaderFont.Height = -11
                    HeaderFont.Name = 'MS Sans Serif'
                    HeaderFont.Pitch = fpVariable
                    HeaderFont.Style = []
                    PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
                    PrintFont.Charset = DEFAULT_CHARSET
                    PrintFont.Color = clWindowText
                    PrintFont.Height = -11
                    PrintFont.Name = 'MS Sans Serif'
                    PrintFont.Pitch = fpVariable
                    PrintFont.Style = []
                    Width = 84
                  end
                  item
                    Borders = []
                    BorderPen.Color = clSilver
                    CheckFalse = 'N'
                    CheckTrue = 'Y'
                    Color = clWindow
                    FieldName = 'observacoesvenda'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Pitch = fpVariable
                    Font.Style = []
                    Header = 'Observa'#231#245'es da Venda'
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
                    PrintFont.Name = 'Tahoma'
                    PrintFont.Pitch = fpVariable
                    PrintFont.Style = []
                    Width = 315
                  end>
                DataSource = dtmManutencaoObservacoesVenda.dsrProdutos
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
                PostOnEnter = False
                OnCheckRequiredFields = dbgProdutosObservacoesVendaCheckRequiredFields
                ColWidths = (
                  20
                  146
                  243
                  47
                  49
                  47
                  84
                  315)
                RowHeights = (
                  22
                  22)
              end
              object pnlProdutosObservacoesVenda: TPanel
                Left = 956
                Top = 0
                Width = 28
                Height = 437
                Align = alRight
                TabOrder = 1
                object sbnIncluirProduto: TSpeedButton
                  Left = 3
                  Top = 17
                  Width = 22
                  Height = 22
                  Hint = 'Incluir Produto'
                  Flat = True
                  Glyph.Data = {
                    36060000424D3606000000000000360000002800000020000000100000000100
                    18000000000000060000120B0000120B00000000000000000000DCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDCDCDCDC7F7F7F7F7F7F7F7F7F8080808080807F7F7F7F7F7F7F7F7F7F7F
                    7F808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDC0000000000000000000000000000000000000000000000000000000000
                    00808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7F7F7F7F7F
                    7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
                    007F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
                    007F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
                    007F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
                    007F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
                    00808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
                    00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
                    DCDCDCDCDCFFFFFFFFFFFFFFFFFF7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
                    00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
                    DCDC7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF000000DCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
                    DCDC7F7F7FFFFFFFDCDCDC7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF000000DCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
                    DCDC7F7F7FFFFFFF7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFF000000000000DCDCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFFFFFFFFFFFFFFF
                    FFFF7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDC000000000000000000000000000000000000DCDCDCDCDCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7F7F7F7F7F
                    7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC}
                  NumGlyphs = 2
                  OnClick = sbnIncluirProdutoClick
                end
                object sbnExcluirProduto: TSpeedButton
                  Left = 3
                  Top = 39
                  Width = 23
                  Height = 22
                  Hint = 'Excluir Observa'#231#227'o do Produto'
                  Flat = True
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
              end
            end
            object tstGrupos: TTabSheet
              Caption = 'Grupos'
              ImageIndex = 1
              object dbgGruposObservacoesVenda: TDBAdvGrid
                Left = 0
                Top = 0
                Width = 955
                Height = 437
                Cursor = crDefault
                Align = alClient
                ColCount = 4
                RowCount = 2
                FixedRows = 1
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Pitch = fpVariable
                Font.Style = []
                Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goEditing]
                ParentFont = False
                PopupMenu = AdvPopupMenu1
                ScrollBars = ssBoth
                TabOrder = 0
                OnKeyDown = dbgGruposObservacoesVendaKeyDown
                OnCanAddRow = dbgGruposObservacoesVendaCanAddRow
                OnCanInsertRow = dbgGruposObservacoesVendaCanInsertRow
                OnCanSort = dbgGruposObservacoesVendaCanSort
                OnCanClickCell = dbgGruposObservacoesVendaCanClickCell
                OnCellValidate = dbgGruposObservacoesVendaCellValidate
                ActiveCellShow = True
                ActiveCellFont.Charset = DEFAULT_CHARSET
                ActiveCellFont.Color = clWindowText
                ActiveCellFont.Height = -11
                ActiveCellFont.Name = 'Tahoma'
                ActiveCellFont.Style = [fsBold]
                ActiveCellColor = 12164479
                ColumnHeaders.Strings = (
                  ''
                  'Grupo'
                  'Descri'#231#227'o do Grupo'
                  'Observa'#231#245'es da Venda')
                ColumnSize.Stretch = True
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
                SortSettings.Show = True
                Version = '2.3.2.2'
                AutoCreateColumns = True
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
                    Font.Name = 'MS Sans Serif'
                    Font.Pitch = fpVariable
                    Font.Style = []
                    HeaderFont.Charset = DEFAULT_CHARSET
                    HeaderFont.Color = clWindowText
                    HeaderFont.Height = -11
                    HeaderFont.Name = 'MS Sans Serif'
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
                    EditLength = 30
                    EditLink = FormControlEditLinkGrupo
                    Editor = edCustom
                    FieldName = 'codigo'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Pitch = fpVariable
                    Font.Style = []
                    Header = 'Grupo'
                    HeaderFont.Charset = DEFAULT_CHARSET
                    HeaderFont.Color = clWindowText
                    HeaderFont.Height = -11
                    HeaderFont.Name = 'MS Sans Serif'
                    HeaderFont.Pitch = fpVariable
                    HeaderFont.Style = []
                    PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
                    PrintFont.Charset = DEFAULT_CHARSET
                    PrintFont.Color = clWindowText
                    PrintFont.Height = -11
                    PrintFont.Name = 'MS Sans Serif'
                    PrintFont.Pitch = fpVariable
                    PrintFont.Style = []
                    Width = 112
                  end
                  item
                    Borders = []
                    BorderPen.Color = clSilver
                    CheckFalse = 'N'
                    CheckTrue = 'Y'
                    Color = clWindow
                    EditLength = 100
                    FieldName = 'descricao'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Pitch = fpVariable
                    Font.Style = []
                    Header = 'Descri'#231#227'o do Grupo'
                    HeaderFont.Charset = DEFAULT_CHARSET
                    HeaderFont.Color = clWindowText
                    HeaderFont.Height = -11
                    HeaderFont.Name = 'MS Sans Serif'
                    HeaderFont.Pitch = fpVariable
                    HeaderFont.Style = []
                    PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
                    PrintFont.Charset = DEFAULT_CHARSET
                    PrintFont.Color = clWindowText
                    PrintFont.Height = -11
                    PrintFont.Name = 'MS Sans Serif'
                    PrintFont.Pitch = fpVariable
                    PrintFont.Style = []
                    Width = 310
                  end
                  item
                    Borders = []
                    BorderPen.Color = clSilver
                    CheckFalse = 'N'
                    CheckTrue = 'Y'
                    Color = clWindow
                    EditLength = 200
                    FieldName = 'observacoesvenda'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Pitch = fpVariable
                    Font.Style = []
                    Header = 'Observa'#231#245'es da Venda'
                    HeaderFont.Charset = DEFAULT_CHARSET
                    HeaderFont.Color = clWindowText
                    HeaderFont.Height = -11
                    HeaderFont.Name = 'MS Sans Serif'
                    HeaderFont.Pitch = fpVariable
                    HeaderFont.Style = []
                    PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
                    PrintFont.Charset = DEFAULT_CHARSET
                    PrintFont.Color = clWindowText
                    PrintFont.Height = -11
                    PrintFont.Name = 'MS Sans Serif'
                    PrintFont.Pitch = fpVariable
                    PrintFont.Style = []
                    Width = 508
                  end>
                DataSource = dtmManutencaoObservacoesVenda.dsrGrupos
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
                ShowMemoFields = True
                ShowUnicode = False
                PostOnEnter = False
                OnCheckRequiredFields = dbgGruposObservacoesVendaCheckRequiredFields
                ColWidths = (
                  20
                  112
                  310
                  508)
              end
              object pnlGuposObservacoesVenda: TPanel
                Left = 955
                Top = 0
                Width = 29
                Height = 437
                Align = alRight
                TabOrder = 1
                object sbnIncluirGruposObservacoesVenda: TSpeedButton
                  Left = 8
                  Top = 17
                  Width = 17
                  Height = 22
                  Hint = 'Incluir ObservacoesVenda do grupo'
                  Flat = True
                  Glyph.Data = {
                    36060000424D3606000000000000360000002800000020000000100000000100
                    18000000000000060000120B0000120B00000000000000000000DCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDCDCDCDC7F7F7F7F7F7F7F7F7F8080808080807F7F7F7F7F7F7F7F7F7F7F
                    7F808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDC0000000000000000000000000000000000000000000000000000000000
                    00808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7F7F7F7F7F
                    7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
                    007F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
                    007F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
                    007F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
                    007F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
                    00808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
                    00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
                    DCDCDCDCDCFFFFFFFFFFFFFFFFFF7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
                    00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
                    DCDC7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF000000DCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
                    DCDC7F7F7FFFFFFFDCDCDC7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF000000DCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
                    DCDC7F7F7FFFFFFF7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFF000000000000DCDCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFFFFFFFFFFFFFFF
                    FFFF7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDC000000000000000000000000000000000000DCDCDCDCDCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7F7F7F7F7F
                    7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC}
                  NumGlyphs = 2
                  OnClick = sbnIncluirGruposObservacoesVendaClick
                end
                object sbnExcluirGrupo: TSpeedButton
                  Left = 3
                  Top = 39
                  Width = 23
                  Height = 22
                  Hint = 'Excluir Observa'#231#227'o do Grupo'
                  Flat = True
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
                  OnClick = sbnExcluirGrupoClick
                end
              end
            end
            object tstClasses: TTabSheet
              Caption = 'Classes'
              ImageIndex = 2
              object dbgClassesObservacoesVenda: TDBAdvGrid
                Left = 0
                Top = 0
                Width = 956
                Height = 437
                Cursor = crDefault
                Align = alClient
                ColCount = 4
                RowCount = 2
                FixedRows = 1
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Pitch = fpVariable
                Font.Style = []
                Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goEditing]
                ParentFont = False
                PopupMenu = AdvPopupMenu1
                ScrollBars = ssBoth
                TabOrder = 0
                OnKeyDown = dbgClassesObservacoesVendaKeyDown
                OnCanAddRow = dbgClassesObservacoesVendaCanAddRow
                OnCanInsertRow = dbgClassesObservacoesVendaCanInsertRow
                OnCanSort = dbgClassesObservacoesVendaCanSort
                OnCanClickCell = dbgClassesObservacoesVendaCanClickCell
                OnCellValidate = dbgClassesObservacoesVendaCellValidate
                ActiveCellShow = True
                ActiveCellFont.Charset = DEFAULT_CHARSET
                ActiveCellFont.Color = clWindowText
                ActiveCellFont.Height = -11
                ActiveCellFont.Name = 'Tahoma'
                ActiveCellFont.Style = [fsBold]
                ActiveCellColor = 12164479
                ColumnHeaders.Strings = (
                  ''
                  'Classe'
                  'Descri'#231#227'o da Classe'
                  'Observa'#231#245'es da Venda')
                ColumnSize.Stretch = True
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
                SortSettings.Show = True
                Version = '2.3.2.2'
                AutoCreateColumns = True
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
                    Font.Name = 'MS Sans Serif'
                    Font.Pitch = fpVariable
                    Font.Style = []
                    HeaderFont.Charset = DEFAULT_CHARSET
                    HeaderFont.Color = clWindowText
                    HeaderFont.Height = -11
                    HeaderFont.Name = 'MS Sans Serif'
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
                    EditLength = 30
                    EditLink = FormControlEditLinkClasse
                    Editor = edCustom
                    FieldName = 'codigo'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Pitch = fpVariable
                    Font.Style = []
                    Header = 'Classe'
                    HeaderFont.Charset = DEFAULT_CHARSET
                    HeaderFont.Color = clWindowText
                    HeaderFont.Height = -11
                    HeaderFont.Name = 'MS Sans Serif'
                    HeaderFont.Pitch = fpVariable
                    HeaderFont.Style = []
                    PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
                    PrintFont.Charset = DEFAULT_CHARSET
                    PrintFont.Color = clWindowText
                    PrintFont.Height = -11
                    PrintFont.Name = 'MS Sans Serif'
                    PrintFont.Pitch = fpVariable
                    PrintFont.Style = []
                    Width = 112
                  end
                  item
                    Borders = []
                    BorderPen.Color = clSilver
                    CheckFalse = 'N'
                    CheckTrue = 'Y'
                    Color = clWindow
                    EditLength = 100
                    FieldName = 'descricao'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Pitch = fpVariable
                    Font.Style = []
                    Header = 'Descri'#231#227'o da Classe'
                    HeaderFont.Charset = DEFAULT_CHARSET
                    HeaderFont.Color = clWindowText
                    HeaderFont.Height = -11
                    HeaderFont.Name = 'MS Sans Serif'
                    HeaderFont.Pitch = fpVariable
                    HeaderFont.Style = []
                    PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
                    PrintFont.Charset = DEFAULT_CHARSET
                    PrintFont.Color = clWindowText
                    PrintFont.Height = -11
                    PrintFont.Name = 'MS Sans Serif'
                    PrintFont.Pitch = fpVariable
                    PrintFont.Style = []
                    Width = 310
                  end
                  item
                    Borders = []
                    BorderPen.Color = clSilver
                    CheckFalse = 'N'
                    CheckTrue = 'Y'
                    Color = clWindow
                    EditLength = 200
                    FieldName = 'observacoesvenda'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Pitch = fpVariable
                    Font.Style = []
                    Header = 'Observa'#231#245'es da Venda'
                    HeaderFont.Charset = DEFAULT_CHARSET
                    HeaderFont.Color = clWindowText
                    HeaderFont.Height = -11
                    HeaderFont.Name = 'MS Sans Serif'
                    HeaderFont.Pitch = fpVariable
                    HeaderFont.Style = []
                    PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
                    PrintFont.Charset = DEFAULT_CHARSET
                    PrintFont.Color = clWindowText
                    PrintFont.Height = -11
                    PrintFont.Name = 'MS Sans Serif'
                    PrintFont.Pitch = fpVariable
                    PrintFont.Style = []
                    Width = 509
                  end>
                DataSource = dtmManutencaoObservacoesVenda.dsrClasses
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
                ShowMemoFields = True
                ShowUnicode = False
                PostOnEnter = False
                OnCheckRequiredFields = dbgClassesObservacoesVendaCheckRequiredFields
                ColWidths = (
                  20
                  112
                  310
                  509)
              end
              object pnlClassesObservacoesVenda: TPanel
                Left = 956
                Top = 0
                Width = 28
                Height = 437
                Align = alRight
                TabOrder = 1
                object sbnIncluirClassesObservacoesVenda: TSpeedButton
                  Left = 3
                  Top = 17
                  Width = 22
                  Height = 22
                  Hint = 'Incluir ObservacoesVenda da classe'
                  Flat = True
                  Glyph.Data = {
                    36060000424D3606000000000000360000002800000020000000100000000100
                    18000000000000060000120B0000120B00000000000000000000DCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDCDCDCDC7F7F7F7F7F7F7F7F7F8080808080807F7F7F7F7F7F7F7F7F7F7F
                    7F808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDC0000000000000000000000000000000000000000000000000000000000
                    00808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7F7F7F7F7F
                    7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
                    007F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
                    007F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
                    007F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
                    007F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
                    00808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
                    00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
                    DCDCDCDCDCFFFFFFFFFFFFFFFFFF7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
                    00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
                    DCDC7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF000000DCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
                    DCDC7F7F7FFFFFFFDCDCDC7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF000000DCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
                    DCDC7F7F7FFFFFFF7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFF000000000000DCDCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFFFFFFFFFFFFFFF
                    FFFF7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDC000000000000000000000000000000000000DCDCDCDCDCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7F7F7F7F7F
                    7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC}
                  NumGlyphs = 2
                  OnClick = sbnIncluirClassesObservacoesVendaClick
                end
                object sbnExcluirClasse: TSpeedButton
                  Left = 3
                  Top = 39
                  Width = 23
                  Height = 22
                  Hint = 'Excluir Observa'#231#227'o da Classe'
                  Flat = True
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
                  OnClick = sbnExcluirClasseClick
                end
              end
            end
            object tstMarcas: TTabSheet
              Caption = 'Marcas'
              ImageIndex = 3
              object dbgMarcasObservacoesVenda: TDBAdvGrid
                Left = 0
                Top = 0
                Width = 956
                Height = 437
                Cursor = crDefault
                Align = alClient
                ColCount = 4
                RowCount = 2
                FixedRows = 1
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Pitch = fpVariable
                Font.Style = []
                Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goEditing]
                ParentFont = False
                PopupMenu = AdvPopupMenu1
                ScrollBars = ssBoth
                TabOrder = 0
                OnCanAddRow = dbgMarcasObservacoesVendaCanAddRow
                OnCanInsertRow = dbgMarcasObservacoesVendaCanInsertRow
                OnCanSort = dbgMarcasObservacoesVendaCanSort
                OnCanClickCell = dbgMarcasObservacoesVendaCanClickCell
                OnCellValidate = dbgMarcasObservacoesVendaCellValidate
                ActiveCellShow = True
                ActiveCellFont.Charset = DEFAULT_CHARSET
                ActiveCellFont.Color = clWindowText
                ActiveCellFont.Height = -11
                ActiveCellFont.Name = 'Tahoma'
                ActiveCellFont.Style = [fsBold]
                ActiveCellColor = 12164479
                ColumnHeaders.Strings = (
                  ''
                  'Marca'
                  'Descri'#231#227'o da Marca'
                  'Observa'#231#245'es da Venda')
                ColumnSize.Stretch = True
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
                SortSettings.Show = True
                Version = '2.3.2.2'
                AutoCreateColumns = True
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
                    Font.Name = 'MS Sans Serif'
                    Font.Pitch = fpVariable
                    Font.Style = []
                    HeaderFont.Charset = DEFAULT_CHARSET
                    HeaderFont.Color = clWindowText
                    HeaderFont.Height = -11
                    HeaderFont.Name = 'MS Sans Serif'
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
                    EditLength = 30
                    EditLink = FormControlEditLinkMarca
                    Editor = edCustom
                    FieldName = 'codigo'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Pitch = fpVariable
                    Font.Style = []
                    Header = 'Marca'
                    HeaderFont.Charset = DEFAULT_CHARSET
                    HeaderFont.Color = clWindowText
                    HeaderFont.Height = -11
                    HeaderFont.Name = 'MS Sans Serif'
                    HeaderFont.Pitch = fpVariable
                    HeaderFont.Style = []
                    PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
                    PrintFont.Charset = DEFAULT_CHARSET
                    PrintFont.Color = clWindowText
                    PrintFont.Height = -11
                    PrintFont.Name = 'MS Sans Serif'
                    PrintFont.Pitch = fpVariable
                    PrintFont.Style = []
                    Width = 112
                  end
                  item
                    Borders = []
                    BorderPen.Color = clSilver
                    CheckFalse = 'N'
                    CheckTrue = 'Y'
                    Color = clWindow
                    EditLength = 100
                    FieldName = 'descricao'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Pitch = fpVariable
                    Font.Style = []
                    Header = 'Descri'#231#227'o da Marca'
                    HeaderFont.Charset = DEFAULT_CHARSET
                    HeaderFont.Color = clWindowText
                    HeaderFont.Height = -11
                    HeaderFont.Name = 'MS Sans Serif'
                    HeaderFont.Pitch = fpVariable
                    HeaderFont.Style = []
                    PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
                    PrintFont.Charset = DEFAULT_CHARSET
                    PrintFont.Color = clWindowText
                    PrintFont.Height = -11
                    PrintFont.Name = 'MS Sans Serif'
                    PrintFont.Pitch = fpVariable
                    PrintFont.Style = []
                    ReadOnly = True
                    Width = 310
                  end
                  item
                    Borders = []
                    BorderPen.Color = clSilver
                    CheckFalse = 'N'
                    CheckTrue = 'Y'
                    Color = clWindow
                    EditLength = 200
                    FieldName = 'observacoesvenda'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Pitch = fpVariable
                    Font.Style = []
                    Header = 'Observa'#231#245'es da Venda'
                    HeaderFont.Charset = DEFAULT_CHARSET
                    HeaderFont.Color = clWindowText
                    HeaderFont.Height = -11
                    HeaderFont.Name = 'MS Sans Serif'
                    HeaderFont.Pitch = fpVariable
                    HeaderFont.Style = []
                    PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
                    PrintFont.Charset = DEFAULT_CHARSET
                    PrintFont.Color = clWindowText
                    PrintFont.Height = -11
                    PrintFont.Name = 'MS Sans Serif'
                    PrintFont.Pitch = fpVariable
                    PrintFont.Style = []
                    Width = 509
                  end>
                DataSource = dtmManutencaoObservacoesVenda.dsrMarcas
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
                ShowMemoFields = True
                ShowUnicode = False
                PostOnEnter = False
                OnCheckRequiredFields = dbgMarcasObservacoesVendaCheckRequiredFields
                ColWidths = (
                  20
                  112
                  310
                  509)
              end
              object pnlMarcasObservacoesVenda: TPanel
                Left = 956
                Top = 0
                Width = 28
                Height = 437
                Align = alRight
                TabOrder = 1
                object sbnIncluirMarcasObservacoesVenda: TSpeedButton
                  Left = 3
                  Top = 17
                  Width = 22
                  Height = 22
                  Hint = 'Incluir ObservacoesVenda da Marca'
                  Flat = True
                  Glyph.Data = {
                    36060000424D3606000000000000360000002800000020000000100000000100
                    18000000000000060000120B0000120B00000000000000000000DCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDCDCDCDC7F7F7F7F7F7F7F7F7F8080808080807F7F7F7F7F7F7F7F7F7F7F
                    7F808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDC0000000000000000000000000000000000000000000000000000000000
                    00808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7F7F7F7F7F
                    7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
                    007F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
                    007F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
                    007F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
                    007F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
                    00808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
                    00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
                    DCDCDCDCDCFFFFFFFFFFFFFFFFFF7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
                    00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
                    DCDC7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF000000DCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
                    DCDC7F7F7FFFFFFFDCDCDC7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF000000DCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
                    DCDC7F7F7FFFFFFF7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFF000000000000DCDCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFFFFFFFFFFFFFFF
                    FFFF7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDC000000000000000000000000000000000000DCDCDCDCDCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7F7F7F7F7F
                    7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                    DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC}
                  NumGlyphs = 2
                  OnClick = sbnIncluirMarcasObservacoesVendaClick
                end
                object sbnExcluirMarca: TSpeedButton
                  Left = 8
                  Top = 39
                  Width = 18
                  Height = 22
                  Hint = 'Excluir Observa'#231#227'o da Marca'
                  Flat = True
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
                  OnClick = sbnExcluirMarcaClick
                end
              end
            end
          end
        end
        object tstDadosSelecionadosObsGerais: TTabSheet
          Caption = 'Observa'#231#245'es Gerais'
          ImageIndex = 1
          object dbgProdutosObservacoesGerais: TDBAdvGrid
            Left = 0
            Top = 0
            Width = 964
            Height = 465
            Cursor = crDefault
            Align = alClient
            ColCount = 7
            RowCount = 2
            FixedRows = 1
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Pitch = fpVariable
            Font.Style = []
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing]
            ParentFont = False
            PopupMenu = AdvPopupMenu1
            ScrollBars = ssBoth
            TabOrder = 0
            OnKeyDown = dbgProdutosObservacoesGeraisKeyDown
            OnCanAddRow = dbgProdutosObservacoesGeraisCanAddRow
            OnCanInsertRow = dbgProdutosObservacoesGeraisCanInsertRow
            OnCanSort = dbgProdutosObservacoesGeraisCanSort
            OnCanClickCell = dbgProdutosObservacoesGeraisCanClickCell
            OnCellValidate = dbgProdutosObservacoesGeraisCellValidate
            ActiveCellShow = True
            ActiveCellFont.Charset = DEFAULT_CHARSET
            ActiveCellFont.Color = clWindowText
            ActiveCellFont.Height = -11
            ActiveCellFont.Name = 'Tahoma'
            ActiveCellFont.Style = [fsBold]
            ActiveCellColor = 12164479
            AutoSize = True
            ColumnHeaders.Strings = (
              ''
              'Produto'
              'Descri'#231#227'o do Produto'
              'Grupo'
              'Classe'
              'Marca'
              'Observa'#231#245'es Gerais')
            ColumnSize.Stretch = True
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
            Multilinecells = True
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
            SortSettings.Column = 1
            SortSettings.Show = True
            Version = '2.3.2.2'
            AutoCreateColumns = True
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
                Font.Name = 'MS Sans Serif'
                Font.Pitch = fpVariable
                Font.Style = []
                HeaderFont.Charset = DEFAULT_CHARSET
                HeaderFont.Color = clWindowText
                HeaderFont.Height = -11
                HeaderFont.Name = 'MS Sans Serif'
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
                AutoMinSize = 160
                Borders = []
                BorderPen.Color = clSilver
                CheckFalse = 'N'
                CheckTrue = 'Y'
                Color = clWindow
                EditLength = 30
                EditLink = FormControlEditLinkProdutoObsGeral
                Editor = edCustom
                FieldName = 'codigovisual'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Pitch = fpVariable
                Font.Style = []
                Header = 'Produto'
                HeaderFont.Charset = DEFAULT_CHARSET
                HeaderFont.Color = clWindowText
                HeaderFont.Height = -11
                HeaderFont.Name = 'MS Sans Serif'
                HeaderFont.Pitch = fpVariable
                HeaderFont.Style = []
                PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
                PrintFont.Charset = DEFAULT_CHARSET
                PrintFont.Color = clWindowText
                PrintFont.Height = -11
                PrintFont.Name = 'MS Sans Serif'
                PrintFont.Pitch = fpVariable
                PrintFont.Style = []
                Width = 164
              end
              item
                Borders = []
                BorderPen.Color = clSilver
                CheckFalse = 'N'
                CheckTrue = 'Y'
                Color = clWindow
                EditLength = 100
                FieldName = 'descricao'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Pitch = fpVariable
                Font.Style = []
                Header = 'Descri'#231#227'o do Produto'
                HeaderFont.Charset = DEFAULT_CHARSET
                HeaderFont.Color = clWindowText
                HeaderFont.Height = -11
                HeaderFont.Name = 'MS Sans Serif'
                HeaderFont.Pitch = fpVariable
                HeaderFont.Style = []
                PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
                PrintFont.Charset = DEFAULT_CHARSET
                PrintFont.Color = clWindowText
                PrintFont.Height = -11
                PrintFont.Name = 'MS Sans Serif'
                PrintFont.Pitch = fpVariable
                PrintFont.Style = []
                Width = 115
              end
              item
                Borders = []
                BorderPen.Color = clSilver
                CheckFalse = 'N'
                CheckTrue = 'Y'
                Color = clWindow
                FieldName = 'grupo'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Pitch = fpVariable
                Font.Style = []
                Header = 'Grupo'
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
                PrintFont.Name = 'Tahoma'
                PrintFont.Pitch = fpVariable
                PrintFont.Style = []
                Width = 41
              end
              item
                Borders = []
                BorderPen.Color = clSilver
                CheckFalse = 'N'
                CheckTrue = 'Y'
                Color = clWindow
                FieldName = 'classe'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Pitch = fpVariable
                Font.Style = []
                Header = 'Classe'
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
                PrintFont.Name = 'Tahoma'
                PrintFont.Pitch = fpVariable
                PrintFont.Style = []
                Width = 43
              end
              item
                Borders = []
                BorderPen.Color = clSilver
                CheckFalse = 'N'
                CheckTrue = 'Y'
                Color = clWindow
                FieldName = 'marca'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Pitch = fpVariable
                Font.Style = []
                Header = 'Marca'
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
                PrintFont.Name = 'Tahoma'
                PrintFont.Pitch = fpVariable
                PrintFont.Style = []
                Width = 41
              end
              item
                Borders = []
                BorderPen.Color = clSilver
                CheckFalse = 'N'
                CheckTrue = 'Y'
                Color = clWindow
                EditLength = 200
                FieldName = 'observacao'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Pitch = fpVariable
                Font.Style = []
                Header = 'Observa'#231#245'es Gerais'
                HeaderFont.Charset = DEFAULT_CHARSET
                HeaderFont.Color = clWindowText
                HeaderFont.Height = -11
                HeaderFont.Name = 'MS Sans Serif'
                HeaderFont.Pitch = fpVariable
                HeaderFont.Style = []
                PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
                PrintFont.Charset = DEFAULT_CHARSET
                PrintFont.Color = clWindowText
                PrintFont.Height = -11
                PrintFont.Name = 'MS Sans Serif'
                PrintFont.Pitch = fpVariable
                PrintFont.Style = []
                Width = 518
              end>
            DataSource = dtmManutencaoObservacoesVenda.dsrProdutosObservacoesGerais
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
            PostOnEnter = False
            OnCheckRequiredFields = dbgProdutosObservacoesGeraisCheckRequiredFields
            ColWidths = (
              20
              164
              115
              41
              43
              41
              518)
            RowHeights = (
              22
              22)
          end
          object Panel1: TPanel
            Left = 964
            Top = 0
            Width = 28
            Height = 465
            Align = alRight
            TabOrder = 1
            object sbnIncluirProdutosObservacoesGerais: TSpeedButton
              Left = 3
              Top = 17
              Width = 22
              Height = 22
              Hint = 'Incluir Observa'#231#227'o'
              Flat = True
              Glyph.Data = {
                36060000424D3606000000000000360000002800000020000000100000000100
                18000000000000060000120B0000120B00000000000000000000DCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDC7F7F7F7F7F7F7F7F7F8080808080807F7F7F7F7F7F7F7F7F7F7F
                7F808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDC0000000000000000000000000000000000000000000000000000000000
                00808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7F7F7F7F7F
                7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
                007F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
                007F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
                007F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
                007F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
                00808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
                00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
                DCDCDCDCDCFFFFFFFFFFFFFFFFFF7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
                00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
                DCDC7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF000000DCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
                DCDC7F7F7FFFFFFFDCDCDC7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF000000DCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDC
                DCDC7F7F7FFFFFFF7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFF000000000000DCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFFFFFFFFFFFFFFF
                FFFF7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDC000000000000000000000000000000000000DCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7F7F7F7F7F
                7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC}
              NumGlyphs = 2
              OnClick = sbnIncluirProdutosObservacoesGeraisClick
            end
            object sbnExcluirProdutosObservacoesGerais: TSpeedButton
              Left = 3
              Top = 39
              Width = 23
              Height = 22
              Hint = 'Excluir Observa'#231#227'o '
              Flat = True
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
              OnClick = sbnExcluirProdutosObservacoesGeraisClick
            end
          end
        end
      end
    end
  end
  inherited pnlBarra: TPanel
    Left = 0
    Top = 40
    Width = 1008
    Height = 33
    Align = alTop
    BevelOuter = bvNone
    inherited bvlBotoesEd: TBevel
      Left = 2
      Visible = False
    end
    inline fraConsultaClasse: TfraConsultaCodigo
      Left = 572
      Top = 4
      Width = 93
      Height = 25
      HorzScrollBar.Range = 529
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
      inherited sbnProcura: TSpeedButton
        Left = 66
        Width = 24
      end
      inherited dtxDescricao: TtecDBText
        Width = 1
        DataField = 'descricao'
        DataSource = fraConsultaGrupo.dsrProcuraGrupoProdutos
      end
      inherited edfCodigo: TtecDBFindLookup
        DataField = 'codigo'
        DataSource = dtmManutencaoObservacoesVenda.dsrClasses
        MaxLength = 4
        OnKeyDown = fraConsultaClasseedfCodigoKeyDown
        LookupField = 'codigo'
        LookupSource = fraConsultaClasse.dsrProcuraClasses
        LookupQueryParameter = 'codigo'
        Parameter = ' '
        ActiveSetControls = False
        DenyInsert = False
        NoSetControls = <>
        SetControls = <>
        LookupParameter = 'codigo'
      end
    end
    inline fraConsultaProduto: TfraConsultaCodigo
      Left = 394
      Top = 4
      Width = 151
      Height = 23
      HorzScrollBar.Range = 529
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
      inherited sbnProcura: TSpeedButton
        Left = 113
      end
      inherited dtxDescricao: TtecDBText
        Left = 160
        Width = 1
        DataField = 'descricao'
        DataSource = fraConsultaProduto.dsrProcuraProdutos
      end
      inherited edfCodigo: TtecDBFindLookup
        Width = 113
        DataaFieldInterno = 'codigo'
        DataaFieldVisual = 'codigovisual'
        DataField = 'codigovisual'
        DataSource = dtmManutencaoObservacoesVenda.dsrProdutos
        MaxLength = 30
        OnKeyDown = fraConsultaProdutoedfCodigoKeyDown
        LookupaFieldinterno = 'codigo'
        LookupaFieldVisual = 'codigovisual'
        LookupField = 'codigovisual'
        LookupSource = fraConsultaProduto.dsrProcuraProdutos
        LookupQueryParameter = 'caracteristicavisual'
        Parameter = ' '
        ActiveSetControls = False
        DenyInsert = False
        NoSetControls = <>
        SetControls = <>
        LookupParameter = 'caracteristicavisual'
      end
    end
    inline fraConsultaMarca: TfraConsultaCodigo
      Left = 690
      Top = 4
      Width = 87
      Height = 25
      HorzScrollBar.Range = 529
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
      TabOrder = 2
      inherited sbnProcura: TSpeedButton
        Left = 58
        Width = 24
      end
      inherited dtxDescricao: TtecDBText
        Width = 1
        DataField = 'descricao'
        DataSource = fraConsultaGrupo.dsrProcuraGrupoProdutos
      end
      inherited edfCodigo: TtecDBFindLookup
        Width = 57
        DataField = 'codigo'
        DataSource = dtmManutencaoObservacoesVenda.dsrMarcas
        MaxLength = 4
        OnKeyDown = fraConsultaMarcaedfCodigoKeyDown
        LookupField = 'codigo'
        LookupSource = fraConsultaMarca.dsrProcuraMarca
        LookupQueryParameter = 'codigo'
        Parameter = ' '
        ActiveSetControls = False
        DenyInsert = False
        NoSetControls = <>
        SetControls = <>
        LookupParameter = 'codigo'
      end
    end
    inline fraConsultaGrupo: TfraConsultaCodigo
      Left = 284
      Top = 5
      Width = 93
      Height = 25
      HorzScrollBar.Range = 529
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
      TabOrder = 3
      inherited sbnProcura: TSpeedButton
        Left = 66
        Width = 24
      end
      inherited dtxDescricao: TtecDBText
        Width = 1
        DataField = 'descricao'
        DataSource = fraConsultaGrupo.dsrProcuraGrupoProdutos
      end
      inherited edfCodigo: TtecDBFindLookup
        DataField = 'codigo'
        DataSource = dtmManutencaoObservacoesVenda.dsrGrupos
        MaxLength = 4
        OnKeyDown = fraConsultaGrupoedfCodigoKeyDown
        LookupField = 'codigo'
        LookupSource = fraConsultaGrupo.dsrProcuraGrupoProdutos
        LookupQueryParameter = 'codigo'
        Parameter = ' '
        ActiveSetControls = False
        DenyInsert = False
        NoSetControls = <>
        SetControls = <>
        LookupParameter = 'codigo'
      end
    end
    inline fraConsultaProdutoObsGeral: TfraConsultaCodigo
      Left = 810
      Top = 4
      Width = 143
      Height = 23
      HorzScrollBar.Range = 529
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
      TabOrder = 4
      inherited sbnProcura: TSpeedButton
        Left = 113
      end
      inherited dtxDescricao: TtecDBText
        Left = 160
        Width = 1
        DataField = 'descricao'
        DataSource = fraConsultaProduto.dsrProcuraProdutos
      end
      inherited edfCodigo: TtecDBFindLookup
        Width = 113
        DataaFieldInterno = 'codigo'
        DataaFieldVisual = 'codigovisual'
        DataField = 'codigovisual'
        DataSource = dtmManutencaoObservacoesVenda.dsrProdutosObservacoesGerais
        MaxLength = 30
        OnKeyDown = fraConsultaProdutoObsGeraledfCodigoKeyDown
        LookupaFieldinterno = 'codigo'
        LookupaFieldVisual = 'codigovisual'
        LookupField = 'codigovisual'
        LookupSource = fraConsultaProduto.dsrProcuraProdutos
        LookupQueryParameter = 'caracteristicavisual'
        Parameter = ' '
        ActiveSetControls = False
        DenyInsert = False
        NoSetControls = <>
        SetControls = <>
        LookupParameter = 'caracteristicavisual'
      end
    end
  end
  inherited pnlTopMenu: TPanel
    Width = 1008
    Height = 40
    inherited tblBarraCadastro: TToolBar [0]
    end
    inherited tblBarra: TToolBar [1]
      Width = 1007
      Height = 40
      inherited sbnProcurar: TSpeedButton
        Visible = False
      end
      object sbnAlterar: TSpeedButton
        Left = 84
        Top = 2
        Width = 75
        Height = 39
        Hint = 'Gravar altera'#231#245'es'
        Constraints.MinHeight = 39
        Caption = 'Gravar F5'
        Flat = True
        Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000120B0000120B00000000000000000000C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC3C3C3C3C3C3000000
          0000000000000000007F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F0000
          00000000C3C3C3C3C3C3C3C3C37F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FC3C3C3FFFFFF000000000000
          0000000000000000007F7F7FBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF0000
          00000000000000C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3
          C3C3FFFFFFFFFFFFC3C3C37F7F7FFFFFFFC3C3C37F7F7FFFFFFF000000000000
          0000000000000000007F7F7FBFBFBF000000000000BFBFBFBFBFBFBFBFBF0000
          00000000000000C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C37F7F7FFFFFFF7F
          7F7F7F7F7FFFFFFFC3C3C37F7F7FFFFFFFC3C3C37F7F7FFFFFFF000000000000
          0000000000000000007F7F7FBFBFBF000000000000BFBFBFBFBFBFBFBFBF0000
          00000000000000C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C37F7F7FFFFFFF7F
          7F7F7F7F7FFFFFFFFFFFFF7F7F7FFFFFFFC3C3C37F7F7FFFFFFF000000000000
          0000000000000000007F7F7FBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF0000
          00000000000000C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C37F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7FC3C3C3C3C3C37F7F7FFFFFFF000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000C3C3C37F7F7FFFFFFFC3C3C3FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7FFFFFFF000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000C3C3C37F7F7FFFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF7F7F7FFFFFFF000000000000
          000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
          00000000000000C3C3C37F7F7FFFFFFF7F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFF7F7F7FFFFFFF000000000000
          000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
          00000000000000C3C3C37F7F7FFFFFFF7F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFF7F7F7FFFFFFF000000000000
          000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
          00000000000000C3C3C37F7F7FFFFFFF7F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFF7F7F7FFFFFFF000000000000
          000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
          00000000000000C3C3C37F7F7FFFFFFF7F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFF7F7F7FFFFFFF000000000000
          000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
          00000000000000C3C3C37F7F7FFFFFFF7F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFF7F7F7FFFFFFF000000000000
          000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
          007F7F7F000000C3C3C37F7F7FFFFFFF7F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7F7F7F7FFFFFFF000000000000
          000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
          00000000000000C3C3C37F7F7FC3C3C37F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7FFFFFFF7F7F7FC3C3C3C3C3C3000000
          0000000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          00000000C3C3C3C3C3C3C3C3C37F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3}
        Layout = blGlyphTop
        NumGlyphs = 2
        Spacing = 0
        OnClick = sbnAlterarClick
      end
      object sbnGerar: TSpeedButton
        Left = 159
        Top = 2
        Width = 75
        Height = 39
        Hint = 'Selecionar pre'#231'o(s)'
        Constraints.MinHeight = 39
        Caption = 'Gerar F6'
        Flat = True
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
        Layout = blGlyphTop
        NumGlyphs = 2
        Spacing = 0
        OnClick = sbnGerarClick
      end
    end
  end
  object FormControlEditLinkGrupo: TFormControlEditLink
    Tag = 0
    AutoPopupWidth = False
    EditStyle = esInplace
    PopupWidth = 0
    PopupHeight = 0
    WantKeyLeftRight = True
    WantKeyUpDown = True
    WantKeyHomeEnd = True
    WantKeyPriorNext = True
    WantKeyReturn = True
    WantKeyEscape = True
    Control = fraConsultaGrupo
    OnSetEditorFocus = FormControlEditLinkGrupoSetEditorFocus
    OnGetEditorValue = FormControlEditLinkGrupoGetEditorValue
    Left = 344
    Top = 64
  end
  object FormControlEditLinkProduto: TFormControlEditLink
    Tag = 0
    AutoPopupWidth = False
    EditStyle = esInplace
    PopupWidth = 0
    PopupHeight = 0
    WantKeyLeftRight = True
    WantKeyUpDown = True
    WantKeyHomeEnd = True
    WantKeyPriorNext = True
    WantKeyReturn = True
    WantKeyEscape = True
    Control = fraConsultaProduto
    OnSetEditorFocus = FormControlEditLinkProdutoSetEditorFocus
    OnGetEditorValue = FormControlEditLinkProdutoGetEditorValue
    Left = 504
    Top = 64
  end
  object AdvGridFindDialog1: TAdvGridFindDialog
    AutoPosition = False
    Grid = dbgProdutosObservacoesVenda
    MsgNotFound = 'O texto n'#227'o pode ser encontrado'
    MsgNoMoreFound = 'N'#227'o h'#225' mais ocorr'#234'ncias do texto'
    TxtCaption = 'Pesquisa'
    TxtTextToFind = 'Texto a procurar'
    TxtDirection = 'Dire'#231#227'o'
    TTxtDirForward1 = 'Avan'#231'ar (cima para baixo)'
    TTxtDirForward2 = 'Avan'#231'ar (esquerda para direita)'
    TTxtDirBackward1 = 'Voltar (baixo para cima)'
    TTxtDirBackward2 = 'Voltar (direita para esquerda)'
    TxtScope = 'Escopo'
    TxtScopeAllCells = 'Todas c'#233'lulas'
    TxtScopeCurrRow = 'Somente linha atual'
    TxtScopeCurrCol = 'Somente coluna atual'
    TxtScopeSelectedCells = 'Celulas selecionadas'
    TxtOptions = 'Op'#231#245'es'
    TxtOptionsCase = '&Diferenciar Mai'#250'sculas/Min'#250'sculas'
    TxtOptionsWholeWords = '&Apenas palavras inteiras'
    TxtOptionsMatchFirst = '&Correspondente no primeiro caracter'
    TxtOptionsIgnoreHTML = '&Ignorar tags HTML'
    TxtOptionsFixedCells = '&Pesquisa em c'#233'lulas fixas'
    TxtOptionsWildcards = 'Correspondencia com m'#225'scaras'
    TxtBtnOk = 'Ok'
    TxtBtnCancel = 'Cancela'
    Left = 478
    Top = 214
  end
  object AdvGridExcelIO1: TAdvGridExcelIO
    AdvStringGrid = dbgProdutosObservacoesVenda
    Options.ExportOverwriteMessage = 'File %s already exists'#13'Ok to overwrite ?'
    Options.ExportRawRTF = False
    Options.ExportShowInExcel = True
    UseUnicode = False
    Version = '3.4.1'
    Left = 542
    Top = 190
  end
  object AdvPopupMenu1: TAdvPopupMenu
    Version = '2.5.4.0'
    Left = 640
    Top = 206
    object Pesquizar1: TMenuItem
      Caption = 'Pesquisar'
      ShortCut = 16454
      OnClick = Pesquizar1Click
    end
    object ExportarExcel1: TMenuItem
      Caption = 'Exportar Excel'
      ShortCut = 16472
      OnClick = ExportarExcel1Click
    end
  end
  object FormControlEditLinkClasse: TFormControlEditLink
    Tag = 0
    AutoPopupWidth = False
    EditStyle = esInplace
    PopupWidth = 0
    PopupHeight = 0
    WantKeyLeftRight = True
    WantKeyUpDown = True
    WantKeyHomeEnd = True
    WantKeyPriorNext = True
    WantKeyReturn = True
    WantKeyEscape = True
    Control = fraConsultaClasse
    OnSetEditorFocus = FormControlEditLinkClasseSetEditorFocus
    OnGetEditorValue = FormControlEditLinkClasseGetEditorValue
    Left = 632
    Top = 64
  end
  object FormControlEditLinkMarca: TFormControlEditLink
    Tag = 0
    AutoPopupWidth = False
    EditStyle = esInplace
    PopupWidth = 0
    PopupHeight = 0
    WantKeyLeftRight = True
    WantKeyUpDown = True
    WantKeyHomeEnd = True
    WantKeyPriorNext = True
    WantKeyReturn = True
    WantKeyEscape = True
    Control = fraConsultaMarca
    OnSetEditorFocus = FormControlEditLinkMarcaSetEditorFocus
    OnGetEditorValue = FormControlEditLinkMarcaGetEditorValue
    Left = 744
    Top = 64
  end
  object FormControlEditLinkProdutoObsGeral: TFormControlEditLink
    Tag = 0
    AutoPopupWidth = False
    EditStyle = esInplace
    PopupWidth = 0
    PopupHeight = 0
    WantKeyLeftRight = True
    WantKeyUpDown = True
    WantKeyHomeEnd = True
    WantKeyPriorNext = True
    WantKeyReturn = True
    WantKeyEscape = True
    Control = fraConsultaProdutoObsGeral
    OnSetEditorFocus = FormControlEditLinkProdutoObsGeralSetEditorFocus
    OnGetEditorValue = FormControlEditLinkProdutoObsGeralGetEditorValue
    Left = 920
    Top = 72
  end
end
