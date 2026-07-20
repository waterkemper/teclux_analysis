inherited dtmAtendentes: TdtmAtendentes
  OldCreateOrder = True
  Left = 350
  Top = 286
  Height = 280
  Width = 454
  object qryUsuarios: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterPost = qryUsuariosAfterPost
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select codigo,'
      '         nome,'
      '         operador,'
      '         inativo,'
      '         filtrosac,'
      '         ligacao,'
      '         shadow'
      'from usuarios'
      'where atendimento = true'
      '         and inativo is null'
      'order by UPPER(TO_ASCII(nome,''LATIN1''))')
    RequestLive = True
    Left = 48
    Top = 24
    object qryUsuarioscodigo: TIntegerField
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
    object qryUsuariosnome: TStringField
      FieldName = 'nome'
      Size = 40
    end
    object qryUsuariosoperador: TStringField
      FieldName = 'operador'
      Size = 8
    end
    object qryUsuariosinativo: TDateField
      Alignment = taCenter
      FieldName = 'inativo'
      EditMask = '99/99/9999;1; '
    end
    object qryUsuariosfiltrosac: TIntegerField
      FieldName = 'filtrosac'
      DisplayFormat = '0'
    end
    object qryUsuariosligacao: TIntegerField
      FieldName = 'ligacao'
      DisplayFormat = '0'
    end
    object qryUsuariosshadow: TIntegerField
      FieldName = 'shadow'
      DisplayFormat = '0'
    end
  end
  object dsrUsuarios: TtecDataSource
    DataSet = qryUsuarios
    Left = 48
    Top = 80
  end
  object dsrFiltrosSac: TtecDataSource
    DataSet = qryFiltrosSac
    Left = 272
    Top = 72
  end
  object qryFiltrosSac: TtecQuery
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
      'Select Descricao,'
      '           Numero'
      'from    FiltrosSAC')
    RequestLive = False
    Left = 272
    Top = 24
    object qryFiltrosSacdescricao: TStringField
      FieldName = 'descricao'
      Size = 30
    end
    object qryFiltrosSacnumero: TIntegerField
      FieldName = 'numero'
    end
  end
  object dsrShadow: TtecDataSource
    DataSet = qryShadow
    Left = 376
    Top = 72
  end
  object qryShadow: TtecQuery
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
      'Select usename,'
      'usesysid'
      'from pg_shadow')
    RequestLive = False
    Left = 376
    Top = 24
    object qryShadowusename: TStringField
      FieldName = 'usename'
      Size = 50
    end
    object qryShadowusesysid: TIntegerField
      FieldName = 'usesysid'
    end
  end
end
