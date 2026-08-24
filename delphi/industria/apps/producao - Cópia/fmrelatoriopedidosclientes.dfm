inherited frmRelatorioPedidosClientes: TfrmRelatorioPedidosClientes
  Left = 664
  Top = 272
  Caption = 'Quadro de pedidos por cliente'
  ClientHeight = 160
  ClientWidth = 448
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBarra: TToolBar
    Width = 448
  end
  inherited pnlFundoJanela: TPanel
    Top = 42
    Width = 448
    Height = 118
    object gbxEntrega: TGroupBox
      Left = 131
      Top = 10
      Width = 109
      Height = 47
      Caption = 'ENTREGA EM'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      object gbxSemanaEntrega: TGroupBox
        Left = 53
        Top = 12
        Width = 56
        Height = 40
        Caption = 'SEMANA'
        TabOrder = 0
        object edtSemanaEntrega: TSpinEdit
          Left = 2
          Top = 10
          Width = 52
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxValue = 53
          MinValue = 0
          ParentFont = False
          TabOrder = 0
          Value = 0
          OnExit = edtSemanaEntregaExit
        end
      end
      object gbxAnoEntrega: TGroupBox
        Left = 0
        Top = 12
        Width = 55
        Height = 40
        Caption = 'ANO'
        TabOrder = 1
        object edtAnoEntrega: TSpinEdit
          Left = 2
          Top = 10
          Width = 50
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = 4
          MaxValue = 3000
          MinValue = 2000
          ParentFont = False
          TabOrder = 0
          Value = 2000
          OnExit = edtAnoEntregaExit
        end
      end
    end
    object gbxEntrada: TGroupBox
      Left = 10
      Top = 10
      Width = 109
      Height = 47
      Caption = 'ENTRADA DESDE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object gbxSemanaEntrada: TGroupBox
        Left = 53
        Top = 12
        Width = 56
        Height = 40
        Caption = 'SEMANA'
        TabOrder = 0
        object edtSemanaEntrada: TSpinEdit
          Left = 2
          Top = 10
          Width = 52
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxValue = 53
          MinValue = 0
          ParentFont = False
          TabOrder = 0
          Value = 0
          OnExit = edtSemanaEntradaExit
        end
      end
      object gbxAnoEntrada: TGroupBox
        Left = 0
        Top = 12
        Width = 55
        Height = 40
        Caption = 'ANO'
        TabOrder = 1
        object edtAnoEntrada: TSpinEdit
          Left = 2
          Top = 10
          Width = 50
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'helvetica'
          Font.Pitch = fpVariable
          Font.Style = []
          MaxLength = 4
          MaxValue = 3000
          MinValue = 2000
          ParentFont = False
          TabOrder = 0
          Value = 2000
          OnExit = edtAnoEntradaExit
        end
      end
    end
    object gbxCliente: TGroupBox
      Left = 9
      Top = 65
      Width = 425
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
        Width = 421
        Height = 23
        HorzScrollBar.Range = 526
        HorzScrollBar.Visible = False
        VertScrollBar.Range = 23
        VertScrollBar.Visible = False
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
          Width = 332
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
    object gbxOSP: TGroupBox
      Left = 252
      Top = 10
      Width = 181
      Height = 47
      Caption = 'OSP'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object gbxOSPInicial: TGroupBox
        Left = 0
        Top = 12
        Width = 91
        Height = 36
        Caption = 'INICIAL'
        TabOrder = 0
        inline fraConsultaOSPinicial: TfraConsultaCodigo
          Left = 2
          Top = 10
          Width = 88
          Height = 23
          HorzScrollBar.Range = 87
          HorzScrollBar.Visible = False
          VertScrollBar.Range = 23
          VertScrollBar.Visible = False
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
            Width = 1
            Visible = False
          end
          inherited edfCodigo: TtecDBFindLookup
            DataField = 'numero'
            DataSource = fraConsultaOSPinicial.dsrProcuraOSP
            Group = 'OSPinicial'
            MaxLength = 8
            OnFound = nil
            Operacao = opPESQUISA
            Parameter = 'numero'
            ActiveSetControls = False
            DenyInsert = True
            NoSetControls = <>
            SetControls = <>
          end
        end
      end
      object gbxOSPFinal: TGroupBox
        Left = 89
        Top = 12
        Width = 92
        Height = 36
        Caption = 'FINAL'
        TabOrder = 1
        inline fraConsultaOSPfinal: TfraConsultaCodigo
          Left = 2
          Top = 10
          Width = 88
          Height = 23
          HorzScrollBar.Range = 87
          HorzScrollBar.Visible = False
          VertScrollBar.Range = 23
          VertScrollBar.Visible = False
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
            Width = 1
            Visible = False
          end
          inherited edfCodigo: TtecDBFindLookup
            Left = 1
            DataField = 'numero'
            DataSource = fraConsultaOSPfinal.dsrProcuraOSP
            Group = 'OSPfinal'
            MaxLength = 8
            OnFound = nil
            Operacao = opPESQUISA
            Parameter = 'numero'
            ActiveSetControls = False
            DenyInsert = True
            NoSetControls = <>
            SetControls = <>
          end
        end
      end
    end
  end
  object ecvValida: TtecEditionControlValidation
    EditionControl = <
      item
        Control = edtAnoEntrada
      end
      item
        Control = edtAnoEntrega
      end
      item
        Control = edtSemanaEntrada
      end
      item
        Control = edtSemanaEntrega
      end>
    Left = 384
    Top = 8
  end
end
