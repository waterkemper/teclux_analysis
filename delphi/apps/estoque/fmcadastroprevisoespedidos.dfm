inherited frmCadastroPrevisoesPedidos: TfrmCadastroPrevisoesPedidos
  Left = 558
  Top = 188
  ActiveControl = edtDias
  Caption = 'Cadastro de Previs'#245'es do Pedido'
  ClientHeight = 144
  ClientWidth = 392
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBarra: TPanel
    Width = 348
    inherited bvlBotoesEd: TBevel
      Left = 201
    end
  end
  inherited pnlTopMenu: TPanel
    Width = 392
    TabOrder = 2
    inherited tblBarra: TToolBar
      Width = 167
      inherited sbnProcurar: TSpeedButton
        Width = 41
        Visible = False
      end
      inherited sbnAjuda: TSpeedButton
        Left = 41
      end
      inherited tbnDivisor: TToolButton
        Left = 42
      end
    end
    inherited tblBarraCadastro: TToolBar
      inherited sbnSalvar: TSpeedButton
        Enabled = True
      end
      inherited sbnExcluir: TSpeedButton
        Enabled = True
      end
    end
  end
  object pnlFundoJanela: TPanel
    Left = 0
    Top = 40
    Width = 392
    Height = 104
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 3
    TabOrder = 1
    object gbxPrevisoesPedido: TGroupBox
      Left = 3
      Top = 3
      Width = 386
      Height = 98
      Align = alClient
      TabOrder = 0
      object lblDias: TLabel
        Left = 55
        Top = 39
        Width = 26
        Height = 16
        Alignment = taRightJustify
        Caption = 'Dias'
      end
      object lblPercentual2: TLabel
        Left = 139
        Top = 65
        Width = 12
        Height = 16
        Caption = '%'
      end
      object lblPedido: TLabel
        Left = 41
        Top = 12
        Width = 40
        Height = 16
        Alignment = taRightJustify
        Caption = 'Pedido'
      end
      object lblData: TLabel
        Left = 171
        Top = 39
        Width = 27
        Height = 16
        Alignment = taRightJustify
        Caption = 'Data'
      end
      object lblPercentual: TLabel
        Left = 19
        Top = 65
        Width = 62
        Height = 16
        Alignment = taRightJustify
        Caption = 'Percentual'
      end
      object lblValor: TLabel
        Left = 169
        Top = 65
        Width = 29
        Height = 16
        Alignment = taRightJustify
        Caption = 'Valor'
      end
      object edtDias: TDBEditNumero
        Left = 85
        Top = 35
        Width = 50
        Height = 24
        MaxLength = -1
        TabOrder = 0
        Mascara = True
        TipoMascara = tmGERAL
        NrDecimal = 2
        Decimais = False
        Negativo = False
        Tamanho = 4
        DataField = 'dias'
        DataSource = dtmCadastroPedidos.dsrPrevisoesPedidos
      end
      object dtxData: TtecDBText
        Left = 203
        Top = 35
        Width = 75
        Height = 24
        TabStop = False
        Color = clBtnFace
        DataField = 'data'
        DataSource = dtmCadastroPedidos.dsrPrevisoesPedidos
        ReadOnly = True
        TabOrder = 2
        Alignment = taLeftJustify
      end
      object edtPercentual: TDBEditNumero
        Left = 85
        Top = 61
        Width = 50
        Height = 24
        MaxLength = -1
        TabOrder = 1
        Mascara = True
        TipoMascara = tmGERAL
        NrDecimal = 2
        Decimais = True
        Negativo = False
        Tamanho = 3
        DataField = 'percentual'
        DataSource = dtmCadastroPedidos.dsrPrevisoesPedidos
      end
      object dxtValor: TtecDBText
        Left = 203
        Top = 61
        Width = 110
        Height = 24
        TabStop = False
        Color = clBtnFace
        DataField = 'valor'
        DataSource = dtmCadastroPedidos.dsrPrevisoesPedidos
        ReadOnly = True
        TabOrder = 3
        Alignment = taLeftJustify
      end
      object dtxPedido: TtecDBText
        Left = 85
        Top = 8
        Width = 80
        Height = 24
        TabStop = False
        Color = clBtnFace
        DataField = 'pedido'
        DataSource = dtmCadastroPedidos.dsrPrevisoesPedidos
        ReadOnly = True
        TabOrder = 4
        Alignment = taLeftJustify
      end
    end
  end
end
