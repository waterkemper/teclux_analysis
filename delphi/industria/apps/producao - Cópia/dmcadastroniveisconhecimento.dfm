inherited dtmCadastroNiveisConhecimento: TdtmCadastroNiveisConhecimento
  OldCreateOrder = False
  Left = 595
  Top = 232
  Height = 408
  Width = 449
  object dsrNiveisConhecimento: TtecDataSource
    DataSet = qryNiveisConhecimento
    Left = 88
    Top = 24
  end
  object qryNiveisConhecimento: TtecQuery
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
      'select nc.*'
      'from niveisconhecimento nc'
      'where nc.codigo = :codigo')
    RequestLive = True
    Left = 88
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryNiveisConhecimentocodigo: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
    object qryNiveisConhecimentodescricao: TStringField
      FieldName = 'descricao'
      Size = 50
    end
  end
  object qryNiveisConhecimentoProximo: TtecQuery
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
      ';'
      'select coalesce(max(codigo),0)+1 as codigo'
      'from niveisconhecimento')
    RequestLive = True
    Left = 88
    Top = 144
    object qryNiveisConhecimentoProximocodigo: TIntegerField
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
  end
end
