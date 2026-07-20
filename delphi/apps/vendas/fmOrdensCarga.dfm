inherited frmOrdensCarga: TfrmOrdensCarga
  Left = 463
  Top = 107
  ActiveControl = edfOrdemdeCarga
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  Caption = 'Ordens de Carga'
  ClientHeight = 628
  ClientWidth = 1281
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBarra: TPanel
    Left = 0
    Top = 628
    Width = 1281
    Height = 0
    Align = alBottom
  end
  inherited pnlTopMenu: TPanel
    Width = 1281
    inherited tblBarra: TToolBar
      Width = 1056
    end
  end
  object pnlOrdemCarga: TPanel
    Left = 0
    Top = 40
    Width = 1281
    Height = 49
    Align = alTop
    TabOrder = 2
    object gbxNrOrdemCarga: TGroupBox
      Left = 5
      Top = 3
      Width = 109
      Height = 38
      Caption = 'N'#218'MERO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object GroupBox1: TGroupBox
      Left = 117
      Top = 3
      Width = 107
      Height = 38
      Caption = 'DATA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object edtData: TDBEditData
        Left = 3
        Top = 12
        Width = 99
        Height = 23
        Alignment = taLeftJustify
        DataField = 'data'
        DataSource = dtmOrdensCarga.dsrOrdensCarga
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        Maximo = 0
        Minimo = 37353
        Adicional = 0
        ParentFont = False
        TabOrder = 0
        Opcional = True
      end
    end
    object edfOrdemdeCarga: TtecDbEditFind
      Left = 7
      Top = 14
      Width = 103
      Height = 23
      Alignment = taLeftJustify
      DataField = 'numero'
      DataSource = dtmOrdensCarga.dsrOrdensCarga
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Pitch = fpVariable
      Font.Style = []
      Group = 'ordemdecarga'
      Maximo = 0
      Minimo = 37353
      Adicional = 0
      Opcional = True
      ParentFont = False
      TabOrder = 2
      PermitirZero = False
      PermitirNulo = False
      Operacao = opPESQUISA
      Parameter = 'numero'
      ActiveSetControls = True
      DenyInsert = True
      NoSetControls = <>
      SetControls = <>
    end
  end
  object dbgOrdensCarga: TtecDBGrid
    Left = 0
    Top = 209
    Width = 1281
    Height = 419
    Align = alClient
    DataSource = dtmOrdensCarga.dsrOrdemdeCargaProdutos
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'MS Sans Serif'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -9
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Pitch = fpVariable
    TitleFont.Style = []
    RowWrap = 60
    Large = False
    DoubleRowColor = False
    TitleMinHeight = 100
    CellHeights = 100
    StrippedColor = 16054260
    CanDelete = False
    PostOnEnter = False
    DenySort = False
    DefaultRowHeight = 17
    ExibirNumerodaLinha = False
    Columns = <
      item
        Expanded = False
        FieldName = 'nomecliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        Width = 154
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nomecidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        Width = 102
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nomebairro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'localentrega'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        Width = 210
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'telefone'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        Width = 116
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'contato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nrnota'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'observacoes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        Width = 204
        Visible = True
      end
      item
        Expanded = False
        FieldName = '_001'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        Title.Alignment = taCenter
        Width = 37
        Visible = True
      end
      item
        Expanded = False
        FieldName = '_002'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        Title.Alignment = taCenter
        Width = 37
        Visible = True
      end
      item
        Expanded = False
        FieldName = '_003'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        Title.Alignment = taCenter
        Width = 37
        Visible = True
      end
      item
        Expanded = False
        FieldName = '_004'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        Title.Alignment = taCenter
        Width = 37
        Visible = True
      end
      item
        Expanded = False
        FieldName = '_005'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        Title.Alignment = taCenter
        Width = 37
        Visible = True
      end
      item
        Expanded = False
        FieldName = '_010'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        Title.Alignment = taCenter
        Width = 37
        Visible = True
      end
      item
        Expanded = False
        FieldName = '_013'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        Title.Alignment = taCenter
        Width = 37
        Visible = True
      end
      item
        Expanded = False
        FieldName = '_014'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        Title.Alignment = taCenter
        Width = 37
        Visible = True
      end
      item
        Expanded = False
        FieldName = '_024_12'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        Title.Alignment = taCenter
        Width = 37
        Visible = True
      end
      item
        Expanded = False
        FieldName = '_10'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        Title.Alignment = taCenter
        Width = 37
        Visible = True
      end
      item
        Expanded = False
        FieldName = '_15'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        Title.Alignment = taCenter
        Width = 37
        Visible = True
      end
      item
        Expanded = False
        FieldName = '_24_12'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        Title.Alignment = taCenter
        Width = 37
        Visible = True
      end
      item
        Expanded = False
        FieldName = '_5'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        Title.Alignment = taCenter
        Width = 37
        Visible = True
      end
      item
        Expanded = False
        FieldName = '_7'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        Title.Alignment = taCenter
        Width = 37
        Visible = True
      end>
  end
  object dbgentrega: TtecDBGrid
    Left = 0
    Top = 89
    Width = 1281
    Height = 120
    Align = alTop
    DataSource = dtmOrdensCarga.dsrOrdemdeCargaRegioes
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'MS Sans Serif'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -9
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Pitch = fpVariable
    TitleFont.Style = []
    RowWrap = 60
    Large = False
    DoubleRowColor = False
    TitleMinHeight = 100
    CellHeights = 100
    StrippedColor = 16054260
    CanDelete = False
    PostOnEnter = False
    DenySort = False
    DefaultRowHeight = 17
    ExibirNumerodaLinha = False
    Columns = <
      item
        Expanded = False
        FieldName = 'nomeregiao'
        Title.Caption = 'REGI'#195'O'
        Width = 196
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'responsavelentrega'
        Title.Caption = 'RESPONS'#193'VEL PELA ENTREGA'
        Width = 254
        Visible = True
      end>
  end
end
