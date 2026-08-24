inherited frmEmissaoBalancetes: TfrmEmissaoBalancetes
  Left = 594
  Top = 172
  ActiveControl = edtMesInicial
  Caption = 'Balancetes e Balan'#231'os'
  ClientHeight = 569
  ClientWidth = 603
  FormStyle = fsMDIChild
  Position = poScreenCenter
  Visible = True
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBarra: TToolBar
    Width = 603
  end
  inherited pnlFundoJanela: TPanel
    Top = 43
    Width = 603
    Height = 526
    BorderWidth = 0
    object rgpFuncao: TRadioGroup
      Left = 120
      Top = 2
      Width = 94
      Height = 109
      ItemIndex = 0
      Items.Strings = (
        'Anal'#237'tico'
        'Sint'#233'tico'
        'Balan'#231'o'
        'DRE')
      TabOrder = 1
      OnClick = rgpFuncaoClick
    end
    object rgpForma: TRadioGroup
      Left = 6
      Top = 2
      Width = 105
      Height = 62
      ItemIndex = 0
      Items.Strings = (
        'Normal'
        'Livro Di'#225'rio')
      TabOrder = 0
      OnClick = rgpFormaClick
    end
    object gbxNumeracao: TGroupBox
      Left = 224
      Top = 44
      Width = 146
      Height = 48
      Caption = ' NUMERA'#199#195'O '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      object gbxLivro: TGroupBox
        Left = 0
        Top = 12
        Width = 50
        Height = 36
        Caption = ' LIVRO '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object edtLivro: TEditNumero
          Left = 2
          Top = 10
          Width = 45
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = 3
          ParentFont = False
          TabOrder = 0
          Mascara = True
          Alignment = taCenter
          TipoMascara = tmGERAL
          NrDecimal = 0
          Decimais = False
          Negativo = False
          Tamanho = 9
        end
      end
      object gbxPagina: TGroupBox
        Left = 48
        Top = 12
        Width = 50
        Height = 36
        Caption = 'P'#193'GINA '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object edtPagina: TEditNumero
          Left = 2
          Top = 10
          Width = 45
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = 4
          ParentFont = False
          TabOrder = 0
          Mascara = True
          Alignment = taCenter
          TipoMascara = tmGERAL
          NrDecimal = 0
          Decimais = False
          Negativo = False
          Tamanho = 9
        end
      end
      object gbxMaximo: TGroupBox
        Left = 96
        Top = 12
        Width = 50
        Height = 36
        Caption = ' M'#193'XIMO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        object edtMaximo: TEditNumero
          Left = 2
          Top = 10
          Width = 45
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = 4
          ParentFont = False
          TabOrder = 0
          Text = '499'
          Mascara = True
          Alignment = taCenter
          TipoMascara = tmGERAL
          NrDecimal = 0
          Decimais = False
          Negativo = False
          Tamanho = 9
        end
      end
    end
    object gbxImprimir: TGroupBox
      Left = 6
      Top = 189
      Width = 215
      Height = 172
      Caption = ' IMPRIMIR '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      object ckbSomenteSaldos: TCheckBox
        Left = 8
        Top = 13
        Width = 193
        Height = 16
        Caption = 'Somente os saldos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = ckbSomenteSaldosClick
      end
      object ckbSubContasComSaldos: TCheckBox
        Left = 8
        Top = 32
        Width = 193
        Height = 18
        Caption = 'S'#243' contas com saldos'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        State = cbChecked
        TabOrder = 1
      end
      object ckbClassificacao: TCheckBox
        Left = 8
        Top = 89
        Width = 193
        Height = 16
        Caption = 'Classifica'#231#227'o'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        State = cbChecked
        TabOrder = 4
      end
      object ckbLinhaBranco: TCheckBox
        Left = 8
        Top = 51
        Width = 193
        Height = 16
        Caption = 'Pular linha antes sint'#233'tica'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        State = cbChecked
        TabOrder = 2
      end
      object ckbDataUltimoMovto: TCheckBox
        Left = 8
        Top = 70
        Width = 193
        Height = 16
        Caption = 'Data do '#250'ltimo movimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object ckbDataResponsavel: TCheckBox
        Left = 8
        Top = 127
        Width = 201
        Height = 16
        Caption = 'Data e respons'#225'vel'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        State = cbChecked
        TabOrder = 5
      end
      object ckbImprimirCodigoReduzido: TCheckBox
        Left = 8
        Top = 108
        Width = 193
        Height = 17
        Caption = 'C'#243'digo reduzido'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        State = cbChecked
        TabOrder = 6
      end
      object ckbOrdenarporcodigoreduzido: TCheckBox
        Left = 8
        Top = 146
        Width = 201
        Height = 16
        Caption = 'Ordenar anal'#237'ticas pelo c'#243'digo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 7
      end
    end
    inline fraListaFiliais1: TfraListaFiliais
      Left = 229
      Top = 187
      Width = 367
      Height = 174
      TabOrder = 6
      inherited gbxFiliais: TGroupBox
        Width = 367
        Height = 174
        Caption = ' FILIAIS '
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = [fsBold]
        ParentFont = False
        inherited sbnMarcarFiliais: TSpeedButton
          Left = 336
          OnClick = fraListaFiliais1sbnMarcarFiliaisClick
        end
        inherited sbnDesmarcarFiliais: TSpeedButton
          Left = 336
          OnClick = fraListaFiliais1sbnDesmarcarFiliaisClick
        end
        inherited clbFiliais: TCheckListBox
          Left = 2
          Top = 12
          Width = 330
          Height = 135
          Font.Height = -12
          Font.Name = 'helvetica'
        end
      end
    end
    object ckbConsolidarFiliais: TCheckBox
      Left = 236
      Top = 337
      Width = 138
      Height = 19
      Caption = 'Consolidar as filiais'
      TabOrder = 7
    end
    object gbxContaDemonstrativo: TGroupBox
      Left = 6
      Top = 118
      Width = 590
      Height = 63
      Caption = ' CONTA PARA DEMONSTRA'#199#195'O DE RESULTADOS '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      inline fraConsultaPlanoContas: TfraConsultaCodigoContabil
        Left = 4
        Top = 12
        Width = 583
        Height = 47
        HorzScrollBar.Range = 443
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
          Font.Height = -13
        end
        inherited dtxDescricao: TtecDBText
          Width = 495
          Height = 24
          DataField = 'descricao'
          DataSource = fraConsultaPlanoContas.dsrProcuraCreditar
          Font.Height = -13
        end
        inherited edfCodigo: TtecDBFindLookup
          Height = 24
          DataField = 'codigo'
          DataSource = fraConsultaPlanoContas.dsrProcuraCreditar
          Font.Height = -13
          Group = 'Planocontas'
          MaxLength = 6
          OnFound = nil
          Operacao = opPESQUISA
          Parameter = 'codigo'
          ActiveSetControls = False
          DenyInsert = True
          NoSetControls = <>
          SetControls = <>
        end
      end
      object dtxClassificacaoContabil: TtecDBText
        Left = 91
        Top = 37
        Width = 496
        Height = 24
        TabStop = False
        Color = clBtnFace
        DataField = 'classificacao'
        DataSource = fraConsultaPlanoContas.dsrProcuraCreditar
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        Alignment = taLeftJustify
      end
    end
    object gbxPeriodo: TGroupBox
      Left = 223
      Top = 4
      Width = 136
      Height = 36
      Caption = ' PER'#205'ODO '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      object lblA: TLabel
        Left = 64
        Top = 14
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
      object edtMesInicial: TEditMesAno
        Left = 2
        Top = 10
        Width = 58
        Height = 24
        EditMask = '99/9999;1; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        MaxLength = 7
        ParentFont = False
        TabOrder = 0
        Text = '  /    '
      end
      object edtMesFinal: TEditMesAno
        Left = 75
        Top = 10
        Width = 58
        Height = 24
        EditMask = '99/9999;1; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        MaxLength = 7
        ParentFont = False
        TabOrder = 1
        Text = '  /    '
      end
    end
    object gbxContasSelecionadas: TGroupBox
      Left = 6
      Top = 365
      Width = 591
      Height = 159
      Caption = ' CONTAS CONT'#193'BEIS SELECIONADAS '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
      inline fraSelecaoAleatoriaContas: TfraSelecaoAleatoria
        Left = 2
        Top = 16
        Width = 587
        Height = 141
        HorzScrollBar.Range = 26
        Align = alClient
        AutoScroll = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        inherited Splitter1: TSplitter
          Left = 556
          Height = 126
        end
        inherited dbgSelecaoAleatoria: TtecDBGrid
          Width = 556
          Height = 126
          Font.Height = -12
          Font.Name = 'Helvetica'
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
          OnDblClick = fraSelecaoAleatoriaContasdbgSelecaoAleatoriaDblClick
          OnKeyDown = fraSelecaoAleatoriaContasdbgSelecaoAleatoriaKeyDown
          DefaultRowHeight = 19
        end
        inherited pnlLabels: TPanel
          Left = 559
          Height = 126
          inherited sbnProcura: TSpeedButton
            OnClick = fraSelecaoAleatoriaContassbnProcuraClick
          end
          inherited sbnExcluir: TSpeedButton
            Top = 60
          end
          inherited sbnExcluirTodos: TSpeedButton
            Top = 91
          end
          inherited sbnIncluirItem: TSpeedButton
            Top = 37
          end
        end
        inherited pnlAbaixo: TPanel
          Top = 126
          Width = 587
          Font.Pitch = fpVariable
          inherited lblOrientacao: TLabel
            Font.Pitch = fpVariable
          end
          inherited pnlAbaixoDireita: TPanel
            Left = 556
            Font.Pitch = fpVariable
          end
        end
        inherited qrySelecaoAleatoria: TtecQuery
          AfterOpen = fraSelecaoAleatoriaContasqrySelecaoAleatoriaAfterOpen
          Sql.Strings = (
            'SELECT  Codigo,'
            '         descricao,'
            '         classificacao,'
            '         tipo'
            'FROM     planocontas'
            'WHERE false')
        end
      end
    end
    object stxForma: TStaticText
      Left = 11
      Top = 5
      Width = 43
      Height = 16
      Caption = ' FORMA '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 9
    end
    object stxBalancete: TStaticText
      Left = 125
      Top = 4
      Width = 64
      Height = 16
      Caption = ' BALANCETE '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 10
    end
  end
  object ecvValida: TtecEditionControlValidation
    EditionControl = <
      item
        Control = edtMaximo
      end
      item
        Control = edtPagina
      end
      item
        Control = edtMesFinal
      end
      item
        Control = edtMesInicial
      end>
    Left = 240
  end
end
