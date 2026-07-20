object fraDadosCliente: TfraDadosCliente
  Left = 0
  Top = 0
  Width = 727
  Height = 255
  TabOrder = 0
  object gbxDadosCliente: TGroupBox
    Left = 0
    Top = 0
    Width = 727
    Height = 255
    Align = alClient
    Caption = ' Dados do cliente '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object lblNomeCliente: TLabel
      Left = 9
      Top = 24
      Width = 27
      Height = 14
      Alignment = taRightJustify
      Caption = 'Nome'
    end
    object lblDataNascimento: TLabel
      Left = 406
      Top = 24
      Width = 56
      Height = 14
      Alignment = taRightJustify
      Caption = 'Nascimento'
    end
    object lblConceito: TLabel
      Left = 584
      Top = 24
      Width = 42
      Height = 14
      Alignment = taRightJustify
      Caption = 'Conceito'
    end
    object dtxNomeCliente: TtecDBText
      Left = 41
      Top = 19
      Width = 350
      Height = 22
      TabStop = False
      Color = clBtnFace
      DataField = 'nome'
      ReadOnly = True
      TabOrder = 0
    end
    object dxtNasctoCliente: TtecDBText
      Left = 466
      Top = 19
      Width = 75
      Height = 22
      TabStop = False
      Color = clBtnFace
      DataField = 'nascto'
      ReadOnly = True
      TabOrder = 5
    end
    inline fraEnderecoCliente: TfraEndereco
      Left = 6
      Top = 46
      Width = 451
      Height = 151
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      inherited gbxEndereco: TGroupBox
        Width = 451
        Height = 151
        inherited pnlNumero: TPanel
          Width = 447
        end
        inherited pnlBairro: TPanel
          Width = 447
          inherited edtBairro: TtecDoubleDBEdit
            LookupField = 'nomebairrocliente'
            DataField = 'bairro'
            MaxLength = 9
          end
        end
        inherited pnlCidade: TPanel
          Width = 447
          inherited edtCEP: TDBEditCep
            DataField = 'cep'
            MaxLength = 6
          end
          inherited edtCidade: TtecDoubleDBEdit
            LookupField = 'nomecidadecliente'
            DataField = 'nomecidadecliente'
            MaxLength = 9
          end
          inherited edtEstado: TDBEditTexto
            DataField = 'estado'
            MaxLength = 9
          end
        end
        inherited pnlRua: TPanel
          Width = 447
          inherited mmoRua: TtecDBMemo
            DataField = 'rua'
          end
        end
        inherited pnllblCidade: TPanel
          Width = 447
          inherited lblCEP_: TLabel
            Top = 0
          end
          inherited lblCidade_: TLabel
            Top = 0
          end
          inherited lblUF_: TLabel
            Top = 0
          end
        end
        inherited pnllblBairro: TPanel
          Width = 447
        end
        inherited pnllblNumero: TPanel
          Width = 447
        end
      end
    end
    inline frFoneResidencial: TfraFoneRamal
      Left = 467
      Top = 176
      Width = 183
      Height = 62
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      inherited gbxFone: TGroupBox
        Width = 183
        Height = 62
        inherited lblRamal: TLabel
          Left = 126
        end
        inherited edtDDD: TDBEditNumero
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
        end
        inherited edtNumero: TDBEditFone
          Width = 70
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
        end
        inherited edtFoneRamal: TDBEditTexto
          Left = 124
          Width = 50
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
        end
      end
    end
    object gbxDocumentoCliente: TGroupBox
      Left = 7
      Top = 199
      Width = 450
      Height = 51
      Caption = 'DOCUMENTOS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object lblNumeroDocumento: TLabel
        Left = 158
        Top = 12
        Width = 14
        Height = 12
        Alignment = taRightJustify
        Caption = 'RG'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
      end
      object lblOrgaoDoc: TLabel
        Left = 343
        Top = 12
        Width = 34
        Height = 12
        Alignment = taRightJustify
        Caption = 'ORG'#195'O'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
      end
      object lblEmissaoDocumento: TLabel
        Left = 263
        Top = 12
        Width = 41
        Height = 12
        Alignment = taRightJustify
        Caption = 'EMISS'#195'O'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
      end
      object lblEstadoEmissao: TLabel
        Left = 401
        Top = 12
        Width = 13
        Height = 12
        Alignment = taRightJustify
        Caption = 'UF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
      end
      object lblCPFCNPJ: TLabel
        Left = 8
        Top = 12
        Width = 47
        Height = 12
        Alignment = taRightJustify
        Caption = 'CPF/CNPJ'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
      end
      object dtxIdDataCliente: TtecDBText
        Left = 260
        Top = 23
        Width = 70
        Height = 22
        TabStop = False
        Color = clBtnFace
        DataField = 'iddata'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object dtxIdEstadoCliente: TtecDBText
        Left = 395
        Top = 23
        Width = 30
        Height = 22
        TabStop = False
        Color = clBtnFace
        DataField = 'idestado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object dtxIdOrgaoCliente: TtecDBText
        Left = 338
        Top = 23
        Width = 50
        Height = 22
        TabStop = False
        Color = clBtnFace
        DataField = 'idorgao'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object dtxIdDocumentoCliente: TtecDBText
        Left = 153
        Top = 23
        Width = 100
        Height = 22
        TabStop = False
        Color = clBtnFace
        DataField = 'iddocumento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
      object DBEditTexto1: TDBEditCPFCNPJ2
        Left = 5
        Top = 23
        Width = 140
        Height = 22
        TabStop = False
        CharCase = ecUpperCase
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        MaxLength = 14
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
        Tamanho = 0
      end
    end
    object gbxEmpresaCliente: TGroupBox
      Left = 466
      Top = 45
      Width = 256
      Height = 127
      Caption = ' Empresa '
      TabOrder = 4
      object lblNomeEmpresa: TLabel
        Left = 6
        Top = 17
        Width = 27
        Height = 14
        Caption = 'Nome'
      end
      inline frFoneEmpresa: TfraFoneRamal
        Left = 6
        Top = 60
        Width = 183
        Height = 61
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        inherited gbxFone: TGroupBox
          Width = 183
          Height = 61
          inherited lblRamal: TLabel
            Left = 126
          end
          inherited edtDDD: TDBEditNumero
            TabStop = False
            Color = clBtnFace
            MaxLength = 6
            ReadOnly = True
            DataField = 'empfoneddd'
          end
          inherited edtNumero: TDBEditFone
            Width = 70
            TabStop = False
            Color = clBtnFace
            DataField = 'empfonenumero'
            ReadOnly = True
          end
          inherited edtFoneRamal: TDBEditTexto
            Left = 124
            Width = 50
            TabStop = False
            Color = clBtnFace
            DataField = 'empfoneramal'
            MaxLength = 11
            ReadOnly = True
          end
        end
      end
      object dtxEmpresaCliente: TtecDBText
        Left = 6
        Top = 33
        Width = 242
        Height = 22
        TabStop = False
        Color = clBtnFace
        DataField = 'empresa'
        ReadOnly = True
        TabOrder = 1
      end
    end
    object dtxDescricaoConceito: TtecDBText
      Left = 630
      Top = 19
      Width = 91
      Height = 22
      TabStop = False
      Color = clBtnFace
      DataField = 'descricaoconceito'
      ReadOnly = True
      TabOrder = 6
    end
  end
end
