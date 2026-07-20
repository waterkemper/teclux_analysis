inherited frmVendasPerdidas: TfrmVendasPerdidas
  Left = 415
  Top = 194
  ActiveControl = edfVendaPerdida
  Caption = 'Vendas Perdidas'
  ClientHeight = 456
  ClientWidth = 926
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  object StaticText4: TStaticText [0]
    Left = 0
    Top = 72
    Width = 926
    Height = 28
    Align = alTop
    AutoSize = False
    BorderStyle = sbsSunken
    TabOrder = 21
  end
  object stxItemProduto: TStaticText [1]
    Left = 0
    Top = 129
    Width = 926
    Height = 34
    Align = alTop
    AutoSize = False
    BorderStyle = sbsSunken
    TabOrder = 19
  end
  object StaticText1: TStaticText [2]
    Left = 0
    Top = 163
    Width = 926
    Height = 34
    Align = alTop
    AutoSize = False
    BorderStyle = sbsSunken
    TabOrder = 17
  end
  object StaticText3: TStaticText [3]
    Left = 0
    Top = 100
    Width = 926
    Height = 29
    Align = alTop
    AutoSize = False
    BorderStyle = sbsSunken
    TabOrder = 16
  end
  object StaticText2: TStaticText [4]
    Left = 0
    Top = 45
    Width = 926
    Height = 27
    Align = alTop
    AutoSize = False
    BorderStyle = sbsSunken
    TabOrder = 15
  end
  inherited pnlBarra: TPanel
    Left = 0
    Top = 456
    Width = 926
    Height = 0
    Align = alBottom
    TabOrder = 7
  end
  inherited pnlTopMenu: TPanel
    Width = 926
    TabOrder = 8
    inherited tblBarra: TToolBar
      Width = 701
    end
  end
  object stxNumero: TStaticText
    Left = 15
    Top = 53
    Width = 41
    Height = 12
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'N'#250'mero'
    TabOrder = 9
  end
  object edfVendaPerdida: TtecDbEditFind
    Left = 61
    Top = 48
    Width = 65
    Height = 23
    Alignment = taLeftJustify
    DataField = 'codigo'
    DataSource = dtmVendasPerdidas.dsrVendasPerdidas
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'helvetica'
    Font.Pitch = fpVariable
    Font.Style = [fsBold]
    Group = 'VendaPerdida'
    MaxLength = 5
    Maximo = 0
    Minimo = 37353
    Adicional = 0
    Opcional = True
    OnExit = edfVendaPerdidaExit
    ParentFont = False
    TabOrder = 0
    PermitirZero = False
    PermitirNulo = False
    Operacao = opATRIBUICAO
    Parameter = 'codigo'
    ActiveSetControls = True
    DenyInsert = True
    NoSetControls = <
      item
        Control = stxNumero
      end
      item
        Control = pnlTopMenu
      end
      item
        Control = stxFilial
      end
      item
        Control = stxGrupo
      end
      item
      end
      item
        Control = stxDataHora
      end
      item
        Control = stxItem
      end>
    SetControls = <>
  end
  object stxDataHora: TStaticText
    Left = 730
    Top = 53
    Width = 55
    Height = 17
    Caption = 'Data/Hora'
    TabOrder = 10
  end
  object dtxDataHora: TtecDBText
    Left = 788
    Top = 48
    Width = 133
    Height = 23
    TabStop = False
    Color = clBtnFace
    DataField = 'data_hora'
    DataSource = dtmVendasPerdidas.dsrVendasPerdidas
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 11
    Alignment = taLeftJustify
  end
  object stxFilial: TStaticText
    Left = 23
    Top = 108
    Width = 33
    Height = 15
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Filial'
    TabOrder = 12
  end
  object dtxFilial: TtecDBText
    Left = 61
    Top = 105
    Width = 49
    Height = 23
    TabStop = False
    Color = clBtnFace
    DataField = 'filial'
    DataSource = dtmVendasPerdidas.dsrVendasPerdidas
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 13
    Alignment = taLeftJustify
  end
  object dtxDescricaoFilial: TtecDBText
    Left = 113
    Top = 105
    Width = 557
    Height = 23
    TabStop = False
    Color = clBtnFace
    DataField = 'nomefilial'
    DataSource = dtmVendasPerdidas.dsrVendasPerdidas
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 14
    Alignment = taLeftJustify
  end
  object stxGrupo: TStaticText
    Left = 23
    Top = 173
    Width = 33
    Height = 15
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Grupo'
    TabOrder = 18
  end
  object gbxObservacoes: TGroupBox
    Left = 0
    Top = 197
    Width = 926
    Height = 259
    Align = alClient
    Caption = 'Observa'#231#245'es'
    TabOrder = 6
    object mmoObservacoes: TtecDBMemo
      Left = 2
      Top = 15
      Width = 922
      Height = 242
      Align = alClient
      DataField = 'observacoes'
      DataSource = dtmVendasPerdidas.dsrVendasPerdidas
      TabOrder = 0
    end
  end
  inline fraConsultaGrupo: TfraConsultaCodigo
    Left = 62
    Top = 167
    Width = 608
    Height = 25
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
    TabOrder = 4
    inherited sbnProcura: TSpeedButton
      Left = 54
    end
    inherited dtxDescricao: TtecDBText
      Left = 80
      Width = 529
      DataField = 'descricao'
      DataSource = fraConsultaGrupo.dsrProcuraGrupoProdutos
    end
    inherited edfCodigo: TtecDBFindLookup
      Width = 52
      DataaFieldInterno = 'grupo'
      DataaFieldVisual = 'grupo'
      DataField = 'grupo'
      DataSource = dtmVendasPerdidas.dsrVendasPerdidas
      MaxLength = 4
      OnKeyDown = fraConsultaGrupoedfCodigoKeyDown
      LookupaFieldinterno = 'codigo'
      LookupaFieldVisual = 'codigo'
      LookupField = 'codigo'
      LookupSource = fraConsultaGrupo.dsrProcuraGrupoProdutos
      LookupQueryParameter = 'codigo'
      Parameter = ' '
      ActiveSetControls = False
      DenyInsert = True
      NoSetControls = <>
      SetControls = <>
      LookupParameter = 'codigo'
    end
    inherited qryProcuraGrupoProdutos: TtecQuery
      Options = [doAutoFillDefs]
    end
  end
  inline fraConsultaItemProduto: TfraConsultaCodigo
    Left = 62
    Top = 133
    Width = 866
    Height = 24
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
    TabOrder = 2
    inherited sbnProcura: TSpeedButton
      Left = 134
      Hint = 'Procura Item de Fornecedor'
    end
    inherited edfCodigo: TtecDBFindLookup [1]
      Width = 132
      DataaFieldInterno = 'produto'
      DataaFieldVisual = 'produtovisual'
      DataField = 'produtovisual'
      DataSource = dtmVendasPerdidas.dsrVendasPerdidas
      MaxLength = 30
      OnKeyDown = fraConsultaItemProdutoedfCodigoKeyDown
      LookupaFieldinterno = 'codigo'
      LookupaFieldVisual = 'codigovisual'
      LookupField = 'codigovisual'
      LookupSource = fraConsultaItemProduto.dsrProcuraItemProdutos
      LookupQueryParameter = 'produtovisual'
      Parameter = ' '
      ActiveSetControls = False
      DenyInsert = True
      NoSetControls = <>
      SetControls = <>
      LookupParameter = 'produtovisual'
    end
    inherited dtxDescricao: TtecDBText [2]
      Left = 157
      Width = 713
      DataField = 'descricao'
      DataSource = fraConsultaItemProduto.dsrProcuraItemProdutos
    end
    inherited qryProcuraItemProdutos: TtecQuery
      Options = [doAutoFillDefs]
    end
  end
  object stxItem: TStaticText
    Left = 23
    Top = 141
    Width = 33
    Height = 15
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Item'
    TabOrder = 20
  end
  object edtdescricaogrupoproduto: TDBEditTexto
    Left = 134
    Top = 167
    Width = 531
    Height = 23
    DataField = 'descricaogrupoproduto'
    DataSource = dtmVendasPerdidas.dsrVendasPerdidas
    MaxLength = -1
    TabOrder = 5
    CharCasenoDefault = False
    Alignment = taLeftJustify
  end
  object edtdescricaoitemproduto: TDBEditTexto
    Left = 213
    Top = 133
    Width = 708
    Height = 23
    DataField = 'descricaoitemproduto'
    DataSource = dtmVendasPerdidas.dsrVendasPerdidas
    MaxLength = -1
    TabOrder = 3
    CharCasenoDefault = False
    Alignment = taLeftJustify
  end
  inline fraConsultaVendedor: TfraConsultaCodigo
    Left = 61
    Top = 76
    Width = 609
    Height = 24
    HorzScrollBar.Range = 448
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
    TabOrder = 1
    inherited sbnProcura: TSpeedButton
      Left = 65
      Top = 1
    end
    inherited dtxDescricao: TtecDBText
      Width = 521
      DataField = 'nome'
      DataSource = fraConsultaVendedor.dsrProcuraVendedores
    end
    inherited edfCodigo: TtecDBFindLookup
      DataaFieldInterno = 'vendedor'
      DataaFieldVisual = 'vendedor'
      DataField = 'vendedor'
      DataSource = dtmVendasPerdidas.dsrVendasPerdidas
      MaxLength = 6
      LookupField = 'codigo'
      LookupSource = fraConsultaVendedor.dsrProcuraVendedores
      LookupQueryParameter = 'codigo'
      Parameter = ' '
      ActiveSetControls = False
      DenyInsert = True
      NoSetControls = <>
      SetControls = <>
      LookupParameter = 'codigo'
    end
    inherited qryProcuraVendedores: TtecQuery
      Options = [doAutoFillDefs]
    end
  end
  object StaticText5: TStaticText
    Left = 3
    Top = 81
    Width = 53
    Height = 12
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Vendedor'
    TabOrder = 22
  end
end
