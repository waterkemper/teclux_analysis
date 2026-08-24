inherited dtmManutencaoObservacoesVenda: TdtmManutencaoObservacoesVenda
  OldCreateOrder = False
  Left = 529
  Top = 211
  Height = 474
  Width = 893
  object qryProdutos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    BeforePost = qryProdutosBeforePost
    AfterPost = qryProdutosAfterPost
    AfterDelete = qryProdutosAfterDelete
    AfterScroll = qryProdutosAfterScroll
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'ListaCondicaoProduto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ListaCondicaoGrupo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ListaCondicaoClasse'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ListaCondicaoMarca'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ListaCondicaoPromocoes'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SelecionarSomenteGruposComObservacoesVenda'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SelecionarSomenteClassesComObservacoesVenda'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SelecionarSomenteMarcasComObservacoesVenda'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SelecionarSomenteProdutosComObservacoesVenda'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      ';'
      'select * from'
      '('
      '('
      'select c.codigo,'
      '       c.codigovisual,'
      '       c.descricao,'
      
        '       cast(g.observacoesvenda as varchar(2000)) as observacoesv' +
        'enda,'
      '       c.grupo,'
      '       c.classe,'
      '       c.marca,'
      '       cast('#39'GRUPO'#39' as "varchar"(10)) as origem,'
      '       false as incluido,'
      '       false as alterado'
      ''
      'from caracteristicas c '
      '     join grupos g on c.grupo = g.codigo'
      '     join classes cl on c.classe = cl.codigo'
      '     join marcas m on c.marca = m.codigo'
      ''
      'where true'
      ''
      ''
      '  %ListaCondicaoProduto'
      '  %ListaCondicaoGrupo'
      '  %ListaCondicaoClasse'
      '  %ListaCondicaoMarca'
      '  %ListaCondicaoPromocoes'
      '  '
      '  %SelecionarSomenteGruposComObservacoesVenda'
      '  '
      ''
      'order by c.codigovisual'
      ')'
      ''
      'union all'
      ''
      '('
      'select c.codigo,'
      '       c.codigovisual,'
      '       c.descricao,'
      
        '       cast(cl.observacoesvenda as varchar(2000)) as observacoes' +
        'venda,'
      '       c.grupo,'
      '       c.classe,'
      '       c.marca,'
      '       cast('#39'CLASSE'#39' as "varchar"(10)) as origem,'
      '       false as incluido,'
      '       false as alterado'
      ''
      'from caracteristicas c '
      '     join grupos g on c.grupo = g.codigo    '
      '     join classes cl on c.classe = cl.codigo'
      '     join marcas m on c.marca = m.codigo'
      ''
      'where true'
      ''
      ''
      '  %ListaCondicaoProduto'
      '  %ListaCondicaoGrupo'
      '  %ListaCondicaoClasse'
      '  %ListaCondicaoMarca'
      '  %ListaCondicaoPromocoes'
      '  '
      '  %SelecionarSomenteClassesComObservacoesVenda'
      ''
      'order by c.codigovisual'
      ')'
      ''
      ''
      'union all'
      ''
      '('
      'select c.codigo,'
      '       c.codigovisual,'
      '       c.descricao,'
      
        '       cast(m.observacoesvenda as varchar(2000)) as observacoesv' +
        'enda,'
      '       c.grupo,'
      '       c.classe,'
      '       c.marca,'
      '       cast('#39'MARCA'#39' as "varchar"(10)) as origem,'
      '       false as incluido,'
      '       false as alterado'
      ''
      'from caracteristicas c '
      '     join grupos g on c.grupo = g.codigo    '
      '     join classes cl on c.classe = cl.codigo'
      '     join marcas m on c.marca = m.codigo'
      ''
      'where true'
      ''
      ''
      '  %ListaCondicaoProduto'
      '  %ListaCondicaoGrupo'
      '  %ListaCondicaoClasse'
      '  %ListaCondicaoMarca'
      '  %ListaCondicaoPromocoes'
      '  '
      '  %SelecionarSomenteMarcasComObservacoesVenda'
      ''
      'order by c.codigovisual'
      ')'
      ''
      'union ALL'
      ''
      '('
      'select c.codigo,'
      '       c.codigovisual,'
      '       c.descricao,'
      
        '       cast(c.observacoesvenda as varchar(2000)) as observacoesv' +
        'enda,'
      '       c.grupo,'
      '       c.classe,'
      '       c.marca,'
      '       cast('#39'PRODUTOS'#39' as "varchar"(10)) as origem,'
      '       false as incluido,'
      '       false as alterado'
      ''
      'from caracteristicas c '
      '     join grupos g on c.grupo = g.codigo    '
      '     join classes cl on c.classe = cl.codigo'
      '     join marcas m on c.marca = m.codigo'
      ''
      'where true'
      ''
      ''
      '  %ListaCondicaoProduto'
      '  %ListaCondicaoGrupo'
      '  %ListaCondicaoClasse'
      '  %ListaCondicaoMarca'
      '  %ListaCondicaoPromocoes'
      '  '
      '  %SelecionarSomenteProdutosComObservacoesVenda'
      ''
      'order by c.codigovisual'
      ')'
      ') as selecao'
      'order by codigovisual')
    RequestLive = True
    Left = 72
    Top = 24
    object qryProdutoscodigo: TLargeintField
      FieldName = 'codigo'
    end
    object qryProdutoscaracodigovisual: TStringField
      FieldName = 'codigovisual'
      Size = 30
    end
    object qryProdutosdescricao: TStringField
      FieldName = 'descricao'
      Size = 100
    end
    object qryProdutosgrupo: TStringField
      FieldName = 'grupo'
      Size = 4
    end
    object qryProdutosclasse: TStringField
      FieldName = 'classe'
      Size = 2
    end
    object qryProdutosmarca: TIntegerField
      FieldName = 'marca'
    end
    object qryProdutosorigem: TStringField
      FieldName = 'origem'
      Size = 10
    end
    object qryProdutosobservacoesvenda: TStringField
      FieldName = 'observacoesvenda'
      Size = 2000
    end
    object qryProdutosincluido: TBooleanField
      FieldName = 'incluido'
    end
    object qryProdutosalterado: TBooleanField
      FieldName = 'alterado'
    end
  end
  object dsrProdutos: TtecDataSource
    DataSet = qryProdutos
    Left = 120
    Top = 32
  end
  object qryGrupos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterInsert = qryGruposAfterInsert
    BeforePost = qryGruposBeforePost
    AfterPost = qryGruposAfterPost
    AfterDelete = qryGruposAfterDelete
    AfterScroll = qryGruposAfterScroll
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'ListaCondicaoGrupo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SelecionarSomenteGruposComObservacoesVenda'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'select g.codigo,'
      '       g.descricao,'
      '       g.observacoesvenda'
      ''
      'from  grupos g'
      ''
      'where true'
      ''
      '  %ListaCondicaoGrupo'
      '  %SelecionarSomenteGruposComObservacoesVenda'
      ''
      'ORDER by g.codigo  '
      '')
    RequestLive = True
    Left = 72
    Top = 80
    object qryGruposcodigo: TStringField
      FieldName = 'codigo'
      Size = 4
    end
    object qryGruposdescricao: TStringField
      FieldName = 'descricao'
      Size = 30
    end
    object qryGruposobservacoesvenda: TStringField
      FieldName = 'observacoesvenda'
      Size = 2000
    end
  end
  object dsrGrupos: TtecDataSource
    DataSet = qryGrupos
    Left = 144
    Top = 90
  end
  object qryClasses: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterInsert = qryClassesAfterInsert
    BeforePost = qryClassesBeforePost
    AfterPost = qryClassesAfterPost
    AfterDelete = qryClassesAfterDelete
    AfterScroll = qryClassesAfterScroll
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'ListaCondicaoGrupo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SelecionarSomenteClassesComObservacoesVenda'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'select cl.codigo,'
      '       cl.descricao,'
      '       cl.observacoesvenda'
      ''
      'from classes cl'
      ''
      'where true'
      ''
      '  %ListaCondicaoGrupo'
      '  %SelecionarSomenteClassesComObservacoesVenda'
      ''
      'ORDER by cl.codigo'
      '')
    RequestLive = True
    Left = 72
    Top = 136
    object qryClassescodigo: TStringField
      FieldName = 'codigo'
      Size = 2
    end
    object qryClassesdescricao: TStringField
      FieldName = 'descricao'
      Size = 30
    end
    object qryClassesobservacoesvenda: TStringField
      FieldName = 'observacoesvenda'
      Size = 2000
    end
  end
  object dsrClasses: TtecDataSource
    DataSet = qryClasses
    Left = 112
    Top = 148
  end
  object qryMarcas: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterInsert = qryMarcasAfterInsert
    BeforePost = qryMarcasBeforePost
    AfterPost = qryMarcasAfterPost
    AfterDelete = qryMarcasAfterDelete
    AfterScroll = qryMarcasAfterScroll
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'ListaCondicaomarca'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SelecionarSomenteMarcasComObservacoesVenda'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'select m.codigo,'
      '       m.descricao,'
      '       m.observacoesvenda'
      ''
      'from marcas m'
      ''
      'where true'
      ''
      '  %ListaCondicaoMarca'
      ''
      '  %SelecionarSomenteMarcasComObservacoesVenda'
      ''
      'ORDER by m.codigo'
      '')
    RequestLive = True
    Left = 72
    Top = 192
    object qryMarcascodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qryMarcasdescricao: TStringField
      FieldName = 'descricao'
      Size = 15
    end
    object qryMarcasobservacoesvenda: TStringField
      FieldName = 'observacoesvenda'
      Size = 2000
    end
  end
  object dsrMarcas: TtecDataSource
    DataSet = qryMarcas
    Left = 112
    Top = 208
  end
  object qryProdutosAux: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doHourGlass, doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select c.codigo,'
      '       c.codigovisual,'
      '       c.descricao,'
      
        '       cast(g.observacoesvenda as varchar(2000)) as observacoesv' +
        'enda,'
      '       c.grupo,'
      '       c.classe,'
      '       c.marca,'
      '       cast('#39'GRUPO'#39' as "varchar"(10)) as origem,'
      '       false as incluido,'
      '       false as alterado'
      ''
      'from caracteristicas c'
      '     join grupos g on c.grupo = g.codigo'
      '     join classes cl on c.classe = cl.codigo'
      '     join marcas m on c.marca = m.codigo'
      ''
      'where false'
      '')
    RequestLive = True
    Left = 240
    Top = 24
    object qryProdutosAuxcodigo: TLargeintField
      FieldName = 'codigo'
    end
    object qryProdutosAuxcaracodigovisual: TStringField
      FieldName = 'codigovisual'
      Size = 30
    end
    object qryProdutosAuxdescricao: TStringField
      FieldName = 'descricao'
      Size = 100
    end
    object qryProdutosAuxobservacoesvenda: TStringField
      FieldName = 'observacoesvenda'
      Size = 2000
    end
    object qryProdutosAuxgrupo: TStringField
      FieldName = 'grupo'
      Size = 4
    end
    object qryProdutosAuxclasse: TStringField
      FieldName = 'classe'
      Size = 2
    end
    object qryProdutosAuxmarca: TIntegerField
      FieldName = 'marca'
    end
    object qryProdutosAuxorigem: TStringField
      FieldName = 'origem'
      Size = 10
    end
    object qryProdutosAuxincluido: TBooleanField
      FieldName = 'incluido'
    end
    object qryProdutosAuxalterado: TBooleanField
      FieldName = 'alterado'
    end
  end
  object qryGruposAux: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doHourGlass, doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select g.codigo,'
      '       g.descricao,'
      '       g.observacoesvenda'
      ''
      'from  grupos g'
      ''
      'where false'
      '')
    RequestLive = True
    Left = 240
    Top = 80
    object qryGruposAuxcodigo: TStringField
      FieldName = 'codigo'
      Size = 4
    end
    object qryGruposAuxdescricao: TStringField
      FieldName = 'descricao'
      Size = 30
    end
    object qryGruposAuxobservacoesvenda: TStringField
      FieldName = 'observacoesvenda'
      Size = 2000
    end
  end
  object qryClassesAux: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doHourGlass, doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select cl.codigo,'
      '       cl.descricao,'
      '       cl.observacoesvenda'
      ''
      'from classes cl'
      ''
      'where false'
      ''
      '')
    RequestLive = True
    Left = 232
    Top = 144
    object qryClassesAuxcodigo: TStringField
      FieldName = 'codigo'
      Size = 2
    end
    object qryClassesAuxdescricao: TStringField
      FieldName = 'descricao'
      Size = 30
    end
    object qryClassesAuxobservacoesvenda: TStringField
      FieldName = 'observacoesvenda'
      Size = 2000
    end
  end
  object qryMarcasAux: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doHourGlass, doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select m.codigo,'
      '       m.descricao,'
      '       m.observacoesvenda'
      ''
      'from marcas m'
      ''
      'where false')
    RequestLive = True
    Left = 232
    Top = 208
    object qryMarcasAuxcodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qryMarcasAuxdescricao: TStringField
      FieldName = 'descricao'
      Size = 15
    end
    object qryMarcasAuxobservacoesvenda: TStringField
      FieldName = 'observacoesvenda'
      Size = 2000
    end
  end
  object qryGravarProdutos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    RequestLive = True
    Left = 408
    Top = 136
  end
  object qryProdutosObservacoesGerais: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doHourGlass, doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    BeforePost = qryProdutosObservacoesGeraisBeforePost
    AfterPost = qryProdutosObservacoesGeraisAfterPost
    AfterDelete = qryProdutosObservacoesGeraisAfterDelete
    AfterScroll = qryProdutosObservacoesGeraisAfterScroll
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'ListaCondicaoProduto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ListaCondicaoGrupo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ListaCondicaoClasse'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ListaCondicaoMarca'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ListaCondicaoPromocoes'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SelecionarSomenteProdutosComObservacoesGerais'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'select c.codigo,'
      '       c.codigovisual,'
      '       c.descricao,'
      '       c.observacao,'
      '       c.grupo,'
      '       c.classe,'
      '       c.marca,'
      '       false as incluido,'
      '       false as alterado'
      ''
      'from caracteristicas c'
      '     join grupos g on c.grupo = g.codigo'
      '     join classes cl on c.classe = cl.codigo'
      '     join marcas m on c.marca = m.codigo'
      ''
      'where true'
      ''
      ''
      '  %ListaCondicaoProduto'
      '  %ListaCondicaoGrupo'
      '  %ListaCondicaoClasse'
      '  %ListaCondicaoMarca'
      '  %ListaCondicaoPromocoes'
      ''
      '  %SelecionarSomenteProdutosComObservacoesGerais'
      ''
      'order by c.codigovisual'
      '')
    RequestLive = True
    Left = 368
    Top = 32
    object qryProdutosObservacoesGeraiscodigo: TLargeintField
      FieldName = 'codigo'
      Required = True
    end
    object qryProdutosObservacoesGeraiscodigovisual: TStringField
      FieldName = 'codigovisual'
      Required = True
      Size = 30
    end
    object qryProdutosObservacoesGeraisdescricao: TStringField
      FieldName = 'descricao'
      Required = True
      Size = 100
    end
    object qryProdutosObservacoesGeraisobservacao: TStringField
      FieldName = 'observacao'
      Size = 5000
    end
    object qryProdutosObservacoesGeraisgrupo: TStringField
      FieldName = 'grupo'
      Required = True
      Size = 4
    end
    object qryProdutosObservacoesGeraisclasse: TStringField
      FieldName = 'classe'
      Required = True
      Size = 2
    end
    object qryProdutosObservacoesGeraismarca: TIntegerField
      FieldName = 'marca'
    end
    object qryProdutosObservacoesGeraisincluido: TBooleanField
      FieldName = 'incluido'
    end
    object qryProdutosObservacoesGeraisalterado: TBooleanField
      FieldName = 'alterado'
    end
  end
  object dsrProdutosObservacoesGerais: TtecDataSource
    DataSet = qryProdutosObservacoesGerais
    Left = 416
    Top = 40
  end
end
