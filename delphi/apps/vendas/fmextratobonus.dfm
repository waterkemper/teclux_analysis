inherited frmExtratoBonus: TfrmExtratoBonus
  Left = 258
  Top = 168
  ActiveControl = edfCodigoCliente
  Caption = 'Extrato de B'#244'nus'
  ClientHeight = 389
  ClientWidth = 686
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlTopMenu: TPanel
    Width = 686
    inherited tblBarra: TToolBar
      Width = 685
      inherited sbnProcurar: TSpeedButton
        Visible = False
      end
      inherited sbnAjuda: TSpeedButton
        Action = actHabilitarBotoes
      end
      object sbnResgatar: TSpeedButton
        Left = 158
        Top = 2
        Width = 75
        Height = 35
        Hint = 'Adicionar os produtos selecionados ao contrato'
        Caption = 'Resgatar F5'
        Flat = True
        Glyph.Data = {
          E6000000424DE60000000000000076000000280000000F0000000E0000000100
          04000000000070000000120B0000120B00001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888707888
          88808870770B077078808870770B07707880880B770B077B08800077BBBBBBB7
          70007700BB707BB0077000BBBB0F0BBBB00000BBBB0F0BBBB0007700BB707BB0
          07708877BBBBBBB77880880B770B077B08808870770B077078808870770B0770
          78808888887078888880}
        Layout = blGlyphTop
        Spacing = 0
        OnClick = sbnResgatarClick
      end
    end
  end
  object pnlFundodaJanela: TPanel
    Left = 0
    Top = 40
    Width = 686
    Height = 349
    Align = alClient
    TabOrder = 2
    object gbxCliente: TGroupBox
      Left = 8
      Top = 5
      Width = 530
      Height = 38
      TabOrder = 0
      object sbnConsultaCliente: TSpeedButton
        Left = 145
        Top = 10
        Width = 23
        Height = 23
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
        OnClick = sbnConsultaClienteClick
      end
      object lblCliente: TLabel
        Left = 7
        Top = 13
        Width = 40
        Height = 16
        Caption = 'Cliente'
      end
      object edfCodigoCliente: TtecDbEditFind
        Left = 53
        Top = 10
        Width = 90
        Height = 24
        Alignment = taLeftJustify
        DataField = 'codigo'
        DataSource = dtmExtratoBonus.dsrProcuraClientes
        Group = 'Cliente'
        MaxLength = 8
        Maximo = 0
        Minimo = 37353
        Adicional = 0
        Opcional = True
        OnFound = edfCodigoClienteFound
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
      object dtxNomeCliente: TtecDBText
        Left = 169
        Top = 10
        Width = 350
        Height = 24
        TabStop = False
        Color = clBtnFace
        DataField = 'nome'
        DataSource = dtmExtratoBonus.dsrProcuraClientes
        ReadOnly = True
        TabOrder = 0
      end
    end
    object ckbCancelados: TCheckBox
      Left = 544
      Top = 16
      Width = 124
      Height = 16
      Caption = 'Exibir cancelados'
      TabOrder = 2
      OnClick = ckbCanceladosClick
    end
    object pgcExtratoBonus: TtecPageControl
      Left = 1
      Top = 43
      Width = 684
      Height = 297
      ActivePage = tstLancamentos
      TabIndex = 0
      TabOrder = 1
      TabStop = False
      OnChange = pgcExtratoBonusChange
      object tstLancamentos: TTabSheet
        Caption = '&1 - Lan'#231'amentos'
        object gbxLancamentos: TGroupBox
          Left = 0
          Top = 0
          Width = 676
          Height = 266
          Align = alClient
          TabOrder = 0
          object shpAtraso: TShape
            Left = 88
            Top = 251
            Width = 11
            Height = 11
            Brush.Color = clRed
            Pen.Width = 0
          end
          object Shape1: TShape
            Left = 9
            Top = 251
            Width = 11
            Height = 11
            Brush.Color = 8366677
            Pen.Width = 0
          end
          object lblSaldoAtual: TLabel
            Left = 490
            Top = 244
            Width = 66
            Height = 16
            Caption = 'Saldo Atual'
          end
          object Label3: TLabel
            Left = 102
            Top = 248
            Width = 68
            Height = 16
            Caption = 'Cancelados'
          end
          object Label1: TLabel
            Left = 23
            Top = 248
            Width = 55
            Height = 16
            Caption = 'Resgates'
          end
          object dbgExtrato: TtecDBGrid
            Left = 9
            Top = 5
            Width = 657
            Height = 235
            Color = clHighlightText
            DataSource = dtmExtratoBonus.dsrBonus
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete]
            ParentFont = False
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clBlack
            TitleFont.Height = -13
            TitleFont.Name = 'helvetica'
            TitleFont.Pitch = fpVariable
            TitleFont.Style = []
            OnDrawColumnCell = dbgExtratoDrawColumnCell
            RowWrap = 60
            Large = False
            DoubleRowColor = False
            TitleMinHeight = 100
            CellHeights = 100
            StrippedColor = 16777088
            CanDelete = False
            PostOnEnter = False
            DenySort = False
            Columns = <
              item
                Alignment = taRightJustify
                Expanded = False
                FieldName = 'data'
                Title.Alignment = taCenter
                Title.Caption = 'Data'
                Width = 60
                Visible = True
              end
              item
                Alignment = taRightJustify
                Expanded = False
                FieldName = 'contrato'
                Title.Alignment = taCenter
                Title.Caption = 'Contrato'
                Width = 80
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'tipo'
                Title.Alignment = taCenter
                Title.Caption = 'Tipo'
                Width = 26
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'parcela'
                Title.Alignment = taCenter
                Title.Caption = 'Parcela'
                Width = 46
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'produto'
                Title.Alignment = taCenter
                Title.Caption = 'Produto'
                Width = 352
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'valor'
                Title.Alignment = taCenter
                Title.Caption = 'Valor'
                Width = 50
                Visible = True
              end>
          end
          object dtxSaldoAtual: TtecDBText
            Left = 564
            Top = 241
            Width = 101
            Height = 24
            TabStop = False
            Color = clBtnFace
            DataField = 'saldoatual'
            DataSource = dtmExtratoBonus.dsrSaldoAtual
            ReadOnly = True
            TabOrder = 1
          end
        end
      end
      object tstProdutosResgate: TTabSheet
        Caption = '&2 - Produtos'
        ImageIndex = 1
        object gbxProdutosResgate: TGroupBox
          Left = 0
          Top = 0
          Width = 676
          Height = 266
          Align = alClient
          TabOrder = 0
          object dbgProdutosResgate: TtecDBGrid
            Left = 8
            Top = 6
            Width = 657
            Height = 190
            DataSource = dtmExtratoBonus.dsrProdutosResgate
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clBlack
            TitleFont.Height = -13
            TitleFont.Name = 'helvetica'
            TitleFont.Pitch = fpVariable
            TitleFont.Style = []
            OnDrawColumnCell = dbgProdutosResgateDrawColumnCell
            OnDblClick = dbgProdutosResgateDblClick
            OnKeyDown = dbgProdutosResgateKeyDown
            RowWrap = 60
            Large = False
            DoubleRowColor = False
            TitleMinHeight = 100
            CellHeights = 100
            StrippedColor = 16054260
            CanDelete = False
            PostOnEnter = False
            DenySort = False
            Columns = <
              item
                Expanded = False
                FieldName = 'descricao'
                Title.Alignment = taCenter
                Title.Caption = 'Produto'
                Width = 250
                Visible = True
              end
              item
                Alignment = taRightJustify
                Expanded = False
                FieldName = 'valorgrade1'
                Title.Alignment = taCenter
                Title.Caption = 'Linha'
                Width = 65
                Visible = True
              end
              item
                Alignment = taRightJustify
                Expanded = False
                FieldName = 'valorgrade2'
                Title.Alignment = taCenter
                Title.Caption = 'Coluna'
                Width = 65
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'filial'
                Title.Alignment = taCenter
                Title.Caption = 'Filial'
                Width = 30
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'emestoque'
                Title.Alignment = taCenter
                Title.Caption = 'Estoque'
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'reservado'
                Title.Alignment = taCenter
                Title.Caption = 'Reservado'
                Width = 61
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'bonus'
                Title.Alignment = taCenter
                Title.Caption = 'B'#244'nus'
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'codigo'
                Title.Alignment = taCenter
                Title.Caption = 'C'#243'digo'
                Width = 90
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'selecionar'
                Title.Alignment = taCenter
                Title.Caption = 'Sel.'
                Width = 25
                Visible = True
              end>
          end
          object ckbSelecionarTodos: TCheckBox
            Left = 541
            Top = 202
            Width = 124
            Height = 16
            Caption = '&Selecionar Todos'
            TabOrder = 1
            OnClick = ckbSelecionarTodosClick
          end
          object gbxQtdes: TGroupBox
            Left = 4
            Top = 198
            Width = 131
            Height = 65
            Caption = 'Qtde. Produtos'
            TabOrder = 2
            object lblQtdeProdutos: TLabel
              Left = 33
              Top = 42
              Width = 27
              Height = 16
              Alignment = taRightJustify
              Caption = 'Total'
            end
            object lblQtdeMarcados: TLabel
              Left = 3
              Top = 18
              Width = 57
              Height = 16
              Alignment = taRightJustify
              Caption = 'Marcados'
            end
            object edtQtdeProdutos: TEditNumero
              Left = 64
              Top = 39
              Width = 60
              Height = 24
              TabStop = False
              Color = clBtnFace
              MaxLength = -1
              ReadOnly = True
              TabOrder = 1
              Mascara = False
              Alignment = taLeftJustify
              TipoMascara = tmGERAL
              NrDecimal = 2
              Decimais = False
              Negativo = False
              Tamanho = 6
            end
            object edtQtdeMarcados: TEditNumero
              Left = 64
              Top = 15
              Width = 60
              Height = 24
              TabStop = False
              Color = clBtnFace
              MaxLength = -1
              ReadOnly = True
              TabOrder = 0
              Mascara = False
              Alignment = taLeftJustify
              TipoMascara = tmGERAL
              NrDecimal = 2
              Decimais = False
              Negativo = False
              Tamanho = 6
            end
          end
          object gbxValores: TGroupBox
            Left = 138
            Top = 198
            Width = 170
            Height = 65
            Caption = 'Valores Produtos'
            TabOrder = 3
            object lblTotalProdutos: TLabel
              Left = 33
              Top = 42
              Width = 27
              Height = 16
              Alignment = taRightJustify
              Caption = 'Total'
            end
            object lblTotalMarcados: TLabel
              Left = 3
              Top = 18
              Width = 57
              Height = 16
              Alignment = taRightJustify
              Caption = 'Marcados'
            end
            object edtTotalProdutos: TEditNumero
              Left = 64
              Top = 39
              Width = 100
              Height = 24
              TabStop = False
              Color = clBtnFace
              MaxLength = -1
              ReadOnly = True
              TabOrder = 1
              Mascara = True
              Alignment = taLeftJustify
              TipoMascara = tmGERAL
              NrDecimal = 2
              Decimais = True
              Negativo = False
              Tamanho = 9
            end
            object edtTotalMarcados: TEditNumero
              Left = 64
              Top = 15
              Width = 100
              Height = 24
              TabStop = False
              Color = clBtnFace
              MaxLength = -1
              ReadOnly = True
              TabOrder = 0
              Mascara = True
              Alignment = taLeftJustify
              TipoMascara = tmGERAL
              NrDecimal = 2
              Decimais = True
              Negativo = False
              Tamanho = 9
            end
          end
        end
      end
    end
  end
  object ActionList1: TActionList
    Left = 376
    Top = 8
    object actHabilitarBotoes: TAction
      OnUpdate = actHabilitarBotoesUpdate
    end
  end
end
