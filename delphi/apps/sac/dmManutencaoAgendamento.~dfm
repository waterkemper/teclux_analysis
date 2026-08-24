inherited dtmManutencaoAgendamento: TdtmManutencaoAgendamento
  OldCreateOrder = False
  Left = 614
  Top = 174
  Height = 474
  Width = 745
  object qryProdutosAgendamentos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    BeforePost = qryProdutosAgendamentosBeforePost
    AfterPost = qryProdutosAgendamentosAfterPost
    AfterDelete = qryProdutosAgendamentosAfterDelete
    AfterScroll = qryProdutosAgendamentosAfterScroll
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'SelecionarSomenteProdutosComAgendamento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ListaCondicaoItemdeproduto'
        ParamType = ptUnknown
      end
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
      end>
    Sql.Strings = (
      '('
      'select p.codigo as produto,'
      '       p.codigovisual,'
      '       p.descricao,'
      '       ga.codigo as codigoagendamento,'
      '       ga.dias,'
      '       ga.observacoes,'
      '       c.grupo,'
      '       c.classe,'
      '       c.marca,'
      '       cast('#39'GRUPO'#39' as "varchar"(10)) as origem,'
      '       false as incluido,'
      '       false as alterado'
      ''
      'from produtos p'
      '     join caracteristicas c on p.caracteristica = c.codigo'
      '          join grupos g on c.grupo = g.codigo'
      ''
      '               %SelecionarSomenteProdutosComAgendamento'
      ''
      '               join gruposagendamentos ga on g.codigo = ga.grupo'
      '          join classes cl on c.classe = cl.codigo'
      '          join marcas m on c.marca = m.codigo'
      ''
      'where true'
      ''
      ''
      '  %ListaCondicaoItemdeproduto'
      '  %ListaCondicaoProduto'
      '  %ListaCondicaoGrupo'
      '  %ListaCondicaoClasse'
      '  %ListaCondicaoMarca'
      '  %ListaCondicaoPromocoes'
      ''
      ''
      ''
      'order by p.codigovisual'
      ')'
      ''
      'union all'
      ''
      '('
      'select p.codigo as produto,'
      '       p.codigovisual,'
      '       p.descricao,'
      '       ca.codigo as codigoagendamento,'
      '       ca.dias,'
      '       ca.observacoes,'
      '       c.grupo,'
      '       c.classe,'
      '       c.marca,'
      '       cast('#39'CLASSE'#39' as "varchar"(10)) as origem,'
      '       false as incluido,'
      '       false as alterado'
      ''
      'from produtos p'
      '     join caracteristicas c on p.caracteristica = c.codigo'
      '          join grupos g on c.grupo = g.codigo'
      ''
      '          join classes cl on c.classe = cl.codigo'
      ''
      '               %SelecionarSomenteProdutosComAgendamento'
      ''
      
        '               join classesagendamentos ca on cl.codigo = ca.cla' +
        'sse'
      '          join marcas m on c.marca = m.codigo'
      ''
      'where true'
      ''
      ''
      '  %ListaCondicaoItemdeproduto'
      '  %ListaCondicaoProduto'
      '  %ListaCondicaoGrupo'
      '  %ListaCondicaoClasse'
      '  %ListaCondicaoMarca'
      '  %ListaCondicaoPromocoes'
      ''
      ''
      ''
      'order by p.codigovisual'
      ')'
      ''
      'union all'
      ''
      '('
      'select p.codigo as produto,'
      '       p.codigovisual,'
      '       p.descricao,'
      '       ma.codigo as codigoagendamento,'
      '       ma.dias,'
      '       ma.observacoes,'
      '       c.grupo,'
      '       c.classe,'
      '       c.marca,'
      '       cast('#39'MARCA'#39' as "varchar"(10)) as origem,'
      '       false as incluido,'
      '       false as alterado'
      ''
      'from produtos p'
      '     join caracteristicas c on p.caracteristica = c.codigo'
      '          join grupos g on c.grupo = g.codigo'
      '          join classes cl on c.classe = cl.codigo        '
      '          join marcas m on c.marca = m.codigo'
      ''
      '              %SelecionarSomenteProdutosComAgendamento'
      ''
      '               join marcasagendamentos ma on m.codigo = ma.marca'
      ''
      ''
      'where true'
      ''
      ''
      '  %ListaCondicaoItemdeproduto'
      '  %ListaCondicaoProduto'
      '  %ListaCondicaoGrupo'
      '  %ListaCondicaoClasse'
      '  %ListaCondicaoMarca'
      '  %ListaCondicaoPromocoes'
      ''
      ''
      ''
      'order by p.codigovisual'
      ')'
      ''
      'union ALL'
      ''
      '('
      'select p.codigo as produto,'
      '       p.codigovisual,'
      '       p.descricao,'
      '       pa.codigo as codigoagendamento,'
      '       pa.dias,'
      '       pa.observacoes,'
      '       c.grupo,'
      '       c.classe,'
      '       c.marca,'
      '       cast('#39'PRODUTOS'#39' as "varchar"(10)) as origem,'
      '       false as incluido,'
      '       false as alterado'
      ''
      'from produtos p'
      '     join caracteristicas c on p.caracteristica = c.codigo'
      '          join grupos g on c.grupo = g.codigo'
      '          join classes cl on c.classe = cl.codigo'
      '          join marcas m on c.marca = m.codigo'
      ''
      '     %SelecionarSomenteProdutosComAgendamento'
      ''
      '     join produtosagendamentos pa on p.codigo = pa.produto'
      ''
      'where true'
      ''
      ''
      '  %ListaCondicaoItemdeproduto'
      '  %ListaCondicaoProduto'
      '  %ListaCondicaoGrupo'
      '  %ListaCondicaoClasse'
      '  %ListaCondicaoMarca'
      '  %ListaCondicaoPromocoes'
      ''
      ''
      'order by p.codigovisual'
      ')'
      'order by codigovisual, dias')
    RequestLive = True
    Left = 160
    Top = 32
    object qryProdutosAgendamentosproduto: TLargeintField
      FieldName = 'produto'
    end
    object qryProdutosAgendamentoscodigovisual: TStringField
      FieldName = 'codigovisual'
      Required = True
      Size = 30
    end
    object qryProdutosAgendamentosdescricao: TStringField
      FieldName = 'descricao'
      ReadOnly = True
      Size = 100
    end
    object qryProdutosAgendamentoscodigoagendamento: TIntegerField
      FieldName = 'codigoagendamento'
      ReadOnly = True
    end
    object qryProdutosAgendamentosdias: TIntegerField
      FieldName = 'dias'
      Required = True
    end
    object qryProdutosAgendamentosobservacoes: TStringField
      FieldName = 'observacoes'
      Required = True
      Size = 200
    end
    object qryProdutosAgendamentosorigem: TStringField
      FieldName = 'origem'
      ReadOnly = True
      Size = 10
    end
    object qryProdutosAgendamentosgrupo: TStringField
      FieldName = 'grupo'
      ReadOnly = True
      Size = 4
    end
    object qryProdutosAgendamentosclasse: TStringField
      FieldName = 'classe'
      ReadOnly = True
      Size = 2
    end
    object qryProdutosAgendamentosmarca: TIntegerField
      FieldName = 'marca'
      ReadOnly = True
    end
    object qryProdutosAgendamentosincluido: TBooleanField
      FieldName = 'incluido'
    end
    object qryProdutosAgendamentosalterado: TBooleanField
      FieldName = 'alterado'
    end
  end
  object dsrProdutosAgendamentos: TtecDataSource
    DataSet = qryProdutosAgendamentos
    Left = 208
    Top = 40
  end
  object qryGruposAgendamentos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doHourGlass, doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterInsert = qryGruposAgendamentosAfterInsert
    AfterPost = qryGruposAgendamentosAfterPost
    AfterDelete = qryGruposAgendamentosAfterDelete
    AfterScroll = qryGruposAgendamentosAfterScroll
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'SelecionarSomenteGruposComAgendamento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ListaCondicaoGrupo'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'select ga.grupo,'
      '       g.descricao,'
      '       ga.codigo as codigoagendamento,'
      '       ga.codigo,'
      '       ga.dias,'
      '       ga.observacoes'
      ''
      'from gruposagendamentos ga'
      ''
      '               %SelecionarSomenteGruposComAgendamento'
      ''
      '               join grupos g on g.codigo = ga.grupo'
      ''
      'where true'
      ''
      '  %ListaCondicaoGrupo'
      ''
      'ORDER by g.codigo, ga.dias  '
      '')
    RequestLive = True
    Left = 168
    Top = 120
    object qryGruposAgendamentosgrupo: TStringField
      FieldName = 'grupo'
      Required = True
      Size = 4
    end
    object qryGruposAgendamentosdescricao: TStringField
      FieldName = 'descricao'
      ReadOnly = True
      Required = True
      Size = 30
    end
    object qryGruposAgendamentoscodigo: TIntegerField
      FieldName = 'codigo'
      ReadOnly = True
    end
    object qryGruposAgendamentosdias: TIntegerField
      FieldName = 'dias'
      Required = True
    end
    object qryGruposAgendamentosobservacoes: TStringField
      FieldName = 'observacoes'
      Required = True
      Size = 200
    end
    object qryGruposAgendamentoscodigoagendamento: TIntegerField
      FieldName = 'codigoagendamento'
    end
  end
  object dsrGruposAgendamentos: TtecDataSource
    DataSet = qryGruposAgendamentos
    Left = 216
    Top = 136
  end
  object spcProximoGruposAgendamentos: TtecQuery
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
      
        'SELECT CAST(NEXTVAL('#39'gruposagendamentos_codigo_seq'#39') AS integer)' +
        ' as codigo')
    RequestLive = False
    Left = 344
    Top = 128
    object spcProximoGruposAgendamentoscodigo: TIntegerField
      FieldName = 'codigo'
    end
  end
  object qryProdutosAgendamentosAux: TtecQuery
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
    Sql.Strings = (
      'select p.codigo as produto,'
      '       p.codigovisual,'
      '       p.descricao,'
      '       ga.codigo as codigoagendamento,'
      '       ga.dias,'
      '       ga.observacoes,'
      '       c.grupo,'
      '       c.classe,'
      '       c.marca,'
      '       cast('#39'GRUPO'#39' as "varchar"(10)) as origem,'
      '       false as incluido,'
      '       false as alterado       '
      ''
      'from produtos p'
      '     join caracteristicas c on p.caracteristica = c.codigo'
      '          join grupos g on c.grupo = g.codigo'
      '               join gruposagendamentos ga on g.codigo = ga.grupo'
      '          join classes cl on c.classe = cl.codigo'
      '          join marcas m on c.marca = m.codigo'
      ''
      'where false'
      ''
      'order by p.codigovisual, ga.dias')
    RequestLive = True
    Left = 360
    Top = 32
    object qryProdutosAgendamentosAuxproduto: TLargeintField
      FieldName = 'produto'
    end
    object qryProdutosAgendamentosAuxcodigovisual: TStringField
      FieldName = 'codigovisual'
      Size = 30
    end
    object qryProdutosAgendamentosAuxdescricao: TStringField
      FieldName = 'descricao'
      Size = 100
    end
    object qryProdutosAgendamentosAuxcodigoagendamento: TIntegerField
      FieldName = 'codigoagendamento'
    end
    object qryProdutosAgendamentosAuxdias: TIntegerField
      FieldName = 'dias'
    end
    object qryProdutosAgendamentosAuxobservacoes: TStringField
      FieldName = 'observacoes'
      Size = 200
    end
    object qryProdutosAgendamentosAuxorigem: TStringField
      FieldName = 'origem'
      Size = 10
    end
    object qryProdutosAgendamentosAuxgrupo: TStringField
      FieldName = 'grupo'
      Size = 4
    end
    object qryProdutosAgendamentosAuxclasse: TStringField
      FieldName = 'classe'
      Size = 2
    end
    object qryProdutosAgendamentosAuxmarca: TIntegerField
      FieldName = 'marca'
    end
    object qryProdutosAgendamentosAuxincluido: TBooleanField
      FieldName = 'incluido'
    end
    object qryProdutosAgendamentosAuxalterado: TBooleanField
      FieldName = 'alterado'
    end
  end
  object qryGravarProdutosAgendamentos: TtecQuery
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
    Left = 552
    Top = 256
  end
  object qryClassesAgendamentos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doHourGlass, doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterInsert = qryClassesAgendamentosAfterInsert
    AfterPost = qryClassesAgendamentosAfterPost
    AfterDelete = qryClassesAgendamentosAfterDelete
    AfterScroll = qryClassesAgendamentosAfterScroll
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'SelecionarSomenteclassesComAgendamento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ListaCondicaoclasse'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'select ca.classe,'
      '       cl.descricao,'
      '       ca.codigo as codigoagendamento,'
      '       ca.codigo,'
      '       ca.dias,'
      '       ca.observacoes'
      ''
      'from classesagendamentos ca'
      ''
      '               %SelecionarSomenteClassesComAgendamento'
      ''
      '               join classes cl on cl.codigo = ca.classe'
      ''
      'where true'
      ''
      '  %ListaCondicaoClasse'
      ''
      'ORDER by cl.codigo, ca.dias  '
      '')
    RequestLive = True
    Left = 176
    Top = 208
    object qryClassesAgendamentosclasse: TStringField
      FieldName = 'classe'
      Required = True
      Size = 2
    end
    object qryClassesAgendamentosdescricao: TStringField
      FieldName = 'descricao'
      ReadOnly = True
      Required = True
      Size = 30
    end
    object qryClassesAgendamentoscodigo: TIntegerField
      FieldName = 'codigo'
      ReadOnly = True
    end
    object qryClassesAgendamentosdias: TIntegerField
      FieldName = 'dias'
      Required = True
    end
    object qryClassesAgendamentosobservacoes: TStringField
      FieldName = 'observacoes'
      Required = True
      Size = 200
    end
    object qryClassesAgendamentoscodigoagendamento: TIntegerField
      FieldName = 'codigoagendamento'
    end
  end
  object dsrClassesAgendamentos: TtecDataSource
    DataSet = qryClassesAgendamentos
    Left = 216
    Top = 224
  end
  object spcProximoClassesAgendamentos: TtecQuery
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
      
        'SELECT CAST(NEXTVAL('#39'classesagendamentos_codigo_seq'#39') AS integer' +
        ') as codigo')
    RequestLive = False
    Left = 344
    Top = 216
    object spcProximoClassesAgendamentoscodigo: TIntegerField
      FieldName = 'codigo'
    end
  end
  object qryMarcasAgendamentos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doHourGlass, doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterInsert = qryMarcasAgendamentosAfterInsert
    AfterPost = qryMarcasAgendamentosAfterPost
    AfterDelete = qryMarcasAgendamentosAfterDelete
    AfterScroll = qryMarcasAgendamentosAfterScroll
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'SelecionarSomentemarcasComAgendamento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ListaCondicaomarca'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'select ma.marca,'
      '       m.descricao,'
      '       ma.codigo as codigoagendamento,'
      '       ma.codigo,'
      '       ma.dias,'
      '       ma.observacoes'
      ''
      'from marcasagendamentos ma'
      ''
      '               %SelecionarSomenteMarcasComAgendamento'
      ''
      '               join marcas m on m.codigo = ma.marca'
      ''
      'where true'
      ''
      '  %ListaCondicaoMarca'
      ''
      'ORDER by m.codigo, ma.dias  '
      '')
    RequestLive = True
    Left = 168
    Top = 296
    object qryMarcasAgendamentosmarca: TIntegerField
      FieldName = 'marca'
      Required = True
    end
    object qryMarcasAgendamentosdescricao: TStringField
      FieldName = 'descricao'
      Required = True
      Size = 15
    end
    object qryMarcasAgendamentoscodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qryMarcasAgendamentosdias: TIntegerField
      FieldName = 'dias'
      Required = True
    end
    object qryMarcasAgendamentosobservacoes: TStringField
      FieldName = 'observacoes'
      Required = True
      Size = 200
    end
    object qryMarcasAgendamentoscodigoagendamento: TIntegerField
      FieldName = 'codigoagendamento'
    end
  end
  object dsrMarcasAgendamentos: TtecDataSource
    DataSet = qryMarcasAgendamentos
    Left = 216
    Top = 312
  end
  object spcProximoMarcasAgendamentos: TtecQuery
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
      
        'SELECT CAST(NEXTVAL('#39'marcasagendamentos_codigo_seq'#39') AS integer)' +
        ' as codigo')
    RequestLive = False
    Left = 344
    Top = 304
    object spcProximoMarcasAgendamentoscodigo: TIntegerField
      FieldName = 'codigo'
    end
  end
end
