inherited frmCadastroEnderecos: TfrmCadastroEnderecos
  Left = 680
  Top = 137
  ActiveControl = pgcEnderecos
  Caption = 'Cadastros de Endere'#231'os'
  ClientHeight = 420
  ClientWidth = 563
  FormStyle = fsMDIChild
  Visible = True
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBarra: TPanel
    Width = 545
  end
  inherited pnlTopMenu: TPanel
    Width = 563
    TabOrder = 2
    inherited tblBarra: TToolBar
      Width = 338
      inherited sbnAjuda: TSpeedButton
        GroupIndex = 2
      end
    end
    inherited tblBarraCadastro: TToolBar
      inherited sbnSalvar: TSpeedButton
        Hint = 'Grava a Altera'#231#227'o ou Inclus'#227'o na Tabela => F5'
      end
    end
  end
  object pgcEnderecos: TtecPageControl
    Left = 0
    Top = 45
    Width = 563
    Height = 375
    ActivePage = tstRegioes
    Align = alClient
    TabOrder = 1
    OnChange = pgcEnderecosChange
    object tstEstados: TTabSheet
      BorderWidth = 2
      Caption = ' &Estados'
      object gbxCodigoIBGE: TGroupBox
        Left = 52
        Top = 48
        Width = 50
        Height = 36
        Caption = ' IBGE '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        object edtCodigoIBGE: TDBEditNumero
          Left = 2
          Top = 10
          Width = 45
          Height = 23
          CharCase = ecUpperCase
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = -1
          ParentFont = False
          TabOrder = 0
          Text = 'EDTCODIGOIBGE'
          Mascara = True
          Alignment = taLeftJustify
          TipoMascara = tmGERAL
          NrDecimal = 0
          Decimais = True
          Negativo = False
          Tamanho = 2
          DataField = 'codigoibge'
          DataSource = dtmCadastroEnderecos.dsrEstados
        end
      end
      object gbxNomeEstado: TGroupBox
        Left = 52
        Top = 6
        Width = 305
        Height = 36
        Caption = ' NOME '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object edtEstadosNome: TDBEditTexto
          Left = 2
          Top = 10
          Width = 300
          Height = 23
          DataField = 'nome'
          DataSource = dtmCadastroEnderecos.dsrEstados
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
      object gbxPontosEstado: TGroupBox
        Left = 111
        Top = 49
        Width = 60
        Height = 36
        Caption = ' PONTOS '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        object edtEstadosPontos: TDBEditNumero
          Left = 2
          Top = 10
          Width = 55
          Height = 23
          CharCase = ecUpperCase
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = -1
          ParentFont = False
          TabOrder = 0
          Text = 'EDTESTADOSPONTOS'
          Mascara = True
          Alignment = taLeftJustify
          TipoMascara = tmGERAL
          NrDecimal = 2
          Decimais = False
          Negativo = True
          Tamanho = 4
          DataField = 'pontos'
          DataSource = dtmCadastroEnderecos.dsrEstados
        end
      end
      object gbxSiglaUF: TGroupBox
        Left = 6
        Top = 6
        Width = 37
        Height = 36
        Caption = 'SIGLA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object edfEstadosCodigo: TtecDbEditFind
          Left = 2
          Top = 10
          Width = 32
          Height = 23
          Alignment = taLeftJustify
          CharCase = ecUpperCase
          DataField = 'codigo'
          DataSource = dtmCadastroEnderecos.dsrEstados
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          Group = 'estados'
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
      object gbxFundoPobreza: TGroupBox
        Left = 368
        Top = 117
        Width = 75
        Height = 36
        Caption = ' '#192' POBREZA '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        object edtPercFCP: TDBEditNumero
          Left = 2
          Top = 10
          Width = 70
          Height = 23
          CharCase = ecUpperCase
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = -1
          ParentFont = False
          TabOrder = 0
          Text = 'EDTPERCFCP'
          Mascara = True
          Alignment = taLeftJustify
          TipoMascara = tmGERAL
          NrDecimal = 2
          Decimais = False
          Negativo = True
          Tamanho = 4
          DataField = 'percfcp'
          DataSource = dtmCadastroEnderecos.dsrEstados
        end
      end
      object gbxDIFAL: TGroupBox
        Left = 52
        Top = 88
        Width = 307
        Height = 185
        Caption = ' DIFAL '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        object ckbBaseDupla: TDBCheckBox
          Left = 6
          Top = 148
          Width = 97
          Height = 17
          Caption = 'Base dupla'
          DataField = 'basedupla'
          DataSource = dtmCadastroEnderecos.dsrEstados
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
        object ckbresponsaveldifal: TDBCheckBox
          Left = 6
          Top = 14
          Width = 292
          Height = 83
          BiDiMode = bdLeftToRight
          Caption = 
            'O emitente da NF '#233' o respons'#225'vel pelo recolhi- mento da DIFAL (d' +
            'iferencial de al'#237'quota de ICMS) nas opera'#231#245'es de venda interesta' +
            'duais para contribuintes de ICMS e de mercadorias para o ativo i' +
            'mobilizado ou para uso ou consumo.'
          DataField = 'responsaveldifal'
          DataSource = dtmCadastroEnderecos.dsrEstados
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentBiDiMode = False
          ParentFont = False
          TabOrder = 0
          ValueChecked = 'True'
          ValueUnchecked = 'False'
          WordWrap = True
        end
        object gbxcdatainiciodifal: TGroupBox
          Left = 24
          Top = 98
          Width = 110
          Height = 41
          Caption = 'DIFAL A PARTIR DE:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          object edtdatainiciodifal: TDBEditData
            Left = 5
            Top = 13
            Width = 100
            Height = 23
            Alignment = taLeftJustify
            DataField = 'datainiciodifal'
            DataSource = dtmCadastroEnderecos.dsrEstados
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Maximo = 37353
            Minimo = 37353
            Adicional = 0
            ParentFont = False
            TabOrder = 0
            Opcional = True
          end
        end
      end
      object stxFundoDe: TStaticText
        Left = 372
        Top = 92
        Width = 65
        Height = 16
        Caption = '% FUNDO DE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 5
      end
      object stxCombate: TStaticText
        Left = 380
        Top = 104
        Width = 48
        Height = 16
        Caption = 'COMBATE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 6
      end
    end
    object tstCidades: TTabSheet
      BorderWidth = 2
      Caption = ' Ci&dades'
      ImageIndex = 1
      inline fraFonePrestadora: TfraTelefone
        Left = 394
        Top = 45
        Width = 151
        Height = 50
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        inherited gbxFone: TGroupBox
          Width = 151
          Height = 50
          Caption = 'FONE PRESTADORA'
          inherited edtDDD: TDBEditNumero
            Alignment = taCenter
            DataField = 'foneddd'
            DataSource = dtmCadastroEnderecos.dsrCidades
          end
          inherited edtNumero: TDBEditFone
            DataField = 'foneprestadora'
            DataSource = dtmCadastroEnderecos.dsrCidades
            MaxLength = -1
          end
        end
      end
      object gbxUFCidade: TGroupBox
        Left = 6
        Top = 6
        Width = 63
        Height = 36
        Caption = ' ESTADO '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object sbnProcurarEstadosCidades: TSpeedButton
          Left = 36
          Top = 10
          Width = 23
          Height = 23
          Hint = 'Procurar estados'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            18000000000000060000120B0000120B00000000000000000000C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7FFFFFFFC3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3800000800000800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C38000
            00800000800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C38000008000
            00800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C38000008000008000
            00C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFFFFFFFFFF
            FFFFC3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3FFA858800000800000800000FFA858C3C3C30000FF800000800000C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3
            C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            800000FFA858FFA858FFA858FFA858FFA8588000008000000000FFC3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7FC3C3C3C3C3C3C3C3C37F
            7F7F7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3800000
            FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFA858FFA858
            FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C37F7F7FC3C3C3FFFFFFC3C3C3C3C3C3C3C3C3C3C3C3800000FFA858
            FFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFA858800000C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3800000FFA858
            FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3800000FFA858
            FFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFA858800000C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C37F7F7FC3C3C3FFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C37F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFA858FFA858
            FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3800000
            FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FC3C3C3FFFFFFFFFFFFC3C3C3C3C3C3C3
            C3C3FFFFFF7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            800000FFA858FFA858FFA858FFA858FFA858800000C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7FC3C3C3FFFFFFFFFFFF7F
            7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3FFA858800000800000800000FFA858C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7F7F7F7FC3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3}
          NumGlyphs = 2
          ParentFont = False
          OnClick = sbnProcurarEstadosCidadesClick
        end
        object flkCidadesEstado: TtecDBFindLookup
          Left = 2
          Top = 10
          Width = 32
          Height = 23
          Alignment = taCenter
          CharCase = ecUpperCase
          DataField = 'estado'
          DataSource = dtmCadastroEnderecos.dsrCidades
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          Group = 'cidades'
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
          LookupField = 'codigo'
          LookupSource = dtmCadastroEnderecos.dsrConsultaEstadosCidades
          LookupQueryParameter = 'codigo'
          Parameter = 'estado'
          ActiveSetControls = True
          DenyInsert = True
          NoSetControls = <
            item
              Control = sbnProcurarEstadosCidades
            end
            item
            end>
          SetControls = <>
          LookupParameter = 'codigo'
        end
      end
      object gbxCodCidade: TGroupBox
        Left = 77
        Top = 6
        Width = 68
        Height = 36
        Caption = ' C'#211'DIGO '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object edfCidadesCodigo: TtecDbEditFind
          Left = 2
          Top = 10
          Width = 63
          Height = 23
          Alignment = taRightJustify
          CharCase = ecUpperCase
          DataField = 'codigo'
          DataSource = dtmCadastroEnderecos.dsrCidades
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          Group = 'cidades'
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
        end
      end
      object gbxNomeCidade: TGroupBox
        Left = 154
        Top = 6
        Width = 324
        Height = 36
        Caption = ' NOME DA CIDADE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        object edtCidadesNome: TDBEditTexto
          Left = 2
          Top = 10
          Width = 319
          Height = 23
          DataField = 'nome'
          DataSource = dtmCadastroEnderecos.dsrCidades
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
      object gbxCEPCidade: TGroupBox
        Left = 76
        Top = 58
        Width = 88
        Height = 36
        Caption = ' CEP '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        object edtCidadesCEP: TDBEditCep
          Left = 2
          Top = 10
          Width = 83
          Height = 23
          CharCase = ecUpperCase
          DataField = 'cep'
          DataSource = dtmCadastroEnderecos.dsrCidades
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = 8
          ParentFont = False
          TabOrder = 0
          Tamanho = 8
          Decimais = False
          Negativo = False
        end
      end
      object gbxIBGECidade: TGroupBox
        Left = 235
        Top = 58
        Width = 70
        Height = 36
        Caption = ' IBGE '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        object edtNumeroIBGE: TDBEditNumeroIBGE
          Left = 2
          Top = 10
          Width = 65
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
          Tamanho = 7
          DataField = 'codigoibge'
          DataSource = dtmCadastroEnderecos.dsrCidades
        end
      end
      object gbxPontosCidade: TGroupBox
        Left = 174
        Top = 58
        Width = 53
        Height = 36
        Caption = 'PONTOS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        object edtCidadePontos: TDBEditNumero
          Left = 2
          Top = 10
          Width = 48
          Height = 23
          CharCase = ecUpperCase
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = -1
          ParentFont = False
          TabOrder = 0
          Text = '9.999,00'
          Mascara = True
          Alignment = taCenter
          TipoMascara = tmGERAL
          NrDecimal = 2
          Decimais = False
          Negativo = True
          Tamanho = 4
          DataField = 'pontos'
          DataSource = dtmCadastroEnderecos.dsrCidades
        end
      end
      object gbxDIMOB: TGroupBox
        Left = 315
        Top = 58
        Width = 70
        Height = 36
        Caption = ' DIMOB '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        object edtNumeroDIMOB: TDBEditNumero
          Left = 2
          Top = 10
          Width = 65
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
          DataField = 'codigodimob'
          DataSource = dtmCadastroEnderecos.dsrCidades
        end
      end
      object gbxRegiaoCidade: TGroupBox
        Left = 76
        Top = 97
        Width = 350
        Height = 36
        Caption = ' REGI'#195'O '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 8
        object sbnProcurarRegioesCidade: TSpeedButton
          Left = 63
          Top = 10
          Width = 23
          Height = 23
          Hint = 'Procurar regi'#245'es'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            18000000000000060000120B0000120B00000000000000000000C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7FFFFFFFC3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3800000800000800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C38000
            00800000800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C38000008000
            00800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C38000008000008000
            00C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFFFFFFFFFF
            FFFFC3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3FFA858800000800000800000FFA858C3C3C30000FF800000800000C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3
            C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            800000FFA858FFA858FFA858FFA858FFA8588000008000000000FFC3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7FC3C3C3C3C3C3C3C3C37F
            7F7F7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3800000
            FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFA858FFA858
            FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C37F7F7FC3C3C3FFFFFFC3C3C3C3C3C3C3C3C3C3C3C3800000FFA858
            FFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFA858800000C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3800000FFA858
            FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3800000FFA858
            FFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFA858800000C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C37F7F7FC3C3C3FFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C37F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFA858FFA858
            FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3800000
            FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FC3C3C3FFFFFFFFFFFFC3C3C3C3C3C3C3
            C3C3FFFFFF7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            800000FFA858FFA858FFA858FFA858FFA858800000C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7FC3C3C3FFFFFFFFFFFF7F
            7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3FFA858800000800000800000FFA858C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7F7F7F7FC3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3}
          NumGlyphs = 2
          ParentFont = False
          OnClick = sbnProcurarRegioesCidadeClick
        end
        object flkCidadesRegiao: TtecDBFindLookup
          Left = 2
          Top = 10
          Width = 60
          Height = 23
          Alignment = taCenter
          CharCase = ecUpperCase
          DataField = 'regiao'
          DataSource = dtmCadastroEnderecos.dsrCidades
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
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
          LookupField = 'codigo'
          LookupSource = dtmCadastroEnderecos.dsrConsultaRegioesCidades
          LookupQueryParameter = 'codigo'
          Parameter = ' '
          ActiveSetControls = False
          DenyInsert = True
          NoSetControls = <>
          SetControls = <>
          LookupParameter = 'codigo'
        end
        object dtxRegiaoNomeCidades: TtecDBText
          Left = 88
          Top = 10
          Width = 259
          Height = 23
          TabStop = False
          Color = clBtnFace
          DataField = 'nome'
          DataSource = dtmCadastroEnderecos.dsrConsultaRegioesCidades
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
      end
    end
    object tstBairros: TTabSheet
      BorderWidth = 2
      Caption = ' &Bairros'
      ImageIndex = 2
      object gbxCEPBairro: TGroupBox
        Left = 154
        Top = 88
        Width = 87
        Height = 36
        Caption = ' CEP '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        object edtCEPBairro: TDBEditCep
          Left = 2
          Top = 10
          Width = 82
          Height = 23
          CharCase = ecUpperCase
          DataField = 'cep'
          DataSource = dtmCadastroEnderecos.dsrBairros
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = 12
          ParentFont = False
          TabOrder = 0
          Tamanho = 8
          Decimais = False
          Negativo = False
        end
      end
      object gbxUFBairro: TGroupBox
        Left = 6
        Top = 6
        Width = 63
        Height = 36
        Caption = ' ESTADO '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object sbnProcurarEstadosBairros: TSpeedButton
          Left = 36
          Top = 11
          Width = 23
          Height = 23
          Hint = 'Procurar estados'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            18000000000000060000120B0000120B00000000000000000000C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7FFFFFFFC3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3800000800000800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C38000
            00800000800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C38000008000
            00800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C38000008000008000
            00C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFFFFFFFFFF
            FFFFC3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3FFA858800000800000800000FFA858C3C3C30000FF800000800000C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3
            C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            800000FFA858FFA858FFA858FFA858FFA8588000008000000000FFC3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7FC3C3C3C3C3C3C3C3C37F
            7F7F7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3800000
            FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFA858FFA858
            FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C37F7F7FC3C3C3FFFFFFC3C3C3C3C3C3C3C3C3C3C3C3800000FFA858
            FFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFA858800000C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3800000FFA858
            FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3800000FFA858
            FFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFA858800000C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C37F7F7FC3C3C3FFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C37F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFA858FFA858
            FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3800000
            FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FC3C3C3FFFFFFFFFFFFC3C3C3C3C3C3C3
            C3C3FFFFFF7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            800000FFA858FFA858FFA858FFA858FFA858800000C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7FC3C3C3FFFFFFFFFFFF7F
            7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3FFA858800000800000800000FFA858C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7F7F7F7FC3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3}
          NumGlyphs = 2
          ParentFont = False
          OnClick = sbnProcurarEstadosBairrosClick
        end
        object flkBairrosEstado: TtecDBFindLookup
          Left = 2
          Top = 10
          Width = 32
          Height = 23
          Alignment = taCenter
          CharCase = ecUpperCase
          DataField = 'estado'
          DataSource = dtmCadastroEnderecos.dsrBairros
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          Group = 'bairros'
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
          LookupField = 'codigo'
          LookupSource = dtmCadastroEnderecos.dsrConsultaEstadosBairros
          LookupQueryParameter = 'codigo'
          Parameter = 'estado'
          ActiveSetControls = True
          DenyInsert = True
          NoSetControls = <
            item
              Control = sbnProcurarEstadosBairros
            end
            item
              Control = sbnProcurarCidadesBairros
            end
            item
            end
            item
              Control = dtxCidadeNomeBairros
            end>
          SetControls = <>
          LookupParameter = 'codigo'
        end
      end
      object gbxCidadeBairro: TGroupBox
        Left = 77
        Top = 6
        Width = 426
        Height = 36
        Caption = ' CIDADE '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object sbnProcurarCidadesBairros: TSpeedButton
          Left = 65
          Top = 10
          Width = 23
          Height = 23
          Hint = 'Procurar cidades'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            18000000000000060000120B0000120B00000000000000000000C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7FFFFFFFC3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3800000800000800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C38000
            00800000800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C38000008000
            00800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C38000008000008000
            00C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFFFFFFFFFF
            FFFFC3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3FFA858800000800000800000FFA858C3C3C30000FF800000800000C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3
            C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            800000FFA858FFA858FFA858FFA858FFA8588000008000000000FFC3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7FC3C3C3C3C3C3C3C3C37F
            7F7F7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3800000
            FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFA858FFA858
            FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C37F7F7FC3C3C3FFFFFFC3C3C3C3C3C3C3C3C3C3C3C3800000FFA858
            FFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFA858800000C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3800000FFA858
            FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3800000FFA858
            FFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFA858800000C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C37F7F7FC3C3C3FFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C37F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFA858FFA858
            FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3800000
            FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FC3C3C3FFFFFFFFFFFFC3C3C3C3C3C3C3
            C3C3FFFFFF7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            800000FFA858FFA858FFA858FFA858FFA858800000C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7FC3C3C3FFFFFFFFFFFF7F
            7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3FFA858800000800000800000FFA858C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7F7F7F7FC3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3}
          NumGlyphs = 2
          ParentFont = False
          OnClick = sbnProcurarCidadesBairrosClick
        end
        object flkBairrosCidade: TtecDBFindLookup
          Left = 2
          Top = 10
          Width = 60
          Height = 23
          Alignment = taRightJustify
          CharCase = ecUpperCase
          DataField = 'cidade'
          DataSource = dtmCadastroEnderecos.dsrBairros
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          Group = 'bairros'
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
          LookupField = 'codigo'
          LookupSource = dtmCadastroEnderecos.dsrConsultaCidadesBairros
          LookupQueryParameter = 'codigo'
          Parameter = 'cidade'
          LookupParameter = 'codigo'
        end
        object dtxCidadeNomeBairros: TtecDBText
          Left = 89
          Top = 10
          Width = 334
          Height = 23
          TabStop = False
          Color = clBtnFace
          DataField = 'nome'
          DataSource = dtmCadastroEnderecos.dsrConsultaCidadesBairros
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
      end
      object gbxCodBairro: TGroupBox
        Left = 77
        Top = 47
        Width = 67
        Height = 36
        Caption = ' C'#211'DIGO '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        object edfBairrosCodigo: TtecDbEditFind
          Left = 2
          Top = 10
          Width = 62
          Height = 23
          Alignment = taRightJustify
          CharCase = ecUpperCase
          DataField = 'codigo'
          DataSource = dtmCadastroEnderecos.dsrBairros
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          Group = 'bairros'
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
        end
      end
      object gbxNomeBairro: TGroupBox
        Left = 153
        Top = 47
        Width = 350
        Height = 36
        Caption = ' NOME DO BAIRRO '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        object edtNomeBairro: TDBEditTexto
          Left = 2
          Top = 10
          Width = 345
          Height = 23
          DataField = 'nome'
          DataSource = dtmCadastroEnderecos.dsrBairros
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = 13
          ParentFont = False
          TabOrder = 0
          CharCasenoDefault = False
          Alignment = taLeftJustify
        end
      end
      object gbxPontosBairro: TGroupBox
        Left = 250
        Top = 88
        Width = 67
        Height = 36
        Caption = ' PONTOS '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        object edtPontosBairro: TDBEditNumero
          Left = 2
          Top = 10
          Width = 62
          Height = 23
          CharCase = ecUpperCase
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = -1
          ParentFont = False
          TabOrder = 0
          Text = '9.999,00'
          Mascara = True
          Alignment = taCenter
          TipoMascara = tmGERAL
          NrDecimal = 2
          Decimais = False
          Negativo = True
          Tamanho = 4
          DataField = 'pontos'
          DataSource = dtmCadastroEnderecos.dsrBairros
        end
      end
      object gbxRegiaoBairro: TGroupBox
        Left = 154
        Top = 129
        Width = 350
        Height = 36
        Caption = ' REGI'#195'O '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        object sbnProcurarRegioesBairros: TSpeedButton
          Left = 63
          Top = 10
          Width = 23
          Height = 23
          Hint = 'Procurar regi'#245'es'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            18000000000000060000120B0000120B00000000000000000000C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7FFFFFFFC3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3800000800000800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C38000
            00800000800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C38000008000
            00800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C38000008000008000
            00C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFFFFFFFFFF
            FFFFC3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3FFA858800000800000800000FFA858C3C3C30000FF800000800000C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3
            C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            800000FFA858FFA858FFA858FFA858FFA8588000008000000000FFC3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7FC3C3C3C3C3C3C3C3C37F
            7F7F7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3800000
            FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFA858FFA858
            FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C37F7F7FC3C3C3FFFFFFC3C3C3C3C3C3C3C3C3C3C3C3800000FFA858
            FFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFA858800000C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3800000FFA858
            FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3800000FFA858
            FFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFA858800000C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C37F7F7FC3C3C3FFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C37F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFA858FFA858
            FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3800000
            FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FC3C3C3FFFFFFFFFFFFC3C3C3C3C3C3C3
            C3C3FFFFFF7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            800000FFA858FFA858FFA858FFA858FFA858800000C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7FC3C3C3FFFFFFFFFFFF7F
            7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3FFA858800000800000800000FFA858C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7F7F7F7FC3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3}
          NumGlyphs = 2
          ParentFont = False
          OnClick = sbnProcurarRegioesBairrosClick
        end
        object flkBairrosRegiao: TtecDBFindLookup
          Left = 2
          Top = 10
          Width = 60
          Height = 23
          Alignment = taRightJustify
          CharCase = ecUpperCase
          DataField = 'regiao'
          DataSource = dtmCadastroEnderecos.dsrBairros
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
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
          LookupField = 'codigo'
          LookupSource = dtmCadastroEnderecos.dsrConsultaRegioesBairros
          LookupQueryParameter = 'codigo'
          Parameter = ' '
          ActiveSetControls = False
          DenyInsert = True
          NoSetControls = <>
          SetControls = <>
          LookupParameter = 'codigo'
        end
        object dtxRegiaoNomeBairros: TtecDBText
          Left = 88
          Top = 10
          Width = 259
          Height = 23
          TabStop = False
          Color = clBtnFace
          DataField = 'nome'
          DataSource = dtmCadastroEnderecos.dsrConsultaRegioesBairros
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
      end
      object gbxFreteBairro: TGroupBox
        Left = 154
        Top = 170
        Width = 350
        Height = 36
        Caption = ' FRETE '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        object sbnProcurarBairrosFretes: TSpeedButton
          Left = 63
          Top = 10
          Width = 23
          Height = 23
          Hint = 'Procurar Tabela de Fretes'
          Flat = True
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
          ParentFont = False
          OnClick = sbnProcurarBairrosFretesClick
        end
        object flkBairrosFrete: TtecDBFindLookup
          Left = 2
          Top = 10
          Width = 60
          Height = 23
          Alignment = taRightJustify
          CharCase = ecUpperCase
          DataField = 'frete'
          DataSource = dtmCadastroEnderecos.dsrBairros
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
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
          LookupField = 'codigo'
          LookupSource = dtmCadastroEnderecos.dsrConsultaTabelaFretesBairros
          LookupQueryParameter = 'codigo'
          Parameter = ' '
          ActiveSetControls = False
          DenyInsert = True
          NoSetControls = <>
          SetControls = <>
          LookupParameter = 'codigo'
        end
        object dtxDescricaoFreteBairros: TtecDBText
          Left = 88
          Top = 10
          Width = 259
          Height = 23
          TabStop = False
          Color = clBtnFace
          DataField = 'descricao'
          DataSource = dtmCadastroEnderecos.dsrConsultaTabelaFretesBairros
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
      end
    end
    object tstRuas: TTabSheet
      BorderWidth = 2
      Caption = ' R&uas'
      ImageIndex = 3
      object gbxAoNumero: TGroupBox
        Left = 335
        Top = 49
        Width = 75
        Height = 36
        Caption = 'AO N'#218'MERO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        object edtNumeroRuaAteOnde: TDBEditTexto
          Left = 2
          Top = 10
          Width = 70
          Height = 23
          DataField = 'ateonde'
          DataSource = dtmCadastroEnderecos.dsrRuas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = 19
          ParentFont = False
          TabOrder = 0
          CharCasenoDefault = False
          Alignment = taLeftJustify
        end
      end
      object gbxBairroRua: TGroupBox
        Left = 153
        Top = 165
        Width = 346
        Height = 36
        Caption = ' BAIRRO '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 9
        object sbnProcurarBairrosRuas: TSpeedButton
          Left = 63
          Top = 10
          Width = 23
          Height = 23
          Hint = 'Procurar bairros'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            18000000000000060000120B0000120B00000000000000000000C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7FFFFFFFC3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3800000800000800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C38000
            00800000800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C38000008000
            00800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C38000008000008000
            00C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFFFFFFFFFF
            FFFFC3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3FFA858800000800000800000FFA858C3C3C30000FF800000800000C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3
            C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            800000FFA858FFA858FFA858FFA858FFA8588000008000000000FFC3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7FC3C3C3C3C3C3C3C3C37F
            7F7F7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3800000
            FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFA858FFA858
            FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C37F7F7FC3C3C3FFFFFFC3C3C3C3C3C3C3C3C3C3C3C3800000FFA858
            FFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFA858800000C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3800000FFA858
            FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3800000FFA858
            FFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFA858800000C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C37F7F7FC3C3C3FFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C37F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFA858FFA858
            FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3800000
            FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FC3C3C3FFFFFFFFFFFFC3C3C3C3C3C3C3
            C3C3FFFFFF7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            800000FFA858FFA858FFA858FFA858FFA858800000C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7FC3C3C3FFFFFFFFFFFF7F
            7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3FFA858800000800000800000FFA858C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7F7F7F7FC3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3}
          NumGlyphs = 2
          ParentFont = False
          OnClick = sbnProcurarBairrosRuasClick
        end
        object flkRuasBairro: TtecDBFindLookup
          Left = 2
          Top = 10
          Width = 60
          Height = 23
          Alignment = taRightJustify
          CharCase = ecUpperCase
          DataField = 'bairro'
          DataSource = dtmCadastroEnderecos.dsrRuas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
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
          LookupField = 'codigo'
          LookupSource = dtmCadastroEnderecos.dsrConsultaBairrosRuas
          LookupQueryParameter = 'codigo'
          Parameter = ' '
          ActiveSetControls = False
          DenyInsert = True
          NoSetControls = <>
          SetControls = <>
          LookupParameter = 'codigo'
        end
        object edtBairroNomeRuas: TtecDBText
          Left = 87
          Top = 10
          Width = 256
          Height = 23
          TabStop = False
          Color = clBtnFace
          DataField = 'nome'
          DataSource = dtmCadastroEnderecos.dsrConsultaBairrosRuas
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
      end
      object gbxCodigoRua: TGroupBox
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
        object edfRuasCodigo: TtecDbEditFind
          Left = 2
          Top = 10
          Width = 60
          Height = 23
          Alignment = taLeftJustify
          CharCase = ecUpperCase
          DataField = 'codigo'
          DataSource = dtmCadastroEnderecos.dsrRuas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          Group = 'ruas'
          MaxLength = 7
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
      object gbxNomeRua: TGroupBox
        Left = 81
        Top = 6
        Width = 419
        Height = 36
        Caption = ' NOME DA RUA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object edtNomeRua: TDBEditTexto
          Left = 2
          Top = 10
          Width = 414
          Height = 23
          DataField = 'nomerua'
          DataSource = dtmCadastroEnderecos.dsrRuas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = 10
          ParentFont = False
          TabOrder = 0
          CharCasenoDefault = False
          Alignment = taLeftJustify
        end
      end
      object gbxCEPRua: TGroupBox
        Left = 82
        Top = 48
        Width = 87
        Height = 36
        Caption = ' CEP '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        object edtCEPRua: TDBEditCep
          Left = 2
          Top = 10
          Width = 82
          Height = 23
          CharCase = ecUpperCase
          DataField = 'cep'
          DataSource = dtmCadastroEnderecos.dsrRuas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = 9
          ParentFont = False
          TabOrder = 0
          Tamanho = 8
          Decimais = False
          Negativo = False
        end
      end
      object gbxTipo: TGroupBox
        Left = 177
        Top = 48
        Width = 67
        Height = 36
        Caption = ' TIPO '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        object edtTipoRua: TDBEditTexto
          Left = 2
          Top = 10
          Width = 62
          Height = 23
          DataField = 'tipo'
          DataSource = dtmCadastroEnderecos.dsrRuas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = 10
          ParentFont = False
          TabOrder = 0
          CharCasenoDefault = False
          Alignment = taLeftJustify
        end
      end
      object gbxDoNumero: TGroupBox
        Left = 252
        Top = 49
        Width = 75
        Height = 36
        Caption = 'DO N'#218'MERO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        object edtNumeroRuaDeOnde: TDBEditTexto
          Left = 2
          Top = 10
          Width = 70
          Height = 23
          DataField = 'daonde'
          DataSource = dtmCadastroEnderecos.dsrRuas
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
      object rgpLadoRua: TtecDBRadioGroup
        Left = 418
        Top = 49
        Width = 82
        Height = 72
        Caption = ' LADO '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        TabStop = False
        DataField = 'lado'
        DataSource = dtmCadastroEnderecos.dsrRuas
        object rbnPar: TtecRadioButton
          Left = 6
          Top = 15
          Width = 67
          Height = 17
          Caption = 'Par'
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
        object rbnImpar: TtecRadioButton
          Left = 6
          Top = 32
          Width = 70
          Height = 17
          Caption = #205'mpar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          Value = 'I'
        end
        object rbnNenhum: TtecRadioButton
          Left = 6
          Top = 50
          Width = 73
          Height = 17
          Caption = 'Nenhum'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          Value = 'X'
        end
      end
      object gbxEstadoRua: TGroupBox
        Left = 82
        Top = 124
        Width = 63
        Height = 36
        Caption = ' ESTADO '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        object sbnProcurarEstadosRuas: TSpeedButton
          Left = 35
          Top = 10
          Width = 23
          Height = 23
          Hint = 'Procurar estados'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            18000000000000060000120B0000120B00000000000000000000C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7FFFFFFFC3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3800000800000800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C38000
            00800000800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C38000008000
            00800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C38000008000008000
            00C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFFFFFFFFFF
            FFFFC3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3FFA858800000800000800000FFA858C3C3C30000FF800000800000C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3
            C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            800000FFA858FFA858FFA858FFA858FFA8588000008000000000FFC3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7FC3C3C3C3C3C3C3C3C37F
            7F7F7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3800000
            FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFA858FFA858
            FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C37F7F7FC3C3C3FFFFFFC3C3C3C3C3C3C3C3C3C3C3C3800000FFA858
            FFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFA858800000C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3800000FFA858
            FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3800000FFA858
            FFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFA858800000C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C37F7F7FC3C3C3FFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C37F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFA858FFA858
            FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3800000
            FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FC3C3C3FFFFFFFFFFFFC3C3C3C3C3C3C3
            C3C3FFFFFF7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            800000FFA858FFA858FFA858FFA858FFA858800000C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7FC3C3C3FFFFFFFFFFFF7F
            7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3FFA858800000800000800000FFA858C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7F7F7F7FC3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3}
          NumGlyphs = 2
          ParentFont = False
          OnClick = sbnProcurarEstadosRuasClick
        end
        object flkRuasEstado: TtecDBFindLookup
          Left = 2
          Top = 10
          Width = 31
          Height = 23
          Alignment = taCenter
          CharCase = ecUpperCase
          DataField = 'estado'
          DataSource = dtmCadastroEnderecos.dsrRuas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          Maximo = 0
          Minimo = 37353
          Adicional = 0
          Opcional = True
          ParentFont = False
          TabOrder = 0
          PermitirZero = False
          PermitirNulo = False
          Operacao = opATRIBUICAO
          LookupField = 'codigo'
          LookupSource = dtmCadastroEnderecos.dsrConsultaEstadosRuas
          LookupQueryParameter = 'codigo'
          Parameter = ' '
          ActiveSetControls = False
          DenyInsert = True
          NoSetControls = <>
          SetControls = <>
          LookupParameter = 'codigo'
        end
      end
      object gbxCidadeRua: TGroupBox
        Left = 153
        Top = 124
        Width = 347
        Height = 36
        Caption = ' CIDADE '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 8
        object sbnProcurarCidadesRuas: TSpeedButton
          Left = 63
          Top = 10
          Width = 23
          Height = 23
          Hint = 'Procurar cidades'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            18000000000000060000120B0000120B00000000000000000000C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7FFFFFFFC3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3800000800000800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C38000
            00800000800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C38000008000
            00800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C38000008000008000
            00C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFFFFFFFFFF
            FFFFC3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3FFA858800000800000800000FFA858C3C3C30000FF800000800000C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3
            C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            800000FFA858FFA858FFA858FFA858FFA8588000008000000000FFC3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7FC3C3C3C3C3C3C3C3C37F
            7F7F7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3800000
            FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFA858FFA858
            FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C37F7F7FC3C3C3FFFFFFC3C3C3C3C3C3C3C3C3C3C3C3800000FFA858
            FFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFA858800000C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3800000FFA858
            FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3800000FFA858
            FFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFA858800000C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C37F7F7FC3C3C3FFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C37F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFA858FFA858
            FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3800000
            FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FC3C3C3FFFFFFFFFFFFC3C3C3C3C3C3C3
            C3C3FFFFFF7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            800000FFA858FFA858FFA858FFA858FFA858800000C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7FC3C3C3FFFFFFFFFFFF7F
            7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3FFA858800000800000800000FFA858C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7F7F7F7FC3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3}
          NumGlyphs = 2
          ParentFont = False
          OnClick = sbnProcurarCidadesRuasClick
        end
        object flkRuasCidade: TtecDBFindLookup
          Left = 2
          Top = 10
          Width = 60
          Height = 23
          Alignment = taRightJustify
          CharCase = ecUpperCase
          DataField = 'cidade'
          DataSource = dtmCadastroEnderecos.dsrRuas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
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
          LookupField = 'codigo'
          LookupSource = dtmCadastroEnderecos.dsrConsultaCidadesRuas
          LookupQueryParameter = 'codigo'
          Parameter = ' '
          ActiveSetControls = False
          DenyInsert = True
          NoSetControls = <>
          SetControls = <>
          LookupParameter = 'codigo'
        end
        object edtCidadeNomeRuas: TtecDBText
          Left = 87
          Top = 10
          Width = 257
          Height = 23
          TabStop = False
          Color = clBtnFace
          DataField = 'nome'
          DataSource = dtmCadastroEnderecos.dsrConsultaCidadesRuas
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
      end
    end
    object tstRegioes: TTabSheet
      BorderWidth = 2
      Caption = ' Regi'#245'e&s'
      ImageIndex = 4
      object sbnIncluirLimites_Periodo_Entrega: TSpeedButton
        Left = 500
        Top = 108
        Width = 23
        Height = 22
        Hint = 'Incluir limites'
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
        OnClick = sbnIncluirLimites_Periodo_EntregaClick
      end
      object sbnExcluirLimites_Periodo_Entrega: TSpeedButton
        Left = 500
        Top = 130
        Width = 23
        Height = 22
        Hint = 'Excluir limites'
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
        OnClick = sbnExcluirLimites_Periodo_EntregaClick
      end
      object AdvDBLookupComboBox2: TAdvDBLookupComboBox
        Left = 213
        Top = 160
        Width = 190
        Height = 24
        Enabled = True
        LabelPosition = lpLeftTop
        LabelMargin = 4
        LabelTransparent = False
        LabelAlwaysEnabled = False
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clWindowText
        LabelFont.Height = -11
        LabelFont.Name = 'MS Sans Serif'
        LabelFont.Style = []
        LabelWidth = 0
        LookupColumn = 0
        LookupMethod = lmFast
        LookupLoad = llAlways
        TabOrder = 6
        Columns = <
          item
            FixedColor = clBtnFace
            FixedColorTo = clNone
            GradientDir = gdVertical
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ListField = 'descricao'
            Name = 'Column0'
            Title = 'Per'#237'odo'
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
          end
          item
            FixedColor = clBtnFace
            FixedColorTo = clNone
            GradientDir = gdVertical
            Width = 55
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ListField = 'horapadrao'
            Name = 'Column1'
            Title = 'In'#237'cio'
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
          end
          item
            FixedColor = clBtnFace
            FixedColorTo = clNone
            GradientDir = gdVertical
            Width = 55
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ListField = 'fim'
            Name = 'Column2'
            Title = 'Fim'
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
          end>
        DataField = 'periodo'
        DataSource = dtmCadastroEnderecos.dsrLimitesEntregaRegioes
        DropWidth = 250
        DropStretchColumn = -1
        DropFont.Charset = DEFAULT_CHARSET
        DropFont.Color = clWindowText
        DropFont.Height = -11
        DropFont.Name = 'Tahoma'
        DropFont.Style = []
        KeyField = 'codigo'
        ListSource = dtmCadastroEnderecos.dsrperiodosentrega
        ReturnIsTab = True
        SortUpGlyph.Data = {
          36010000424D3601000000000000360000002800000008000000080000000100
          2000000000000001000000000000000000000000000000000000C0C0C000C0C0
          C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000808080008080
          8000808080008080800080808000808080008080800080808000808080008080
          8000C0C0C000C0C0C000C0C0C000C0C0C000FFFFFF00FFFFFF00C0C0C0008080
          8000C0C0C000C0C0C000C0C0C000C0C0C000FFFFFF00C0C0C000C0C0C0008080
          800080808000C0C0C000C0C0C000FFFFFF00FFFFFF00C0C0C000C0C0C000C0C0
          C00080808000C0C0C000C0C0C000FFFFFF00C0C0C000C0C0C000C0C0C000C0C0
          C0008080800080808000FFFFFF00FFFFFF00C0C0C000C0C0C000C0C0C000C0C0
          C000C0C0C00080808000FFFFFF00C0C0C000C0C0C000C0C0C000}
        SortDownGlyph.Data = {
          36010000424D3601000000000000360000002800000008000000080000000100
          2000000000000001000000000000000000000000000000000000C0C0C000C0C0
          C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
          C000C0C0C00080808000FFFFFF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0
          C0008080800080808000FFFFFF00FFFFFF00C0C0C000C0C0C000C0C0C000C0C0
          C00080808000C0C0C000C0C0C000FFFFFF00C0C0C000C0C0C000C0C0C0008080
          800080808000C0C0C000C0C0C000FFFFFF00FFFFFF00C0C0C000C0C0C0008080
          8000C0C0C000C0C0C000C0C0C000C0C0C000FFFFFF00C0C0C000808080008080
          8000C0C0C000C0C0C000C0C0C000C0C0C000FFFFFF00FFFFFF00808080008080
          8000808080008080800080808000808080008080800080808000}
        ShowGridTitleRow = False
        OnClosed = AdvDBLookupComboBox2Closed
        OnLookupSuccess = AdvDBLookupComboBox2LookupSuccess
        Version = '1.8.2.1'
      end
      object AdvDBLookupComboBox1: TAdvDBLookupComboBox
        Left = 21
        Top = 160
        Width = 190
        Height = 24
        Enabled = True
        LabelPosition = lpLeftTop
        LabelMargin = 4
        LabelTransparent = False
        LabelAlwaysEnabled = False
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clWindowText
        LabelFont.Height = -11
        LabelFont.Name = 'MS Sans Serif'
        LabelFont.Style = []
        LabelWidth = 0
        LookupColumn = 0
        LookupMethod = lmFast
        LookupLoad = llAlways
        TabOrder = 5
        Columns = <
          item
            FixedColor = clBtnFace
            FixedColorTo = clNone
            GradientDir = gdVertical
            Width = 190
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ListField = 'descricao'
            Name = 'Column0'
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
          end>
        DataField = 'dia_da_semana'
        DataSource = dtmCadastroEnderecos.dsrLimitesEntregaRegioes
        DropWidth = 250
        DropStretchColumn = -1
        DropFont.Charset = DEFAULT_CHARSET
        DropFont.Color = clWindowText
        DropFont.Height = -11
        DropFont.Name = 'Tahoma'
        DropFont.Style = []
        KeyField = 'codigo'
        ListSource = dtmCadastroEnderecos.dsrSemana
        ReturnIsTab = True
        SortUpGlyph.Data = {
          36010000424D3601000000000000360000002800000008000000080000000100
          2000000000000001000000000000000000000000000000000000C0C0C000C0C0
          C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000808080008080
          8000808080008080800080808000808080008080800080808000808080008080
          8000C0C0C000C0C0C000C0C0C000C0C0C000FFFFFF00FFFFFF00C0C0C0008080
          8000C0C0C000C0C0C000C0C0C000C0C0C000FFFFFF00C0C0C000C0C0C0008080
          800080808000C0C0C000C0C0C000FFFFFF00FFFFFF00C0C0C000C0C0C000C0C0
          C00080808000C0C0C000C0C0C000FFFFFF00C0C0C000C0C0C000C0C0C000C0C0
          C0008080800080808000FFFFFF00FFFFFF00C0C0C000C0C0C000C0C0C000C0C0
          C000C0C0C00080808000FFFFFF00C0C0C000C0C0C000C0C0C000}
        SortDownGlyph.Data = {
          36010000424D3601000000000000360000002800000008000000080000000100
          2000000000000001000000000000000000000000000000000000C0C0C000C0C0
          C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
          C000C0C0C00080808000FFFFFF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0
          C0008080800080808000FFFFFF00FFFFFF00C0C0C000C0C0C000C0C0C000C0C0
          C00080808000C0C0C000C0C0C000FFFFFF00C0C0C000C0C0C000C0C0C0008080
          800080808000C0C0C000C0C0C000FFFFFF00FFFFFF00C0C0C000C0C0C0008080
          8000C0C0C000C0C0C000C0C0C000C0C0C000FFFFFF00C0C0C000808080008080
          8000C0C0C000C0C0C000C0C0C000C0C0C000FFFFFF00FFFFFF00808080008080
          8000808080008080800080808000808080008080800080808000}
        ShowGridTitleRow = False
        OnClosed = AdvDBLookupComboBox1Closed
        OnLookupSuccess = AdvDBLookupComboBox1LookupSuccess
        Version = '1.8.2.1'
      end
      object gbxCodigoRegiao: TGroupBox
        Left = 6
        Top = 6
        Width = 67
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
        object edfRegioesCodigo: TtecDbEditFind
          Left = 2
          Top = 10
          Width = 62
          Height = 23
          Alignment = taRightJustify
          CharCase = ecUpperCase
          DataField = 'codigo'
          DataSource = dtmCadastroEnderecos.dsrRegioes
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          Group = 'regioes'
          MaxLength = 10
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
      object gbxNomeRegiao: TGroupBox
        Left = 82
        Top = 6
        Width = 320
        Height = 36
        Caption = ' NOME DA REGI'#195'O '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object edtNomeRegiao: TDBEditTexto
          Left = 2
          Top = 10
          Width = 315
          Height = 23
          DataField = 'nome'
          DataSource = dtmCadastroEnderecos.dsrRegioes
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = 13
          ParentFont = False
          TabOrder = 0
          CharCasenoDefault = False
          Alignment = taLeftJustify
        end
      end
      object gbxPontosRegiao: TGroupBox
        Left = 7
        Top = 48
        Width = 67
        Height = 36
        Caption = ' PONTOS '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        object edtPontosRegiao: TDBEditNumero
          Left = 2
          Top = 10
          Width = 62
          Height = 23
          CharCase = ecUpperCase
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = -1
          ParentFont = False
          TabOrder = 0
          Text = '9.999,00'
          Mascara = True
          Alignment = taCenter
          TipoMascara = tmGERAL
          NrDecimal = 2
          Decimais = False
          Negativo = True
          Tamanho = 4
          DataField = 'pontos'
          DataSource = dtmCadastroEnderecos.dsrRegioes
        end
      end
      object gbxFreteRegiao: TGroupBox
        Left = 83
        Top = 48
        Width = 320
        Height = 36
        Caption = ' TABELA DE FRETE '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        object sbnProcurarRegioesFrete: TSpeedButton
          Left = 63
          Top = 10
          Width = 23
          Height = 24
          Hint = 'Procurar Tabela de Fretes'
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
          OnClick = sbnProcurarRegioesFreteClick
        end
        object dtxDescricaoFreteRegioes: TtecDBText
          Left = 89
          Top = 10
          Width = 228
          Height = 23
          TabStop = False
          Color = clBtnFace
          DataField = 'descricao'
          DataSource = dtmCadastroEnderecos.dsrConsultaTabelaFretesRegiao
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
        object flkRegioesFrete: TtecDBFindLookup
          Left = 2
          Top = 10
          Width = 60
          Height = 23
          Alignment = taRightJustify
          CharCase = ecUpperCase
          DataField = 'frete'
          DataSource = dtmCadastroEnderecos.dsrRegioes
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = 2
          Maximo = 0
          Minimo = 37353
          Adicional = 0
          Opcional = True
          ParentFont = False
          TabOrder = 1
          PermitirZero = False
          PermitirNulo = False
          Operacao = opATRIBUICAO
          LookupField = 'codigo'
          LookupSource = dtmCadastroEnderecos.dsrConsultaTabelaFretesRegiao
          LookupQueryParameter = 'codigo'
          Parameter = ' '
          ActiveSetControls = False
          DenyInsert = True
          NoSetControls = <>
          SetControls = <>
          LookupParameter = 'codigo'
        end
      end
      object gbxLimites_Periodo_Entrega: TGroupBox
        Left = 0
        Top = 88
        Width = 497
        Height = 249
        Caption = 'Limites Per'#237'odos de Entrega'
        TabOrder = 4
        object DBAdvLimites_Periodo_Entrega: TDBAdvGrid
          Left = 2
          Top = 18
          Width = 493
          Height = 229
          Cursor = crDefault
          Align = alClient
          ColCount = 4
          RowCount = 2
          FixedRows = 1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Pitch = fpVariable
          Font.Style = []
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
          ParentFont = False
          ScrollBars = ssBoth
          TabOrder = 0
          OnKeyDown = DBAdvLimites_Periodo_EntregaKeyDown
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
              FieldName = 'descricaosemana'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Pitch = fpVariable
              Font.Style = []
              Header = 'Semana'
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
              Width = 190
            end
            item
              Borders = []
              BorderPen.Color = clSilver
              CheckFalse = 'N'
              CheckTrue = 'Y'
              Color = clWindow
              EditLink = FormControlEditLink2
              Editor = edCustom
              FieldName = 'descricaoperiodo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Pitch = fpVariable
              Font.Style = []
              Header = 'Per'#237'odo'
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
              Width = 190
            end
            item
              Alignment = taRightJustify
              Borders = []
              BorderPen.Color = clSilver
              CheckFalse = 'N'
              CheckTrue = 'Y'
              Color = clWindow
              Editor = edNumeric
              FieldName = 'quantidade'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Pitch = fpVariable
              Font.Style = []
              Header = 'Quantidade'
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
              Width = 68
            end>
          DataSource = dtmCadastroEnderecos.dsrLimitesEntregaRegioes
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
          ColWidths = (
            20
            190
            190
            68)
        end
      end
    end
  end
  object FormControlEditLink1: TFormControlEditLink
    Tag = 0
    AutoPopupWidth = True
    EditStyle = esInplace
    PopupWidth = 0
    PopupHeight = 0
    WantKeyLeftRight = True
    WantKeyUpDown = True
    WantKeyHomeEnd = True
    WantKeyPriorNext = True
    WantKeyReturn = True
    WantKeyEscape = True
    Control = AdvDBLookupComboBox1
    Left = 423
    Top = 117
  end
  object FormControlEditLink2: TFormControlEditLink
    Tag = 0
    AutoPopupWidth = True
    EditStyle = esInplace
    PopupWidth = 0
    PopupHeight = 0
    WantKeyLeftRight = True
    WantKeyUpDown = True
    WantKeyHomeEnd = True
    WantKeyPriorNext = True
    WantKeyReturn = True
    WantKeyEscape = True
    Control = AdvDBLookupComboBox2
    Left = 455
    Top = 117
  end
end
