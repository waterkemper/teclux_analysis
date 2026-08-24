inherited frmCadastroFornecedores: TfrmCadastroFornecedores
  Left = 517
  Top = 207
  Action = actAbilitar
  ActiveControl = edfCodigo
  Caption = 'Cadastro de Fornecedores'
  ClientHeight = 480
  ClientWidth = 797
  FormStyle = fsMDIChild
  PixelsPerInch = 96
  TextHeight = 13
  inherited tblBarra: TToolBar
    Width = 797
    inherited sbnAjuda: TSpeedButton
      OnClick = nil
    end
  end
  inherited pnlBarra: TPanel
    Width = 529
    TabOrder = 2
  end
  object pnlFundoJanela: TPanel
    Left = 0
    Top = 53
    Width = 797
    Height = 427
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 3
    TabOrder = 0
    object pgcFornecedores: TtecPageControl
      Left = 3
      Top = 133
      Width = 791
      Height = 291
      ActivePage = tstInformacoes
      Align = alBottom
      TabIndex = 1
      TabOrder = 0
      TabStop = False
      object tstEndereco: TTabSheet
        Caption = ' &1 - Endere'#231'o'
        Highlighted = False
        ImageIndex = 1
        inline fraEnderecoFornecedor: TfraEnderecoEditor
          Left = 2
          Top = -2
          Width = 459
          Height = 146
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          font.height = -13
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          inherited gbxEndereco: TGroupBox
            Width = 459
            Height = 146
            inherited pnlNumero: TPanel
              Width = 450
              inherited edtNumeroEndereco: TDBEditTexto
                DataField = 'numero'
                DataSource = dtmCadastroFornecedores.dsrFornecedores
                MaxLength = 9
              end
              inherited edtComplemento: TDBEditTexto
                DataField = 'complemento'
                DataSource = dtmCadastroFornecedores.dsrFornecedores
                MaxLength = 14
              end
            end
            inherited pnlBairro: TPanel
              Width = 450
              inherited edtBairro: TtecDoubleDBEdit
                LookupField = 'nomebairro'
                LookupSource = dtmCadastroFornecedores.dsrFornecedores
                DataField = 'bairro'
                DataSource = dtmCadastroFornecedores.dsrFornecedores
                MaxLength = 9
                ParentColor = True
              end
            end
            inherited pnlCidade: TPanel
              Width = 450
              inherited edtEstado: TDBEditTexto
                DataField = 'estado'
                DataSource = dtmCadastroFornecedores.dsrFornecedores
                MaxLength = 9
                ParentColor = True
              end
              inherited edtCidade: TtecDoubleDBEdit
                LookupField = 'nomecidade'
                LookupSource = dtmCadastroFornecedores.dsrFornecedores
                DataField = 'cidade'
                DataSource = dtmCadastroFornecedores.dsrFornecedores
                MaxLength = 9
                ParentColor = True
              end
              inherited edtCEP: TDBEditCep
                DataField = 'cep'
                DataSource = dtmCadastroFornecedores.dsrFornecedores
                MaxLength = 6
              end
            end
            inherited pnlRua: TPanel
              Width = 450
              inherited mmoRua: TtecDBMemo
                DataField = 'rua'
                DataSource = dtmCadastroFornecedores.dsrFornecedores
                font.height = -12
              end
            end
            inherited pnllblCidade: TPanel
              Width = 450
            end
            inherited pnllblBairro: TPanel
              Width = 450
            end
          end
        end
        inline fraFone: TfraTelefone
          Left = 2
          Top = 144
          Width = 147
          Height = 51
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          font.height = -13
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          inherited gbxFone: TGroupBox
            Width = 147
            inherited lblNumero: TLabel
              Left = 45
            end
            inherited edtDDD: TDBEditNumero
              Left = 1
              font.height = -12
              Text = 'edtDDD'
              DataField = 'foneddd'
              DataSource = dtmCadastroFornecedores.dsrFornecedores
            end
            inherited edtNumero: TDBEditFone
              Left = 43
              DataField = 'fonenumero'
              DataSource = dtmCadastroFornecedores.dsrFornecedores
              font.height = -12
            end
          end
        end
        inline fraFax: TfraTelefone
          Left = 157
          Top = 144
          Width = 146
          Height = 51
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          font.height = -13
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          inherited gbxFone: TGroupBox
            Width = 146
            Caption = 'FAX'
            inherited lblNumero: TLabel
              Left = 45
            end
            inherited edtDDD: TDBEditNumero
              Left = 1
              font.height = -12
              Text = 'edtDDD'
              DataField = 'faxddd'
              DataSource = dtmCadastroFornecedores.dsrFornecedores
            end
            inherited edtNumero: TDBEditFone
              Left = 43
              DataField = 'faxnumero'
              DataSource = dtmCadastroFornecedores.dsrFornecedores
              font.height = -12
            end
          end
        end
      end
      object tstInformacoes: TTabSheet
        Caption = ' &2 - Informa'#231#245'es'
        inline fracgcoucpf1: Tfracgcoucpf
          Left = 298
          Top = 1
          Width = 131
          Height = 66
          HorzScrollBar.Visible = False
          VertScrollBar.Visible = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          font.height = -13
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          inherited gbxCPGouCGC: TGroupBox
            Width = 131
            Height = 66
            inherited rgbTipoPessoa: TtecDBRadioGroup
              Left = 6
              Top = 10
              Height = 28
              DataField = 'pessoatipo'
              DataSource = dtmCadastroFornecedores.dsrFornecedores
              OnChange = fracgcoucpf1rgbTipoPessoaChange
              inherited rbnFisica: TtecRadioButton
                Top = 1
                OnClick = fracgcoucpf1rbnFisicaClick
              end
              inherited rbnJuridica: TtecRadioButton
                Top = 1
              end
            end
            inherited gbxCPF_CNPJ: TGroupBox
              Left = 0
              Top = 29
              Width = 131
              Height = 38
              inherited edtCPFCNPJ: TDBEditCPFCNPJ
                Width = 126
                DataField = 'pessoanumero'
                DataSource = dtmCadastroFornecedores.dsrFornecedores
                OnExit = fracgcoucpf1edtCPFCNPJExit
              end
            end
          end
        end
        object rgpNoSimples: TtecDBRadioGroup
          Left = 121
          Top = 1
          Width = 136
          Height = 32
          Caption = 'NO SIMPLES'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          font.height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          TabStop = False
          DataField = 'nosimples'
          DataSource = dtmCadastroFornecedores.dsrFornecedores
          object rbnNoSimplesNao: TtecRadioButton
            Left = 11
            Top = 12
            Width = 53
            Height = 17
            Caption = 'N'#227'o'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            font.height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            Value = 'False'
          end
          object rbnNoSimplesSim: TtecRadioButton
            Left = 69
            Top = 12
            Width = 54
            Height = 17
            Caption = 'Sim'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            font.height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            Value = 'True'
          end
        end
        object ckbContribuinteICMS: TDBCheckBox
          Left = 120
          Top = 35
          Width = 135
          Height = 20
          Caption = 'Contribuinte ICMS'
          DataField = 'contribicms'
          DataSource = dtmCadastroFornecedores.dsrFornecedores
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          font.height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object gbxRNTC: TGroupBox
          Left = 186
          Top = 112
          Width = 175
          Height = 36
          Caption = 'RNTC'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          font.height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 9
          object edtRNTC: TDBEditTexto
            Left = 1
            Top = 10
            Width = 170
            Height = 20
            DataField = 'rntc'
            DataSource = dtmCadastroFornecedores.dsrFornecedores
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            font.height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            MaxLength = 7
            ParentFont = False
            TabOrder = 0
            CharCasenoDefault = False
          end
        end
        object gbxSUFRAMA: TGroupBox
          Left = 1
          Top = 112
          Width = 175
          Height = 36
          Caption = 'N'#186' INSCRI'#199#194'O NA SUFRAMA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          font.height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 8
          object DBEditTexto1: TDBEditTexto
            Left = 2
            Top = 10
            Width = 170
            Height = 20
            DataField = 'suframa'
            DataSource = dtmCadastroFornecedores.dsrFornecedores
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            font.height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            MaxLength = 12
            ParentFont = False
            TabOrder = 0
            CharCasenoDefault = False
          end
        end
        object gbxIESubstTributaria: TGroupBox
          Left = 440
          Top = 40
          Width = 180
          Height = 220
          Caption = 'SUBSTITUI'#199#195'O TRIBUT'#193'RIA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          font.height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 7
          inline fraIESubstTributario1: TfraIESubstTributario
            Left = 2
            Top = 11
            Width = 176
            Height = 207
            HorzScrollBar.Range = 176
            VertScrollBar.Range = 206
            Align = alClient
            AutoScroll = False
            TabOrder = 0
            inherited dbgIESubstTributario: TtecDBGrid
              Width = 176
              Height = 206
              Align = alNone
              Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
              CanDelete = True
              Columns = <
                item
                  Expanded = False
                  FieldName = 'estado'
                  Title.Alignment = taCenter
                  Title.Caption = 'UF'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clBlack
                  Title.font.height = -9
                  Title.Font.Name = 'Helvetica'
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
                  Title.font.height = -9
                  Title.Font.Name = 'Helvetica'
                  Title.Font.Pitch = fpVariable
                  Title.Font.Style = []
                  Width = 110
                  Visible = True
                end>
            end
            inherited dsrIESubstTributario: TtecDataSource
              DataSet = dtmCadastroFornecedores.qryIESubstTributario
            end
          end
        end
        object gbxIE: TGroupBox
          Left = 439
          Top = 2
          Width = 145
          Height = 36
          Caption = 'INSCRI'#199#195'O ESTADUAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          font.height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          object edtDocumento: TDBEditDocumento
            Left = 2
            Top = 10
            Width = 140
            Height = 20
            DataField = 'inscricaoestadual'
            DataSource = dtmCadastroFornecedores.dsrFornecedores
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            font.height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            MaxLength = 12
            ParentFont = False
            TabOrder = 0
            OnExit = edtDocumentoExit
            CharCasenoDefault = False
            Tipo = InscricaoEstadual
            Estado = 'SP'
          end
        end
        object gbxContato: TGroupBox
          Left = 1
          Top = 224
          Width = 408
          Height = 36
          Caption = 'CONTATO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          font.height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 12
          object edtContato: TDBEditTexto
            Left = 2
            Top = 10
            Width = 401
            Height = 20
            DataField = 'contato'
            DataSource = dtmCadastroFornecedores.dsrFornecedores
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            font.height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            MaxLength = 10
            ParentFont = False
            TabOrder = 0
            CharCasenoDefault = False
          end
        end
        object gbxEmail: TGroupBox
          Left = 1
          Top = 149
          Width = 408
          Height = 36
          Caption = 'E-MAIL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          font.height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 10
          object edtEmail: TDBEditTexto
            Left = 2
            Top = 10
            Width = 402
            Height = 20
            CharCase = ecLowerCase
            DataField = 'email'
            DataSource = dtmCadastroFornecedores.dsrFornecedores
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            font.height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            MaxLength = 8
            ParentFont = False
            TabOrder = 0
            OnExit = edtEmailExit
            CharCasenoDefault = True
          end
        end
        object ckbFornecedorParaISS: TDBCheckBox
          Left = 120
          Top = 52
          Width = 135
          Height = 20
          Caption = 'Fornecedor para ISS'
          DataField = 'fornecedorparaiss'
          DataSource = dtmCadastroFornecedores.dsrFornecedores
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          font.height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object gbxSite: TGroupBox
          Left = 1
          Top = 187
          Width = 408
          Height = 36
          Caption = 'SITE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          font.height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 11
          object edtSite: TDBEditTexto
            Left = 2
            Top = 10
            Width = 402
            Height = 20
            CharCase = ecLowerCase
            DataField = 'site'
            DataSource = dtmCadastroFornecedores.dsrFornecedores
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            font.height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            MaxLength = 7
            ParentFont = False
            TabOrder = 0
            OnExit = edtEmailExit
            CharCasenoDefault = True
          end
        end
        object gbxInfNotaFiscal: TGroupBox
          Left = 621
          Top = 39
          Width = 159
          Height = 220
          Caption = 'NOTAS FISCAIS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          font.height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 13
          object dbgSerieFornecedor: TtecDBGrid
            Left = 2
            Top = 10
            Width = 155
            Height = 208
            DataSource = dtmCadastroFornecedores.dsrSeriesFornecedores
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            font.height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
            ParentFont = False
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clBlack
            Titlefont.height = -13
            TitleFont.Name = 'helvetica'
            TitleFont.Pitch = fpVariable
            TitleFont.Style = []
            OnKeyDown = dbgSerieFornecedorKeyDown
            OnKeyPress = dbgSerieFornecedorKeyPress
            RowWrap = 60
            Large = False
            DoubleRowColor = False
            MsgDelete = 'a S'#201'RIE'
            TitleMinHeight = 100
            CellHeights = 100
            StrippedColor = 16054260
            CanDelete = True
            PostOnEnter = False
            DenySort = False
            Columns = <
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'serie'
                Title.Alignment = taCenter
                Title.Caption = 'S'#201'RIE'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.font.height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 35
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'modelodoctofiscal'
                Title.Caption = 'MODELO DOCTO'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.font.height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Visible = True
              end>
          end
        end
        object gbxTipoFornecimento: TGroupBox
          Left = 0
          Top = 0
          Width = 117
          Height = 81
          Caption = 'FORNECEDOR DE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          font.height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 14
          object ckbTipoFornec_Produto: TDBCheckBox
            Left = 8
            Top = 11
            Width = 101
            Height = 26
            Caption = 'Produto'
            DataField = 'tipofornec_produto_l'
            DataSource = dtmCadastroFornecedores.dsrFornecedores
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            font.height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object ckbTipoFornec_Transporte: TDBCheckBox
            Left = 8
            Top = 31
            Width = 101
            Height = 26
            Caption = 'Transporte'
            DataField = 'tipofornec_tranporte_l'
            DataSource = dtmCadastroFornecedores.dsrFornecedores
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            font.height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object ckbTipoFornec_Montagem: TDBCheckBox
            Left = 8
            Top = 56
            Width = 101
            Height = 22
            Caption = 'Montagem'
            DataField = 'tipofornec_montagem_l'
            DataSource = dtmCadastroFornecedores.dsrFornecedores
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            font.height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
        end
        object ckbNaoSubstitutoTributario: TDBCheckBox
          Left = 121
          Top = 69
          Width = 174
          Height = 20
          Caption = 'N'#227'o '#233' substituto tribut'#225'rio'
          DataField = 'naosubstituto'
          DataSource = dtmCadastroFornecedores.dsrFornecedores
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          font.height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object ckbDistribuidor: TDBCheckBox
          Left = 121
          Top = 86
          Width = 154
          Height = 20
          Caption = 'Distribuidor/revendedor'
          Color = clBtnFace
          DataField = 'distribuidor'
          DataSource = dtmCadastroFornecedores.dsrFornecedores
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          font.height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 4
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
      end
      object tstObservacoes: TTabSheet
        Caption = ' &3 - Observa'#231#245'es'
        ImageIndex = 2
        object mmoObsrvacoes: TtecDBMemo
          Left = 0
          Top = 0
          Width = 783
          Height = 261
          Align = alClient
          DataField = 'observacoes'
          DataSource = dtmCadastroFornecedores.dsrFornecedores
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          font.height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
      end
      object tstGrupos: TTabSheet
        BorderWidth = 2
        Caption = ' &4 - Grupos / Classes'
        ImageIndex = 3
        object sbnIncluirGrupos: TSpeedButton
          Left = 566
          Top = 20
          Width = 23
          Height = 22
          Hint = 'Incluir Grupo'
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
          OnClick = sbnIncluirGruposClick
        end
        object sbnExcluirGrupos: TSpeedButton
          Left = 566
          Top = 42
          Width = 23
          Height = 22
          Hint = 'Excluir Grupo'
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
          OnClick = sbnExcluirGruposClick
        end
        object dbgGrupos: TtecDBGrid
          Left = 0
          Top = 0
          Width = 559
          Height = 259
          Align = alLeft
          DataSource = dtmCadastroFornecedores.dsrFornecedoresGrupos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          font.height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlack
          Titlefont.height = -13
          TitleFont.Name = 'helvetica'
          TitleFont.Pitch = fpVariable
          TitleFont.Style = []
          OnDblClick = dbgGruposDblClick
          OnKeyDown = dbgGruposKeyDown
          RowWrap = 60
          Large = False
          DoubleRowColor = False
          MsgDelete = 'o GRUPO'
          TitleMinHeight = 100
          CellHeights = 100
          StrippedColor = 16054260
          CanDelete = False
          PostOnEnter = False
          DenySort = False
          Columns = <
            item
              Expanded = False
              FieldName = 'grupo'
              Title.Alignment = taCenter
              Title.Caption = 'GRUPO'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.font.height = -9
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
              Title.Caption = 'DESCRI'#199#195'O DO GRUPO'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.font.height = -9
              Title.Font.Name = 'helvetica'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'classe'
              Title.Alignment = taCenter
              Title.Caption = 'CLASSE'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.font.height = -9
              Title.Font.Name = 'helvetica'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Width = 45
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'descricao_classe'
              Title.Alignment = taCenter
              Title.Caption = 'DESCRI'#199#195'O DA CLASSE'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.font.height = -9
              Title.Font.Name = 'helvetica'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Width = 200
              Visible = True
            end>
        end
      end
      object tstContabilidade: TTabSheet
        Caption = ' &5 - Cont'#225'bil'
        ImageIndex = 4
        object GroupBox1: TGroupBox
          Left = 0
          Top = 0
          Width = 783
          Height = 263
          Align = alClient
          TabOrder = 0
          object gbxDebitar: TGroupBox
            Left = 6
            Top = 3
            Width = 580
            Height = 36
            Caption = 'DEBITAR'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            font.height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object dtxDebitarClassificacao: TtecDBText
              Left = 425
              Top = 10
              Width = 152
              Height = 23
              TabStop = False
              BorderStyle = 3
              Color = clBtnFace
              DataField = 'classificacao'
              DataSource = fraConsultaDebitar.dsrProcuraDebitar
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              font.height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            inline fraConsultaDebitar: TfraConsultaCodigoContabil
              Left = 3
              Top = 10
              Width = 422
              Height = 23
              HorzScrollBar.Range = 422
              VertScrollBar.Range = 23
              AutoScroll = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              font.height = -11
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              inherited sbnProcura: TSpeedButton
                Top = 2
                Height = 21
              end
              inherited dtxDescricao: TtecDBText
                Left = 87
                Width = 335
                DataField = 'descricao'
                DataSource = fraConsultaDebitar.dsrProcuraDebitar
              end
              inherited edfCodigo: TtecDBFindLookup
                DataField = 'debito'
                DataSource = dtmCadastroFornecedores.dsrFornecedores
                MaxLength = 6
                LookupField = 'codigo'
                LookupSource = fraConsultaDebitar.dsrProcuraDebitar
                Parameter = ' '
                ActiveSetControls = False
                DenyInsert = False
                NoSetControls = <>
                SetControls = <>
                LookupParameter = 'codigo'
              end
              inherited qryProcuraDebitar: TtecQuery
                inherited qryProcuraDebitarcodigo: TIntegerField
                  DisplayFormat = '0'
                end
              end
            end
          end
          object gbxCreditar: TGroupBox
            Left = 6
            Top = 44
            Width = 580
            Height = 36
            Caption = 'CREDITAR'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            font.height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            object dtxCreditarClassificacao: TtecDBText
              Left = 425
              Top = 10
              Width = 152
              Height = 23
              TabStop = False
              BorderStyle = 3
              Color = clBtnFace
              DataField = 'classificacao'
              DataSource = fraConsultaCreditar.dsrProcuraCreditar
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              font.height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            inline fraConsultaCreditar: TfraConsultaCodigoContabil
              Left = 3
              Top = 10
              Width = 422
              Height = 23
              HorzScrollBar.Range = 422
              VertScrollBar.Range = 23
              AutoScroll = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              font.height = -11
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              inherited sbnProcura: TSpeedButton
                Top = 2
                Height = 21
              end
              inherited dtxDescricao: TtecDBText
                Left = 87
                Width = 335
                DataField = 'descricao'
                DataSource = fraConsultaCreditar.dsrProcuraCreditar
              end
              inherited edfCodigo: TtecDBFindLookup
                DataField = 'credito'
                DataSource = dtmCadastroFornecedores.dsrFornecedores
                MaxLength = 6
                LookupField = 'codigo'
                LookupSource = fraConsultaCreditar.dsrProcuraCreditar
                Parameter = ' '
                ActiveSetControls = False
                DenyInsert = False
                NoSetControls = <>
                SetControls = <>
                LookupParameter = 'codigo'
              end
              inherited qryProcuraCreditar: TtecQuery
                inherited qryProcuraCreditarcodigo: TIntegerField
                  DisplayFormat = '0'
                end
              end
            end
          end
          object gbxAdiantamento: TGroupBox
            Left = 6
            Top = 85
            Width = 580
            Height = 36
            Caption = 'ADIANTAMENTOS'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            font.height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            object dtxAdiantamentoClassificacao: TtecDBText
              Left = 425
              Top = 10
              Width = 152
              Height = 23
              TabStop = False
              BorderStyle = 3
              Color = clBtnFace
              DataField = 'classificacao'
              DataSource = fraConsultaAdiantamento.dsrProcuraCreditar
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              font.height = -12
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            inline fraConsultaAdiantamento: TfraConsultaCodigoContabil
              Left = 3
              Top = 10
              Width = 422
              Height = 23
              HorzScrollBar.Range = 422
              VertScrollBar.Range = 23
              AutoScroll = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              font.height = -11
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              inherited sbnProcura: TSpeedButton
                Top = 2
                Height = 20
              end
              inherited dtxDescricao: TtecDBText
                Left = 87
                Width = 335
                DataField = 'descricao'
                DataSource = fraConsultaAdiantamento.dsrProcuraCreditar
              end
              inherited edfCodigo: TtecDBFindLookup
                DataField = 'adiantamento'
                DataSource = dtmCadastroFornecedores.dsrFornecedores
                MaxLength = 6
                LookupField = 'codigo'
                LookupSource = fraConsultaAdiantamento.dsrProcuraCreditar
                Parameter = ' '
                ActiveSetControls = False
                DenyInsert = False
                NoSetControls = <>
                SetControls = <>
                LookupParameter = 'codigo'
              end
              inherited qryProcuraCreditar: TtecQuery
                inherited qryProcuraCreditarcodigo: TIntegerField
                  DisplayFormat = '0'
                end
              end
            end
          end
          object GroupBox2: TGroupBox
            Left = 6
            Top = 127
            Width = 580
            Height = 36
            Caption = 'HIST'#211'RICO CONT'#193'BIL PADR'#195'O'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            font.height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            inline fraConsultaHistorico: TfraConsultaCodigoContabil
              Left = 3
              Top = 10
              Width = 574
              Height = 23
              HorzScrollBar.Range = 574
              VertScrollBar.Range = 23
              AutoScroll = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              font.height = -11
              Font.Name = 'helvetica'
              Font.Pitch = fpVariable
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              inherited sbnProcura: TSpeedButton
                Top = 2
                Height = 20
              end
              inherited dtxDescricao: TtecDBText
                Left = 87
                Width = 487
                DataField = 'descricao'
                DataSource = fraConsultaHistorico.dsrProcuraHistorico
              end
              inherited edfCodigo: TtecDBFindLookup
                DataField = 'historicocontabil'
                DataSource = dtmCadastroFornecedores.dsrFornecedores
                MaxLength = -1
                LookupField = 'codigo'
                LookupSource = fraConsultaHistorico.dsrProcuraHistorico
                Parameter = ' '
                ActiveSetControls = False
                DenyInsert = False
                NoSetControls = <>
                SetControls = <>
                LookupParameter = 'codigo'
              end
              inherited qryProcuraCreditar: TtecQuery
                inherited qryProcuraCreditarcodigo: TIntegerField
                  DisplayFormat = '0'
                end
              end
            end
          end
        end
      end
      object tstContatos: TTabSheet
        Caption = ' &6 - Contatos'
        ImageIndex = 5
        object sbnExcluirContato: TSpeedButton
          Left = 692
          Top = 29
          Width = 23
          Height = 22
          Hint = 'Excluir Contato'
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
          OnClick = sbnExcluirContatoClick
        end
        object sbnIncluirContato: TSpeedButton
          Left = 692
          Top = 7
          Width = 23
          Height = 22
          Hint = 'Incluir Contato'
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
          OnClick = sbnIncluirGruposClick
        end
        object dbgContatos: TtecDBGrid
          Left = -1
          Top = 2
          Width = 501
          Height = 175
          DataSource = dtmCadastroFornecedores.dsrContatosFornecedores
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          font.height = -12
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlack
          Titlefont.height = -11
          TitleFont.Name = 'Arial'
          TitleFont.Pitch = fpVariable
          TitleFont.Style = []
          OnDblClick = dbgContatosDblClick
          OnKeyDown = dbgContatosKeyDown
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
              FieldName = 'contato'
              Title.Alignment = taCenter
              Title.Caption = 'NOME DO CONTATO'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.font.height = -9
              Title.Font.Name = 'Arial'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Width = 170
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'foneddd'
              Title.Alignment = taCenter
              Title.Caption = 'DDD'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.font.height = -9
              Title.Font.Name = 'Arial'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Width = 35
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'fonenumero'
              Title.Alignment = taCenter
              Title.Caption = 'TELEFONE'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.font.height = -9
              Title.Font.Name = 'Arial'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'foneramal'
              Title.Alignment = taCenter
              Title.Caption = 'RAMAL'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.font.height = -9
              Title.Font.Name = 'Arial'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'email'
              Title.Alignment = taCenter
              Title.Caption = 'e-mail'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.font.height = -9
              Title.Font.Name = 'Arial'
              Title.Font.Pitch = fpVariable
              Title.Font.Style = []
              Width = 160
              Visible = True
            end>
        end
        object gbxObservacoes: TGroupBox
          Left = 500
          Top = 36
          Width = 189
          Height = 140
          Caption = 'OBSERVA'#199#213'ES'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          font.height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          object dtxobservacoes: TtecDBText
            Left = 2
            Top = 12
            Width = 185
            Height = 126
            TabStop = False
            Color = clBtnFace
            DataField = 'observacoes'
            DataSource = dtmCadastroFornecedores.dsrContatosFornecedores
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            font.height = -11
            Font.Name = 'Arial'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
        end
        object gbxCargo: TGroupBox
          Left = 500
          Top = 0
          Width = 189
          Height = 36
          Caption = 'CARGO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          font.height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          object tdtxcargo: TtecDBText
            Left = 4
            Top = 10
            Width = 181
            Height = 23
            TabStop = False
            Color = clBtnFace
            DataField = 'descricaocargo'
            DataSource = dtmCadastroFornecedores.dsrContatosFornecedores
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            font.height = -13
            Font.Name = 'Arial'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
        end
      end
    end
    object gbxFornecedor: TGroupBox
      Left = 3
      Top = 3
      Width = 791
      Height = 139
      Align = alTop
      Caption = 'FORNECEDOR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      font.height = -11
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object gbxCodigo: TGroupBox
        Left = 8
        Top = 16
        Width = 67
        Height = 36
        Caption = 'C'#211'DIGO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        font.height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object edfCodigo: TtecDbEditFind
          Left = 2
          Top = 10
          Width = 62
          Height = 20
          DataField = 'codigo'
          DataSource = dtmCadastroFornecedores.dsrFornecedores
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          font.height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          Group = 'Fornecedores'
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
          Parameter = 'Codigo'
          ActiveSetControls = True
          DenyInsert = True
          NoSetControls = <
            item
              Control = pnlBarra
            end>
          SetControls = <
            item
              Control = pgcFornecedores
            end
            item
              Control = edtRazaoSocial
            end
            item
              Control = edtNomeFantasia
            end
            item
              Control = flkGrupo
            end
            item
              Control = sbnGrupoFornecedor
            end
            item
              Control = edtMarkup
            end
            item
              Control = lblPorcentagem
            end
            item
              Control = gbxFantasia
            end
            item
              Control = gbxRazaoSocial
            end
            item
              Control = gbxEnderecoAlterado
            end
            item
              Control = gbxMarkup
            end
            item
              Control = gbxGrupoFornecedor
            end>
        end
      end
      object gbxFantasia: TGroupBox
        Left = 84
        Top = 16
        Width = 340
        Height = 36
        Caption = 'NOME DE FANTASIA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        font.height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object edtNomeFantasia: TDBEditTexto
          Left = 2
          Top = 10
          Width = 335
          Height = 20
          DataField = 'nome'
          DataSource = dtmCadastroFornecedores.dsrFornecedores
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          font.height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = 15
          ParentFont = False
          TabOrder = 0
          CharCasenoDefault = False
        end
      end
      object gbxRazaoSocial: TGroupBox
        Left = 8
        Top = 56
        Width = 417
        Height = 36
        Caption = 'RAZ'#195'O SOCIAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        font.height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        object edtRazaoSocial: TDBEditTexto
          Left = 2
          Top = 10
          Width = 412
          Height = 20
          DataField = 'razao'
          DataSource = dtmCadastroFornecedores.dsrFornecedores
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          font.height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = 14
          ParentFont = False
          TabOrder = 0
          CharCasenoDefault = False
        end
      end
      object gbxGrupoFornecedor: TGroupBox
        Left = 94
        Top = 97
        Width = 331
        Height = 36
        Caption = 'GRUPO DO FORNECEDOR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        font.height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        object sbnGrupoFornecedor: TSpeedButton
          Left = 63
          Top = 10
          Width = 23
          Height = 23
          Hint = 'Procurar  Grupo Fornecedor'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          font.height = -13
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
          OnClick = sbnGrupoFornecedorClick
        end
        object dtxGruposFornecedores: TtecDBText
          Left = 87
          Top = 10
          Width = 241
          Height = 23
          TabStop = False
          BorderStyle = 3
          Color = clBtnFace
          DataField = 'nome'
          DataSource = dtmCadastroFornecedores.dsrProcuraGruposFornecedores
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          font.height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object flkGrupo: TtecDBFindLookup
          Left = 2
          Top = 10
          Width = 60
          Height = 20
          DataField = 'grupofornecedor'
          DataSource = dtmCadastroFornecedores.dsrFornecedores
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          font.height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = 4
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
          LookupSource = dtmCadastroFornecedores.dsrProcuraGruposFornecedores
          Parameter = ' '
          ActiveSetControls = False
          DenyInsert = False
          NoSetControls = <>
          SetControls = <>
          LookupParameter = 'codigo'
        end
      end
      object gbxMarkup: TGroupBox
        Left = 9
        Top = 97
        Width = 79
        Height = 36
        Caption = 'MARK-UP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        font.height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        object lblPorcentagem: TLabel
          Left = 68
          Top = 12
          Width = 9
          Height = 13
          Alignment = taRightJustify
          Caption = '%'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          font.height = -13
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
        end
        object edtMarkup: TDBEditNumero
          Left = 2
          Top = 10
          Width = 60
          Height = 20
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          font.height = -12
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
          DataSource = dtmCadastroFornecedores.dsrFornecedores
        end
      end
      object gbxEnderecoAlterado: TGroupBox
        Left = 430
        Top = 16
        Width = 142
        Height = 36
        Caption = 'ENDERE'#199'O ALTERADO EM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        font.height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        object dtxEnderecoAlterado: TtecDBText
          Left = 29
          Top = 11
          Width = 80
          Height = 23
          TabStop = False
          BorderStyle = 3
          Color = clBtnFace
          DataField = 'enderecoalterado'
          DataSource = dtmCadastroFornecedores.dsrFornecedores
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          font.height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
      end
    end
  end
  object aclAbilitar: TActionList
    Left = 432
    Top = 8
    object actAbilitar: TAction
      Caption = 'actAbilitar'
      OnUpdate = actAbilitarUpdate
    end
  end
end
