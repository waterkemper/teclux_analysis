inherited frmConsultaRomaneios: TfrmConsultaRomaneios
  Left = 325
  Top = 36
  Caption = 'Consulta de Romaneios'
  ClientHeight = 630
  ClientWidth = 1088
  Font.Color = clWindowText
  Font.Name = 'Arial'
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlTopMenu: TPanel
    Width = 1088
    inherited tblBarra: TToolBar
      Width = 1087
      inherited sbnProcurar: TSpeedButton
        Visible = False
      end
      object sbnGerar: TSpeedButton
        Left = 84
        Top = 2
        Width = 75
        Height = 39
        Hint = 'Selecionar os contratos'
        Caption = 'Gerar F6'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
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
      object sbnRomaneio: TSpeedButton
        Left = 159
        Top = 2
        Width = 90
        Height = 39
        Hint = 'Acessar o romaneio'
        Caption = 'Romaneio F8'
        Flat = True
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
        Spacing = 0
        OnClick = sbnRomaneioClick
      end
    end
  end
  object pgcConsultaRomaneios: TtecPageControl
    Left = 0
    Top = 45
    Width = 1088
    Height = 585
    ActivePage = tstDados
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object tstParametrosSelecao: TTabSheet
      Caption = 'Par'#226'metros'
      inline fraListaFiliaisEmissao: TfraListaFiliais
        Left = 8
        Top = 120
        Width = 326
        Height = 144
        TabOrder = 3
        inherited gbxFiliais: TGroupBox
          Height = 144
          Caption = 'LISTA DE FILIAIS DE EMISS'#195'O'
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          ParentFont = False
          inherited clbFiliais: TCheckListBox
            Left = 2
            Top = 14
            Height = 128
            Align = alLeft
          end
        end
      end
      inline fraListaFiliaisDestino: TfraListaFiliais
        Left = 341
        Top = 120
        Width = 326
        Height = 144
        TabOrder = 4
        inherited gbxFiliais: TGroupBox
          Height = 144
          Caption = 'LISTA DE FILIAIS DE DESTINO'
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          ParentFont = False
          inherited clbFiliais: TCheckListBox
            Left = 2
            Top = 14
            Height = 128
            Align = alLeft
          end
        end
      end
      object gbxListadeClientes: TGroupBox
        Left = 8
        Top = 266
        Width = 660
        Height = 143
        Caption = ' LISTA DE CLIENTES ENVOLVIDOS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'HELVETICA'
        Font.Pitch = fpVariable
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
        inline fraSelecaoAleatoriaClientes1: TfraSelecaoAleatoriaClientes
          Left = 2
          Top = 16
          Width = 656
          Height = 125
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
            Width = 656
            Height = 125
            Font.Height = -12
            Font.Name = 'HELVETICA'
            Font.Pitch = fpVariable
            Font.Style = [fsBold]
            ParentFont = False
            inherited Splitter1: TSplitter
              Left = 625
              Height = 110
            end
            inherited dbgSelecaoAleatoria: TtecDBGrid
              Width = 625
              Height = 110
              Font.Height = -11
              DefaultRowHeight = 18
            end
            inherited pnlLabels: TPanel
              Left = 628
              Height = 110
            end
            inherited pnlAbaixo: TPanel
              Top = 110
              Width = 656
              inherited lblOrientacao: TLabel
                Width = 291
                Height = 15
                Caption = '[CTRL+F9] para pesquisa  e  [CTRL+Del] para excluir'
                Font.Height = -12
                Font.Name = 'HELVETICA'
              end
              inherited pnlAbaixoDireita: TPanel
                Left = 625
                Font.Pitch = fpVariable
              end
            end
          end
        end
      end
      object GroupBox1: TGroupBox
        Left = 8
        Top = 413
        Width = 660
        Height = 137
        Caption = ' LISTA DE FORNECEDORES DE TRANSPORTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'HELVETICA'
        Font.Pitch = fpVariable
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 6
        inline fraSelecaoAleatoriaFornecedores1: TfraSelecaoAleatoriaClientes
          Left = 2
          Top = 16
          Width = 656
          Height = 119
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
            Width = 656
            Height = 119
            inherited Splitter1: TSplitter
              Left = 625
              Height = 104
            end
            inherited dbgSelecaoAleatoria: TtecDBGrid
              Width = 625
              Height = 104
            end
            inherited pnlLabels: TPanel
              Left = 628
              Height = 104
            end
            inherited pnlAbaixo: TPanel
              Top = 104
              Width = 656
              inherited pnlAbaixoDireita: TPanel
                Left = 625
                Font.Pitch = fpVariable
              end
            end
          end
        end
      end
      object gbxSituacao: TGroupBox
        Left = 174
        Top = 24
        Width = 115
        Height = 51
        Caption = 'Tipo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object ckbTipo: TCheckListBox
          Left = 5
          Top = 16
          Width = 108
          Height = 32
          BorderStyle = bsNone
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = []
          ItemHeight = 15
          Items.Strings = (
            'Normal'
            'Transfer'#234'ncia')
          ParentFont = False
          TabOrder = 0
        end
      end
      inline fraIntervaloDatas: TfraIntervaloDatas
        Left = 9
        Top = 39
        Width = 162
        Height = 36
        Constraints.MaxHeight = 36
        Constraints.MaxWidth = 1069
        Constraints.MinHeight = 36
        Constraints.MinWidth = 162
        TabOrder = 0
        inherited gbxPeriodo: TGroupBox
          Align = alNone
        end
      end
      object gbxStatus: TGroupBox
        Left = 294
        Top = -3
        Width = 139
        Height = 124
        Caption = 'Situa'#231#227'o'
        TabOrder = 2
        object ckbSituacao: TCheckListBox
          Left = 5
          Top = 16
          Width = 132
          Height = 105
          BorderStyle = bsNone
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = []
          ItemHeight = 15
          Items.Strings = (
            'Aberta'
            'Confirmada'
            'Confirmada Parcial'
            'Em Tr'#226'nsito'
            'Entregue'
            'Entregue Parcial'
            'Fechada')
          ParentFont = False
          TabOrder = 0
        end
      end
    end
    object tstDados: TTabSheet
      Caption = 'Registros Selecionados'
      ImageIndex = 1
      object dbgRomaneios: TDBAdvGrid
        Left = 0
        Top = 0
        Width = 1080
        Height = 312
        Cursor = crDefault
        Align = alClient
        ColCount = 13
        RowCount = 2
        FixedRows = 1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
        ParentFont = False
        PopupMenu = AdvPopupMenu1
        ScrollBars = ssBoth
        TabOrder = 0
        ActiveRowShow = True
        OnGetCellColor = dbgRomaneiosGetCellColor
        OnRowChanging = dbgRomaneiosRowChanging
        ActiveCellShow = True
        ActiveCellFont.Charset = DEFAULT_CHARSET
        ActiveCellFont.Color = clWindowText
        ActiveCellFont.Height = -11
        ActiveCellFont.Name = 'Tahoma'
        ActiveCellFont.Style = [fsBold]
        Bands.Active = True
        Bands.PrimaryColor = clWindow
        Bands.SecondaryColor = cl3DLight
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
            Alignment = taRightJustify
            Borders = []
            BorderPen.Color = clSilver
            CheckFalse = 'N'
            CheckTrue = 'Y'
            Color = clWindow
            FieldName = 'numero'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Pitch = fpVariable
            Font.Style = []
            HeaderFont.Charset = DEFAULT_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -13
            HeaderFont.Name = 'Tahoma'
            HeaderFont.Pitch = fpVariable
            HeaderFont.Style = []
            PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
            PrintFont.Charset = DEFAULT_CHARSET
            PrintFont.Color = clWindowText
            PrintFont.Height = -13
            PrintFont.Name = 'Tahoma'
            PrintFont.Pitch = fpVariable
            PrintFont.Style = []
            Width = 51
          end
          item
            Borders = []
            BorderPen.Color = clSilver
            CheckFalse = 'N'
            CheckTrue = 'Y'
            Color = clWindow
            EditLength = 18
            FieldName = 'situacao_romaneio'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Pitch = fpVariable
            Font.Style = []
            HeaderFont.Charset = DEFAULT_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -13
            HeaderFont.Name = 'Tahoma'
            HeaderFont.Pitch = fpVariable
            HeaderFont.Style = []
            PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
            PrintFont.Charset = DEFAULT_CHARSET
            PrintFont.Color = clWindowText
            PrintFont.Height = -13
            PrintFont.Name = 'Tahoma'
            PrintFont.Pitch = fpVariable
            PrintFont.Style = []
            Width = 85
          end
          item
            Alignment = taRightJustify
            Borders = []
            BorderPen.Color = clSilver
            CheckFalse = 'N'
            CheckTrue = 'Y'
            Color = clWindow
            FieldName = 'fornecedor'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Pitch = fpVariable
            Font.Style = []
            HeaderFont.Charset = DEFAULT_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -13
            HeaderFont.Name = 'Tahoma'
            HeaderFont.Pitch = fpVariable
            HeaderFont.Style = []
            PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
            PrintFont.Charset = DEFAULT_CHARSET
            PrintFont.Color = clWindowText
            PrintFont.Height = -13
            PrintFont.Name = 'Tahoma'
            PrintFont.Pitch = fpVariable
            PrintFont.Style = []
            Width = 72
          end
          item
            Borders = []
            BorderPen.Color = clSilver
            CheckFalse = 'N'
            CheckTrue = 'Y'
            Color = clWindow
            EditLength = 60
            FieldName = 'nomefornecedor'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Pitch = fpVariable
            Font.Style = []
            HeaderFont.Charset = DEFAULT_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -13
            HeaderFont.Name = 'Tahoma'
            HeaderFont.Pitch = fpVariable
            HeaderFont.Style = []
            PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
            PrintFont.Charset = DEFAULT_CHARSET
            PrintFont.Color = clWindowText
            PrintFont.Height = -13
            PrintFont.Name = 'Tahoma'
            PrintFont.Pitch = fpVariable
            PrintFont.Style = []
            Width = 178
          end
          item
            Alignment = taCenter
            Borders = []
            BorderPen.Color = clSilver
            CheckFalse = 'N'
            CheckTrue = 'Y'
            Color = clWindow
            EditMask = '99/99/9999;1; '
            FieldName = 'emissao'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Pitch = fpVariable
            Font.Style = []
            HeaderFont.Charset = DEFAULT_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -13
            HeaderFont.Name = 'Tahoma'
            HeaderFont.Pitch = fpVariable
            HeaderFont.Style = []
            PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
            PrintFont.Charset = DEFAULT_CHARSET
            PrintFont.Color = clWindowText
            PrintFont.Height = -13
            PrintFont.Name = 'Tahoma'
            PrintFont.Pitch = fpVariable
            PrintFont.Style = []
            Width = 75
          end
          item
            Borders = []
            BorderPen.Color = clSilver
            CheckFalse = 'N'
            CheckTrue = 'Y'
            Color = clWindow
            EditLength = 1
            FieldName = 'tipo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Pitch = fpVariable
            Font.Style = []
            HeaderFont.Charset = DEFAULT_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -13
            HeaderFont.Name = 'Tahoma'
            HeaderFont.Pitch = fpVariable
            HeaderFont.Style = []
            PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
            PrintFont.Charset = DEFAULT_CHARSET
            PrintFont.Color = clWindowText
            PrintFont.Height = -13
            PrintFont.Name = 'Tahoma'
            PrintFont.Pitch = fpVariable
            PrintFont.Style = []
            Width = 31
          end
          item
            Borders = []
            BorderPen.Color = clSilver
            CheckFalse = 'N'
            CheckTrue = 'Y'
            Color = clWindow
            EditLength = 20
            FieldName = 'descricaotipo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Pitch = fpVariable
            Font.Style = []
            HeaderFont.Charset = DEFAULT_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -13
            HeaderFont.Name = 'Tahoma'
            HeaderFont.Pitch = fpVariable
            HeaderFont.Style = []
            PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
            PrintFont.Charset = DEFAULT_CHARSET
            PrintFont.Color = clWindowText
            PrintFont.Height = -13
            PrintFont.Name = 'Tahoma'
            PrintFont.Pitch = fpVariable
            PrintFont.Style = []
            Width = 92
          end
          item
            Alignment = taRightJustify
            Borders = []
            BorderPen.Color = clSilver
            CheckFalse = 'N'
            CheckTrue = 'Y'
            Color = clWindow
            FieldName = 'documentopag'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Pitch = fpVariable
            Font.Style = []
            HeaderFont.Charset = DEFAULT_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -13
            HeaderFont.Name = 'Tahoma'
            HeaderFont.Pitch = fpVariable
            HeaderFont.Style = []
            PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
            PrintFont.Charset = DEFAULT_CHARSET
            PrintFont.Color = clWindowText
            PrintFont.Height = -13
            PrintFont.Name = 'Tahoma'
            PrintFont.Pitch = fpVariable
            PrintFont.Style = []
            Width = 76
          end
          item
            Alignment = taCenter
            Borders = []
            BorderPen.Color = clSilver
            CheckFalse = 'N'
            CheckTrue = 'Y'
            Color = clWindow
            EditMask = '99/99/9999;1; '
            FieldName = 'datapagto'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Pitch = fpVariable
            Font.Style = []
            HeaderFont.Charset = DEFAULT_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -13
            HeaderFont.Name = 'Tahoma'
            HeaderFont.Pitch = fpVariable
            HeaderFont.Style = []
            PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
            PrintFont.Charset = DEFAULT_CHARSET
            PrintFont.Color = clWindowText
            PrintFont.Height = -13
            PrintFont.Name = 'Tahoma'
            PrintFont.Pitch = fpVariable
            PrintFont.Style = []
            Width = 70
          end
          item
            Alignment = taRightJustify
            Borders = []
            BorderPen.Color = clSilver
            CheckFalse = 'N'
            CheckTrue = 'Y'
            Color = clWindow
            FieldName = 'valorpagto'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Pitch = fpVariable
            Font.Style = []
            HeaderFont.Charset = DEFAULT_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -13
            HeaderFont.Name = 'Tahoma'
            HeaderFont.Pitch = fpVariable
            HeaderFont.Style = []
            PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
            PrintFont.Charset = DEFAULT_CHARSET
            PrintFont.Color = clWindowText
            PrintFont.Height = -13
            PrintFont.Name = 'Tahoma'
            PrintFont.Pitch = fpVariable
            PrintFont.Style = []
            Width = 75
          end
          item
            Borders = []
            BorderPen.Color = clSilver
            CheckFalse = 'N'
            CheckTrue = 'Y'
            Color = clWindow
            EditLength = 100
            FieldName = 'nomeusuarioconferencia'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Pitch = fpVariable
            Font.Style = []
            HeaderFont.Charset = DEFAULT_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -13
            HeaderFont.Name = 'Tahoma'
            HeaderFont.Pitch = fpVariable
            HeaderFont.Style = []
            PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
            PrintFont.Charset = DEFAULT_CHARSET
            PrintFont.Color = clWindowText
            PrintFont.Height = -13
            PrintFont.Name = 'Tahoma'
            PrintFont.Pitch = fpVariable
            PrintFont.Style = []
            Width = 127
          end
          item
            Alignment = taCenter
            Borders = []
            BorderPen.Color = clSilver
            CheckFalse = 'N'
            CheckTrue = 'Y'
            Color = clWindow
            EditMask = '99/99/99 99:99;1; '
            FieldName = 'datahorausuarioconferencia'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Pitch = fpVariable
            Font.Style = []
            HeaderFont.Charset = DEFAULT_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -13
            HeaderFont.Name = 'Tahoma'
            HeaderFont.Pitch = fpVariable
            HeaderFont.Style = []
            PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
            PrintFont.Charset = DEFAULT_CHARSET
            PrintFont.Color = clWindowText
            PrintFont.Height = -13
            PrintFont.Name = 'Tahoma'
            PrintFont.Pitch = fpVariable
            PrintFont.Style = []
            Width = 99
          end>
        DataSource = dtmConsultaRomaneios.dsrRomaneios
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
          51
          85
          72
          178
          75
          31
          92
          76
          70
          75
          127
          99)
      end
      object gbxItensRomaneios: TGroupBox
        Left = 0
        Top = 312
        Width = 1080
        Height = 200
        Align = alBottom
        Caption = ' NOTAS E CUPONS DO ROMANEIO '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object dbgItensRomaneio: TtecDBGrid
          Left = 10
          Top = 22
          Width = 1047
          Height = 203
          DataSource = dtmConsultaRomaneios.dsrRomaneiosNotas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlack
          TitleFont.Height = -13
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
          ShowWhenFieldInvisible = False
          CanClickWhenEditing = False
          Columns = <
            item
              Expanded = False
              FieldName = 'nomefilial'
              Title.Alignment = taCenter
              Title.Caption = 'FILIAL'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'helvetica'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Width = 79
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'serie'
              Title.Alignment = taCenter
              Title.Caption = 'S'#201'RIE'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'helvetica'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Width = 35
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'numero_nf'
              Title.Alignment = taCenter
              Title.Caption = 'N'#186' NOTA'
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
              Alignment = taCenter
              Expanded = False
              FieldName = 'maquina'
              Title.Alignment = taCenter
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'helvetica'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Width = 35
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'intervensao'
              Title.Alignment = taCenter
              Title.Caption = 'INT'
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
              FieldName = 'numero_cupom'
              Title.Alignment = taCenter
              Title.Caption = 'N'#186' CUPOM'
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
              FieldName = 'dataemissao'
              Title.Alignment = taCenter
              Title.Caption = 'EMISS'#195'O'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'helvetica'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Width = 72
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'entrega'
              Title.Alignment = taCenter
              Title.Caption = 'ENTREGA'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'helvetica'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Width = 73
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'valor'
              Title.Alignment = taCenter
              Title.Caption = 'VALOR FRETE'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'helvetica'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Width = 71
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'cancelado'
              Title.Alignment = taCenter
              Title.Caption = 'ANULADO'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'helvetica'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Width = 58
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'data_hora_recebimento'
              Title.Caption = 'DATA/HORA ASS.'
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
              Expanded = False
              FieldName = 'cliente'
              Title.Caption = 'CLIENTE'
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
              FieldName = 'nomecliente'
              Title.Caption = 'NOME DO CLIENTE'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -9
              Title.Font.Name = 'helvetica'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Width = 175
              Visible = True
            end>
        end
        object gbxNotaFiscal: TGroupBox
          Left = 103
          Top = 11
          Width = 98
          Height = 14
          Caption = ' NOTA FISCAL '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object gbxCupomFiscal: TGroupBox
          Left = 199
          Top = 11
          Width = 138
          Height = 14
          Caption = ' CUPOM FISCAL '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
      end
      object gbxObservacao: TGroupBox
        Left = 0
        Top = 512
        Width = 1080
        Height = 42
        Align = alBottom
        Caption = ' OBSERVA'#199#213'ES '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        object mmoObservacoes: TtecDBMemo
          Left = 2
          Top = 14
          Width = 1076
          Height = 26
          Align = alClient
          DataField = 'observacao'
          DataSource = dtmConsultaRomaneios.dsrRomaneiosNotas
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
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 292
    Top = 16
  end
  object AdvPopupMenu1: TAdvPopupMenu
    Version = '2.5.4.0'
    Left = 640
    Top = 206
    object Pesquizar1: TMenuItem
      Caption = 'Pesquisar'
      ShortCut = 16504
      OnClick = Pesquizar1Click
    end
    object ExportarExcel1: TMenuItem
      Caption = 'Exportar Excel'
      ShortCut = 16472
      OnClick = ExportarExcel1Click
    end
  end
  object AdvGridExcelIO1: TAdvGridExcelIO
    AdvStringGrid = dbgRomaneios
    Options.ExportOverwriteMessage = 'File %s already exists'#13'Ok to overwrite ?'
    Options.ExportHiddenColumns = True
    Options.ExportRawRTF = False
    Options.ExportShowInExcel = True
    UseUnicode = False
    GridStartRow = 0
    Version = '3.4.1'
    Left = 542
    Top = 190
  end
  object AdvGridFindDialog1: TAdvGridFindDialog
    AutoPosition = False
    Grid = dbgRomaneios
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
end
