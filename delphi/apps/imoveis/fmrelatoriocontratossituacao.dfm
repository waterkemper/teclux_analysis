inherited frmRelatorioContratosSituacao: TfrmRelatorioContratosSituacao
  Left = 586
  Top = 262
  ActiveControl = edtDataInicial
  Caption = 'Relat'#243'rio de Contratos por Situa'#231#227'o'
  ClientHeight = 254
  ClientWidth = 724
  FormStyle = fsMDIChild
  Position = poOwnerFormCenter
  Visible = True
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBarra: TToolBar
    Width = 724
  end
  inherited pnlFundoJanela: TPanel
    Top = 40
    Width = 724
    Height = 214
    Align = alClient
    object gbxContrato: TGroupBox
      Left = 6
      Top = 6
      Width = 269
      Height = 124
      Caption = ' SITUA'#199#213'ES '
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
        Top = 14
        Width = 120
        Height = 20
        Caption = '&Vendidos'
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
        Top = 34
        Width = 120
        Height = 20
        Caption = 'Re&scindidos'
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
      object ckbRenegociadosDe: TCheckBox
        Left = 6
        Top = 54
        Width = 120
        Height = 20
        Caption = 'Renegocia&dos De'
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
      object ckbTransferidosDe: TCheckBox
        Left = 6
        Top = 74
        Width = 120
        Height = 20
        Caption = 'Trans&feridos De'
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
      object ckbNoJuridico: TCheckBox
        Left = 6
        Top = 94
        Width = 120
        Height = 20
        Caption = 'No &Jur'#237'dico'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        State = cbChecked
        TabOrder = 4
      end
      object ckbQuitados: TCheckBox
        Left = 132
        Top = 14
        Width = 130
        Height = 20
        Caption = '&Quitados'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        State = cbChecked
        TabOrder = 5
      end
      object ckbReservados: TCheckBox
        Left = 132
        Top = 34
        Width = 130
        Height = 20
        Caption = '&Reservados'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        State = cbChecked
        TabOrder = 6
      end
      object ckbTransferidosPara: TCheckBox
        Left = 132
        Top = 74
        Width = 130
        Height = 20
        Caption = '&Transferidos Para'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        State = cbChecked
        TabOrder = 7
      end
      object ckbRenegociadosPara: TCheckBox
        Left = 132
        Top = 54
        Width = 130
        Height = 20
        Caption = 'Rene&gociados Para'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        State = cbChecked
        TabOrder = 8
      end
      object ckbCancelados: TCheckBox
        Left = 132
        Top = 94
        Width = 130
        Height = 20
        Caption = '&Cancelados'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        State = cbChecked
        TabOrder = 9
      end
    end
    object gbxPeriodo: TGroupBox
      Left = 378
      Top = 6
      Width = 170
      Height = 36
      Caption = ' PER'#205'ODO '
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
        Minimo = 37353
        Maximo = 0
      end
    end
    object gbxEmpreendimento: TGroupBox
      Left = 3
      Top = 139
      Width = 718
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
      TabOrder = 2
      inline fraConsultaEmprendimento: TfraConsultaCodigo
        Left = 2
        Top = 10
        Width = 714
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
          Width = 625
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
      Top = 175
      Width = 718
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
      TabOrder = 3
      inline fraConsultaCliente: TfraConsultaCodigo
        Left = 2
        Top = 10
        Width = 714
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
          Width = 625
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
    object rbnListaOpcao: TRadioGroup
      Left = 285
      Top = 4
      Width = 82
      Height = 57
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        'Im'#243'veis'
        'Valores')
      ParentFont = False
      TabOrder = 4
    end
    object rgbOrdenacao: TRadioGroup
      Left = 559
      Top = 3
      Width = 135
      Height = 75
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        'Empreendimento'
        'Contrato'
        'Nome Cliente')
      ParentFont = False
      TabOrder = 5
    end
    object stxOrdenacao: TStaticText
      Left = 570
      Top = 5
      Width = 69
      Height = 16
      Caption = ' ORDENA'#199#195'O '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 6
    end
    object stxListar: TStaticText
      Left = 291
      Top = 5
      Width = 42
      Height = 16
      Caption = ' LISTAR '
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
