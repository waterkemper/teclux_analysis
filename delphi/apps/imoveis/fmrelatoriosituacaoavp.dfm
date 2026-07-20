inherited frmRelatoriosituacaoavp: TfrmRelatoriosituacaoavp
  Left = 586
  Top = 263
  ActiveControl = edtDataInicial
  Caption = 'Valores a Receber de Curto e Longo Prazo e Situa'#231#227'o do AVP'
  ClientHeight = 237
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
    Top = 43
    Width = 570
    Height = 194
    object gbxContrato: TGroupBox
      Left = 6
      Top = 6
      Width = 123
      Height = 99
      Caption = ' CONTRATOS '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object ckbVendidos: TCheckBox
        Left = 10
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
        Left = 10
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
        Left = 10
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
        Left = 10
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
      Left = 134
      Top = 6
      Width = 170
      Height = 36
      Caption = ' PER'#205'ODO PARA O AVP '
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
        Maximo = 65535
      end
    end
    object gbxEmpreendimento: TGroupBox
      Left = 3
      Top = 119
      Width = 564
      Height = 36
      Align = alBottom
      Caption = 'EMPREENDIMENTO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      inline fraConsultaEmprendimento: TfraConsultaCodigo
        Left = 2
        Top = 10
        Width = 557
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
          Width = 472
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
          ActiveSetControls = False
          DenyInsert = True
          NoSetControls = <>
          SetControls = <>
        end
      end
    end
    object gbxCliente: TGroupBox
      Left = 3
      Top = 155
      Width = 564
      Height = 36
      Align = alBottom
      Caption = 'CLIENTE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      inline fraConsultaCliente: TfraConsultaCodigo
        Left = 2
        Top = 10
        Width = 559
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
          Width = 471
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
          ActiveSetControls = False
          DenyInsert = True
          NoSetControls = <>
          SetControls = <>
        end
      end
    end
    object rgbOrdenacao: TRadioGroup
      Left = 315
      Top = 6
      Width = 142
      Height = 75
      ItemIndex = 0
      Items.Strings = (
        'Empreendimento'
        'Contrato'
        'Nome Cliente')
      TabOrder = 3
    end
    object gbxSituacaoEm: TGroupBox
      Left = 136
      Top = 69
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
      TabOrder = 2
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
    object StaticText1: TStaticText
      Left = 136
      Top = 57
      Width = 84
      Height = 13
      AutoSize = False
      Caption = 'SALDO DEVEDOR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 6
    end
    object stxOrdenacao: TStaticText
      Left = 321
      Top = 7
      Width = 66
      Height = 16
      Caption = ' ORDENA'#199#195'O'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 7
    end
  end
end
