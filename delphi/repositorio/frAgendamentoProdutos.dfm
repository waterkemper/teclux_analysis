object fraAgendamentoProdutos: TfraAgendamentoProdutos
  Left = 0
  Top = 0
  Width = 867
  Height = 385
  TabOrder = 0
  object dbgAgendamentoProdutos: TtecDBGrid
    Left = 0
    Top = 0
    Width = 867
    Height = 300
    Align = alClient
    DataSource = dsrAgendamentoProdutos
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Helvetica'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -9
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = dbgAgendamentoProdutosDblClick
    OnKeyDown = dbgAgendamentoProdutosKeyDown
    RowWrap = 60
    Large = False
    DoubleRowColor = False
    TitleMinHeight = 100
    CellHeights = 100
    StrippedColor = 16054260
    CanDelete = False
    CanNotInsertFromGrid = True
    PostOnEnter = False
    PostOnSetUpDown = False
    DenySort = False
    DefaultRowHeight = 18
    ExibirNumerodaLinha = False
    NaoAtribuirDadosaTabelaaoDigitar = False
    ShowWhenFieldInvisible = False
    CanClickWhenEditing = False
    Columns = <
      item
        Expanded = False
        FieldName = 'codigovisual'
        Title.Alignment = taCenter
        Title.Caption = 'PRODUTO'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -9
        Title.Font.Name = 'Helvetica'
        Title.Font.Style = []
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descricao'
        Title.Alignment = taCenter
        Title.Caption = 'DESCRI'#199#195'O'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -9
        Title.Font.Name = 'Helvetica'
        Title.Font.Style = []
        Width = 205
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dias'
        Title.Alignment = taCenter
        Title.Caption = 'DIAS'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -9
        Title.Font.Name = 'Helvetica'
        Title.Font.Style = []
        Width = 29
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'agendamento'
        Title.Alignment = taCenter
        Title.Caption = 'AGENDAMENTO'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -9
        Title.Font.Name = 'Helvetica'
        Title.Font.Style = []
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'observacoes'
        Title.Alignment = taCenter
        Title.Caption = 'OBSERVA'#199#213'ES'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -9
        Title.Font.Name = 'Helvetica'
        Title.Font.Style = []
        Width = 381
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'marcar'
        ReadOnly = False
        Title.Caption = 'MARCAR'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -9
        Title.Font.Name = 'HELVETICA'
        Title.Font.Style = []
        Visible = True
      end>
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 364
    Width = 867
    Height = 21
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object lblLegenda: TLabel
      Left = 595
      Top = 3
      Width = 199
      Height = 14
      Alignment = taCenter
      Caption = '[Ctrl Barra de Espa'#231'o] Marcar/Desmarcar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Helvetica'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
    end
    object ckbMarcar: TCheckBox
      Left = 807
      Top = 2
      Width = 58
      Height = 17
      Caption = 'Todos'
      TabOrder = 0
      OnClick = ckbMarcarClick
    end
  end
  object gbxComplemento: TGroupBox
    Left = 0
    Top = 300
    Width = 867
    Height = 64
    Align = alBottom
    Caption = 'Complemento'
    TabOrder = 2
    object mmoComplemento: TtecDBMemo
      Left = 2
      Top = 15
      Width = 863
      Height = 47
      Align = alClient
      DataField = 'complemento'
      DataSource = dsrAgendamentoProdutos
      TabOrder = 0
    end
  end
  object dsrAgendamentoProdutos: TtecDataSource
    DataSet = qryAgendamentoProdutos
    Left = 8
    Top = 40
  end
  object qryAgendamentoProdutos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftString
        Name = 'ListadeProdutos'
        ParamType = ptUnknown
        Value = '0'
      end>
    Sql.Strings = (
      'select pa.produto,'
      '       p.codigovisual,'
      '       p.descricao,'
      '       pa.dias,'
      '       current_date+pa.dias as agendamento,'
      '       pa.observacoes,'
      '       cast(null as text) as complemento,'
      '       false as marcar'
      'from produtosagendamentos pa'
      '     join produtos p on pa.produto = p.codigo'
      'where pa.produto in (%ListadeProdutos)'
      '  and coalesce(pa.dias,0) <> 0'
      ''
      'union all'
      ''
      'select p.codigo as produto,'
      '       p.codigovisual,'
      '       p.descricao,'
      '       ga.dias,'
      '       current_date+ga.dias as agendamento,'
      '       ga.observacoes,'
      '       cast(null as text) as complemento,'
      '       false as marcar'
      'from gruposagendamentos ga'
      '     join caracteristicas c'
      '          join produtos p'
      '          on p.caracteristica = c.codigo'
      '     on ga.grupo = c.grupo'
      'where p.codigo in (%ListadeProdutos)'
      '  and coalesce(ga.dias,0) <> 0'
      
        '  and (select count(*) from produtosagendamentos pa where pa.pro' +
        'duto = p.codigo)=0'
      ''
      'union all'
      ''
      'select p.codigo as produto,'
      '       p.codigovisual,'
      '       p.descricao,'
      '       ca.dias,'
      '       current_date+ca.dias as agendamento,'
      '       ca.observacoes,'
      '       cast(null as text) as complemento,'
      '       false as marcar'
      'from classesagendamentos ca'
      '     join caracteristicas c'
      '          join produtos p'
      '          on p.caracteristica = c.codigo'
      '     on ca.classe = c.classe'
      'where p.codigo in (%ListadeProdutos)'
      '  and coalesce(ca.dias,0) <> 0'
      
        '  and (select count(*) from produtosagendamentos pa where pa.pro' +
        'duto = p.codigo)=0'
      ''
      'union all'
      ''
      'select p.codigo as produto,'
      '       p.codigovisual,'
      '       p.descricao,'
      '       ma.dias,'
      '       current_date+ma.dias as agendamento,'
      '       ma.observacoes,'
      '       cast(null as text) as complemento,'
      '       false as marcar'
      'from marcasagendamentos ma'
      '     join caracteristicas c'
      '          join produtos p'
      '          on p.caracteristica = c.codigo'
      '     on ma.marca = c.marca'
      'where p.codigo in (%ListadeProdutos)'
      '  and coalesce(ma.dias,0) <> 0'
      
        '  and (select count(*) from produtosagendamentos pa where pa.pro' +
        'duto = p.codigo)=0'
      ''
      ''
      ''
      ''
      '')
    RequestLive = True
    Left = 8
    Top = 8
    object qryAgendamentoProdutosproduto: TLargeintField
      FieldName = 'produto'
    end
    object qryAgendamentoProdutoscodigovisual: TStringField
      FieldName = 'codigovisual'
      Required = True
      Size = 30
    end
    object qryAgendamentoProdutosdescricao: TStringField
      DisplayWidth = 51
      FieldName = 'descricao'
      Required = True
      Size = 100
    end
    object qryAgendamentoProdutosdias: TIntegerField
      FieldName = 'dias'
      DisplayFormat = '0'
    end
    object qryAgendamentoProdutosobservacoes: TStringField
      FieldName = 'observacoes'
      Size = 200
    end
    object qryAgendamentoProdutosagendamento: TDateField
      Alignment = taCenter
      FieldName = 'agendamento'
      EditMask = '99/99/9999;1; '
    end
    object qryAgendamentoProdutosmarcar: TBooleanField
      FieldName = 'marcar'
    end
    object qryAgendamentoProdutoscomplemento: TMemoField
      FieldName = 'complemento'
      BlobType = ftMemo
    end
  end
end
