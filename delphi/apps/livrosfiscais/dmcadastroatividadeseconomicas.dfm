inherited dtmCadastroAtividadesEconomicas: TdtmCadastroAtividadesEconomicas
  Left = 694
  Top = 215
  Height = 454
  Width = 616
  object qryAtividadesEconomicas: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select ae.*'
      'from atividadeseconomicas ae'
      'where ae.codigo = :codigo')
    RequestLive = True
    Left = 126
    Top = 14
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryAtividadesEconomicascodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qryAtividadesEconomicasdescricao: TStringField
      FieldName = 'descricao'
      Required = True
      Size = 1000
    end
    object qryAtividadesEconomicasdenominacao: TStringField
      DisplayLabel = 'Denomina'#231#227'o'
      FieldName = 'denominacao'
      Size = 200
    end
    object qryAtividadesEconomicascodigoatividade: TIntegerField
      FieldName = 'codigoatividade'
      DisplayFormat = '####-#/##'
      EditFormat = '0000-0/00;0;_'
    end
    object qryAtividadesEconomicasitem: TIntegerField
      FieldName = 'item'
    end
    object qryAtividadesEconomicassubitem: TIntegerField
      FieldName = 'subitem'
    end
  end
  object qryConsultaAtividadesEconomicas: TtecQuery
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
      'select descricao, denominacao,'
      '       codigoatividade,'
      '       codigo'
      'from atividadeseconomicas'
      'order by UPPER(TO_ASCII(descricao,'#39'LATIN1'#39'))')
    RequestLive = False
    Left = 128
    Top = 131
    object qryConsultaAtividadesEconomicascodigoatividade: TIntegerField
      DisplayLabel = 'C'#243'digo Atividade'
      FieldName = 'codigoatividade'
      DisplayFormat = '####-#/##'
      EditFormat = '0000-0/00;0;_'
    end
    object qryConsultaAtividadesEconomicasdescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 80
      FieldName = 'descricao'
      Size = 1000
    end
    object qryConsultaAtividadesEconomicasdenominacao: TStringField
      DisplayLabel = 'Denomina'#231#227'o'
      FieldName = 'denominacao'
      Size = 80
    end
    object qryConsultaAtividadesEconomicascodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
    end
  end
  object dsrAtividadesEconomicas: TtecDataSource
    DataSet = qryAtividadesEconomicas
    Left = 126
    Top = 70
  end
end
