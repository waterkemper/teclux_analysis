inherited frmLivroRazao: TfrmLivroRazao
  Left = 643
  Top = 160
  ActiveControl = rgpRelatorio
  Caption = 'Emiss'#227'o do Livro Raz'#227'o'
  ClientHeight = 440
  ClientWidth = 531
  FormStyle = fsMDIChild
  Position = poScreenCenter
  Visible = True
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBarra: TToolBar
    Width = 531
  end
  inherited pnlFundoJanela: TPanel
    Top = 40
    Width = 531
    Height = 400
    Align = alClient
    object rgpRelatorio: TRadioGroup
      Left = 6
      Top = 6
      Width = 160
      Height = 64
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        'Emiss'#227'o do Livro'
        'Termo de Abertura')
      ParentFont = False
      TabOrder = 1
    end
    object gbxNumeracao: TGroupBox
      Left = 176
      Top = 6
      Width = 165
      Height = 47
      Caption = 'NUMERA'#199#195'O'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      object gbxLivro: TGroupBox
        Left = 2
        Top = 12
        Width = 55
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
          Mascara = False
          Alignment = taCenter
          TipoMascara = tmGERAL
          NrDecimal = 0
          Decimais = False
          Negativo = False
          Tamanho = 4
        end
      end
      object gbxPagina: TGroupBox
        Left = 55
        Top = 12
        Width = 55
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
          Text = '2'
          Mascara = False
          Alignment = taCenter
          TipoMascara = tmGERAL
          NrDecimal = 0
          Decimais = False
          Negativo = False
          Tamanho = 9
        end
      end
      object gbxMaximo: TGroupBox
        Left = 108
        Top = 12
        Width = 55
        Height = 36
        Caption = 'M'#193'XIMO '
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
          Text = '499'
          Mascara = False
          Alignment = taCenter
          TipoMascara = tmGERAL
          NrDecimal = 0
          Decimais = False
          Negativo = False
          Tamanho = 9
        end
      end
    end
    object gbxPeriodo: TGroupBox
      Left = 6
      Top = 80
      Width = 160
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
      object edtDataInicial: TEditData
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
      object edtDataFinal: TEditData
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
    object rgpOpcaoSaldoDiario: TRadioGroup
      Left = 351
      Top = 68
      Width = 120
      Height = 80
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        'Sem saldos'
        'Com saldos'
        'S'#243' os saldos')
      ParentFont = False
      TabOrder = 8
    end
    object gbxConta: TGroupBox
      Left = 6
      Top = 152
      Width = 519
      Height = 64
      Caption = 'CONTA'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 9
      object dtxContaClassificacao: TtecDBText
        Left = 363
        Top = 10
        Width = 153
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
        TabOrder = 0
        Alignment = taLeftJustify
      end
      object ckbExcetoConta: TCheckBox
        Left = 5
        Top = 38
        Width = 70
        Height = 22
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
      inline fraConsultaContaContabil: TfraConsultaCodigoContabil
        Left = 2
        Top = 10
        Width = 362
        Height = 28
        HorzScrollBar.Range = 360
        VertScrollBar.Range = 23
        AutoScroll = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        inherited sbnProcura: TSpeedButton
          Top = 1
          Font.Height = -13
        end
        inherited dtxDescricao: TtecDBText
          Width = 273
          DataField = 'descricao'
          DataSource = fraConsultaContaContabil.dsrProcuraDebitar
        end
        inherited edfCodigo: TtecDBFindLookup
          DataField = 'codigo'
          DataSource = fraConsultaContaContabil.dsrProcuraDebitar
          Group = 'conta'
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
    end
    object gbxOpcoes: TGroupBox
      Left = 351
      Top = 7
      Width = 120
      Height = 56
      Caption = ' OP'#199#213'ES '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      object ckbSoComMovtos: TCheckBox
        Left = 6
        Top = 12
        Width = 105
        Height = 19
        Caption = 'S'#243' com movtos'
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
      object ckbSoComSaldos: TCheckBox
        Left = 6
        Top = 31
        Width = 105
        Height = 19
        Caption = 'S'#243' com saldos'
        Checked = True
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentColor = False
        ParentFont = False
        State = cbChecked
        TabOrder = 1
      end
    end
    inline fraListaFiliais: TfraListaFiliais
      Left = 3
      Top = 222
      Width = 525
      Height = 175
      Align = alBottom
      TabOrder = 10
      inherited gbxFiliais: TGroupBox
        Width = 522
        Height = 175
        Align = alNone
        Caption = ' &FILIAIS '
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = [fsBold]
        ParentFont = False
        inherited sbnMarcarFiliais: TSpeedButton
          Left = 488
        end
        inherited sbnDesmarcarFiliais: TSpeedButton
          Left = 488
        end
        inherited clbFiliais: TCheckListBox
          Left = 2
          Top = 13
          Width = 484
          Height = 135
          Font.Height = -12
          Font.Name = 'helvetica'
        end
      end
    end
    object rgpOrdenacao: TRadioGroup
      Left = 198
      Top = 68
      Width = 120
      Height = 80
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        'Classifica'#231#227'o'
        'Alfab'#233'tica'
        'Num'#233'rica')
      ParentFont = False
      TabOrder = 6
    end
    object ckbAgruparFiliaisnaFilialBase: TCheckBox
      Left = 10
      Top = 372
      Width = 142
      Height = 18
      Caption = 'Consolidar as filiais'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 11
    end
    object stxRelatorio: TStaticText
      Left = 10
      Top = 8
      Width = 60
      Height = 16
      Caption = ' RELAT'#211'RIO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object stxSaldosDiarios: TStaticText
      Left = 354
      Top = 70
      Width = 86
      Height = 16
      Caption = ' SALDOS DI'#193'RIOS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 7
    end
    object stxOrdenacao: TStaticText
      Left = 202
      Top = 70
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
      TabOrder = 5
    end
  end
  object ecvValida: TtecEditionControlValidation
    EditionControl = <
      item
        Control = edtMaximo
      end
      item
        Control = edtPagina
      end>
    Left = 384
  end
end
