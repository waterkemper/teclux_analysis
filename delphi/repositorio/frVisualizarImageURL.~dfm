object fraVisualizarImageURL: TfraVisualizarImageURL
  Left = 0
  Top = 0
  Width = 700
  Height = 484
  TabOrder = 0
  object Splitter2: TSplitter
    Left = 0
    Top = 0
    Width = 0
    Height = 270
    Color = 16764108
    ParentColor = False
  end
  object SplitterBottom: TSplitter
    Left = 0
    Top = 270
    Width = 700
    Height = 0
    Cursor = crVSplit
    Align = alBottom
  end
  object pnlInformacoesProduto: TPanel
    Left = 0
    Top = 452
    Width = 700
    Height = 32
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object lblProduto: TLabel
      Left = 0
      Top = 0
      Width = 700
      Height = 32
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Helvetica'
      Font.Style = []
      ParentFont = False
    end
    object FileListBox1: TFileListBox
      Left = 568
      Top = 0
      Width = 129
      Height = 32
      ItemHeight = 13
      Mask = '*.bmp'
      MultiSelect = True
      TabOrder = 0
      Visible = False
    end
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 270
    Width = 700
    Height = 182
    Align = alBottom
    ButtonHeight = 86
    ButtonWidth = 87
    Caption = 'ToolBar1'
    Images = ImageList1
    TabOrder = 1
  end
  object ScrollBox1: TScrollBox
    Left = 0
    Top = 0
    Width = 700
    Height = 270
    Align = alClient
    AutoSize = True
    TabOrder = 2
    object imgVisualFormURL: TImage
      Left = 0
      Top = 0
      Width = 696
      Height = 266
      Align = alClient
      AutoSize = True
      Center = True
      Proportional = True
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 0
    Height = 270
    Align = alLeft
    Caption = 'Panel1'
    TabOrder = 3
  end
  object ImageList1: TImageList
    Height = 80
    Width = 80
    Left = 8
    Top = 16
  end
  object qryFotosProdutos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select fp.*,'
      '       p.codigovisual as produtovisual,'
      '       p.descricao as descricaoprodudo'
      'from fotosprodutos fp join produtos p on fp.produto = p.codigo'
      'where fp.produto = :produto'
      'order by coalesce(nullif(trim(fp.posicao),'#39#39'),'#39'99999'#39')'
      '')
    RequestLive = False
    Left = 56
    Top = 40
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'produto'
        ParamType = ptUnknown
      end>
    object qryFotosProdutosproduto: TLargeintField
      FieldName = 'produto'
    end
    object qryFotosProdutosnomefoto: TStringField
      FieldName = 'nomefoto'
      Size = 250
    end
    object qryFotosProdutoslabel: TStringField
      FieldName = 'label'
      Size = 60
    end
    object qryFotosProdutosposicao: TStringField
      FieldName = 'posicao'
      Size = 4
    end
    object qryFotosProdutosnomethumb: TStringField
      FieldName = 'nomethumb'
      Size = 250
    end
    object qryFotosProdutosnomemedia: TStringField
      FieldName = 'nomemedia'
      Size = 250
    end
    object qryFotosProdutosreferencia: TIntegerField
      FieldName = 'referencia'
    end
    object qryFotosProdutosdescricaoprodudo: TStringField
      FieldName = 'descricaoprodudo'
      Size = 51
    end
    object qryFotosProdutosprodutovisual: TStringField
      FieldName = 'produtovisual'
      Size = 30
    end
  end
  object MIMEDecoder: TIdDecoderMIME
    FillChar = '='
    Left = 168
    Top = 64
  end
end
