inherited frmCancelamentoContratosAberto: TfrmCancelamentoContratosAberto
  Left = 91
  Top = 169
  ActiveControl = edfFilial
  Caption = 'Exclus'#227'o de Contratos Or'#231'ados'
  ClientHeight = 478
  ClientWidth = 729
  Color = clBtnFace
  FormStyle = fsMDIChild
  PixelsPerInch = 92
  inherited pnlBarra: TPanel
    Width = 729
    inherited bvlBotoesEd: TBevel
      Left = 138
    end
  end
  inherited tblBarra: TToolBar
    Width = 729
    TabOrder = 2
    inherited sbnProcurar: TSpeedButton
      Left = 237
      Visible = False
    end
    inherited sbnAjuda: TSpeedButton
      Left = 162
    end
    object sbnGerar: TSpeedButton [2]
      Left = 4
      Top = 5
      Width = 75
      Height = 35
      Hint = 'Seleciona os contratos em aberto'
      Caption = 'Gerar F7'
      Flat = True
      Glyph.Data = {
        E2030000424DDE03000000000000360000002800000011000000120000000100
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
      Spacing = 0
      OnClick = sbnGerarClick
    end
    object sbnCancelar: TSpeedButton [3]
      Left = 79
      Top = 5
      Width = 75
      Height = 35
      Hint = 'Cancelar Contratos Aberto'
      Caption = 'Cancelar F8'
      Flat = True
      Glyph.Data = {
        7A010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
        555557777F777555F55500000000555055557777777755F75555005500055055
        555577F5777F57555555005550055555555577FF577F5FF55555500550050055
        5555577FF77577FF555555005050110555555577F757777FF555555505099910
        555555FF75777777FF555005550999910555577F5F77777775F5500505509990
        3055577F75F77777575F55005055090B030555775755777575755555555550B0
        B03055555F555757575755550555550B0B335555755555757555555555555550
        BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
        50BB555555555555575F555555555555550B5555555555555575}
      Layout = blGlyphTop
      NumGlyphs = 2
      Spacing = 0
      OnClick = sbnCancelarClick
    end
    inherited tbnDivisor: TToolButton
      Left = 154
    end
  end
  object pnlFundoJanela: TPanel
    Left = 0
    Top = 44
    Width = 729
    Height = 434
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 3
    TabOrder = 1
    object gbxFilial: TGroupBox
      Left = 3
      Top = 0
      Width = 360
      Height = 50
      Caption = 'Filial'
      TabOrder = 0
      object sbnProcuraFilial: TSpeedButton
        Left = 75
        Top = 19
        Width = 23
        Height = 23
        Hint = 'Procurar Filial'
        Flat = True
        Glyph.Data = {
          3A060000424D3606000000000000360000002800000020000000100000000100
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
        OnClick = sbnProcuraFilialClick
      end
      object edfFilial: TtecDbEditFind
        Left = 14
        Top = 19
        Width = 60
        Height = 23
        DataSource = dtmCancelamentoContratosAberto.dsrFiliais
        Group = 'Filial'
        MaxLength = 6
        TabOrder = 0
        Parameter = 'codigo'
        ActiveSetControls = False
        DenyInsert = True
        NoSetControls = <
          item
          end
          item
          end
          item
          end
          item
          end
          item
          end
          item
          end
          item
          end>
        SetControls = <>
      end
      object dtxDescricaoFilial: TtecDBText
        Left = 99
        Top = 19
        Width = 245
        Height = 23
        DataSource = dtmCancelamentoContratosAberto.dsrFiliais
        BorderStyle = bsSingle
      end
    end
    object gbxContratos: TGroupBox
      Left = 399
      Top = 0
      Width = 135
      Height = 78
      Caption = 'Contratos'
      TabOrder = 1
      object lblQtdeContratos: TLabel
        Left = 35
        Top = 21
        Width = 27
        Height = 15
        Alignment = taRightJustify
        Caption = 'Total'
      end
      object lblQtdeMarcados: TLabel
        Left = 6
        Top = 48
        Width = 56
        Height = 15
        Alignment = taRightJustify
        Caption = 'Marcados'
      end
      object edtQtdeContratos: TEditNumero
        Left = 66
        Top = 17
        Width = 60
        Height = 23
        TabStop = False
        Alignment = taRightJustify
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 2
        Mascara = False
        NrDecimal = 2
        Decimais = False
        Negativo = False
        Tamanho = 6
      end
      object edtQtdeMarcados: TEditNumero
        Left = 66
        Top = 44
        Width = 60
        Height = 23
        TabStop = False
        Alignment = taRightJustify
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 3
        Mascara = False
        NrDecimal = 2
        Decimais = False
        Negativo = False
        Tamanho = 6
      end
    end
    object gbxValores: TGroupBox
      Left = 539
      Top = 0
      Width = 185
      Height = 78
      Caption = 'Valores'
      TabOrder = 2
      object lblTotalContratos: TLabel
        Left = 34
        Top = 19
        Width = 27
        Height = 15
        Alignment = taRightJustify
        Caption = 'Total'
      end
      object lblTotalMarcados: TLabel
        Left = 5
        Top = 46
        Width = 56
        Height = 15
        Alignment = taRightJustify
        Caption = 'Marcados'
      end
      object edtTotalContratos: TEditNumero
        Left = 65
        Top = 15
        Width = 110
        Height = 23
        TabStop = False
        Alignment = taRightJustify
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 2
        Mascara = True
        NrDecimal = 2
        Decimais = True
        Negativo = False
        Tamanho = 9
      end
      object edtTotalMarcados: TEditNumero
        Left = 65
        Top = 42
        Width = 110
        Height = 23
        TabStop = False
        Alignment = taRightJustify
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 3
        Mascara = True
        NrDecimal = 2
        Decimais = True
        Negativo = False
        Tamanho = 9
      end
    end
    object gbxVendedor: TGroupBox
      Left = 3
      Top = 52
      Width = 360
      Height = 50
      Caption = 'Vendedor'
      TabOrder = 3
      object sbnVendedor: TSpeedButton
        Left = 75
        Top = 18
        Width = 23
        Height = 23
        Hint = 'Procurar Vendedor'
        Flat = True
        Glyph.Data = {
          3A060000424D3606000000000000360000002800000020000000100000000100
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
        OnClick = sbnVendedorClick
      end
      object edfVendedor: TtecDbEditFind
        Left = 14
        Top = 18
        Width = 60
        Height = 23
        DataSource = dtmCancelamentoContratosAberto.dsrVendedores
        Group = 'Vendedor'
        MaxLength = 6
        TabOrder = 0
        Parameter = 'codigo'
        ActiveSetControls = False
        DenyInsert = True
        NoSetControls = <>
        SetControls = <>
      end
      object dtxDescricaoVendedor: TtecDBText
        Left = 99
        Top = 18
        Width = 245
        Height = 23
        DataSource = dtmCancelamentoContratosAberto.dsrVendedores
        BorderStyle = bsSingle
      end
    end
    object gbxOrcados: TGroupBox
      Left = 3
      Top = 157
      Width = 723
      Height = 274
      Align = alBottom
      TabOrder = 4
      object dbgCancelamentoContratos: TtecDBGrid
        Left = 6
        Top = 8
        Width = 712
        Height = 260
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Color = clBlack
        TitleFont.Height = 13
        TitleFont.Name = 'helvetica'
        TitleFont.Pitch = fpVariable
        TitleFont.Style = []
        OnDrawColumnCell = dbgCancelamentoContratosDrawColumnCell
        OnDblClick = dbgCancelamentoContratosDblClick
        OnKeyDown = dbgCancelamentoContratosKeyDown
        RowWrap = 60
        DoubleRowColor = False
        Columns = <
          item
            Expanded = False
            FieldName = 'numero'
            Title.Alignment = taCenter
            Title.Caption = 'N'#250'mero'
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'data'
            Title.Alignment = taCenter
            Title.Caption = 'Data'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cliente'
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'digo'
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nome'
            Title.Alignment = taCenter
            Title.Caption = 'Nome Cliente'
            Width = 220
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'vendedor'
            Title.Alignment = taCenter
            Title.Caption = 'Vendedor'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'valorprazo'
            Title.Alignment = taCenter
            Title.Caption = 'Valor'
            Width = 100
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'selecionar'
            Title.Alignment = taCenter
            Title.Caption = 'Sel.'
            Width = 30
            Visible = True
          end>
      end
    end
    object ckbSelecionarTodos: TCheckBox
      Left = 446
      Top = 124
      Width = 203
      Height = 17
      Caption = 'Selecionar Todos os Contratos'
      TabOrder = 6
      OnClick = ckbSelecionarTodosClick
    end
    object pnlDatas: TPanel
      Left = 2
      Top = 102
      Width = 367
      Height = 51
      BevelOuter = bvNone
      TabOrder = 5
      object gbxDataEmissao: TGroupBox
        Left = 1
        Top = 0
        Width = 150
        Height = 51
        Caption = 'Data emiss'#227'o'
        TabOrder = 0
        object lblDataEmissao: TLabel
          Left = 28
          Top = 23
          Width = 17
          Height = 15
          Alignment = taRightJustify
          Caption = 'at'#233
        end
        object edtDataEmissao: TEditData
          Left = 48
          Top = 19
          Width = 75
          Height = 23
          MaxLength = 10
          TabOrder = 1
          Minimo = 37353
          Maximo = 0
        end
      end
      object gbxDataFinanceira: TGroupBox
        Left = 211
        Top = 0
        Width = 150
        Height = 51
        Caption = 'Data financeira'
        TabOrder = 1
        object lblDataFinanceira: TLabel
          Left = 28
          Top = 23
          Width = 17
          Height = 15
          Alignment = taRightJustify
          Caption = 'at'#233
        end
        object edtDataFinenceira: TEditData
          Left = 48
          Top = 19
          Width = 75
          Height = 23
          MaxLength = 10
          TabOrder = 1
          Minimo = 37353
          Maximo = 0
        end
      end
    end
  end
end
