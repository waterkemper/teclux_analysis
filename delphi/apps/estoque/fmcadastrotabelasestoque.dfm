inherited frmCadastroTabelasEstoque: TfrmCadastroTabelasEstoque
  Left = 619
  Top = 87
  ActiveControl = dbgICMSINTER
  Caption = 'Cadastro Tabelas do Estoque'
  ClientHeight = 526
  ClientWidth = 861
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBarra: TPanel
    Width = 497
  end
  inherited pnlTopMenu: TPanel
    Width = 861
    TabOrder = 2
    inherited tblBarra: TToolBar
      Width = 636
    end
  end
  object pnlFundoJanela: TPanel
    Left = 0
    Top = 45
    Width = 861
    Height = 481
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object pgcTabelas: TtecPageControl
      Left = 0
      Top = 0
      Width = 861
      Height = 481
      ActivePage = tstICMS
      Align = alClient
      MultiLine = True
      PopupMenu = AdvPopupMenu1
      TabOrder = 0
      OnChange = pgcTabelasChange
      object tstGrupos: TTabSheet
        Caption = '&Grupos'
        object stxGruposVendaSem: TStaticText
          Left = 133
          Top = 46
          Width = 58
          Height = 16
          Caption = 'VENDA SEM'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 13
        end
        object gbxCodigoGrupo: TGroupBox
          Left = 3
          Top = 6
          Width = 65
          Height = 36
          Caption = ' C'#211'DIGO '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object edfGrupo: TtecDbEditFind
            Left = 2
            Top = 10
            Width = 60
            Height = 23
            Alignment = taLeftJustify
            CharCase = ecUpperCase
            DataField = 'codigo'
            DataSource = dtmCadastroTabelasEstoques.dsrGrupos
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
            ActiveSetControls = True
            DenyInsert = False
            NoSetControls = <>
            SetControls = <>
          end
        end
        object gbxDepreciacao: TGroupBox
          Left = 3
          Top = 121
          Width = 89
          Height = 36
          Caption = ' DEPRECIA'#199#195'O '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          object Label1: TLabel
            Left = 71
            Top = 14
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
          object DBEditNumero1: TDBEditNumero
            Left = 2
            Top = 10
            Width = 61
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
            Text = '1,00'
            Mascara = True
            TipoMascara = tmGERAL
            NrDecimal = 2
            Decimais = True
            Negativo = False
            Tamanho = 3
            DataField = 'depreciacao'
            DataSource = dtmCadastroTabelasEstoques.dsrGrupos
          end
        end
        object gbxDescricaoGrupo: TGroupBox
          Left = 70
          Top = 6
          Width = 350
          Height = 36
          Caption = ' DESCRI'#199#195'O '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          object edtDescricaoGrupos: TDBEditTexto
            Left = 2
            Top = 10
            Width = 345
            Height = 23
            DataField = 'descricao'
            DataSource = dtmCadastroTabelasEstoques.dsrGrupos
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            MaxLength = -1
            ParentFont = False
            TabOrder = 0
            CharCasenoDefault = False
            Alignment = taLeftJustify
          end
        end
        object gbxLimitesComissoes: TGroupBox
          Left = 516
          Top = 4
          Width = 337
          Height = 190
          Caption = ' LIMITES DE COMISS'#213'ES '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 11
          object dbgGruposComissoes: TtecDBGrid
            Left = 2
            Top = 16
            Width = 312
            Height = 172
            Align = alClient
            DataSource = dtmCadastroTabelasEstoques.dsrGruposComissoes
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clBlack
            TitleFont.Height = -9
            TitleFont.Name = 'helvetica'
            TitleFont.Pitch = fpVariable
            TitleFont.Style = []
            OnKeyDown = dbgGruposComissoesKeyDown
            RowWrap = 60
            Large = False
            DoubleRowColor = False
            TitleMinHeight = 100
            CellHeights = 100
            StrippedColor = 16054260
            CanDelete = True
            CanNotInsertFromGrid = False
            PostOnEnter = True
            PostOnSetUpDown = False
            DenySort = True
            DefaultRowHeight = 19
            ExibirNumerodaLinha = False
            NaoAtribuirDadosaTabelaaoDigitar = False
            ShowWhenFieldInvisible = False
            CanClickWhenEditing = False
            Columns = <
              item
                Expanded = False
                FieldName = 'numero'
                ReadOnly = True
                Title.Alignment = taCenter
                Title.Caption = 'N'#186
                Width = 30
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'tipocomissao'
                PickList.Strings = (
                  '%'
                  'V')
                Title.Alignment = taCenter
                Title.Caption = 'TIPO % ou R$'
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'limite'
                Title.Alignment = taCenter
                Title.Caption = 'LIMITE'
                Width = 94
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'comissao'
                Title.Alignment = taCenter
                Title.Caption = 'COMISS'#195'O'
                Visible = True
              end>
          end
          object pnlDescricaoSetup: TPanel
            Left = 314
            Top = 16
            Width = 21
            Height = 172
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 1
            object sbnIncluirGrupodeComissoes: TSpeedButton
              Left = 1
              Top = 23
              Width = 20
              Height = 22
              Hint = 'Incluir nova faxa de comiss'#227'o'
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
              OnClick = sbnIncluirGrupodeComissoesClick
            end
          end
        end
        object gbxInativoGrupo: TGroupBox
          Left = 430
          Top = 5
          Width = 75
          Height = 36
          Caption = ' INATIVO '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 12
        end
        object gbxMarkUpGrupo: TGroupBox
          Left = 3
          Top = 45
          Width = 87
          Height = 36
          Caption = ' MARK-UP '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          object lblPercGrupo: TLabel
            Left = 70
            Top = 14
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
          object edtMarkup: TDBEditNumero
            Left = 2
            Top = 10
            Width = 63
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
            Text = 'edtMarkup'
            Mascara = True
            TipoMascara = tmGERAL
            NrDecimal = 2
            Decimais = True
            Negativo = False
            Tamanho = 3
            DataField = 'markup'
            DataSource = dtmCadastroTabelasEstoques.dsrGrupos
          end
        end
        object gbxMultiploGrupo: TGroupBox
          Left = 3
          Top = 82
          Width = 88
          Height = 36
          Caption = ' M'#218'LTIPLO '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          object edtMultiploGrupo: TDBEditNumero
            Left = 2
            Top = 10
            Width = 69
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
            Text = 'edtMultiploGrupo'
            Mascara = True
            TipoMascara = tmGERAL
            NrDecimal = 2
            Decimais = True
            Negativo = False
            Tamanho = 3
            DataField = 'multiplo'
            DataSource = dtmCadastroTabelasEstoques.dsrGrupos
          end
        end
        object gbxOpcoesGrupo: TGroupBox
          Left = 234
          Top = 42
          Width = 187
          Height = 114
          Caption = ' OP'#199#213'ES '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 7
          object ckbCalcularPreco: TDBCheckBox
            Left = 6
            Top = 28
            Width = 175
            Height = 19
            Caption = 'Calcular pre'#231'o autom'#225'tico'
            DataField = 'calcularpreco'
            DataSource = dtmCadastroTabelasEstoques.dsrGrupos
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object ckbNaoReplicarGrupo: TDBCheckBox
            Left = 6
            Top = 13
            Width = 175
            Height = 19
            Caption = 'N'#227'o replicar o fornecedor'
            DataField = 'naoreplicar'
            DataSource = dtmCadastroTabelasEstoques.dsrGrupos
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object ckbInclurPlanilhaCustos: TDBCheckBox
            Left = 6
            Top = 44
            Width = 175
            Height = 19
            Caption = 'Incluir na planilha de custos'
            DataField = 'planilhacustos'
            DataSource = dtmCadastroTabelasEstoques.dsrGrupos
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object ckbEmExposicao: TDBCheckBox
            Left = 6
            Top = 60
            Width = 175
            Height = 19
            Caption = 'Em exposi'#231#227'o'
            DataField = 'EmExposicao'
            DataSource = dtmCadastroTabelasEstoques.dsrGrupos
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object ckbUmaEtiquetaporbalcao: TDBCheckBox
            Left = 6
            Top = 76
            Width = 165
            Height = 19
            Caption = 'Uma etiqueta por balc'#227'o'
            DataField = 'umaetiquetaporbalcao'
            DataSource = dtmCadastroTabelasEstoques.dsrGrupos
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object ckbExigirNumeroSerieaoFaturar: TDBCheckBox
            Left = 6
            Top = 92
            Width = 145
            Height = 20
            Caption = 'Exige n'#250'mero de s'#233'rie'
            DataField = 'exigenumeroserie'
            DataSource = dtmCadastroTabelasEstoques.dsrGrupos
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 5
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
        end
        object rgpGruposVendaNegativa: TtecDBRadioGroup
          Left = 126
          Top = 58
          Width = 69
          Height = 47
          Caption = ' ESTOQUE '
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          TabStop = False
          DataField = 'vendanegativa'
          DataSource = dtmCadastroTabelasEstoques.dsrGrupos
          object rbnSimVendaNegativa: TtecRadioButton
            Left = 11
            Top = 11
            Width = 44
            Height = 16
            Caption = 'Sim'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            Visible = False
            Value = 'S'
          end
          object rbnNaoVendaNegativa: TtecRadioButton
            Left = 11
            Top = 28
            Width = 44
            Height = 17
            Caption = 'N'#227'o'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            Visible = False
            Value = 'N'
          end
        end
        object gbxObservaocoesProdutosVendasGrupos: TGroupBox
          Left = 0
          Top = 312
          Width = 853
          Height = 56
          Align = alBottom
          Caption = ' OBSERVA'#199#213'ES DE VENDAS '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 9
          object mmoObservacaoProdutosVendasGrupos: TtecDBMemo
            Left = 2
            Top = 16
            Width = 849
            Height = 38
            Align = alClient
            DataField = 'observacoesvenda'
            DataSource = dtmCadastroTabelasEstoques.dsrGrupos
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
        object gbxAgendamentoGruposProdutos: TGroupBox
          Left = 0
          Top = 208
          Width = 853
          Height = 104
          Align = alBottom
          Caption = ' AGENDAMENTOS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 8
          object dbgAgendamentoGrupos: TtecDBGrid
            Left = 2
            Top = 16
            Width = 820
            Height = 86
            Align = alClient
            DataSource = dtmCadastroTabelasEstoques.dsrGruposAgendamentos
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgCancelOnExit]
            ParentFont = False
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clBlack
            TitleFont.Height = -12
            TitleFont.Name = 'helvetica'
            TitleFont.Pitch = fpVariable
            TitleFont.Style = []
            RowWrap = 60
            Large = False
            DoubleRowColor = True
            TitleMinHeight = 100
            CellHeights = 100
            StrippedColor = 16054260
            CanDelete = True
            CanNotInsertFromGrid = False
            PostOnEnter = True
            PostOnSetUpDown = True
            DenySort = False
            DefaultRowHeight = 19
            ExibirNumerodaLinha = False
            NaoAtribuirDadosaTabelaaoDigitar = False
            ShowWhenFieldInvisible = False
            CanClickWhenEditing = False
            Columns = <
              item
                Expanded = False
                FieldName = 'dias'
                Title.Alignment = taCenter
                Title.Caption = 'DIAS'
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
                FieldName = 'observacoes'
                Title.Alignment = taCenter
                Title.Caption = 'OBSERVA'#199#213'ES'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 623
                Visible = True
              end>
          end
          object pnlGruposAgendamentosBotoes: TPanel
            Left = 822
            Top = 16
            Width = 29
            Height = 86
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 1
            object sbnExcluirProdutosAgendamentos: TSpeedButton
              Left = 2
              Top = 21
              Width = 23
              Height = 22
              Hint = 'Excluir produto'
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
              OnClick = sbnExcluirProdutosAgendamentosClick
            end
          end
        end
        object gbxObservaocoesProdutosEntradasGrupos: TGroupBox
          Left = 0
          Top = 368
          Width = 853
          Height = 61
          Align = alBottom
          Caption = ' OBSERVA'#199#213'ES NA ENTRADA DA NOTA FISCAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 10
          object mmoObservaocoesProdutosEntradasGrupos: TtecDBMemo
            Left = 2
            Top = 16
            Width = 849
            Height = 43
            Align = alClient
            DataField = 'observacoesentrada'
            DataSource = dtmCadastroTabelasEstoques.dsrGrupos
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
        object gbxclassificacao_vigilancia_sanitaria: TGroupBox
          Left = 3
          Top = 159
          Width = 420
          Height = 41
          Caption = 'CLASSIFICA'#199#195'O DA VIGILANCIA SANIT'#193'RIA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          inline fraConsultaClassificacao_Vigilancia_Sanitaria: TfraConsultaCodigo
            Left = 3
            Top = 14
            Width = 412
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
            inherited dtxDescricao: TtecDBText
              DataField = 'descricao'
              DataSource = fraConsultaClassificacao_Vigilancia_Sanitaria.dsrProcuraClassificacao_Vigilancia_Sanitaria
            end
            inherited edfCodigo: TtecDBFindLookup
              DataField = 'classificacao_vigilancia_sanitaria'
              DataSource = dtmCadastroTabelasEstoques.dsrGrupos
              LookupaFieldinterno = 'codigo'
              LookupaFieldVisual = 'codigo'
              LookupField = 'codigo'
              LookupSource = fraConsultaClassificacao_Vigilancia_Sanitaria.dsrProcuraClassificacao_Vigilancia_Sanitaria
              LookupQueryParameter = 'codigo'
              Parameter = 'codigo'
              ActiveSetControls = False
              DenyInsert = True
              NoSetControls = <>
              SetControls = <>
              LookupParameter = 'codigo'
            end
          end
        end
      end
      object tstClasses: TTabSheet
        Caption = 'Class&es'
        ImageIndex = 1
        object stxClassesVendaSem: TStaticText
          Left = 100
          Top = 80
          Width = 58
          Height = 16
          Caption = 'VENDA SEM'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 4
        end
        object gbxCodigoClasse: TGroupBox
          Left = 6
          Top = 2
          Width = 65
          Height = 36
          Caption = ' C'#211'DIGO '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object edfClasse: TtecDbEditFind
            Left = 2
            Top = 10
            Width = 61
            Height = 23
            Alignment = taLeftJustify
            CharCase = ecUpperCase
            DataField = 'codigo'
            DataSource = dtmCadastroTabelasEstoques.dsrClasses
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
            TabOrder = 0
            PermitirZero = False
            PermitirNulo = False
            Operacao = opATRIBUICAO
            Parameter = 'codigo'
            ActiveSetControls = True
            DenyInsert = False
            NoSetControls = <>
            SetControls = <>
          end
        end
        object gbxInativoClasse: TGroupBox
          Left = 281
          Top = 2
          Width = 75
          Height = 36
          Caption = ' INATIVO '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object gbxDescricaoClasse: TGroupBox
          Left = 6
          Top = 40
          Width = 350
          Height = 36
          Caption = ' DESCRI'#199#195'O '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          object edtDescricaoClasses: TDBEditTexto
            Left = 2
            Top = 10
            Width = 345
            Height = 23
            DataField = 'descricao'
            DataSource = dtmCadastroTabelasEstoques.dsrClasses
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            MaxLength = -1
            ParentFont = False
            TabOrder = 0
            CharCasenoDefault = False
            Alignment = taLeftJustify
          end
        end
        object gbxMultiploClasse: TGroupBox
          Left = 6
          Top = 78
          Width = 74
          Height = 36
          Caption = ' M'#218'LTIPLO '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          object edtMultiploClasse: TDBEditNumero
            Left = 3
            Top = 10
            Width = 68
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
            Text = '99.999,99'
            Mascara = True
            TipoMascara = tmGERAL
            NrDecimal = 2
            Decimais = True
            Negativo = False
            Tamanho = 3
            DataField = 'multiplo'
            DataSource = dtmCadastroTabelasEstoques.dsrClasses
          end
        end
        object gbxOpcoesClasse: TGroupBox
          Left = 180
          Top = 78
          Width = 177
          Height = 36
          Caption = ' OP'#199#213'ES '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          object ckbNaoReplicarClasse: TDBCheckBox
            Left = 6
            Top = 11
            Width = 165
            Height = 21
            Caption = 'N'#227'o replicar o fornecedor'
            DataField = 'naoreplicar'
            DataSource = dtmCadastroTabelasEstoques.dsrClasses
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
        end
        inline fraComissaoClasse: TfraComissao
          Left = 201
          Top = 117
          Width = 144
          Height = 74
          HorzScrollBar.Range = 143
          VertScrollBar.Range = 74
          AutoScroll = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 7
          inherited gbxComissao: TGroupBox
            Top = 0
            Width = 144
            Height = 74
            Align = alClient
            Caption = ' COMI&SS'#195'O '
            inherited lblComissao: TLabel
              Top = 37
            end
            inherited dtxComissao: TDBEditNumero
              Left = 69
              Top = 49
              Height = 23
              Font.Height = -12
              Alignment = taRightJustify
              DataSource = dtmCadastroTabelasEstoques.dsrClasses
            end
            inherited rgpTipoComissao: TtecDBRadioGroup
              Left = 0
              Top = 19
              DataSource = dtmCadastroTabelasEstoques.dsrClasses
              OnChange = fraComissaoClassergpTipoComissaoChange
              inherited rbnPercentual: TtecRadioButton
                Font.Height = -12
              end
              inherited rbnValor: TtecRadioButton
                Font.Height = -12
              end
            end
          end
        end
        object rgpClassesVendaNegativa: TtecDBRadioGroup
          Left = 94
          Top = 92
          Width = 69
          Height = 53
          Caption = ' ESTOQUE '
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          TabStop = False
          DataField = 'vendanegativa'
          DataSource = dtmCadastroTabelasEstoques.dsrClasses
          object tecRadioButton1: TtecRadioButton
            Left = 11
            Top = 13
            Width = 49
            Height = 17
            Caption = 'Sim'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            Visible = False
            Value = 'S'
          end
          object tecRadioButton2: TtecRadioButton
            Left = 11
            Top = 30
            Width = 49
            Height = 17
            Caption = 'N'#227'o'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            Visible = False
            Value = 'N'
          end
        end
        object gbxClassesobservacoesvenda: TGroupBox
          Left = 0
          Top = 338
          Width = 853
          Height = 91
          Align = alBottom
          Caption = ' OBSERVA'#199#213'ES DE VENDAS '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 9
          object mmoClassesobservacoesvenda: TtecDBMemo
            Left = 2
            Top = 16
            Width = 849
            Height = 73
            Align = alClient
            DataField = 'observacoesvenda'
            DataSource = dtmCadastroTabelasEstoques.dsrClasses
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
        object gbxAgendamentoClassesProdutos: TGroupBox
          Left = 0
          Top = 195
          Width = 853
          Height = 143
          Align = alBottom
          Caption = ' AGENDAMENTOS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 8
          object dbgAgendamentoClassesProdutos: TtecDBGrid
            Left = 2
            Top = 16
            Width = 820
            Height = 125
            Align = alClient
            DataSource = dtmCadastroTabelasEstoques.dsrClassesAgendamentos
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgCancelOnExit]
            ParentFont = False
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clBlack
            TitleFont.Height = -12
            TitleFont.Name = 'helvetica'
            TitleFont.Pitch = fpVariable
            TitleFont.Style = []
            RowWrap = 60
            Large = False
            DoubleRowColor = True
            TitleMinHeight = 100
            CellHeights = 100
            StrippedColor = 16054260
            CanDelete = True
            CanNotInsertFromGrid = False
            PostOnEnter = True
            PostOnSetUpDown = True
            DenySort = False
            DefaultRowHeight = 19
            ExibirNumerodaLinha = False
            NaoAtribuirDadosaTabelaaoDigitar = False
            ShowWhenFieldInvisible = False
            CanClickWhenEditing = False
            Columns = <
              item
                Expanded = False
                FieldName = 'dias'
                Title.Alignment = taCenter
                Title.Caption = 'DIAS'
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
                FieldName = 'observacoes'
                Title.Alignment = taCenter
                Title.Caption = 'OBSERVA'#199#213'ES'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 623
                Visible = True
              end>
          end
          object Panel1: TPanel
            Left = 822
            Top = 16
            Width = 29
            Height = 125
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 1
            object sbnExcluirClssesAgendamentos: TSpeedButton
              Left = 2
              Top = 21
              Width = 23
              Height = 22
              Hint = 'Excluir produto'
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
              OnClick = sbnExcluirClssesAgendamentosClick
            end
          end
        end
      end
      object tstUnidades: TTabSheet
        Caption = '&Unidades'
        ImageIndex = 2
        object gbxCodigoUnidade: TGroupBox
          Left = 6
          Top = 2
          Width = 65
          Height = 36
          Caption = ' C'#211'DIGO '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object edfUnidade: TtecDbEditFind
            Left = 2
            Top = 10
            Width = 61
            Height = 23
            Alignment = taLeftJustify
            CharCase = ecUpperCase
            DataField = 'codigo'
            DataSource = dtmCadastroTabelasEstoques.dsrUnidades
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Group = 'Unidade'
            MaxLength = 8
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
            ActiveSetControls = True
            DenyInsert = False
            NoSetControls = <>
            SetControls = <>
          end
        end
        object gbxDescricao: TGroupBox
          Left = 6
          Top = 48
          Width = 350
          Height = 36
          Caption = ' DESCRI'#199#195'O '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          object edtDescricaoUnidade: TDBEditTexto
            Left = 2
            Top = 10
            Width = 345
            Height = 23
            DataField = 'descricao'
            DataSource = dtmCadastroTabelasEstoques.dsrUnidades
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            MaxLength = -1
            ParentFont = False
            TabOrder = 0
            CharCasenoDefault = False
            Alignment = taLeftJustify
          end
        end
        object gbxInativoUnidade: TGroupBox
          Left = 281
          Top = 6
          Width = 75
          Height = 36
          Caption = ' INATIVO '
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
      object tstICMS: TTabSheet
        Caption = '&ICMS'
        ImageIndex = 3
        object sbnSincronizarICMSEstados: TSpeedButton
          Left = 6
          Top = 403
          Width = 371
          Height = 27
          Caption = '&Sincronizar Estados'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          OnClick = sbnSincronizarICMSEstadosClick
        end
        object gbxCodigoICMS: TGroupBox
          Left = 6
          Top = 6
          Width = 65
          Height = 36
          Caption = 'C'#211'DIGO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object edfICMS: TtecDbEditFind
            Left = 2
            Top = 10
            Width = 60
            Height = 23
            Alignment = taLeftJustify
            DataField = 'codigo'
            DataSource = dtmCadastroTabelasEstoques.dsrICMS
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Group = 'ICMS'
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
            ActiveSetControls = True
            DenyInsert = True
            NoSetControls = <
              item
                Control = sbnSincronizarICMSEstados
              end>
            SetControls = <>
          end
        end
        object gbxDescricaoICMS: TGroupBox
          Left = 6
          Top = 47
          Width = 350
          Height = 36
          Caption = 'DESCRI'#199#195'O'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          object edtDescricaoICMS: TDBEditTexto
            Left = 2
            Top = 10
            Width = 345
            Height = 23
            DataField = 'descricao'
            DataSource = dtmCadastroTabelasEstoques.dsrICMS
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            MaxLength = -1
            ParentFont = False
            TabOrder = 0
            CharCasenoDefault = False
            Alignment = taLeftJustify
          end
        end
        object gbxInativoICMS: TGroupBox
          Left = 281
          Top = 7
          Width = 75
          Height = 36
          Caption = ' INATIVO '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object rgpUsadoPara: TtecDBRadioGroup
          Left = 376
          Top = 7
          Width = 86
          Height = 78
          Caption = 'USADO PARA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          TabStop = False
          DataField = 'tipo'
          DataSource = dtmCadastroTabelasEstoques.dsrICMS
          object rbnProduto: TtecRadioButton
            Left = 6
            Top = 13
            Width = 70
            Height = 17
            Caption = 'Produto'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            Value = 'P'
          end
          object rbnFrete: TtecRadioButton
            Left = 6
            Top = 34
            Width = 70
            Height = 17
            Caption = 'Frete'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            Value = 'F'
          end
          object rbnSeguro: TtecRadioButton
            Left = 6
            Top = 54
            Width = 70
            Height = 17
            Caption = 'Seguro'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            Value = 'S'
          end
        end
        object gbxICMSPorEstado: TGroupBox
          Left = 6
          Top = 87
          Width = 371
          Height = 316
          Caption = ' &AL'#205'QUOTAS DE ICMS POR ESTADO (%) '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
          object sbnReplicarValoresICMS: TSpeedButton
            Left = 342
            Top = 16
            Width = 23
            Height = 22
            Hint = 'CTRL R'
            Glyph.Data = {
              AA030000424DAA03000000000000360000002800000011000000110000000100
              18000000000074030000120B0000120B00000000000000000000BFBFBFBFBFBF
              BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
              BFBFBFBFBFBFBFBFBFBFBFBFBF00BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
              BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
              BF00BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
              BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF00BFBFBFBFBFBFBFBFBFBF
              BFBFBFBFBFBFBFBFBFBFBF800000800000800000800000800000800000800000
              800000800000BFBFBF00BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF80
              0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF800000BFBFBF00BFBF
              BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF800000FFFFFF00000000000000
              0000000000000000FFFFFF800000BFBFBF00BFBFBF0000000000000000000000
              00000000000000800000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF80
              0000BFBFBF00BFBFBF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF800000FFFF
              FF000000000000000000000000000000FFFFFF800000BFBFBF00BFBFBF000000
              FFFFFF000000000000000000000000800000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFF800000BFBFBF00BFBFBF000000FFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFF800000FFFFFF000000000000FFFFFF800000800000800000800000BFBF
              BF00BFBFBF000000FFFFFF000000000000000000000000800000FFFFFFFFFFFF
              FFFFFFFFFFFF800000FFFFFF800000BFBFBFBFBFBF00BFBFBF000000FFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFF800000FFFFFFFFFFFFFFFFFFFFFFFF800000800000
              BFBFBFBFBFBFBFBFBF00BFBFBF000000FFFFFF000000000000FFFFFF00000080
              0000800000800000800000800000800000BFBFBFBFBFBFBFBFBFBFBFBF00BFBF
              BF000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF000000BFBFBFBFBFBFBF
              BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF00BFBFBF000000FFFFFFFFFFFFFFFF
              FFFFFFFF000000000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
              BFBFBFBFBF00BFBFBF000000000000000000000000000000000000BFBFBFBFBF
              BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF00BFBFBFBFBFBF
              BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
              BFBFBFBFBFBFBFBFBFBFBFBFBF00}
            OnClick = sbnReplicarValoresICMSClick
          end
          object dbgICMS: TtecDBGrid
            Left = 1
            Top = 15
            Width = 336
            Height = 299
            DataSource = dtmCadastroTabelasEstoques.dsrEstadosICMS
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clBlack
            TitleFont.Height = -12
            TitleFont.Name = 'helvetica'
            TitleFont.Pitch = fpVariable
            TitleFont.Style = []
            OnKeyPress = dbgICMSKeyPress
            RowWrap = 60
            Large = False
            DoubleRowColor = False
            TitleMinHeight = 140
            CellHeights = 100
            StrippedColor = 16054260
            CanDelete = False
            CanNotInsertFromGrid = False
            PostOnEnter = True
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
                FieldName = 'estado'
                ReadOnly = True
                Title.Alignment = taCenter
                Title.Caption = 'UF'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -10
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 30
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'nome'
                ReadOnly = True
                Title.Alignment = taCenter
                Title.Caption = 'NOME DO ESTADO'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -10
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 185
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'valor'
                Title.Alignment = taCenter
                Title.Caption = 'NO ESTADO'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -10
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 70
                Visible = True
              end>
          end
        end
        object gbxICMSInter: TGroupBox
          Left = 382
          Top = 87
          Width = 371
          Height = 316
          Caption = ' &AL'#205'QUOTAS INTERESTADUAL (%) '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 5
          object dbgICMSINTER: TtecDBGrid
            Left = 1
            Top = 15
            Width = 368
            Height = 299
            DataSource = dtmCadastroTabelasEstoques.dsrICMSInterEstadual
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clBlack
            TitleFont.Height = -12
            TitleFont.Name = 'helvetica'
            TitleFont.Pitch = fpVariable
            TitleFont.Style = []
            OnKeyPress = dbgICMSKeyPress
            RowWrap = 60
            Large = False
            DoubleRowColor = False
            TitleMinHeight = 140
            CellHeights = 100
            StrippedColor = 16054260
            CanDelete = False
            CanNotInsertFromGrid = False
            PostOnEnter = True
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
                FieldName = 'estado'
                ReadOnly = True
                Title.Alignment = taCenter
                Title.Caption = 'UF'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -10
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 30
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'nome'
                ReadOnly = True
                Title.Alignment = taCenter
                Title.Caption = 'NOME DO ESTADO'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -10
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 185
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'aliquota'
                Title.Alignment = taCenter
                Title.Caption = 'INTERESTADUAL'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -10
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 100
                Visible = True
              end>
          end
        end
      end
      object tstIPI: TTabSheet
        Caption = 'I&PI'
        ImageIndex = 4
        object gbxCodigoIPI: TGroupBox
          Left = 6
          Top = 6
          Width = 65
          Height = 36
          Caption = ' C'#211'DIGO '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object edfIPI: TtecDbEditFind
            Left = 2
            Top = 10
            Width = 60
            Height = 23
            Alignment = taLeftJustify
            DataField = 'codigo'
            DataSource = dtmCadastroTabelasEstoques.dsrIPI
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Group = 'IPI'
            MaxLength = 6
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
            ActiveSetControls = True
            DenyInsert = True
            NoSetControls = <>
            SetControls = <>
          end
        end
        object gbxDescricaoIPI: TGroupBox
          Left = 75
          Top = 6
          Width = 335
          Height = 36
          Caption = ' DESCRI'#199#195'O '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          object edtDescricaoIPI: TDBEditTexto
            Left = 2
            Top = 10
            Width = 330
            Height = 23
            DataField = 'descricao'
            DataSource = dtmCadastroTabelasEstoques.dsrIPI
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            MaxLength = 15
            ParentFont = False
            TabOrder = 0
            CharCasenoDefault = False
            Alignment = taLeftJustify
          end
        end
        object gbxInativoIPI: TGroupBox
          Left = 416
          Top = 6
          Width = 75
          Height = 36
          Caption = ' INATIVO '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object gbxTabelaIPI: TGroupBox
          Left = 6
          Top = 48
          Width = 485
          Height = 182
          Caption = ' TABELA DO IPI '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          object gbxClassificacaoFiscal: TGroupBox
            Left = 0
            Top = 12
            Width = 104
            Height = 36
            Caption = ' NCM '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            inline fraConsultaClassificacaoIPI: TfraConsultaCodigo
              Left = 2
              Top = 10
              Width = 100
              Height = 24
              HorzScrollBar.Range = 99
              VertScrollBar.Range = 23
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
                Left = 77
                Top = 1
                Width = 22
              end
              inherited dtxDescricao: TtecDBText
                Left = 1
                Width = 1
                Visible = False
              end
              inherited edfCodigo: TtecDBFindLookup
                Width = 77
                DataField = 'classificacaofiscal'
                DataSource = dtmCadastroTabelasEstoques.dsrIPI
                MaxLength = 10
                LookupField = 'classificacao'
                LookupSource = fraConsultaClassificacaoIPI.dsrProcuraNCMTabela
                LookupQueryParameter = 'CodigoIPI'
                Parameter = ' '
                ActiveSetControls = False
                DenyInsert = False
                NoSetControls = <>
                SetControls = <>
                LookupParameter = 'CodigoIPI'
              end
            end
          end
          object gbxEXTIPI: TGroupBox
            Left = 112
            Top = 12
            Width = 35
            Height = 36
            Caption = ' EX '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            object edtEXTIPI: TDBEditTexto
              Left = 2
              Top = 10
              Width = 30
              Height = 23
              DataField = 'extipi'
              DataSource = fraConsultaClassificacaoIPI.dsrProcuraNCMTabela
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              MaxLength = 9
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              CharCasenoDefault = False
              Alignment = taLeftJustify
            end
          end
          object gbxGenero: TGroupBox
            Left = 241
            Top = 12
            Width = 55
            Height = 36
            Caption = 'G'#202'NERO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            object edtGenero: TDBEditNumero
              Left = 2
              Top = 10
              Width = 50
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
              Text = 'edtGenero'
              Mascara = False
              Alignment = taLeftJustify
              TipoMascara = tmGERAL
              NrDecimal = 2
              Decimais = False
              Negativo = False
              Tamanho = 2
              DataField = 'genero'
              DataSource = dtmCadastroTabelasEstoques.dsrIPI
            end
          end
          object gbxAliquotaIPI: TGroupBox
            Left = 156
            Top = 12
            Width = 77
            Height = 36
            Caption = ' AL'#205'QUOTA '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            object lblPercIPI: TLabel
              Left = 64
              Top = 15
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
            object edtAliquotaIPI: TDBEditNumero
              Left = 2
              Top = 10
              Width = 60
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
              Text = 'edtAliquotaIPI'
              Mascara = True
              Alignment = taLeftJustify
              TipoMascara = tmGERAL
              NrDecimal = 2
              Decimais = True
              Negativo = False
              Tamanho = 2
              DataField = 'aliquota'
              DataSource = dtmCadastroTabelasEstoques.dsrIPI
            end
          end
          object gbxDescricaoTabelaIPI: TGroupBox
            Left = -1
            Top = 52
            Width = 486
            Height = 129
            Caption = ' DESCRI'#199#195'O DA NCM - NOMENCLATURA COMUM DO MERCOSUL '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 5
            object mmoDescricaoIPI: TtecDBMemo
              Left = 2
              Top = 14
              Width = 482
              Height = 113
              Align = alClient
              DataField = 'descricao'
              DataSource = fraConsultaClassificacaoIPI.dsrProcuraNCMTabela
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
          end
          object ckbIsentoPisCofins: TDBCheckBox
            Left = 305
            Top = 24
            Width = 142
            Height = 21
            Caption = 'Isento de PIS/COFINS'
            DataField = 'ncmisentopiscofins'
            DataSource = dtmCadastroTabelasEstoques.dsrIPI
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            Visible = False
          end
        end
        object gbxSubstituicaoTributaria: TGroupBox
          Left = 6
          Top = 234
          Width = 485
          Height = 194
          Caption = ' SUBSTITUI'#199#195'O TRIBUT'#193'RIA '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
          object gbxEstados: TGroupBox
            Left = 2
            Top = 16
            Width = 481
            Height = 176
            Align = alClient
            Caption = ' ESTADOS ONDE H'#193' CONV'#202'NIO PARA COBRAN'#199'A '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object dbgEstadosIPI: TtecDBGrid
              Left = 3
              Top = 12
              Width = 475
              Height = 160
              DataSource = dtmCadastroTabelasEstoques.dsrEstadosIPI
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clBlack
              TitleFont.Height = -13
              TitleFont.Name = 'Arial'
              TitleFont.Pitch = fpVariable
              TitleFont.Style = []
              OnDblClick = dbgEstadosIPIDblClick
              OnKeyDown = dbgEstadosIPIKeyDown
              RowWrap = 60
              Large = False
              DoubleRowColor = False
              TitleMinHeight = 100
              CellHeights = 100
              StrippedColor = 16054260
              CanDelete = False
              CanNotInsertFromGrid = False
              PostOnEnter = True
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
                  FieldName = 'Estado'
                  Title.Alignment = taCenter
                  Title.Caption = 'UF'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clBlack
                  Title.Font.Height = -9
                  Title.Font.Name = 'Arial'
                  Title.Font.Pitch = fpVariable
                  Title.Font.Style = []
                  Width = 40
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'Nome'
                  Title.Alignment = taCenter
                  Title.Caption = 'NOME DO ESTADO'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clBlack
                  Title.Font.Height = -9
                  Title.Font.Name = 'Arial'
                  Title.Font.Pitch = fpVariable
                  Title.Font.Style = []
                  Width = 185
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'MVA'
                  Title.Alignment = taCenter
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clBlack
                  Title.Font.Height = -9
                  Title.Font.Name = 'Arial'
                  Title.Font.Pitch = fpVariable
                  Title.Font.Style = []
                  Width = 60
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PercReducaoMVA'
                  Title.Alignment = taCenter
                  Title.Caption = '% REDU'#199#195'O'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clBlack
                  Title.Font.Height = -9
                  Title.Font.Name = 'Helvetica'
                  Title.Font.Pitch = fpVariable
                  Title.Font.Style = []
                  Visible = True
                end
                item
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'Ativo'
                  Title.Alignment = taCenter
                  Title.Caption = 'ATIVO'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clBlack
                  Title.Font.Height = -9
                  Title.Font.Name = 'Arial'
                  Title.Font.Pitch = fpVariable
                  Title.Font.Style = []
                  Width = 35
                  Visible = True
                end>
            end
          end
        end
      end
      object tstObsLegais: TTabSheet
        Caption = 'O&bs. Legais Notas'
        ImageIndex = 5
        object gbxCodigoObsLegais: TGroupBox
          Left = 6
          Top = 6
          Width = 65
          Height = 36
          Caption = ' C'#211'DIGO '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object edfObsLegaisNotas: TtecDbEditFind
            Left = 2
            Top = 10
            Width = 60
            Height = 23
            Alignment = taLeftJustify
            DataField = 'codigo'
            DataSource = dtmCadastroTabelasEstoques.dsrObsLegaisNotas
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Group = 'ObsLegais'
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
        end
        object gbxDescricaoObsLegaisNotas: TGroupBox
          Left = 0
          Top = 46
          Width = 818
          Height = 383
          Align = alBottom
          Caption = ' OBSERVA'#199#195'O LEGAL PARA NOTAS FISCAIS '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          object mmoDescricaoObsLegais: TtecDBMemo
            Left = 2
            Top = 14
            Width = 814
            Height = 367
            Align = alClient
            DataField = 'descricao'
            DataSource = dtmCadastroTabelasEstoques.dsrObsLegaisNotas
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
        object gbxInativoObsLegais: TGroupBox
          Left = 130
          Top = 6
          Width = 75
          Height = 36
          Caption = ' INATIVO '
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
      object gbxObsLegaisLivros: TTabSheet
        Caption = 'O&bs. Legais Livros'
        ImageIndex = 11
        object gbxCodigoObsLivrosFiscais: TGroupBox
          Left = 6
          Top = 6
          Width = 65
          Height = 36
          Caption = 'C'#211'DIGO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object edfObsLegaisLivros: TtecDbEditFind
            Left = 2
            Top = 10
            Width = 60
            Height = 23
            Alignment = taLeftJustify
            DataField = 'codigo'
            DataSource = dtmCadastroTabelasEstoques.dsrObsLivrosFiscais
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Group = 'ObsLegais'
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
          end
        end
        object gbxDescricaoObsLegaisLivros: TGroupBox
          Left = 0
          Top = 46
          Width = 818
          Height = 383
          Align = alBottom
          Caption = ' OBSERVA'#199#195'O LEGAL PARA OS LIVROS FISCAIS '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          object mmoDescricaoObsLegaisLivros: TtecDBMemo
            Left = 2
            Top = 14
            Width = 814
            Height = 367
            Align = alClient
            DataField = 'descricao'
            DataSource = dtmCadastroTabelasEstoques.dsrObsLivrosFiscais
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
        object gbxInativoObsLegaisLivros: TGroupBox
          Left = 130
          Top = 6
          Width = 75
          Height = 36
          Caption = ' INATIVO '
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
      object tstColunas: TTabSheet
        Caption = 'Co&lunas de pre'#231'o'
        ImageIndex = 6
        object gbxCodigoColPreco: TGroupBox
          Left = 6
          Top = 2
          Width = 65
          Height = 36
          Caption = ' C'#211'DIGO '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object edfColuna: TtecDbEditFind
            Left = 2
            Top = 10
            Width = 60
            Height = 23
            Alignment = taLeftJustify
            DataField = 'codigo'
            DataSource = dtmCadastroTabelasEstoques.dsrColunas
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Group = 'ColunasPreco'
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
            ActiveSetControls = True
            DenyInsert = True
            NoSetControls = <>
            SetControls = <>
          end
        end
        object gbxDescricaoColPreco: TGroupBox
          Left = 6
          Top = 44
          Width = 350
          Height = 36
          Caption = ' DESCRI'#199#195'O '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          object edtDescricaoColunas: TDBEditTexto
            Left = 2
            Top = 10
            Width = 345
            Height = 23
            DataField = 'descricao'
            DataSource = dtmCadastroTabelasEstoques.dsrColunas
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            MaxLength = -1
            ParentFont = False
            TabOrder = 0
            CharCasenoDefault = False
            Alignment = taLeftJustify
          end
        end
        object gbxInativoColPreco: TGroupBox
          Left = 281
          Top = 2
          Width = 75
          Height = 36
          Caption = ' INATIVO '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object PDBCheckdisponivelfrentecaixa: TPDBCheck
          Left = 9
          Top = 93
          Width = 192
          Height = 19
          Cursor = 1
          Version = 
            'Version 1.50, Copyright '#169' 2000-2001 by Peric, E-mail: pericddn@p' +
            'tt.yu'
          DataField = 'disponivelfrentecaixa'
          DataSource = dtmCadastroTabelasEstoques.dsrColunas
          Caption = 'Dispon'#237'vel no Frente de Caixa'
          HotTrack = False
          ImageType = igCheckBox
          Style = bmRaised
          ColorSipleMargine = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
      end
      object tstPromocoes: TTabSheet
        Caption = 'Promo'#231#245'es'
        ImageIndex = 8
        object GroupBox1: TGroupBox
          Left = 6
          Top = 2
          Width = 65
          Height = 36
          Caption = ' C'#211'DIGO '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object edfPromocao: TtecDbEditFind
            Left = 2
            Top = 10
            Width = 60
            Height = 23
            Alignment = taLeftJustify
            DataField = 'codigo'
            DataSource = dtmCadastroTabelasEstoques.dsrPromocoes
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Group = 'Promocoes'
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
            ActiveSetControls = True
            DenyInsert = True
            NoSetControls = <>
            SetControls = <>
          end
        end
        object GroupBox2: TGroupBox
          Left = 6
          Top = 44
          Width = 350
          Height = 36
          Caption = ' DESCRI'#199#195'O '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          object edtDescricaoPromocao: TDBEditTexto
            Left = 2
            Top = 10
            Width = 345
            Height = 23
            DataField = 'descricao'
            DataSource = dtmCadastroTabelasEstoques.dsrPromocoes
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            MaxLength = -1
            ParentFont = False
            TabOrder = 0
            CharCasenoDefault = False
            Alignment = taLeftJustify
          end
        end
        object GroupBox3: TGroupBox
          Left = 281
          Top = 2
          Width = 75
          Height = 36
          Caption = ' VALIDADE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          object edfValidadePromocao: TDBEditData
            Left = 2
            Top = 10
            Width = 70
            Height = 23
            Alignment = taCenter
            DataField = 'validade'
            DataSource = dtmCadastroTabelasEstoques.dsrPromocoes
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            MaxLength = -1
            Maximo = 0
            Minimo = 37353
            Adicional = 0
            ParentFont = False
            TabOrder = 0
            Opcional = True
          end
        end
        object GroupBox4: TGroupBox
          Left = 0
          Top = 83
          Width = 853
          Height = 346
          Align = alBottom
          Caption = ' OBSERVA'#199#213'ES DE VENDAS '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          object mmoObservacaoProdutosPromocoes: TtecDBMemo
            Left = 2
            Top = 16
            Width = 849
            Height = 328
            Align = alClient
            DataField = 'observacoesvenda'
            DataSource = dtmCadastroTabelasEstoques.dsrPromocoes
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
        object ckbNaoPermitirDesconto: TPDBCheck
          Left = 385
          Top = 61
          Width = 144
          Height = 19
          Cursor = 1
          Version = 
            'Version 1.50, Copyright '#169' 2000-2001 by Peric, E-mail: pericddn@p' +
            'tt.yu'
          DataField = 'deny_discount'
          DataSource = dtmCadastroTabelasEstoques.dsrPromocoes
          Caption = 'N'#227'o Permitir Desconto'
          HotTrack = False
          ImageType = igCheckBox
          Style = bmRaised
          ColorSipleMargine = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
      end
      object tstCashBack: TTabSheet
        Caption = 'Cash Back'
        ImageIndex = 9
        object GradientLabelPesquisaCampo: TGradientLabel
          Left = 0
          Top = 416
          Width = 853
          Height = 13
          Align = alBottom
          Alignment = taCenter
          AutoSize = False
          Caption = 
            'Ctrl + F9 - Pesquisar | CTRL X - Exportar | CTRL F Pesquisar | B' +
            'ot'#227'o Direito - Menu'
          Color = 16771282
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          EllipsType = etNone
          GradientType = gtFullVertical
          GradientDirection = gdLeftToRight
          Indent = 0
          Orientation = goHorizontal
          TransparentText = False
          VAlignment = vaTop
          Version = '1.2.0.0'
        end
        object AdvPageControlGrupos: TAdvPageControl
          Left = 0
          Top = 161
          Width = 853
          Height = 255
          ActivePage = AdvTabSheetProdutos
          ActiveFont.Charset = DEFAULT_CHARSET
          ActiveFont.Color = clWindowText
          ActiveFont.Height = -12
          ActiveFont.Name = 'Tahoma'
          ActiveFont.Style = [fsBold]
          Align = alClient
          PopupMenu = AdvPopupMenu1
          FreeOnClose = True
          TabBackGroundColor = clBtnFace
          TabMargin.RightMargin = 0
          TabOverlap = 0
          Version = '2.0.0.3'
          PersistPagesState.Location = plRegistry
          PersistPagesState.Enabled = False
          TabOrder = 1
          TabWidth = 70
          object AdvTabSheetProdutos: TAdvTabSheet
            Caption = 'Produtos'
            Color = clBtnFace
            ColorTo = clNone
            Highlighted = True
            TabColor = clBtnFace
            TabColorTo = clNone
            object DBAdvGridProdutos: TDBAdvGrid
              Left = 0
              Top = 0
              Width = 815
              Height = 224
              Cursor = crDefault
              Align = alClient
              ColCount = 4
              RowCount = 2
              FixedRows = 1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Pitch = fpVariable
              Font.Style = []
              Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
              ParentFont = False
              PopupMenu = AdvPopupMenu1
              ScrollBars = ssBoth
              TabOrder = 0
              OnKeyDown = DBAdvGridProdutosKeyDown
              OnGetEditorType = DBAdvGridProdutosGetEditorType
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
              FixedRowHeight = 22
              FixedFont.Charset = DEFAULT_CHARSET
              FixedFont.Color = clWindowText
              FixedFont.Height = -11
              FixedFont.Name = 'Tahoma'
              FixedFont.Style = [fsBold]
              FloatFormat = '%.2f'
              Navigation.AdvanceInsert = True
              Navigation.AllowClipboardShortCuts = True
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
                  EditLink = FormControlEditLink1
                  Editor = edCustom
                  FieldName = 'produtovisual'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
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
                  HeaderAlignment = taCenter
                  PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
                  PrintFont.Charset = DEFAULT_CHARSET
                  PrintFont.Color = clWindowText
                  PrintFont.Height = -11
                  PrintFont.Name = 'MS Sans Serif'
                  PrintFont.Pitch = fpVariable
                  PrintFont.Style = []
                  Width = 130
                end
                item
                  Borders = []
                  BorderPen.Color = clSilver
                  CheckFalse = 'N'
                  CheckTrue = 'Y'
                  Color = clWindow
                  Editor = edNone
                  FieldName = 'descricaoproduto'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
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
                  HeaderAlignment = taCenter
                  PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
                  PrintFont.Charset = DEFAULT_CHARSET
                  PrintFont.Color = clWindowText
                  PrintFont.Height = -11
                  PrintFont.Name = 'MS Sans Serif'
                  PrintFont.Pitch = fpVariable
                  PrintFont.Style = []
                  Width = 596
                end
                item
                  Alignment = taCenter
                  Borders = []
                  BorderPen.Color = clSilver
                  CheckFalse = 'N'
                  CheckTrue = 'Y'
                  Color = clWindow
                  Editor = edCheckBox
                  FieldName = 'exceto'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
                  Font.Name = 'Tahoma'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  Header = 'Exceto'
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
                  Width = 44
                end>
              DataSource = dtmCadastroTabelasEstoques.dsrCashBackProdutos
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
                130
                596
                44)
            end
            object PanelProdutos: TPanel
              Left = 815
              Top = 0
              Width = 30
              Height = 224
              Align = alRight
              BevelOuter = bvNone
              TabOrder = 1
              object sbnIncluirProdutosCashBack: TSpeedButton
                Left = 2
                Top = 26
                Width = 28
                Height = 28
                Hint = 'Inclui um novo Registro'
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
                Layout = blGlyphTop
                NumGlyphs = 2
                ParentFont = False
                Spacing = 0
                OnClick = sbnIncluirProdutosCashBackClick
              end
              object sbnExcluirProdutosCashBack: TSpeedButton
                Left = 2
                Top = 56
                Width = 28
                Height = 22
                Hint = 'Excluir produto'
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
                OnClick = sbnExcluirProdutosCashBackClick
              end
            end
          end
          object AdvTabSheetGrupos: TAdvTabSheet
            Caption = 'Grupos'
            Color = clBtnFace
            ColorTo = clNone
            TabColor = clBtnFace
            TabColorTo = clNone
            object DBAdvGridGrupos: TDBAdvGrid
              Left = 0
              Top = 0
              Width = 815
              Height = 224
              Cursor = crDefault
              Align = alClient
              ColCount = 4
              RowCount = 2
              FixedRows = 1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Pitch = fpVariable
              Font.Style = []
              Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
              ParentFont = False
              PopupMenu = AdvPopupMenu1
              ScrollBars = ssBoth
              TabOrder = 0
              OnKeyDown = DBAdvGridGruposKeyDown
              OnGetEditorType = DBAdvGridGruposGetEditorType
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
              FixedRowHeight = 22
              FixedFont.Charset = DEFAULT_CHARSET
              FixedFont.Color = clWindowText
              FixedFont.Height = -11
              FixedFont.Name = 'Tahoma'
              FixedFont.Style = [fsBold]
              FloatFormat = '%.2f'
              Navigation.AdvanceInsert = True
              Navigation.AllowClipboardShortCuts = True
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
                  EditLink = FormControlEditLink1
                  Editor = edCustom
                  FieldName = 'grupo'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
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
                  HeaderAlignment = taCenter
                  PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
                  PrintFont.Charset = DEFAULT_CHARSET
                  PrintFont.Color = clWindowText
                  PrintFont.Height = -11
                  PrintFont.Name = 'MS Sans Serif'
                  PrintFont.Pitch = fpVariable
                  PrintFont.Style = []
                  Width = 130
                end
                item
                  Borders = []
                  BorderPen.Color = clSilver
                  CheckFalse = 'N'
                  CheckTrue = 'Y'
                  Color = clWindow
                  Editor = edNone
                  FieldName = 'descricaogrupo'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
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
                  HeaderAlignment = taCenter
                  PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
                  PrintFont.Charset = DEFAULT_CHARSET
                  PrintFont.Color = clWindowText
                  PrintFont.Height = -11
                  PrintFont.Name = 'MS Sans Serif'
                  PrintFont.Pitch = fpVariable
                  PrintFont.Style = []
                  Width = 595
                end
                item
                  Alignment = taCenter
                  Borders = []
                  BorderPen.Color = clSilver
                  CheckFalse = 'N'
                  CheckTrue = 'Y'
                  Color = clWindow
                  Editor = edCheckBox
                  FieldName = 'exceto'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
                  Font.Name = 'Tahoma'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  Header = 'Exceto'
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
                  Width = 45
                end>
              DataSource = dtmCadastroTabelasEstoques.dsrCashBackGrupos
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
                130
                595
                45)
            end
            object Panel3: TPanel
              Left = 815
              Top = 0
              Width = 30
              Height = 224
              Align = alRight
              BevelOuter = bvNone
              TabOrder = 1
              object sbnIncluirCashBackGrupos: TSpeedButton
                Left = 2
                Top = 26
                Width = 28
                Height = 28
                Hint = 'Inclui um novo Registro'
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
                Layout = blGlyphTop
                NumGlyphs = 2
                ParentFont = False
                Spacing = 0
                OnClick = sbnIncluirCashBackGruposClick
              end
              object sbnExcluirPCashBackGrupos: TSpeedButton
                Left = 2
                Top = 56
                Width = 28
                Height = 22
                Hint = 'Excluir produto'
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
                OnClick = sbnExcluirPCashBackGruposClick
              end
            end
          end
          object AdvTabSheetClasses: TAdvTabSheet
            Caption = 'Classes'
            Color = clBtnFace
            ColorTo = clNone
            TabColor = clBtnFace
            TabColorTo = clNone
            object DBAdvGridClasses: TDBAdvGrid
              Left = 0
              Top = 0
              Width = 815
              Height = 224
              Cursor = crDefault
              Align = alClient
              ColCount = 4
              RowCount = 2
              FixedRows = 1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Pitch = fpVariable
              Font.Style = []
              Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
              ParentFont = False
              PopupMenu = AdvPopupMenu1
              ScrollBars = ssBoth
              TabOrder = 0
              OnKeyDown = DBAdvGridClassesKeyDown
              OnGetEditorType = DBAdvGridClassesGetEditorType
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
              FixedRowHeight = 22
              FixedFont.Charset = DEFAULT_CHARSET
              FixedFont.Color = clWindowText
              FixedFont.Height = -11
              FixedFont.Name = 'Tahoma'
              FixedFont.Style = [fsBold]
              FloatFormat = '%.2f'
              Navigation.AdvanceInsert = True
              Navigation.AllowClipboardShortCuts = True
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
                  EditLink = FormControlEditLink1
                  Editor = edCustom
                  FieldName = 'classe'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
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
                  HeaderAlignment = taCenter
                  PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
                  PrintFont.Charset = DEFAULT_CHARSET
                  PrintFont.Color = clWindowText
                  PrintFont.Height = -11
                  PrintFont.Name = 'MS Sans Serif'
                  PrintFont.Pitch = fpVariable
                  PrintFont.Style = []
                  Width = 130
                end
                item
                  Borders = []
                  BorderPen.Color = clSilver
                  CheckFalse = 'N'
                  CheckTrue = 'Y'
                  Color = clWindow
                  Editor = edNone
                  FieldName = 'descricaoclasse'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
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
                  HeaderAlignment = taCenter
                  PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
                  PrintFont.Charset = DEFAULT_CHARSET
                  PrintFont.Color = clWindowText
                  PrintFont.Height = -11
                  PrintFont.Name = 'MS Sans Serif'
                  PrintFont.Pitch = fpVariable
                  PrintFont.Style = []
                  Width = 597
                end
                item
                  Alignment = taCenter
                  Borders = []
                  BorderPen.Color = clSilver
                  CheckFalse = 'N'
                  CheckTrue = 'Y'
                  Color = clWindow
                  FieldName = 'exceto'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
                  Font.Name = 'Tahoma'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  Header = 'Exceto'
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
                  Width = 43
                end>
              DataSource = dtmCadastroTabelasEstoques.dsrCashBackClasses
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
                130
                597
                43)
            end
            object Panel4: TPanel
              Left = 815
              Top = 0
              Width = 30
              Height = 224
              Align = alRight
              BevelOuter = bvNone
              TabOrder = 1
              object sbnIncluirCashBackClasses: TSpeedButton
                Left = 2
                Top = 26
                Width = 28
                Height = 28
                Hint = 'Inclui um novo Registro'
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
                Layout = blGlyphTop
                NumGlyphs = 2
                ParentFont = False
                Spacing = 0
                OnClick = sbnIncluirCashBackClassesClick
              end
              object sbnExcluirPCashBackClasses: TSpeedButton
                Left = 2
                Top = 56
                Width = 28
                Height = 22
                Hint = 'Excluir produto'
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
                OnClick = sbnExcluirPCashBackClassesClick
              end
            end
          end
          object AdvTabSheetMarcas: TAdvTabSheet
            Caption = 'Marcas'
            Color = clBtnFace
            ColorTo = clNone
            TabColor = clBtnFace
            TabColorTo = clNone
            object DBAdvGridMarcas: TDBAdvGrid
              Left = 0
              Top = 0
              Width = 815
              Height = 224
              Cursor = crDefault
              Align = alClient
              ColCount = 4
              RowCount = 2
              FixedRows = 1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Pitch = fpVariable
              Font.Style = []
              Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
              ParentFont = False
              PopupMenu = AdvPopupMenu1
              ScrollBars = ssBoth
              TabOrder = 0
              OnKeyDown = DBAdvGridMarcasKeyDown
              OnGetEditorType = DBAdvGridMarcasGetEditorType
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
              FixedRowHeight = 22
              FixedFont.Charset = DEFAULT_CHARSET
              FixedFont.Color = clWindowText
              FixedFont.Height = -11
              FixedFont.Name = 'Tahoma'
              FixedFont.Style = [fsBold]
              FloatFormat = '%.2f'
              Navigation.AdvanceInsert = True
              Navigation.AllowClipboardShortCuts = True
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
                  EditLink = FormControlEditLink1
                  Editor = edCustom
                  FieldName = 'marca'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
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
                  HeaderAlignment = taCenter
                  PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
                  PrintFont.Charset = DEFAULT_CHARSET
                  PrintFont.Color = clWindowText
                  PrintFont.Height = -11
                  PrintFont.Name = 'MS Sans Serif'
                  PrintFont.Pitch = fpVariable
                  PrintFont.Style = []
                  Width = 130
                end
                item
                  Borders = []
                  BorderPen.Color = clSilver
                  CheckFalse = 'N'
                  CheckTrue = 'Y'
                  Color = clWindow
                  Editor = edNone
                  FieldName = 'descricaomarca'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
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
                  HeaderAlignment = taCenter
                  PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
                  PrintFont.Charset = DEFAULT_CHARSET
                  PrintFont.Color = clWindowText
                  PrintFont.Height = -11
                  PrintFont.Name = 'MS Sans Serif'
                  PrintFont.Pitch = fpVariable
                  PrintFont.Style = []
                  Width = 594
                end
                item
                  Alignment = taCenter
                  Borders = []
                  BorderPen.Color = clSilver
                  CheckFalse = 'N'
                  CheckTrue = 'Y'
                  Color = clWindow
                  Editor = edCheckBox
                  FieldName = 'exceto'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
                  Font.Name = 'Tahoma'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  Header = 'Exceto'
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
                  Width = 44
                end>
              DataSource = dtmCadastroTabelasEstoques.dsrCashBackMarcas
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
                130
                594
                44)
            end
            object Panel5: TPanel
              Left = 815
              Top = 0
              Width = 30
              Height = 224
              Align = alRight
              BevelOuter = bvNone
              TabOrder = 1
              object sbnIncluirCashBackMarcas: TSpeedButton
                Left = 2
                Top = 26
                Width = 28
                Height = 28
                Hint = 'Inclui um novo Registro'
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
                Layout = blGlyphTop
                NumGlyphs = 2
                ParentFont = False
                Spacing = 0
                OnClick = sbnIncluirCashBackMarcasClick
              end
              object sbnExcluirPCashBackMarcas: TSpeedButton
                Left = 2
                Top = 56
                Width = 28
                Height = 22
                Hint = 'Excluir produto'
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
                OnClick = sbnExcluirPCashBackMarcasClick
              end
            end
          end
          object AdvTabSheetCargos: TAdvTabSheet
            Caption = 'Cargos'
            Color = clBtnFace
            ColorTo = clNone
            TabColor = clBtnFace
            TabColorTo = clNone
            object DBAdvGridCargos: TDBAdvGrid
              Left = 0
              Top = 0
              Width = 815
              Height = 224
              Cursor = crDefault
              Align = alClient
              ColCount = 4
              RowCount = 2
              FixedRows = 1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Pitch = fpVariable
              Font.Style = []
              Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
              ParentFont = False
              PopupMenu = AdvPopupMenu1
              ScrollBars = ssBoth
              TabOrder = 0
              OnKeyDown = DBAdvGridCargosKeyDown
              OnGetEditorType = DBAdvGridCargosGetEditorType
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
              FixedRowHeight = 22
              FixedFont.Charset = DEFAULT_CHARSET
              FixedFont.Color = clWindowText
              FixedFont.Height = -11
              FixedFont.Name = 'Tahoma'
              FixedFont.Style = [fsBold]
              FloatFormat = '%.2f'
              Navigation.AdvanceInsert = True
              Navigation.AllowClipboardShortCuts = True
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
                  EditLink = FormControlEditLink1
                  Editor = edCustom
                  FieldName = 'cargo'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
                  Font.Name = 'Tahoma'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  Header = 'Cargo'
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
                  Width = 130
                end
                item
                  Borders = []
                  BorderPen.Color = clSilver
                  CheckFalse = 'N'
                  CheckTrue = 'Y'
                  Color = clWindow
                  Editor = edNone
                  FieldName = 'descricaocargo'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
                  Font.Name = 'Tahoma'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  Header = 'Descri'#231#227'o do Cargo'
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
                  Width = 604
                end
                item
                  Alignment = taCenter
                  Borders = []
                  BorderPen.Color = clSilver
                  CheckFalse = 'N'
                  CheckTrue = 'Y'
                  Color = clWindow
                  Editor = edCheckBox
                  FieldName = 'exceto'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
                  Font.Name = 'Tahoma'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  Header = 'Exceto'
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
                  Width = 64
                end>
              DataSource = dtmCadastroTabelasEstoques.dsrCashBackCargos
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
                130
                604
                64)
            end
            object Panel6: TPanel
              Left = 815
              Top = 0
              Width = 30
              Height = 224
              Align = alRight
              BevelOuter = bvNone
              TabOrder = 1
              object sbnIncluirCashBackCargos: TSpeedButton
                Left = 2
                Top = 26
                Width = 28
                Height = 28
                Hint = 'Inclui um novo Registro'
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
                Layout = blGlyphTop
                NumGlyphs = 2
                ParentFont = False
                Spacing = 0
                OnClick = sbnIncluirCashBackCargosClick
              end
              object sbnExcluirPCashBackCargos: TSpeedButton
                Left = 2
                Top = 56
                Width = 28
                Height = 22
                Hint = 'Excluir produto'
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
                OnClick = sbnExcluirPCashBackCargosClick
              end
            end
          end
          object AdvTabSheetFiliais: TAdvTabSheet
            Caption = 'Filiais'
            Color = clBtnFace
            ColorTo = clNone
            TabColor = clBtnFace
            TabColorTo = clNone
            object DBAdvGridFiliais: TDBAdvGrid
              Left = 0
              Top = 0
              Width = 815
              Height = 224
              Cursor = crDefault
              Align = alClient
              ColCount = 4
              RowCount = 2
              FixedRows = 1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Pitch = fpVariable
              Font.Style = []
              Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
              ParentFont = False
              PopupMenu = AdvPopupMenu1
              ScrollBars = ssBoth
              TabOrder = 0
              OnKeyDown = DBAdvGridFiliaisKeyDown
              OnGetEditorType = DBAdvGridFiliaisGetEditorType
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
              FixedRowHeight = 22
              FixedFont.Charset = DEFAULT_CHARSET
              FixedFont.Color = clWindowText
              FixedFont.Height = -11
              FixedFont.Name = 'Tahoma'
              FixedFont.Style = [fsBold]
              FloatFormat = '%.2f'
              Navigation.AdvanceInsert = True
              Navigation.AllowClipboardShortCuts = True
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
                  EditLink = FormControlEditLink1
                  Editor = edCustom
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
                  Width = 55
                end
                item
                  Borders = []
                  BorderPen.Color = clSilver
                  CheckFalse = 'N'
                  CheckTrue = 'Y'
                  Color = clWindow
                  Editor = edNone
                  FieldName = 'nomefilial'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
                  Font.Name = 'Tahoma'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  Header = 'Nome da Filial'
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
                  Width = 670
                end
                item
                  Alignment = taCenter
                  Borders = []
                  BorderPen.Color = clSilver
                  CheckFalse = 'N'
                  CheckTrue = 'Y'
                  Color = clWindow
                  Editor = edCheckBox
                  FieldName = 'exceto'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
                  Font.Name = 'Tahoma'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  Header = 'Exceto'
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
                  Width = 46
                end>
              DataSource = dtmCadastroTabelasEstoques.dsrCashBackFiliais
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
                55
                670
                46)
            end
            object Panel7: TPanel
              Left = 815
              Top = 0
              Width = 30
              Height = 224
              Align = alRight
              BevelOuter = bvNone
              TabOrder = 1
              object sbnIncluirCashBackFiliais: TSpeedButton
                Left = 2
                Top = 26
                Width = 28
                Height = 28
                Hint = 'Inclui um novo Registro'
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
                Layout = blGlyphTop
                NumGlyphs = 2
                ParentFont = False
                Spacing = 0
                OnClick = sbnIncluirCashBackFiliaisClick
              end
              object sbnExcluirPCashBackFiliais: TSpeedButton
                Left = 2
                Top = 56
                Width = 28
                Height = 22
                Hint = 'Excluir produto'
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
                OnClick = sbnExcluirPCashBackFiliaisClick
              end
            end
          end
        end
        object pnlTopCashBack: TPanel
          Left = 0
          Top = 0
          Width = 853
          Height = 161
          Align = alTop
          TabOrder = 0
          object gbxValidadeSaldo: TGroupBox
            Left = 324
            Top = 110
            Width = 123
            Height = 42
            Caption = 'Dias validade saldo'
            TabOrder = 6
            object DBAdvSpinEdit1: TDBAdvSpinEdit
              Left = 4
              Top = 16
              Width = 116
              Height = 24
              AllowNullValue = False
              ReturnIsTab = True
              Value = 0
              DateValue = 45807.736699502310000000
              HexValue = 0
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              IncrementFloat = 0.100000000000000000
              IncrementFloatPage = 1.000000000000000000
              LabelFont.Charset = DEFAULT_CHARSET
              LabelFont.Color = clWindowText
              LabelFont.Height = -11
              LabelFont.Name = 'MS Sans Serif'
              LabelFont.Style = []
              MaxValue = 365
              ParentFont = False
              TabOrder = 0
              Visible = True
              Version = '1.5.1.2'
              DataField = 'validadedosaldo'
              DataSource = dtmCadastroTabelasEstoques.dsrCashBack
            end
          end
          object gbxCashBack: TGroupBox
            Left = 6
            Top = 2
            Width = 75
            Height = 36
            Caption = ' C'#211'DIGO '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            inline fraConsultaCodigoCashBack: TfraConsultaCodigo
              Left = 5
              Top = 10
              Width = 68
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
                Visible = False
              end
              inherited dtxDescricao: TtecDBText
                Left = 58
                Width = 5
                Visible = False
              end
              inherited edfCodigo: TtecDBFindLookup
                Width = 66
                DataField = 'codigo'
                DataSource = dtmCadastroTabelasEstoques.dsrCashBack
                Group = 'CashBack'
                OnFound = nil
                LookupField = 'codigo'
                LookupSource = fraConsultaClassificacaoIPI.dsrProcuraCashBack
                LookupQueryParameter = 'codigo'
                Parameter = 'codigo'
                ActiveSetControls = True
                DenyInsert = True
                NoSetControls = <>
                SetControls = <>
                LookupParameter = 'codigo'
              end
            end
          end
          object gbxDescricaoCashBack: TGroupBox
            Left = 88
            Top = 2
            Width = 547
            Height = 36
            Caption = ' DESCRI'#199#195'O '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            object edtDescricaoCashBack: TDBEditTexto
              Left = 2
              Top = 10
              Width = 540
              Height = 23
              DataField = 'descricao'
              DataSource = dtmCadastroTabelasEstoques.dsrCashBack
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              MaxLength = -1
              ParentFont = False
              TabOrder = 0
              CharCasenoDefault = False
              Alignment = taLeftJustify
            end
          end
          object gbxvalidadeinicial: TGroupBox
            Left = 6
            Top = 40
            Width = 180
            Height = 41
            Caption = 'Validade Inicial'
            TabOrder = 2
            object AdvDBDateTimePickervalidadeinicial: TAdvDBDateTimePicker
              Left = 5
              Top = 16
              Width = 169
              Height = 22
              Date = 44426.466990740740000000
              Time = 44426.466990740740000000
              ShowCheckbox = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Pitch = fpVariable
              Font.Style = []
              Kind = dkDateTime
              ParentFont = False
              TabOrder = 0
              BorderStyle = bsSingle
              Ctl3D = True
              DateTime = 44426.466990740740000000
              TimeFormat = 'HH:mm'
              Version = '1.2.0.1'
              LabelAlwaysEnabled = True
              LabelFont.Charset = DEFAULT_CHARSET
              LabelFont.Color = clWindowText
              LabelFont.Height = -11
              LabelFont.Name = 'MS Sans Serif'
              LabelFont.Style = []
              DataField = 'validadeinicial'
              DataSource = dtmCadastroTabelasEstoques.dsrCashBack
            end
          end
          object gbxvalidadeFinal: TGroupBox
            Left = 190
            Top = 40
            Width = 180
            Height = 41
            Caption = 'Validade Final'
            TabOrder = 3
            object AdvDBDateTimePickervalidadeFinal: TAdvDBDateTimePicker
              Left = 5
              Top = 16
              Width = 169
              Height = 22
              Date = 44426.466990740740000000
              Time = 44426.466990740740000000
              ShowCheckbox = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Pitch = fpVariable
              Font.Style = []
              Kind = dkDateTime
              ParentFont = False
              TabOrder = 0
              BorderStyle = bsSingle
              Ctl3D = True
              DateTime = 44426.466990740740000000
              TimeFormat = 'HH:mm'
              Version = '1.2.0.1'
              LabelAlwaysEnabled = True
              LabelFont.Charset = DEFAULT_CHARSET
              LabelFont.Color = clWindowText
              LabelFont.Height = -11
              LabelFont.Name = 'MS Sans Serif'
              LabelFont.Style = []
              DataField = 'validadefinal'
              DataSource = dtmCadastroTabelasEstoques.dsrCashBack
            end
          end
          inline fraCashBack: TfraComissao
            Left = 7
            Top = 85
            Width = 177
            Height = 66
            HorzScrollBar.Range = 143
            HorzScrollBar.Visible = False
            VertScrollBar.Range = 74
            VertScrollBar.Visible = False
            AutoScroll = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            inherited gbxComissao: TGroupBox
              Top = 1
              Width = 169
              Height = 66
              Caption = 'Cash Back'
              Font.Height = -12
              inherited lblComissao: TLabel
                Left = 63
                Top = 23
                Width = 66
                Height = 14
                Font.Height = -11
                ParentFont = False
              end
              inherited dtxComissao: TDBEditNumero
                Left = 63
                Top = 36
                Width = 98
                Height = 23
                Font.Height = -12
                Text = 'dtxComissao'
                DataField = 'valorcashback'
                DataSource = dtmCadastroTabelasEstoques.dsrCashBack
              end
              inherited rgpTipoComissao: TtecDBRadioGroup
                Left = 4
                Top = 15
                Width = 54
                Height = 47
                Font.Height = -11
                ParentFont = False
                DataField = 'tipo'
                DataSource = dtmCadastroTabelasEstoques.dsrCashBack
                inherited rbnPercentual: TtecRadioButton
                  Left = 8
                  Top = 13
                  Height = 15
                  Font.Height = -9
                end
                inherited rbnValor: TtecRadioButton
                  Left = 8
                  Top = 28
                  Width = 39
                  Font.Height = -9
                end
              end
            end
          end
          object gbxCompraMinima: TGroupBox
            Left = 184
            Top = 110
            Width = 134
            Height = 42
            Caption = 'Compra M'#237'nima'
            TabOrder = 5
            object DBAdvMoneyEdit1: TDBAdvMoneyEdit
              Left = 6
              Top = 15
              Width = 121
              Height = 23
              AllowNumericNullValue = True
              EditAlign = eaRight
              EditType = etFloat
              ReturnIsTab = True
              Precision = 2
              LabelFont.Charset = DEFAULT_CHARSET
              LabelFont.Color = clWindowText
              LabelFont.Height = -11
              LabelFont.Name = 'MS Sans Serif'
              LabelFont.Style = []
              Lookup.Separator = ';'
              Color = clWindow
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              Text = '0,00'
              Visible = True
              Version = '1.1.2.1'
              CalculatorLook.ButtonWidth = 24
              CalculatorLook.ButtonHeight = 24
              CalculatorLook.ButtonColor = clSilver
              CalculatorLook.Color = clWhite
              CalculatorLook.Flat = False
              CalculatorLook.Font.Charset = DEFAULT_CHARSET
              CalculatorLook.Font.Color = clWindowText
              CalculatorLook.Font.Height = -11
              CalculatorLook.Font.Name = 'MS Sans Serif'
              CalculatorLook.Font.Style = []
              DataField = 'compraminima'
              DataSource = dtmCadastroTabelasEstoques.dsrCashBack
            end
          end
          object pnlEdicaoDados: TPanel
            Left = 220
            Top = 83
            Width = 75
            Height = 22
            AutoSize = True
            TabOrder = 8
            inline fraConsulta_: TfraConsultaCodigo
              Left = 1
              Top = 1
              Width = 73
              Height = 20
              HorzScrollBar.Range = 249
              HorzScrollBar.Visible = False
              VertScrollBar.Range = 23
              VertScrollBar.Visible = False
              AutoScroll = False
              BiDiMode = bdLeftToRight
              Ctl3D = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentBiDiMode = False
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 0
              Visible = False
              inherited sbnProcura: TSpeedButton
                Left = 50
                Top = -1
                Height = 21
              end
              inherited dtxDescricao: TtecDBText
                Left = 58
                Width = 0
                DataField = 'descricao'
                DataSource = fraConsulta_.dsrProcuraTipoProduto
              end
              inherited edfCodigo: TtecDBFindLookup
                Top = -1
                Width = 50
                MaxLength = 4
                Parameter = ' '
                ActiveSetControls = False
                DenyInsert = False
                NoSetControls = <>
                SetControls = <>
                LookupParameter = ' '
              end
              inherited qryProcuraTipoProduto: TtecQuery
                Options = [doAutoFillDefs]
                ParamData = <
                  item
                    DataType = ftString
                    Name = 'codigo'
                    ParamType = ptUnknown
                    Value = ''
                  end>
              end
            end
          end
          object gbxDisponibilidadeSaldo: TGroupBox
            Left = 452
            Top = 110
            Width = 133
            Height = 42
            Caption = 'Disponiblidade saldo'
            TabOrder = 7
            object DBAdvSpinEdit2: TDBAdvSpinEdit
              Left = 4
              Top = 16
              Width = 125
              Height = 24
              AllowNullValue = False
              ReturnIsTab = True
              Value = 0
              DateValue = 45807.736699756950000000
              HexValue = 0
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              IncrementFloat = 0.100000000000000000
              IncrementFloatPage = 1.000000000000000000
              LabelFont.Charset = DEFAULT_CHARSET
              LabelFont.Color = clWindowText
              LabelFont.Height = -11
              LabelFont.Name = 'MS Sans Serif'
              LabelFont.Style = []
              MaxValue = 365
              ParentFont = False
              TabOrder = 0
              Visible = True
              Version = '1.5.1.2'
              DataField = 'disponibilidadedosaldo'
              DataSource = dtmCadastroTabelasEstoques.dsrCashBack
            end
          end
          object rgpSite: TtecDBRadioGroup
            Left = 595
            Top = 77
            Width = 93
            Height = 76
            Caption = 'Site'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 9
            TabStop = False
            DataField = 'site'
            DataSource = dtmCadastroTabelasEstoques.dsrCashBack
            object rbnSim: TtecRadioButton
              Left = 8
              Top = 20
              Width = 49
              Height = 17
              Caption = 'Sim'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              Value = 'Sim'
            end
            object rbnNao: TtecRadioButton
              Left = 8
              Top = 37
              Width = 49
              Height = 17
              Caption = 'N'#227'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              Value = 'Nao'
            end
            object rbnSomente: TtecRadioButton
              Left = 8
              Top = 54
              Width = 73
              Height = 17
              Caption = 'Somente'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              Value = 'Somente'
            end
          end
        end
      end
      object tstMarcas: TTabSheet
        Caption = 'Marca&s'
        ImageIndex = 7
        object gbxCodigoMarca: TGroupBox
          Left = 6
          Top = 6
          Width = 65
          Height = 36
          Caption = 'C'#211'DIGO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object edfMarca: TtecDbEditFind
            Left = 2
            Top = 10
            Width = 60
            Height = 23
            Alignment = taLeftJustify
            DataField = 'codigo'
            DataSource = dtmCadastroTabelasEstoques.dsrMarcas
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Group = 'Marcas'
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
            ActiveSetControls = True
            DenyInsert = True
            NoSetControls = <>
            SetControls = <>
          end
        end
        object gbxDescricaoMarca: TGroupBox
          Left = 6
          Top = 48
          Width = 350
          Height = 36
          Caption = ' DESCRI'#199#195'O '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          object edtDescricaoMarcas: TDBEditTexto
            Left = 2
            Top = 10
            Width = 345
            Height = 23
            DataField = 'descricao'
            DataSource = dtmCadastroTabelasEstoques.dsrMarcas
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            MaxLength = -1
            ParentFont = False
            TabOrder = 0
            CharCasenoDefault = False
            Alignment = taLeftJustify
          end
        end
        object gbxInativoMarca: TGroupBox
          Left = 281
          Top = 6
          Width = 75
          Height = 36
          Caption = ' INATIVO '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          object edtInativoMarcas: TDBEditData
            Left = 2
            Top = 10
            Width = 70
            Height = 23
            Alignment = taCenter
            DataField = 'inativo'
            DataSource = dtmCadastroTabelasEstoques.dsrMarcas
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            MaxLength = -1
            Maximo = 0
            Minimo = 37353
            Adicional = 0
            ParentFont = False
            TabOrder = 0
            Opcional = True
          end
        end
        object gbxObservaocoesProdutosMarcas: TGroupBox
          Left = 0
          Top = 299
          Width = 853
          Height = 130
          Align = alBottom
          Caption = ' OBSERVA'#199#213'ES DE VENDAS '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
          object mmoObservacaoProdutosVendasMarcas: TtecDBMemo
            Left = 2
            Top = 16
            Width = 849
            Height = 112
            Align = alClient
            DataField = 'observacoesvenda'
            DataSource = dtmCadastroTabelasEstoques.dsrMarcas
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
        object GroupBox5: TGroupBox
          Left = 0
          Top = 96
          Width = 853
          Height = 203
          Align = alBottom
          Caption = ' AGENDAMENTOS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          object dbgAgendamentoMarcasProdutos: TtecDBGrid
            Left = 2
            Top = 16
            Width = 820
            Height = 185
            Align = alClient
            DataSource = dtmCadastroTabelasEstoques.dsrMarcasAgendamentos
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgCancelOnExit]
            ParentFont = False
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clBlack
            TitleFont.Height = -12
            TitleFont.Name = 'helvetica'
            TitleFont.Pitch = fpVariable
            TitleFont.Style = []
            RowWrap = 60
            Large = False
            DoubleRowColor = True
            TitleMinHeight = 100
            CellHeights = 100
            StrippedColor = 16054260
            CanDelete = True
            CanNotInsertFromGrid = False
            PostOnEnter = True
            PostOnSetUpDown = True
            DenySort = False
            DefaultRowHeight = 19
            ExibirNumerodaLinha = False
            NaoAtribuirDadosaTabelaaoDigitar = False
            ShowWhenFieldInvisible = False
            CanClickWhenEditing = False
            Columns = <
              item
                Expanded = False
                FieldName = 'dias'
                Title.Alignment = taCenter
                Title.Caption = 'DIAS'
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
                FieldName = 'observacoes'
                Title.Alignment = taCenter
                Title.Caption = 'OBSERVA'#199#213'ES'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 623
                Visible = True
              end>
          end
          object Panel2: TPanel
            Left = 822
            Top = 16
            Width = 29
            Height = 185
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 1
            object sbnExcluirMarcasAgendamentos: TSpeedButton
              Left = 2
              Top = 21
              Width = 23
              Height = 22
              Hint = 'Excluir produto'
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
              OnClick = sbnExcluirMarcasAgendamentosClick
            end
          end
        end
      end
      object tstModelos: TTabSheet
        Caption = '&Modelos'
        ImageIndex = 12
        object gbxCodigoModelo: TGroupBox
          Left = 6
          Top = 6
          Width = 70
          Height = 36
          Caption = 'C'#211'DIGO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object gbxEspecificacao: TGroupBox
          Left = 6
          Top = 47
          Width = 350
          Height = 36
          Caption = ' ESPECIFICA'#199#195'O '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          object edtEspecificacao: TDBEditTexto
            Left = 2
            Top = 10
            Width = 345
            Height = 23
            DataField = 'especificacao'
            DataSource = dtmCadastroTabelasEstoques.dsrModelos
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            MaxLength = 16
            ParentFont = False
            TabOrder = 0
            CharCasenoDefault = False
            Alignment = taLeftJustify
          end
        end
        object gbxObservacaoModelo: TGroupBox
          Left = 0
          Top = 83
          Width = 853
          Height = 346
          Align = alBottom
          Caption = ' DESCRI'#199#195'O DETALHADA DO MODELO '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          object mmoDescricaoModelo: TtecDBMemo
            Left = 2
            Top = 14
            Width = 849
            Height = 330
            Align = alClient
            DataField = 'observacao'
            DataSource = dtmCadastroTabelasEstoques.dsrModelos
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            MaxLength = 100
            ParentFont = False
            TabOrder = 0
          end
        end
        object gbxDescricaModelo: TGroupBox
          Left = 84
          Top = 6
          Width = 270
          Height = 36
          Caption = ' DESCRI'#199#195'O '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          object edtDescricaoModelo: TDBEditTexto
            Left = 2
            Top = 10
            Width = 265
            Height = 23
            DataField = 'descricao'
            DataSource = dtmCadastroTabelasEstoques.dsrModelos
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            MaxLength = 18
            ParentFont = False
            TabOrder = 0
            CharCasenoDefault = False
            Alignment = taLeftJustify
          end
        end
        object edfCodigoModelo: TtecDBFindLookup
          Left = 8
          Top = 16
          Width = 65
          Height = 23
          Alignment = taLeftJustify
          DataField = 'codigo'
          DataSource = dtmCadastroTabelasEstoques.dsrModelos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          Group = 'Modelo'
          MaxLength = 4
          Maximo = 0
          Minimo = 37353
          Adicional = 0
          Opcional = True
          ParentFont = False
          TabOrder = 1
          PermitirZero = False
          PermitirNulo = False
          Operacao = opPESQUISA
          Parameter = 'codigo'
          ActiveSetControls = True
          DenyInsert = False
          NoSetControls = <
            item
              Control = gbxCodigoModelo
            end>
          SetControls = <>
        end
      end
      object tstGruposFornecedores: TTabSheet
        Caption = 'Grupos Fornece&dores'
        ImageIndex = 8
        object gbxCodGrupoFornecedor: TGroupBox
          Left = 6
          Top = 6
          Width = 65
          Height = 36
          Caption = ' C'#211'DIGO '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object edfCodigoGruposFornecedores: TtecDbEditFind
            Left = 2
            Top = 10
            Width = 60
            Height = 23
            Alignment = taLeftJustify
            DataField = 'codigo'
            DataSource = dtmCadastroTabelasEstoques.dsrGruposFornecedores
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Group = 'GruposFornecedores'
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
            ActiveSetControls = True
            DenyInsert = True
            NoSetControls = <>
            SetControls = <>
          end
        end
        object gbxDescricaoGrupoFornecedor: TGroupBox
          Left = 6
          Top = 48
          Width = 350
          Height = 36
          Caption = ' DESCRI'#199#195'O '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          object edtDescricaoGruposFornecedores: TDBEditTexto
            Left = 2
            Top = 10
            Width = 345
            Height = 23
            DataField = 'nome'
            DataSource = dtmCadastroTabelasEstoques.dsrGruposFornecedores
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            MaxLength = -1
            ParentFont = False
            TabOrder = 0
            CharCasenoDefault = False
            Alignment = taLeftJustify
          end
        end
        object gbxInativoGrupoFornecedor: TGroupBox
          Left = 281
          Top = 6
          Width = 75
          Height = 36
          Caption = ' INATIVO '
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
      object tstFatorPreco: TTabSheet
        Caption = '&Moedas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ImageIndex = 9
        ParentFont = False
        object gbxCodigoMoeda: TGroupBox
          Left = 6
          Top = 6
          Width = 65
          Height = 36
          Caption = ' MOEDA '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object edfCodigoFator: TtecDbEditFind
            Left = 2
            Top = 10
            Width = 60
            Height = 23
            Alignment = taLeftJustify
            CharCase = ecUpperCase
            DataField = 'codigo'
            DataSource = dtmCadastroTabelasEstoques.dsrFatoresPreco
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Group = 'FatoresPreco'
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
            ActiveSetControls = True
            DenyInsert = False
            NoSetControls = <>
            SetControls = <>
          end
        end
        object gbxDescricaoMoeda: TGroupBox
          Left = 6
          Top = 48
          Width = 350
          Height = 36
          Caption = ' NOME DA MOEDA '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          object edtDescricaoFator: TDBEditTexto
            Left = 2
            Top = 10
            Width = 345
            Height = 23
            DataField = 'descricao'
            DataSource = dtmCadastroTabelasEstoques.dsrFatoresPreco
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            MaxLength = -1
            ParentFont = False
            TabOrder = 0
            CharCasenoDefault = False
            Alignment = taLeftJustify
          end
        end
        object gbxInativoMoeda: TGroupBox
          Left = 281
          Top = 6
          Width = 75
          Height = 36
          Caption = ' INATIVO '
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
      object tstGradesProdutos: TTabSheet
        Caption = 'Grades de produtos'
        ImageIndex = 10
        object gbxCodigoGrade: TGroupBox
          Left = 6
          Top = 6
          Width = 110
          Height = 36
          Caption = ' C'#211'DIGO '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object edfGradesProdutos: TtecDbEditFind
            Left = 2
            Top = 10
            Width = 105
            Height = 23
            Alignment = taLeftJustify
            DataField = 'codigo'
            DataSource = dtmCadastroTabelasEstoques.dsrGrades
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Group = 'Grades'
            MaxLength = 6
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
            ActiveSetControls = True
            DenyInsert = True
            NoSetControls = <>
            SetControls = <>
          end
        end
        object gbxDescricaoGrade: TGroupBox
          Left = 6
          Top = 47
          Width = 369
          Height = 36
          Caption = ' DESCRI'#199#195'O '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          object edtDescricaoGrade: TDBEditTexto
            Left = 2
            Top = 10
            Width = 362
            Height = 23
            DataField = 'descricao'
            DataSource = dtmCadastroTabelasEstoques.dsrGrades
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            MaxLength = -1
            ParentFont = False
            TabOrder = 0
            CharCasenoDefault = False
            Alignment = taLeftJustify
          end
        end
        object gbxElementos: TGroupBox
          Left = 6
          Top = 128
          Width = 811
          Height = 301
          Caption = ' ELEMENTOS DA GRADE '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
          object sbnExcluirElementoGrade: TSpeedButton
            Left = 780
            Top = 26
            Width = 23
            Height = 22
            Hint = 'Exclui o elemento da grade'
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
          object dbgElementosGrade: TtecDBGrid
            Left = 2
            Top = 16
            Width = 775
            Height = 283
            Align = alLeft
            DataSource = dtmCadastroTabelasEstoques.dsrElementosGrade
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clBlack
            TitleFont.Height = -9
            TitleFont.Name = 'helvetica'
            TitleFont.Pitch = fpVariable
            TitleFont.Style = []
            OnDrawColumnCell = dbgElementosGradeDrawColumnCell
            OnDblClick = dbgElementosGradeDblClick
            OnKeyDown = dbgElementosGradeKeyDown
            OnKeyPress = dbgElementosGradeKeyPress
            RowWrap = 60
            Large = False
            DoubleRowColor = False
            MsgDelete = 'o elemento de grade'
            TitleMinHeight = 100
            CellHeights = 100
            StrippedColor = 16054260
            CanDelete = False
            CanNotInsertFromGrid = False
            PostOnEnter = True
            PostOnSetUpDown = True
            DenySort = False
            DefaultRowHeight = 19
            ExibirNumerodaLinha = False
            NaoAtribuirDadosaTabelaaoDigitar = False
            ShowWhenFieldInvisible = False
            CanClickWhenEditing = False
            Columns = <
              item
                Expanded = False
                FieldName = 'valor'
                Title.Alignment = taCenter
                Title.Caption = 'VALOR / DESCRI'#199#195'O'
                Width = 269
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'nome_site'
                Title.Alignment = taCenter
                Title.Caption = 'NOME NO SITE'
                Width = 300
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'cor'
                ReadOnly = True
                Title.Alignment = taCenter
                Title.Caption = 'COR'
                Width = 30
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ordem'
                Title.Alignment = taCenter
                Title.Caption = 'ORDEM'
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'usual'
                Title.Caption = 'USUAL'
                Width = 40
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'emuso'
                ReadOnly = True
                Title.Alignment = taCenter
                Title.Caption = 'EM USO'
                Visible = True
              end>
          end
        end
        object gbxInativoGrade: TGroupBox
          Left = 300
          Top = 6
          Width = 75
          Height = 36
          Caption = 'INATIVO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object gbxNomeSite: TGroupBox
          Left = 6
          Top = 87
          Width = 369
          Height = 36
          Caption = ' NOME NO SITE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          object edtnome_site: TDBEditTexto
            Left = 2
            Top = 10
            Width = 362
            Height = 23
            DataField = 'nome_site'
            DataSource = dtmCadastroTabelasEstoques.dsrGrades
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            MaxLength = -1
            ParentFont = False
            TabOrder = 0
            CharCasenoDefault = False
            Alignment = taLeftJustify
          end
        end
      end
      object tstAtributos: TTabSheet
        Caption = 'Atributos'
        ImageIndex = 15
        object pnlAtributos_Produtos_Items: TPanel
          Left = 0
          Top = 49
          Width = 853
          Height = 380
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object DBAdvGridAtributos_Produtos_Items: TDBAdvGrid
            Left = 0
            Top = 0
            Width = 823
            Height = 380
            Cursor = crDefault
            Align = alClient
            ColCount = 4
            RowCount = 2
            FixedRows = 1
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Pitch = fpVariable
            Font.Style = []
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
            ParentFont = False
            ScrollBars = ssBoth
            TabOrder = 0
            OnKeyDown = DBAdvGridAtributos_Produtos_ItemsKeyDown
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
                FieldName = 'nome'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Pitch = fpVariable
                Font.Style = []
                Header = 'Atributo'
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
                Width = 183
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
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Pitch = fpVariable
                Font.Style = []
                Header = 'Descri'#231#227'o'
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
                Width = 489
              end
              item
                Borders = []
                BorderPen.Color = clSilver
                CheckFalse = 'N'
                CheckTrue = 'Y'
                Color = clWindow
                ComboItems.Strings = (
                  'Texto'
                  'Num'#233'rico'
                  'Inteiro'
                  'Data'
                  'Sim/N'#227'o')
                Editor = edComboList
                FieldName = 'tipo'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Pitch = fpVariable
                Font.Style = []
                Header = 'Tipo'
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
                Width = 104
              end>
            DataSource = dtmCadastroTabelasEstoques.dsrAtributos_Produtos_Items
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
            OnCheckRequiredFields = DBAdvGridAtributos_Produtos_ItemsCheckRequiredFields
            ColWidths = (
              20
              183
              489
              104)
          end
          object pnBotoeslAtributos_Produtos_Items: TPanel
            Left = 823
            Top = 0
            Width = 30
            Height = 380
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 1
            object sbnIncluirAtributos_Produtos_Items: TSpeedButton
              Left = 2
              Top = 26
              Width = 28
              Height = 28
              Hint = 'Inclui um novo Registro'
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
              Layout = blGlyphTop
              NumGlyphs = 2
              ParentFont = False
              Spacing = 0
              OnClick = sbnIncluirAtributos_Produtos_ItemsClick
            end
            object sbnExcluirAtributos_Produtos_Items: TSpeedButton
              Left = 2
              Top = 56
              Width = 28
              Height = 22
              Hint = 'Excluir produto'
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
              OnClick = sbnExcluirAtributos_Produtos_ItemsClick
            end
          end
        end
        object pnlAtributos_Produtos: TPanel
          Left = 0
          Top = 0
          Width = 853
          Height = 49
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object GroupBoxDescricaoAtributo: TGroupBox
            Left = 84
            Top = 10
            Width = 738
            Height = 36
            Caption = ' DESCRI'#199#195'O '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            object edtDescricaoAtributo: TDBEditTexto
              Left = 2
              Top = 10
              Width = 732
              Height = 23
              DataField = 'descricao'
              DataSource = dtmCadastroTabelasEstoques.dsrAtributos_Produtos
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              MaxLength = -1
              ParentFont = False
              TabOrder = 0
              CharCasenoDefault = False
              Alignment = taLeftJustify
            end
          end
          object GroupBoxCodigoAtributo: TGroupBox
            Left = 4
            Top = 10
            Width = 77
            Height = 36
            Caption = ' C'#211'DIGO '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            inline fraConsultaCodigoAtributos: TfraConsultaCodigo
              Left = 3
              Top = 10
              Width = 71
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
                Visible = False
              end
              inherited dtxDescricao: TtecDBText
                Left = 58
                Width = 5
                Visible = False
              end
              inherited edfCodigo: TtecDBFindLookup
                Width = 70
                DataField = 'codigo'
                DataSource = dtmCadastroTabelasEstoques.dsrAtributos_Produtos
                Group = 'Atributos'
                OnFound = nil
                LookupField = 'codigo'
                LookupSource = fraConsultaCodigoAtributos.dsrProcuraAtributos
                LookupQueryParameter = 'codigo'
                Parameter = 'codigo'
                ActiveSetControls = True
                DenyInsert = True
                NoSetControls = <>
                SetControls = <>
                LookupParameter = 'codigo'
              end
            end
          end
        end
      end
    end
  end
  object ColorDialog1: TColorDialog
    Left = 652
    Top = 91
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
    WantKeyReturn = True
    WantKeyEscape = False
    Control = pnlEdicaoDados
    OnSetEditorFocus = FormControlEditLink1SetEditorFocus
    Left = 684
    Top = 94
  end
  object AdvGridExcelIO1: TAdvGridExcelIO
    AdvStringGrid = DBAdvGridProdutos
    Options.ExportOverwriteMessage = 'File %s already exists'#13'Ok to overwrite ?'
    Options.ExportRawRTF = False
    Options.ExportShowInExcel = True
    UseUnicode = False
    Version = '3.4.1'
    Left = 342
    Top = 350
  end
  object AdvPopupMenu1: TAdvPopupMenu
    Version = '2.5.4.0'
    Left = 440
    Top = 366
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
  object AdvGridFindDialog1: TAdvGridFindDialog
    AutoPosition = False
    Grid = DBAdvGridProdutos
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
    Left = 206
    Top = 350
  end
end
