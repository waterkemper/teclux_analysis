inherited dtmCadastroGrupoFiliais: TdtmCadastroGrupoFiliais
  Left = 233
  Top = 151
  Height = 254
  Width = 464
  object qryGruposFiliais: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterClose = qryGruposFiliaisAfterClose
    AfterScroll = qryGruposFiliaisAfterScroll
    OnDeleteError = PostError
    OnEditError = PostError
    OnPostError = PostError
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'SELECT *'
      'FROM gruposfiliais'
      'WHERE codigo = :codigo')
    RequestLive = True
    Left = 69
    Top = 15
    ParamData = <
      item
        DataType = ftString
        Name = 'codigo'
        ParamType = ptUnknown
        Value = '0'
      end>
    object qryGruposFiliaiscodigo: TIntegerField
      AutoGenerateValue = arAutoInc
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
    object qryGruposFiliaisdescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Required = True
      Size = 30
    end
    object qryGruposFiliaismnemonico: TStringField
      DisplayLabel = 'Mnem'#244'nico'
      FieldName = 'mnemonico'
      Required = True
      Size = 3
    end
    object qryGruposFiliaisestoque: TBooleanField
      FieldName = 'estoque'
    end
  end
  object qryFiliaisGruposFiliais: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    BeforeInsert = qryFiliaisGruposFiliaisBeforeInsert
    BeforeEdit = qryFiliaisGruposFiliaisBeforeEdit
    BeforeDelete = qryFiliaisGruposFiliaisBeforeDelete
    AfterDelete = qryFiliaisGruposFiliaisAfterDelete
    OnDeleteError = PostError
    OnEditError = PostError
    OnPostError = PostError
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'Select GF.*, '
      '           (Select F.Nome '
      '            From filiais F'
      '            Where (F.Codigo = GF.Filial)) as Nome'
      'From  filiaisgruposfiliais GF'
      'Where GF.Grupo =:Grupo'
      'Order By GF.Filial'
      '')
    RequestLive = True
    Left = 234
    Top = 15
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Grupo'
        ParamType = ptUnknown
        Value = 0
      end>
    object qryFiliaisGruposFiliaisgrupo: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'grupo'
    end
    object qryFiliaisGruposFiliaisfilial: TIntegerField
      DisplayLabel = 'Filial'
      FieldName = 'filial'
    end
    object qryFiliaisGruposFiliaisnome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Size = 40
    end
  end
  object dsrGruposFiliais: TtecDataSource
    DataSet = qryGruposFiliais
    Left = 69
    Top = 74
  end
  object dsrFiliaisGruposFiliais: TtecDataSource
    DataSet = qryFiliaisGruposFiliais
    Left = 234
    Top = 74
  end
  object spcProximoGruposFiliais: TtecQuery
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
      'SELECT gruposfiliais_proximocodigo() as codigo')
    RequestLive = False
    Left = 69
    Top = 191
    object spcProximoGruposFiliaiscodigo: TIntegerField
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
  end
  object qryConsultaGruposFiliais: TtecQuery
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
      'Select   * '
      'From gruposfiliais'
      'Order By  UPPER(TO_ASCII(descricao,'#39'LATIN1'#39'))')
    RequestLive = False
    Left = 69
    Top = 135
    object qryConsultaGruposFiliaisdescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Size = 30
    end
    object qryConsultaGruposFiliaismnemonico: TStringField
      DisplayLabel = 'Mnem'#244'nico'
      FieldName = 'mnemonico'
      Visible = False
      Size = 3
    end
    object qryConsultaGruposFiliaiscodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
    end
  end
  object qryConsultaFiliais: TtecQuery
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
      'Select F.Codigo, '
      '              F.Nome '
      'From    filiais F'
      '/*                                        */'
      'Order By UPPER(TO_ASCII(f.nome,'#39'LATIN1'#39'))')
    RequestLive = False
    Left = 371
    Top = 134
    object qryConsultaFiliaisnome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Size = 40
    end
    object qryConsultaFiliaiscodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
  end
  object qryProcuraFiliais: TtecQuery
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
      'Select F.Codigo, '
      '              F.Nome'
      'From    filiais F'
      'Where (F.Codigo =:Codigo) '
      '/* Preencher em RunTime    */'
      ''
      ''
      '')
    RequestLive = False
    Left = 371
    Top = 15
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Codigo'
        ParamType = ptUnknown
      end>
    object qryProcuraFiliaisnome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Required = True
      Size = 40
    end
    object qryProcuraFiliaiscodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
      Required = True
    end
  end
  object dsrProcuraFiliais: TtecDataSource
    DataSet = qryProcuraFiliais
    Left = 371
    Top = 73
  end
end
