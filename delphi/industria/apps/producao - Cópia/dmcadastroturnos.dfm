inherited dtmCadastroTurnos: TdtmCadastroTurnos
  OldCreateOrder = False
  Left = 790
  Top = 568
  Height = 408
  Width = 449
  object dsrTurnos: TtecDataSource
    DataSet = qryTurnos
    Left = 32
    Top = 24
  end
  object qryTurnos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterScroll = qryTurnosAfterScroll
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select t.* '
      'from  turnos t'
      'where t.codigo = :codigo')
    RequestLive = True
    Left = 32
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryTurnoscodigo: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
    object qryTurnosdescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Required = True
    end
  end
  object dsrTurnosIntervalos: TtecDataSource
    DataSet = qryTurnosIntervalos
    OnDataChange = dsrTurnosIntervalosDataChange
    Left = 176
    Top = 24
  end
  object qryTurnosIntervalos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterPost = qryTurnosIntervalosAfterPost
    AfterDelete = qryTurnosIntervalosAfterDelete
    OnNewRecord = qryTurnosIntervalosNewRecord
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select ti.*'
      'from turnosintervalos ti'
      'where ti.turno = :turno'
      'order by ti.diasemana, ti.intervaloinicial')
    RequestLive = True
    Left = 176
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'turno'
        ParamType = ptUnknown
      end>
    object qryTurnosIntervalosturno: TIntegerField
      FieldName = 'Turno'
      Required = True
      DisplayFormat = '0'
    end
    object qryTurnosIntervalosdiasemana: TIntegerField
      FieldName = 'DiaSemana'
      Required = True
      DisplayFormat = '0'
    end
    object qryTurnosIntervalosintervaloinicial: TTimeField
      Alignment = taCenter
      DisplayLabel = 'intervalo inicial'
      FieldName = 'IntervaloInicial'
      Required = True
      DisplayFormat = 'HH:MM'
      EditMask = '99:99;1; '
    end
    object qryTurnosIntervalosintervalofinal: TTimeField
      Alignment = taCenter
      DisplayLabel = 'intervalo final'
      FieldName = 'IntervaloFinal'
      Required = True
      DisplayFormat = 'HH:MM'
      EditMask = '99:99;1; '
    end
    object qryTurnosIntervaloslkdiasemana: TStringField
      FieldKind = fkLookup
      FieldName = 'lkDiaSemana'
      LookupDataSet = qryDiaSemana
      LookupKeyFields = 'numerodia'
      LookupResultField = 'diasemana'
      KeyFields = 'diasemana'
      Lookup = True
    end
    object qryTurnosIntervalosehinicioturno: TBooleanField
      FieldName = 'EhInicioTurno'
    end
    object qryTurnosIntervalosehterminoturno: TBooleanField
      FieldName = 'EhTerminoTurno'
    end
  end
  object qryTurnosProximo: TtecQuery
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
      'from  turnos')
    RequestLive = True
    Left = 48
    Top = 144
    object qryTurnosProximocodigo: TIntegerField
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
  end
  object qryDiaSemana: TtecQuery
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
      'SELECT cast(1 as integer) as numerodia,'
      'cast('#39'2'#170' FEIRA'#39' as varchar(20)) as diasemana'
      ''
      'union all'
      ''
      'SELECT cast(2 as integer) as numerodia,'
      'cast('#39'3'#170' FEIRA'#39' as varchar(20)) as diasemana'
      ''
      'union all'
      ''
      'SELECT cast(3 as integer) as numerodia,'
      'cast('#39'4'#170' FEIRA'#39' as varchar(20)) as diasemana'
      ''
      'union all'
      ''
      'SELECT cast(4 as integer) as numerodia,'
      'cast('#39'5'#170' FEIRA'#39' as varchar(20)) as diasemana'
      ''
      'union all'
      ''
      'SELECT cast(5 as integer) as numerodia,'
      'cast('#39'6'#170' FEIRA'#39' as varchar(20)) as diasemana'
      ''
      'union all'
      ''
      'SELECT cast(6 as integer) as numerodia,'
      'cast('#39'S'#193'BADO'#39' as varchar(20)) as diasemana'
      ''
      'union all'
      ''
      'SELECT cast(7 as integer) as numerodia,'
      'cast('#39'DOMINGO'#39' as varchar(20)) as diasemana'
      ''
      ''
      '')
    RequestLive = False
    Active = True
    Left = 176
    Top = 144
    object qryDiaSemananumerodia: TIntegerField
      FieldName = 'numerodia'
      DisplayFormat = '0'
    end
    object qryDiaSemanadiasemana: TStringField
      FieldName = 'diasemana'
    end
  end
  object dsrDiaSemana: TtecDataSource
    DataSet = qryDiaSemana
    Left = 208
    Top = 160
  end
end
