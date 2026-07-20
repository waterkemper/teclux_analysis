inherited frmConsultaLicitacoes: TfrmConsultaLicitacoes
  Left = -8
  Top = -8
  Caption = 'Consulta de Licita'#231#245'es'
  ClientHeight = 834
  ClientWidth = 1592
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTopMenu: TPanel [0]
    Width = 1592
    TabOrder = 0
    inherited tblBarra: TToolBar
      Width = 1591
      inherited sbnProcurar: TSpeedButton
        Width = 73
        Font.Name = 'MS Shell Dlg'
        Visible = False
      end
      inherited sbnAjuda: TSpeedButton
        Left = 73
      end
      inherited tbnDivisor: TToolButton
        Left = 74
      end
      object sbnGerar: TSpeedButton
        Left = 82
        Top = 2
        Width = 75
        Height = 39
        Hint = 'Gerar os dados'
        Caption = 'Gerar F6'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'MS Shell Dlg'
        Font.Pitch = fpVariable
        Font.Style = []
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
        ParentFont = False
        Spacing = 0
        OnClick = sbnGerarClick
      end
      object sbnAbrirLicitacao: TSpeedButton
        Left = 157
        Top = 2
        Width = 75
        Height = 39
        Hint = 'Abrir o contrato'
        Caption = 'F8 - Licita'#231#227'o'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'MS Shell Dlg'
        Font.Pitch = fpVariable
        Font.Style = []
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33333333333FFFFFFFFF333333000000000033333377777777773333330FFFFF
          FFF03333337F333333373333330FFFFFFFF03333337F3FF3FFF73333330F00F0
          00F03333F37F773777373330330FFFFFFFF03337FF7F3F3FF3F73339030F0800
          F0F033377F7F737737373339900FFFFFFFF03FF7777F3FF3FFF70999990F00F0
          00007777777F7737777709999990FFF0FF0377777777FF37F3730999999908F0
          F033777777777337F73309999990FFF0033377777777FFF77333099999000000
          3333777777777777333333399033333333333337773333333333333903333333
          3333333773333333333333303333333333333337333333333333}
        Layout = blGlyphTop
        NumGlyphs = 2
        ParentFont = False
        Spacing = 0
        OnClick = sbnAbrirLicitacaoClick
      end
    end
  end
  object pgcLicitacoes: TPageControl [1]
    Left = 0
    Top = 45
    Width = 1592
    Height = 769
    ActivePage = tstDados
    Align = alClient
    TabOrder = 1
    OnChange = pgcLicitacoesChange
    object tstParametros: TTabSheet
      Caption = 'Par'#226'metros'
      object gbxClientes: TGroupBox
        Left = 0
        Top = 179
        Width = 1584
        Height = 370
        Align = alClient
        Caption = 'Clientes'
        TabOrder = 1
        inline fraSelecaoAleatoriaClientes1: TfraSelecaoAleatoriaClientes
          Left = 2
          Top = 15
          Width = 1580
          Height = 353
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'HELVETICA'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          inherited fraSelecaoAleatoriaCliente: TfraSelecaoAleatoria
            Width = 1580
            Height = 353
            Font.Height = -12
            Font.Name = 'HELVETICA'
            Font.Pitch = fpVariable
            Font.Style = [fsBold]
            ParentFont = False
            inherited Splitter1: TSplitter
              Left = 671
              Height = 338
            end
            inherited dbgSelecaoAleatoria: TtecDBGrid
              Width = 671
              Height = 338
              Font.Height = -11
              DefaultRowHeight = 18
              Columns = <
                item
                  Expanded = False
                  FieldName = 'codigo'
                  Title.Alignment = taCenter
                  Title.Caption = 'Cliente'
                  Width = 59
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'tipo'
                  Title.Caption = 'T'
                  Width = 14
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'descricao'
                  Title.Alignment = taCenter
                  Title.Caption = 'Nome do Cliente'
                  Width = 310
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'campo'
                  PickList.Strings = (
                    'codigo'
                    'descricao'
                    'cpf/cnpj')
                  Title.Alignment = taCenter
                  Title.Caption = 'Aplicar a'
                  Width = 80
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'opcomparacao'
                  PickList.Strings = (
                    '= Igual a'
                    '<> Diferente de'
                    '>= Maior ou Igual a'
                    '<= Menor ou Igual a'
                    '> Maior que'
                    '< Menor que'
                    'Cont'#233'm'
                    'N'#227'o Cont'#233'm'
                    'Contido na Lista'
                    'n'#227'o Contido na Lista')
                  Title.Alignment = taCenter
                  Title.Caption = 'Condi'#231#227'o'
                  Width = 112
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'oplogico'
                  PickList.Strings = (
                    'e'
                    'ou')
                  Title.Alignment = taCenter
                  Title.Caption = 'L'#243'gica'
                  Width = 57
                  Visible = True
                end>
            end
            inherited pnlLabels: TPanel
              Left = 674
              Width = 27
              Height = 338
            end
            inherited pnlAbaixo: TPanel
              Top = 338
              Width = 1580
              inherited lblOrientacao: TLabel
                Width = 291
                Height = 15
                Caption = '[CTRL+F9] para pesquisa  e  [CTRL+Del] para excluir'
                Font.Height = -12
                Font.Name = 'HELVETICA'
              end
              inherited pnlAbaixoDireita: TPanel
                Left = 1553
                Font.Pitch = fpVariable
              end
            end
            inherited qrySelecaoAleatoria: TtecQuery
              Left = 184
            end
          end
        end
      end
      object gbxListaItemsdeProduto: TGroupBox
        Left = 0
        Top = 549
        Width = 1584
        Height = 192
        Align = alBottom
        Caption = 'Itens de Produto'
        TabOrder = 2
        inline fraSelecaoAleatoriaItemdeProdutos1: TfraSelecaoAleatoriaItemdeProdutos
          Left = 2
          Top = 15
          Width = 1580
          Height = 175
          Align = alClient
          TabOrder = 0
          inherited fraSelecaoAleatoriaItemdeProduto: TfraSelecaoAleatoria
            Width = 1580
            Height = 151
            inherited Splitter1: TSplitter
              Left = 1545
              Height = 137
            end
            inherited dbgSelecaoAleatoria: TtecDBGrid
              Width = 1545
              Height = 137
              Columns = <
                item
                  Expanded = False
                  FieldName = 'codigo'
                  Title.Alignment = taCenter
                  Title.Caption = 'Item'
                  Width = 79
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'descricao'
                  Title.Alignment = taCenter
                  Title.Caption = 'Descri'#231#227'o'
                  Width = 304
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'campo'
                  PickList.Strings = (
                    'codigo'
                    'descricao')
                  Title.Caption = 'Aplicar a'
                  Width = 86
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'opcomparacao'
                  PickList.Strings = (
                    '= Igual a'
                    '<> Diferente de'
                    '>= Maior ou Igual a'
                    '<= Menor ou Igual a'
                    '> Maior que'
                    '< Menor que'
                    'Cont'#233'm'
                    'N'#227'o Cont'#233'm'
                    'Contido na Lista'
                    'n'#227'o Contido na Lista')
                  Title.Alignment = taCenter
                  Title.Caption = 'Condi'#231#227'o'
                  Width = 115
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'oplogico'
                  PickList.Strings = (
                    'e'
                    'ou')
                  Title.Alignment = taCenter
                  Title.Caption = 'L'#243'gica'
                  Width = 41
                  Visible = True
                end>
            end
            inherited pnlLabels: TPanel
              Left = 1548
              Height = 137
            end
            inherited pnlAbaixo: TPanel
              Top = 137
              Width = 1580
              Font.Pitch = fpVariable
              inherited lblOrientacao: TLabel
                Font.Pitch = fpVariable
              end
              inherited pnlAbaixoDireita: TPanel
                Left = 1553
                Font.Pitch = fpVariable
              end
            end
          end
          inherited pnlParametros: TPanel
            Top = 151
            Width = 1580
            Font.Pitch = fpVariable
            inherited ckbProdutosComAgendamento: TCheckBox
              Font.Pitch = fpVariable
            end
          end
        end
      end
      object pnlTop: TPanel
        Left = 0
        Top = 0
        Width = 1584
        Height = 179
        Align = alTop
        TabOrder = 0
        object gbxListadeVendedores: TGroupBox
          Left = 188
          Top = 8
          Width = 516
          Height = 169
          Caption = 'Lista de Vendedores'
          TabOrder = 2
          inline fraSelecaoAleatoriavendedores1: TfraSelecaoAleatoriavendedores
            Left = 2
            Top = 15
            Width = 512
            Height = 152
            Align = alClient
            TabOrder = 0
            inherited fraSelecaoAleatoriavendedores: TfraSelecaoAleatoria
              Width = 512
              Height = 152
              inherited Splitter1: TSplitter
                Height = 137
              end
              inherited dbgSelecaoAleatoria: TtecDBGrid
                Height = 137
              end
              inherited pnlLabels: TPanel
                Height = 137
              end
              inherited pnlAbaixo: TPanel
                Top = 137
                Width = 512
                Font.Pitch = fpVariable
                inherited lblOrientacao: TLabel
                  Font.Pitch = fpVariable
                end
                inherited pnlAbaixoDireita: TPanel
                  Left = 481
                  Font.Pitch = fpVariable
                end
              end
            end
          end
        end
        inline fraIntervaloDataVigencia: TfraIntervaloDatas
          Left = 1
          Top = 49
          Width = 162
          Height = 36
          Constraints.MaxHeight = 36
          Constraints.MaxWidth = 162
          Constraints.MinHeight = 36
          Constraints.MinWidth = 162
          TabOrder = 1
          inherited gbxPeriodo: TGroupBox
            Caption = 'INTERVALO DA VIG'#202'NCIA'
          end
        end
        inline fraIntervaloDataVenda: TfraIntervaloDatas
          Left = 0
          Top = 8
          Width = 162
          Height = 36
          Constraints.MaxHeight = 36
          Constraints.MaxWidth = 162
          Constraints.MinHeight = 36
          Constraints.MinWidth = 162
          TabOrder = 0
          inherited gbxPeriodo: TGroupBox
            Caption = 'INTERVALO DE VENDAS'
          end
        end
        object gbxSituacaoLicitacoes: TGroupBox
          Left = 0
          Top = 89
          Width = 137
          Height = 82
          Caption = 'SITUA'#199#195'O'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          object ckbLicitacaoAberta: TCheckBox
            Left = 8
            Top = 16
            Width = 96
            Height = 10
            Caption = 'Aberta'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object ckbLicitacaoFinalizada: TCheckBox
            Left = 8
            Top = 32
            Width = 103
            Height = 10
            Caption = 'Finalizada'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
          object ckbLicitacaoCancelada: TCheckBox
            Left = 8
            Top = 48
            Width = 84
            Height = 10
            Caption = 'Cancelada'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
          object ckbLicitacaoExpirada: TCheckBox
            Left = 8
            Top = 62
            Width = 76
            Height = 15
            Caption = 'Expirada'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 3
          end
        end
      end
    end
    object tstDados: TTabSheet
      Caption = 'Dados'
      ImageIndex = 1
      object DBAdvGridLicitacoes: TDBAdvGrid
        Left = 0
        Top = 1
        Width = 1584
        Height = 740
        Cursor = crDefault
        Align = alClient
        ColCount = 22
        RowCount = 2
        FixedRows = 1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Pitch = fpVariable
        Font.Style = []
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
        ParentFont = False
        PopupMenu = AdvPopupMenu1
        ScrollBars = ssBoth
        TabOrder = 0
        ActiveRowShow = True
        ActiveCellShow = True
        ActiveCellFont.Charset = DEFAULT_CHARSET
        ActiveCellFont.Color = clWindowText
        ActiveCellFont.Height = -11
        ActiveCellFont.Name = 'Tahoma'
        ActiveCellFont.Style = [fsBold]
        ColumnHeaders.Strings = (
          ''
          'Nr'#186
          'Situa'#231#227'o'
          'Cliente'
          'Nome do Cliente'
          'UF'
          'Vendedor'
          'Nome do Vendedor'
          'Data da Venda'
          'Vig'#234'ncia'
          'Produto'
          'Descri'#231#227'o do Produto'
          'Quantidade'
          'Pre'#231'o'
          'Total Produto'
          'Qt Entregue'
          'Total Entregue'
          'Qt Pendente'
          'Total Pendente')
        ColumnSize.Stretch = True
        ColumnSize.StretchColumn = 11
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
        FixedRowHeight = 40
        FixedFont.Charset = DEFAULT_CHARSET
        FixedFont.Color = clWindowText
        FixedFont.Height = -11
        FixedFont.Name = 'Tahoma'
        FixedFont.Style = [fsBold]
        FloatFormat = '%.2n'
        FloatingFooter.Visible = True
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
        SortSettings.UndoSort = True
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
            FieldName = 'numero'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Pitch = fpVariable
            Font.Style = []
            Header = 'Nr'#186
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
            ShowBands = True
            Width = 45
          end
          item
            Borders = []
            BorderPen.Color = clSilver
            CheckFalse = 'N'
            CheckTrue = 'Y'
            Color = clWindow
            FieldName = 'situacao_licitacao'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Pitch = fpVariable
            Font.Style = []
            Header = 'Situa'#231#227'o'
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
            ReadOnly = True
            ShowBands = True
            Width = 54
          end
          item
            Borders = []
            BorderPen.Color = clSilver
            CheckFalse = 'N'
            CheckTrue = 'Y'
            Color = clWindow
            FieldName = 'cliente'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Pitch = fpVariable
            Font.Style = []
            Header = 'Cliente'
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
            ShowBands = True
            Width = 44
          end
          item
            Borders = []
            BorderPen.Color = clSilver
            CheckFalse = 'N'
            CheckTrue = 'Y'
            Color = clWindow
            FieldName = 'nomecliente'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Pitch = fpVariable
            Font.Style = []
            Header = 'Nome do Cliente'
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
            ShowBands = True
            Width = 151
          end
          item
            Borders = []
            BorderPen.Color = clSilver
            CheckFalse = 'N'
            CheckTrue = 'Y'
            Color = clWindow
            FieldName = 'ufcliente'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Pitch = fpVariable
            Font.Style = []
            Header = 'UF'
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
            ShowBands = True
            Width = 22
          end
          item
            Borders = []
            BorderPen.Color = clSilver
            CheckFalse = 'N'
            CheckTrue = 'Y'
            Color = clWindow
            FieldName = 'vendedor'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Pitch = fpVariable
            Font.Style = []
            Header = 'Vendedor'
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
            ShowBands = True
            Width = 32
          end
          item
            Borders = []
            BorderPen.Color = clSilver
            CheckFalse = 'N'
            CheckTrue = 'Y'
            Color = clWindow
            FieldName = 'nomevendedor'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Pitch = fpVariable
            Font.Style = []
            Header = 'Nome do Vendedor'
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
            ShowBands = True
            Width = 73
          end
          item
            Borders = []
            BorderPen.Color = clSilver
            CheckFalse = 'N'
            CheckTrue = 'Y'
            Color = clWindow
            FieldName = 'datavenda'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Pitch = fpVariable
            Font.Style = []
            Header = 'Data da Venda'
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
            ShowBands = True
            Width = 67
          end
          item
            Borders = []
            BorderPen.Color = clSilver
            CheckFalse = 'N'
            CheckTrue = 'Y'
            Color = clWindow
            FieldName = 'vigencia'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Pitch = fpVariable
            Font.Style = []
            Header = 'Vig'#234'ncia'
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
            ShowBands = True
            Width = 74
          end
          item
            Borders = []
            BorderPen.Color = clSilver
            CheckFalse = 'N'
            CheckTrue = 'Y'
            Color = clWindow
            FieldName = 'produtovisual'
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
            ReadOnly = True
            ShowBands = True
            Width = 92
          end
          item
            Borders = []
            BorderPen.Color = clSilver
            CheckFalse = 'N'
            CheckTrue = 'Y'
            Color = clWindow
            FieldName = 'produtodescricao'
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
            ReadOnly = True
            ShowBands = True
            Width = 304
          end
          item
            Alignment = taRightJustify
            Borders = []
            BorderPen.Color = clSilver
            CheckFalse = 'N'
            CheckTrue = 'Y'
            Color = clWindow
            Editor = edNumeric
            FieldName = 'quantidade'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Pitch = fpVariable
            Font.Style = []
            Header = 'Quantidade'
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
            ShowBands = True
            Width = 64
          end
          item
            Alignment = taRightJustify
            Borders = []
            BorderPen.Color = clSilver
            CheckFalse = 'N'
            CheckTrue = 'Y'
            Color = clWindow
            Editor = edNumeric
            FieldName = 'preco'
            FloatFormat = '%.2n'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Pitch = fpVariable
            Font.Style = []
            Header = 'Pre'#231'o'
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
            ShowBands = True
            Width = 57
          end
          item
            Alignment = taRightJustify
            Borders = []
            BorderPen.Color = clSilver
            CheckFalse = 'N'
            CheckTrue = 'Y'
            Color = clWindow
            Editor = edNumeric
            FieldName = 'aliquotaipi'
            FloatFormat = '%.2n'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Pitch = fpVariable
            Font.Style = []
            Header = '% IPI'
            HeaderFont.Charset = DEFAULT_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -11
            HeaderFont.Name = 'Tahoma'
            HeaderFont.Pitch = fpVariable
            HeaderFont.Style = []
            HeaderAlignment = taCenter
            PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
            PrintFont.Charset = DEFAULT_CHARSET
            PrintFont.Color = clWindowText
            PrintFont.Height = -11
            PrintFont.Name = 'Tahoma'
            PrintFont.Pitch = fpVariable
            PrintFont.Style = []
            ReadOnly = True
            ShowBands = True
            Width = 64
          end
          item
            Alignment = taRightJustify
            Borders = []
            BorderPen.Color = clSilver
            CheckFalse = 'N'
            CheckTrue = 'Y'
            Color = clWindow
            Editor = edNumeric
            FieldName = 'valordesconto'
            FloatFormat = '%.2n'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Pitch = fpVariable
            Font.Style = []
            Header = 'Valor do Desconto'
            HeaderFont.Charset = DEFAULT_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -11
            HeaderFont.Name = 'Tahoma'
            HeaderFont.Pitch = fpVariable
            HeaderFont.Style = []
            HeaderAlignment = taCenter
            PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
            PrintFont.Charset = DEFAULT_CHARSET
            PrintFont.Color = clWindowText
            PrintFont.Height = -11
            PrintFont.Name = 'Tahoma'
            PrintFont.Pitch = fpVariable
            PrintFont.Style = []
            ReadOnly = True
            ShowBands = True
            Width = 64
          end
          item
            Alignment = taRightJustify
            Borders = []
            BorderPen.Color = clSilver
            CheckFalse = 'N'
            CheckTrue = 'Y'
            Color = clWindow
            Editor = edNumeric
            FieldName = 'valoripi'
            FloatFormat = '%.2n'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Pitch = fpVariable
            Font.Style = []
            Header = 'Total IPI'
            HeaderFont.Charset = DEFAULT_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -11
            HeaderFont.Name = 'Tahoma'
            HeaderFont.Pitch = fpVariable
            HeaderFont.Style = []
            HeaderAlignment = taCenter
            PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
            PrintFont.Charset = DEFAULT_CHARSET
            PrintFont.Color = clWindowText
            PrintFont.Height = -11
            PrintFont.Name = 'Tahoma'
            PrintFont.Pitch = fpVariable
            PrintFont.Style = []
            ReadOnly = True
            ShowBands = True
            Width = 57
          end
          item
            Alignment = taRightJustify
            Borders = []
            BorderPen.Color = clSilver
            CheckFalse = 'N'
            CheckTrue = 'Y'
            Color = clWindow
            Editor = edNumeric
            FieldName = 'totalproduto'
            FloatFormat = '%.2n'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Pitch = fpVariable
            Font.Style = []
            Header = 'Total Produto'
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
            ShowBands = True
            Width = 56
          end
          item
            Alignment = taRightJustify
            Borders = []
            BorderPen.Color = clSilver
            CheckFalse = 'N'
            CheckTrue = 'Y'
            Color = clWindow
            Editor = edNumeric
            FieldName = 'quantidadenotafiscal'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Pitch = fpVariable
            Font.Style = []
            Header = 'Qt Entregue'
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
            ShowBands = True
            Width = 57
          end
          item
            Alignment = taRightJustify
            Borders = []
            BorderPen.Color = clSilver
            CheckFalse = 'N'
            CheckTrue = 'Y'
            Color = clWindow
            Editor = edNumeric
            FieldName = 'totalprodutoentregue'
            FloatFormat = '%.2n'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Pitch = fpVariable
            Font.Style = []
            Header = 'Total Entregue'
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
            ShowBands = True
            Width = 64
          end
          item
            Alignment = taRightJustify
            Borders = []
            BorderPen.Color = clSilver
            CheckFalse = 'N'
            CheckTrue = 'Y'
            Color = clWindow
            Editor = edNumeric
            FieldName = 'quantidadependente'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Pitch = fpVariable
            Font.Style = []
            Header = 'Qt Pendente'
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
            ShowBands = True
            Width = 54
          end
          item
            Alignment = taRightJustify
            Borders = []
            BorderPen.Color = clSilver
            CheckFalse = 'N'
            CheckTrue = 'Y'
            Color = clWindow
            Editor = edNumeric
            FieldName = 'totalprodutopendente'
            FloatFormat = '%.2n'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Pitch = fpVariable
            Font.Style = []
            Header = 'Total Pendente'
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
            ShowBands = True
            Width = 64
          end>
        DataSource = dtmConsultaLicitacoes.dsrConsultaLicitacoes
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
        UseDBFieldWidths = True
        PostOnEnter = False
        ColWidths = (
          20
          45
          54
          44
          151
          22
          32
          73
          67
          74
          92
          304
          64
          57
          64
          64
          57
          56
          57
          64
          54
          64)
        RowHeights = (
          40
          22)
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 1584
        Height = 1
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
      end
    end
  end
  inherited pnlBarra: TPanel [2]
    Left = 0
    Top = 814
    Width = 1592
    Height = 20
    Align = alBottom
    Caption = 'CTRL X - Exportar | CTRL F Pesquisar | Bot'#227'o Direito - Menu'
    TabOrder = 2
    inherited bvlBotoesEd: TBevel
      Left = 2
      Top = -5
    end
  end
  object AdvGridFindDialog1: TAdvGridFindDialog
    AutoPosition = False
    Grid = DBAdvGridLicitacoes
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
    AdvStringGrid = DBAdvGridLicitacoes
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
    object Copia1: TMenuItem
      Caption = 'Copiar'
      ShortCut = 16451
      OnClick = Copia1Click
    end
  end
end
