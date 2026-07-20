inherited dtmCadastroTabelasGIA: TdtmCadastroTabelasGIA
  Left = 578
  Top = 311
  Height = 235
  Width = 600
  object dsrReceitasTributarias: TtecDataSource
    DataSet = qryReceitasTributarias
    Left = 76
    Top = 63
  end
  object qryReceitasTributarias: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    OnDeleteError = PostError
    OnEditError = PostError
    OnPostError = PostError
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select codigo,'
      '         descricao'
      'from receitastributarias'
      'where codigo = :codigo'
      '')
    RequestLive = True
    Left = 76
    Top = 11
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryReceitasTributariascodigo: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
    object qryReceitasTributariasdescricao: TStringField
      DisplayWidth = 40
      FieldName = 'descricao'
      Required = True
      Size = 40
    end
  end
  object qryClassesPagto: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    OnDeleteError = PostError
    OnEditError = PostError
    OnPostError = PostError
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select c.codigo,'
      '         c.descricao,'
      '         c.periodo'
      'from classespagto c'
      'where c.codigo = :codigo')
    RequestLive = True
    Left = 76
    Top = 115
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryClassesPagtocodigo: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
    object qryClassesPagtodescricao: TStringField
      DisplayWidth = 80
      FieldName = 'descricao'
      Required = True
      Size = 80
    end
    object qryClassesPagtoperiodo: TStringField
      DisplayWidth = 40
      FieldName = 'periodo'
      Required = True
      Visible = False
      Size = 40
    end
  end
  object dsrClassesPagto: TtecDataSource
    DataSet = qryClassesPagto
    Left = 76
    Top = 165
  end
  object qryConsultaClassesPagto: TtecQuery
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
      '         codigo         '
      'from classespagto'
      'order by UPPER(TO_ASCII(descricao,'#39'LATIN1'#39'))')
    RequestLive = False
    Left = 265
    Top = 62
    object qryConsultaClassesPagtodescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 80
      FieldName = 'descricao'
      Size = 80
    end
    object qryConsultaClassesPagtocodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
  end
  object dsrProcuraClassesPagto: TtecDataSource
    DataSet = qryProcuraClassesPagto
    Left = 451
    Top = 62
  end
  object qryProcuraClassesPagto: TtecQuery
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
      'select codigo,'
      '         descricao'
      'from classespagto'
      'where codigo = :codigo'
      '')
    RequestLive = False
    Left = 451
    Top = 12
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryProcuraClassesPagtocodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
    object qryProcuraClassesPagtodescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Size = 30
    end
  end
  object spcClassesPagto: TtecQuery
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
      'Select classespagto_ProximoCodigo() as Codigo')
    RequestLive = False
    Left = 265
    Top = 166
    object spcClassesPagtocodigo: TIntegerField
      FieldName = 'codigo'
    end
  end
  object spcReceitasTributarias: TtecQuery
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
      'Select ReceitasTributarias_ProximoCodigo() as Codigo')
    RequestLive = False
    Left = 265
    Top = 115
    object spcReceitasTributariascodigo: TIntegerField
      FieldName = 'codigo'
    end
  end
  object qryConsultaReceitasTributarias: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    OnDeleteError = PostError
    OnEditError = PostError
    OnPostError = PostError
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select codigo,'
      '         descricao'
      'from receitastributarias'
      'order by UPPER(TO_ASCII(descricao,'#39'LATIN1'#39'))'
      '')
    RequestLive = False
    Left = 265
    Top = 11
    object qryConsultaReceitasTributariasdescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 40
      FieldName = 'descricao'
      Size = 40
    end
    object qryConsultaReceitasTributariascodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
  end
  object qryProcuraReceitasTributarias: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    OnDeleteError = PostError
    OnEditError = PostError
    OnPostError = PostError
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select codigo,'
      '         descricao'
      'from receitastributarias'
      'where codigo = :codigo'
      '')
    RequestLive = False
    Left = 451
    Top = 113
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryProcuraReceitasTributariascodigo: TIntegerField
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
    object qryProcuraReceitasTributariasdescricao: TStringField
      FieldName = 'descricao'
      Size = 200
    end
  end
  object dsrProcuraReceitasTributarias: TtecDataSource
    DataSet = qryProcuraReceitasTributarias
    Left = 451
    Top = 165
  end
end
