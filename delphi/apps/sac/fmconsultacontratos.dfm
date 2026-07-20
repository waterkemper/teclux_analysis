inherited frmConsultaContratos: TfrmConsultaContratos
  Left = 240
  Top = 136
  ActiveControl = dbgProdutosCliente
  Caption = 'Consulta de contratos'
  ClientWidth = 597
  PixelsPerInch = 96
  inherited fraEnderecoCliente: TfraEndereco
    Left = 117
    inherited gbxEndereco: TGroupBox
      inherited edtBairro: TDBEdit
        DataField = 'bairro'
        DataSource = dtmConsultaContratos.dsrDetalhesCliente
      end
      inherited edtCidade: TDBEdit
        DataField = 'cidade'
        DataSource = dtmConsultaContratos.dsrDetalhesCliente
      end
      inherited edtCEP: TDBEdit
        DataField = 'cep'
        DataSource = dtmConsultaContratos.dsrDetalhesCliente
      end
      inherited edtEstado: TDBEdit
        DataField = 'estado'
        DataSource = dtmConsultaContratos.dsrDetalhesCliente
      end
      inherited mmoRua: TDBMemo
        DataField = 'rua'
        DataSource = dtmConsultaContratos.dsrDetalhesCliente
      end
    end
  end
  inherited gbxTelefones: TGroupBox
    Height = 176
    TabOrder = 4
    inherited pnlFoneReferencia2: TPanel
      inherited txtFoneReferencia2: TDBMemo
        DataField = 'foneref2'
        DataSource = dtmConsultaContratos.dsrDetalhesCliente
      end
    end
    inherited pnlFoneReferencia1: TPanel
      inherited txtFoneReferencia1: TDBMemo
        DataField = 'foneref1'
        DataSource = dtmConsultaContratos.dsrDetalhesCliente
      end
    end
    inherited pnlFoneConjuge: TPanel
      inherited txtFoneConjuge: TDBMemo
        DataField = 'foneconjuge'
        DataSource = dtmConsultaContratos.dsrDetalhesCliente
      end
    end
    inherited pnlFoneEmpresa: TPanel
      inherited txtFoneEmpresa: TDBMemo
        DataField = 'foneempresa'
        DataSource = dtmConsultaContratos.dsrDetalhesCliente
      end
    end
    inherited pnlFneCliente2: TPanel
      inherited txtFoneCliente2: TDBMemo
        DataField = 'telefone2'
        DataSource = dtmConsultaContratos.dsrDetalhesCliente
      end
    end
    inherited pnlFoneCliente1: TPanel
      inherited txtFoneCliente1: TDBMemo
        DataField = 'telefone1'
        DataSource = dtmConsultaContratos.dsrDetalhesCliente
      end
    end
  end
  inherited dbgContratos: TDBGrid
    Width = 596
    DataSource = dtmConsultaContratos.dsrConsultaContratos
    TabOrder = 5
    Columns = <
      item
        Expanded = False
        FieldName = 'codigo'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'd. Cliente'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nomecliente'
        Title.Alignment = taCenter
        Title.Caption = 'Cliente/Vendedor   < Cliente >'
        Width = 253
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'data'
        Title.Alignment = taCenter
        Title.Caption = 'Data Compra'
        Width = 75
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'numero'
        Title.Alignment = taCenter
        Title.Caption = 'N'#250'mero'
        Width = 105
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'filialvenda'
        Title.Alignment = taCenter
        Title.Caption = 'Filial'
        Width = 50
        Visible = True
      end>
  end
  inherited pnlBotoes: TPanel
    Top = 436
    Width = 396
    Height = 37
    inherited bbnAtendimento: TSpeedButton
      Left = 61
      Top = 7
    end
    inherited bbnAplicaQuestionario: TSpeedButton
      Left = 172
      Top = 7
    end
    inherited bbnParametro: TBitBtn
      Left = 283
      Top = 7
      Hint = 'Informa os par'#226'metros para sele'#231#227'o'
      ParentShowHint = False
    end
  end
  object gbxDadosCompra: TGroupBox
    Left = 1
    Top = 184
    Width = 111
    Height = 110
    TabOrder = 1
    object lblData: TLabel
      Left = 7
      Top = 7
      Width = 65
      Height = 15
      Caption = 'Data Compra'
    end
    object lblNroContrato: TLabel
      Left = 7
      Top = 53
      Width = 63
      Height = 15
      Caption = 'Nr. Contrato'
    end
    object edtDataCompra: TDBEditData
      Left = 7
      Top = 24
      Width = 95
      Height = 23
      Color = clBtnFace
      DataField = 'data'
      DataSource = dtmConsultaContratos.dsrConsultaContratos
      MaxLength = 13
      ReadOnly = True
      TabOrder = 2
      DataInicial = '30/12/1899'
      DataFinal = '27/02/2002'
      Opcional = True
    end
    object edtNumeroContrato: TDBEditNumero
      Left = 7
      Top = 70
      Width = 95
      Height = 23
      Color = clBtnFace
      DataField = 'numero'
      DataSource = dtmConsultaContratos.dsrConsultaContratos
      MaxLength = 17
      ReadOnly = True
      TabOrder = 3
      Negativo = False
      Decimais = False
      Tamanho = 8
    end
  end
  object dbgProdutosCliente: TDBGrid
    Left = 200
    Top = 303
    Width = 396
    Height = 130
    DataSource = dtmConsultaContratos.dsrProdutosCliente
    TabOrder = 2
    TitleFont.Color = clWindowText
    Titlefont.height = -12
    TitleFont.Name = 'Times'
    TitleFont.Pitch = fpVariable
    TitleFont.Style = []
    TitleFont.Weight = 40
    Columns = <
      item
        Expanded = False
        FieldName = 'descricao'
        Title.Alignment = taCenter
        Width = 275
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'quantidade'
        Title.Alignment = taCenter
        Title.Caption = 'Qtde.'
        Visible = True
      end>
  end
end
