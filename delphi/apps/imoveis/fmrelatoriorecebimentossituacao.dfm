inherited frmrelatoriorecebimentossituacao: Tfrmrelatoriorecebimentossituacao
  Left = 532
  Top = 317
  ActiveControl = edtDataInicial
  Caption = 'Relat'#243'rio de Recebimentos por Situa'#231#227'o'
  ClientHeight = 239
  ClientWidth = 570
  FormStyle = fsMDIChild
  Position = poOwnerFormCenter
  Visible = True
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBarra: TToolBar
    Width = 570
  end
  inherited pnlFundoJanela: TPanel
    Top = 45
    Width = 570
    Height = 194
    object gbxContrato: TGroupBox
      Left = 6
      Top = 1
      Width = 123
      Height = 99
      Caption = 'CONTRATOS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object ckbVendidos: TCheckBox
        Left = 6
        Top = 13
        Width = 83
        Height = 20
        Caption = 'Vendidos'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        State = cbChecked
        TabOrder = 0
      end
      object ckbRescindidos: TCheckBox
        Left = 6
        Top = 33
        Width = 99
        Height = 20
        Caption = 'Rescindidos'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        State = cbChecked
        TabOrder = 1
      end
      object ckbRenegociados: TCheckBox
        Left = 6
        Top = 73
        Width = 107
        Height = 20
        Caption = 'Renegociados'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        State = cbChecked
        TabOrder = 2
      end
      object ckbTransferidos: TCheckBox
        Left = 6
        Top = 53
        Width = 99
        Height = 20
        Caption = 'Transferidos'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        State = cbChecked
        TabOrder = 3
      end
    end
    object gbxPeriodo: TGroupBox
      Left = 238
      Top = 1
      Width = 170
      Height = 36
      Caption = 'PER'#205'ODO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object lblA: TLabel
        Left = 81
        Top = 12
        Width = 7
        Height = 15
        Caption = 'a'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
      end
      object edtDataInicial: TEditData
        Left = 2
        Top = 10
        Width = 75
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
      object edtDataFinal: TEditData
        Left = 92
        Top = 10
        Width = 75
        Height = 23
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        MaxLength = 10
        ParentFont = False
        TabOrder = 1
        OnExit = edtDataFinalExit
        Minimo = 37353
        Maximo = 0
      end
    end
    object gbxEmpreendimento: TGroupBox
      Left = 6
      Top = 109
      Width = 502
      Height = 36
      Caption = 'EMPREENDIMENTO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      inline fraConsultaEmprendimento: TfraConsultaCodigo
        Left = 2
        Top = 10
        Width = 498
        Height = 24
        HorzScrollBar.Range = 497
        VertScrollBar.Range = 23
        AutoScroll = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        inherited dtxDescricao: TtecDBText
          DataField = 'nome'
          DataSource = fraConsultaEmprendimento.dsrProcuraEmpreendimentos
        end
        inherited edfCodigo: TtecDBFindLookup
          DataField = 'codigo'
          DataSource = fraConsultaEmprendimento.dsrProcuraEmpreendimentos
          Group = 'Emp'
          MaxLength = 5
          OnFound = nil
          Operacao = opPESQUISA
          Parameter = 'Codigo'
        end
      end
    end
    object gbxCliente: TGroupBox
      Left = 6
      Top = 150
      Width = 502
      Height = 36
      Caption = 'CLIENTE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      inline fraConsultaCliente: TfraConsultaCodigo
        Left = 2
        Top = 10
        Width = 498
        Height = 24
        HorzScrollBar.Range = 497
        VertScrollBar.Range = 23
        AutoScroll = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        inherited dtxDescricao: TtecDBText
          DataField = 'nome'
          DataSource = fraConsultaCliente.dsrProcuraCliente
        end
        inherited edfCodigo: TtecDBFindLookup
          DataField = 'codigo'
          DataSource = fraConsultaCliente.dsrProcuraCliente
          Group = 'Cliente'
          MaxLength = 8
          OnFound = nil
          Operacao = opPESQUISA
          Parameter = 'codigo'
        end
      end
    end
    object rbnListaOpcao: TRadioGroup
      Left = 139
      Top = -2
      Width = 89
      Height = 57
      Caption = 'Listar'
      ItemIndex = 0
      Items.Strings = (
        'Im'#243'veis'
        'Valores')
      TabOrder = 4
    end
    object gbxSituacaoEm: TGroupBox
      Left = 239
      Top = 42
      Width = 80
      Height = 36
      Caption = 'SITUA'#199#195'O EM'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      object edtDataSituacao: TEditData
        Left = 2
        Top = 10
        Width = 75
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
    object rgbOrdenacao: TRadioGroup
      Left = 419
      Top = -2
      Width = 142
      Height = 75
      Caption = 'Ordena'#231#227'o'
      ItemIndex = 0
      Items.Strings = (
        'Empreendimento'
        'Contrato'
        'Nome Cliente')
      TabOrder = 6
    end
  end
end
