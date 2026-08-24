inherited frmCadastroSaldoCashBack: TfrmCadastroSaldoCashBack
  Left = 534
  Top = 191
  Caption = 'Cadastro Saldo CashBack'
  ClientHeight = 264
  ClientWidth = 705
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBarra: TPanel
    Left = 0
    Top = 45
    Width = 705
    Height = 219
    Align = alClient
    Visible = True
    inherited bvlBotoesEd: TBevel
      Left = 1
      Top = 1
      Height = 217
      Align = alLeft
      Visible = False
    end
    object lblNumero: TLabel
      Left = 25
      Top = 12
      Width = 45
      Height = 16
      Caption = 'N'#250'mero'
    end
    object lblDataHora: TLabel
      Left = 10
      Top = 91
      Width = 58
      Height = 16
      Caption = 'Data/Hora'
    end
    object lblEvento: TLabel
      Left = 10
      Top = 39
      Width = 60
      Height = 16
      Caption = 'CashBack'
    end
    object Label1: TLabel
      Left = 26
      Top = 64
      Width = 45
      Height = 16
      Caption = 'Produto'
    end
    object lblReferencia: TLabel
      Left = 8
      Top = 195
      Width = 61
      Height = 16
      Caption = 'Refer'#234'ncia'
    end
    object Label2: TLabel
      Left = 234
      Top = 93
      Width = 49
      Height = 16
      Caption = 'Validade'
    end
    object dtxNumero: TtecDBText
      Left = 73
      Top = 8
      Width = 88
      Height = 24
      TabStop = False
      Color = clBtnFace
      DataField = 'codigo'
      DataSource = dtmConsultaDadosCliente.dsrcashback_saldos
      ReadOnly = True
      TabOrder = 7
      Alignment = taLeftJustify
    end
    object rgpTipo: TtecDBRadioGroup
      Left = 74
      Top = 115
      Width = 129
      Height = 67
      Caption = 'Tipo de Opera'#231#227'o'
      TabOrder = 4
      TabStop = False
      DataField = 'tipo'
      DataSource = dtmConsultaDadosCliente.dsrcashback_saldos
      object rbnEntrada: TtecRadioButton
        Left = 8
        Top = 24
        Width = 105
        Height = 17
        Caption = 'Entrada'
        Checked = True
        TabOrder = 0
        TabStop = True
        Value = 'E'
      end
      object rbnSaida: TtecRadioButton
        Left = 8
        Top = 45
        Width = 105
        Height = 17
        Caption = 'Saida'
        TabOrder = 1
        Value = 'S'
      end
    end
    object gbxValores: TGroupBox
      Left = 208
      Top = 115
      Width = 167
      Height = 67
      Caption = 'Valores'
      TabOrder = 5
      object lblSaldo: TLabel
        Left = 25
        Top = 45
        Width = 33
        Height = 16
        Alignment = taRightJustify
        Caption = 'Saldo'
      end
      object lblValor: TLabel
        Left = 29
        Top = 20
        Width = 29
        Height = 16
        Alignment = taRightJustify
        Caption = 'Valor'
      end
      object edtSaldo: TDBEditNumero
        Left = 62
        Top = 41
        Width = 100
        Height = 21
        TabStop = False
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = 13
        Font.Name = 'helvetica'
        Font.Pitch = fpVariable
        Font.Style = []
        MaxLength = -1
        ParentFont = False
        TabOrder = 0
        Mascara = True
        TipoMascara = tmGERAL
        NrDecimal = 2
        Decimais = True
        Negativo = True
        Tamanho = 9
        DataField = 'saldofinalcalc'
        DataSource = dtmConsultaDadosCliente.dsrcashback_saldos
      end
      object edtValor: TDBEditNumero
        Left = 62
        Top = 16
        Width = 100
        Height = 24
        MaxLength = -1
        TabOrder = 1
        Text = '1,00'
        Mascara = True
        TipoMascara = tmGERAL
        NrDecimal = 2
        Decimais = True
        Negativo = False
        Tamanho = 9
        DataField = 'valor'
        DataSource = dtmConsultaDadosCliente.dsrcashback_saldos
      end
    end
    inline fraConsultaCodigoCashBack: TfraConsultaCodigo
      Left = 73
      Top = 34
      Width = 500
      Height = 23
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
        DataSource = fraConsultaCodigoCashBack.dsrProcuraCashBack
      end
      inherited edfCodigo: TtecDBFindLookup
        DataField = 'cashback'
        DataSource = dtmConsultaDadosCliente.dsrcashback_saldos
        LookupField = 'codigo'
        LookupSource = fraConsultaCodigoCashBack.dsrProcuraCashBack
        LookupQueryParameter = 'codigo'
        Parameter = ' '
        ActiveSetControls = False
        DenyInsert = True
        NoSetControls = <>
        SetControls = <>
        LookupParameter = 'codigo'
      end
    end
    inline fraConsultaCodigoProduto: TfraConsultaCodigo
      Left = 74
      Top = 60
      Width = 639
      Height = 23
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
      TabOrder = 1
      inherited sbnProcura: TSpeedButton
        Left = 128
      end
      inherited dtxDescricao: TtecDBText
        Left = 152
        Width = 473
        DataField = 'descricao'
        DataSource = fraConsultaCodigoProduto.dsrProcuraProdutos
      end
      inherited edfCodigo: TtecDBFindLookup
        Width = 129
        DataaFieldInterno = 'produto'
        DataField = 'codigovisual'
        DataSource = dtmConsultaDadosCliente.dsrcashback_saldos
        LookupaFieldinterno = 'codigo'
        LookupaFieldVisual = 'codigovisual'
        LookupField = 'codigovisual'
        LookupSource = fraConsultaCodigoProduto.dsrProcuraItemProdutos
        LookupQueryParameter = 'produtovisual'
        Parameter = ' '
        ActiveSetControls = False
        DenyInsert = False
        NoSetControls = <>
        SetControls = <>
        LookupParameter = 'produtovisual'
      end
    end
    object edtReferencia: TDBEditTexto
      Left = 72
      Top = 191
      Width = 625
      Height = 24
      DataField = 'referencia'
      DataSource = dtmConsultaDadosCliente.dsrcashback_saldos
      MaxLength = -1
      TabOrder = 6
      CharCasenoDefault = False
      Alignment = taLeftJustify
    end
    object AdvDBDateTimePicker1: TAdvDBDateTimePicker
      Left = 289
      Top = 88
      Width = 154
      Height = 22
      Date = 44424.700775462960000000
      Time = 44424.700775462960000000
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Pitch = fpVariable
      Font.Style = []
      Kind = dkDateTime
      ParentFont = False
      TabOrder = 3
      BorderStyle = bsSingle
      Ctl3D = True
      DateTime = 44424.700775462960000000
      TimeFormat = 'HH:mm'
      Version = '1.2.0.1'
      LabelAlwaysEnabled = True
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'MS Sans Serif'
      LabelFont.Style = []
      DataField = 'validade'
      DataSource = dtmConsultaDadosCliente.dsrcashback_saldos
    end
    object AdvDBDateTimePicker2: TAdvDBDateTimePicker
      Left = 73
      Top = 88
      Width = 154
      Height = 22
      Date = 44424.700775462960000000
      Time = 44424.700775462960000000
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Pitch = fpVariable
      Font.Style = []
      Kind = dkDateTime
      ParentFont = False
      TabOrder = 2
      BorderStyle = bsSingle
      Ctl3D = True
      DateTime = 44424.700775462960000000
      TimeFormat = 'HH:mm'
      Version = '1.2.0.1'
      LabelAlwaysEnabled = True
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'MS Sans Serif'
      LabelFont.Style = []
      DataField = 'data_hora'
      DataSource = dtmConsultaDadosCliente.dsrcashback_saldos
    end
  end
  inherited pnlTopMenu: TPanel
    Width = 705
    inherited tblBarra: TToolBar
      Width = 480
      inherited sbnProcurar: TSpeedButton
        Visible = False
      end
    end
    inherited tblBarraCadastro: TToolBar
      inherited sbnIncluir: TSpeedButton
        Visible = False
      end
      inherited sbnExcluir: TSpeedButton
        Visible = False
      end
    end
  end
end
