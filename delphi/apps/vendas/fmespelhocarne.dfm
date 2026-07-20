inherited frmespelhocarne: Tfrmespelhocarne
  Left = 274
  Top = 175
  ActiveControl = fraConsultaFilial
  Caption = 'Espelho de Carn'#234
  ClientHeight = 235
  ClientWidth = 519
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBarra: TPanel
    Width = 519
  end
  inherited pnlFundoJanela: TPanel
    Width = 519
    Height = 194
    object gbxFilial: TGroupBox
      Left = 0
      Top = 5
      Width = 515
      Height = 50
      Caption = 'Filial'
      TabOrder = 0
      inline fraConsultaFilial: TfraConsultaCodigo
        Left = 7
        Top = 18
        Width = 506
        Height = 28
        HorzScrollBar.Range = 497
        VertScrollBar.Range = 23
        AutoScroll = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        inherited dtxDescricao: TtecDBText
          DataField = 'nome'
          DataSource = fraConsultaFilial.dsrProcuraFiliais
        end
        inherited edfCodigo: TtecDBFindLookup
          DataField = 'codigo'
          DataSource = fraConsultaFilial.dsrProcuraFiliais
          Group = 'Filial'
          MaxLength = 3
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
    object gbxPeriodo: TGroupBox
      Left = 0
      Top = 115
      Width = 201
      Height = 73
      Caption = 'Per'#237'odo'
      TabOrder = 2
      object gbxPeriodoInicial: TGroupBox
        Left = 8
        Top = 16
        Width = 90
        Height = 50
        Caption = 'Inicial'
        TabOrder = 0
        object edtPeriodoInicial: TEditData
          Left = 7
          Top = 20
          Width = 75
          Height = 24
          TabOrder = 0
          Minimo = 37353
          Maximo = 0
        end
      end
      object gbxPeriodoFinal: TGroupBox
        Left = 104
        Top = 16
        Width = 90
        Height = 50
        Caption = 'Final'
        TabOrder = 1
        object edtPeriodoFinal: TEditData
          Left = 7
          Top = 20
          Width = 75
          Height = 24
          TabOrder = 0
          Minimo = 37353
          Maximo = 0
        end
      end
    end
    object gbxAgente: TGroupBox
      Left = 0
      Top = 60
      Width = 515
      Height = 50
      Caption = 'Agente'
      TabOrder = 1
      inline fraConsultaAgente: TfraConsultaCodigo
        Left = 7
        Top = 18
        Width = 506
        Height = 29
        HorzScrollBar.Range = 497
        VertScrollBar.Range = 23
        AutoScroll = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        inherited dtxDescricao: TtecDBText
          DataField = 'descricao'
          DataSource = fraConsultaAgente.dsrProcuraAgentes
        end
        inherited edfCodigo: TtecDBFindLookup
          DataField = 'codigo'
          DataSource = fraConsultaAgente.dsrProcuraAgentes
          Group = 'Agente'
          MaxLength = 6
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
    object rgpCarnes: TRadioGroup
      Left = 208
      Top = 115
      Width = 169
      Height = 73
      Caption = 'Carn'#234's'
      ItemIndex = 0
      Items.Strings = (
        'Todos'
        'N'#227'o quitados')
      TabOrder = 3
    end
  end
end
