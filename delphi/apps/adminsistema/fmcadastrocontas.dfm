inherited frmcadastrocontas: Tfrmcadastrocontas
  Left = 388
  Top = 71
  Width = 989
  Height = 779
  VertScrollBar.Range = 44
  Caption = 'Cadastro de Contas'
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBarra: TPanel
    Left = 168
    Top = 188
    Width = 177
    Height = 37
  end
  inherited pnlTopMenu: TPanel
    Width = 969
    inherited tblBarra: TToolBar
      Width = 744
      inherited sbnProcurar: TSpeedButton
        Visible = False
      end
    end
  end
  object plnFundoJanela: TPanel
    Left = 0
    Top = 45
    Width = 969
    Height = 692
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 3
    TabOrder = 2
    object lblFluxoCaixa: TLabel
      Left = 395
      Top = 93
      Width = 73
      Height = 15
      Caption = 'fluxo de caixa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
    end
    object ckbincluircontanofluxodecaixa: TDBCheckBox
      Left = 377
      Top = 78
      Width = 105
      Height = 19
      Caption = 'Incluir saldo no'
      DataField = 'fluxocaixa'
      DataSource = dtmcadastrobancos.dsrContas
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
    object gbxBancoConta: TGroupBox
      Left = 6
      Top = 3
      Width = 119
      Height = 36
      Caption = ' BANCO '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object dtxSigla: TtecDBText
        Left = 2
        Top = 10
        Width = 114
        Height = 23
        TabStop = False
        Color = clBtnFace
        DataField = 'sigla'
        DataSource = dtmcadastrobancos.dsrBancos
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
    end
    object gbxAgenciaConta: TGroupBox
      Left = 130
      Top = 3
      Width = 350
      Height = 36
      Caption = ' NOME DA AG'#202'NCIA '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object dtxNomeAgencia: TtecDBText
        Left = 2
        Top = 10
        Width = 345
        Height = 23
        TabStop = False
        Color = clBtnFace
        DataField = 'nome'
        DataSource = dtmcadastrobancos.dsrAgencias
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
    end
    object gbxContaCorrente: TGroupBox
      Left = 6
      Top = 39
      Width = 99
      Height = 36
      Caption = ' N'#186' DA CONTA '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      object lblDigito: TLabel
        Tag = 17
        Left = 75
        Top = 15
        Width = 4
        Height = 15
        Alignment = taRightJustify
        Caption = '-'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
      end
      object edtConta: TDBEditNumero
        Tag = 17
        Left = 2
        Top = 10
        Width = 71
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
        Text = 'edtConta'
        Mascara = False
        Alignment = taLeftJustify
        TipoMascara = tmGERAL
        NrDecimal = 0
        Decimais = False
        Negativo = False
        Tamanho = 8
        DataField = 'conta'
        DataSource = dtmcadastrobancos.dsrContas
      end
      object edtDigito: TDBEditTexto
        Tag = 17
        Left = 81
        Top = 10
        Width = 15
        Height = 23
        DataField = 'digito'
        DataSource = dtmcadastrobancos.dsrContas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        MaxLength = -1
        ParentFont = False
        TabOrder = 1
        CharCasenoDefault = False
        Alignment = taLeftJustify
      end
    end
    object gbxTitular: TGroupBox
      Left = 110
      Top = 39
      Width = 290
      Height = 36
      Caption = ' NOME DO TITULAR '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      object edtTitular: TDBEditTexto
        Left = 2
        Top = 10
        Width = 285
        Height = 23
        DataField = 'titular'
        DataSource = dtmcadastrobancos.dsrContas
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
    object gbxSelecaoFilial: TGroupBox
      Left = 6
      Top = 111
      Width = 243
      Height = 39
      Caption = 'FILIAL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      inline fraConsultaFilial: TfraConsultaCodigo
        Left = 1
        Top = 10
        Width = 240
        Height = 25
        HorzScrollBar.Range = 456
        HorzScrollBar.Visible = False
        VertScrollBar.Range = 25
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
        inherited sbnProcura: TSpeedButton
          Left = 41
          Top = 1
          Height = 24
          Font.Height = -13
        end
        inherited dtxDescricao: TtecDBText
          Left = 64
          Top = 1
          Width = 175
          DataField = 'nome'
          DataSource = fraConsultaFilial.dsrProcuraFiliais
        end
        inherited edfCodigo: TtecDBFindLookup
          Left = 1
          Width = 40
          DataField = 'filial'
          DataSource = dtmcadastrobancos.dsrContas
          MaxLength = 3
          LookupField = 'codigo'
          LookupSource = fraConsultaFilial.dsrProcuraFiliais
          LookupQueryParameter = 'codigo'
          Parameter = ' '
          ActiveSetControls = False
          DenyInsert = False
          NoSetControls = <>
          SetControls = <>
          LookupParameter = 'codigo'
        end
        inherited qryProcuraFiliais: TtecQuery
          Options = [doAutoFillDefs]
        end
        inherited qryConsultaImobilizado: TtecQuery
          Top = 25
        end
      end
    end
    object grxTipoRecebimento: TGroupBox
      Left = 255
      Top = 111
      Width = 225
      Height = 38
      Caption = 'TIPO DE RECEBIMENTO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      inline fraConsultaTipoRecebimentos: TfraConsultaCodigo
        Left = 2
        Top = 10
        Width = 221
        Height = 26
        HorzScrollBar.Range = 457
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
        inherited sbnProcura: TSpeedButton
          Left = 32
        end
        inherited dtxDescricao: TtecDBText
          Left = 56
          Width = 164
          DataField = 'descricao'
          DataSource = fraConsultaTipoRecebimentos.dsrProcuraTipoRecebimento
        end
        inherited edfCodigo: TtecDBFindLookup
          Width = 33
          DataField = 'tiporecebimento'
          DataSource = dtmcadastrobancos.dsrContas
          MaxLength = 8
          LookupField = 'codigo'
          LookupSource = fraConsultaTipoRecebimentos.dsrProcuraTipoRecebimento
          LookupQueryParameter = 'codigo'
          Parameter = ' '
          ActiveSetControls = False
          DenyInsert = False
          NoSetControls = <>
          SetControls = <>
          LookupParameter = 'codigo'
        end
        inherited qryProcuraTipoRecebimento: TtecQuery
          Options = [doAutoFillDefs]
        end
      end
    end
    object gbxContaContabil: TGroupBox
      Left = 6
      Top = 74
      Width = 364
      Height = 37
      Caption = 'CONTA CONT'#193'BIL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      inline fraConsultaContaContabil: TfraConsultaCodigoContabil
        Left = 2
        Top = 9
        Width = 360
        Height = 26
        HorzScrollBar.Range = 455
        HorzScrollBar.Visible = False
        VertScrollBar.Range = 25
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
        inherited sbnProcura: TSpeedButton
          Left = 68
          Top = 2
          Height = 23
          Font.Height = -13
        end
        inherited dtxDescricao: TtecDBText
          Top = 1
          Width = 271
          DataField = 'descricao'
          DataSource = fraConsultaContaContabil.dsrProcuraCreditar
        end
        inherited edfCodigo: TtecDBFindLookup
          Top = 2
          DataField = 'contacontabil'
          DataSource = dtmcadastrobancos.dsrContas
          MaxLength = 6
          LookupField = 'codigo'
          LookupSource = fraConsultaContaContabil.dsrProcuraCreditar
          LookupQueryParameter = 'codigo'
          Parameter = ' '
          ActiveSetControls = False
          DenyInsert = False
          NoSetControls = <>
          SetControls = <>
          LookupParameter = 'codigo'
        end
        inherited qryProcuraCreditar: TtecQuery
          Options = [doAutoFillDefs]
          inherited qryProcuraCreditarcodigo: TIntegerField
            DisplayFormat = '0'
          end
        end
      end
    end
    object gbxInativa: TGroupBox
      Left = 405
      Top = 39
      Width = 75
      Height = 36
      Caption = ' INATIVA '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 9
      object edtDataInicial: TDBEditData
        Left = 2
        Top = 10
        Width = 70
        Height = 23
        Alignment = taLeftJustify
        DataField = 'validadeinicial'
        DataSource = dtmCadastroPlanosPagamentos.dsrPlanos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        MaxLength = 14
        Maximo = 37353
        Minimo = 37353
        Adicional = 0
        ParentFont = False
        TabOrder = 0
        Opcional = True
      end
    end
    object ckbIntegracaoNexxera: TDBCheckBox
      Left = 9
      Top = 158
      Width = 136
      Height = 15
      Caption = 'Integra'#231#227'o Nexxera'
      DataField = 'integracao_nexxera'
      DataSource = dtmcadastrobancos.dsrContas
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 8
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
    object pgcConta: TPageControl
      Left = 3
      Top = 180
      Width = 963
      Height = 509
      ActivePage = tstBoletos
      Align = alBottom
      TabOrder = 10
      object tstBoletos: TTabSheet
        Caption = 'Boletos'
        object gbxInformacoesBoleto: TGroupBox
          Left = 0
          Top = 0
          Width = 955
          Height = 478
          Align = alClient
          Caption = ' INFORMA'#199#213'ES PARA GERA'#199#195'O/IMPRESS'#195'O DE BOLETOS DE COBRAN'#199'A '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object pgcDetalheContas: TPageControl
            Left = 2
            Top = 16
            Width = 951
            Height = 460
            ActivePage = tstCedenteGerais
            Align = alClient
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object tstCedenteGerais: TTabSheet
              Caption = 'Dados Gerais'
              object lblIsentoTaxa: TLabel
                Left = 386
                Top = 197
                Width = 50
                Height = 12
                Caption = 'ISENTO DE'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
              end
              object lblTaxa: TLabel
                Left = 323
                Top = 197
                Width = 21
                Height = 12
                Caption = 'TAXA'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
              end
              object lblPadrao: TLabel
                Left = 252
                Top = 187
                Width = 38
                Height = 12
                Hint = 
                  'Padr'#227'o CNAB a ser utilizado na remessa de t'#237'tulos para cobran'#231'a:' +
                  '  CNAB240 ou CNAB400'
                Caption = 'PADR'#195'O'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
              end
              object gbxViasBoleto: TGroupBox
                Left = 419
                Top = 80
                Width = 55
                Height = 36
                Caption = ' N'#186' VIAS '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 10
                object edtViasBoleto: TDBEditNumero
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
                  Text = 'edtViasBoleto'
                  Mascara = False
                  Alignment = taLeftJustify
                  TipoMascara = tmGERAL
                  NrDecimal = 2
                  Decimais = False
                  Negativo = False
                  Tamanho = 8
                  DataField = 'nrviasboleto'
                  DataSource = dtmcadastrobancos.dsrContas
                end
              end
              object gbxInstrucoesBoleto: TGroupBox
                Left = 0
                Top = 306
                Width = 474
                Height = 74
                Caption = 'INSTRU'#199#213'ES A SEREM IMPRESSAS NO BOLETO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 21
                object mmoInstrucoesBoleto: TtecDBMemo
                  Left = 2
                  Top = 14
                  Width = 470
                  Height = 58
                  Align = alClient
                  DataField = 'instrucoesboleto'
                  DataSource = dtmcadastrobancos.dsrContas
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
              object gbxTaxaBoleto: TGroupBox
                Left = 305
                Top = 210
                Width = 60
                Height = 36
                Caption = ' BOLETO '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 18
                object edtTaxaBoleto: TDBEditNumero
                  Left = 2
                  Top = 10
                  Width = 55
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
                  Text = 'edtTaxaBoleto'
                  Mascara = True
                  Alignment = taLeftJustify
                  TipoMascara = tmGERAL
                  NrDecimal = 2
                  Decimais = True
                  Negativo = False
                  Tamanho = 9
                  DataField = 'taxa_boleto'
                  DataSource = dtmcadastrobancos.dsrContas
                end
              end
              object gbxIsentoTaxaBoleto: TGroupBox
                Left = 363
                Top = 210
                Width = 110
                Height = 36
                Caption = ' TAXA SE ACIMA DE '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 19
                object edtIsentoTaxaBoleto: TDBEditNumero
                  Left = 2
                  Top = 10
                  Width = 105
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
                  Text = 'edtIsentoTaxaBoleto'
                  Mascara = True
                  Alignment = taLeftJustify
                  TipoMascara = tmGERAL
                  NrDecimal = 2
                  Decimais = True
                  Negativo = False
                  Tamanho = 9
                  DataField = 'valor_isencao_taxa'
                  DataSource = dtmcadastrobancos.dsrContas
                end
              end
              object gbxLocalPagamento: TGroupBox
                Left = 0
                Top = 256
                Width = 474
                Height = 62
                Caption = ' LOCAL DE PAGAMENTO '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 20
                object edtLocal_1: TDBEditTexto
                  Left = 2
                  Top = 10
                  Width = 469
                  Height = 23
                  DataField = 'localpagamento'
                  DataSource = dtmcadastrobancos.dsrContas
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
                object edtLocal_2: TDBEditTexto
                  Left = 2
                  Top = 34
                  Width = 469
                  Height = 23
                  DataField = 'localpagamento2'
                  DataSource = dtmcadastrobancos.dsrContas
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  MaxLength = -1
                  ParentFont = False
                  TabOrder = 1
                  CharCasenoDefault = False
                  Alignment = taLeftJustify
                end
              end
              object gbxConvenio: TGroupBox
                Left = 0
                Top = 0
                Width = 87
                Height = 36
                Caption = ' CONV'#202'NIO '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                object edtConvenio: TDBEditNumero
                  Left = 2
                  Top = 10
                  Width = 81
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
                  Text = 'edtConvenio'
                  Mascara = False
                  Alignment = taLeftJustify
                  TipoMascara = tmGERAL
                  NrDecimal = 2
                  Decimais = False
                  Negativo = False
                  Tamanho = 8
                  DataField = 'convenio'
                  DataSource = dtmcadastrobancos.dsrContas
                end
              end
              object gbxFormatacaoConvenio: TGroupBox
                Left = 114
                Top = 40
                Width = 146
                Height = 36
                Caption = 'FORMATA'#199#195'O CONV'#202'NIO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 4
                object edtFormatacaoConvenio: TDBEditTexto
                  Left = 2
                  Top = 10
                  Width = 141
                  Height = 23
                  DataField = 'formatacao_convenio'
                  DataSource = dtmcadastrobancos.dsrContas
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
              object gbxVariacaoCarteira: TGroupBox
                Left = 0
                Top = 40
                Width = 115
                Height = 36
                Caption = 'VARIA'#199#195'O CARTEIRA'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 3
                object edtVaricaoCarteira: TDBEditTexto
                  Left = 2
                  Top = 10
                  Width = 110
                  Height = 23
                  DataField = 'variacao_carteira'
                  DataSource = dtmcadastrobancos.dsrContas
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
              object gbxUsoDoBanco: TGroupBox
                Left = 258
                Top = 40
                Width = 135
                Height = 36
                Caption = ' USO DO BANCO '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 5
                object edtusodobanco: TDBEditTexto
                  Left = 2
                  Top = 10
                  Width = 130
                  Height = 23
                  DataField = 'usodobanco'
                  DataSource = dtmcadastrobancos.dsrContas
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
              object gbxCarteira: TGroupBox
                Left = 391
                Top = 40
                Width = 83
                Height = 36
                Caption = ' CARTEIRA '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 6
                object edtcarteira: TDBEditTexto
                  Left = 2
                  Top = 10
                  Width = 78
                  Height = 23
                  DataField = 'carteira'
                  DataSource = dtmcadastrobancos.dsrContas
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
              object gbxFormatacaoNossoNumero: TGroupBox
                Left = 165
                Top = 80
                Width = 160
                Height = 36
                Caption = 'FORMATA'#199#195'O NOSSO N'#218'MERO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 8
                object edtFormatacaoNossoNumero: TDBEditTexto
                  Left = 2
                  Top = 10
                  Width = 155
                  Height = 23
                  DataField = 'formatacao_nosso_numero'
                  DataSource = dtmcadastrobancos.dsrContas
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
              object gbxContrato: TGroupBox
                Left = 0
                Top = 80
                Width = 167
                Height = 36
                Caption = ' CONTRATO '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 7
                object edtContrato: TDBEditTexto
                  Left = 2
                  Top = 10
                  Width = 162
                  Height = 23
                  DataField = 'contrato'
                  DataSource = dtmcadastrobancos.dsrContas
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
              object gbxInformacoesReferenciais: TGroupBox
                Left = 0
                Top = 196
                Width = 246
                Height = 50
                Caption = ' INFORMA'#199#213'ES REFERENCIAIS '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 16
                object gbxCNPJ: TGroupBox
                  Left = 116
                  Top = 14
                  Width = 130
                  Height = 36
                  Caption = ' CNPJ '
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -9
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 2
                  object edtCNPJ: TDBEditCPFCNPJ
                    Left = 2
                    Top = 10
                    Width = 125
                    Height = 23
                    DataField = 'cnpj_agencia_referencia'
                    DataSource = dtmcadastrobancos.dsrContas
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -12
                    Font.Name = 'helvetica'
                    Font.Pitch = fpVariable
                    Font.Style = []
                    MaxLength = 14
                    ParentFont = False
                    TabOrder = 0
                    Tamanho = 14
                    Tipo = 'J'
                  end
                end
                object gbxBancoReferencia: TGroupBox
                  Left = 0
                  Top = 14
                  Width = 55
                  Height = 36
                  Caption = ' BANCO '
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -9
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                  object edtBancoReferencia: TDBEditTexto
                    Left = 2
                    Top = 10
                    Width = 50
                    Height = 23
                    DataField = 'bancoreferencia'
                    DataSource = dtmcadastrobancos.dsrContas
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
                object gbxAgenciaReferencial: TGroupBox
                  Left = 53
                  Top = 14
                  Width = 65
                  Height = 36
                  Caption = ' AG'#202'NCIA '
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -9
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 1
                  object edtAgenciaReferencia: TDBEditTexto
                    Left = 2
                    Top = 11
                    Width = 60
                    Height = 23
                    DataField = 'agenciareferencia'
                    DataSource = dtmcadastrobancos.dsrContas
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
              object gbxCodSingular: TGroupBox
                Left = 321
                Top = 80
                Width = 100
                Height = 36
                Caption = ' COD. SINGULAR '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 9
                object edtCodSingular: TDBEditTexto
                  Left = 2
                  Top = 10
                  Width = 95
                  Height = 23
                  DataField = 'codigo_singular'
                  DataSource = dtmcadastrobancos.dsrContas
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
              object chkIncluirInstrucoesArquivoBanco: TDBCheckBox
                Left = 257
                Top = 381
                Width = 213
                Height = 15
                Caption = 'Instru'#231#245'es no arquivo para o banco'
                DataField = 'incluirinstrucoesarquivobanco'
                DataSource = dtmcadastrobancos.dsrContas
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 23
                ValueChecked = 'True'
                ValueUnchecked = 'False'
              end
              object rgpCNAB: TtecDBRadioGroup
                Left = 244
                Top = 197
                Width = 62
                Height = 49
                Hint = 
                  'Padr'#227'o CNAB a ser utilizado na remessa de t'#237'tulos para cobran'#231'a:' +
                  '  CNAB240 ou CNAB400'
                Caption = ' CNAB '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 17
                TabStop = False
                DataField = 'PadraoCNAB'
                DataSource = dtmcadastrobancos.dsrContas
                object rbn240: TtecRadioButton
                  Left = 10
                  Top = 13
                  Width = 45
                  Height = 15
                  Hint = 
                    'Padr'#227'o CNAB a ser utilizado na remessa de t'#237'tulos para cobran'#231'a:' +
                    '  CNAB240 ou CNAB400'
                  Caption = '240'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                  Value = '2'
                end
                object rbn400: TtecRadioButton
                  Left = 10
                  Top = 31
                  Width = 45
                  Height = 14
                  Hint = 
                    'Padr'#227'o CNAB a ser utilizado na remessa de t'#237'tulos para cobran'#231'a:' +
                    '  CNAB240 ou CNAB400'
                  Caption = '400'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 1
                  Value = '4'
                end
              end
              object gbxEspecieDocto: TGroupBox
                Left = 0
                Top = 120
                Width = 240
                Height = 36
                Caption = ' ESP'#201'CIE DE DOCUMENTO '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 11
                object cmbEspecieDocto: TDBMaplistCombobox
                  Left = 2
                  Top = 10
                  Width = 235
                  Height = 23
                  Style = csDropDownList
                  DataField = 'EspecieDocto'
                  DataSource = dtmcadastrobancos.dsrContas
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  ItemHeight = 15
                  Items.Strings = (
                    '01 - Cheque'
                    '02 - Duplicata Mercantil'
                    '03 - Duplicata Mercantil p/ Indica'#231#227'o'
                    '04 - Duplicata de Servi'#231'o'
                    '05 - Duplicata de Servi'#231'o p/ Indica'#231#227'o'
                    '06 - Duplicata Rural'
                    '07 - Letra de C'#226'mbio'
                    '08 - Nota de Cr'#233'dito Comercial'
                    '09 - Nota de Cr'#233'dito a Exporta'#231#227'o'
                    '10 - Nota de Cr'#233'dito Industrial'
                    '11 - Nota de Cr'#233'dito Rural'
                    '12 - Nota Promiss'#243'ria'
                    '13 - Nota Promiss'#243'ria Rural'
                    '14 - Triplicata Mercantil'
                    '15 - Triplicata de Servi'#231'o'
                    '16 - Nota de Seguro'
                    '17 - Recibo'
                    '18 - Fatura'
                    '19 - Nota de D'#233'bito'
                    '20 - Ap'#243'lice de Seguro'
                    '21 - Mensalidade Escolar'
                    '22 - Parcela de Cons'#243'rcio'
                    '23 - Nota Fiscal'
                    '24 - Documento de D'#237'vida'
                    '25 - C'#233'dula de Produto Rural'
                    '26 - Warrant'
                    '27 - D'#237'vida Ativa de Estado')
                  ParentFont = False
                  TabOrder = 0
                  TabStop = False
                  ItemValues.Strings = (
                    '01'
                    '02'
                    '03'
                    '04'
                    '05'
                    '06'
                    '07'
                    '08'
                    '09'
                    '10'
                    '11'
                    '12'
                    '13'
                    '14'
                    '15'
                    '16'
                    '17'
                    '18'
                    '19'
                    '20'
                    '21'
                    '22'
                    '23'
                    '24'
                    '25'
                    '26'
                    '27')
                end
              end
              object gbxCodProtesto: TGroupBox
                Left = 238
                Top = 120
                Width = 188
                Height = 36
                Caption = ' C'#211'DIGO PROTESTO '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 12
                TabStop = True
                object cmbCodigoProtesto: TDBMaplistCombobox
                  Left = 2
                  Top = 10
                  Width = 184
                  Height = 23
                  Style = csDropDownList
                  DataField = 'CodigoProtesto'
                  DataSource = dtmcadastrobancos.dsrContas
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  ItemHeight = 15
                  Items.Strings = (
                    '1 - Protestar dias corridos'
                    '2 - Protestar dias '#250'teis'
                    '3 - N'#227'o protestar')
                  ParentFont = False
                  TabOrder = 0
                  TabStop = False
                  ItemValues.Strings = (
                    '1'
                    '2'
                    '3')
                end
              end
              object gbxNrDiasProtesto: TGroupBox
                Left = 424
                Top = 120
                Width = 50
                Height = 36
                Caption = 'N'#186' DIAS'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 13
                object DBEditNumero1: TDBEditNumero
                  Left = 2
                  Top = 10
                  Width = 45
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
                  Text = '1'
                  Mascara = False
                  Alignment = taLeftJustify
                  TipoMascara = tmGERAL
                  NrDecimal = 0
                  Decimais = False
                  Negativo = False
                  Tamanho = 2
                  DataField = 'NrDiasProtesto'
                  DataSource = dtmcadastrobancos.dsrContas
                end
              end
              object chkIncluirEmailNoArquivoBanco: TDBCheckBox
                Left = 5
                Top = 381
                Width = 245
                Height = 15
                Caption = 'E-mail do cliente no arquivo para o banco'
                DataField = 'EmailNoArquivoBanco'
                DataSource = dtmcadastrobancos.dsrContas
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 22
                ValueChecked = 'True'
                ValueUnchecked = 'False'
              end
              object gbxDiasBaixaAutomatica: TGroupBox
                Left = 328
                Top = 156
                Width = 145
                Height = 36
                Caption = 'N'#186' DIAS BAIXA aUTOM'#193'TICA'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 15
                object DBEditNumero2: TDBEditNumero
                  Left = 95
                  Top = 10
                  Width = 47
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
                  Tamanho = 2
                  DataField = 'ndiasbaixaautomatica'
                  DataSource = dtmcadastrobancos.dsrContas
                end
              end
              object gbxCodigoTipoMora: TGroupBox
                Left = 1
                Top = 156
                Width = 145
                Height = 36
                Caption = 'C'#211'DIGO DO TIPO DE MORA'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 14
                object edtCodigoTipoMora: TDBEditTexto
                  Left = 97
                  Top = 11
                  Width = 46
                  Height = 23
                  DataField = 'codigomora'
                  DataSource = dtmcadastrobancos.dsrContas
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
              object gbxChaveFixa: TGroupBox
                Left = 88
                Top = 0
                Width = 385
                Height = 36
                Caption = ' CHAVE FIXA'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 1
                object edtchave_fixa_sicredi: TDBEditTexto
                  Left = 2
                  Top = 10
                  Width = 380
                  Height = 23
                  DataField = 'chave_fixa_sicredi'
                  DataSource = dtmcadastrobancos.dsrContas
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
              object gbxSequencialdaRemessa: TGroupBox
                Left = 2
                Top = 400
                Width = 143
                Height = 36
                Caption = ' SEQUENCIAL DA REMESSA'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 24
                object edtSequencialdaRemessa: TDBEditTexto
                  Left = 2
                  Top = 10
                  Width = 138
                  Height = 23
                  DataField = 'sequencial'
                  DataSource = dtmcadastrobancos.dsrContas
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
              object ckbReiniciarSequencialNovaData: TDBCheckBox
                Left = 152
                Top = 416
                Width = 200
                Height = 17
                Caption = 'Incremento da remessa '#233' di'#225'rio'
                DataField = 'reiniciarsequencialnovadata'
                DataSource = dtmcadastrobancos.dsrContas
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 25
                ValueChecked = 'True'
                ValueUnchecked = 'False'
              end
              object rbnTipoCobranca_: TtecDBRadioGroup
                Left = 480
                Top = 0
                Width = 105
                Height = 105
                HelpType = htKeyword
                HelpKeyword = 
                  'Tipo de cobran'#231'a usado no banco, conforme codifica'#231#227'o adotada pe' +
                  'la FEBRABAN para modalidades de cobran'#231'a.'
                Caption = ' TIPO COBRAN'#199'A '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 2
                TabStop = False
                DataField = 'tipocobranca'
                DataSource = dtmcadastrobancos.dsrContas
                object tecCaucionada: TtecRadioButton
                  Left = 8
                  Top = 50
                  Width = 90
                  Height = 17
                  Hint = 
                    'C'#243'digo adotado pela FEBRABAN, para identificar a caracter'#237'stica ' +
                    'dos t'#237'tulos dentro das'
                  HelpType = htKeyword
                  HelpKeyword = 
                    'Tipo de cobran'#231'a usado no banco, conforme codifica'#231#227'o adotada pe' +
                    'la FEBRABAN para modalidades de cobran'#231'a.'
                  Caption = 'Caucionada'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                  Value = '3'
                end
                object tecSimples: TtecRadioButton
                  Left = 8
                  Top = 16
                  Width = 90
                  Height = 17
                  Hint = 
                    'C'#243'digo adotado pela FEBRABAN, para identificar a caracter'#237'stica ' +
                    'dos t'#237'tulos dentro das'
                  HelpType = htKeyword
                  HelpKeyword = 
                    'Tipo de cobran'#231'a usado no banco, conforme codifica'#231#227'o adotada pe' +
                    'la FEBRABAN para modalidades de cobran'#231'a.'
                  Caption = 'Simples'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 1
                  Value = '1'
                end
                object tecVinculada: TtecRadioButton
                  Left = 8
                  Top = 33
                  Width = 90
                  Height = 17
                  Hint = 
                    'C'#243'digo adotado pela FEBRABAN, para identificar a caracter'#237'stica ' +
                    'dos t'#237'tulos dentro das'
                  HelpType = htKeyword
                  HelpKeyword = 
                    'Tipo de cobran'#231'a usado no banco, conforme codifica'#231#227'o adotada pe' +
                    'la FEBRABAN para modalidades de cobran'#231'a.'
                  Caption = 'Vinculada'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 2
                  Value = '2'
                end
                object tecDescontada: TtecRadioButton
                  Left = 8
                  Top = 67
                  Width = 90
                  Height = 17
                  Hint = 
                    'C'#243'digo adotado pela FEBRABAN, para identificar a caracter'#237'stica ' +
                    'dos t'#237'tulos dentro das'
                  HelpType = htKeyword
                  HelpKeyword = 
                    'Tipo de cobran'#231'a usado no banco, conforme codifica'#231#227'o adotada pe' +
                    'la FEBRABAN para modalidades de cobran'#231'a.'
                  Caption = 'Descontada'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 3
                  Value = '4'
                end
                object tecVendor: TtecRadioButton
                  Left = 8
                  Top = 83
                  Width = 90
                  Height = 17
                  Hint = 
                    'C'#243'digo adotado pela FEBRABAN, para identificar a caracter'#237'stica ' +
                    'dos t'#237'tulos dentro das'
                  HelpType = htKeyword
                  HelpKeyword = 
                    'Tipo de cobran'#231'a usado no banco, conforme codifica'#231#227'o adotada pe' +
                    'la FEBRABAN para modalidades de cobran'#231'a.'
                  Caption = 'Vendor'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 4
                  Value = '5'
                end
              end
            end
            object tstDadosCedente: TTabSheet
              Caption = 'Cedente'
              ImageIndex = 1
              object gbxCedente: TGroupBox
                Left = 2
                Top = -1
                Width = 87
                Height = 36
                Caption = 'CEDENTE'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                object edtCedente: TDBEditTexto
                  Left = 2
                  Top = 10
                  Width = 81
                  Height = 23
                  DataField = 'cedente'
                  DataSource = dtmcadastrobancos.dsrContas
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
              object gbxNomeCedente: TGroupBox
                Left = 96
                Top = -1
                Width = 305
                Height = 35
                Caption = ' NOME CEDENTE '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 1
                object edtNomeCedente: TDBEditTexto
                  Left = 2
                  Top = 10
                  Width = 300
                  Height = 23
                  DataField = 'cedente_nome'
                  DataSource = dtmcadastrobancos.dsrContas
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
              inline fraEnderecoResidencia: TfraEnderecoEditor
                Left = 0
                Top = 80
                Width = 460
                Height = 156
                HorzScrollBar.Visible = False
                VertScrollBar.Visible = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = 13
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 3
                inherited gbxEndereco: TGroupBox
                  Width = 460
                  Height = 156
                  inherited pnlNumero: TPanel
                    Width = 456
                    inherited edtNumeroEndereco: TDBEditTexto
                      DataField = 'numero_endcedente'
                      DataSource = dtmcadastrobancos.dsrContas
                      MaxLength = 9
                    end
                    inherited edtComplemento: TDBEditTexto
                      DataField = 'complemento_endcedente'
                      DataSource = dtmcadastrobancos.dsrContas
                      MaxLength = 14
                    end
                  end
                  inherited pnlBairro: TPanel
                    Width = 456
                    inherited edtBairro: TtecDoubleDBEdit
                      LookupField = 'nomebairro_endcedente'
                      LookupSource = dtmcadastrobancos.dsrContas
                      DataField = 'bairro_endcedente'
                      DataSource = dtmcadastrobancos.dsrContas
                      MaxLength = 80
                    end
                  end
                  inherited pnlCidade: TPanel
                    Width = 456
                    inherited edtEstado: TDBEditTexto
                      DataField = 'estado_endcedente'
                      DataSource = dtmcadastrobancos.dsrContas
                      MaxLength = 9
                    end
                    inherited edtCidade: TtecDoubleDBEdit
                      LookupField = 'nomecidade_endcedente'
                      LookupSource = dtmcadastrobancos.dsrContas
                      DataField = 'cidade_endcedente'
                      DataSource = dtmcadastrobancos.dsrContas
                      MaxLength = 72
                    end
                    inherited edtCEP: TDBEditCep
                      DataField = 'cep_endcedente'
                      DataSource = dtmcadastrobancos.dsrContas
                    end
                  end
                  inherited pnlRua: TPanel
                    Width = 456
                    inherited mmoRua: TtecDBMemo
                      DataField = 'rua_endcedente'
                      DataSource = dtmcadastrobancos.dsrContas
                      Font.Height = -11
                    end
                  end
                  inherited pnllblCidade: TPanel
                    Width = 456
                  end
                  inherited pnllblBairro: TPanel
                    Width = 456
                  end
                  inherited pnllblNumero: TPanel
                    Width = 456
                  end
                end
              end
              object gbxCPNJCedente: TGroupBox
                Left = 2
                Top = 38
                Width = 138
                Height = 36
                Caption = 'CNPJ MF'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                TabOrder = 2
                object DBEditCPFCNPJ1: TDBEditCPFCNPJ
                  Left = 2
                  Top = 10
                  Width = 133
                  Height = 23
                  DataField = 'cnpj_agencia_referencia'
                  DataSource = dtmcadastrobancos.dsrContas
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = 'helvetica'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  MaxLength = 7
                  ParentFont = False
                  TabOrder = 0
                  Tamanho = 14
                  Tipo = 'J'
                end
              end
            end
          end
        end
      end
      object tstCobrancaPIX: TTabSheet
        Caption = 'Cobran'#231'a PIX'
        ImageIndex = 1
        DesignSize = (
          955
          478)
        object lbSantanderChavePIX: TLabel
          Left = 24
          Top = 0
          Width = 58
          Height = 16
          Caption = 'Chave PIX'
        end
        object lbSantanderTipoChave: TLabel
          Left = 688
          Top = 0
          Width = 63
          Height = 16
          Anchors = [akTop, akRight]
          Caption = 'Tipo Chave'
        end
        object lbSantanderConsumerKey: TLabel
          Left = 24
          Top = 43
          Width = 86
          Height = 16
          Caption = 'Consumer Key'
        end
        object lbSantanderConsumerSecret: TLabel
          Left = 24
          Top = 83
          Width = 101
          Height = 16
          Caption = 'Consumer Secret'
        end
        object imSantanderErroChavePIX: TImage
          Left = 856
          Top = 20
          Width = 16
          Height = 16
          Anchors = [akTop, akRight]
          Visible = False
        end
        object sbAcharCertificadoPFX: TSpeedButton
          Left = 640
          Top = 141
          Width = 24
          Height = 23
          Anchors = [akTop, akRight]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          OnClick = sbAcharCertificadoPFXClick
        end
        object lbSantanderArqCertificadoPFX: TLabel
          Left = 24
          Top = 125
          Width = 135
          Height = 16
          Caption = 'Arquivo Certificado PFX'
          Color = clBtnFace
          ParentColor = False
        end
        object lbErroCertificadoPFX: TLabel
          Left = 24
          Top = 166
          Width = 119
          Height = 16
          Caption = 'lbErroCertificadoPFX'
          Color = clBtnFace
          ParentColor = False
        end
        object lbSantanderSenhaCertificado: TLabel
          Left = 688
          Top = 125
          Width = 102
          Height = 16
          Caption = 'Senha Certificado'
        end
        object sbVerSenhaPFX: TSpeedButton
          Left = 856
          Top = 141
          Width = 23
          Height = 23
          AllowAllUp = True
          Anchors = [akTop, akRight]
          GroupIndex = 1
          OnClick = sbVerSenhaPFXClick
        end
        object Label15: TLabel
          Left = 24
          Top = 216
          Width = 55
          Height = 16
          Caption = 'Ambiente'
        end
        object Label17: TLabel
          Left = 208
          Top = 219
          Width = 46
          Height = 16
          Caption = 'Timeout'
        end
        object Label47: TLabel
          Left = 328
          Top = 216
          Width = 58
          Height = 16
          Caption = 'Expira'#231#227'o'
        end
        object imErroCertificadoPFX: TImage
          Left = 3
          Top = 144
          Width = 16
          Height = 16
          Visible = False
        end
        object edChavePIX: TDBEditTexto
          Left = 24
          Top = 16
          Width = 640
          Height = 24
          Anchors = [akLeft, akTop, akRight]
          DataField = 'pix_key'
          DataSource = dtmcadastrobancos.dsrContas
          MaxLength = -1
          TabOrder = 0
          CharCasenoDefault = False
          Alignment = taLeftJustify
        end
        object cbxTipoChave: TDBMaplistCombobox
          Left = 688
          Top = 16
          Width = 164
          Height = 24
          Style = csDropDownList
          Anchors = [akTop, akRight]
          DataField = 'type_pix_key'
          DataSource = dtmcadastrobancos.dsrContas
          ItemHeight = 16
          TabOrder = 1
          TabStop = False
        end
        object edConsumerKey: TDBEditTexto
          Left = 24
          Top = 59
          Width = 828
          Height = 24
          Anchors = [akLeft, akTop, akRight]
          DataField = 'consumer_key'
          DataSource = dtmcadastrobancos.dsrContas
          MaxLength = -1
          TabOrder = 2
          CharCasenoDefault = False
          Alignment = taLeftJustify
        end
        object edConsumerSecret: TDBEditTexto
          Left = 24
          Top = 99
          Width = 828
          Height = 24
          Anchors = [akLeft, akTop, akRight]
          DataField = 'consumer_secret'
          DataSource = dtmcadastrobancos.dsrContas
          MaxLength = -1
          TabOrder = 3
          CharCasenoDefault = False
          Alignment = taLeftJustify
        end
        object edArqCertificadoPFX: TDBEditTexto
          Left = 24
          Top = 141
          Width = 616
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          DataField = 'path_file_pixcertified'
          DataSource = dtmcadastrobancos.dsrContas
          MaxLength = -1
          TabOrder = 4
          CharCasenoDefault = False
          Alignment = taLeftJustify
        end
        object edSenhaCertificadoPFX: TDBEditTexto
          Left = 688
          Top = 141
          Width = 164
          Height = 24
          Anchors = [akLeft, akTop, akRight]
          DataField = 'pass_pixcertified'
          DataSource = dtmcadastrobancos.dsrContas
          MaxLength = -1
          PasswordChar = '*'
          TabOrder = 5
          CharCasenoDefault = False
          Alignment = taLeftJustify
        end
        object cbxAmbiente: TDBMaplistCombobox
          Left = 24
          Top = 235
          Width = 170
          Height = 24
          Style = csDropDownList
          DataField = 'ambiente_cobranca_pix'
          DataSource = dtmcadastrobancos.dsrContas
          ItemHeight = 16
          TabOrder = 6
        end
        object seTimeout: TDBSpinEdit
          Left = 208
          Top = 235
          Width = 106
          Height = 26
          DataField = 'tempo_espera_cobranca_pix'
          DataSource = dtmcadastrobancos.dsrContas
          TabOrder = 7
          Increment = 10
          MaxValue = 999999
          MinValue = 0
          Value = 0
        end
        object seCobrancaExpiracao: TDBSpinEdit
          Left = 328
          Top = 235
          Width = 106
          Height = 26
          DataField = 'expiracao_cobranca_pix'
          DataSource = dtmcadastrobancos.dsrContas
          TabOrder = 8
          Increment = 10
          MaxValue = 999999
          MinValue = 0
          Value = 0
        end
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 192
    Top = 560
  end
  object ACBrOpenSSLUtils1: TACBrOpenSSLUtils
    Left = 224
    Top = 560
  end
  object ImageList1: TImageList
    Left = 880
    Top = 560
    Bitmap = {
      494C010122002700040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000040000000A0000000010020000000000000A0
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F2C4F200B2B2B200737373003D3D3D003D3D3D0073737300B2B2B200F5B2
      F500000000000000000000000000000000000000000000000000000000000000
      0000FB83FB00BBBBBB0094949400585858005858580094949400BBBBBB00FB83
      FB00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000AFAF
      AF0055555500BDBDBD00E8E8E8000000000000000000E8E8E800BDBDBD005555
      5500B0B0B000000000000000000000000000000000000000000000000000C5C5
      C500353535006A6A6A00A3A3A300C5C5C500C5C5C500A3A3A3006A6A6A003535
      3500C5C5C5000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008C8C8C009A9A
      9A00000000000000000000000000000000000000000000000000000000000000
      0000999999008D8D8D0000000000000000000000000000000000939393002E2E
      2E00C3C3C3000000000000000000E4E4E400E4E4E4000000000000000000C3C3
      C3002E2E2E009393930000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AEAEAE009A9A9A000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000098989800B0B0B0000000000000000000C5C5C5002E2E2E00E8E8
      E8000000000000000000000000009E9E9E009E9E9E0000000000000000000000
      0000E8E8E8002E2E2E00C5C5C500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F2C4F20056565600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000055555500F5B2F500FB83FB0035353500C3C3C3000000
      00000000000000000000D6D6D6004040400045454500E2E2E200000000000000
      000000000000C3C3C30035353500FB83FB000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B1B1B100BDBDBD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BCBCBC00B2B2B200BBBBBB006A6A6A00000000000000
      000000000000000000001C1C1C00A0A0A000A9A9A90038383800000000000000
      000000000000000000006A6A6A00BCBCBC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000071717100EBE2EB00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000E8E8E8007373730094949400A3A3A300000000000000
      000000000000D6D6D60000000000000000000000000000000000FB83FB000000
      00000000000000000000A3A3A300949494000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004040400000000000000000000000
      0000C5C5C500B6B6B600B6B6B600B6B6B600B6B6B600B6B6B600B6B6B600C5C5
      C5000000000000000000000000004242420058585800C5C5C500000000000000
      0000000000000000000000000000CECECE00717171007E7E7E00000000000000
      00000000000000000000C5C5C500585858000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003D3D3D0000000000000000000000
      0000CACACA00C1C1C100C1C1C100C1C1C100C1C1C100C1C1C100C1C1C100CACA
      CA000000000000000000000000004040400058585800C5C5C500000000000000
      00000000000000000000A9A9A9002E2E2E00A3A3A30000000000000000000000
      00000000000000000000C5C5C500585858000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000071717100EBE2EB00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000E8E8E8007373730094949400A3A3A300000000000000
      000000000000FB83FB0000000000E4E4E400000000009E9E9E00E4E4E4000000
      00000000000000000000A3A3A300949494000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B0B0B000BEBEBE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BDBDBD00B2B2B200BBBBBB006A6A6A00000000000000
      0000000000000000000000000000D0D0D000CACACA0000000000EED4EE000000
      000000000000000000006A6A6A00BCBCBC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F2C4F20058585800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000056565600F2C4F200FB83FB0035353500C3C3C3000000
      00000000000000000000CBCBCB001C1C1C0000000000ADADAD00000000000000
      000000000000C3C3C30035353500FB83FB000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000ADADAD009B9B9B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009A9A9A00AFAFAF000000000000000000C5C5C5002E2E2E00E8E8
      E8000000000000000000000000009B9B9B009797970000000000000000000000
      0000E8E8E8002E2E2E00C5C5C500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008B8B8B009B9B
      9B00000000000000000000000000000000000000000000000000000000000000
      00009A9A9A008C8C8C0000000000000000000000000000000000939393002E2E
      2E00C3C3C3000000000000000000E4E4E400E4E4E4000000000000000000C3C3
      C3002E2E2E009393930000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000ADAD
      AD0056565600BEBEBE00EBE2EB000000000000000000E8E8E800BEBEBE005656
      5600AEAEAE00000000000000000000000000000000000000000000000000C5C5
      C500353535006A6A6A00A3A3A300C5C5C500C5C5C500A3A3A3006A6A6A003535
      3500C5C5C5000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F2C4F200B0B0B000727272003B3B3B003B3B3B0072727200B0B0B000F2C4
      F200000000000000000000000000000000000000000000000000000000000000
      0000FB83FB00BBBBBB0094949400585858005858580094949400BBBBBB00FB83
      FB00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F2C4F200B2B2B200737373003D3D3D003D3D3D0073737300B2B2B200F5B2
      F500000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000AFAF
      AF0055555500BDBDBD00E8E8E8000000000000000000E8E8E800BDBDBD005555
      5500B0B0B0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D7D7D7002A2A2A000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000016161600D7D7D700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D6D6D600D5D5
      D500D5D5D50000000000000000000000000000000000000000008C8C8C009A9A
      9A00000000000000000000000000000000000000000000000000000000000000
      0000999999008D8D8D0000000000000000000000000000000000FB83FB00BDBD
      BD00A2A2A200AEAEAE00DDDDDD00000000000000000000000000E5E5E5009C9C
      9C009C9C9C009C9C9C00C5C5C50000000000000000009F9F9F0081818100D5D5
      D500D5D5D500D5D5D500D5D5D500D5D5D500D5D5D500D5D5D500D5D5D500D5D5
      D500D5D5D500818181009F9F9F00000000000000000000000000000000004B4B
      4B00C3C3C3000000000000000000000000000000000000000000BDBDBD000000
      000000000000D5D5D500000000000000000000000000AEAEAE009A9A9A000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000098989800B0B0B0000000000000000000CCCCCC00404040006262
      62009696960081818100222222009B9B9B000000000000000000D5D5D5002A2A
      2A00979797005D5D5D009C9C9C0000000000000000009C9C9C009C9C9C00E5E5
      E500D5D5D500D5D5D500E5E5E500000000000000000000000000000000000000
      0000000000009C9C9C009C9C9C0000000000000000000000000000000000C3C3
      C3002A2A2A00C2C2C20000000000000000000000000000000000C6C6C6000D0D
      0D0000000000D5D5D5000000000000000000F2C4F20056565600000000000000
      0000000000000000000000000000C7C7C700C7C7C70000000000000000000000
      0000000000000000000055555500F5B2F500DFDFDF002A2A2A00BABABA000000
      00000000000000000000E1E1E1004F4F4F00ABABAB0000000000D0D0D0004D4D
      4D00000000009C9C9C009898980000000000000000009C9C9C009C9C9C00A3A3
      A3004242420042424200A3A3A300000000000000000000000000000000000000
      0000000000009C9C9C009C9C9C00000000000000000000000000000000000000
      0000C5C5C5001C1C1C00C2C2C2000000000000000000C4C4C40022222200C4C4
      C400BDBDBD00D6D6D6000000000000000000B1B1B100BDBDBD00000000000000
      0000000000000000000000000000BBBBBB00BBBBBB0000000000000000000000
      00000000000000000000BCBCBC00B2B2B2008F8F8F009393930000000000AFAF
      AF00515151008282820000000000CECECE001616160042424200353535004D4D
      4D00000000009C9C9C002222220042424200000000009C9C9C009C9C9C000000
      00000000000000000000000000000000000000000000ADADAD00CBCBCB000000
      0000000000009C9C9C009C9C9C00000000000000000000000000000000000000
      000000000000C6C6C6002E2E2E00C2C2C20000000000A7A7A700C2C2C2000000
      00000000000000000000000000000000000071717100EBE2EB00000000000000
      0000000000000000000000000000BBBBBB00BBBBBB0000000000000000000000
      00000000000000000000E8E8E8007373730040404000CCCCCC00E4E4E4002626
      2600C0C0C00065656500B0B0B00000000000D5D5D500D5D5D500D5D5D500D9D9
      D90000000000E5E5E500B2B2B20000000000000000009C9C9C009C9C9C00C5C5
      C5009C9C9C009C9C9C00C5C5C50000000000ABABAB001C1C1C0022222200CDCD
      CD00000000009C9C9C009C9C9C00000000000000000000000000000000000000
      00000000000000000000C2C2C20026262600C5C5C50000000000000000000000
      0000000000000000000000000000000000004040400000000000000000000000
      0000C5C5C500B6B6B600B6B6B6008484840084848400B6B6B600B6B6B600C5C5
      C5000000000000000000000000004242420040404000CCCCCC00E4E4E4002626
      2600C0C0C00065656500B0B0B00000000000D5D5D500D5D5D500D5D5D500D5D5
      D500D5D5D500D5D5D500B2B2B20000000000000000009C9C9C009C9C9C00C5C5
      C5009C9C9C009C9C9C00C5C5C50000000000CECECE00D9D9D900BDBDBD002A2A
      2A00CBCBCB009B9B9B009C9C9C00000000000000000000000000000000000000
      0000000000000000000000000000C5C5C50026262600C2C2C200000000000000
      0000000000000000000000000000000000003D3D3D0000000000000000000000
      0000CACACA00C1C1C100C1C1C1008D8D8D008D8D8D00C1C1C100C1C1C100CACA
      CA00000000000000000000000000404040008F8F8F009393930000000000AFAF
      AF00515151008282820000000000CECECE001616160042424200424242004242
      420042424200424242004242420042424200000000009C9C9C009C9C9C000000
      000000000000000000000000000000000000000000000000000000000000BBBB
      BB00BFBFBF009B9B9B009C9C9C00000000000000000000000000000000000000
      000000000000C6C6C600A7A7A70000000000C2C2C2002A2A2A00C2C2C2000000
      00000000000000000000000000000000000071717100EBE2EB00000000000000
      0000000000000000000000000000BBBBBB00BBBBBB0000000000000000000000
      00000000000000000000E8E8E80073737300E0E0E0002A2A2A00B7B7B7000000
      00000000000000000000DFDFDF0045454500AFAFAF0000000000000000000000
      000000000000000000000000000000000000000000009C9C9C009C9C9C009C9C
      9C0000000000000000009C9C9C00000000000000000000000000000000000000
      0000000000009C9C9C009C9C9C00000000000000000000000000000000000000
      0000C2C2C20016161600C5C5C5000000000000000000C5C5C5001C1C1C00C1C1
      C100B9B9B900D6D6D6000000000000000000B0B0B000BEBEBE00000000000000
      0000000000000000000000000000BBBBBB00BBBBBB0000000000000000000000
      00000000000000000000BDBDBD00B2B2B20000000000CCCCCC00404040006262
      62009696960081818100222222009C9C9C000000000000000000000000000000
      000000000000000000000000000000000000000000009C9C9C009C9C9C00E5E5
      E500D5D5D500D5D5D500E5E5E500000000000000000000000000000000000000
      0000000000009C9C9C009C9C9C0000000000000000000000000000000000C3C3
      C3002A2A2A00C2C2C20000000000000000000000000000000000C4C4C4000000
      000000000000D5D5D5000000000000000000F2C4F20058585800000000000000
      0000000000000000000000000000C7C7C700C7C7C70000000000000000000000
      0000000000000000000056565600F2C4F2000000000000000000FB83FB00BDBD
      BD00A2A2A200AEAEAE00DDDDDD00000000000000000000000000000000000000
      000000000000000000000000000000000000000000009F9F9F0081818100D5D5
      D500D5D5D500D5D5D500D5D5D500D5D5D500D5D5D500D5D5D500D5D5D500D5D5
      D500D5D5D500818181009F9F9F00000000000000000000000000000000004B4B
      4B00C3C3C3000000000000000000000000000000000000000000BDBDBD000000
      000000000000D5D5D500000000000000000000000000ADADAD009B9B9B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009A9A9A00AFAFAF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D8D8D800515151004242
      4200424242004242420042424200424242004242420042424200424242004242
      4200424242004B4B4B00D8D8D800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D6D6D600D5D5
      D500D5D5D50000000000000000000000000000000000000000008B8B8B009B9B
      9B00000000000000000000000000000000000000000000000000000000000000
      00009A9A9A008C8C8C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000ADAD
      AD0056565600BEBEBE00EBE2EB000000000000000000E8E8E800BEBEBE005656
      5600AEAEAE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F2C4F200B0B0B000727272003B3B3B003B3B3B0072727200B0B0B000F2C4
      F200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E8E8E800EBE2EB0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BFBF
      BF009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C00BBBBBB000000000000000000000000000000000000000000000000000000
      000000000000E0E0E000898989001C1C1C00353535008F8F8F00E4E4E4000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E4E4E400BCBCBC00A1A1A100A3A3A300BEBEBE00E6E6E6000000
      0000000000000000000000000000000000000000000000000000ADADAD006262
      62005D5D5D005D5D5D005D5D5D005D5D5D005D5D5D005D5D5D005D5D5D005D5D
      5D005F5F5F00B4B4B40000000000000000000000000000000000DADADA001616
      1600000000000000000000000000000000000000000000000000000000000000
      000032323200E3E3E30000000000000000000000000000000000000000000000
      0000CFCFCF00474747000000000000000000DEDEDE008D8D8D0051515100D5D5
      D500000000000000000000000000000000000000000000000000000000000000
      00009B9B9B003D3D3D007575750097979700969696007171710040404000A1A1
      A1000000000000000000000000000000000000000000000000005F5F5F000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006565650000000000000000000000000000000000D5D5D5000000
      000082828200CACACA004D4D4D00B2B2B200B2B2B2004D4D4D00CACACA008282
      82001C1C1C00DBDBDB000000000000000000000000000000000000000000E0E0
      E000323232000000000000000000000000000000000000000000ACACAC004040
      4000E6E6E6000000000000000000000000000000000000000000000000007878
      780068686800DBDBDB0000000000000000000000000000000000D7D7D7005F5F
      5F008383830000000000000000000000000000000000000000005D5D5D000000
      0000000000009C9C9C00D5D5D500D5D5D5009C9C9C00000000005D5D5D000000
      0000000000005D5D5D0000000000000000000000000000000000D5D5D5000000
      000082828200CACACA004D4D4D00D5D5D500D5D5D5004D4D4D00CACACA008282
      82001C1C1C00DBDBDB0000000000000000000000000000000000000000007070
      7000000000000000000000000000000000000000000000000000000000009292
      92007979790000000000000000000000000000000000000000009B9B9B006868
      6800000000000000000000000000E5E5E500E5E5E50000000000000000000000
      00005D5D5D00A4A4A400000000000000000000000000000000005D5D5D000000
      00009C9C9C005D5D5D0081818100818181005D5D5D0094949400353535000000
      0000000000005F5F5F0000000000000000000000000000000000D5D5D5000000
      000035353500585858001C1C1C00CACACA00CACACA001C1C1C00585858003535
      35001C1C1C00DBDBDB0000000000000000000000000000000000CDCDCD001616
      160000000000000000000000000000000000000000000000000000000000F5B2
      F50035353500D4D4D400000000000000000000000000E4E4E4003D3D3D00DBDB
      DB00000000000000000000000000ABABAB00ABABAB0000000000000000000000
      0000D5D5D50042424200EBE2EB00000000000000000000000000888888000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008D8D8D0000000000000000000000000000000000D5D5D5000000
      000094949400E6E6E600585858004D4D4D004D4D4D0058585800E6E6E6009494
      94001C1C1C00DBDBDB0000000000000000000000000000000000949494000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000909090009F9F9F00000000000000000000000000BCBCBC00757575000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000066666600C5C5C50000000000000000000000000000000000D9D9
      D900D5D5D500D5D5D500D5D5D500D5D5D500D5D5D500CACACA004D4D4D00B2B2
      B200DBDBDB000000000000000000000000000000000000000000D5D5D5000000
      00009C9C9C00000000005D5D5D00B2B2B200B2B2B2005D5D5D00000000009C9C
      9C001C1C1C00DBDBDB00000000000000000000000000000000006D6D6D000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C2C2C20076767600000000000000000000000000A2A2A200979797000000
      0000000000000000000000000000C5C5C500C5C5C50000000000000000000000
      0000000000008E8E8E00ACACAC00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000005D5D5D00D5D5
      D500000000000000000000000000000000000000000000000000D5D5D5000000
      000082828200CACACA004D4D4D00B2B2B200B2B2B2004D4D4D00CACACA008282
      82001C1C1C00DBDBDB00000000000000000000000000000000005D5D5D00D5D5
      D500000000000000000000000000000000000000000000000000000000000000
      00000000000063636300000000000000000000000000A3A3A300969696000000
      00000000000000000000000000009C9C9C009C9C9C0000000000000000000000
      0000000000008D8D8D00ADADAD00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007E7E7E00DBDB
      DB00000000000000000000000000000000000000000000000000D5D5D5000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001C1C1C00DBDBDB00000000000000000000000000000000005D5D5D00D5D5
      D500000000000000000000000000000000000000000000000000000000000000
      0000000000005D5D5D00000000000000000000000000BEBEBE00717171000000
      00000000000000000000000000009C9C9C009C9C9C0000000000000000000000
      00000000000063636300C7C7C700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DEDEDE002626
      2600000000000000000000000000000000000000000000000000000000000000
      00001C1C1C00DBDBDB00000000000000000000000000000000005D5D5D00D5D5
      D500000000000000000000000000000000000000000000000000000000000000
      0000000000005D5D5D00000000000000000000000000E6E6E60040404000D7D7
      D7000000000000000000000000009C9C9C009C9C9C0000000000000000000000
      0000D1D1D10047474700F2C4F200000000000000000000000000000000000000
      000000000000000000000000000000000000DEDEDE009A9A9A00CACACA00B2B2
      B200B6B6B600000000000000000000000000000000000000000000000000C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      00001C1C1C00DBDBDB00000000000000000000000000000000005D5D5D00CECE
      CE00000000000000000000000000000000000000000000000000000000000000
      0000000000005D5D5D0000000000000000000000000000000000A1A1A1005F5F
      5F00000000000000000000000000E5E5E500E5E5E5000000000000000000FB83
      FB0055555500AAAAAA0000000000000000000000000000000000000000000000
      0000000000000000000000000000CDCDCD00C0C0C000DBDBDB00C4C4C400D2D2
      D200D5D5D500B1B1B10000000000000000000000000000000000000000000000
      0000C0C0C0002626260000000000000000000000000000000000000000000000
      00001C1C1C00DBDBDB0000000000000000000000000000000000868686002A2A
      2A0097979700DFDFDF0000000000000000000000000000000000000000000000
      0000262626008888880000000000000000000000000000000000000000008181
      81005D5D5D00D5D5D50000000000000000000000000000000000D1D1D1005555
      55008C8C8C000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C7C7C700949494009C9C9C009595
      9500B4B4B4000000000000000000000000000000000000000000000000000000
      000000000000BFBFBF002E2E2E00000000000000000000000000000000000000
      00002E2E2E00E1E1E1000000000000000000000000000000000000000000D6D6
      D6008B8B8B004040400083838300CFCFCF000000000000000000383838008F8F
      8F00D9D9D9000000000000000000000000000000000000000000000000000000
      0000A4A4A40042424200666666008E8E8E008D8D8D006363630047474700AAAA
      AA00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C7C7C7009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C00CBCBCB000000000000000000000000000000000000000000000000000000
      000000000000E2E2E200A3A3A3004242420047474700A7A7A700E4E4E4000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000EBE2EB00C5C5C500ACACAC00ADADAD00C7C7C700F2C4F2000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FD5FFD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E5E5E500D5D5D500D5D5D500D5D5D500D5D5D500E5E5E5000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000ABABAB005D5D5D005D5D5D005D5D5D005D5D5D00ABABAB000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DDDDDD00D5D5
      D500D5D5D500D5D5D500D5D5D500D5D5D500D5D5D500D5D5D500D5D5D500D5D5
      D500D5D5D500DBDBDB0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C0C0C00080808000636363006363630083838300C5C5C5000000
      0000000000000000000000000000000000000000000000000000ADADAD006262
      62005D5D5D005D5D5D005D5D5D005D5D5D005D5D5D005D5D5D005D5D5D005D5D
      5D005F5F5F00B4B4B400000000000000000000000000B8B8B800222222000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001C1C1C00C7C7C700000000000000000000000000000000000000
      0000D8D8D800A0A0A0009C9C9C009C9C9C009C9C9C009C9C9C009E9E9E00D9D9
      D900000000000000000000000000000000000000000000000000000000000000
      0000767676004B4B4B00AEAEAE00D1D1D100D0D0D000AAAAAA00454545007E7E
      7E000000000000000000000000000000000000000000000000005F5F5F00B2B2
      B200D5D5D500D5D5D500D5D5D500D5D5D500D5D5D500D5D5D500D5D5D500D5D5
      D500B2B2B200656565000000000000000000000000009C9C9C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000009C9C9C00000000000000000000000000000000000000
      00002E2E2E000000000000000000000000000000000000000000000000005A5A
      5A00000000000000000000000000000000000000000000000000000000007676
      7600838383000000000000000000000000000000000000000000FD5FFD007A7A
      7A008080800000000000000000000000000000000000000000005D5D5D00D5D5
      D500000000000000000000000000000000000000000000000000000000000000
      0000D5D5D5005D5D5D000000000000000000000000009C9C9C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000009C9C9C00000000000000000000000000000000000000
      0000000000004D4D4D005D5D5D005D5D5D005D5D5D005D5D5D004D4D4D000000
      0000000000000000000000000000000000000000000000000000C0C0C0004B4B
      4B0000000000000000000000000000000000000000000000000000000000FB83
      FB0040404000C8C8C800000000000000000000000000000000005D5D5D00D5D5
      D500000000000000000000000000000000000000000000000000000000000000
      0000D5D5D5005D5D5D000000000000000000000000009C9C9C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000009C9C9C00000000000000000000000000000000000000
      000000000000CACACA0000000000000000000000000000000000CACACA000000
      000000000000000000000000000000000000000000000000000080808000AEAE
      AE00000000000000000000000000000000000000000000000000000000000000
      0000A3A3A3008B8B8B00000000000000000000000000000000005D5D5D00D5D5
      D500000000000000000000000000000000000000000000000000000000000000
      0000D5D5D5005D5D5D000000000000000000000000009C9C9C00000000000000
      0000000000000000000022222200A8A8A800A1A1A10016161600000000000000
      000000000000000000009C9C9C00000000000000000000000000000000000000
      000000000000D5D5D50000000000000000000000000000000000D5D5D5000000
      000000000000000000000000000000000000000000000000000063636300D1D1
      D100000000000000000000000000C5C5C500C5C5C50000000000000000000000
      0000C9C9C9006C6C6C00000000000000000000000000000000005D5D5D008686
      8600D1D1D100CDCDCD00A3A3A300D0D0D000CBCBCB00A3A3A300CFCFCF00CDCD
      CD00858585005D5D5D000000000000000000000000009C9C9C00000000000000
      0000161616007E7E7E00E1E1E100FB83FB0000000000DDDDDD00767676000D0D
      0D0000000000000000009C9C9C00000000000000000000000000000000000000
      000000000000D5D5D50000000000000000000000000000000000D5D5D5000000
      000000000000000000000000000000000000000000000000000060606000D2D2
      D2000000000000000000000000009C9C9C009C9C9C0000000000000000000000
      0000C7C7C7006A6A6A00000000000000000000000000C8C8C800323232008787
      87001C1C1C0035353500838383002A2A2A0032323200838383002A2A2A002626
      26008787870032323200D4D4D40000000000000000009C9C9C00000000004D4D
      4D00C0C0C00000000000C4C4C400515151005A5A5A00CACACA0000000000BBBB
      BB0047474700000000009C9C9C00000000000000000000000000000000000000
      000000000000D5D5D50000000000000000000000000000000000D5D5D5000000
      000000000000000000000000000000000000000000000000000080808000ADAD
      AD000000000000000000000000009C9C9C009C9C9C0000000000000000000000
      00009E9E9E008A8A8A000000000000000000000000009F9F9F008F8F8F000000
      00008585850093939300000000008B8B8B009393930000000000858585009393
      93000000000085858500AFAFAF0000000000000000009C9C9C0072727200EBE2
      EB00E1E1E100858585001616160000000000000000001C1C1C008D8D8D00E5E5
      E500E6E6E600707070009C9C9C00000000000000000000000000000000000000
      000000000000D5D5D50000000000000000000000000000000000D5D5D5000000
      0000000000000000000000000000000000000000000000000000C3C3C3004949
      4900FB83FB0000000000000000009C9C9C009C9C9C000000000000000000EBE2
      EB003B3B3B00CBCBCB00000000000000000000000000B9B9B9007C7C7C000000
      0000A9A9A9008C8C8C00000000009C9C9C009C9C9C000000000080808000B3B3
      B300000000006E6E6E00C3C3C30000000000000000009C9C9C008F8F8F00B2B2
      B200383838000000000000000000000000000000000000000000000000004040
      4000B9B9B900919191009C9C9C00000000000000000000000000000000000000
      000000000000D5D5D50000000000000000000000000000000000D5D5D5000000
      0000000000000000000000000000000000000000000000000000000000007C7C
      7C008A8A8A0000000000000000009C9C9C009C9C9C0000000000000000008080
      80008686860000000000000000000000000000000000DCDCDC003B3B3B000000
      0000BEBEBE0076767600000000009C9C9C009C9C9C00000000006D6D6D00C7C7
      C700F89DF8002E2E2E00E2E2E2000000000000000000C4C4C400262626000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000032323200C4C4C400000000000000000000000000000000000000
      000000000000B2B2B200D5D5D500D5D5D500D5D5D500D5D5D500B2B2B2000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000EBE2EB0000000000000000009C9C9C009C9C9C000000000000000000EBE2
      EB0000000000000000000000000000000000000000000000000058585800BABA
      BA00ADADAD0053535300CDCDCD008282820082828200C9C9C90049494900B3B3
      B300B0B0B0006363630000000000000000000000000000000000DEDEDE00D5D5
      D500D5D5D500D5D5D500D5D5D500D5D5D500D5D5D500D5D5D500D5D5D500D5D5
      D500D5D5D500E3E3E30000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000D0D
      0D00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000ABABAB00ABABAB0000000000000000000000
      0000000000000000000000000000000000000000000000000000BABABA006C6C
      6C00686868006868680068686800686868006868680068686800686868006868
      68006C6C6C00C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007F7F7F000000000000000000000000000000000000000000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000DEDEDE00DDDDDD00DDDDDD00DDDDDD00DDDDDD00E1E1E1000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E4E4E400BCBCBC00A2A2A200A3A3A300BEBEBE00E6E6E6000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E4E4E400BCBCBC00A2A2A200A3A3A300BEBEBE00E6E6E6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009B9B9B0035353500000000000000000000000000000000003B3B3B00A1A1
      A100000000000000000000000000000000000000000000000000000000000000
      00009B9B9B0035353500000000000000000000000000000000003B3B3B00A0A0
      A00000000000000000000000000000000000000000000000000000000000D7D7
      D700D5D5D500D5D5D500D5D5D500DADADA000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007979
      7900000000000000000000000000000000000000000000000000000000000000
      0000828282000000000000000000000000000000000000000000000000007878
      7800000000000000000000000000000000000000000000000000000000000000
      0000828282000000000000000000000000000000000000000000808080000D0D
      0D0000000000000000000000000016161600C7C7C70000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009B9B9B000000
      00000000000000000000666666002A2A2A000000000000000000000000000000
      000000000000A4A4A400000000000000000000000000000000009B9B9B000000
      00000D0D0D006A6A6A001C1C1C00000000000000000022222200696969000D0D
      0D0000000000A4A4A400000000000000000000000000000000005D5D5D000000
      0000000000000000000000000000000000009C9C9C00000000005D5D5D000000
      00009C9C9C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E4E4E400353535000000
      0000000000009191910000000000C0C0C0001C1C1C0000000000000000000000
      00000000000040404000EBE2EB000000000000000000E4E4E400353535000000
      00006A6A6A0000000000B2B2B2001C1C1C0022222200B9B9B900000000005F5F
      5F000000000040404000EBE2EB000000000000000000000000005D5D5D000000
      0000000000000000000000000000000000009C9C9C0000000000DBDBDB00D5D5
      D500E5E5E5000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BCBCBC00000000000000
      00008F8F8F0000000000E2E2E20000000000BEBEBE0022222200000000000000
      00000000000000000000C5C5C5000000000000000000BCBCBC00000000000000
      00001C1C1C00B2B2B20000000000B2B2B200BABABA0000000000AAAAAA001616
      16000000000000000000C5C5C5000000000000000000000000005D5D5D000000
      0000000000000000000000000000000000009C9C9C0000000000DBDBDB00D5D5
      D500D5D5D500DBDBDB0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A2A2A200000000008686
      860000000000CECECE0040404000A6A6A60000000000BEBEBE001C1C1C000000
      00000000000000000000ACACAC000000000000000000A2A2A200000000000000
      0000000000001C1C1C00B2B2B2000000000000000000A9A9A900161616000000
      00000000000000000000ACACAC000000000000000000000000005D5D5D000000
      0000000000000000000000000000000000009C9C9C00000000005D5D5D000000
      0000000000005D5D5D0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A3A3A300000000007D7D
      7D00C6C6C600262626000000000000000000A6A6A60000000000C0C0C0002A2A
      2A000000000000000000ADADAD000000000000000000A3A3A300000000000000
      00000000000022222200BABABA000000000000000000B2B2B2001C1C1C000000
      00000000000000000000ADADAD000000000000000000000000005D5D5D000000
      0000000000000000000000000000000000009C9C9C0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BEBEBE00000000000000
      00000000000000000000000000000000000016161600A8A8A80000000000C0C0
      C0001C1C1C0000000000C7C7C7000000000000000000BEBEBE00000000000000
      000022222200B9B9B90000000000A9A9A900B2B2B20000000000B2B2B2001C1C
      1C000000000000000000C7C7C7000000000000000000000000005D5D5D000000
      0000000000000000000000000000000000009C9C9C0000000000ABABAB009C9C
      9C009C9C9C009C9C9C00C5C5C500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E6E6E6003B3B3B000000
      0000000000000000000000000000000000000000000016161600A8A8A8000000
      0000A3A3A30045454500F2C4F2000000000000000000E6E6E6003B3B3B000000
      00006969690000000000AAAAAA00161616001C1C1C00B2B2B200FB83FB005D5D
      5D000000000045454500F2C4F200000000000000000000000000ABABAB009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C00C5C5C50000000000ABABAB009C9C
      9C009C9C9C009C9C9C00C5C5C500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A1A1A1000000
      0000000000000000000000000000000000000000000000000000161616009595
      950047474700AAAAAA0000000000000000000000000000000000A0A0A0000000
      00000D0D0D005F5F5F001616160000000000000000001C1C1C005D5D5D000D0D
      0D0000000000AAAAAA00000000000000000000000000C5C5C5009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C00E5E5E500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008282
      8200000000000000000000000000000000000000000000000000000000000000
      00008B8B8B000000000000000000000000000000000000000000000000008181
      8100000000000000000000000000000000000000000000000000000000000000
      00008A8A8A0000000000000000000000000000000000C5C5C5009C9C9C007979
      7900000000000000000026262600929292009C9C9C00E5E5E500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000A4A4A400404040000000000000000000000000000000000045454500AAAA
      AA00000000000000000000000000000000000000000000000000000000000000
      0000A4A4A400404040000000000000000000000000000000000045454500AAAA
      AA00000000000000000000000000000000000000000000000000000000000000
      0000D5D5D500D5D5D500DEDEDE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000EBE2EB00C5C5C500ADADAD00ADADAD00C7C7C700F2C4F2000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000EBE2EB00C5C5C500ADADAD00ADADAD00C7C7C700F2C4F2000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000D4D4D400D2D2D200D2D2D200D2D2D200D2D2D200D2D2D200D2D2
      D200D4D4D400E5E5E50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000727272005555550068686800686868006868680068686800686868006868
      6800555555000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00005D5D5D00D5D5D50000000000000000000000000000000000000000000000
      0000D4D4D4001C1C1C00FD5FFD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DDDDDD00D5D5
      D500D5D5D500D5D5D500D5D5D500D5D5D500D5D5D500D5D5D500D5D5D500D5D5
      D500D5D5D500DBDBDB0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00005D5D5D00D5D5D50000000000000000000000000000000000000000000000
      0000D4D4D4001C1C1C00FD5FFD00000000000000000000000000000000000000
      000000000000DBDBDB0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B6B6B600222222000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001C1C1C00C7C7C700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E5E5E500E2E2E2000000
      00005D5D5D00D5D5D50000000000000000000000000000000000000000000000
      0000D4D4D4001C1C1C00FD5FFD00000000000000000000000000000000000000
      0000000000009C9C9C0063636300D7D7D7000000000000000000000000000000
      000000000000000000000000000000000000000000009C9C9C009C9C9C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009C9C9C009C9C9C000000000000000000C5C5C5009C9C9C009C9C
      9C009C9C9C009C9C9C00B1B1B100000000000000000000000000000000000000
      000000000000C3C3C300DBDBDB000000000000000000A7A7A700989898000000
      00005D5D5D00D5D5D50000000000000000000000000000000000000000000000
      0000D4D4D4001C1C1C00FD5FFD00000000000000000000000000000000000000
      0000000000009C9C9C000000000016161600A3A3A300FB83FB00000000000000
      000000000000000000000000000000000000000000009C9C9C009C9C9C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009C9C9C009C9C9C0000000000000000009C9C9C00000000000000
      0000000000005C5C5C00E1E1E100000000000000000000000000000000000000
      0000DFDFDF00323232009F9F9F000000000000000000A7A7A700989898000000
      00005D5D5D00D5D5D50000000000000000000000000000000000000000000000
      0000D4D4D4001C1C1C00FD5FFD00000000000000000000000000000000000000
      0000000000009C9C9C0000000000000000000000000060606000CACACA000000
      000000000000000000000000000000000000000000009C9C9C009C9C9C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009C9C9C009C9C9C0000000000000000009C9C9C00000000000000
      000035353500DCDCDC000000000000000000000000000000000000000000F5B2
      F500626262004B4B4B00E8E8E8000000000000000000A7A7A700989898000000
      00005D5D5D00D5D5D50000000000000000000000000000000000000000000000
      0000D4D4D4001C1C1C00FD5FFD00000000000000000000000000000000000000
      0000000000009C9C9C0000000000000000000000000000000000222222008C8C
      8C00FB83FB00000000000000000000000000000000009C9C9C009C9C9C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009C9C9C009C9C9C0000000000000000009C9C9C00000000003D3D
      3D000D0D0D0073737300CFCFCF000000000000000000E8E8E800B7B7B7004040
      400045454500D5D5D500000000000000000000000000A7A7A700989898000000
      00005D5D5D00D5D5D50000000000000000000000000000000000000000000000
      0000D4D4D4001C1C1C00FD5FFD00000000000000000000000000000000000000
      0000000000009C9C9C0000000000000000000000000000000000262626009797
      970000000000000000000000000000000000000000009C9C9C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000009C9C9C0000000000000000009C9C9C0063636300E3E3
      E300BBBBBB005656560000000000161616003535350000000000222222007E7E
      7E00E0E0E00000000000000000000000000000000000A7A7A700989898000000
      00005D5D5D00D5D5D50000000000000000000000000000000000000000000000
      0000D4D4D4001C1C1C00FD5FFD00000000000000000000000000000000000000
      0000000000009C9C9C000000000000000000000000006A6A6A00D2D2D2000000
      000000000000000000000000000000000000000000009C9C9C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000009C9C9C000000000000000000B5B5B500E5E5E5000000
      00000000000000000000CECECE00AEAEAE00A8A8A800BBBBBB00DDDDDD000000
      00000000000000000000000000000000000000000000A7A7A700989898000000
      00005D5D5D00D5D5D50000000000000000000000000000000000000000000000
      0000D4D4D4001C1C1C00FD5FFD00000000000000000000000000000000000000
      0000000000009C9C9C000000000022222200ADADAD0000000000000000000000
      000000000000000000000000000000000000000000009C9C9C005D5D5D009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C005D5D5D009C9C9C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A7A7A700989898000000
      0000717171004B4B4B005C5C5C005C5C5C005C5C5C005C5C5C005C5C5C005C5C
      5C00494949001616160000000000000000000000000000000000000000000000
      0000000000009C9C9C0071717100DDDDDD000000000000000000000000000000
      000000000000000000000000000000000000000000009C9C9C009C9C9C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009C9C9C009C9C9C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A7A7A700989898000000
      0000DEDEDE00A3A3A3009F9F9F009F9F9F009F9F9F009F9F9F009F9F9F009F9F
      9F00A2A2A200C1C1C10000000000000000000000000000000000000000000000
      000000000000E0E0E00000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C3C3C300262626000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000032323200C3C3C300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A8A8A8008E8E8E00FD5F
      FD00FD5FFD00FD5FFD00FD5FFD00FD5FFD00FD5FFD00FD5FFD00FD5FFD000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DEDEDE00D5D5
      D500D5D5D500D5D5D500D5D5D500D5D5D500D5D5D500D5D5D500D5D5D500D5D5
      D500D5D5D500E3E3E30000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D4D4D4003B3B3B002626
      2600262626002626260026262600262626002626260026262600262626000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D9D9D900D2D2
      D200D2D2D200D2D2D200D2D2D200D2D2D200D2D2D200D2D2D200D2D2D2000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CCCCCC000000000000000000000000000000000000000000DFDFDF00D5D5
      D500D5D5D500D5D5D500D5D5D500D5D5D500D5D5D500D5D5D500D5D5D500D5D5
      D500D5D5D500E0E0E00000000000000000000000000000000000ADADAD006262
      62005D5D5D005D5D5D005D5D5D005D5D5D005D5D5D005D5D5D005D5D5D005D5D
      5D005F5F5F00B4B4B40000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B9B9
      B90035353500D6D6D600000000000000000000000000E8E8E800353535000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000003D3D3D00EED4EE000000000000000000000000005F5F5F000000
      0000000000000000000065656500C8C8C800C5C5C5005C5C5C00000000000000
      0000000000006565650000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B6B6B6003232
      3200C8C8C80000000000000000000000000000000000E5E5E500000000008888
      8800C5C5C500C5C5C500C5C5C500C5C5C500C5C5C500C5C5C500C5C5C500C5C5
      C5008888880000000000E5E5E5000000000000000000000000005D5D5D000000
      00000000000035353500E3E3E3000000000000000000DEDEDE00262626000000
      0000000000005D5D5D0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000DBDBDB00ACACAC009E9E9E00BBBBBB00FB83FB00C2C2C2003D3D3D00C5C5
      C5000000000000000000000000000000000000000000E5E5E50000000000B2B2
      B200000000000000000000000000000000000000000000000000000000000000
      0000B2B2B20000000000E5E5E5000000000000000000000000005D5D5D000000
      00000000000053535300FD5FFD000000000000000000F5B2F500454545000000
      0000000000005D5D5D00000000000000000000000000D7D7D700C6C6C6000000
      00000000000000000000000000000000000000000000ADADAD009C9C9C009C9C
      9C009C9C9C009C9C9C00C5C5C50000000000000000000000000000000000AAAA
      AA003B3B3B008888880096969600666666005353530078787800CBCBCB000000
      00000000000000000000000000000000000000000000E5E5E50000000000B2B2
      B200000000000000000000000000000000000000000000000000000000000000
      0000B2B2B20000000000E5E5E5000000000000000000000000005D5D5D000000
      00000000000016161600C2C2C2000000000000000000BBBBBB000D0D0D000000
      0000000000005D5D5D000000000000000000000000009696960040404000E5E5
      E5000000000000000000000000000000000000000000DCDCDC00515151000000
      000000000000000000009C9C9C00000000000000000000000000C7C7C7002A2A
      2A00DADADA00000000000000000000000000A3A3A3005A5A5A00FD5FFD000000
      00000000000000000000000000000000000000000000E5E5E50000000000B2B2
      B200000000000000000000000000000000000000000000000000000000000000
      0000B2B2B20000000000E5E5E5000000000000000000000000005D5D5D000000
      000000000000000000002A2A2A007C7C7C007878780026262600000000000000
      0000000000005D5D5D00000000000000000000000000E4E4E400424242006C6C
      6C00000000000000000000000000000000000000000000000000D6D6D6002E2E
      2E0000000000000000009C9C9C0000000000000000000000000078787800ADAD
      AD00000000000000000000000000000000000000000065656500C1C1C1000000
      00000000000000000000000000000000000000000000E5E5E50000000000B2B2
      B200000000000000000000000000000000000000000000000000000000000000
      0000B2B2B20000000000E5E5E5000000000000000000000000005D5D5D000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000005D5D5D0000000000000000000000000000000000D0D0D0004040
      400049494900BCBCBC00EED4EE000000000000000000CDCDCD006C6C6C001616
      16003B3B3B00000000009C9C9C000000000000000000000000005F5F5F00D1D1
      D100000000000000000000000000000000000000000090909000A9A9A9000000
      00000000000000000000000000000000000000000000E5E5E500000000009F9F
      9F00E5E5E500E5E5E500E5E5E500E5E5E500E5E5E500E5E5E500E5E5E500E5E5
      E5009F9F9F0000000000E5E5E5000000000000000000000000005D5D5D004D4D
      4D005D5D5D005D5D5D005D5D5D005D5D5D005D5D5D00585858001C1C1C000000
      0000000000005D5D5D000000000000000000000000000000000000000000DCDC
      DC00777777001C1C1C000D0D0D003535350022222200000000005C5C5C00C0C0
      C000DFDFDF005C5C5C009C9C9C000000000000000000000000006D6D6D00C2C2
      C200000000000000000000000000000000000000000072727200B8B8B8000000
      00000000000000000000000000000000000000000000E5E5E500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000026262600E7E7E7000000000000000000000000005D5D5D00CACA
      CA000000000000000000000000000000000000000000E6E6E600585858000000
      0000000000005D5D5D0000000000000000000000000000000000000000000000
      000000000000DBDBDB00B9B9B900A8A8A800AFAFAF00D0D0D000000000000000
      000000000000E1E1E100B1B1B100000000000000000000000000ADADAD005F5F
      5F0000000000000000000000000000000000CBCBCB003D3D3D00E3E3E3000000
      00000000000000000000000000000000000000000000E5E5E500000000000000
      00000000000000000000000000000000000070707000B2B2B200B2B2B200B2B2
      B200B2B2B200CACACA00000000000000000000000000000000005D5D5D00D5D5
      D5000000000000000000000000000000000000000000000000005D5D5D000000
      0000000000009292920000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007D7D
      7D0051515100B5B5B500CACACA00A3A3A30032323200B9B9B900000000000000
      00000000000000000000000000000000000000000000EBE2EB003D3D3D000000
      0000000000000000000000000000787878000000000000000000000000000000
      000000000000000000000000000000000000000000000000000062626200B2B2
      B200D5D5D500D5D5D500D5D5D500D5D5D500D5D5D500CACACA004D4D4D000000
      0000909090000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B2B2B200767676006A6A6A0085858500D2D2D20000000000000000000000
      0000000000000000000000000000000000000000000000000000E2E2E200D5D5
      D500D5D5D500D5D5D500D5D5D500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B2B2B2006262
      62005D5D5D005D5D5D005D5D5D005D5D5D005D5D5D005D5D5D005D5D5D009292
      9200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E8E8E800B4B4B400929292008A8A8A00B4B4B400E1E1E1000000
      00000000000000000000000000000000000000000000E5E5E500E5E5E500E5E5
      E500E5E5E500E5E5E500E5E5E500E5E5E500E5E5E500E5E5E500E5E5E500E5E5
      E500E5E5E500E5E5E500E5E5E500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D9D9
      D900D5D5D500D5D5D500D5D5D500D5D5D500D5D5D500D5D5D500D5D5D500D5D5
      D500D6D6D600E2E2E2000000000000000000000000000000000000000000FD5F
      FD00737373001C1C1C0070707000AAAAAA00B2B2B20070707000262626004545
      4500FD5FFD00000000000000000000000000E8E8E80040404000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004B4B4B00F5B2F5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C2C2C200515151001616
      1600000000000000000000000000000000000000000000000000000000000000
      0000000000002E2E2E008F8F8F00000000000000000000000000000000007C7C
      7C004D4D4D00D0D0D00000000000000000000000000000000000E0E0E0007373
      73007C7C7C00FD5FFD00000000000000000000000000B2B2B200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BABABA00000000000000000000000000000000000000
      0000E6E6E600A8A8A8006A6A6A0053535300535353006E6E6E00ACACAC00EBE2
      EB0000000000000000000000000000000000CECECE000D0D0D00000000000000
      0000000000000000000026262600C0C0C000C0C0C00026262600000000000000
      0000000000000000000000000000A8A8A80000000000000000009E9E9E007373
      7300000000000000000000000000E8E8E800DFDFDF0000000000000000000000
      0000737373004545450000000000000000000000000000000000686868000000
      0000000000000000000000000000A9A9A900A9A9A90000000000000000000000
      000000000000737373000000000000000000000000000000000000000000ABAB
      AB00000000000000000055555500949494009292920051515100000000001616
      1600B2B2B2000000000000000000000000007272720000000000000000000000
      0000000000002E2E2E00BFBFBF000000000000000000BFBFBF002E2E2E000000
      000000000000000000000000000056565600000000000000000022222200E1E1
      E100000000000000000000000000B2B2B2008C8C8C0000000000000000000000
      0000E1E1E10026262600E1E1E100000000000000000000000000CCCCCC002222
      2200000000000000000000000000000000000000000000000000000000000000
      000026262600D3D3D30000000000000000000000000000000000939393000000
      00000000000095959500000000000000000000000000FD5FFD008D8D8D000000
      00000D0D0D009B9B9B0000000000000000001616160000000000000000000000
      000026262600BFBFBF0000000000000000000000000000000000BFBFBF002626
      26000000000000000000000000005858580000000000D5D5D5004F4F4F000000
      0000000000000000000000000000B2B2B2008C8C8C0000000000000000000000
      0000000000006E6E6E00B4B4B400000000000000000000000000000000008585
      85000000000000000000000000009F9F9F009F9F9F0000000000000000000000
      00008F8F8F0000000000000000000000000000000000B2B2B2000D0D0D000000
      00005555550000000000D2D2D2007171710073737300D8D8D800FB83FB004B4B
      4B000000000016161600BBBBBB00000000005555550000000000000000000000
      00004747470099999900C5C5C5000000000000000000C5C5C500999999004747
      4700000000000000000000000000AEAEAE0000000000B4B4B4008D8D8D000000
      0000000000000000000000000000B2B2B2008C8C8C0000000000000000000000
      000000000000B2B2B2008A8A8A0000000000000000000000000000000000E4E4
      E4000D0D0D000000000000000000B2B2B200B2B2B20000000000000000001C1C
      1C00EED4EE00000000000000000000000000F2C4F2003B3B3B00000000000000
      0000949494000000000071717100000000000000000079797900000000008787
      8700000000000000000047474700FD5FFD00B6B6B60000000000000000000000
      000000000000000000009C9C9C0000000000000000009C9C9C00000000000000
      0000000000003D3D3D009B9B9B000000000000000000B9B9B900868686000000
      0000000000000000000000000000D9D9D900CACACA0000000000000000000000
      000000000000ABABAB0091919100000000000000000000000000000000000000
      0000A7A7A7000000000000000000B2B2B200B2B2B2000000000000000000B1B1
      B10000000000000000000000000000000000F89DF80040404000000000000000
      000092929200000000007373730000000000000000007D7D7D00000000008484
      840000000000000000004D4D4D000000000000000000959595001C1C1C000000
      0000000000000000000094949400000000000000000094949400000000000000
      000073737300E8E8E800000000000000000000000000D5D5D5004F4F4F000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006E6E6E00B4B4B400000000000000000000000000000000000000
      00000000000056565600000000006A6A6A006A6A6A0000000000626262000000
      00000000000000000000000000000000000000000000B9B9B9000D0D0D000000
      000051515100FD5FFD00D8D8D800797979007D7D7D00DDDDDD00F2C4F2004747
      4700000000001C1C1C00C0C0C000000000000000000000000000D5D5D5009494
      94000000000000000000353535005D5D5D005D5D5D0035353500000000000000
      0000C6C6C60000000000000000000000000000000000000000004B4B4B00D0D0
      D000000000000000000000000000B2B2B2008C8C8C0000000000000000000000
      0000D0D0D0001C1C1C00E8E8E800000000000000000000000000000000000000
      000000000000C2C2C2000D0D0D00000000000000000016161600CACACA000000
      00000000000000000000000000000000000000000000000000009B9B9B000D0D
      0D00000000008D8D8D00FB83FB000000000000000000F2C4F200858585000000
      00000D0D0D00A3A3A30000000000000000000000000000000000000000000000
      00007A7A7A000000000000000000000000000000000000000000000000008888
      8800000000000000000000000000000000000000000000000000B6B6B6004D4D
      4D00E0E0E0000000000000000000000000000000000000000000000000000000
      00004D4D4D007373730000000000000000000000000000000000000000000000
      0000000000000000000079797900000000000000000083838300000000000000
      000000000000000000000000000000000000000000000000000000000000B5B5
      B5001C1C1C00000000004B4B4B00868686008484840047474700000000002626
      2600BBBBBB000000000000000000000000000000000000000000000000000000
      000000000000A5A5A5004B4B4B0022222200262626004F4F4F00ADADAD000000
      0000000000000000000000000000000000000000000000000000000000007C7C
      7C004D4D4D00D0D0D00000000000000000000000000000000000E0E0E0007373
      73007C7C7C00FD5FFD0000000000000000000000000000000000000000000000
      00000000000000000000DADADA002E2E2E0038383800E0E0E000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F5B2F500B2B2B20078787800585858005A5A5A007C7C7C00B6B6B600FB83
      FB00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000DDDDDD00DEDEDE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B6B6B6004949490051515100858585008D8D8D0051515100222222009E9E
      9E00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000009A9A9A00A3A3A30000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000D5D5D500B9B9B900B3B3B300D5D5D500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FB83FB000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FD5FFD00F2C4F20000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F89DF800A9A9A9009A9A9A00F89DF800000000000000
      000000000000000000000000000000000000000000000000000000000000FD5F
      FD00FD5FFD00FD5FFD0000000000000000000000000000000000000000000000
      0000FD5FFD00FD5FFD0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E8E8
      E8005A5A5A0051515100DCDCDC00000000000000000000000000FD5FFD00FD5F
      FD00FD5FFD00FD5FFD00FD5FFD00FD5FFD00FD5FFD00FD5FFD00FD5FFD00FD5F
      FD00FD5FFD00FD5FFD0000000000000000000000000000000000000000000000
      000000000000F5B2F5002E2E2E00000000000000000032323200DDDDDD000000
      0000000000000000000000000000000000000000000000000000686868002E2E
      2E002E2E2E000D0D0D000000000000000000DEDEDE004D4D4D0000000000A0A0
      A0000D0D0D001C1C1C00FD5FFD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E7E7E7006565
      6500000000000000000053535300FD5FFD0000000000A9A9A9001C1C1C001C1C
      1C001C1C1C001C1C1C001C1C1C001C1C1C001C1C1C001C1C1C001C1C1C001C1C
      1C001C1C1C001C1C1C00FD5FFD00000000000000000000000000000000000000
      000000000000737373000000000000000000000000000000000032323200E7E7
      E70000000000000000000000000000000000000000000000000068686800D2D2
      D200CBCBCB006666660000000000D1D1D100AFAFAF00D6D6D600000000009898
      980083838300D2D2D20000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E8E8E800656565000000
      00000000000000000000787878000000000000000000E6E6E600D4D4D400D4D4
      D400D4D4D400D4D4D400D4D4D400D4D4D400D4D4D400D4D4D400D4D4D400D4D4
      D400D4D4D400D4D4D40000000000000000000000000000000000000000000000
      0000D0D0D0009F9F9F00222222000000000000000000000000006D6D6D00C3C3
      C30000000000000000000000000000000000000000000000000068686800CDCD
      CD00C7C7C7006363630000000000B2B2B2008C8C8C0000000000474747000000
      00009F9F9F000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7E7E7005A5A5A00000000000000
      0000000000007F7F7F000000000000000000000000000000000000000000D4D4
      D400FB83FB000000000000000000D7D7D700000000000000000000000000DADA
      DA00000000000000000000000000000000000000000000000000F5B2F5003232
      320000000000A5A5A500C0C0C0002E2E2E0000000000A9A9A900E4E4E4002A2A
      2A002A2A2A00D8D8D80000000000000000000000000000000000797979004747
      4700474747004747470000000000B2B2B2008C8C8C0000000000000000000000
      0000D4D4D4001C1C1C00FD5FFD00000000000000000000000000000000000000
      0000000000000000000000000000E8E8E8005A5A5A0000000000000000000000
      00007F7F7F000000000000000000000000000000000000000000000000003232
      3200CACACA00000000000000000055555500D4D4D40000000000000000006A6A
      6A00D1D1D1000000000000000000000000000000000000000000787878000000
      00000000000000000000BEBEBE00BEBEBE008D8D8D00CDCDCD004D4D4D000000
      0000000000002A2A2A00F5B2F50000000000000000000000000000000000DADA
      DA00CDCDCD0000000000D4D4D400B9B9B900B0B0B000D1D1D100D1D1D1000000
      0000D4D4D4001C1C1C00FD5FFD0000000000000000000000000000000000F89D
      F800D3D3D300D5D5D500DADADA00656565000000000000000000000000007878
      7800000000000000000000000000000000000000000000000000000000003232
      3200CACACA00000000000000000055555500D4D4D40000000000000000006A6A
      6A00D1D1D10000000000000000000000000000000000BFBFBF00000000000000
      00000000000000000000000000009F9F9F00CCCCCC002E2E2E00000000000000
      000000000000000000009797970000000000000000000000000000000000A8A8
      A80082828200FB83FB0042424200B7B7B700D5D5D5006C6C6C006C6C6C00CCCC
      CC00CDCDCD006E6E6E0000000000000000000000000000000000B2B2B2004949
      4900000000000D0D0D002A2A2A00000000000000000000000000787878000000
      0000000000000000000000000000000000000000000000000000000000003232
      3200CACACA00000000000000000055555500D4D4D40000000000000000006A6A
      6A00D1D1D10000000000000000000000000000000000CBCBCB00000000000000
      0000000000000000000032323200C1C1C100EBE2EB004F4F4F00000000000000
      00000000000000000000A8A8A80000000000000000000000000070707000D5D5
      D500000000002E2E2E002E2E2E002E2E2E00929292000000000000000000A3A3
      A300A3A3A30000000000000000000000000000000000B0B0B000000000000000
      000000000000000000000000000000000000000000007F7F7F00000000000000
      0000000000000000000000000000000000000000000000000000000000004545
      4500CBCBCB0000000000000000005F5F5F00D6D6D60000000000000000007272
      7200D3D3D3000000000000000000000000000000000000000000767676000000
      00000000000000000000BEBEBE00BEBEBE008D8D8D00CBCBCB004B4B4B000000
      0000000000002E2E2E00F5B2F500000000000000000000000000D1D1D100EBE2
      EB0000000000C8C8C800CDCDCD00C8C8C800D6D6D6000000000000000000DADA
      DA00DADADA00000000000000000000000000FB83FB003B3B3B00000000002626
      26001C1C1C0000000000000000000000000035353500E3E3E300000000000000
      000000000000000000000000000000000000000000000000000000000000D3D3
      D300FB83FB000000000000000000D6D6D600000000000000000000000000D9D9
      D900000000000000000000000000000000000000000000000000000000008686
      860075757500C3C3C300A3A3A300161616000000000088888800E0E0E0008787
      870086868600F2C4F20000000000000000000000000000000000686868006262
      62006363630022222200C8C8C8002E2E2E0000000000C8C8C800474747005C5C
      5C00626262000D0D0D00FD5FFD0000000000D5D5D500000000002A2A2A00C4C4
      C400BEBEBE0022222200000000000000000016161600DADADA00000000000000
      00000000000000000000000000000000000000000000E7E7E700D5D5D500D5D5
      D500D5D5D500D5D5D500D5D5D500D5D5D500D5D5D500D5D5D500D5D5D500D5D5
      D500D5D5D500D5D5D50000000000000000000000000000000000000000000000
      0000DADADA006A6A6A000000000000000000000000000000000000000000BCBC
      BC0000000000000000000000000000000000000000000000000068686800D0D0
      D000C5C5C5006A6A6A00C8C8C8002E2E2E00E2E2E2000000000047474700C5C5
      C500D0D0D00032323200FD5FFD0000000000D4D4D40026262600C5C5C5000000
      000000000000BEBEBE001C1C1C00000000001C1C1C00DCDCDC00000000000000
      00000000000000000000000000000000000000000000B1B1B1000D0D0D000000
      00002E2E2E005C5C5C005D5D5D005D5D5D005D5D5D005D5D5D00565656000D0D
      0D00000000002A2A2A0000000000000000000000000000000000000000000000
      00000000000077777700000000000000000000000000000000002E2E2E00E5E5
      E50000000000000000000000000000000000000000000000000068686800DBDB
      DB00D5D5D5006A6A6A00DADADA00A3A3A300CDCDCD00EBE2EB0047474700D0D0
      D000DBDBDB0032323200FD5FFD000000000000000000CECECE00000000000000
      000000000000B6B6B60016161600000000005A5A5A0000000000000000000000
      0000000000000000000000000000000000000000000000000000ADADAD002A2A
      2A0051515100C0C0C000000000000000000000000000DCDCDC009B9B9B002222
      220083838300CECECE0000000000000000000000000000000000000000000000
      0000000000000000000079797900000000000000000076767600EED4EE000000
      00000000000000000000000000000000000000000000000000008B8B8B006868
      6800686868006868680000000000000000008D8D8D00D1D1D100797979006868
      6800686868006868680000000000000000000000000000000000000000000000
      0000B6B6B60016161600000000001C1C1C00C8C8C80000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F89D
      F800AFAFAF00474747007D7D7D00D0D0D000ACACAC002E2E2E0076767600D4D4
      D400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000CDCDCD00BEBEBE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C7C7
      C700161616000000000066666600C8C8C8000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A0A0A0004F4F4F0071717100E3E3E300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E7E7E700EED4EE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E2E2E2000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000A00000000100010000000000000500000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000F00FF00F00000000E187E00700000000
      CFF3C663000000009FF98E71000000003FFC1C38000000003FFC3C3C00000000
      3FFC399C00000000700E3E3C00000000700E3C7C000000003FFC389C00000000
      3FFC3C1C000000003FFC1C38000000009FF98E7100000000CFF3C66300000000
      E187E00700000000F00FF00F00000000FFFFFFFFFFFFF00FFFFFFFFFFFFFE187
      FFFF8001FFC7CFF3C1C18001E7C39FF980C181F9E3C33E7C1C4981F9F1833E7C
      22089F99F89F3E7C01088109FC7F700E01008101FE3F700E22009FE1F91F3E7C
      1C7F81F9F1833E7C80FF81F9E3C33E7CC1FF8001E7C39FF9FFFF8001FFC7CFF3
      FFFFFFFFFFFFE187FFFFFFFFFFFFF00FFFFFFFFFFE7FFFFFFFFFE007F81FF81F
      C003C003F00FF00FC003C003E0C7E3C7C843C003E0E7CE73C003C003C0E38E71
      C003C003C0F39FF9E007C423C0F39E79FFCFC003CF039E79FFCFC003CF039E79
      FFFFC003CF038E71FF07E003CF03CE63FE03F003C303E3C7FF07F803E007F00F
      FFFFFC07F81FF81FFFFFFFFFFEFFFFFFFFFFF81FFFFFFFFFFFFFF81FFFFFFFFF
      C003FFFFF81FC0038001F00FF00FC0038001F00FE7C7CFF38001F00FCFE3CFF3
      8001F3CFCFF3CFF38001F3CFCE73C0038081F3CFCE7380018421F3CFCE739249
      8001F3CFC66392498001F3CFE66792418001F00FF66FC003C003F00FFE7FC003
      FFFFF00FFFFFFFFFFFFFF81FFFFFFFFFFFFFFFFFFFFFFFFFF81FF81FFFFFFFFF
      F00FF00FE0FFFFFFE007E007C07FFFFFC003C003C047F00F82018421C047F00F
      85018241C043F00F88818181C043F00F80418181C07FF00F80218241C041F00F
      80118401C041F00FC003C003803FF00FE007E007803FFFFFF00FF00FF1FFFFFF
      F81FF81FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF803FFFFFFFFFFFFF003FFFFFFFF
      FFFFF3F1FFFFC003FFFFF3F1FBFF8001FFFF93F1F8FF9FF981F993F1F83F9FF9
      81F193F1F81F9FF983E193F1F8079FF9818393F1F80F8001800793F1F81F8001
      9C1F93F1F87F8001FFFF9003F8FF9FF9FFFF9003FBFF8001FFFF801FFFFFC003
      FFFF801FFFFFFFFFFFFFC01FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFF7C003C003FFFFFFE38001C003FFFFFFC78001C183FFFFF00F8FF1C1839F81
      E01F8FF1C1838F81C71F8FF1C0038FC1CF9F8FF1C003C181CF9F8001C003E001
      CF9F8001CF83F839CF1F8003CFC3FFFFE03F80FFC007FFFFF07FC1FFC00FFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF81F8001FFFF
      E003E0070000FFFF8001E3C38001F00F0000CE73C003E0070180CE71C003C383
      03C09E79E007840101809E79E007042001819E79F00F042181839FF9F81F8001
      C007CE71F81FC183F00FC7F3FC3FE007F81FE3C3FC3FF00FFE7FF00FFE7FFFFF
      FFFFFC3FFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3FFFFFC3FE3F3FFE1C003
      F81FC321FFC08001F80FC223FF818003F00FC247FF03E6EFC003C271FE07E667
      C001E411E00FE6678001E003C01FE6678001C867803FE667C001C867003FE6EF
      E003C001003F8003F00FC041183F8003F80FC001B87FC383FC1FC303F07FE00F
      FE7FFFFFE0FFFC3FFFFFFFFFF3FFFEFF00000000000000000000000000000000
      000000000000}
  end
end
