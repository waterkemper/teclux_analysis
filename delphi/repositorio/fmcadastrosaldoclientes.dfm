inherited frmCadastroSaldoClientes: TfrmCadastroSaldoClientes
  Left = 296
  Top = 269
  ActiveControl = flkEvento
  Caption = 'Cadastro Saldo Clientes'
  ClientHeight = 230
  ClientWidth = 505
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBarra: TPanel
    Left = 0
    Top = 45
    Width = 505
    Height = 185
    Align = alClient
    Visible = True
    inherited bvlBotoesEd: TBevel
      Left = 1
      Top = 1
      Height = 183
      Align = alLeft
      Visible = False
    end
    object sbnProcuraEventos: TSpeedButton
      Left = 134
      Top = 38
      Width = 23
      Height = 23
      Hint = 'Procurar Eventos'
      Flat = True
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000120B0000120B00000000000000000000C3C3C3C3C3C3
        C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
        C3C3C3C3800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
        C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7FFFFFFFC3C3C3C3C3C3
        C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
        C3800000800000800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
        C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3
        C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C38000
        00800000800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
        C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3
        C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C38000008000
        00800000C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
        C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3
        C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C38000008000008000
        00C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFFFFFFFFFF
        FFFFC3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
        C3C3C3FFA858800000800000800000FFA858C3C3C30000FF800000800000C3C3
        C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3
        C3C3FFFFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
        800000FFA858FFA858FFA858FFA858FFA8588000008000000000FFC3C3C3C3C3
        C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7FC3C3C3C3C3C3C3C3C37F
        7F7F7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3800000
        FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000C3C3C3C3C3C3C3C3
        C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
        C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFA858FFA858
        FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858C3C3C3C3C3
        C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
        C3C3C3C3C37F7F7FC3C3C3FFFFFFC3C3C3C3C3C3C3C3C3C3C3C3800000FFA858
        FFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFA858800000C3C3C3C3C3
        C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
        C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3800000FFA858
        FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000C3C3C3C3C3
        C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
        C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3800000FFA858
        FFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFA858800000C3C3C3C3C3
        C3C3C3C3C3C3C3C3C3C37F7F7FC3C3C3FFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
        C3C3C3C3C3C3C3C37F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3FFA858FFA858
        FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858FFA858C3C3C3C3C3
        C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
        C3C3C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3800000
        FFA858FFFFFFFFFFC0FFFFFFFFFFC0FFFFFFFFA858800000C3C3C3C3C3C3C3C3
        C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7FC3C3C3FFFFFFFFFFFFC3C3C3C3C3C3C3
        C3C3FFFFFF7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
        800000FFA858FFA858FFA858FFA858FFA858800000C3C3C3C3C3C3C3C3C3C3C3
        C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7FC3C3C3FFFFFFFFFFFF7F
        7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
        C3C3C3FFA858800000800000800000FFA858C3C3C3C3C3C3C3C3C3C3C3C3C3C3
        C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7F7F7F7FC3
        C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3}
      NumGlyphs = 2
      OnClick = sbnProcuraEventosClick
    end
    object lblNumero: TLabel
      Left = 25
      Top = 12
      Width = 45
      Height = 16
      Caption = 'N'#250'mero'
    end
    object lblDataHora: TLabel
      Left = 192
      Top = 12
      Width = 58
      Height = 16
      Caption = 'Data/Hora'
    end
    object lblEvento: TLabel
      Left = 29
      Top = 42
      Width = 39
      Height = 16
      Caption = 'Evento'
    end
    object lblReferencia: TLabel
      Left = 8
      Top = 148
      Width = 61
      Height = 16
      Caption = 'Refer'#234'ncia'
    end
    object dtxNumero: TtecDBText
      Left = 73
      Top = 8
      Width = 100
      Height = 24
      TabStop = False
      Color = clBtnFace
      DataField = 'numero'
      DataSource = dtmConsultaDadosCliente.dsrProdutosTrocados
      ReadOnly = True
      TabOrder = 0
      Alignment = taLeftJustify
    end
    object rgpTipo: TtecDBRadioGroup
      Left = 72
      Top = 64
      Width = 129
      Height = 73
      Caption = 'Tipo de Opera'#231#227'o'
      TabOrder = 2
      TabStop = False
      DataField = 'tipo'
      DataSource = dtmConsultaDadosCliente.dsrProdutosTrocados
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
        Top = 48
        Width = 105
        Height = 17
        Caption = 'Saida'
        TabOrder = 1
        Value = 'S'
      end
    end
    object dtxDataHora: TtecDBText
      Left = 256
      Top = 8
      Width = 145
      Height = 24
      TabStop = False
      Color = clBtnFace
      DataField = 'data'
      DataSource = dtmConsultaDadosCliente.dsrProdutosTrocados
      ReadOnly = True
      TabOrder = 1
      Alignment = taLeftJustify
    end
    object flkEvento: TtecDBFindLookup
      Left = 73
      Top = 38
      Width = 60
      Height = 24
      Alignment = taLeftJustify
      DataField = 'evento'
      DataSource = dtmConsultaDadosCliente.dsrProdutosTrocados
      MaxLength = 6
      Maximo = 0
      Minimo = 37353
      Adicional = 0
      Opcional = True
      TabOrder = 6
      PermitirZero = False
      PermitirNulo = False
      Operacao = opATRIBUICAO
      LookupField = 'codigo'
      LookupSource = dtmConsultaDadosCliente.dsrProcuraEventos
      LookupQueryParameter = 'codigo'
      Parameter = ' '
      ActiveSetControls = False
      DenyInsert = False
      NoSetControls = <>
      SetControls = <>
      LookupParameter = 'codigo'
    end
    object dtxProcuraCliente: TtecDBText
      Left = 157
      Top = 38
      Width = 332
      Height = 24
      TabStop = False
      Color = clBtnFace
      DataField = 'descricao'
      DataSource = dtmConsultaDadosCliente.dsrProcuraEventos
      DragMode = dmAutomatic
      ReadOnly = True
      TabOrder = 3
      Alignment = taLeftJustify
    end
    object gbxValores: TGroupBox
      Left = 206
      Top = 64
      Width = 171
      Height = 73
      Caption = 'Valores'
      TabOrder = 4
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
        DataField = 'saldo'
        DataSource = dtmConsultaDadosCliente.dsrProdutosTrocados
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
        DataSource = dtmConsultaDadosCliente.dsrProdutosTrocados
      end
    end
    object edtReferencia: TDBEditTexto
      Left = 72
      Top = 144
      Width = 418
      Height = 24
      DataField = 'referencia'
      DataSource = dtmConsultaDadosCliente.dsrProdutosTrocados
      MaxLength = -1
      TabOrder = 5
      CharCasenoDefault = False
      Alignment = taLeftJustify
    end
  end
  inherited pnlTopMenu: TPanel
    Width = 505
    inherited tblBarra: TToolBar
      Width = 280
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
