inherited dtmCadastroTransportadores: TdtmCadastroTransportadores
  Left = 232
  Top = 177
  Height = 202
  Width = 465
  object qryTransportadores: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    OnDeleteError = PostError
    OnEditError = PostError
    OnPostError = PostError
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'SELECT t.*,'
      
        '       (SELECT cd.nome FROM cidades cd WHERE (cd.estado = t.esta' +
        'do)'
      
        '                                       AND   (cd.codigo = t.cida' +
        'de)) AS nomecidade,'
      
        '       (SELECT ba.nome FROM bairros ba WHERE (ba.estado = t.esta' +
        'do)'
      
        '                                       AND   (ba.cidade = t.cida' +
        'de)'
      
        '                                       AND   (ba.codigo = t.bair' +
        'ro)) AS nomebairro'
      'FROM   transportadores t'
      'WHERE  t.codigo = :codigo'
      '')
    RequestLive = True
    Left = 78
    Top = 15
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptUnknown
        Value = 0
      end>
    object qryTransportadorescodigo: TIntegerField
      AutoGenerateValue = arAutoInc
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
    object qryTransportadoresrazao: TStringField
      DisplayLabel = 'Raz'#227'o'
      FieldName = 'razao'
      Required = True
      Size = 40
    end
    object qryTransportadoresinativo: TDateField
      Alignment = taCenter
      DisplayLabel = 'Inativo'
      FieldName = 'inativo'
      EditMask = '99/99/9999;1; '
    end
    object qryTransportadoresrua: TStringField
      DisplayLabel = 'Rua'
      FieldName = 'rua'
      Required = True
      Size = 100
    end
    object qryTransportadoresbairro: TIntegerField
      DisplayLabel = 'Bairro'
      FieldName = 'bairro'
      Required = True
      DisplayFormat = '0'
    end
    object qryTransportadorescidade: TIntegerField
      DisplayLabel = 'Cidade'
      FieldName = 'cidade'
      Required = True
      DisplayFormat = '0'
    end
    object qryTransportadoresestado: TStringField
      DisplayLabel = 'Estado'
      FieldName = 'estado'
      Required = True
      Size = 2
    end
    object qryTransportadorescep: TIntegerField
      DisplayLabel = 'CEP'
      FieldName = 'cep'
      Required = True
      DisplayFormat = '##'#39'.'#39'###'#39'-'#39'###;0;_'
      EditFormat = '##'#39'.'#39'###'#39'-'#39'###;0;_'
    end
    object qryTransportadorespessoatipo: TStringField
      DisplayLabel = 'Tipo Pessoa'
      FieldName = 'pessoatipo'
      Required = True
      Size = 1
    end
    object qryTransportadorespessoanumero: TStringField
      DisplayLabel = 'CPF/CNPJ'
      FieldName = 'pessoanumero'
      Required = True
      Size = 14
    end
    object qryTransportadoresdocumento: TStringField
      DisplayLabel = 'Documento'
      FieldName = 'documento'
    end
    object qryTransportadoresfaxddd: TIntegerField
      DisplayLabel = 'DDD Fax'
      FieldName = 'faxddd'
      DisplayFormat = '0'
    end
    object qryTransportadoresfaxnumero: TIntegerField
      DisplayLabel = 'N'#250'mero Fax'
      FieldName = 'faxnumero'
      DisplayFormat = '!####'#39'-'#39'####;0;_'
      EditFormat = '!####'#39'-'#39'####;0;_'
    end
    object qryTransportadoresfoneddd: TIntegerField
      DisplayLabel = 'DDD Fone'
      FieldName = 'foneddd'
      DisplayFormat = '0'
    end
    object qryTransportadoresfonenumero: TIntegerField
      DisplayLabel = 'N'#250'mero Fone'
      FieldName = 'fonenumero'
      DisplayFormat = '!####'#39'-'#39'####;0;_'
      EditFormat = '!####'#39'-'#39'####;0;_'
    end
    object qryTransportadoresnomecidade: TStringField
      DisplayLabel = 'Nome da Cidade'
      FieldName = 'nomecidade'
      Required = True
      Size = 30
    end
    object qryTransportadoresnomebairro: TStringField
      DisplayLabel = 'Nome do Bairro'
      FieldName = 'nomebairro'
      Required = True
      Size = 30
    end
  end
  object dsrTransportadores: TtecDataSource
    DataSet = qryTransportadores
    Left = 78
    Top = 64
  end
  object spcTransportadoresProximo: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'SELECT transportadores_proximocodigo() as codigo')
    RequestLive = False
    Left = 78
    Top = 120
    object spcTransportadoresProximocodigo: TIntegerField
      FieldName = 'codigo'
    end
  end
  object qryConsultaTransportadores: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'Select  razao, '
      '            codigo'
      'From    transportadores'
      'Order By UPPER(TO_ASCII(razao,''LATIN1''))')
    RequestLive = True
    Left = 236
    Top = 12
    object qryConsultaTransportadoresrazao: TStringField
      DisplayLabel = 'Raz'#227'o'
      FieldName = 'razao'
      Size = 40
    end
    object qryConsultaTransportadorescodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
    end
  end
end
