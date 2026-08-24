inherited frmEmissaoEtiquetas: TfrmEmissaoEtiquetas
  Left = 360
  Top = 58
  ActiveControl = dbgEmissaoEtiquetas
  Caption = 'Etiquetas para Produtos'
  ClientHeight = 703
  ClientWidth = 1074
  FormStyle = fsMDIChild
  Visible = True
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBarra: TPanel
    Width = 615
    TabOrder = 2
    inherited bvlBotoesEd: TBevel
      Left = 135
    end
  end
  inherited pnlTopMenu: TPanel
    Width = 1074
    inherited tblBarra: TToolBar
      Left = 150
      Width = 924
      ButtonHeight = 35
      inherited sbnProcurar: TSpeedButton
        Height = 35
        Visible = False
      end
      inherited sbnAjuda: TSpeedButton
        Top = 19
        Action = actImprimir
      end
    end
    inherited tblBarraCadastro: TToolBar
      Width = 150
      Height = 45
      Constraints.MaxHeight = 45
      Constraints.MinHeight = 45
      object sbnGerar: TSpeedButton
        Left = 0
        Top = 2
        Width = 75
        Height = 35
        Hint = 'Gera Etiquetas => F6'
        Caption = 'Gerar F6'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
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
        ParentFont = False
        Spacing = 0
        OnClick = sbnGerarClick
      end
      object sbnImprimir: TSpeedButton
        Left = 75
        Top = 2
        Width = 75
        Height = 35
        Action = actImprimir
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
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
      end
    end
  end
  object pnlFundoJanela: TPanel
    Left = 0
    Top = 45
    Width = 1074
    Height = 658
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Splitter1: TSplitter
      Left = 0
      Top = 393
      Width = 1074
      Height = 7
      Cursor = crVSplit
      Align = alTop
      Color = clSkyBlue
      ParentColor = False
    end
    object pgcEtiquetas: TtecPageControl
      Left = 0
      Top = 0
      Width = 1074
      Height = 393
      ActivePage = tstMagalu
      Align = alTop
      Constraints.MinHeight = 253
      TabOrder = 0
      OnChange = pgcEtiquetasChange
      object tstEtiquetaProduto: TTabSheet
        Caption = ' &1 - Produto'
        ImageIndex = 1
        OnShow = tstEtiquetaProdutoShow
        object gbxEtiquetaProduto: TGroupBox
          Left = 0
          Top = 0
          Width = 1066
          Height = 362
          Align = alClient
          TabOrder = 0
          object gbxFilial: TGroupBox
            Left = 13
            Top = 21
            Width = 500
            Height = 36
            Caption = ' FILIAL '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object sbnProcuraFilial: TSpeedButton
              Left = 52
              Top = 10
              Width = 24
              Height = 23
              Hint = 'Procurar Filial'
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
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FFFFFFFDCDCDCDCDCDC7F
                7F7F7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC800000
                FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFFFFFFFDCDCDCDCDCDCDCDCDCDC
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
                DCDCDCDCDCDCDCDCDCDC7F7F7FC3C3C3FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDC7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFA858FFA858
                FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858DCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC800000
                FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FC3C3C3FFFFFFFFFFFFDCDCDCDCDCDCDC
                DCDCFFFFFF7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                800000FFA858FFA858FFA858FFA858FFA858800000DCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FC3C3C3FFFFFFFFFFFF7F
                7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCFFA858800000800000800000FFA858DCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7FDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC}
              NumGlyphs = 2
              ParentFont = False
              OnClick = sbnProcuraFilialClick
            end
            object edfFilial: TtecDbEditFind
              Left = 2
              Top = 10
              Width = 50
              Height = 23
              Alignment = taLeftJustify
              DataField = 'codigo'
              DataSource = dtmEmissaoEtiquetas.dsrProcuraFiliais
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              Group = 'Filial'
              MaxLength = 5
              Maximo = 0
              Minimo = 37353
              Adicional = 0
              Opcional = True
              ParentFont = False
              TabOrder = 0
              PermitirZero = False
              PermitirNulo = False
              Operacao = opATRIBUICAO
              Parameter = 'codigo'
              ActiveSetControls = False
              DenyInsert = True
              NoSetControls = <>
              SetControls = <>
            end
            object dtxFilial: TtecDBText
              Left = 76
              Top = 10
              Width = 421
              Height = 23
              TabStop = False
              Color = clBtnFace
              DataField = 'nome'
              DataSource = dtmEmissaoEtiquetas.dsrProcuraFiliais
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
          object gbxImprimir: TGroupBox
            Left = 13
            Top = 127
            Width = 165
            Height = 57
            Caption = ' IMPRIMIR '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            object ckbQtdemEstoque: TCheckBox
              Left = 6
              Top = 16
              Width = 150
              Height = 16
              Caption = 'Quantidade em estoque'
              Checked = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              State = cbChecked
              TabOrder = 0
              OnClick = ckbQtdemEstoqueClick
            end
            object ckbQtdeZerada: TCheckBox
              Left = 6
              Top = 34
              Width = 150
              Height = 16
              Caption = 'Produtos com qtde zero'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              OnClick = ckbQtdeZeradaClick
            end
          end
          object pgcProduto: TtecPageControl
            Left = 11
            Top = 64
            Width = 881
            Height = 53
            ActivePage = tstProduto
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            OnChange = pgcProdutoChange
            object tstProduto: TTabSheet
              Caption = ' &4 - Item Produto'
              inline fraConsultaItemProduto: TfraConsultaCodigo
                Left = 0
                Top = 0
                Width = 873
                Height = 23
                HorzScrollBar.Range = 497
                HorzScrollBar.Visible = False
                VertScrollBar.Range = 23
                VertScrollBar.Visible = False
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
                inherited sbnProcura: TSpeedButton
                  Left = 134
                  Hint = 'Procura Item de Fornecedor'
                end
                inherited dtxDescricao: TtecDBText
                  Left = 160
                  Width = 713
                  DataField = 'descricao'
                  DataSource = fraConsultaItemProduto.dsrProcuraItemProdutos
                end
                inherited edfCodigo: TtecDBFindLookup
                  Width = 134
                  DataaFieldInterno = 'produto'
                  DataaFieldVisual = 'produtovisual'
                  DataField = 'produtovisual'
                  DataSource = fraConsultaItemProduto.dsrProcuraItemProdutos
                  Group = 'itemproduto'
                  MaxLength = 30
                  OnFound = nil
                  Operacao = opPESQUISA
                  Parameter = 'produtovisual'
                  ActiveSetControls = False
                  DenyInsert = True
                  NoSetControls = <>
                  SetControls = <>
                end
              end
            end
            object tstcaracteristicas: TTabSheet
              Caption = '&5 - Produtos'
              ImageIndex = 3
              inline fraConsultaProduto: TfraConsultaCodigo
                Left = 0
                Top = 0
                Width = 873
                Height = 27
                HorzScrollBar.Range = 529
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
                inherited sbnProcura: TSpeedButton
                  Left = 136
                end
                inherited dtxDescricao: TtecDBText
                  Left = 159
                  Width = 714
                  DataField = 'descricao'
                  DataSource = fraConsultaProduto.dsrProcuraProdutos
                end
                inherited edfCodigo: TtecDBFindLookup
                  Width = 135
                  DataaFieldInterno = 'caracteristica'
                  DataaFieldVisual = 'caracteristicavisual'
                  DataField = 'caracteristicavisual'
                  DataSource = fraConsultaProduto.dsrProcuraProdutos
                  Group = 'Produto'
                  MaxLength = 16
                  OnFound = nil
                  Operacao = opPESQUISA
                  Parameter = 'caracteristicavisual'
                  ActiveSetControls = False
                  DenyInsert = True
                  NoSetControls = <>
                  SetControls = <>
                end
              end
            end
            object tstGrupo: TTabSheet
              Caption = ' &6 - Grupo'
              ImageIndex = 1
              object sbnProcuraGrupo: TSpeedButton
                Left = 63
                Top = 0
                Width = 23
                Height = 22
                Hint = 'Procurar Grupo'
                Flat = True
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
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FFFFFFFDCDCDCDCDCDC7F
                  7F7F7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC800000
                  FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFFFFFFFDCDCDCDCDCDCDCDCDCDC
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
                  DCDCDCDCDCDCDCDCDCDC7F7F7FC3C3C3FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDC7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFA858FFA858
                  FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858DCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC800000
                  FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FC3C3C3FFFFFFFFFFFFDCDCDCDCDCDCDC
                  DCDCFFFFFF7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  800000FFA858FFA858FFA858FFA858FFA858800000DCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FC3C3C3FFFFFFFFFFFF7F
                  7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCFFA858800000800000800000FFA858DCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7FDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC}
                NumGlyphs = 2
                OnClick = sbnProcuraGrupoClick
              end
              object edfGrupo: TtecDbEditFind
                Left = 2
                Top = 0
                Width = 60
                Height = 23
                Alignment = taLeftJustify
                CharCase = ecUpperCase
                DataField = 'codigo'
                DataSource = dtmEmissaoEtiquetas.dsrProcuraGrupos
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                Group = 'Grupo'
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
                Parameter = 'codigo'
                ActiveSetControls = False
                DenyInsert = True
                NoSetControls = <>
                SetControls = <>
              end
              object dtxGrupo: TtecDBText
                Left = 86
                Top = 0
                Width = 426
                Height = 23
                TabStop = False
                Color = clBtnFace
                DataField = 'descricao'
                DataSource = dtmEmissaoEtiquetas.dsrProcuraGrupos
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
            object tstClasse: TTabSheet
              Caption = ' &7 - Classe'
              ImageIndex = 2
              object sbnProcuraClasse: TSpeedButton
                Left = 62
                Top = -1
                Width = 23
                Height = 24
                Hint = 'Procurar Classe'
                Flat = True
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
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FFFFFFFDCDCDCDCDCDC7F
                  7F7F7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC800000
                  FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFFFFFFFDCDCDCDCDCDCDCDCDCDC
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
                  DCDCDCDCDCDCDCDCDCDC7F7F7FC3C3C3FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDC7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFA858FFA858
                  FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858DCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC800000
                  FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FC3C3C3FFFFFFFFFFFFDCDCDCDCDCDCDC
                  DCDCFFFFFF7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  800000FFA858FFA858FFA858FFA858FFA858800000DCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FC3C3C3FFFFFFFFFFFF7F
                  7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCFFA858800000800000800000FFA858DCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7FDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC}
                NumGlyphs = 2
                OnClick = sbnProcuraClasseClick
              end
              object dtxClasse: TtecDBText
                Left = 85
                Top = 0
                Width = 427
                Height = 23
                TabStop = False
                Color = clBtnFace
                DataField = 'descricao'
                DataSource = dtmEmissaoEtiquetas.dsrProcuraClasses
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
              object edfClasse: TtecDbEditFind
                Left = 2
                Top = 0
                Width = 60
                Height = 23
                Alignment = taLeftJustify
                CharCase = ecUpperCase
                DataField = 'codigo'
                DataSource = dtmEmissaoEtiquetas.dsrProcuraClasses
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                Group = 'Classe'
                MaxLength = 2
                Maximo = 0
                Minimo = 37353
                Adicional = 0
                Opcional = True
                ParentFont = False
                TabOrder = 1
                PermitirZero = False
                PermitirNulo = False
                Operacao = opATRIBUICAO
                Parameter = 'codigo'
                ActiveSetControls = False
                DenyInsert = True
                NoSetControls = <>
                SetControls = <>
              end
            end
            object tstFornecedor: TTabSheet
              Caption = ' &8 - Fornecedor'
              inline fraConsultaFornecedorProduto: TfraConsultaCodigo
                Left = 1
                Top = 1
                Width = 528
                Height = 22
                HorzScrollBar.Range = 631
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
                  Left = 89
                  Top = -1
                  Width = 424
                  DataField = 'nome'
                  DataSource = fraConsultaFornecedorProduto.dsrProcuraCliente
                end
                inherited edfCodigo: TtecDBFindLookup
                  DataField = 'codigo'
                  DataSource = fraConsultaFornecedorProduto.dsrProcuraCliente
                  Group = 'FORNECEDOR'
                  MaxLength = 6
                  OnFound = nil
                  Operacao = opPESQUISA
                  Parameter = 'codigo'
                  ActiveSetControls = False
                  DenyInsert = True
                  NoSetControls = <>
                  SetControls = <>
                end
                inherited qryProcuraCobrador: TtecQuery
                  Left = 448
                end
              end
            end
            object tstMarca: TTabSheet
              Caption = ' &9 - Marca'
              ImageIndex = 1
              object sbnProcuraMarca: TSpeedButton
                Left = 138
                Top = 2
                Width = 23
                Height = 22
                Hint = 'Procurar Marca'
                Flat = True
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
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FFFFFFFDCDCDCDCDCDC7F
                  7F7F7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC800000
                  FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFFFFFFFDCDCDCDCDCDCDCDCDCDC
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
                  DCDCDCDCDCDCDCDCDCDC7F7F7FC3C3C3FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDC7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFA858FFA858
                  FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858DCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC800000
                  FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FC3C3C3FFFFFFFFFFFFDCDCDCDCDCDCDC
                  DCDCFFFFFF7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  800000FFA858FFA858FFA858FFA858FFA858800000DCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FC3C3C3FFFFFFFFFFFF7F
                  7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCFFA858800000800000800000FFA858DCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7FDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC}
                NumGlyphs = 2
                OnClick = sbnProcuraMarcaClick
              end
              object edfMarca: TtecDbEditFind
                Left = 2
                Top = 1
                Width = 135
                Height = 23
                Alignment = taLeftJustify
                CharCase = ecUpperCase
                DataField = 'codigo'
                DataSource = dtmEmissaoEtiquetas.dsrProcuraMarcas
                Group = 'Marca'
                MaxLength = 4
                Maximo = 0
                Minimo = 37353
                Adicional = 0
                Opcional = True
                TabOrder = 0
                PermitirZero = False
                PermitirNulo = False
                Operacao = opATRIBUICAO
                Parameter = 'codigo'
                ActiveSetControls = False
                DenyInsert = True
                NoSetControls = <>
                SetControls = <>
              end
              object dtxMarca: TtecDBText
                Left = 161
                Top = 1
                Width = 351
                Height = 23
                TabStop = False
                Color = clBtnFace
                DataField = 'descricao'
                DataSource = dtmEmissaoEtiquetas.dsrProcuraMarcas
                ReadOnly = True
                TabOrder = 1
                Alignment = taLeftJustify
              end
            end
          end
          object gbxQuantidade: TGroupBox
            Left = 188
            Top = 127
            Width = 80
            Height = 36
            Caption = 'QUANTIDADE'
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
            object edtQuantidade: TEditNumero
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
              OnChange = edtQuantidadeChange
              Mascara = False
              TipoMascara = tmGERAL
              NrDecimal = 0
              Decimais = False
              Negativo = False
              Tamanho = 3
            end
          end
          object gbxProdutos_1: TGroupBox
            Left = 279
            Top = 127
            Width = 200
            Height = 60
            Caption = ' PRODUTOS'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            object ckbProdutoEmLinha_1: TCheckBox
              Left = 6
              Top = 15
              Width = 80
              Height = 16
              Caption = '&Em Linha'
              Checked = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              State = cbChecked
              TabOrder = 0
            end
            object ckbProdutoForadeLinha_1: TCheckBox
              Left = 96
              Top = 15
              Width = 95
              Height = 16
              Caption = '&Fora de Linha'
              Checked = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              State = cbChecked
              TabOrder = 1
            end
            object ckbProdutoInativo_1: TCheckBox
              Left = 96
              Top = 36
              Width = 95
              Height = 16
              Caption = '&Inativo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 3
            end
            object ckbProdutoAtivo_1: TCheckBox
              Left = 6
              Top = 36
              Width = 80
              Height = 16
              Caption = '&Ativo'
              Checked = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              State = cbChecked
              TabOrder = 2
            end
          end
        end
      end
      object tstEtiquetaNota: TTabSheet
        Caption = ' &2 - Nota Fiscal Entrada'
        OnShow = tstEtiquetaNotaShow
        object gbxEtiquetaNota: TGroupBox
          Left = 0
          Top = 0
          Width = 1066
          Height = 362
          Align = alClient
          TabOrder = 0
          object gbxFornecedorNota: TGroupBox
            Left = 13
            Top = 21
            Width = 500
            Height = 37
            Caption = 'FORNECEDOR'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            inline fraConsultaFornecedorNota: TfraConsultaCodigo
              Left = 3
              Top = 11
              Width = 495
              Height = 22
              HorzScrollBar.Range = 631
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
                Left = 89
                Top = -1
                Width = 404
                DataField = 'nome'
                DataSource = fraConsultaFornecedorNota.dsrProcuraCliente
              end
              inherited edfCodigo: TtecDBFindLookup
                Tag = 1
                DataField = 'codigo'
                DataSource = fraConsultaFornecedorNota.dsrProcuraCliente
                Group = 'FORNECEDOR'
                MaxLength = 6
                OnFound = nil
                Operacao = opPESQUISA
                Parameter = 'codigo'
              end
            end
          end
          object gbxSerie: TGroupBox
            Left = 13
            Top = 73
            Width = 64
            Height = 36
            Caption = ' S'#201'RIE '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            object sbnProcuraSerie: TSpeedButton
              Left = 38
              Top = 10
              Width = 23
              Height = 22
              Hint = 'Procurar S'#233'rie'
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
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FFFFFFFDCDCDCDCDCDC7F
                7F7F7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC800000
                FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFFFFFFFDCDCDCDCDCDCDCDCDCDC
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
                DCDCDCDCDCDCDCDCDCDC7F7F7FC3C3C3FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDC7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFA858FFA858
                FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858DCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC800000
                FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FC3C3C3FFFFFFFFFFFFDCDCDCDCDCDCDC
                DCDCFFFFFF7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                800000FFA858FFA858FFA858FFA858FFA858800000DCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FC3C3C3FFFFFFFFFFFF7F
                7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCFFA858800000800000800000FFA858DCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7FDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC}
              NumGlyphs = 2
              ParentFont = False
              OnClick = sbnProcuraSerieClick
            end
            object edfSerie: TtecDbEditFind
              Tag = 1
              Left = 2
              Top = 10
              Width = 35
              Height = 23
              Alignment = taLeftJustify
              CharCase = ecUpperCase
              DataField = 'serie'
              DataSource = dtmEmissaoEtiquetas.dsrProcuraSeries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              Group = 'serieentrada'
              MaxLength = 3
              Maximo = 3
              Minimo = 37353
              Adicional = 0
              Opcional = True
              ParentFont = False
              TabOrder = 0
              PermitirZero = False
              PermitirNulo = False
              Operacao = opPESQUISA
              Parameter = 'serie'
              ActiveSetControls = False
              DenyInsert = True
              NoSetControls = <>
              SetControls = <>
            end
          end
          object gbxOrdenacao: TGroupBox
            Left = 412
            Top = 73
            Width = 144
            Height = 60
            Caption = ' ORDENA'#199#195'O '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            object rdbDescricaoProduto: TRadioButton
              Left = 6
              Top = 15
              Width = 130
              Height = 25
              Caption = 'Descri'#231#227'o Produtos'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object rdbNumeroNotaProduto: TRadioButton
              Left = 6
              Top = 36
              Width = 130
              Height = 20
              Caption = 'N'#186' Nota Fiscal'
              Checked = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              TabStop = True
            end
          end
          object gbxNrNota: TGroupBox
            Left = 87
            Top = 73
            Width = 104
            Height = 36
            Caption = ' N'#186' NOTA'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            object sbnProcuraNota: TSpeedButton
              Left = 78
              Top = 10
              Width = 23
              Height = 23
              Hint = 'Procurar Nota'
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
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FFFFFFFDCDCDCDCDCDC7F
                7F7F7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC800000
                FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFFFFFFFDCDCDCDCDCDCDCDCDCDC
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
                DCDCDCDCDCDCDCDCDCDC7F7F7FC3C3C3FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDC7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFA858FFA858
                FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858DCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC800000
                FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FC3C3C3FFFFFFFFFFFFDCDCDCDCDCDCDC
                DCDCFFFFFF7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                800000FFA858FFA858FFA858FFA858FFA858800000DCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FC3C3C3FFFFFFFFFFFF7F
                7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCFFA858800000800000800000FFA858DCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7FDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC}
              NumGlyphs = 2
              ParentFont = False
              OnClick = sbnProcuraNotaClick
            end
            object edfNota: TtecDbEditFind
              Tag = 1
              Left = 2
              Top = 10
              Width = 74
              Height = 23
              Alignment = taLeftJustify
              DataField = 'numero'
              DataSource = dtmEmissaoEtiquetas.dsrProcuraNotas
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              Group = 'notaentrada'
              MaxLength = 9
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
              ActiveSetControls = False
              DenyInsert = True
              NoSetControls = <>
              SetControls = <>
            end
          end
          object gbxProdutos_2: TGroupBox
            Left = 201
            Top = 73
            Width = 200
            Height = 60
            Caption = ' PRODUTOS '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            object ckbProdutoEmLinha_2: TCheckBox
              Left = 6
              Top = 15
              Width = 80
              Height = 16
              Caption = '&Em Linha'
              Checked = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              State = cbChecked
              TabOrder = 0
            end
            object ckbProdutoForadeLinha_2: TCheckBox
              Left = 96
              Top = 15
              Width = 95
              Height = 16
              Caption = '&Fora de Linha'
              Checked = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              State = cbChecked
              TabOrder = 1
            end
            object ckbProdutoInativo_2: TCheckBox
              Left = 96
              Top = 36
              Width = 95
              Height = 14
              Caption = '&Inativo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 3
            end
            object ckbProdutoAtivo_2: TCheckBox
              Left = 6
              Top = 36
              Width = 80
              Height = 14
              Caption = '&Ativo'
              Checked = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              State = cbChecked
              TabOrder = 2
            end
          end
        end
      end
      object tstMovimentacao: TTabSheet
        Caption = ' &3 - Movimenta'#231#227'o'
        ImageIndex = 2
        OnShow = tstMovimentacaoShow
        object gbxMovimentacao: TGroupBox
          Left = 0
          Top = 0
          Width = 1066
          Height = 362
          Align = alClient
          TabOrder = 0
          object gbxIntervalo: TGroupBox
            Left = 13
            Top = 108
            Width = 160
            Height = 36
            Caption = ' PER'#205'ODO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            object lblA: TLabel
              Left = 76
              Top = 16
              Width = 7
              Height = 15
              Caption = 'a'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
            end
            object edtIntervaloInicial: TEditData
              Left = 2
              Top = 10
              Width = 70
              Height = 23
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              MaxLength = 10
              ParentFont = False
              TabOrder = 0
              Minimo = 37353
              Maximo = 360
            end
            object edtIntervaloFinal: TEditData
              Left = 87
              Top = 10
              Width = 70
              Height = 23
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              MaxLength = 10
              ParentFont = False
              TabOrder = 1
              Minimo = 37353
              Maximo = 360
            end
          end
          object gbxTipoMovimento: TGroupBox
            Left = 13
            Top = 64
            Width = 500
            Height = 36
            Caption = ' TIPO DE MOVIMENTO '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            object sbnProcurarTipoMovto: TSpeedButton
              Left = 52
              Top = 10
              Width = 23
              Height = 23
              Hint = 'Procurar Tipo Movimento'
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
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FFFFFFFDCDCDCDCDCDC7F
                7F7F7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC800000
                FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFFFFFFFDCDCDCDCDCDCDCDCDCDC
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
                DCDCDCDCDCDCDCDCDCDC7F7F7FC3C3C3FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDC7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFA858FFA858
                FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858DCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC800000
                FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FC3C3C3FFFFFFFFFFFFDCDCDCDCDCDCDC
                DCDCFFFFFF7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                800000FFA858FFA858FFA858FFA858FFA858800000DCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FC3C3C3FFFFFFFFFFFF7F
                7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCFFA858800000800000800000FFA858DCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7FDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC}
              NumGlyphs = 2
              ParentFont = False
              OnClick = sbnProcurarTipoMovtoClick
            end
            object edfTipoMovimento: TtecDbEditFind
              Left = 2
              Top = 10
              Width = 50
              Height = 23
              Alignment = taLeftJustify
              CharCase = ecUpperCase
              DataField = 'codigo'
              DataSource = dtmEmissaoEtiquetas.dsrProcuraTipoMovto
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              Group = 'TipoMovto'
              MaxLength = 3
              Maximo = 0
              Minimo = 37353
              Adicional = 0
              Opcional = True
              ParentFont = False
              TabOrder = 0
              PermitirZero = False
              PermitirNulo = False
              Operacao = opATRIBUICAO
              Parameter = 'codigo'
              ActiveSetControls = False
              DenyInsert = True
              NoSetControls = <>
              SetControls = <>
            end
            object tecDBText1: TtecDBText
              Left = 76
              Top = 10
              Width = 421
              Height = 23
              TabStop = False
              Color = clBtnFace
              DataField = 'descricao'
              DataSource = dtmEmissaoEtiquetas.dsrProcuraTipoMovto
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
          object gbxFilialMovto: TGroupBox
            Left = 13
            Top = 21
            Width = 500
            Height = 36
            Caption = ' FILIAL '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object sbnFilialMovto: TSpeedButton
              Left = 52
              Top = 10
              Width = 23
              Height = 23
              Hint = 'Procurar Filial'
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
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FFFFFFFDCDCDCDCDCDC7F
                7F7F7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC800000
                FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFFFFFFFDCDCDCDCDCDCDCDCDCDC
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
                DCDCDCDCDCDCDCDCDCDC7F7F7FC3C3C3FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDC7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFA858FFA858
                FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858DCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC800000
                FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FC3C3C3FFFFFFFFFFFFDCDCDCDCDCDCDC
                DCDCFFFFFF7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                800000FFA858FFA858FFA858FFA858FFA858800000DCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FC3C3C3FFFFFFFFFFFF7F
                7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCFFA858800000800000800000FFA858DCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7FDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC}
              NumGlyphs = 2
              ParentFont = False
              OnClick = sbnFilialMovtoClick
            end
            object edfFilialMovto: TtecDbEditFind
              Left = 2
              Top = 10
              Width = 50
              Height = 23
              Alignment = taLeftJustify
              DataField = 'codigo'
              DataSource = dtmEmissaoEtiquetas.dsrProcuraFiliais
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              Group = 'FilialMovto'
              MaxLength = 5
              Maximo = 0
              Minimo = 37353
              Adicional = 0
              Opcional = True
              ParentFont = False
              TabOrder = 0
              PermitirZero = False
              PermitirNulo = False
              Operacao = opATRIBUICAO
              Parameter = 'codigo'
              ActiveSetControls = False
              DenyInsert = True
              NoSetControls = <>
              SetControls = <>
            end
            object tecDBText2: TtecDBText
              Left = 76
              Top = 10
              Width = 421
              Height = 23
              TabStop = False
              Color = clBtnFace
              DataField = 'nome'
              DataSource = dtmEmissaoEtiquetas.dsrProcuraFiliais
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
          object gbxProdutos_3: TGroupBox
            Left = 184
            Top = 108
            Width = 206
            Height = 60
            Caption = ' PRODUTOS '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            object ckbProdutoEmLinha_3: TCheckBox
              Left = 6
              Top = 15
              Width = 80
              Height = 16
              Caption = '&Em Linha'
              Checked = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              State = cbChecked
              TabOrder = 0
            end
            object ckbProdutoForadeLinha_3: TCheckBox
              Left = 92
              Top = 15
              Width = 95
              Height = 16
              Caption = '&Fora de Linha'
              Checked = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              State = cbChecked
              TabOrder = 1
            end
            object ckbProdutoInativo_3: TCheckBox
              Left = 92
              Top = 36
              Width = 95
              Height = 16
              Caption = '&Inativo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 3
            end
            object ckbProdutoAtivo_3: TCheckBox
              Left = 6
              Top = 36
              Width = 80
              Height = 16
              Caption = '&Ativo'
              Checked = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              State = cbChecked
              TabOrder = 2
            end
          end
        end
      end
      object tstNotaFiscalSaidas: TTabSheet
        Caption = '&4 - Nota Fiscal Sa'#237'da'
        ImageIndex = 3
        OnHide = tstNotaFiscalSaidasHide
        OnShow = tstNotaFiscalSaidasShow
        object gbxNotasSaidas: TGroupBox
          Left = 0
          Top = 0
          Width = 1066
          Height = 362
          Align = alClient
          TabOrder = 0
          inline fraselecaoaleatorianotassaidas2: Tfraselecaoaleatorianotassaidas
            Left = 2
            Top = 143
            Width = 1062
            Height = 217
            Align = alClient
            TabOrder = 0
            inherited fraselecaoaleatorianotassaidas: TfraSelecaoAleatoria
              Width = 1062
              Height = 170
              inherited Splitter1: TSplitter
                Height = 157
              end
              inherited dbgSelecaoAleatoria: TtecDBGrid
                Height = 157
              end
              inherited pnlLabels: TPanel
                Height = 157
              end
              inherited pnlAbaixo: TPanel
                Top = 157
                Width = 1062
                inherited pnlAbaixoDireita: TPanel
                  Left = 1031
                  Font.Pitch = fpVariable
                end
              end
            end
            inherited pnlParametros: TPanel
              Top = 170
              Width = 1062
              Font.Pitch = fpVariable
            end
          end
          object pnlTopNFSaida: TPanel
            Left = 2
            Top = 18
            Width = 1062
            Height = 125
            Align = alTop
            TabOrder = 1
            object gbxCliente: TGroupBox
              Left = 4
              Top = 3
              Width = 513
              Height = 36
              Caption = ' CLIENTE '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              object sbnProcuraCliente: TSpeedButton
                Left = 72
                Top = 10
                Width = 24
                Height = 23
                Hint = 'Procurar cliente'
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
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FFFFFFFDCDCDCDCDCDC7F
                  7F7F7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC800000
                  FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFFFFFFFDCDCDCDCDCDCDCDCDCDC
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
                  DCDCDCDCDCDCDCDCDCDC7F7F7FC3C3C3FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDC7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFA858FFA858
                  FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858DCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC800000
                  FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FC3C3C3FFFFFFFFFFFFDCDCDCDCDCDCDC
                  DCDCFFFFFF7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  800000FFA858FFA858FFA858FFA858FFA858800000DCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FC3C3C3FFFFFFFFFFFF7F
                  7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCFFA858800000800000800000FFA858DCDCDCDCDCDCDCDCDCDCDCDCDCDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7FDC
                  DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC}
                NumGlyphs = 2
                ParentFont = False
                OnClick = sbnProcuraClienteClick
              end
              object dtxClienteSaida: TtecDBText
                Left = 97
                Top = 10
                Width = 410
                Height = 23
                TabStop = False
                Color = clBtnFace
                DataField = 'nome'
                DataSource = dtmEmissaoEtiquetas.dsrProcuraClientes
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
              object edfClientesSaida: TtecDbEditFind
                Left = 2
                Top = 10
                Width = 70
                Height = 23
                Alignment = taLeftJustify
                DataField = 'codigo'
                DataSource = dtmEmissaoEtiquetas.dsrProcuraClientes
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                Group = 'cliente'
                MaxLength = 8
                Maximo = 0
                Minimo = 37353
                Adicional = 0
                Opcional = True
                OnClick = edfClientesSaidaClick
                ParentFont = False
                TabOrder = 1
                PermitirZero = False
                PermitirNulo = False
                Operacao = opATRIBUICAO
                Parameter = 'codigo'
                ActiveSetControls = False
                DenyInsert = True
                NoSetControls = <>
                SetControls = <>
              end
            end
            object gbxPeriodo: TGroupBox
              Left = 4
              Top = 41
              Width = 160
              Height = 36
              Caption = ' EMISS'#195'O '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              object Label2: TLabel
                Left = 76
                Top = 16
                Width = 7
                Height = 15
                Caption = 'a'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
              end
              object edtIntervaloInicialSaida: TEditData
                Left = 2
                Top = 10
                Width = 70
                Height = 23
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                MaxLength = 10
                ParentFont = False
                TabOrder = 0
                Minimo = 37353
                Maximo = 0
              end
              object edtIntervaloFinalSaida: TEditData
                Left = 87
                Top = 10
                Width = 70
                Height = 23
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                MaxLength = 10
                ParentFont = False
                TabOrder = 1
                Minimo = 37353
                Maximo = 0
              end
            end
            object gbxNotas: TGroupBox
              Left = 4
              Top = 79
              Width = 160
              Height = 36
              Caption = ' N'#186' NOTAS '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              object Label1: TLabel
                Left = 76
                Top = 16
                Width = 7
                Height = 15
                Caption = 'a'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
              end
              object EdtNotaInicialSaida: TEditNumero
                Left = 2
                Top = 10
                Width = 70
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
                Mascara = False
                Alignment = taLeftJustify
                TipoMascara = tmGERAL
                NrDecimal = 2
                Decimais = False
                Negativo = False
                Tamanho = 8
              end
              object edtNotaFinalSaida: TEditNumero
                Left = 87
                Top = 10
                Width = 70
                Height = 23
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                MaxLength = -1
                ParentFont = False
                TabOrder = 1
                Mascara = False
                Alignment = taLeftJustify
                TipoMascara = tmGERAL
                NrDecimal = 2
                Decimais = False
                Negativo = False
                Tamanho = 8
              end
            end
            object gbxObservacao: TGroupBox
              Left = 173
              Top = 40
              Width = 495
              Height = 52
              Caption = ' OBSERVAC'#199#213'ES '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 3
              object dbmObservacao: TtecDBMemo
                Left = 2
                Top = 11
                Width = 455
                Height = 38
                DataField = 'observacoes_'
                DataSource = dtmEmissaoEtiquetas.dsrNotasSaidas
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                MaxLength = 500
                ParentFont = False
                TabOrder = 0
              end
              object plnGravarObs: TPanel
                Left = 459
                Top = 11
                Width = 32
                Height = 38
                BevelInner = bvRaised
                BevelOuter = bvLowered
                TabOrder = 1
                object btnGravarObservacao: TBitBtn
                  Left = 3
                  Top = 10
                  Width = 26
                  Height = 21
                  Caption = 'OK'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = 'Arial'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                  OnClick = btnGravarObservacaoClick
                end
              end
            end
            object gbxAtt: TGroupBox
              Left = 173
              Top = 88
              Width = 495
              Height = 36
              Caption = 'AOS CUIDADOS (A/C)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 4
              object DBEditTexto2: TDBEditTexto
                Left = 2
                Top = 10
                Width = 447
                Height = 23
                Hint = 'dbtAtt'
                DataField = 'att'
                DataSource = dtmEmissaoEtiquetas.dsrNotasSaidas
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                MaxLength = 12
                ParentFont = False
                TabOrder = 0
                CharCasenoDefault = False
                Alignment = taLeftJustify
              end
              object plnGravarAtt: TPanel
                Left = 460
                Top = 9
                Width = 31
                Height = 24
                BevelInner = bvRaised
                BevelOuter = bvLowered
                TabOrder = 1
                object btnGravarAtt: TBitBtn
                  Left = 3
                  Top = 1
                  Width = 26
                  Height = 21
                  Caption = 'OK'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = 'Arial'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                  OnClick = btnGravarAttClick
                end
              end
            end
            object gbxProdutos_4: TGroupBox
              Left = 851
              Top = 8
              Width = 206
              Height = 60
              Caption = 'Produtos'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 5
              object ckbProdutoEmLinha_4: TCheckBox
                Left = 8
                Top = 20
                Width = 89
                Height = 16
                Caption = '&Em Linha'
                Checked = True
                State = cbChecked
                TabOrder = 0
              end
              object ckbProdutoForadeLinha_4: TCheckBox
                Left = 96
                Top = 20
                Width = 105
                Height = 16
                Caption = '&Fora de Linha'
                Checked = True
                State = cbChecked
                TabOrder = 1
              end
              object ckbProdutoInativo_4: TCheckBox
                Left = 96
                Top = 38
                Width = 105
                Height = 16
                Caption = '&Inativo'
                TabOrder = 3
              end
              object ckbProdutoAtivo_4: TCheckBox
                Left = 8
                Top = 38
                Width = 89
                Height = 16
                Caption = '&Ativo'
                Checked = True
                State = cbChecked
                TabOrder = 2
              end
            end
            object ckbImprimirVolumes: TCheckBox
              Left = 856
              Top = 80
              Width = 177
              Height = 17
              Caption = 'Imprimir Volumes NF'
              TabOrder = 6
              OnClick = ckbImprimirVolumesClick
            end
          end
        end
      end
      object tstPedidos: TTabSheet
        Caption = '&5 - Pedidos'
        ImageIndex = 4
        object gbxPedidos: TGroupBox
          Left = 0
          Top = 0
          Width = 1066
          Height = 362
          Align = alClient
          TabOrder = 0
          object GroupBox1: TGroupBox
            Left = 607
            Top = 21
            Width = 160
            Height = 36
            Caption = ' EMISS'#195'O '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            object lblAEmissao: TLabel
              Left = 76
              Top = 15
              Width = 7
              Height = 15
              Caption = 'a'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
            end
            object edtDataInicialPedido: TEditData
              Left = 2
              Top = 10
              Width = 70
              Height = 23
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              MaxLength = 10
              ParentFont = False
              TabOrder = 0
              Minimo = 37353
              Maximo = 0
            end
            object edtDataFinalPedido: TEditData
              Left = 87
              Top = 10
              Width = 70
              Height = 23
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              MaxLength = 10
              ParentFont = False
              TabOrder = 1
              Minimo = 37353
              Maximo = 0
            end
          end
          object rgbSituacao: TtecDBRadioGroup
            Left = 523
            Top = 64
            Width = 100
            Height = 118
            Caption = ' SITUA'#199#195'O '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            TabStop = False
            object ckbAberto: TtecRadioButton
              Left = 8
              Top = 16
              Width = 87
              Height = 17
              Caption = 'Aberto'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object ckbConclido: TtecRadioButton
              Left = 8
              Top = 66
              Width = 87
              Height = 17
              Caption = 'Conclu'#237'do'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 3
            end
            object ckbParcial: TtecRadioButton
              Left = 8
              Top = 33
              Width = 87
              Height = 17
              Caption = 'Parcial'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
            object ckbCancelado: TtecRadioButton
              Left = 8
              Top = 83
              Width = 87
              Height = 17
              Caption = 'Cancelado'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 4
            end
            object ckbAmbos: TtecRadioButton
              Left = 8
              Top = 99
              Width = 87
              Height = 17
              Caption = 'Todos'
              Checked = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 5
              TabStop = True
            end
            object ckbParcialLiquidado: TtecRadioButton
              Left = 8
              Top = 49
              Width = 87
              Height = 17
              Caption = 'Parcial Liq.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 2
            end
          end
          object rgbOrdenar: TtecDBRadioGroup
            Left = 633
            Top = 64
            Width = 104
            Height = 119
            Caption = ' ORDENA'#199#195'O '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 5
            TabStop = False
            object ckbPedido: TtecRadioButton
              Left = 8
              Top = 18
              Width = 62
              Height = 17
              Caption = 'Pedido'
              Checked = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              TabStop = True
            end
            object cknFornecedor: TtecRadioButton
              Left = 8
              Top = 57
              Width = 89
              Height = 17
              Caption = 'Fornecedor'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 2
            end
            object ckbProduto: TtecRadioButton
              Left = 8
              Top = 37
              Width = 65
              Height = 17
              Caption = 'Produto'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
            object ckbEmissao: TtecRadioButton
              Left = 8
              Top = 76
              Width = 70
              Height = 17
              Caption = 'Emiss'#227'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 3
            end
            object ckbSituacao: TtecRadioButton
              Left = 8
              Top = 96
              Width = 74
              Height = 17
              Caption = 'Situa'#231#227'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 4
            end
          end
          object gbxProdutoPedido: TGroupBox
            Left = 13
            Top = 101
            Width = 500
            Height = 43
            Caption = ' PRODUTO '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            inline fraConsultaItemProdutoPedido: TfraConsultaCodigo
              Left = 2
              Top = 14
              Width = 496
              Height = 23
              HorzScrollBar.Range = 497
              HorzScrollBar.Visible = False
              VertScrollBar.Range = 23
              VertScrollBar.Visible = False
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
              inherited sbnProcura: TSpeedButton
                Left = 134
                Top = 1
                Hint = 'Procura Item de Fornecedor'
              end
              inherited dtxDescricao: TtecDBText
                Left = 157
                Top = 1
                Width = 338
                DataField = 'descricao'
                DataSource = fraConsultaItemProdutoPedido.dsrProcuraItemProdutos
              end
              inherited edfCodigo: TtecDBFindLookup
                Top = 1
                Width = 134
                DataaFieldInterno = 'produto'
                DataaFieldVisual = 'produtovisual'
                DataField = 'produtovisual'
                DataSource = fraConsultaItemProdutoPedido.dsrProcuraItemProdutos
                Group = 'itemproduto'
                MaxLength = 30
                OnFound = nil
                Operacao = opPESQUISA
                Parameter = 'produtovisual'
              end
            end
          end
          object gbxPedido: TGroupBox
            Left = 13
            Top = 21
            Width = 501
            Height = 37
            Caption = ' PEDIDO '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            inline fraConsultaPedido: TfraConsultaCodigo
              Left = 2
              Top = 10
              Width = 497
              Height = 25
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
              TabOrder = 0
              inherited sbnProcura: TSpeedButton
                Left = 62
              end
              inherited dtxDescricao: TtecDBText
                Left = 86
                DataField = 'nomefornecedor'
                DataSource = fraConsultaPedido.dsrProcuraPedido
              end
              inherited edfCodigo: TtecDBFindLookup
                Width = 60
                DataField = 'numero'
                DataSource = fraConsultaPedido.dsrProcuraPedido
                Group = 'Pedido'
                OnFound = nil
                Operacao = opPESQUISA
                Parameter = 'numero'
                ActiveSetControls = False
                DenyInsert = True
                NoSetControls = <>
                SetControls = <>
              end
            end
          end
          object gbxProdutos_5: TGroupBox
            Left = 747
            Top = 64
            Width = 200
            Height = 60
            Caption = ' PRODUTOS '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 6
            object ckbProdutoEmLinha_5: TCheckBox
              Left = 6
              Top = 15
              Width = 80
              Height = 16
              Caption = '&Em Linha'
              Checked = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              State = cbChecked
              TabOrder = 0
            end
            object ckbProdutoForadeLinha_5: TCheckBox
              Left = 96
              Top = 15
              Width = 95
              Height = 16
              Caption = '&Fora de Linha'
              Checked = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              State = cbChecked
              TabOrder = 1
            end
            object ckbProdutoInativo_5: TCheckBox
              Left = 96
              Top = 36
              Width = 95
              Height = 16
              Caption = '&Inativo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 3
            end
            object ckbProdutoAtivo_5: TCheckBox
              Left = 6
              Top = 36
              Width = 80
              Height = 16
              Caption = '&Ativo'
              Checked = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              State = cbChecked
              TabOrder = 2
            end
          end
          object gbxConsultaFornecedorPedido: TGroupBox
            Left = 13
            Top = 61
            Width = 500
            Height = 37
            Caption = 'FORNECEDOR'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            inline fraConsultaFornecedorPedido: TfraConsultaCodigo
              Left = 3
              Top = 11
              Width = 495
              Height = 22
              HorzScrollBar.Range = 631
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
                Left = 89
                Top = -1
                Width = 404
                DataField = 'nome'
                DataSource = fraConsultaFornecedorPedido.dsrProcuraCliente
              end
              inherited edfCodigo: TtecDBFindLookup
                DataField = 'codigo'
                DataSource = fraConsultaFornecedorPedido.dsrProcuraCliente
                Group = 'FORNECEDOR'
                MaxLength = 6
                OnFound = nil
                Operacao = opPESQUISA
                Parameter = 'codigo'
              end
            end
          end
        end
      end
      object tstProdutosExposicao: TTabSheet
        Caption = '&6 - Produtos em exposi'#231#227'o'
        ImageIndex = 5
        OnResize = tstProdutosExposicaoResize
        object gbxProdutosExposicao: TGroupBox
          Left = 0
          Top = 0
          Width = 1066
          Height = 362
          Align = alClient
          TabOrder = 0
          object gbxFilialProdutosExposicao: TGroupBox
            Left = 10
            Top = 10
            Width = 500
            Height = 36
            Caption = ' FILIAL '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            inline fraConsultaFilialProdutosExposicao: TfraConsultaCodigo
              Left = 2
              Top = 10
              Width = 495
              Height = 23
              HorzScrollBar.Range = 497
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
                Left = 40
              end
              inherited dtxDescricao: TtecDBText
                Left = 64
                Width = 431
                DataField = 'nome'
                DataSource = fraConsultaFilialProdutosExposicao.dsrProcuraFiliais
              end
              inherited edfCodigo: TtecDBFindLookup
                Width = 43
                DataField = 'codigo'
                DataSource = fraConsultaFilialProdutosExposicao.dsrProcuraFiliais
                Group = 'FilialProdutosExposicao'
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
          object gbxIntervaloAlteracaoProdutosExposicao: TGroupBox
            Left = 606
            Top = 18
            Width = 160
            Height = 36
            Caption = ' ALTERA'#199#195'O DE PRE'#199'OS'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            object Label3: TLabel
              Left = 76
              Top = 16
              Width = 7
              Height = 15
              Caption = 'a'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
            end
            object edtIntervaloInicialAlteracaoProdutosExposicao: TEditData
              Left = 2
              Top = 10
              Width = 70
              Height = 23
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              MaxLength = 10
              ParentFont = False
              TabOrder = 0
              Minimo = 37353
              Maximo = 360
            end
            object edtIntervaloFinalAlteracaoProdutosExposicao: TEditData
              Left = 87
              Top = 10
              Width = 70
              Height = 23
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              MaxLength = 10
              ParentFont = False
              TabOrder = 1
              Minimo = 37353
              Maximo = 360
            end
          end
          object gbxImprimirProdutosExposicao: TGroupBox
            Left = 10
            Top = 46
            Width = 165
            Height = 85
            Caption = ' IMPRIMIR '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            object ckbQtdemEstoqueProdutosExposicao: TCheckBox
              Left = 6
              Top = 15
              Width = 150
              Height = 16
              Caption = 'Quantidade em estoque'
              Checked = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              State = cbChecked
              TabOrder = 0
              OnClick = ckbQtdemEstoqueProdutosExposicaoClick
            end
            object ckbQtdeZeradaProdutosExposicao: TCheckBox
              Left = 6
              Top = 50
              Width = 150
              Height = 16
              Caption = 'Produtos com qtde zero'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              OnClick = ckbQtdeZeradaProdutosExposicaoClick
            end
            object ckbQusntidadeLote: TCheckBox
              Left = 6
              Top = 32
              Width = 149
              Height = 16
              Caption = 'Quantidade do lote'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              OnClick = ckbQusntidadeLoteClick
            end
            object ckbImprimirFotoProduto: TCheckBox
              Left = 6
              Top = 67
              Width = 129
              Height = 16
              Caption = 'Imprimir foto'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 3
            end
          end
          object gbxQuantidadeProdutosExposicao: TGroupBox
            Left = 184
            Top = 46
            Width = 80
            Height = 36
            Caption = 'QUANTIDADE'
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
            object edtQuantidadeProdutosExposicao: TEditNumero
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
              OnChange = edtQuantidadeChange
              Mascara = False
              TipoMascara = tmGERAL
              NrDecimal = 0
              Decimais = False
              Negativo = False
              Tamanho = 3
            end
          end
          object gbxProdutos_6: TGroupBox
            Left = 10
            Top = 134
            Width = 255
            Height = 89
            Caption = ' PRODUTOS '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            object ckbProdutoEmLinha_6: TCheckBox
              Left = 6
              Top = 15
              Width = 81
              Height = 16
              Caption = '&Em Linha'
              Checked = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              State = cbChecked
              TabOrder = 0
            end
            object ckbProdutoForadeLinha_6: TCheckBox
              Left = 140
              Top = 15
              Width = 95
              Height = 16
              Caption = '&Fora de Linha'
              Checked = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              State = cbChecked
              TabOrder = 1
            end
            object ckbProdutoInativo_6: TCheckBox
              Left = 140
              Top = 33
              Width = 95
              Height = 16
              Caption = '&Inativo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 3
            end
            object ckbProdutoAtivo_6: TCheckBox
              Left = 6
              Top = 33
              Width = 65
              Height = 16
              Caption = '&Ativo'
              Checked = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              State = cbChecked
              TabOrder = 2
            end
            object ckbEmExposicao: TCheckBox
              Left = 6
              Top = 51
              Width = 105
              Height = 16
              Caption = 'Em Exposi'#231#227'o'
              Checked = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              State = cbChecked
              TabOrder = 4
            end
            object ckbEmPromocao: TCheckBox
              Left = 4
              Top = 70
              Width = 105
              Height = 16
              Caption = 'Em Promo'#231#227'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 6
            end
            object ckbForaExposicao: TCheckBox
              Left = 142
              Top = 51
              Width = 105
              Height = 16
              Caption = 'Fora Exposi'#231#227'o'
              Checked = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              State = cbChecked
              TabOrder = 5
            end
            object ckbForaPromocao: TCheckBox
              Left = 140
              Top = 70
              Width = 105
              Height = 16
              Caption = 'Fora Promo'#231#227'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 7
            end
          end
          object gbxNrLote: TGroupBox
            Left = 184
            Top = 81
            Width = 80
            Height = 36
            Caption = ' N'#186' LOTE'
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 5
            object edtNrLote: TEditNumero
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
              OnChange = edtQuantidadeChange
              Mascara = False
              TipoMascara = tmGERAL
              NrDecimal = 0
              Decimais = False
              Negativo = False
              Tamanho = 9
            end
          end
          object pgcSelecaoProdutos: TPageControl
            Left = 272
            Top = 53
            Width = 625
            Height = 170
            ActivePage = tstListasPadronizadas
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 6
            object tstListasPadronizadas: TTabSheet
              Caption = 'Listas Padronizadas'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              inline fraSelecaoaleatorialistaspadronizadas1: TfraSelecaoaleatorialistaspadronizadas
                Left = 0
                Top = 0
                Width = 617
                Height = 140
                Align = alClient
                TabOrder = 0
                inherited fraSelecaoAleatoriaListasPadronizadas: TfraSelecaoAleatoria
                  Width = 617
                  Height = 140
                  inherited Splitter1: TSplitter
                    Left = 585
                    Height = 125
                  end
                  inherited dbgSelecaoAleatoria: TtecDBGrid
                    Width = 585
                    Height = 125
                  end
                  inherited pnlLabels: TPanel
                    Left = 588
                    Height = 125
                  end
                  inherited pnlAbaixo: TPanel
                    Top = 125
                    Width = 617
                    Font.Pitch = fpVariable
                    inherited lblOrientacao: TLabel
                      Width = 226
                      Height = 14
                      Font.Height = -11
                      Font.Name = 'Helvetica'
                      Font.Pitch = fpVariable
                    end
                    inherited pnlAbaixoDireita: TPanel
                      Left = 586
                      Font.Pitch = fpVariable
                    end
                  end
                end
              end
            end
            object tstSelecaoProdutos: TTabSheet
              Caption = 'Sele'#231#227'o de Produtos'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ImageIndex = 1
              ParentFont = False
              inline fraMultiplaSelecaoAleatoriaProdutosExposicao: TfraMultiplaSelecaoAleatoria
                Left = 0
                Top = 0
                Width = 617
                Height = 140
                Align = alClient
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'MS Sans Serif'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                inherited pgcMultiplaSelecaoAleatoria: TtecPageControl
                  Width = 617
                  Height = 140
                  ActivePage = fraMultiplaSelecaoAleatoriaProdutosExposicao.tstSelecaoAleatoriaLotes
                  Font.Pitch = fpVariable
                  inherited tstItemdeProduto: TTabSheet
                    Font.Pitch = fpVariable
                    inherited fraSelecaoAleatoriaItemdeProdutos: TfraSelecaoAleatoriaItemdeProdutos
                      inherited fraSelecaoAleatoriaItemdeProduto: TfraSelecaoAleatoria
                        Height = 379
                        inherited Splitter1: TSplitter
                          Left = 867
                          Height = 365
                        end
                        inherited dbgSelecaoAleatoria: TtecDBGrid
                          Height = 365
                        end
                        inherited pnlLabels: TPanel
                          Left = 835
                          Height = 365
                          inherited sbnProcura: TSpeedButton
                            Height = 19
                          end
                          inherited sbnExcluirTodos: TSpeedButton
                            Top = 67
                          end
                          inherited sbnIncluirItem: TSpeedButton
                            Top = 26
                          end
                        end
                        inherited pnlAbaixo: TPanel
                          Top = 365
                          Font.Pitch = fpVariable
                          inherited lblOrientacao: TLabel
                            Font.Pitch = fpVariable
                          end
                          inherited pnlAbaixoDireita: TPanel
                            Left = 578
                            Font.Pitch = fpVariable
                          end
                        end
                      end
                      inherited pnlParametros: TPanel
                        Top = 379
                        Height = 17
                        Font.Height = -12
                        Font.Name = 'Helvetica'
                        Font.Pitch = fpVariable
                        inherited ckbProdutosComAgendamento: TCheckBox
                          Font.Height = -12
                          Font.Name = 'Helvetica'
                          Font.Pitch = fpVariable
                        end
                        inherited ckbIncluirSimilaresnaLista: TCheckBox
                          Font.Pitch = fpVariable
                        end
                      end
                    end
                  end
                  inherited tstProduto: TTabSheet
                    inherited fraSelecaoAleatoriaprodutos: TfraSelecaoAleatoriaprodutos
                      inherited fraSelecaoAleatoriaProduto: TfraSelecaoAleatoria
                        inherited pnlAbaixo: TPanel
                          Font.Pitch = fpVariable
                          inherited lblOrientacao: TLabel
                            Font.Pitch = fpVariable
                          end
                          inherited pnlAbaixoDireita: TPanel
                            Left = 578
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
                            Left = 578
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
                            Left = 578
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
                            Width = 200
                            Height = 15
                            Caption = 'Pressione CTRL+F9 para pesquisar'
                            Font.Height = -12
                            Font.Name = 'Helvetica'
                            Font.Pitch = fpVariable
                          end
                          inherited pnlAbaixoDireita: TPanel
                            Left = 578
                            Font.Pitch = fpVariable
                          end
                        end
                        inherited dsrSelecaoAleatoria: TtecDataSource
                          Left = 376
                          Top = 48
                        end
                        inherited qrySelecaoAleatoria: TtecQuery
                          Left = 344
                          Top = 48
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
                            Font.Pitch = fpVariable
                          end
                        end
                      end
                    end
                  end
                  inherited tstSelecaoAleatoriaLotes: TTabSheet
                    inherited fraSelecaoAleatorialotes1: TfraSelecaoAleatorialotes
                      Width = 609
                      Height = 110
                      inherited fraSelecaoAleatorialotes: TfraSelecaoAleatoria
                        Width = 609
                        Height = 110
                        inherited Splitter1: TSplitter
                          Left = 574
                          Height = 95
                        end
                        inherited dbgSelecaoAleatoria: TtecDBGrid
                          Width = 574
                          Height = 95
                        end
                        inherited pnlLabels: TPanel
                          Left = 577
                          Height = 95
                        end
                        inherited pnlAbaixo: TPanel
                          Top = 95
                          Width = 609
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
                            Font.Pitch = fpVariable
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
      object tstb2w_: TTabSheet
        Caption = '&7 - B2W'
        ImageIndex = 7
        object dbgplp_b2w: TDBAdvGrid
          Left = 0
          Top = 0
          Width = 873
          Height = 362
          Cursor = crDefault
          Align = alLeft
          ColCount = 9
          RowCount = 2
          FixedRows = 1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          ScrollBars = ssBoth
          TabOrder = 0
          OnSelectCell = dbgplp_b2wSelectCell
          ActiveRowShow = True
          OnGetColumnFilter = dbgplp_b2wGetColumnFilter
          OnFilterProgress = dbgplp_b2wFilterProgress
          ActiveCellShow = True
          ActiveCellFont.Charset = DEFAULT_CHARSET
          ActiveCellFont.Color = clWindowText
          ActiveCellFont.Height = -11
          ActiveCellFont.Name = 'Tahoma'
          ActiveCellFont.Style = [fsBold]
          ColumnHeaders.Strings = (
            ''
            'MarketPlace'
            'PLP'
            'Impresso'
            'Data de Inclus'#227'o'
            'Servi'#231'o'
            'Descri'#231#227'o do Servi'#231'o'
            'Vendedor'
            'Nome do Vendedor')
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
          Filter = <
            item
              Column = 7
              Operation = foSHORT
            end
            item
              Column = 8
              Operation = foSHORT
            end>
          FilterActive = True
          FilterDropDown.AutoSize = True
          FilterDropDown.ColumnWidth = True
          FilterDropDown.Font.Charset = DEFAULT_CHARSET
          FilterDropDown.Font.Color = clWindowText
          FilterDropDown.Font.Height = -11
          FilterDropDown.Font.Name = 'MS Sans Serif'
          FilterDropDown.Font.Style = []
          FilterDropDownAuto = True
          FilterDropDownClear = '(All)'
          FilterDropDownCheck = True
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
          ScrollWidth = 16
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
              FieldName = 'marketplace'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Pitch = fpVariable
              Font.Style = []
              Header = 'MarketPlace'
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
              Width = 46
            end
            item
              Borders = []
              BorderPen.Color = clSilver
              CheckFalse = 'N'
              CheckTrue = 'Y'
              Color = clWindow
              FieldName = 'plp'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Pitch = fpVariable
              Font.Style = []
              Header = 'PLP'
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
              Width = 86
            end
            item
              Alignment = taCenter
              Borders = []
              BorderPen.Color = clSilver
              CheckFalse = 'N'
              CheckTrue = 'Y'
              Color = clWindow
              FieldName = 'impresso'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Pitch = fpVariable
              Font.Style = []
              Header = 'Impresso'
              HeaderFont.Charset = DEFAULT_CHARSET
              HeaderFont.Color = clWindowText
              HeaderFont.Height = -11
              HeaderFont.Name = 'MS Sans Serif'
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
              Width = 58
            end
            item
              Borders = []
              BorderPen.Color = clSilver
              CheckFalse = 'N'
              CheckTrue = 'Y'
              Color = clWindow
              FieldName = 'data_inclusao'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Pitch = fpVariable
              Font.Style = []
              Header = 'Data de Inclus'#227'o'
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
              Width = 107
            end
            item
              Borders = []
              BorderPen.Color = clSilver
              CheckFalse = 'N'
              CheckTrue = 'Y'
              Color = clWindow
              FieldName = 'codservico'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Pitch = fpVariable
              Font.Style = []
              Header = 'Servi'#231'o'
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
              Width = 63
            end
            item
              Borders = []
              BorderPen.Color = clSilver
              CheckFalse = 'N'
              CheckTrue = 'Y'
              Color = clWindow
              FieldName = 'nomeservico'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Pitch = fpVariable
              Font.Style = []
              Header = 'Descri'#231#227'o do Servi'#231'o'
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
              Width = 128
            end
            item
              Borders = []
              BorderPen.Color = clSilver
              CheckFalse = 'N'
              CheckTrue = 'Y'
              Color = clWindow
              FieldName = 'vendedor'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
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
              Name = 'dbg_plp_b2w'
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
              FieldName = 'nomevendedor'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Tahoma'
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
              Width = 186
            end>
          DataSource = dtmEmissaoEtiquetas.dsrplpb2w
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
          ShowBooleanFields = True
          ShowUnicode = False
          UseDBFieldWidths = True
          PostOnEnter = False
          ColWidths = (
            20
            46
            86
            58
            107
            63
            128
            84
            186)
        end
        object pnlParametrosB2W: TPanel
          Left = 872
          Top = 0
          Width = 194
          Height = 362
          Align = alRight
          TabOrder = 1
          object gbxIntervalorInclusaob2W: TGroupBox
            Left = 1
            Top = 1
            Width = 192
            Height = 37
            Align = alTop
            Caption = 'INTERVALO DE INCLUS'#195'O'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object Label4: TLabel
              Left = 84
              Top = 17
              Width = 7
              Height = 15
              Caption = 'a'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
            end
            object edtDataInicialInclusaoB2W: TEditData
              Left = 10
              Top = 11
              Width = 70
              Height = 23
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              MaxLength = 10
              ParentFont = False
              TabOrder = 0
              Minimo = 37353
              Maximo = 360
            end
            object edtDataFinalInclusaoB2W: TEditData
              Left = 95
              Top = 11
              Width = 70
              Height = 23
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              MaxLength = 10
              ParentFont = False
              TabOrder = 1
              Minimo = 37353
              Maximo = 360
            end
          end
          object gbxIncluirJaImpressos: TGroupBox
            Left = 1
            Top = 38
            Width = 192
            Height = 27
            Align = alTop
            TabOrder = 1
            object ckbIncluirB2WJaImpressos: TCheckBox
              Left = 8
              Top = 8
              Width = 153
              Height = 17
              Caption = 'Incluir J'#225' Impressos'
              TabOrder = 0
            end
          end
        end
      end
      object tstMagalu: TTabSheet
        Caption = '&8 - Magalu'
        ImageIndex = 7
        object pnlParametrosMagalu: TPanel
          Left = 648
          Top = 0
          Width = 418
          Height = 232
          Align = alRight
          TabOrder = 0
          inline fraSelecaoAleatoriavendedores1: TfraSelecaoAleatoriavendedores
            Left = 1
            Top = 86
            Width = 416
            Height = 145
            Align = alBottom
            TabOrder = 0
            inherited fraSelecaoAleatoriavendedores: TfraSelecaoAleatoria
              Width = 416
              Height = 145
              inherited Splitter1: TSplitter
                Left = 383
                Height = 130
              end
              inherited dbgSelecaoAleatoria: TtecDBGrid
                Width = 383
                Height = 130
              end
              inherited pnlLabels: TPanel
                Left = 386
                Height = 130
              end
              inherited pnlAbaixo: TPanel
                Top = 130
                Width = 416
                Font.Pitch = fpVariable
                inherited lblOrientacao: TLabel
                  Font.Pitch = fpVariable
                end
                inherited pnlAbaixoDireita: TPanel
                  Left = 385
                  Font.Pitch = fpVariable
                end
              end
            end
          end
          object gbxEtiquetasPorPedido: TGroupBox
            Left = 1
            Top = 1
            Width = 416
            Height = 32
            Align = alTop
            TabOrder = 1
            object lblQtdadeEtiquetasporPedido: TStaticText
              Left = 8
              Top = 10
              Width = 125
              Height = 20
              Caption = 'Etiquetas por Pedido'
              TabOrder = 0
            end
            object edtQtdadeEtiquetasporPedido: TEditNumero
              Left = 141
              Top = 7
              Width = 29
              Height = 23
              Hint = 'Deixe em branco para considerar a quantidade do produto'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              MaxLength = -1
              ParentFont = False
              TabOrder = 1
              Text = '1'
              OnChange = edtQuantidadeChange
              Mascara = False
              TipoMascara = tmGERAL
              NrDecimal = 0
              Decimais = False
              Negativo = False
              Tamanho = 3
            end
          end
        end
        object pnlGridMagalu: TAdvPanel
          Left = 0
          Top = 0
          Width = 649
          Height = 232
          Align = alLeft
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          UseDockManager = True
          Version = '2.1.0.4'
          Caption.Color = clHighlight
          Caption.ColorTo = clNone
          Caption.Font.Charset = DEFAULT_CHARSET
          Caption.Font.Color = clBlack
          Caption.Font.Height = -11
          Caption.Font.Name = 'Tahoma'
          Caption.Font.Pitch = fpVariable
          Caption.Font.Style = []
          StatusBar.Font.Charset = DEFAULT_CHARSET
          StatusBar.Font.Color = clWindowText
          StatusBar.Font.Height = -11
          StatusBar.Font.Name = 'Tahoma'
          StatusBar.Font.Style = []
          FullHeight = 200
          object pnlBottomGridMagalu: TAdvPanel
            Left = 1
            Top = 214
            Width = 647
            Height = 17
            Align = alBottom
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            UseDockManager = True
            Version = '2.1.0.4'
            Caption.Color = clHighlight
            Caption.ColorTo = clNone
            Caption.Font.Charset = DEFAULT_CHARSET
            Caption.Font.Color = clBlack
            Caption.Font.Height = -11
            Caption.Font.Name = 'Tahoma'
            Caption.Font.Pitch = fpVariable
            Caption.Font.Style = []
            StatusBar.Font.Charset = DEFAULT_CHARSET
            StatusBar.Font.Color = clWindowText
            StatusBar.Font.Height = -11
            StatusBar.Font.Name = 'Tahoma'
            StatusBar.Font.Style = []
            FullHeight = 200
            object ckbSelecionarTodasEtiquetas: TAdvOfficeCheckBox
              Left = 43
              Top = -5
              Width = 161
              Height = 19
              TabOrder = 0
              OnClick = ckbSelecionarTodasEtiquetasClick
              Alignment = taLeftJustify
              Caption = 'Marcar/Desmarcar Todas'
              DisabledFontColor = clBlack
              ReturnIsTab = False
              ShadowColor = clBlack
              URLColor = clBlack
              Version = '1.3.4.1'
            end
          end
          object DBAdvGridMagalu: TDBAdvGrid
            Left = 1
            Top = 1
            Width = 649
            Height = 213
            Cursor = crDefault
            Align = alLeft
            ColCount = 12
            RowCount = 2
            FixedRows = 1
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Pitch = fpVariable
            Font.Style = []
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing]
            ParentFont = False
            ScrollBars = ssBoth
            TabOrder = 1
            OnSelectCell = DBAdvGridMagaluSelectCell
            ActiveRowShow = True
            ActiveCellShow = True
            ActiveCellFont.Charset = DEFAULT_CHARSET
            ActiveCellFont.Color = clWindowText
            ActiveCellFont.Height = -11
            ActiveCellFont.Name = 'Tahoma'
            ActiveCellFont.Style = [fsBold]
            ColumnHeaders.Strings = (
              ''
              'Imprimir'
              'MarketPlace'
              'Impresso'
              'Inclus'#227'o'
              'Filial'
              'S'#233'rie'
              'Nr'#176' NF'
              'Contrato'
              'Valor'
              'Vendedor'
              'Nome')
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
            Filter = <
              item
                Column = 7
                Operation = foSHORT
              end
              item
                Column = 8
                Operation = foSHORT
              end>
            FilterDropDown.AutoSize = True
            FilterDropDown.ColumnWidth = True
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
            ScrollWidth = 16
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
            SelectionResizer = True
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
                FieldName = 'imprimir'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Pitch = fpVariable
                Font.Style = []
                Header = 'Imprimir'
                HeaderFont.Charset = DEFAULT_CHARSET
                HeaderFont.Color = clBlack
                HeaderFont.Height = -13
                HeaderFont.Name = 'Tahoma'
                HeaderFont.Pitch = fpVariable
                HeaderFont.Style = []
                PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
                PrintFont.Charset = DEFAULT_CHARSET
                PrintFont.Color = clBlack
                PrintFont.Height = -13
                PrintFont.Name = 'Tahoma'
                PrintFont.Pitch = fpVariable
                PrintFont.Style = []
                Width = 57
              end
              item
                Borders = []
                BorderPen.Color = clSilver
                CheckFalse = 'N'
                CheckTrue = 'Y'
                Color = clWindow
                FieldName = 'codigo_pedido_marketplace'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Pitch = fpVariable
                Font.Style = []
                Header = 'MarketPlace'
                HeaderFont.Charset = DEFAULT_CHARSET
                HeaderFont.Color = clWindowText
                HeaderFont.Height = -11
                HeaderFont.Name = 'MS Sans Serif'
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
                Width = 94
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
                FieldName = 'etiqueta_impressa'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Pitch = fpVariable
                Font.Style = []
                Header = 'Impresso'
                HeaderFont.Charset = DEFAULT_CHARSET
                HeaderFont.Color = clWindowText
                HeaderFont.Height = -11
                HeaderFont.Name = 'MS Sans Serif'
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
                Width = 49
              end
              item
                Alignment = taCenter
                Borders = []
                BorderPen.Color = clSilver
                CheckFalse = 'N'
                CheckTrue = 'Y'
                Color = clWindow
                FieldName = 'data'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Pitch = fpVariable
                Font.Style = []
                Header = 'Inclus'#227'o'
                HeaderFont.Charset = DEFAULT_CHARSET
                HeaderFont.Color = clWindowText
                HeaderFont.Height = -11
                HeaderFont.Name = 'MS Sans Serif'
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
                Width = 57
              end
              item
                Borders = []
                BorderPen.Color = clSilver
                CheckFalse = 'N'
                CheckTrue = 'Y'
                Color = clWindow
                FieldName = 'filial'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Pitch = fpVariable
                Font.Style = []
                Header = 'Filial'
                HeaderFont.Charset = DEFAULT_CHARSET
                HeaderFont.Color = clWindowText
                HeaderFont.Height = -11
                HeaderFont.Name = 'MS Sans Serif'
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
                Width = 27
              end
              item
                Borders = []
                BorderPen.Color = clSilver
                CheckFalse = 'N'
                CheckTrue = 'Y'
                Color = clWindow
                FieldName = 'serie'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Pitch = fpVariable
                Font.Style = []
                Header = 'S'#233'rie'
                HeaderFont.Charset = DEFAULT_CHARSET
                HeaderFont.Color = clWindowText
                HeaderFont.Height = -11
                HeaderFont.Name = 'MS Sans Serif'
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
                Width = 27
              end
              item
                Borders = []
                BorderPen.Color = clSilver
                CheckFalse = 'N'
                CheckTrue = 'Y'
                Color = clWindow
                FieldName = 'numeronf'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Pitch = fpVariable
                Font.Style = []
                Header = 'Nr'#176' NF'
                HeaderFont.Charset = DEFAULT_CHARSET
                HeaderFont.Color = clBlack
                HeaderFont.Height = -13
                HeaderFont.Name = 'Tahoma'
                HeaderFont.Pitch = fpVariable
                HeaderFont.Style = []
                HeaderAlignment = taCenter
                PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
                PrintFont.Charset = DEFAULT_CHARSET
                PrintFont.Color = clBlack
                PrintFont.Height = -13
                PrintFont.Name = 'Tahoma'
                PrintFont.Pitch = fpVariable
                PrintFont.Style = []
                ReadOnly = True
                Width = 47
              end
              item
                Borders = []
                BorderPen.Color = clSilver
                CheckFalse = 'N'
                CheckTrue = 'Y'
                Color = clWindow
                FieldName = 'contrato'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Pitch = fpVariable
                Font.Style = []
                Header = 'Contrato'
                HeaderFont.Charset = DEFAULT_CHARSET
                HeaderFont.Color = clBlack
                HeaderFont.Height = -13
                HeaderFont.Name = 'Tahoma'
                HeaderFont.Pitch = fpVariable
                HeaderFont.Style = []
                PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
                PrintFont.Charset = DEFAULT_CHARSET
                PrintFont.Color = clBlack
                PrintFont.Height = -13
                PrintFont.Name = 'Tahoma'
                PrintFont.Pitch = fpVariable
                PrintFont.Style = []
                ReadOnly = True
                Width = 51
              end
              item
                Alignment = taRightJustify
                Borders = []
                BorderPen.Color = clSilver
                CheckFalse = 'N'
                CheckTrue = 'Y'
                Color = clWindow
                FieldName = 'valor'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Pitch = fpVariable
                Font.Style = []
                Header = 'Valor'
                HeaderFont.Charset = DEFAULT_CHARSET
                HeaderFont.Color = clBlack
                HeaderFont.Height = -13
                HeaderFont.Name = 'Tahoma'
                HeaderFont.Pitch = fpVariable
                HeaderFont.Style = []
                HeaderAlignment = taCenter
                PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
                PrintFont.Charset = DEFAULT_CHARSET
                PrintFont.Color = clBlack
                PrintFont.Height = -13
                PrintFont.Name = 'Tahoma'
                PrintFont.Pitch = fpVariable
                PrintFont.Style = []
                ReadOnly = True
                Width = 45
              end
              item
                Borders = []
                BorderPen.Color = clSilver
                CheckFalse = 'N'
                CheckTrue = 'Y'
                Color = clWindow
                FieldName = 'vendedordadofiscal'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -13
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
                HeaderAlignment = taCenter
                Name = 'dbg_plp_b2w'
                PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
                PrintFont.Charset = DEFAULT_CHARSET
                PrintFont.Color = clWindowText
                PrintFont.Height = -11
                PrintFont.Name = 'MS Sans Serif'
                PrintFont.Pitch = fpVariable
                PrintFont.Style = []
                ReadOnly = True
                Width = 38
              end
              item
                Borders = []
                BorderPen.Color = clSilver
                CheckFalse = 'N'
                CheckTrue = 'Y'
                Color = clWindow
                FieldName = 'nomevendedordadofiscal'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Pitch = fpVariable
                Font.Style = []
                Header = 'Nome Vendedor'
                HeaderFont.Charset = DEFAULT_CHARSET
                HeaderFont.Color = clBlack
                HeaderFont.Height = -13
                HeaderFont.Name = 'Tahoma'
                HeaderFont.Pitch = fpVariable
                HeaderFont.Style = []
                PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
                PrintFont.Charset = DEFAULT_CHARSET
                PrintFont.Color = clBlack
                PrintFont.Height = -13
                PrintFont.Name = 'Tahoma'
                PrintFont.Pitch = fpVariable
                PrintFont.Style = []
                ReadOnly = True
                Width = 114
              end>
            DataSource = dtmEmissaoEtiquetas.dsrEtiquetasMagalu
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
            PostOnEnter = False
            ColWidths = (
              20
              57
              94
              49
              57
              27
              27
              47
              51
              45
              38
              114)
          end
        end
        inline fraselecaoaleatorianotassaidas1: Tfraselecaoaleatorianotassaidas
          Left = 0
          Top = 232
          Width = 1066
          Height = 130
          Align = alBottom
          TabOrder = 2
          inherited fraselecaoaleatorianotassaidas: TfraSelecaoAleatoria
            Width = 1066
            Height = 83
            inherited Splitter1: TSplitter
              Height = 70
            end
            inherited dbgSelecaoAleatoria: TtecDBGrid
              Height = 70
            end
            inherited pnlLabels: TPanel
              Height = 70
            end
            inherited pnlAbaixo: TPanel
              Top = 70
              Width = 1066
              inherited pnlAbaixoDireita: TPanel
                Left = 1035
                Font.Pitch = fpVariable
              end
            end
          end
          inherited pnlParametros: TPanel
            Top = 83
            Width = 1066
            Font.Pitch = fpVariable
          end
        end
      end
      object tstCorreios: TTabSheet
        Caption = '&9 - Correios'
        ImageIndex = 8
        object pnlParametrosCorreios: TPanel
          Left = 648
          Top = 0
          Width = 418
          Height = 362
          Align = alRight
          TabOrder = 0
          inline fraSelecaoAleatoriavendedores2: TfraSelecaoAleatoriavendedores
            Left = 1
            Top = 240
            Width = 416
            Height = 121
            Align = alBottom
            TabOrder = 0
            inherited fraSelecaoAleatoriavendedores: TfraSelecaoAleatoria
              Width = 416
              Height = 121
              inherited Splitter1: TSplitter
                Left = 383
                Height = 106
              end
              inherited dbgSelecaoAleatoria: TtecDBGrid
                Width = 383
                Height = 106
              end
              inherited pnlLabels: TPanel
                Left = 386
                Height = 106
              end
              inherited pnlAbaixo: TPanel
                Top = 106
                Width = 416
                Font.Pitch = fpVariable
                inherited lblOrientacao: TLabel
                  Font.Pitch = fpVariable
                end
                inherited pnlAbaixoDireita: TPanel
                  Left = 385
                  Font.Pitch = fpVariable
                end
              end
            end
          end
        end
      end
      object tstMercadoLivre: TTabSheet
        Caption = '10 - Mercado Livre'
        ImageIndex = 9
        object pnlParametrosMercadoLivre: TPanel
          Left = 640
          Top = 0
          Width = 426
          Height = 362
          Align = alRight
          TabOrder = 0
          object pgcParametrosMercadoLivre: TPageControl
            Left = 1
            Top = 1
            Width = 424
            Height = 360
            ActivePage = tstParametrosMercadoLivre
            Align = alClient
            TabOrder = 0
            object tstParametrosMercadoLivre: TTabSheet
              Caption = 'Par'#226'metros'
              inline fraSelecaoAleatoriavendedores3: TfraSelecaoAleatoriavendedores
                Left = 0
                Top = 224
                Width = 416
                Height = 105
                Align = alBottom
                TabOrder = 0
                inherited fraSelecaoAleatoriavendedores: TfraSelecaoAleatoria
                  Width = 416
                  Height = 105
                  inherited Splitter1: TSplitter
                    Left = 383
                    Height = 90
                  end
                  inherited dbgSelecaoAleatoria: TtecDBGrid
                    Width = 383
                    Height = 90
                  end
                  inherited pnlLabels: TPanel
                    Left = 386
                    Height = 90
                  end
                  inherited pnlAbaixo: TPanel
                    Top = 90
                    Width = 416
                    Font.Pitch = fpVariable
                    inherited lblOrientacao: TLabel
                      Font.Pitch = fpVariable
                    end
                    inherited pnlAbaixoDireita: TPanel
                      Left = 385
                      Font.Pitch = fpVariable
                    end
                  end
                end
              end
            end
            object tstRemetenteMercadoLivre: TTabSheet
              Caption = 'Remetente'
              ImageIndex = 1
              inline fraEnderecoEditor1: TfraEnderecoEditor
                Left = 0
                Top = 84
                Width = 416
                Height = 374
                HorzScrollBar.Visible = False
                VertScrollBar.Visible = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -13
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 2
                inherited gbxEndereco: TGroupBox
                  Width = 416
                  Height = 417
                  Align = alNone
                  inherited pnlNumero: TPanel
                    Width = 412
                    inherited edtNumeroEndereco: TDBEditTexto
                      Left = 4
                      DataField = 'numero'
                      DataSource = dtmEmissaoEtiquetas.dsrRepresentante
                      OnEnter = fraEnderecoEditor1edtNumeroEnter
                      OnExit = fraEnderecoEditor1mmoRuaExit
                    end
                    inherited edtComplemento: TDBEditTexto
                      Left = 86
                      Width = 275
                      DataField = 'complemento'
                      DataSource = dtmEmissaoEtiquetas.dsrRepresentante
                      OnEnter = fraEnderecoEditor1edtComplementoEnter
                      OnExit = fraEnderecoEditor1mmoRuaExit
                    end
                  end
                  inherited pnlBairro: TPanel
                    Width = 412
                    inherited sbnBairro: TSpeedButton
                      Left = 356
                    end
                    inherited edtBairro: TtecDoubleDBEdit
                      Left = 4
                      Width = 352
                      LookupField = 'nomebairro'
                      LookupSource = dtmEmissaoEtiquetas.dsrRepresentante
                      DataField = 'bairro'
                      DataSource = dtmEmissaoEtiquetas.dsrRepresentante
                      OnEnter = fraEnderecoEditor1edtComplementoEnter
                      OnExit = fraEnderecoEditor1mmoRuaExit
                    end
                  end
                  inherited pnlCidade: TPanel
                    Width = 412
                    inherited edtEstado: TDBEditTexto
                      Left = 354
                      DataField = 'estado'
                      DataSource = dtmEmissaoEtiquetas.dsrRepresentante
                      OnEnter = fraEnderecoEditor1edtComplementoEnter
                      OnExit = fraEnderecoEditor1mmoRuaExit
                    end
                    inherited edtCidade: TtecDoubleDBEdit
                      Left = 87
                      Width = 266
                      LookupField = 'nomecidade'
                      LookupSource = dtmEmissaoEtiquetas.dsrRepresentante
                      DataField = 'cidade'
                      DataSource = dtmEmissaoEtiquetas.dsrRepresentante
                      OnEnter = fraEnderecoEditor1edtComplementoEnter
                      OnExit = fraEnderecoEditor1mmoRuaExit
                    end
                    inherited edtCEP: TDBEditCep
                      Left = 4
                      DataField = 'cep'
                      DataSource = dtmEmissaoEtiquetas.dsrRepresentante
                      OnEnter = fraEnderecoEditor1edtComplementoEnter
                      OnExit = fraEnderecoEditor1mmoRuaExit
                    end
                  end
                  inherited pnlRua: TPanel
                    Width = 412
                    inherited sbnRua: TSpeedButton
                      Left = 357
                    end
                    inherited SpeedButton1: TSpeedButton
                      Left = 324
                    end
                    inherited mmoRua: TtecDBMemo
                      Left = 4
                      Width = 353
                      DataField = 'rua'
                      DataSource = dtmEmissaoEtiquetas.dsrRepresentante
                      OnEnter = fraEnderecoEditor1mmoRuaEnter
                      OnExit = fraEnderecoEditor1mmoRuaExit
                    end
                  end
                  inherited pnllblCidade: TPanel
                    Width = 412
                    inherited lblUF_: TLabel
                      Left = 357
                    end
                  end
                  inherited pnllblBairro: TPanel
                    Width = 412
                  end
                  inherited pnllblNumero: TPanel
                    Width = 412
                  end
                end
              end
              object GroupBox2: TGroupBox
                Left = 0
                Top = -3
                Width = 416
                Height = 40
                Caption = 'Filial'
                TabOrder = 0
                inline fraConsultaFilialRemetenteMercadoLivre: TfraConsultaCodigo
                  Left = 2
                  Top = 15
                  Width = 412
                  Height = 22
                  HorzScrollBar.Range = 504
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
                    Left = 67
                    Top = -1
                    Height = 23
                  end
                  inherited dtxDescricao: TtecDBText
                    Left = 91
                    Top = -1
                    Width = 320
                    DataField = 'nome'
                    DataSource = fraConsultaFilialRemetenteMercadoLivre.dsrProcuraFiliais
                  end
                  inherited edfCodigo: TtecDBFindLookup
                    Left = 3
                    Top = -1
                    DataField = 'codigo'
                    DataSource = fraConsultaFilialRemetenteMercadoLivre.dsrProcuraFiliais
                    Group = 'filial'
                    MaxLength = 6
                    OnFound = nil
                    Operacao = opPESQUISA
                    Parameter = 'codigo'
                  end
                  inherited qryConsultaImobilizado: TtecQuery
                    Top = 21
                  end
                end
              end
              object gbxRemetenteMercadoLivre: TGroupBox
                Left = 0
                Top = 36
                Width = 416
                Height = 39
                Caption = 'Remetente'
                TabOrder = 1
                object edtRemetenteMercadoLivre: TDBEditTexto
                  Left = 6
                  Top = 14
                  Width = 403
                  Height = 23
                  DataField = 'nome'
                  DataSource = dtmEmissaoEtiquetas.dsrRepresentante
                  MaxLength = -1
                  TabOrder = 0
                  OnEnter = edtRemetenteMercadoLivreEnter
                  OnExit = edtRemetenteMercadoLivreExit
                  CharCasenoDefault = False
                  Alignment = taLeftJustify
                end
              end
            end
          end
        end
      end
    end
    object pnlTopDetalheProduto: TPanel
      Left = 0
      Top = 400
      Width = 1074
      Height = 69
      Align = alTop
      TabOrder = 2
      object sbnProcuraModeloEtiquetas: TSpeedButton
        Left = 88
        Top = 43
        Width = 23
        Height = 23
        Hint = 'Procurar  Rua'
        Flat = True
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
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FFFFFFFDCDCDCDCDCDC7F
          7F7F7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC800000
          FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFFFFFFFDCDCDCDCDCDCDCDCDCDC
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
          DCDCDCDCDCDCDCDCDCDC7F7F7FC3C3C3FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDC7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFA858FFA858
          FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858DCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC800000
          FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FC3C3C3FFFFFFFFFFFFDCDCDCDCDCDCDC
          DCDCFFFFFF7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          800000FFA858FFA858FFA858FFA858FFA858800000DCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FC3C3C3FFFFFFFFFFFF7F
          7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCFFA858800000800000800000FFA858DCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7FDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC}
        NumGlyphs = 2
        Visible = False
        OnClick = sbnProcuraModeloEtiquetasClick
      end
      object ckbModificar: TCheckBox
        Left = 116
        Top = 49
        Width = 169
        Height = 17
        Caption = 'Modificar etiqueta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Visible = False
      end
      object edtArquivo: TEditTexto
        Left = 15
        Top = 43
        Width = 72
        Height = 23
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        MaxLength = -1
        ParentFont = False
        TabOrder = 2
        Visible = False
        CharCasenoDefault = False
        Alignment = taLeftJustify
      end
      object gbxModeloEtiqueta: TGroupBox
        Left = 14
        Top = 5
        Width = 299
        Height = 36
        Caption = ' MODELO DE ETIQUETA '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object sbnModeloEtiqueta: TSpeedButton
          Left = 43
          Top = 12
          Width = 24
          Height = 21
          Hint = 'Procurar  Modelo Etiqueta'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
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
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FFFFFFFDCDCDCDCDCDC7F
            7F7F7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC800000
            FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFFFFFFFDCDCDCDCDCDCDCDCDCDC
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
            DCDCDCDCDCDCDCDCDCDC7F7F7FC3C3C3FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDC7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFA858FFA858
            FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858DCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC800000
            FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FC3C3C3FFFFFFFFFFFFDCDCDCDCDCDCDC
            DCDCFFFFFF7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            800000FFA858FFA858FFA858FFA858FFA858800000DCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FC3C3C3FFFFFFFFFFFF7F
            7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCFFA858800000800000800000FFA858DCDCDCDCDCDCDCDCDCDCDCDCDCDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7FDC
            DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC}
          NumGlyphs = 2
          ParentFont = False
          OnClick = sbnModeloEtiquetaClick
        end
        object dtxModeloEtiqueta: TtecDBText
          Left = 68
          Top = 10
          Width = 228
          Height = 23
          TabStop = False
          Color = clBtnFace
          DataField = 'descricao'
          DataSource = dtmEmissaoEtiquetas.dsrProcuraModelosEtiquetas
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
        object edfModeloEtiqueta: TtecDbEditFind
          Left = 2
          Top = 10
          Width = 40
          Height = 23
          Alignment = taLeftJustify
          DataField = 'codigo'
          DataSource = dtmEmissaoEtiquetas.dsrProcuraModelosEtiquetas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          Group = 'Etiqueta'
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
          Parameter = 'codigo'
          ActiveSetControls = False
          DenyInsert = True
          NoSetControls = <>
          SetControls = <>
        end
      end
      object gbxPreco: TGroupBox
        Left = 397
        Top = 17
        Width = 79
        Height = 36
        Caption = ' PRE'#199'O '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        object ckbImprimirPreco: TCheckBox
          Left = 7
          Top = 14
          Width = 69
          Height = 17
          Caption = 'Imprimir'
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          State = cbChecked
          TabOrder = 0
        end
      end
      object rgpTipoEtiqueta: TtecDBRadioGroup
        Left = 314
        Top = 4
        Width = 83
        Height = 49
        Caption = ' TAMANHO '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        TabStop = False
        object ckbGrande: TtecRadioButton
          Left = 6
          Top = 13
          Width = 70
          Height = 17
          Caption = 'Grande'
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          TabStop = True
          Value = 'G'
        end
        object ckbPequena: TtecRadioButton
          Left = 6
          Top = 29
          Width = 70
          Height = 17
          Caption = 'Pequena'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          Value = 'P'
        end
      end
      object gbxDesconto: TGroupBox
        Left = 477
        Top = 17
        Width = 79
        Height = 36
        Caption = ' DESCONTO '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        object lblPercentual: TLabel
          Left = 63
          Top = 16
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
        object edtPercentualAVista: TEditNumero
          Left = 2
          Top = 10
          Width = 58
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
          Text = '0,00'
          Mascara = True
          TipoMascara = tmGERAL
          NrDecimal = 2
          Decimais = True
          Negativo = False
          Tamanho = 9
        end
      end
      object rgpImpressora: TtecDBRadioGroup
        Left = 558
        Top = 7
        Width = 196
        Height = 50
        TabOrder = 6
        TabStop = False
        object lblTipoImpressora: TLabel
          Left = 2
          Top = 28
          Width = 192
          Height = 17
          Alignment = taCenter
          AutoSize = False
          Caption = 'Ver Prefer'#234'ncias Locais'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -14
          Font.Name = 'adobe-courier'
          Font.Pitch = fpFixed
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblImpressoras: TLabel
          Left = 56
          Top = 9
          Width = 80
          Height = 17
          Alignment = taCenter
          Caption = 'Impressora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -14
          Font.Name = 'adobe-courier'
          Font.Pitch = fpFixed
          Font.Style = []
          ParentFont = False
        end
      end
      object btnAjustar: TButton
        Left = 756
        Top = 24
        Width = 60
        Height = 25
        Caption = 'Ajustar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        OnClick = btnAjustarClick
      end
      object stxDataFabricacao: TStaticText
        Left = 934
        Top = 4
        Width = 44
        Height = 11
        AutoSize = False
        Caption = 'DATA DE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 10
      end
      object stxDataValidade: TStaticText
        Left = 1010
        Top = 4
        Width = 44
        Height = 11
        AutoSize = False
        Caption = 'DATA DE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 11
      end
      object gbxDataFabricacao: TGroupBox
        Left = 921
        Top = 14
        Width = 75
        Height = 36
        Caption = 'FABRICA'#199#195'O'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 8
        object edtDataFabricacao: TEditData
          Left = 2
          Top = 10
          Width = 70
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = 10
          ParentFont = False
          TabOrder = 0
          OnChange = edtDataFabricacaoChange
          Minimo = 37353
          Maximo = 360
        end
      end
      object gbxDataValidade: TGroupBox
        Left = 997
        Top = 13
        Width = 75
        Height = 36
        Caption = ' VALIDADE '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 9
        object edtDataValidade: TEditData
          Left = 2
          Top = 10
          Width = 70
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = 10
          ParentFont = False
          TabOrder = 0
          OnChange = edtDataValidadeChange
          Minimo = 37353
          Maximo = 360
        end
      end
      object gbxMargemSuperior: TGroupBox
        Left = 875
        Top = 15
        Width = 38
        Height = 35
        Caption = 'SUP.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 12
        object EDTMargemSuperior: TEditNumero
          Left = 2
          Top = 10
          Width = 33
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
          OnChange = EDTMargemSuperiorChange
          OnKeyDown = EDTMargemSuperiorKeyDown
          Mascara = False
          TipoMascara = tmGERAL
          NrDecimal = 2
          Decimais = True
          Negativo = False
          Tamanho = 3
          ValorMaximo = 100.000000000000000000
        end
      end
      object stxMargemSuperior: TStaticText
        Left = 852
        Top = 5
        Width = 44
        Height = 11
        AutoSize = False
        Caption = 'MARGEM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 13
      end
      object gbxMargemEsquerda: TGroupBox
        Left = 835
        Top = 15
        Width = 38
        Height = 35
        Caption = 'ESQ.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 14
        object edtMargemEsquerda: TEditNumero
          Left = 2
          Top = 10
          Width = 33
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
          OnChange = edtMargemEsquerdaChange
          OnKeyDown = edtMargemEsquerdaKeyDown
          Mascara = False
          TipoMascara = tmGERAL
          NrDecimal = 2
          Decimais = True
          Negativo = False
          Tamanho = 3
          ValorMaximo = 100.000000000000000000
        end
      end
    end
    object pnlBottomProdutoDetalhe: TPanel
      Left = 0
      Top = 609
      Width = 1074
      Height = 49
      Align = alBottom
      TabOrder = 3
      object lblOsProdutos: TLabel
        Left = 660
        Top = 26
        Width = 66
        Height = 15
        Caption = 'os produtos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
      end
      object shpNotaSemNumero: TShape
        Left = 477
        Top = 29
        Width = 11
        Height = 11
        Brush.Color = 22015
        Pen.Width = 0
        Visible = False
      end
      object shpNotaDuplicada: TShape
        Left = 477
        Top = 13
        Width = 11
        Height = 11
        Brush.Color = clGreen
        Pen.Width = 0
        Visible = False
      end
      object lblNotaSemNumero: TLabel
        Left = 491
        Top = 28
        Width = 118
        Height = 15
        Caption = 'Nota sem n'#250'mero (0)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object lblNotaDuplicada: TLabel
        Left = 491
        Top = 9
        Width = 83
        Height = 15
        Caption = 'Nota duplicada'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object gbxPlanoPagto: TGroupBox
        Left = 6
        Top = 5
        Width = 464
        Height = 36
        Caption = ' PLANO DE PAGAMENTO '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object sbnProcuraPlano: TSpeedButton
          Left = 53
          Top = 10
          Width = 24
          Height = 24
          Hint = 'Procurar  Planos'
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
          OnClick = sbnProcuraPlanoClick
        end
        object edfPlano: TtecDbEditFind
          Left = 2
          Top = 10
          Width = 49
          Height = 23
          Alignment = taLeftJustify
          DataField = 'codigo'
          DataSource = dtmEmissaoEtiquetas.dsrProcuraPlanos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          Group = 'Plano'
          MaxLength = 3
          Maximo = 0
          Minimo = 37353
          Adicional = 0
          Opcional = True
          ParentFont = False
          TabOrder = 0
          PermitirZero = False
          PermitirNulo = False
          Operacao = opATRIBUICAO
          Parameter = 'Codigo'
          ActiveSetControls = False
          DenyInsert = True
          NoSetControls = <>
          SetControls = <>
        end
        object dtx_Plano: TtecDBText
          Left = 78
          Top = 10
          Width = 383
          Height = 23
          TabStop = False
          Color = clBtnFace
          DataField = 'descricao'
          DataSource = dtmEmissaoEtiquetas.dsrProcuraPlanos
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
      object ckbSelecionarTodos: TCheckBox
        Left = 638
        Top = 12
        Width = 120
        Height = 16
        Caption = 'Selecionar todos '
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        State = cbChecked
        TabOrder = 1
        OnClick = ckbSelecionarTodosClick
      end
    end
    object pnlBodyDetalheProduto: TPanel
      Left = 0
      Top = 469
      Width = 1074
      Height = 140
      Align = alClient
      TabOrder = 4
      object pnlRightDetalheProduto: TPanel
        Left = 1038
        Top = 1
        Width = 35
        Height = 138
        Align = alRight
        TabOrder = 0
        object sbnExcluirProduto: TSpeedButton
          Left = 4
          Top = 41
          Width = 23
          Height = 22
          Hint = 'Excluir item produto'
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
          Left = 4
          Top = 15
          Width = 23
          Height = 24
          Hint = 'Incluir item produto'
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
      end
      object pgcNotasProdutos: TPageControl
        Left = 1
        Top = 1
        Width = 1037
        Height = 138
        ActivePage = TabSheet1
        Align = alClient
        TabHeight = 1
        TabOrder = 1
        TabWidth = 1
        object TabSheet1: TTabSheet
          Caption = 'TabSheet1'
          object dbgEmissaoEtiquetas: TtecDBGrid
            Left = 0
            Top = 0
            Width = 1029
            Height = 127
            Align = alClient
            Color = cl3DLight
            DataSource = dtmEmissaoEtiquetas.dsrEtiquetas
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Pitch = fpVariable
            Font.Style = []
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clBlack
            TitleFont.Height = -13
            TitleFont.Name = 'helvetica'
            TitleFont.Pitch = fpVariable
            TitleFont.Style = []
            OnDblClick = dbgEmissaoEtiquetasDblClick
            OnKeyDown = dbgEmissaoEtiquetasKeyDown
            RowWrap = 60
            Large = False
            DoubleRowColor = True
            MsgDelete = 'o ITEM DE PRODUTO'
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
                Title.Alignment = taCenter
                Title.Caption = 'S'#243' existe porque se OK ficar como coluna '#39'0'#39' da access violation'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 0
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'marcar'
                Title.Alignment = taCenter
                Title.Caption = 'OK'
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
                FieldName = 'codigovisual'
                ReadOnly = True
                Title.Alignment = taCenter
                Title.Caption = 'C'#211'DIGO'
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
                FieldName = 'descricaoproduto'
                ReadOnly = True
                Title.Alignment = taCenter
                Title.Caption = 'DESCRI'#199#195'O DO PRODUTO'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 220
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CodigoBarras'
                Title.Alignment = taCenter
                Title.Caption = 'COD. BARRAS'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 154
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
                Visible = False
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
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'referencia'
                ReadOnly = True
                Title.Alignment = taCenter
                Title.Caption = 'REFER'#202'NCIA'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 90
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'resultadocurvaabc'
                Title.Alignment = taCenter
                Title.Caption = 'ABC'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 22
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'filial'
                ReadOnly = True
                Title.Alignment = taCenter
                Title.Caption = 'FILIAL'
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
                FieldName = 'precoreal'
                Title.Alignment = taCenter
                Title.Caption = 'PRE'#199'O'
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
                FieldName = 'quantidadeproduto'
                Title.Alignment = taCenter
                Title.Caption = 'QTDE'
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
                FieldName = 'entrada'
                Title.Alignment = taCenter
                Title.Caption = 'ENTRADA'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'Arial'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'qtdeparcelas'
                Title.Alignment = taCenter
                Title.Caption = 'NP'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 25
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'valorparcela'
                Title.Alignment = taCenter
                Title.Caption = 'PARCELA'
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
                FieldName = 'totalparcelas'
                Title.Alignment = taCenter
                Title.Caption = 'VALOR TOTAL'
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
                FieldName = 'peso_entrega'
                Title.Caption = 'PESO ENTREGA'
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
        object tstNotaseProdutos: TTabSheet
          Caption = 'tstNotaseProdutos'
          ImageIndex = 1
          object pgcNotasProdutos2: TtecPageControl
            Left = 0
            Top = 0
            Width = 1029
            Height = 127
            ActivePage = tstNotas
            Align = alClient
            TabOrder = 0
            OnChange = pgcNotasProdutos2Change
            object tstNotas: TTabSheet
              Caption = 'Notas'
              object dbgNotasSaidas: TtecDBGrid
                Left = 0
                Top = 0
                Width = 1021
                Height = 96
                Align = alClient
                DataSource = dtmEmissaoEtiquetas.dsrNotasSaidas
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Pitch = fpVariable
                Font.Style = []
                Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
                ParentFont = False
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clBlack
                TitleFont.Height = -13
                TitleFont.Name = 'helvetica'
                TitleFont.Pitch = fpVariable
                TitleFont.Style = []
                OnDrawColumnCell = dbgNotasSaidasDrawColumnCell
                OnDblClick = dbgNotasSaidasDblClick
                OnKeyDown = dbgNotasSaidasKeyDown
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
                DefaultRowHeight = 18
                ExibirNumerodaLinha = False
                NaoAtribuirDadosaTabelaaoDigitar = False
                ShowWhenFieldInvisible = False
                CanClickWhenEditing = False
                Columns = <
                  item
                    Expanded = False
                    Title.Caption = 'S'#243' existe porque se OK ficar como coluna '#39'0'#39' da access violation'
                    Width = 0
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'marcarnotasaida'
                    Title.Alignment = taCenter
                    Title.Caption = 'OK'
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
                    FieldName = 'filial'
                    Title.Alignment = taCenter
                    Title.Caption = 'FILIAL'
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
                    FieldName = 'serie'
                    Title.Alignment = taCenter
                    Title.Caption = 'S'#201'RIE'
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
                    FieldName = 'numero'
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
                    FieldName = 'volumesaux'
                    Title.Caption = 'VOLUMES'
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
                    FieldName = 'data'
                    Title.Alignment = taCenter
                    Title.Caption = 'EMISS'#195'O'
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
                    FieldName = 'nome'
                    Title.Alignment = taCenter
                    Title.Caption = 'NOME DO CLIENTE'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clBlack
                    Title.Font.Height = -9
                    Title.Font.Name = 'helvetica'
                    Title.Font.Pitch = fpVariable
                    Title.Font.Style = []
                    Width = 200
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'att'
                    Title.Alignment = taCenter
                    Title.Caption = 'AOS CUIDADOS (A/C)'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clBlack
                    Title.Font.Height = -9
                    Title.Font.Name = 'helvetica'
                    Title.Font.Pitch = fpVariable
                    Title.Font.Style = []
                    Width = 200
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'observacoes_'
                    Title.Alignment = taCenter
                    Title.Caption = 'OBSERVA'#199#212'ES'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clBlack
                    Title.Font.Height = -9
                    Title.Font.Name = 'helvetica'
                    Title.Font.Pitch = fpVariable
                    Title.Font.Style = []
                    Width = 180
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'nomecidade'
                    Title.Alignment = taCenter
                    Title.Caption = 'CIDADE'
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
                    FieldName = 'rua'
                    Title.Alignment = taCenter
                    Title.Caption = 'RUA'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clBlack
                    Title.Font.Height = -9
                    Title.Font.Name = 'helvetica'
                    Title.Font.Pitch = fpVariable
                    Title.Font.Style = []
                    Width = 110
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'nomebairro'
                    Title.Alignment = taCenter
                    Title.Caption = 'BAIRRO'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clBlack
                    Title.Font.Height = -9
                    Title.Font.Name = 'helvetica'
                    Title.Font.Pitch = fpVariable
                    Title.Font.Style = []
                    Width = 180
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'estado'
                    Title.Alignment = taCenter
                    Title.Caption = 'UF'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clBlack
                    Title.Font.Height = -9
                    Title.Font.Name = 'helvetica'
                    Title.Font.Pitch = fpVariable
                    Title.Font.Style = []
                    Width = 20
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'cep'
                    Title.Alignment = taCenter
                    Title.Caption = 'CEP'
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
            object tstProdutos: TTabSheet
              Caption = 'Produtos'
              ImageIndex = 1
              object dbgProdutosNotas: TtecDBGrid
                Left = 0
                Top = 0
                Width = 1021
                Height = 96
                Align = alClient
                DataSource = dtmEmissaoEtiquetas.dsrEtiquetas
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'Arial'
                Font.Pitch = fpVariable
                Font.Style = []
                Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
                ParentFont = False
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clBlack
                TitleFont.Height = -13
                TitleFont.Name = 'helvetica'
                TitleFont.Pitch = fpVariable
                TitleFont.Style = []
                OnDblClick = dbgEmissaoEtiquetasDblClick
                OnKeyDown = dbgEmissaoEtiquetasKeyDown
                RowWrap = 60
                Large = False
                DoubleRowColor = True
                MsgDelete = 'o ITEM DE PRODUTO'
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
                    Title.Caption = 'S'#243' existe porque se OK ficar como coluna '#39'0'#39' da access violation'
                    Width = 0
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'marcar'
                    Title.Alignment = taCenter
                    Title.Caption = 'OK'
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
                    FieldName = 'codigovisual'
                    ReadOnly = True
                    Title.Alignment = taCenter
                    Title.Caption = 'C'#211'DIGO'
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
                    FieldName = 'descricaoproduto'
                    ReadOnly = True
                    Title.Alignment = taCenter
                    Title.Caption = 'DESCRI'#199#195'O PRODUTO'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clBlack
                    Title.Font.Height = -9
                    Title.Font.Name = 'helvetica'
                    Title.Font.Pitch = fpVariable
                    Title.Font.Style = []
                    Width = 220
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
                    Visible = False
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
                    Visible = False
                  end
                  item
                    Expanded = False
                    FieldName = 'referencia'
                    ReadOnly = True
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
                    FieldName = 'filial'
                    ReadOnly = True
                    Title.Alignment = taCenter
                    Title.Caption = 'FILIAL'
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
                    FieldName = 'preco'
                    Title.Alignment = taCenter
                    Title.Caption = 'PRE'#199'O'
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
                    FieldName = 'quantidadeproduto'
                    Title.Alignment = taCenter
                    Title.Caption = 'QTDE'
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
                    FieldName = 'entrada'
                    Title.Alignment = taCenter
                    Title.Caption = 'ENTRADA'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clBlack
                    Title.Font.Height = -9
                    Title.Font.Name = 'Arial'
                    Title.Font.Pitch = fpVariable
                    Title.Font.Style = []
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'qtdeparcelas'
                    Title.Alignment = taCenter
                    Title.Caption = 'NP'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clBlack
                    Title.Font.Height = -9
                    Title.Font.Name = 'helvetica'
                    Title.Font.Pitch = fpVariable
                    Title.Font.Style = []
                    Width = 25
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'valorparcela'
                    Title.Alignment = taCenter
                    Title.Caption = 'VALOR'
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
                    FieldName = 'totalparcelas'
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
            end
          end
        end
        object tstb2wItems_: TTabSheet
          Caption = 'tstb2wItems_'
          ImageIndex = 2
          object dbgplpb2w_items: TtecDBGrid
            Left = 0
            Top = 0
            Width = 1029
            Height = 127
            Align = alClient
            DataSource = dtmEmissaoEtiquetas.dsrplpb2w_items
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            ReadOnly = True
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
            DefaultRowHeight = 18
            ExibirNumerodaLinha = False
            NaoAtribuirDadosaTabelaaoDigitar = False
            ShowWhenFieldInvisible = False
            CanClickWhenEditing = False
            Columns = <
              item
                Expanded = False
                FieldName = 'codcliente'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'destinatario_nome'
                Width = 350
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'vlentrega'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'codigoawb'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'docexterno'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'pesototal'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'tpentrega'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'dtprometida'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'marca'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'qtvolumes'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'numerocontratotransp'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'nomeembarcador'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'telefoneembarcador'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'emailembarcador'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'tpservico'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'numnotafiscal'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'serienotafiscal'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'megarota'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'rota'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'telefonecontato'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'cartaopostagem'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'servicoadicional'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'destinatario_enderecologradouro'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'destinatario_endereconumero'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'destinatario_enderecocomplemento'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'destinatario_enderecobairro'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'destinatario_enderecocidade'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'destinatario_enderecouf'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'destinatario_enderecocep'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'remetente_nome'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'remetente_enderecologradouro'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'remetente_endereconumero'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'remetente_enderecocomplemento'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'remetente_enderecobairro'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'remetente_enderecocidade'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'remetente_enderecouf'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'remetente_enderecocep'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'posicaovolume'
                Visible = True
              end>
          end
        end
      end
    end
    object stxNrEtiquetas: TStaticText
      Left = 530
      Top = 37
      Width = 68
      Height = 16
      Caption = 'N'#186' ETIQUETAS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object gbxEtiquetaemBranco: TGroupBox
      Left = 526
      Top = 48
      Width = 75
      Height = 36
      Caption = ' EM BRANCO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object edtetiquetaBranco: TEditNumero
        Left = 2
        Top = 10
        Width = 70
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
        Text = '0'
        Mascara = False
        TipoMascara = tmGERAL
        NrDecimal = 0
        Decimais = False
        Negativo = False
        Tamanho = 3
      end
    end
  end
  object aclEmissao: TActionList
    Left = 640
    Top = 16
    object actImprimir: TAction
      Caption = 'Imprimir F7'
      OnExecute = actImprimirExecute
      OnUpdate = actImprimirUpdate
    end
  end
  object dlgModeloEtiquetas: TOpenDialog
    DefaultExt = '*.frf'
    Filter = '*.frf'
    Options = [ofNoChangeDir, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Title = 'Open'
    Left = 736
    Top = 8
  end
  object ecvEmissaoEtiquetas: TtecEditionControlValidation
    EditionControl = <
      item
        Control = ckbQtdeZerada
      end
      item
        Control = gbxEtiquetaProduto
      end
      item
        Control = dtx_Plano
      end
      item
        Control = edfPlano
      end
      item
        Control = edfClientesSaida
      end>
    Left = 600
  end
end
