inherited dtmEncerramentoExercicio: TdtmEncerramentoExercicio
  OldCreateOrder = False
  Left = 750
  Top = 196
  Height = 225
  Width = 397
  object qryGerarLancamentosEncerramento: TtecQuery
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
      
        'SELECT GerarLancamentosEncerramento(:Filial, :Data, :ResultadoSi' +
        'ntetica, :ResultadoAnalitica, :Historico)'
      '')
    RequestLive = False
    Left = 64
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Data'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ResultadoSintetica'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ResultadoAnalitica'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Historico'
        ParamType = ptUnknown
      end>
  end
  object qryExcluirLancamentosEncerramento: TtecQuery
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
      'SELECT ExcluirLancamentosEncerramento(:Filial, :Data)'
      '')
    RequestLive = False
    Left = 192
    Top = 48
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Data'
        ParamType = ptUnknown
      end>
  end
end
