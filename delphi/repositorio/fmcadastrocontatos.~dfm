inherited frmcadastrocontatos: Tfrmcadastrocontatos
  Left = 505
  Top = 203
  ActiveControl = edtContato
  Caption = 'Cadastro de Contatos'
  ClientHeight = 380
  ClientWidth = 633
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlTopMenu: TPanel
    Width = 633
    inherited tblBarra: TToolBar
      Width = 408
      inherited sbnProcurar: TSpeedButton
        Visible = False
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 45
    Width = 633
    Height = 335
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object gbxFundoJanela: TGroupBox
      Left = 0
      Top = 0
      Width = 633
      Height = 335
      Align = alClient
      TabOrder = 0
      object gbxCargo: TGroupBox
        Left = 6
        Top = 200
        Width = 388
        Height = 36
        Caption = 'CARGO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        inline fraConsultaCargos: TfraConsultaCodigo
          Left = 2
          Top = 10
          Width = 383
          Height = 24
          HorzScrollBar.Range = 383
          VertScrollBar.Range = 24
          AutoScroll = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = 11
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          inherited sbnProcura: TSpeedButton
            Left = 43
            Height = 24
          end
          inherited dtxDescricao: TtecDBText
            Left = 67
            Width = 316
            DataField = 'descricao'
            DataSource = fraConsultaCargos.dsrProcuraCargos
          end
          inherited edfCodigo: TtecDBFindLookup
            Width = 41
            DataField = 'cargo'
            DataSource = dsrContatos
            MaxLength = 3
            LookupField = 'codigo'
            LookupSource = fraConsultaCargos.dsrProcuraCargos
            LookupQueryParameter = 'codigo'
            Parameter = ' '
            ActiveSetControls = False
            DenyInsert = False
            NoSetControls = <>
            SetControls = <>
            LookupParameter = 'codigo'
          end
        end
      end
      object gbxEmail: TGroupBox
        Left = 6
        Top = 104
        Width = 387
        Height = 36
        Caption = 'E-MAIL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        object edtEmail: TDBEditTexto
          Left = 2
          Top = 10
          Width = 375
          Height = 23
          CharCase = ecLowerCase
          DataField = 'email'
          DataSource = dsrContatos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = -1
          ParentFont = False
          TabOrder = 0
          CharCasenoDefault = True
          Alignment = taLeftJustify
        end
      end
      object gbxobservacoes: TGroupBox
        Left = 2
        Top = 243
        Width = 629
        Height = 90
        Align = alBottom
        Caption = 'OBSERVA'#199#213'ES'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        object mmoObservacoes: TtecDBMemo
          Left = 2
          Top = 14
          Width = 625
          Height = 74
          Align = alClient
          DataField = 'observacoes'
          DataSource = dsrContatos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
      end
      object gbxNome: TGroupBox
        Left = 6
        Top = 6
        Width = 387
        Height = 36
        Caption = 'NOME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object edtContato: TDBEditTexto
          Left = 2
          Top = 10
          Width = 382
          Height = 23
          DataField = 'contato'
          DataSource = dsrContatos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = -1
          ParentFont = False
          TabOrder = 0
          CharCasenoDefault = False
          Alignment = taLeftJustify
        end
      end
      object dbireceberemailmarketing: TDBIntCheckBox
        Left = 8
        Top = 144
        Width = 369
        Height = 17
        Caption = 'Receber email de ofertas ou marketing'
        TabOrder = 3
        DataField = 'receberemailmarketing'
        DataSource = dsrContatos
      end
      inline fraFoneRamal1: TfraFoneRamal
        Left = 8
        Top = 47
        Width = 233
        Height = 51
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        inherited gbxFone: TGroupBox
          inherited edtDDD: TDBEditNumero
            DataField = 'foneddd'
            DataSource = dsrContatos
          end
          inherited edtNumero: TDBEditFone
            DataField = 'fonenumero'
            DataSource = dsrContatos
          end
          inherited edtFoneRamal: TDBEditTexto
            DataField = 'foneramal'
            DataSource = dsrContatos
          end
        end
      end
      object ckbenviar_nfe: TDBIntCheckBox
        Left = 8
        Top = 160
        Width = 369
        Height = 17
        Caption = 'Enviar email anexando o XML/PDF da NFe'
        TabOrder = 4
        DataField = 'enviar_nfe'
        DataSource = dsrContatos
      end
      object ckbenviar_boleto: TDBIntCheckBox
        Left = 8
        Top = 176
        Width = 369
        Height = 17
        Caption = 'Enviar email anexando o boleto'
        TabOrder = 5
        DataField = 'enviar_boleto'
        DataSource = dsrContatos
      end
    end
  end
  object dsrContatos: TtecDataSource
    Left = 312
    Top = 112
  end
end
