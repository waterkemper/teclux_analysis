inherited frmCustoporPN: TfrmCustoporPN
  Left = 492
  Top = 214
  Caption = 'Custo por PN'
  ClientHeight = 167
  ClientWidth = 636
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBarra: TToolBar
    Width = 636
    inherited sbnAjuda: TSpeedButton
      Action = actHabilitarBotoes
    end
  end
  inherited pnlFundoJanela: TPanel
    Top = 162
    Width = 636
    Height = 5
    Visible = False
  end
  object gbxCliente: TGroupBox
    Left = 8
    Top = 48
    Width = 625
    Height = 38
    Caption = 'CLIENTE'
    TabOrder = 2
    object dtxCliente: TtecDBText
      Left = 6
      Top = 12
      Width = 81
      Height = 23
      TabStop = False
      Color = clBtnFace
      DataField = 'codigodocliente'
      DataSource = fraConsultaPN.dsrProcuraCaracteristicasProdutosClientes
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      Alignment = taLeftJustify
    end
    object dtxNomedoCliente: TtecDBText
      Left = 91
      Top = 12
      Width = 529
      Height = 23
      TabStop = False
      Color = clBtnFace
      DataField = 'nomedocliente'
      DataSource = fraConsultaPN.dsrProcuraCaracteristicasProdutosClientes
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      Alignment = taLeftJustify
    end
  end
  object gbxProduto: TGroupBox
    Left = 8
    Top = 88
    Width = 625
    Height = 41
    Caption = 'PRODUTO'
    TabOrder = 3
    object dtxProduto: TtecDBText
      Left = 6
      Top = 12
      Width = 195
      Height = 23
      TabStop = False
      Color = clBtnFace
      DataField = 'codigoprodutovisual'
      DataSource = fraConsultaPN.dsrProcuraCaracteristicasProdutosClientes
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      Alignment = taLeftJustify
    end
    object dtxDescricaoProduto: TtecDBText
      Left = 200
      Top = 12
      Width = 420
      Height = 23
      TabStop = False
      Color = clBtnFace
      DataField = 'descricaoproduto'
      DataSource = fraConsultaPN.dsrProcuraCaracteristicasProdutosClientes
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      Alignment = taLeftJustify
    end
  end
  object PN: TGroupBox
    Left = 8
    Top = 128
    Width = 121
    Height = 39
    Caption = 'PN'
    TabOrder = 4
    inline fraConsultaPN: TfraConsultaCodigo
      Left = 4
      Top = 11
      Width = 115
      Height = 26
      HorzScrollBar.Range = 497
      HorzScrollBar.Visible = False
      VertScrollBar.Range = 23
      VertScrollBar.Visible = False
      AutoScroll = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      inherited sbnProcura: TSpeedButton
        Left = 88
      end
      inherited dtxDescricao: TtecDBText
        Left = 112
        Width = 0
        Visible = False
      end
      inherited edfCodigo: TtecDBFindLookup
        Width = 89
        DataField = 'pn'
        DataSource = fraConsultaPN.dsrProcuraCaracteristicasProdutosClientes
        Font.Name = 'Arial'
        MaxLength = 10
        Operacao = opPESQUISA
        Parameter = ' '
        ActiveSetControls = False
        DenyInsert = True
        NoSetControls = <>
        SetControls = <>
      end
    end
  end
  object actHabilitar: TActionList
    Left = 464
    Top = 8
    object actHabilitarBotoes: TAction
      Caption = 'actHabilitarBotoes'
      OnUpdate = actHabilitarBotoesUpdate
    end
  end
end
