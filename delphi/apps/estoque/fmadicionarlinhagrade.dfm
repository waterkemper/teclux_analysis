inherited frmAdicionarLinhaGrade: TfrmAdicionarLinhaGrade
  Left = 177
  Top = 74
  ActiveControl = dbgElementosLinhas
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  Caption = 'Adicionar Linha na Grade'
  ClientHeight = 548
  ClientWidth = 1174
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBarra: TPanel
    Left = 0
    Top = 45
    Width = 1174
    Height = 503
    Align = alClient
    Visible = True
    inherited bvlBotoesEd: TBevel
      Left = 443
      Top = 19
    end
    object lblElemento: TLabel
      Left = 781
      Top = 10
      Width = 52
      Height = 16
      Caption = 'Localizar'
    end
    object gbxElementos: TGroupBox
      Left = 1
      Top = 451
      Width = 1172
      Height = 51
      Align = alBottom
      TabOrder = 0
      object shNotaImpressa: TShape
        Left = 8
        Top = 31
        Width = 11
        Height = 11
        Brush.Color = 5283584
        Enabled = False
        Pen.Width = 0
      end
      object lblNotaFiscal: TLabel
        Left = 22
        Top = 29
        Width = 200
        Height = 16
        Caption = 'Presente no Cadastro de Produtos'
      end
      object shIncluirNaNota: TShape
        Left = 9
        Top = 14
        Width = 11
        Height = 11
        Brush.Color = 5220351
        Enabled = False
        Pen.Width = 0
      end
      object lblImprimirNotaFiscal: TLabel
        Left = 23
        Top = 12
        Width = 109
        Height = 16
        Caption = 'Presente nesta NF'
      end
    end
    object pnlTop: TPanel
      Left = 1
      Top = 1
      Width = 1172
      Height = 32
      Align = alTop
      TabOrder = 1
      object StaticText1: TStaticText
        Left = 8
        Top = 8
        Width = 67
        Height = 20
        Caption = 'PRODUTO'
        TabOrder = 0
      end
      object dbtProduto: TtecDBText
        Left = 312
        Top = 4
        Width = 849
        Height = 24
        TabStop = False
        Color = clBtnFace
        DataField = 'descricao'
        DataSource = dtmCadastroNotasFiscais.dsrCaracteristicasNotaFiscal
        ReadOnly = True
        TabOrder = 1
        Alignment = taLeftJustify
      end
      object dbtProdutoVisual: TtecDBText
        Left = 88
        Top = 4
        Width = 219
        Height = 24
        TabStop = False
        Color = clBtnFace
        DataField = 'codigovisual'
        DataSource = dtmCadastroNotasFiscais.dsrCaracteristicasNotaFiscal
        ReadOnly = True
        TabOrder = 2
        Alignment = taLeftJustify
      end
    end
    object pnlLinha: TPanel
      Left = 1
      Top = 33
      Width = 584
      Height = 418
      Align = alLeft
      TabOrder = 2
      object dbgElementosLinhas: TtecDBGrid
        Left = 1
        Top = 81
        Width = 272
        Height = 308
        Align = alLeft
        DataSource = dtmCadastroNotasFiscais.dsrElementosLinhas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -9
        TitleFont.Name = 'helvetica'
        TitleFont.Pitch = fpVariable
        TitleFont.Style = []
        OnDrawColumnCell = dbgElementosLinhasDrawColumnCell
        OnDblClick = dbgElementosLinhasDblClick
        OnKeyDown = dbgElementosLinhasKeyDown
        OnKeyPress = dbgElementosLinhasKeyPress
        RowWrap = 60
        Large = False
        DoubleRowColor = False
        TitleMinHeight = 100
        CellHeights = 100
        StrippedColor = 16054260
        CanDelete = False
        CanNotInsertFromGrid = True
        PostOnEnter = False
        PostOnSetUpDown = False
        DenySort = False
        DefaultRowHeight = 20
        ExibirNumerodaLinha = False
        NaoAtribuirDadosaTabelaaoDigitar = False
        ShowWhenFieldInvisible = False
        CanClickWhenEditing = False
        Columns = <
          item
            Expanded = False
            FieldName = 'valor'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'VALOR LINHA'
            Width = 170
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'abreviatura'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'ABREV.'
            Width = 57
            Visible = True
          end>
      end
      object pnlLinhaTop: TPanel
        Left = 1
        Top = 1
        Width = 582
        Height = 80
        Align = alTop
        TabOrder = 0
        object dbtLinha: TtecDBText
          Left = 6
          Top = 0
          Width = 571
          Height = 24
          TabStop = False
          Color = clBtnFace
          DataField = 'linha'
          DataSource = dtmCadastroNotasFiscais.dsrCaracteristicasNotaFiscal
          ReadOnly = True
          TabOrder = 2
          Alignment = taCenter
        end
        object edfElementoLinha: TEditTexto
          Left = 5
          Top = 30
          Width = 180
          Height = 24
          MaxLength = -1
          TabOrder = 0
          OnChange = edfElementoLinhaChange
          OnKeyDown = edfElementoLinhaKeyDown
          CharCasenoDefault = False
          Alignment = taLeftJustify
        end
        object edtAbreviaturaLinha: TDBEditTexto
          Left = 185
          Top = 30
          Width = 53
          Height = 24
          DataField = 'abreviatura'
          DataSource = dtmCadastroNotasFiscais.dsrcaracteristicaselementosnotaspag_l
          MaxLength = -1
          TabOrder = 1
          OnKeyDown = edtAbreviaturaLinhaKeyDown
          CharCasenoDefault = False
          Alignment = taLeftJustify
        end
        object StaticText2: TStaticText
          Left = 5
          Top = 56
          Width = 236
          Height = 20
          Alignment = taCenter
          AutoSize = False
          BevelKind = bkTile
          Caption = 'Linhas Dispon'#237'veis'
          TabOrder = 3
        end
        object StaticText3: TStaticText
          Left = 312
          Top = 55
          Width = 239
          Height = 20
          Alignment = taCenter
          AutoSize = False
          BevelKind = bkTile
          Caption = 'Linhas Selecionadas'
          TabOrder = 4
        end
      end
      object pnlLinhaBottom: TPanel
        Left = 1
        Top = 389
        Width = 582
        Height = 28
        Align = alBottom
        TabOrder = 4
        object ckbSelecionarTodasLinhasPresenteemProdutos: TCheckBox
          Left = 4
          Top = 6
          Width = 445
          Height = 16
          Caption = 'Adicionar Todas linhas Cadastradas em Produtos'
          TabOrder = 0
          OnClick = ckbSelecionarTodasLinhasPresenteemProdutosClick
        end
      end
      object Panel1: TPanel
        Left = 273
        Top = 81
        Width = 37
        Height = 308
        Align = alLeft
        TabOrder = 2
        object sbn_Excluir_linha_da_grade: TSpeedButton
          Left = 4
          Top = 9
          Width = 29
          Height = 26
          Hint = 'Exclui o elemento linha da grade'
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
          OnClick = sbnExcluirElementoGradeClick
        end
        object sbnLinhaAdiciona: TSpeedButton
          Left = 8
          Top = 88
          Width = 23
          Height = 22
          Glyph.Data = {
            DE000000424DDE0000000000000076000000280000000D0000000D0000000100
            0400000000006800000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8000888888088888800088888800888880008888880608888000880000066088
            8000880666666608800088066666666080008806666666088000880000066088
            8000888888060888800088888800888880008888880888888000888888888888
            8000}
          OnClick = sbnLinhaAdicionaClick
        end
        object sbnLinhaAdicionaTodos: TSpeedButton
          Left = 7
          Top = 112
          Width = 23
          Height = 22
          Glyph.Data = {
            DE000000424DDE0000000000000076000000280000000D0000000D0000000100
            0400000000006800000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8000888808808888800088880080088880008888060060888000000006606608
            8000066666660660800006666666606600000666666606608000000006606608
            8000888806006088800088880080088880008888088088888000888888888888
            8000}
          OnClick = sbnLinhaAdicionaTodosClick
        end
        object sbnLinhaRemove: TSpeedButton
          Left = 6
          Top = 160
          Width = 23
          Height = 22
          Glyph.Data = {
            DE000000424DDE0000000000000076000000280000000D0000000D0000000100
            0400000000006800000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8000888888088888800088888008888880008888060888888000888066000008
            8000880666666608800080666666660880008806666666088000888066000008
            8000888806088888800088888008888880008888880888888000888888888888
            8000}
          OnClick = sbnLinhaRemoveClick
        end
        object sbnLinhaRemoveTodos: TSpeedButton
          Left = 6
          Top = 184
          Width = 23
          Height = 22
          Glyph.Data = {
            DE000000424DDE0000000000000076000000280000000D0000000D0000000100
            0400000000006800000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8000888880880888800088880080088880008880600608888000880660660000
            0000806606666666000006606666666600008066066666660000880660660000
            0000888060060888800088880080088880008888808808888000888888888888
            8000}
          OnClick = sbnLinhaRemoveTodosClick
        end
      end
      object dbgcaracteristicaselementosnotaspag_linhas: TtecDBGrid
        Left = 310
        Top = 81
        Width = 272
        Height = 308
        Align = alLeft
        DataSource = dtmCadastroNotasFiscais.dsrcaracteristicaselementosnotaspag_l
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 3
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -9
        TitleFont.Name = 'helvetica'
        TitleFont.Pitch = fpVariable
        TitleFont.Style = []
        OnDrawColumnCell = dbgcaracteristicaselementosnotaspag_linhasDrawColumnCell
        OnDblClick = dbgcaracteristicaselementosnotaspag_linhasDblClick
        OnKeyDown = dbgcaracteristicaselementosnotaspag_linhasKeyDown
        OnKeyPress = dbgcaracteristicaselementosnotaspag_linhasKeyPress
        RowWrap = 60
        Large = False
        DoubleRowColor = False
        TitleMinHeight = 100
        CellHeights = 100
        StrippedColor = 16054260
        CanDelete = False
        CanNotInsertFromGrid = True
        PostOnEnter = False
        PostOnSetUpDown = False
        DenySort = False
        DefaultRowHeight = 20
        ExibirNumerodaLinha = False
        NaoAtribuirDadosaTabelaaoDigitar = False
        ShowWhenFieldInvisible = False
        CanClickWhenEditing = False
        Columns = <
          item
            Expanded = False
            FieldName = 'valor'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'VALOR LINHA'
            Width = 170
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'abreviatura'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'ABREV.'
            Width = 57
            Visible = True
          end>
      end
    end
    object Panel2: TPanel
      Left = 585
      Top = 33
      Width = 584
      Height = 418
      Align = alLeft
      TabOrder = 3
      object dbgElementosColunas: TtecDBGrid
        Left = 1
        Top = 81
        Width = 272
        Height = 307
        Align = alLeft
        Constraints.MaxWidth = 313
        DataSource = dtmCadastroNotasFiscais.dsrElementosColunas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -9
        TitleFont.Name = 'helvetica'
        TitleFont.Pitch = fpVariable
        TitleFont.Style = []
        OnDrawColumnCell = dbgElementosColunasDrawColumnCell
        OnDblClick = dbgElementosColunasDblClick
        OnKeyDown = dbgElementosColunasKeyDown
        OnKeyPress = dbgElementosLinhasKeyPress
        RowWrap = 60
        Large = False
        DoubleRowColor = False
        TitleMinHeight = 100
        CellHeights = 100
        StrippedColor = 16054260
        CanDelete = False
        CanNotInsertFromGrid = True
        PostOnEnter = False
        PostOnSetUpDown = False
        DenySort = False
        DefaultRowHeight = 20
        ExibirNumerodaLinha = False
        NaoAtribuirDadosaTabelaaoDigitar = False
        ShowWhenFieldInvisible = False
        CanClickWhenEditing = False
        Columns = <
          item
            Expanded = False
            FieldName = 'valor'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'VALOR LINHA'
            Width = 170
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'abreviatura'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'ABREV.'
            Width = 57
            Visible = True
          end>
      end
      object pnlColunaTop: TPanel
        Left = 1
        Top = 1
        Width = 582
        Height = 80
        Align = alTop
        TabOrder = 0
        object dbtColuna: TtecDBText
          Left = 6
          Top = 0
          Width = 571
          Height = 24
          TabStop = False
          Color = clBtnFace
          DataField = 'coluna'
          DataSource = dtmCadastroNotasFiscais.dsrCaracteristicasNotaFiscal
          ReadOnly = True
          TabOrder = 2
          Alignment = taCenter
        end
        object edfElementoColuna: TEditTexto
          Left = 5
          Top = 30
          Width = 180
          Height = 24
          MaxLength = -1
          TabOrder = 0
          OnChange = edfElementoColunaChange
          OnKeyDown = edfElementoColunaKeyDown
          CharCasenoDefault = False
          Alignment = taLeftJustify
        end
        object edtAbreviaturaColuna: TDBEditTexto
          Left = 185
          Top = 30
          Width = 53
          Height = 24
          DataField = 'abreviatura'
          DataSource = dtmCadastroNotasFiscais.dsrcaracteristicaselementosnotaspag_c
          MaxLength = -1
          TabOrder = 1
          OnKeyDown = edtAbreviaturaColunaKeyDown
          CharCasenoDefault = False
          Alignment = taLeftJustify
        end
        object StaticText4: TStaticText
          Left = 5
          Top = 56
          Width = 236
          Height = 20
          Alignment = taCenter
          AutoSize = False
          BevelKind = bkTile
          Caption = 'Colunas Dispon'#237'veis'
          TabOrder = 3
        end
        object StaticText5: TStaticText
          Left = 269
          Top = 55
          Width = 239
          Height = 20
          Alignment = taCenter
          AutoSize = False
          BevelKind = bkTile
          Caption = 'Colunas Selecionadas'
          TabOrder = 4
        end
      end
      object Panel4: TPanel
        Left = 1
        Top = 388
        Width = 582
        Height = 29
        Align = alBottom
        TabOrder = 4
        object ckbSelecionarTodasColunaPresenteemProdutos: TCheckBox
          Left = 4
          Top = 6
          Width = 485
          Height = 16
          Caption = 'Adicionar Todas colunas Cadastradas em Produtos'
          TabOrder = 0
          OnClick = ckbSelecionarTodasColunaPresenteemProdutosClick
        end
      end
      object Panel5: TPanel
        Left = 273
        Top = 81
        Width = 37
        Height = 307
        Align = alLeft
        TabOrder = 2
        object sbn_Excluir_coluna_da_grade: TSpeedButton
          Left = 4
          Top = 9
          Width = 29
          Height = 26
          Hint = 'Exclui o elemento linha da grade'
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
          OnClick = sbnExcluirElementoGradeClick
        end
        object sbnColunaAdiciona: TSpeedButton
          Left = 8
          Top = 88
          Width = 23
          Height = 22
          Glyph.Data = {
            DE000000424DDE0000000000000076000000280000000D0000000D0000000100
            0400000000006800000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8000888888088888800088888800888880008888880608888000880000066088
            8000880666666608800088066666666080008806666666088000880000066088
            8000888888060888800088888800888880008888880888888000888888888888
            8000}
          OnClick = sbnColunaAdicionaClick
        end
        object sbnColunaAdicionaTodos: TSpeedButton
          Left = 7
          Top = 112
          Width = 23
          Height = 22
          Glyph.Data = {
            DE000000424DDE0000000000000076000000280000000D0000000D0000000100
            0400000000006800000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8000888808808888800088880080088880008888060060888000000006606608
            8000066666660660800006666666606600000666666606608000000006606608
            8000888806006088800088880080088880008888088088888000888888888888
            8000}
          OnClick = sbnColunaAdicionaTodosClick
        end
        object sbnColunaRemove: TSpeedButton
          Left = 6
          Top = 160
          Width = 23
          Height = 22
          Glyph.Data = {
            DE000000424DDE0000000000000076000000280000000D0000000D0000000100
            0400000000006800000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8000888888088888800088888008888880008888060888888000888066000008
            8000880666666608800080666666660880008806666666088000888066000008
            8000888806088888800088888008888880008888880888888000888888888888
            8000}
          OnClick = sbnColunaRemoveClick
        end
        object sbnColunaRemoveTodos: TSpeedButton
          Left = 6
          Top = 184
          Width = 23
          Height = 22
          Glyph.Data = {
            DE000000424DDE0000000000000076000000280000000D0000000D0000000100
            0400000000006800000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8000888880880888800088880080088880008880600608888000880660660000
            0000806606666666000006606666666600008066066666660000880660660000
            0000888060060888800088880080088880008888808808888000888888888888
            8000}
          OnClick = sbnColunaRemoveTodosClick
        end
      end
      object dbgcaracteristicaselementosnotaspag_colunas: TtecDBGrid
        Left = 310
        Top = 81
        Width = 267
        Height = 307
        Align = alLeft
        Constraints.MaxWidth = 313
        DataSource = dtmCadastroNotasFiscais.dsrcaracteristicaselementosnotaspag_c
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 3
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -9
        TitleFont.Name = 'helvetica'
        TitleFont.Pitch = fpVariable
        TitleFont.Style = []
        OnDrawColumnCell = dbgcaracteristicaselementosnotaspag_colunasDrawColumnCell
        OnDblClick = dbgcaracteristicaselementosnotaspag_colunasDblClick
        OnKeyDown = dbgcaracteristicaselementosnotaspag_colunasKeyDown
        OnKeyPress = dbgcaracteristicaselementosnotaspag_colunasKeyPress
        RowWrap = 60
        Large = False
        DoubleRowColor = False
        TitleMinHeight = 100
        CellHeights = 100
        StrippedColor = 16054260
        CanDelete = False
        CanNotInsertFromGrid = True
        PostOnEnter = False
        PostOnSetUpDown = False
        DenySort = False
        DefaultRowHeight = 20
        ExibirNumerodaLinha = False
        NaoAtribuirDadosaTabelaaoDigitar = False
        ShowWhenFieldInvisible = False
        CanClickWhenEditing = False
        Columns = <
          item
            Expanded = False
            FieldName = 'valor'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'VALOR LINHA'
            Width = 170
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'abreviatura'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'ABREV.'
            Width = 57
            Visible = True
          end>
      end
    end
  end
  inherited pnlTopMenu: TPanel
    Width = 1174
    inherited tblBarra: TToolBar
      Left = 212
      Width = 962
      inherited sbnProcurar: TSpeedButton
        Width = 73
        Visible = False
      end
      inherited sbnAjuda: TSpeedButton
        Left = 73
      end
      inherited tbnDivisor: TToolButton
        Left = 74
      end
    end
    inherited tblBarraCadastro: TToolBar
      Width = 212
      inherited sbnIncluir: TSpeedButton
        Width = 77
        Visible = False
      end
      inherited sbnSalvar: TSpeedButton
        Left = 77
      end
      inherited sbnExcluir: TSpeedButton
        Left = 152
        Width = 60
        Visible = False
      end
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 352
    Top = 8
  end
end
