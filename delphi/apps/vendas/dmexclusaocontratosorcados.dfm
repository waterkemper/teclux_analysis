inherited dtmExclusaoContratosOrcados: TdtmExclusaoContratosOrcados
  Left = 239
  Top = 180
  Height = 238
  Width = 458
  object qryFalsoCascade: TtecQuery
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
      'DELETE  FROM'
      '/* editada em run time*/'
      'WHERE contrato = :contrato')
    RequestLive = False
    Left = 189
    Top = 163
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'contrato'
        ParamType = ptUnknown
      end>
  end
end
