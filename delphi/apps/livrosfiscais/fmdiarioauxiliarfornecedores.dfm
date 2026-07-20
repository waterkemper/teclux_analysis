inherited frmDiarioAuxiliarFornecedores: TfrmDiarioAuxiliarFornecedores
  Left = 580
  Top = 201
  ActiveControl = rgpRelatorio
  Caption = 'Di'#225'rio Auxiliar de Fornecedores'
  ClientHeight = 354
  ClientWidth = 816
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBarra: TToolBar
    Width = 816
  end
  inherited pnlFundoJanela: TPanel
    Top = 52
    Width = 816
    Height = 302
    object rgpRelatorio: TRadioGroup
      Left = 7
      Top = 6
      Width = 154
      Height = 59
      Caption = 'RELAT'#211'RIO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        'EMISS'#195'O DO LIVROS'
        'TERMO DE ABERTURA')
      ParentFont = False
      TabOrder = 0
      OnClick = rgpRelatorioClick
    end
    object gbxPeriodo: TGroupBox
      Left = 6
      Top = 75
      Width = 155
      Height = 96
      Caption = 'PER'#205'ODO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object gbxPeriodoInicial: TGroupBox
        Left = 16
        Top = 9
        Width = 121
        Height = 41
        Caption = 'DE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object edtDataInicial: TEditData
          Left = 22
          Top = 13
          Width = 80
          Height = 23
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
          Maximo = 0
        end
      end
      object gbxPeriodoFinal: TGroupBox
        Left = 16
        Top = 51
        Width = 121
        Height = 40
        Caption = 'AT'#201
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object edtDataFinal: TEditData
          Left = 22
          Top = 12
          Width = 80
          Height = 23
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
          Maximo = 0
        end
      end
    end
    object gbxNumeracao: TGroupBox
      Left = 662
      Top = 6
      Width = 125
      Height = 95
      Caption = 'NUMERA'#199#195'O'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      object lblLivro: TLabel
        Left = 8
        Top = 20
        Width = 28
        Height = 12
        Caption = 'LIVRO'
      end
      object lblPagina: TLabel
        Left = 8
        Top = 45
        Width = 35
        Height = 12
        Caption = 'P'#193'GINA'
      end
      object lblMaximo: TLabel
        Left = 8
        Top = 70
        Width = 35
        Height = 12
        Caption = 'M'#193'XIMO'
      end
      object edtLivro: TEditNumero
        Left = 58
        Top = 16
        Width = 58
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
        Alignment = taLeftJustify
        TipoMascara = tmGERAL
        NrDecimal = 0
        Decimais = False
        Negativo = False
        Tamanho = 4
      end
      object edtPagina: TEditNumero
        Left = 58
        Top = 41
        Width = 58
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
        Text = '2,00'
        Mascara = False
        Alignment = taLeftJustify
        TipoMascara = tmGERAL
        NrDecimal = 0
        Decimais = False
        Negativo = False
        Tamanho = 9
      end
      object edtMaximo: TEditNumero
        Left = 58
        Top = 66
        Width = 58
        Height = 23
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        MaxLength = -1
        ParentFont = False
        TabOrder = 2
        Text = '1.000,00'
        Mascara = False
        Alignment = taLeftJustify
        TipoMascara = tmGERAL
        NrDecimal = 0
        Decimais = False
        Negativo = False
        Tamanho = 9
      end
    end
    object gbxSaldo: TGroupBox
      Left = 167
      Top = 104
      Width = 153
      Height = 67
      Caption = 'SALDOS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      object lblSaldoDebito: TLabel
        Left = 8
        Top = 22
        Width = 34
        Height = 12
        Caption = 'D'#201'BITO'
      end
      object lblSaldoCredito: TLabel
        Left = 8
        Top = 46
        Width = 42
        Height = 12
        Caption = 'CR'#201'DITO'
      end
      object edtSaldoCredito: TEditNumero
        Left = 57
        Top = 38
        Width = 88
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
        Text = '0,00'
        Mascara = True
        Alignment = taLeftJustify
        TipoMascara = tmGERAL
        NrDecimal = 2
        Decimais = True
        Negativo = True
        Tamanho = 9
      end
      object edtSaldoDebito: TEditNumero
        Left = 57
        Top = 14
        Width = 88
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
        Text = '0,00'
        Mascara = True
        Alignment = taLeftJustify
        TipoMascara = tmGERAL
        NrDecimal = 2
        Decimais = True
        Negativo = True
        Tamanho = 9
      end
    end
    inline fraListaFiliais1: TfraListaFiliais
      Left = 327
      Top = 6
      Width = 326
      Height = 166
      TabOrder = 4
      inherited gbxFiliais: TGroupBox
        Height = 166
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        ParentFont = False
        inherited clbFiliais: TCheckListBox
          Top = 13
          Height = 148
          Font.Height = -12
          Font.Name = 'helvetica'
        end
      end
    end
    object gbxCadastramentoSubcontas: TGroupBox
      Left = 5
      Top = 179
      Width = 650
      Height = 120
      Caption = 'CADASTRAMENTO DAS CONTAS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      object dbgCadastramentoContas: TtecDBGrid
        Left = 2
        Top = 13
        Width = 645
        Height = 104
        DataSource = dtmDiarioAuxiliarFornecedores.dsrParametrosFiliais
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
        FixedCols = 1
        RowWrap = 60
        Large = False
        DoubleRowColor = False
        TitleMinHeight = 100
        CellHeights = 100
        StrippedColor = 16054260
        CanDelete = False
        PostOnEnter = True
        DenySort = False
        Columns = <
          item
            Expanded = False
            FieldName = 'nome'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'valor'
            Width = 463
            Visible = True
          end>
      end
    end
    object gbxImprimir: TGroupBox
      Left = 166
      Top = 6
      Width = 155
      Height = 89
      Caption = 'IMPRIMIR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      object ckbLivroAuxiliar: TCheckBox
        Left = 6
        Top = 13
        Width = 123
        Height = 23
        Caption = '&LIVRO AUXILIAR'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        State = cbChecked
        TabOrder = 0
        OnClick = ckbLivroAuxiliarClick
      end
      object ckbCodigosEmitentes: TCheckBox
        Left = 6
        Top = 61
        Width = 131
        Height = 23
        Caption = '&C'#211'DIGOS EMITENTES'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        State = cbChecked
        TabOrder = 2
        OnClick = ckbCodigosEmitentesClick
      end
      object ckbResumoDiario: TCheckBox
        Left = 6
        Top = 37
        Width = 123
        Height = 23
        Caption = 'RESUMO DI'#193'RIO'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        State = cbChecked
        TabOrder = 1
        OnClick = ckbResumoDiarioClick
      end
    end
  end
  object ecvValida: TtecEditionControlValidation
    EditionControl = <
      item
        Control = edtDataFinal
      end
      item
        Control = edtDataInicial
      end
      item
        Control = edtPagina
      end
      item
        Control = edtMaximo
      end>
    Left = 208
    Top = 8
  end
end
