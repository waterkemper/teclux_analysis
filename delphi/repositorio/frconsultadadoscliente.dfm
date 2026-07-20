object fraConsultaDadosCliente: TfraConsultaDadosCliente
  Left = 0
  Top = 0
  Width = 734
  Height = 240
  HorzScrollBar.Range = 734
  VertScrollBar.Range = 239
  AutoScroll = False
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -13
  Font.Name = 'helvetica'
  Font.Pitch = fpVariable
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  object lblEmpresa: TLabel
    Left = 327
    Top = 3
    Width = 29
    Height = 15
    Alignment = taRightJustify
    Caption = 'Emp.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
  end
  object lblNaturalEstado: TLabel
    Left = 339
    Top = 27
    Width = 16
    Height = 15
    Alignment = taRightJustify
    Caption = 'UF'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
  end
  object lblNaturalCidade: TLabel
    Left = 29
    Top = 27
    Width = 40
    Height = 15
    Alignment = taRightJustify
    Caption = 'Natural'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
  end
  object lblNascimento: TLabel
    Left = 3
    Top = 3
    Width = 67
    Height = 15
    Alignment = taRightJustify
    Caption = 'Nascimento'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
  end
  object lblDocumento: TLabel
    Left = 144
    Top = 3
    Width = 64
    Height = 15
    Alignment = taRightJustify
    Caption = 'Documento'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
  end
  object lblSexo: TLabel
    Left = 400
    Top = 27
    Width = 27
    Height = 15
    Alignment = taRightJustify
    Caption = 'Sexo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
  end
  object lblResumoCobranca: TLabel
    Left = 1
    Top = 218
    Width = 727
    Height = 21
    AutoSize = False
  end
  object lblCPFCNPJ: TLabel
    Left = 474
    Top = 27
    Width = 59
    Height = 15
    Alignment = taRightJustify
    Caption = 'CPF/CNPJ'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
  end
  object pgcDetalhesCliente: TtecPageControl
    Left = 0
    Top = 48
    Width = 729
    Height = 169
    ActivePage = tstCashBack
    TabOrder = 0
    object tstEndereco: TTabSheet
      Caption = 'En&dere'#231'o'
      inline fraEnderecoCliente: TfraEndereco
        Left = 0
        Top = 0
        Width = 428
        Height = 112
        HorzScrollBar.Visible = False
        VertScrollBar.Visible = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        inherited gbxEndereco: TGroupBox
          Width = 428
          Height = 112
          inherited pnllblNumero: TPanel [0]
            Width = 424
            Visible = False
            inherited lblenderecocliente_numero: TLabel
              Visible = False
            end
            inherited lblenderecocliente_complemento: TLabel
              Visible = False
            end
          end
          inherited pnlRua: TPanel [1]
            Width = 424
            inherited mmoRua: TtecDBMemo
              Color = clBtnFace
              DataField = 'rua'
              DataSource = dsrCliente
              Font.Height = -12
            end
          end
          inherited pnlNumero: TPanel [2]
            Width = 424
            Height = 25
            inherited edtNumeroEndereco: TDBEditTexto
              Top = 1
            end
            inherited edtComplemento: TDBEditTexto
              Top = 1
            end
          end
          inherited pnllblBairro: TPanel [3]
            Top = 79
            Width = 424
            Visible = False
            inherited lblBairro_: TLabel
              Visible = False
            end
          end
          inherited pnlBairro: TPanel [4]
            Top = 89
            Width = 424
            inherited edtBairro: TtecDoubleDBEdit
              LookupField = 'nomebairro'
              LookupSource = dsrCliente
              DataField = 'bairro'
              DataSource = dsrCliente
            end
          end
          inherited pnllblCidade: TPanel [5]
            Top = 114
            Width = 424
            Visible = False
            inherited lblCEP_: TLabel
              Visible = False
            end
            inherited lblCidade_: TLabel
              Visible = False
            end
            inherited lblUF_: TLabel
              Visible = False
            end
          end
          inherited pnlCidade: TPanel [6]
            Top = 124
            Width = 424
            inherited edtCEP: TDBEditCep
              DataField = 'cep'
              DataSource = dsrCliente
            end
            inherited edtCidade: TtecDoubleDBEdit
              LookupField = 'nomecidade'
              LookupSource = dsrCliente
              DataField = 'cidade'
              DataSource = dsrCliente
            end
            inherited edtEstado: TDBEditTexto
              Color = clBtnFace
              DataField = 'estado'
              DataSource = dsrCliente
            end
          end
        end
      end
      object gbxSPC: TGroupBox
        Left = 478
        Top = 4
        Width = 237
        Height = 81
        Caption = #218'LTIMO REGISTRO NO SPC'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object lblDataSPC: TLabel
          Left = 129
          Top = 18
          Width = 74
          Height = 17
          Alignment = taRightJustify
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
        end
        object lblValorSPC: TLabel
          Left = 111
          Top = 37
          Width = 92
          Height = 15
          Alignment = taRightJustify
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
        end
        object lblRegistro: TLabel
          Left = 8
          Top = 18
          Width = 47
          Height = 15
          Caption = 'Registro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
        end
        object lblDivida: TLabel
          Left = 8
          Top = 37
          Width = 81
          Height = 15
          Caption = 'Valor da D'#237'vida'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
        end
        object lblTipoRegistro: TLabel
          Left = 60
          Top = 18
          Width = 25
          Height = 15
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
        end
        object pnlAvalisado: TPanel
          Left = 2
          Top = 56
          Width = 233
          Height = 23
          Align = alBottom
          BevelOuter = bvNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object lblNome_Avalista_ou_Avalizado: TLabel
            Left = 10
            Top = 15
            Width = 222
            Height = 15
            AutoSize = False
          end
          object lblTituloAvalista: TLabel
            Left = 8
            Top = 0
            Width = 75
            Height = 15
            Caption = 'Avalizado por:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentFont = False
          end
        end
      end
      object pnlCarta: TPanel
        Left = 478
        Top = 95
        Width = 236
        Height = 37
        TabOrder = 2
        Visible = False
        object Label1: TLabel
          Left = 1
          Top = 6
          Width = 55
          Height = 15
          Align = alBottom
          Alignment = taCenter
          Caption = 'ATEN'#199#195'O'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
        end
        object lblAviso2: TLabel
          Left = 1
          Top = 21
          Width = 230
          Height = 15
          Align = alBottom
          Alignment = taCenter
          Caption = 'O endere'#231'o do cliente est'#225' desatualizado!'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          WordWrap = True
        end
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 110
        Width = 428
        Height = 27
        TabOrder = 3
        object lblFoneRamal: TLabel
          Left = 248
          Top = 6
          Width = 37
          Height = 16
          Caption = 'Ramal'
        end
        object lblFoneNumero: TLabel
          Left = 104
          Top = 6
          Width = 29
          Height = 16
          Caption = 'Fone'
        end
        object lblDDD: TLabel
          Left = 20
          Top = 6
          Width = 27
          Height = 16
          Caption = 'DDD'
        end
        object edtFoneRamal: TDBEditTexto
          Left = 288
          Top = 2
          Width = 80
          Height = 23
          TabStop = False
          Color = clBtnFace
          DataField = 'foneramal'
          DataSource = dsrCliente
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = 10
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          CharCasenoDefault = False
          Alignment = taLeftJustify
        end
        object edtFoneNumero: TDBEditFone
          Left = 136
          Top = 2
          Width = 100
          Height = 23
          TabStop = False
          Color = clBtnFace
          DataField = 'fonenumero'
          DataSource = dsrCliente
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = 8
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
          Tamanho = 0
          Decimais = False
          Negativo = False
        end
        object edtFoneDDD: TDBEditNumero
          Left = 52
          Top = 2
          Width = 40
          Height = 23
          TabStop = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = 3
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
          Mascara = True
          Alignment = taLeftJustify
          TipoMascara = tmGERAL
          NrDecimal = 0
          Decimais = False
          Negativo = False
          Tamanho = 3
          DataField = 'foneddd'
          DataSource = dsrCliente
        end
      end
    end
    object tstCartas: TTabSheet
      Caption = 'Car&tas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ImageIndex = 1
      ParentFont = False
      object dbgParcelasCartas: TtecDBGrid
        Left = 522
        Top = 0
        Width = 199
        Height = 138
        Align = alClient
        DataSource = dsrParcelasCartas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -12
        TitleFont.Name = 'helvetica'
        TitleFont.Pitch = fpVariable
        TitleFont.Style = []
        RowWrap = 60
        Large = False
        DoubleRowColor = False
        TitleMinHeight = 100
        CellHeights = 100
        StrippedColor = 16054260
        CanDelete = False
        CanNotInsertFromGrid = False
        PostOnEnter = False
        PostOnSetUpDown = False
        DenySort = False
        DefaultRowHeight = 16
        ExibirNumerodaLinha = False
        NaoAtribuirDadosaTabelaaoDigitar = False
        ShowWhenFieldInvisible = False
        CanClickWhenEditing = False
        Columns = <
          item
            Expanded = False
            FieldName = 'contratoparcela'
            Title.Alignment = taCenter
            Title.Caption = 'CONTRATO'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -9
            Title.Font.Name = 'helvetica'
            Title.Font.Pitch = fpVariable
            Title.Font.Style = []
            Width = 110
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'parcela'
            Title.Alignment = taCenter
            Title.Caption = 'PARCELA'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -9
            Title.Font.Name = 'helvetica'
            Title.Font.Pitch = fpVariable
            Title.Font.Style = []
            Width = 50
            Visible = True
          end>
      end
      object dtxSituacaoCarta: TtecDBText
        Left = 0
        Top = 122
        Width = 721
        Height = 23
        TabStop = False
        Color = clBtnFace
        DataField = 'Situacao'
        DataSource = dtmConsultaDadosCliente.dsrCartasCliente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        Alignment = taLeftJustify
      end
      object dbgCartas: TtecDBGrid
        Left = 0
        Top = 0
        Width = 522
        Height = 138
        Align = alLeft
        DataSource = dsrCartasCliente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -12
        TitleFont.Name = 'helvetica'
        TitleFont.Pitch = fpVariable
        TitleFont.Style = []
        RowWrap = 60
        Large = False
        DoubleRowColor = False
        TitleMinHeight = 100
        CellHeights = 100
        StrippedColor = 16054260
        CanDelete = False
        CanNotInsertFromGrid = False
        PostOnEnter = False
        PostOnSetUpDown = False
        DenySort = False
        DefaultRowHeight = 16
        ExibirNumerodaLinha = False
        NaoAtribuirDadosaTabelaaoDigitar = False
        ShowWhenFieldInvisible = False
        CanClickWhenEditing = False
        Columns = <
          item
            Expanded = False
            FieldName = 'numero'
            Title.Alignment = taCenter
            Title.Caption = 'CARTA'
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
            FieldName = 'eavalista'
            Title.Caption = 'AVAL'
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
            FieldName = 'tipocarta'
            Title.Alignment = taCenter
            Title.Caption = 'T'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -9
            Title.Font.Name = 'helvetica'
            Title.Font.Pitch = fpVariable
            Title.Font.Style = []
            Width = 20
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'descricao'
            Title.Alignment = taCenter
            Title.Caption = 'TIPO DE CARTA'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -9
            Title.Font.Name = 'helvetica'
            Title.Font.Pitch = fpVariable
            Title.Font.Style = []
            Width = 143
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'enviada'
            Title.Alignment = taCenter
            Title.Caption = 'ENVIADA'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -9
            Title.Font.Name = 'helvetica'
            Title.Font.Pitch = fpVariable
            Title.Font.Style = []
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'voltou'
            Title.Alignment = taCenter
            Title.Caption = 'DEVOLVIDA'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -9
            Title.Font.Name = 'helvetica'
            Title.Font.Pitch = fpVariable
            Title.Font.Style = []
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'confirmacao'
            Title.Caption = 'CONFIRMA'#199#195'O'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -9
            Title.Font.Name = 'helvetica'
            Title.Font.Pitch = fpVariable
            Title.Font.Style = []
            Width = 75
            Visible = True
          end>
      end
    end
    object tstSPC: TTabSheet
      Caption = 'S&PC'
      ImageIndex = 2
      object dbgParcelasSPC: TtecDBGrid
        Left = 502
        Top = 0
        Width = 219
        Height = 138
        Align = alClient
        DataSource = dsrParcelasSPC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -13
        TitleFont.Name = 'helvetica'
        TitleFont.Pitch = fpVariable
        TitleFont.Style = []
        RowWrap = 60
        Large = False
        DoubleRowColor = False
        TitleMinHeight = 100
        CellHeights = 100
        StrippedColor = 16054260
        CanDelete = False
        CanNotInsertFromGrid = False
        PostOnEnter = False
        PostOnSetUpDown = False
        DenySort = False
        DefaultRowHeight = 16
        ExibirNumerodaLinha = False
        NaoAtribuirDadosaTabelaaoDigitar = False
        ShowWhenFieldInvisible = False
        CanClickWhenEditing = False
        Columns = <
          item
            Expanded = False
            FieldName = 'contratoparcela'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Title.Alignment = taCenter
            Title.Caption = 'CONTRATO'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -9
            Title.Font.Name = 'helvetica'
            Title.Font.Pitch = fpVariable
            Title.Font.Style = []
            Width = 110
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'parcela'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Title.Alignment = taCenter
            Title.Caption = 'PARCELA'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -9
            Title.Font.Name = 'helvetica'
            Title.Font.Pitch = fpVariable
            Title.Font.Style = []
            Width = 50
            Visible = True
          end>
      end
      object dbgSPC: TtecDBGrid
        Left = 0
        Top = 0
        Width = 502
        Height = 138
        Align = alLeft
        DataSource = dsrSPCCliente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -13
        TitleFont.Name = 'helvetica'
        TitleFont.Pitch = fpVariable
        TitleFont.Style = []
        RowWrap = 60
        Large = False
        DoubleRowColor = False
        TitleMinHeight = 100
        CellHeights = 100
        StrippedColor = 16054260
        CanDelete = False
        CanNotInsertFromGrid = False
        PostOnEnter = False
        PostOnSetUpDown = False
        DenySort = False
        DefaultRowHeight = 16
        ExibirNumerodaLinha = False
        NaoAtribuirDadosaTabelaaoDigitar = False
        ShowWhenFieldInvisible = False
        CanClickWhenEditing = False
        Columns = <
          item
            Expanded = False
            FieldName = 'spc'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Title.Alignment = taCenter
            Title.Caption = 'SPC'
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
            FieldName = 'datainclusao'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Title.Alignment = taCenter
            Title.Caption = 'INCLUS'#195'O'
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
            FieldName = 'dataexclusao'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Title.Alignment = taCenter
            Title.Caption = 'EXCLUS'#195'O'
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
            FieldName = 'registrado'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Title.Alignment = taCenter
            Title.Caption = 'REGISTRADO'
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
            FieldName = 'eavalista'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Title.Alignment = taCenter
            Title.Caption = 'AVAL'
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
            FieldName = 'datavencto'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Title.Alignment = taCenter
            Title.Caption = 'VENCTO'
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
            FieldName = 'valordebito'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Title.Alignment = taCenter
            Title.Caption = 'VALOR D'#201'BITO'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -9
            Title.Font.Name = 'helvetica'
            Title.Font.Pitch = fpVariable
            Title.Font.Style = []
            Width = 85
            Visible = True
          end>
      end
      object dtxSituacaoSPC: TtecDBText
        Left = 0
        Top = 122
        Width = 721
        Height = 24
        TabStop = False
        Color = clBtnFace
        DataField = 'Situacao'
        DataSource = dtmConsultaDadosCliente.dsrSPCCliente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
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
    object tstCobranca: TTabSheet
      Caption = 'Co&bran'#231'a'
      ImageIndex = 3
      object dbgCobranca: TtecDBGrid
        Left = 0
        Top = 0
        Width = 327
        Height = 138
        Align = alLeft
        DataSource = dsrAtendimentosCliente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -13
        TitleFont.Name = 'helvetica'
        TitleFont.Pitch = fpVariable
        TitleFont.Style = []
        RowWrap = 60
        Large = False
        DoubleRowColor = False
        TitleMinHeight = 100
        CellHeights = 100
        StrippedColor = 16054260
        CanDelete = False
        CanNotInsertFromGrid = False
        PostOnEnter = False
        PostOnSetUpDown = False
        DenySort = False
        DefaultRowHeight = 16
        ExibirNumerodaLinha = False
        NaoAtribuirDadosaTabelaaoDigitar = False
        ShowWhenFieldInvisible = False
        CanClickWhenEditing = False
        Columns = <
          item
            Expanded = False
            FieldName = 'data'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Title.Alignment = taCenter
            Title.Caption = 'DATA'
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
            FieldName = 'lembrar'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Title.Alignment = taCenter
            Title.Caption = 'LEMBRAR'
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
            FieldName = 'semspc'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Title.Alignment = taCenter
            Title.Caption = 'SEM SPC AT'#201
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
            FieldName = 'semaviso'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Title.Alignment = taCenter
            Title.Caption = 'SEM AVISO AT'#201
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -9
            Title.Font.Name = 'helvetica'
            Title.Font.Pitch = fpVariable
            Title.Font.Style = []
            Width = 70
            Visible = True
          end>
      end
      object mmoCobrancaInformes: TtecDBMemo
        Left = 327
        Top = 0
        Width = 394
        Height = 138
        Align = alClient
        DataField = 'informes'
        DataSource = dsrAtendimentosCliente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
    end
    object tstCheques: TTabSheet
      Caption = 'C&heques'
      ImageIndex = 4
      object pgcCheques: TtecPageControl
        Left = 0
        Top = 0
        Width = 721
        Height = 138
        ActivePage = tstCheques1
        Align = alClient
        TabOrder = 0
        TabWidth = 100
        object tstCheques1: TTabSheet
          Caption = '  &1 - Cheques'
          object dbgCheques: TtecDBGrid
            Left = 0
            Top = 0
            Width = 713
            Height = 107
            Align = alClient
            DataSource = dsrCheques
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clBlack
            TitleFont.Height = -13
            TitleFont.Name = 'helvetica'
            TitleFont.Pitch = fpVariable
            TitleFont.Style = []
            RowWrap = 60
            Large = False
            DoubleRowColor = False
            TitleMinHeight = 100
            CellHeights = 100
            StrippedColor = 16054260
            CanDelete = False
            CanNotInsertFromGrid = False
            PostOnEnter = False
            PostOnSetUpDown = False
            DenySort = False
            DefaultRowHeight = 16
            ExibirNumerodaLinha = False
            NaoAtribuirDadosaTabelaaoDigitar = False
            ShowWhenFieldInvisible = False
            CanClickWhenEditing = False
            Columns = <
              item
                Expanded = False
                FieldName = 'data'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
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
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                Title.Alignment = taCenter
                Title.Caption = 'VENCTO'
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
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                Title.Alignment = taCenter
                Title.Caption = 'VALOR'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 100
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'filial'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                Title.Alignment = taCenter
                Title.Caption = 'FILIAL'
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
                FieldName = 'titular'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                Title.Alignment = taCenter
                Title.Caption = 'TITULAR'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Width = 315
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'situacao'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'helvetica'
                Font.Pitch = fpVariable
                Font.Style = []
                Title.Alignment = taCenter
                Title.Caption = 'SITUA'#199#195'O'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -9
                Title.Font.Name = 'helvetica'
                Title.Font.Pitch = fpVariable
                Title.Font.Style = []
                Visible = True
              end>
          end
        end
        object tstResgate: TTabSheet
          Caption = '  &2 - Resgates'
          ImageIndex = 1
          object dbgResgates: TtecDBGrid
            Left = 0
            Top = 0
            Width = 713
            Height = 107
            Align = alClient
            DataSource = dsrParcelasCheques
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clBlack
            TitleFont.Height = -13
            TitleFont.Name = 'helvetica'
            TitleFont.Pitch = fpVariable
            TitleFont.Style = []
            RowWrap = 60
            Large = False
            DoubleRowColor = False
            TitleMinHeight = 100
            CellHeights = 100
            StrippedColor = 16054260
            CanDelete = False
            CanNotInsertFromGrid = False
            PostOnEnter = False
            PostOnSetUpDown = False
            DenySort = False
            DefaultRowHeight = 16
            ExibirNumerodaLinha = False
            NaoAtribuirDadosaTabelaaoDigitar = False
            ShowWhenFieldInvisible = False
            CanClickWhenEditing = False
            Columns = <
              item
                Expanded = False
                FieldName = 'numero'
                Title.Alignment = taCenter
                Title.Caption = 'NP'
                Width = 30
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'datavencto'
                Title.Alignment = taCenter
                Title.Caption = 'Vencto.'
                Width = 75
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'valorvencto'
                Title.Alignment = taCenter
                Title.Caption = 'Valor Vencto.'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'datapagto'
                Title.Alignment = taCenter
                Title.Caption = 'Pagto.'
                Width = 75
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'valorpagto'
                Title.Alignment = taCenter
                Title.Caption = 'Valor Pagto.'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'tipopagto'
                Title.Alignment = taCenter
                Title.Caption = 'TP'
                Width = 30
                Visible = True
              end>
          end
        end
      end
    end
    object tstSaldoCredito: TTabSheet
      Caption = '&Saldo de cr'#233'dito'
      ImageIndex = 5
      object sbnIncluirSaldo: TSpeedButton
        Left = 2
        Top = 115
        Width = 103
        Height = 23
        Hint = 'Incluir produto no contrato'
        Caption = 'Incluir Saldo'
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
        ParentFont = False
        OnClick = sbnIncluirSaldoClick
      end
      object dbgSaldoTroca: TtecDBGrid
        Left = 0
        Top = 0
        Width = 721
        Height = 113
        Align = alTop
        DataSource = dsrSaldoTroca
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -13
        TitleFont.Name = 'helvetica'
        TitleFont.Pitch = fpVariable
        TitleFont.Style = []
        RowWrap = 60
        Large = False
        DoubleRowColor = False
        TitleMinHeight = 100
        CellHeights = 100
        StrippedColor = 16054260
        CanDelete = False
        CanNotInsertFromGrid = False
        PostOnEnter = False
        PostOnSetUpDown = False
        DenySort = False
        DefaultRowHeight = 16
        ExibirNumerodaLinha = False
        NaoAtribuirDadosaTabelaaoDigitar = False
        ShowWhenFieldInvisible = False
        CanClickWhenEditing = False
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'tipo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Title.Alignment = taCenter
            Title.Caption = 'TIPO'
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
            FieldName = 'data'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Title.Alignment = taCenter
            Title.Caption = 'DATA'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -9
            Title.Font.Name = 'helvetica'
            Title.Font.Pitch = fpVariable
            Title.Font.Style = []
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Descricao'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Title.Alignment = taCenter
            Title.Caption = 'REFER'#202'NCIA'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -9
            Title.Font.Name = 'helvetica'
            Title.Font.Pitch = fpVariable
            Title.Font.Style = []
            Width = 388
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'valor'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
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
            FieldName = 'saldo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Title.Alignment = taCenter
            Title.Caption = 'SALDO'
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
      object gbxSaldoAtual: TGroupBox
        Left = 590
        Top = 106
        Width = 105
        Height = 36
        Caption = 'SALDO ATUAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object edtSaldoAtual: TDBEditNumero
          Left = 2
          Top = 10
          Width = 100
          Height = 23
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
          Alignment = taLeftJustify
          TipoMascara = tmGERAL
          NrDecimal = 2
          Decimais = True
          Negativo = False
          Tamanho = 9
          DataField = 'valor'
          DataSource = dsrSaldoAtual
        end
      end
    end
    object tstCashBack: TTabSheet
      Caption = 'Cash Back'
      ImageIndex = 6
      object DBAdvGridcashback_saldos: TDBAdvGrid
        Left = 0
        Top = 0
        Width = 721
        Height = 104
        Cursor = crDefault
        Align = alClient
        ColCount = 13
        RowCount = 2
        FixedRows = 1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
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
        Grouping.AutoSelectGroup = True
        Grouping.AutoCheckGroup = True
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
            FieldName = 'data_hora_lancamento'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Header = 'Lan'#231'amento'
            HeaderFont.Charset = DEFAULT_CHARSET
            HeaderFont.Color = clBlack
            HeaderFont.Height = -11
            HeaderFont.Name = 'Helvetica'
            HeaderFont.Pitch = fpVariable
            HeaderFont.Style = []
            HeaderAlignment = taCenter
            PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
            PrintFont.Charset = DEFAULT_CHARSET
            PrintFont.Color = clBlack
            PrintFont.Height = -11
            PrintFont.Name = 'Helvetica'
            PrintFont.Pitch = fpVariable
            PrintFont.Style = []
            Width = 98
          end
          item
            Borders = []
            BorderPen.Color = clSilver
            CheckFalse = 'N'
            CheckTrue = 'Y'
            Color = clWindow
            FieldName = 'data_hora'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Header = 'Refer'#234'ncia'
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
            Width = 104
          end
          item
            Borders = []
            BorderPen.Color = clSilver
            CheckFalse = 'N'
            CheckTrue = 'Y'
            Color = clWindow
            EditLength = 50
            FieldName = 'contrato'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Header = 'Contrato'
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
            Width = 80
          end
          item
            Alignment = taRightJustify
            Borders = []
            BorderPen.Color = clSilver
            CheckFalse = 'N'
            CheckTrue = 'Y'
            Color = clWindow
            FieldName = 'parcela'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Header = 'Parcela'
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
            Width = 39
          end
          item
            Borders = []
            BorderPen.Color = clSilver
            CheckFalse = 'N'
            CheckTrue = 'Y'
            Color = clWindow
            EditLength = 50
            FieldName = 'status'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Header = 'Status'
            HeaderFont.Charset = DEFAULT_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -11
            HeaderFont.Name = 'MS Sans Serif'
            HeaderFont.Pitch = fpVariable
            HeaderFont.Style = []
            HeaderAlignment = taCenter
            PictureStretch = noStretch
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
            Alignment = taRightJustify
            Borders = []
            BorderPen.Color = clSilver
            CheckFalse = 'N'
            CheckTrue = 'Y'
            Color = clWindow
            FieldName = 'cashback'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Header = 'CashBack'
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
            Width = 64
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
            Font.Height = -11
            Font.Name = 'Helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Header = 'Descri'#231#227'o CashBack'
            HeaderFont.Charset = DEFAULT_CHARSET
            HeaderFont.Color = clBlack
            HeaderFont.Height = -11
            HeaderFont.Name = 'MS Sans Serif'
            HeaderFont.Pitch = fpVariable
            HeaderFont.Style = []
            PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
            PrintFont.Charset = DEFAULT_CHARSET
            PrintFont.Color = clBlack
            PrintFont.Height = -13
            PrintFont.Name = 'Tahoma'
            PrintFont.Pitch = fpVariable
            PrintFont.Style = []
            Width = 125
          end
          item
            Borders = []
            BorderPen.Color = clSilver
            CheckFalse = 'N'
            CheckTrue = 'Y'
            Color = clWindow
            FieldName = 'validade'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Header = 'Validade'
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
            Width = 94
          end
          item
            Borders = []
            BorderPen.Color = clSilver
            CheckFalse = 'N'
            CheckTrue = 'Y'
            Color = clWindow
            FieldName = 'disponibilidade'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Header = 'Dispon. em'
            HeaderFont.Charset = DEFAULT_CHARSET
            HeaderFont.Color = clBlack
            HeaderFont.Height = -11
            HeaderFont.Name = 'MS Sans Serif'
            HeaderFont.Pitch = fpVariable
            HeaderFont.Style = []
            HeaderAlignment = taCenter
            PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
            PrintFont.Charset = DEFAULT_CHARSET
            PrintFont.Color = clBlack
            PrintFont.Height = -11
            PrintFont.Name = 'Helvetica'
            PrintFont.Pitch = fpVariable
            PrintFont.Style = []
            Width = 82
          end
          item
            Borders = []
            BorderPen.Color = clSilver
            CheckFalse = 'N'
            CheckTrue = 'Y'
            Color = clWindow
            FieldName = 'codigovisual'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Header = 'Produto'
            HeaderFont.Charset = DEFAULT_CHARSET
            HeaderFont.Color = clBlack
            HeaderFont.Height = -11
            HeaderFont.Name = 'MS Sans Serif'
            HeaderFont.Pitch = fpVariable
            HeaderFont.Style = []
            PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
            PrintFont.Charset = DEFAULT_CHARSET
            PrintFont.Color = clBlack
            PrintFont.Height = -13
            PrintFont.Name = 'Tahoma'
            PrintFont.Pitch = fpVariable
            PrintFont.Style = []
            Width = 58
          end
          item
            Alignment = taRightJustify
            Borders = []
            BorderPen.Color = clSilver
            CheckFalse = 'N'
            CheckTrue = 'Y'
            Color = clWindow
            FieldName = 'valor'
            FloatFormat = '%.2n'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Helvetica'
            Font.Pitch = fpVariable
            Font.Style = []
            Header = 'Valor'
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
            Width = 69
          end
          item
            Alignment = taRightJustify
            Borders = []
            BorderPen.Color = clSilver
            CheckFalse = 'N'
            CheckTrue = 'Y'
            Color = clWindow
            FieldName = 'saldo'
            FloatFormat = '%.2n'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Helvetica'
            Font.Pitch = fpVariable
            Font.Style = [fsBold]
            Header = 'Saldo'
            HeaderFont.Charset = DEFAULT_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -11
            HeaderFont.Name = 'MS Sans Serif'
            HeaderFont.Pitch = fpVariable
            HeaderFont.Style = [fsBold]
            HeaderAlignment = taCenter
            PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
            PrintFont.Charset = DEFAULT_CHARSET
            PrintFont.Color = clWindowText
            PrintFont.Height = -11
            PrintFont.Name = 'MS Sans Serif'
            PrintFont.Pitch = fpVariable
            PrintFont.Style = []
            Width = 73
          end>
        DataSource = dsrcashback_saldos
        PageMode = False
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
          98
          104
          80
          39
          31
          64
          125
          94
          82
          58
          69
          73)
      end
      object pnlBottomCashBack: TPanel
        Left = 0
        Top = 104
        Width = 721
        Height = 34
        Align = alBottom
        TabOrder = 1
        object sbnIncluirSaldoCashBack: TSpeedButton
          Left = 2
          Top = 2
          Width = 103
          Height = 28
          Hint = 'Acertar valores de CashBack'
          Caption = 'Incluir Saldo'
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
          ParentFont = False
          OnClick = sbnIncluirSaldoCashBackClick
        end
        object GroupBox3: TGroupBox
          Left = 600
          Top = -1
          Width = 105
          Height = 36
          Caption = 'SALDO ATUAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object DBEditNumero1: TDBEditNumero
            Left = 2
            Top = 10
            Width = 100
            Height = 23
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
            Negativo = True
            Tamanho = 9
            DataField = 'saldofinal'
            DataSource = dsrcashback_saldos
          end
        end
      end
    end
    object tstPontualidade: TTabSheet
      Caption = 'Pontualidade'
      ImageIndex = 7
      object GroupBox2: TGroupBox
        Left = 216
        Top = 1
        Width = 98
        Height = 36
        Caption = 'ATRASO M'#201'DIO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object Label32: TLabel
          Left = 61
          Top = 15
          Width = 32
          Height = 15
          Caption = 'dia(s)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
        end
        object tecDBText47: TtecDBText
          Left = 7
          Top = 11
          Width = 50
          Height = 23
          TabStop = False
          Color = clBtnFace
          DataField = 'atrasomedio'
          DataSource = dsrLimitesCredito
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
      object gbxAtrasoHoje: TGroupBox
        Left = 216
        Top = 83
        Width = 98
        Height = 36
        Caption = 'ATRASO HOJE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object Label37: TLabel
          Left = 62
          Top = 15
          Width = 32
          Height = 15
          Caption = 'dia(s)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
        end
        object tecDBText51: TtecDBText
          Left = 7
          Top = 11
          Width = 53
          Height = 23
          TabStop = False
          Color = clBtnFace
          DataField = 'atrasohoje'
          DataSource = dsrLimitesCredito
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          Alignment = taLeftJustify
        end
      end
      object gbxMaiorAtraso: TGroupBox
        Left = 5
        Top = 1
        Width = 98
        Height = 119
        Caption = 'MAIOR ATRASO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        object lblDiasMaior: TLabel
          Left = 61
          Top = 18
          Width = 32
          Height = 15
          Caption = 'dia(s)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
        end
        object gbxDataMaiorAtraso: TGroupBox
          Left = 6
          Top = 38
          Width = 86
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
          object tecDBText50: TtecDBText
            Left = 3
            Top = 10
            Width = 80
            Height = 23
            Hint = 'Sal'#225'rio do cliente, limitido pela tabela de cargos'
            TabStop = False
            Color = clBtnFace
            DataField = 'datamaioratraso'
            DataSource = dsrLimitesCredito
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
        object gbxValorMaiorAtraso: TGroupBox
          Left = 6
          Top = 77
          Width = 86
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
          object tecDBText49: TtecDBText
            Left = 3
            Top = 10
            Width = 80
            Height = 23
            Hint = 'Sal'#225'rio do cliente, limitido pela tabela de cargos'
            TabStop = False
            Color = clBtnFace
            DataField = 'valormaioratraso'
            DataSource = dsrLimitesCredito
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
        object tecDBText48: TtecDBText
          Left = 7
          Top = 14
          Width = 50
          Height = 23
          TabStop = False
          Color = clBtnFace
          DataField = 'maioratraso'
          DataSource = dsrLimitesCredito
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
      object gbxUltimoAtraso: TGroupBox
        Left = 110
        Top = 1
        Width = 99
        Height = 119
        Caption = #218'LTIMO ATRASO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        object Label36: TLabel
          Left = 61
          Top = 18
          Width = 32
          Height = 15
          Caption = 'dia(s)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
        end
        object gbxDataUltimoAtraso: TGroupBox
          Left = 6
          Top = 38
          Width = 86
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
          object tecDBText54: TtecDBText
            Left = 3
            Top = 10
            Width = 80
            Height = 23
            Hint = 'Sal'#225'rio do cliente, limitido pela tabela de cargos'
            TabStop = False
            Color = clBtnFace
            DataField = 'dataultimoatraso'
            DataSource = dsrLimitesCredito
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
        object gbxValorUltimoAtraso: TGroupBox
          Left = 6
          Top = 77
          Width = 86
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
          object tecDBText53: TtecDBText
            Left = 3
            Top = 10
            Width = 80
            Height = 23
            Hint = 'Sal'#225'rio do cliente, limitido pela tabela de cargos'
            TabStop = False
            Color = clBtnFace
            DataField = 'valorultimoatraso'
            DataSource = dsrLimitesCredito
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
        object tecDBText52: TtecDBText
          Left = 7
          Top = 14
          Width = 50
          Height = 23
          TabStop = False
          Color = clBtnFace
          DataField = 'ultimoatraso'
          DataSource = dsrLimitesCredito
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
    end
    object tstLimitesCredito: TTabSheet
      Caption = 'Limites de cr'#233'dito'
      ImageIndex = 6
      object lblDebitos: TLabel
        Left = 412
        Top = 0
        Width = 51
        Height = 14
        Caption = ' D'#201'BITOS '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 586
        Top = 0
        Width = 56
        Height = 14
        Caption = ' A VENCER'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 495
        Top = 0
        Width = 66
        Height = 14
        Caption = ' EM ATRASO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = [fsBold]
        ParentFont = False
      end
      object GroupBox7: TGroupBox
        Left = 386
        Top = 7
        Width = 271
        Height = 120
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        object lblAtraso30: TLabel
          Left = 35
          Top = 12
          Width = 61
          Height = 15
          Hint = 'Sal'#225'rio do cliente, limitido pela tabela de cargos'
          Alignment = taRightJustify
          Caption = 'At'#233' 30 dias'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
        end
        object lblAtraso60: TLabel
          Left = 9
          Top = 34
          Width = 87
          Height = 15
          Hint = 'Sal'#225'rio do cliente, limitido pela tabela de cargos'
          Alignment = taRightJustify
          Caption = 'De 31 a 60 dias'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
        end
        object lblAtrasoMais60: TLabel
          Left = 9
          Top = 56
          Width = 87
          Height = 15
          Hint = 'Sal'#225'rio do cliente, limitido pela tabela de cargos'
          Alignment = taRightJustify
          Caption = 'Mais de 60 dias'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
        end
        object lblAtrasoTotal: TLabel
          Left = 59
          Top = 78
          Width = 37
          Height = 15
          Hint = 'Sal'#225'rio do cliente, limitido pela tabela de cargos'
          Alignment = taRightJustify
          Caption = 'TOTAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label7: TLabel
          Left = 29
          Top = 101
          Width = 149
          Height = 15
          Hint = 'Sal'#225'rio do cliente, limitido pela tabela de cargos'
          Alignment = taRightJustify
          Caption = 'VALOR TOTAL EM ABERTO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          ParentFont = False
        end
        object tecDBText55: TtecDBText
          Left = 102
          Top = 7
          Width = 80
          Height = 23
          Hint = 'Sal'#225'rio do cliente, limitido pela tabela de cargos'
          TabStop = False
          Color = clBtnFace
          DataField = 'ate30diasematraso'
          DataSource = dsrLimitesCredito
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
        object tecDBText56: TtecDBText
          Left = 102
          Top = 29
          Width = 80
          Height = 23
          Hint = 'Sal'#225'rio do cliente, limitido pela tabela de cargos'
          TabStop = False
          Color = clBtnFace
          DataField = 'de31diasematraso'
          DataSource = dsrLimitesCredito
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
        object tecDBText57: TtecDBText
          Left = 102
          Top = 51
          Width = 80
          Height = 23
          Hint = 'Sal'#225'rio do cliente, limitido pela tabela de cargos'
          TabStop = False
          Color = clBtnFace
          DataField = 'mais60diasematraso'
          DataSource = dsrLimitesCredito
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
        object tecDBText62: TtecDBText
          Left = 102
          Top = 73
          Width = 80
          Height = 23
          Hint = 
            'Total da renda do cliente considerada para o c'#225'lculo dos limites' +
            ' de cr'#233'dito'
          TabStop = False
          Color = clBtnFace
          DataField = 'totalematraso'
          DataSource = dsrLimitesCredito
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
          Alignment = taLeftJustify
        end
        object tecDBText58: TtecDBText
          Left = 188
          Top = 7
          Width = 80
          Height = 23
          TabStop = False
          Color = clBtnFace
          DataField = 'ate30diasavencer'
          DataSource = dsrLimitesCredito
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
          Alignment = taLeftJustify
        end
        object tecDBText59: TtecDBText
          Left = 188
          Top = 29
          Width = 80
          Height = 23
          Hint = 'Sal'#225'rio do cliente, limitido pela tabela de cargos'
          TabStop = False
          Color = clBtnFace
          DataField = 'de31diasavencer'
          DataSource = dsrLimitesCredito
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
          Alignment = taLeftJustify
        end
        object tecDBText60: TtecDBText
          Left = 188
          Top = 51
          Width = 80
          Height = 23
          Hint = 'Sal'#225'rio do cliente, limitido pela tabela de cargos'
          TabStop = False
          Color = clBtnFace
          DataField = 'mais60diasavencer'
          DataSource = dsrLimitesCredito
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 6
          Alignment = taLeftJustify
        end
        object tecDBText63: TtecDBText
          Left = 188
          Top = 73
          Width = 80
          Height = 23
          Hint = 
            'Total da renda do cliente considerada para o c'#225'lculo dos limites' +
            ' de cr'#233'dito'
          TabStop = False
          Color = clBtnFace
          DataField = 'totalavencer'
          DataSource = dsrLimitesCredito
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 7
          Alignment = taLeftJustify
        end
        object Panel3: TPanel
          Left = 184
          Top = 5
          Width = 2
          Height = 114
          TabOrder = 8
        end
        object Panel4: TPanel
          Left = 98
          Top = 6
          Width = 2
          Height = 96
          TabOrder = 9
        end
        object tecDBText4: TtecDBText
          Left = 188
          Top = 95
          Width = 80
          Height = 23
          Hint = 
            'Total da renda do cliente considerada para o c'#225'lculo dos limites' +
            ' de cr'#233'dito'
          TabStop = False
          Color = clBtnFace
          DataField = 'totalemaberto'
          DataSource = dsrLimitesCredito
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 10
          Alignment = taLeftJustify
        end
      end
      object gbxRendas: TGroupBox
        Left = 4
        Top = 0
        Width = 184
        Height = 127
        Hint = 'Rendas atribu'#237'das ao cliente'
        Caption = 'RENDAS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object Label23: TLabel
          Left = 56
          Top = 14
          Width = 39
          Height = 15
          Hint = 'Sal'#225'rio do cliente, limitido pela tabela de cargos'
          Alignment = taRightJustify
          Caption = 'Cliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
        end
        object Label24: TLabel
          Left = 48
          Top = 37
          Width = 47
          Height = 15
          Hint = 
            'Percentual da renda do c'#244'njuge que est'#225' liberada para compor a r' +
            'enda do cliente'
          Alignment = taRightJustify
          Caption = 'C'#244'njuge'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
        end
        object Label25: TLabel
          Left = 58
          Top = 59
          Width = 37
          Height = 15
          Hint = 'Outras rendas declaradas pelo cliente'
          Alignment = taRightJustify
          Caption = 'Outras'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
        end
        object Label26: TLabel
          Left = 50
          Top = 81
          Width = 45
          Height = 15
          Hint = #212'nus das d'#237'vidas do cliente (aluguel, empr'#233'stimos, etc)'
          Alignment = taRightJustify
          Caption = '(-) '#212'nus'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
        end
        object Label27: TLabel
          Left = 58
          Top = 104
          Width = 37
          Height = 15
          Hint = 
            'Total da renda do cliente considerada para o c'#225'lculo dos limites' +
            ' de cr'#233'dito'
          Alignment = taRightJustify
          Caption = 'TOTAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label34: TLabel
          Left = 36
          Top = 37
          Width = 9
          Height = 15
          Caption = '%'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          ParentFont = False
        end
        object tecDBText36: TtecDBText
          Left = 100
          Top = 12
          Width = 80
          Height = 23
          Hint = 'Sal'#225'rio do cliente, limitido pela tabela de cargos'
          TabStop = False
          Color = clBtnFace
          DataField = 'rendacliente'
          DataSource = dsrLimitesCredito
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
        object tecDBText37: TtecDBText
          Left = 5
          Top = 34
          Width = 30
          Height = 23
          Hint = 
            'Percentual da renda do c'#244'njuge que est'#225' liberada para compor a r' +
            'enda do cliente'
          TabStop = False
          Color = clBtnFace
          DataField = 'rendabaseconjuge'
          DataSource = dsrLimitesCredito
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
        object tecDBText38: TtecDBText
          Left = 100
          Top = 34
          Width = 80
          Height = 23
          Hint = 
            'Valor da renda do c'#244'njuge que est'#225' liberada para compor a renda ' +
            'do cliente'
          TabStop = False
          Color = clBtnFace
          DataField = 'rendaconjuge'
          DataSource = dsrLimitesCredito
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
        object tecDBText39: TtecDBText
          Left = 100
          Top = 56
          Width = 80
          Height = 23
          Hint = 'Outras rendas declaradas pelo cliente'
          TabStop = False
          Color = clBtnFace
          DataField = 'outrasrendas'
          DataSource = dsrLimitesCredito
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
          Alignment = taLeftJustify
        end
        object tecDBText40: TtecDBText
          Left = 100
          Top = 78
          Width = 80
          Height = 23
          Hint = #212'nus das d'#237'vidas do cliente (aluguel, empr'#233'stimos, etc)'
          TabStop = False
          Color = clBtnFace
          DataField = 'onus'
          DataSource = dsrLimitesCredito
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
          Alignment = taLeftJustify
        end
        object tecDBText41: TtecDBText
          Left = 100
          Top = 101
          Width = 80
          Height = 23
          Hint = 
            'Total da renda do cliente considerada para o c'#225'lculo dos limites' +
            ' de cr'#233'dito'
          TabStop = False
          Color = clBtnFace
          DataField = 'totalrenda'
          DataSource = dsrLimitesCredito
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
          Alignment = taLeftJustify
        end
        object Panel2: TPanel
          Left = 97
          Top = 10
          Width = 2
          Height = 115
          TabOrder = 6
        end
      end
      object GroupBox6: TGroupBox
        Left = 194
        Top = 0
        Width = 185
        Height = 127
        Caption = 'LIMITES DE CR'#201'DITO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object Label28: TLabel
          Left = 16
          Top = 20
          Width = 71
          Height = 15
          Alignment = taRightJustify
          Caption = 'N'#186' de pontos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
        end
        object Label33: TLabel
          Left = 174
          Top = 21
          Width = 9
          Height = 15
          Caption = '%'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 17
          Top = 54
          Width = 76
          Height = 15
          Alignment = taRightJustify
          Caption = 'LIMITE TOTAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
        end
        object Label3: TLabel
          Left = 19
          Top = 79
          Width = 71
          Height = 15
          Alignment = taRightJustify
          Caption = 'DISPON'#205'VEL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
        end
        object Label4: TLabel
          Left = 14
          Top = 101
          Width = 83
          Height = 15
          Alignment = taRightJustify
          Caption = 'POR PARCELA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
        end
        object tecDBText42: TtecDBText
          Left = 103
          Top = 18
          Width = 41
          Height = 23
          TabStop = False
          Color = clBtnFace
          DataField = 'pontos'
          DataSource = dsrLimitesCredito
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
        object tecDBText43: TtecDBText
          Left = 145
          Top = 18
          Width = 28
          Height = 23
          TabStop = False
          Color = clBtnFace
          DataField = 'basepontos'
          DataSource = dsrLimitesCredito
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
        object tecDBText1: TtecDBText
          Left = 102
          Top = 49
          Width = 80
          Height = 23
          TabStop = False
          Color = clBtnFace
          DataField = 'limitetotal'
          DataSource = dsrLimitesCredito
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
          Alignment = taLeftJustify
        end
        object tecDBText2: TtecDBText
          Left = 102
          Top = 74
          Width = 80
          Height = 23
          TabStop = False
          Color = clBtnFace
          DataField = 'disponivel'
          DataSource = dsrLimitesCredito
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
          Alignment = taLeftJustify
        end
        object tecDBText3: TtecDBText
          Left = 102
          Top = 98
          Width = 80
          Height = 23
          TabStop = False
          Color = clBtnFace
          DataField = 'porparcela'
          DataSource = dsrLimitesCredito
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
          Alignment = taLeftJustify
        end
        object Panel1: TPanel
          Left = 99
          Top = 16
          Width = 2
          Height = 109
          TabOrder = 5
        end
        object Panel5: TPanel
          Left = 1
          Top = 46
          Width = 182
          Height = 2
          TabOrder = 6
        end
      end
    end
  end
  object dtxEmpresa: TtecDBText
    Left = 357
    Top = 0
    Width = 236
    Height = 23
    TabStop = False
    Color = clBtnFace
    DataField = 'empresa'
    DataSource = dsrCliente
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
  object dtxNaturalEstado: TtecDBText
    Left = 357
    Top = 24
    Width = 30
    Height = 23
    TabStop = False
    Color = clBtnFace
    DataField = 'naturalestado'
    DataSource = dsrCliente
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
  object dtxNaturalCidade: TtecDBText
    Left = 71
    Top = 24
    Width = 260
    Height = 23
    TabStop = False
    Color = clBtnFace
    DataField = 'nomenaturalcidade'
    DataSource = dsrCliente
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
    Alignment = taLeftJustify
  end
  object dtxNascimento: TtecDBText
    Left = 71
    Top = 0
    Width = 70
    Height = 23
    TabStop = False
    Color = clBtnFace
    DataField = 'nascto'
    DataSource = dsrCliente
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 4
    Alignment = taLeftJustify
  end
  object dtxDocumento: TtecDBText
    Left = 213
    Top = 0
    Width = 110
    Height = 23
    TabStop = False
    Color = clBtnFace
    DataField = 'iddocumento'
    DataSource = dsrCliente
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 5
    Alignment = taLeftJustify
  end
  object dtxSexo: TtecDBText
    Left = 434
    Top = 24
    Width = 30
    Height = 23
    TabStop = False
    Color = clBtnFace
    DataField = 'sexo'
    DataSource = dsrCliente
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 6
    Alignment = taLeftJustify
  end
  object dtxPessoaNumero: TtecDBText
    Left = 536
    Top = 24
    Width = 134
    Height = 23
    TabStop = False
    Color = clBtnFace
    DataField = 'pessoanumero'
    DataSource = dsrCliente
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 7
    Alignment = taLeftJustify
  end
  object dtxNomeCargo: TtecDBText
    Left = 594
    Top = 0
    Width = 140
    Height = 23
    TabStop = False
    Color = clBtnFace
    DataField = 'nomecargo'
    DataSource = dsrCliente
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 8
    Alignment = taLeftJustify
  end
  object dsrCliente: TtecDataSource
    DataSet = dtmConsultaDadosCliente.qryCliente
    Left = 307
    Top = 145
  end
  object dsrAtendimentosCliente: TtecDataSource
    DataSet = dtmConsultaDadosCliente.qryAtendimentosCliente
    Left = 485
    Top = 145
  end
  object dsrCartasCliente: TtecDataSource
    DataSet = dtmConsultaDadosCliente.qryCartasCliente
    Left = 276
    Top = 145
  end
  object dsrSPCCliente: TtecDataSource
    DataSet = dtmConsultaDadosCliente.qrySPCCliente
    Left = 245
    Top = 145
  end
  object dsrCheques: TtecDataSource
    DataSet = dtmConsultaDadosCliente.qryCheques
    Left = 214
    Top = 145
  end
  object dsrParcelasCheques: TtecDataSource
    DataSet = dtmConsultaDadosCliente.qryParcelasCheques
    Left = 456
    Top = 145
  end
  object dsrParcelasSPC: TtecDataSource
    DataSet = dtmConsultaDadosCliente.qryParcelasSPC
    Left = 426
    Top = 145
  end
  object dsrParcelasCartas: TtecDataSource
    DataSet = dtmConsultaDadosCliente.qryParcelasCartas
    Left = 396
    Top = 145
  end
  object dsrSaldoTroca: TtecDataSource
    DataSet = dtmConsultaDadosCliente.qryProdutosTrocados
    Left = 515
    Top = 145
  end
  object dsrSaldoAtual: TtecDataSource
    DataSet = dtmConsultaDadosCliente.qrySaldoAtual
    Left = 335
    Top = 145
  end
  object dsrLimitesCredito: TtecDataSource
    DataSet = dtmConsultaDadosCliente.qryLimitesCredito
    Left = 365
    Top = 145
  end
  object dsrChequesDevolvidos_aVencer: TtecDataSource
    DataSet = dtmConsultaDadosCliente.cdsChequesDevolvidos_aVencer
    Left = 184
    Top = 144
  end
  object dsrcashback_saldos: TtecDataSource
    DataSet = dtmConsultaDadosCliente.qrycashback_saldos
    Left = 544
    Top = 144
  end
end
