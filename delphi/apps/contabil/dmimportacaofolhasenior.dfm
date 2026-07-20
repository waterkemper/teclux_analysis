inherited dtmImportacaoFolhaSenior: TdtmImportacaoFolhaSenior
  OldCreateOrder = False
  Left = 341
  Top = 187
  Height = 368
  Width = 443
  object qryLancamentos: TtecQuery
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
      'select exercicio,'
      '       filial,'
      '       data,'
      '       cast(null as varchar(8)) as data_string,'
      '       origem,'
      '       nrorigem,'
      '       debitar,'
      '       cast(null as varchar(7)) as debitar_string,'
      '       creditar,'
      '       cast(null as varchar(7)) as creditar_string,'
      '       valor,'
      '       cast(null as varchar(16)) as valor_string,'
      '       historico,'
      '       cast(null as varchar(4)) as historico_string,'
      '       cast(null as varchar(300)) as erroimportacao,'
      '       cast(null as integer) as numero,'
      '       complemento'
      'from lancamentos'
      'where false;'
      ''
      ''
      '')
    RequestLive = True
    Left = 40
    Top = 24
    object qryLancamentosexercicio: TIntegerField
      FieldName = 'exercicio'
    end
    object qryLancamentosfilial: TIntegerField
      FieldName = 'filial'
    end
    object qryLancamentosdata: TDateField
      DisplayLabel = 'DATA'
      FieldName = 'data'
    end
    object qryLancamentosorigem: TStringField
      FieldName = 'origem'
      Size = 1
    end
    object qryLancamentosnrorigem: TLargeintField
      FieldName = 'nrorigem'
    end
    object qryLancamentosdebitar: TIntegerField
      DisplayLabel = 'DEBITAR'
      FieldName = 'debitar'
    end
    object qryLancamentoscreditar: TIntegerField
      DisplayLabel = 'CREDITAR'
      FieldName = 'creditar'
    end
    object qryLancamentosvalor: TFloatField
      DisplayLabel = 'VALOR'
      FieldName = 'valor'
    end
    object qryLancamentoshistorico: TIntegerField
      DisplayLabel = 'HIST'#211'RICO'
      FieldName = 'historico'
    end
    object qryLancamentoserroimportacao: TStringField
      DisplayLabel = 'ERRO DE IMPORTA'#199#195'O'
      DisplayWidth = 100
      FieldName = 'erroimportacao'
      Size = 300
    end
    object qryLancamentosdata_string: TStringField
      DisplayLabel = 'DATA'
      FieldName = 'data_string'
      Size = 8
    end
    object qryLancamentosdebitar_string: TStringField
      DisplayLabel = 'DEBITAR'
      FieldName = 'debitar_string'
      Size = 7
    end
    object qryLancamentoscreditar_string: TStringField
      DisplayLabel = 'CREDITAR'
      FieldName = 'creditar_string'
      Size = 7
    end
    object qryLancamentoshistorico_string: TStringField
      DisplayLabel = 'HIST'#211'RICO'
      FieldName = 'historico_string'
      Size = 4
    end
    object qryLancamentosvalor_string: TStringField
      DisplayLabel = 'VALOR'
      FieldName = 'valor_string'
      Size = 16
    end
    object qryLancamentosnumero: TIntegerField
      DisplayLabel = 'N'#218'MERO'
      FieldName = 'numero'
    end
    object qryLancamentoscomplemento: TStringField
      FieldName = 'complemento'
      Size = 512
    end
  end
  object dsrLancamentos: TtecDataSource
    DataSet = qryLancamentos
    Left = 96
    Top = 40
  end
  object spcLotesProximo: TtecQuery
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
      'SELECT lancamentos_proximolote(:Exercicio, :Filial) as codigo')
    RequestLive = True
    Left = 183
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Exercicio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Filial'
        ParamType = ptUnknown
      end>
    object spcLotesProximocodigo: TIntegerField
      FieldName = 'codigo'
    end
  end
  object qryProcuraConta: TtecQuery
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
      'SELECT Codigo'
      'FROM   planocontas'
      'WHERE  Codigo  = :Codigo'
      '      AND TIPO = '#39'A'#39)
    RequestLive = False
    Left = 46
    Top = 95
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryProcuraContacodigo: TIntegerField
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
  end
  object qryProcuraHistorico: TtecQuery
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
      'Select  codigo'
      'From    historicos'
      'Where   codigo = :codigo')
    RequestLive = False
    Left = 192
    Top = 104
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryProcuraHistoricocodigo: TIntegerField
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
  end
  object qryTotal: TtecQuery
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
      'select cast(null as date) as data,'
      '          cast(null as numeric(11,2)) as Debito,'
      '          cast(null as numeric(11,2)) as Credito'
      ' ')
    RequestLive = True
    Left = 96
    Top = 184
    object qryTotaldata: TDateField
      FieldName = 'data'
    end
    object qryTotaldebito: TFloatField
      FieldName = 'debito'
    end
    object qryTotalcredito: TFloatField
      FieldName = 'credito'
    end
  end
end
