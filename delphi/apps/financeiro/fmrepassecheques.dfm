inherited frmrepassecheques: Tfrmrepassecheques
  Left = 364
  Top = 78
  Action = actHabilita
  ActiveControl = fraListaFiliais1.clbFiliais
  Caption = 'Repasse de Cheques'
  ClientHeight = 558
  ClientWidth = 937
  FormStyle = fsMDIChild
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBarra: TPanel
    Left = 576
    Top = 10
    Width = 161
    Height = 31
    inherited bvlBotoesEd: TBevel
      Height = 36
    end
    object bvlCheques: TBevel
      Left = 230
      Top = 3
      Width = 3
      Height = 36
    end
  end
  object pnlFundoJanela: TPanel [1]
    Left = 0
    Top = 45
    Width = 937
    Height = 513
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 3
    TabOrder = 2
    object pgcRepasseCheques: TPageControl
      Left = 3
      Top = 3
      Width = 931
      Height = 507
      Hint = 'Defini'#231#227'o dos cheques para repasse'
      ActivePage = tstSelecao
      Align = alClient
      TabOrder = 0
      OnChange = pgcRepasseChequesChange
      object tstSelecao: TTabSheet
        Caption = ' &1 - Sele'#231#227'o'
        ImageIndex = 1
        object gbxFundoJanela: TGroupBox
          Left = 0
          Top = 0
          Width = 923
          Height = 476
          Align = alClient
          TabOrder = 0
          object gbxPeriodo: TGroupBox
            Left = 329
            Top = 2
            Width = 160
            Height = 36
            Caption = 'DATAS DE VENCIMENTO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            object lblA: TLabel
              Left = 76
              Top = 14
              Width = 7
              Height = 16
              Caption = 'a'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
            end
            object edtterminoPeriodo: TEditData
              Left = 87
              Top = 10
              Width = 70
              Height = 23
              Hint = 'Data final de vencimento'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              MaxLength = 10
              ParentFont = False
              TabOrder = 1
              OnEnter = edtterminoPeriodoEnter
              Minimo = 37353
              Maximo = 37353
            end
            object edtInicioPeriodo: TEditData
              Left = 2
              Top = 10
              Width = 70
              Height = 23
              Hint = 'Data inicial de vencimento'
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
              Maximo = 37353
            end
          end
          object dbgPesquisa: TtecDBGrid
            Left = 5
            Top = 160
            Width = 856
            Height = 246
            Hint = 'Cheques dispon'#237'veis para repasse'
            DataSource = dtmrepassecheques.dsrCheques
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            ReadOnly = True
            TabOrder = 5
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clBlack
            TitleFont.Height = -13
            TitleFont.Name = 'helvetica'
            TitleFont.Pitch = fpVariable
            TitleFont.Style = []
            OnDrawColumnCell = dbgPesquisaDrawColumnCell
            OnDblClick = dbgPesquisaDblClick
            OnKeyDown = dbgPesquisaKeyDown
            RowWrap = 60
            Large = False
            DoubleRowColor = False
            TitleMinHeight = 50
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
                FieldName = 'banco'
                Title.Alignment = taCenter
                Title.Caption = 'BANCO'
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
                FieldName = 'agencia'
                Title.Alignment = taCenter
                Title.Caption = 'AG'#202'NCIA'
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
                Alignment = taCenter
                Expanded = False
                FieldName = 'conta'
                Title.Alignment = taCenter
                Title.Caption = 'CONTA'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 77
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'cheque'
                Title.Alignment = taCenter
                Title.Caption = 'CHEQUE'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 53
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
                FieldName = 'vencto'
                Title.Alignment = taCenter
                Title.Caption = 'VENCIMENTO'
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
                FieldName = 'valor'
                Title.Alignment = taCenter
                Title.Caption = 'VALOR'
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
                Title.Alignment = taCenter
                Title.Caption = 'CLIENTE'
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
                Alignment = taCenter
                Expanded = False
                FieldName = 'tipocliente'
                Title.Alignment = taCenter
                Title.Caption = 'T'
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
                FieldName = 'nomecliente'
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
                Alignment = taCenter
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
                FieldName = 'marcar'
                Title.Alignment = taCenter
                Title.Caption = 'OK'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 28
                Visible = True
              end>
          end
          object gbxSelecionados: TGroupBox
            Left = 5
            Top = 409
            Width = 155
            Height = 46
            Hint = 'N'#186' de cheques selecionados para repasse'
            Caption = 'SELECIONADOS'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 6
            object gbxQtdeSelecionados: TGroupBox
              Left = 0
              Top = 10
              Width = 52
              Height = 36
              Caption = 'QTDE'
              TabOrder = 0
              object edtQtdeCheques: TEditNumero
                Left = 2
                Top = 10
                Width = 47
                Height = 23
                TabStop = False
                Color = clBtnFace
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                MaxLength = -1
                ParentFont = False
                ReadOnly = True
                TabOrder = 0
                Mascara = False
                TipoMascara = tmGERAL
                NrDecimal = 2
                Decimais = False
                Negativo = False
                Tamanho = 6
              end
            end
            object gbxValorSelecionados: TGroupBox
              Left = 50
              Top = 10
              Width = 105
              Height = 36
              Caption = 'VALOR'
              TabOrder = 1
              object edtTotalCheques: TEditNumero
                Left = 2
                Top = 10
                Width = 100
                Height = 23
                TabStop = False
                Color = clBtnFace
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                MaxLength = -1
                ParentFont = False
                ReadOnly = True
                TabOrder = 0
                Mascara = True
                TipoMascara = tmGERAL
                NrDecimal = 2
                Decimais = True
                Negativo = False
                Tamanho = 9
              end
            end
          end
          object gbxMarcados: TGroupBox
            Left = 169
            Top = 409
            Width = 155
            Height = 46
            Hint = 'N'#186' de cheques marcados para  inclus'#227'o no repasse'
            Caption = 'MARCADOS'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 7
            object gbxQtdeMarcados: TGroupBox
              Left = -1
              Top = 10
              Width = 52
              Height = 36
              Caption = 'QTDE'
              TabOrder = 0
              object edtQtdeMarcados: TEditNumero
                Left = 2
                Top = 10
                Width = 47
                Height = 23
                TabStop = False
                Color = clBtnFace
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                MaxLength = -1
                ParentFont = False
                ReadOnly = True
                TabOrder = 0
                Mascara = False
                TipoMascara = tmGERAL
                NrDecimal = 2
                Decimais = False
                Negativo = False
                Tamanho = 6
              end
            end
            object gbxValorMarcados: TGroupBox
              Left = 50
              Top = 10
              Width = 105
              Height = 36
              Caption = 'VALOR'
              TabOrder = 1
              object edtTotalMarcados: TEditNumero
                Left = 2
                Top = 10
                Width = 100
                Height = 23
                TabStop = False
                Color = clBtnFace
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                MaxLength = -1
                ParentFont = False
                ReadOnly = True
                TabOrder = 0
                Mascara = True
                TipoMascara = tmGERAL
                NrDecimal = 2
                Decimais = True
                Negativo = False
                Tamanho = 9
              end
            end
          end
          object ckbSelecionarTodos: TCheckBox
            Left = 678
            Top = 420
            Width = 184
            Height = 16
            Hint = 'Marcar/desmarca todos os cheques'
            Caption = '&SELECIONAR TODOS OS CHEQUES'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 8
            OnClick = ckbSelecionarTodosClick
          end
          inline fraListaFiliais1: TfraListaFiliais
            Left = 0
            Top = 2
            Width = 319
            Height = 148
            TabOrder = 0
            inherited gbxFiliais: TGroupBox
              Width = 319
              Height = 148
              Caption = 'FILIAIS'
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              ParentFont = False
              inherited sbnMarcarFiliais: TSpeedButton
                Left = 290
                Top = 14
                Hint = 'Assinalar todas as filiais'
              end
              inherited sbnDesmarcarFiliais: TSpeedButton
                Left = 290
                Top = 38
                Hint = 'Desassinalar todas as filiais'
              end
              inherited clbFiliais: TCheckListBox
                Left = 2
                Top = 13
                Height = 133
                Hint = 'S'#243' cheques das filiais'
                Font.Height = -12
              end
            end
          end
          object gbxCliente: TGroupBox
            Left = 330
            Top = 42
            Width = 529
            Height = 37
            Caption = 'CLIENTE'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            inline fraConsultaClientes: TfraConsultaCodigo
              Left = 2
              Top = 10
              Width = 525
              Height = 23
              HorzScrollBar.Range = 524
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
                Hint = 'Procurar cliente'
              end
              inherited dtxDescricao: TtecDBText
                Width = 436
                DataField = 'nome'
                DataSource = fraConsultaClientes.dsrProcuraCliente
              end
              inherited edfCodigo: TtecDBFindLookup
                Hint = 'S'#243' cheques do cliente'
                DataField = 'codigo'
                DataSource = fraConsultaClientes.dsrProcuraCliente
                Group = 'Cliente'
                MaxLength = 8
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
          object gbxBanco: TGroupBox
            Left = 330
            Top = 80
            Width = 529
            Height = 37
            Caption = 'BANCO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            inline fraConsultaBancos: TfraConsultaCodigo
              Left = 2
              Top = 10
              Width = 524
              Height = 23
              HorzScrollBar.Range = 524
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
                Hint = 'Procurar banco'
              end
              inherited dtxDescricao: TtecDBText
                Width = 436
                DataField = 'Sigla'
                DataSource = fraConsultaBancos.dsrProcuraBanco
              end
              inherited edfCodigo: TtecDBFindLookup
                Hint = 'S'#243' cheques do banco'
                DataField = 'Codigo'
                DataSource = fraConsultaBancos.dsrProcuraBanco
                Group = 'BAnco'
                MaxLength = 8
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
          object gbxFaixaValores: TGroupBox
            Left = 499
            Top = 2
            Width = 197
            Height = 36
            Caption = 'FAIXA DE VALORES'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            object Label1: TLabel
              Left = 94
              Top = 14
              Width = 7
              Height = 16
              Caption = 'a'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
            end
            object edtValorInicial: TEditNumero
              Left = 2
              Top = 10
              Width = 89
              Height = 23
              Hint = 'Faixa inicial de valores'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              MaxLength = -1
              ParentFont = False
              TabOrder = 1
              Mascara = True
              Alignment = taLeftJustify
              TipoMascara = tmGERAL
              NrDecimal = 2
              Decimais = True
              Negativo = False
              Tamanho = 9
            end
            object edtValorFinal: TEditNumero
              Left = 105
              Top = 10
              Width = 89
              Height = 23
              Hint = 'Faixa final de valores'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              MaxLength = -1
              ParentFont = False
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
      object tstCadastro: TTabSheet
        Caption = ' &2 - Cadastro'
        object lblChequesEmVermelho: TLabel
          Left = 8
          Top = 433
          Width = 233
          Height = 12
          Caption = 'LINHA EM VERMELHO INDICA CHEQUE DEVOLVIDO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
        end
        object gbxNumero: TGroupBox
          Left = 1
          Top = 4
          Width = 67
          Height = 36
          Caption = 'REPASSE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object edfNumeroRepasse: TtecDbEditFind
            Left = 2
            Top = 10
            Width = 62
            Height = 23
            Hint = 'N'#186' do repasse'
            Alignment = taLeftJustify
            DataField = 'numero'
            DataSource = dtmrepassecheques.dsrRepasseCheques
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Group = 'RepasseCheques'
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
            ActiveSetControls = True
            DenyInsert = True
            NoSetControls = <
              item
                Control = tstSelecao
              end
              item
                Control = gbxNumero
              end>
            SetControls = <
              item
                Control = gbxDataEmissao
              end
              item
                Control = gbxFornecedor
              end
              item
                Control = gbxObservacao
              end
              item
                Control = gbxCheque
              end
              item
                Control = pnlOpcoesRepasseCheques
              end
              item
                Control = dbgChequesRepassados
              end>
          end
        end
        object gbxDataEmissao: TGroupBox
          Left = 73
          Top = 4
          Width = 82
          Height = 36
          Caption = 'DATA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          object edtDataEmissao: TDBEditData
            Left = 2
            Top = 10
            Width = 77
            Height = 23
            Hint = 'Data do repasse'
            Alignment = taLeftJustify
            DataField = 'data'
            DataSource = dtmrepassecheques.dsrRepasseCheques
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Maximo = 0
            Minimo = 37353
            Adicional = 0
            ParentFont = False
            TabOrder = 0
            Opcional = True
          end
        end
        object gbxFornecedor: TGroupBox
          Left = 1
          Top = 83
          Width = 456
          Height = 37
          Caption = 'FORNECEDOR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          inline fraConsultaFornecedor: TfraConsultaCodigo
            Left = 2
            Top = 10
            Width = 452
            Height = 23
            HorzScrollBar.Range = 451
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
            inherited dtxDescricao: TtecDBText
              Width = 363
              DataField = 'nome'
              DataSource = fraConsultaFornecedor.dsrProcuraCliente
            end
            inherited edfCodigo: TtecDBFindLookup
              Hint = 'Fornecedor ao qual foi feito o repasse'
              DataField = 'fornecedor'
              DataSource = dtmrepassecheques.dsrRepasseCheques
              MaxLength = 8
              LookupField = 'codigo'
              LookupSource = fraConsultaFornecedor.dsrProcuraCliente
              LookupQueryParameter = 'codigo'
              Parameter = ' '
              ActiveSetControls = False
              DenyInsert = True
              NoSetControls = <>
              SetControls = <>
              LookupParameter = 'codigo'
            end
          end
        end
        object gbxCheque: TGroupBox
          Left = 0
          Top = 200
          Width = 923
          Height = 224
          Caption = 'CHEQUES REPASSADOS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 5
          object dbgChequesRepassados: TtecDBGrid
            Left = 2
            Top = 15
            Width = 892
            Height = 248
            Hint = 'Rela'#231#227'o dos cheques repassados'
            DataSource = dtmrepassecheques.dsrChequesRepassados
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit]
            ParentFont = False
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clBlack
            TitleFont.Height = -13
            TitleFont.Name = 'helvetica'
            TitleFont.Pitch = fpVariable
            TitleFont.Style = []
            OnDrawColumnCell = dbgChequesRepassadosDrawColumnCell
            OnDblClick = dbgChequesRepassadosDblClick
            OnKeyDown = dbgChequesRepassadosKeyDown
            RowWrap = 60
            Large = False
            DoubleRowColor = False
            TitleMinHeight = 50
            CellHeights = 100
            StrippedColor = 16054260
            CanDelete = True
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
                FieldName = 'banco'
                Title.Alignment = taCenter
                Title.Caption = 'BANCO'
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
                FieldName = 'agencia'
                Title.Alignment = taCenter
                Title.Caption = 'AG'#202'NCIA'
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
                Alignment = taRightJustify
                Expanded = False
                FieldName = 'conta'
                Title.Alignment = taCenter
                Title.Caption = 'CONTA'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 77
                Visible = True
              end
              item
                Alignment = taRightJustify
                Expanded = False
                FieldName = 'numerocheque'
                Title.Alignment = taCenter
                Title.Caption = 'CHEQUE'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 53
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
                Width = 65
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'vencto'
                Title.Alignment = taCenter
                Title.Caption = 'VENCIMENTO'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 65
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'valor'
                Title.Alignment = taCenter
                Title.Caption = 'VALOR'
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
                Title.Alignment = taCenter
                Title.Caption = 'CLIENTE'
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
                FieldName = 'tipocliente'
                Title.Caption = 'T'
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
                FieldName = 'nomecliente'
                Title.Alignment = taCenter
                Title.Caption = 'NOME DO CLIENTE'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 153
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
                FieldName = 'devolvido'
                Title.Alignment = taCenter
                Title.Caption = 'DEVOLVIDO'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 65
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'nomedevolvedor'
                Title.Alignment = taCenter
                Title.Caption = 'POR'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 110
                Visible = True
              end>
          end
          object pnlOpcoesRepasseCheques: TPanel
            Left = 894
            Top = 16
            Width = 27
            Height = 206
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 1
            object sbnIncluirDuplicatas: TSpeedButton
              Left = 2
              Top = 3
              Width = 23
              Height = 23
              Hint = 'Incluir cheque'
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
              OnClick = sbnIncluirDuplicatasClick
            end
            object sbnExcluirChequesRepassados: TSpeedButton
              Left = 2
              Top = 26
              Width = 23
              Height = 23
              Hint = 'Excluir cheque'
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = [fsBold]
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
              Layout = blGlyphTop
              NumGlyphs = 2
              ParentFont = False
              OnClick = sbnExcluirChequesRepassadosClick
            end
            object sbnDevolverChequeRepassado: TSpeedButton
              Left = 2
              Top = 58
              Width = 23
              Height = 39
              Hint = 'Devolver cheque'
              Caption = 'D'
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = [fsBold]
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
              Layout = blGlyphTop
              NumGlyphs = 2
              ParentFont = False
              OnClick = sbnDevolverChequeRepassadoClick
            end
          end
        end
        object gbxObservacao: TGroupBox
          Left = 1
          Top = 122
          Width = 456
          Height = 76
          Caption = 'OBSERVA'#199#213'ES'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          object mmoObservacaoRepasse: TtecDBMemo
            Left = 2
            Top = 14
            Width = 452
            Height = 60
            Hint = 'Observa'#231#245'es do repasse'
            Align = alClient
            DataField = 'observacao'
            DataSource = dtmrepassecheques.dsrRepasseCheques
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
        object gbxRepassadoPor: TGroupBox
          Left = 463
          Top = 123
          Width = 457
          Height = 35
          Caption = 'REPASSADO POR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          object lblDataRepassadoPor: TLabel
            Left = 343
            Top = 0
            Width = 28
            Height = 12
            Caption = ' DATA '
          end
          object dtxNomeRepassador: TtecDBText
            Left = 49
            Top = 10
            Width = 284
            Height = 23
            Hint = 'Nomeo do respons'#225'vel pelo repasse'
            TabStop = False
            Color = clBtnFace
            DataField = 'nomerepassador'
            DataSource = dtmrepassecheques.dsrRepasseCheques
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
          object dtxCodigoRepassador: TtecDBText
            Left = 2
            Top = 10
            Width = 46
            Height = 23
            Hint = 'C'#243'digo do respons'#225'vel pelo repasse'
            TabStop = False
            Color = clBtnFace
            DataField = 'repassador'
            DataSource = dtmrepassecheques.dsrRepasseCheques
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
          object dtxDataRepasse: TtecDBText
            Left = 334
            Top = 10
            Width = 120
            Height = 23
            Hint = 'Data e hora da efetiva'#231#227'o do repasse'
            TabStop = False
            Color = clBtnFace
            DataField = 'datarepasse'
            DataSource = dtmrepassecheques.dsrRepasseCheques
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
            Alignment = taLeftJustify
          end
        end
        object gbxExcluidoPor: TGroupBox
          Left = 463
          Top = 163
          Width = 457
          Height = 35
          Caption = 'CANCELADO POR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 7
          object Label4: TLabel
            Left = 343
            Top = 0
            Width = 22
            Height = 12
            Caption = 'DATA'
          end
          object dtxNomeExcluidor: TtecDBText
            Left = 49
            Top = 10
            Width = 284
            Height = 23
            Hint = 'Nome do respons'#225'vel pelo cancelamento do repasse'
            TabStop = False
            Color = clBtnFace
            DataField = 'nomeexcluidor'
            DataSource = dtmrepassecheques.dsrRepasseCheques
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
          object dtxCodigoExcluidor: TtecDBText
            Left = 2
            Top = 10
            Width = 46
            Height = 23
            Hint = 'C'#243'digo do respons'#225'vel pelo cancelamento do repasse'
            TabStop = False
            Color = clBtnFace
            DataField = 'excluidor'
            DataSource = dtmrepassecheques.dsrRepasseCheques
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
          object dtxDataExclusao: TtecDBText
            Left = 334
            Top = 10
            Width = 120
            Height = 23
            Hint = 'Data e hora do cancelamento do repasse'
            TabStop = False
            Color = clBtnFace
            DataField = 'excluido'
            DataSource = dtmrepassecheques.dsrRepasseCheques
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
            Alignment = taLeftJustify
          end
        end
        object gbxTotais: TGroupBox
          Left = 419
          Top = 428
          Width = 155
          Height = 48
          Caption = 'TOTAIS DO REPASSE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 8
          object GroupBox3: TGroupBox
            Left = 50
            Top = 12
            Width = 105
            Height = 36
            Caption = 'VALOR'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object dtxTotalRepasse: TDBEditNumero
              Left = 2
              Top = 10
              Width = 100
              Height = 23
              TabStop = False
              Color = clBtnFace
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              MaxLength = -1
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              Mascara = True
              TipoMascara = tmGERAL
              NrDecimal = 2
              Decimais = True
              Negativo = False
              Tamanho = 9
              DataField = 'totalrepasse'
              DataSource = dtmrepassecheques.dsrRepasseCheques
            end
          end
          object GroupBox2: TGroupBox
            Left = 0
            Top = 12
            Width = 52
            Height = 36
            Caption = 'QTDE'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            object dtxQuantidadeRepasse: TDBEditNumero
              Left = 2
              Top = 10
              Width = 47
              Height = 23
              TabStop = False
              Color = clBtnFace
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              MaxLength = -1
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              Mascara = True
              TipoMascara = tmGERAL
              NrDecimal = 2
              Decimais = True
              Negativo = False
              Tamanho = 9
              DataField = 'quantidaderepasse'
              DataSource = dtmrepassecheques.dsrRepasseCheques
            end
          end
        end
        object gbxCancelados: TGroupBox
          Left = 578
          Top = 428
          Width = 155
          Height = 48
          Caption = 'DEVOLVIDOS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 9
          object GroupBox4: TGroupBox
            Left = 0
            Top = 12
            Width = 52
            Height = 36
            Caption = 'QTDE'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object dtxQuantidadeRepasseCancelado: TDBEditNumero
              Left = 2
              Top = 10
              Width = 47
              Height = 23
              TabStop = False
              Color = clBtnFace
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              MaxLength = -1
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              Mascara = True
              TipoMascara = tmGERAL
              NrDecimal = 2
              Decimais = True
              Negativo = False
              Tamanho = 9
              DataField = 'quantidaderepassedevolvido'
              DataSource = dtmrepassecheques.dsrRepasseCheques
            end
          end
          object GroupBox5: TGroupBox
            Left = 50
            Top = 12
            Width = 105
            Height = 36
            Caption = 'VALOR'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            object dtxTotalRepasseCancelado: TDBEditNumero
              Left = 2
              Top = 10
              Width = 100
              Height = 23
              TabStop = False
              Color = clBtnFace
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              MaxLength = -1
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              Mascara = True
              TipoMascara = tmGERAL
              NrDecimal = 2
              Decimais = True
              Negativo = False
              Tamanho = 9
              DataField = 'totalrepassedevolvido'
              DataSource = dtmrepassecheques.dsrRepasseCheques
            end
          end
        end
        object gbxSituacao: TGroupBox
          Left = 271
          Top = 0
          Width = 185
          Height = 44
          Caption = 'SITUA'#199#195'O'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 10
          object dtxSituacao: TtecDBText
            Left = 7
            Top = 11
            Width = 169
            Height = 29
            TabStop = False
            AutoSize = False
            Color = clBtnFace
            DataField = 'situacao'
            DataSource = dtmrepassecheques.dsrRepasseCheques
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -23
            Font.Name = 'Arial'
            Font.Pitch = fpVariable
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            Alignment = taLeftJustify
          end
        end
        object gbxSaldos: TGroupBox
          Left = 737
          Top = 428
          Width = 155
          Height = 48
          Caption = 'SALDO DO REPASSE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 11
          object GroupBox6: TGroupBox
            Left = 0
            Top = 12
            Width = 52
            Height = 36
            Caption = 'QTDE'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object dtxSaldoQuantidadeRepasse: TDBEditNumero
              Left = 2
              Top = 10
              Width = 47
              Height = 23
              TabStop = False
              Color = clBtnFace
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              MaxLength = -1
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              Mascara = True
              TipoMascara = tmGERAL
              NrDecimal = 2
              Decimais = True
              Negativo = False
              Tamanho = 9
              DataField = 'SaldoQuantidadeRepasse'
              DataSource = dtmrepassecheques.dsrRepasseCheques
            end
          end
          object GroupBox7: TGroupBox
            Left = 50
            Top = 12
            Width = 105
            Height = 36
            Caption = 'VALOR'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            object dtxSaldoTotalRepasse: TDBEditNumero
              Left = 2
              Top = 10
              Width = 100
              Height = 23
              TabStop = False
              Color = clBtnFace
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              MaxLength = -1
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              Mascara = True
              TipoMascara = tmGERAL
              NrDecimal = 2
              Decimais = True
              Negativo = False
              Tamanho = 9
              DataField = 'SaldoTotalRepasse'
              DataSource = dtmrepassecheques.dsrRepasseCheques
            end
          end
        end
        object gbxConsultaFilial: TGroupBox
          Left = 1
          Top = 43
          Width = 456
          Height = 37
          Caption = 'FILIAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          inline fraConsultaFilial: TfraConsultaCodigo
            Left = 2
            Top = 10
            Width = 452
            Height = 23
            HorzScrollBar.Range = 451
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
            inherited dtxDescricao: TtecDBText
              Width = 363
              DataField = 'nome'
              DataSource = fraConsultaFilial.dsrProcuraFiliais
            end
            inherited edfCodigo: TtecDBFindLookup
              Hint = 'Filial respons'#225'vel pelo repasse'
              DataField = 'filial'
              DataSource = dtmrepassecheques.dsrRepasseCheques
              MaxLength = 3
              LookupField = 'codigo'
              LookupSource = fraConsultaFilial.dsrProcuraFiliais
              LookupQueryParameter = 'codigo'
              Parameter = ' '
              ActiveSetControls = False
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
  inherited pnlTopMenu: TPanel
    Width = 937
    inherited tblBarra: TToolBar
      Left = 450
      Width = 487
      inherited sbnProcurar: TSpeedButton
        Visible = False
      end
    end
    inherited tblBarraCadastro: TToolBar
      Width = 450
      Constraints.MaxHeight = 0
      inherited sbnIncluir: TSpeedButton
        Hint = 'Inclui um novo repasse'
        Constraints.MaxHeight = 0
        Constraints.MinHeight = 0
      end
      inherited sbnSalvar: TSpeedButton
        Hint = 'Gravar a inclus'#227'o ou altera'#231#227'o do repasse'
        Constraints.MaxHeight = 0
        Constraints.MinHeight = 0
      end
      inherited sbnExcluir: TSpeedButton
        Hint = 'Cancela o repasse de cheques'
        Constraints.MaxHeight = 0
        Constraints.MinHeight = 0
        Caption = 'Cancelar F6'
      end
      object sbnImprimir: TSpeedButton
        Left = 225
        Top = 2
        Width = 75
        Height = 39
        Hint = 'Imprimir o repasse'
        AllowAllUp = True
        Caption = 'Imprimir F7'
        Flat = True
        Glyph.Data = {
          F6030000424DF603000000000000360000002800000013000000100000000100
          180000000000C0030000120B0000120B00000000000000000000DCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC000000DCDCDCDCDCDCDCDCDC00
          0000000000000000000000000000000000000000000000000000000000000000
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC000000DCDCDCDCDCDC000000C0C7C0C0C7
          C0C0C7C0C0C7C0C0C7C0C0C7C0C0C7C0C0C7C0C0C7C0000000C0C7C0000000DC
          DCDCDCDCDCDCDCDCDCDCDC000000DCDCDC000000000000000000000000000000
          000000000000000000000000000000000000000000000000C0C7C0000000DCDC
          DCDCDCDCDCDCDC000000DCDCDC000000C0C7C0C0C7C0C0C7C0C0C7C0C0C7C0C0
          C7C000FFFF00FFFF00FFFFC0C7C0C0C7C0000000000000000000DCDCDCDCDCDC
          DCDCDC000000DCDCDC000000C0C7C0C0C7C0C0C7C0C0C7C0C0C7C0C0C7C08087
          80808780808780C0C7C0C0C7C0000000C0C7C0000000DCDCDCDCDCDCDCDCDC00
          0000DCDCDC000000000000000000000000000000000000000000000000000000
          000000000000000000000000C0C7C0C0C7C0000000DCDCDCDCDCDC000000DCDC
          DC000000C0C7C0C0C7C0C0C7C0C0C7C0C0C7C0C0C7C0C0C7C0C0C7C0C0C7C0C0
          C7C0000000C0C7C0000000C0C7C0000000DCDCDCDCDCDC000000DCDCDCDCDCDC
          000000000000000000000000000000000000000000000000000000000000C0C7
          C0000000C0C7C0000000000000DCDCDCDCDCDC000000DCDCDCDCDCDCDCDCDC00
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000C0C7C0
          000000C0C7C0000000DCDCDCDCDCDC000000DCDCDCDCDCDCDCDCDCDCDCDC0000
          00FFFFFF000000000000000000000000000000FFFFFF00000000000000000000
          0000DCDCDCDCDCDCDCDCDC000000DCDCDCDCDCDCDCDCDCDCDCDC000000FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000DCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDC000000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC000000FFFFFF00
          0000000000000000000000000000FFFFFF000000DCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDC000000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDC000000FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000DCDCDCDCDCDCDCDCDCDCDCDC00
          0000DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC000000000000000000000000
          000000000000000000000000000000DCDCDCDCDCDCDCDCDCDCDCDC000000DCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC000000}
        Layout = blGlyphTop
        Spacing = 0
        OnClick = sbnImprimirClick
      end
      object sbnConfirma: TSpeedButton
        Left = 300
        Top = 2
        Width = 75
        Height = 39
        Hint = 'Confirma a inclus'#227'o dos cheques assinalados no repasse'
        AllowAllUp = True
        Anchors = [akTop, akRight]
        Caption = 'Confirma F5'
        Enabled = False
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
        OnClick = sbnConfirmaClick
      end
      object sbnGerar: TSpeedButton
        Left = 375
        Top = 2
        Width = 75
        Height = 39
        Hint = 'Gerar a rela'#231#227'o de cheques que atendam os filtros especificados'
        AllowAllUp = True
        Anchors = [akTop, akRight]
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
  object aclHabilita: TActionList
    Left = 640
    Top = 16
    object actHabilita: TAction
      Caption = 'actHabilita'
      OnUpdate = actHabilitaUpdate
    end
  end
  object svdCaminho: TSaveDialog
    Filter = '*.txt|Todos Arquivos (*.*)|'
    Options = [ofNoChangeDir, ofEnableSizing]
    Title = 'Salvar'
    Left = 664
    Top = 16
  end
end
