inherited dtmCentrodeCusto: TdtmCentrodeCusto
  OldCreateOrder = False
  Left = 422
  Top = 312
  Height = 360
  Width = 513
  object qryCentrodeCusto: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterScroll = qryCentrodeCustoAfterScroll
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select cc.*'
      'from centrodecusto cc'
      'where cc.codigo = :codigo')
    RequestLive = True
    Left = 40
    Top = 40
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryCentrodeCustocodigo: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
    object qryCentrodeCustodescricao: TStringField
      DisplayLabel = 'descri'#231#227'o'
      FieldName = 'descricao'
      Required = True
      Size = 100
    end
  end
  object spcCentrodeCustoProximo: TtecQuery
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
      'Select centrodecusto_proximocodigo() as codigo')
    RequestLive = False
    Left = 72
    Top = 94
    object spcCentrodeCustoProximocodigo: TIntegerField
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
  end
  object dsrCentrodeCusto: TtecDataSource
    DataSet = qryCentrodeCusto
    Left = 136
    Top = 32
  end
  object qryCentrodeCustoSetoresProducao: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterOpen = qryCentrodeCustoSetoresProducaoAfterOpen
    AfterEdit = qryCentrodeCustoSetoresProducaoAfterEdit
    AfterPost = qryCentrodeCustoSetoresProducaoAfterPost
    AfterDelete = qryCentrodeCustoSetoresProducaoAfterDelete
    OnNewRecord = qryCentrodeCustoSetoresProducaoNewRecord
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select ccsp.*,'
      '       sp.descricao as descricaosetorproducao'
      'from centrodecustosetoresproducao ccsp'
      '     join setoresproducao sp'
      '     on ccsp.setordeproducao = sp.codigo'
      'where ccsp.centrodecusto = :centrodecusto'
      'order by sp.codigo')
    RequestLive = True
    Left = 72
    Top = 168
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'centrodecusto'
        ParamType = ptUnknown
      end>
    object qryCentrodeCustoSetoresProducaocentrodecusto: TIntegerField
      DisplayLabel = 'centro de custo'
      FieldName = 'centrodecusto'
      Required = True
      DisplayFormat = '0'
    end
    object qryCentrodeCustoSetoresProducaosetordeproducao: TStringField
      DisplayLabel = 'setor de produ'#231#227'o'
      FieldName = 'setordeproducao'
      Required = True
      Size = 4
    end
    object qryCentrodeCustoSetoresProducaodescricaosetorproducao: TStringField
      FieldName = 'descricaosetorproducao'
      Size = 50
    end
  end
  object dsrCentrodeCustoSetoresProducao: TtecDataSource
    DataSet = qryCentrodeCustoSetoresProducao
    Left = 136
    Top = 184
  end
end
