inherited frmClienteFrenteCaixa: TfrmClienteFrenteCaixa
  Left = 384
  Top = 183
  Width = 627
  Height = 422
  HorzScrollBar.Range = 514
  HorzScrollBar.Visible = False
  VertScrollBar.Range = 467
  VertScrollBar.Visible = False
  ActiveControl = edfCodigoCliente
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  Caption = 'Clientes no Frente de Caixa'
  FormStyle = fsMDIChild
  Visible = True
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBarra: TPanel
    Top = 187
    TabOrder = 10
  end
  inherited pnlTopMenu: TPanel
    Width = 607
    TabOrder = 11
    inherited tblBarra: TToolBar
      Width = 382
      DesignSize = (
        380
        41)
    end
  end
  inline fraEnderecoEditor: TfraEnderecoEditor
    Left = 10
    Top = 136
    Width = 591
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
    TabOrder = 4
    inherited gbxEndereco: TGroupBox
      Width = 591
      Height = 151
      inherited pnlNumero: TPanel
        Width = 587
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
        Width = 587
        inherited edtBairro: TtecDoubleDBEdit
          LookupField = 'nomebairro'
          LookupSource = dtmfrentecaixa.dsrCliente
          DataField = 'bairro'
          DataSource = dtmfrentecaixa.dsrCliente
          MaxLength = -1
        end
      end
      inherited pnlCidade: TPanel
        Width = 587
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
          MaxLength = 72
        end
        inherited edtCEP: TDBEditCep
          DataField = 'cep'
          DataSource = dtmfrentecaixa.dsrCliente
          MaxLength = 9
        end
      end
      inherited pnlRua: TPanel
        Width = 587
        inherited sbnRua: TSpeedButton
          OnClick = fraEnderecoEditorsbnRuaClick
        end
        inherited mmoRua: TtecDBMemo
          DataField = 'rua'
          DataSource = dtmfrentecaixa.dsrCliente
        end
      end
      inherited pnllblCidade: TPanel
        Width = 587
      end
      inherited pnllblBairro: TPanel
        Width = 587
      end
      inherited pnllblNumero: TPanel
        Width = 587
      end
    end
  end
  inline fraFone: TfraTelefone
    Left = 10
    Top = 324
    Width = 151
    Height = 50
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    inherited gbxFone: TGroupBox
      Width = 151
      Height = 50
      inherited edtDDD: TDBEditNumero
        Text = 'edtDDD'
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
    Top = 83
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
    TabOrder = 7
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
          MaxLength = 0
          OnExit = fracgcoucpfedtCPFCNPJExit
        end
      end
    end
  end
  object gbxCliente: TGroupBox
    Left = 10
    Top = 46
    Width = 591
    Height = 36
    Caption = 'CLIENTE'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -9
    Font.Name = 'helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object edfCodigoCliente: TtecDbEditFind
      Left = 4
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
      Left = 100
      Top = 10
      Width = 487
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
  object gbxIdNumero: TGroupBox
    Left = 404
    Top = 92
    Width = 108
    Height = 37
    Caption = 'RG'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -9
    Font.Name = 'helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
    TabOrder = 2
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
    Top = 324
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
      Caption = 'CELULAR'
      inherited edtDDD: TDBEditNumero
        Text = 'edtDDD'
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
    Top = 287
    Width = 295
    Height = 36
    Caption = 'E-MAIL'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -9
    Font.Name = 'helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    object edtemail: TDBEditTexto
      Left = 2
      Top = 10
      Width = 287
      Height = 23
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
    Left = 309
    Top = 287
    Width = 292
    Height = 37
    Caption = 'SITE'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -9
    Font.Name = 'helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
    TabOrder = 9
    object edtsite: TDBEditTexto
      Left = 2
      Top = 10
      Width = 287
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
    Left = 516
    Top = 92
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
    TabOrder = 3
    object edtdatanascto: TDBEditData
      Left = 2
      Top = 10
      Width = 80
      Height = 23
      Alignment = taCenter
      DataField = 'nascto'
      DataSource = dtmfrentecaixa.dsrCliente
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
  object gbxEstrangeiro: TGroupBox
    Left = 304
    Top = 91
    Width = 97
    Height = 38
    TabOrder = 1
    object ckbestrangeiro: TDBCheckBox
      Left = 3
      Top = 15
      Width = 90
      Height = 14
      Caption = 'Estrangeiro'
      DataField = 'estrangeiro'
      DataSource = dtmfrentecaixa.dsrCliente
      TabOrder = 0
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
  end
end
