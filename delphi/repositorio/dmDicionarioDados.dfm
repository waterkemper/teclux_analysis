inherited dtmDicionarioDados: TdtmDicionarioDados
  OldCreateOrder = False
  Left = 350
  Top = 221
  Height = 394
  Width = 717
  object qryQuestionarios: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    BeforeOpen = qryQuestionariosBeforeOpen
    AfterOpen = qryQuestionariosAfterOpen
    BeforeEdit = qryQuestionariosBeforeEdit
    BeforeCancel = qryQuestionariosAfterScroll
    AfterScroll = qryQuestionariosAfterScroll
    OnNewRecord = qryQuestionariosNewRecord
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'Condicao'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'select q.*'
      'from questionarios q'
      'where q.codigo = :codigo'
      '   %Condicao')
    RequestLive = True
    Left = 32
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryQuestionarioscodigo: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'codigo'
    end
    object qryQuestionariosdescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Required = True
      Size = 255
    end
    object qryQuestionariosdata_inicio: TDateTimeField
      DisplayLabel = 'Data Inicial'
      FieldName = 'data_inicio'
      Required = True
    end
    object qryQuestionariosdata_fim: TDateTimeField
      DisplayLabel = 'Data Final'
      FieldName = 'data_fim'
      Required = True
    end
    object qryQuestionariosdisponivel: TBooleanField
      FieldName = 'disponivel'
    end
    object qryQuestionariosdata_inativo: TDateTimeField
      FieldName = 'data_inativo'
    end
    object qryQuestionariosdescricao_text: TStringField
      FieldName = 'descricao_text'
      Size = 1000
    end
    object qryQuestionariosrespondermaisdeumavez: TBooleanField
      FieldName = 'respondermaisdeumavez'
    end
    object qryQuestionariostipo: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'tipo'
      Required = True
      Size = 30
    end
  end
  object dsrQuestionarios: TtecDataSource
    DataSet = qryQuestionarios
    Left = 72
    Top = 32
  end
  object qryConsultaQuestionarios: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    BeforeOpen = qryConsultaQuestionariosBeforeOpen
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'Condicao'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'select q.*'
      'from questionarios q'
      'where true'
      '%Condicao'
      'order by q.codigo')
    RequestLive = False
    Left = 192
    Top = 24
    object qryConsultaQuestionarioscodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
    end
    object qryConsultaQuestionariosdescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 100
      FieldName = 'descricao'
      Size = 255
    end
  end
  object qryPerguntas: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterOpen = qryPerguntasAfterOpen
    AfterPost = qryPerguntasAfterPost
    AfterDelete = qryPerguntasAfterDelete
    AfterScroll = qryPerguntasAfterScroll
    OnNewRecord = qryPerguntasNewRecord
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select p.*'
      'from perguntas p'
      'where p.questionario = :questionario'
      'order by p.sequencia, p.codigo')
    RequestLive = True
    Left = 32
    Top = 120
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'questionario'
        ParamType = ptUnknown
      end>
    object qryPerguntascodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qryPerguntasquestionario: TIntegerField
      FieldName = 'questionario'
    end
    object qryPerguntasdescricao: TStringField
      DisplayLabel = 'Descric'#227'o'
      FieldName = 'descricao'
      Required = True
      Size = 1000
    end
    object qryPerguntastipo: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'tipo'
      Required = True
      Size = 50
    end
    object qryPerguntasjustificativa: TBooleanField
      FieldName = 'justificativa'
    end
    object qryPerguntassequencia: TIntegerField
      FieldName = 'sequencia'
    end
  end
  object dsrPerguntas: TtecDataSource
    DataSet = qryPerguntas
    OnDataChange = dsrPerguntasDataChange
    Left = 72
    Top = 136
  end
  object qryRespostas: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkFields = 'codigo=pergunta'
    LinkOptions = [loAlwaysResync]
    MasterSource = dsrPerguntas
    Constraints = <>
    AfterOpen = qryRespostasAfterOpen
    BeforeInsert = qryRespostasBeforeInsert
    AfterPost = qryRespostasAfterPost
    AfterDelete = qryRespostasAfterDelete
    OnNewRecord = qryRespostasNewRecord
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select r.*'
      'from respostas r,'
      '     perguntas p'
      ''
      'where p.questionario = :questionario'
      '  AND r.pergunta = p.codigo'
      'order by  r.sequencia, r.codigo')
    RequestLive = True
    Left = 240
    Top = 128
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'questionario'
        ParamType = ptUnknown
      end>
    object qryRespostascodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qryRespostaspergunta: TIntegerField
      FieldName = 'pergunta'
    end
    object qryRespostasresposta: TStringField
      DisplayLabel = 'Resposta'
      FieldName = 'resposta'
      Required = True
      Size = 255
    end
    object qryRespostassequencia: TIntegerField
      FieldName = 'sequencia'
    end
  end
  object dsrRespostas: TtecDataSource
    DataSet = qryRespostas
    Left = 280
    Top = 144
  end
  object qryPerguntasProximo: TtecQuery
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
      'select nextval('#39'perguntas_codigo_seq'#39') as codigo')
    RequestLive = False
    Left = 48
    Top = 192
  end
  object qryQuestionariosProximo: TtecQuery
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
      'select nextval('#39'questionarios_codigo_seq'#39') as codigo')
    RequestLive = False
    Left = 104
    Top = 48
  end
  object qryRespostasProximo: TtecQuery
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
      'select nextval('#39'respostas_codigo_seq'#39') as codigo')
    RequestLive = False
    Left = 240
    Top = 192
  end
  object qryProdutosConferencia: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftString
        Name = 'Condicao'
        ParamType = ptUnknown
        Value = 'and pc.quantidade > coalesce(pcf.lido,0)'
      end>
    Sql.Strings = (
      'select p.codigovisual as produtovisual,'
      '       p.descricao as descricaoproduto,'
      '       pcf.*'
      ''
      'from produtoscontratos pc'
      '     join produtos p'
      '     on pc.produto = p.codigo'
      ''
      '     left join produtosconferencia pcf'
      '     on pc.produto = pcf.produto'
      '     and pc.contrato = pcf.codigo'
      '     and pcf.tipo = :tipo'
      ''
      'where pc.contrato = :codigo'
      ''
      '  %Condicao  /* and pc.quantidade > coalesce(pcf.lido,0) */'
      ''
      'order by p.codigovisual'
      ''
      ''
      ''
      ''
      '/*'
      ''
      ':tipo'
      ':codigo'
      ''
      '*/')
    RequestLive = False
    Left = 520
    Top = 32
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'tipo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryProdutosConferenciaprodutovisual: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'produtovisual'
      Size = 30
    end
    object qryProdutosConferenciadescricaoproduto: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricaoproduto'
      Size = 100
    end
    object qryProdutosConferenciatipo: TStringField
      FieldName = 'tipo'
      Size = 3
    end
    object qryProdutosConferenciacodigo: TStringField
      FieldName = 'codigo'
    end
    object qryProdutosConferenciaproduto: TLargeintField
      FieldName = 'produto'
    end
    object qryProdutosConferencialido: TFloatField
      FieldName = 'lido'
    end
    object qryProdutosConferenciadigitado: TBooleanField
      FieldName = 'digitado'
    end
    object qryProdutosConferenciadatahora_inclusao: TDateTimeField
      FieldName = 'datahora_inclusao'
    end
    object qryProdutosConferenciadatahora_alteracao: TDateTimeField
      FieldName = 'datahora_alteracao'
    end
  end
  object dsrProdutosConferencia: TtecDataSource
    DataSet = qryProdutosConferencia
    Left = 568
    Top = 48
  end
  object qryProdutosConferencia_ProdutosContratos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Condicao'
        ParamType = ptUnknown
        Value = 'and pc.quantidade > coalesce(pcf.lido,0)'
      end>
    Sql.Strings = (
      'select p.codigovisual as produtovisual,'
      '       p.descricao as descricaoproduto,'
      '       pcf.*'
      ''
      'from produtoscontratos pc'
      '     join produtos p'
      '     on pc.produto = p.codigo'
      ''
      '     left join produtosconferencia pcf'
      '     on pc.produto = pcf.produto'
      '     and pc.contrato = pcf.codigo'
      '     and pcf.tipo = :tipo'
      ''
      'where pc.contrato = %codigo'
      ''
      '  %Condicao  /* and pc.quantidade > coalesce(pcf.lido,0) */'
      ''
      'order by p.codigovisual'
      ''
      ''
      ''
      ''
      '/*'
      ''
      ':tipo'
      '%codigo'
      '%Condicao'
      ''
      ''
      '*/')
    RequestLive = False
    Left = 544
    Top = 112
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'tipo'
        ParamType = ptUnknown
      end>
  end
  object qryProdutosConferencia_PedidosFiliais: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Condicao'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'select p.codigovisual as produtovisual,'
      '       p.descricao as descricaoproduto,'
      '       pcf.*'
      '       '
      'from pedidosfiliais pf'
      '     join produtos p'
      '     on pf.produto = p.codigo'
      '     '
      '     left join produtosconferencia pcf'
      '     on pf.produto = pcf.produto'
      '     and pf.lotetransferencia = cast(pcf.codigo as integer)'
      '     and pf.codigo=pcf.numero'
      '     and pcf.tipo = :tipo'
      ''
      ''
      'where pf.codigo in (%codigo)'
      ''
      ''
      '%Condicao'
      ''
      '/*'
      ''
      'and ((coalesce(pf.qtderecebida,0) <> coalesce(pcf.lido,0)) or'
      '     coalesce(pf.qtderecebida,0)=0)'
      ''
      '*/'
      ''
      'order by p.codigovisual'
      ''
      ''
      ''
      '/*'
      ''
      ':tipo'
      '%codigo'
      ''
      '*/')
    RequestLive = False
    Left = 544
    Top = 208
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'tipo'
        ParamType = ptUnknown
      end>
  end
  object qryProdutosConferencia_ProdutosOrcamentos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Condicao'
        ParamType = ptUnknown
        Value = 'and pc.quantidade > coalesce(pcf.lido,0)'
      end>
    Sql.Strings = (
      'select p.codigovisual as produtovisual,'
      '       p.descricao as descricaoproduto,'
      '       pcf.*'
      ''
      'from produtosorcamentos po'
      '     join produtos p'
      '     on po.produto = p.codigo'
      ''
      '     left join produtosconferencia pcf'
      '     on po.produto = pcf.produto'
      '     and cast(po.orcamento as varchar(20)) = pcf.codigo'
      '     and pcf.tipo = :tipo'
      ''
      'where po.orcamento = %codigo'
      ''
      '  %Condicao  /* and pc.quantidade > coalesce(pcf.lido,0) */'
      ''
      'order by p.codigovisual'
      ''
      ''
      ''
      ''
      '/*'
      ''
      ':tipo'
      '%codigo'
      ''
      '*/')
    RequestLive = False
    Left = 544
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'tipo'
        ParamType = ptUnknown
      end>
  end
end
