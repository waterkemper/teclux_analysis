inherited frmCadastroChequeFrenteCaixa: TfrmCadastroChequeFrenteCaixa
  Left = 338
  Top = 132
  Width = 528
  Height = 632
  HorzScrollBar.Range = 514
  HorzScrollBar.Visible = False
  VertScrollBar.Range = 467
  VertScrollBar.Visible = False
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  Caption = 'Cheque do Clientes no Frente de Caixa'
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 16
  object sbnImprimirCheque: TSpeedButton [0]
    Left = 345
    Top = 558
    Width = 127
    Height = 27
    Caption = ' I&mprimir cheque'
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
    Transparent = False
    OnClick = sbnImprimirChequeClick
  end
  inherited pnlBarra: TPanel
    Top = 410
    TabOrder = 8
  end
  inherited pnlTopMenu: TPanel
    Width = 514
    TabOrder = 9
    inherited tblBarra: TToolBar
      Width = 289
      DesignSize = (
        287
        41)
    end
  end
  inline fraEnderecoEditor: TfraEnderecoEditor
    Left = 10
    Top = 359
    Width = 500
    Height = 151
    HorzScrollBar.Visible = False
    VertScrollBar.Visible = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    inherited gbxEndereco: TGroupBox
      Width = 500
      Height = 151
      inherited pnlNumero: TPanel
        Width = 496
        inherited edtNumeroEndereco: TDBEditTexto
          DataField = 'numero'
          DataSource = dtmfrentecaixa.dsrCliente
          MaxLength = 9
        end
        inherited edtComplemento: TDBEditTexto
          DataField = 'complemento'
          DataSource = dtmfrentecaixa.dsrCliente
        end
      end
      inherited pnlBairro: TPanel
        Width = 496
        inherited edtBairro: TtecDoubleDBEdit
          LookupField = 'nomebairro'
          LookupSource = dtmfrentecaixa.dsrCliente
          DataField = 'bairro'
          DataSource = dtmfrentecaixa.dsrCliente
          MaxLength = -1
        end
      end
      inherited pnlCidade: TPanel
        Width = 496
        inherited edtEstado: TDBEditTexto
          DataField = 'estado'
          DataSource = dtmfrentecaixa.dsrCliente
          MaxLength = 9
        end
        inherited edtCidade: TtecDoubleDBEdit
          LookupField = 'nomecidade'
          LookupSource = dtmfrentecaixa.dsrCliente
          DataField = 'cidade'
          DataSource = dtmfrentecaixa.dsrCliente
          MaxLength = 9
        end
        inherited edtCEP: TDBEditCep
          DataField = 'cep'
          DataSource = dtmfrentecaixa.dsrCliente
          MaxLength = 9
        end
      end
      inherited pnlRua: TPanel
        Width = 496
        inherited sbnRua: TSpeedButton
          OnClick = fraEnderecoEditorsbnRuaClick
        end
        inherited mmoRua: TtecDBMemo
          DataField = 'rua'
          DataSource = dtmfrentecaixa.dsrCliente
        end
      end
      inherited pnllblCidade: TPanel
        Width = 496
      end
      inherited pnllblBairro: TPanel
        Width = 496
      end
      inherited pnllblNumero: TPanel
        Width = 496
      end
    end
  end
  inline fraFone: TfraTelefone
    Left = 10
    Top = 547
    Width = 151
    Height = 50
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    inherited gbxFone: TGroupBox
      Width = 151
      Height = 50
      inherited edtDDD: TDBEditNumero
        DataField = 'foneddd'
        DataSource = dtmfrentecaixa.dsrCliente
      end
      inherited edtNumero: TDBEditFone
        DataField = 'fonenumero'
        DataSource = dtmfrentecaixa.dsrCliente
      end
    end
  end
  inline fracgcoucpf: Tfracgcoucpf
    Left = 10
    Top = 307
    Width = 288
    Height = 49
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
    inherited gbxCPGouCGC: TGroupBox
      Width = 288
      Height = 49
      inherited rgbTipoPessoa: TtecDBRadioGroup
        Top = 13
        Width = 141
        Height = 29
        DataField = 'pessoatipo'
        DataSource = dtmfrentecaixa.dsrCliente
        OnChange = fracgcoucpfrgbTipoPessoaChange
        inherited rbnFisica: TtecRadioButton
          Left = 8
          Top = 9
        end
        inherited rbnJuridica: TtecRadioButton
          Left = 72
          Top = 9
        end
      end
      inherited gbxCPF_CNPJ: TGroupBox
        Left = 152
        Top = 8
        inherited edtCPFCNPJ: TDBEditCPFCNPJ
          DataField = 'pessoanumero'
          DataSource = dtmfrentecaixa.dsrCliente
          Font.Height = -12
          OnExit = fracgcoucpfedtCPFCNPJExit
        end
      end
    end
  end
  object gbxIdNumero: TGroupBox
    Left = 306
    Top = 307
    Width = 108
    Height = 36
    Caption = 'RG'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -9
    Font.Name = 'helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object edtDocumento: TDBEditDocumento
      Left = 2
      Top = 10
      Width = 103
      Height = 23
      DataField = 'iddocumento'
      DataSource = dtmfrentecaixa.dsrCliente
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
      Tipo = Identidade
    end
  end
  inline fraCelular: TfraTelefone
    Left = 165
    Top = 547
    Width = 151
    Height = 50
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    inherited gbxFone: TGroupBox
      Width = 151
      Height = 50
      Caption = 'CELULAR'
      inherited edtDDD: TDBEditNumero
        DataField = 'fone2ddd'
        DataSource = dtmfrentecaixa.dsrCliente
      end
      inherited edtNumero: TDBEditFone
        DataField = 'fone2numero'
        DataSource = dtmfrentecaixa.dsrCliente
      end
    end
  end
  object gbxEmail: TGroupBox
    Left = 10
    Top = 510
    Width = 249
    Height = 36
    Caption = 'E-MAIL'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -9
    Font.Name = 'helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    object edtemail: TDBEditTexto
      Left = 2
      Top = 10
      Width = 244
      Height = 23
      CharCase = ecLowerCase
      DataField = 'email'
      DataSource = dtmfrentecaixa.dsrCliente
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
  object gbxSite: TGroupBox
    Left = 261
    Top = 510
    Width = 249
    Height = 37
    Caption = 'SITE'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -9
    Font.Name = 'helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    object edtsite: TDBEditTexto
      Left = 2
      Top = 10
      Width = 244
      Height = 23
      CharCase = ecLowerCase
      DataField = 'site'
      DataSource = dtmfrentecaixa.dsrCliente
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
  object gbxNascto: TGroupBox
    Left = 424
    Top = 307
    Width = 85
    Height = 36
    Caption = 'NASCIMENTO'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -9
    Font.Name = 'helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object edtdatanascto: TDBEditData
      Left = 2
      Top = 10
      Width = 80
      Height = 23
      Alignment = taLeftJustify
      DataField = 'nascto'
      DataSource = dtmfrentecaixa.dsrCliente
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
  object Panel1: TPanel
    Left = 32
    Top = 186
    Width = 389
    Height = 36
    TabOrder = 10
    Visible = False
    object Bevel1: TBevel
      Left = 307
      Top = 3
      Width = 3
      Height = 34
    end
  end
  inline fraCMC7: TfraCMC7
    Left = 8
    Top = 56
    Width = 504
    Height = 243
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
    TabOrder = 12
    inherited gbxCMC7: TGroupBox
      Width = 504
      Height = 243
      inherited gbxLeitura: TGroupBox
        Left = 94
        Top = 49
        inherited edtCMC7: TEdit
          OnExit = fraCMC7edtCMC7Exit
        end
      end
      inherited gbxBanco: TGroupBox
        Left = 94
      end
      inherited gbxLeituraManual: TGroupBox
        Left = 94
        Top = 87
        inherited edtManual1: TEdit
          OnExit = fraCMC7edtManual1Exit
        end
        inherited edtManual2: TEdit
          OnExit = fraCMC7edtManual2Exit
        end
        inherited edtManual3: TEdit
          OnExit = fraCMC7edtManual3Exit
        end
      end
      inherited gbxAgencia: TGroupBox
        Left = 155
      end
      inherited gbxNrCheque: TGroupBox
        Left = 341
      end
      inherited gbxConta: TGroupBox
        Left = 230
      end
    end
  end
  object gbxDataVencto: TGroupBox
    Left = 103
    Top = 180
    Width = 106
    Height = 36
    Caption = 'DATA VENCTO'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -9
    Font.Name = 'helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
    TabOrder = 13
    object edtDataVencimento: TEditData
      Left = 2
      Top = 10
      Width = 101
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Minimo = 0
      Maximo = 37353
    end
  end
  object GroupBox1: TGroupBox
    Left = 17
    Top = 218
    Width = 490
    Height = 36
    Caption = 'CLIENTE'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -9
    Font.Name = 'helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
    TabOrder = 11
    object edfCodigoCliente: TtecDbEditFind
      Left = 2
      Top = 10
      Width = 93
      Height = 23
      Alignment = taLeftJustify
      DataField = 'codigo'
      DataSource = dtmfrentecaixa.dsrCliente
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      Group = 'ClienteFrentedeCaixa'
      MaxLength = 7
      Maximo = 0
      Minimo = 37353
      Adicional = 0
      Opcional = True
      OnEnter = edfCodigoClienteEnter
      OnExit = edfCodigoClienteExit
      OnKeyDown = edfCodigoClienteKeyDown
      ParentFont = False
      TabOrder = 0
      PermitirZero = False
      PermitirNulo = False
      Operacao = opPESQUISA
      Parameter = 'codigo'
      ActiveSetControls = True
      DenyInsert = True
      NoSetControls = <>
      SetControls = <>
    end
    object edtCliente: TDBEditTexto
      Left = 98
      Top = 10
      Width = 389
      Height = 23
      DataField = 'nome'
      DataSource = dtmfrentecaixa.dsrCliente
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
    Left = 17
    Top = 257
    Width = 490
    Height = 36
    Caption = 'TITULAR'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -9
    Font.Name = 'helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
    TabOrder = 15
    object edtTitularCheque: TEdit
      Left = 2
      Top = 10
      Width = 485
      Height = 23
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      MaxLength = 40
      ParentFont = False
      TabOrder = 0
    end
  end
  object gbxValorCheque: TGroupBox
    Left = 292
    Top = 180
    Width = 125
    Height = 36
    Caption = 'VALOR CHEQUE'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -9
    Font.Name = 'helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
    TabOrder = 14
    object edtValorCheque: TEditNumero
      Left = 2
      Top = 10
      Width = 120
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      MaxLength = 9
      ParentFont = False
      TabOrder = 0
      Mascara = True
      TipoMascara = tmGERAL
      NrDecimal = 2
      Decimais = True
      Negativo = False
      Tamanho = 9
    end
  end
  object ecvSalvar: TtecEditionControlValidation
    EditionControl = <
      item
        Control = fracgcoucpf.edtCPFCNPJ
      end
      item
        Control = edtCliente
      end
      item
        Control = fraEnderecoEditor.mmoRua
      end
      item
        Control = fraCMC7.edtAgencia
      end
      item
        Control = fraCMC7.edtBanco
      end
      item
        Control = fraCMC7.edtCheque
      end
      item
        Control = fraCMC7.edtConta
      end
      item
        Control = edtDataVencimento
      end
      item
        Control = edtValorCheque
      end>
    Left = 455
    Top = 30
  end
  object ecvImprimirCheque: TtecEditionControlValidation
    EditionControl = <
      item
        Control = fraCMC7.edtBanco
      end
      item
        Control = edtDataVencimento
      end
      item
        Control = edtValorCheque
      end>
    Left = 430
    Top = 20
  end
end
