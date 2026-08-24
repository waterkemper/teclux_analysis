inherited dtmCadastroTiposPagamentos: TdtmCadastroTiposPagamentos
  OldCreateOrder = False
  Left = 272
  Top = 221
  Height = 323
  Width = 585
  object qryConsultaTipoPagamento: TtecQuery
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
      'Select descricao,'
      '           codigo'
      'From   tipospagamentos'
      'Order By UPPER(TO_ASCII(descricao,'#39'LATIN1'#39'))')
    RequestLive = False
    Left = 85
    Top = 87
    object qryConsultaTipoPagamentodescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Size = 30
    end
    object qryConsultaTipoPagamentocodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
    end
  end
  object spcTiposPagamentosProximoCodigo: TtecQuery
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
      'select tipospagamentos_proximocodigo() as codigo')
    RequestLive = False
    Left = 300
    Top = 87
    object spcTiposPagamentosProximoCodigocodigo: TIntegerField
      FieldName = 'codigo'
    end
  end
  object dsrTiposPagamentos: TtecDataSource
    DataSet = qryTiposPagamentos
    Left = 300
    Top = 16
  end
  object qryTiposPagamentos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    OnNewRecord = qryTiposPagamentosNewRecord
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'Select *'
      'from   tipospagamentos'
      'where codigo =: codigo')
    RequestLive = True
    Left = 85
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryTiposPagamentoscodigo: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'codigo'
    end
    object qryTiposPagamentosdescricao: TStringField
      FieldName = 'descricao'
      Required = True
      Size = 30
    end
    object qryTiposPagamentossaidadocaixa: TBooleanField
      FieldName = 'saidadocaixa'
      Required = True
    end
  end
end
