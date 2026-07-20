inherited dtmatualizacaomonetaria: Tdtmatualizacaomonetaria
  OldCreateOrder = False
  Left = 272
  Top = 113
  Height = 257
  Width = 354
  object qryProcessarCorrecao: TtecQuery
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
      ';'
      
        'SELECT ContabilizarCorrecaoMes(:Filial, :Exercicio, :Mes) AS Rep' +
        'rocessarCorrecao'
      '')
    RequestLive = False
    Left = 120
    Top = 56
    ParamData = <
      item
        DataType = ftString
        Name = 'Filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Exercicio'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Mes'
        ParamType = ptUnknown
      end>
    object qryProcessarCorrecaoReprocessarCorrecao: TBooleanField
      FieldName = 'ReprocessarCorrecao'
    end
  end
end
