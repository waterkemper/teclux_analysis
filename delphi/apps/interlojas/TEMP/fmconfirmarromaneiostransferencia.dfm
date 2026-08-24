inherited frmConfirmarromaneiosTransferencia: TfrmConfirmarromaneiosTransferencia
  Left = 274
  Top = 129
  Action = actHabilitarBotoes
  ActiveControl = dbgromaneios
  Caption = 'Confirma'#231#227'o de romaneios de Transfer'#234'ncia'
  ClientHeight = 611
  ClientWidth = 1022
  FormStyle = fsMDIChild
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBarra: TPanel
    Left = 192
    Top = 2
  end
  inherited pnlTopMenu: TPanel
    Width = 1022
    inherited tblBarra: TToolBar
      Width = 1021
      inherited sbnProcurar: TSpeedButton
        Visible = False
      end
      object sbnGerar: TSpeedButton
        Left = 84
        Top = 2
        Width = 75
        Height = 39
        Hint = 'Gerar consulta das romaneios Transfer'#234'ncias'
        Caption = 'Gerar F6'
        Flat = True
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
        Spacing = 0
        OnClick = sbnGerarClick
      end
      object sbnConfirmar: TSpeedButton
        Left = 159
        Top = 2
        Width = 75
        Height = 39
        Hint = 'Confirmar Nota de Transfer'#234'ncia'
        Caption = 'Confirmar F5'
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
        OnClick = sbnConfirmarClick
      end
    end
  end
  object pnlFundoJanela: TPanel
    Left = 0
    Top = 45
    Width = 1022
    Height = 566
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 3
    TabOrder = 2
    object gbxConfirmarTransferencia: TGroupBox
      Left = 3
      Top = 3
      Width = 1016
      Height = 560
      Align = alClient
      TabOrder = 0
      object pgcromaneios: TtecPageControl
        Left = 2
        Top = 114
        Width = 1012
        Height = 444
        ActivePage = tstromaneios
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object tstromaneios: TTabSheet
          BorderWidth = 2
          Caption = ' No&tas'
          object dbgromaneios: TtecDBGrid
            Left = 0
            Top = 13
            Width = 1000
            Height = 397
            Align = alClient
            DataSource = dtmConfirmarromaneiosTransferencia.dsrromaneiosTransferencias
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
            OnDrawColumnCell = dbgromaneiosDrawColumnCell
            OnDblClick = dbgromaneiosDblClick
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
            DefaultRowHeight = 19
            ExibirNumerodaLinha = False
            NaoAtribuirDadosaTabelaaoDigitar = False
            ShowWhenFieldInvisible = False
            CanClickWhenEditing = False
            Columns = <
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'filialemissao'
                Title.Alignment = taCenter
                Title.Caption = 'C'#211'DIGO'
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
                FieldName = 'nome'
                Title.Alignment = taCenter
                Title.Caption = 'NOME DA FILIAL'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 215
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
                Width = 33
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'numero'
                Title.Alignment = taCenter
                Title.Caption = 'N'#218'MERO'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 76
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'chv_nfe'
                Title.Alignment = taCenter
                Title.Caption = 'CHAVE NFE'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 303
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
                Width = 75
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'valortotal'
                Title.Alignment = taCenter
                Title.Caption = 'VALOR'
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
                Alignment = taCenter
                Expanded = False
                FieldName = 'selecionar'
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
              end>
          end
          object pnlTopromaneios: TPanel
            Left = 0
            Top = 0
            Width = 1000
            Height = 13
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 1
            object gbxRequisitada: TGroupBox
              Left = 15
              Top = 1
              Width = 258
              Height = 14
              Caption = 'FILIAL REQUISITADA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object gbxNotaFiscal: TGroupBox
              Left = 269
              Top = 1
              Width = 594
              Height = 14
              Caption = 'NOTA FISCAL'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
          end
        end
        object tstProdutos: TTabSheet
          BorderWidth = 2
          Caption = ' Pro&dutos'
          ImageIndex = 1
          object dbgProdutos: TtecDBGrid
            Left = 0
            Top = 0
            Width = 976
            Height = 410
            Align = alClient
            DataSource = dtmConfirmarromaneiosTransferencia.dsrProdutosromaneios
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Pitch = fpVariable
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clBlack
            TitleFont.Height = -12
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
            DefaultRowHeight = 17
            ExibirNumerodaLinha = False
            NaoAtribuirDadosaTabelaaoDigitar = False
            ShowWhenFieldInvisible = False
            CanClickWhenEditing = False
            Columns = <
              item
                Expanded = False
                FieldName = 'numero'
                Title.Alignment = taCenter
                Title.Caption = 'N'#218'MERO'
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
                FieldName = 'produto'
                Title.Alignment = taCenter
                Title.Caption = 'PRODUTO'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 130
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'descricao'
                Title.Alignment = taCenter
                Title.Caption = 'DESCRI'#199#195'O'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 330
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'valorgrade1'
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
                FieldName = 'quantidade'
                Title.Alignment = taCenter
                Title.Caption = 'QUANTIDADE'
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
                FieldName = 'precovenda'
                Title.Alignment = taCenter
                Title.Caption = 'PRE'#199'O'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 100
                Visible = True
              end>
          end
          object pnlProdutos: TPanel
            Left = 976
            Top = 0
            Width = 24
            Height = 410
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 1
            object sbnConferir: TSpeedButton
              Left = 0
              Top = 21
              Width = 24
              Height = 24
              Hint = 'Conferir as quantidades dos produtos'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              Glyph.Data = {
                AE060000424DAE06000000000000360000002800000017000000170000000100
                1800000000007806000000000000000000000000000000000000A5A5A5040404
                1313131313131313131313131313131313131313131313131313131313131313
                13131313131313131313131313131313131313131313131313080808A8A8A800
                00001C1C1CD0D0D0ADADADAFAFAFAFAFAFAFAFAFAFAFAFB0B0B0B0B0B0AFAFAF
                AFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFB1B1
                B1ABABAB080808000000373737F5F5F5BFBFBFC2C2C2C2C2C2C3C3C3C2C2C2BF
                BFBFC2C2C2C4C4C4C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2
                C2C2C2C2C2C2C6C6C6B1B1B1141414000000353535F0F0F0BBBBBBBFBFBFBFBF
                BFCBC0CB958B95767376868686BEBEBEC0C0C0BFBFBFBFBFBFBFBFBFBFBFBFBF
                BFBFBFBFBFBFBFBFBFBFBFBFBFBFC2C2C2AFAFAF141414000000353535F0F0F0
                BBBBBBC1BEC1E1C9E1248824147A147F7F7F807B80848484C7C7C7C0C0C0BFBF
                BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFC2C2C2AFAFAF14141400
                0000353535F0F0F0BFBABFC4CBC41C931C007900007E00007F007C7F7C817B81
                828282BFBFBFC0C0C0BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFC2C2
                C2AFAFAF141414000000353535F2F0F2BCBEBC23DD23008D00007C00007F0000
                7F00077F07767F76807B80878787C0C0C0C0C0C0BFBFBFBFBFBFBFBFBFBFBFBF
                BFBFBFBFBFBFC2C2C2AFAFAF141414000000353535F3EFF3B3C4B300D4000073
                00007F00007F00007F00007F00007F00847F84807B80828282C4C4C4BFBFBFBF
                BFBFBFBFBFBFBFBFBFBFBFBFBFBFC2C2C2AFAFAF141414000000353535F3EFF3
                B5C4B500D500007500007F00007F00007F00007F00007F00007F00767F767F7A
                7F8F8F8FC6C6C6BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFC2C2C2AFAFAF14141400
                0000353535F3EFF3B5C4B500D500007500007F00007F00007500007400007D00
                007F00067F06757E75838183B6B6B6C1C1C1BFBFBFBFBFBFBFBFBFBFBFBFC2C2
                C2AFAFAF141414000000353535F3EFF3B3C4B300D400007300007F0000750011
                E71100E900007800007D00007F00587F58887D88757575C1C1C1BFBFBFBFBFBF
                BFBFBFBFBFBFC2C2C2AFAFAF141414000000353535F2F0F2BDBEBD28DE280087
                00007200007D007D737D1EE91E00E500007000007E00007F005E7F5E847A84A3
                A3A3C6C6C6BFBFBFBFBFBFBFBFBFC2C2C2AFAFAF141414000000353535F0F0F0
                BFBABFC7C1C724E92400D8000070006E766E9D8D9D30FF3000DD00007000007D
                00007F005E7E5E7F7A7FA4A4A4C5C5C5BFBFBFBFBFBFC2C2C2AFAFAF14141400
                0000353535F0F0F0BBBBBBC1BEC1E1B5E122FF2200DF007D8E7DA7A0A7E3B7E3
                2AFB2A00E300007800007D00337F338A7E8A7776779F9F9FC2C2C2BFBFBFC2C2
                C2AFAFAF141414000000353535F0F0F0BBBBBBBFBFBFC1BEC1BEBFBE6FDF6FBC
                C7BCC3C1C3C0BEC0C8BBC82DFA2D00E300006900007D00377F378E7E8E757575
                CCCCCCBFBFBFC2C2C2AFAFAF141414000000353535F0F0F0BBBBBBBFBFBFBFBF
                BFC1BEC1C7BCC7C0BEC0BFBFBFBFBFBFC2BDC2D1B8D131F83100E10000770000
                7D003F7E3F857C858E8E8EC0C0C0C3C3C3AFAFAF141414000000353535F0F0F0
                BBBBBBBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFC0BEC0D5B7
                D52BFB2B00E200007200197E19807E80797779A7A7A7C6C6C6AFAFAF14141400
                0000353535F0F0F0BBBBBBBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
                BFBFBFBFBFBFC1BEC1C7BCC728FC2800DD00006D000A7D0A917D91818181C1C1
                C1B0B0B0141414000000353535F0F0F0BBBBBBBFBFBFBFBFBFBFBFBFBFBFBFBF
                BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFC1BEC1DFB3DF2DFA2D00E400007800
                1A7D1A857685C0C0C0B0B0B0141414000000353535F0F0F0BBBBBBBFBFBFBFBF
                BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFC0BEC0C9
                BBC92DF92D00E400036B03587358C3BFC3B0B0B0141414000000363636EFEFEF
                B8B8B8BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB
                BBBBBBBBBBBBBBBEBABECAB6CA2AF62A00CF00719A71C7C1C7ADADAD14141400
                0000292929FFFFFFEFEFEFF0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
                F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F2F0F2FFEBFFFFEFFFF9F4F9F6F6
                F6D0D0D004040400000080808029292935353535353535353535353535353535
                3535353535353535353535353535353535353535353535353535353535353535
                3535353535353737371B1B1BA5A5A5000000}
              ParentFont = False
              OnClick = sbnConferirClick
            end
          end
        end
      end
      object pnlTop: TPanel
        Left = 2
        Top = 18
        Width = 1012
        Height = 96
        Align = alTop
        TabOrder = 1
        object gbxRequisitante: TGroupBox
          Left = 10
          Top = 4
          Width = 360
          Height = 35
          Caption = 'REQUISITANTE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object edtFilialOrigem: TEdit
            Left = 2
            Top = 10
            Width = 33
            Height = 23
            TabStop = False
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
          object edtDescricaoFilialOrigem: TEdit
            Left = 35
            Top = 10
            Width = 322
            Height = 23
            TabStop = False
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
          end
        end
        object gbxPeriodoRequisicao: TGroupBox
          Left = 377
          Top = 4
          Width = 170
          Height = 36
          Caption = 'PER'#205'ODO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          object lblA: TLabel
            Left = 81
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
          object edtDataInicial: TEditData
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
            ParentFont = False
            TabOrder = 1
            OnExit = edtDataInicialExit
            Minimo = 37353
            Maximo = 0
          end
          object edtDataFinal: TEditData
            Left = 92
            Top = 10
            Width = 75
            Height = 23
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnEnter = edtDataFinalEnter
            Minimo = 37353
            Maximo = 0
          end
        end
        object gbxPesquisaNFe: TGroupBox
          Left = 9
          Top = 50
          Width = 361
          Height = 41
          Caption = 'Localizar CHAVE NFE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          object edtNFE: TMaskEdit
            Left = 4
            Top = 15
            Width = 354
            Height = 23
            EditMask = '99\-9999\-99999999999999\-99\-999\-999999999\-9\-99999999\-9;1;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'HELVETICA'
            Font.Pitch = fpVariable
            Font.Style = []
            MaxLength = 52
            ParentFont = False
            TabOrder = 0
            Text = '  -    -              -  -   -         - -        - '
            OnKeyDown = edtNFEKeyDown
          end
        end
        object gbxPesquisaNumeroFe: TGroupBox
          Left = 378
          Top = 50
          Width = 229
          Height = 41
          Caption = 'Localizar N'#218'MERO NF'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          object StaticText1: TStaticText
            Left = 8
            Top = 19
            Width = 32
            Height = 16
            Caption = 'FILIAL'
            TabOrder = 0
          end
          object StaticText2: TStaticText
            Left = 88
            Top = 20
            Width = 44
            Height = 16
            Caption = 'N'#218'MERO'
            TabOrder = 1
          end
          object edtFilial: TMaskEdit
            Left = 44
            Top = 15
            Width = 37
            Height = 23
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'HELVETICA'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
          object edtNumero: TMaskEdit
            Left = 135
            Top = 15
            Width = 90
            Height = 23
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'HELVETICA'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            OnKeyDown = edtNumeroKeyDown
          end
        end
      end
    end
  end
  object ecvValida: TtecEditionControlValidation
    EditionControl = <
      item
        Control = edtDataFinal
      end
      item
        Control = edtDataInicial
      end>
    Left = 482
    Top = 8
  end
  object aclHabilitar: TActionList
    Left = 520
    Top = 8
    object actHabilitarBotoes: TAction
      Caption = 'actHabilitarBotoes'
      OnUpdate = actHabilitarBotoesUpdate
    end
  end
end
