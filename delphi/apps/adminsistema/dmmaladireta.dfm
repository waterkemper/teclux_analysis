inherited dtmMalaDireta: TdtmMalaDireta
  Left = 230
  Top = 126
  Height = 259
  Width = 451
  object qryMontada: TtecQuery
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
      'select * from colunas')
    RequestLive = False
    Left = 40
    Top = 11
  end
  object dsrMontada: TtecDataSource
    DataSet = qryMontada
    Left = 40
    Top = 67
  end
  object qryFiltro: TtecQuery
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
      'select * from maladireta')
    RequestLive = True
    Left = 169
    Top = 11
    object qryFiltrofiltro: TStringField
      FieldName = 'filtro'
      Size = 40
    end
    object qryFiltrosql: TStringField
      FieldName = 'sql'
      Size = 60
    end
    object qryFiltrotabela: TStringField
      FieldName = 'tabela'
      Size = 30
    end
    object qryFiltrotipopesquisa: TStringField
      FieldName = 'tipopesquisa'
      Size = 1
    end
    object qryFiltrocampo: TStringField
      FieldName = 'campo'
      Size = 512
    end
  end
  object dsrFiltro: TtecDataSource
    DataSet = qryFiltro
    Left = 169
    Top = 67
  end
  object qryPesquisaFiltro: TtecQuery
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
      'select '
      '  sql,tabela,tipopesquisa,campo'
      'from maladireta'
      'where filtro = :filtro')
    RequestLive = True
    Left = 320
    Top = 11
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'filtro'
        ParamType = ptUnknown
      end>
    object qryPesquisaFiltrosql: TStringField
      FieldName = 'sql'
      Required = True
      Size = 60
    end
    object qryPesquisaFiltrotabela: TStringField
      FieldName = 'tabela'
      Required = True
      Size = 30
    end
    object qryPesquisaFiltrotipopesquisa: TStringField
      FieldName = 'tipopesquisa'
      Required = True
      Size = 1
    end
    object qryPesquisaFiltrocampo: TStringField
      FieldName = 'campo'
      Size = 512
    end
  end
  object dsrPesquisaFiltro: TtecDataSource
    DataSet = qryPesquisaFiltro
    Left = 320
    Top = 67
  end
  object qryMalaDireta: TtecQuery
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
      'select * '
      'from tiposmaladireta'
      'where nome=:nome')
    RequestLive = True
    Left = 40
    Top = 126
    ParamData = <
      item
        DataType = ftString
        Name = 'nome'
        ParamType = ptUnknown
      end>
    object qryMalaDiretanome: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'nome'
      Required = True
      Size = 30
    end
    object qryMalaDiretafiltro: TStringField
      FieldName = 'filtro'
      Size = 512
    end
    object qryMalaDiretadados: TStringField
      FieldName = 'dados'
      Size = 512
    end
  end
  object dsrMalaDireta: TtecDataSource
    DataSet = qryMalaDireta
    Left = 40
    Top = 187
  end
  object qryConsultaMalaDireta: TtecQuery
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
      'select nome'
      'from tiposmaladireta'
      'order by UPPER(TO_ASCII(nome,''LATIN1''))')
    RequestLive = True
    Left = 169
    Top = 126
    object qryConsultaMalaDiretanome: TStringField
      FieldName = 'nome'
      Size = 30
    end
  end
  object dsrConsultaMalaDireta: TtecDataSource
    DataSet = qryConsultaMalaDireta
    Left = 169
    Top = 187
  end
end
