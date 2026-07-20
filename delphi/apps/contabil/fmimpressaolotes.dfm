inherited frmImpressaoLotes: TfrmImpressaoLotes
  Left = 888
  Top = 252
  ActiveControl = edtLoteFinal
  Caption = 'Impress'#227'o de Lotes'
  ClientHeight = 394
  ClientWidth = 518
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBarra: TToolBar
    Width = 518
  end
  inherited pnlFundoJanela: TPanel
    Top = 41
    Width = 518
    Height = 353
    object gbxDataConsulta: TGroupBox
      Left = 6
      Top = 148
      Width = 160
      Height = 36
      Caption = 'DATAS DE LAN'#199'TO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      object Label1: TLabel
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
      object edtDataIniciallancto: TEditData
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
        ParentFont = False
        TabOrder = 0
        Minimo = 37353
        Maximo = 0
      end
      object edtDataFinallancto: TEditData
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
        ParentFont = False
        TabOrder = 1
        Minimo = 37353
        Maximo = 0
      end
    end
    object gbxNrLotes: TGroupBox
      Left = 6
      Top = 47
      Width = 120
      Height = 36
      Caption = 'N'#186' DOS LOTES'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object lblA_NrLotes: TLabel
        Left = 56
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
      object edtLoteFinal: TEditNumero
        Left = 66
        Top = 10
        Width = 51
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
        Mascara = True
        Alignment = taLeftJustify
        TipoMascara = tmGERAL
        NrDecimal = 0
        Decimais = False
        Negativo = False
        Tamanho = 9
      end
      object edtLoteInicial: TEditNumero
        Left = 2
        Top = 10
        Width = 51
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
        OnExit = edtLoteInicialExit
        Mascara = True
        Alignment = taLeftJustify
        TipoMascara = tmGERAL
        NrDecimal = 0
        Decimais = False
        Negativo = False
        Tamanho = 9
      end
    end
    object gbxFilialConsulta: TGroupBox
      Left = 6
      Top = 5
      Width = 503
      Height = 36
      Caption = ' FILIAL '
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 0
      object lblFilialBase: TLabel
        Left = 2
        Top = 15
        Width = 499
        Height = 18
        AutoSize = False
        Caption = 'lblFilialBase'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
      end
    end
    object gbxConta: TGroupBox
      Left = 6
      Top = 279
      Width = 503
      Height = 64
      Caption = ' CONTA CONT'#193'BIL '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      inline fraConsultaContaContabil: TfraConsultaCodigoContabil
        Left = 4
        Top = 10
        Width = 392
        Height = 25
        HorzScrollBar.Range = 391
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
          Top = 1
          Font.Height = -13
        end
        inherited dtxDescricao: TtecDBText
          Width = 303
          DataField = 'descricao'
          DataSource = fraConsultaContaContabil.dsrProcuraDebitar
        end
        inherited edfCodigo: TtecDBFindLookup
          DataField = 'codigo'
          DataSource = fraConsultaContaContabil.dsrProcuraDebitar
          Group = 'ContaContabil'
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
        Left = 395
        Top = 10
        Width = 105
        Height = 23
        TabStop = False
        Color = clBtnFace
        DataField = 'classificacao'
        DataSource = fraConsultaContaContabil.dsrProcuraDebitar
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
      object ckbExcetoConta: TCheckBox
        Left = 5
        Top = 38
        Width = 71
        Height = 24
        Caption = 'Exceto'
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
    object gbxDataConsultaAlteracao: TGroupBox
      Left = 6
      Top = 98
      Width = 160
      Height = 36
      Caption = 'PER'#205'ODO DAS ALTERA'#199#213'ES'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      object lblA_PeriodoAlteracoes: TLabel
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
      object edtDataFinalAlteracao: TEditData
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
        ParentFont = False
        TabOrder = 1
        Minimo = 37353
        Maximo = 0
      end
      object edtDataInicialAlteracao: TEditData
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
        ParentFont = False
        TabOrder = 0
        Minimo = 37353
        Maximo = 0
      end
    end
    object rgpOrdenacao: TRadioGroup
      Left = 6
      Top = 204
      Width = 151
      Height = 61
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ItemIndex = 1
      Items.Strings = (
        'Data de lan'#231'amento'
        'N'#186' de lan'#231'amento')
      ParentFont = False
      TabOrder = 4
    end
    object gbxOpcoes: TGroupBox
      Left = 185
      Top = 229
      Width = 151
      Height = 36
      Caption = ' OP'#199#213'ES '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      object ckbExibirTotaisporLote: TCheckBox
        Left = 6
        Top = 11
        Width = 140
        Height = 22
        Caption = 'Exibir totais por conta'
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
    object gbxOrigemConsulta: TGroupBox
      Left = 185
      Top = 47
      Width = 324
      Height = 176
      Caption = ' ORIGEM '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      object ckbEntradas: TCheckBox
        Left = 10
        Top = 75
        Width = 135
        Height = 13
        Caption = 'E - NF Entrada'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object ckbManual: TCheckBox
        Left = 10
        Top = 155
        Width = 135
        Height = 13
        Caption = 'M - Manual'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        State = cbChecked
        TabOrder = 7
      end
      object ckbPagamentos: TCheckBox
        Left = 155
        Top = 35
        Width = 165
        Height = 13
        Caption = 'P - Pagamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 9
      end
      object ckbRecebimentos: TCheckBox
        Left = 155
        Top = 55
        Width = 165
        Height = 13
        Caption = 'R - Recebimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 10
      end
      object ckbSaidas: TCheckBox
        Left = 155
        Top = 75
        Width = 165
        Height = 13
        Caption = 'S - NF Sa'#237'da'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 11
      end
      object ckbDocPagar: TCheckBox
        Left = 10
        Top = 55
        Width = 135
        Height = 13
        Caption = 'D - Doc. Pagar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object ckbLotes: TCheckBox
        Left = 10
        Top = 135
        Width = 135
        Height = 13
        Caption = 'L - Lotes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 6
      end
      object ckbEncerramento: TCheckBox
        Left = 155
        Top = 135
        Width = 165
        Height = 13
        Caption = 'X - Encerramento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 14
      end
      object ckbBancos: TCheckBox
        Left = 10
        Top = 35
        Width = 135
        Height = 13
        Caption = 'B - Bancos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object ckbImportacao: TCheckBox
        Left = 10
        Top = 115
        Width = 135
        Height = 13
        Caption = 'I - Importa'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 5
      end
      object ckbAdiantamentos: TCheckBox
        Left = 10
        Top = 15
        Width = 135
        Height = 13
        Caption = 'A - Adiantamentos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object ckbVendasImoveis: TCheckBox
        Left = 155
        Top = 115
        Width = 165
        Height = 13
        Caption = 'V - Vendas de Im'#243'veis'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 13
      end
      object ckbChavesImoveis: TCheckBox
        Left = 10
        Top = 95
        Width = 135
        Height = 13
        Caption = 'H - Chaves Im'#243'veis'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 4
      end
      object ckbAtMonImoveis: TCheckBox
        Left = 155
        Top = 16
        Width = 165
        Height = 13
        Caption = 'O - Atualiza'#231#227'o Monet'#225'ria'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 8
      end
      object ckbRecebimentosImoveis: TCheckBox
        Left = 155
        Top = 95
        Width = 165
        Height = 13
        Caption = 'T - Recebimentos Im'#243'veis'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 12
      end
    end
    object stxOrdenacao: TStaticText
      Left = 10
      Top = 206
      Width = 66
      Height = 16
      Caption = ' ORDENA'#199#195'O'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 8
    end
  end
end
