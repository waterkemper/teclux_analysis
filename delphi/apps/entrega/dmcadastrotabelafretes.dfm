inherited dtmCadastroTabelaFretes: TdtmCadastroTabelaFretes
  OldCreateOrder = False
  Left = 347
  Top = 132
  Height = 389
  Width = 703
  object qryTabelaFrete: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    OnDeleteError = PostError
    OnEditError = PostError
    OnPostError = PostError
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select * from tabeladefretes'
      'where codigo=:codigo')
    RequestLive = True
    Left = 69
    Top = 10
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryTabelaFretedescricao: TStringField
      FieldName = 'descricao'
      Required = True
      Size = 30
    end
    object qryTabelaFretecodigo: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
    object qryTabelaFreteobservacoes: TStringField
      FieldName = 'observacoes'
      Size = 200
    end
    object qryTabelaFretevalorcliente: TFloatField
      FieldName = 'valorcliente'
      DisplayFormat = '0.00'
    end
    object qryTabelaFretevalorfornecedor: TFloatField
      FieldName = 'valorfornecedor'
      DisplayFormat = '0.00'
    end
  end
  object qryConsultaTabelaFrete: TtecQuery
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
      'select codigo, descricao from tabeladefretes'
      'order by UPPER(TO_ASCII(descricao,''LATIN1''))')
    RequestLive = False
    Left = 249
    Top = 9
    object qryConsultaTabelaFretedescricao: TStringField
      DisplayLabel = 'Descrição'
      FieldName = 'descricao'
      Size = 30
    end
    object qryConsultaTabelaFretecodigo: TIntegerField
      DisplayLabel = 'Código'
      FieldName = 'codigo'
    end
  end
  object spcTabelaFreteProximoCodigo: TtecQuery
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
      'select tabeladefretes_proximocodigo() as codigo')
    RequestLive = False
    Left = 247
    Top = 80
    object spcTabelaFreteProximoCodigocodigo: TIntegerField
      FieldName = 'codigo'
    end
  end
  object dsrTabelaFrete: TtecDataSource
    DataSet = qryTabelaFrete
    Left = 69
    Top = 81
  end
end
