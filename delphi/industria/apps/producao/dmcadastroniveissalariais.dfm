inherited dtmCadastroNiveisSalariais: TdtmCadastroNiveisSalariais
  OldCreateOrder = False
  Left = 346
  Top = 110
  Height = 408
  Width = 449
  object dsrNiveisSalariais: TtecDataSource
    DataSet = qryNiveisSalariais
    Left = 32
    Top = 24
  end
  object qryNiveisSalariais: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterScroll = qryNiveisSalariaisAfterScroll
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select ns.* '
      'from niveissalariais ns'
      'where ns.codigo = :codigo')
    RequestLive = True
    Left = 32
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryNiveisSalariaiscodigo: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'codigo'
    end
    object qryNiveisSalariaisdescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Required = True
    end
  end
  object dsrNiveisSalariaisUsuarios: TtecDataSource
    DataSet = qryNiveisSalariaisUsuarios
    Left = 176
    Top = 24
  end
  object qryNiveisSalariaisUsuarios: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterOpen = qryNiveisSalariaisUsuariosAfterOpen
    AfterPost = qryNiveisSalariaisUsuariosAfterPost
    AfterDelete = qryNiveisSalariaisUsuariosAfterDelete
    OnNewRecord = qryNiveisSalariaisUsuariosNewRecord
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select nsu.*,'
      '       u.nome,'
      '       true as UsuarioValidado'
      
        'from niveissalariaisusuarios nsu join usuarios u on nsu.usuario ' +
        '= u.codigo'
      'where nsu.nivelsalarial = :nivelsalarial'
      'order by u.nome')
    RequestLive = True
    Left = 176
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nivelsalarial'
        ParamType = ptUnknown
      end>
    object qryNiveisSalariaisUsuariosnivelsalarial: TIntegerField
      FieldName = 'nivelsalarial'
    end
    object qryNiveisSalariaisUsuariosusuario: TIntegerField
      FieldName = 'usuario'
      Required = True
    end
    object qryNiveisSalariaisUsuariosnome: TStringField
      FieldName = 'nome'
      ReadOnly = True
      Required = True
      Size = 40
    end
    object qryNiveisSalariaisUsuariosusuariovalidado: TBooleanField
      FieldName = 'usuariovalidado'
    end
  end
  object qryNiveisSalariaisProximo: TtecQuery
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
      'from NiveisSalariais')
    RequestLive = True
    Left = 48
    Top = 144
    object qryNiveisSalariaisProximocodigo: TIntegerField
      FieldName = 'codigo'
    end
  end
end
