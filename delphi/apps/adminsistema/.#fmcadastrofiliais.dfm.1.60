inherited frmCadastroFiliais: TfrmCadastroFiliais
  Left = 465
  Top = 62
  Caption = 'Cadastro de Filiais'
  ClientHeight = 683
  ClientWidth = 1041
  FormStyle = fsMDIChild
  Visible = True
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBarra: TPanel
    Width = 658
    TabOrder = 2
  end
  inherited pnlTopMenu: TPanel
    Width = 1041
    inherited tblBarra: TToolBar
      Width = 816
      inherited sbnAjuda: TSpeedButton
        Action = actAbilitar
      end
    end
  end
  object pnlFundoJanela: TPanel
    Left = 0
    Top = 45
    Width = 1041
    Height = 638
    Align = alClient
    AutoSize = True
    BevelOuter = bvNone
    BorderWidth = 3
    TabOrder = 0
    object gbxCodigo: TGroupBox
      Left = 6
      Top = 6
      Width = 55
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
      object edfCodigo: TtecDbEditFind
        Left = 2
        Top = 10
        Width = 50
        Height = 23
        Alignment = taLeftJustify
        DataField = 'codigo'
        DataSource = dtmCadastrosInternos.dsrFiliais
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        Group = 'Filial'
        MaxLength = 3
        Maximo = 0
        Minimo = 37353
        Adicional = 0
        Opcional = True
        OnFound = edfCodigoFound
        ParentFont = False
        TabOrder = 0
        PermitirZero = False
        PermitirNulo = False
        Operacao = opATRIBUICAO
        Parameter = 'codigo'
        ActiveSetControls = True
        DenyInsert = False
        NoSetControls = <
          item
            Control = gbxCodigo
          end
          item
            Control = edfCodigo
          end>
        SetControls = <
          item
            Control = pgcFiliais
          end
          item
            Control = gbxNome
          end
          item
            Control = gbxRazaoSocial
          end
          item
            Control = gbxSigla
          end
          item
            Control = gbxNaturezaJuridica
          end>
      end
    end
    object pgcFiliais: TtecPageControl
      Left = 3
      Top = 76
      Width = 1035
      Height = 559
      ActivePage = tstParametros
      Align = alBottom
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      object tstIdentificacao: TTabSheet
        BorderWidth = 2
        Caption = ' &1 - Identifica'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        inline fraEnderecoEditorFilial: TfraEnderecoEditor
          Left = 195
          Top = 6
          Width = 451
          Height = 151
          HorzScrollBar.Visible = False
          VertScrollBar.Visible = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          inherited gbxEndereco: TGroupBox
            Width = 451
            Height = 151
            Caption = ' ENDERE'#199'O '
            Font.Height = -11
            Font.Style = [fsBold]
            inherited pnlNumero: TPanel
              Top = 56
              Width = 447
              inherited edtNumeroEndereco: TDBEditTexto
                DataField = 'numero'
                DataSource = dtmCadastrosInternos.dsrFiliais
                MaxLength = 9
              end
              inherited edtComplemento: TDBEditTexto
                Left = 81
                Width = 340
                DataField = 'complemento'
                DataSource = dtmCadastrosInternos.dsrFiliais
                MaxLength = 14
              end
            end
            inherited pnlBairro: TPanel
              Top = 89
              Width = 447
              inherited edtBairro: TtecDoubleDBEdit
                LookupField = 'nomebairro'
                LookupSource = dtmCadastrosInternos.dsrFiliais
                DataField = 'bairro'
                DataSource = dtmCadastrosInternos.dsrFiliais
                MaxLength = 80
              end
            end
            inherited pnlCidade: TPanel
              Top = 125
              Width = 447
              inherited edtEstado: TDBEditTexto
                DataField = 'estado'
                DataSource = dtmCadastrosInternos.dsrFiliais
                MaxLength = 9
              end
              inherited edtCidade: TtecDoubleDBEdit
                LookupField = 'nomecidade'
                LookupSource = dtmCadastrosInternos.dsrFiliais
                DataField = 'cidade'
                DataSource = dtmCadastrosInternos.dsrFiliais
                MaxLength = 72
              end
              inherited edtCEP: TDBEditCep
                DataField = 'cep'
                DataSource = dtmCadastrosInternos.dsrFiliais
                MaxLength = 9
              end
            end
            inherited pnlRua: TPanel
              Top = 16
              Width = 447
              inherited mmoRua: TtecDBMemo
                Left = 1
                Width = 418
                DataField = 'rua'
                DataSource = dtmCadastrosInternos.dsrFiliais
                Font.Height = -12
              end
            end
            inherited pnllblCidade: TPanel
              Top = 115
              Width = 447
            end
            inherited pnllblBairro: TPanel
              Top = 79
              Width = 447
              inherited lblBairro_: TLabel
                Width = 40
                Height = 14
                Font.Height = -11
                Font.Style = [fsBold]
                ParentFont = False
              end
            end
            inherited pnllblNumero: TPanel
              Top = 46
              Width = 447
              inherited lblenderecocliente_numero: TLabel
                Left = -2
                Width = 45
                Height = 14
                Font.Height = -11
                Font.Style = [fsBold]
                ParentFont = False
              end
              inherited lblenderecocliente_complemento: TLabel
                Width = 84
                Height = 14
                Font.Height = -11
                Font.Style = [fsBold]
                ParentFont = False
              end
            end
          end
        end
        inline fraTelefoneFilial: TfraTelefone
          Left = 195
          Top = 212
          Width = 148
          Height = 51
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          inherited gbxFone: TGroupBox
            Width = 148
            Align = alCustom
            Caption = ' TELEFONE '
            inherited edtDDD: TDBEditNumero
              Left = 2
              Font.Height = -12
              Text = 'edtDDD'
              DataField = 'foneddd'
              DataSource = dtmCadastrosInternos.dsrFiliais
            end
            inherited edtNumero: TDBEditFone
              Left = 45
              DataField = 'fonenumero'
              DataSource = dtmCadastrosInternos.dsrFiliais
              Font.Height = -12
            end
          end
        end
        inline fraFaxFilial: TfraTelefone
          Left = 195
          Top = 270
          Width = 148
          Height = 51
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 7
          inherited gbxFone: TGroupBox
            Width = 148
            Align = alCustom
            Caption = ' N'#186' FAX '
            inherited edtDDD: TDBEditNumero
              Left = 2
              Font.Height = -12
              Text = 'edtDDD'
              DataField = 'faxddd'
              DataSource = dtmCadastrosInternos.dsrFiliais
            end
            inherited edtNumero: TDBEditFone
              Left = 45
              DataField = 'faxnumero'
              DataSource = dtmCadastrosInternos.dsrFiliais
              Font.Height = -12
            end
          end
        end
        object gbxQuitacaoCarne: TGroupBox
          Left = 355
          Top = 306
          Width = 205
          Height = 49
          Caption = ' QUITA'#199#195'O DE CARN'#202'S '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 9
          object gbxRazaoQuitacao: TGroupBox
            Left = 0
            Top = 12
            Width = 205
            Height = 36
            Caption = 'RAZ'#195'O'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object edtRazaoQuitacao: TDBEditTexto
              Left = 2
              Top = 10
              Width = 200
              Height = 23
              DataField = 'razaoquitacao'
              DataSource = dtmCadastrosInternos.dsrFiliais
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
        end
        object gbxImpressaoCarnes: TGroupBox
          Left = 355
          Top = 212
          Width = 205
          Height = 83
          Caption = ' IMPRESS'#195'O DE CARN'#202'S '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 8
          object gbxRazaoImpressao: TGroupBox
            Left = 0
            Top = 12
            Width = 205
            Height = 36
            Caption = ' RAZ'#195'O '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object edtRazaoCarne: TDBEditTexto
              Left = 2
              Top = 10
              Width = 200
              Height = 23
              DataField = 'razaocarne'
              DataSource = dtmCadastrosInternos.dsrFiliais
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
          object gbxCidadeImpressao: TGroupBox
            Left = 0
            Top = 47
            Width = 205
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
            object edtCidadeCarne: TDBEditTexto
              Left = 2
              Top = 10
              Width = 200
              Height = 23
              DataField = 'cidadecarne'
              DataSource = dtmCadastrosInternos.dsrFiliais
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              MaxLength = 14
              ParentFont = False
              TabOrder = 0
              CharCasenoDefault = False
              Alignment = taLeftJustify
            end
          end
        end
        object gbxIESubstTributaria: TGroupBox
          Left = 4
          Top = 119
          Width = 180
          Height = 203
          Caption = ' SUBSTITUI'#199#195'O TRIBUT'#193'RIA '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          inline fraIESubstTributario1: TfraIESubstTributario
            Left = 2
            Top = 16
            Width = 176
            Height = 185
            HorzScrollBar.Range = 176
            VertScrollBar.Range = 189
            Align = alClient
            AutoScroll = False
            TabOrder = 0
            inherited dbgIESubstTributario: TtecDBGrid
              Width = 176
              Height = 189
              Align = alNone
              Font.Name = 'Helvetica'
              Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
              CanDelete = True
              DefaultRowHeight = 19
              Columns = <
                item
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'estado'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = 'MS Shell Dlg'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  Title.Alignment = taCenter
                  Title.Caption = 'UF'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clBlack
                  Title.Font.Height = -9
                  Title.Font.Name = 'helvetica'
                  Title.Font.Pitch = fpVariable
                  Title.Font.Style = []
                  Width = 25
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'inscricaoestadual'
                  Title.Alignment = taCenter
                  Title.Caption = 'INSCRI'#199#195'O ESTADUAL'
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
            inherited dsrIESubstTributario: TtecDataSource
              DataSet = dtmCadastrosInternos.qryIESubstTributario
              OnDataChange = fraIESubstTributario1dsrIESubstTributarioDataChange
            end
          end
        end
        object gbxInscrEstadual: TGroupBox
          Left = 4
          Top = 43
          Width = 135
          Height = 36
          Caption = ' INSCRI'#199#195'O ESTADUAL '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          object edtInscricaoEstadual: TDBEditDocumento
            Left = 2
            Top = 10
            Width = 130
            Height = 23
            DataField = 'inscricaoestadual'
            DataSource = dtmCadastrosInternos.dsrFiliais
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
            Tipo = InscricaoEstadual
          end
        end
        object gbxCNPJ: TGroupBox
          Left = 4
          Top = 6
          Width = 135
          Height = 36
          Caption = ' CNPJ MF '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object edtCNPJ: TDBEditCNPJ
            Left = 2
            Top = 10
            Width = 130
            Height = 23
            DataField = 'cnpj'
            DataSource = dtmCadastrosInternos.dsrFiliais
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
            Decimais = False
            Negativo = False
          end
        end
        object gbxInscMunicipal: TGroupBox
          Left = 4
          Top = 80
          Width = 135
          Height = 36
          Caption = ' INSCRI'#199#195'O MUNICIPAL '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          object edtInscricaoMunicipal: TDBEditDocumento
            Left = 2
            Top = 10
            Width = 130
            Height = 23
            DataField = 'inscricaomunicipal'
            DataSource = dtmCadastrosInternos.dsrFiliais
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            MaxLength = 21
            ParentFont = False
            TabOrder = 0
            CharCasenoDefault = False
            Alignment = taLeftJustify
            Tipo = InscricaoMunicipal
          end
        end
        object gbxSite: TGroupBox
          Left = 192
          Top = 166
          Width = 455
          Height = 36
          Caption = ' SITE '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          object edtSite: TDBEditTexto
            Left = 2
            Top = 10
            Width = 450
            Height = 23
            CharCase = ecLowerCase
            DataField = 'site'
            DataSource = dtmCadastrosInternos.dsrFiliais
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            MaxLength = 7
            ParentFont = False
            TabOrder = 0
            CharCasenoDefault = True
            Alignment = taLeftJustify
          end
        end
      end
      object tstParametros: TTabSheet
        Caption = ' &2 - Par'#226'metros'
        ImageIndex = 1
        object pgcSeries: TtecPageControl
          Left = 402
          Top = -1
          Width = 584
          Height = 226
          ActivePage = tstSeriesFiliais
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 10
          object tstSeriesFiliais: TTabSheet
            Caption = ' &S'#233'ries '
            object sbnIncluirSerieFilial: TSpeedButton
              Left = 551
              Top = 12
              Width = 23
              Height = 22
              Hint = 'Incluir s'#233'rie filial'
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
              OnClick = sbnIncluirSerieFilialClick
            end
            object sbnExcluirSerieFilial: TSpeedButton
              Left = 551
              Top = 34
              Width = 23
              Height = 22
              Hint = 'Excluir s'#233'rie filial'
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
              OnClick = sbnExcluirSerieFilialClick
            end
            object dbgSeriesFiliais: TtecDBGrid
              Left = 0
              Top = 4
              Width = 545
              Height = 197
              DataSource = dtmCadastrosInternos.dsrSeriesFiliais
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
              ParentFont = False
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clBlack
              TitleFont.Height = -12
              TitleFont.Name = 'helvetica'
              TitleFont.Pitch = fpVariable
              TitleFont.Style = []
              OnDblClick = dbgSeriesFiliaisDblClick
              RowWrap = 60
              Large = False
              DoubleRowColor = False
              MsgDelete = 'a S'#201'RIE FILIAL'
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
                  FieldName = 'valor'
                  Title.Alignment = taCenter
                  Title.Caption = 'S'#201'RIE'
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
                  Expanded = False
                  FieldName = 'numeroinicial'
                  Title.Alignment = taCenter
                  Title.Caption = 'N'#186' INICIAL'
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
                  FieldName = 'numerofinal'
                  Title.Alignment = taCenter
                  Title.Caption = 'N'#186' FINAL'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clBlack
                  Title.Font.Height = -9
                  Title.Font.Name = 'helvetica'
                  Title.Font.Pitch = fpVariable
                  Title.Font.Style = []
                  Width = 73
                  Visible = True
                end
                item
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'modelonota'
                  Title.Alignment = taCenter
                  Title.Caption = 'MODELO NF'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clBlack
                  Title.Font.Height = -9
                  Title.Font.Name = 'helvetica'
                  Title.Font.Pitch = fpVariable
                  Title.Font.Style = []
                  Width = 63
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'modelodoctofiscal'
                  Title.Caption = 'MODELO DOCTO'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clBlack
                  Title.Font.Height = -9
                  Title.Font.Name = 'helvetica'
                  Title.Font.Pitch = fpVariable
                  Title.Font.Style = []
                  Visible = True
                end
                item
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'ativa'
                  Title.Alignment = taCenter
                  Title.Caption = 'ATIVA'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clBlack
                  Title.Font.Height = -9
                  Title.Font.Name = 'helvetica'
                  Title.Font.Pitch = fpVariable
                  Title.Font.Style = []
                  Visible = True
                end
                item
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'requerconfirmacao'
                  Title.Alignment = taCenter
                  Title.Caption = 'REQUER. CONFIRMA'#199#195'O'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clBlack
                  Title.Font.Height = -9
                  Title.Font.Name = 'helvetica'
                  Title.Font.Pitch = fpVariable
                  Title.Font.Style = []
                  Width = 115
                  Visible = True
                end>
            end
          end
          object tstEstoques: TTabSheet
            Caption = ' &Estoques '
            ImageIndex = 1
            inline fraEstoquesFiliais: TfraEstoquesFiliais
              Left = 0
              Top = 0
              Width = 576
              Height = 196
              Align = alClient
              TabOrder = 0
              inherited dbgEstoquesFiliais: TtecDBGrid
                Width = 576
                Height = 196
                Font.Height = -12
                Font.Name = 'Helvetica'
                DefaultRowHeight = 19
                Columns = <
                  item
                    Alignment = taCenter
                    Expanded = False
                    FieldName = 'filialestoque'
                    Title.Alignment = taCenter
                    Title.Caption = 'C'#211'DIGO'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clBlack
                    Title.Font.Height = -9
                    Title.Font.Name = 'Helvetica'
                    Title.Font.Pitch = fpVariable
                    Title.Font.Style = []
                    Width = 45
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'nomefilial'
                    ReadOnly = True
                    Title.Alignment = taCenter
                    Title.Caption = 'NOME DA FILIAL DO ESTOQUE'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clBlack
                    Title.Font.Height = -9
                    Title.Font.Name = 'Helvetica'
                    Title.Font.Pitch = fpVariable
                    Title.Font.Style = []
                    Width = 380
                    Visible = True
                  end>
              end
              inherited dsrEstoquesFiliais: TtecDataSource
                DataSet = dtmCadastrosInternos.qryEstoquesFiliais
              end
            end
          end
        end
        object rgpTipoFilial: TtecDBRadioGroup
          Left = 6
          Top = 5
          Width = 92
          Height = 81
          Caption = ' TIPO DE FILIAL '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          TabStop = False
          DataField = 'tipofilial'
          DataSource = dtmCadastrosInternos.dsrFiliais
          object rbnLoja: TtecRadioButton
            Left = 6
            Top = 15
            Width = 77
            Height = 17
            Caption = 'Loja'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            Value = 'L'
          end
          object rbnDeposito: TtecRadioButton
            Left = 6
            Top = 35
            Width = 77
            Height = 17
            Caption = 'Dep'#243'sito'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            Value = 'D'
          end
          object rbnVirtual: TtecRadioButton
            Left = 6
            Top = 55
            Width = 77
            Height = 17
            Caption = 'Virtual'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            Value = 'V'
          end
        end
        object gbxContribuinte: TGroupBox
          Left = 107
          Top = 5
          Width = 94
          Height = 82
          Caption = ' CONTRIBUINTE '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          object ckbIcms: TDBCheckBox
            Left = 17
            Top = 18
            Width = 55
            Height = 17
            Caption = 'ICMS'
            DataField = 'contribicms'
            DataSource = dtmCadastrosInternos.dsrFiliais
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
          object ckbIPI: TDBCheckBox
            Left = 17
            Top = 38
            Width = 55
            Height = 17
            Caption = 'IPI'
            DataField = 'contribipi'
            DataSource = dtmCadastrosInternos.dsrFiliais
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
          object ckbISS: TDBCheckBox
            Left = 17
            Top = 58
            Width = 55
            Height = 17
            Caption = 'ISS'
            DataField = 'contribiss'
            DataSource = dtmCadastrosInternos.dsrFiliais
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
        end
        object gbxSPC: TGroupBox
          Left = 4
          Top = 207
          Width = 325
          Height = 93
          Caption = ' SPC '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 7
          object gbxRegistro: TGroupBox
            Left = 2
            Top = 12
            Width = 78
            Height = 36
            Caption = ' REGISTRO '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object edtCodigoInformante: TDBEditTexto
              Left = 2
              Top = 10
              Width = 73
              Height = 23
              DataField = 'spc_codigoinformante'
              DataSource = dtmCadastrosInternos.dsrFiliais
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
          object gbxDestinatario: TGroupBox
            Left = 78
            Top = 12
            Width = 169
            Height = 36
            Caption = ' DESTINAT'#193'RIO '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            object edtDestinatario: TDBEditTexto
              Left = 2
              Top = 10
              Width = 164
              Height = 23
              DataField = 'spc_destinatario'
              DataSource = dtmCadastrosInternos.dsrFiliais
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
          object gbxDASPDestinatario: TGroupBox
            Left = 245
            Top = 12
            Width = 78
            Height = 36
            Caption = ' DASP '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            object edtDASPDestinatario: TDBEditTexto
              Left = 2
              Top = 10
              Width = 73
              Height = 23
              DataField = 'spc_dasp_destinatario'
              DataSource = dtmCadastrosInternos.dsrFiliais
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
          object gbxOperador: TGroupBox
            Left = 2
            Top = 57
            Width = 78
            Height = 36
            Caption = ' OPERADOR '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            object edtOperador: TDBEditTexto
              Left = 2
              Top = 10
              Width = 73
              Height = 23
              DataField = 'spc_operador'
              DataSource = dtmCadastrosInternos.dsrFiliais
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 0
              CharCasenoDefault = False
              Alignment = taLeftJustify
            end
          end
          object gbxRemetente: TGroupBox
            Left = 78
            Top = 57
            Width = 169
            Height = 36
            Caption = ' REMETENTE '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            object edtRemetente: TDBEditTexto
              Left = 2
              Top = 10
              Width = 164
              Height = 23
              DataField = 'spc_remetente'
              DataSource = dtmCadastrosInternos.dsrFiliais
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              MaxLength = 12
              ParentFont = False
              TabOrder = 0
              CharCasenoDefault = False
              Alignment = taLeftJustify
            end
          end
          object gbxDASPRemetente: TGroupBox
            Left = 245
            Top = 57
            Width = 78
            Height = 36
            Caption = ' DASP '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 5
            object edtDASPRemetente: TDBEditTexto
              Left = 2
              Top = 10
              Width = 73
              Height = 23
              DataField = 'spc_dasp_remetente'
              DataSource = dtmCadastrosInternos.dsrFiliais
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
        end
        object gbxPrazoReservaEstoque: TGroupBox
          Left = 209
          Top = 33
          Width = 65
          Height = 39
          Caption = ' ESTOQUE '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          object edtPrazoReserva: TDBEditNumero
            Left = 2
            Top = 12
            Width = 35
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
            Text = 'edtPrazoReserva'
            Mascara = False
            Alignment = taLeftJustify
            TipoMascara = tmGERAL
            NrDecimal = 2
            Decimais = False
            Negativo = False
            Tamanho = 2
            DataField = 'prazoreserva'
            DataSource = dtmCadastrosInternos.dsrFiliais
          end
        end
        object gbxSerieSugestao: TGroupBox
          Left = 284
          Top = 5
          Width = 105
          Height = 87
          Caption = 'S'#201'RIES SUGEST'#195'O '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          object lblSerieSugestaoProduto: TLabel
            Left = 7
            Top = 16
            Width = 50
            Height = 15
            Caption = 'Produtos'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
          end
          object lblSerieSugestaoServico: TLabel
            Left = 7
            Top = 40
            Width = 47
            Height = 15
            Caption = 'Servi'#231'os'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
          end
          object lblSerieSugestaoNFCe: TLabel
            Left = 7
            Top = 64
            Width = 36
            Height = 15
            Caption = 'NFC-e'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
          end
          object edtSerieSugestaoMercadorias: TDBEditTexto
            Left = 64
            Top = 12
            Width = 38
            Height = 23
            DataField = 'seriesugestao'
            DataSource = dtmCadastrosInternos.dsrFiliais
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            MaxLength = 16
            ParentFont = False
            TabOrder = 0
            OnExit = edtSerieSugestaoMercadoriasExit
            CharCasenoDefault = False
            Alignment = taCenter
          end
          object edtSerieSugestaoServicos: TDBEditTexto
            Left = 64
            Top = 36
            Width = 37
            Height = 23
            DataField = 'seriesugestaoservicos'
            DataSource = dtmCadastrosInternos.dsrFiliais
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            MaxLength = 16
            ParentFont = False
            TabOrder = 1
            OnExit = edtSerieSugestaoMercadoriasExit
            CharCasenoDefault = False
            Alignment = taCenter
          end
          object edtSerieSugestaoNFCe: TDBEditTexto
            Left = 64
            Top = 60
            Width = 37
            Height = 23
            DataField = 'seriesugestaonfce'
            DataSource = dtmCadastrosInternos.dsrFiliais
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            MaxLength = 16
            ParentFont = False
            TabOrder = 2
            OnExit = edtSerieSugestaoMercadoriasExit
            CharCasenoDefault = False
            Alignment = taCenter
          end
        end
        object gbxOpcoes: TGroupBox
          Left = 6
          Top = 99
          Width = 203
          Height = 97
          Caption = ' OP'#199#213'ES '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          object ckbNotaFiscalFilialVenda: TDBCheckBox
            Left = 6
            Top = 15
            Width = 179
            Height = 17
            Caption = 'Nota fiscal na filial de venda'
            DataField = 'transfautomatica'
            DataSource = dtmCadastrosInternos.dsrFiliais
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
          object ckbExibirComplementonf: TDBCheckBox
            Left = 6
            Top = 35
            Width = 179
            Height = 17
            Caption = 'Exibir complemento da NF'
            DataField = 'exibircomplementonf'
            DataSource = dtmCadastrosInternos.dsrFiliais
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
          object ckbMaodeObra: TDBCheckBox
            Left = 6
            Top = 55
            Width = 123
            Height = 17
            Caption = 'Gerar Reinf'
            DataField = 'maodeobra'
            DataSource = dtmCadastrosInternos.dsrFiliais
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
          object ckbExcluirICMSdePISeCOFINS: TDBCheckBox
            Left = 6
            Top = 73
            Width = 187
            Height = 17
            Caption = 'Excluir ICMS de PIS e COFINS'
            DataField = 'excluiricmsdepisecofins'
            DataSource = dtmCadastrosInternos.dsrFiliais
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
        end
        object gbxTipoNFServico: TtecDBRadioGroup
          Left = 402
          Top = 234
          Width = 215
          Height = 182
          Caption = ' TIPO DE NFe DE SERVI'#199'O '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 11
          TabStop = False
          DataField = 'tipoemissaonfeservico'
          DataSource = dtmCadastrosInternos.dsrFiliais
          object rbnBethaSistemas: TtecRadioButton
            Left = 6
            Top = 15
            Width = 190
            Height = 17
            Caption = 'Eletr'#244'nica - Betha Sistemas'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            Value = '3'
          end
          object rbnNotaConjugada: TtecRadioButton
            Left = 6
            Top = 33
            Width = 190
            Height = 17
            Caption = 'Eletr'#244'nica - Conjugada'
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
          object rbnOutras: TtecRadioButton
            Left = 6
            Top = 141
            Width = 190
            Height = 17
            Caption = 'Outras'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 7
            Value = '5'
          end
          object rbnInexistente: TtecRadioButton
            Left = 6
            Top = 87
            Width = 190
            Height = 17
            Caption = 'Inexistente'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            Value = '6'
          end
          object rbnSErvicoMatricial: TtecRadioButton
            Left = 6
            Top = 105
            Width = 190
            Height = 17
            Caption = 'Matricial'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 5
            Value = '1'
          end
          object rbnMatricialConjugada: TtecRadioButton
            Left = 6
            Top = 123
            Width = 190
            Height = 17
            Caption = 'Matricial Conjugada'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 6
            Value = '2'
          end
          object tecRadioButton1: TtecRadioButton
            Left = 6
            Top = 69
            Width = 190
            Height = 17
            Caption = 'Florian'#243'polis - SoftPlan'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            Value = '7'
          end
          object rbnPalhocaIPM: TtecRadioButton
            Left = 6
            Top = 159
            Width = 190
            Height = 17
            Caption = 'Palho'#231'a - IPM Fiscal'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 8
            Value = '8'
          end
          object rbnEletronicaAmbNacional: TtecRadioButton
            Left = 6
            Top = 51
            Width = 190
            Height = 12
            Caption = 'Eletr'#244'nica - Ambiente Nacional'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            Value = '9'
          end
        end
        object gbxAedfFatura: TGroupBox
          Left = 402
          Top = 420
          Width = 215
          Height = 36
          Caption = ' AEDF FATURA '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 12
          object edtAedfFatura: TDBEditTexto
            Left = 2
            Top = 10
            Width = 210
            Height = 23
            DataField = 'aedffatura'
            DataSource = dtmCadastrosInternos.dsrFiliais
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
        object stxPrazoPara: TStaticText
          Left = 210
          Top = 6
          Width = 64
          Height = 16
          Caption = 'PRAZO PARA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object stxReserva: TStaticText
          Left = 210
          Top = 19
          Width = 64
          Height = 16
          Caption = 'RESERVA DE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
        object gbxSenhaEnvioNFSe: TGroupBox
          Left = 630
          Top = 224
          Width = 357
          Height = 305
          Caption = ' PAR'#194'METROS PARA A EMISS'#195'O DE NFPS-e'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 13
          object gbxSenha_1: TGroupBox
            Left = 2
            Top = 50
            Width = 135
            Height = 36
            Caption = ' SENHA '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            object edtclient_secret_nfse_: TDBEditTexto
              Left = 2
              Top = 10
              Width = 130
              Height = 23
              DataField = 'senha_nfse'
              DataSource = dtmCadastrosInternos.dsrFiliais
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              MaxLength = -1
              ParentFont = False
              PasswordChar = '*'
              TabOrder = 0
              CharCasenoDefault = True
              Alignment = taLeftJustify
            end
          end
          object gbxLoginName: TGroupBox
            Left = 2
            Top = 15
            Width = 135
            Height = 36
            Caption = ' LOGIN '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object edtclient_id_nfse_: TDBEditTexto
              Left = 2
              Top = 10
              Width = 130
              Height = 23
              CharCase = ecLowerCase
              DataField = 'usuario_nfse'
              DataSource = dtmCadastrosInternos.dsrFiliais
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              MaxLength = -1
              ParentFont = False
              TabOrder = 0
              CharCasenoDefault = True
              Alignment = taLeftJustify
            end
          end
          object gbxurlauth_nfse: TGroupBox
            Left = 2
            Top = 122
            Width = 353
            Height = 36
            Caption = 'URL AUTENTICA'#199#195'O'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 5
            object edturlauth_nfse: TDBEditTexto
              Left = 2
              Top = 10
              Width = 348
              Height = 23
              CharCase = ecLowerCase
              DataField = 'urlauth_nfse'
              DataSource = dtmCadastrosInternos.dsrFiliais
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              MaxLength = -1
              ParentFont = False
              TabOrder = 0
              CharCasenoDefault = True
              Alignment = taLeftJustify
            end
          end
          object gbxclient_id_nfse: TGroupBox
            Left = 135
            Top = 15
            Width = 220
            Height = 36
            Caption = 'CLIENT ID'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            object edtclient_id_nfse: TDBEditTexto
              Left = 2
              Top = 10
              Width = 215
              Height = 23
              CharCase = ecLowerCase
              DataField = 'client_id_nfse'
              DataSource = dtmCadastrosInternos.dsrFiliais
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              MaxLength = -1
              ParentFont = False
              TabOrder = 0
              CharCasenoDefault = True
              Alignment = taLeftJustify
            end
          end
          object gbxedtclient_secret_nfse: TGroupBox
            Left = 135
            Top = 51
            Width = 220
            Height = 36
            Caption = 'CLIENT SECRET'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            object edtclient_secret_nfse: TDBEditTexto
              Left = 2
              Top = 10
              Width = 215
              Height = 23
              DataField = 'client_secret_nfse'
              DataSource = dtmCadastrosInternos.dsrFiliais
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              MaxLength = -1
              ParentFont = False
              PasswordChar = '*'
              TabOrder = 0
              CharCasenoDefault = True
              Alignment = taLeftJustify
            end
          end
          object gbxSiteNFServico: TGroupBox
            Left = 2
            Top = 86
            Width = 353
            Height = 36
            Caption = 'SITE'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            object edtSiteNFServico: TDBEditTexto
              Left = 2
              Top = 10
              Width = 348
              Height = 23
              CharCase = ecLowerCase
              DataField = 'site_nfse'
              DataSource = dtmCadastrosInternos.dsrFiliais
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              MaxLength = -1
              ParentFont = False
              TabOrder = 0
              CharCasenoDefault = True
              Alignment = taLeftJustify
            end
          end
          object gbxUrlProcessamento_normal: TGroupBox
            Left = 2
            Top = 158
            Width = 353
            Height = 36
            Caption = 'URL PROCESSAMENTO NORMAL'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 6
            object edtURLProcessamento_normal: TDBEditTexto
              Left = 2
              Top = 10
              Width = 348
              Height = 23
              CharCase = ecLowerCase
              DataField = 'urlprocessamento_normal'
              DataSource = dtmCadastrosInternos.dsrFiliais
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              MaxLength = -1
              ParentFont = False
              TabOrder = 0
              CharCasenoDefault = True
              Alignment = taLeftJustify
            end
          end
          object gbxUrlProcessamento_simplificada: TGroupBox
            Left = 2
            Top = 194
            Width = 353
            Height = 36
            Caption = 'URL PROCESSAMENTO SIMPLIFICADA'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 7
            object edtUrlProcessamento_simplificada: TDBEditTexto
              Left = 2
              Top = 10
              Width = 348
              Height = 23
              CharCase = ecLowerCase
              DataField = 'urlprocessamento_simplificada'
              DataSource = dtmCadastrosInternos.dsrFiliais
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              MaxLength = -1
              ParentFont = False
              TabOrder = 0
              CharCasenoDefault = True
              Alignment = taLeftJustify
            end
          end
          object gbxnumeroseriecertificadodigital: TGroupBox
            Left = 2
            Top = 268
            Width = 185
            Height = 36
            Caption = 'S'#201'RIE DO CERTIFICADO DIGITAL'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 9
            object edtnumeroseriecertificadodigital: TDBEditTexto
              Left = 2
              Top = 10
              Width = 180
              Height = 23
              DataField = 'numeroseriecertificadodigital'
              DataSource = dtmCadastrosInternos.dsrFiliais
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              MaxLength = -1
              ParentFont = False
              TabOrder = 0
              CharCasenoDefault = True
              Alignment = taLeftJustify
            end
          end
          object gbxsenhacertificadodigital: TGroupBox
            Left = 185
            Top = 268
            Width = 170
            Height = 36
            Caption = 'SENHA DO CERTIFICADO DIGITAL'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 10
            object edtsenhacertificadodigital: TDBEditTexto
              Left = 2
              Top = 10
              Width = 165
              Height = 23
              DataField = 'senhacertificadodigital'
              DataSource = dtmCadastrosInternos.dsrFiliais
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              MaxLength = -1
              ParentFont = False
              PasswordChar = '*'
              TabOrder = 0
              CharCasenoDefault = True
              Alignment = taLeftJustify
            end
          end
          object gbxUrlProcessamento_consulta: TGroupBox
            Left = 4
            Top = 230
            Width = 353
            Height = 36
            Caption = 'URL PROCESSAMENTO CONSULTA'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 8
            object edtURLProcessamento_consulta: TDBEditTexto
              Left = 2
              Top = 10
              Width = 348
              Height = 23
              CharCase = ecLowerCase
              DataField = 'urlprocessamento_consulta'
              DataSource = dtmCadastrosInternos.dsrFiliais
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              MaxLength = -1
              ParentFont = False
              TabOrder = 0
              CharCasenoDefault = True
              Alignment = taLeftJustify
            end
          end
        end
        object gbxTiposFiliais: TGroupBox
          Left = 6
          Top = 306
          Width = 385
          Height = 120
          Caption = ' FILIAIS VINCULADAS '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 8
          object gbxFilialMontagem: TGroupBox
            Left = 2
            Top = 12
            Width = 381
            Height = 36
            Caption = ' FILIAL DE MONTAGEM '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object sbnFilialMontagem: TSpeedButton
              Left = 43
              Top = 10
              Width = 23
              Height = 23
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
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FFFFFFFDCDCDCDCDCDC7F
                7F7F7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC800000
                FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFFFFFFFDCDCDCDCDCDCDCDCDCDC
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
                DCDCDCDCDCDCDCDCDCDC7F7F7FC3C3C3FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDC7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFA858FFA858
                FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858DCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC800000
                FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FC3C3C3FFFFFFFFFFFFDCDCDCDCDCDCDC
                DCDCFFFFFF7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                800000FFA858FFA858FFA858FFA858FFA858800000DCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FC3C3C3FFFFFFFFFFFF7F
                7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCFFA858800000800000800000FFA858DCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7FDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC}
              NumGlyphs = 2
              ParentFont = False
              OnClick = sbnFilialMontagemClick
            end
            object flkFilialMontagem: TtecDBFindLookup
              Left = 2
              Top = 10
              Width = 40
              Height = 23
              Alignment = taLeftJustify
              DataField = 'montagem'
              DataSource = dtmCadastrosInternos.dsrFiliais
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              MaxLength = 3
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
              LookupSource = dtmCadastrosInternos.dsrProcuraFilialMontagem
              LookupQueryParameter = 'codigo'
              Parameter = ' '
              ActiveSetControls = False
              DenyInsert = False
              NoSetControls = <>
              SetControls = <>
              LookupParameter = 'codigo'
            end
            object dtxFilialMontagem: TtecDBText
              Left = 68
              Top = 10
              Width = 310
              Height = 23
              TabStop = False
              Color = clBtnFace
              DataField = 'nome'
              DataSource = dtmCadastrosInternos.dsrProcuraFilialMontagem
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
          object gbxFilialContabil: TGroupBox
            Left = 2
            Top = 48
            Width = 381
            Height = 36
            Caption = ' FILIAL CONT'#193'BIL '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            object sbnFilialContabil: TSpeedButton
              Left = 43
              Top = 10
              Width = 23
              Height = 23
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
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FFFFFFFDCDCDCDCDCDC7F
                7F7F7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC800000
                FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFFFFFFFDCDCDCDCDCDCDCDCDCDC
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
                DCDCDCDCDCDCDCDCDCDC7F7F7FC3C3C3FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDC7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFA858FFA858
                FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858DCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC800000
                FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FC3C3C3FFFFFFFFFFFFDCDCDCDCDCDCDC
                DCDCFFFFFF7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                800000FFA858FFA858FFA858FFA858FFA858800000DCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FC3C3C3FFFFFFFFFFFF7F
                7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCFFA858800000800000800000FFA858DCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7FDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC}
              NumGlyphs = 2
              ParentFont = False
              OnClick = sbnFilialContabilClick
            end
            object flkFilialContabil: TtecDBFindLookup
              Left = 2
              Top = 10
              Width = 40
              Height = 23
              Alignment = taLeftJustify
              DataField = 'contabil'
              DataSource = dtmCadastrosInternos.dsrFiliais
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              MaxLength = 3
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
              LookupSource = dtmCadastrosInternos.dsrProcuraFilialContabil
              LookupQueryParameter = 'codigo'
              Parameter = ' '
              ActiveSetControls = False
              DenyInsert = False
              NoSetControls = <>
              SetControls = <>
              LookupParameter = 'codigo'
            end
            object dtxFilialContabil: TtecDBText
              Left = 68
              Top = 10
              Width = 310
              Height = 23
              TabStop = False
              Color = clBtnFace
              DataField = 'nome'
              DataSource = dtmCadastrosInternos.dsrProcuraFilialContabil
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
          object gbxFilialDime: TGroupBox
            Left = 2
            Top = 84
            Width = 381
            Height = 36
            Caption = ' FILIAL CONSOLIDADORA DA DIME '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            object sbnFilialConsolidadora: TSpeedButton
              Left = 44
              Top = 10
              Width = 23
              Height = 23
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
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FFFFFFFDCDCDCDCDCDC7F
                7F7F7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC800000
                FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFFFFFFFDCDCDCDCDCDCDCDCDCDC
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
                DCDCDCDCDCDCDCDCDCDC7F7F7FC3C3C3FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDC7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFA858FFA858
                FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858DCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC800000
                FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FC3C3C3FFFFFFFFFFFFDCDCDCDCDCDCDC
                DCDCFFFFFF7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                800000FFA858FFA858FFA858FFA858FFA858800000DCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FC3C3C3FFFFFFFFFFFF7F
                7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCFFA858800000800000800000FFA858DCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7FDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC}
              NumGlyphs = 2
              ParentFont = False
              OnClick = sbnFilialConsolidadoraClick
            end
            object flkFilialConsolidadora: TtecDBFindLookup
              Left = 2
              Top = 10
              Width = 40
              Height = 23
              Alignment = taLeftJustify
              DataField = 'filialconsolidadoradime'
              DataSource = dtmCadastrosInternos.dsrFiliais
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              MaxLength = 3
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
              LookupSource = dtmCadastrosInternos.dsrProcuraFilialConsolidadoraDime
              LookupQueryParameter = 'Codigo'
              Parameter = ' '
              ActiveSetControls = False
              DenyInsert = False
              NoSetControls = <>
              SetControls = <>
              LookupParameter = 'codigo'
            end
            object dtxFilialConsolidadora: TtecDBText
              Left = 69
              Top = 10
              Width = 310
              Height = 23
              TabStop = False
              Color = clBtnFace
              DataField = 'nome'
              DataSource = dtmCadastrosInternos.dsrProcuraFilialConsolidadoraDime
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
        object gbxContaCaixaPagamentoAutenticacoes: TGroupBox
          Left = 6
          Top = 455
          Width = 612
          Height = 39
          Caption = 'CONTA CAIXA PARA PAGAMENTO EM AUTENTICA'#199#213'ES'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 9
          inline fraConsultaContaCaixa: TfraConsultaCodigo
            Left = 2
            Top = 12
            Width = 606
            Height = 24
            HorzScrollBar.Range = 632
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
              Left = 99
            end
            inherited dtxDescricao: TtecDBText
              Left = 120
              Width = 487
              DataField = 'titular'
              DataSource = fraConsultaContaCaixa.dsrProcuraContas
            end
            inherited edfCodigo: TtecDBFindLookup
              Width = 81
              DataaFieldInterno = 'contacaixa'
              DataaFieldVisual = 'contacaixa'
              DataField = 'contacaixa'
              DataSource = dtmCadastrosInternos.dsrFiliais
              MaxLength = 15
              LookupaFieldinterno = 'conta'
              LookupaFieldVisual = 'conta'
              LookupField = 'conta'
              LookupSource = fraConsultaContaCaixa.dsrProcuraContas
              LookupQueryParameter = 'Conta'
              Parameter = ' '
              ActiveSetControls = False
              DenyInsert = False
              NoSetControls = <>
              SetControls = <>
              LookupParameter = 'Conta'
            end
            inherited qryProcuraContas: TtecQuery
              Options = [doAutoFillDefs]
            end
          end
          object dtxDigito: TtecDBText
            Left = 85
            Top = 12
            Width = 16
            Height = 23
            TabStop = False
            Color = clBtnFace
            DataField = 'Digito'
            DataSource = fraConsultaContaCaixa.dsrProcuraContas
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
      object tstColunasPrecosMoedas: TTabSheet
        BorderWidth = 2
        Caption = ' &3 - Colunas de Pre'#231'os e Moedas'
        ImageIndex = 4
        object gbxFatoresPreco: TGroupBox
          Left = 265
          Top = 6
          Width = 381
          Height = 345
          Caption = ' COTA'#199#213'ES DE MOEDAS '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          object sbnIncluirFatorPreco: TSpeedButton
            Left = 378
            Top = 25
            Width = 23
            Height = 22
            Hint = 'Incluir fator pre'#231'o'
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
            OnClick = sbnIncluirFatorPrecoClick
          end
          object sbnExcluirFatorPreco: TSpeedButton
            Left = 378
            Top = 47
            Width = 23
            Height = 22
            Hint = 'Excluir fator pre'#231'o'
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
            OnClick = sbnExcluirFatorPrecoClick
          end
          object dbgFatoresPreco: TtecDBGrid
            Left = 2
            Top = 16
            Width = 377
            Height = 327
            Align = alClient
            DataSource = dtmCadastrosInternos.dsrFatoresPrecosFilial
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
            OnDblClick = dbgFatoresPrecoDblClick
            RowWrap = 60
            Large = False
            DoubleRowColor = False
            MsgDelete = 'o FATOR DE PRE'#199'O'
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
                Expanded = False
                FieldName = 'fatorpreco'
                Title.Alignment = taCenter
                Title.Caption = 'MOEDA'
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
                Expanded = False
                FieldName = 'descricao'
                Title.Alignment = taCenter
                Title.Caption = 'NOME DA MOEDA'
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
                Expanded = False
                FieldName = 'fator'
                Title.Alignment = taCenter
                Title.Caption = 'COTA'#199#195'O'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 80
                Visible = True
              end>
          end
        end
        object gbxColunasPrecos: TGroupBox
          Left = 6
          Top = 6
          Width = 250
          Height = 91
          Caption = ' COLUNAS DE PRE'#199'OS '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object gbxColunaNormal: TGroupBox
            Left = 0
            Top = 15
            Width = 250
            Height = 36
            Caption = ' NORMAL '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object sbnPrecoNormal: TSpeedButton
              Left = 42
              Top = 10
              Width = 23
              Height = 23
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
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FFFFFFFDCDCDCDCDCDC7F
                7F7F7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC800000
                FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFFFFFFFDCDCDCDCDCDCDCDCDCDC
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
                DCDCDCDCDCDCDCDCDCDC7F7F7FC3C3C3FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDC7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFA858FFA858
                FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858DCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC800000
                FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FC3C3C3FFFFFFFFFFFFDCDCDCDCDCDCDC
                DCDCFFFFFF7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                800000FFA858FFA858FFA858FFA858FFA858800000DCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FC3C3C3FFFFFFFFFFFF7F
                7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCFFA858800000800000800000FFA858DCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7FDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC}
              NumGlyphs = 2
              ParentFont = False
              OnClick = sbnPrecoNormalClick
            end
            object flkPrecoNormal: TtecDBFindLookup
              Left = 2
              Top = 10
              Width = 40
              Height = 23
              Alignment = taLeftJustify
              DataField = 'preconormal'
              DataSource = dtmCadastrosInternos.dsrFiliais
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
              LookupSource = dtmCadastrosInternos.dsrProcuraColunasNormal
              LookupQueryParameter = 'Codigo'
              Parameter = ' '
              ActiveSetControls = False
              DenyInsert = False
              NoSetControls = <>
              SetControls = <>
              LookupParameter = 'Codigo'
            end
            object dtxPrecoNormal: TtecDBText
              Left = 66
              Top = 10
              Width = 181
              Height = 23
              TabStop = False
              Color = clBtnFace
              DataField = 'descricao'
              DataSource = dtmCadastrosInternos.dsrProcuraColunasNormal
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
          object gbxColunaPromocao: TGroupBox
            Left = 0
            Top = 55
            Width = 250
            Height = 36
            Caption = ' EM PROMO'#199#195'O '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            object sbnPrecoPromocao: TSpeedButton
              Left = 42
              Top = 10
              Width = 23
              Height = 23
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
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FFFFFFFDCDCDCDCDCDC7F
                7F7F7F7F7F7F7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC800000
                FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFFFFFFFDCDCDCDCDCDCDCDCDCDC
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
                DCDCDCDCDCDCDCDCDCDC7F7F7FC3C3C3FFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDC7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFFA858FFA858
                FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858DCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDC7F7F7FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC800000
                FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000DCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7FC3C3C3FFFFFFFFFFFFDCDCDCDCDCDCDC
                DCDCFFFFFF7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                800000FFA858FFA858FFA858FFA858FFA858800000DCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7FC3C3C3FFFFFFFFFFFF7F
                7F7F7F7F7FDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCFFA858800000800000800000FFA858DCDCDCDCDCDCDCDCDCDCDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC7F7F7F7F7F7F7F7F7FDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC}
              NumGlyphs = 2
              ParentFont = False
              OnClick = sbnPrecoPromocaoClick
            end
            object flkPrecoPromocao: TtecDBFindLookup
              Left = 2
              Top = 10
              Width = 40
              Height = 23
              Alignment = taLeftJustify
              DataField = 'precopromocao'
              DataSource = dtmCadastrosInternos.dsrFiliais
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
              LookupSource = dtmCadastrosInternos.dsrProcuraColunasPromocao
              LookupQueryParameter = 'Codigo'
              Parameter = ' '
              ActiveSetControls = False
              DenyInsert = False
              NoSetControls = <>
              SetControls = <>
              LookupParameter = 'Codigo'
            end
            object dtxPrecoPromocao: TtecDBText
              Left = 66
              Top = 10
              Width = 181
              Height = 23
              TabStop = False
              Color = clBtnFace
              DataField = 'descricao'
              DataSource = dtmCadastrosInternos.dsrProcuraColunasPromocao
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
      end
      object tstInformacoesFiscais: TTabSheet
        Caption = ' &4 - DIME / EFD'
        ImageIndex = 2
        object gbxJunta: TGroupBox
          Left = 10
          Top = 6
          Width = 148
          Height = 96
          Caption = ' JUNTA COMERCIAL '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object lblInicio: TLabel
            Left = 86
            Top = 13
            Width = 52
            Height = 12
            Caption = 'IN'#205'CIO DAS'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
          end
          object gbxDataJunta: TGroupBox
            Left = 0
            Top = 23
            Width = 75
            Height = 36
            Caption = 'DATA'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object edtDataJunta: TDBEditData
              Left = 2
              Top = 10
              Width = 70
              Height = 23
              Alignment = taCenter
              DataField = 'juntadata'
              DataSource = dtmCadastrosInternos.dsrFiliais
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
          object gbxNIRE: TGroupBox
            Left = 0
            Top = 60
            Width = 148
            Height = 36
            Caption = ' N.I.R.E. '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            object edtJunta: TDBEditTexto
              Left = 2
              Top = 10
              Width = 143
              Height = 23
              DataField = 'junta'
              DataSource = dtmCadastrosInternos.dsrFiliais
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              MaxLength = 8
              ParentFont = False
              TabOrder = 0
              CharCasenoDefault = False
              Alignment = taLeftJustify
            end
          end
          object gbxDataInicio: TGroupBox
            Left = 73
            Top = 23
            Width = 75
            Height = 36
            Caption = ' ATIVIDADES '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            object edtInicioAtividades: TDBEditData
              Left = 2
              Top = 10
              Width = 70
              Height = 23
              Alignment = taCenter
              DataField = 'inicioatividades'
              DataSource = dtmCadastrosInternos.dsrFiliais
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
        end
        object gbxcreditoIcns: TGroupBox
          Left = 204
          Top = 211
          Width = 85
          Height = 36
          Caption = 'CR'#201'DITO ICMS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          object DBEditNumero1: TDBEditNumero
            Left = 2
            Top = 10
            Width = 80
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
            Alignment = taLeftJustify
            TipoMascara = tmGERAL
            NrDecimal = 2
            Decimais = True
            Negativo = False
            Tamanho = 9
            DataField = 'aliquotacreditoicms'
            DataSource = dtmCadastrosInternos.dsrFiliais
          end
        end
        object gbxSuframa: TGroupBox
          Left = 110
          Top = 211
          Width = 85
          Height = 36
          Caption = ' NA SUFRAMA '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          object edtSuframa: TDBEditTexto
            Left = 2
            Top = 10
            Width = 80
            Height = 23
            DataField = 'suframa'
            DataSource = dtmCadastrosInternos.dsrFiliais
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
            Alignment = taCenter
          end
        end
        object rgbPerfilArquivoFiscal: TtecDBRadioGroup
          Left = 6
          Top = 211
          Width = 96
          Height = 73
          Caption = 'ARQUIVO FISCAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          TabStop = False
          DataField = 'ind_perfil'
          DataSource = dtmCadastrosInternos.dsrFiliais
          object rbnPerfil_A: TtecRadioButton
            Left = 7
            Top = 16
            Width = 65
            Height = 17
            Caption = 'Perfil A'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            Value = 'A'
          end
          object rbnPerfil_B: TtecRadioButton
            Left = 7
            Top = 33
            Width = 65
            Height = 18
            Caption = 'Perfil B'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            Value = 'B'
          end
          object rbnPerfil_C: TtecRadioButton
            Left = 7
            Top = 51
            Width = 65
            Height = 18
            Caption = 'Perfil C'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            Value = 'C'
          end
        end
        object rgbIndAtividadeEconomica: TtecDBRadioGroup
          Left = 168
          Top = 6
          Width = 248
          Height = 157
          Caption = ' ATIVIDADE ECON'#212'MICA PREPONDERANTE '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          TabStop = False
          DataField = 'ind_ativ'
          DataSource = dtmCadastrosInternos.dsrFiliais
          object rgbIndustria_ou_equiparado_a_industrial: TtecRadioButton
            Left = 6
            Top = 15
            Width = 235
            Height = 17
            Caption = '0 - Industrial ou equiparado a industrial'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            Value = '0'
          end
          object rgbOutros: TtecRadioButton
            Left = 6
            Top = 126
            Width = 235
            Height = 28
            Caption = '9 - Outros'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            Value = '9'
          end
          object rgpPrestadorServicos: TtecRadioButton
            Left = 6
            Top = 33
            Width = 235
            Height = 17
            Caption = '1 - Prestador de servi'#231'os'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            Value = '1'
          end
          object rgbAtividadeComercio: TtecRadioButton
            Left = 6
            Top = 51
            Width = 235
            Height = 17
            Caption = '2 - Atividade de com'#233'rcio'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            Value = '2'
          end
          object rgbPessoasJuridicas: TtecRadioButton
            Left = 6
            Top = 68
            Width = 235
            Height = 46
            Caption = 
              '3 - Pessoas jur'#237'dicas referidas nos '#167#167' 6'#186', 8'#186' e 9'#186' do art. 3'#186' da' +
              ' Lei n'#186' 9.718, de 1998'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            WordWrap = True
            Value = '3'
          end
          object rgbAtividadeImobiliaria: TtecRadioButton
            Left = 6
            Top = 114
            Width = 235
            Height = 17
            Caption = '4 - Atividade de imobili'#225'ria'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 5
            Value = '4'
          end
        end
        object gbxInstRespCadastro: TGroupBox
          Left = 426
          Top = 4
          Width = 259
          Height = 198
          Caption = 'INSTITUI'#199#195'O RESPONS'#193'VEL PELO CADASTRO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 15
          object dbgInstRespCadastro: TtecDBGrid
            Left = 2
            Top = 16
            Width = 255
            Height = 180
            Align = alClient
            DataSource = dtmCadastrosInternos.dsrRespAdmCadastro
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
            OnKeyDown = dbgInstRespCadastroKeyDown
            RowWrap = 60
            Large = False
            DoubleRowColor = False
            MsgDelete = 'desta inscri'#231#227'o'
            TitleMinHeight = 100
            CellHeights = 100
            StrippedColor = 16054260
            CanDelete = True
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
                Expanded = False
                FieldName = 'Instituicao'
                Title.Alignment = taCenter
                Title.Caption = 'C'#211'DIGO'
                Width = 40
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Codigo'
                Title.Alignment = taCenter
                Title.Caption = 'NOME DA INSTITUI'#199#195'O'
                Width = 170
                Visible = True
              end>
          end
        end
        object rbnRegimeTributarioNFE: TtecDBRadioGroup
          Left = 299
          Top = 203
          Width = 422
          Height = 94
          Caption = ' REGIME TRIBUT'#193'RIO '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          TabStop = False
          DataField = 'regimetributario'
          DataSource = dtmCadastrosInternos.dsrFiliais
          object ckbSimpleNacional: TtecRadioButton
            Left = 6
            Top = 16
            Width = 195
            Height = 17
            Caption = '1 - Simples Nacional'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            Value = '1'
          end
          object ckbSimpleNacionalExcesso: TtecRadioButton
            Left = 6
            Top = 35
            Width = 379
            Height = 17
            Caption = '2 - Simples Nacional - Excesso de sublimite de receita bruta'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            WordWrap = True
            Value = '2'
          end
          object ckbRegimeNormal: TtecRadioButton
            Left = 7
            Top = 54
            Width = 195
            Height = 17
            Caption = '3 - Normal'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            Value = '3'
          end
          object ckbSimpleNacionalMEI: TtecRadioButton
            Left = 7
            Top = 73
            Width = 401
            Height = 17
            Caption = '4 - Simples Nacional - Microempreendedor Individual - MEI'
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
        end
        object gbxAliquotasSimplesNacional: TGroupBox
          Left = 695
          Top = 4
          Width = 194
          Height = 197
          Caption = ' AL'#205'QUOTAS SIMPLES NACIONAL '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 16
          object dbggbxAliquotasSimplesNacional: TtecDBGrid
            Left = 2
            Top = 16
            Width = 190
            Height = 179
            Align = alClient
            DataSource = dtmCadastrosInternos.dsrAliquotasSimplesNacional
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
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
            DenySort = False
            DefaultRowHeight = 17
            ExibirNumerodaLinha = False
            NaoAtribuirDadosaTabelaaoDigitar = False
            ShowWhenFieldInvisible = False
            CanClickWhenEditing = False
            Columns = <
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'MesAno'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                Title.Alignment = taCenter
                Title.Caption = 'M'#202'S/ANO'
                Width = 63
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'AliquotaICMS'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                Title.Alignment = taCenter
                Title.Caption = 'AL'#205'Q. ICMS'
                Width = 76
                Visible = True
              end>
          end
        end
        object rgbRegimeSubstituicao: TtecDBRadioGroup
          Left = 730
          Top = 219
          Width = 112
          Height = 78
          Caption = ' REGIME ST '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 7
          TabStop = False
          DataField = 'regimesubstituicao'
          DataSource = dtmCadastrosInternos.dsrFiliais
          object rbnRegimeSubstituicao_NaoseAplica: TtecRadioButton
            Left = 6
            Top = 15
            Width = 100
            Height = 17
            Caption = 'N'#227'o se aplica'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            Value = '0'
          end
          object rbnRegimeSubstituicao_Substituto: TtecRadioButton
            Left = 6
            Top = 35
            Width = 100
            Height = 17
            Caption = 'Substituto'
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
          object rbnRegimeSubstituicao_Substituido: TtecRadioButton
            Left = 6
            Top = 55
            Width = 100
            Height = 17
            Caption = 'Substitu'#237'do'
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
        end
        object gbxClassificacaoIPI: TGroupBox
          Left = 212
          Top = 310
          Width = 476
          Height = 39
          Caption = 'CLASSIFICA'#199#195'O IPI'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 9
          inline fraConsultaClassificacaoIPI: TfraConsultaCodigoContabil
            Left = 2
            Top = 12
            Width = 472
            Height = 24
            HorzScrollBar.Range = 632
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
              Left = 27
            end
            inherited dtxDescricao: TtecDBText
              Left = 233
              Width = 238
              DataField = 'classificacao'
              DataSource = fraConsultaClassificacaoIPI.dsrProcuraClassificacaoIPI
            end
            inherited edfCodigo: TtecDBFindLookup
              Width = 25
              DataField = 'classificacaoipi'
              DataSource = dtmCadastrosInternos.dsrFiliais
              MaxLength = 2
              LookupField = 'codigo'
              LookupSource = fraConsultaClassificacaoIPI.dsrProcuraClassificacaoIPI
              LookupQueryParameter = 'codigo'
              Parameter = ' '
              ActiveSetControls = False
              DenyInsert = False
              NoSetControls = <>
              SetControls = <>
              LookupParameter = 'codigo'
            end
            inherited qryProcuraClassificacaoIPI: TtecQuery
              Options = [doAutoFillDefs]
            end
            inherited qryProcuraPISCOFINS_T436: TtecQuery
              Left = 320
            end
            inherited dsrProcuraPISCOFINS_T436: TtecDataSource
              Left = 352
            end
            inherited qryConsultaPISCOFINS_T436: TtecQuery
              Left = 384
            end
            inherited qryProcuraefd_t53: TtecQuery
              Left = 320
              Top = 32
            end
            inherited qryConsultaefd_t53: TtecQuery
              Left = 384
              Top = 32
            end
            inherited dsrProcuraefd_t53: TtecDataSource
              Left = 352
              Top = 32
            end
            inherited qryProcuraPISCOFINS_T511: TtecQuery
              Left = 432
              Top = 40
            end
            inherited dsrProcuraPISCOFINS_T511: TtecDataSource
              Left = 464
              Top = 40
            end
            inherited qryConsultaPISCOFINS_T511: TtecQuery
              Left = 496
              Top = 40
            end
          end
          object dtxDescricao: TtecDBText
            Left = 53
            Top = 11
            Width = 183
            Height = 23
            TabStop = False
            Color = clBtnFace
            DataField = 'tipo'
            DataSource = fraConsultaClassificacaoIPI.dsrProcuraClassificacaoIPI
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
        object gbxSpedContribuicoes: TGroupBox
          Left = 6
          Top = 310
          Width = 197
          Height = 93
          Caption = ' SPED CONTRIBUI'#199#213'ES '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 8
          object ckbSpedContribuicoesPisCofins: TDBCheckBox
            Left = 6
            Top = 33
            Width = 185
            Height = 17
            Caption = 'PIS/COFINS'
            DataField = 'sped_pis_cofins'
            DataSource = dtmCadastrosInternos.dsrFiliais
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
          object ckbSpedContribuicoesPisCofinsrb: TDBCheckBox
            Left = 6
            Top = 51
            Width = 185
            Height = 17
            Caption = 'Previdenci'#225'ria (receita bruta)'
            DataField = 'sped_pis_cofins_rb'
            DataSource = dtmCadastrosInternos.dsrFiliais
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
            OnClick = ckbSpedContribuicoesPisCofinsrbClick
          end
          object ckbSpedContribuicoesPisCofinsrem: TDBCheckBox
            Left = 6
            Top = 69
            Width = 185
            Height = 17
            Caption = 'Previdenci'#225'ria (remunera'#231#227'o)'
            DataField = 'sped_pis_cofins_rem'
            DataSource = dtmCadastrosInternos.dsrFiliais
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
            OnClick = ckbSpedContribuicoesPisCofinsremClick
          end
          object ckbSpedFiscal: TDBCheckBox
            Left = 6
            Top = 15
            Width = 185
            Height = 17
            Caption = 'FISCAL'
            DataField = 'sped_fiscal'
            DataSource = dtmCadastrosInternos.dsrFiliais
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
        object gbxCNAEFISCAL: TGroupBox
          Left = 111
          Top = 251
          Width = 177
          Height = 36
          Caption = ' CNAE FISCAL '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          object edtCNAEFISCAL: TDBEditTexto
            Left = 2
            Top = 10
            Width = 172
            Height = 23
            DataField = 'cnaefiscal'
            DataSource = dtmCadastrosInternos.dsrFiliais
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            MaxLength = 8
            ParentFont = False
            TabOrder = 0
            CharCasenoDefault = False
            Alignment = taCenter
          end
        end
        object stxPerfil: TStaticText
          Left = 37
          Top = 196
          Width = 37
          Height = 16
          Caption = 'PERFIL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 17
        end
        object stxSuframa: TStaticText
          Left = 114
          Top = 196
          Width = 85
          Height = 16
          Caption = 'N'#186' DE INSCRI'#199#195'O'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 18
        end
        object stxAliquotaCreditoICMS: TStaticText
          Left = 221
          Top = 196
          Width = 50
          Height = 16
          Caption = 'AL'#205'QUOTA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 19
        end
        object lblind_esc_cons: TStaticText
          Left = 6
          Top = 406
          Width = 259
          Height = 24
          Hint = 
            'Escritura'#231#245'es Cont'#225'beis Consolidadas: (Deve ser preenchido pela ' +
            'empresa controladora obrigada a informar demonstra'#231#245'es cont'#225'beis' +
            ' consolidadas, nos termos da Lei n'#186' 6.404/76 e do Pronunciamento' +
            ' T'#233'cnico CPC 36 '#8211' Demonstra'#231#245'es Consolidadas) S '#8211' Sim'
          AutoSize = False
          BorderStyle = sbsSingle
          Caption = ' Escritua'#231#227'o Cont'#225'bil Consolidada'
          TabOrder = 12
        end
        object DBMaplistCombobox1: TDBMaplistCombobox
          Left = 203
          Top = 406
          Width = 60
          Height = 23
          Hint = 
            'Escritura'#231#245'es Cont'#225'beis Consolidadas: (Deve ser preenchido pela ' +
            'empresa controladora obrigada a informar demonstra'#231#245'es cont'#225'beis' +
            ' consolidadas, nos termos da Lei n'#186' 6.404/76 e do Pronunciamento' +
            ' T'#233'cnico CPC 36 '#8211' Demonstra'#231#245'es Consolidadas) S '#8211' Sim'
          Style = csDropDownList
          DataField = 'ind_esc_cons'
          DataSource = dtmCadastrosInternos.dsrFiliais
          ItemHeight = 15
          Items.Strings = (
            'Sim'
            'N'#227'o')
          TabOrder = 13
          ItemValues.Strings = (
            'S'
            'N')
        end
        object gbxCofinsAliquota: TGroupBox
          Left = 213
          Top = 352
          Width = 68
          Height = 36
          Caption = '% COFINS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 10
          object edtAliquotaCofins: TDBEditNumero
            Left = 2
            Top = 10
            Width = 63
            Height = 21
            Constraints.MaxHeight = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            MaxLength = -1
            ParentFont = False
            TabOrder = 0
            Text = 'edtAliquotaCofins'
            Mascara = True
            Alignment = taLeftJustify
            TipoMascara = tmGERAL
            NrDecimal = 2
            Decimais = True
            Negativo = False
            Tamanho = 2
            DataField = 'aliquotacofins'
            DataSource = dtmCadastrosInternos.dsrFiliais
          end
        end
        object gbxPisAliquota: TGroupBox
          Left = 283
          Top = 352
          Width = 52
          Height = 35
          Caption = '% PIS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 11
          object edtAliquotaPIS: TDBEditNumero
            Left = 2
            Top = 10
            Width = 47
            Height = 21
            Constraints.MaxHeight = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            MaxLength = -1
            ParentFont = False
            TabOrder = 0
            Text = 'edtAliquotaPIS'
            Mascara = True
            Alignment = taLeftJustify
            TipoMascara = tmGERAL
            NrDecimal = 2
            Decimais = True
            Negativo = False
            Tamanho = 2
            DataField = 'aliquotapis'
            DataSource = dtmCadastrosInternos.dsrFiliais
          end
        end
        object lblTipo_do_plano_referencial: TStaticText
          Left = 6
          Top = 431
          Width = 653
          Height = 24
          Hint = 
            'Tipo de plano referencial (n'#227'o informar case n'#227'o utiliza plano r' +
            'eferencial)'
          AutoSize = False
          BorderStyle = sbsSingle
          Caption = ' Tipo do plano referencial'
          TabOrder = 20
        end
        object DBMaplistCombobox5: TDBMaplistCombobox
          Left = 204
          Top = 430
          Width = 454
          Height = 23
          Hint = 
            'Forma de tributa'#231#227'o do IRPJ (Imposto de Renda Sobre a Renda da P' +
            'essoa Jur'#237'dica) e, consequentemente, da CSLL (Contribui'#231#227'o Socia' +
            'l Sobre o Lucro L'#237'quido) adotada.'
          Style = csDropDownList
          DataField = 'cod_plan_ref'
          DataSource = dtmCadastrosInternos.dsrFiliais
          ItemHeight = 15
          Items.Strings = (
            '1 - PJ em Geral '#8211' Lucro Real'
            '2 - PJ em Geral '#8211' Lucro Presumido'
            '3 - Financeiras '#8211' Lucro Real'
            '4 - Seguradoras '#8211' Lucro Real'
            '5 - Imunes e Isentasem Geral'
            '6 - Imunes e Isentas '#8211' Financeiras'
            '7 - Imunes e Isentas '#8211' Seguradoras'
            '8 - Entidades Fechadas de Previd'#234'ncia Complementar'
            '9 - Partidos Pol'#237'ticos'
            '10 - Financeiras '#8211' Lucro Presumido')
          TabOrder = 14
          OnKeyDown = DBMaplistCombobox5KeyDown
          ItemValues.Strings = (
            '1'
            '2'
            '3'
            '4'
            '5'
            '6'
            '7'
            '8'
            '9'
            '10')
        end
        object StaticText5: TStaticText
          Left = 6
          Top = 454
          Width = 420
          Height = 24
          Hint = 
            'Escritura'#231#245'es Cont'#225'beis Consolidadas: (Deve ser preenchido pela ' +
            'empresa controladora obrigada a informar demonstra'#231#245'es cont'#225'beis' +
            ' consolidadas, nos termos da Lei n'#186' 6.404/76 e do Pronunciamento' +
            ' T'#233'cnico CPC 36 '#8211' Demonstra'#231#245'es Consolidadas) S '#8211' Sim'
          AutoSize = False
          BorderStyle = sbsSingle
          Caption = ' Regime Cont'#225'bil'
          TabOrder = 21
        end
        object DBMaplistCombobox6: TDBMaplistCombobox
          Left = 204
          Top = 454
          Width = 221
          Height = 23
          Style = csDropDownList
          DataField = 'regimecontabil'
          DataSource = dtmCadastrosInternos.dsrFiliais
          ItemHeight = 15
          Items.Strings = (
            '1 - Regime de Compet'#234'ncia'
            '2 - Regime de Caixa')
          TabOrder = 22
          ItemValues.Strings = (
            '1'
            '2')
        end
      end
      object tstECF: TTabSheet
        Caption = '&5 - SPED ECF'
        ImageIndex = 5
        object tecPageControl1: TtecPageControl
          Left = 0
          Top = 0
          Width = 1027
          Height = 529
          ActivePage = tstParametrosTributacao
          Align = alClient
          TabOrder = 0
          object tstParametrosTributacao: TTabSheet
            Caption = 'Par'#226'metros de Tributa'#231#227'o'
            object lblFormaTributacao_1_Periodo: TLabel
              Left = 245
              Top = 153
              Width = 63
              Height = 12
              Caption = '1'#186' TRIMESTRE'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
            end
            object lblFormaTributacao_2_Periodo: TLabel
              Left = 373
              Top = 153
              Width = 63
              Height = 12
              Caption = '2'#186' TRIMESTRE'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
            end
            object lblFormaTributacao_3_Periodo: TLabel
              Left = 501
              Top = 153
              Width = 63
              Height = 12
              Caption = '3'#186' TRIMESTRE'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
            end
            object lblFormaTributacao_4_Periodo: TLabel
              Left = 629
              Top = 153
              Width = 63
              Height = 12
              Caption = '4'#186' TRIMESTRE'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
            end
            object DBCbbOptanteRefis: TDBMaplistCombobox
              Left = 245
              Top = 8
              Width = 60
              Height = 23
              Hint = 
                'A pessoa jur'#237'dica deve assinalar este campo quando for optante p' +
                'elo Programa de Recupera'#231#227'o Fiscal (Refis). ATEN'#199#195'O: Este campo ' +
                's'#243' deve ser assinalado pela pessoa jur'#237'dica optante pelo Program' +
                'a de Recupera'#231#227'o Fiscal (Refis), institu'#237'do pela Lei no 9.964, d' +
                'e 10 de abril de 2000, e que dele n'#227'o tenha sido exclu'#237'da. A pes' +
                'soa jur'#237'dica que for apenas optante pelo Parcelamento Especial (' +
                'Paes) de que trata a Lei no 10.684, de 30 de maio de 2003, e out' +
                'ros reparcelamentos n'#227'o deve assinalar este campo.'
              Style = csDropDownList
              DataField = 'opt_refis'
              DataSource = dtmCadastrosInternos.dsrFiliais
              ItemHeight = 15
              Items.Strings = (
                'Sim'
                'N'#227'o')
              TabOrder = 0
              ItemValues.Strings = (
                'S'
                'N')
            end
            object DBCbbOptantePaes: TDBMaplistCombobox
              Left = 245
              Top = 31
              Width = 60
              Height = 23
              Hint = 
                'A pessoa jur'#237'dica deve assinalar este campo quando for optante p' +
                'elo Parcelamento Especial (Paes), de que trata a Lei n'#186' 10.684, ' +
                'de 30 de maio de 2003.'
              Style = csDropDownList
              DataField = 'opt_paes'
              DataSource = dtmCadastrosInternos.dsrFiliais
              ItemHeight = 15
              Items.Strings = (
                'Sim'
                'N'#227'o')
              TabOrder = 1
              ItemValues.Strings = (
                'S'
                'N')
            end
            object DBCBFormadeTributacao: TDBMaplistCombobox
              Left = 245
              Top = 54
              Width = 300
              Height = 23
              Hint = 
                'Forma de tributa'#231#227'o do IRPJ (Imposto de Renda Sobre a Renda da P' +
                'essoa Jur'#237'dica) e, consequentemente, da CSLL (Contribui'#231#227'o Socia' +
                'l Sobre o Lucro L'#237'quido) adotada.'
              Style = csDropDownList
              DataField = 'form_tribut'
              DataSource = dtmCadastrosInternos.dsrFiliais
              ItemHeight = 15
              Items.Strings = (
                '1 - Lucro real'
                '2 - Lucro real/arbitrado'
                '3 - Lucro presumido/real'
                '4 - Lucro presumido/real/arbitrado'
                '5 - Lucro presumido'
                '6 - Lucro arbitrado'
                '7 - Lucro presumido/arbitrado'
                '8 - Imune do IRPJ'
                '9 - Isenta do IRPJ')
              TabOrder = 2
              ItemValues.Strings = (
                '1'
                '2'
                '3'
                '4'
                '5'
                '6'
                '7'
                '8'
                '9')
            end
            object DBCBBPeriododeApuracao: TDBMaplistCombobox
              Left = 245
              Top = 101
              Width = 81
              Height = 23
              Hint = 'Per'#237'odo de Apura'#231#227'o do IRPJ e da CSLL'
              Style = csDropDownList
              DataField = 'form_apur'
              DataSource = dtmCadastrosInternos.dsrFiliais
              ItemHeight = 15
              Items.Strings = (
                'Anual'
                'Trimestral')
              TabOrder = 4
              ItemValues.Strings = (
                'A'
                'T')
            end
            object DBCBBQualificacaoPessoaJuridica: TDBMaplistCombobox
              Left = 245
              Top = 124
              Width = 300
              Height = 23
              Hint = 
                'Qualifica'#231#227'o da Pessoa Jur'#237'dica. (ATEN'#199#195'O: N'#227'o preencher no caso' +
                ' de imunes e isentas)'
              Style = csDropDownList
              DataField = 'quali_pj'
              DataSource = dtmCadastrosInternos.dsrFiliais
              ItemHeight = 15
              Items.Strings = (
                '01 - Pessoa jur'#237'dica em geral'
                '02 - PJ componente do sistema financeiro'
                '03 - Soc. Seg./Cap. ou Ent. Ab. Prev. Compl;')
              TabOrder = 5
              ItemValues.Strings = (
                '01'
                '02'
                '03')
            end
            object DBCBFormaTributacao_1_Periodo: TDBMaplistCombobox
              Left = 245
              Top = 164
              Width = 120
              Height = 23
              Hint = 'Forma de tributa'#231#227'o no per'#237'odo considerando para cada trimestre,'
              Style = csDropDownList
              DataField = 'formatrib_1_periodo'
              DataSource = dtmCadastrosInternos.dsrFiliais
              ItemHeight = 15
              Items.Strings = (
                ' '
                'R - Real'
                'P - Presumido'
                'A - Arbitrado'
                'E - Real Estimativa')
              TabOrder = 6
              ItemValues.Strings = (
                '0'
                'R'
                'P'
                'A'
                'E')
            end
            object DBCBFormaTributacao_2_Periodo: TDBMaplistCombobox
              Left = 373
              Top = 164
              Width = 120
              Height = 23
              Hint = 'Forma de tributa'#231#227'o no per'#237'odo considerando para cada trimestre,'
              Style = csDropDownList
              DataField = 'formatrib_2_periodo'
              DataSource = dtmCadastrosInternos.dsrFiliais
              ItemHeight = 15
              Items.Strings = (
                '  '
                'R - Real'
                'P - Presumido'
                'A - Arbitrado'
                'E - Real Estimativa')
              TabOrder = 7
              ItemValues.Strings = (
                '0'
                'R'
                'P'
                'A'
                'E')
            end
            object DBCBFormaTributacao_3_Periodo: TDBMaplistCombobox
              Left = 501
              Top = 164
              Width = 120
              Height = 23
              Hint = 'Forma de tributa'#231#227'o no per'#237'odo considerando para cada trimestre,'
              Style = csDropDownList
              DataField = 'formatrib_3_periodo'
              DataSource = dtmCadastrosInternos.dsrFiliais
              ItemHeight = 15
              Items.Strings = (
                ' '
                'R - Real'
                'P - Presumido'
                'A - Arbitrado'
                'E - Real Estimativa')
              TabOrder = 8
              ItemValues.Strings = (
                '0'
                'R'
                'P'
                'A'
                'E')
            end
            object DBCBFormaTributacao_4_Periodo: TDBMaplistCombobox
              Left = 629
              Top = 164
              Width = 120
              Height = 23
              Hint = 'Forma de tributa'#231#227'o no per'#237'odo considerando para cada trimestre,'
              Style = csDropDownList
              DataField = 'formatrib_4_periodo'
              DataSource = dtmCadastrosInternos.dsrFiliais
              ItemHeight = 15
              Items.Strings = (
                ' '
                'R - Real'
                'P - Presumido'
                'A - Arbitrado'
                'E - Real Estimativa')
              TabOrder = 9
              ItemValues.Strings = (
                '0'
                'R'
                'P'
                'A'
                'E')
            end
            object DBCBtip_esc_pre: TDBMaplistCombobox
              Left = 245
              Top = 187
              Width = 775
              Height = 23
              Hint = 
                'Escritura'#231#227'o: "L" '#8211' Livro Caixa ou hip'#243'tese prevista no '#167'1o do a' +
                'rt. 129, Instru'#231#227'o Normativa n'#186' 1.515/2014 (lucro presumido) ou ' +
                'sem escritura'#231#227'o (imunes ou isentas) ou n'#227'o obrigadas a entregar' +
                ' a ECD, de acordo com a Instru'#231#227'o Normativa no 1.420/2014. "C" '#8211 +
                ' Cont'#225'bil (Lucro Presumido, Imunes ou Isentas)'
              Style = csDropDownList
              DataField = 'tip_esc_pre'
              DataSource = dtmCadastrosInternos.dsrFiliais
              ItemHeight = 15
              Items.Strings = (
                
                  'L - Livro Caixa ou hip'#243'tese art. 129-'#167'1'#186', IN 1515/2014 (lucro pr' +
                  'esumido) ou sem escritura'#231#227'o (imunes ou isentas) ou n'#227'o obrigada' +
                  's a entregar ECD'
                'C - Cont'#225'bil (lucro presumido, imunes ou isentas)')
              TabOrder = 10
              OnDropDown = DBCBtip_esc_preDropDown
              ItemValues.Strings = (
                'L'
                'C')
            end
            object DBCBtip_ent: TDBMaplistCombobox
              Left = 245
              Top = 210
              Width = 306
              Height = 23
              Hint = 'Tipo de pessoa jur'#237'dica imune ou isenta'
              Style = csDropDownList
              DataField = 'tip_ent'
              DataSource = dtmCadastrosInternos.dsrFiliais
              ItemHeight = 15
              Items.Strings = (
                '01 - Assist'#234'ncia social'
                '02 - Educacional'
                '03 - Sindicato de trabalhadores'
                '04 - Associa'#231#227'o civil'
                '05 - Cultural'
                '06 - Entidade fechada de previd'#234'ncia complementar'
                '07 - Filantr'#243'pica'
                '08 - Sindicato'
                '09 - Recreativa'
                '10 - Cient'#237'fica'
                '11 - Associa'#231#227'o de poupan'#231'a e empr'#233'stimo'
                '12 - Entidade aberta de previd'#234'ncia complementar'
                '13 - FIFA e entidades relacionadas'
                '14 - CIO e entidades relacionadas'
                '15 - Partidos pol'#237'ticos'
                '99 - Outras')
              TabOrder = 11
              OnChange = DBCBtip_entChange
              OnDropDown = DBCBtip_esc_preDropDown
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
                '99')
            end
            object DBCBFormaApuralcaoIRPJ: TDBMaplistCombobox
              Left = 245
              Top = 233
              Width = 153
              Height = 23
              Hint = 
                'Apura'#231#227'o do IRPJ para imunes ou isentas: exist'#234'ncia ou n'#227'o de at' +
                'ividade n'#227'o abrangida pela imunidade ou isen'#231#227'o e tributada pelo' +
                ' IRPJ (para imunes ou isentas)'
              Style = csDropDownList
              DataField = 'FORMA_APUR_I'
              DataSource = dtmCadastrosInternos.dsrFiliais
              ItemHeight = 15
              Items.Strings = (
                'A - Anual'
                'T - Trimestral'
                'D - Desobrigada')
              TabOrder = 12
              OnChange = DBCBtip_entChange
              OnDropDown = DBCBtip_esc_preDropDown
              ItemValues.Strings = (
                'A'
                'T'
                'D')
            end
            object DBCBFormaApuralcaoCSLL: TDBMaplistCombobox
              Left = 245
              Top = 256
              Width = 153
              Height = 23
              Hint = 'Apura'#231#227'o da CSLL para imunes ou isentas'
              Style = csDropDownList
              DataField = 'APUR_CSLL'
              DataSource = dtmCadastrosInternos.dsrFiliais
              ItemHeight = 15
              Items.Strings = (
                'A - Anual'
                'T - Trimestral'
                'D - Desobrigada')
              TabOrder = 13
              OnChange = DBCBtip_entChange
              OnDropDown = DBCBtip_esc_preDropDown
              ItemValues.Strings = (
                'A'
                'T'
                'D')
            end
            object DBCBOptanteRTT2014: TDBMaplistCombobox
              Left = 245
              Top = 279
              Width = 60
              Height = 23
              Hint = 
                'Optante pela extin'#231#227'o do RTT no ano-calend'#225'rio de 2014. OBSERVA'#199 +
                #195'O: Esse campo se refere ao art. 75 da Lei n'#186' 12.973/2014.'
              Style = csDropDownList
              DataField = 'OPT_EXT_RTT'
              DataSource = dtmCadastrosInternos.dsrFiliais
              ItemHeight = 15
              Items.Strings = (
                'Sim'
                'N'#227'o')
              TabOrder = 14
              ItemValues.Strings = (
                'S'
                'N')
            end
            object DBCBHaDiferencaContabilidadeFCONT: TDBMaplistCombobox
              Left = 245
              Top = 302
              Width = 60
              Height = 23
              Hint = 'Existe diferen'#231'as entre a contabilidade societ'#225'ria e Fcont'
              Style = csDropDownList
              DataField = 'dif_fcont'
              DataSource = dtmCadastrosInternos.dsrFiliais
              ItemHeight = 15
              Items.Strings = (
                'Sim'
                'N'#227'o')
              TabOrder = 15
              ItemValues.Strings = (
                'S'
                'N')
            end
            object gbxFormaApuracaoEstimativaMensal: TGroupBox
              Left = 563
              Top = 216
              Width = 397
              Height = 165
              Hint = 
                'Forma de apura'#231#227'o da estimativa mensal, quando o per'#237'odo de apur' +
                'a'#231#227'o for ANUAL.'
              Caption = ' FORMA DE APURA'#199#195'O DA ESTIMATIVA MENSAL '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 18
              object lblFormaApuracaoJAN: TLabel
                Left = 6
                Top = 24
                Width = 20
                Height = 15
                Caption = 'Jan'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
              end
              object lblFormaApuracaoFEV: TLabel
                Left = 6
                Top = 48
                Width = 19
                Height = 15
                Caption = 'Fev'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
              end
              object lblFormaApuracaoMAR: TLabel
                Left = 6
                Top = 72
                Width = 20
                Height = 15
                Caption = 'Mar'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
              end
              object lblFormaApuracaoABR: TLabel
                Left = 6
                Top = 96
                Width = 18
                Height = 15
                Caption = 'Abr'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
              end
              object lblFormaApuracaoMAI: TLabel
                Left = 6
                Top = 120
                Width = 19
                Height = 15
                Caption = 'Mai'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
              end
              object lblFormaApuracaoJUN: TLabel
                Left = 6
                Top = 144
                Width = 20
                Height = 15
                Caption = 'Jun'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
              end
              object lblFormaApuracaoJUL: TLabel
                Left = 205
                Top = 24
                Width = 16
                Height = 15
                Caption = 'Jul'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
              end
              object lblFormaApuracaoAGO: TLabel
                Left = 205
                Top = 48
                Width = 21
                Height = 15
                Caption = 'Ago'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
              end
              object lblFormaApuracaoSET: TLabel
                Left = 205
                Top = 72
                Width = 18
                Height = 15
                Caption = 'Set'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
              end
              object lblFormaApuracaoOUT: TLabel
                Left = 205
                Top = 96
                Width = 19
                Height = 15
                Caption = 'Out'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
              end
              object lblFormaApuracaoNOV: TLabel
                Left = 205
                Top = 120
                Width = 21
                Height = 15
                Caption = 'Nov'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
              end
              object lblFormaApuracaoDEZ: TLabel
                Left = 205
                Top = 144
                Width = 21
                Height = 15
                Caption = 'Dez'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
              end
              object dbcbFormaApuracaoJAN: TDBMaplistCombobox
                Left = 35
                Top = 18
                Width = 160
                Height = 23
                Hint = 
                  'Forma de apura'#231#227'o da estimativa mensal, quando o per'#237'odo de apur' +
                  'a'#231#227'o for ANUAL.'
                Style = csDropDownList
                DataField = 'mes_bal_red_1'
                DataSource = dtmCadastrosInternos.dsrFiliais
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ItemHeight = 15
                Items.Strings = (
                  '0 - Fora do per'#237'odo'
                  'E - Receita bruta'
                  'B - Balan'#231'o ou balancete')
                ParentFont = False
                TabOrder = 0
                OnChange = DBCBtip_entChange
                OnDropDown = DBCBtip_esc_preDropDown
                ItemValues.Strings = (
                  '0'
                  'E'
                  'B')
              end
              object dbcbFormaApuracaoFEV: TDBMaplistCombobox
                Left = 35
                Top = 42
                Width = 160
                Height = 23
                Hint = 
                  'Forma de apura'#231#227'o da estimativa mensal, quando o per'#237'odo de apur' +
                  'a'#231#227'o for ANUAL.'
                Style = csDropDownList
                DataField = 'mes_bal_red_2'
                DataSource = dtmCadastrosInternos.dsrFiliais
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ItemHeight = 15
                Items.Strings = (
                  '0 - Fora do Per'#237'odo'
                  'E - Receita Bruta'
                  'B - Balan'#231'o ou Balancete')
                ParentFont = False
                TabOrder = 1
                OnChange = DBCBtip_entChange
                OnDropDown = DBCBtip_esc_preDropDown
                ItemValues.Strings = (
                  '0'
                  'E'
                  'B')
              end
              object dbcbFormaApuracaoMAR: TDBMaplistCombobox
                Left = 35
                Top = 66
                Width = 160
                Height = 23
                Hint = 
                  'Forma de apura'#231#227'o da estimativa mensal, quando o per'#237'odo de apur' +
                  'a'#231#227'o for ANUAL.'
                Style = csDropDownList
                DataField = 'mes_bal_red_3'
                DataSource = dtmCadastrosInternos.dsrFiliais
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ItemHeight = 15
                Items.Strings = (
                  '0 - Fora do Per'#237'odo'
                  'E - Receita Bruta'
                  'B - Balan'#231'o ou Balancete')
                ParentFont = False
                TabOrder = 2
                OnChange = DBCBtip_entChange
                OnDropDown = DBCBtip_esc_preDropDown
                ItemValues.Strings = (
                  '0'
                  'E'
                  'B')
              end
              object dbcbFormaApuracaoABR: TDBMaplistCombobox
                Left = 35
                Top = 90
                Width = 160
                Height = 23
                Hint = 
                  'Forma de apura'#231#227'o da estimativa mensal, quando o per'#237'odo de apur' +
                  'a'#231#227'o for ANUAL.'
                Style = csDropDownList
                DataField = 'mes_bal_red_4'
                DataSource = dtmCadastrosInternos.dsrFiliais
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ItemHeight = 15
                Items.Strings = (
                  '0 - Fora do Per'#237'odo'
                  'E - Receita Bruta'
                  'B - Balan'#231'o ou Balancete')
                ParentFont = False
                TabOrder = 3
                OnChange = DBCBtip_entChange
                OnDropDown = DBCBtip_esc_preDropDown
                ItemValues.Strings = (
                  '0'
                  'E'
                  'B')
              end
              object dbcbFormaApuracaoMAI: TDBMaplistCombobox
                Left = 35
                Top = 114
                Width = 160
                Height = 23
                Hint = 
                  'Forma de apura'#231#227'o da estimativa mensal, quando o per'#237'odo de apur' +
                  'a'#231#227'o for ANUAL.'
                Style = csDropDownList
                BiDiMode = bdLeftToRight
                DataField = 'mes_bal_red_5'
                DataSource = dtmCadastrosInternos.dsrFiliais
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ItemHeight = 15
                Items.Strings = (
                  '0 - Fora do Per'#237'odo'
                  'E - Receita Bruta'
                  'B - Balan'#231'o ou Balancete')
                ParentBiDiMode = False
                ParentFont = False
                TabOrder = 4
                OnChange = DBCBtip_entChange
                OnDropDown = DBCBtip_esc_preDropDown
                ItemValues.Strings = (
                  '0'
                  'E'
                  'B')
              end
              object dbcbFormaApuracaoJUN: TDBMaplistCombobox
                Left = 35
                Top = 138
                Width = 160
                Height = 23
                Hint = 
                  'Forma de apura'#231#227'o da estimativa mensal, quando o per'#237'odo de apur' +
                  'a'#231#227'o for ANUAL.'
                Style = csDropDownList
                DataField = 'mes_bal_red_6'
                DataSource = dtmCadastrosInternos.dsrFiliais
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ItemHeight = 15
                Items.Strings = (
                  '0 - Fora do Per'#237'odo'
                  'E - Receita Bruta'
                  'B - Balan'#231'o ou Balancete')
                ParentFont = False
                TabOrder = 5
                OnChange = DBCBtip_entChange
                OnDropDown = DBCBtip_esc_preDropDown
                ItemValues.Strings = (
                  '0'
                  'E'
                  'B')
              end
              object dbcbFormaApuracaoJUL: TDBMaplistCombobox
                Left = 229
                Top = 18
                Width = 160
                Height = 23
                Hint = 
                  'Forma de apura'#231#227'o da estimativa mensal, quando o per'#237'odo de apur' +
                  'a'#231#227'o for ANUAL.'
                Style = csDropDownList
                DataField = 'mes_bal_red_7'
                DataSource = dtmCadastrosInternos.dsrFiliais
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ItemHeight = 15
                Items.Strings = (
                  '0 - Fora do Per'#237'odo'
                  'E - Receita Bruta'
                  'B - Balan'#231'o ou Balancete')
                ParentFont = False
                TabOrder = 6
                OnChange = DBCBtip_entChange
                OnDropDown = DBCBtip_esc_preDropDown
                ItemValues.Strings = (
                  '0'
                  'E'
                  'B')
              end
              object dbcbFormaApuracaoAGO: TDBMaplistCombobox
                Left = 229
                Top = 42
                Width = 160
                Height = 23
                Hint = 
                  'Forma de apura'#231#227'o da estimativa mensal, quando o per'#237'odo de apur' +
                  'a'#231#227'o for ANUAL.'
                Style = csDropDownList
                DataField = 'mes_bal_red_8'
                DataSource = dtmCadastrosInternos.dsrFiliais
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ItemHeight = 15
                Items.Strings = (
                  '0 - Fora do Per'#237'odo'
                  'E - Receita Bruta'
                  'B - Balan'#231'o ou Balancete')
                ParentFont = False
                TabOrder = 7
                OnChange = DBCBtip_entChange
                OnDropDown = DBCBtip_esc_preDropDown
                ItemValues.Strings = (
                  '0'
                  'E'
                  'B')
              end
              object dbcbFormaApuracaoSET: TDBMaplistCombobox
                Left = 229
                Top = 66
                Width = 160
                Height = 23
                Hint = 
                  'Forma de apura'#231#227'o da estimativa mensal, quando o per'#237'odo de apur' +
                  'a'#231#227'o for ANUAL.'
                Style = csDropDownList
                DataField = 'mes_bal_red_9'
                DataSource = dtmCadastrosInternos.dsrFiliais
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ItemHeight = 15
                Items.Strings = (
                  '0 - Fora do Per'#237'odo'
                  'E - Receita Bruta'
                  'B - Balan'#231'o ou Balancete')
                ParentFont = False
                TabOrder = 8
                OnChange = DBCBtip_entChange
                OnDropDown = DBCBtip_esc_preDropDown
                ItemValues.Strings = (
                  '0'
                  'E'
                  'B')
              end
              object dbcbFormaApuracaoOUT: TDBMaplistCombobox
                Left = 229
                Top = 90
                Width = 160
                Height = 23
                Hint = 
                  'Forma de apura'#231#227'o da estimativa mensal, quando o per'#237'odo de apur' +
                  'a'#231#227'o for ANUAL.'
                Style = csDropDownList
                DataField = 'mes_bal_red_10'
                DataSource = dtmCadastrosInternos.dsrFiliais
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ItemHeight = 15
                Items.Strings = (
                  '0 - Fora do Per'#237'odo'
                  'E - Receita Bruta'
                  'B - Balan'#231'o ou Balancete')
                ParentFont = False
                TabOrder = 9
                OnChange = DBCBtip_entChange
                OnDropDown = DBCBtip_esc_preDropDown
                ItemValues.Strings = (
                  '0'
                  'E'
                  'B')
              end
              object dbcbFormaApuracaoNOV: TDBMaplistCombobox
                Left = 229
                Top = 114
                Width = 160
                Height = 23
                Hint = 
                  'Forma de apura'#231#227'o da estimativa mensal, quando o per'#237'odo de apur' +
                  'a'#231#227'o for ANUAL.'
                Style = csDropDownList
                DataField = 'mes_bal_red_11'
                DataSource = dtmCadastrosInternos.dsrFiliais
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ItemHeight = 15
                Items.Strings = (
                  '0 - Fora do Per'#237'odo'
                  'E - Receita Bruta'
                  'B - Balan'#231'o ou Balancete')
                ParentFont = False
                TabOrder = 10
                OnChange = DBCBtip_entChange
                OnDropDown = DBCBtip_esc_preDropDown
                ItemValues.Strings = (
                  '0'
                  'E'
                  'B')
              end
              object dbcbFormaApuracaoDEZ: TDBMaplistCombobox
                Left = 229
                Top = 138
                Width = 160
                Height = 23
                Hint = 
                  'Forma de apura'#231#227'o da estimativa mensal, quando o per'#237'odo de apur' +
                  'a'#231#227'o for ANUAL.'
                Style = csDropDownList
                DataField = 'mes_bal_red_12'
                DataSource = dtmCadastrosInternos.dsrFiliais
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ItemHeight = 15
                Items.Strings = (
                  '0 - Fora do Per'#237'odo'
                  'E - Receita Bruta'
                  'B - Balan'#231'o ou Balancete')
                ParentFont = False
                TabOrder = 11
                OnChange = DBCBtip_entChange
                OnDropDown = DBCBtip_esc_preDropDown
                ItemValues.Strings = (
                  '0'
                  'E'
                  'B')
              end
            end
            object dbcbIND_AVAL_ESTOQ: TDBMaplistCombobox
              Left = 245
              Top = 348
              Width = 257
              Height = 23
              Hint = 'M'#233'todo de avalia'#231#227'o do estoque final:'
              Style = csDropDownList
              DataField = 'ind_aval_estoq'
              DataSource = dtmCadastrosInternos.dsrFiliais
              ItemHeight = 15
              Items.Strings = (
                '1 - Custo m'#233'dio ponderado'
                '2 - PEPS (primeiro que entra, primeiro que sai)'
                '3 - Arbitramento - art. 296, Inc. I e II, do RIR/99'
                '4 - Custo espec'#237'fico'
                '5 - Valor realiz'#225'vel l'#237'quido'
                '6 - Invent'#225'rio peri'#243'dico'
                '7 - Outros')
              TabOrder = 17
              ItemValues.Strings = (
                '1'
                '2'
                '3'
                '4'
                '5'
                '6'
                '7')
            end
            object DBCBtip_ecd: TDBMaplistCombobox
              Left = 245
              Top = 325
              Width = 257
              Height = 23
              Hint = 'Indicador do Tipo da ECF'
              Style = csDropDownList
              DataField = 'tip_ecd'
              DataSource = dtmCadastrosInternos.dsrFiliais
              ItemHeight = 15
              Items.Strings = (
                '0 - N'#227'o participante de SCP como s'#243'cio ostensivo'
                '1 - Participante de SCP como s'#243'cio ostensivo'
                '2 - ECF da SCP')
              TabOrder = 16
              ItemValues.Strings = (
                '0'
                '1'
                '2')
            end
            object lblOptanteRefis: TStaticText
              Left = 8
              Top = 9
              Width = 239
              Height = 24
              Hint = 
                'A pessoa jur'#237'dica deve assinalar este campo quando for optante p' +
                'elo Programa de Recupera'#231#227'o Fiscal (Refis). ATEN'#199#195'O: Este campo ' +
                's'#243' deve ser assinalado pela pessoa jur'#237'dica optante pelo Program' +
                'a de Recupera'#231#227'o Fiscal (Refis), institu'#237'do pela Lei no 9.964, d' +
                'e 10 de abril de 2000, e que dele n'#227'o tenha sido exclu'#237'da. A pes' +
                'soa jur'#237'dica que for apenas optante pelo Parcelamento Especial (' +
                'Paes) de que trata a Lei no 10.684, de 30 de maio de 2003, e out' +
                'ros reparcelamentos n'#227'o deve assinalar este campo.'
              AutoSize = False
              BorderStyle = sbsSingle
              Caption = ' Optante pelo REFIS'
              TabOrder = 19
            end
            object lblOptantePaes: TStaticText
              Left = 8
              Top = 32
              Width = 239
              Height = 24
              Hint = 
                'A pessoa jur'#237'dica deve assinalar este campo quando for optante p' +
                'elo Parcelamento Especial (Paes), de que trata a Lei n'#186' 10.684, ' +
                'de 30 de maio de 2003.'
              AutoSize = False
              BorderStyle = sbsSingle
              Caption = ' Optante pelo PAES'
              TabOrder = 20
            end
            object lblFormadeTributacao: TStaticText
              Left = 8
              Top = 55
              Width = 239
              Height = 24
              Hint = 
                'Forma de tributa'#231#227'o do IRPJ (Imposto de Renda Sobre a Renda da P' +
                'essoa Jur'#237'dica) e, consequentemente, da CSLL (Contribui'#231#227'o Socia' +
                'l Sobre o Lucro L'#237'quido) adotada.'
              AutoSize = False
              BorderStyle = sbsSingle
              Caption = ' Forma de tributa'#231#227'o do lucro'
              TabOrder = 21
            end
            object lblPeriododeApuracao: TStaticText
              Left = 8
              Top = 102
              Width = 239
              Height = 24
              Hint = 'Per'#237'odo de Apura'#231#227'o do IRPJ e da CSLL'
              AutoSize = False
              BorderStyle = sbsSingle
              Caption = ' Periodo de apura'#231#227'o do IRPJ e CSLL'
              TabOrder = 22
            end
            object lblQualificacaoPessoaJuridica: TStaticText
              Left = 8
              Top = 125
              Width = 239
              Height = 24
              Hint = 
                'Qualifica'#231#227'o da pessoa jur'#237'dica. (ATEN'#199#195'O: N'#227'o preencher no caso' +
                ' de imunes e isentas)'
              AutoSize = False
              BorderStyle = sbsSingle
              Caption = ' Qualifica'#231#227'o da pessoa jur'#237'dica'
              TabOrder = 23
            end
            object lblFormaTribPeriodo: TStaticText
              Left = 8
              Top = 165
              Width = 239
              Height = 24
              Hint = 'Forma de tributa'#231#227'o no per'#237'odo considerando para cada trimestre,'
              AutoSize = False
              BorderStyle = sbsSingle
              Caption = ' Forma de tributa'#231#227'o no per'#237'odo'
              TabOrder = 24
            end
            object lbltip_esc_pre: TStaticText
              Left = 8
              Top = 188
              Width = 239
              Height = 24
              Hint = 
                'Escritura'#231#227'o: "L" '#8211' Livro Caixa ou hip'#243'tese prevista no '#167'1o do a' +
                'rt. 129, Instru'#231#227'o Normativa n'#186' 1.515/2014 (lucro presumido) ou ' +
                'sem escritura'#231#227'o (imunes ou isentas) ou n'#227'o obrigadas a entregar' +
                ' a ECD, de acordo com a Instru'#231#227'o Normativa no 1.420/2014. "C" '#8211 +
                ' Cont'#225'bil (Lucro Presumido, Imunes ou Isentas)'
              AutoSize = False
              BorderStyle = sbsSingle
              Caption = ' Tipo da escritura'#231#227'o'
              TabOrder = 25
            end
            object lbltip_ent: TStaticText
              Left = 8
              Top = 211
              Width = 239
              Height = 24
              Hint = 'Tipo de pessoa jur'#237'dica imune ou isenta'
              AutoSize = False
              BorderStyle = sbsSingle
              Caption = ' Tipo de pessoa jur'#237'dica imune/isenta'
              TabOrder = 26
            end
            object lblFORMA_APUR_I: TStaticText
              Left = 8
              Top = 234
              Width = 239
              Height = 24
              Hint = 
                'Apura'#231#227'o do IRPJ para imunes ou isentas: exist'#234'ncia ou n'#227'o de at' +
                'ividade n'#227'o abrangida pela imunidade ou isen'#231#227'o e tributada pelo' +
                ' IRPJ (para imunes ou isentas)'
              AutoSize = False
              BorderStyle = sbsSingle
              Caption = ' Forma de apura'#231#227'o IRPJ imune/isenta'
              TabOrder = 27
            end
            object StaticText2: TStaticText
              Left = 8
              Top = 257
              Width = 239
              Height = 24
              Hint = 'Apura'#231#227'o da CSLL para imunes ou isentas'
              AutoSize = False
              BorderStyle = sbsSingle
              Caption = ' Forma de apura'#231#227'o CSLL imune/isenta'
              TabOrder = 28
            end
            object OPT_EXT_RTT: TStaticText
              Left = 8
              Top = 280
              Width = 239
              Height = 24
              Hint = 
                'Optante pela extin'#231#227'o do RTT no ano-calend'#225'rio de 2014. OBSERVA'#199 +
                #195'O: Esse campo se refere ao art. 75 da Lei n'#186' 12.973/2014.'
              AutoSize = False
              BorderStyle = sbsSingle
              Caption = ' Optante pela extin'#231#227'o do RTT de 2014'
              TabOrder = 29
            end
            object lblDIF_FCONT: TStaticText
              Left = 8
              Top = 303
              Width = 239
              Height = 24
              Hint = 'Existe diferen'#231'as entre a contabilidade societ'#225'ria e Fcont'
              AutoSize = False
              BorderStyle = sbsSingle
              Caption = ' H'#225' diferen'#231'a entre contabilidade e FCONT'
              TabOrder = 30
            end
            object lblTIP_ECF: TStaticText
              Left = 8
              Top = 326
              Width = 239
              Height = 24
              Hint = 'Indicador do Tipo da ECF'
              AutoSize = False
              BorderStyle = sbsSingle
              Caption = ' Tipo da ECF'
              TabOrder = 31
            end
            object lblIND_AVAL_ESTOQ: TStaticText
              Left = 8
              Top = 349
              Width = 239
              Height = 24
              Hint = 'M'#233'todo de avalia'#231#227'o do estoque final:'
              AutoSize = False
              BorderStyle = sbsSingle
              Caption = ' M'#233'todo de avalia'#231#227'o do estoque final'
              TabOrder = 32
            end
            object lblind_rec_receita: TStaticText
              Left = 8
              Top = 79
              Width = 239
              Height = 24
              Hint = 
                'Crit'#233'rio de reconhecimento de receitas para empresas tributadas ' +
                'pelo Lucro Presumido (Art. 215, '#167' 9'#186', Instru'#231#227'o Normativa RFB n'#186 +
                ' 1.700/2017) 1. Regime de caixa 2. Regime de compet'#234'ncia Aten'#231#227'o' +
                ': - Este campo s'#243' '#233' preenchido pelas pessoas jur'#237'dicas tributada' +
                's pelo lucro presumido. - Caso a pessoa jur'#237'dica preencha 0010.I' +
                'ND_REC_RECEITA = '#8220'1'#8221', ent'#227'o 0010.TIP_ESC_PRE pode ser igual a '#8220'C' +
                #8221' e '#8220'L'#8221'. - Caso a pessoa jur'#237'dica preencha 0010.IND_REC_RECEITA ' +
                '= '#8220'2'#8221', ent'#227'o 0010.TIP_ESC_PRE deve ser igual a '#8220'C'#8221' '
              AutoSize = False
              BorderStyle = sbsSingle
              Caption = 'Tipo de receita do lucro Presumido'
              TabOrder = 33
            end
            object DBCind_rec_receita: TDBMaplistCombobox
              Left = 245
              Top = 78
              Width = 196
              Height = 23
              Hint = 
                'Crit'#233'rio de reconhecimento de receitas para empresas tributadas ' +
                'pelo Lucro Presumido (Art. 215, '#167' 9'#186', Instru'#231#227'o Normativa RFB n'#186 +
                ' 1.700/2017) 1. Regime de caixa 2. Regime de compet'#234'ncia Aten'#231#227'o' +
                ': - Este campo s'#243' '#233' preenchido pelas pessoas jur'#237'dicas tributada' +
                's pelo lucro presumido. - Caso a pessoa jur'#237'dica preencha 0010.I' +
                'ND_REC_RECEITA = '#8220'1'#8221', ent'#227'o 0010.TIP_ESC_PRE pode ser igual a '#8220'C' +
                #8221' e '#8220'L'#8221'. - Caso a pessoa jur'#237'dica preencha 0010.IND_REC_RECEITA ' +
                '= '#8220'2'#8221', ent'#227'o 0010.TIP_ESC_PRE deve ser igual a '#8220'C'#8221' '
              Style = csDropDownList
              DataField = 'ind_rec_receita'
              DataSource = dtmCadastrosInternos.dsrFiliais
              ItemHeight = 15
              Items.Strings = (
                '1. Regime de caixa'
                '2. Regime de compet'#234'ncia'
                '')
              TabOrder = 3
              ItemValues.Strings = (
                '1'
                '2'
                '')
            end
          end
          object tstParametrosComplementares: TTabSheet
            Caption = 'Par'#226'metros Complementares'
            ImageIndex = 1
            object edtIND_ALIQ_CSLL: TDBMaplistCombobox
              Left = 426
              Top = 8
              Width = 60
              Height = 23
              Hint = 
                'Deve ser assinalado '#8220'Sim'#8221' no caso de pessoa jur'#237'dica de seguros ' +
                'privados, de pessoa jur'#237'dica de capitaliza'#231#227'o e de pessoa jur'#237'di' +
                'ca referida nos incisos I a VII, IX e X do '#167' 1'#186' do art. 1'#186' da Le' +
                'i Complementar n'#186' 105, de 10 de janeiro de 2001 e '#8220'N'#227'o'#8221' pelas de' +
                'mais.'
              Style = csDropDownList
              DataField = 'IND_ALIQ_CSLL'
              DataSource = dtmCadastrosInternos.dsrFiliais
              ItemHeight = 15
              Items.Strings = (
                'Sim'
                'N'#227'o'
                '9%'
                '17%'
                '20%')
              TabOrder = 0
              ItemValues.Strings = (
                'S'
                'N'
                '1'
                '2'
                '3')
            end
            object edtIND_ADM_FUN_CLU: TDBMaplistCombobox
              Left = 426
              Top = 54
              Width = 60
              Height = 23
              Hint = 'Administradora de fundos e clubes de investimento'
              Style = csDropDownList
              DataField = 'IND_ADM_FUN_CLU'
              DataSource = dtmCadastrosInternos.dsrFiliais
              ItemHeight = 15
              Items.Strings = (
                'Sim'
                'N'#227'o')
              TabOrder = 2
              ItemValues.Strings = (
                'S'
                'N')
            end
            object edtIND_PART_CONS: TDBMaplistCombobox
              Left = 426
              Top = 77
              Width = 60
              Height = 23
              Hint = 
                'A pessoa jur'#237'dica participante de cons'#243'rcio constitu'#237'do nos term' +
                'os do disposto nos arts. 278 e 279 da Lei n'#186' 6.404, de 15 de dez' +
                'embro de 1976, deve assinalar este campo. Aten'#231#227'o: Somente deve ' +
                'ser assinalado este campo quando houver receita de pelo menos um' +
                'a consorciada'
              Style = csDropDownList
              DataField = 'IND_PART_CONS'
              DataSource = dtmCadastrosInternos.dsrFiliais
              ItemHeight = 15
              Items.Strings = (
                'Sim'
                'N'#227'o')
              TabOrder = 3
              ItemValues.Strings = (
                'S'
                'N')
            end
            object edtIND_OP_EXT: TDBMaplistCombobox
              Left = 426
              Top = 100
              Width = 60
              Height = 23
              Hint = 
                'A pessoa jur'#237'dica, inclusive institui'#231#227'o financeira ou companhia' +
                ' seguradora, conforme relacionadas no '#167' 1'#186' do art. 22 da Lei n'#186' ' +
                '8.212, de 1991, e no inciso II do art. 14 da Lei n'#186' 9.718, de 19' +
                '98, que realizou exporta'#231#227'o/importa'#231#227'o de bens, servi'#231'os ou dire' +
                'itos ou auferiu receitas financeiras ou incorreu em despesas fin' +
                'anceiras em opera'#231#245'es efetuadas com pessoa f'#237'sica ou jur'#237'dica re' +
                'sidente ou domiciliada no exterior, ainda que essas opera'#231#245'es n'#227 +
                'o tenham sido realizadas com pessoa vinculada ou com pessoa resi' +
                'dente ou domiciliada em pa'#237's ou depend'#234'ncia com tributa'#231#227'o favor' +
                'ecida ou cuja legisla'#231#227'o interna oponha sigilo relativo '#224' compos' +
                'i'#231#227'o societ'#225'ria de pessoas jur'#237'dicas ou a sua titularidade, deve' +
                ' assinalar este campo. Deve tamb'#233'm assinalar este campo a pessoa' +
                ' jur'#237'dica, inclusive institui'#231#227'o financeira ou companhia segurad' +
                'ora, que realizar as opera'#231#245'es acima referidas por interm'#233'dio de' +
                ' interposta pessoa.'
              Style = csDropDownList
              DataField = 'IND_OP_EXT'
              DataSource = dtmCadastrosInternos.dsrFiliais
              ItemHeight = 15
              Items.Strings = (
                'Sim'
                'N'#227'o')
              TabOrder = 4
              ItemValues.Strings = (
                'S'
                'N')
            end
            object edtIND_OP_VINC: TDBMaplistCombobox
              Left = 426
              Top = 123
              Width = 60
              Height = 23
              Hint = 
                'Deve assinalar este campo, a pessoa jur'#237'dica, inclusive institui' +
                #231#227'o financeira ou companhia seguradora, conforme relacionadas no' +
                ' '#167' 1'#186' do art. 22 da Lei n'#186' 8.212, de 1991, e no inciso II do art' +
                '. 14 da Lei n'#186' 9.718, de 1998, que realizou exporta'#231#227'o/importa'#231#227 +
                'o de bens, servi'#231'os ou direitos ou auferiu receitas financeiras ' +
                'ou incorreu em despesas financeiras em opera'#231#245'es efetuadas com p' +
                'essoa f'#237'sica ou jur'#237'dica residente ou domiciliada no exterior, c' +
                'onsiderada pela legisla'#231#227'o brasileira:'
              Style = csDropDownList
              DataField = 'ind_op_vinc'
              DataSource = dtmCadastrosInternos.dsrFiliais
              ItemHeight = 15
              Items.Strings = (
                'Sim'
                'N'#227'o')
              TabOrder = 5
              ItemValues.Strings = (
                'S'
                'N')
            end
            object edtIND_PJ_ENQUAD: TDBMaplistCombobox
              Left = 426
              Top = 146
              Width = 60
              Height = 23
              Hint = 'PJ enquadrada nos artigos 48 ou 49 da IN RFB n'#186' 1.312/2012'
              Style = csDropDownList
              DataField = 'IND_PJ_ENQUAD'
              DataSource = dtmCadastrosInternos.dsrFiliais
              ItemHeight = 15
              Items.Strings = (
                'Sim'
                'N'#227'o')
              TabOrder = 6
              ItemValues.Strings = (
                'S'
                'N')
            end
            object edtIND_PART_EXT: TDBMaplistCombobox
              Left = 426
              Top = 169
              Width = 60
              Height = 23
              Hint = 
                'A pessoa jur'#237'dica deve assinalar este campo, caso tenha particip' +
                'a'#231#245'es no exterior'
              Style = csDropDownList
              DataField = 'ind_part_ext'
              DataSource = dtmCadastrosInternos.dsrFiliais
              ItemHeight = 15
              Items.Strings = (
                'Sim'
                'N'#227'o')
              TabOrder = 7
              ItemValues.Strings = (
                'S'
                'N')
            end
            object edtIND_ATIV_RURAL: TDBMaplistCombobox
              Left = 426
              Top = 192
              Width = 60
              Height = 23
              Hint = 
                'A pessoa jur'#237'dica deve assinalar este campo, caso explore ativid' +
                'ade rural'
              Style = csDropDownList
              DataField = 'ind_ativ_rural'
              DataSource = dtmCadastrosInternos.dsrFiliais
              ItemHeight = 15
              Items.Strings = (
                'Sim'
                'N'#227'o')
              TabOrder = 8
              ItemValues.Strings = (
                'S'
                'N')
            end
            object edtIND_LUC_EXP: TDBMaplistCombobox
              Left = 426
              Top = 215
              Width = 60
              Height = 23
              Hint = 
                'Este campo deve ser assinalado pelas pessoas jur'#237'dicas que adota' +
                'm a forma de tributa'#231#227'o pelo lucro real, inclusive se optantes p' +
                'elo Refis, que gozem de benef'#237'cios fiscais calculados com base n' +
                'o lucro da explora'#231#227'o.'
              Style = csDropDownList
              DataField = 'ind_luc_exp'
              DataSource = dtmCadastrosInternos.dsrFiliais
              ItemHeight = 15
              Items.Strings = (
                'Sim'
                'N'#227'o')
              TabOrder = 9
              ItemValues.Strings = (
                'S'
                'N')
            end
            object edtIND_RED_ISEN: TDBMaplistCombobox
              Left = 426
              Top = 238
              Width = 60
              Height = 23
              Hint = 
                'A pessoa jur'#237'dica tributada pelo lucro presumido e optante pelo ' +
                'Refis deve assinalar este campo caso usufrua benef'#237'cios fiscais ' +
                'relativos a isen'#231#227'o ou redu'#231#227'o do imposto de renda.'
              Style = csDropDownList
              DataField = 'ind_red_isen'
              DataSource = dtmCadastrosInternos.dsrFiliais
              ItemHeight = 15
              Items.Strings = (
                'Sim'
                'N'#227'o')
              TabOrder = 10
              ItemValues.Strings = (
                'S'
                'N')
            end
            object edtIND_FIN: TDBMaplistCombobox
              Left = 426
              Top = 261
              Width = 60
              Height = 23
              Style = csDropDownList
              DataField = 'ind_fin'
              DataSource = dtmCadastrosInternos.dsrFiliais
              ItemHeight = 15
              Items.Strings = (
                'Sim'
                'N'#227'o')
              TabOrder = 11
              ItemValues.Strings = (
                'S'
                'N')
            end
            object edtIND_DOA_ELEIT: TDBMaplistCombobox
              Left = 426
              Top = 284
              Width = 60
              Height = 23
              Hint = 
                'A pessoa jur'#237'dica deve assinalar este campo, caso tenha efetuado' +
                ', durante o ano-calend'#225'rio, doa'#231#245'es a candidatos, comit'#234's financ' +
                'eiros e partidos pol'#237'ticos, ainda que na forma de fornecimento d' +
                'e mercadorias ou presta'#231#227'o de servi'#231'os para campanhas eleitorais' +
                '.'
              Style = csDropDownList
              DataField = 'ind_doa_eleit'
              DataSource = dtmCadastrosInternos.dsrFiliais
              ItemHeight = 15
              Items.Strings = (
                'Sim'
                'N'#227'o')
              TabOrder = 12
              ItemValues.Strings = (
                'S'
                'N')
            end
            object edtIND_PART_COLIG: TDBMaplistCombobox
              Left = 426
              Top = 307
              Width = 60
              Height = 23
              Hint = 
                'A pessoa jur'#237'dica domiciliada no Brasil, que teve participa'#231#245'es ' +
                'permanentes, no ano-calend'#225'rio, em capital de pessoa jur'#237'dica do' +
                'miciliada no Brasil ou no exterior, considerada, pela legisla'#231#227'o' +
                ' brasileira, avaliada pelo m'#233'todo de equival'#234'ncia patrimonial, d' +
                'eve assinalar este campo.'
              Style = csDropDownList
              DataField = 'ind_part_colig'
              DataSource = dtmCadastrosInternos.dsrFiliais
              ItemHeight = 15
              Items.Strings = (
                'Sim'
                'N'#227'o')
              TabOrder = 13
              ItemValues.Strings = (
                'S'
                'N')
            end
            object edtIND_VEND_EXP: TDBMaplistCombobox
              Left = 426
              Top = 343
              Width = 60
              Height = 23
              Hint = 
                'Este campo deve ser assinalado pela pessoa jur'#237'dica que efetuou ' +
                'vendas, no ano-calend'#225'rio, a empresas comerciais exportadoras'
              Style = csDropDownList
              DataField = 'ind_vend_exp'
              DataSource = dtmCadastrosInternos.dsrFiliais
              ItemHeight = 15
              Items.Strings = (
                'Sim'
                'N'#227'o')
              TabOrder = 14
              ItemValues.Strings = (
                'S'
                'N')
            end
            object edtIND_REC_EXT: TDBMaplistCombobox
              Left = 426
              Top = 364
              Width = 60
              Height = 23
              Hint = 
                'Deve assinalar este campo, a pessoa jur'#237'dica que recebeu, durant' +
                'e o ano-calend'#225'rio, de pessoas f'#237'sicas ou jur'#237'dicas, residentes ' +
                'ou domiciliadas no exterior ou de n'#227'o-residentes: a) quaisquer v' +
                'alores mediante opera'#231#245'es de c'#226'mbio de qualquer natureza; b) qua' +
                'isquer valores por interm'#233'dio de transfer'#234'ncias internacionais e' +
                'm reais (TIR), ou seja, provenientes de conta banc'#225'ria em reais ' +
                '(R$) titulada por n'#227'o-residente; c) valores iguais ou superiores' +
                ' a R$ 120.000,00 (cento e vinte mil reais), equivalentes a R$ 10' +
                '.000,00 por m'#234's, por interm'#233'dio de cart'#245'es de cr'#233'dito; d) quaisq' +
                'uer valores por interm'#233'dio de dep'#243'sitos em contas banc'#225'rias mant' +
                'idas no exterior.'
              Style = csDropDownList
              DataField = 'ind_rec_ext'
              DataSource = dtmCadastrosInternos.dsrFiliais
              ItemHeight = 15
              Items.Strings = (
                'Sim'
                'N'#227'o')
              TabOrder = 15
              ItemValues.Strings = (
                'S'
                'N')
            end
            object edtIND_ATIV_EXT: TDBMaplistCombobox
              Left = 946
              Top = 8
              Width = 60
              Height = 23
              Hint = 
                'Preenchida por todas as pessoas jur'#237'dicas (Sim), salvo quando o ' +
                'valor cont'#225'bil total dos ativos a declarar, convertido para Reai' +
                's no final do per'#237'odo abrangido pela ECF, for inferior a R$ 100.' +
                '000,00 (cem mil reais) (N'#227'o).'
              Style = csDropDownList
              DataField = 'ind_ativ_ext'
              DataSource = dtmCadastrosInternos.dsrFiliais
              ItemHeight = 15
              Items.Strings = (
                'Sim'
                'N'#227'o')
              TabOrder = 16
              ItemValues.Strings = (
                'S'
                'N')
            end
            object edtIND_COM_EXP: TDBMaplistCombobox
              Left = 946
              Top = 31
              Width = 60
              Height = 23
              Hint = 
                'Este campo deve ser assinalado pela empresa comercial exportador' +
                'a que comprou produtos com o fim espec'#237'fico de exporta'#231#227'o ou exp' +
                'ortou, no ano-calend'#225'rio, produtos adquiridos com esta finalidad' +
                'e.'
              Style = csDropDownList
              DataField = 'ind_com_exp'
              DataSource = dtmCadastrosInternos.dsrFiliais
              ItemHeight = 15
              Items.Strings = (
                'Sim'
                'N'#227'o')
              TabOrder = 17
              ItemValues.Strings = (
                'S'
                'N')
            end
            object edtIND_PGTO_EXT: TDBMaplistCombobox
              Left = 946
              Top = 54
              Width = 60
              Height = 23
              Hint = 
                'Deve assinalar este campo, a pessoa jur'#237'dica que tiver pagado, c' +
                'reditado, entregado, empregado ou remetido, durante o ano-calend' +
                #225'rio, a pessoas f'#237'sicas ou jur'#237'dicas, residentes ou domiciliadas' +
                ' no exterior ou a n'#227'o-residentes: a) quaisquer valores mediante ' +
                'opera'#231#245'es de c'#226'mbio de qualquer natureza; b) quaisquer valores p' +
                'or interm'#233'dio de transfer'#234'ncias internacionais em reais (TIR), o' +
                'u seja, pela utiliza'#231#227'o de reais (R$) para cr'#233'dito de conta banc' +
                #225'ria titulada por n'#227'o-residentes; c) valores iguais ou superiore' +
                's a R$ 120.000,00 (cento e vinte mil reais), equivalentes a R$ 1' +
                '0.000,00 por m'#234's, por interm'#233'dio de cart'#245'es de cr'#233'dito; d) quais' +
                'quer valores mediante a utiliza'#231#227'o de recursos mantidos no exter' +
                'ior.'
              Style = csDropDownList
              DataField = 'ind_pgto_ext'
              DataSource = dtmCadastrosInternos.dsrFiliais
              ItemHeight = 15
              Items.Strings = (
                'Sim'
                'N'#227'o')
              TabOrder = 18
              ItemValues.Strings = (
                'S'
                'N')
            end
            object IND_E_COM_TI: TDBMaplistCombobox
              Left = 946
              Top = 77
              Width = 60
              Height = 23
              Hint = 
                'A pessoa jur'#237'dica que efetuou durante o ano-calend'#225'rio vendas de' +
                ' bens (tang'#237'veis ou intang'#237'veis) ou tiver prestado servi'#231'os, por' +
                ' meio da Internet, para pessoas f'#237'sicas e jur'#237'dicas, residentes ' +
                'ou domiciliadas no Brasil ou no exterior, deve assinalar este ca' +
                'mpo. Ao assinalar este campo, s'#227'o disponibilizados os registros ' +
                'X400 (Com'#233'rcio Eletr'#244'nico e Tecnologia da Informa'#231#227'o) e X410 (Co' +
                'm'#233'rcio Eletr'#244'nico).'
              Style = csDropDownList
              DataField = 'ind_e_com_ti'
              DataSource = dtmCadastrosInternos.dsrFiliais
              ItemHeight = 15
              Items.Strings = (
                'Sim'
                'N'#227'o')
              TabOrder = 19
              ItemValues.Strings = (
                'S'
                'N')
            end
            object edtIND_ROY_REC: TDBMaplistCombobox
              Left = 946
              Top = 100
              Width = 60
              Height = 23
              Hint = 
                'A pessoa jur'#237'dica que tiver recebido, durante o ano-calend'#225'rio, ' +
                'de pessoas f'#237'sicas ou jur'#237'dicas, residentes ou domiciliadas no B' +
                'rasil ou no exterior, rendimentos a t'#237'tulo de royalties relativo' +
                's a: explora'#231#227'o econ'#244'mica dos direitos patrimoniais do autor, de' +
                ' marcas, de patentes e de desenho industrial; explora'#231#227'o de know' +
                '-how; explora'#231#227'o de franquias e explora'#231#227'o dos direitos relativo' +
                's '#224' propriedade intelectual referente a cultivares, deve preench' +
                'er este campo com '#8220'Sim'#8221'.'
              Style = csDropDownList
              DataField = 'ind_roy_rec'
              DataSource = dtmCadastrosInternos.dsrFiliais
              ItemHeight = 15
              Items.Strings = (
                'Sim'
                'N'#227'o')
              TabOrder = 20
              ItemValues.Strings = (
                'S'
                'N')
            end
            object edtIND_ROY_PAG: TDBMaplistCombobox
              Left = 946
              Top = 123
              Width = 60
              Height = 23
              Hint = 
                'A pessoa jur'#237'dica que tiver efetuado pagamento ou remessa, duran' +
                'te o ano-calend'#225'rio, a pessoas f'#237'sicas ou jur'#237'dicas, residentes ' +
                'ou domiciliadas no Brasil ou no exterior, a t'#237'tulo de royalties ' +
                'relativos a: explora'#231#227'o econ'#244'mica dos direitos patrimoniais do a' +
                'utor, de marcas, de patentes e de desenho industrial; explora'#231#227'o' +
                ' de know-how; explora'#231#227'o de franquias e explora'#231#227'o dos direitos ' +
                'relativos '#224' propriedade intelectual referente a cultivares, deve' +
                ' preencher este campo com '#8220'Sim'#8221'.'
              Style = csDropDownList
              DataField = 'ind_roy_pag'
              DataSource = dtmCadastrosInternos.dsrFiliais
              ItemHeight = 15
              Items.Strings = (
                'Sim'
                'N'#227'o')
              TabOrder = 21
              ItemValues.Strings = (
                'S'
                'N')
            end
            object edtIND_REND_SERV: TDBMaplistCombobox
              Left = 946
              Top = 157
              Width = 60
              Height = 23
              Hint = 
                'A pessoa jur'#237'dica que tiver recebido, durante o ano-calend'#225'rio, ' +
                'de pessoas f'#237'sicas ou jur'#237'dicas, residentes ou domiciliadas no B' +
                'rasil ou no exterior, rendimentos relativos a: servi'#231'os de assis' +
                't'#234'ncia t'#233'cnica, cient'#237'fica, administrativa e semelhantes que imp' +
                'liquem transfer'#234'ncia de tecnologia; servi'#231'os t'#233'cnicos e de assis' +
                't'#234'ncia que n'#227'o impliquem transfer'#234'ncia de tecnologia; juros sobr' +
                'e capital pr'#243'prio, bem como juros decorrentes de contratos de m'#250 +
                'tuo entre empresas ligadas e juros decorrentes de contratos de f' +
                'inanciamento; dividendos decorrentes de participa'#231#245'es em outras ' +
                'empresas, deve preencher este campo com '#8220'Sim'#8221'.'
              Style = csDropDownList
              DataField = 'ind_rend_serv'
              DataSource = dtmCadastrosInternos.dsrFiliais
              ItemHeight = 15
              Items.Strings = (
                'Sim'
                'N'#227'o')
              TabOrder = 22
              ItemValues.Strings = (
                'S'
                'N')
            end
            object edtIND_PGTO_REM: TDBMaplistCombobox
              Left = 946
              Top = 191
              Width = 60
              Height = 23
              Hint = 
                'A pessoa jur'#237'dica que tiver pagado ou remetido, durante o ano-ca' +
                'lend'#225'rio, a pessoas f'#237'sicas ou jur'#237'dicas, residentes ou domicili' +
                'adas no Brasil ou no exterior, valores relativos a: servi'#231'os de ' +
                'assist'#234'ncia t'#233'cnica, cient'#237'fica, administrativa e semelhantes qu' +
                'e impliquem transfer'#234'ncia de tecnologia; servi'#231'os t'#233'cnicos e de ' +
                'assist'#234'ncia que n'#227'o impliquem transfer'#234'ncia de tecnologia; juros' +
                ' sobre capital pr'#243'prio, bem como juros decorrentes de contratos ' +
                'de m'#250'tuo entre empresas ligadas e juros decorrentes de contratos' +
                ' de financiamento; dividendos decorrentes de participa'#231#245'es em ou' +
                'tras empresas, deve preencher este campo com '#8220'Sim'#8221'.'
              Style = csDropDownList
              DataField = 'ind_pgto_rem'
              DataSource = dtmCadastrosInternos.dsrFiliais
              ItemHeight = 15
              Items.Strings = (
                'Sim'
                'N'#227'o')
              TabOrder = 23
              ItemValues.Strings = (
                'S'
                'N')
            end
            object edtIND_INOV_TEC: TDBMaplistCombobox
              Left = 946
              Top = 214
              Width = 60
              Height = 23
              Hint = 
                'A pessoa jur'#237'dica benefici'#225'ria de incentivos fiscais relativos '#224 +
                's atividades de pesquisa tecnol'#243'gica e desenvolvimento de inova'#231 +
                #227'o tecnol'#243'gica de que tratam os arts. 17 a 26 da Lei n'#186' 11.196, ' +
                'de 21 de novembro de 2005, ou a pessoa jur'#237'dica executora dos pr' +
                'ogramas de desenvolvimento tecnol'#243'gico industrial ou agropecu'#225'ri' +
                'o (PDTI/PDTA) de que trata a Lei n'#186' 8.661, de 1993, aprovados at' +
                #233' 31 de dezembro de 2005, que n'#227'o tenha migrado para o regime es' +
                'tabelecido nos arts. 17 a 26 da Lei n'#186' 11.196, de 2005, deve pre' +
                'encher este campo com '#8220'Sim'#8221'.'
              Style = csDropDownList
              DataField = 'ind_inov_tec'
              DataSource = dtmCadastrosInternos.dsrFiliais
              ItemHeight = 15
              Items.Strings = (
                'Sim'
                'N'#227'o')
              TabOrder = 24
              ItemValues.Strings = (
                'S'
                'N')
            end
            object edtIND_PJ_HAB: TDBMaplistCombobox
              Left = 946
              Top = 287
              Width = 60
              Height = 23
              Hint = 
                'A pessoa jur'#237'dica habilitada no Regime Especial de Tributa'#231#227'o pa' +
                'ra a Plataforma de Exporta'#231#227'o de Servi'#231'os de Tecnologia da Infor' +
                'ma'#231#227'o (Repes) ou no Regime Especial de Aquisi'#231#227'o de Bens de Capi' +
                'tal para Empresas Exportadoras (Recap) institu'#237'dos pela Lei n'#186' 1' +
                '1.196, de 2005, regulamentados pelos Decretos n'#186' 5.712, de 2 de ' +
                'mar'#231'o de 2006, e n'#186' 5.649, de 29 de dezembro de 2005, respectiva' +
                'mente, deve assinalar este campo. Tamb'#233'm deve assinalar este cam' +
                'po a pessoa jur'#237'dica executora de projeto aprovado no '#226'mbito do ' +
                'Programa de Apoio ao Desenvolvimento Tecnol'#243'gico da Ind'#250'stria de' +
                ' Semicondutores (Padis) ou do Programa de Apoio ao Desenvolvimen' +
                'to Tecnol'#243'gico da Ind'#250'stria de Equipamentos para TV Digital (PAT' +
                'VD), institu'#237'dos pela Lei n'#186' 11.484, de 2007. Este campo deve ta' +
                'mb'#233'm ser assinalado pela pessoa jur'#237'dica habilitada ou co-habili' +
                'tada no Regime Especial de Incentivos e Desenvolvimento da Infra' +
                'estrutura (Reidi), institu'#237'do pela Lei n'#186' 11.488, de 15 de junho' +
                ' de 2007, e regulamentado pelo Decreto n'#186' 6.144, de 3 de julho d' +
                'e 2007, com altera'#231#245'es introduzidas pelo Decreto n'#186' 6.167, de 24' +
                ' de julho de 2007. Habilitada ou co-habilitada no Regime Especia' +
                'l de Incentivos para o Desenvolvimento da Infraestrutura da Ind'#250 +
                'stria Petrol'#237'fera das Regi'#245'es Norte, Nordeste e Centro-Oeste (Re' +
                'penec), institu'#237'do pela Lei n'#186' 12.249, de 2010, regulamentado pe' +
                'lo Decreto n'#186' 7.320, de 28 de setembro de 2010. Habilitada no Re' +
                'gime Especial de Incentivo a Computadores para Uso Educacional (' +
                'REICOMP), institu'#237'do pela Lei n'#186' 12.715, de 17 de setembro de 20' +
                '12. Habilitada no Regime Especial para a Ind'#250'stria Aeron'#225'utica B' +
                'rasileira (Retaero), institu'#237'do pela Lei n'#186' 12.249, de 2010. Det' +
                'entora de projeto de exibi'#231#227'o cinematogr'#225'fica aprovado no '#226'mbito' +
                ' do Regime Especial de Tributa'#231#227'o para Desenvolvimento da Ativid' +
                'ade de Exibi'#231#227'o Cinematogr'#225'fica (Recine), institu'#237'do Lei n'#186' 12.5' +
                '99, de 23 de mar'#231'o de 2012. Os estabelecimentos industriais que ' +
                'adquirirem res'#237'duos s'#243'lidos utilizados como mat'#233'rias-primas ou p' +
                'rodutos intermedi'#225'rios na fabrica'#231#227'o de seus produtos, de acord'
              Style = csDropDownList
              DataField = 'ind_pj_hab'
              DataSource = dtmCadastrosInternos.dsrFiliais
              ItemHeight = 15
              Items.Strings = (
                'Sim'
                'N'#227'o')
              TabOrder = 26
              ItemValues.Strings = (
                'S'
                'N')
            end
            object edtIND_POLO_AM: TDBMaplistCombobox
              Left = 946
              Top = 308
              Width = 60
              Height = 23
              Hint = 
                'A pessoa jur'#237'dica que estiver localizada na '#225'rea de atua'#231#227'o da S' +
                'uperintend'#234'ncia da Zona Franca de Manaus (Suframa) que seja bene' +
                'fici'#225'ria dos incentivos de que trata o Decreto-lei n'#186' 288, de 28' +
                ' de fevereiro de 1967, e altera'#231#245'es posteriores; a Lei n'#186' 8.387,' +
                ' de 30 de dezembro de 1991, e altera'#231#245'es posteriores; ou o Decre' +
                'to-lei n'#186' 356, de 15 de agosto de 1968, e altera'#231#245'es posteriores' +
                ' (Amaz'#244'nia Ocidental), deve preencher este campo com '#8220'Sim'#8221'.'
              Style = csDropDownList
              DataField = 'ind_polo_am'
              DataSource = dtmCadastrosInternos.dsrFiliais
              ItemHeight = 15
              Items.Strings = (
                'Sim'
                'N'#227'o')
              TabOrder = 27
              ItemValues.Strings = (
                'S'
                'N')
            end
            object edtIND_ZON_EXP: TDBMaplistCombobox
              Left = 946
              Top = 331
              Width = 60
              Height = 23
              Hint = 
                'A pessoa jur'#237'dica autorizada a operar em Zonas de Processamento ' +
                'de Exporta'#231#227'o, voltadas para a produ'#231#227'o de bens a serem comercia' +
                'lizados no exterior, de acordo com o estabelecido pela Lei n'#186' 11' +
                '.508, de 20 de julho de 2007 e pela Lei n'#186' 11.732, de 30 de junh' +
                'o de 2008, deve preencher este campo com '#8220'Sim'#8221'.'
              Style = csDropDownList
              DataField = 'ind_zon_exp'
              DataSource = dtmCadastrosInternos.dsrFiliais
              ItemHeight = 15
              Items.Strings = (
                'Sim'
                'N'#227'o')
              TabOrder = 28
              ItemValues.Strings = (
                'S'
                'N')
            end
            object edtIND_AREA_COM: TDBMaplistCombobox
              Left = 946
              Top = 354
              Width = 60
              Height = 23
              Hint = 
                'A pessoa jur'#237'dica autorizada a operar nas '#193'reas de Livre Com'#233'rci' +
                'o de Boa Vista, Bonfim, Tabatinga, Macap'#225' e Santana, Brasil'#233'ia, ' +
                'Cruzeiro do Sul ou Guajar'#225'-Mirim, benefici'#225'ria dos incentivos de' +
                ' que tratam a Lei n'#186' 8.256, de 25 de novembro de 1991, a Lei n'#186' ' +
                '11.732, de 30 de junho de 2008, a Lei n'#186' 7.965, de 22 de dezembr' +
                'o de 1989, a Lei n'#186' 8.387, de 30 de dezembro de 1991, o Decreto ' +
                'n'#186' 517, de 8 de maio de 1992, a Lei n'#186' 8.857, de 8 de mar'#231'o de 1' +
                '994, e a Lei n'#186' 8.210, de 19 de julho de 1991, e altera'#231#245'es post' +
                'eriores, deve preencher este campo com '#8220'Sim'#8221'.'
              Style = csDropDownList
              DataField = 'ind_area_com'
              DataSource = dtmCadastrosInternos.dsrFiliais
              ItemHeight = 15
              Items.Strings = (
                'Sim'
                'N'#227'o')
              TabOrder = 29
              ItemValues.Strings = (
                'S'
                'N')
            end
            object lblIND_PJ_HAB: TStaticText
              Left = 528
              Top = 261
              Width = 420
              Height = 49
              Hint = 
                'A pessoa jur'#237'dica habilitada no Regime Especial de Tributa'#231#227'o pa' +
                'ra a Plataforma de Exporta'#231#227'o de Servi'#231'os de Tecnologia da Infor' +
                'ma'#231#227'o (Repes) ou no Regime Especial de Aquisi'#231#227'o de Bens de Capi' +
                'tal para Empresas Exportadoras (Recap) institu'#237'dos pela Lei n'#186' 1' +
                '1.196, de 2005, regulamentados pelos Decretos n'#186' 5.712, de 2 de ' +
                'mar'#231'o de 2006, e n'#186' 5.649, de 29 de dezembro de 2005, respectiva' +
                'mente, deve assinalar este campo. Tamb'#233'm deve assinalar este cam' +
                'po a pessoa jur'#237'dica executora de projeto aprovado no '#226'mbito do ' +
                'Programa de Apoio ao Desenvolvimento Tecnol'#243'gico da Ind'#250'stria de' +
                ' Semicondutores (Padis) ou do Programa de Apoio ao Desenvolvimen' +
                'to Tecnol'#243'gico da Ind'#250'stria de Equipamentos para TV Digital (PAT' +
                'VD), institu'#237'dos pela Lei n'#186' 11.484, de 2007. Este campo deve ta' +
                'mb'#233'm ser assinalado pela pessoa jur'#237'dica habilitada ou co-habili' +
                'tada no Regime Especial de Incentivos e Desenvolvimento da Infra' +
                'estrutura (Reidi), institu'#237'do pela Lei n'#186' 11.488, de 15 de junho' +
                ' de 2007, e regulamentado pelo Decreto n'#186' 6.144, de 3 de julho d' +
                'e 2007, com altera'#231#245'es introduzidas pelo Decreto n'#186' 6.167, de 24' +
                ' de julho de 2007. Habilitada ou co-habilitada no Regime Especia' +
                'l de Incentivos para o Desenvolvimento da Infraestrutura da Ind'#250 +
                'stria Petrol'#237'fera das Regi'#245'es Norte, Nordeste e Centro-Oeste (Re' +
                'penec), institu'#237'do pela Lei n'#186' 12.249, de 2010, regulamentado pe' +
                'lo Decreto n'#186' 7.320, de 28 de setembro de 2010. Habilitada no Re' +
                'gime Especial de Incentivo a Computadores para Uso Educacional (' +
                'REICOMP), institu'#237'do pela Lei n'#186' 12.715, de 17 de setembro de 20' +
                '12. Habilitada no Regime Especial para a Ind'#250'stria Aeron'#225'utica B' +
                'rasileira (Retaero), institu'#237'do pela Lei n'#186' 12.249, de 2010. Det' +
                'entora de projeto de exibi'#231#227'o cinematogr'#225'fica aprovado no '#226'mbito' +
                ' do Regime Especial de Tributa'#231#227'o para Desenvolvimento da Ativid' +
                'ade de Exibi'#231#227'o Cinematogr'#225'fica (Recine), institu'#237'do Lei n'#186' 12.5' +
                '99, de 23 de mar'#231'o de 2012. Os estabelecimentos industriais que ' +
                'adquirirem res'#237'duos s'#243'lidos utilizados como mat'#233'rias-primas ou p' +
                'rodutos intermedi'#225'rios na fabrica'#231#227'o de seus produtos, de acord'
              AutoSize = False
              BorderStyle = sbsSingle
              Caption = 
                ' PJ habilitada no Repes, Recap, Padis, PATVD, Reidi, Repenec, Re' +
                'icomp,      Retaero, Recine, Res'#237'duos S'#243'lidos, Recopa, Copa do M' +
                'undo, Retid,               REPNBL- Redes, Reif e Olimp'#237'adas'
              TabOrder = 31
            end
            object edtIND_CAP_INF: TDBMaplistCombobox
              Left = 946
              Top = 237
              Width = 60
              Height = 23
              Hint = 
                'A pessoa jur'#237'dica que tiver investido em atividades de pesquisa ' +
                'e desenvolvimento em tecnologia da informa'#231#227'o no '#226'mbito dos prog' +
                'ramas de capacita'#231#227'o e competitividade dos setores de inform'#225'tic' +
                'a e automa'#231#227'o e tecnologias da informa'#231#227'o de que trata a Lei n'#186' ' +
                '8.248, de 23 de outubro de 1991, a Lei n'#186' 10.176, de 11 de janei' +
                'ro de 2001, e a Lei n'#186' 11.077, de 30 de dezembro de 2004, regula' +
                'mentadas pelo Decreto n'#186' 5.906, de 26 de setembro de 2006, ou ti' +
                'ver efetuado venda a varejo nos termos dos arts. 28 a 30 da Lei ' +
                'n'#186' 11.196, de 2005, que disp'#245'em sobre o programa de inclus'#227'o dig' +
                'ital, deve preencher este campo com '#8220'Sim'#8221'.'
              Style = csDropDownList
              DataField = 'ind_cap_inf'
              DataSource = dtmCadastrosInternos.dsrFiliais
              ItemHeight = 15
              Items.Strings = (
                'Sim'
                'N'#227'o')
              TabOrder = 25
              ItemValues.Strings = (
                'S'
                'N')
            end
            object edtIND_QTE_SCP: TDBEditNumero
              Left = 426
              Top = 31
              Width = 60
              Height = 23
              Hint = 'Quantidade de SCP da PJ - S'#243'cio Ostensivo de SCP - Total de SCP'
              MaxLength = -1
              TabOrder = 1
              Text = 'edtIND_QTE_SCP'
              Mascara = False
              Alignment = taLeftJustify
              TipoMascara = tmGERAL
              NrDecimal = 0
              Decimais = True
              Negativo = False
              Tamanho = 9
              DataField = 'IND_QTE_SCP'
              DataSource = dtmCadastrosInternos.dsrFiliais
            end
            object lblIND_VEND_EXP: TStaticText
              Left = 8
              Top = 331
              Width = 420
              Height = 35
              Hint = 
                'Este campo deve ser assinalado pela pessoa jur'#237'dica que efetuou ' +
                'vendas, no ano-calend'#225'rio, a empresas comerciais exportadoras'
              AutoSize = False
              BorderStyle = sbsSingle
              Caption = 
                ' PJ efetuou vendas a empresa comercial exportadora com fim espec' +
                #237'fico de   exporta'#231#227'o'
              TabOrder = 32
            end
            object lblIND_PGTO_REM: TStaticText
              Left = 528
              Top = 181
              Width = 420
              Height = 35
              Hint = 
                'A pessoa jur'#237'dica que tiver pagado ou remetido, durante o ano-ca' +
                'lend'#225'rio, a pessoas f'#237'sicas ou jur'#237'dicas, residentes ou domicili' +
                'adas no Brasil ou no exterior, valores relativos a: servi'#231'os de ' +
                'assist'#234'ncia t'#233'cnica, cient'#237'fica, administrativa e semelhantes qu' +
                'e impliquem transfer'#234'ncia de tecnologia; servi'#231'os t'#233'cnicos e de ' +
                'assist'#234'ncia que n'#227'o impliquem transfer'#234'ncia de tecnologia; juros' +
                ' sobre capital pr'#243'prio, bem como juros decorrentes de contratos ' +
                'de m'#250'tuo entre empresas ligadas e juros decorrentes de contratos' +
                ' de financiamento; dividendos decorrentes de participa'#231#245'es em ou' +
                'tras empresas, deve preencher este campo com '#8220'Sim'#8221'.'
              AutoSize = False
              BorderStyle = sbsSingle
              Caption = 
                ' Pagamentos ou remessas a t'#237'tulo de servi'#231'os, juros e dividendos' +
                ' a                 benefici'#225'rios do Brasil e do exterior'
              TabOrder = 33
            end
            object lblIND_COM_EXP: TStaticText
              Left = 528
              Top = 32
              Width = 420
              Height = 24
              Hint = 
                'Este campo deve ser assinalado pela empresa comercial exportador' +
                'a que comprou produtos com o fim espec'#237'fico de exporta'#231#227'o ou exp' +
                'ortou, no ano-calend'#225'rio, produtos adquiridos com esta finalidad' +
                'e.'
              AutoSize = False
              BorderStyle = sbsSingle
              Caption = ' PJ comercial exportadora'
              TabOrder = 34
            end
            object lblIND_PGTO_EXT: TStaticText
              Left = 528
              Top = 55
              Width = 420
              Height = 24
              Hint = 
                'Deve assinalar este campo, a pessoa jur'#237'dica que tiver pagado, c' +
                'reditado, entregado, empregado ou remetido, durante o ano-calend' +
                #225'rio, a pessoas f'#237'sicas ou jur'#237'dicas, residentes ou domiciliadas' +
                ' no exterior ou a n'#227'o-residentes: a) quaisquer valores mediante ' +
                'opera'#231#245'es de c'#226'mbio de qualquer natureza; b) quaisquer valores p' +
                'or interm'#233'dio de transfer'#234'ncias internacionais em reais (TIR), o' +
                'u seja, pela utiliza'#231#227'o de reais (R$) para cr'#233'dito de conta banc' +
                #225'ria titulada por n'#227'o-residentes; c) valores iguais ou superiore' +
                's a R$ 120.000,00 (cento e vinte mil reais), equivalentes a R$ 1' +
                '0.000,00 por m'#234's, por interm'#233'dio de cart'#245'es de cr'#233'dito; d) quais' +
                'quer valores mediante a utiliza'#231#227'o de recursos mantidos no exter' +
                'ior.'
              AutoSize = False
              BorderStyle = sbsSingle
              Caption = ' Pagamentos ao exterior ou a n'#227'o residentes'
              TabOrder = 35
            end
            object lblIND_E_COM_TI: TStaticText
              Left = 528
              Top = 78
              Width = 420
              Height = 24
              Hint = 
                'A pessoa jur'#237'dica que efetuou durante o ano-calend'#225'rio vendas de' +
                ' bens (tang'#237'veis ou intang'#237'veis) ou tiver prestado servi'#231'os, por' +
                ' meio da Internet, para pessoas f'#237'sicas e jur'#237'dicas, residentes ' +
                'ou domiciliadas no Brasil ou no exterior, deve assinalar este ca' +
                'mpo. Ao assinalar este campo, s'#227'o disponibilizados os registros ' +
                'X400 (Com'#233'rcio Eletr'#244'nico e Tecnologia da Informa'#231#227'o) e X410 (Co' +
                'm'#233'rcio Eletr'#244'nico).'
              AutoSize = False
              BorderStyle = sbsSingle
              Caption = ' Com'#233'rcio eletr'#244'nico e tecnologia da informa'#231#227'o'
              TabOrder = 36
            end
            object lblIND_ROY_REC: TStaticText
              Left = 528
              Top = 101
              Width = 420
              Height = 24
              Hint = 
                'A pessoa jur'#237'dica que tiver recebido, durante o ano-calend'#225'rio, ' +
                'de pessoas f'#237'sicas ou jur'#237'dicas, residentes ou domiciliadas no B' +
                'rasil ou no exterior, rendimentos a t'#237'tulo de royalties relativo' +
                's a: explora'#231#227'o econ'#244'mica dos direitos patrimoniais do autor, de' +
                ' marcas, de patentes e de desenho industrial; explora'#231#227'o de know' +
                '-how; explora'#231#227'o de franquias e explora'#231#227'o dos direitos relativo' +
                's '#224' propriedade intelectual referente a cultivares, deve preench' +
                'er este campo com '#8220'Sim'#8221'.'
              AutoSize = False
              BorderStyle = sbsSingle
              Caption = ' Royalties recebidos do Brasil e do exterior'
              TabOrder = 37
            end
            object lblIND_ROY_PAG: TStaticText
              Left = 528
              Top = 124
              Width = 420
              Height = 24
              Hint = 
                'A pessoa jur'#237'dica que tiver efetuado pagamento ou remessa, duran' +
                'te o ano-calend'#225'rio, a pessoas f'#237'sicas ou jur'#237'dicas, residentes ' +
                'ou domiciliadas no Brasil ou no exterior, a t'#237'tulo de royalties ' +
                'relativos a: explora'#231#227'o econ'#244'mica dos direitos patrimoniais do a' +
                'utor, de marcas, de patentes e de desenho industrial; explora'#231#227'o' +
                ' de know-how; explora'#231#227'o de franquias e explora'#231#227'o dos direitos ' +
                'relativos '#224' propriedade intelectual referente a cultivares, deve' +
                ' preencher este campo com '#8220'Sim'#8221'.'
              AutoSize = False
              BorderStyle = sbsSingle
              Caption = ' Royalties pagos a benefici'#225'rios do Brasil e do exterior'
              TabOrder = 38
            end
            object lblIND_REND_SERV: TStaticText
              Left = 528
              Top = 147
              Width = 420
              Height = 35
              Hint = 
                'A pessoa jur'#237'dica que tiver recebido, durante o ano-calend'#225'rio, ' +
                'de pessoas f'#237'sicas ou jur'#237'dicas, residentes ou domiciliadas no B' +
                'rasil ou no exterior, rendimentos relativos a: servi'#231'os de assis' +
                't'#234'ncia t'#233'cnica, cient'#237'fica, administrativa e semelhantes que imp' +
                'liquem transfer'#234'ncia de tecnologia; servi'#231'os t'#233'cnicos e de assis' +
                't'#234'ncia que n'#227'o impliquem transfer'#234'ncia de tecnologia; juros sobr' +
                'e capital pr'#243'prio, bem como juros decorrentes de contratos de m'#250 +
                'tuo entre empresas ligadas e juros decorrentes de contratos de f' +
                'inanciamento; dividendos decorrentes de participa'#231#245'es em outras ' +
                'empresas, deve preencher este campo com '#8220'Sim'#8221'.'
              AutoSize = False
              BorderStyle = sbsSingle
              Caption = 
                ' Rendimentos relativos a servi'#231'os, juros e dividendos recebidos ' +
                'do Brasil       e do exterior'
              TabOrder = 39
            end
            object lblIND_INOV_TEC: TStaticText
              Left = 528
              Top = 215
              Width = 420
              Height = 24
              Hint = 
                'A pessoa jur'#237'dica benefici'#225'ria de incentivos fiscais relativos '#224 +
                's atividades de pesquisa tecnol'#243'gica e desenvolvimento de inova'#231 +
                #227'o tecnol'#243'gica de que tratam os arts. 17 a 26 da Lei n'#186' 11.196, ' +
                'de 21 de novembro de 2005, ou a pessoa jur'#237'dica executora dos pr' +
                'ogramas de desenvolvimento tecnol'#243'gico industrial ou agropecu'#225'ri' +
                'o (PDTI/PDTA) de que trata a Lei n'#186' 8.661, de 1993, aprovados at' +
                #233' 31 de dezembro de 2005, que n'#227'o tenha migrado para o regime es' +
                'tabelecido nos arts. 17 a 26 da Lei n'#186' 11.196, de 2005, deve pre' +
                'encher este campo com '#8220'Sim'#8221'.'
              AutoSize = False
              BorderStyle = sbsSingle
              Caption = ' Inova'#231#227'o tecnol'#243'gica e desenvolvimento tecnol'#243'gico'
              TabOrder = 40
            end
            object lblIND_ALIQ_CSLL: TStaticText
              Left = 8
              Top = 9
              Width = 420
              Height = 24
              Hint = 
                'Deve ser assinalado '#8220'Sim'#8221' no caso de pessoa jur'#237'dica de seguros ' +
                'privados, de pessoa jur'#237'dica de capitaliza'#231#227'o e de pessoa jur'#237'di' +
                'ca referida nos incisos I a VII, IX e X do '#167' 1'#186' do art. 1'#186' da Le' +
                'i Complementar n'#186' 105, de 10 de janeiro de 2001 e '#8220'N'#227'o'#8221' pelas de' +
                'mais.'
              AutoSize = False
              BorderStyle = sbsSingle
              Caption = ' PJ sujeita '#224' al'#237'quota da CSLL'
              TabOrder = 41
            end
            object lblIND_QTE_SCP: TStaticText
              Left = 8
              Top = 32
              Width = 420
              Height = 24
              Hint = 'Quantidade de SCP da PJ - S'#243'cio Ostensivo de SCP - Total de SCP'
              AutoSize = False
              BorderStyle = sbsSingle
              Caption = ' Quantidade de SCP da PJ (s'#243'cio ostensivo de SCP)'
              TabOrder = 42
            end
            object lblIND_ADM_FUN_CLU: TStaticText
              Left = 8
              Top = 55
              Width = 420
              Height = 24
              Hint = 'Administradora de fundos e clubes de investimento'
              AutoSize = False
              BorderStyle = sbsSingle
              Caption = ' Administradora de fundos e clubes de investimento'
              TabOrder = 43
            end
            object lblIND_PART_CONS: TStaticText
              Left = 8
              Top = 78
              Width = 420
              Height = 24
              Hint = 
                'A pessoa jur'#237'dica participante de cons'#243'rcio constitu'#237'do nos term' +
                'os do disposto nos arts. 278 e 279 da Lei n'#186' 6.404, de 15 de dez' +
                'embro de 1976, deve assinalar este campo. Aten'#231#227'o: Somente deve ' +
                'ser assinalado este campo quando houver receita de pelo menos um' +
                'a consorciada'
              AutoSize = False
              BorderStyle = sbsSingle
              Caption = ' Participa'#231#245'es em cons'#243'rcios de empresas'
              TabOrder = 44
            end
            object lblIND_CAP_INF: TStaticText
              Left = 528
              Top = 238
              Width = 420
              Height = 24
              Hint = 
                'A pessoa jur'#237'dica que tiver investido em atividades de pesquisa ' +
                'e desenvolvimento em tecnologia da informa'#231#227'o no '#226'mbito dos prog' +
                'ramas de capacita'#231#227'o e competitividade dos setores de inform'#225'tic' +
                'a e automa'#231#227'o e tecnologias da informa'#231#227'o de que trata a Lei n'#186' ' +
                '8.248, de 23 de outubro de 1991, a Lei n'#186' 10.176, de 11 de janei' +
                'ro de 2001, e a Lei n'#186' 11.077, de 30 de dezembro de 2004, regula' +
                'mentadas pelo Decreto n'#186' 5.906, de 26 de setembro de 2006, ou ti' +
                'ver efetuado venda a varejo nos termos dos arts. 28 a 30 da Lei ' +
                'n'#186' 11.196, de 2005, que disp'#245'em sobre o programa de inclus'#227'o dig' +
                'ital, deve preencher este campo com '#8220'Sim'#8221'.'
              AutoSize = False
              BorderStyle = sbsSingle
              Caption = ' Capacita'#231#227'o de inform'#225'tica e inclus'#227'o digital'
              TabOrder = 45
            end
            object lblIND_POLO_AM: TStaticText
              Left = 528
              Top = 309
              Width = 420
              Height = 24
              Hint = 
                'A pessoa jur'#237'dica que estiver localizada na '#225'rea de atua'#231#227'o da S' +
                'uperintend'#234'ncia da Zona Franca de Manaus (Suframa) que seja bene' +
                'fici'#225'ria dos incentivos de que trata o Decreto-lei n'#186' 288, de 28' +
                ' de fevereiro de 1967, e altera'#231#245'es posteriores; a Lei n'#186' 8.387,' +
                ' de 30 de dezembro de 1991, e altera'#231#245'es posteriores; ou o Decre' +
                'to-lei n'#186' 356, de 15 de agosto de 1968, e altera'#231#245'es posteriores' +
                ' (Amaz'#244'nia Ocidental), deve preencher este campo com '#8220'Sim'#8221'.'
              AutoSize = False
              BorderStyle = sbsSingle
              Caption = ' P'#243'lo Industrial de Manaus e Amaz'#244'nia Ocidental'
              TabOrder = 46
            end
            object lblIND_ZON_EXP: TStaticText
              Left = 528
              Top = 332
              Width = 420
              Height = 24
              Hint = 
                'A pessoa jur'#237'dica autorizada a operar em Zonas de Processamento ' +
                'de Exporta'#231#227'o, voltadas para a produ'#231#227'o de bens a serem comercia' +
                'lizados no exterior, de acordo com o estabelecido pela Lei n'#186' 11' +
                '.508, de 20 de julho de 2007 e pela Lei n'#186' 11.732, de 30 de junh' +
                'o de 2008, deve preencher este campo com '#8220'Sim'#8221'.'
              AutoSize = False
              BorderStyle = sbsSingle
              Caption = ' Zonas de Processamento de Exporta'#231#227'o'
              TabOrder = 47
            end
            object lblIND_AREA_COM: TStaticText
              Left = 528
              Top = 355
              Width = 420
              Height = 24
              Hint = 
                'A pessoa jur'#237'dica autorizada a operar nas '#193'reas de Livre Com'#233'rci' +
                'o de Boa Vista, Bonfim, Tabatinga, Macap'#225' e Santana, Brasil'#233'ia, ' +
                'Cruzeiro do Sul ou Guajar'#225'-Mirim, benefici'#225'ria dos incentivos de' +
                ' que tratam a Lei n'#186' 8.256, de 25 de novembro de 1991, a Lei n'#186' ' +
                '11.732, de 30 de junho de 2008, a Lei n'#186' 7.965, de 22 de dezembr' +
                'o de 1989, a Lei n'#186' 8.387, de 30 de dezembro de 1991, o Decreto ' +
                'n'#186' 517, de 8 de maio de 1992, a Lei n'#186' 8.857, de 8 de mar'#231'o de 1' +
                '994, e a Lei n'#186' 8.210, de 19 de julho de 1991, e altera'#231#245'es post' +
                'eriores, deve preencher este campo com '#8220'Sim'#8221'.'
              AutoSize = False
              BorderStyle = sbsSingle
              Caption = ' '#193'reas de Livre Com'#233'rcio'
              TabOrder = 48
            end
            object lblIND_OP_EXT: TStaticText
              Left = 8
              Top = 101
              Width = 420
              Height = 24
              Hint = 
                'A pessoa jur'#237'dica, inclusive institui'#231#227'o financeira ou companhia' +
                ' seguradora, conforme relacionadas no '#167' 1'#186' do art. 22 da Lei n'#186' ' +
                '8.212, de 1991, e no inciso II do art. 14 da Lei n'#186' 9.718, de 19' +
                '98, que realizou exporta'#231#227'o/importa'#231#227'o de bens, servi'#231'os ou dire' +
                'itos ou auferiu receitas financeiras ou incorreu em despesas fin' +
                'anceiras em opera'#231#245'es efetuadas com pessoa f'#237'sica ou jur'#237'dica re' +
                'sidente ou domiciliada no exterior, ainda que essas opera'#231#245'es n'#227 +
                'o tenham sido realizadas com pessoa vinculada ou com pessoa resi' +
                'dente ou domiciliada em pa'#237's ou depend'#234'ncia com tributa'#231#227'o favor' +
                'ecida ou cuja legisla'#231#227'o interna oponha sigilo relativo '#224' compos' +
                'i'#231#227'o societ'#225'ria de pessoas jur'#237'dicas ou a sua titularidade, deve' +
                ' assinalar este campo. Deve tamb'#233'm assinalar este campo a pessoa' +
                ' jur'#237'dica, inclusive institui'#231#227'o financeira ou companhia segurad' +
                'ora, que realizar as opera'#231#245'es acima referidas por interm'#233'dio de' +
                ' interposta pessoa.'
              AutoSize = False
              BorderStyle = sbsSingle
              Caption = ' Opera'#231#245'es com o exterior'
              TabOrder = 49
            end
            object lblIND_OP_VINC: TStaticText
              Left = 8
              Top = 124
              Width = 420
              Height = 24
              Hint = 
                'Deve assinalar este campo, a pessoa jur'#237'dica, inclusive institui' +
                #231#227'o financeira ou companhia seguradora, conforme relacionadas no' +
                ' '#167' 1'#186' do art. 22 da Lei n'#186' 8.212, de 1991, e no inciso II do art' +
                '. 14 da Lei n'#186' 9.718, de 1998, que realizou exporta'#231#227'o/importa'#231#227 +
                'o de bens, servi'#231'os ou direitos ou auferiu receitas financeiras ' +
                'ou incorreu em despesas financeiras em opera'#231#245'es efetuadas com p' +
                'essoa f'#237'sica ou jur'#237'dica residente ou domiciliada no exterior, c' +
                'onsiderada pela legisla'#231#227'o brasileira: a) pessoa vinculada; b) p' +
                'essoa residente ou domiciliada em pa'#237'ses com tributa'#231#227'o favoreci' +
                'da ou cuja legisla'#231#227'o interna oponha sigilo relativo '#224' composi'#231#227 +
                'o societ'#225'ria de pessoas jur'#237'dicas ou a sua titularidade; e c) a ' +
                'partir de 1'#186' de janeiro de 2009, pessoa residente ou domiciliada' +
                ' no exterior, que goze, nos termos da legisla'#231#227'o, de regime fisc' +
                'al privilegiado (Art. 24-A da Lei n'#186' 9.430, de 1996, institu'#237'do ' +
                'pela Lei n'#186' 11.727, de 2008). Deve tamb'#233'm assinalar este campo a' +
                ' pessoa jur'#237'dica, inclusive institui'#231#227'o financeira ou companhia ' +
                'seguradora, que realizar as opera'#231#245'es acima referidas por interm' +
                #233'dio de interposta pessoa.'
              AutoSize = False
              BorderStyle = sbsSingle
              Caption = ' Opera'#231#245'es com pessoa vinculada ou interposta pessoa'
              TabOrder = 50
            end
            object lblIND_PJ_ENQUAD: TStaticText
              Left = 8
              Top = 147
              Width = 420
              Height = 24
              Hint = 'PJ enquadrada nos artigos 48 ou 49 da IN RFB n'#186' 1.312/2012'
              AutoSize = False
              BorderStyle = sbsSingle
              Caption = ' PJ enquadrada nos artigos 48 ou 49 da IN RFB n'#186' 1.312/2012'
              TabOrder = 51
            end
            object lblIND_PART_EXT: TStaticText
              Left = 8
              Top = 170
              Width = 420
              Height = 24
              Hint = 
                'A pessoa jur'#237'dica deve assinalar este campo, caso tenha particip' +
                'a'#231#245'es no exterior'
              AutoSize = False
              BorderStyle = sbsSingle
              Caption = ' Participa'#231#245'es no exterior'
              TabOrder = 52
            end
            object lblIND_ATIV_RURAL: TStaticText
              Left = 8
              Top = 193
              Width = 420
              Height = 24
              Hint = 
                'A pessoa jur'#237'dica deve assinalar este campo, caso explore ativid' +
                'ade rural'
              AutoSize = False
              BorderStyle = sbsSingle
              Caption = ' Atividade rural'
              TabOrder = 53
            end
            object lblIND_LUC_EXP: TStaticText
              Left = 8
              Top = 216
              Width = 420
              Height = 24
              Hint = 
                'Este campo deve ser assinalado pelas pessoas jur'#237'dicas que adota' +
                'm a forma de tributa'#231#227'o pelo lucro real, inclusive se optantes p' +
                'elo Refis, que gozem de benef'#237'cios fiscais calculados com base n' +
                'o lucro da explora'#231#227'o.'
              AutoSize = False
              BorderStyle = sbsSingle
              Caption = ' Exist'#234'ncia de lucro da explora'#231#227'o'
              TabOrder = 54
            end
            object lblIND_RED_ISEN: TStaticText
              Left = 8
              Top = 239
              Width = 420
              Height = 24
              Hint = 
                'A pessoa jur'#237'dica tributada pelo lucro presumido e optante pelo ' +
                'Refis deve assinalar este campo caso usufrua benef'#237'cios fiscais ' +
                'relativos a isen'#231#227'o ou redu'#231#227'o do imposto de renda.'
              AutoSize = False
              BorderStyle = sbsSingle
              Caption = ' Isen'#231#227'o e redu'#231#227'o do imposto para lucro presumido'
              TabOrder = 55
            end
            object lblIND_FIN: TStaticText
              Left = 8
              Top = 262
              Width = 420
              Height = 24
              AutoSize = False
              BorderStyle = sbsSingle
              Caption = ' Exist'#234'ncia de FINOR/FINAM/FUNRES'
              TabOrder = 56
            end
            object lblIND_DOA_ELEIT: TStaticText
              Left = 8
              Top = 285
              Width = 420
              Height = 24
              Hint = 
                'A pessoa jur'#237'dica deve assinalar este campo, caso tenha efetuado' +
                ', durante o ano-calend'#225'rio, doa'#231#245'es a candidatos, comit'#234's financ' +
                'eiros e partidos pol'#237'ticos, ainda que na forma de fornecimento d' +
                'e mercadorias ou presta'#231#227'o de servi'#231'os para campanhas eleitorais' +
                '.'
              AutoSize = False
              BorderStyle = sbsSingle
              Caption = ' Doa'#231#245'es a campanhas eleitorais'
              TabOrder = 57
            end
            object lblIND_PART_COLIG: TStaticText
              Left = 8
              Top = 308
              Width = 420
              Height = 24
              Hint = 
                'A pessoa jur'#237'dica domiciliada no Brasil, que teve participa'#231#245'es ' +
                'permanentes, no ano-calend'#225'rio, em capital de pessoa jur'#237'dica do' +
                'miciliada no Brasil ou no exterior, considerada, pela legisla'#231#227'o' +
                ' brasileira, avaliada pelo m'#233'todo de equival'#234'ncia patrimonial, d' +
                'eve assinalar este campo.'
              AutoSize = False
              BorderStyle = sbsSingle
              Caption = ' Participa'#231#227'o avaliada pelo m'#233'todo de equival'#234'ncia patrimonial'
              TabOrder = 58
            end
            object lblIND_REC_EXT: TStaticText
              Left = 8
              Top = 365
              Width = 420
              Height = 24
              Hint = 
                'Deve assinalar este campo, a pessoa jur'#237'dica que recebeu, durant' +
                'e o ano-calend'#225'rio, de pessoas f'#237'sicas ou jur'#237'dicas, residentes ' +
                'ou domiciliadas no exterior ou de n'#227'o-residentes: a) quaisquer v' +
                'alores mediante opera'#231#245'es de c'#226'mbio de qualquer natureza; b) qua' +
                'isquer valores por interm'#233'dio de transfer'#234'ncias internacionais e' +
                'm reais (TIR), ou seja, provenientes de conta banc'#225'ria em reais ' +
                '(R$) titulada por n'#227'o-residente; c) valores iguais ou superiores' +
                ' a R$ 120.000,00 (cento e vinte mil reais), equivalentes a R$ 10' +
                '.000,00 por m'#234's, por interm'#233'dio de cart'#245'es de cr'#233'dito; d) quaisq' +
                'uer valores por interm'#233'dio de dep'#243'sitos em contas banc'#225'rias mant' +
                'idas no exterior.'
              AutoSize = False
              BorderStyle = sbsSingle
              Caption = ' Recebimentos do exterior ou de n'#227'o residentes'
              TabOrder = 59
            end
            object lblIND_ATIV_EXT: TStaticText
              Left = 528
              Top = 9
              Width = 420
              Height = 24
              Hint = 
                'Preenchida por todas as pessoas jur'#237'dicas (Sim), salvo quando o ' +
                'valor cont'#225'bil total dos ativos a declarar, convertido para Reai' +
                's no final do per'#237'odo abrangido pela ECF, for inferior a R$ 100.' +
                '000,00 (cem mil reais) (N'#227'o).'
              AutoSize = False
              BorderStyle = sbsSingle
              Caption = ' Ativos no exterior'
              TabOrder = 60
            end
            object StaticText1: TStaticText
              Left = 528
              Top = 378
              Width = 476
              Height = 23
              Hint = 
                'A pessoa jur'#237'dica autorizada a operar nas '#193'reas de Livre Com'#233'rci' +
                'o de Boa Vista, Bonfim, Tabatinga, Macap'#225' e Santana, Brasil'#233'ia, ' +
                'Cruzeiro do Sul ou Guajar'#225'-Mirim, benefici'#225'ria dos incentivos de' +
                ' que tratam a Lei n'#186' 8.256, de 25 de novembro de 1991, a Lei n'#186' ' +
                '11.732, de 30 de junho de 2008, a Lei n'#186' 7.965, de 22 de dezembr' +
                'o de 1989, a Lei n'#186' 8.387, de 30 de dezembro de 1991, o Decreto ' +
                'n'#186' 517, de 8 de maio de 1992, a Lei n'#186' 8.857, de 8 de mar'#231'o de 1' +
                '994, e a Lei n'#186' 8.210, de 19 de julho de 1991, e altera'#231#245'es post' +
                'eriores, deve preencher este campo com '#8220'Sim'#8221'.'
              AutoSize = False
              BorderStyle = sbsSingle
              Caption = 'Pessoa Jur'#237'dica '#233' integrante de grupo multinacional'
              TabOrder = 61
            end
            object DBMaplistCombobox2: TDBMaplistCombobox
              Left = 946
              Top = 377
              Width = 60
              Height = 23
              Hint = 
                'A pessoa jur'#237'dica autorizada a operar nas '#193'reas de Livre Com'#233'rci' +
                'o de Boa Vista, Bonfim, Tabatinga, Macap'#225' e Santana, Brasil'#233'ia, ' +
                'Cruzeiro do Sul ou Guajar'#225'-Mirim, benefici'#225'ria dos incentivos de' +
                ' que tratam a Lei n'#186' 8.256, de 25 de novembro de 1991, a Lei n'#186' ' +
                '11.732, de 30 de junho de 2008, a Lei n'#186' 7.965, de 22 de dezembr' +
                'o de 1989, a Lei n'#186' 8.387, de 30 de dezembro de 1991, o Decreto ' +
                'n'#186' 517, de 8 de maio de 1992, a Lei n'#186' 8.857, de 8 de mar'#231'o de 1' +
                '994, e a Lei n'#186' 8.210, de 19 de julho de 1991, e altera'#231#245'es post' +
                'eriores, deve preencher este campo com '#8220'Sim'#8221'.'
              Style = csDropDownList
              DataField = 'ind_pais_a_pais'
              DataSource = dtmCadastrosInternos.dsrFiliais
              ItemHeight = 15
              Items.Strings = (
                'Sim'
                'N'#227'o')
              TabOrder = 30
              ItemValues.Strings = (
                'S'
                'N')
            end
          end
        end
      end
      object tstSpedReinf: TTabSheet
        Caption = '&6 - SPED REINF'
        ImageIndex = 6
        object pgcReinf: TPageControl
          Left = 0
          Top = 0
          Width = 1027
          Height = 529
          ActivePage = tstDadosReinf
          Align = alClient
          TabOrder = 0
          OnChange = pgcReinfChange
          object tstDadosReinf: TTabSheet
            Caption = 'Dados Reinf'
            object lblClassificacaoTributaria: TStaticText
              Left = 0
              Top = 106
              Width = 171
              Height = 23
              Hint = 'Classifica'#231#227'o Tribut'#225'ria'
              AutoSize = False
              BorderStyle = sbsSingle
              Caption = ' Classifica'#231#227'o Tribut'#225'ria'
              TabOrder = 0
            end
            object StaticText3: TStaticText
              Left = 0
              Top = 2
              Width = 171
              Height = 24
              AutoSize = False
              BorderStyle = sbsSingle
              Caption = ' In'#237'cio da Validade'
              TabOrder = 1
            end
            object DBMClassificacaoTributaria: TDBMaplistCombobox
              Left = 170
              Top = 105
              Width = 849
              Height = 23
              Hint = 'Classifica'#231#227'o Tribut'#225'ria'
              Style = csDropDownList
              DataField = 'classificacaotributaria'
              DataSource = dtmCadastrosInternos.dsrFiliais
              ItemHeight = 15
              Items.Strings = (
                
                  '01 Empresa enquadrada no regime de tributa'#231#227'o Simples Nacional c' +
                  'om tributa'#231#227'o previdenci'#225'ria substitu'#237'da'
                
                  '02 Empresa enquadrada no regime de tributa'#231#227'o Simples Nacional c' +
                  'om tributa'#231#227'o previdenci'#225'ria n'#227'o substitu'#237'da'
                
                  '03 Empresa enquadrada no regime de tributa'#231#227'o Simples Nacional c' +
                  'om tributa'#231#227'o previdenci'#225'ria substitu'#237'da e n'#227'o substitu'#237'da'
                '04 MEI - Micro Empreendedor Individual'
                '06 Agroind'#250'stria'
                '07 Produtor Rural Pessoa Jur'#237'dica'
                '08 Cons'#243'rcio Simplificado de Produtores Rurais'
                '09 '#211'rg'#227'o Gestor de M'#227'o de Obra'
                '10 Entidade Sindical a que se refere a Lei 12.023/2009'
                
                  '11 Associa'#231#227'o Desportiva que mant'#233'm Clube de Futebol Profissiona' +
                  'l'
                
                  '13 Banco, caixa econ'#244'mica, sociedade de cr'#233'dito, financiamento e' +
                  ' investimento e demais empresas relacionadas no par'#225'grafo 1'#186' do ' +
                  'art. 22 da Lei 8.212./91'
                
                  '14 Sindicatos em geral, exceto aquele classificado no c'#243'digo [10' +
                  ']'
                '21 Pessoa F'#237'sica, exceto Segurado Especial'
                '22 Segurado Especial'
                
                  '60 Miss'#227'o Diplom'#225'tica ou Reparti'#231#227'o Consular de carreira estrang' +
                  'eira'
                '70 Empresa de que trata o Decreto 5.436/2005'
                '80 Entidade Imune ou Isenta'
                
                  '85 Ente Federativo, '#211'rg'#227'os da Uni'#227'o, Autarquias e Funda'#231#245'es P'#250'bl' +
                  'icas'
                '99 Pessoas Jur'#237'dicas em Geral')
              TabOrder = 2
              OnDropDown = DBCBtip_esc_preDropDown
              ItemValues.Strings = (
                '01'
                '02'
                '03'
                '04'
                '06'
                '07'
                '08'
                '09'
                '10'
                '11'
                '13'
                '14'
                '21'
                '22'
                '60'
                '70'
                '80'
                '85'
                '99')
            end
            object edtInicioalidadeReinf: TDBEditData
              Left = 170
              Top = 2
              Width = 87
              Height = 23
              Alignment = taCenter
              DataField = 'iniciovalidadereinf'
              DataSource = dtmCadastrosInternos.dsrFiliais
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
              TabOrder = 3
              Opcional = True
            end
            object stxObirgatoriedadedaECD: TStaticText
              Left = 0
              Top = 54
              Width = 171
              Height = 24
              Hint = 
                'Indicativo da obrigatoriedade do contribuinte em fazer a sua esc' +
                'ritura'#231#227'o cont'#225'bil na ECD Escritura'#231#227'o Cont'#225'bil Digital'
              AutoSize = False
              BorderStyle = sbsSingle
              Caption = ' Obrigatoriedade da ECD'
              TabOrder = 4
            end
            object DBMObrigatoriedadedaECD: TDBMaplistCombobox
              Left = 170
              Top = 54
              Width = 87
              Height = 23
              Hint = 'Classifica'#231#227'o Tribut'#225'ria'
              Style = csDropDownList
              DataField = 'indEscrituracao'
              DataSource = dtmCadastrosInternos.dsrFiliais
              ItemHeight = 15
              Items.Strings = (
                'Sim'
                'N'#227'o')
              TabOrder = 5
              OnDropDown = DBCBtip_esc_preDropDown
              ItemValues.Strings = (
                '1'
                '0')
            end
            object stxIindDesoneracao: TStaticText
              Left = 0
              Top = 131
              Width = 171
              Height = 31
              Hint = 'Indicativo de desonera'#231#227'o da folha pela CPRB'
              AutoSize = False
              BorderStyle = sbsSingle
              Caption = ' Indicativo de desonera'#231#227'o da folha pela CPRB'
              TabOrder = 6
            end
            object DBMindDesoneracao: TDBMaplistCombobox
              Left = 171
              Top = 139
              Width = 750
              Height = 23
              Hint = 'Indicativo de desonera'#231#227'o da folha pela CPRB'
              Style = csDropDownList
              DataField = 'inddesoneracao'
              DataSource = dtmCadastrosInternos.dsrFiliais
              ItemHeight = 15
              Items.Strings = (
                '0 - N'#227'o Aplic'#225'vel'
                
                  '1 - Empresa enquadrada nos termos da Lei 12.546/2011 e altera'#231#245'e' +
                  's')
              TabOrder = 7
              OnDropDown = DBCBtip_esc_preDropDown
              ItemValues.Strings = (
                '0'
                '1')
            end
            object stxindAcordoIsenMulta: TStaticText
              Left = 0
              Top = 164
              Width = 171
              Height = 49
              Hint = 
                'Indicativo da exist'#234'ncia de acordo internacional para isen'#231#227'o de' +
                ' multa'
              AutoSize = False
              BorderStyle = sbsSingle
              Caption = 
                ' Indicativo da exist'#234'ncia de acordo internacional para isen'#231#227'o d' +
                'e multa'
              TabOrder = 8
            end
            object DBMaplistCombobox3: TDBMaplistCombobox
              Left = 170
              Top = 190
              Width = 622
              Height = 23
              Hint = 
                'Indicativo da exist'#234'ncia de acordo internacional para isen'#231#227'o de' +
                ' multa:'
              Style = csDropDownList
              DataField = 'indAcordoIsenMulta'
              DataSource = dtmCadastrosInternos.dsrFiliais
              ItemHeight = 15
              Items.Strings = (
                '0 - Sem acordo'
                '1 - Com acordo')
              TabOrder = 9
              OnDropDown = DBCBtip_esc_preDropDown
              ItemValues.Strings = (
                '0'
                '1')
            end
            object stxindSitPJ: TStaticText
              Left = 0
              Top = 80
              Width = 171
              Height = 24
              Hint = 'Situa'#231#227'o da Pessoa Jur'#237'dica'
              AutoSize = False
              BorderStyle = sbsSingle
              Caption = ' Situa'#231#227'o da Pessoa Jur'#237'dica'
              TabOrder = 10
            end
            object DBMaplistCombobox4: TDBMaplistCombobox
              Left = 170
              Top = 80
              Width = 186
              Height = 23
              Hint = 'Classifica'#231#227'o Tribut'#225'ria'
              Style = csDropDownList
              DataField = 'indSitPJ'
              DataSource = dtmCadastrosInternos.dsrFiliais
              ItemHeight = 15
              Items.Strings = (
                '0 - Situa'#231#227'o Normal'
                '1 - Extin'#231#227'o'
                '2 - Fus'#227'o'
                '3 - Cis'#227'o'
                '4 - Incorpora'#231#227'o')
              TabOrder = 11
              OnDropDown = DBCBtip_esc_preDropDown
              ItemValues.Strings = (
                '0'
                '1'
                '2'
                '3'
                '4')
            end
            object StaticText4: TStaticText
              Left = 0
              Top = 28
              Width = 171
              Height = 24
              AutoSize = False
              BorderStyle = sbsSingle
              Caption = ' Final da Validade'
              TabOrder = 12
            end
            object DBEditData1: TDBEditData
              Left = 170
              Top = 28
              Width = 87
              Height = 23
              Alignment = taCenter
              DataField = 'finalvalidadereinf'
              DataSource = dtmCadastrosInternos.dsrFiliais
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
              TabOrder = 13
              Opcional = True
            end
            object DBAdvEdit2: TDBAdvEdit
              Left = 720
              Top = 0
              Width = 241
              Height = 19
              TabStop = False
              EmptyText = ' '
              FocusColor = clBtnFace
              DisabledColor = clBtnFace
              LabelPosition = lpTopLeft
              LabelTransparent = True
              LabelAlwaysEnabled = True
              LabelFont.Charset = DEFAULT_CHARSET
              LabelFont.Color = clWindowText
              LabelFont.Height = -11
              LabelFont.Name = 'MS Sans Serif'
              LabelFont.Style = []
              Lookup.Separator = ';'
              BorderStyle = bsNone
              Color = clBtnFace
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Pitch = fpVariable
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 14
              Visible = True
              Version = '2.9.3.1'
              DataField = 'sdatahoraalteracao'
              DataSource = dtmCadastrosInternos.dsrFiliais
            end
            object gbxObras_Fornecedores: TGroupBox
              Left = 0
              Top = 216
              Width = 937
              Height = 145
              Caption = 'CNO - Cadastro Nacional de Obras'
              TabOrder = 15
              object pnlOpcoesObras_Fornecedoes: TPanel
                Left = 904
                Top = 17
                Width = 31
                Height = 126
                Align = alRight
                TabOrder = 0
                object btnIncluirObras_Fornecedores: TSpeedButton
                  Left = 4
                  Top = 20
                  Width = 23
                  Height = 22
                  Hint = 'Incluir Obras Fornecedores'
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
                  OnClick = btnIncluirObras_FornecedoresClick
                end
                object btnExcluirObras_Fornecedores: TSpeedButton
                  Left = 4
                  Top = 42
                  Width = 23
                  Height = 22
                  Hint = 'Excluir Obras Fornecedores'
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
                  OnClick = btnExcluirObras_FornecedoresClick
                end
              end
              object dbgObras_Filiais: TDBAdvGrid
                Left = 2
                Top = 17
                Width = 902
                Height = 126
                Cursor = crDefault
                Align = alClient
                ColCount = 3
                RowCount = 2
                FixedRows = 1
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Pitch = fpVariable
                Font.Style = []
                Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goTabs]
                ParentFont = False
                ScrollBars = ssBoth
                TabOrder = 1
                OnCanAddRow = dbgObras_FiliaisCanAddRow
                ActiveCellFont.Charset = DEFAULT_CHARSET
                ActiveCellFont.Color = clWindowText
                ActiveCellFont.Height = -11
                ActiveCellFont.Name = 'Tahoma'
                ActiveCellFont.Style = [fsBold]
                AutoNumAlign = True
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
                EnhRowColMove = False
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
                Navigation.AllowInsertRow = True
                Navigation.AdvanceOnEnterLoop = False
                Navigation.AdvanceInsert = True
                Navigation.InsertPosition = pInsertAfter
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
                    FieldName = 'cno'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -12
                    Font.Name = 'Tahoma'
                    Font.Pitch = fpVariable
                    Font.Style = []
                    Header = 'Nr'#186' do CNO'
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
                    Width = 210
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
                    Font.Height = -12
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
                    Width = 641
                  end>
                DataSource = dtmCadastrosInternos.dsrObras_Filiais
                EditPostMode = epRow
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
                UseDBFieldWidths = True
                PostOnEnter = True
                ColWidths = (
                  20
                  210
                  641)
              end
            end
            object gbxinfoProcRetPr: TGroupBox
              Left = 0
              Top = 360
              Width = 470
              Height = 139
              Caption = 
                'Processos relacionados a n'#227'o reten'#231#227'o de contribui'#231#227'o previdenci' +
                #225'ria'
              TabOrder = 16
              inline fraConsultaProcessoJudicialReinf: TfraConsultaCodigoContabil
                Left = 6
                Top = 20
                Width = 203
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
                TabOrder = 1
                inherited sbnProcura: TSpeedButton
                  Left = 176
                end
                inherited dtxDescricao: TtecDBText
                  Left = 208
                  Width = 345
                end
                inherited edfCodigo: TtecDBFindLookup
                  Width = 177
                  DataaFieldInterno = 'processojudicial'
                  DataaFieldVisual = 'nrproc'
                  DataField = 'nrproc'
                  DataSource = dtmCadastrosInternos.dsrfornecedor_infoProcRetPr
                  LookupaFieldinterno = 'numero'
                  LookupaFieldVisual = 'nrproc'
                  LookupField = 'nrproc'
                  LookupSource = fraConsultaProcessoJudicialReinf.dsrProcuraProcessoJudicialReinf
                  LookupQueryParameter = 'nrproc'
                  Parameter = ' '
                  ActiveSetControls = False
                  DenyInsert = True
                  NoSetControls = <>
                  SetControls = <>
                  LookupParameter = 'nrproc'
                end
              end
              inline fraConsultaSuspensaoExibilidadeTributos: TfraConsultaCodigoContabil
                Left = 211
                Top = 46
                Width = 187
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
                TabOrder = 2
                inherited sbnProcura: TSpeedButton
                  Left = 162
                end
                inherited dtxDescricao: TtecDBText
                  Left = 184
                  Width = 345
                end
                inherited edfCodigo: TtecDBFindLookup
                  Width = 163
                  DataaFieldInterno = 'numerosuspensaoexibilidadetributos'
                  DataaFieldVisual = 'codsusp'
                  DataField = 'codsusp'
                  DataSource = dtmCadastrosInternos.dsrfornecedor_infoProcRetPr
                  LookupaFieldinterno = 'numero'
                  LookupaFieldVisual = 'codsusp'
                  LookupField = 'codsusp'
                  LookupSource = fraConsultaSuspensaoExibilidadeTributos.dsrProcuraSuspensaoExibilidadeTributos
                  LookupQueryParameter = 'codSusp'
                  Parameter = ' '
                  ActiveSetControls = False
                  DenyInsert = True
                  NoSetControls = <>
                  SetControls = <>
                  LookupParameter = 'codSusp'
                end
              end
              object dbgfornecedor_infoProcRetPr: TDBAdvGrid
                Left = 2
                Top = 17
                Width = 466
                Height = 120
                Cursor = crDefault
                Align = alClient
                ColCount = 3
                RowCount = 2
                FixedRows = 1
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Pitch = fpVariable
                Font.Style = []
                Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goTabs]
                ParentFont = False
                ScrollBars = ssBoth
                TabOrder = 0
                OnCanAddRow = dbgfornecedor_infoProcRetPrCanAddRow
                ActiveCellFont.Charset = DEFAULT_CHARSET
                ActiveCellFont.Color = clWindowText
                ActiveCellFont.Height = -11
                ActiveCellFont.Name = 'Tahoma'
                ActiveCellFont.Style = [fsBold]
                AutoNumAlign = True
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
                EnhRowColMove = False
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
                Navigation.AllowInsertRow = True
                Navigation.AdvanceOnEnterLoop = False
                Navigation.AdvanceInsert = True
                Navigation.InsertPosition = pInsertAfter
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
                    EditLink = fcelConsultaProcessoJudicialReinf
                    Editor = edCustom
                    FieldName = 'nrproc'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -12
                    Font.Name = 'Tahoma'
                    Font.Pitch = fpVariable
                    Font.Style = []
                    Header = 'Nr'#186' do Processo'
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
                    Width = 202
                  end
                  item
                    Borders = []
                    BorderPen.Color = clSilver
                    CheckFalse = 'N'
                    CheckTrue = 'Y'
                    Color = clWindow
                    EditLink = fcelConsultaSuspensaoExibilidadeTributos
                    Editor = edCustom
                    FieldName = 'codsusp'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -12
                    Font.Name = 'Tahoma'
                    Font.Pitch = fpVariable
                    Font.Style = []
                    Header = 'C'#243'digo da Suspens'#227'o'
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
                    Width = 187
                  end>
                DataSource = dtmCadastrosInternos.dsrfornecedor_infoProcRetPr
                EditPostMode = epRow
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
                UseDBFieldWidths = True
                PostOnEnter = True
                ColWidths = (
                  20
                  202
                  187)
                object pnlfornecedor_infoProcRetPr: TPanel
                  Left = 414
                  Top = 0
                  Width = 31
                  Height = 99
                  Align = alRight
                  TabOrder = 2
                  object btnIncluirfornecedor_infoProcRetPr: TSpeedButton
                    Left = 4
                    Top = 20
                    Width = 23
                    Height = 22
                    Hint = 'Incluir Obras Fornecedores'
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
                    OnClick = btnIncluirfornecedor_infoProcRetPrClick
                  end
                  object btnExcluirfornecedor_infoProcRetPr: TSpeedButton
                    Left = 4
                    Top = 42
                    Width = 23
                    Height = 22
                    Hint = 'Excluir Obras Fornecedores'
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
                    OnClick = btnExcluirfornecedor_infoProcRetPrClick
                  end
                end
              end
            end
            object gbxinfoProcRetAd: TGroupBox
              Left = 472
              Top = 360
              Width = 466
              Height = 139
              Caption = 
                'Processos relacionados a n'#227'o reten'#231#227'o de contribui'#231#227'o previdenci' +
                #225'ria adicional'
              TabOrder = 17
              inline fraConsultaProcessoJudicialReinf_Ad: TfraConsultaCodigoContabil
                Left = 6
                Top = 20
                Width = 203
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
                TabOrder = 1
                inherited sbnProcura: TSpeedButton
                  Left = 176
                end
                inherited dtxDescricao: TtecDBText
                  Left = 208
                  Width = 345
                end
                inherited edfCodigo: TtecDBFindLookup
                  Width = 177
                  DataaFieldInterno = 'processojudicial'
                  DataaFieldVisual = 'nrproc'
                  DataField = 'nrproc'
                  DataSource = dtmCadastrosInternos.dsrfornecedor_infoProcRetAd
                  LookupaFieldinterno = 'numero'
                  LookupaFieldVisual = 'nrproc'
                  LookupField = 'nrproc'
                  LookupSource = fraConsultaProcessoJudicialReinf.dsrProcuraProcessoJudicialReinf
                  LookupQueryParameter = 'nrproc'
                  Parameter = ' '
                  ActiveSetControls = False
                  DenyInsert = True
                  NoSetControls = <>
                  SetControls = <>
                  LookupParameter = 'nrproc'
                end
              end
              inline fraConsultaSuspensaoExibilidadeTributos_Ad: TfraConsultaCodigoContabil
                Left = 211
                Top = 46
                Width = 187
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
                TabOrder = 2
                inherited sbnProcura: TSpeedButton
                  Left = 162
                end
                inherited dtxDescricao: TtecDBText
                  Left = 184
                  Width = 345
                end
                inherited edfCodigo: TtecDBFindLookup
                  Width = 163
                  DataaFieldInterno = 'numerosuspensaoexibilidadetributos'
                  DataaFieldVisual = 'codsusp'
                  DataField = 'codsusp'
                  DataSource = dtmCadastrosInternos.dsrfornecedor_infoProcRetAd
                  LookupaFieldinterno = 'numero'
                  LookupaFieldVisual = 'codsusp'
                  LookupField = 'codsusp'
                  LookupSource = fraConsultaSuspensaoExibilidadeTributos.dsrProcuraSuspensaoExibilidadeTributos
                  LookupQueryParameter = 'codSusp'
                  Parameter = ' '
                  ActiveSetControls = False
                  DenyInsert = True
                  NoSetControls = <>
                  SetControls = <>
                  LookupParameter = 'codSusp'
                end
              end
              object dbgfornecedor_infoProcRetPrAd: TDBAdvGrid
                Left = 2
                Top = 17
                Width = 462
                Height = 120
                Cursor = crDefault
                Align = alClient
                ColCount = 3
                RowCount = 2
                FixedRows = 1
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Pitch = fpVariable
                Font.Style = []
                Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goTabs]
                ParentFont = False
                ScrollBars = ssBoth
                TabOrder = 0
                OnCanAddRow = dbgfornecedor_infoProcRetPrAdCanAddRow
                ActiveCellFont.Charset = DEFAULT_CHARSET
                ActiveCellFont.Color = clWindowText
                ActiveCellFont.Height = -11
                ActiveCellFont.Name = 'Tahoma'
                ActiveCellFont.Style = [fsBold]
                AutoNumAlign = True
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
                EnhRowColMove = False
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
                Navigation.AllowInsertRow = True
                Navigation.AdvanceOnEnterLoop = False
                Navigation.AdvanceInsert = True
                Navigation.InsertPosition = pInsertAfter
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
                    EditLink = fcelConsultaProcessoJudicialReinf_Ad
                    Editor = edCustom
                    FieldName = 'nrproc'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -12
                    Font.Name = 'Tahoma'
                    Font.Pitch = fpVariable
                    Font.Style = []
                    Header = 'Nr'#186' do Processo'
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
                    Width = 202
                  end
                  item
                    Borders = []
                    BorderPen.Color = clSilver
                    CheckFalse = 'N'
                    CheckTrue = 'Y'
                    Color = clWindow
                    EditLink = fcelConsultaSuspensaoExibilidadeTributos_Ad
                    Editor = edCustom
                    FieldName = 'codsusp'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -12
                    Font.Name = 'Tahoma'
                    Font.Pitch = fpVariable
                    Font.Style = []
                    Header = 'C'#243'digo da Suspens'#227'o'
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
                    Width = 187
                  end>
                DataSource = dtmCadastrosInternos.dsrfornecedor_infoProcRetAd
                EditPostMode = epRow
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
                UseDBFieldWidths = True
                PostOnEnter = True
                ColWidths = (
                  20
                  202
                  187)
                object pnlfornecedor_infoProcRetPrAd: TPanel
                  Left = 410
                  Top = 0
                  Width = 31
                  Height = 99
                  Align = alRight
                  TabOrder = 2
                  object btnIncluirfornecedor_infoProcRetPrAd: TSpeedButton
                    Left = 4
                    Top = 20
                    Width = 23
                    Height = 22
                    Hint = 'Incluir Obras Fornecedores'
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
                    OnClick = btnIncluirfornecedor_infoProcRetPrAdClick
                  end
                  object btnExcluirfornecedor_infoProcRetPrAd: TSpeedButton
                    Left = 4
                    Top = 42
                    Width = 23
                    Height = 22
                    Hint = 'Excluir Obras Fornecedores'
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
                    OnClick = btnExcluirfornecedor_infoProcRetPrAdClick
                  end
                end
              end
            end
          end
          object tstEnvioReinf: TTabSheet
            Caption = 'Dados enviados Reinf'
            ImageIndex = 1
            object dbgDadosReinf: TDBAdvGrid
              Left = 0
              Top = 0
              Width = 1019
              Height = 499
              Cursor = crDefault
              Align = alClient
              ColCount = 16
              RowCount = 2
              FixedRows = 1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              ScrollBars = ssBoth
              TabOrder = 0
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
                  FieldName = 'datahoraprocessamento'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = 'Tahoma'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  Header = 'Data/Hora Processamento'
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
                  Width = 139
                end
                item
                  Borders = []
                  BorderPen.Color = clSilver
                  CheckFalse = 'N'
                  CheckTrue = 'Y'
                  Color = clWindow
                  EditLength = 50
                  FieldName = 's_operacao'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = 'Tahoma'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  Header = 'Opera'#231#227'o'
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
                  Width = 84
                end
                item
                  Borders = []
                  BorderPen.Color = clSilver
                  CheckFalse = 'N'
                  CheckTrue = 'Y'
                  Color = clWindow
                  EditLength = 2
                  FieldName = 'classificacaotributaria'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = 'Tahoma'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  Header = 'Class. Tribut.'
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
                  Width = 71
                end
                item
                  Alignment = taCenter
                  Borders = []
                  BorderPen.Color = clSilver
                  CheckFalse = 'N'
                  CheckTrue = 'Y'
                  Color = clWindow
                  EditMask = '99/99/9999;1; '
                  FieldName = 'iniciovalidadereinf'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = 'Tahoma'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  Header = 'Validade Inicial'
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
                  Width = 79
                end
                item
                  Alignment = taCenter
                  Borders = []
                  BorderPen.Color = clSilver
                  CheckFalse = 'N'
                  CheckTrue = 'Y'
                  Color = clWindow
                  EditMask = '99/99/9999;1; '
                  FieldName = 'finalvalidadereinf'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = 'Tahoma'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  Header = 'Validade Final'
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
                  Width = 78
                end
                item
                  Alignment = taRightJustify
                  Borders = []
                  BorderPen.Color = clSilver
                  CheckFalse = 'N'
                  CheckTrue = 'Y'
                  Color = clWindow
                  FieldName = 'inddesoneracao'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = 'Tahoma'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  Header = 'Desonera'#231#227'o'
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
                  Width = 73
                end
                item
                  Alignment = taRightJustify
                  Borders = []
                  BorderPen.Color = clSilver
                  CheckFalse = 'N'
                  CheckTrue = 'Y'
                  Color = clWindow
                  FieldName = 'indacordoisenmulta'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = 'Tahoma'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  Header = 'Isen'#231#227'o de Multa'
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
                  Width = 93
                end
                item
                  Alignment = taRightJustify
                  Borders = []
                  BorderPen.Color = clSilver
                  CheckFalse = 'N'
                  CheckTrue = 'Y'
                  Color = clWindow
                  FieldName = 'indsitpj'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = 'Tahoma'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  Header = 'Sit. PJ'
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
                  Width = 46
                end
                item
                  Alignment = taRightJustify
                  Borders = []
                  BorderPen.Color = clSilver
                  CheckFalse = 'N'
                  CheckTrue = 'Y'
                  Color = clWindow
                  FieldName = 'indescrituracao'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = 'Tahoma'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  Header = 'ECD'
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
                  Width = 31
                end
                item
                  Borders = []
                  BorderPen.Color = clSilver
                  CheckFalse = 'N'
                  CheckTrue = 'Y'
                  Color = clWindow
                  EditLength = 70
                  FieldName = 'nmctt'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = 'Tahoma'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  Header = 'Nome do Contato'
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
                  Width = 99
                end
                item
                  Borders = []
                  BorderPen.Color = clSilver
                  CheckFalse = 'N'
                  CheckTrue = 'Y'
                  Color = clWindow
                  EditLength = 11
                  FieldName = 'cpfctt'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = 'Tahoma'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  Header = 'CPF'
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
                  Width = 95
                end
                item
                  Borders = []
                  BorderPen.Color = clSilver
                  CheckFalse = 'N'
                  CheckTrue = 'Y'
                  Color = clWindow
                  EditLength = 13
                  FieldName = 'fonefixo'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = 'Tahoma'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  Header = 'Fone'
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
                  Width = 93
                end
                item
                  Borders = []
                  BorderPen.Color = clSilver
                  CheckFalse = 'N'
                  CheckTrue = 'Y'
                  Color = clWindow
                  EditLength = 13
                  FieldName = 'fonecel'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = 'Tahoma'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  Header = 'Cel.'
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
                  Width = 110
                end
                item
                  Borders = []
                  BorderPen.Color = clSilver
                  CheckFalse = 'N'
                  CheckTrue = 'Y'
                  Color = clWindow
                  EditLength = 60
                  FieldName = 'email'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = 'Tahoma'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  Header = 'Email'
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
                  Width = 120
                end
                item
                  Borders = []
                  BorderPen.Color = clSilver
                  CheckFalse = 'N'
                  CheckTrue = 'Y'
                  Color = clWindow
                  FieldName = 'datahoraalteracaodadosreinf'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = 'Tahoma'
                  Font.Pitch = fpVariable
                  Font.Style = []
                  Header = 'Data/Hora Altera'#231#227'o'
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
                  Width = 111
                end>
              DataSource = dtmCadastrosInternos.dsrEnvio_R1000Reinf
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
                139
                84
                71
                79
                78
                73
                93
                46
                31
                99
                95
                93
                110
                120
                111)
            end
          end
        end
      end
      object tstEmDesuso: TTabSheet
        Caption = '&7. Em Desuso'
        ImageIndex = 7
        object gbxGIA: TGroupBox
          Left = 6
          Top = 6
          Width = 362
          Height = 132
          Caption = ' GIA '
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object rgpPorte: TtecDBRadioGroup
            Left = 0
            Top = 15
            Width = 115
            Height = 118
            Caption = ' PORTE '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            TabStop = False
            DataField = 'porte'
            DataSource = dtmCadastrosInternos.dsrFiliais
            object rbnMicro: TtecRadioButton
              Left = 6
              Top = 15
              Width = 105
              Height = 17
              Caption = 'Micro Empresa'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              Value = 'M'
            end
            object rbnPequena: TtecRadioButton
              Left = 6
              Top = 35
              Width = 105
              Height = 17
              Caption = 'Pequeno Porte'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              Value = 'P'
            end
            object rbnOutro: TtecRadioButton
              Left = 6
              Top = 55
              Width = 105
              Height = 17
              Caption = 'Outro'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              Value = 'O'
            end
          end
          object rgpSimples: TtecDBRadioGroup
            Left = 113
            Top = 15
            Width = 107
            Height = 118
            Caption = ' SIMPLES '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            TabStop = False
            DataField = 'simples'
            DataSource = dtmCadastrosInternos.dsrFiliais
            OnChange = rgpSimplesChange
            object rbnUnico: TtecRadioButton
              Left = 6
              Top = 15
              Width = 95
              Height = 17
              Caption = #218'nico'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              Value = 'U'
            end
            object rbnCentralizadoA: TtecRadioButton
              Left = 6
              Top = 35
              Width = 95
              Height = 17
              Caption = 'Centralizado'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              Value = 'C'
            end
            object rbnCentralizadoB: TtecRadioButton
              Left = 6
              Top = 55
              Width = 95
              Height = 17
              Caption = 'Centralizador'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              Value = 'T'
            end
            object rbnNao: TtecRadioButton
              Left = 6
              Top = 75
              Width = 95
              Height = 17
              Caption = 'N'#227'o optante'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 3
              Value = 'N'
            end
          end
          object rgpRegime: TtecDBRadioGroup
            Left = 218
            Top = 15
            Width = 144
            Height = 118
            Caption = ' REGIME '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            TabStop = False
            DataField = 'regime'
            DataSource = dtmCadastrosInternos.dsrFiliais
            object rbnRegimeNormal: TtecRadioButton
              Left = 6
              Top = 15
              Width = 125
              Height = 17
              Caption = 'Normal'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              Value = '1'
            end
            object rbnRegimeSimplesSC: TtecRadioButton
              Left = 6
              Top = 35
              Width = 125
              Height = 17
              Caption = 'Simples SC'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              Value = '2'
            end
            object rbnRegimeEstimativa: TtecRadioButton
              Left = 6
              Top = 55
              Width = 125
              Height = 17
              Caption = 'Estimativa'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              Value = '3'
            end
            object rbnRegimeBarLanch: TtecRadioButton
              Left = 6
              Top = 75
              Width = 125
              Height = 17
              Caption = 'Bar e Lanchonete'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 3
              Value = '8'
            end
            object rbnRegimeNormalEst: TtecRadioButton
              Left = 6
              Top = 95
              Width = 125
              Height = 17
              Caption = 'Normal/Estimativa'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 4
              Value = '9'
            end
          end
        end
      end
      object tstInternet: TTabSheet
        Caption = '&8 - Internet'
        ImageIndex = 7
        object gbxConexao: TGroupBox
          Left = 0
          Top = 0
          Width = 1027
          Height = 305
          Align = alTop
          Caption = 'Conex'#227'o'
          TabOrder = 0
          object gbxEmail: TGroupBox
            Left = 6
            Top = 4
            Width = 491
            Height = 131
            Caption = ' e-MAIL '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object gbx_email: TGroupBox
              Left = 0
              Top = 15
              Width = 486
              Height = 36
              Caption = 'e-MAIL'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              object edtEmail: TDBEditTexto
                Left = 2
                Top = 10
                Width = 479
                Height = 23
                CharCase = ecLowerCase
                DataField = 'emailenvio'
                DataSource = dtmCadastrosInternos.dsrFiliais
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                MaxLength = 8
                ParentFont = False
                TabOrder = 0
                CharCasenoDefault = True
                Alignment = taLeftJustify
              end
            end
            object gbx_Usuario: TGroupBox
              Left = 0
              Top = 55
              Width = 245
              Height = 36
              Caption = 'USU'#193'RIO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              object edtUsuarioEmail: TDBEditTexto
                Left = 2
                Top = 10
                Width = 240
                Height = 23
                CharCase = ecLowerCase
                DataField = 'usuarioemail'
                DataSource = dtmCadastrosInternos.dsrFiliais
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                MaxLength = 15
                ParentFont = False
                TabOrder = 0
                CharCasenoDefault = True
                Alignment = taLeftJustify
              end
            end
            object gbx_Senha: TGroupBox
              Left = 0
              Top = 95
              Width = 245
              Height = 36
              Caption = 'SENHA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              object edtSenhaEmail: TEdit
                Left = 2
                Top = 10
                Width = 240
                Height = 23
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                ParentFont = False
                PasswordChar = '*'
                TabOrder = 0
                OnChange = edtSenhaEmailChange
              end
            end
          end
          object gbxPOP3: TGroupBox
            Left = 3
            Top = 150
            Width = 245
            Height = 50
            Caption = ' POP3 '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            object gbxPortaPOP3: TGroupBox
              Left = 0
              Top = 15
              Width = 55
              Height = 36
              Caption = 'PORTA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              object edtPortaPop: TDBEditTexto
                Left = 2
                Top = 10
                Width = 50
                Height = 23
                DataField = 'portapop'
                DataSource = dtmCadastrosInternos.dsrFiliais
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                MaxLength = 11
                ParentFont = False
                TabOrder = 0
                CharCasenoDefault = False
                Alignment = taLeftJustify
              end
            end
            object gbxHostPOP3: TGroupBox
              Left = 54
              Top = 15
              Width = 191
              Height = 36
              Caption = 'HOST'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              object edtHostPop: TDBEditTexto
                Left = 2
                Top = 10
                Width = 186
                Height = 23
                CharCase = ecLowerCase
                DataField = 'hostpop'
                DataSource = dtmCadastrosInternos.dsrFiliais
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                MaxLength = 10
                ParentFont = False
                TabOrder = 0
                CharCasenoDefault = True
                Alignment = taLeftJustify
              end
            end
          end
          object gbxSMTP: TGroupBox
            Left = 263
            Top = 150
            Width = 245
            Height = 50
            Caption = ' SMTP '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
            object gbxPortaSMTP: TGroupBox
              Left = 0
              Top = 15
              Width = 55
              Height = 36
              Caption = 'PORTA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              object edtPortaSmtp: TDBEditTexto
                Left = 2
                Top = 10
                Width = 51
                Height = 23
                DataField = 'portasmtp'
                DataSource = dtmCadastrosInternos.dsrFiliais
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                MaxLength = 12
                ParentFont = False
                TabOrder = 0
                CharCasenoDefault = False
                Alignment = taLeftJustify
              end
            end
            object gbxHostSMTP: TGroupBox
              Left = 54
              Top = 15
              Width = 191
              Height = 36
              Caption = 'HOST'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              object edtHostSmtp: TDBEditTexto
                Left = 2
                Top = 10
                Width = 186
                Height = 23
                CharCase = ecLowerCase
                DataField = 'hostsmtp'
                DataSource = dtmCadastrosInternos.dsrFiliais
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                MaxLength = 11
                ParentFont = False
                TabOrder = 0
                CharCasenoDefault = True
                Alignment = taLeftJustify
              end
            end
          end
          object ckbClientesCartaoCredito: TDBCheckBox
            Left = 7
            Top = 211
            Width = 206
            Height = 20
            Caption = 'Meu servidor requer autentica'#231#227'o'
            DataField = 'autenticarsmtp'
            DataSource = dtmCadastrosInternos.dsrFiliais
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
          object ckbMeuServidorRequerUmaConexaodeSegurancaSSL: TDBCheckBox
            Left = 223
            Top = 211
            Width = 330
            Height = 20
            Caption = 'Meu servidor requer uma conex'#227'o de seguran'#231'a (SSL)'
            DataField = 'smtprequerssl'
            DataSource = dtmCadastrosInternos.dsrFiliais
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
          object ckbMeuServidorRequerUmaConexaodeSegurancaTLS: TDBCheckBox
            Left = 559
            Top = 211
            Width = 58
            Height = 20
            Caption = 'TLS'
            DataField = 'smtprequertls'
            DataSource = dtmCadastrosInternos.dsrFiliais
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 6
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object btnEnviarEmailTeste: TButton
            Left = 504
            Top = 16
            Width = 137
            Height = 25
            Caption = 'Enviar Email Teste'
            TabOrder = 7
            OnClick = btnEnviarEmailTesteClick
          end
          object gbxEmaildeTeste: TGroupBox
            Left = 504
            Top = 47
            Width = 513
            Height = 36
            Caption = 'e-MAIL de Teste'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            object edtEmaildeTeste: TEditTexto
              Left = 4
              Top = 10
              Width = 504
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
              CharCasenoDefault = False
              Alignment = taLeftJustify
            end
          end
        end
      end
    end
    object gbxNome: TGroupBox
      Left = 70
      Top = 6
      Width = 351
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
      object edtNome: TDBEditTexto
        Tag = 5
        Left = 2
        Top = 10
        Width = 346
        Height = 23
        DataField = 'nome'
        DataSource = dtmCadastrosInternos.dsrFiliais
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        MaxLength = 7
        ParentFont = False
        TabOrder = 0
        CharCasenoDefault = False
        Alignment = taLeftJustify
      end
    end
    object gbxSigla: TGroupBox
      Left = 430
      Top = 6
      Width = 52
      Height = 36
      Caption = ' SIGLA '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      object edtMnemonico: TDBEditTexto
        Left = 2
        Top = 10
        Width = 47
        Height = 23
        DataField = 'mnemonico'
        DataSource = dtmCadastrosInternos.dsrFiliais
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        MaxLength = 12
        ParentFont = False
        TabOrder = 0
        CharCasenoDefault = False
        Alignment = taLeftJustify
      end
    end
    object gbxRazaoSocial: TGroupBox
      Left = 6
      Top = 43
      Width = 475
      Height = 36
      Caption = ' RAZ'#195'O SOCIAL '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      object edtRazao: TDBEditTexto
        Left = 2
        Top = 10
        Width = 470
        Height = 23
        DataField = 'razao'
        DataSource = dtmCadastrosInternos.dsrFiliais
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        MaxLength = 8
        ParentFont = False
        TabOrder = 0
        CharCasenoDefault = False
        Alignment = taLeftJustify
      end
    end
    object gbxNaturezaJuridica: TGroupBox
      Left = 486
      Top = 6
      Width = 523
      Height = 36
      Hint = 'C'#243'digo da natureza jur'#237'dica, conforme tabela do SPED'
      Caption = 'NATUREZA JUR'#205'DICA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      object DBLCBBNaturezaJuridica: TTecDBLookupComboBox
        Left = 2
        Top = 11
        Width = 519
        Height = 23
        Hint = 'C'#243'digo da natureza jur'#237'dica, conforme tabela do SPED'
        DataField = 'naturezajuridica'
        DataSource = dtmCadastrosInternos.dsrFiliais
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        KeyField = 'codigo'
        ListField = 'codigodescricao'
        ListSource = dtmCadastrosInternos.DSRNaturezaJuridica
        ParentFont = False
        TabOrder = 0
      end
    end
  end
  object aclAbilitar: TActionList
    Left = 480
    Top = 8
    object actAbilitar: TAction
      Caption = 'actAbilitar'
      OnUpdate = actAbilitarUpdate
    end
  end
  object fcelConsultaProcessoJudicialReinf: TFormControlEditLink
    Tag = 0
    AutoPopupWidth = False
    EditStyle = esInplace
    PopupWidth = 100
    PopupHeight = 100
    WantKeyLeftRight = True
    WantKeyUpDown = True
    WantKeyHomeEnd = True
    WantKeyPriorNext = True
    WantKeyReturn = True
    WantKeyEscape = True
    Control = fraConsultaProcessoJudicialReinf
    Left = 856
    Top = 184
  end
  object fcelConsultaSuspensaoExibilidadeTributos: TFormControlEditLink
    Tag = 0
    AutoPopupWidth = False
    EditStyle = esInplace
    PopupWidth = 100
    PopupHeight = 100
    WantKeyLeftRight = True
    WantKeyUpDown = True
    WantKeyHomeEnd = True
    WantKeyPriorNext = True
    WantKeyReturn = True
    WantKeyEscape = True
    Control = fraConsultaSuspensaoExibilidadeTributos
    Left = 888
    Top = 184
  end
  object fcelConsultaProcessoJudicialReinf_Ad: TFormControlEditLink
    Tag = 0
    AutoPopupWidth = False
    EditStyle = esInplace
    PopupWidth = 100
    PopupHeight = 100
    WantKeyLeftRight = True
    WantKeyUpDown = True
    WantKeyHomeEnd = True
    WantKeyPriorNext = True
    WantKeyReturn = True
    WantKeyEscape = True
    Control = fraConsultaProcessoJudicialReinf_Ad
    Left = 864
    Top = 216
  end
  object fcelConsultaSuspensaoExibilidadeTributos_Ad: TFormControlEditLink
    Tag = 0
    AutoPopupWidth = False
    EditStyle = esInplace
    PopupWidth = 100
    PopupHeight = 100
    WantKeyLeftRight = True
    WantKeyUpDown = True
    WantKeyHomeEnd = True
    WantKeyPriorNext = True
    WantKeyReturn = True
    WantKeyEscape = True
    Control = fraConsultaSuspensaoExibilidadeTributos_Ad
    Left = 888
    Top = 216
  end
end
