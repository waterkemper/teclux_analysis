inherited frmrelatorioparcelasatraso: Tfrmrelatorioparcelasatraso
  Left = 625
  Top = 272
  ActiveControl = edtDataBase
  Caption = 'Relat'#243'rio de parcelas em atraso por per'#237'odo'
  ClientHeight = 189
  ClientWidth = 535
  FormStyle = fsMDIChild
  Position = poOwnerFormCenter
  Visible = True
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBarra: TToolBar
    Width = 535
  end
  inherited pnlFundoJanela: TPanel
    Top = 41
    Width = 535
    Height = 148
    object lblOpcoes: TLabel
      Left = 11
      Top = 48
      Width = 44
      Height = 12
      Caption = ' OP'#199#213'ES '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
    end
    object gbxEmpreendimento: TGroupBox
      Left = 127
      Top = 6
      Width = 400
      Height = 36
      Caption = 'EMPREENDIMENTO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      inline fraConsultaEmprendimento: TfraConsultaCodigo
        Left = 2
        Top = 10
        Width = 395
        Height = 24
        HorzScrollBar.Range = 395
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
        inherited sbnProcura: TSpeedButton
          Left = 66
          Top = 1
          Width = 22
        end
        inherited dtxDescricao: TtecDBText
          Width = 307
          DataField = 'nome'
          DataSource = fraConsultaEmprendimento.dsrProcuraEmpreendimentos
        end
        inherited edfCodigo: TtecDBFindLookup
          Hint = 'Se especificado, s'#243' esse empreendimento ser'#225' impresso'
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
      Left = 128
      Top = 48
      Width = 400
      Height = 36
      Caption = 'CLIENTE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      inline fraConsultaCliente: TfraConsultaCodigo
        Left = 2
        Top = 10
        Width = 395
        Height = 24
        HorzScrollBar.Range = 395
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
        inherited sbnProcura: TSpeedButton
          Left = 66
          Top = 1
          Width = 21
        end
        inherited dtxDescricao: TtecDBText
          Width = 307
          DataField = 'nome'
          DataSource = fraConsultaCliente.dsrProcuraCliente
        end
        inherited edfCodigo: TtecDBFindLookup
          Hint = 'Se especificado, s'#243' esse cliente ser'#225' impresso'
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
    object gbxdataBase: TGroupBox
      Left = 6
      Top = 6
      Width = 80
      Height = 36
      Caption = 'DATA BASE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object edtDataBase: TEditData
        Left = 2
        Top = 10
        Width = 75
        Height = 23
        Hint = 'Data base a ser considerada para verifica'#231#227'o dos atrasos'
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
    object rgpResumo: TRadioGroup
      Left = 6
      Top = 55
      Width = 113
      Height = 85
      Hint = 'Defini'#231#227'o se os clientes dever'#227'o ser impressos ou n'#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        '&Com clientes'
        '&Sem clientes'
        'S'#243' &clientes')
      ParentFont = False
      TabOrder = 3
    end
  end
end
