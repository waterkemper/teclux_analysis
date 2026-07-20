inherited frmrelatorioatualizacaomonetaria: Tfrmrelatorioatualizacaomonetaria
  Left = 422
  Top = 262
  ActiveControl = spnExercicio
  Caption = 'Relat'#243'rio de Atualiza'#231#227'o Monet'#225'ria'
  ClientHeight = 177
  ClientWidth = 515
  FormStyle = fsMDIChild
  Position = poOwnerFormCenter
  Visible = True
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBarra: TToolBar
    Width = 515
  end
  inherited pnlFundoJanela: TPanel
    Top = 40
    Width = 515
    Height = 137
    Align = alTop
    object gbxPeriodo: TGroupBox
      Left = 6
      Top = 6
      Width = 64
      Height = 36
      Caption = 'EXERC'#205'CIO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object gbxEmpreendimento: TGroupBox
      Left = 6
      Top = 53
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
          ActiveSetControls = False
          DenyInsert = True
          NoSetControls = <>
          SetControls = <>
        end
      end
    end
    object gbxCliente: TGroupBox
      Left = 6
      Top = 95
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
          ActiveSetControls = False
          DenyInsert = True
          NoSetControls = <>
          SetControls = <>
        end
      end
    end
    object spnExercicio: TSpinEdit
      Left = 8
      Top = 16
      Width = 60
      Height = 26
      MaxValue = 0
      MinValue = 0
      TabOrder = 0
      Value = 1900
    end
    object ckbResumo: TCheckBox
      Left = 277
      Top = 14
      Width = 228
      Height = 20
      Caption = 'Resumo por empreendimento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object ckbCurto_e_LongPrazo: TCheckBox
      Left = 276
      Top = 30
      Width = 229
      Height = 20
      Caption = 'Incluir totais de Curto e Longo Prazo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
  end
end
