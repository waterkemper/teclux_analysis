inherited frmControleLocalizacoes: TfrmControleLocalizacoes
  Left = 360
  Top = 123
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  Caption = 'Controle de Localiza'#231#245'es'
  ClientHeight = 532
  ClientWidth = 1034
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBarra: TPanel
    Left = 0
    Top = 532
    Width = 1034
    Height = 0
    Align = alBottom
  end
  inherited pnlTopMenu: TPanel
    Width = 1034
    inherited tblBarra: TToolBar
      Left = 375
      Width = 659
    end
    inherited tblBarraCadastro: TToolBar
      Width = 375
      inherited sbnIncluir: TSpeedButton
        Visible = False
      end
      inherited sbnExcluir: TSpeedButton
        Visible = False
      end
      object sbnGerar: TSpeedButton
        Left = 225
        Top = 2
        Width = 75
        Height = 39
        Hint = 'Gerar resultado da consulta e acrescentar '#224' lista'
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
      object sbnImprimir: TSpeedButton
        Left = 300
        Top = 2
        Width = 75
        Height = 39
        Caption = 'Imprimir F7'
        Flat = True
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
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          0000000000000000000000000000000000000000000000000000000000000000
          00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC80808080808080808080808080808080
          8080808080808080808080808080808080FFFFFFDCDCDCDCDCDCDCDCDC000000
          C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3000000C3C3
          C3000000DCDCDCDCDCDCDCDCDC808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDC808080DCDCDC808080FFFFFFDCDCDC000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00C3C3C3000000DCDCDC80808080808080808080808080808080808080808080
          8080808080808080808080808080808080DCDCDC808080DCDCDC000000C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C3C300FFFF00FFFF00FFFFC3C3C3C3C3C30000
          00000000000000DCDCDC808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCA0
          A0A0A0A0A0A0A0A0DCDCDCDCDCDC808080808080808080DCDCDC000000C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C3C30000FF0000FF0000FFC3C3C3C3C3C30000
          00C3C3C3000000DCDCDC808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF80
          8080808080808080FFFFFFFFFFFF808080DCDCDC808080FFFFFF000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00C3C3C3C3C3C300000080808080808080808080808080808080808080808080
          8080808080808080808080808080808080FFFFFFDCDCDC808080000000C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3000000C3C3
          C3000000C3C3C3000000808080DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDC808080DCDCDC808080FFFFFF808080DCDCDC000000
          000000000000000000000000000000000000000000000000000000C3C3C30000
          00C3C3C3000000000000DCDCDC80808080808080808080808080808080808080
          8080808080808080808080FFFFFF808080DCDCDC808080808080DCDCDCDCDCDC
          000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000C3C3
          C3000000C3C3C3000000DCDCDCDCDCDC808080DCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDC808080FFFFFF808080DCDCDC808080DCDCDCDCDCDC
          DCDCDC000000FFFFFF000000000000000000000000000000FFFFFF0000000000
          00000000000000DCDCDCDCDCDCDCDCDCDCDCDC808080DCDCDC80808080808080
          8080808080808080DCDCDC808080808080808080808080DCDCDCDCDCDCDCDCDC
          DCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
          00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC808080DCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDC808080FFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDC000000FFFFFF000000000000000000000000000000FFFFFF0000
          00DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC808080DCDCDC80808080
          8080808080808080808080DCDCDC808080FFFFFFDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDC000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF000000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC808080DCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC808080FFFFFFDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDC0000000000000000000000000000000000000000000000
          00000000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC80808080808080
          8080808080808080808080808080808080808080FFFFFFDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC}
        Layout = blGlyphTop
        NumGlyphs = 2
        ParentFont = False
        Spacing = 0
        OnClick = sbnImprimirClick
      end
    end
  end
  object AdvPageControlControleLocalizacoes: TAdvPageControl
    Left = 0
    Top = 45
    Width = 1034
    Height = 487
    ActivePage = AdvTabSheetCadastroLocalizacao
    ActiveFont.Charset = DEFAULT_CHARSET
    ActiveFont.Color = clWindowText
    ActiveFont.Height = -11
    ActiveFont.Name = 'Tahoma'
    ActiveFont.Style = [fsBold]
    Align = alClient
    TabBackGroundColor = clBtnFace
    TabMargin.LeftMargin = 5
    TabMargin.RightMargin = 0
    TabOverlap = 0
    TabStyle = tsDelphi
    Version = '2.0.0.3'
    PersistPagesState.Location = plRegistry
    PersistPagesState.Enabled = False
    TabOrder = 2
    TabWidth = 100
    OnChange = AdvPageControlControleLocalizacoesChange
    object AdvTabSheetCadastroLocalizacao: TAdvTabSheet
      Caption = 'Cadastro'
      Color = clBtnFace
      ColorTo = clNone
      TabColor = clBtnFace
      TabColorTo = clNone
      object pnlParametros: TPanel
        Left = 0
        Top = 0
        Width = 1026
        Height = 83
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object gbxLocalizacoes: TGroupBox
          Left = 6
          Top = 46
          Width = 228
          Height = 36
          Caption = 'LOCALIZA'#199#195'O'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          inline fraConsultaLocalizacoes: TfraConsultaCodigo
            Left = 3
            Top = 10
            Width = 222
            Height = 24
            HorzScrollBar.Range = 496
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
              Left = 200
            end
            inherited dtxDescricao: TtecDBText
              Left = 311
              Top = 1
              Width = 0
              DataField = 'nome'
              DataSource = fraConsultaFilial.dsrProcuraFiliais
            end
            inherited edfCodigo: TtecDBFindLookup
              Left = -1
              Top = 1
              Width = 202
              DataField = 'localizacao'
              DataSource = fraConsultaLocalizacoes.dsrProcuraLocalizaoEstoque
              Group = 'localizacao'
              MaxLength = -1
              OnChange = fraConsultaLocalizacoesedfCodigoChange
              OnFound = nil
              Operacao = opPESQUISA
              Parameter = 'localizacao'
              ActiveSetControls = False
              DenyInsert = False
              NoSetControls = <>
              SetControls = <>
            end
          end
        end
        object gbxSubLocalizacoes: TGroupBox
          Left = 238
          Top = 46
          Width = 228
          Height = 36
          Caption = 'SUB LOCALIZA'#199#195'O'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          inline fraConsultaSubLocalizacoes: TfraConsultaCodigo
            Left = 3
            Top = 10
            Width = 222
            Height = 24
            HorzScrollBar.Range = 496
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
              Left = 200
            end
            inherited dtxDescricao: TtecDBText
              Left = 311
              Top = 1
              Width = 0
              DataField = 'nome'
              DataSource = fraConsultaFilial.dsrProcuraFiliais
            end
            inherited edfCodigo: TtecDBFindLookup
              Left = -1
              Top = 1
              Width = 202
              DataField = 'sublocalizacao'
              DataSource = fraConsultaSubLocalizacoes.dsrProcuraSubLocalizacaoEstoque
              Group = 'sublocalizacao'
              MaxLength = -1
              OnChange = fraConsultaSubLocalizacoesedfCodigoChange
              OnFound = nil
              Operacao = opPESQUISA
              Parameter = 'sublocalizacao'
              ActiveSetControls = False
              DenyInsert = False
              NoSetControls = <>
              SetControls = <>
            end
          end
        end
        object gbxFilial: TGroupBox
          Left = 6
          Top = 6
          Width = 459
          Height = 36
          Caption = 'FILIAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          inline fraConsultaFilial: TfraConsultaCodigo
            Left = 3
            Top = 10
            Width = 451
            Height = 24
            HorzScrollBar.Range = 496
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
            inherited dtxDescricao: TtecDBText
              Left = 87
              Top = 1
              DataField = 'nome'
              DataSource = fraConsultaFilial.dsrProcuraFiliais
            end
            inherited edfCodigo: TtecDBFindLookup
              Left = -1
              Top = 1
              DataField = 'codigo'
              DataSource = fraConsultaFilial.dsrProcuraFiliais
              Group = 'filial'
              MaxLength = 4
              OnFound = nil
              Operacao = opPESQUISA
              Parameter = 'codigo'
              ActiveSetControls = False
              DenyInsert = True
              NoSetControls = <>
              SetControls = <>
            end
          end
        end
        object gbxLocSubLoc: TGroupBox
          Left = 470
          Top = 46
          Width = 535
          Height = 36
          Caption = 'LOCALIZA'#199#195'O E SUBLOCALIZA'#199#195'O [ETIQUETAS]'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          object edtLocSubLoc: TEditTexto
            Left = 5
            Top = 11
            Width = 524
            Height = 23
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            MaxLength = -1
            ParentFont = False
            TabOrder = 0
            OnKeyDown = edtLocSubLocKeyDown
            CharCasenoDefault = False
            Alignment = taLeftJustify
          end
        end
      end
      object pnlLeitura: TPanel
        Left = 0
        Top = 83
        Width = 1026
        Height = 45
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object gbxCodigoBarras: TGroupBox
          Left = 7
          Top = 4
          Width = 1002
          Height = 37
          Hint = 'Selecionar '#237'tens e acrescentar '#224' lista'
          Caption = 'F11 PARA TROCAR - C'#211'DIGO DE BARRAS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        inline fraConsultaEstoqueitemPRODUTOS: TfraConsultaCodigo
          Left = 9
          Top = 15
          Width = 997
          Height = 23
          HorzScrollBar.Range = 497
          VertScrollBar.Range = 23
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
            Left = 232
          end
          inherited dtxDescricao: TtecDBText
            Left = 256
            Width = 739
            DataField = 'descricao'
            DataSource = fraConsultaEstoqueitemPRODUTOS.dsrProcuraEstoqueItemProdutos
          end
          inherited edfCodigo: TtecDBFindLookup
            Width = 233
            DataField = 'codigobarras'
            DataSource = fraConsultaEstoqueitemPRODUTOS.dsrProcuraEstoqueItemProdutos
            Group = 'codigovisual'
            MaxLength = -1
            OnFound = nil
            OnKeyDown = fraConsultaEstoqueitemPRODUTOSedfCodigoKeyDown
            Operacao = opPESQUISA
            ExibirMensagem = False
            Parameter = 'produtovisual'
            ActiveSetControls = False
            DenyInsert = True
            NoSetControls = <>
            SetControls = <>
          end
        end
      end
      object gbxProdutosSelecionados: TGroupBox
        Left = 0
        Top = 128
        Width = 1026
        Height = 331
        Align = alClient
        Caption = 'PRODUTOS SELECIONADOS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'HELVETICA'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        object dbgProdutosLocalizacao: TDBAdvGrid
          Left = 2
          Top = 14
          Width = 990
          Height = 315
          Cursor = crDefault
          TabStop = False
          Align = alClient
          ColCount = 10
          RowCount = 2
          FixedRows = 1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Pitch = fpVariable
          Font.Style = []
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing, goTabs]
          ParentFont = False
          ScrollBars = ssBoth
          TabOrder = 0
          OnCanSort = dbgProdutosLocalizacaoCanSort
          ActiveCellFont.Charset = DEFAULT_CHARSET
          ActiveCellFont.Color = clWindowText
          ActiveCellFont.Height = -11
          ActiveCellFont.Name = 'Tahoma'
          ActiveCellFont.Style = [fsBold]
          AutoNumAlign = True
          Bands.Active = True
          ColumnHeaders.Strings = (
            'N'#186
            'PRODUTO'
            'DESCRI'#199#195'O'
            'LINHA'
            'COLUNA'
            'LOCALIZA'#199#195'O'
            'REMOVER'
            'SUBLOCALIZA'#199#195'O'
            'REMOVER'
            '')
          ColumnSize.Stretch = True
          ColumnSize.StretchColumn = 2
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
          EnhRowColMove = False
          Filter = <>
          FilterDropDown.Font.Charset = DEFAULT_CHARSET
          FilterDropDown.Font.Color = clWindowText
          FilterDropDown.Font.Height = -11
          FilterDropDown.Font.Name = 'MS Sans Serif'
          FilterDropDown.Font.Style = []
          FilterDropDownClear = '(All)'
          FixedColWidth = 30
          FixedRowHeight = 22
          FixedFont.Charset = DEFAULT_CHARSET
          FixedFont.Color = clWindowText
          FixedFont.Height = -11
          FixedFont.Name = 'Tahoma'
          FixedFont.Style = [fsBold]
          FloatFormat = '%.2f'
          Navigation.AllowInsertRow = True
          Navigation.AdvanceOnEnterLoop = False
          Navigation.AdvanceInsert = True
          Navigation.InsertPosition = pInsertAfter
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
          AutoCreateColumns = True
          AutoRemoveColumns = True
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
              Font.Name = 'MS Sans Serif'
              Font.Pitch = fpVariable
              Font.Style = []
              Header = 'N'#186
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
              ShowBands = True
              Width = 30
            end
            item
              Borders = []
              BorderPen.Color = clSilver
              CheckFalse = 'N'
              CheckTrue = 'Y'
              Color = clWindow
              FieldName = 'codigovisual'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Pitch = fpVariable
              Font.Style = []
              Header = 'PRODUTO'
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
              ReadOnly = True
              ShowBands = True
              Width = 154
            end
            item
              Borders = []
              BorderPen.Color = clSilver
              CheckFalse = 'N'
              CheckTrue = 'Y'
              Color = clWindow
              FieldName = 'descricao'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Pitch = fpVariable
              Font.Style = []
              Header = 'DESCRI'#199#195'O'
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
              ReadOnly = True
              ShowBands = True
              Width = 229
            end
            item
              Borders = []
              BorderPen.Color = clSilver
              CheckFalse = 'N'
              CheckTrue = 'Y'
              Color = clWindow
              FieldName = 'valorgrade1'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Pitch = fpVariable
              Font.Style = []
              Header = 'LINHA'
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
              ReadOnly = True
              ShowBands = True
              Width = 86
            end
            item
              Borders = []
              BorderPen.Color = clSilver
              CheckFalse = 'N'
              CheckTrue = 'Y'
              Color = clWindow
              FieldName = 'valorgrade2'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Pitch = fpVariable
              Font.Style = []
              Header = 'COLUNA'
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
              ReadOnly = True
              ShowBands = True
              Width = 81
            end
            item
              Borders = []
              BorderPen.Color = clSilver
              CheckFalse = 'N'
              CheckTrue = 'Y'
              Color = clWindow
              FieldName = 'localizacao'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Pitch = fpVariable
              Font.Style = []
              Header = 'LOCALIZA'#199#195'O'
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
              ShowBands = True
              Width = 123
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
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Pitch = fpVariable
              Font.Style = []
              Header = 'EM ESTOQUE'
              HeaderFont.Charset = DEFAULT_CHARSET
              HeaderFont.Color = clBlack
              HeaderFont.Height = -9
              HeaderFont.Name = 'HELVETICA'
              HeaderFont.Pitch = fpVariable
              HeaderFont.Style = []
              PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
              PrintFont.Charset = DEFAULT_CHARSET
              PrintFont.Color = clBlack
              PrintFont.Height = -12
              PrintFont.Name = 'Tahoma'
              PrintFont.Pitch = fpVariable
              PrintFont.Style = []
              ReadOnly = True
              ShowBands = True
              Width = 70
            end
            item
              Alignment = taCenter
              Borders = []
              BorderPen.Color = clSilver
              CheckBoxField = True
              CheckFalse = 'N'
              CheckTrue = 'Y'
              Color = clWindow
              Editor = edCheckBox
              FieldName = 'retirar_localizacao'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Pitch = fpVariable
              Font.Style = []
              Header = 'REMOVER'
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
              PrintFont.Height = -12
              PrintFont.Name = 'Tahoma'
              PrintFont.Pitch = fpVariable
              PrintFont.Style = []
              ShowBands = True
              Width = 106
            end
            item
              Borders = []
              BorderPen.Color = clSilver
              CheckFalse = 'N'
              CheckTrue = 'Y'
              Color = clWindow
              FieldName = 'sublocalizacao'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Pitch = fpVariable
              Font.Style = []
              Header = 'SUBLOCALIZA'#199#195'O'
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
              PrintFont.Height = -12
              PrintFont.Name = 'Tahoma'
              PrintFont.Pitch = fpVariable
              PrintFont.Style = []
              ShowBands = True
              Width = 53
            end
            item
              Alignment = taCenter
              Borders = []
              BorderPen.Color = clSilver
              CheckBoxField = True
              CheckFalse = 'N'
              CheckTrue = 'Y'
              Color = clWindow
              Editor = edCheckBox
              FieldName = 'retirar_sublocalizacao'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Pitch = fpVariable
              Font.Style = []
              Header = 'REMOVER'
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
              PrintFont.Height = -12
              PrintFont.Name = 'Tahoma'
              PrintFont.Pitch = fpVariable
              PrintFont.Style = []
              ShowBands = True
              Width = 53
            end>
          DataSource = dtmControleLocalizacoes.dsrProdutosLocalizacao
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
          ShowBooleanFields = True
          ShowUnicode = False
          UseDBFieldWidths = True
          PostOnEnter = True
          ColWidths = (
            30
            154
            229
            86
            81
            123
            70
            106
            53
            53)
        end
        object pnlLabels: TPanel
          Left = 992
          Top = 14
          Width = 32
          Height = 315
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 1
          object sbnExcluirSomenteUmRegistros: TSpeedButton
            Left = 7
            Top = 29
            Width = 23
            Height = 22
            Hint = 'Retirar produto da lista'
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
            ParentShowHint = False
            ShowHint = True
            OnClick = sbnExcluirSomenteUmRegistrosClick
          end
          object sbnExcluirTodosRegistros: TSpeedButton
            Left = 7
            Top = 57
            Width = 23
            Height = 22
            Hint = 'Retirar todos os produto da lista'
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
            ParentShowHint = False
            ShowHint = True
            OnClick = sbnExcluirTodosRegistrosClick
          end
        end
      end
    end
    object AdvTabSheetEtiquetasLocalizacao: TAdvTabSheet
      Caption = 'Etiquetas'
      Color = clBtnFace
      ColorTo = clNone
      TabColor = clBtnFace
      TabColorTo = clNone
      object DBAdvEdit1: TDBAdvEdit
        Left = 24
        Top = 88
        Width = 193
        Height = 21
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clWindowText
        LabelFont.Height = -11
        LabelFont.Name = 'MS Sans Serif'
        LabelFont.Style = []
        Lookup.Separator = ';'
        Color = clWindow
        TabOrder = 3
        Text = 'DBAdvEdit1'
        Visible = True
        OnChange = DBAdvEdit1Change
        Version = '2.9.3.1'
        DataField = 'localizacao'
        DataSource = dtmControleLocalizacoes.dsrPesquisarLocalizacoes
      end
      object pnlTopEtiquetasLocalizacao: TGroupBox
        Left = 0
        Top = 41
        Width = 1026
        Height = 96
        Align = alTop
        Caption = 'Pesquisar Localiza'#231#245'es'
        TabOrder = 1
        object DBAdvGridLocalizacoesTop: TDBAdvGrid
          Left = 2
          Top = 15
          Width = 1022
          Height = 79
          Cursor = crDefault
          Align = alClient
          ColCount = 6
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
          ScrollBars = ssBoth
          TabOrder = 0
          ActiveRowShow = True
          ActiveCellShow = True
          ActiveCellFont.Charset = DEFAULT_CHARSET
          ActiveCellFont.Color = clWindowText
          ActiveCellFont.Height = -11
          ActiveCellFont.Name = 'Tahoma'
          ActiveCellFont.Style = [fsBold]
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
          FixedRowHeight = 31
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
          SyncGrid.Grid = DBAdvGridLocalizacoes
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
              Alignment = taCenter
              Borders = []
              BorderPen.Color = clSilver
              CheckFalse = 'N'
              CheckTrue = 'Y'
              Color = clWindow
              FieldName = 'imploc'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Pitch = fpVariable
              Font.Style = []
              Header = 'Imprimir Localiza'#231#227'o'
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
              Width = 72
            end
            item
              Borders = []
              BorderPen.Color = clSilver
              CheckFalse = 'N'
              CheckTrue = 'Y'
              Color = clWindow
              EditLink = FormControlEditLink1
              Editor = edCustom
              FieldName = 'localizacao'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Pitch = fpVariable
              Font.Style = []
              Header = 'Localiza'#231#227'o'
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
              Width = 199
            end
            item
              Alignment = taCenter
              Borders = []
              BorderPen.Color = clSilver
              CheckFalse = 'N'
              CheckTrue = 'Y'
              Color = clWindow
              FieldName = 'impsubloc'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Pitch = fpVariable
              Font.Style = []
              Header = 'Imprimir SubLocaliza'#231#227'o'
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
              Width = 79
            end
            item
              Borders = []
              BorderPen.Color = clSilver
              CheckFalse = 'N'
              CheckTrue = 'Y'
              Color = clWindow
              EditLink = FormControlEditLink1
              Editor = edCustom
              FieldName = 'sublocalizacao'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Pitch = fpVariable
              Font.Style = []
              Header = 'SubLocaliza'#231#227'o'
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
              Width = 179
            end
            item
              Alignment = taCenter
              Borders = []
              BorderPen.Color = clSilver
              CheckFalse = 'N'
              CheckTrue = 'Y'
              Color = clWindow
              FieldName = 'selecionar'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Pitch = fpVariable
              Font.Style = []
              Header = 'Selecionar'
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
              Width = 68
            end>
          DataSource = dtmControleLocalizacoes.dsrPesquisarLocalizacoes
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
          ShowBooleanFields = True
          ShowUnicode = False
          PostOnEnter = False
          ColWidths = (
            20
            72
            199
            79
            179
            68)
          RowHeights = (
            31
            22)
        end
      end
      object DBAdvGridLocalizacoes: TDBAdvGrid
        Left = 0
        Top = 137
        Width = 1026
        Height = 297
        Cursor = crDefault
        Align = alClient
        ColCount = 6
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
        ScrollBars = ssBoth
        TabOrder = 2
        ActiveRowShow = True
        OnCanSort = DBAdvGridLocalizacoesCanSort
        ActiveCellShow = True
        ActiveCellFont.Charset = DEFAULT_CHARSET
        ActiveCellFont.Color = clWindowText
        ActiveCellFont.Height = -11
        ActiveCellFont.Name = 'Tahoma'
        ActiveCellFont.Style = [fsBold]
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
        FixedColWidth = 22
        FixedRowHeight = 31
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
        SyncGrid.Grid = DBAdvGridLocalizacoesTop
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
            Width = 22
          end
          item
            Alignment = taCenter
            Borders = []
            BorderPen.Color = clSilver
            CheckFalse = 'N'
            CheckTrue = 'Y'
            Color = clWindow
            FieldName = 'imploc'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Pitch = fpVariable
            Font.Style = []
            Header = 'Imprimir Localiza'#231#227'o'
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
            Width = 74
          end
          item
            Borders = []
            BorderPen.Color = clSilver
            CheckFalse = 'N'
            CheckTrue = 'Y'
            Color = clWindow
            FieldName = 'localizacao'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Pitch = fpVariable
            Font.Style = []
            Header = 'Localiza'#231#227'o'
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
            Width = 198
          end
          item
            Alignment = taCenter
            Borders = []
            BorderPen.Color = clSilver
            CheckFalse = 'N'
            CheckTrue = 'Y'
            Color = clWindow
            FieldName = 'impsubloc'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Pitch = fpVariable
            Font.Style = []
            Header = 'Imprimir SubLocaliza'#231#227'o'
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
            Width = 80
          end
          item
            Borders = []
            BorderPen.Color = clSilver
            CheckFalse = 'N'
            CheckTrue = 'Y'
            Color = clWindow
            FieldName = 'sublocalizacao'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Pitch = fpVariable
            Font.Style = []
            Header = 'SubLocaliza'#231#227'o'
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
            Width = 179
          end
          item
            Alignment = taCenter
            Borders = []
            BorderPen.Color = clSilver
            CheckFalse = 'N'
            CheckTrue = 'Y'
            Color = clWindow
            FieldName = 'selecionar'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Pitch = fpVariable
            Font.Style = []
            Header = 'Selecionar'
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
            Width = 66
          end>
        DataSource = dtmControleLocalizacoes.dsrLocalizacoes
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
        ShowBooleanFields = True
        ShowUnicode = False
        PostOnEnter = False
        ColWidths = (
          22
          74
          198
          80
          179
          66)
        RowHeights = (
          31
          22)
      end
      object pnlBottomEtiquetasLocalizacao: TPanel
        Left = 0
        Top = 434
        Width = 1026
        Height = 25
        Align = alBottom
        TabOrder = 4
        object ckbSelecionarTodos: TCheckBox
          Left = 549
          Top = 4
          Width = 116
          Height = 17
          Caption = 'Selecionar Todos'
          TabOrder = 0
          OnClick = ckbSelecionarTodosClick
        end
        object ckbSelecionarTodasSubLocalizacoes: TCheckBox
          Left = 304
          Top = 4
          Width = 193
          Height = 17
          Caption = 'Selecionar Todas SubLocaliza'#231#245'es'
          TabOrder = 1
          OnClick = ckbSelecionarTodasSubLocalizacoesClick
        end
        object ckbSelecionarTodasLocalizacoes: TCheckBox
          Left = 16
          Top = 4
          Width = 193
          Height = 17
          Caption = 'Selecionar Todas Localiza'#231#245'es'
          TabOrder = 2
          OnClick = ckbSelecionarTodasLocalizacoesClick
        end
      end
      object gbxModeloEtiqueta: TGroupBox
        Left = 0
        Top = 0
        Width = 1026
        Height = 41
        Align = alTop
        Caption = 'Modelo da Etiqueta'
        TabOrder = 0
        inline fraConsultaModelosEtiquetas: TfraConsultaCodigo
          Left = 2
          Top = 15
          Width = 1022
          Height = 23
          HorzScrollBar.Range = 497
          VertScrollBar.Range = 23
          Align = alTop
          AutoScroll = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          inherited dtxDescricao: TtecDBText
            DataField = 'descricao'
            DataSource = fraConsultaModelosEtiquetas.dsrProcuraModelosEtiquetas
          end
          inherited edfCodigo: TtecDBFindLookup
            DataField = 'codigo'
            DataSource = fraConsultaModelosEtiquetas.dsrProcuraModelosEtiquetas
            Group = 'modelo'
            OnFound = nil
            Operacao = opPESQUISA
            Parameter = 'codigo'
            ActiveSetControls = False
            DenyInsert = True
            NoSetControls = <>
            SetControls = <>
          end
        end
      end
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 696
    Top = 24
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
    WantKeyReturn = False
    WantKeyEscape = False
    Control = DBAdvEdit1
    Left = 652
    Top = 157
  end
end
