inherited dtmCadastroCodigosFiscaisServicos: TdtmCadastroCodigosFiscaisServicos
  Left = 285
  Top = 188
  Height = 196
  Width = 289
  object qryCodigosFiscaisServicos: TtecQuery
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
      'select codigo,'
      '         descricao,'
      '         detalhes'
      'from codigosfiscaisservicos'
      'where codigo = :codigo')
    RequestLive = True
    Left = 126
    Top = 14
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryCodigosFiscaisServicoscodigo: TIntegerField
      FieldName = 'codigo'
      Required = True
    end
    object qryCodigosFiscaisServicosdescricao: TStringField
      FieldName = 'descricao'
      Required = True
      Size = 80
    end
    object qryCodigosFiscaisServicosdetalhes: TStringField
      FieldName = 'detalhes'
      Size = 500
    end
  end
  object qryConsultaCodigosFiscaisServicos: TtecQuery
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
      'select descricao,'
      '          codigo'
      'from codigosfiscaisservicos'
      'order by descricao')
    RequestLive = False
    Left = 126
    Top = 131
    object qryConsultaCodigosFiscaisServicosdescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Size = 80
    end
    object qryConsultaCodigosFiscaisServicoscodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
  end
  object dsrCodigosFiscaisServicos: TtecDataSource
    DataSet = qryCodigosFiscaisServicos
    Left = 126
    Top = 70
  end
end
